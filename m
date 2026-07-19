Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1EE3B14A6
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 18:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784484965; cv=none; b=Eu3rvnjdkMeCmGNCmMRQLFAsy2Z5vwF4fmFUaqxkRT3KzHTFIG8KNMN1a9Nd56yB27AYxnmYvpXxm13EXobLYeFl27E18jyfM7XQgB/R1DGiHRN2TshQsBsyAn/aoGTwPI3WA6zxP1WfY2OWgIIHRtm4PKNG5VIgD8e75L1NIUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784484965; c=relaxed/simple;
	bh=Bup5QMfktUv6vIlZ/2dKlZb4eV36tShddzLwobmWWGQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IGFcRFLfrc7ryRekR53WahWPzPkFQ5KwvW3jXa24KUkRZtUZVTLw4JNGzjyKnD1Ag318NUikZlLv0bJ1pqyaFCrKXg344eaH3xAEwl21KRpHVKGAWICcD62izOpV10uqnt2gJhFFMAcBgqnXcNT4PkvbgBfzUerH0L+4pkCc9RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MOnM2+Wn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MOnM2+Wn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C80331F000E9;
	Sun, 19 Jul 2026 18:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784484960;
	bh=zAN9ptDDYbzsSmxT9BuixNmXSrTNrgbLOjdbdwaEqVU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MOnM2+WnOLe226P3XxWDOv0e7KPpv6vncq43L5jU6LAdgE/E8Mo6wiUDXE/qF3I8K
	 prK22I1MBJpow1Zg7OKeGaJ+LO1V2KYgl0UMShVUOCMcARY5NRIwdH6Q21Q0LV0fDn
	 r0TIgkj6irg44IWbl0bFajzRCEV6Mn+GTh1crC8QP4Acn1SogDjG7ld4uKbe6iDsLq
	 Vd4G+uFn2yyPTby+9CV3imDY+aDWvvHuAw/gQtaxjWqzH1J2+SfnDkS1ZRALIHVes5
	 E2JfI33a6Gug7hPXRAZliPW6mc8KTF2/hkLIUQyCvGbmURGFVmPXyfYDLQn3SIp/J/
	 9g61uv3Y8+tog==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: monaco-evk: Add LVDS display
 overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Saini" <vishnu.saini@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260719-lvds-support-v1-2-1f1aca3213ba@oss.qualcomm.com>
References: <20260719-lvds-support-v1-0-1f1aca3213ba@oss.qualcomm.com>
 <20260719-lvds-support-v1-2-1f1aca3213ba@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Jul 2026 18:15:59 +0000
Message-Id: <20260719181559.C80331F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The device tree overlay specifies an unsupported compatible string=
 `lontium,lt9211c` for the LVDS bridge without a valid fallback, preventing=
 the bridge from probing.
- [Low] The `panel-lvds` node defines a dual-port LVDS panel using the `por=
ts` construct, which violates the strict `panel-lvds` generic schema requir=
ements.
--

--- Patch [2]: [PATCH 2/3] arm64: dts: qcom: monaco-evk: Add LVDS display o=
verlay ---
commit c66e770010c2090d7d3ca762b7283b36aac9f68f
Author: Vishnu Saini <vishnu.saini@oss.qualcomm.com>

arm64: dts: qcom: monaco-evk: Add LVDS display overlay

This commit adds a device tree overlay for the Monaco EVK IFP mezzanine to
support an LVDS display using the Lontium LT9211C bridge. It includes the
bridge node, panel timings, and necessary power routing.

> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-lvds-boe,dv215fhm-r01.dt=
so b/arch/arm64/boot/dts/qcom/monaco-evk-lvds-boe,dv215fhm-r01.dtso
> new file mode 100644
> index 0000000000000..d62f6baeca858
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk-lvds-boe,dv215fhm-r01.dtso
> @@ -0,0 +1,131 @@
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
> +	model =3D "Qualcomm Technologies, Inc. Monaco-EVK Mezzanine Lvds";
> +
> +	panel_lvds: panel-lvds {
> +		compatible =3D "boe,dv215fhm-r01", "panel-lvds";
> +		data-mapping =3D "vesa-24";
> +		width-mm =3D <476>;
> +		height-mm =3D <268>;
> +		power-supply =3D <&lcd_disp_bias>;
> +
> +		status =3D "okay";
> +
> +		panel-timing {

[ ... ]

> +		};
> +
> +		ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			port@0 {
> +				reg =3D <0>;

[Severity: Low]
Will this ports construct fail device tree schema validation?

The panel-lvds.yaml schema generally mandates unevaluatedProperties: false
and only accepts a single port node, rejecting the ports container used for
dual-link mapping. Does this pass make dtbs_check?

> +				dual-lvds-odd-pixels;
> +				panel_in_lvds_odd: endpoint {
> +					remote-endpoint =3D <&lt9211c_out_odd>;
> +				};
> +			};

[ ... ]

> +&i2c8 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&qup_i2c8_data_clk>;
> +
> +	status =3D "okay";
> +
> +	lt9211c_codec: lvds-bridge@2d {
> +		compatible =3D "lontium,lt9211c";
> +		reg =3D <0x2d>;

[Severity: High]
Will this bridge actually probe with this compatible string?

The string "lontium,lt9211c" appears to be unhandled by the kernel, lacking
a fallback (such as "lontium,lt9211"). Could this prevent the device from
binding to the driver and leave the display pipeline non-functional?

> +		reset-gpios =3D <&tlmm 66 GPIO_ACTIVE_HIGH>;
> +		vccio-supply =3D <&vreg_l5a>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260719-lvds-suppo=
rt-v1-0-1f1aca3213ba@oss.qualcomm.com?part=3D2
