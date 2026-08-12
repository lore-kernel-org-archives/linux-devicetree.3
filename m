Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5947D399CF5
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 13:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786539890; cv=none; b=hBItEs3I55Myi1jAACYP/4rHkMCh781EI+xelqTlM41iPF9I41JScoeXJCy4uBdXanYKCASyJ5Q+DOfFIfCnC3z3JjRMq/5wWHWeM75l0RMJcCZ21UBfkd5WqeaLA6NnawZivg0SdU7i9UsZvWlDWCIYix2OsXb58WTeasIxZgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786539890; c=relaxed/simple;
	bh=lvkugMNRGkTl3R4aNvKM9UmHoGYoOodA2qYMhuTQNag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sltwoQ0PqPzrq6+RjxiU8d5nw5jXS5PWuZ85xls8zEpNkGgbTRQJTGMWouAWeXzv01qcby7ziuLrAlMDn/t0RbU2ORNaJfcSQg/xIajbUVhwZyOsIQ7skru262r0eFhdQ2Hn7C5fzxeA7OSprovlv+KgHJDR7Q5Jdp8XL0BOknY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=mgUuOEJo; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="mgUuOEJo"
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 770783FC28
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 13:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1786539878;
	bh=YoEAnlEI6VwAqN1Yy5Qd9cupkEPTQFSiMpVm1mpkLwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=mgUuOEJonePa1XfZ+duyl3RYar8upH8+rocbhHtklfCI5vSjRPX0Jge4o8MvZPa/1
	 bMalHKDsvc9ufwDIf+2GwPM0rRsGW0JfL3YA9oCerDImhLH1WQc589qWnB2Z5P2vab
	 eO0ahWXwYI2QhEgrLLugrVKzQz162JEsrulpUIpM82p/LNZ5gjxOX2vag2El3Jjm0p
	 FTBP5iBvz8IhllCjRnNpY6NoCrvseyXrnJYp6+Bc6piXmbyNrI6CaAuzErMZEDdCiE
	 TS08ToW23wfzgcoMI+4xH22UbglVHuNJ/LFvHYI/Di1ZblkDH1E7S3LT1FcdelwwM5
	 tXjsDIWLrbAWFR/QGYoajlZkaxU6S7EVK1ptUGmYfmYsg0yjV+8knYYfSm+Hv8e+uV
	 /ZA+i0pxHKNIILZCNCAFpGiHvpbNHGOjF+EmtP+uUCFwkRfWWRKyGyb3QCYnNpsTrW
	 vXpqR2/L3qZZpuS9H6ubuEa/q2oEbTNAU4JAgoAMAkLIQIzYHQxj9Fj2CwKl87bRGU
	 V5ViPOVF+z/fTGD1kk8gfGU+9c8cU7NRDG9gPvJfMMuuetF6dxrC05VOyu35voNXP4
	 O2XsuipvPIZ6GEGwZTL/6z4VsyMABkFbc0dtIuH/tZM998eyw79VahPgzo+rdDaxHl
	 zRHVCerHQFkkpAiz9f5FOxEc=
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-495474a5fbcso8828205e9.1
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 06:04:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786539877; x=1787144677;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YoEAnlEI6VwAqN1Yy5Qd9cupkEPTQFSiMpVm1mpkLwY=;
        b=Jrq1jNkBvH3/Qgx0a87h/qrJE4owLa5p/3fsgsDrk8jueyMDWp4Gb5boBpXIkAs77a
         dZxh9XcGa6lzA0W5KTTJF5/g8oOaLaI1eChZo6rmN9GLI26t0jRR3IYkh/JiCtQm25Op
         CpGUjV6P1LAemDUKnEejQq+nsQCUPoVW5J23yY/0rRsCwJEUhYWww4DVLKo0w255c/Wj
         ACXGm2AUohK1Kmrwi1I62lYWLHi1RfFVNBb4L15GxH99ZLXmHJsWQbgRe1+LmKdc59s/
         JIy0GjG+NeJxkgMUujC93eyBa9qACCCSCgthElSVAKq2D+YGSQU2HUI7I4mipSHnYuc3
         kWDw==
X-Forwarded-Encrypted: i=1; AHgh+RqEcu6U3RQa8+oA8mL0p0Pq01Lx8ICdler/VgSs+BdacLcA3MwXvUKcKRuRkwp7XvajWcMidKzWemb3@vger.kernel.org
X-Gm-Message-State: AOJu0YzPHXs8DK0adijK0HfexqxYHkYqnzBwomkYW8FzzGqAKSl8ylnC
	gFSW8khHK5lEU1x6HrZTZwP1FIbE+U1zQnl2OVi9vmZpfy7WrOyWcokiY+bLovYAi4yxdXtNTQZ
	cj9fIn/9zUjlIvHepkE5Z7iUP80KaCqrQ+CHU4Rn4OAn8+mYoEqcmSyTHdzUbxPV0apx94y5j/3
	6/StQ=
X-Gm-Gg: AR+sD13ToXCd1oHc06YhNe01/M0h5cmvgscLELLUPEtI8GFG8rjdv1kGQ+jUaiAC3O4
	b73s0BkaxN8i98nhCGfZwlnUG4Wh1Opo7MC0CliOAfAgV0cvpVHr/Cilw6OyzPBVjlWPfdvA5Sz
	5QZTiMtq9UMvLVLUC4mT1ynyhZz0gBU6S9xItN04f2Vd9+w+9xlDhEk7ro2nxL3R1bqGwYDQBTW
	b+1DYfgwHygiyDSHDNaMiwPdHVjYwJTNW0+VrM9rOeLyjhF3y22JG7DcPe8fr/k6/sM2jAy7VRe
	3Llyic/RqbQZA4cpk7LpBs+saBnf9k6kyJTpwavRZodSVHfU4bZhlsvXKxT0//AmaFlYCtZVYpe
	WNfZbLo89YSRVetR0
X-Received: by 2002:a05:600c:1d03:b0:499:7ce1:d8af with SMTP id 5b1f17b1804b1-4997ce1db38mr51687405e9.1.1786539877159;
        Wed, 12 Aug 2026 06:04:37 -0700 (PDT)
X-Received: by 2002:a05:600c:1d03:b0:499:7ce1:d8af with SMTP id 5b1f17b1804b1-4997ce1db38mr51686355e9.1.1786539876563;
        Wed, 12 Aug 2026 06:04:36 -0700 (PDT)
Received: from shodan.l0w.de ([2001:a61:3564:e001:b55e:8ad8:808b:316b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997c98ce0bsm48701305e9.11.2026.08.12.06.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 06:04:35 -0700 (PDT)
Date: Wed, 12 Aug 2026 15:04:33 +0200
From: Tobias Heider <tobias.heider@canonical.com>
To: Jason Pettit <jason.pettit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Akhil P Oommen <akhilpo@oss.qualcomm.com>, Mahadevan P <mahadevan.p@oss.qualcomm.com>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
	Ananthu C V <ananthu.cv@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
Message-ID: <anxt-erf4ZVi_zff@shodan.l0w.de>
References: <20260809-glymur-send-v3-0-2d1ed10e3a89@oss.qualcomm.com>
 <20260809-glymur-send-v3-2-2d1ed10e3a89@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260809-glymur-send-v3-2-2d1ed10e3a89@oss.qualcomm.com>

On Sun, Aug 09, 2026 at 02:29:22PM -0700, Jason Pettit wrote:
> Add board support for the HP EliteBook X G2q 14" Next Gen AI PC
> (product SKU C4JG0AV, board 8E91), a Snapdragon X2 Elite (Glymur)
> laptop, using the "hp,elitebook-x-g2q" / "qcom,glymur" compatible.
> 
> Enabled by this device tree:
> 
>   - internal eDP panel (samsung,atna33xc20)
>   - 2x USB Type-C with DisplayPort alt-mode and USB
>   - chassis HDMI output
>   - chassis USB-A host port (usb_mp multiport controller)
>   - internal eUSB2 host with the Elan fingerprint reader
>   - NVMe SSD on PCIe5
>   - Wi-Fi and Bluetooth
>   - HID-over-I2C keyboard, touchpad, touchscreen; lid switch
>   - Adreno GPU and GMU (Freedreno GL on Mesa)
>   - audio playback and capture
>   - real-time clock
>   - compute DSP (cDSP)
> 
> The HDMI jack is driven by a power-only DisplayPort-to-HDMI LSPCON on
> the usb_2 combo-PHY DP lanes rather than being a third USB-C port; HPD
> is on gpio126. The LSPCON is on an I/O sub-board with no I2C/AUX control
> path, so it is modelled with the generic simple-bridge "parade,ps185hdm"
> compatible used by the in-tree x1e80100 HDMI-bridge boards (the exact
> bridge part is unconfirmed) and it needs CONFIG_DRM_SIMPLE_BRIDGE.
> 
> The &gpu/&gmu enable, the audio nodes and &remoteproc_soccp opt into
> glymur.dtsi SoC nodes that are still in-flight; those series are
> declared as prerequisites in the cover letter.
> 
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>  .../boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts    | 1039 ++++++++++++++++++++
>  2 files changed, 1040 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 1c86e7e98f55..146955de4606 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -18,6 +18,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a16-ux3607oa.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= glymur-hp-elitebook-x-g2q.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
>  
>  hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo
> diff --git a/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts b/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts
> new file mode 100644
> index 000000000000..8d0fe276bf83
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts
> @@ -0,0 +1,1039 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +/dts-v1/;
> +
> +#include "glymur.dtsi"
> +
> +#include "pmcx0102.dtsi"        /* SPMI0: SID-2/3 SPMI1: SID-2/3 */
> +#include "pmh0101.dtsi"         /* SPMI0: SID-1                  */
> +#include "pmh0110-glymur.dtsi"  /* SPMI0: SID-5/7 SPMI1: SID-5   */
> +#include "pmh0104-glymur.dtsi"  /* SPMI0: SID-8/9 SPMI1: SID-11  */
> +#include "pmk8850.dtsi"         /* SPMI0: SID-0                  */
> +#include "smb2370.dtsi"         /* SPMI2: SID-9/10               */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/gpio-keys.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
> +
> +/ {
> +	model = "HP EliteBook X G2q 14 AI";
> +	compatible = "hp,elitebook-x-g2q", "qcom,glymur";
> +
> +	aliases {
> +		serial1 = &uart14;
> +	};
> +
> +	clocks {
> +		xo_board: xo-board {
> +			compatible = "fixed-clock";
> +			clock-frequency = <38400000>;
> +			#clock-cells = <0>;
> +		};
> +
> +		sleep_clk: sleep-clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <32000>;
> +			#clock-cells = <0>;
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-0 = <&lid_default>;
> +		pinctrl-names = "default";
> +
> +		switch-lid {
> +			label = "lid";
> +			gpios = <&tlmm 92 GPIO_ACTIVE_LOW>;
> +			linux,input-type = <EV_SW>;
> +			linux,code = <SW_LID>;
> +			wakeup-source;
> +			wakeup-event-action = <EV_ACT_DEASSERTED>;
> +		};
> +	};
> +
> +	hdmi-bridge {
> +		compatible = "parade,ps185hdm";
> +
> +		pinctrl-0 = <&usb2_dp_hot_plug_detect>;
> +		pinctrl-names = "default";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				hdmi_bridge_in: endpoint {
> +					remote-endpoint = <&usb_2_qmpphy_out_dp>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				hdmi_bridge_out: endpoint {
> +					remote-endpoint = <&hdmi_con>;
> +				};
> +			};
> +		};
> +	};
> +
> +	hdmi-connector {
> +		compatible = "hdmi-connector";
> +		type = "a";
> +
> +		port {
> +			hdmi_con: endpoint {
> +				remote-endpoint = <&hdmi_bridge_out>;
> +			};
> +		};
> +	};
> +
> +	pmic-glink {
> +		compatible = "qcom,glymur-pmic-glink",
> +			     "qcom,pmic-glink";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		/* Left side port */
> +		connector@0 {
> +			compatible = "usb-c-connector";
> +			reg = <0>;
> +			power-role = "dual";
> +			data-role = "dual";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					pmic_glink_hs_in: endpoint {
> +						remote-endpoint = <&usb_0_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					pmic_glink_ss_in: endpoint {
> +						remote-endpoint = <&usb_0_qmpphy_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		/* Right side port */
> +		connector@1 {
> +			compatible = "usb-c-connector";
> +			reg = <1>;
> +			power-role = "dual";
> +			data-role = "dual";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					pmic_glink_hs_in1: endpoint {
> +						remote-endpoint = <&usb_1_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					pmic_glink_ss_in1: endpoint {
> +						remote-endpoint = <&usb_1_qmpphy_out>;
> +					};
> +				};
> +			};
> +		};
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
> +	vreg_nvme: regulator-nvme {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_NVME_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&pmh0101_gpios 14 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&nvme_reg_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
> +	vreg_wcn_0p95: regulator-wcn-0p95 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_WCN_0P95";
> +		regulator-min-microvolt = <950000>;
> +		regulator-max-microvolt = <950000>;
> +
> +		vin-supply = <&vreg_wcn_3p3>;
> +	};
> +
> +	vreg_wcn_3p3: regulator-wcn-3p3 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_WCN_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 94 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&wcn_sw_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
> +	sound {
> +		compatible = "qcom,glymur-sndcard";
> +		model = "GLYMUR-HP-EliteBook-X-G2q";
> +
> +		audio-routing = "WooferLeft IN", "WSA WSA_SPK1 OUT",
> +				"TweeterLeft IN", "WSA WSA_SPK2 OUT",
> +				"WooferRight IN", "WSA2 WSA_SPK1 OUT",
> +				"TweeterRight IN", "WSA2 WSA_SPK2 OUT",
> +				"VA DMIC0", "vdd-micb",
> +				"VA DMIC1", "vdd-micb",
> +				"VA DMIC2", "vdd-micb",
> +				"VA DMIC3", "vdd-micb";
> +
> +		va-dai-link {
> +			link-name = "VA Capture";
> +
> +			codec {
> +				sound-dai = <&lpass_vamacro 0>;
> +			};
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
> +			};
> +
> +			platform {
> +				sound-dai = <&q6apm>;
> +			};
> +		};
> +
> +		wsa-dai-link {
> +			link-name = "WSA Playback";
> +
> +			codec {
> +				sound-dai = <&left_woofer>, <&left_tweeter>,
> +					    <&swr0 0>, <&lpass_wsamacro 0>,
> +					    <&right_woofer>, <&right_tweeter>,
> +					    <&swr3 0>, <&lpass_wsa2macro 0>;
> +			};
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
> +			};
> +
> +			platform {
> +				sound-dai = <&q6apm>;
> +			};
> +		};
> +	};
> +
> +	wcn7850-pmu {
> +		compatible = "qcom,wcn7850-pmu";
> +
> +		vdd-supply = <&vreg_wcn_0p95>;
> +		vddio-supply = <&vreg_l15b_e0_1p8>;
> +		vddaon-supply = <&vreg_l15b_e0_1p8>;
> +		vdddig-supply = <&vreg_l15b_e0_1p8>;
> +		vddrfa1p2-supply = <&vreg_l15b_e0_1p8>;
> +		vddrfa1p8-supply = <&vreg_l15b_e0_1p8>;
> +
> +		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
> +		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-0 = <&wcn_wlan_bt_en>;
> +		pinctrl-names = "default";
> +
> +		regulators {
> +			vreg_pmu_rfa_cmn: ldo0 {
> +				regulator-name = "vreg_pmu_rfa_cmn";
> +			};
> +
> +			vreg_pmu_aon_0p59: ldo1 {
> +				regulator-name = "vreg_pmu_aon_0p59";
> +			};
> +
> +			vreg_pmu_wlcx_0p8: ldo2 {
> +				regulator-name = "vreg_pmu_wlcx_0p8";
> +			};
> +
> +			vreg_pmu_wlmx_0p85: ldo3 {
> +				regulator-name = "vreg_pmu_wlmx_0p85";
> +			};
> +
> +			vreg_pmu_btcmx_0p85: ldo4 {
> +				regulator-name = "vreg_pmu_btcmx_0p85";
> +			};
> +
> +			vreg_pmu_rfa_0p8: ldo5 {
> +				regulator-name = "vreg_pmu_rfa_0p8";
> +			};
> +
> +			vreg_pmu_rfa_1p2: ldo6 {
> +				regulator-name = "vreg_pmu_rfa_1p2";
> +			};
> +
> +			vreg_pmu_rfa_1p8: ldo7 {
> +				regulator-name = "vreg_pmu_rfa_1p8";
> +			};
> +
> +			vreg_pmu_pcie_0p9: ldo8 {
> +				regulator-name = "vreg_pmu_pcie_0p9";
> +			};
> +
> +			vreg_pmu_pcie_1p8: ldo9 {
> +				regulator-name = "vreg_pmu_pcie_1p8";
> +			};
> +		};
> +	};
> +};
> +
> +&apps_rsc {
> +	regulators-0 {
> +		compatible = "qcom,pmh0101-rpmh-regulators";
> +		qcom,pmic-id = "B_E0";
> +
> +		vreg_l1b_e0_1p8: ldo1 {
> +			regulator-name = "vreg_l1b_e0_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7b_e0_3p1: ldo7 {
> +			regulator-name = "vreg_l7b_e0_3p1";
> +			regulator-min-microvolt = <3072000>;
> +			regulator-max-microvolt = <3072000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l15b_e0_1p8: ldo15 {
> +			regulator-name = "vreg_l15b_e0_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l18b_e0_1p2: ldo18 {
> +			regulator-name = "vreg_l18b_e0_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-1 {
> +		compatible = "qcom,pmcx0102-rpmh-regulators";
> +		qcom,pmic-id = "C_E1";
> +
> +		vreg_l1c_e1_0p91: ldo1 {
> +			regulator-name = "vreg_l1c_e1_0p91";
> +			regulator-min-microvolt = <912000>;
> +			regulator-max-microvolt = <912000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-2 {
> +		compatible = "qcom,pmh0110-rpmh-regulators";
> +		qcom,pmic-id = "F_E0";
> +
> +		vreg_l2f_e0_0p94: ldo2 {
> +			regulator-name = "vreg_l2f_e0_0p94";
> +			regulator-min-microvolt = <936000>;
> +			regulator-max-microvolt = <936000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3f_e0_0p91: ldo3 {
> +			regulator-name = "vreg_l3f_e0_0p91";
> +			regulator-min-microvolt = <912000>;
> +			regulator-max-microvolt = <912000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-3 {
> +		compatible = "qcom,pmh0110-rpmh-regulators";
> +		qcom,pmic-id = "F_E1";
> +
> +		vreg_l1f_e1_0p88: ldo1 {
> +			regulator-name = "vreg_l1f_e1_0p88";
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <880000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2f_e1_0p88: ldo2 {
> +			regulator-name = "vreg_l2f_e1_0p88";
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <880000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l4f_e1_1p2: ldo4 {
> +			regulator-name = "vreg_l4f_e1_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-4 {
> +		compatible = "qcom,pmh0110-rpmh-regulators";
> +		qcom,pmic-id = "H_E0";
> +
> +		vreg_l1h_e0_0p94: ldo1 {
> +			regulator-name = "vreg_l1h_e0_0p94";
> +			regulator-min-microvolt = <936000>;
> +			regulator-max-microvolt = <936000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2h_e0_0p88: ldo2 {
> +			regulator-name = "vreg_l2h_e0_0p88";
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <880000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l4h_e0_1p2: ldo4 {
> +			regulator-name = "vreg_l4h_e0_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +};
> +
> +&gmu {
> +	status = "okay";
> +};
> +
> +&gpu {
> +	status = "okay";
> +};
> +
> +&i2c0 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	touchpad@2c {
> +		compatible = "hid-over-i2c";
> +		reg = <0x2c>;
> +
> +		hid-descr-addr = <0x20>;
> +		interrupts-extended = <&tlmm 66 IRQ_TYPE_LEVEL_LOW>;
> +
> +		pinctrl-0 = <&tpad_default>;
> +		pinctrl-names = "default";
> +
> +		wakeup-source;
> +	};
> +
> +	keyboard@3a {
> +		compatible = "hid-over-i2c";
> +		reg = <0x3a>;
> +
> +		hid-descr-addr = <0x1>;
> +		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
> +
> +		pinctrl-0 = <&kybd_default>;
> +		pinctrl-names = "default";
> +
> +		wakeup-source;
> +	};
> +};
> +
> +&i2c8 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	touchscreen@10 {
> +		compatible = "hid-over-i2c";
> +		reg = <0x10>;
> +
> +		hid-descr-addr = <0x1>;
> +		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
> +
> +		post-power-on-delay-ms = <200>;
> +
> +		pinctrl-0 = <&ts0_default>;
> +		pinctrl-names = "default";
> +	};
> +};
> +
> +&lpass_vamacro {
> +	vdd-micb-supply = <&vreg_l1b_e0_1p8>;
> +
> +	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
> +	pinctrl-names = "default";
> +
> +	qcom,dmic-sample-rate = <4800000>;
> +};
> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dp0 {
> +	status = "okay";
> +};
> +
> +&mdss_dp0_out {
> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> +};
> +
> +&mdss_dp1 {
> +	status = "okay";
> +};
> +
> +&mdss_dp1_out {
> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> +};
> +
> +&mdss_dp2 {
> +	status = "okay";
> +};
> +
> +&mdss_dp2_out {
> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> +};
> +
> +&mdss_dp3 {
> +	/delete-property/ #sound-dai-cells;
> +
> +	status = "okay";
> +
> +	aux-bus {
> +		panel {
> +			compatible = "samsung,atna33xc20";
> +			enable-gpios = <&tlmm 18 GPIO_ACTIVE_HIGH>;
> +			power-supply = <&vreg_edp_3p3>;
> +
> +			pinctrl-0 = <&edp_bl_en>;
> +			pinctrl-names = "default";
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
> +	vdda-phy-supply = <&vreg_l2f_e1_0p88>;
> +	vdda-pll-supply = <&vreg_l4f_e1_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&pcie4 {
> +	pinctrl-0 = <&pcie4_default>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +
> +&pcie4_phy {
> +	vdda-phy-supply = <&vreg_l1c_e1_0p91>;
> +	vdda-pll-supply = <&vreg_l4f_e1_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&pcie4_port0 {
> +	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
> +
> +	wifi@0 {
> +		compatible = "pci17cb,1107";
> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> +
> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> +		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
> +		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
> +		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
> +	};
> +};
> +
> +&pcie5 {
> +	vddpe-3v3-supply = <&vreg_nvme>;
> +
> +	pinctrl-0 = <&pcie5_default>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +
> +&pcie5_phy {
> +	vdda-phy-supply = <&vreg_l2f_e0_0p94>;
> +	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&pcie5_port0 {
> +	reset-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
> +
> +	status = "okay";
> +};
> +
> +&pmh0101_gpios {
> +	nvme_reg_en: nvme-reg-en-state {
> +		pins = "gpio14";
> +		function = "normal";
> +		bias-disable;
> +	};
> +};
> +
> +&pmk8850_rtc {
> +	qcom,no-alarm;
> +	qcom,uefi-rtc-info;
> +};
> +
> +&remoteproc_adsp {
> +	firmware-name = "qcom/glymur/hp/elitebook-x-g2q/adsp.mbn",
> +			"qcom/glymur/hp/elitebook-x-g2q/adsp_dtb.mbn";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/glymur/hp/elitebook-x-g2q/cdsp.mbn",
> +			"qcom/glymur/hp/elitebook-x-g2q/cdsp_dtb.mbn";

Those firwmare names seem to diverge from the earlier Lenovo Yoga Slim 7x Gen11 patch
and the X1E laptops currently in the tree.

Generally it seems for consumer devices we have been sticking to the Windows firmware
names in the past which would be:

  adsp.mbn -> qcadsp8480.mbn
  adsp_dtb.mbn -> adsp_dtbs.elf
  cdsp.mbn -> qccdsp8480.mbn
  cdsp_dtb.mbn -> cdsp_dtbs.elf

See https://lore.kernel.org/all/20260731-topic-yoga_submission-v2-2-f1887031da4f@oss.qualcomm.com/

> +
> +	status = "okay";
> +};
> +
> +&remoteproc_soccp {
> +	status = "okay";
> +};
> +
> +&smb2370_j_e2_eusb2_repeater {
> +	vdd18-supply = <&vreg_l15b_e0_1p8>;
> +	vdd3-supply = <&vreg_l7b_e0_3p1>;
> +};
> +
> +&smb2370_k_e2_eusb2_repeater {
> +	vdd18-supply = <&vreg_l15b_e0_1p8>;
> +	vdd3-supply = <&vreg_l7b_e0_3p1>;
> +};
> +
> +/* SID-11 (smb2370_l) does not enumerate on this board; keep it disabled. */
> +&smb2370_l_e2 {
> +	status = "disabled";
> +};
> +
> +&swr0 {
> +	status = "okay";
> +
> +	/* WSA8845, left woofer */
> +	left_woofer: speaker@0,0 {
> +		compatible = "sdw20217020400";
> +		reg = <0 0>;
> +		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "WooferLeft";
> +		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
> +		vdd-io-supply = <&vreg_l18b_e0_1p2>;
> +		qcom,port-mapping = <1 2 3 7 12 14>;
> +	};
> +
> +	/* WSA8845, left tweeter */
> +	left_tweeter: speaker@0,1 {
> +		compatible = "sdw20217020400";
> +		reg = <0 1>;
> +		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "TweeterLeft";
> +		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
> +		vdd-io-supply = <&vreg_l18b_e0_1p2>;
> +		qcom,port-mapping = <4 5 6 7 13 15>;
> +	};
> +};
> +
> +&swr3 {
> +	status = "okay";
> +
> +	/* WSA8845, right woofer */
> +	right_woofer: speaker@0,0 {
> +		compatible = "sdw20217020400";
> +		reg = <0 0>;
> +		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "WooferRight";
> +		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
> +		vdd-io-supply = <&vreg_l18b_e0_1p2>;
> +		qcom,port-mapping = <1 2 3 7 12 14>;
> +	};
> +
> +	/* WSA8845, right tweeter */
> +	right_tweeter: speaker@0,1 {
> +		compatible = "sdw20217020400";
> +		reg = <0 1>;
> +		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "TweeterRight";
> +		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
> +		vdd-io-supply = <&vreg_l18b_e0_1p2>;
> +		qcom,port-mapping = <4 5 6 7 13 15>;
> +	};
> +};
> +
> +&tcsr {
> +	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p88>;
> +	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p88>;
> +	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p88>;
> +	vdda-qrefrpt3-0p9-supply = <&vreg_l2h_e0_0p88>;
> +	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p88>;
> +	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p88>;
> +	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p88>;
> +	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p88>;
> +	vdda-qrefrx4-0p9-supply = <&vreg_l2h_e0_0p88>;
> +	vdda-qrefrx5-0p9-supply = <&vreg_l3f_e0_0p91>;
> +	vdda-qreftx0-0p9-supply = <&vreg_l3f_e0_0p91>;
> +	vdda-qreftx0-1p2-supply = <&vreg_l4h_e0_1p2>;
> +	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p88>;
> +	vdda-refgen3-0p9-supply = <&vreg_l2f_e0_0p94>;
> +	vdda-refgen3-1p2-supply = <&vreg_l4h_e0_1p2>;
> +	vdda-refgen4-0p9-supply = <&vreg_l1f_e1_0p88>;
> +	vdda-refgen4-1p2-supply = <&vreg_l4f_e1_1p2>;
> +};
> +
> +&tlmm {
> +	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
> +			       <10 2>, /* OOB UART */
> +			       <44 4>, /* Security SPI (TPM) */
> +			       <65 1>; /* EC reset */
> +
> +	edp_bl_en: edp-bl-en-state {
> +		pins = "gpio18";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		bias-disable;
> +	};
> +
> +	ts0_default: ts0-default-state {
> +		pins = "gpio51";
> +		function = "gpio";
> +		bias-disable;
> +	};
> +
> +	tpad_default: tpad-default-state {
> +		pins = "gpio66";
> +		function = "gpio";
> +		bias-disable;
> +	};
> +
> +	kybd_default: kybd-default-state {
> +		pins = "gpio67";
> +		function = "gpio";
> +		bias-disable;
> +	};
> +
> +	edp_reg_en: edp-reg-en-state {
> +		pins = "gpio70";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		bias-disable;
> +	};
> +
> +	lid_default: lid-default-state {
> +		pins = "gpio92";
> +		function = "gpio";
> +		bias-disable;
> +	};
> +
> +	wcn_sw_en: wcn-sw-en-state {
> +		pins = "gpio94";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
> +		pins = "gpio116", "gpio117";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	usb2_dp_hot_plug_detect: usb2-dp-hot-plug-detect-state {
> +		pins = "gpio126";
> +		function = "usb2_dp";
> +		bias-disable;
> +	};
> +
> +	pcie4_default: pcie4-default-state {
> +		clkreq-n-pins {
> +			pins = "gpio147";
> +			function = "pcie4_clk_req_n";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		perst-n-pins {
> +			pins = "gpio146";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +
> +		wake-n-pins {
> +			pins = "gpio148";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	pcie5_default: pcie5-default-state {
> +		clkreq-n-pins {
> +			pins = "gpio153";
> +			function = "pcie5_clk_req_n";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		perst-n-pins {
> +			pins = "gpio152";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +
> +		wake-n-pins {
> +			pins = "gpio154";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +	};
> +};
> +
> +&uart14 {
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "qcom,wcn7850-bt";
> +		max-speed = <3200000>;
> +
> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> +		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
> +	};
> +};
> +
> +&usb_0 {
> +	status = "okay";
> +};
> +
> +&usb_0_dwc3_hs {
> +	remote-endpoint = <&pmic_glink_hs_in>;
> +};
> +
> +&usb_0_hsphy {
> +	vdd-supply = <&vreg_l3f_e0_0p91>;
> +	vdda12-supply = <&vreg_l4h_e0_1p2>;
> +
> +	phys = <&smb2370_j_e2_eusb2_repeater>;
> +
> +	status = "okay";
> +};
> +
> +&usb_0_qmpphy {
> +	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
> +	vdda-pll-supply = <&vreg_l3f_e0_0p91>;
> +	refgen-supply = <&vreg_l2f_e0_0p94>;
> +
> +	status = "okay";
> +};
> +
> +&usb_0_qmpphy_out {
> +	remote-endpoint = <&pmic_glink_ss_in>;
> +};
> +
> +&usb_1 {
> +	status = "okay";
> +};
> +
> +&usb_1_dwc3_hs {
> +	remote-endpoint = <&pmic_glink_hs_in1>;
> +};
> +
> +&usb_1_hsphy {
> +	vdd-supply = <&vreg_l3f_e0_0p91>;
> +	vdda12-supply = <&vreg_l4h_e0_1p2>;
> +
> +	phys = <&smb2370_k_e2_eusb2_repeater>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1_qmpphy {
> +	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
> +	vdda-pll-supply = <&vreg_l1h_e0_0p94>;
> +	refgen-supply = <&vreg_l2f_e0_0p94>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1_qmpphy_out {
> +	remote-endpoint = <&pmic_glink_ss_in1>;
> +};
> +
> +/* usb_2's combo PHY drives the HDMI bridge over DP; keep the dwc3 enabled. */
> +&usb_2 {
> +	maximum-speed = "high-speed";
> +
> +	phys = <&usb_2_hsphy>;
> +	phy-names = "usb2-phy";
> +
> +	status = "okay";
> +};
> +
> +&usb_2_hsphy {
> +	vdd-supply = <&vreg_l3f_e0_0p91>;
> +	vdda12-supply = <&vreg_l4h_e0_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&usb_2_qmpphy {
> +	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
> +	vdda-pll-supply = <&vreg_l3f_e0_0p91>;
> +	refgen-supply = <&vreg_l2f_e0_0p94>;
> +
> +	/delete-property/ mode-switch;
> +	/delete-property/ orientation-switch;
> +
> +	status = "okay";
> +
> +	ports {
> +		port@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			/delete-node/ endpoint;
> +
> +			usb_2_qmpphy_out_dp: endpoint@0 {
> +				reg = <0>;
> +
> +				data-lanes = <3 2 1 0>;
> +				remote-endpoint = <&hdmi_bridge_in>;
> +			};
> +		};
> +	};
> +};
> +
> +/* Internal USB2 host for the Elan fingerprint reader (usb 04f3:0ca8). */
> +&usb_hs {
> +	dr_mode = "host";
> +
> +	status = "okay";
> +};
> +
> +&usb_hs_phy {
> +	vdd-supply = <&vreg_l2h_e0_0p88>;
> +	vdda12-supply = <&vreg_l4h_e0_1p2>;
> +
> +	status = "okay";
> +};
> +
> +/* Multiport host: port 0 = chassis USB-A, port 1 = internal USB HID. */
> +&usb_mp {
> +	status = "okay";
> +};
> +
> +&usb_mp_hsphy0 {
> +	vdd-supply = <&vreg_l2h_e0_0p88>;
> +	vdda12-supply = <&vreg_l4h_e0_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&usb_mp_hsphy1 {
> +	vdd-supply = <&vreg_l2h_e0_0p88>;
> +	vdda12-supply = <&vreg_l4h_e0_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&usb_mp_qmpphy0 {
> +	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
> +	vdda-pll-supply = <&vreg_l2h_e0_0p88>;
> +	refgen-supply = <&vreg_l4f_e1_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&usb_mp_qmpphy1 {
> +	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
> +	vdda-pll-supply = <&vreg_l2h_e0_0p88>;
> +	refgen-supply = <&vreg_l4f_e1_1p2>;
> +
> +	status = "okay";
> +};
> 
> -- 
> 2.50.1
> 
> 
