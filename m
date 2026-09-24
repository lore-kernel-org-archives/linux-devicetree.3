Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7F94570DA
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 16:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790268617; cv=none; b=rLpis1EBpVsv9REv+EmfbcOtrfjtYs9BMXpspbJX3+UrtS/U44HNJwty8MQ3X444zoh9i+R661PKpyAqsjnUth00ti8h4xbLTGLMwbpC1KleNo7DZ8XryvjlJZEWMI7R1WVnwqgLbNHiI54tWzqipffxwVIZxMgzu50Ra1ta52w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790268617; c=relaxed/simple;
	bh=g79g6UVDqDE3hNptS08i7liLfwlzPV/qosXhuG5oa7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nL1FlsB7mbuz1vT/goNT0DVlmT3cjBOWFo48PTst1fQTcd7sIZbfMTnBLiaGnrjQ6vSblFqlmyJOO4kzhojhhQoiavdh2uEUmJ+RCWz/7+iZMfnco0sw0FHihEBqwGcX2QH/+bl1z1O312t8sFkcvFf1Bssy3n892Ju1jYUAAn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za; spf=none smtp.mailfrom=ffroot.co.za; dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b=WKo1pf0Y; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b="WKo1pf0Y"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f633cd78so14058f8f.1
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 09:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790268614; x=1790873414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GwDQ5m8Lr/ZNLuGAHNSbThMwvePKcFW/UlVIIrfTaNo=;
        b=WKo1pf0Y75dTcPqbX7gBZZHNgiuXKtlKQ23ZdtGg5vhIOYyL4d4rEmTP6qJBb15tmD
         q9NAyivP3rUJgxslSNnQE7QWdtt+z8eQuW+haxV9ATJK9as3R+0PSko9xCOitH0atiGx
         ogpObh2Lfpi3y8ZFALwH4iy3xz6/ycrT8QzwbyaWoqgocasFhX37+N8Pgovmh/SjWfEF
         /fIn/lFPCv2LKiJneJn2eaNbu99AJMFvygR2NVWBiNRXCPdbeNmEBDGGol8x8ohDAIrX
         NIkdi4aOAqGktNJ3gMD9pS/Xq8aW3wAsR9tdVqi5wmjbiKcdeKgYPFs3AsJzFvteLQNt
         syMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790268614; x=1790873414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GwDQ5m8Lr/ZNLuGAHNSbThMwvePKcFW/UlVIIrfTaNo=;
        b=B6IHkOvayE1df7r6Z8eXYXenylewPt2DMrPEsHP9UX9Kp2eRmRk+V1VSyHd9CTHdLf
         Q1vLzVq9be61S9dfd8371HICWFk9X8tMvuE8OpqT8nFn8iiVhjugLhW5/60qa3Fr+sYB
         A7HaSHV2zQZpc8ErdBxMqvWsrYuyLOfyqakUM4gqu11yjCcP5AfP449PA6JWuGkx8ElN
         Gtoqfn9OUhGVlfFyZvLQVGWcE+Gnup68TlwjYNiuarsOmutTZ/S7IjoD2a2EIJnMoARh
         raHHYRrRwRO2ydYq0UL0FvdL07LDiq7DpcyPczdoPp37mEPcTJoZuhGDjTn2HfH9jnwb
         lS1w==
X-Gm-Message-State: AFuF++kfQ6FtruSXzZMnLfG3iNzwRnhoJ4Z2XuB63osKCgt9bvTpGwkc
	qcFj/YQZILX4j2hpGz99nhHDlSDBA0FdFEwTTl6je6CQZI3BaAsCKdq2wRBSRQ8FuKM=
X-Gm-Gg: AYBFou3skpSIbZX8upllyESKBEMaZVlovBOUPAucDdsJLmXOKU9z4WiXjVua727h2IS
	E6vevmVtT4GJMblhVzWywVrKa9MPnOTTccWTcmVuyd2kJA2oteDvfeE22oKacr9616Gtr5TC3aw
	scwoWofO3Ltv5hIXSO6ZP0lQZyT5x6dHMmeXxeLr3o7GcxdjS3iyt8yukVXEuZ0ZQPxtyNrDIjo
	dQ2apyoDbPJGukF17KKh+vctndaQzXwIqc6vdiso5933ljQh7xLyPQ7SRzNIxqsk/eHtne+emTm
	LrgqT3ymgl9X/rE4QZex2gtM9XtHYyF6VoAN1hq0Jk2+6Aq2VJOzniLKQCGTQW48kwCuKKKy5d1
	LtXw2QeuCA4SKQTL9w2QGpUkPgqh9OEs622y+dIO2E9DujhLSwQSxRwJ4R2adBCIN+20JPAd1ev
	fjlggHIROMCo3jFucXHT2AkZ4hDh5xpHFF5ip1AIRYAtcG2WYdlKUgF7jCjbJo//zaXbcQ9OXmX
	KvoGUYYGUK0y0rwme/ZJIG6/72iHiFxIyu4
X-Received: by 2002:a05:6000:29c2:b0:488:79d6:a4a6 with SMTP id ffacd0b85a97d-48879d6a64fmr539752f8f.8.1790268613687;
        Thu, 24 Sep 2026 09:50:13 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a3625ccsm327139f8f.22.2026.09.24.09.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:50:12 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH v5 5/6] arm: dts: sunplus: add Tibbo LTPP3G2 board
Date: Thu, 24 Sep 2026 18:49:21 +0200
Message-ID: <20260924164922.117236-6-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924164922.117236-1-ag@ffroot.co.za>
References: <20260924164922.117236-1-ag@ffroot.co.za>
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

