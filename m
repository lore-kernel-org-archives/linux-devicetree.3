Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85ADC1F938
	for <devicetree@vger.kernel.org>; Sat,  5 Sep 2026 01:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788572501; cv=none; b=CC+QUEZxPHJmFk/9E6X1swnF7vP3CUlU/H3tAYqIIFeOWuR8R7Ri+ZapSE1+DoF30zi84HIIwo8HdArvHyjNDGsmK6CqPIg38FhtUo26X1vFcNIFWp0TQrlEf0oibqsS7X01vv/0mFnlMmhqpczRrzxUH/y2uqSse/zZTPAzgBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788572501; c=relaxed/simple;
	bh=X4g6ZlMRumDnC9Hzs7kdxQiUwgUOcF7Ec+SQZT05zWc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dACV3un/j42OqA0wqrZXsZqpKXplPoNif6E274McKN6VcG3RHUyt4GsJZxup14Y1eBVuxNy2nBe5zE0nxmpKwJWwj/YZUKWVCc4bS41CtT0Nn9ngy7sXOyCJDVG0vHeKBiWdkD1g/OHpI0t2ZDjdtz2PY/x8t4w7c7s1P1cyTj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XgE6U/lN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XgE6U/lN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF5E41F00A3D;
	Sat,  5 Sep 2026 01:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788572500;
	bh=5k6bGlVPMarCAfs88qOZkx6rOjrto8P3kT4A/IhFJ/k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XgE6U/lNQA0t2SnYFTvNo7pwS6xG6vONnx1Qof1kVdJlIYyciPArgQDwzsvnxMQ7y
	 EN7zmZUBclIiL+WpHCKN5VfF8vYFxfyH/DeTzR4tXagYrKIDq/H06It9Ou7SJRtbN5
	 tSRo2brGAeIvraMqKZy61hvTeL0wQra/09gSTOCMpchgIQjluvK2G14XB9SOeQnETK
	 +UJevgYZHcXu6Ae7u8rw0DbRLhFgkQTbW64XpL9mMM+En3fcYJjzDywmdOTU4Mepep
	 6/enMdhZYnrFUv0jY+8+6p0zGBHoon4v5gObjed5gbfIubs3LyhyKZ7X8yItkMuu1q
	 9zahxF9aT3KRg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: qcs6490-rb3gen2: Add LVDS
 display overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Saini" <vishnu.saini@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260905-lvds-support-v3-3-b40a1b03f63c@oss.qualcomm.com>
References: <20260905-lvds-support-v3-0-b40a1b03f63c@oss.qualcomm.com>
 <20260905-lvds-support-v3-3-b40a1b03f63c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 05 Sep 2026 01:41:39 +0000
Message-Id: <20260905014139.DF5E41F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The DT overlay relies on hardware compatible strings that do not e=
xist in the upstream kernel, preventing probe.
- [High] The 'lcd_disp_bias' fixed regulator claims a 5.5V output while bei=
ng powered by a 1.8V PMIC LDO input rail.
- [Medium] The `lvds_bridge` reset GPIO lacks a corresponding `pinctrl` con=
figuration.
--

commit 80f1496cde2f06d27ebc2ce6e50c133cce0ed74c
Author: Vishnu Saini <vishnu.saini@oss.qualcomm.com>

arm64: dts: qcom: qcs6490-rb3gen2: Add LVDS display overlay

This commit adds a DTBO overlay for the QCS6490 RB3 Gen2 industrial mezzani=
ne=20
to support LVDS display output. It disables HDMI and wires up a Lontium=20
LT9211C DSI-to-LVDS bridge alongside a BOE DV215FHM-R01 panel.

[ ... ]

> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanin=
e-lvds-boe,dv215fhm-r01.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-ind=
ustrial-mezzanine-lvds-boe,dv215fhm-r01.dtso
> new file mode 100644
> index 0000000000000..5501ea09f43ba
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine-lvds-=
boe,dv215fhm-r01.dtso
> @@ -0,0 +1,106 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&{/} {
> +	model =3D "Qualcomm Technologies, Inc. Industrial RB3gen2 LVDS";
> +
> +	hdmi-connector {
> +		status =3D "disabled";
> +	};
> +
> +	panel_lvds: panel-lvds {
> +		compatible =3D "boe,dv215fhm-r01";

[Severity: High]
Are these compatible strings present in the upstream kernel? It appears
that "boe,dv215fhm-r01" (and "lontium,lt9211c" below in the lvds_bridge
node) do not exist in mainline. Without these drivers and bindings, the
devices will silently fail to probe and the overlay will fail dtbs_check
validation when booted.

> +		power-supply =3D <&lcd_disp_bias>;
> +
> +		ports {

[ ... ]

> +	lcd_disp_bias: regulator-lcd-disp-bias {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "lcd_disp_bias";
> +		regulator-min-microvolt =3D <5500000>;
> +		regulator-max-microvolt =3D <5500000>;
> +		vin-supply =3D <&vreg_l18b_1p8>;

[Severity: High]
Is this physical regulator configuration correct? The lcd_disp_bias fixed
regulator claims a 5.5V output while being powered by a 1.8V PMIC LDO input
rail (vreg_l18b_1p8). A fixed regulator cannot step up 1.8V to 5.5V, and
the PMIC LDO cannot supply the wattage required for a 21.5" panel logic
rail. This will likely result in panel power failure and a potential PMIC
overcurrent when the panel driver enables the power-supply during display
initialization.

> +        };
> +};
> +
> +&i2c1 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	status =3D "okay";
> +
> +	lvds_bridge: lvds-bridge@29 {
> +		compatible =3D "lontium,lt9211c";
> +		reg =3D <0x29>;
> +		reset-gpios =3D <&tlmm 117 GPIO_ACTIVE_HIGH>;

[Severity: Medium]
Does this reset GPIO need a corresponding pinctrl configuration to define
its hardware state? The GPIO is requested for the bridge reset but lacks
guaranteed pin muxing. Without pinctrl, the pin might be left in a
high-impedance, undefined, or bootloader-specific state, potentially
preventing the reset signal from successfully reaching the bridge chip
during probe.

> +		vccio-supply =3D <&vreg_l18b_1p8>;
> +
> +		ports {

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260905-lvds-suppo=
rt-v3-0-b40a1b03f63c@oss.qualcomm.com?part=3D3
