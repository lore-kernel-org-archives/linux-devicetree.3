Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6404A2E1B
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 14:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785333697; cv=none; b=aqd6km/OB1/rYZKB+Vol12mWY4m2Yy7cRbEPWe5mP5BAWygyiMlj8280U0HvEBRaz9PTNB0Cww/+VzqFfmLUAgjqAbfLoZ/r4NzYZ7lvDxis327KtAkXyle3tvSM7TUK7BIPdaFHrI89eQdj9cvTedMZLp4LvnBtUJTptegUzyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785333697; c=relaxed/simple;
	bh=mb8QZO52zmswOCLzMr24dFwI+Z1dHZrV7ksLiupn17Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fncm+WBnU8nRkZfmWGsRfs5inXi0PHVTNxTb9h1GfXHdZklpI4SLsBAD3UdmUAqSOzWhYKZg3W1TsEb3FW1164h9/kHtFerdcUTV19zCXnG56jmS2ZoC9tNniZQ90gVVjuvFvgOQLQfoutCxgIKOL9pIO7CH9ZH2X2P1siaMMPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VCdV/uBA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VCdV/uBA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEC481F000E9;
	Wed, 29 Jul 2026 14:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785333694;
	bh=KzPD2vNXbNx8NrI2xHkEJklLXVAAG3NAM05/0MprzZ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VCdV/uBAeeoFd6z7VSrK62tf0VAnGqoL/2cFSdFQytjoGCdL/H4noeDdDTpd8ah6d
	 YRKomAB7OKdQaTnbTdiBUNSyJHvl6THzIdXO6G2HCgqADuSnzW84abRLSdDhmPYLQ9
	 /DCeokH44UsUtkMzHpXDkZOE1ItD7NKEwZsZs7Xp8vdAKEzPMxrr7cP8ErktEWYZwG
	 M6pur9ir72jTQ1H1p5BZk1l1OFImysaHHNWUc3cpYyR4GmDyKRDrp4E2KKTX9d3vvZ
	 VNLPexB5KrtLXP5GG/P+CBPKLnuhz0O1L57W5LlNb61Bbcc6zXMxyIRw/x3Xc1GQXu
	 rKulIFG/Mu0MQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/6] ARM: dts: rockchip: Add support for RV1106 and
 RV1103
Reply-To: sashiko-reviews@lists.linux.dev
To: "Simon Glass" <sjg@chromium.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260729133609.3465563-5-sjg@chromium.org>
References: <20260729133609.3465563-1-sjg@chromium.org>
 <20260729133609.3465563-5-sjg@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 14:01:34 +0000
Message-Id: <20260729140134.AEC481F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Deleting the `&gpio2` node causes a kernel panic when reading pinc=
trl debugfs because the statically registered pins reference a missing bank=
 node.
- [High] Schema violation and hardware misconfiguration by injecting `rockc=
hip,grf` into `gpio-bank` nodes and assigning a dummy global GRF.
- [Low] The unit-address of the `gic` node does not match the first address=
 in its `reg` property.
--

--- Patch [4]: [PATCH v3 4/6] ARM: dts: rockchip: Add support for RV1106 an=
d RV1103 ---
commit 2a704554f0ba16f51aa70ddcf7fa1a4a81337f55
Author: Simon Glass <sjg@chromium.org>

ARM: dts: rockchip: Add support for RV1106 and RV1103
   =20
Add the devicetree files for the Rockchip RV1106, a Cortex-A7 SoC
aimed at IP cameras, and its RV1103 package variant, which has fewer
pins and no GPIO2 bank. The pinctrl data comes from the vendor kernel in
the Luckfox Pico SDK.

[1] https://github.com/LuckfoxTECH/luckfox-pico

> diff --git a/arch/arm/boot/dts/rockchip/rv1103.dtsi b/arch/arm/boot/dts/r=
ockchip/rv1103.dtsi
> new file mode 100644
> index 0000000000000..025fde5bf09cf
> --- /dev/null
> +++ b/arch/arm/boot/dts/rockchip/rv1103.dtsi
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2022 Rockchip Electronics Co., Ltd.
> + */
> +
> +#include "rv1106.dtsi"
> +
> +/ {
> +	compatible =3D "rockchip,rv1103";
> +
> +	aliases {
> +		/delete-property/ gpio2;
> +	};
> +};
> +
> +/delete-node/ &gpio2;

[Severity: High]
Does deleting the gpio2 node cause a kernel panic when reading pinctrl
debugfs?

The Rockchip pinctrl driver registers pins statically based on the SoC
variant. Because the node is deleted, the pinctrl driver cannot retrieve
the per-bank rockchip,grf regmap, leaving it NULL or ERR_PTR.

When /sys/kernel/debug/pinctrl/pinctrl-rockchip/pinconf-pins iterates over
all statically registered pins and calls rockchip_pinconf_get(), would
passing this uninitialized regmap to regmap_read() trigger a kernel panic?

Should this use status =3D "disabled" instead to safely disable the bank?

[ ... ]
> diff --git a/arch/arm/boot/dts/rockchip/rv1106.dtsi b/arch/arm/boot/dts/r=
ockchip/rv1106.dtsi
> new file mode 100644
> index 0000000000000..70d3da6bd03ef
> --- /dev/null
> +++ b/arch/arm/boot/dts/rockchip/rv1106.dtsi
[ ... ]
> +	pinctrl: pinctrl {
> +		compatible =3D "rockchip,rv1106-pinctrl";
> +		rockchip,grf =3D <&gpio1_ioc>;

[Severity: High]
Does assigning gpio1_ioc as the global GRF cause the generic
pinctrl-rockchip driver to incorrectly route pull/drive configurations for
all banks (0, 2, 3, 4) to gpio1_ioc?

To satisfy the rockchip,pinctrl.yaml requirement for a global rockchip,grf
on the parent node, gpio1_ioc is assigned here. This instructs the generic
driver to use it as info->regmap_base for all banks, which could result in
silent failures and register corruption.

> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		ranges;
> +
> +		gpio0: gpio@ff380000 {
> +			compatible =3D "rockchip,gpio-bank";
> +			reg =3D <0xff380000 0x100>;
> +			interrupts =3D <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cru PCLK_PMU_GPIO0>, <&cru DBCLK_PMU_GPIO0>;
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +			gpio-ranges =3D <&pinctrl 0 0 32>;
> +			interrupt-controller;
> +			#interrupt-cells =3D <2>;
> +			rockchip,grf =3D <&gpio0_ioc>;

[Severity: High]
Does injecting rockchip,grf into the gpio-bank nodes violate the
Devicetree schema?

The rockchip,gpio-bank.yaml schema has additionalProperties: false and does
not define rockchip,grf. Adding it here would trigger a dtbs_check error.

[ ... ]
> +	soc {
> +		compatible =3D "simple-bus";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		ranges;
> +
> +		grf: syscon@ff000000 {
> +			compatible =3D "rockchip,rv1106-grf", "syscon";
> +			reg =3D <0xff000000 0x68000>;
> +		};
> +
> +		gic: interrupt-controller@ff1f0000 {
> +			compatible =3D "arm,gic-400";
> +			reg =3D <0xff1f1000 0x1000>,

[Severity: Low]
Does the unit-address in the node name mismatch the first address in the
reg property?

The node is named interrupt-controller@ff1f0000, but the first address in
its reg block is 0xff1f1000. This violates the Devicetree specification
which requires the unit-address to strictly match the first reg address,
causing a dtc warning.

Could this be renamed to interrupt-controller@ff1f1000?

> +			      <0xff1f2000 0x2000>,
> +			      <0xff1f4000 0x2000>,
> +			      <0xff1f6000 0x2000>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729133609.3465=
563-1-sjg@chromium.org?part=3D4
