Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B066B367B73
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 16:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784822602; cv=none; b=FC7bY3JMl0PUY/7Xa07C7nlgfEvcx+xHlyuEGy21nVrfEm/+YlfRHPGIfa7/loLix6RvxDY0NoK4Ztda+tJyvBOgBhzeWDWMrKVU6sNJPKxm1KFqeb0hQJ40VBxJXRPKqaPKMn6x9nHBluzFuXNZ8HZP0St1Rb7ibf2tUZDHRc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784822602; c=relaxed/simple;
	bh=RluGc6Czty5Jx6Q7uFhd2+PTiuPVPI690xUkXsC1PH0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=A3YpllTZX5UCXardLPOrkqrtlsBtVekCJOP3dko4PiUeLxTbADdtho7/gB/+jRpLPJnUhAlEz8DUlqKIythBCvO23hgb1GJlfQs+IG7Ax9g9m235HTaa1o7Qxz7cv7bn4SrcGCWzPwJ4YlkpI4NrOt3NdTg7ErlhoAZrnZMc1hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21B771F00A3A;
	Thu, 23 Jul 2026 16:03:21 +0000 (UTC)
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 2/4] arm64: dts: renesas: r9a08g046: Add SDHI nodes
 for RZ/G3L SoC and SDHI1 pincontrol on SMARC EVK
Reply-To: sashiko-reviews@lists.linux.dev
To: Biju <biju.das.au@gmail.com>
Cc: wsa+renesas@sang-engineering.com, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260723154154.319674-3-biju.das.jz@bp.renesas.com>
References: <20260723154154.319674-1-biju.das.jz@bp.renesas.com>
 <20260723154154.319674-3-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 16:03:03 +0000
Message-Id: <20260723160321.21B771F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The SDHI device tree nodes specify only the SoC-specific compatibl=
e string (`renesas,sdhi-r9a08g046`) and omit the required fallback string (=
`renesas,rzg2l-sdhi`).
- [Medium] Missing `#else` branch leaves `sdhi1` enabled without pin multip=
lexing or supplies when `RZ_BOOT_MODE3` is disabled.
- [Medium] The pin configuration for `sd1-data` in the `sdhi1_pins` and `sd=
hi1_uhs_pins` nodes is missing the `bias-pull-up` property.
--

--- Patch [2]: [PATCH v19 2/4] arm64: dts: renesas: r9a08g046: Add SDHI nod=
es for RZ/G3L SoC and SDHI1 pincontrol on SMARC EVK ---
commit 6289153083cb6f174266f6b60614c70a75cd4294
Author: Biju Das <biju.das.jz@bp.renesas.com>

arm64: dts: renesas: r9a08g046: Add SDHI nodes for RZ/G3L SoC and SDHI1 pin=
control on SMARC EVK
   =20
Add device tree nodes for the three SDHI controllers (SDHI{0,1,2})
on the RZ/G3L SoC (r9a08g046) and enable SDHI1 on the RZ/G3L SMARC
EVK platform with pincontrol and GPIO-based voltage switching
regulator support.

> diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot=
/dts/renesas/r9a08g046.dtsi
> --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> @@ -762,9 +762,80 @@ dmac: dma-controller@11820000 {
>  			dma-channels =3D <16>;
>  		};
> =20
> +		sdhi0: mmc@11c00000 {
> +			compatible =3D "renesas,sdhi-r9a08g046";

[Severity: High]
Does this node need the "renesas,rzg2l-sdhi" fallback compatible string?

The driver source code for SDHI does not contain a direct match for
"renesas,sdhi-r9a08g046", so it relies on the "renesas,rzg2l-sdhi"
fallback to successfully probe the device. Without the fallback string,
the driver will not probe the controllers, breaking SD/eMMC support.

This same issue also appears in the sdhi1 and sdhi2 nodes below.

[ ... ]

> diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/ar=
m64/boot/dts/renesas/r9a08g046l48-smarc.dts
> --- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts

[ ... ]

> +	sdhi1_pins: sd1 {
> +		sd1-cd {
> +			pinmux =3D <RZG3L_PORT_PINMUX(J, 0, 8)>; /* SD1_CD */
> +		};
> +
> +		sd1-clk {
> +			pinmux =3D <RZG3L_PORT_PINMUX(G, 0, 1)>; /* SD1_CLK */
> +			power-source =3D <3300>;
> +		};
> +
> +		sd1-cmd {
> +			pinmux =3D <RZG3L_PORT_PINMUX(G, 1, 1)>; /* SD1_CMD */
> +			input-enable;
> +			power-source =3D <3300>;
> +			bias-pull-up;
> +		};
> +
> +		sd1-data {
> +			pinmux =3D <RZG3L_PORT_PINMUX(G, 2, 1)>, /* SD1_DAT0 */
> +				 <RZG3L_PORT_PINMUX(G, 3, 1)>, /* SD1_DAT1 */
> +				 <RZG3L_PORT_PINMUX(G, 4, 1)>, /* SD1_DAT2 */
> +				 <RZG3L_PORT_PINMUX(G, 5, 1)>; /* SD1_DAT3 */
> +			input-enable;
> +			power-source =3D <3300>;

[Severity: Medium]
Should the data lines also specify bias-pull-up?

The sd1-cmd node correctly includes bias-pull-up. If the board relies on
the SoC's internal pull-ups rather than external resistors, leaving the data
lines floating when the bus is idle could lead to intermittent SD card
communication errors.=20

This also applies to the sdhi1_uhs_pins configuration.

[ ... ]

> +#if RZ_BOOT_MODE3
> +&sdhi1 {
> +	pinctrl-0 =3D <&sdhi1_pins>;
> +	pinctrl-1 =3D <&sdhi1_uhs_pins>;
> +	pinctrl-names =3D "default", "state_uhs";
> +
> +	vmmc-supply =3D <&reg_3p3v>;
> +	vqmmc-supply =3D <&vqmmc_sd1_pvdd>;
> +};
> +#endif

[Severity: Medium]
Does this conditional block need an #else branch to set status =3D "disable=
d"
for &sdhi1 when RZ_BOOT_MODE3 is false?

Since the included renesas-smarc2.dtsi unconditionally sets status =3D "oka=
y"
for &sdhi1, failing to disable it here when RZ_BOOT_MODE3 is 0 leaves the
node enabled but without required pin multiplexing and supplies. The MMC dr=
iver
would then attempt to probe a non-routed device, which could lead to timeou=
ts
and boot delays.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723154154.3196=
74-1-biju.das.jz@bp.renesas.com?part=3D2
