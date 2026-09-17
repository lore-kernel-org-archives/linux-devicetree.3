Received: from mail-wr2-f31.google.com (mail-wr2-f31.google.com [74.125.225.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12F641D133
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 08:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633643; cv=none; b=GUXb4tecH6/QdeHqUsxkVXFj3lKJCnzRjExZfzryXhrjcruopA3Q8kVxnmgdS2RUBwn779IXGF+rfN4kPCdLBnZHf2kOW0mY/DxKNgg1bTpKamcMtzDcwwqin2vESxoKo30vu2UNf64KHLFWV4mtLjeJv8dusuKfVYGSQlEtQSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633643; c=relaxed/simple;
	bh=+N2eXqlpo0yUUw1rfeSnauTJiTKsikkjeffJA55HxlU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YTBLeD9CUCAQOYcKprOf1FknFjEo070JM/uoS7Q34ZWenafUcLB3upryWGZ8MxKY7CHBDFcU9njRo0VIg/mWPn6BBXWTQUwLktAKRebMdlDDq7BAXJYR6eRVifHYZazX9E2zTWI0O1OyIAhGBUHrNTihg/eetQndoc1Qgrz/BqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za; spf=none smtp.mailfrom=ffroot.co.za; dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b=wVv2bAWp; arc=none smtp.client-ip=74.125.225.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b="wVv2bAWp"
Received: by mail-wr2-f31.google.com with SMTP id ffacd0b85a97d-4843c2790ccso320521f8f.1
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 01:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1789633617; x=1790238417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NVzlhVqDtol8rVv2t1+SzIHr03mY4iFDGDaAfp4ZAaE=;
        b=wVv2bAWpf/Uq3dDJB80fIw8+DibzjbRXOt4pcHOJTcdbEAu9hpWRAyp/TGtbTuqWBo
         mxbZqUHweN2ID2ONfrp6extNZ3vJj0VfB/kyoJe32Umou+Q65Dlp0NGc7XKPxXbTkb+C
         gNJVaAS07iGm/BhEsFCEV+1CQ/mAFiObQOae5VDpBDDdgYfZqtTmHdsR+JYuf6oM/nk7
         wY7R7SX9ln7YZwop4DCF9skVXLso4VKZ7IcspOwnInjYVmN+NXTWSvswjXG3fIu/PVTU
         kh0GCFt0Y0pMGwkRS9Dzh2wpjSTxpoTJQldGL2uApkOJecD2hF+gm8bJqlGbN/9Y3n67
         BoVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789633617; x=1790238417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NVzlhVqDtol8rVv2t1+SzIHr03mY4iFDGDaAfp4ZAaE=;
        b=bWTCZ2xBoAF9Cd6SbPjWSaEjqq4OYuZPuJS6XFkrFepZQDEp1C2uclOEB3qnzkPmIC
         MuyHdTVnWFhS4TXZyHLdh5Z9IBa8lYN+4YSHL5V1BwGbUq/puvxnHGjZeiKLH8f/SFAK
         2wWgGliHhi3EyQECAlCS8dW4cp0pwTm0CRR2XQ7aCneE78BcryhoilQKNruVPVyQ87p/
         OIgq+A6T3+qfYx1KAzt/01sZvvQwoYwC3QPVyugy+uU2FypxP9JJ7VojcXwdNfPizbYE
         l+kTxUTKPIBw4PeBaD2By6WNynHBX3OAs+hETdTK7g1pieIJ8gwoh/V1m1FrpKHus6sq
         mevQ==
X-Gm-Message-State: AFuF++ndclPiLp+TSOJ/Qk9WBOBLk0hCXpQgX5xmkk4La8FLHzDokS6h
	MLVc2AA+PL1fzvbaFmb+l8MG6JWxsRizb7gBT3R8b4/HEmo0rlOAB8cnWQJ77v8/RnY=
X-Gm-Gg: AYBFou2bLxXBWWNxOr8oISdfjyipuVpg7hBIPaqU/3U2fwrrWt8FHcwlLVX5inkFwLg
	iKBqGJgtd8z++a2H3yt45k4WXOp1WmHmRy2or+VxLSaJUXG73IP3bIJnE4c8R/MNoTDpv1G6ybf
	2NtzXxOrCUmrzt4alYBJygDjVX9xX0YW0JTM+vglFMKRSreYTle05EJKb4heswtYWoCESIhFseA
	xzXr6xa/D6yBqvz3OlhPFGzX0jfKf1SzT19nGkcdNPVxCD0b/AOq3b9gGrFNJPZ6ad/BdNWnRtU
	slz2Ty4JDPjqRhBDBjQwsbkZO6gGc4Q4sdhtssx+jFIClkCqaBm8/yK+7ILaeee1bHI94eLSUIk
	5H9eeA3Lp+vh0JUtMSMXj8It51oeYDLizAAHi4vRyMl2YbMBlEo/N9chwDRccrLtyAOHsEXzJYf
	z+J/YxXAn7r8qb1GbKp4nNIKlf+MLJ+9nuYYGFwNzdmSZrxnrwr7Unq8PdWpHw0PSem8J/hPLa1
	UGPzw7CWQlTFTil152dF07orYJQHMEJBsV1
X-Received: by 2002:a5d:584a:0:b0:486:f4b1:8c4a with SMTP id ffacd0b85a97d-4870ceeed3dmr15292572f8f.10.1789633617074;
        Thu, 17 Sep 2026 01:26:57 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf342a0sm13420395f8f.24.2026.09.17.01.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 01:26:56 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH 3/4] arm: dts: sunplus: add Tibbo LTPP3G2 board
Date: Thu, 17 Sep 2026 10:26:31 +0200
Message-ID: <20260917082632.626614-4-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917082632.626614-1-ag@ffroot.co.za>
References: <20260917082632.626614-1-ag@ffroot.co.za>
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
 .../dts/sunplus/sunplus-sp7021-ltpp3g2.dts    | 182 ++++++++++++++++++
 3 files changed, 190 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dts

diff --git a/MAINTAINERS b/MAINTAINERS
index a53620839407..f54a833484a0 100644
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
index 000000000000..f91b0de79c3d
--- /dev/null
+++ b/arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dts
@@ -0,0 +1,182 @@
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
+	i2c_tps: i2c-tps { /* eeprom */
+		compatible = "i2c-gpio";
+		sda-gpios = <&pctl 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&pctl 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		i2c-gpio,delay-us = <1>;
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
+	system-led {
+		label = "system-led";
+		gpios = <&pctl 6 GPIO_ACTIVE_HIGH>;
+		default-state = "off";
+		linux,default-trigger = "heartbeat";
+	};
+	sg-led {
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
+};
-- 
2.53.0

