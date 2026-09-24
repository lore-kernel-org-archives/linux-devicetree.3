Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBD54A2A78
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 15:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790263764; cv=none; b=PJWl8vhqdEpXhyWFzLN4TCoOqwH/Mkai9tZBgfjY57zQjlPcB6411rCweQ2mUTqWGqmR/aNBy7xOU34qlcRaoaEfS17tmjyvNieDQ5Xiv1Gyl/CqdLamt08+NEqM4xwRTfRmQTYSWoHD3BUVm2cG/HhzM0YVnH2umIOOQoa8Sc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790263764; c=relaxed/simple;
	bh=g79g6UVDqDE3hNptS08i7liLfwlzPV/qosXhuG5oa7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GBNMk+xSYI+66Q2XUFsFsNED4va9yrnGud67lsmvzyQsboSfnSBIsndlOL+yLFiKrBDW43P2vYHJ4NVFLEXs4OVoLD/yLIW+PtejHtbv0LyzqO7YTwecdNvFeEDArbhA5vXPn1Tn78Nnp9foIMh4aOQF+cT2K0s3E9y4YsNA+jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za; spf=none smtp.mailfrom=ffroot.co.za; dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b=elxLx9SV; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b="elxLx9SV"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843796e373so1504021f8f.1
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 08:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790263760; x=1790868560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GwDQ5m8Lr/ZNLuGAHNSbThMwvePKcFW/UlVIIrfTaNo=;
        b=elxLx9SVIUYcUU3npYGD4n2CyJhl4ZJ8JZ+o5hrb0TeBm0vqf2fequZ/YERBjjJ92t
         DHqohSLk7lvrz9R2z8O8trQm2qsrbIn37vwrW3zuz1fxjPCB9dUjKdaPo9gaPjGQLa4E
         VqJL2BH1N9irUqdfl3Ss3KvXsAYJh9FH5nyrXElAkDA3zzrGFaJtSwOx7D2ltlG7uWnR
         SZyqpWdWOvw7tGNf+jkETG9i63s3WQg/BMB2nWWqwU5oiUUl+X3VKWEEAuu/3u85igpK
         wb93R4YmJg0fDevSraPXxpdes0P2g+NihccYLVyVty8kYZ3FKPEEr8BxiyxZljJYAOXc
         oP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790263760; x=1790868560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GwDQ5m8Lr/ZNLuGAHNSbThMwvePKcFW/UlVIIrfTaNo=;
        b=et+I3vcfFbB8y0Sz46OnQ3G0WwIXHQgO/4+Uu6nTk+0ALtRaKQ7K6SQjnqlIx0eWg3
         dkkJDw7VhFv4dT3+nLQVnwpToLReo8MR1402SbrhxyHcqrWI9WVV5Rqq5BVBzapOlE4+
         WtfgjUqHsIk8d/Hu2QpaIoUgQJPbexjvOum8BuhY91I7S1v68m7w3EpMBBZzqIkyLBVz
         3ShwPubhh1+LMyiqcTrUldCvzkKwOpX5C7DCCEp6tUwiTzuoHNIkQEp4MDVwr400AoOQ
         qUYZPNGGMR4BS0/csx/NRFykpgusgKuEoO+3JHABWbiEauIDjZPdzwMDYONwdDCxg+eA
         cnpw==
X-Gm-Message-State: AFuF++mszfNBUBql/uFdYKSeYz0R5+MjlMQCR9+cMjmXCGbWqR4ZkZkx
	bM4mSfRKd3oRs5QVYm4MhLQQ7GNlmxk2pR4G3EBvSvRxB16XwUFDBeU4Lxbd2vpZvWj5mBbJ8pC
	zPk5q9g0=
X-Gm-Gg: AYBFou0HnGZSIjbXf0zHKwyhkYYGYjic2ze8om6OQPA9TN97hykVU3HG0WDRcyRV3Bd
	isc9JZTAeOJ0HuRH07faQHchvcdubcJPSube7wSd33jeVAUhMbMS3IgPkQmY/w9wvgpOZ9jL3rs
	OqWyXf2J39kUbytV991Jt6lnLnmZ/bB9TNfpGjn6KHMf0BYHJMhswsreehk2b/YueS83yHFKCSY
	VdoPA5s2rfpWYAIDJmK4pQAH2h3zYgSllCnEELf/oZ+Prl2rNTsF+MZf8Cux5wPsq8LGq+dLVua
	SVYMWim+3qQrHJo+ABh7i9NKT9aUca8WNTkYBmj87vGKV+5fhXkmF8/XEQCb4ogPjPKtEZ3JqOa
	ihLPNgX+NiJGMpBTlm5NBl2JjuoQcJWHR1o/N7EdtNNHCy39IZ2aP2GUitK3Y+7T/2crAl5PqQS
	LhWHo+PiaH71YUQew5+Cr3+tMlaVn0tDoAJSV8gh3Kpx4fpVEZEqLGiCnw6HAZdSrMDc4Rz2LiI
	U7w27kQkzPU/EZ1T7dW1/sO8lP6kPsGCjTF
X-Received: by 2002:a05:6000:1888:b0:487:2777:6354 with SMTP id ffacd0b85a97d-488717166dfmr6661967f8f.48.1790263760497;
        Thu, 24 Sep 2026 08:29:20 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48867b49661sm14781552f8f.0.2026.09.24.08.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 08:29:19 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH v4 5/6] arm: dts: sunplus: add Tibbo LTPP3G2 board
Date: Thu, 24 Sep 2026 17:28:43 +0200
Message-ID: <20260924152844.81705-6-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924152844.81705-1-ag@ffroot.co.za>
References: <20260924152844.81705-1-ag@ffroot.co.za>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a DTS for the Tibbo LTPP3G2 board, which uses the Sunplus SP7021
SoC. The initial DTS was provided by Sunplus Technology Co. and has
been adapted for upstream with permission.

The board features eMMC, SPI, a bit-banged I2C EEPROM (Atmel 24C16),
PWM output to a buzzer, a watchdog, RTC, and two GPIO LEDs (heartbeat
and MMC activity).

Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
 MAINTAINERS                                   |   6 +
 arch/arm/boot/dts/sunplus/Makefile            |   5 +-
 .../dts/sunplus/sunplus-sp7021-ltpp3g2.dts    | 193 ++++++++++++++++++
 3 files changed, 201 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dts

diff --git a/MAINTAINERS b/MAINTAINERS
index 6e50747a621c..313107bea748 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3737,6 +3737,12 @@ F:	drivers/reset/reset-sunplus.c
 F:	include/dt-bindings/clock/sunplus,sp7021-clkc.h
 F:	include/dt-bindings/reset/sunplus,sp7021-reset.h
 
+ARM/TIBBO LTPP3G2 BOARD
+M:	Andrew Gaylard <ag@ffroot.co.za>
+L:	linux-arm-kernel@lists.infradead.org
+S:	Maintained
+F:	arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dts
+
 ARM/Synaptics SoC support
 M:	Jisheng Zhang <jszhang@kernel.org>
 M:	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
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
index 000000000000..2d321c41067c
--- /dev/null
+++ b/arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dts
@@ -0,0 +1,193 @@
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
+		stdout-path = "serial0:115200n8";
+	};
+
+	i2c_tps: i2c {
+		compatible = "i2c-gpio";
+		sda-gpios = <&pctl 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&pctl 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		i2c-gpio,delay-us = <5>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pins_i2ctps>;
+		eeprom: eeprom@50 {
+			compatible = "atmel,24c16";
+			reg = <0x50>;
+			pagesize = <16>;
+		};
+	};
+};
+
+&leds {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&gpio_leds_pins>;
+	pinctrl-1 = <&leds_s0_slp>;
+	led-0 {
+		label = "system-led";
+		gpios = <&pctl 6 GPIO_ACTIVE_HIGH>;
+		default-state = "off";
+		linux,default-trigger = "heartbeat";
+	};
+	led-1 {
+		label = "SG";
+		gpios = <&pctl 7 GPIO_ACTIVE_HIGH>;
+		linux,default-trigger = "mmc0";
+		default-state = "off";
+	};
+};
+
+&pwm {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_pwm>;
+	status = "okay";
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
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_uart3>;
+	status = "disabled";
+};
+
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_btuart &pins_bt_reset>;
+	status = "disabled";
+};
+
+&mmc0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&emmc_pins>;
+	bus-width = <8>;
+	max-frequency = <52000000>;
+	non-removable;
+	disable-wp;
+	cap-mmc-highspeed;
+	mmc-ddr-3_3v;
+	no-sdio;
+	no-sd;
+	status = "okay";
+};
+
+&wdt {
+	status = "okay";
+};
+
+&pctl {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_gpio_nobinded>;
+
+	emmc_pins: pinmux-emmc-pins {
+		function = "CARD0_EMMC";
+		groups = "CARD0_EMMC";
+	};
+
+	pins_pwm: pinmux-pwm-pins {
+		sunplus,pins = <
+			SPPCTL_IOPAD(48, SPPCTL_PCTL_G_PMUX, MUXF_PWM0, 0)
+		>;
+	};
+
+	pins_gpio_nobinded: pinmux-gpio-nobinded-pins {
+		sunplus,pins = <
+			SPPCTL_IOPAD(30, SPPCTL_PCTL_G_GPIO, 0, 0)   /* was L2SW_LED_FLASH1 */
+			SPPCTL_IOPAD(39, SPPCTL_PCTL_G_GPIO, 0, 0)   /* was L2SW_LED_ON1  */
+		>;
+	};
+
+	pins_i2ctps: pinmux-i2c-pins {
+		sunplus,pins = <
+			SPPCTL_IOPAD(1, SPPCTL_PCTL_G_GPIO, 0,
+				     SPPCTL_PCTL_L_OU1 | SPPCTL_PCTL_L_ODR)
+			SPPCTL_IOPAD(2, SPPCTL_PCTL_G_GPIO, 0,
+				     SPPCTL_PCTL_L_OU1 | SPPCTL_PCTL_L_ODR)
+		>;
+	};
+
+	gpio_leds_pins: pinmux-gpio-leds-pins {
+		sunplus,pins = <
+			SPPCTL_IOPAD(6, SPPCTL_PCTL_G_GPIO, 0, SPPCTL_PCTL_L_OUT)
+			SPPCTL_IOPAD(7, SPPCTL_PCTL_G_GPIO, 0, SPPCTL_PCTL_L_OUT)
+		>;
+	};
+
+	leds_s0_slp: pinmux-user-leds-s0-slp-pins {
+		sunplus,pins = <
+			SPPCTL_IOPAD(6, SPPCTL_PCTL_G_GPIO, 0, 0)
+			SPPCTL_IOPAD(7, SPPCTL_PCTL_G_GPIO, 0, 0)
+		>;
+	};
+
+	pins_uart1: pinmux-uart1-pins {
+		sunplus,pins = <
+			SPPCTL_IOPAD(8, SPPCTL_PCTL_G_PMUX, MUXF_UA1_TX, 0)
+			SPPCTL_IOPAD(9, SPPCTL_PCTL_G_PMUX, MUXF_UA1_RX, 0)
+			SPPCTL_IOPAD(10, SPPCTL_PCTL_G_PMUX, MUXF_UA1_RTS, 0)
+			SPPCTL_IOPAD(11, SPPCTL_PCTL_G_PMUX, MUXF_UA1_CTS, 0)
+		>;
+	};
+
+	pins_uart2: pinmux-uart2-pins {
+		sunplus,pins = <
+			SPPCTL_IOPAD(12, SPPCTL_PCTL_G_PMUX, MUXF_UA2_TX, 0)
+			SPPCTL_IOPAD(13, SPPCTL_PCTL_G_PMUX, MUXF_UA2_RX, 0)
+			SPPCTL_IOPAD(14, SPPCTL_PCTL_G_PMUX, MUXF_UA2_RTS, 0)
+			SPPCTL_IOPAD(15, SPPCTL_PCTL_G_PMUX, MUXF_UA2_CTS, 0)
+		>;
+	};
+
+	pins_uart3: pinmux-uart3-pins {
+		sunplus,pins = <
+			SPPCTL_IOPAD(16, SPPCTL_PCTL_G_PMUX, MUXF_UA3_TX, 0)
+			SPPCTL_IOPAD(17, SPPCTL_PCTL_G_PMUX, MUXF_UA3_RX, 0)
+			SPPCTL_IOPAD(18, SPPCTL_PCTL_G_PMUX, MUXF_UA3_RTS, 0)
+			SPPCTL_IOPAD(19, SPPCTL_PCTL_G_PMUX, MUXF_UA3_CTS, 0)
+		>;
+	};
+
+	/* AP6256 Bluetooth */
+	pins_btuart: pinmux-btuart-pins {
+		sunplus,pins = <
+			SPPCTL_IOPAD(40, SPPCTL_PCTL_G_PMUX, MUXF_UA4_RX, 0)
+			SPPCTL_IOPAD(41, SPPCTL_PCTL_G_PMUX, MUXF_UA4_TX, 0)
+			SPPCTL_IOPAD(56, SPPCTL_PCTL_G_PMUX, MUXF_UA4_RTS, 0)
+			SPPCTL_IOPAD(49, SPPCTL_PCTL_G_PMUX, MUXF_UA4_CTS, 0)
+		>;
+	};
+
+	pins_bt_reset: pinmux-bt-reset-pins {
+		sunplus,pins = < SPPCTL_IOPAD(82, SPPCTL_PCTL_G_GPIO, 0, 0) >;
+	};
+
+};
-- 
2.53.0

