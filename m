Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D3F3B3BE6
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811626; cv=none; b=eiEH/xsORzU0prZUDxYVM+vgKUTfPteh9wr4JVW+y3RcJ8/8wRGkie1obksmaMn75MKT9rZXm05e7e31xE1WeNXQ38exYwGd/daTcAzwkYrRXdtHmNo8xIa6GLNWEdTb24MAYAzsz2wpxdAvZ6TJAQxwFoE/3fMZlVu9+cHHd/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811626; c=relaxed/simple;
	bh=dDbeHPkgMGADsZxjoGo8SFhLwSy61BJRDfQk0p49bqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MeegYnY243mT3rpgSKvHIcVxr9TkTVVwH+feC2Y0Dp7MuxsDO9L5BqrZZ47opO6vtecVBHZvFb0StIs/nk56xZVBXIyiE8DKrmx7Mxxw+sHR93kim/fPs8js0ijbqN/pi3nmZjeeahIRB3qtaBThVeHEjAb5U+akgzKF5vNbg3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=ICHeHlr9; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ICHeHlr9"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-472a14c9965so1942493f8f.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 02:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1782811622; x=1783416422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oV3f+50ed4LkIgc2qygb/N6CZZlLTsBadYHjngUXyJU=;
        b=ICHeHlr9XHiob3U+X47QNonDJ6jdopcTtI0ZQ6BRRL+Qdkf1ppiDZe/4utJoZe1IAO
         ZiNkznFc5WVkDQo4opN6UUkb7RKYmzc0r5iglgxqrANrGY3MAtQBPXMM1RgO4onXKVCU
         pN18lRWi4znYbIIAq9H7YCErY4Ilu9/5t5fmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782811622; x=1783416422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oV3f+50ed4LkIgc2qygb/N6CZZlLTsBadYHjngUXyJU=;
        b=kVVQC3tVkA0f7pMBsEbTOG75lF54vSZyFoPBgBRBXGM5/fbiF9JW6qrJDqQQA//zRT
         1YNrvgysOJ17nu8Ra3YKAk0HcJuAhB4jlyuzTrqyXc58HGSZzTesSl9rEQuv7dTWMADe
         NMo6yoxWVtt8b4n1dE+u3RnCkEBu7qLe7P7rF6PBbzvf/qcGqf94kUh0eu17YymNUS6H
         XNr/1BfBWsngneKFJLdy3GbQxN6/kNCGTSGqebdNwAcFqtNTvmxpVsGN2sewCFxYEDJy
         iIRjk5w+jfb2H8OuEEwlj3dDuh82rOpTHuyBLXJ+d1KTaHzm6Jzwrx+Fb4SWB+FQ8v7i
         +Tmg==
X-Forwarded-Encrypted: i=1; AHgh+RpnooevsiIEAd354KNGpn+hvwGqvG/cKy7Iwmg+2jusj9BxHG4mQvCyi1lM/A3lzFhJhnwyouSFsRPA@vger.kernel.org
X-Gm-Message-State: AOJu0YwV/hqXPZaeVFwkbAZ7Z1n5s892YzgoA2AuP78tPgePu96uZoZZ
	psnyCYVW+LWzSBxEU/a6Etl+96D5Gs34rhP4ed/Bgixm/nBOWwnAJpWY6z4gad0IHPo=
X-Gm-Gg: AfdE7cn4xhvX1587PAsQOxcTR/3U4lXLHNh/ifDZI5DbAmHPcZJDO9JYyktlUotn6N4
	5WLCrD0/SkZ7EFMAx7hohH0dLM7tHeEfpidZKDfU4VRtlJYMRheyrRMem33EqI/6FOTf7GdUbbR
	4Utgd1+KhTkxlM6g5P0gjlX8KT2sQgQkXIwPuAOwPEs9mLMNKiHXSd7l3QzYAPFsyv2H8sSWYvm
	h0PGZ+6i0LgyB5otRH4VbhQBFsTfWu4Nhs+I0CGwHQy30k3dImJaXzqS7SSc8ZRVt9ajWZXkgD6
	9fSzCoPsKf69aY0ldQ96LtX7FDgtwYFGniOc8aguQC+e38cQnmVVmp1tq96tlJ9rWJ3u6hnDXP8
	JDQjhoFf0/tq+TWicO+708cNSQJyk9SyIMgGtLCTUr/rkssVSed6AhaqVkfItfCD7Nkh8LNEDKp
	k1FCOwzgYHh4rWIT55Dnmg65cp62+8U99Izqseq78USpd50J48TP63GjWwOxQ3KpUjiOI6L6CJi
	M8nJCn7g8s6fIpr9r8FEb4AAOtxEv/XLEFTeeX3t953SKEYXH4gI2e5gtC+I3LaiQgBqic+IIRg
	a/WXiRns/y5pAg==
X-Received: by 2002:a05:6000:1868:b0:46e:ed68:d249 with SMTP id ffacd0b85a97d-475505f310dmr4182284f8f.3.1782811622478;
        Tue, 30 Jun 2026 02:27:02 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47567a6f0ddsm5669083f8f.37.2026.06.30.02.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:27:02 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
	domenico.acri@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v6 15/16] arm64: dts: st: support Engicam MicroGEA-STM32MP257-RMM board
Date: Tue, 30 Jun 2026 11:24:44 +0200
Message-ID: <20260630092628.1695560-16-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
References: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
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

(no changes since v5)

Changes in v5:
- Fix touchscreen resolution to 480x854
- Fix SPI1 CS0 polarity to GPIO_ACTIVE_LOW

Changes in v2:
- Drop the clocks property from the sai1 node in stm32mp257-engicam-microgea-rmm.dts
  to avoid overriding the peripheral bus clock reference defined in the base
  SoC device tree. Suggested by Sashiko.
- Reference the existing labeled nodes directly at the root level using
  &sai1a and &sai1b in stm32mp257-engicam-microgea-rmm.dts instead of
  redefining the entire node structure and redeclaring the labels. Suggested by Sashiko.
- Drop the #clock-cells property from sai1a and remove the reference to sai1a from
  the clocks array in sai1b, relying strictly on the st,sync property to handle
  internal synchronization.

 arch/arm64/boot/dts/st/Makefile               |   1 +
 .../st/stm32mp257-engicam-microgea-rmm.dts    | 319 ++++++++++++++++++
 2 files changed, 320 insertions(+)
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
index 000000000000..3aea0c2f6651
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea-rmm.dts
@@ -0,0 +1,319 @@
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
+		touchscreen-size-x = <480>;
+		touchscreen-size-y = <854>;
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
+};
+
+&sai1a {
+	dma-names = "tx";
+	status = "okay";
+
+	sai1a_port: port {
+		sai1a_endpoint: endpoint {
+			remote-endpoint = <&sgtl5000_tx_endpoint>;
+			dai-format = "i2s";
+			mclk-fs = <512>;
+		};
+	};
+};
+
+&sai1b {
+	dma-names = "rx";
+	st,sync = <&sai1a 2>;
+	clocks = <&rcc CK_KER_SAI1>;
+	clock-names = "sai_ck";
+	status = "okay";
+
+	sai1b_port: port {
+		sai1b_endpoint: endpoint {
+			remote-endpoint = <&sgtl5000_rx_endpoint>;
+			dai-format = "i2s";
+			mclk-fs = <512>;
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
+	cs-gpios = <&gpioh 8 GPIO_ACTIVE_LOW>, <&gpioh 3 GPIO_ACTIVE_HIGH>;
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

