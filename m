Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353769;
	b=oWgy16F5Orxf/PF4cBMIUxrhaK+MBrxk7mSRVRQAf4JlP6f7sMmrsS9KyKkaWS6+O8FR
	 4cwFgFYpEs9hy/6JcMXMm5PnqsAHYMK+o6apLD588XjNbwV3AsdN6gL5xFvi4lAbeLHwP
	 shjGP0z08qgKGyntdK/WhjyguScEk39+lmcv0Et29aRkQDIP3zIzNfoCS5xziXAdc01ib
	 w4r1DACyxmAzTvPkJKhQyD72/HJIEToZbNzyg5A25FSr187g8e2Kc9gnsCkfcZUpgSZqt
	 +qeuza8AQAwn227sF3YyJcARD09U6ugWAZkgMblTaJNUNRDwa5stSFw1LLMGfwHzA9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353769;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+Djq0UrAjxEnhi88a35pTPUpEbr83K3EKFbTTgXgvFc=;
	b=O/PwobwsavdYuLypkDX5YrUX2lsLXb38g9iZZ+k8PGmNXl0pjAxsmL2EGIbjMaNR8VdF
	 p+GLd5+awG0VFCJy2PITyz1BL0k3/0zOluJkaXw7spMWZyD1cWXeX7Qvty2Q1FrxAu3jy
	 C+6TQOaFggtr+QZ2CgCC1iznN9Y6b8PJQ9fENdx2PtwNEbvJPP+NkjRg3aBGpsV4UFzM1
	 xLW0AtaJtwon73HgJEsBva3oEH4l0iSMQmLvoJ8UwKoAT4aWw/QOsg1WKN2RHAoe6VSI/
	 bcwjhF3hhWOT+RTFZkhm7JCh4TFmThEc2SFMo+yD9hlo/iAi5U3O3ySJ54yzM7IZmGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H75teZRI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5264D60A2610
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 09:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H75teZRI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A47CE1F00A15;
	Fri, 30 Oct 2026 09:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793353768;
	bh=+Djq0UrAjxEnhi88a35pTPUpEbr83K3EKFbTTgXgvFc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H75teZRIUZ5VRP880t5U7Dv1RElHAnc9MRRcEKiFIUyUhQglFQYdf9GmU/SnFXAeX
	 Nfp5XeS1Aiok7btLWfpmmzD8k5/p7Aojn8/sEXyf8Hw8Dj0Z/OOpwU7j1T+nx82drf
	 5QwhZNmhbu0G0Sy4d0Ow/i+tNuPHLf/0jsqlJAlJFW3pffCyTMVsYIHxqRbRBdAfS4
	 4spu4XqWV8SPcNOfwrNLdRCvXjtrkd/aBpBqS9w5Vp4FiKSlemJYRVgrzbF5RQJ/7G
	 o2PnFnl1aPS8Y9bFqnDN0Ji4ouF+PzW87eR4mY6wESMah3ae6nMlVOPsUTrejOXqM1
	 2ojO1umLHDLUQ==
Message-ID: <sashiko-outbox-190777@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/6] arm64: dts: qcom: talos-lyra-evk: Add LT9611UXD
 HDMI bridge support
Reply-To: sashiko-reviews@lists.linux.dev
To: anand.tiwari@oss.qualcomm.com
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261030-lyra-display-upstream-post-v2-1-906302159392@oss.qualcomm.com>
References: <20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com>
 <20261030-lyra-display-upstream-post-v2-1-906302159392@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 09:49:28 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] arm64: dts: qcom: talos-lyra-evk: swapped DSI supplies and inval=
id vdds-supply
- [Low] arm64: dts: qcom: talos-lyra-evk: duplicate tlmm node and unused he=
ader
--

commit 22e8de3b84d3ac4983c9f5f3821155bfe2321465
Author: Mohit Dsor <mohit.dsor@oss.qualcomm.com>

arm64: dts: qcom: talos-lyra-evk: Add LT9611UXD HDMI bridge support

This commit adds device tree support for the Lontium LT9611UXD DSI-to-HDMI
bridge on the Talos Lyra EVK carrier board, connected via I2C2 and MDSS
DSI0.

> diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts b/arch/arm64/boo=
t/dts/qcom/talos-lyra-evk.dts
> index d4468e6099112..eeb8e903b03b1 100644
> --- a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
> @@ -4,6 +4,8 @@
>   */
>  /dts-v1/;
> =20
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include "talos-lyra-evk-som.dtsi"

[ ... ]

> @@ -74,6 +139,23 @@ &mdss_dp0_out {
>  	remote-endpoint =3D <&dp0_connector_in>;
>  };
> =20
> +&mdss_dsi0 {
> +	vdda-supply =3D <&vreg_l5a>;
> +
> +	status =3D "okay";
> +};
> +
> +&mdss_dsi0_out {
> +	remote-endpoint =3D <&hdmi_bridge_in>;
> +	data-lanes =3D <0 1 2 3>;
> +};
> +
> +&mdss_dsi0_phy {
> +	vdds-supply =3D <&vreg_l11a>;
> +
> +	status =3D "okay";
> +};

[Severity: Medium]
Are the regulator supplies for mdss_dsi0 and mdss_dsi0_phy swapped here, and
should mdss_dsi0_phy use vcca-supply instead of vdds-supply?

In arch/arm64/boot/dts/qcom/talos.dtsi, mdss_dsi0_phy uses compatible
qcom,sm6150-dsi-phy-14nm. The schema in
Documentation/devicetree/bindings/phy/qcom,dsi-phy-14nm.yaml sets
unevaluatedProperties: false and only defines vcca-supply, not vdds-supply:

  vcca-supply:
    description: Phandle to vcca regulator device node.

In drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c, the 14nm PHY driver never
requests vdds, so devm_regulator_bulk_get_const() in dsi_phy_driver_probe()
ignores vdds-supply and falls back to a dummy regulator, leaving vreg_l11a
with no consumers.

Furthermore, in arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi, vreg_l5a
is the 0.88V LDO5 rail and vreg_l11a is the 1.2V LDO11 rail. In
drivers/gpu/drm/msm/dsi/dsi_cfg.c (dsi_v2_4_regulators), the DSI controller
expects vdda to be the 1.2V rail, and other QCS615/Talos boards such as
arch/arm64/boot/dts/qcom/talos-evk-som.dtsi and
arch/arm64/boot/dts/qcom/qcs615-ride.dts wire these as:

&mdss_dsi0 {
	vdda-supply =3D <&vreg_l11a>;
	status =3D "okay";
};

&mdss_dsi0_phy {
	vcca-supply =3D <&vreg_l5a>;
	status =3D "okay";
};

> =20
>  &pon_pwrkey {
>  	status =3D "okay";
>  };
> @@ -113,3 +195,26 @@ &usb_2 {
> =20
>  	status =3D "okay";
>  };
> +
> +&tlmm {
> +	lcd_bias_en: lcd-bias-en-state {
> +		pins =3D "gpio3";
> +		function =3D "gpio";
> +		drive-strength =3D <8>;
> +		bias-disable;
> +	};
> +
> +	bridge_irq_pin: bridge-irq-state {
> +		pins =3D "gpio60";
> +		function =3D "gpio";
> +		drive-strength =3D <2>;
> +		bias-disable;
> +	};
> +
> +	bridge_rst_pin: bridge-rst-state {
> +		pins =3D "gpio61";
> +		function =3D "gpio";
> +		drive-strength =3D <8>;
> +		bias-disable;
> +	};
> +};

[Severity: Low]
This isn't a bug, but arch/arm64/boot/dts/qcom/talos-lyra-evk.dts already
has a &tlmm node ordered alphabetically between &spi6 and &usb_1:

&tlmm {
	dp_hot_plug_det: dp-hot-plug-det-state {
		pins =3D "gpio104";
		function =3D "dp_hot";
		bias-disable;
	};
};

Could lcd_bias_en, bridge_irq_pin, and bridge_rst_pin be merged into the
existing &tlmm node rather than adding a second &tlmm block at the end of
the file?

Also, the newly added dt-bindings/pinctrl/qcom,pmic-gpio.h include at the
top of the file appears to be unused (and dt-bindings/gpio/gpio.h is already
included via talos-lyra-evk-som.dtsi). Could the unused header be dropped?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-lyra-displ=
ay-upstream-post-v2-0-906302159392@oss.qualcomm.com?part=3D1
