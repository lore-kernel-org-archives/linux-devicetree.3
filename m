Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E083C3B3888
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 14:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782571596; cv=none; b=uXOc20P7Aq1QVDMnkWSRAxWr4M2irrgA1SE+drhTYMoJp6icl023nGK6/bRAOGn7GNUVgikVaCNFmkNFP4JcZwRWAx5RpV9ctH7NudDwuAW5nutFk9M4VzzlYqedzuQH/gTW3aKOddq8oiEnX008J0TgRiooT5amzlJ4+FcQdRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782571596; c=relaxed/simple;
	bh=Oo002HTcglBAfCFFjyjyOzwnznk0AWIyUesg5AAWOwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FR1/a6RjBPjlpiAZ1mQ5BNj+goSI35H/1TvrcxQQqdblbdKaaedvK5ybZWxTrDcScvqtoI7IK1I+7PgMPOCB3XNQSkto2TOsum47+O7h4ia31zItEq5WrV4TbaU+NOSl4/PemKV2ceJ0HrttvZBp/TFXso/Ael58d32mxbHu+T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z1XR7So1; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z1XR7So1"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493a548fc99so331495e9.2
        for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 07:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782571590; x=1783176390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YqESZuE/U30jSx/1JI2rDOPCklMIvevdTPnFhlc/3FA=;
        b=Z1XR7So1VZNoLM82MjZ1KN19C2B2PfoQE0HoYTWTPaoMNAau0QaIN19lqWIlZrucvD
         U2TXWfhLAypHfimfLChcmIUVudOXcdHYeh5NUOt/yrGpKaaXyNF+yPE10x6r9OJA12lc
         dFxRqeQ19iqTyFRDCYKKAaCE4X02ZsCz4ct56/j/MoA2WpLPYE6hHtkCN1NXb9UlWPvP
         qs2IRSXLBTXTEajUpSQhEPlqLISpo61vC2InJBDXvbIw1XiRma2dRUdYgthZFHiRQsJk
         wnXQEhe4x3h+OvxpHDzgzBiA04rN5JBOEUWBS73S9Td4gtPFJabITaCQJ3rcUTOX2hdy
         r11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782571590; x=1783176390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YqESZuE/U30jSx/1JI2rDOPCklMIvevdTPnFhlc/3FA=;
        b=mNQ2vsLN7NGXJVkLo0tfjtKn2uhja/EYh/5yAIj6BCrVj4aQFJuDN7g45W6UcwH/bF
         Q0LuKKL7FY18DUVaP86wuaRwxSxoRqxjqK0+SaWc3Cx2Q2upYR1Q115E3wyWVsuFezAS
         k3EXqGVo6Cfno9q+jPXYZ5zHF7y0m2sc5a2x6Wz1uXtqK8INLIa4JGpgHd6byhwv7VKH
         Q1fuLcv7sJxz2sGMLwRoe1OIXDrg0263P5ZLFOkrKviE9RouqFjdr+4s7N/y6aOi2SZd
         cJi3vQNFdTHu8DfnhkytylSm1TJ6Yfgoj5JffXQMFXFv+hEVKT/lCgmg50+Nw0QtnNrA
         0PWQ==
X-Forwarded-Encrypted: i=1; AFNElJ8UH3xmYgWi/t8bQscPP7wmASF8CakQwdEU9UVX2SSo4UmiuPjKMaoZfZpVqI5KAsMu+xnZBZR9xy6s@vger.kernel.org
X-Gm-Message-State: AOJu0YxVgqjA3gP0itsvJdGieNICXQHEd3Olntb67TeEe1Z31gycyehF
	ufaCiR1Jm39ovOVwKNBUJopeKpibyuPwkAr6YlXk7yN1tcS2VGRMVGnt
X-Gm-Gg: AfdE7clQKCWtAGDAX0eG0SvzuN3tkX54K4aj/wSuRv/SBogdLZqPwb4XlZ+K64N21eo
	6r6xwPUT3FH5BazwkvLTaMF1OE6b2+gNT0mkauTU0Zo9hy64rvxo1SHw0k7QPOZkhsgNbH2ToIl
	MuOJ7zM+Z2lzJf/i+G+EGd0RDd5IxYx9ujZ719LUqtZZmMjW3/KIcb/PPqNIXBVaM6CxB7lGbro
	Sb3jjq/5Vp9Xr2ojnTQrpMT4gIKHGV4uC331Vp9l7XaS7uFgZJJMV5UrVZE8GL+EXWdMnA3bZhF
	ewbuanwkKOLPkjPQ9p+fMXMUwhq6fLYI3vg9zfDNANU2rA50JHIreRvO2K/jOVBLkdcmFGmW0D5
	s+qrtrJ+JcfHbvvwfcDUWiLv0kwxGg8coznX8dv07tADw3aEi66u9TqqjXr94CrKy5ERpx6U0ge
	IdL/M6vfbir+h4vt7882skOOLyckgrN9PM+EqngjrOm7yv4HdJW0JgwbXbwNJQK3zbJUK6/POIn
	j2pcBTLTgVLJ6UM3hOjLYG9Gz8=
X-Received: by 2002:a05:600c:5297:b0:493:85ae:2575 with SMTP id 5b1f17b1804b1-49385ae2619mr25929555e9.27.1782571589847;
        Sat, 27 Jun 2026 07:46:29 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.vodafonedsl.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4927038578bsm98709035e9.4.2026.06.27.07.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 07:46:29 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v2 3/3] arm64: dts: imx8mm-var-dart: Add support for Variscite Sonata board
Date: Sat, 27 Jun 2026 16:46:13 +0200
Message-ID: <e7fa5dc7f6f29bfc3f1b7b7e55cbec3758c28f14.1782571383.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782571383.git.stefano.r@variscite.com>
References: <cover.1782571383.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add device tree support for the Variscite Sonata carrier board with the
DART-MX8M-MINI system on module.

The Sonata board includes
- uSD Card support
- USB ports and OTG
- Uart, SPI and I2C interfaces
- GPIO Expanders
- RTC module
- TPM module
- CAN peripherals

Link: https://variscite.com/carrier-boards/sonata-board/
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Remove HDMI from commit message

 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mm-var-dart-sonata.dts  | 517 ++++++++++++++++++
 2 files changed, 518 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 8ddaab127ab9..694c9aa32779 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -166,6 +166,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-prt8mm.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-tqma8mqml-mba8mx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-tx8m-1610-moduline-iv-306-d.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-tx8m-1610-moduline-mini-111.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-dart-sonata.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-som-symphony-legacy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw71xx-0x.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
new file mode 100644
index 000000000000..93b0076987b8
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
@@ -0,0 +1,517 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Variscite Sonata carrier board for DART-MX8M-MINI
+ *
+ * Link: https://variscite.com/carrier-boards/sonata-board/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/phy/phy-imx8-pcie.h>
+#include "imx8mm-var-dart.dtsi"
+
+/ {
+	model = "Variscite DART-MX8M-MINI on Sonata-Board";
+	compatible = "variscite,var-dart-mx8mm-sonata",
+		     "variscite,var-dart-mx8mm",
+		     "fsl,imx8mm";
+
+	chosen {
+		stdout-path = &uart1;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-home {
+			label = "Home";
+			linux,code = <KEY_HOME>;
+			gpios = <&pca6408_1 4 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-up {
+			label = "Up";
+			linux,code = <KEY_UP>;
+			gpios = <&pca6408_1 5 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-down {
+			label = "Down";
+			linux,code = <KEY_DOWN>;
+			gpios = <&pca6408_1 6 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-back {
+			label = "Back";
+			linux,code = <KEY_BACK>;
+			gpios = <&pca6408_1 7 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_leds>;
+
+		led-emmc {
+			gpios = <&gpio4 18 GPIO_ACTIVE_HIGH>;
+			label = "eMMC";
+			linux,default-trigger = "mmc2";
+		};
+	};
+
+	clk40m: oscillator {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <40000000>;
+		clock-output-names = "can_osc";
+	};
+
+	pcie0_refclk: pcie0-refclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
+	reg_usdhc2_vmmc: regulator-vmmc-usdhc2 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_vmmc_usdhc2>;
+		regulator-name = "VSD_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <100>;
+		off-on-delay-us = <12000>;
+	};
+};
+
+&ecspi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi1>;
+	cs-gpios = <&gpio5  9 GPIO_ACTIVE_LOW>,
+		   <&gpio1 12 GPIO_ACTIVE_LOW>;
+	status = "okay";
+
+	/* Resistive touch controller */
+	ads7846: touchscreen@0 {
+		compatible = "ti,ads7846";
+		reg = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_restouch>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+		spi-max-frequency = <1500000>;
+		pendown-gpio = <&gpio1 3 GPIO_ACTIVE_LOW>;
+		ti,x-min = /bits/ 16 <125>;
+		ti,x-max = /bits/ 16 <4008>;
+		ti,y-min = /bits/ 16 <282>;
+		ti,y-max = /bits/ 16 <3864>;
+		ti,x-plate-ohms = /bits/ 16 <180>;
+		ti,pressure-max = /bits/ 16 <255>;
+		ti,debounce-max = /bits/ 16 <10>;
+		ti,debounce-tol = /bits/ 16 <3>;
+		ti,debounce-rep = /bits/ 16 <1>;
+		ti,settle-delay-usec = /bits/ 16 <150>;
+		ti,keep-vref-on;
+		wakeup-source;
+	};
+
+	can0: can@1 {
+		compatible = "microchip,mcp251xfd";
+		reg = <1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_can>;
+		clocks = <&clk40m>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
+		microchip,rx-int-gpios = <&gpio5 4 GPIO_ACTIVE_LOW>;
+		spi-max-frequency = <20000000>;
+	};
+};
+
+&ethphy0 {
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_YELLOW>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+	};
+};
+
+&i2c2 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c2>;
+	pinctrl-1 = <&pinctrl_i2c2_gpio>;
+	scl-gpios = <&gpio5 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	pca9534: gpio@22 {
+		compatible = "nxp,pca9534";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		/* RGB_SEL */
+		lvds-brg-enable-hog {
+			gpio-hog;
+			gpios = <7 GPIO_ACTIVE_HIGH>;
+			output-low;
+			line-name = "rgb_sel";
+		};
+	};
+
+	/* Capacitive touch controller */
+	ft5x06_ts: touchscreen@38 {
+		compatible = "edt,edt-ft5206";
+		reg = <0x38>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_captouch>;
+		reset-gpios = <&pca6408_2 4 GPIO_ACTIVE_LOW>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <14 IRQ_TYPE_EDGE_FALLING>;
+		touchscreen-size-x = <800>;
+		touchscreen-size-y = <480>;
+		touchscreen-inverted-x;
+		touchscreen-inverted-y;
+		wakeup-source;
+	};
+
+	extcon_ptn5150: typec@3d {
+		compatible = "nxp,ptn5150";
+		reg = <0x3d>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_extcon>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <10 IRQ_TYPE_EDGE_FALLING>;
+
+		port {
+			typec1_dr_sw: endpoint {
+				remote-endpoint = <&usb1_drd_sw>;
+			};
+		};
+	};
+
+	rtc@68 {
+		compatible = "dallas,ds1337";
+		reg = <0x68>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_rtc>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <15 IRQ_TYPE_EDGE_FALLING>;
+		wakeup-source;
+	};
+};
+
+&i2c4 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c4>;
+	pinctrl-1 = <&pinctrl_i2c4_gpio>;
+	scl-gpios = <&gpio5 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	pca6408_1: gpio@20 {
+		compatible = "nxp,pcal6408";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pca6408>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	pca6408_2: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	st33ktpm2xi2c: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+		label = "tpm";
+		reset-gpios = <&pca9534 0 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&pcie_phy {
+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
+	fsl,tx-deemph-gen1 = <0x2d>;
+	fsl,tx-deemph-gen2 = <0xf>;
+	clocks = <&pcie0_refclk>;
+	status = "okay";
+};
+
+&pcie0 {
+	reset-gpios = <&pca6408_2 3 GPIO_ACTIVE_LOW>;
+	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
+		 <&clk IMX8MM_CLK_PCIE1_AUX>;
+	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
+			  <&clk IMX8MM_CLK_PCIE1_CTRL>;
+	assigned-clock-rates = <10000000>, <250000000>;
+	assigned-clock-parents = <&clk IMX8MM_SYS_PLL2_50M>,
+				 <&clk IMX8MM_SYS_PLL2_250M>;
+	status = "okay";
+};
+
+&pwm1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm>;
+	status = "okay";
+};
+
+&snvs_pwrkey {
+	status = "okay";
+};
+
+&snvs_rtc {
+	status = "disabled";
+};
+
+/* Console */
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	wakeup-source;
+	status = "okay";
+};
+
+/* Header */
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart2>;
+	status = "okay";
+};
+
+/* Header */
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart3>;
+	status = "okay";
+};
+
+&usbotg1 {
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	adp-disable;
+	usb-role-switch;
+	disable-over-current;
+	samsung,picophy-pre-emp-curr-control = <3>;
+	samsung,picophy-dc-vol-level-adjust = <7>;
+	status = "okay";
+
+	port {
+		usb1_drd_sw: endpoint {
+			remote-endpoint = <&typec1_dr_sw>;
+		};
+	};
+};
+
+&usbotg2 {
+	dr_mode = "host";
+	samsung,picophy-pre-emp-curr-control = <3>;
+	samsung,picophy-dc-vol-level-adjust = <7>;
+	disable-over-current;
+	status = "okay";
+};
+
+/* SD */
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
+	bus-width = <4>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_can: cangrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO06_GPIO1_IO6		0x16
+			MX8MM_IOMUXC_SPDIF_RX_GPIO5_IO4			0x16
+		>;
+	};
+
+	pinctrl_captouch: captouchgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO14_GPIO1_IO14		0x16
+		>;
+	};
+
+	pinctrl_ecspi1: ecspi1grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_ECSPI1_SCLK_ECSPI1_SCLK		0x13
+			MX8MM_IOMUXC_ECSPI1_MOSI_ECSPI1_MOSI		0x13
+			MX8MM_IOMUXC_ECSPI1_MISO_ECSPI1_MISO		0x13
+			MX8MM_IOMUXC_ECSPI1_SS0_GPIO5_IO9		0x13
+			MX8MM_IOMUXC_GPIO1_IO12_GPIO1_IO12		0x13
+			MX8MM_IOMUXC_SAI2_RXC_GPIO4_IO22		0x13
+		>;
+	};
+
+	pinctrl_extcon: extcongrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO10_GPIO1_IO10		0x19
+		>;
+	};
+
+	pinctrl_gpio_leds: ledgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI1_TXD6_GPIO4_IO18		0x1c6
+		>;
+	};
+
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C2_SCL_I2C2_SCL			0x400001c3
+			MX8MM_IOMUXC_I2C2_SDA_I2C2_SDA			0x400001c3
+		>;
+	};
+
+	pinctrl_i2c2_gpio: i2c2-gpiogrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C2_SCL_GPIO5_IO16		0x400001c3
+			MX8MM_IOMUXC_I2C2_SDA_GPIO5_IO17		0x400001c3
+		>;
+	};
+
+	pinctrl_i2c4: i2c4grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C4_SCL_I2C4_SCL			0x400001c3
+			MX8MM_IOMUXC_I2C4_SDA_I2C4_SDA			0x400001c3
+		>;
+	};
+
+	pinctrl_i2c4_gpio: i2c4-gpiogrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C4_SCL_GPIO5_IO20		0x400001c3
+			MX8MM_IOMUXC_I2C4_SDA_GPIO5_IO21		0x400001c3
+		>;
+	};
+
+	pinctrl_pca6408: pca6408grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO05_GPIO1_IO5		0x1c6
+		>;
+	};
+
+	pinctrl_pwm: pwmgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO01_PWM1_OUT		0x06
+		>;
+	};
+
+	pinctrl_vmmc_usdhc2: regvmmc-usdhc2grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_RESET_B_GPIO2_IO19		0xc1
+		>;
+	};
+
+	pinctrl_restouch: restouchgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x1c0
+		>;
+	};
+
+	pinctrl_rtc: rtcgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO15_GPIO1_IO15		0x1c1
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_UART1_RXD_UART1_DCE_RX		0x140
+			MX8MM_IOMUXC_UART1_TXD_UART1_DCE_TX		0x140
+		>;
+	};
+
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_UART2_RXD_UART2_DCE_RX		0x140
+			MX8MM_IOMUXC_UART2_TXD_UART2_DCE_TX		0x140
+		>;
+	};
+
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_UART3_RXD_UART3_DCE_RX		0x140
+			MX8MM_IOMUXC_UART3_TXD_UART3_DCE_TX		0x140
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK			0x190
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD			0x1d0
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0		0x1d0
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d0
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d0
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d0
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0x1d0
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK			0x194
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD			0x1d4
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0		0x1d4
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d4
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d4
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d4
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0x1d0
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK			0x196
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD			0x1d6
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0		0x1d6
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d6
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d6
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d6
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0x1d0
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CD_B_GPIO2_IO12		0xc1
+		>;
+	};
+};
-- 
2.47.3

