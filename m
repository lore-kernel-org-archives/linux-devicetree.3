Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564D33B71A7
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782729072; cv=none; b=OYl/PonBfsA279QmwCrfNM+Oq147r95gy29QAaIBT6nym5oUT+XRla2eoqFhoemAdw6Z8puEH7ze5tf1A+bIKuP0cUoOsgcsJw2jJ7W7uV6u6b3BxrpIBJAGrfHuhRxQ0HYN1amipq6p7OqmeCL1C2YbliZcv3LKOx+7ORPgR9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782729072; c=relaxed/simple;
	bh=oLAEPL+t4n7vlWTw5wAdq026JJaFSa3M24TMovSkMKI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FrXG3OI/qQn7AOwzXepBVCrmeIiqa//MhyumLbIfq3ofvoyZm1qaoqPK9M6hJ/3dyyBAbcdpWzHINhOj5VoUF2DslEBF7pvJcBjEmXS2Xm/gPqU4Tg1fdgABXUqt9PaE3FPd0fbZ4SYk/1m+t0FK8yDTIMG+epu+52u+wARGrXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W3sSGqpp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W3sSGqpp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B86F31F00A3A;
	Mon, 29 Jun 2026 10:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782729071;
	bh=pfwkyO968/TbGxA3FNtUw8ge5SCstZJrKTEKHXYy3Ko=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W3sSGqpp7xqwLz8M5JcMXTGbo3sQQGMTNQTPDZMRzg6tQR4RbD8zBJ1/aard3mgj2
	 e/ifc37N7ZZCQuDxl9YS7OtnTnKcbCD/3xKlj+WCCCN035JijKrhJH2s7w13KIpz0E
	 eL5JxQK6Qf8DnO6+bpYNUximFC89TcoG68quNKlv9CcgmGvzNSfX8fo1ICCALJgXbp
	 7+Ps5Dw2DFUMHY/OMIZ13HM3ifKVRyzsJpeDeoGmq0Oiqn2HJlRRqcSTngBqAP4lJv
	 vviKVIz7T7JWYr2Wg3XJ7XoyqIwrpWNkR+D4bWsqb4WwZCamKwtn4J1sGJUy328EI5
	 UPaAUJCSCGf9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] arm64: dts: ti: Add PLL1 refclk to J784S4 SoC
 SERDES node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gokul Praveen" <g-praveen@ti.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260629102308.56616-2-g-praveen@ti.com>
References: <20260629102308.56616-1-g-praveen@ti.com>
 <20260629102308.56616-2-g-praveen@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 10:31:10 +0000
Message-Id: <20260629103110.B86F31F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Device Tree Binding Schema validation failure due to missing schema=
 item for the third clock name.
--

commit c724dfc4b95310a6b37f143a703b52391002ee90
Author: Gokul Praveen <g-praveen@ti.com>

arm64: dts: ti: Add PLL1 refclk to J784S4 SoC SERDES node

This commit adds the PLL1 refclk to the clocks and clock-names parameters
of the SERDES2 node. It updates both the devicetree binding schema and the
k3-j784s4-main.dtsi file to reflect the new clock.

> diff --git a/Documentation/devicetree/bindings/phy/phy-cadence-torrent.ya=
ml b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
> --- a/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
> +++ b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
[ ... ]
> @@ -47,7 +47,7 @@ properties:
>      minItems: 1
>      items:
>        - const: refclk
> -      - enum: [ pll1_refclk, phy_en_refclk ]
> +      - enum: [refclk, pll1_refclk, phy_en_refclk ]

[Severity: Low]
Does this schema correctly allow a third clock name?

The items list here only defines two elements (the const and the enum). Und=
er=20
dt-schema rules, any device tree node specifying a third element will fail=
=20
validation because there is no corresponding schema item defined for it in =
the=20
items array.

> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi b/arch/arm64/boot=
/dts/ti/k3-j784s4-main.dtsi
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
Will this trigger a dtbs_check warning?

Since the device tree node is updated to supply 3 clock-names, but the
YAML schema items list above is still implicitly limited to 2 definitions,
this will likely cause a build-time validation failure.

Should a third item be added to the YAML items array to match this 3-clock
configuration?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629102308.5661=
6-1-g-praveen@ti.com?part=3D1
