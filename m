Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445A146C85E
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 10:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788346008; cv=none; b=HUZRTaDESkMJgmWSMMQcSiJ3pT/8XzfkSziUMva3G5WEG8Rn+Z9xO38oKzXn2VYVOhEGE0L/PvaCA+xf4ChADnSyfQO+YreRkoGmgMlprGCeiwTgHDG5uYvq+jrICH07W3bnObShOnFQjhtDxNwF3ZJTgfNDXqsSwcuyiJ79jv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788346008; c=relaxed/simple;
	bh=8gj9eO22nPx3TOQlZGxLu5kUg+rOAq3qffcZbiVG024=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kTLR73bh2qEC8Q6OIrmqPl7Af12NAnXE9xjwivIMbH5HUNOF3Xpk4X5D0BIf0M+QKVjXklURndxZWoL5OnNxfJbPPDQ4ZJbI7/J+yKuuDEI4LT+WJTd/dOOKx7/Z79XP5rC7EYes/SN6HJwaDfYNPKCp5DcsD7bq1Wbk+XHSdX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za; spf=none smtp.mailfrom=ffroot.co.za; dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b=eiEJbY18; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b="eiEJbY18"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so9893345e9.1
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 03:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1788345999; x=1788950799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SYu2Vt6FrK2lOaa8h2hDcB0E3/wKfWbYEhbeZHIZOeY=;
        b=eiEJbY18uvSvhke8zhgUmEkfj/rakujeymktTXAPvOsMQ17NfBWkZ2S/fQXtwiX8+4
         Ulp57IwjVreaUZgOi1ynYIi8VDfONejARchzXIvkBaGthbOkdkRDYT0n/dB9DmP3nufo
         zuOPV/YNhKUidmcCBS1hvjZJuRl907BkpCqX0mZlwlATWSxSfsA9UN8wgWAD3TSsOeHT
         6BDssKNzUQMbqb1GeEe8FpGsoIqSzxzz1VTpIFGJEPWRROAo4jPATi5yqZj0HinKfu14
         YhaDTz2Y4w4c0RIPuPVQDA5PmzKBv9/q8/rEbTeYNWrac8UW+OBH2gp4SweF2UZT/Ok8
         C03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788345999; x=1788950799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SYu2Vt6FrK2lOaa8h2hDcB0E3/wKfWbYEhbeZHIZOeY=;
        b=jubG5ci/PU23CvEIBTwF1SFltOe7L6K1lESMjejFaKF5cHmwMrz0nOqdmEzgvI0hyo
         Ig7qgVJJsRGT+6Cg9sfnR5EM7WoZbKewjWWuLDFJfUWHZ4/rHcPH8GtJ8bUe8zalHDI9
         I49V6/dWkoLGW+xmPA4l9EocznVg9pokwAez8zlprGGJaud8GY9NCSe5EvoZhP3bCLRn
         VBKIGvLX4KlaxXemv24wl721hx5JFEWwSPYo87Hu4fFL/SgHJmVH7rTCgr/scHVsqMs9
         CBxP/VBz4pKD1CO+J5qBe6EHX04fMhEKQHoPEfB5fTqYlYT55Vt7ok/BlGTeVvKwJsrf
         VPZQ==
X-Forwarded-Encrypted: i=1; AHgh+RoeyMJXQnrpMZEFRi2sgyg5y/lAPVDpOsWsq5KVmHrtDq6dG6TjQxCR8iGNKNQWsqTtkVP9gJvVWTFB@vger.kernel.org
X-Gm-Message-State: AFuF++k+04UdbM1amTCEQSfIUok64ZxxgBHYd9xbHjWSZcV8cKlEBmNC
	vb1Q+RnSyM4Mo9H0IW030v5yWPdqDjQjwbGQz+c/pjw6I5yQiHBu78DG/zeUWxFwYuU=
X-Gm-Gg: AR+sD10Cs+Ogi6mkGH9Z8MSdGr2jllGYq8EAwuOtsk1RNKEHGlRPFq3OfyIjkJJqXKc
	gxr5sU4vD+4C3pHe+K6u1z3OTyf6qdgTdPafQ8AYL5XskS64CGRLg30Lt7PPMvaiWvZEMyIYl/M
	+X31UjdLhctJB2W3+8pIz/5OYhVMZsZVAYgU/m8alD1QBjHQHT2i8pmX/0wfvEfRC4iOWww8CHp
	6lldS1MA1ZpHoAUll6X4mgP1sgKlH42biUMMnz9VZwH4JssEMY8AAIn6wBFIiY5hNfvbVCmV+lC
	N38fDpaeraccplunweo+jxCbEzQuLl5fBcnfvOaU/Qf7lszEWnszwfZOB0tdxJsg7i5JJhWdxhC
	Z4+R9NyJ4EGnmr2ckBXgO2+auQVzyCE+4xVHSO7WgmD2RHMbj7Y7g3jeiT6hllrylCm3OVVytw+
	huxcBBDf1AaC35AJo8beEgEkPLHhthCRlRWgKV5eIVgkjYqVMBBf6Jsfcr2lm4TN5HSgMk1ZHBt
	p//aBbjMG2qXeW/TgipJ/A=
X-Received: by 2002:a05:600c:6091:b0:499:a760:722f with SMTP id 5b1f17b1804b1-49ce583270emr71190875e9.13.1788345999154;
        Wed, 02 Sep 2026 03:46:39 -0700 (PDT)
Received: from dev-ag.figment.co.za ([102.33.165.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5936a5esm20127665e9.3.2026.09.02.03.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:46:38 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: qinjian@cqplus1.com,
	linux-arm-kernel@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	devicetree@vger.kernel.org,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH 2/2] arm: sunplus: add Tibbo LTPP3G2 board support; update defconfig
Date: Wed,  2 Sep 2026 12:45:45 +0200
Message-ID: <20260902104545.67794-3-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902104545.67794-1-ag@ffroot.co.za>
References: <20260902104545.67794-1-ag@ffroot.co.za>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a device tree source for the Tibbo LTPP3G2 board based on the
SP7021 SoC. The board features a quad-core ARM Cortex-A7 processor,
4GB eMMC, 10/100 Ethernet via the L2SW switch, and a PWM-controlled
LED.

Enable CONFIG_ARM_ERRATA_814220 to work around a known Cortex-A7 r0p5
erratum.

Enable CGROUP and SECURITY so that the shipped rootfs will boot.

Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
 arch/arm/boot/dts/sunplus/Makefile            |   5 +-
 .../dts/sunplus/sunplus-sp7021-ltpp3g2.dts    | 301 ++++++++++++++++++
 arch/arm/configs/sp7021_defconfig             |  30 ++
 3 files changed, 333 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dts

diff --git a/arch/arm/boot/dts/sunplus/Makefile b/arch/arm/boot/dts/sunplus/Makefile
index 868f2ea0c127..25ba2e530c35 100644
--- a/arch/arm/boot/dts/sunplus/Makefile
+++ b/arch/arm/boot/dts/sunplus/Makefile
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_SOC_SP7021) += \
-	sunplus-sp7021-demo-v3.dtb
-dtb-$(CONFIG_SOC_SP7021) += \
-	sunplus-sp7021-demo-v3.dtb
+	sunplus-sp7021-demo-v3.dtb \
+	sunplus-sp7021-ltpp3g2.dtb
diff --git a/arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dts b/arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dts
new file mode 100644
index 000000000000..c42e6f779ce3
--- /dev/null
+++ b/arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dts
@@ -0,0 +1,301 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for Tibbo LTPP board G2
+ *
+ * Copyright (C) 2021 Sunplus Technology Co.
+ */
+
+/dts-v1/;
+
+#include "sunplus-sp7021-achip.dtsi"
+
+/ {
+	compatible = "tibbo,ltpp3g2", "sunplus,sp7021";
+	model = "Tibbo LTPP3G2";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		bootargs = "console=ttySUP0,115200 earlycon root=/dev/mmcblk0p8 rootwait";
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x00000000 0x20000000>; /* 512MB */
+	};
+
+	led {
+		compatible = "gpio-leds";
+		pinctrl-names = "default", "sleep";
+		pinctrl-0 = <&gpio_leds_pins>;
+		pinctrl-1 = <&leds_s0_slp>;
+		system-led {
+			label = "system-led";
+			gpios = <&pctl 6 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+			linux,default-trigger = "heartbeat";
+		};
+		led@2 {
+			label = "SG";
+			gpios = <&pctl 7 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+			default-state = "off";
+		};
+	};
+
+	i2c_tps: i2c-tps { /* eeprom */
+		compatible = "i2c-gpio";
+		i2c-gpio,scl-open-drain;
+		i2c-gpio,sda-open-drain;
+		i2c-gpio,delay-us = <1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pins_i2ctps>;
+		gpios = <&pctl 2 GPIO_ACTIVE_HIGH  /* SDA */
+			 &pctl 1 GPIO_ACTIVE_HIGH  /* SCL */
+			>;
+		eeprom: eeprom@50 {
+			compatible = "at,24c16";
+			reg = <0x50>;
+			pagesize = <16>;
+		};
+	};
+};
+
+&pwm {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_pwm>;
+	status = "okay";
+};
+
+&spi_controller0 {
+	spi-cpha;
+	spi-cpol;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_spi0>;
+	status = "disabled";
+};
+
+&spi_controller1 {
+	spi-cpha;
+	spi-cpol;
+	status = "disabled";
+};
+
+&spi_controller2 {
+	spi-cpha;
+	spi-cpol;
+	status = "disabled";
+};
+
+&spi_controller3 {
+	spi-slave;
+	status = "disabled";
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_uart1>;
+	status = "disabled";
+};
+
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_uart2>;
+	status = "disabled";
+};
+
+&uart3 {
+	status = "disabled";
+};
+
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_btuart &pins_bt_reset>;
+	status = "disabled";
+};
+
+&l2sw {
+	pinctrl-names = "default";
+	pinctrl-0 = <&l2sw_ltpp3g2_pins>;
+	status = "okay";
+
+	ethernet-ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			phy-handle = <&eth_phy0>;
+			phy-mode = "rmii";
+			nvmem-cells = <&mac_addr0>;
+			nvmem-cell-names = "mac-address";
+		};
+
+		port@1 {
+			reg = <1>;
+			phy-handle = <&eth_phy1>;
+			phy-mode = "rmii";
+			nvmem-cells = <&mac_addr1>;
+			nvmem-cell-names = "mac-address";
+		};
+	};
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		eth_phy0: ethernet-phy@0 {
+			reg = <0>;
+		};
+		eth_phy1: ethernet-phy@1 {
+			reg = <1>;
+		};
+	};
+};
+
+
+&mmc0 {
+	status = "okay";
+};
+
+&rtc {
+	charging-mode = <0xE>;
+	/*
+	 *      0xE     Disable
+	 *      0x1     0.86mA (2K Ohm with diode)
+	 *      0x5     1.81mA (250 Ohm with diode)
+	 *      0x9     2.07mA (50 Ohm with diode)
+	 *      0xD     16.0mA (0 Ohm with diode)
+	 *      0x3     1.36mA (2K Ohm without diode)
+	 *      0x7     3.99mA (250 Ohm without diode)
+	 *      0xB     4.41mA (50 Ohm without diode)
+	 *      0xF     16.0mA (0 Ohm without diode)
+	 */
+};
+
+&pctl {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_gpio_nobinded>;
+
+	pins_pwm: pinmux_pwm-pins {
+		sunplus,pins = <
+			SPPCTL_IOPAD(48, SPPCTL_PCTL_G_PMUX, MUXF_PWM0, 0)
+		>;
+	};
+
+	pins_gpio_nobinded: pinmux_gpio_nobinded-pins {
+		sunplus,pins = <
+			SPPCTL_IOPAD(30, SPPCTL_PCTL_G_GPIO, 0, 0)   /* was L2SW_LED_FLASH1 */
+			SPPCTL_IOPAD(39, SPPCTL_PCTL_G_GPIO, 0, 0)   /* was L2SW_LED_ON1  */
+		>;
+	};
+
+	pins_i2ctps: pinmux_i2ctps-pins {
+		sunplus,pins = <
+			SPPCTL_IOPAD(1, SPPCTL_PCTL_G_GPIO, 0,
+				     SPPCTL_PCTL_L_OUT | SPPCTL_PCTL_L_ONV | SPPCTL_PCTL_L_ODR)
+			SPPCTL_IOPAD(2, SPPCTL_PCTL_G_GPIO, 0,
+				     SPPCTL_PCTL_L_OUT | SPPCTL_PCTL_L_ONV | SPPCTL_PCTL_L_ODR)
+		>;
+	};
+
+	l2sw_ltpp3g2_pins: pinmux_l2sw_ltpp3g2-pins {
+		sunplus,pins = <
+			SPPCTL_IOPAD(63, SPPCTL_PCTL_G_PMUX, MUXF_L2SW_CLK_OUT, 0)
+			SPPCTL_IOPAD(71, SPPCTL_PCTL_G_PMUX, MUXF_L2SW_MAC_SMI_MDC, 0)
+			SPPCTL_IOPAD(64, SPPCTL_PCTL_G_PMUX, MUXF_L2SW_MAC_SMI_MDIO, 0)
+			SPPCTL_IOPAD(62, SPPCTL_PCTL_G_PMUX, MUXF_L2SW_P0_MAC_RMII_TXEN, 0)
+			SPPCTL_IOPAD(61, SPPCTL_PCTL_G_PMUX, MUXF_L2SW_P0_MAC_RMII_TXD0, 0)
+			SPPCTL_IOPAD(60, SPPCTL_PCTL_G_PMUX, MUXF_L2SW_P0_MAC_RMII_TXD1, 0)
+			SPPCTL_IOPAD(59, SPPCTL_PCTL_G_PMUX, MUXF_L2SW_P0_MAC_RMII_CRSDV, 0)
+			SPPCTL_IOPAD(58, SPPCTL_PCTL_G_PMUX, MUXF_L2SW_P0_MAC_RMII_RXD0, 0)
+			SPPCTL_IOPAD(57, SPPCTL_PCTL_G_PMUX, MUXF_L2SW_P0_MAC_RMII_RXD1, 0)
+			SPPCTL_IOPAD(55, SPPCTL_PCTL_G_PMUX, MUXF_L2SW_P1_MAC_RMII_TXEN, 0)
+			SPPCTL_IOPAD(54, SPPCTL_PCTL_G_PMUX, MUXF_L2SW_P1_MAC_RMII_TXD0, 0)
+			SPPCTL_IOPAD(53, SPPCTL_PCTL_G_PMUX, MUXF_L2SW_P1_MAC_RMII_TXD1, 0)
+			SPPCTL_IOPAD(52, SPPCTL_PCTL_G_PMUX, MUXF_L2SW_P1_MAC_RMII_CRSDV, 0)
+			SPPCTL_IOPAD(51, SPPCTL_PCTL_G_PMUX, MUXF_L2SW_P1_MAC_RMII_RXD0, 0)
+			SPPCTL_IOPAD(50, SPPCTL_PCTL_G_PMUX, MUXF_L2SW_P1_MAC_RMII_RXD1, 0)
+		>;
+		sunplus,zerofunc = <
+			MUXF_L2SW_LED_FLASH0
+			MUXF_L2SW_LED_ON0
+			MUXF_L2SW_LED_FLASH1
+			MUXF_L2SW_LED_ON1
+			MUXF_DAISY_MODE
+			MUXF_L2SW_P0_MAC_RMII_RXER
+			MUXF_L2SW_P1_MAC_RMII_RXER
+			GROP_SPI_FLASH
+		>;
+	};
+
+	gpio_leds_pins: pinmux_gpio_leds-pins {
+		sunplus,pins = <
+			SPPCTL_IOPAD(6, SPPCTL_PCTL_G_GPIO, 0, SPPCTL_PCTL_L_OUT)
+			SPPCTL_IOPAD(7, SPPCTL_PCTL_G_GPIO, 0, SPPCTL_PCTL_L_OUT)
+		>;
+	};
+
+	leds_s0_slp: pinmux_user_leds_s0_slp-pins {
+		sunplus,pins = <
+			SPPCTL_IOPAD(6, SPPCTL_PCTL_G_GPIO, 0, 0)
+			SPPCTL_IOPAD(7, SPPCTL_PCTL_G_GPIO, 0, 0)
+		>;
+	};
+
+	pins_uart1: pinmux_uart1-pins {
+		sunplus,pins = <
+			SPPCTL_IOPAD(8, SPPCTL_PCTL_G_PMUX, MUXF_UA1_TX, 0)
+			SPPCTL_IOPAD(9, SPPCTL_PCTL_G_PMUX, MUXF_UA1_RX, 0)
+			SPPCTL_IOPAD(10, SPPCTL_PCTL_G_PMUX, MUXF_UA1_RTS, 0)
+			SPPCTL_IOPAD(11, SPPCTL_PCTL_G_PMUX, MUXF_UA1_CTS, 0)
+		>;
+	};
+
+	pins_uart2: pinmux_uart2-pins {
+		sunplus,pins = <
+			SPPCTL_IOPAD(12, SPPCTL_PCTL_G_PMUX, MUXF_UA2_TX, 0)
+			SPPCTL_IOPAD(13, SPPCTL_PCTL_G_PMUX, MUXF_UA2_RX, 0)
+			SPPCTL_IOPAD(14, SPPCTL_PCTL_G_PMUX, MUXF_UA2_RTS, 0)
+			SPPCTL_IOPAD(15, SPPCTL_PCTL_G_PMUX, MUXF_UA2_CTS, 0)
+		>;
+	};
+
+	pins_uart3: pinmux_uart3-pins {
+		sunplus,pins = <
+			SPPCTL_IOPAD(16, SPPCTL_PCTL_G_PMUX, MUXF_UA3_TX, 0)
+			SPPCTL_IOPAD(17, SPPCTL_PCTL_G_PMUX, MUXF_UA3_RX, 0)
+			SPPCTL_IOPAD(18, SPPCTL_PCTL_G_PMUX, MUXF_UA3_RTS, 0)
+			SPPCTL_IOPAD(19, SPPCTL_PCTL_G_PMUX, MUXF_UA3_CTS, 0)
+		>;
+	};
+
+	/* AP6256 Bluetooth */
+	pins_btuart: pinmux_btuart-pins {
+		sunplus,pins = <
+			SPPCTL_IOPAD(40, SPPCTL_PCTL_G_PMUX, MUXF_UA4_RX, 0)
+			SPPCTL_IOPAD(41, SPPCTL_PCTL_G_PMUX, MUXF_UA4_TX, 0)
+			SPPCTL_IOPAD(56, SPPCTL_PCTL_G_PMUX, MUXF_UA4_RTS, SPPCTL_PCTL_L_ONV)
+			SPPCTL_IOPAD(49, SPPCTL_PCTL_G_PMUX, MUXF_UA4_CTS, 0)
+		>;
+	};
+
+	pins_bt_reset: pinmux_bt_reset-pins {
+		sunplus,pins = < SPPCTL_IOPAD(82, SPPCTL_PCTL_G_GPIO, 0, 0) >;
+	};
+
+	pins_spi0: pinmux_spi0-pins {
+		sunplus,pins = <
+			/*SPPCTL_IOPAD(26, SPPCTL_PCTL_G_PMUX, MUXF_SPI0S_EN, 0) */
+			/*SPPCTL_IOPAD(23, SPPCTL_PCTL_G_PMUX, MUXF_SPI0S_DO, 0) */
+			/*SPPCTL_IOPAD(25, SPPCTL_PCTL_G_PMUX, MUXF_SPI0S_DI, 0) */
+			/*SPPCTL_IOPAD(27, SPPCTL_PCTL_G_PMUX, MUXF_SPI0S_CLK, 0) */
+		>;
+	};
+
+};
diff --git a/arch/arm/configs/sp7021_defconfig b/arch/arm/configs/sp7021_defconfig
index ec723401b440..e0c0692f455d 100644
--- a/arch/arm/configs/sp7021_defconfig
+++ b/arch/arm/configs/sp7021_defconfig
@@ -1,4 +1,7 @@
 CONFIG_SYSVIPC=y
+CONFIG_CGROUPS=y
+CONFIG_CGROUP_SCHED=y
+CONFIG_MEMCG=y
 CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT=y
@@ -16,6 +19,7 @@ CONFIG_PERF_EVENTS=y
 CONFIG_ARCH_SUNPLUS=y
 # CONFIG_VDSO is not set
 CONFIG_SMP=y
+CONFIG_ARM_ERRATA_814220=y
 CONFIG_THUMB2_KERNEL=y
 CONFIG_ARCH_FORCE_MAX_ORDER=11
 CONFIG_VFP=y
@@ -24,11 +28,16 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODVERSIONS=y
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_NET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
 CONFIG_UEVENT_HELPER=y
 CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_BLK_DEV_LOOP=y
+CONFIG_NETDEVICES=y
+CONFIG_SP7021_EMAC=y
 CONFIG_INPUT_SPARSEKMAP=y
 CONFIG_INPUT_EVDEV=y
 # CONFIG_INPUT_KEYBOARD is not set
@@ -36,6 +45,25 @@ CONFIG_INPUT_EVDEV=y
 # CONFIG_LEGACY_PTYS is not set
 # CONFIG_HW_RANDOM is not set
 # CONFIG_HWMON is not set
+CONFIG_SPI=y
+CONFIG_SPI_SUNPLUS_SP7021=y
+CONFIG_I2C=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_EEPROM_AT24=y
+CONFIG_MMC=y
+CONFIG_MMC_SUNPLUS=y
+CONFIG_WATCHDOG=y
+CONFIG_WATCHDOG_SYSFS=y
+CONFIG_SUNPLUS_WATCHDOG=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_SUNPLUS=y
+CONFIG_NVMEM=y
+CONFIG_NVMEM_SUNPLUS_OCOTP=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_RESET_CONTROLLER=y
 CONFIG_EXT4_FS=y
@@ -51,6 +79,8 @@ CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ASCII=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_NLS_UTF8=y
+CONFIG_SECURITY=y
+CONFIG_SECURITY_NETWORK=y
 CONFIG_PRINTK_TIME=y
 CONFIG_DYNAMIC_DEBUG=y
 CONFIG_MAGIC_SYSRQ=y
-- 
2.53.0

