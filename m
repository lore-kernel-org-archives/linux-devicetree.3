Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795775701;
	b=xWiTs/UtNIQfho/OShmLtkM/E7zEOuhS3eV5JvFDZggDro9G0F2pPNn3YhY5PMDoS6NO
	 i/qU25PDi5ALoPmRIa0H8aP+GQ5vDv+dsowNl5YSgq5OFElfDSFyeCFbliap7qLhSqlGW
	 vUWIE5E/dTWLDz28I8RtJMGl9JBNtGLIfRccktVJm27RIQV5hEihacGkJiygOs0o8G9td
	 6NN+v3VxGNdTYSq/3/Q7b9wMyx6MUihZV0Es6rqHUIRZ0636E1FiHfolRy2FO+3Pufr/6
	 tKzxPhbFKDETLIGBKW7Hzk7jMiapRMSk25C9E0FtR3xKw3+/ConQOZqArQIzTuIaMnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795775701;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yZ7ZogEXSVwAmuWC9vBQdt25/EzLaIbsfmAd688h/Yk=;
	b=tAU22SkDpc8QfTIQ2mZ89Z1Oov8cGuI70tW2de8PCMWiLBL8e0Ids1DfTY6czZUQbrLt
	 2+vuvIP5ExdfhI4+53yzaW0SAJfGBkKpnp6E0bMmVVAKUevg98+dSMmA1NG73MG2KIF0r
	 uLN/5ilfvtNcZx/WmqtN2Mnwn8IarOaEdc08BanOOesHfYhqFGyZ+1dewkWk8s4GJ9po2
	 2/tEV/hr3gmgw+SYPh4kDL7Mz8pVKtoHElwGxKBFsF8JJehQ4Ky9f0wdbGrfBqGCd5V38
	 Kpgrzx8gJwqxzNg+BrwBSv+ZM45yuBmsGks6ApKOKFKIf0Wr7hT/2vOxB0YwZePq9qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JePJAMl6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E375606A31E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 10:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JePJAMl6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0DA81F00898;
	Fri, 27 Nov 2026 10:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795775701;
	bh=yZ7ZogEXSVwAmuWC9vBQdt25/EzLaIbsfmAd688h/Yk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JePJAMl6ClUqxB4i6bpw2gz3wEgomUQuLV8H7baai2+ti5Ey7z/Pj2LXEWAST5aQP
	 zFp4dEtGj6CCEELUCiHapoKM3J/L/W/+gqRe62dFm4v1DFqT+LCoPzz8ysWM4Q2+1W
	 RpYwBHcXy4bPl0H9JZgySFXTa8MY7THpddooteY0laLTaLswy7w/QWFG9E3fg/Pi4l
	 TEhHsLtAMsy1Lslco2i4DRdku2NisDsSKMdCBue5tN4UMY5ZBoYQd9EMeArmFOscAA
	 J8MOqJ7vt/8XYJiQc2tFgCmyDn3v5IlzpO2rNuoXCDXsP05t9YTuF/Tx1D2K/WzdfN
	 YQPURw8ZSk3Jg==
Message-ID: <sashiko-outbox-237141@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: add Monaco Draco AC SoM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Faruque Ansari" <faruque.ansari@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126-monaco-draco-v3-2-0b603afa1328@oss.qualcomm.com>
References: <20261126-monaco-draco-v3-0-0b603afa1328@oss.qualcomm.com>
 <20261126-monaco-draco-v3-2-0b603afa1328@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 10:35:00 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [Medium] arm64: dts: qcom: invalid supply properties on pcie0_phy and
  pcie1_phy
- [Low] arm64: dts: qcom: non-generic deprecated node name vreg-s2s
- [Low] arm64: dts: qcom: unused qcom,q6afe.h include in
  monaco-draco-ac-som.dtsi
- [Low] arm64: dts: qcom: carrier-specific nodes and incomplete usb_2 in
  Draco SoM
--

commit 1c0150a95b8a63dc6f41dc92e13b09d30745d0a6
Author: Faruque Ansari <faruque.ansari@oss.qualcomm.com>

arm64: dts: qcom: add Monaco Draco AC SoM

This commit adds the initial device tree include file for the
QCS8300-based Monaco Draco AC System-on-Module.

> diff --git a/arch/arm64/boot/dts/qcom/monaco-draco-ac-som.dtsi b/arch/arm=
64/boot/dts/qcom/monaco-draco-ac-som.dtsi
> new file mode 100644
> index 0000000000000..2016cdbb3ef02
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/monaco-draco-ac-som.dtsi
> @@ -0,0 +1,320 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/sound/qcom,q6afe.h>

[Severity: Low]
Is <dt-bindings/sound/qcom,q6afe.h> needed here?  No audio nodes or macros
are used in this file, and monaco.dtsi already includes
<dt-bindings/sound/qcom,q6dsp-lpass-ports.h>.

> +
> +#include "monaco.dtsi"
> +#include "monaco-pmics.dtsi"
> +
> +/ {
> +	aliases {
> +		serial0 =3D &uart7;
> +		serial2 =3D &uart6;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +
> +	/* This comes from a PMIC handled within the SAIL domain */
> +	vreg_s2s: vreg-s2s {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vreg_s2s";
> +
> +		regulator-min-microvolt =3D <1800000>;
> +		regulator-max-microvolt =3D <1800000>;
> +	};
> +};

[Severity: Low]
Should vreg_s2s use a generic regulator-s2s node name instead of vreg-s2s?
fixed-regulator.yaml marks node names not matching the regulator-* pattern
as deprecated.

[ ... ]

> +&pcie0_phy {
> +	vdda-phy-supply =3D <&vreg_l6a>;
> +	vdda-pll-supply =3D <&vreg_l5a>;
> +	vdda-qref-supply =3D <&vreg_l4a>;
> +	vdda-refgen-supply =3D <&vreg_l7a>;
> +
> +	status =3D "okay";
> +};
> +
> +&pcie1_phy {
> +	vdda-phy-supply =3D <&vreg_l6a>;
> +	vdda-pll-supply =3D <&vreg_l5a>;
> +	vdda-qref-supply =3D <&vreg_l4a>;
> +	vdda-refgen-supply =3D <&vreg_l7a>;
> +
> +	status =3D "okay";
> +};

[Severity: Medium]
Are vdda-qref-supply and vdda-refgen-supply valid on pcie0_phy and
pcie1_phy?

In monaco.dtsi, pcie0_phy uses qcom,qcs8300-qmp-gen4x2-pcie-phy and
pcie1_phy uses qcom,sa8775p-qmp-gen4x4-pcie-phy.  Both bindings are
covered by qcom,sc8280xp-qmp-pcie-phy.yaml, which has additionalProperties:
false and does not allow vdda-refgen-supply, causing dtbs_check failures on
boards including this dtsi.  In drivers/phy/qualcomm/phy-qcom-qmp-pcie.c,
both qcs8300_qmp_gen4x2_pciephy_cfg and sa8775p_qmp_gen4x4_pciephy_cfg use
qmp_phy_vreg_l, which only requests vdda-phy and vdda-pll, so neither
vdda-qref-supply nor vdda-refgen-supply is requested or enabled by the
driver.

[ ... ]

> +&uart6 {
> +	status =3D "okay";
> +};
> +
> +&uart7 {
> +	status =3D "okay";
> +};

[ ... ]

> +&usb_1 {
> +	dr_mode =3D "peripheral";
> +
> +	status =3D "okay";
> +};
> +
> +&usb_1_hsphy {
> +	vdda-pll-supply =3D <&vreg_l7a>;
> +	vdda18-supply =3D <&vreg_l7c>;
> +	vdda33-supply =3D <&vreg_l9a>;
> +
> +	status =3D "okay";
> +};
> +
> +&usb_2 {
> +	status =3D "okay";
> +};

[Severity: Low]
How is usb_2's role configured when it is enabled here without dr_mode or a
remote connector endpoint?

In monaco.dtsi, usb_2 defines usb-role-switch and a usb_2_dwc3_hs port
endpoint without dr_mode.  Enabling usb_2 without setting dr_mode or
linking usb_2_dwc3_hs to a connector causes dwc3_setup_role_switch() to
default the controller to device mode with no role-switch driver attached
and without dwc3_qcom_probe() enabling VBUS override.

More broadly, should carrier-dependent nodes and policies (serial aliases,
chosen stdout-path, uart6, uart7, usb_1 dr_mode, usb_2, and mdss_dp0_phy
status =3D "okay" while mdss and mdss_dp0 remain disabled) live in the
carrier board dts rather than the SoM dtsi, matching monaco-monza-som.dtsi?
Also, mdss_dp0_phy, pcie0_phy, pcie1_phy, and serdes0 are enabled in this
patch but not mentioned in the commit message.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-monaco-dra=
co-v3-0-0b603afa1328@oss.qualcomm.com?part=3D2
