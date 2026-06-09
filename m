Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907CA341068
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 14:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781015450; cv=none; b=Si1r7pn0epHWT2JYQusPq5cectKb8auvQq7rCyBEaUfDkulYUQV/+pRVbO25em5astXA00WUjscDIn6qvicAq1Iz913dzCrRuVssOA25Jb5OcbMEc8QpduchY1OB8188v+fgNDfSuEMKQw9CJ/AWPi1rsoPle8deg3ZRNTdftDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781015450; c=relaxed/simple;
	bh=gL67jctD87qPnkivLKW+j83vB/v2fsOqEpBg4+XUIsk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TwfLB9+V99PtsYC8IXwt09m155Q2nyz1CRX1oz/ZJiAJu3nScXNSolNtR90gGlyrR5rUQ96pUtMGU7ntwRNHEsJqdQviY1OmlbbMQAmDwS2EvQESq8kNmiuW/CFCy5ZWpO5UTUEl5Xasw1RCptbCrx5vSflgI0BzrCCoggqEn2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gG2WxdWh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gG2WxdWh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B0DE1F00898;
	Tue,  9 Jun 2026 14:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781015449;
	bh=i0Pkpf+ifE7+G5rESU7aRyzC104qVLdlPxsNpRQssaA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gG2WxdWhzXQA9nufPIGN13O2Zh3s5GD8Pbm6tDZPdqhxGoKowXNKGA0B8KMvfQDPx
	 IRrofpFR5vdxkjCb1Tu1D0MCP+MXqI9UQL1dKtQ/TUK0XEtKhqLNry2oJWtvjvsvzQ
	 rMM3T0S4BylbdxHVlXtBdpX5ZuCBXml8iEM9FLA/rs+Kf603e6CavODPY+HWSrsU7q
	 KeGZnTzajQixjkqNWhgUgT6D7q92dWV23cewuglL3q/X1PIiXsVeo2IiVnSATRJRGV
	 qK3HQCp66a5H0Vg8IJtZMVwWXiM9oep5HFJbOoN0pOri90tMuZlMLHhUReEDL1mYR0
	 oGKnJSWN7KZPw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: renesas: Add LCDC overlays for RZ/T2H
 and RZ/N2H EVKs with ADV7513
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260609125353.401124-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260609125353.401124-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 14:30:47 +0000
Message-Id: <20260609143048.8B0DE1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The RZ/N2H overlay fails to disable conflicting devices (`led-7`=
, `key-1`, and `sdhi1`), causing pinctrl and physical hardware collisions.
- [Low] Typo in the Makefile causes the composite DTB for the RZ/N2H EVK to=
 be incorrectly named with 'rzt2h' instead of 'rzn2h'.
--

commit efe0a5ca8f3fdb36ded9b05e9b5a45260bb5135a
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

arm64: dts: renesas: Add LCDC overlays for RZ/T2H and RZ/N2H EVKs with ADV7=
513

This commit adds device tree overlay support to enable the DU/LCDC pipeline
on the RZ/T2H and RZ/N2H evaluation kits. It configures the overlays for use
with a CN15/CN20 ADV7513 HDMI transmitter.

> diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/r=
enesas/Makefile
> index ca45d2857ea7f..0f64a8820e374 100644
> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
[ ... ]
> @@ -215,8 +215,14 @@ r9a09g057h48-kakip-pixpaper-dtbs :=3D r9a09g057h48-k=
akip.dtb r9a09g057h48-kakip-pi
>  dtb-$(CONFIG_ARCH_R9A09G057) +=3D r9a09g057h48-kakip-pixpaper.dtb
> =20
>  dtb-$(CONFIG_ARCH_R9A09G077) +=3D r9a09g077m44-rzt2h-evk.dtb
> +dtb-$(CONFIG_ARCH_R9A09G077) +=3D r9a09g077m44-evk-cn15-lcdc.dtbo
> +r9a09g077m44-rzt2h-evk-cn15-lcdc-dtbs :=3D r9a09g077m44-rzt2h-evk.dtb r9=
a09g077m44-evk-cn15-lcdc.dtbo
> +dtb-$(CONFIG_ARCH_R9A09G077) +=3D r9a09g077m44-rzt2h-evk-cn15-lcdc.dtb
> =20
>  dtb-$(CONFIG_ARCH_R9A09G087) +=3D r9a09g087m44-rzn2h-evk.dtb
> +dtb-$(CONFIG_ARCH_R9A09G087) +=3D r9a09g087m44-evk-cn20-lcdc.dtbo
> +r9a09g087m44-rzt2h-evk-cn20-lcdc-dtbs :=3D r9a09g087m44-rzn2h-evk.dtb r9=
a09g087m44-evk-cn20-lcdc.dtbo
> +dtb-$(CONFIG_ARCH_R9A09G087) +=3D r9a09g087m44-rzt2h-evk-cn20-lcdc.dtb

[Severity: Low]
Does this code contain a copy-paste typo? The target is the RZ/N2H EVK, but
the variables use rzt2h instead of rzn2h for the composite DTB names.

> diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-evk-cn20-lcdc.dtso =
b/arch/arm64/boot/dts/renesas/r9a09g087m44-evk-cn20-lcdc.dtso
> new file mode 100644
> index 0000000000000..bc8a91278920e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-evk-cn20-lcdc.dtso
[ ... ]
> +&{/leds/led-4} {
> +	/* P18_1 is used for DU function LCDC_DATB2. */
> +	status =3D "disabled";
> +};
> +
> +&i2c0 {
> +	status =3D "disabled";
> +};

[Severity: Medium]
Does this overlay omit disabling conflicting devices like led-7, key-1, and
sdhi1?

The shared DU overlay configures du-pins to use P18_2 for LCDC_DATB3 and
P14_3 for LCDC_DATG3. In the base RZ/N2H device tree, P18_2 is statically
assigned to key-1 and P14_3 is assigned to led-7. Leaving them enabled could
lead to a pinctrl collision during boot.

Also, the overlay specifies that LCDC_DATG3 requires hardware switch DSW5[3]
to be OFF, but sdhi1 in the base device tree requires DSW5[3] to be ON for
card detect and IO voltage supply. Could sdhi1 be explicitly disabled here =
as
well to prevent physical hardware conflicts?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609125353.4011=
24-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D5
