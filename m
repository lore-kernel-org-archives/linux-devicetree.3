Received: from mail-oo1-f100.google.com (mail-oo1-f100.google.com [209.85.161.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B60356A0D
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 02:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777430866; cv=none; b=ohuIFxGuCmdsM12v8JHRdFCHN7ZrtpR8ywx6WHu0KMtxgyHRJm10a2ZOwUbcgiEPuvkN1O6tklWyYQ414Ikt59lu8326gWyQl7u/uKm9eErv6otuUNxQoojgIhrQovCC3L0NDvItIz7iIekGPuVZxFVyRyzVltC0X04qDSyM444=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777430866; c=relaxed/simple;
	bh=rgFO2f/F9QL7S2E8N++Nlvx1KbD33Ds6FnE3syFHMwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qT/fe0+c7ZxwGigClZPBf9fUKzzlwyISxytd2S97mDe7dZXnMFddN8fCgefLOpnj4FXb5kJ9xHaaOWF5nhzikdzeaJ4YAludS4RpUKlZz13sInhhpI3C9giOMKiFIzGl5ELX+MjFsUkYYSG4x/x9FxN+eQUwSx/62K+UKSoOcG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ausil.us; spf=pass smtp.mailfrom=ausil.us; dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b=JM8FvkSX; arc=none smtp.client-ip=209.85.161.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ausil.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ausil.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b="JM8FvkSX"
Received: by mail-oo1-f100.google.com with SMTP id 006d021491bc7-6949831a7bcso4682698eaf.1
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 19:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1777430863; x=1778035663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ASODOqbY7r+XHNfLzeYl5vf9h9XqJdkTUK244iHohGY=;
        b=JM8FvkSXVfQLIh4xdwlpv+ShzRYnwbTH1HxFIllu+RyUXYrUvCTQtYxTkyPy5hEgTw
         LaaBEUxs0q5CQNDf/nnnwAWnW9kvO+dn2q8qUGRX7XPQD51O11Mg+MtXY8Iwd+hAYtCl
         xUAR7K/m42U9YBxgs4+6NI+teJfzRN/a1v9yjr7UHOEZhJT4K9NTTGhcUjtZjyMwqJu/
         ThScpU89obXey/2+4hCXqQuj/EmHk1p2WxY+V7qde1Qd3owVjP4f35sJuQz2C1gb4HFU
         6UNygKpO6IYCDBkvLC3laPG2SBJeneP5o5yiD9gyY1kA+highrfO1g0bnEEA/3qyU+D/
         JCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777430863; x=1778035663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ASODOqbY7r+XHNfLzeYl5vf9h9XqJdkTUK244iHohGY=;
        b=PiEaoKzdAER4+fmjmB5DiaRbwyjgdIt1jBJM/Roy7IXyMTUBcI7U4jXX6BCD4hQRPz
         Zh6m+MQ/UrWpUVOtOlNzb2dSqhk8+8uRIuqr/LJVXJegKvqUu5mEZkjLJKbPWyt73z3D
         LSdDb9CfP3NEPX7NvoAgCzKYwi1lII5RpPhsr/XHd8f51AU2WKRpJbeDHUxawQ9YSUMJ
         dJ7FBuNEPFVH7oA/jLDXt7cqGjVR+voURM3uJ9JmGfzog8DMF0fnLELYQ4FjIJAQ18Dh
         lsof93Ds8c/ZtNTsgcmBcu1ueEvLbljmxpSTdmxlb1Mt2mKwoSf/ta8v3os5J9QcXiwv
         0z/w==
X-Forwarded-Encrypted: i=1; AFNElJ/UbHJheJm+emtVoDQUx1lRo+oHEyClqC01Dzlrqsp/e/9ZZVBVpBf9Ts5z8aLzpgK1IdUA/2K0T+ra@vger.kernel.org
X-Gm-Message-State: AOJu0YzY5UPZRETdkNalcl/UIWhFSsYTbJmlTpYJL00jL03MMeMTa4WU
	S/0NiV1BVn12UZ8WsCk++LwVQqU/F6ohejVPYeIbVsLjdWnyPZoyXJWmkYbhne6bScdP2ZR2r3I
	bogVYJuQcMhYP1XObmhKCtRnTzCrEWlixEX+J
X-Gm-Gg: AeBDietR/psgklMixYeDcS97EDzM5GL8rjEp2I/y8efjeA054wZiUX9vGyUySiZWvOd
	CHUXv0icdo9ukEssVKlaxPJbT3s71FeU4vqZXAXOGHnKKSVjFB8+5YQHo5LxOWJXL9MCCtDMg+3
	UAEBcWR7dqaHconx0r+syV5a5E9AWOeyGh0wiNzY0HGLCh0WMoeqajiMapxb8ExAJgsoi7jNLEQ
	FLXVPZxqxZz0YdsLe/xN6c5KSmcnWvk225jjb//CUa57kpILVW15JJ4SeC5dZPgVAyiiSvZN2j0
	65edDQXECdC7/Qbgi82n3zyX35g7ZYUb5S0+CYnNzAKWo6L2FWpyEk+vnOOrjN9NyI1aTdwkDO1
	Me5RvLWbjRbgU2GMjZr2ROutCbeks167A/Gw/apfMwiNIVZUqPn/jz5k=
X-Received: by 2002:a05:6820:906:b0:694:a3a1:3eff with SMTP id 006d021491bc7-6965caa39c8mr3042682eaf.25.1777430863009;
        Tue, 28 Apr 2026 19:47:43 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-4340e711c00sm110958fac.5.2026.04.28.19.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 19:47:43 -0700 (PDT)
X-Relaying-Domain: ausil.us
From: Dennis Gilmore <dennis@ausil.us>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Alexey Charkov <alchark@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dennis Gilmore <dennis@ausil.us>
Subject: [PATCH v9 4/4] arm64: dts: rockchip: Add Orange Pi 5 Pro board support
Date: Tue, 28 Apr 2026 21:47:35 -0500
Message-ID: <20260429024737.544813-5-dennis@ausil.us>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260429024737.544813-1-dennis@ausil.us>
References: <20260429024737.544813-1-dennis@ausil.us>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree for the Xunlong Orange Pi 5 Pro (RK3588S).

- eMMC module, you can optionally solder a SPI NOR in place and turn
 off the eMMC
- PCIe-attached NIC (pcie2x1l2)
- PCIe NVMe slot (pcie2x1l1)
- AP6256 WiFi (BCM43456) via SDIO with mmc-pwrseq
- BCM4345C5 Bluetooth
- es8388 audio
- USB 2.0 and USB 3.0
- HDMI output is enabled
- the second HDMI port connected to the DP bridge is left out for a
  followup set

Vendors schematics are available at:
https://drive.google.com/file/d/1qs1DratHuh7C6J6MEtQIwUsiSrg8qgTi/view

Signed-off-by: Dennis Gilmore <dennis@ausil.us>
Reviewed-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3588s-orangepi-5-pro.dts   | 358 ++++++++++++++++++
 2 files changed, 359 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index cb55c6b70d0e..7677a0c27b1e 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -221,6 +221,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-nanopi-r6c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-odroid-m2.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-orangepi-5.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-orangepi-5b.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-orangepi-5-pro.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-orangepi-cm5-base.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-radxa-cm5-io.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-roc-pc.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts
new file mode 100644
index 000000000000..895d954a9f23
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts
@@ -0,0 +1,358 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include "rk3588s-orangepi-5.dtsi"
+
+/ {
+	model = "Xunlong Orange Pi 5 Pro";
+	compatible = "xunlong,orangepi-5-pro", "rockchip,rk3588s";
+
+	aliases {
+		mmc0 = &sdhci;
+		mmc1 = &sdmmc;
+		mmc2 = &sdio;
+	};
+
+	analog-sound {
+		compatible = "simple-audio-card";
+		pinctrl-names = "default";
+		pinctrl-0 = <&hp_detect>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,hp-det-gpios = <&gpio1 RK_PD5 GPIO_ACTIVE_HIGH>;
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,name = "rockchip,es8388";
+		simple-audio-card,routing =
+			"Headphones", "LOUT1",
+			"Headphones", "ROUT1",
+			"LINPUT1", "Microphone Jack",
+			"RINPUT1", "Microphone Jack",
+			"LINPUT2", "Onboard Microphone",
+			"RINPUT2", "Onboard Microphone";
+		simple-audio-card,widgets =
+			"Microphone", "Microphone Jack",
+			"Microphone", "Onboard Microphone",
+			"Headphone", "Headphones";
+
+		simple-audio-card,cpu {
+			sound-dai = <&i2s2_2ch>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&es8388>;
+			system-clock-frequency = <12288000>;
+		};
+	};
+
+	pwm-leds {
+		compatible = "pwm-leds";
+
+		led-0 {
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_STATUS;
+			linux,default-trigger = "heartbeat";
+			max-brightness = <255>;
+			pwms = <&pwm15 0 1000000 0>;
+		};
+
+		led-1 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_ACTIVITY;
+			linux,default-trigger = "heartbeat";
+			max-brightness = <255>;
+			pwms = <&pwm3 0 1000000 0>;
+		};
+	};
+
+	fan: pwm-fan {
+		compatible = "pwm-fan";
+		#cooling-cells = <2>;
+		cooling-levels = <0 50 100 150 200 255>;
+		fan-supply = <&vcc5v0_sys>;
+		pwms = <&pwm2 0 20000000 0>;
+	};
+
+	vcc3v3_eth: regulator-vcc3v3-eth {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio3 RK_PB7 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&ethernet_en>;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "vcc3v3_eth";
+		startup-delay-us = <50000>;
+		vin-supply = <&vcc_3v3_s3>;
+	};
+
+	vcc5v0_otg: regulator-vcc5v0-otg {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio0 RK_PC4 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vcc5v0_otg_en>;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "vcc5v0_otg";
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		clocks = <&hym8563>;
+		clock-names = "ext_clock";
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_enable_h>;
+		post-power-on-delay-ms = <200>;
+		reset-gpios = <&gpio0 RK_PD0 GPIO_ACTIVE_LOW>;
+	};
+
+	typea_con: usb-a-connector {
+		compatible = "usb-a-connector";
+		data-role = "host";
+		label = "USB3 Type-A";
+		power-role = "source";
+		vbus-supply = <&vcc5v0_otg>;
+	};
+};
+
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1m4_xfer>;
+	status = "okay";
+};
+
+&i2c3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c3m0_xfer>;
+	status = "okay";
+
+	es8388: audio-codec@11 {
+		compatible = "everest,es8388", "everest,es8328";
+		reg = <0x11>;
+		#sound-dai-cells = <0>;
+		AVDD-supply = <&vcca_3v3_s0>;
+		DVDD-supply = <&vcca_1v8_s0>;
+		HPVDD-supply = <&vcca_3v3_s0>;
+		PVDD-supply = <&vcca_1v8_s0>;
+		assigned-clock-rates = <12288000>;
+		assigned-clocks = <&cru I2S2_2CH_MCLKOUT>;
+		clocks = <&cru I2S2_2CH_MCLKOUT>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2s2m1_mclk>;
+	};
+};
+
+&i2c4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c4m3_xfer>;
+	status = "okay";
+};
+
+&i2s2_2ch {
+	pinctrl-0 = <&i2s2m1_lrck &i2s2m1_sclk
+		     &i2s2m1_sdi &i2s2m1_sdo>;
+	status = "okay";
+};
+
+&package_thermal {
+	polling-delay = <1000>;
+
+	cooling-maps {
+		map0 {
+			trip = <&package_fan0>;
+			cooling-device = <&fan THERMAL_NO_LIMIT 1>;
+		};
+
+		map1 {
+			trip = <&package_fan1>;
+			cooling-device = <&fan 2 THERMAL_NO_LIMIT>;
+		};
+	};
+
+	trips {
+		package_fan0: package-fan0 {
+			hysteresis = <2000>;
+			temperature = <55000>;
+			type = "active";
+		};
+
+		package_fan1: package-fan1 {
+			hysteresis = <2000>;
+			temperature = <65000>;
+			type = "active";
+		};
+	};
+};
+
+/* NVMe */
+&pcie2x1l1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie30x1m1_1_perstn>, <&pcie30x1m1_1_clkreqn>,
+		    <&pcie30x1m1_1_waken>;
+	reset-gpios = <&gpio4 RK_PA2 GPIO_ACTIVE_HIGH>;
+	supports-clkreq;
+	vpcie3v3-supply = <&vcc_3v3_s3>;
+	status = "okay";
+};
+
+/* NIC */
+&pcie2x1l2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie20x1m0_perstn>, <&pcie20x1m0_clkreqn>,
+		    <&pcie20x1m0_waken>;
+	reset-gpios = <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>;
+	vpcie3v3-supply = <&vcc3v3_eth>;
+	status = "okay";
+};
+
+&pinctrl {
+	bluetooth {
+		bt_wake_gpio: bt-wake-pin {
+			rockchip,pins = <0 RK_PC6 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+
+		bt_wake_host_irq: bt-wake-host-irq {
+			rockchip,pins = <0 RK_PC5 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
+
+	ethernet {
+		ethernet_en: ethernet-en {
+			rockchip,pins = <3 RK_PB7 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
+
+	usb {
+		vcc5v0_otg_en: vcc5v0-otg-en {
+			rockchip,pins = <0 RK_PC4 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
+
+	wlan {
+		wifi_enable_h: wifi-enable-h {
+			rockchip,pins = <0 RK_PD0 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+
+		wifi_host_wake_irq: wifi-host-wake-irq {
+			rockchip,pins = <0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
+};
+
+&pwm15 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm15m2_pins>;
+	status = "okay";
+};
+
+&pwm2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm2m1_pins>;
+	status = "okay";
+};
+
+&pwm3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm3m2_pins>;
+	status = "okay";
+};
+
+&rk806_single {
+	regulators {
+		vcca_1v8_s0: pldo-reg1 {
+			regulator-name = "vcca_1v8_s0";
+			regulator-always-on;
+			regulator-boot-on;
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+
+			regulator-state-mem {
+				regulator-off-in-suspend;
+				regulator-suspend-microvolt = <1800000>;
+			};
+		};
+
+		vcc_1v8_s0: pldo-reg2 {
+			regulator-name = "vcc_1v8_s0";
+			regulator-always-on;
+			regulator-boot-on;
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+
+			regulator-state-mem {
+				regulator-off-in-suspend;
+			};
+		};
+	};
+};
+
+&sdhci {
+	status = "okay";
+};
+
+&sdio {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	keep-power-in-suspend;
+	max-frequency = <150000000>;
+	mmc-pwrseq = <&sdio_pwrseq>;
+	no-mmc;
+	no-sd;
+	non-removable;
+	sd-uhs-sdr104;
+	status = "okay";
+
+	ap6256: wifi@1 {
+		compatible = "brcm,bcm43456-fmac", "brcm,bcm4329-fmac";
+		reg = <1>;
+		interrupt-names = "host-wake";
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PA0 IRQ_TYPE_LEVEL_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_host_wake_irq>;
+	};
+};
+
+&uart9 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart9m2_xfer &uart9m2_ctsn &uart9m2_rtsn>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm4345c5";
+		clocks = <&hym8563>;
+		clock-names = "lpo";
+		device-wakeup-gpios = <&gpio0 RK_PC6 GPIO_ACTIVE_HIGH>;
+		interrupt-names = "host-wakeup";
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PC5 IRQ_TYPE_LEVEL_HIGH>;
+		max-speed = <1500000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_wake_host_irq &bt_wake_gpio>;
+		shutdown-gpios = <&gpio0 RK_PD5 GPIO_ACTIVE_HIGH>;
+		vbat-supply = <&vcc_3v3_s3>;
+		vddio-supply = <&vcc_1v8_s3>;
+	};
+};
+
+&u2phy0_otg {
+	phy-supply = <&vcc5v0_otg>;
+};
+
+&usb_host0_xhci {
+	dr_mode = "host";
+};
+
+&usbdp_phy0 {
+	/*
+	 * The USB3 Type-A host connector is wired to PHY lanes 2/3. Lanes 0/1
+	 * are connected to the LT8711UXD DP-to-HDMI bridge on the board.
+	 * dp-lane-mux routes USB3 SuperSpeed to the correct lanes.
+	 */
+	rockchip,dp-lane-mux = <0 1>;
+};
-- 
2.54.0

