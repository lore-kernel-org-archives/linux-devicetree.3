Received: from mail-qt1-f226.google.com (mail-qt1-f226.google.com [209.85.160.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B09B282F1A
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 01:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775005638; cv=none; b=KdRBiQ1bFJMcKN8+wwIFdhdQx1GJapG9tugC9HcrIyDN7tJDFgaL0yM/t+TzaeLGKbTwz6NAulGoDgshTO4qn3XO9cuqnI+EG/k0/VsbBfqKuL3A/YocyNlz/WZCLarGilVA0t5CiZR6cg0T6HvIuLLpp+8j3mLiCQZC9kQBizA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775005638; c=relaxed/simple;
	bh=NaLhfWmk5/Giy6F9KH30mMjWnwN6bFDdEavJO0r/gME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rYUU/p1FyZRO2uZMsPtoKjCxozfRdIhdEnZ/zXw7nMfljvd5SuKCCsy8D7XnC6wMxpsx66juTt+HOcxeAeabhB/DRx2VuwbSjVl4rSIXV/gVDKsDcFHPn/lR+6I+Aw5LdVHC66HtMKH4BjtFLPb0cutZR8/HipAOuVBhMP+oODc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ausil.us; spf=pass smtp.mailfrom=ausil.us; dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b=EmFCmZdU; arc=none smtp.client-ip=209.85.160.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ausil.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ausil.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b="EmFCmZdU"
Received: by mail-qt1-f226.google.com with SMTP id d75a77b69052e-50b2b289925so57221031cf.2
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 18:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1775005636; x=1775610436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eWAUT5q20CbAtBOIDV7jUJ3UZPFYCYSQkrgrPRigtE0=;
        b=EmFCmZdUByF2fXFjacnEgGsy0X79Q0gBN/X4jHyTbh8ihRhirg7Y0gocRFDp1HoKra
         /wKnHpjnVBKNfW4dEfUXi88+yMDyFncGpPOHMRx2GXOYH9OQlKLYO7ikGvfCvMzYAoOl
         tKUzje0hIAlS/S2aY+w7KBmfekbXTw6YESfYGelXtLxXOKbG+HHEdDLsNCZ2Koa5bXwf
         5mpBTHa4vEOgMxYH2+u7LlgFCxzz0XowzL+iAQC30CbT3jeBYBq2ri5FSq9eYp+vKg3n
         jrg9uYtQKc0mb2mJIE/SYf4M18TsiZi20NCiYDjggaysS6afWB8qA61N1cAsIJWX7+EH
         3d7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775005636; x=1775610436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eWAUT5q20CbAtBOIDV7jUJ3UZPFYCYSQkrgrPRigtE0=;
        b=JSa0bQf2aIWPsoYegPfq6kYAV5KZjPp1vLMLYBDS7DOCS+eXUz2xmyMF18V0XinOcR
         LclwOGH/OTwZbLBrcOuJLpyHKYz9XDdCtq3dHCKY0OKOrmFzEBOCS4nMCxsx6urpVJxc
         Zzl1rh/9hx3bqLLnkTOmKcxGWtTt/6BcAXXR2z7fDWjivT0CNKVYW9mI09PPXTbJ4B0a
         gdC9V0528gbq7hb5Gt9pJFk1eOuDZpXEHQOHY+yNDN4En9ZPWCsve32FMMZPp9TA+9u3
         ARfVsr8MQriKDVqm9cKioGZ0TYuHnZ2v/u1ZMvNMiEDzcnDzOjehwWP0F1dW/z2zYSXH
         RftQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmE2y73HnhMfuhsu4iQEocWjUfnDmzhtu64iJluPTL5YMiSTVbmR73aLIXKg7sFC5cbPem+F2Dw+HY@vger.kernel.org
X-Gm-Message-State: AOJu0YxpyyXI3AjGQiQkBSIdz7H00wPNfovLsMmM55bboQZfJjWr3qAz
	uV2/zZiJqABuD52KDlry/J/chBnec4rDyULmBbJe1cpRyWiTFGq6VER8cZ257o4nTvwegD+vQW/
	/a/g5HWDgmA9RHpiqMlE5jpI7+VPIGc/QBE6w
X-Gm-Gg: ATEYQzwMQ+hDGvGbb8Eu54xMDVhKQnW0m51sc562vmNm2ePBSrNX3z5zJvzOiWaUuqk
	asl0kfj/gHrl8l9HRMZF5/866m3PnpDzK5/00QnnVRF7JvTko4CcDmX0aLdmeEhV0VACjf1rJos
	mZahUX+4biZLkHicK1d0z+5RaBT6Sp4558JUVuIQcxXMmcOLUisiaQnU7oKnuh7EF6R6Ii+pN/D
	UfQt73FNzWhP7yI8FjgnxB1Z2Yks9NhhVp+aZY5r9JStfXiB1yY7uecs8smK3lZcMLMwm/Rnrpm
	i60IzzQDprSvSXCgcx/fRZEXNulaSwIfCQhJVNxuzJM4eR4MXrOuoMWlUstG/6LsbCzw4TDvZJ9
	QAXF2g7OSQWPztC05pFWnfAptpWeFGkMQQEVAp1t9g7Ow
X-Received: by 2002:a05:622a:1cc9:b0:501:1795:9d52 with SMTP id d75a77b69052e-50d3bccd161mr25815091cf.33.1775005636012;
        Tue, 31 Mar 2026 18:07:16 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-89ecd72ecd5sm14105766d6.15.2026.03.31.18.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 18:07:16 -0700 (PDT)
X-Relaying-Domain: ausil.us
From: dennis@ausil.us
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: FUKAUMI Naoki <naoki@radxa.com>,
	Hsun Lai <i@chainsx.cn>,
	Jonas Karlman <jonas@kwiboo.se>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	John Clark <inindev@gmail.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Alexey Charkov <alchark@gmail.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Dennis Gilmore <dennis@ausil.us>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/3] arm64: dts: rockchip: Add Orange Pi 5 Pro board support
Date: Tue, 31 Mar 2026 20:07:07 -0500
Message-ID: <20260401010707.2584962-4-dennis@ausil.us>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401010707.2584962-1-dennis@ausil.us>
References: <20260401010707.2584962-1-dennis@ausil.us>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dennis Gilmore <dennis@ausil.us>

Add device tree for the Xunlong Orange Pi 5 Pro (RK3588S).

- eMMC module, you can optionally solder a SPI NOR in place and turn
 off the eMMC
- PCIe-attached NIC (pcie2x1l1)
- PCIe NVMe slot (pcie2x1l2)
- AP6256 WiFi (BCM43456) via SDIO with mmc-pwrseq
- BCM4345C5 Bluetooth
- es8388 audio
- USB 2.0 and USB 3.0

Vendors description and links to schematics available:
http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-5-Pro.html

Signed-off-by: Dennis Gilmore <dennis@ausil.us>
---
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3588s-orangepi-5-pro.dts   | 320 ++++++++++++++++++
 2 files changed, 321 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 4d384f153c13..c99dca2ae9e7 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -214,6 +214,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-nanopi-r6c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-odroid-m2.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-orangepi-5.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-orangepi-5b.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-orangepi-5-pro.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-orangepi-cm5-base.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-radxa-cm5-io.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-roc-pc.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts
new file mode 100644
index 000000000000..7ab68245d2c6
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts
@@ -0,0 +1,320 @@
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
+		simple-audio-card,bitclock-master = <&masterdai>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&masterdai>;
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
+		masterdai: simple-audio-card,codec {
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
+	vcc3v3_phy1: regulator-vcc3v3-phy1 {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio3 RK_PB7 GPIO_ACTIVE_HIGH>;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "vcc3v3_phy1";
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
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				typea_con_hs: endpoint {
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				typea_con_ss: endpoint {
+				};
+			};
+		};
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
+		AVDD-supply = <&vcc_3v3_s0>;
+		DVDD-supply = <&vcc_1v8_s0>;
+		HPVDD-supply = <&vcc_3v3_s0>;
+		PVDD-supply = <&vcc_3v3_s0>;
+		assigned-clock-rates = <12288000>;
+		assigned-clocks = <&cru I2S2_2CH_MCLKOUT>;
+		clocks = <&cru I2S2_2CH_MCLKOUT>;
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
+	pinctrl-0 = <&i2s2m1_lrck &i2s2m1_mclk &i2s2m1_sclk
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
+	pinctrl-0 = <&pcie30x1m1_1_clkreqn &pcie30x1m1_1_waken>;
+	reset-gpios = <&gpio4 RK_PA2 GPIO_ACTIVE_HIGH>;
+	supports-clkreq;
+	vpcie3v3-supply = <&vcc_3v3_s3>;
+	status = "okay";
+};
+
+/* NIC */
+&pcie2x1l2 {
+	reset-gpios = <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>;
+	vpcie3v3-supply = <&vcc3v3_phy1>;
+	status = "okay";
+};
+
+&pinctrl {
+	bluetooth {
+		bt_wake_gpio: bt-wake-pin {
+			rockchip,pins = <0 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		bt_wake_host_irq: bt-wake-host-irq {
+			rockchip,pins = <0 RK_PC5 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
+
+	usb {
+		vcc5v0_otg_en: vcc5v0-otg-en {
+			rockchip,pins = <0 RK_PC4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	wlan {
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
+&usb_host0_xhci {
+	dr_mode = "host";
+};
+
+&usbdp_phy0 {
+	rockchip,dp-lane-mux = <0 1>;
+};
-- 
2.53.0

