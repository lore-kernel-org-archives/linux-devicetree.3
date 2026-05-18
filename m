Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247D6492526
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 14:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779114752; cv=none; b=QmZIqAqejppQC0kRcJR5rVaH8Wmt3jsR/efgFgy82CcGSr8mPtl1//ptyOEeKcdnbfjJx+jmN4HJn/pjzhGe4NM79w4eHY/od0RP+pR00YfK7Bw4e62ErIEh7kvkWRo43GS84VpT/pPLLvHCqKB43n+fLn9ZFgefur1vfXDD1cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779114752; c=relaxed/simple;
	bh=QcL50GK3pIVA9DLn5XG/jcTBE4S3HFxFhOYzKKnA77w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PKHmBoSeqeUV8sX4cJThxowm0HbhMAajZxG8ufmArVjFOelOedD82lGrjAD6jDEF6uVPC7qRqh/LkT8/+56lKsIcOOerK4bbq85ixhkwZQWfJ8WLNe8tEvNcXDoKsgCyFbvTzxj1QHkP1dadZ49svuTQKQKzHlQUXQRvXG1vp68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=aDFEq0Sn; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="aDFEq0Sn"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48d102471a4so19388785e9.2
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 07:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1779114744; x=1779719544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dBFHri4QRA65S7SM46tdHQTdd72pRFh4hnk7KaMPjyI=;
        b=aDFEq0SngA1inIj9kz2LNkBnTt8qxpA8m2kbra7RwJlaaBctg7fxN9Eyov9oiNizzd
         idf0vxLkymsj579U97MLc8jMeBP2+iAWFoGDhGzvsKD66pS16MI1xDsseNmBuknu86sX
         r316c5G3ZX98UfRUhcfogEev8Wd2Pk9mXlZQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114744; x=1779719544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dBFHri4QRA65S7SM46tdHQTdd72pRFh4hnk7KaMPjyI=;
        b=L1L4AnZzaVPLOwNoDVGhB7CTaVxM1sJlZqt/GDrMjJS33lz/nPkDBBmkQkQDVJWshV
         3v/YTnVpRlPzZaAfXqedV3ZuwI6gvc4/Y4/marrfuilWHYb6ocDFMvpX/y26s/ECVQxl
         DzXOgeaIosT6nuPoNvosOE+VyeCCgtqOjqj6phs5w79WhPl7S8wYDaA+voEA6xNMux3w
         JUBcx3PgJ44OhOXyeZzgNYpPlAQCOrf8kILiAzc+KUQYlnjBP0rx8+QvV3gZRLoBSzfP
         O4TgF8ICPcaT2d0MK9kracuswRqBpUFnzmP0ci22dh205h1eoXZGrdniukNIXOInsqjW
         yIzA==
X-Forwarded-Encrypted: i=1; AFNElJ9iobof8sXe9va7RQyk+RY9FmfXNtS/dyCTYRxkXwN7xaH/NfKQg76z2xbLZjoEmzOdcuQlgJkM5jHL@vger.kernel.org
X-Gm-Message-State: AOJu0YyOMJoK4h63oNkgVFpenQ72+cKNmLhKSydV/jo/QZTGq1Lkb+BB
	Fk3PNIWEeaobq+SmZiaA8df70Ssntu6LHTViNbE4/c+iMSXblggrnNLW/dtFhLOuGdQ=
X-Gm-Gg: Acq92OGQdlSwchos+mF1JXHKe/gObpON4o2WQ6M76ZYg1nRvRhzmEIu4COkbYr105YD
	tg3ix2F0vcJiYMiJXMY/IWZNvn/acUvRQ0zOZy2dmpwHBc64FJZTiskx6pSpNmkrbvv0akQHxDM
	YKxolMT8aS328qmermVhQwnX8Y8G+wLKwG+4/94K9n0WWxj6g76x/rK5iMR+BCvo209Cq94sqGu
	nazWvem1mysZQYrEDh0vKztOVIojIoSWfRTnSDIcrO4q7GBjNEFBdih8NO85803qQPDdRlXivMo
	ONiPAo0qRxQxIP6phOBXymFAXZFuC7PByLbtNpqRaKv0iwFI08d7oGiwlVp4BBZOwXbPa83K1qK
	fGT6FvKYtxrZ2OfTnGA0MS2RlWnwnfiDAac1+/qmH01rQ0cO1CIpt9sXPNGdhVYAJrmplU7Ph8W
	dLD/WKTDAfMyUtBPXAOUE31/NXDnPvoyUlzzFD/gzisBOFyT9WxV5XMbkzydeA3kbb+cGt54jzE
	e3Kt5HhZ851T43yXn8phlMamkqHmczSKv7SjMDqtvNmJhPJqdp7DYim3uHM81N3od5Bzw==
X-Received: by 2002:a05:600c:a405:b0:48a:52ce:a4b1 with SMTP id 5b1f17b1804b1-48fe60dd5e8mr228451065e9.15.1779114744494;
        Mon, 18 May 2026 07:32:24 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm39564572f8f.23.2026.05.18.07.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:32:24 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 13/15] arm64: dts: st: support Engicam MicroGEA-STM32MP257-RMM board
Date: Mon, 18 May 2026 16:31:28 +0200
Message-ID: <20260518143150.3138712-14-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
References: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support for Engicam MicroGEA-STM32MP257-RMM board with:

 - 8 GB eMMC Flash
 - 2 GB LPDDR4 DRAM
 - CAN
 - LEDs
 - LCD panel with touchscreen
 - Micro SD card connector
 - Audio codec
 - Buzzer

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm64/boot/dts/st/Makefile               |   1 +
 .../st/stm32mp257-engicam-microgea-rmm.dts    | 321 ++++++++++++++++++
 2 files changed, 322 insertions(+)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257-engicam-microgea-rmm.dts

diff --git a/arch/arm64/boot/dts/st/Makefile b/arch/arm64/boot/dts/st/Makefile
index 63908113ae36..386eca593c54 100644
--- a/arch/arm64/boot/dts/st/Makefile
+++ b/arch/arm64/boot/dts/st/Makefile
@@ -2,5 +2,6 @@
 dtb-$(CONFIG_ARCH_STM32) += \
 	stm32mp215f-dk.dtb \
 	stm32mp235f-dk.dtb \
+	stm32mp257-engicam-microgea-rmm.dtb \
 	stm32mp257f-dk.dtb \
 	stm32mp257f-ev1.dtb
diff --git a/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea-rmm.dts b/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea-rmm.dts
new file mode 100644
index 000000000000..1d5e023b3b44
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea-rmm.dts
@@ -0,0 +1,321 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ * Copyright (C) 2026 Engicam srl
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+
+#include "stm32mp257-engicam-microgea.dtsi"
+
+/ {
+	model = "Engicam MicroGEA STM32MP257D RMM Board";
+	compatible = "engicam,microgea-stm32mp257-rmm",
+		     "engicam,microgea-stm32mp257", "st,stm32mp257";
+
+	aliases {
+		mmc0 = &sdmmc1;
+		mmc1 = &sdmmc2;
+		serial0 = &usart2;
+		serial1 = &usart1;
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 100>;
+		num-interpolated-steps = <100>;
+		default-brightness-level = <85>;
+		pwms = <&pwm2 0 100000 0>;
+	};
+
+	buzzer {
+		compatible = "pwm-beeper";
+		pwms = <&pwm4 0 1000000 0>;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer {
+			compatible = "simple-framebuffer";
+			clocks = <&rcc CK_BUS_LTDC>, <&rcc CK_KER_LTDC>;
+			lcd-supply = <&reg_3v3>;
+			status = "disabled";
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			gpios = <&gpioh 2 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+			status = "okay";
+		};
+
+		led-1 {
+			gpios = <&gpioh 6 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+			status = "okay";
+		};
+	};
+
+	mclk: clock-mclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+	};
+
+	reg_1v8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	reg_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	reg_ext_pwr: regulator-ext-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "ext-pwr";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpiog 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	sound {
+		compatible = "audio-graph-card";
+		label = "STM32MP25-RMM";
+		widgets = "Headphone", "Headphone Jack",
+			  "Microphone", "Microphone Jack";
+		routing = "Headphone Jack", "HP_OUT",
+			  "MIC_IN", "Microphone Jack",
+			  "Microphone Jack", "Mic Bias";
+		dais = <&sai1a_port &sai1b_port>;
+		status = "okay";
+	};
+};
+
+&arm_wdt {
+	timeout-sec = <32>;
+	status = "okay";
+};
+
+&i2c1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c1_pins_a>;
+	pinctrl-1 = <&i2c1_sleep_pins_a>;
+	i2c-scl-rising-time-ns = <185>;
+	i2c-scl-falling-time-ns = <20>;
+	status = "okay";
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
+
+	touchscreen@38 {
+		compatible = "edt,edt-ft5306";
+		reg = <0x38>;
+		interrupt-parent = <&gpiob>;
+		interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&gpiod 1 GPIO_ACTIVE_LOW>;
+		touchscreen-size-x = <1280>;
+		touchscreen-size-y = <800>;
+	};
+};
+
+&i2c2 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c2_pins_a>;
+	pinctrl-1 = <&i2c2_sleep_pins_a>;
+	i2c-scl-rising-time-ns = <185>;
+	i2c-scl-falling-time-ns = <20>;
+	status = "okay";
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
+
+	sgtl5000: codec@a {
+		compatible = "fsl,sgtl5000";
+		reg = <0x0a>;
+		#sound-dai-cells = <0>;
+		clocks = <&mclk>;
+
+		VDDA-supply = <&reg_3v3>;
+		VDDIO-supply = <&reg_3v3>;
+		VDDD-supply = <&reg_1v8>;
+
+		sgtl5000_port: port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			sgtl5000_tx_endpoint: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&sai1a_endpoint>;
+				frame-master = <&sgtl5000_tx_endpoint>;
+				bitclock-master = <&sgtl5000_tx_endpoint>;
+			};
+
+			sgtl5000_rx_endpoint: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&sai1b_endpoint>;
+				frame-master = <&sgtl5000_rx_endpoint>;
+				bitclock-master = <&sgtl5000_rx_endpoint>;
+			};
+		};
+	};
+};
+
+&ltdc {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&ltdc_pins_a>;
+	pinctrl-1 = <&ltdc_sleep_pins_a>;
+	status = "okay";
+
+	port {
+		ltdc_out: endpoint {
+			remote-endpoint = <&panel_in>;
+		};
+	};
+};
+
+&m_can1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&m_can1_pins_a>;
+	pinctrl-1 = <&m_can1_sleep_pins_a>;
+	status = "okay";
+};
+
+&sai1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sai1a_pins_a>, <&sai1b_pins_a>;
+	pinctrl-1 = <&sai1a_sleep_pins_a>, <&sai1b_sleep_pins_a>;
+	status = "okay";
+	clocks = <&rcc CK_KER_SAI1>;
+
+	sai1a: audio-controller@40290004 {
+		#clock-cells = <0>;
+		dma-names = "tx";
+		status = "okay";
+
+		sai1a_port: port {
+			sai1a_endpoint: endpoint {
+				remote-endpoint = <&sgtl5000_tx_endpoint>;
+				dai-format = "i2s";
+				mclk-fs = <512>;
+			};
+		};
+	};
+
+	sai1b: audio-controller@40290024 {
+		dma-names = "rx";
+		st,sync = <&sai1a 2>;
+		clocks = <&rcc CK_KER_SAI1>, <&sai1a>;
+		clock-names = "sai_ck", "MCLK";
+		status = "okay";
+
+		sai1b_port: port {
+			sai1b_endpoint: endpoint {
+				remote-endpoint = <&sgtl5000_rx_endpoint>;
+				dai-format = "i2s";
+				mclk-fs = <512>;
+			};
+		};
+	};
+};
+
+/* MicroSD */
+&sdmmc1 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc1_b4_pins_a>;
+	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
+	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
+	broken-cd;
+	disable-wp;
+	st,neg-edge;
+	bus-width = <4>;
+	vmmc-supply = <&scmi_v3v3>;
+	vqmmc-supply = <&scmi_vddio1>;
+	no-1-8-v;
+	status = "okay";
+};
+
+&spi1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&spi1_pins_a>;
+	pinctrl-1 = <&spi1_sleep_pins_a>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	cs-gpios = <&gpioh 8 GPIO_ACTIVE_HIGH>, <&gpioh 3 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+
+	display: display@0 {
+		compatible = "rocktech,rk050hr345-ct106a", "ilitek,ili9806e";
+		reg = <0>;
+		vdd-supply = <&reg_3v3>;
+		spi-max-frequency = <10000000>;
+		reset-gpios = <&gpiob 6 GPIO_ACTIVE_LOW>;
+		backlight = <&backlight>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&ltdc_out>;
+			};
+		};
+	};
+};
+
+&timers2 {
+	status = "okay";
+
+	pwm2: pwm {
+		pinctrl-0 = <&pwm2_pins_a>;
+		pinctrl-1 = <&pwm2_sleep_pins_a>;
+		pinctrl-names = "default", "sleep";
+		status = "okay";
+	};
+};
+
+&timers4 {
+	status = "okay";
+
+	pwm4: pwm {
+		pinctrl-names = "default", "sleep";
+		pinctrl-0 = <&pwm4_pins_a>;
+		pinctrl-1 = <&pwm4_sleep_pins_a>;
+		status = "okay";
+	};
+};
+
+&usart1 {
+	pinctrl-names = "default", "idle", "sleep";
+	pinctrl-0 = <&usart1_pins_b>;
+	pinctrl-1 = <&usart1_idle_pins_b>;
+	pinctrl-2 = <&usart1_sleep_pins_b>;
+	/delete-property/ dmas;
+	/delete-property/ dma-names;
+	status = "okay";
+};
+
+&usart2 {
+	pinctrl-names = "default", "idle", "sleep";
+	pinctrl-0 = <&usart2_pins_a>;
+	pinctrl-1 = <&usart2_idle_pins_a>;
+	pinctrl-2 = <&usart2_sleep_pins_a>;
+	/delete-property/ dmas;
+	/delete-property/ dma-names;
+	status = "okay";
+};
-- 
2.43.0

