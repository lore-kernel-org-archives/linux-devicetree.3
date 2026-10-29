Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793291879;
	b=Rig4UTthvJtOpCrM45p9kGv7tmDb0z12pbryhrFicvPm9+I82tlZycl8RrSQED3jQVD6
	 hKWGKYsV60Uwum8C23ikO+SMGFSqmQd4kADfIeMXfyv31KxZXMcoLhYz1gtna+lkoVsQf
	 BVXVLZVqmlPclYUzAIoVvpbmi75fgWEbE9+O0yoZ1mPZF5ZDdgk8Ce3PqkFDRNkIRDiEO
	 xxmvGCnes+iGEg24sXTW2gqWRX20Pk1yTco0r0T01pRD2sYVbubNT02IafYrN7+y3PFHN
	 86DzD4QpDLjlXlstNCaIapOWy0r6jKIgeYw8kUzFp0aX5Ayb7JQeaZYwSQNuchlygKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793291879;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=C9LB7/iVFUSRAfcjSAxXRrrZGCjeTo1JBf+b/bOC2G8=;
	b=prIbsLwB7iDxfqaKctcDddpwYlRH20bNMRLwOhJKeo+44Y4VIvzf5B7ylIhDvrRgugl9
	 pqmyc+j1yLKN03Kef+ESAcDPYEs0WeKHZ+sjfhewEZVsYdmszcxEYa6ZjSyBpiKXDqiQP
	 2SzJ4zeciukYKDMosZqzEic8Y6rqsYcdvb80jFZ7PKFalemXpLUkvsVyKBHHDevPNnkj4
	 M7q5ewVQkPxuHTXcW4uFkOaXeh49T/p6VtiX+pmxEQ85raSGaW/ZJD64V+d0s0Esu+4hy
	 gtIfT3zf0Y/5uc1DKrJdUzw3V+w0wfsaJs9W898oclc6qP0/DYjKaI+hSdNK6PVeADw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rh+hKQou;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE623606A322
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 16:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rh+hKQou
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9196D1F01816;
	Thu, 29 Oct 2026 16:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793291878;
	bh=C9LB7/iVFUSRAfcjSAxXRrrZGCjeTo1JBf+b/bOC2G8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rh+hKQoug4NIbUmS9u2Fr32jbvcIpabfhHNx2GFymRda2eD9yDgHsGzfliBKzvbRq
	 ID7VSFkh7cqiSfOlf8G/4OrFSwaptBdommJs0+M+NMNNwKK7L2lpsC+jS0wTvNbsrN
	 GnVT9w5B+9OrNx2HwDFvC6jKPkWS9ySLc6wH73HNGwRTSYRxPM2wZGii7luD2ikU4/
	 faK+iGlM+bN5fo8/jgdNNsPJ4Gb31T0R5McknJkTaA/eAPDP3pmrGbzztvlOZqObdo
	 5o2JEsLpAxO/RKjDoBUYywSXgvod77CMDGeLptaEFkmvlE7dauh+eVkjbX8YBO3BwB
	 B/DswcxgBomkw==
Message-ID: <sashiko-outbox-189666@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] riscv: dts: spacemit: k3: enable status of mimsic and
 maplic to okay
Reply-To: sashiko-reviews@lists.linux.dev
To: "E Shattow" <e@freeshell.de>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261029162343.1896134-1-e@freeshell.de>
References: <20261029162343.1896134-1-e@freeshell.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 16:37:58 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] riscv: dts: spacemit: enabling M-mode mimsic and maplic breaks S-m=
ode boot
--

commit 20f17376632e73238d57264a563c4880863fe4a3
Author: E Shattow <e@freeshell.de>

riscv: dts: spacemit: k3: enable status of mimsic and maplic to okay

This commit changes the status property of the mimsic and maplic interrupt
controller nodes in k3.dtsi from "reserved" to "okay" for OpenSBI use.

> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/s=
pacemit/k3.dtsi
> index a5fb72e23dcfa..4b3362b64e266 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> @@ -1452,7 +1452,7 @@ mimsic: interrupt-controller@f1000000 {
>  			msi-controller;
>  			riscv,hart-index-bits =3D <4>;
>  			riscv,num-ids =3D <511>;
> -			status =3D "reserved";
> +			status =3D "okay";
>  		};
> =20
>  		maplic: interrupt-controller@f1800000 {
> @@ -1464,7 +1464,7 @@ maplic: interrupt-controller@f1800000 {
>  			riscv,children =3D <&saplic>;
>  			riscv,delegation =3D <&saplic 1 512>;
>  			riscv,num-sources =3D <512>;
> -			status =3D "reserved";
> +			status =3D "okay";

[Severity: High]
Does enabling mimsic and maplic in k3.dtsi cause a boot regression when
S-mode Linux boots with a kernel-built DTB loaded in S-mode (for example via
U-Boot extlinux/booti/EFI, GRUB, or kexec) where OpenSBI's coldboot
fdt_fixups() did not patch the newly loaded DTB?

Unlike aclint_mswi and aclint_mtimer, which have no Linux driver, mimsic and
maplic match the riscv,imsics and riscv,aplic irqchip drivers, while S-mode
Linux is meant to use simsic and saplic.

When mimsic has status =3D "okay", of_irq_init() invokes
imsic_early_dt_init() -> imsic_setup_state() on mimsic after simsic, which
fails because the singleton imsic state is already initialized:

drivers/irqchip/irq-riscv-imsic-state.c:imsic_setup_state() {
	if (imsic) {
		pr_err("%pfwP: already initialized hence ignoring\n", fwnode);
		return -EALREADY;
	}
}

Because early irqchip init fails, of_irq_init() clears OF_POPULATED on mims=
ic
and exposes it to platform device probing, where imsic_platform_dt_probe() =
->
imsic_platform_probe_common() fails with -ENODEV:

drivers/irqchip/irq-riscv-imsic-platform.c:imsic_platform_probe_common() {
	if (imsic && imsic->global.fwnode !=3D fwnode) {
		pr_err("%pfwP: fwnode mismatch\n", fwnode);
		return -ENODEV;
	}
}

With mimsic failing to bind, maplic (which has msi-parent =3D <&mimsic>) is
left permanently deferred under default fw_devlink. Furthermore, if
aplic_probe() runs on maplic (such as when fw_devlink is permissive or off),
aplic_probe() -> aplic_msi_setup() -> aplic_setup_priv() calls
aplic_init_hw_irqs() before resolving the msi-parent domain:

drivers/irqchip/irq-riscv-aplic-main.c:aplic_init_hw_irqs() {
	/* Disable all interrupts */
	for (i =3D 0; i <=3D priv->nr_irqs; i +=3D 32)
		writel(-1U, priv->regs + APLIC_CLRIE_BASE + (i / 32) * sizeof(u32));

	/* Set interrupt type and default priority for all interrupts */
	for (i =3D 1; i <=3D priv->nr_irqs; i++) {
		writel(0, priv->regs + APLIC_SOURCECFG_BASE + (i - 1) * sizeof(u32));
		writel(APLIC_DEFAULT_PRIORITY,
		       priv->regs + APLIC_TARGET_BASE + (i - 1) * sizeof(u32));
	}

	/* Clear APLIC domaincfg */
	writel(0, priv->regs + APLIC_DOMAINCFG);
}

Won't writing to maplic's M-mode MMIO registers at 0xf1800000 from S-mode
either trigger an immediate Store/AMO access fault panic due to OpenSBI's P=
MP
protection or wipe out the M-mode interrupt delegation to saplic?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029162343.1896=
134-1-e@freeshell.de?part=3D1
