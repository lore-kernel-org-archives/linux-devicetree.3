Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4084C380FC3
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 13:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787664539; cv=none; b=n3b1nWEFzIFf0oIMHz2QWS4XuHr1YGzME+L1nSZ2jBguOjqJWolBMmD5tBvbbX/HKUOSryM40oTUetRObtPohmfiCTyDwGzpHmXsL0QOFIqnlm/g/UsfvFtzrJ/ZMJxnhPH0EkeIy0/PHIWNiqr3lTLCC2zupbq3GYkp1+9B9Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787664539; c=relaxed/simple;
	bh=+cwb+T2Q/QU7Udy9UcntSUaoGr6FB++hhck3o43Qi58=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=L5gl9ozf8b7vjq540nuHHrY4cbxG6l7zWp2tEJ7cx7ZMv1hFB0dqBPbls8drkiJ9Bpj+B8r+1YCt+tLeRpjmrPyvTZ34MMfybsv7hqfWkUG2VNkuM454OxmAqSXAbooO0EjiqHXVvEBI4Pm9h1TfMdxL61lIxdce0yxv/7H9Oj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IbThXUVx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IbThXUVx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6A561F00A3A;
	Tue, 25 Aug 2026 13:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787664538;
	bh=ZPQkRix7mK4UiTqrf7gVND6+vOn7rFnEDw44l4fYTwg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IbThXUVxxW+vwhjBEARivvbmGNTzsQuKKsec7xlrjajwOYR2/66Ftj7T8HP3SM60R
	 CTKnhAfZJ0DBVnjOcFpPk6ALv/9Cw4ediUcIBvxhCtW/Lj3a9pbwxdrMV367cuRM+B
	 A0RGx1PSYh/MNNrtQUfmIOGuwDLzu7Tn3C+RhLlt2gpkXA8Gg3gKcYhwyznk5ogG8q
	 mWgZnWnGbujLoZXGAGl59GUeSzIgGxfDaQGQqKY3l0uBo2yP62tywPY71u5gye/5CZ
	 vN0KNYZXoXT0QfNLv7zLQXOx8DsG4JwitKPH7O37DqxGhp1Uh3dkdNF9oxcs7UjxOz
	 j2PteIAVvuXkQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: renesas: r9a09g047: Add USB2.0
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tommaso Merciai" <tommaso.merciai.xr@bp.renesas.com>
Cc: wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <c1488855f44e6faddae1f541c460268eaea483d4.1787663426.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1787663426.git.tommaso.merciai.xr@bp.renesas.com>
 <c1488855f44e6faddae1f541c460268eaea483d4.1787663426.git.tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 13:28:57 +0000
Message-Id: <20260825132857.B6A561F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `usb2_phy0` and `usb2_phy1` nodes incorrectly include the ho=
st controller resets (`<&cpg 0xac>` and `<&cpg 0xad>`) as their second `res=
ets` item.
--

--- Patch [3]: [PATCH v2 3/4] arm64: dts: renesas: r9a09g047: Add USB2.0 su=
pport ---
commit 631196a322ba0beff3a83f906e11925634e7691a
Author: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

arm64: dts: renesas: r9a09g047: Add USB2.0 support

The Renesas RZ/G3E ("R9A09G047") SoC supports 1x channel with OTG/DRD
and 1x channel with host interface. This commit adds the EHCI, OHCI,
USB2.0 PHY and reset control nodes for USB2.0 channels in R9A09G047 SoC DTS=
I.

> diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot=
/dts/renesas/r9a09g047.dtsi
> index 73757e8e21970..e26d43538ad8c 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
[ ... ]
> @@ -1773,6 +1773,130 @@ usb3_phy: usb-phy@15870000 {
[ ... ]
> +		usb2_phy0: usb-phy@15800200 {
> +			compatible =3D "renesas,usb2-phy-r9a09g047",
> +				     "renesas,usb2-phy-r9a09g057";
> +			reg =3D <0 0x15800200 0 0x700>;
> +			interrupts =3D <GIC_SPI 745 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cpg CPG_MOD 0xb3>,
> +				 <&cpg CPG_CORE R9A09G047_USB2_0_CLK_CORE0>;
> +			clock-names =3D "fck", "usb_x1";
> +			resets =3D <&usb20phyrst>, <&cpg 0xac>;

[Severity: Medium]
Does this node incorrectly include the host side reset <&cpg 0xac> as the
second item?

If the PHY driver manipulates this second reset, it will reset the host
controller behind the USB host driver's back. This can break USB
functionality or cause crashes if active transfers or DMAs are interrupted.
Could this be a copy-paste error from the ohci0/ehci0 nodes?

> +			#phy-cells =3D <1>;
> +			power-domains =3D <&cpg>;
> +			mux-states =3D <&usb20phyrst 1>;
> +			status =3D "disabled";
> +
> +			usb2_phy0_vbus_otg: vbus-regulator {
> +				regulator-name =3D "USB2PHY0-VBUS-OTG";
> +			};
> +		};
> +
> +		usb2_phy1: usb-phy@15810200 {
> +			compatible =3D "renesas,usb2-phy-r9a09g047",
> +				     "renesas,usb2-phy-r9a09g057";
> +			reg =3D <0 0x15810200 0 0x700>;
> +			interrupts =3D <GIC_SPI 750 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cpg CPG_MOD 0xb4>,
> +				 <&cpg CPG_CORE R9A09G047_USB2_0_CLK_CORE1>;
> +			clock-names =3D "fck", "usb_x1";
> +			resets =3D <&usb21phyrst>, <&cpg 0xad>;

[Severity: Medium]
Similar to the usb2_phy0 node above, does this node incorrectly include the
host side reset <&cpg 0xad>?

If the PHY driver accesses this second reset item, it will reset the host
controller unexpectedly.

> +			#phy-cells =3D <1>;
> +			power-domains =3D <&cpg>;
> +			mux-states =3D <&usb21phyrst 0>;
> +			status =3D "disabled";
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1787663426.gi=
t.tommaso.merciai.xr@bp.renesas.com?part=3D3
