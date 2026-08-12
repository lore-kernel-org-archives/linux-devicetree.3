Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3DB476690
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 15:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786549442; cv=none; b=PEiDU96KCI71XPKU7rGXVm8LbRput9BnhqorugtqWvxALT12UzFaAn1Jkh+grpwvm/Xv0DFEtUyjDOPt9sADAxcBnJGYIoKCfsPFTwAHVS580SLu1YzptF62Q7uYM44uZPlnbrt2G4pbP1QvKoTZYIKqRQObrp+7XNEkAcStBQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786549442; c=relaxed/simple;
	bh=OxWKkneoq2u2+MfTCwB6cJKY4+jBbXmdKlNH+31HJCo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IrNbehq5LoS0Tq/PaDEnmgyRJLDucHi241FetsFPFvg1HdjeuTQekO4XTOXvjtI1YnUGyaueJMyufhejJyX9oOQitUGIzNPLVQY4JDOtNZYm7XAJo+VXyS84S4Wfg5+1ER1yi85xe+z4//YMPVoWwJzU29AmADsAqHGJJG4TkEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y4Sxo2zM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y4Sxo2zM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B31471F000E9;
	Wed, 12 Aug 2026 15:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786549441;
	bh=JkOxNV4T46Fo2apjYD0C1ooT48FO4Z4LUtYTc5QsM+4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y4Sxo2zMeqTRcRQDTquQTqOg/WImRCs/Q9vp/j56Uh5ziU1VHuWbj8FLsMiI27LP6
	 TylrPU/pWdwrSYojYpWocgSZwG3zKd3S5IvXRtgSmjKDYeFaQ1HUuNF2YVk+4JK+IX
	 n4D00+07GxfjfeI7ea9NqmACR6fBa29hrfMsg+sqLAC1DD7Kuy2/fAVIniFo0W4ncE
	 d/ZKvl3+8J/3TvB22keVxP4Kz/yy74BswijadyU5VGfG2x4F8aI+JRtK4gW9cx0SXT
	 sJCSDoViPloUoiM/4U5YBakjtS5Qvf8EM8f1On9nc21lmyUOoTA3vcW+zfldDy3yuO
	 lswYiNfPxMxSQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 6/9] arm64: dts: renesas: r9a08g046: Add USB2.0
 host/phy device nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: Biju <biju.das.au@gmail.com>
Cc: wsa+renesas@sang-engineering.com, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260812141940.246223-7-biju.das.jz@bp.renesas.com>
References: <20260812141940.246223-1-biju.das.jz@bp.renesas.com>
 <20260812141940.246223-7-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 15:44:00 +0000
Message-Id: <20260812154400.B31471F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing Driver Support and DT Binding Documentation for 'renesas,u=
sb2-phy-r9a08g046'
- [High] Unprobeable Device due to Missing Power Sequencer Provider
--

--- Patch [6]: [PATCH v7 6/9] arm64: dts: renesas: r9a08g046: Add USB2.0 ho=
st/phy device nodes ---
commit 0ab685ca95e56aea571685bc10fd9638d8846f8d
Author: Biju Das <biju.das.jz@bp.renesas.com>

arm64: dts: renesas: r9a08g046: Add USB2.0 host/phy device nodes

Add USB2.0 device nodes to the RZ/G3L (r9a08g046) SoC DTSI, covering
the USB PHY controller, OHCI/EHCI host controllers, and USB2 PHYs for
both ports.

> diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot=
/dts/renesas/r9a08g046.dtsi
> index c63a857f0e5b0..2d8c8fd8a01cd 100644
> --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> @@ -1001,6 +1001,110 @@ queue3 {
>  			};
>  		};
> =20
> +		phyrst: usbphy-ctrl@11e00000 {
> +			compatible =3D "renesas,r9a08g046-usbphy-ctrl";

[Severity: High]
Does omitting the renesas,sysc-pwrrdy property here cause the driver to fail
to probe?

In drivers/reset/reset-rzg2l-usbphy-ctrl.c, when the driver sees that the
renesas,sysc-pwrrdy property is missing, it falls back to requesting a power
sequencer:

    priv->pwrseq =3D devm_pwrseq_get(dev, "usb-pwrrdy");
    if (IS_ERR(priv->pwrseq)) {
        ...

Since there is no power sequencer provider in the kernel exposing a "usb-pw=
rrdy"
target, devm_pwrseq_get() will return -EPROBE_DEFER. This would leave the U=
SB
PHY and dependent host controllers permanently uninitialized.

> +			reg =3D <0 0x11e00000 0 0x10000>;
> +			clocks =3D <&cpg CPG_MOD R9A08G046_USB_PCLK>;
[ ... ]
> +		ohci0: usb@11e10000 {
> +			compatible =3D "generic-ohci";
[ ... ]
> +			phys =3D <&usb2_phy0 1>;
> +			phy-names =3D "usb";
> +			power-domains =3D <&cpg>;
> +			status =3D "disabled";
> +		};
[ ... ]
> +		usb2_phy0: usb-phy@11e10200 {
> +			compatible =3D "renesas,usb2-phy-r9a08g046";

[Severity: High]
Will this node fail to bind to a driver?

The "renesas,usb2-phy-r9a08g046" compatible string doesn't appear to be
supported by the Renesas USB PHY driver (drivers/phy/renesas/phy-rcar-gen3-=
usb2.c),
and there is no fallback compatible string (such as "renesas,rzg2l-usb2-phy=
")
provided here.

Without a match in the driver's of_match_table, the PHY won't probe. Because
the OHCI and EHCI controllers depend on this PHY via their phys property, t=
hey
will also permanently fail to probe with -EPROBE_DEFER, rendering the USB p=
orts
non-functional.

> +			reg =3D <0 0x11e10200 0 0x700>;
> +			interrupts =3D <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812141940.2462=
23-1-biju.das.jz@bp.renesas.com?part=3D6
