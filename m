Received: from mail-oa1-f99.google.com (mail-oa1-f99.google.com [209.85.160.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699722BE7CD
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 02:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775875674; cv=none; b=mzHq3bNgJlQQZiDmW71qAguIAG19Rh1zdScTeOVn/DFCjaMFcc9uolyjHYEXFLJ/OqYbq0Eylelom8F5zV1HIv4fr2QZhpXfxL7BrMroOXkNDrgQA8MBkvwXePUu3AHMfvRCVZ3P5AMhrfOqgxROaf7G4YhhyOB5c0UJIVJRjLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775875674; c=relaxed/simple;
	bh=ZcCQ6W2IMvj63jshKw/rlzeW+QEB/Bn3TOaLS02KdgY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dNeylJC5gmSpVXaISlYpHpNB9B0Bh4ng+HsO5JxQm1znqf6yxf4SFjRnWzmqIbVWD1F8WhZtwy7wqkaCngH2EQ1699xfGrsXOPCkR/wFVm7ZyRop7IEjjwSCnetekEGNv55ukcZsg3BBczegGW0odm2qiZYmg18mQak7UFYl/BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ausil.us; spf=pass smtp.mailfrom=ausil.us; dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b=NXMUGKCZ; arc=none smtp.client-ip=209.85.160.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ausil.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ausil.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b="NXMUGKCZ"
Received: by mail-oa1-f99.google.com with SMTP id 586e51a60fabf-40f1ffba6a0so2014783fac.0
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 19:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1775875671; x=1776480471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jAyEa4z1gWAsFEu6m/B+ItGIiM/KxnkrlG9tVm7TFrE=;
        b=NXMUGKCZH0c5aCpb5EFXgssQ7aWMqpxpYSlbGDXOhC+Xi/vawjwwu8pvHBbZpcdKY1
         8C296Z1aKluPn8UwAq6JrZNeVYmXnb+cILIT5d8uk4fDJHjx+jybl6mXOuWkmHYgF5W0
         wAEjnqH3RmO8SrAz6Hjk06UJQvLCv5jLTvCZmO0uAeQ9FU3TTOFJvq6XZZvd4oakyJTs
         3rulHlrerxBUzexbTX30nv3vugS2mQcqrDJpUXCm/a36tQPkPsndvNlVmLFEF3yEIMKP
         eaefFVCrRwHvqmwqZ9s+zJ1FzsrXKYQhQcn7iNh6NbIM4Entbc6/YPzfPSp41zqa4UQH
         PZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775875671; x=1776480471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jAyEa4z1gWAsFEu6m/B+ItGIiM/KxnkrlG9tVm7TFrE=;
        b=sRvuA3E/3uSd0USlTiVbFDInDOm6o6VNvUefYgBQkfMhP/L/0SSLjIMID8F/soOwDj
         VVONDBkUDl91XqKpxCL0kddhCwp4njUTfG1J++YLjgoSwauG3C35rG6kpkdlVu+6IHAC
         U0TU3q2iriws+bsygsfXJqXacympptb6etN06CiwVuTljwwb1AQRwkhPojl+yKA6aqtL
         F7w0QJ9GSTYgis8OlCMmZ8QXGqxFmegtquMwO2nlxze+iXNylsSv735uiSSeSV5OdMNk
         xGefUlEBbKdGAsycan9ig7lBasdiDbzAehhXxCwkslrnlPW9Hn/ayIr4v2ZXIGgxAa1H
         Iaag==
X-Forwarded-Encrypted: i=1; AJvYcCUCDWt2kKJnf5QiOq6ml3yNkSjCRs4uW10zRW4Cejfqkfe5TU5b/0LgmLlecQH4HlSAxxOeo1SOCQA4@vger.kernel.org
X-Gm-Message-State: AOJu0YygYOJdZ06qzVHrEL1kwc6Gor334VTIIa70zHin6ubIxbV0Jm6n
	lI4Zwks/k25mba5bQlaOb70MKEXIDM/hggm0D1Bwr/oujtOqjsMMG76Cg2di9L4tOG8CsfZOVx0
	FuMpUqqaRv0oi1WpU6bqOvdW30lWdAbTleV0b
X-Gm-Gg: AeBDievxhoBr7eHm3CkervAelN0HPvpWdwfnRqR2ugNvffxQEbTONXfrAba7kGc+rWQ
	29MZP1N3gZnWoHZmysKrmkAdeCrQLYbJK3anT2Sq938Pe5J/ONZS7ZD11jNcR9RkCZqWl/sCcsz
	/k0INZxla/LiLJnoQ1yvlBC2zyTxRVqBlByJZr9gyFT+hfsYxOZHp7HUckwaKmNVe/CsPzEnU9f
	BF7VCd3j5axMtIZ76kNXdyfY0wh/oMUofGzslhOoKLt+sNRRvMiw1PaYItV3Ks6lvXA1nTAtgBD
	Xvii/7/Vu/LUDBIpqt/RFINHrXs8fFC0fQpxfuJXlc9rV4XJ3Xpk+up3kDjmj0fKg9X8amJ8hVs
	UmArtVcD5c5sJR23v2+U98MbNNLiYSprFA3L+vBwhgleF
X-Received: by 2002:a05:6870:3e07:b0:417:6bc7:1e21 with SMTP id 586e51a60fabf-423e11e605cmr3050812fac.38.1775875671430;
        Fri, 10 Apr 2026 19:47:51 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-423ddd32ab3sm599086fac.16.2026.04.10.19.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 19:47:51 -0700 (PDT)
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
Subject: [PATCH v6 3/3] arm64: dts: rockchip: Add Orange Pi 5 Pro board support
Date: Fri, 10 Apr 2026 21:47:43 -0500
Message-ID: <20260411024743.195385-4-dennis@ausil.us>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411024743.195385-1-dennis@ausil.us>
References: <20260411024743.195385-1-dennis@ausil.us>
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
- Two HDMI ports, the second is connected to the SoC's DP controller
  driven by a transparent LT8711UXD bridge that has firmware onboard and
  needs no node defined.

Vendors description and links to schematics available:
http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-5-Pro.html

Signed-off-by: Dennis Gilmore <dennis@ausil.us>
---
 .../display/rockchip/rockchip,dw-dp.yaml      |   7 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3588s-orangepi-5-pro.dts   | 352 ++++++++++++++++++
 drivers/gpu/drm/bridge/synopsys/dw-dp.c       |  12 +
 4 files changed, 372 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
index 6345f0132d43..079a912d97f1 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
@@ -57,6 +57,13 @@ properties:
       - const: i2s
       - const: spdif
 
+  hpd-gpios:
+    maxItems: 1
+    description:
+      GPIO used for hot plug detection when the controller's native HPD
+      input is not connected. If not specified, the controller uses its
+      internal HPD detection mechanism.
+
   phys:
     maxItems: 1
 
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
index 000000000000..84c83aa69f63
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts
@@ -0,0 +1,352 @@
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
+	dp-con {
+		compatible = "dp-connector";
+
+		port {
+			dp_con_in: endpoint {
+				remote-endpoint = <&dp0_out_con>;
+			};
+		};
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
+	vcc3v3_dp: regulator-vcc3v3-dp {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio3 RK_PC2 GPIO_ACTIVE_HIGH>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "vcc3v3_dp";
+		vin-supply = <&vcc_3v3_s3>;
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
+	};
+};
+
+&dp0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&dp0m0_pins>;
+	status = "okay";
+};
+
+&dp0_in {
+	dp0_in_vp1: endpoint {
+		remote-endpoint = <&vp1_out_dp0>;
+	};
+};
+
+&dp0_out {
+	dp0_out_con: endpoint {
+		remote-endpoint = <&dp_con_in>;
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
+
+&vp1 {
+	vp1_out_dp0: endpoint@a {
+		reg = <ROCKCHIP_VOP2_EP_DP0>;
+		remote-endpoint = <&dp0_in_vp1>;
+	};
+};
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index fd23ca2834b0..b58f57b69b22 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -8,6 +8,7 @@
  */
 #include <linux/bitfield.h>
 #include <linux/clk.h>
+#include <linux/gpio/consumer.h>
 #include <linux/iopoll.h>
 #include <linux/irq.h>
 #include <linux/media-bus-format.h>
@@ -330,6 +331,8 @@ struct dw_dp {
 	u8 pixel_mode;
 
 	DECLARE_BITMAP(sdp_reg_bank, SDP_REG_BANK_SIZE);
+
+	struct gpio_desc *hpd_gpiod;
 };
 
 enum {
@@ -481,6 +484,9 @@ static bool dw_dp_hpd_detect(struct dw_dp *dp)
 {
 	u32 value;
 
+	if (dp->hpd_gpiod)
+		return gpiod_get_value_cansleep(dp->hpd_gpiod);
+
 	regmap_read(dp->regmap, DW_DP_HPD_STATUS, &value);
 
 	return FIELD_GET(HPD_STATE, value) == DW_DP_HPD_STATE_PLUG;
@@ -2002,6 +2008,12 @@ struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
 		return ERR_CAST(dp->regmap);
 	}
 
+	dp->hpd_gpiod = devm_gpiod_get_optional(dev, "hpd", GPIOD_IN);
+	if (IS_ERR(dp->hpd_gpiod)) {
+		dev_err_probe(dev, PTR_ERR(dp->hpd_gpiod), "failed to get hpd GPIO\n");
+		return ERR_CAST(dp->hpd_gpiod);
+	}
+
 	dp->phy = devm_of_phy_get(dev, dev->of_node, NULL);
 	if (IS_ERR(dp->phy)) {
 		dev_err_probe(dev, PTR_ERR(dp->phy), "failed to get phy\n");
-- 
2.53.0

