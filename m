Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E49C3C0605
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785142647; cv=none; b=i1S1yeWthZdflTyKJ4hx3HYmrmTys6AWFcvlyTu11t5L/424tpPE2yI0NzvaGZs5fu3CAt+PmHRdwFYTGCuGtsITgCVgjyJ/M/Uuirgx1condYDdQtsSSTIJT1akzQazbK6VHP8c78kQaHusqQrfg6SH/irxA94MzfnfL1dQGbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785142647; c=relaxed/simple;
	bh=soHakzJEjwIm/imo4iK9+sYmi9OSOJ1dghctp+92Fjw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nMSHEqAbuaWvnGuV3yF1hS1KtTMGftQ3Fkdy1vZNEbmV1XUiQ9SIpbCm4EKMjBUzhRmJtp6fw9YRX+zQeJm50hoTCL6mcbOclOFrcdcuu7sfcvgOT+PFM//QmCzVaXWbSjEwXnvzkaRmYIaYnMFDknjRduVIV1Y2gyDxKJ5M52M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UQ9A2E3x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UQ9A2E3x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 780231F000E9;
	Mon, 27 Jul 2026 08:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785142646;
	bh=+EDpVoA4AsRm9/plIL3L6YZjwPg7s8lEoFTkmtHdljs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UQ9A2E3xYymr7g4E3x2cQwxv3ZKB+VpepRO9O/lwaHroQTrnVg/c9FR1ETKnzoHOl
	 QMBE75fKqKTcutRgm/zyP78RUANi04ZGwZVRd0bwqNuZwcdCtqBt3K0zHxcT3G8X2W
	 qjKKBm4qc5052LUpOW1cFxj48qKRkZ13SzYvXhE4M3kImKemidoqVDOW21+xXc6HeP
	 2p3LbwkhbUu1hqV8i5K3ZGN9GvaC2UykuPBpzceDWxcFsfAJm1RM8VXEF+CuT/ZHhd
	 2wjr6al6jXVxT1lxuPqo9VjqFdKQ4y9ndX4Rua3xq2zSnPomxRQazQBht7khmxwGpO
	 T3zx5c+1ZmTPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] driver core: platform: Setup device MSI domain just
 before driver probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anup Patel" <anup.patel@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260727084003.1951324-1-anup.patel@oss.qualcomm.com>
References: <20260727084003.1951324-1-anup.patel@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 08:57:24 +0000
Message-Id: <20260727085725.780231F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Removal of explicit `-EPROBE_DEFER` fallbacks causes permanent pro=
be failures for MSI client drivers.
- [High] Inconsistent and unsafe use of `dev->of_node` instead of `to_of_no=
de(fwnode)` in `platform_dma_configure()`.
--

--- Patch [1]: [PATCH v2] driver core: platform: Setup device MSI domain ju=
st before driver probe ---
commit af1d054c0ea0f493a963d5cdb4333c67d265bf5a
Author: Anup Patel <anup.patel@oss.qualcomm.com>

driver core: platform: Setup device MSI domain just before driver probe

This commit extends platform_dma_configure() to configure device MSI
domains for both OF and ACPI devices prior to driver probe. It also
removes the duplicate MSI domain setup and probe deferral logic from
several RISC-V MSI client drivers.

> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index fb9120b0bcfe0..965ed6ae5bb54 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -1477,8 +1477,12 @@ static int platform_dma_configure(struct device *d=
ev)
>  	int ret =3D 0;
> =20
>  	if (is_of_node(fwnode)) {
> +		if (!dev_get_msi_domain(dev))
> +			of_msi_configure(dev, dev->of_node);

[Severity: High]
Should this use to_of_node(fwnode) instead of dev->of_node?

If a platform device has a valid fwnode but dev->of_node is NULL (which can
happen with dynamically instantiated MFD children), passing dev->of_node to
of_msi_configure() will silently fail to configure the MSI domain.=20

The very next line uses to_of_node(fwnode) safely for of_dma_configure().

>  		ret =3D of_dma_configure(dev, to_of_node(fwnode), true);
>  	} else if (is_acpi_device_node(fwnode)) {

[ ... ]

> diff --git a/drivers/irqchip/irq-riscv-aplic-msi.c b/drivers/irqchip/irq-=
riscv-aplic-msi.c
> index fb8d1838609fb..2cf5d42cd66a8 100644
> --- a/drivers/irqchip/irq-riscv-aplic-msi.c
> +++ b/drivers/irqchip/irq-riscv-aplic-msi.c

[ ... ]

> @@ -245,32 +244,6 @@ int aplic_msi_setup(struct device *dev, void __iomem=
 *regs)
>  	/* Setup global config and interrupt delivery */
>  	aplic_init_hw_global(priv, true);
> =20
> -	/* Set the APLIC device MSI domain if not available */
> -	if (!dev_get_msi_domain(dev)) {

[ ... ]

> -		if (!dev_get_msi_domain(dev))
> -			return -EPROBE_DEFER;
> -	}
> -
>  	if (!msi_create_device_irq_domain(dev, MSI_DEFAULT_DOMAIN, &aplic_msi_t=
emplate,
>  					  priv->nr_irqs + 1, priv, priv)) {
>  		dev_err(dev, "failed to create MSI irq domain\n");

[Severity: High]
Does removing the explicit -EPROBE_DEFER fallback cause a permanent probe
failure here?

If the IMSIC controller isn't probed first (for example, if fw_devlink is
disabled or fails to guarantee probe ordering), the parent MSI domain won't
be set yet in platform_dma_configure().

Without the -EPROBE_DEFER path, msi_create_device_irq_domain() will fail
with -ENOMEM because the parent domain is missing, and the driver probe
will permanently fail instead of deferring.

This same probe deferral removal appears to cause similar permanent probe
failures in rpmi_sysmsi_probe() in drivers/irqchip/irq-riscv-rpmi-sysmsi.c
and mpxy_mbox_probe() in drivers/mailbox/riscv-sbi-mpxy-mbox.c.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727084003.1951=
324-1-anup.patel@oss.qualcomm.com?part=3D1
