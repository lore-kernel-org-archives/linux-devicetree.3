Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452DE3E0241
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 12:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782390036; cv=none; b=pGWYKN6kY/lzJTpUcGJrDAV/PNcHWNojHRZuj524kE6etLw3B55IepMLOTqGi8rMFOEVIn9JLf4g9QtUIOoLliECALm5I2m3QgudOuzvMfsnDZV8Cn2NmJcBhhq+cWSWJtcRFmAOdWT4j1wOIciHm+HLDqRXsXdXU21Q7RXfGPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782390036; c=relaxed/simple;
	bh=7Vd+m/Mxqb3aiQh24z3KIrhMm6y9UlIUmatOa7K5FpE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SV1dSBZekGgnvToCmEwvX3ZEWtmvxYWCvr657BLBC5ysJ6oHY/YOJ95dFfDA2RKlJzm16VL3o4PaqvDcABOwRQTKcUTFpuE3M9gm+604AaylncN0TyqYTW+1jgEK3oW535Uealw/p1JlZebaW2LaMLM3Bore1Ol2Cd8QbWFYg20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WuGVU/RD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WuGVU/RD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE9681F000E9;
	Thu, 25 Jun 2026 12:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782390035;
	bh=beTQ17WFlwMPyYaVTtvxW0amXStDO1oZ3ezaBcWlqDI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WuGVU/RD9vyTKZBlXnT12NnsjbUA0xRZ3VBz6SKX+Zpp/V0a1hIC/D3Q8iqBkOojj
	 PUPKDv2DINd6SiGFYfm3nfiiypuTsTXInFAok5pmYOKD6DL3R23KTck91gCuFYa7Xd
	 DHAG1o4FrsEn/E+Pkt8RF5kR5qSpps5wq2yZ0bQ3CcGIr5XYK4PK0cD99fL1mUld6P
	 h/QuL+vW/Ar8mqcv177BZiHrVU66IG/vkvDIdMKSz5sH57Hb18F929rfcaYi+dqGf3
	 rERMkffllU20YWaaWOxPqPx0maBfGRVpMvsIw78OmV8F3/MY+BLEspKxvw0YElbOG3
	 oxou7Jj9QIBvA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: ti: Add PLL1 refclk to J784S4 SoC
 SERDES node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gokul Praveen" <g-praveen@ti.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260625120805.28948-2-g-praveen@ti.com>
References: <20260625120805.28948-1-g-praveen@ti.com>
 <20260625120805.28948-2-g-praveen@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 12:20:33 +0000
Message-Id: <20260625122034.DE9681F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Adding a third clock to the serdes2 node violates the Cadence Torre=
nt PHY DT binding schema, which will cause `dtbs_check` validation to fail.
--

commit c7948a2c66b640fab1ce0e80a89c69a933059939
Author: Gokul Praveen <g-praveen@ti.com>

arm64: dts: ti: Add PLL1 refclk to J784S4 SoC SERDES node

This commit adds the PLL1 reference clock to the clocks and clock-names
properties of the SERDES2 node. This is done to satisfy the assigned-clocks
parameter and prevent multilink configuration failures.

> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi b/arch/arm64/boot=
/dts/ti/k3-j784s4-main.dtsi
> index 78fcd0c40abcf..da8d582574d03 100644
> --- a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
> @@ -122,8 +122,9 @@ serdes2: serdes@5020000 {
>  			resets =3D <&serdes_wiz2 0>;
>  			reset-names =3D "torrent_reset";
>  			clocks =3D <&serdes_wiz2 TI_WIZ_PLL0_REFCLK>,
> +				 <&serdes_wiz2 TI_WIZ_PLL1_REFCLK>,
>  				 <&serdes_wiz2 TI_WIZ_PHY_EN_REFCLK>;
> -			clock-names =3D "refclk", "phy_en_refclk";
> +			clock-names =3D "refclk","pll1_refclk", "phy_en_refclk";

[Severity: Low]
Will adding a third clock to the serdes2 node cause dtbs_check validation
to fail?

The Cadence Torrent PHY device tree binding schema in
Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml restricts
the clocks and clock-names properties to a maximum of 2 items. By adding
pll1_refclk alongside refclk and phy_en_refclk, the array now contains 3
items, which violates the existing schema constraints.

Does the device tree binding schema need to be updated first to support
this third clock?

>  			assigned-clocks =3D <&serdes_wiz2 TI_WIZ_PLL0_REFCLK>,
>  					  <&serdes_wiz2 TI_WIZ_PLL1_REFCLK>,
>  					  <&serdes_wiz2 TI_WIZ_REFCLK_DIG>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625120805.2894=
8-1-g-praveen@ti.com?part=3D1
