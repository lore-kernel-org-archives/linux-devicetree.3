Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAFFDF59;
	Fri,  7 Aug 2026 00:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786061141; cv=none; b=PsmXGzXeY8MuqQNLdCoH/Nzqt96uhYXYRoWvGkRMA5XUar7C8i0zkA0b1Ck1Tc/mmVwrYdQhKuMSdFltLZEVwGbKFr1GJli5zR5gbWy0duI48NiJ2DXVgkmUNKa5nnf6+rCpeFV4GRCrMqE+LOAC7KA7voz2U8gur7gSi8n1tzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786061141; c=relaxed/simple;
	bh=I75MAs14r4+ww5JcUSJgVXgTy1R5j2l+3ETeMyD04n8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b0qu/4RpSPH/PVlsw/AUO9WTHoCSZJhnjDDp7z+sqtB5ZyfELFuLneKtzHXNfhq0B4eOh/SQ7ulCF/7qSgChiD+3W5F98SreXDeZu67yd3CEq2NvugSJ2m07fE14tW7jm2vitgkf7b2cXOZJVh9w8YQNSv+M66qxPuEV0AtJNpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TI4eQCuy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TI4eQCuy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABE4D1F000E9;
	Fri,  7 Aug 2026 00:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786061140;
	bh=B6VSDlLfexYURqNVnQp1Z+bN7HzipN3TVJK0yQNfyqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TI4eQCuy774qTt/BACc94tLOQilLYfMiXu5Y4K0ow7eM1ObvG4A0+ayY7ChhwiLlh
	 O3akTaynPXjHXtMePWc82UXLfCmNkkS+czL7h/+pjLsN/5ROVTTkOb3kQ9AINbxyjC
	 VUCNyerUkf69iHIzA03R8tqfwm1KFSkmUHqxcgMkWqjUBc2RIprCNEuTU8E4AdI0Bn
	 Fpa6EkAirTHfOSoCfXZo7DkOtv7Hd8C8Y4YWx8sj1Z0h8cufJngUzjeZWU6Km1BWmb
	 ucOcZhjhSHpIoMkD2y1q3sGX6xWHo9+Zom4W9Z4etzsSwPIAvBs0WiGRpRuLWe9X1n
	 UNSq31Uc3lBFw==
Date: Thu, 6 Aug 2026 19:05:37 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	venkata.valluru@oss.qualcomm.com, vishnu.saini@oss.qualcomm.com, 
	Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: hamoa-iot-evk: Add eDP display
 overlay
Message-ID: <anUgxo3BPt74Wx7K@baldur>
References: <20260806-edp_overlay_for-next-v1-0-c3aebbc81f38@oss.qualcomm.com>
 <20260806-edp_overlay_for-next-v1-1-c3aebbc81f38@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806-edp_overlay_for-next-v1-1-c3aebbc81f38@oss.qualcomm.com>

On Thu, Aug 06, 2026 at 10:01:20PM +0530, Anand Tiwari wrote:
> Move the eDP panel configuration and related power, backlight, and pinctrl
> nodes into a separate overlay. Keep the base DTB suitable for headless
> variants and provide a composite DTB for headed variants.

To quote:
https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

"""
Describe your problem. Whether your patch is a one-line bug fix or 5000
lines of a new feature, there must be an underlying problem that
motivated you to do this work. Convince the reviewer that there is a
problem worth fixing and that it makes sense for them to read past the
first paragraph.
"""

In fact, I'm not even able to guess what the problem you're fixing here.

Regards,
Bjorn

> 
> Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile               |   3 +
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtso | 126 ++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts      | 107 --------------------
>  3 files changed, 129 insertions(+), 107 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 1c86e7e98f55..bb0da34983c8 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -20,6 +20,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a16-ux3607oa.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
>  
> +hamoa-iot-evk-edp-dtbs	:= hamoa-iot-evk.dtb hamoa-iot-evk-edp.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-edp.dtb
> +
>  hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo
>  
>  dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-el2.dtb
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtso b/arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtso
> new file mode 100644
> index 000000000000..759d05342627
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtso
> @@ -0,0 +1,126 @@
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
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&pmk8550_pwm 0 5000000>;
> +		enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
> +		power-supply = <&vreg_edp_bl>;
> +
> +		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
> +		pinctrl-names = "default";
> +	};
> +
> +	vreg_edp_3p3: regulator-edp-3p3 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_EDP_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&edp_reg_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
> +	vreg_edp_bl: regulator-edp-bl {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VBL9";
> +		regulator-min-microvolt = <3600000>;
> +		regulator-max-microvolt = <3600000>;
> +
> +		gpio = <&pmc8380_3_gpios 10 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&edp_bl_reg_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +};
> +
> +&mdss_dp3 {
> +	/delete-property/ #sound-dai-cells;
> +
> +	pinctrl-0 = <&edp0_hpd_default>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +
> +	aux-bus {
> +		panel {
> +			compatible = "edp-panel";
> +
> +			backlight = <&backlight>;
> +			power-supply = <&vreg_edp_3p3>;
> +
> +			port {
> +				edp_panel_in: endpoint {
> +					remote-endpoint = <&mdss_dp3_out>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&mdss_dp3_out {
> +	data-lanes = <0 1 2 3>;
> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> +
> +	remote-endpoint = <&edp_panel_in>;
> +};
> +
> +&mdss_dp3_phy {
> +	vdda-phy-supply = <&vreg_l3j_0p8>;
> +	vdda-pll-supply = <&vreg_l2j_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&pmc8380_3_gpios {
> +	edp_bl_en: edp-bl-en-state {
> +		pins = "gpio4";
> +		function = "normal";
> +		power-source = <1>;
> +		input-disable;
> +		output-enable;
> +	};
> +
> +	edp_bl_reg_en: edp-bl-reg-en-state {
> +		pins = "gpio10";
> +		function = "normal";
> +	};
> +};
> +
> +&pmk8550_gpios {
> +	edp_bl_pwm: edp-bl-pwm-state {
> +		pins = "gpio5";
> +		function = "func3";
> +	};
> +};
> +
> +&pmk8550_pwm {
> +	status = "okay";
> +};
> +
> +&tlmm {
> +	edp_reg_en: edp-reg-en-state {
> +		pins = "gpio70";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		bias-disable;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> index 9fa86bb6438e..78cefd5391b1 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> @@ -19,16 +19,6 @@ aliases {
>  		serial1 = &uart14;
>  	};
>  
> -	backlight: backlight {
> -		compatible = "pwm-backlight";
> -		pwms = <&pmk8550_pwm 0 5000000>;
> -		enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
> -		power-supply = <&vreg_edp_bl>;
> -
> -		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
> -		pinctrl-names = "default";
> -	};
> -
>  	clocks {
>  		mcp2518fd_osc: clock-40000000 {
>  			compatible = "fixed-clock";
> @@ -213,38 +203,6 @@ pmic_glink_ss2_con_sbu_in: endpoint {
>  		};
>  	};
>  
> -	vreg_edp_3p3: regulator-edp-3p3 {
> -		compatible = "regulator-fixed";
> -
> -		regulator-name = "VREG_EDP_3P3";
> -		regulator-min-microvolt = <3300000>;
> -		regulator-max-microvolt = <3300000>;
> -
> -		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
> -		enable-active-high;
> -
> -		pinctrl-0 = <&edp_reg_en>;
> -		pinctrl-names = "default";
> -
> -		regulator-boot-on;
> -	};
> -
> -	vreg_edp_bl: regulator-edp-bl {
> -		compatible = "regulator-fixed";
> -
> -		regulator-name = "VBL9";
> -		regulator-min-microvolt = <3600000>;
> -		regulator-max-microvolt = <3600000>;
> -
> -		gpio = <&pmc8380_3_gpios 10 GPIO_ACTIVE_HIGH>;
> -		enable-active-high;
> -
> -		pinctrl-0 = <&edp_bl_reg_en>;
> -		pinctrl-names = "default";
> -
> -		regulator-boot-on;
> -	};
> -
>  	vreg_nvme: regulator-nvme {
>  		compatible = "regulator-fixed";
>  
> @@ -974,44 +932,6 @@ &mdss_dp2_out {
>  	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
>  };
>  
> -&mdss_dp3 {
> -	/delete-property/ #sound-dai-cells;
> -
> -	pinctrl-0 = <&edp0_hpd_default>;
> -	pinctrl-names = "default";
> -
> -	status = "okay";
> -
> -	aux-bus {
> -		panel {
> -			compatible = "edp-panel";
> -
> -			backlight = <&backlight>;
> -			power-supply = <&vreg_edp_3p3>;
> -
> -			port {
> -				edp_panel_in: endpoint {
> -					remote-endpoint = <&mdss_dp3_out>;
> -				};
> -			};
> -		};
> -	};
> -};
> -
> -&mdss_dp3_out {
> -	data-lanes = <0 1 2 3>;
> -	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> -
> -	remote-endpoint = <&edp_panel_in>;
> -};
> -
> -&mdss_dp3_phy {
> -	vdda-phy-supply = <&vreg_l3j_0p8>;
> -	vdda-pll-supply = <&vreg_l2j_1p2>;
> -
> -	status = "okay";
> -};
> -
>  &pcie3_port0 {
>  	vpcie12v-supply = <&vreg_pcie_12v>;
>  	vpcie3v3-supply = <&vreg_pcie_3v3>;
> @@ -1140,19 +1060,6 @@ led@2 {
>  };
>  
>  &pmc8380_3_gpios {
> -	edp_bl_en: edp-bl-en-state {
> -		pins = "gpio4";
> -		function = "normal";
> -		power-source = <1>;
> -		input-disable;
> -		output-enable;
> -	};
> -
> -	edp_bl_reg_en: edp-bl-reg-en-state {
> -		pins = "gpio10";
> -		function = "normal";
> -	};
> -
>  	pm_sde7_aux_3p3_en: pcie-aux-3p3-default-state {
>  		pins = "gpio8";
>  		function = "normal";
> @@ -1181,13 +1088,6 @@ usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
>  	};
>  };
>  
> -&pmk8550_gpios {
> -	edp_bl_pwm: edp-bl-pwm-state {
> -		pins = "gpio5";
> -		function = "func3";
> -	};
> -};
> -
>  &pmk8550_pwm {
>  	status = "okay";
>  };
> @@ -1357,13 +1257,6 @@ ec_int_n_default: ec-int-n-state {
>  		bias-disable;
>  	};
>  
> -	edp_reg_en: edp-reg-en-state {
> -		pins = "gpio70";
> -		function = "gpio";
> -		drive-strength = <16>;
> -		bias-disable;
> -	};
> -
>  	eusb3_reset_n: eusb3-reset-n-state {
>  		pins = "gpio6";
>  		function = "gpio";
> 
> -- 
> 2.54.0
> 
