Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B455B37755D
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 17:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783705405; cv=none; b=R/bGXPfxmU50Z3FWjfwfqXGpHoMmtP8z7BIfjpUvPs65+HExEYpjiSZm8Q0ofdignD1LnUIYCPQDX1Cw3cum4NIgGNoYy9THCkTDUCADnoCzWc6t0/cg/h0PzKG73AtIQSU4bGDaM4zVoZVl0g9FyGIuMEl3YDdSQJLjkoUNqYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783705405; c=relaxed/simple;
	bh=Vmh0fIcV2gX1hOoW+3CLel4Ov2REWpbV4wMVJ7YAkQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FGaPWxkilArfnoFQ6EroiEAuz9HTbD7GdvnCMTS+iINag/alWwWGS7HylqWTH0sDm6CwW+1CuoQLN13MoZp0DoBsCHCliZUb3TXTac7UCj4O0LB0fxmW/uNUNmBbkWOn0bVbwxy8l4Fi+X9sXQ+cZRvBhn+dLlYMJAH3VQ9qEuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RsiYi6oI; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RsiYi6oI"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso812347f8f.3
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 10:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783705402; x=1784310202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M0XHen8IR69lr0Mvi6TF7SKZT2IXesgxyeuXi2HTHdY=;
        b=RsiYi6oI7oLEDeDxOx9w/EXfygrawsAHWPbIyJJO3xNWuokmBEis6/7koAo8BEIJvq
         Xs7pHQXDKLp3s96fSHMmmT2sJd11ZCRns7t4zbetq83BhYPZic42dWDxJc/e0+1+lBx9
         tWolYJ2ZS+4t+0ank3/OktehF+JQNCjWo+2dXS5a9q3jTdi1pygzG22UeDJKo2k0ZarM
         6Sbz/Vgz+g8pQ8zv0ns9z08nWiWabFmaJW1qfRPuVxM38dK5BuGT89OOHf9G8S3e5qRA
         hx7ILJ62jO9wxbuE3BfdlEdGjqT+y+DReyMbx5UeyCY4vBudjpv1tza4YaAFYmkpEBTF
         OugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783705402; x=1784310202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M0XHen8IR69lr0Mvi6TF7SKZT2IXesgxyeuXi2HTHdY=;
        b=kDeIgoyagLR7+ZqZLqltBPsSbfrzAYHujCIzgE56I9z6QbT1Mw5gEcZxMb+al8nYeu
         Y3xjB/fsjQgUZMGVyoCoiNK4e/MTG28/f1gIrTSQfYPQKsm+ehtukd2dWsfkh7q56cft
         hbo9nAIL6mUyOwIi9aaVMkCpOB8zMZsIaHDfUvbA/hSIWt2T90K88LJlplPsxHnckLmw
         60jik/bjGEUBNeFgJYHETlNtBBJZyj/phcLg/ko/dQUfm3IIfr4JNvL5B7EiWMhESsVo
         gJ/tc4Mj6TWDXdFjz1cPytd8eE5pnnfZTiTZ1umNSe+Lm3ztrVTc6RpNfUWierLiWQYq
         GXXQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqqpzg3LKDNe++kItmlGyTeySNflfAq+aghNinLEG4J4yNaXaEiaa2Q5qgGh/ARdf6drzUWji+t5xj6@vger.kernel.org
X-Gm-Message-State: AOJu0YxwhpWQQev3VcsUDxYxeG9XONqSyjulX5CwUMfX7h9dsms2fG/B
	jLFxxkTne4eVkKSAidDiOzQujUDlr3lYr7ZdI6zXuUsyzyQxpivGHrRv
X-Gm-Gg: AfdE7cmsVLgM/DzHa8xLXqr236xJEzpUiQ6ou6ve7327+YsEP3Yx4rJJzueSQ85+XtT
	DRsrKIeXzKYlnRJgSZf6W9abTlAt3CDOcSoGFQLqg6rbJQw8xneua674+yB5ZdpDimWyqVnElsC
	5A9BcjK04qfioihfuUMQ7DwnpZkYiy9o4fYqSvPVsymCEnSdKOyAChtMKnjBJ6+0P3JXfU8rTmJ
	YAO9bdqijkEXIVYQE8ADN48ee9pYNa+rRyGeWjpstYkw4OYGNslj5D+k0KPbTZ+KiaVRFn/W88Y
	9WsnFCyk17yVawQOB7CVJnwIgCzfoXc2jVmYqv0cjfNCZUWm/YSXnC2rkaOoDAy+EUgOdegnWZp
	PCnB7SqdlnP9v6bjlizjAfFccPQytU5bB+NBxuh/5ktztGdYGIomWB+BUK8GxSNWgQR/059TgzC
	G8pGdxjtWKw2IRg6KbiOUj2/im3yuttH7tjO+5kNKaE4iizRJpV8a5
X-Received: by 2002:a05:6000:26d3:b0:474:3b3b:5e5f with SMTP id ffacd0b85a97d-47df072b06bmr13539693f8f.16.1783705401985;
        Fri, 10 Jul 2026 10:43:21 -0700 (PDT)
Received: from GLaDOS.station ([185.81.127.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d91bsm67170201f8f.4.2026.07.10.10.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 10:43:21 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	matthias.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: [PATCH v3 3/3] arm64: dts: ti: var-som-am62: Add support for Variscite Symphony Board
Date: Fri, 10 Jul 2026 19:43:09 +0200
Message-ID: <3f58a10e07d9a353c7c18f7d3ec8ea1f4c08f4f0.1783689915.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783689915.git.stefano.r@variscite.com>
References: <cover.1783689915.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add device tree support for the Variscite Symphony carrier board with
the VAR-SOM-AM62 system on module.

The Symphony board includes
- uSD Card support
- USB ports and OTG
- Additional Gigabit Ethernet interface
- Uart interfaces
- OV5640 Camera support
- GPIO Expander and TPM
- CAN, I2C and general purpose interfaces
- Capacitive touch controller

Link: https://www.variscite.it/product/single-board-computers/symphony-board/
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - Fix reg_sdhc1_vmmc regulator
 - Add missing properties on pca9534 node

v1->v2:
 - Fix reg_sdhc1_vmmc pinctrl
 - Add reg_ov5640_buf_en pinctrl

 arch/arm64/boot/dts/ti/Makefile               |   1 +
 .../boot/dts/ti/k3-am625-var-som-symphony.dts | 555 ++++++++++++++++++
 2 files changed, 556 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-var-som-symphony.dts

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 371f9a043fe5..e33c4d0363a9 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -29,6 +29,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay-csi2-tevi-ov5640.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-phyboard-lyra-rdk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-tqma62xx-mba62xx.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am625-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dev-mezzanine-can.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dev-nau8822-btl.dtbo
diff --git a/arch/arm64/boot/dts/ti/k3-am625-var-som-symphony.dts b/arch/arm64/boot/dts/ti/k3-am625-var-som-symphony.dts
new file mode 100644
index 000000000000..e2fba95d9b94
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-var-som-symphony.dts
@@ -0,0 +1,555 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Variscite Symphony carrier board for VAR-SOM-AM62
+ *
+ * Link: https://www.variscite.it/product/single-board-computers/symphony-board/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ * Copyright (C) 2026 Stefano Radaelli <stefano.r@variscite.com>
+ *
+ */
+
+/dts-v1/;
+
+#include "k3-am625-var-som.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-AM62 on Symphony-Board";
+	compatible = "variscite,var-som-am62-symphony", "variscite,var-som-am62", "ti,am625";
+
+	aliases {
+		ethernet0 = &cpsw_port1;
+		ethernet1 = &cpsw_port2;
+		mmc0 = &sdhci0;
+		mmc1 = &sdhci1;
+		mmc2 = &sdhci2;
+		serial0 = &main_uart0;
+		serial2 = &main_uart2;
+		serial5 = &main_uart5;
+		serial6 = &main_uart6;
+		spi5 = &main_spi2;
+		usb0 = &usb0;
+		usb1 = &usb1;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	clk_ov5640_fixed: clock-24000000 {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <24000000>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-back {
+			label = "Back";
+			linux,code = <KEY_BACK>;
+			gpios = <&pca9534 1 GPIO_ACTIVE_LOW>;
+		};
+
+		button-home {
+			label = "Home";
+			linux,code = <KEY_HOME>;
+			gpios = <&pca9534 2 GPIO_ACTIVE_LOW>;
+		};
+
+		button-menu {
+			label = "Menu";
+			linux,code = <KEY_MENU>;
+			gpios = <&pca9534 3 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+
+		led-heartbeat {
+			label = "Heartbeat";
+			linux,default-trigger = "heartbeat";
+			gpios = <&pca9534 0 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	reg_2p8v: regulator-2p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "2P8V";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		vin-supply = <&reg_3v3>;
+		regulator-always-on;
+	};
+
+	reg_1p8v: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "1P8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&reg_3v3>;
+		regulator-always-on;
+	};
+
+	reg_1p5v: regulator-1p5v {
+		compatible = "regulator-fixed";
+		regulator-name = "1P5V";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+		vin-supply = <&reg_3v3>;
+		regulator-always-on;
+	};
+
+	reg_sdhc1_vmmc: regulator-sdhc1 {
+		compatible = "regulator-fixed";
+		regulator-name = "+V3.3_SD";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_sd1_vmmc>;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		enable-active-high;
+		gpios = <&main_gpio0 30 GPIO_ACTIVE_HIGH>;
+		bootph-all;
+	};
+
+	reg_sdhc1_vqmmc: regulator-sdhci1-vqmmc {
+		compatible = "regulator-gpio";
+		regulator-name = "+V3.3_SD_VQMMC";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_sd1_vqmmc>;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		gpios = <&main_gpio0 56 GPIO_ACTIVE_HIGH>;
+		states = <1800000 0x0>,
+			 <3300000 0x1>;
+		bootph-all;
+	};
+
+	reg_ov5640_buf_en: regulator-camera-buf-en {
+		compatible = "regulator-fixed";
+		regulator-name = "ov5640_buf_en";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_ov5640_buf>;
+		gpios = <&main_gpio0 21 GPIO_ACTIVE_HIGH>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	transceiver1: can-phy {
+		compatible = "ti,tcan1042";
+		#phy-cells = <0>;
+		max-bitrate = <5000000>;
+	};
+
+	connector {
+		compatible = "gpio-usb-b-connector", "usb-b-connector";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_extcon>;
+		label = "USB-C";
+		id-gpios = <&main_gpio1 12 GPIO_ACTIVE_HIGH>;
+		status = "okay";
+
+		port {
+			usb_con_hs: endpoint {
+				remote-endpoint = <&typec_hs>;
+			};
+		};
+	};
+};
+
+&cdns_csi2rx0 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		csi0_port0: port@0 {
+			reg = <0>;
+			status = "okay";
+
+			csi2rx0_in_sensor: endpoint {
+				remote-endpoint = <&csi2_cam0>;
+				bus-type = <4>; /* CSI2 DPHY. */
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
+
+&cpsw3g {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii1>,
+		    <&pinctrl_rgmii2>;
+	status = "okay";
+
+	cpts@3d000 {
+		/* MAP HW3_TS_PUSH to GENF1 */
+		ti,pps = <2 1>;
+	};
+};
+
+&cpsw3g_mdio {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mdio1>;
+	status = "okay";
+
+	cpsw3g_phy1: ethernet-phy@5 {
+		compatible = "ethernet-phy-id0283.bc30";
+		reg = <5>;
+		reset-gpios = <&pca9534 5 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <100000>;
+	};
+};
+
+&cpsw_port2 {
+	/*
+	 * The required RGMII TX and RX 2ns delays are implemented directly
+	 * in hardware via passive delay elements on the Symphony PCB.
+	 * No delay configuration is needed in software via PHY driver.
+	 */
+	phy-mode = "rgmii";
+	phy-handle = <&cpsw3g_phy1>;
+	status = "okay";
+};
+
+&dphy0 {
+	status = "okay";
+};
+
+&epwm1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_epwm1>;
+};
+
+&main_i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c0>;
+	clock-frequency = <400000>;
+	status = "okay";
+
+	/* GPIO expander */
+	pca9534: gpio@20 {
+		compatible = "nxp,pca9534";
+		reg = <0x20>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pca9534>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&main_gpio1>;
+		interrupts = <30 IRQ_TYPE_EDGE_FALLING>;
+
+		usb3-sel-hog {
+			gpio-hog;
+			gpios = <4 0>;
+			output-low;
+			line-name = "usb3_sel";
+		};
+
+		eth-som-vselect-hog {
+			gpio-hog;
+			gpios = <6 0>;
+			output-low;
+			line-name = "eth-vselect";
+		};
+
+		eth-mdio-enable-hog {
+			gpio-hog;
+			gpios = <7 0>;
+			output-high;
+			line-name = "eth-mdio-enable";
+		};
+	};
+
+	ov5640: camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&clk_ov5640_fixed>;
+		clock-names = "xclk";
+		AVDD-supply = <&reg_2p8v>;
+		DOVDD-supply = <&reg_1p8v>;
+		DVDD-supply = <&reg_1p5v>;
+		powerdown-gpios = <&main_gpio0 10 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&main_gpio0 22 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_ov5640>;
+
+		port {
+			csi2_cam0: endpoint {
+				remote-endpoint = <&csi2rx0_in_sensor>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
+
+&main_i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c1>;
+	clock-frequency = <400000>;
+	status = "okay";
+
+	pcal6408: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		/* RGB_SEL */
+		lvds-brg-enable-hog {
+			gpio-hog;
+			gpios = <7 GPIO_ACTIVE_HIGH>;
+			output-low;
+			line-name = "lvds_brg_en";
+		};
+	};
+
+	st33ktpm2xi2c: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		label = "tpm";
+		reg = <0x2e>;
+		reset-gpios = <&pcal6408 4 GPIO_ACTIVE_LOW>;
+	};
+
+	/* Capacitive touch controller */
+	ft5x06_ts: touchscreen@38 {
+		compatible = "edt,edt-ft5206";
+		reg = <0x38>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_captouch_pins>;
+		interrupt-parent = <&main_gpio1>;
+		interrupts = <16 IRQ_TYPE_EDGE_FALLING>;
+		touchscreen-size-x = <800>;
+		touchscreen-size-y = <480>;
+		touchscreen-inverted-x;
+		touchscreen-inverted-y;
+		wakeup-source;
+	};
+
+	rtc@68 {
+		compatible = "dallas,ds1337";
+		reg = <0x68>;
+	};
+};
+
+&main_mcan0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mcan0>;
+	phys = <&transceiver1>;
+	status = "okay";
+};
+
+&main_pmx0 {
+	pinctrl_captouch_pins: main-captouch-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x01b8, PIN_INPUT, 7) /* (C13) SPI0_CS1.GPIO1_16 */
+		>;
+	};
+
+	pinctrl_epwm1: main-epwm1-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x019c, PIN_OUTPUT, 6) /* (B18) MCASP0_AXR1.EHRPWM1_A */
+		>;
+	};
+
+	pinctrl_extcon: main-extcon-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x01a8, PIN_INPUT, 7) /* (D20) MCASP0_AFSX.GPIO1_12 */
+		>;
+	};
+
+	pinctrl_i2c0: main-i2c0-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x1e0, PIN_INPUT_PULLUP, 0) /* (B16) I2C0_SCL */
+			AM62X_IOPAD(0x1e4, PIN_INPUT_PULLUP, 0) /* (A16) I2C0_SDA */
+		>;
+	};
+
+	pinctrl_i2c1: main-i2c1-default-pins {
+		bootph-all;
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x1e8, PIN_INPUT_PULLUP, 0) /* (B17) I2C1_SCL */
+			AM62X_IOPAD(0x1ec, PIN_INPUT_PULLUP, 0) /* (A17) I2C1_SDA */
+		>;
+	};
+
+	pinctrl_mcan0: main-mcan0-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x1dc, PIN_INPUT, 0) /* (E15) MCAN0_RX */
+			AM62X_IOPAD(0x1d8, PIN_OUTPUT, 0) /* (C15) MCAN0_TX */
+		>;
+	};
+
+	pinctrl_mmc1: main-mmc1-default-pins {
+		bootph-all;
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x23c, PIN_INPUT, 0) /* (A21) MMC1_CMD */
+			AM62X_IOPAD(0x234, PIN_INPUT, 0) /* (B22) MMC1_CLK */
+			AM62X_IOPAD(0x230, PIN_INPUT, 0) /* (A22) MMC1_DAT0 */
+			AM62X_IOPAD(0x22c, PIN_INPUT, 0) /* (B21) MMC1_DAT1 */
+			AM62X_IOPAD(0x228, PIN_INPUT, 0) /* (C21) MMC1_DAT2 */
+			AM62X_IOPAD(0x224, PIN_INPUT, 0) /* (D22) MMC1_DAT3 */
+			AM62X_IOPAD(0x240, PIN_INPUT, 0) /* (D17) MMC1_SDCD */
+		>;
+	};
+
+	pinctrl_ov5640: main-ov5640-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x0028, PIN_OUTPUT, 7) /* (J22) OSPI0_D7.GPIO0_10 */
+			AM62X_IOPAD(0x0058, PIN_OUTPUT, 7) /* (R23) GPMC0_AD7.GPIO0_22 */
+		>;
+	};
+
+	pinctrl_ov5640_buf: main-ov5640-buf-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x0054, PIN_OUTPUT, 7) /* (P21) GPMC0_AD6.GPIO0_21 */
+		>;
+	};
+
+	pinctrl_pca9534: main-pca9534-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x01f0, PIN_INPUT, 7) /* (A18) EXT_REFCLK1.GPIO1_30 */
+		>;
+	};
+
+	pinctrl_rgmii2: main-rgmii2-default-pins {
+		bootph-all;
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x184, PIN_INPUT, 0) /* (AE23) RGMII2_RD0 */
+			AM62X_IOPAD(0x188, PIN_INPUT, 0) /* (AB20) RGMII2_RD1 */
+			AM62X_IOPAD(0x18c, PIN_INPUT, 0) /* (AC21) RGMII2_RD2 */
+			AM62X_IOPAD(0x190, PIN_INPUT, 0) /* (AE22) RGMII2_RD3 */
+			AM62X_IOPAD(0x180, PIN_INPUT, 0) /* (AD23) RGMII2_RXC */
+			AM62X_IOPAD(0x17c, PIN_INPUT, 0) /* (AD22) RGMII2_RX_CTL */
+			AM62X_IOPAD(0x16c, PIN_INPUT, 0) /* (Y18) RGMII2_TD0 */
+			AM62X_IOPAD(0x170, PIN_INPUT, 0) /* (AA18) RGMII2_TD1 */
+			AM62X_IOPAD(0x174, PIN_INPUT, 0) /* (AD21) RGMII2_TD2 */
+			AM62X_IOPAD(0x178, PIN_INPUT, 0) /* (AC20) RGMII2_TD3 */
+			AM62X_IOPAD(0x168, PIN_INPUT_PULLDOWN, 0) /* (AE21) RGMII2_TXC */
+			AM62X_IOPAD(0x164, PIN_INPUT, 0) /* (AA19) RGMII2_TX_CTL */
+		>;
+	};
+
+	pinctrl_sd1_vmmc: main-sd1-vmmc-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x0078, PIN_OUTPUT, 7) /* (U24) GPMC0_AD15.GPIO0_30 */
+		>;
+	};
+
+	pinctrl_sd1_vqmmc: main-sd1-vqmmc-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x00e4, PIN_OUTPUT, 7) /* (AA23) VOUT0_DATA11.GPIO0_56 */
+		>;
+	};
+
+	pinctrl_spi2: main_spi2-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x01b0, PIN_INPUT, 1) /* (A20) MCASP0_ACLKR.SPI2_CLK */
+			AM62X_IOPAD(0x0194, PIN_OUTPUT, 1) /* (B19) MCASP0_AXR3.SPI2_D0 */
+			AM62X_IOPAD(0x0198, PIN_INPUT, 1) /* (A19) MCASP0_AXR2.SPI2_D1 */
+			AM62X_IOPAD(0x01ac, PIN_OUTPUT, 7) /* (E19) MCASP0_AFSR.GPIO1_13 */
+		>;
+	};
+
+	pinctrl_uart0: main-uart0-default-pins {
+		bootph-all;
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x1c8, PIN_INPUT, 0) /* (D14) UART0_RXD, change muxmode from 0 to 7 to deactivate Debug UART RXD */
+			AM62X_IOPAD(0x1cc, PIN_OUTPUT, 0) /* (E14) UART0_TXD */
+		>;
+	};
+
+	pinctrl_uart2: main-uart2-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x005c, PIN_INPUT_PULLUP, 2) /* (R24) GPMC0_AD8.UART2_RXD */
+			AM62X_IOPAD(0x0060, PIN_OUTPUT, 2) /* (R25) GPMC0_AD9.UART2_TXD */
+		>;
+	};
+
+	pinctrl_uart6: main-uart6-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x009c, PIN_INPUT, 3) /* (V25) GPMC0_WAIT1.UART6_RXD */
+			AM62X_IOPAD(0x0244, PIN_OUTPUT, 1) /* (C17) MMC1_SDWP.UART6_TXD */
+		>;
+	};
+
+	pinctrl_usb1: main-usb1-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x0258, PIN_OUTPUT, 0) /* (F18) USB1_DRVVBUS */
+		>;
+	};
+};
+
+&main_spi2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi2>;
+	ti,pindir-d0-out-d1-in;
+	cs-gpios = <&main_gpio1 13 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+};
+
+&main_uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart0>;
+	status = "okay";
+};
+
+&main_uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart2>;
+	status = "okay";
+};
+
+&main_uart6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart6>;
+	status = "okay";
+};
+
+&sdhci1 {
+	/* SD Card */
+	vmmc-supply = <&reg_sdhc1_vmmc>;
+	vqmmc-supply = <&reg_sdhc1_vqmmc>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mmc1>;
+	disable-wp;
+	bootph-all;
+	status = "okay";
+};
+
+&ti_csi2rx0 {
+	status = "okay";
+};
+
+&usb0 {
+	usb-role-switch;
+	status = "okay";
+
+	port {
+		typec_hs: endpoint {
+			remote-endpoint = <&usb_con_hs>;
+		};
+	};
+};
+
+&usb1 {
+	dr_mode = "host";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usb1>;
+	status = "okay";
+};
+
+&usbss0 {
+	status = "okay";
+};
+
+&usbss1 {
+	status = "okay";
+};
-- 
2.47.3

