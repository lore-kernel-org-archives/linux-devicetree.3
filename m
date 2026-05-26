Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC910384CDA
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 15:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779810247; cv=none; b=PlPS5rITsUqVlP2+2m8cMg05LI5dkfKfu2I3xrE2jDnzmjYpMEMkezeW/As7Xx/Dc0TLMRMBaZbe4cq7rIE/ebnPSQSBGxRF8S/kEmBaC00QTHs0MO9VamGBwVIlhiF8R+4XKmfrkcmJGdPS84n76tV4rv/MXfmXAMAvs86BVRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779810247; c=relaxed/simple;
	bh=8dn4/88r+GmShG/I6JUif22lDb8sTBFkx769+gxmrIs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lVGrVsDxE92ykNh3H1qtVen8++x6ThEhMJgqP02kKusNcXdIfen8glwwBeWN6Mgte5PUyj7t2msJWxz+YKJMElp8iuCRL4YmZBFY7nSi0gN/8qSURqdjTwebLjeyIUMKACOIJFZzuj/hCOQpqrq9KpdfugPENtO7rzElMK0esa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jq8GNI9H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jq8GNI9H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 579361F000E9;
	Tue, 26 May 2026 15:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779810245;
	bh=Rsx0VqEnj5yI7+WFxquMMz+PC+kQPCHk9pY+nRmg6oU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jq8GNI9Hjzv4vOO4y+l4/oLOHZjRILYIqVKhMHji5SHCLUFc/EJ8ofzM3MpPmSoar
	 TTY9kJzALVq1bbD4oZLn4ZiybfRA7fm7p28XDSpH/hviiZOiGp0MHOGpZpKcG9a31d
	 6YtFpYyIA8Y8tXClyYlMKbVdlrAAM/gn5lN8A2ANIGArt9D1gJLKY7Bc9pvY0qdJ0/
	 pCbcvMtkoHOtHcLidFyVWA6rQM/yhX/7X+AC78d3zQQSYkmaO2jH6PI2hB2lVxb7n0
	 wdszuQTjfKATd5L0dmiwO2CJd7/RSqht85Hh2RHOZqh/xojifYdQlcMJ8Sc7AHJjrL
	 7dTHUsGiUHj9w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] driver core: platform: Setup device MSI domain just
 before driver probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anup Patel" <anup.patel@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260526145240.1627200-1-anup.patel@oss.qualcomm.com>
References: <20260526145240.1627200-1-anup.patel@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 15:44:04 +0000
Message-Id: <20260526154405.579361F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Incorrect parameter passed to `of_msi_configure()` causes silent M=
SI domain configuration failures for devices where `dev->of_node` is NULL.
- [Medium] Removing explicit `-EPROBE_DEFER` causes permanent probe failure=
s when MSI controllers probe later.
--

commit 117de411608386f49450165e5a9b44f955e55db1
Author: Anup Patel <anup.patel@oss.qualcomm.com>
driver core: platform: Setup device MSI domain just before driver probe

This commit moves the configuration of the device MSI domain for platform
devices into the platform_dma_configure() function. It removes the duplicate
domain setup and EPROBE_DEFER handling from individual RISC-V MSI client
drivers.

> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index a19dd22deef2f..225e33080bc62 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -1470,8 +1470,12 @@ static int platform_dma_configure(struct device *d=
ev)
>  	int ret =3D 0;
> =20
>  	if (is_of_node(fwnode)) {
> +		if (!dev_get_msi_domain(dev))
> +			of_msi_configure(dev, dev->of_node);

[Severity: High]
Does this code silently fail to configure the MSI domain for devices where
dev->of_node is NULL?

If a device is instantiated such that its fwnode is a valid OF node but its
primary dev->of_node is not explicitly populated (like some dynamically
created devices or MFD children), dev->of_node will be NULL.

Should this use to_of_node(fwnode) instead of dev->of_node, similar to the
of_dma_configure() call right below it?

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

[Severity: Medium]
Will removing this -EPROBE_DEFER fallback cause permanent probe failures if
fw_devlink is disabled (e.g., via fw_devlink=3Doff) or fails to fully resol=
ve
dependencies?

If the client device probes before the IMSIC controller in such scenarios,
dev_get_msi_domain(dev) will be NULL, and subsequent calls like
msi_create_device_irq_domain() might return false.

Would it be safer to retain a way to gracefully defer the probe here rather
than failing permanently?

> -
>  	if (!msi_create_device_irq_domain(dev, MSI_DEFAULT_DOMAIN, &aplic_msi_t=
emplate,
>  					  priv->nr_irqs + 1, priv, priv)) {
>  		dev_err(dev, "failed to create MSI irq domain\n");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526145240.1627=
200-1-anup.patel@oss.qualcomm.com?part=3D1
