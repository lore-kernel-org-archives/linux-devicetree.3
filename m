Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF1B377550;
	Fri,  7 Aug 2026 21:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786136470; cv=none; b=F6Fv/+Pbe2G74bp1s05VM/2RLa4qdYhNCv17GnUsQMOWCgfUYZoCNbljs4tq4RrBYymW4IdlHtmNkpNPCD2fmGAMUE+xBY+owrJllTCX+tj00LqGDXJ6AltzI9pKtqq43Mlp5jiBLOCZkYYnoPdCunydcWG3e4eJUxqoaeCeN3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786136470; c=relaxed/simple;
	bh=87VhXFDC2uCgKGAMWGlleLshi0LRG0Ii+LqeVucFeQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AfdDNOZHvr4xL9+WQ5RM63iuRG6aTHZaWNuHt/muNvh+nNLOzDK4Dd21jqRL3k9mbwtxec6oTohm+N1BsnaOkqbS99iHKXifc9vy94zLResMNDtvAdTUrtsGmfb+YNJHCHvC3ZUz10Va8zvU9MM85BqVPGGG/etMKt2hANy8IRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SbMePo1D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SbMePo1D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 394441F000E9;
	Fri,  7 Aug 2026 21:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786136469;
	bh=myke7JTcpzi28iGxilPsvjZOztGazfDff+ABM0AekWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SbMePo1Dip36uXgm0cLxMqMwZp9478sF/ikjr/fRN4uVlVRmoWgr7UZGM2u66ayDG
	 lkbkYIW34rwE6HeqrwHOMccwIMHCLjcfmvSKCRcEyYd8n3+SlGYGYeBGWWWFWkOLDx
	 RTbhmAjxDzRvVdGnfZVak9kTNXRxpHgv9NR3hYNHvLzogsxxy0eaMbHkcpgjFxpEgY
	 fWJ0cDxy6F/11j9DruWvpESlPi53IkIQ2wWQGVBgRWgD4KsCQwmtdeyeEJe5BN+60z
	 dBbr3ZFdyh5RGa/UZwpbQfJAiWxPchNmb4zUKSxPP5WF2kPTjFVElFSrPp4YQDNomj
	 SWZ6EntaYZbLg==
Date: Fri, 7 Aug 2026 16:01:05 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	venkata.valluru@oss.qualcomm.com, vishnu.saini@oss.qualcomm.com, 
	Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: hamoa-iot-evk: Add eDP display
 overlay
Message-ID: <anZGDietz47mE2wp@baldur>
References: <20260806-edp_overlay_for-next-v1-0-c3aebbc81f38@oss.qualcomm.com>
 <20260806-edp_overlay_for-next-v1-1-c3aebbc81f38@oss.qualcomm.com>
 <anUgxo3BPt74Wx7K@baldur>
 <anWsrXO9RztrF5H4@hu-anantiwa-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anWsrXO9RztrF5H4@hu-anantiwa-hyd.qualcomm.com>

On Fri, Aug 07, 2026 at 03:30:13PM +0530, Anand Tiwari wrote:
> On Thu, Aug 06, 2026 at 07:05:37PM -0500, Bjorn Andersson wrote:
> > On Thu, Aug 06, 2026 at 10:01:20PM +0530, Anand Tiwari wrote:
> > > Move the eDP panel configuration and related power, backlight, and pinctrl
> > > nodes into a separate overlay. Keep the base DTB suitable for headless
> > > variants and provide a composite DTB for headed variants.
> > 
> > To quote:
> > https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> > 
> > """
> > Describe your problem. Whether your patch is a one-line bug fix or 5000
> > lines of a new feature, there must be an underlying problem that
> > motivated you to do this work. Convince the reviewer that there is a
> > problem worth fixing and that it makes sense for them to read past the
> > first paragraph.
> > """
> > 
> > In fact, I'm not even able to guess what the problem you're fixing here.
> > 
> > Regards,
> > Bjorn
> >
> 
> The problem is that the base device trees currently describe the eDP
> display hardware unconditionally. However, Hamoa and Purwa IoT EVKs
> are also available in headless variants without an eDP panel.
> 
> With current base DTBs, headless variants are not stable where eDP panel is not
> physically connected with board and userspace is trying to use it.
> 
> This series fixes the inaccurate hardware description by keeping the
> base DTBs limited to hardware common to both variants and moving the
> eDP-specific nodes into separate overlays. The base DTB can therefore
> be used for headless variants, while the overlay is selected for
> headed variants.
>  

I see, then it seems your change does make sense. I don't understand why
you didn't explained this in the commit message though.


I further do not understand how it can be that nobody noticed that the
display was missing on their Hamoa EVK during the 11 months since I
merged the offending patch - this is completely unacceptable.

Regards,
Bjorn

> > > 
> > > Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/Makefile               |   3 +
> > >  arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtso | 126 ++++++++++++++++++++++++
> > >  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts      | 107 --------------------
> > >  3 files changed, 129 insertions(+), 107 deletions(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > > index 1c86e7e98f55..bb0da34983c8 100644
> > > --- a/arch/arm64/boot/dts/qcom/Makefile
> > > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > > @@ -20,6 +20,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a16-ux3607oa.dtb
> > >  dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
> > >  dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
> > >  
> > > +hamoa-iot-evk-edp-dtbs	:= hamoa-iot-evk.dtb hamoa-iot-evk-edp.dtbo
> > > +dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-edp.dtb
> > > +
> > >  hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo
> > >  
> > >  dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-el2.dtb
> > > diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtso b/arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtso
> > > new file mode 100644
> > > index 000000000000..759d05342627
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtso
> > > @@ -0,0 +1,126 @@
> > > +// SPDX-License-Identifier: BSD-3-Clause
> > > +/*
> > > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > > + */
> > > +
> > > +/dts-v1/;
> > > +/plugin/;
> > > +
> > > +#include <dt-bindings/gpio/gpio.h>
> > > +
> > > +&{/} {
> > > +	backlight: backlight {
> > > +		compatible = "pwm-backlight";
> > > +		pwms = <&pmk8550_pwm 0 5000000>;
> > > +		enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
> > > +		power-supply = <&vreg_edp_bl>;
> > > +
> > > +		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
> > > +		pinctrl-names = "default";
> > > +	};
> > > +
> > > +	vreg_edp_3p3: regulator-edp-3p3 {
> > > +		compatible = "regulator-fixed";
> > > +
> > > +		regulator-name = "VREG_EDP_3P3";
> > > +		regulator-min-microvolt = <3300000>;
> > > +		regulator-max-microvolt = <3300000>;
> > > +
> > > +		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
> > > +		enable-active-high;
> > > +
> > > +		pinctrl-0 = <&edp_reg_en>;
> > > +		pinctrl-names = "default";
> > > +
> > > +		regulator-boot-on;
> > > +	};
> > > +
> > > +	vreg_edp_bl: regulator-edp-bl {
> > > +		compatible = "regulator-fixed";
> > > +
> > > +		regulator-name = "VBL9";
> > > +		regulator-min-microvolt = <3600000>;
> > > +		regulator-max-microvolt = <3600000>;
> > > +
> > > +		gpio = <&pmc8380_3_gpios 10 GPIO_ACTIVE_HIGH>;
> > > +		enable-active-high;
> > > +
> > > +		pinctrl-0 = <&edp_bl_reg_en>;
> > > +		pinctrl-names = "default";
> > > +
> > > +		regulator-boot-on;
> > > +	};
> > > +};
> > > +
> > > +&mdss_dp3 {
> > > +	/delete-property/ #sound-dai-cells;
> > > +
> > > +	pinctrl-0 = <&edp0_hpd_default>;
> > > +	pinctrl-names = "default";
> > > +
> > > +	status = "okay";
> > > +
> > > +	aux-bus {
> > > +		panel {
> > > +			compatible = "edp-panel";
> > > +
> > > +			backlight = <&backlight>;
> > > +			power-supply = <&vreg_edp_3p3>;
> > > +
> > > +			port {
> > > +				edp_panel_in: endpoint {
> > > +					remote-endpoint = <&mdss_dp3_out>;
> > > +				};
> > > +			};
> > > +		};
> > > +	};
> > > +};
> > > +
> > > +&mdss_dp3_out {
> > > +	data-lanes = <0 1 2 3>;
> > > +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> > > +
> > > +	remote-endpoint = <&edp_panel_in>;
> > > +};
> > > +
> > > +&mdss_dp3_phy {
> > > +	vdda-phy-supply = <&vreg_l3j_0p8>;
> > > +	vdda-pll-supply = <&vreg_l2j_1p2>;
> > > +
> > > +	status = "okay";
> > > +};
> > > +
> > > +&pmc8380_3_gpios {
> > > +	edp_bl_en: edp-bl-en-state {
> > > +		pins = "gpio4";
> > > +		function = "normal";
> > > +		power-source = <1>;
> > > +		input-disable;
> > > +		output-enable;
> > > +	};
> > > +
> > > +	edp_bl_reg_en: edp-bl-reg-en-state {
> > > +		pins = "gpio10";
> > > +		function = "normal";
> > > +	};
> > > +};
> > > +
> > > +&pmk8550_gpios {
> > > +	edp_bl_pwm: edp-bl-pwm-state {
> > > +		pins = "gpio5";
> > > +		function = "func3";
> > > +	};
> > > +};
> > > +
> > > +&pmk8550_pwm {
> > > +	status = "okay";
> > > +};
> > > +
> > > +&tlmm {
> > > +	edp_reg_en: edp-reg-en-state {
> > > +		pins = "gpio70";
> > > +		function = "gpio";
> > > +		drive-strength = <16>;
> > > +		bias-disable;
> > > +	};
> > > +};
> > > diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> > > index 9fa86bb6438e..78cefd5391b1 100644
> > > --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> > > +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> > > @@ -19,16 +19,6 @@ aliases {
> > >  		serial1 = &uart14;
> > >  	};
> > >  
> > > -	backlight: backlight {
> > > -		compatible = "pwm-backlight";
> > > -		pwms = <&pmk8550_pwm 0 5000000>;
> > > -		enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
> > > -		power-supply = <&vreg_edp_bl>;
> > > -
> > > -		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
> > > -		pinctrl-names = "default";
> > > -	};
> > > -
> > >  	clocks {
> > >  		mcp2518fd_osc: clock-40000000 {
> > >  			compatible = "fixed-clock";
> > > @@ -213,38 +203,6 @@ pmic_glink_ss2_con_sbu_in: endpoint {
> > >  		};
> > >  	};
> > >  
> > > -	vreg_edp_3p3: regulator-edp-3p3 {
> > > -		compatible = "regulator-fixed";
> > > -
> > > -		regulator-name = "VREG_EDP_3P3";
> > > -		regulator-min-microvolt = <3300000>;
> > > -		regulator-max-microvolt = <3300000>;
> > > -
> > > -		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
> > > -		enable-active-high;
> > > -
> > > -		pinctrl-0 = <&edp_reg_en>;
> > > -		pinctrl-names = "default";
> > > -
> > > -		regulator-boot-on;
> > > -	};
> > > -
> > > -	vreg_edp_bl: regulator-edp-bl {
> > > -		compatible = "regulator-fixed";
> > > -
> > > -		regulator-name = "VBL9";
> > > -		regulator-min-microvolt = <3600000>;
> > > -		regulator-max-microvolt = <3600000>;
> > > -
> > > -		gpio = <&pmc8380_3_gpios 10 GPIO_ACTIVE_HIGH>;
> > > -		enable-active-high;
> > > -
> > > -		pinctrl-0 = <&edp_bl_reg_en>;
> > > -		pinctrl-names = "default";
> > > -
> > > -		regulator-boot-on;
> > > -	};
> > > -
> > >  	vreg_nvme: regulator-nvme {
> > >  		compatible = "regulator-fixed";
> > >  
> > > @@ -974,44 +932,6 @@ &mdss_dp2_out {
> > >  	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> > >  };
> > >  
> > > -&mdss_dp3 {
> > > -	/delete-property/ #sound-dai-cells;
> > > -
> > > -	pinctrl-0 = <&edp0_hpd_default>;
> > > -	pinctrl-names = "default";
> > > -
> > > -	status = "okay";
> > > -
> > > -	aux-bus {
> > > -		panel {
> > > -			compatible = "edp-panel";
> > > -
> > > -			backlight = <&backlight>;
> > > -			power-supply = <&vreg_edp_3p3>;
> > > -
> > > -			port {
> > > -				edp_panel_in: endpoint {
> > > -					remote-endpoint = <&mdss_dp3_out>;
> > > -				};
> > > -			};
> > > -		};
> > > -	};
> > > -};
> > > -
> > > -&mdss_dp3_out {
> > > -	data-lanes = <0 1 2 3>;
> > > -	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> > > -
> > > -	remote-endpoint = <&edp_panel_in>;
> > > -};
> > > -
> > > -&mdss_dp3_phy {
> > > -	vdda-phy-supply = <&vreg_l3j_0p8>;
> > > -	vdda-pll-supply = <&vreg_l2j_1p2>;
> > > -
> > > -	status = "okay";
> > > -};
> > > -
> > >  &pcie3_port0 {
> > >  	vpcie12v-supply = <&vreg_pcie_12v>;
> > >  	vpcie3v3-supply = <&vreg_pcie_3v3>;
> > > @@ -1140,19 +1060,6 @@ led@2 {
> > >  };
> > >  
> > >  &pmc8380_3_gpios {
> > > -	edp_bl_en: edp-bl-en-state {
> > > -		pins = "gpio4";
> > > -		function = "normal";
> > > -		power-source = <1>;
> > > -		input-disable;
> > > -		output-enable;
> > > -	};
> > > -
> > > -	edp_bl_reg_en: edp-bl-reg-en-state {
> > > -		pins = "gpio10";
> > > -		function = "normal";
> > > -	};
> > > -
> > >  	pm_sde7_aux_3p3_en: pcie-aux-3p3-default-state {
> > >  		pins = "gpio8";
> > >  		function = "normal";
> > > @@ -1181,13 +1088,6 @@ usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
> > >  	};
> > >  };
> > >  
> > > -&pmk8550_gpios {
> > > -	edp_bl_pwm: edp-bl-pwm-state {
> > > -		pins = "gpio5";
> > > -		function = "func3";
> > > -	};
> > > -};
> > > -
> > >  &pmk8550_pwm {
> > >  	status = "okay";
> > >  };
> > > @@ -1357,13 +1257,6 @@ ec_int_n_default: ec-int-n-state {
> > >  		bias-disable;
> > >  	};
> > >  
> > > -	edp_reg_en: edp-reg-en-state {
> > > -		pins = "gpio70";
> > > -		function = "gpio";
> > > -		drive-strength = <16>;
> > > -		bias-disable;
> > > -	};
> > > -
> > >  	eusb3_reset_n: eusb3-reset-n-state {
> > >  		pins = "gpio6";
> > >  		function = "gpio";
> > > 
> > > -- 
> > > 2.54.0
> > > 
