Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520C23FFD;
	Fri,  7 Aug 2026 00:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786061189; cv=none; b=CgKz6KaLoBV3kHom52dUHey3TsloluZuRvey9eY6UcQVNopzL7I7UuPZiVcmfVOwNIH+JRoCk7z+0me1FW+6Apf3s8/urhJ5sxPq1/gQ30uQn/f/wOGJ2njZL5kBSYotrSi1mBrOc9YlQKY5GFtvcnZ5bYr2YHP3S3uAEnGXAQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786061189; c=relaxed/simple;
	bh=dgCqVgCL2YUsylvejkb1/6GhZ0n3bHar5/vRZPPkPJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nyjnzaI+SVyilSjIfq7KD44dJZmGSsdmPyVVXtXpUBBaxgMWCzJmMLNdK91OTmDs7oD9YzFP4WyanUjMCn65KkmNNwctf2y8jdLtzvXkTovGPFXd1MyF5ub1EIMAxe8Arn3vB9zLqEr5NJlByqGLWKEgI0U6GQolQxXf5HE/bPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S8NLKLYf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S8NLKLYf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3357E1F000E9;
	Fri,  7 Aug 2026 00:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786061187;
	bh=0cj5fEfLhvjq0e9WfHToXmikm3XkbGVNNCsETUZN5FM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S8NLKLYf6t3nEAPiilVzEqo2lQjBCQcFn0jKTduv5+519GtN4rfs67kG62KBCSBK/
	 IKcPuUm94sfJTp4pEjpip1nKWWHBB1MlXoXCoWWPbtJ6TPLcmbyokwW3mkRU4VfAZE
	 p0pFFcRwkymZMm1vdUeykAOMe3J/hIh1Ggco10C7DY97NeatgwOsEetG7a5UkXbPlv
	 shc10cYaPJP+uOIxIyGRnk3JIXSpdh/yZ4AbPv8o4OLcnngzIew3poduip56wfWzvN
	 nvftP+Axh3ISvc1zBN1ttQXiO8w/Tr8LAkT6olmv/z7fa7fv9pl8eoSZpVa/5SY7Ub
	 0QA5gZf06uTXg==
Date: Thu, 6 Aug 2026 19:06:24 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	venkata.valluru@oss.qualcomm.com, vishnu.saini@oss.qualcomm.com, 
	Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: purwa-iot-evk: Add eDP display
 overlay
Message-ID: <anUhYybtYglbk2kD@baldur>
References: <20260806-edp_overlay_for-next-v1-0-c3aebbc81f38@oss.qualcomm.com>
 <20260806-edp_overlay_for-next-v1-2-c3aebbc81f38@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806-edp_overlay_for-next-v1-2-c3aebbc81f38@oss.qualcomm.com>

On Thu, Aug 06, 2026 at 10:01:21PM +0530, Anand Tiwari wrote:
> Move the eDP panel configuration and related power, backlight, and pinctrl
> nodes into a separate overlay. Keep the base DTB suitable for headless
> variants and provide a composite DTB for headed variants.
> 

Why?

> Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile               |   3 +
>  arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtso | 126 ++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/purwa-iot-evk.dts      | 107 --------------------
>  3 files changed, 129 insertions(+), 107 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index bb0da34983c8..fc954da58402 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -165,6 +165,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-poplar.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-xiaomi-sagit.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= purwa-iot-evk.dtb
>  
> +purwa-iot-evk-edp-dtbs	:= purwa-iot-evk.dtb purwa-iot-evk-edp.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= purwa-iot-evk-edp.dtb
> +
>  purwa-iot-evk-el2-dtbs	:= purwa-iot-evk.dtb x1-el2.dtbo
>  
>  dtb-$(CONFIG_ARCH_QCOM)	+= purwa-iot-evk-el2.dtb
> diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtso b/arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtso
> new file mode 100644
> index 000000000000..759d05342627
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtso
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
> diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
> index ad503beec1d3..6dde925025dd 100644
> --- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
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
>  	wcd938x: audio-codec {
>  		compatible = "qcom,wcd9385-codec";
>  
> @@ -205,38 +195,6 @@ pmic_glink_ss2_con_sbu_in: endpoint {
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
> @@ -962,44 +920,6 @@ &mdss_dp2_out {
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
> @@ -1128,19 +1048,6 @@ led@2 {
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
> @@ -1169,13 +1076,6 @@ usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
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
> @@ -1326,13 +1226,6 @@ right_tweeter: speaker@0,1 {
>  };
>  
>  &tlmm {
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
