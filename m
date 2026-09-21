Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9854F7CB4
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 18:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790015214; cv=none; b=RxnVJqcGgLJWCx5iff/Dty+4FOFuuWJzPr8Y7tLuZ1CMaAkSDhKghfOS1O6QL0yg+0QnzwLhjalmdbxUJheHqk7WYiIOFqOOk2FbZxcaGVLfeB03u/Gvvjg0xneaRWfTc6BJsnTCnC4mppsMI0DOaXOKORfG8sgPck7g0pcJjH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790015214; c=relaxed/simple;
	bh=idX08RG82eRlyWvp7XnaOh5Skok8f1FQHOthIojjCWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Co3ZqkwDIinX6FoeF9tLfpmKshtVezyR1ifX95cTh1gedXZU76aNR49t+Y2KQgXNrH1Lad1pTndP+MXLRqBaaKazI4RhAyCxeVW84JHmM5Qp+SIAE3oBM15lqA7TpIyaWaJh0SBvZ9W7pKdtHSVgH2weycyz12b3IW5cz/6mtWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za; spf=none smtp.mailfrom=ffroot.co.za; dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b=m3G2Yfou; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b="m3G2Yfou"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350faaso1778163f8f.0
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 11:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790015210; x=1790620010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gK/CsX0O+HP7luVj7hzJHhBNDD6jrfkacHg1jM9hXZE=;
        b=m3G2YfouBxR1Dwkyd/GufPZG/q7Erx3Ohbe4DLvSqsIRIpaNRxkERCZCkgGoBKA5nf
         PA3cKCZgBE4qGz3oJrmaaEKqviVX90vgcN+IPxuXHl7x+EXeqwyWhVjG29v9674Vz56S
         Xf99ajN9pYez1ei7tDVU7s6iS/A/SPJmcC9IJDeyYUQs0KvQXZqYU7iKLYhKka22LakF
         trjYtmILVhWIjO1u1lN8ClG2A0XcQx6TenZVzHVy3hK2AGHJS43caO8KkN+OscYYWanG
         pUIc0DTqGlTr89PtwZ7HTdj0Lj8Vq/RPTs/Yr+Tn1QIblkA2C7nIpYqkvUObaZUXMFPp
         SOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790015210; x=1790620010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gK/CsX0O+HP7luVj7hzJHhBNDD6jrfkacHg1jM9hXZE=;
        b=OLhGKsju2BR4aW+7dKkygsyhbSiKkusMzAzY846gTjBK6k7dO5utQpNeR8BlwwaGZw
         oGcgc6cNl8K8NqY/GJIu6A7vUbv+xlgnGfMlEQZXKS8yOoDpjJYPji0A8X67OLf37BEx
         gMgE8UujkCzq0hnio+eEs4mfRnanW7IfZX7q73ZUva6ah+Jv7h1nGlDCYKteHynxTx9L
         57tuQq1X48vEklmYp9pPFR3pIkwwCBf8/1/k8BbA7hs5vLFS20IEZGkX93drvZ5dxH/A
         54ktfpGVeNrebaz6diwDAPxgULkA7qPsICtVfT2mx2uXeMf0GUeEXlK2DgSyipwrVpM0
         blfg==
X-Gm-Message-State: AFuF++kjxdIqq0pcoQrfwRb2KePFzGkZG9WmWUcgRCi37Z6ABSukCMFB
	48790jr1ob8lCt3qW9bdjXU8USzkc8Phr3XJ9WcujITMiYX1hTxTZ0kqFUiv8oIF1kw=
X-Gm-Gg: AYBFou1HslEPEMSkCYG4SII8USpc5SBnMiSCPdFsPmI1qLBxbvzZUoE+IUI7tBpNanp
	WrrhD7IhEa1M8j7SVU5whkHfNCukh4a50PySeMgKlcBJwnkFQ9es3LNYpt5geB3VaKFum6SxyX9
	4A0WlumDi2q7dR/VmpAg8LnVC9RdYqvyRAjPwHHAliGuDuxtr0WQUqrnt4d7MrgY5cn7gdmLchM
	v1SMl8lsovUb62XoTiAmPWNUbsr3WEi/EH6B5MB2kO3cVeyuTmnz/m70Cm+wdCAtq8JwFVmtLX1
	d9znmKWM2hbkBy6Y6GGGWBVrxahpDhsr7eRVmAzte5MMAzcEbm98x3W8uLAN8ZRSeaQZ/o8dDVj
	Fq30f/dujQF6lXRdz2srHuxBB2kfVl1mDWfEtwIRPR1HAhZCsk46IkK7RgN1wRfN4YRdxtJXpr5
	vrfA96IheMXHuClfD8Z7Uy1sFSkvOuenwgFsjcBLXrK6kSZ9Xr84isCbWeuN0AJ36N33LHtyIah
	1mnvLZqz7YaSwHoVtuvmqyaz3XpSo/MfM4Rag==
X-Received: by 2002:a05:6000:2409:b0:487:342:d147 with SMTP id ffacd0b85a97d-4871e363e1cmr19543797f8f.39.1790015210163;
        Mon, 21 Sep 2026 11:26:50 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872446067asm25126184f8f.12.2026.09.21.11.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:26:49 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH v3 5/6] arm: dts: sunplus: add Tibbo LTPP3G2 board
Date: Mon, 21 Sep 2026 20:26:19 +0200
Message-ID: <20260921182620.17597-6-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921182620.17597-1-ag@ffroot.co.za>
References: <20260921182620.17597-1-ag@ffroot.co.za>
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
 .../dts/sunplus/sunplus-sp7021-ltpp3g2.dts    | 183 ++++++++++++++++++
 3 files changed, 191 insertions(+), 3 deletions(-)
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
index 000000000000..6e25ba07dd96
--- /dev/null
+++ b/arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dts
@@ -0,0 +1,183 @@
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
+	memory@0 {
+		device_type = "memory";
+		reg = <0x00000000 0x20000000>; /* 512MB */
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

