Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E7E37BE86
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 20:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785097021; cv=none; b=bECdIEZRLAsTRflBv5OA/IehSi001zZIqyNYk95OcKZl0W9fSAUgUSK2xLdMgdOO8/kQcvgBYM0NLfyT8rAHZkYJa1aj8kIV84jdApU/N/2sTGLdoZsKH7M4QuWUGOGoHQqC28FoMT7paQCJmUJrx+EJzMRm+vBnjLpluS8ZruQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785097021; c=relaxed/simple;
	bh=S5wq195Ebnxzca9QlPHYZK3ANAt63SAX852eYldLQ8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cFLz9CRcvLTRUCEyf1KIvSKN36fn8nAB22kOKpaLQ7fr0uaE95EtTFJ60AcXAv+xdHJjbmjaI719INg+90KMK/cXod+D11u8aqv4TZTnyOhW82L6OYoqQkBIM75CVgu5p5UbNIm3U2w6m27jT6K0HQ4O5DCc80y44AhjMurhX1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IlFW9rUJ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IlFW9rUJ"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so1731055f8f.1
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 13:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785097016; x=1785701816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G2/PwY+IVFHzX9CHGSv9APYDlo4OL8d6Ez0vNK+a/FY=;
        b=IlFW9rUJjKWv/YM2+BazDWc/4BbJjmD/J7Uow4ieIJMK7dPtgCjZgp92z+EJVQim68
         yftkcl+ToQn5A8f4vnWGWMj7ZJN70qCP6W7XhSDItwBKMJCDQxW7fBR56O/UNAPEb4V4
         TObvqW3OcaYZuOMz/2NnFXhpkR91r4TkFFIM6KIYpW8eZ+1ozoaMqU0fXyV7+ehXx+T4
         EQAz0uDPrxwlPUkZZA3pP1EuIbOjhCPWiqX90Af8gviTmIjvHraWbwW2CQlLi67HzRQq
         D8218Z01Rs2Ji+o6ALmGyxWeViwm62n4BsrqWHs5WZA7BlKpaNEcMAO/BpfJl96MT2bp
         +OLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785097016; x=1785701816;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G2/PwY+IVFHzX9CHGSv9APYDlo4OL8d6Ez0vNK+a/FY=;
        b=cNwyHitIIs+p4XdU0SwLX+/EdQFka1xgrQYLgvs9vMw9wN8wXOsVF28FuJi/BSA7Tn
         36N5kj/IhiMNrJh4iaZC+MgpHVlw3SfeHc503MdwW6Mhp9GYYDnj8U4KqagVQDxvr4N0
         C6TtjP5uBbF1WGg5igZa/e/Fgk5F275j/5HSvie2S0lJphTw/cyusJuxZhgPhvSfylz1
         NH9oZ2wZXrIN/TyANPmViXGfPxQaNv5fVTb4j/bMQL9ny8FmQ0XCvdOFmLnmJajxgHRa
         shJMF7ycernLJwhVCZLCjyT4jibzrW73hxvsVAsaBeBCqHT84OqN2kGT4IXofrkLjrCP
         gdLg==
X-Forwarded-Encrypted: i=1; AHgh+Ro3G6nLCYf1xuOp5qQ9zdyuDOEpEXfnsqDqPd9rOaQScmZ3z4RNRC3KJknEn8ykXo1NFkMhdUzg+hpA@vger.kernel.org
X-Gm-Message-State: AOJu0YyQW43MQCfri6MSFhI2lcYAGOQ9ZDaUjB3ScKc7XNTHGAtt4jy8
	EG7DOW3pFfq983xhz15vgnacoHDirlXIl79d1JNGk0v0oMVCKF4UPg3SCvzNsrCL
X-Gm-Gg: AR+sD11i8nQBuuO79RiyGxzESG3nkfM/HT6Q3DdG1YxnCqSugozyuEJ4/iHA5erWRUO
	QI/xF++fwtISo/PJRG9AB9uJX/Jl/bbOXCUlpim2mff4vODQ4EMwFiCkyxOK1WPLJT/fsmd6GUL
	4Y/tY7u0IU5fJoS/cIiGG5s0lV10dAhIbEufJpK9JBuY1DcpxUgvdhHE5A9AAzKkuEgD6y4+TuQ
	C3SPB3ko2VRNlOIjdgjae3eD7X4V4CVOlcl1k/BhFjrxtrR1NT+JZN7A3hFq3bGYdl1xBOmAuch
	v2snURDgNP8NX4BHqk3zHn1hdPFnO5pf8IfytIj+hreCLkaaNrmLnA5oWcOrDloal6BdGRXkN2T
	ysI5doBOx3bv+U8kAeR1dX7ATryMKo4ogY5JrQDOsB16HH07ILuYRPzcsdO3fwP3TxLyGHutZhC
	W2FTb/tqW/xvYFrYD55jDQOSM8huwGPTUEM7czKA==
X-Received: by 2002:a05:6000:1863:b0:47f:7c4d:c9a7 with SMTP id ffacd0b85a97d-47f9fea88b6mr9103956f8f.47.1785097016441;
        Sun, 26 Jul 2026 13:16:56 -0700 (PDT)
Received: from slackboot (93-34-145-231.ip50.fastwebnet.it. [93.34.145.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c52fa9sm43621117f8f.20.2026.07.26.13.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 13:16:56 -0700 (PDT)
From: Alberto Robazza <robazzalberto@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: robazza.alberto@proton.me,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v2 3/3] arm64: dts: amlogic: add support for Orbbec Zora P1
Date: Sun, 26 Jul 2026 22:16:47 +0200
Message-ID: <20260726201647.264108-4-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260726201647.264108-1-robazzalberto@gmail.com>
References: <20260726201647.264108-1-robazzalberto@gmail.com>
Reply-To: robazza.alberto@proton.me
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Orbbec Zora P1 is an A311D (Meson G12B) board with 2/4 GiB DDR4,
an Ampak AP6256 combo module (Broadcom BCM43456 Wi-Fi over SDIO and
BCM4345C5 Bluetooth over UART_A), HDMI audio output.

According to the original Linux dts, the board is a modded version
of the ODROID-N2, with Amlogic A311D instead of the original S922X
and WiFi and Bluetooth support.
So the device tree builds on meson-g12b-a311d.dtsi and
meson-g12b-odroid-n2.dtsi (using same vddcpu values of N2+),
extended with the board-specific GPIO wiring for the AP6256 handling,
and some modifications for the led, GPIO_ACTIVE_LOW instead of
GPIO_ACTIVE_HIGH and different label (it is a green led, not blue as
in the Odroid N2).

Add the "orbbec,zora-p1" compatible to the amlogic.yaml board binding
(the "orbbec" vendor prefix is already registered) and the new DTB to
the Makefile.

Signed-off-by: Alberto Robazza <robazzalberto@gmail.com>
---
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../boot/dts/amlogic/meson-g12b-zora-p1.dts   | 103 ++++++++++++++++++
 2 files changed, 104 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 57bc440fa..83fb38b94 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -40,6 +40,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12b-radxa-zero2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-bananapi-m2s.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-khadas-vim3.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-ugoos-am6.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-g12b-zora-p1.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-kii-pro.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nanopi-k2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nexbox-a95x.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts
new file mode 100644
index 000000000..fe20d39a8
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2026 Alberto Robazza <robazza.alberto@proton.me>
+ */
+
+/dts-v1/;
+
+#include "meson-g12b-a311d.dtsi"
+#include "meson-g12b-odroid-n2.dtsi"
+
+/ {
+	compatible = "orbbec,zora-p1", "amlogic,a311d", "amlogic,g12b";
+	model = "Orbbec Zora P1";
+
+	leds {
+		//The status led on Zora is actually green, same pin as N2, but reversed polarity
+		led-blue {
+			label = "p1:green";
+			gpios = <&gpio_ao GPIOAO_11 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio GPIOX_16 GPIO_ACTIVE_LOW>;
+		clocks = <&wifi32k>;
+		clock-names = "ext_clock";
+	};
+
+	wifi32k: wifi32k {
+		compatible = "pwm-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		pwms = <&pwm_ef 0 30518 0>;
+	};
+
+	sound {
+		model = "ZORA-P1";
+	};
+};
+
+&pwm_ef {
+	status = "okay";
+	pinctrl-0 = <&pwm_e_pins>;
+	pinctrl-names = "default";
+};
+
+/* AP6256 Wi-Fi: Broadcom BCM43456 over SDIO. */
+&sd_emmc_a {
+	status = "okay";
+	pinctrl-0 = <&sdio_pins>;
+	pinctrl-1 = <&sdio_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	bus-width = <4>;
+	cap-sd-highspeed;
+	max-frequency = <100000000>;
+	non-removable;
+	disable-wp;
+	keep-power-in-suspend;
+
+	mmc-pwrseq = <&sdio_pwrseq>;
+	vmmc-supply = <&tflash_vdd>;
+	vqmmc-supply = <&vddao_1v8>;
+
+	wifi@1 {
+		compatible = "brcm,bcm4329-fmac";
+		reg = <1>;
+	};
+};
+
+/* AP6256 Bluetooth: Broadcom BCM4345C5 over UART_A. */
+&uart_A {
+	status = "okay";
+	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+
+	bluetooth {
+		compatible = "brcm,bcm4345c5";
+		shutdown-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_HIGH>;
+		max-speed = <2000000>;
+		clocks = <&wifi32k>;
+		clock-names = "lpo";
+	};
+};
+
+//vddcpu regulators same as Odroid N2+
+&vddcpu_a {
+	regulator-min-microvolt = <680000>;
+	regulator-max-microvolt = <1040000>;
+
+	pwms = <&pwm_ab 0 1500 0>;
+};
+
+&vddcpu_b {
+	regulator-min-microvolt = <680000>;
+	regulator-max-microvolt = <1040000>;
+
+	pwms = <&pwm_AO_cd 1 1500 0>;
+};
-- 
2.55.0

