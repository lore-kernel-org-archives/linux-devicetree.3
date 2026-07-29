Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BB64BC02C
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 14:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785334364; cv=none; b=l3Sd/PV2aMLRsOimtP+wl9EleESWbNBvHA2v7ue6YU3i9sLZs1FKcN8c4/FabwPXlIHK87aQmOb+6palS3Y9s9bARQrMCbv15M1X27NkbtMAFiR9jww6S7fsvOoHJv9JtmEZIPqCCSaoZGDs+WnGI29KkgIkzjuvpPRXrz9nCfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785334364; c=relaxed/simple;
	bh=7cCz1MwGca2wIcac9bznYwcXoSt7EFaPvTPA/5+qPdI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T2BbIcGFY4qJn03ggyjxBwbfbuH9RY17vVRS0BoVj+I1P6ZYyq4/yNmkUtuZ+rImGLINh6r/IOdU32+dtOZ7sF/+Zv/kcYkS4YzYmZT4MpwDyfR9cu8Je6LxnTEHZBL5oDLG0/wHLRuM/ttJrlvjnvQHdmukaRuqRAr3B71676k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HH9kHQVB; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HH9kHQVB"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47f9ab7ee38so665710f8f.2
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 07:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785334360; x=1785939160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dg/MbR2Z6TESuIFxgaSk9l6XDWrZ8tDzJ8s/nIWGkrA=;
        b=HH9kHQVBJQDZKmjcICS+TOlJiBc45sKvEXI5M3hyn0/58N6aQBojWUKx6lgj1GvT0J
         OUs61ObBfxiOVtJ95fhZLo6405S4Ezs1jSXmINqtBDr9Oe/nVy3HxDFRzBpddYbYc9cH
         bG/fbyTQcPc20qsnYEYdRxHRl5nKFEl9HZY0iIy7X5rGCK43w8lEj+18AwUxFeHfEn9C
         gFz4vzQ8nKUfjqNb3FdOzYEKQv3gkF8jlseMZNrNOnzcc90eFSx2EnwbcNeMlDd8UH/1
         a0NFSgmcyJWyUXBrUyT4wD1HF8x4litUTi5v3G5Xfa4op7R/+7ROeXvQQSd3pgD6N0os
         02dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785334360; x=1785939160;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dg/MbR2Z6TESuIFxgaSk9l6XDWrZ8tDzJ8s/nIWGkrA=;
        b=cswymlfHGXvbkwiALFgWYTptY6m/dO2ae6O2Y2rO0GPzKRbv+ESzzvFnDoW/jpUqgQ
         bSNezY1AF6Z6QRtdLxxoUUP9XKzl6TP49VQiN5OzL+8AUbx0r3bvBZKCcPXgdsZKqdUh
         Vw02v8w33qqUQ2prpP1m5PJub2YH41V3UQSm1gOeLKFkKor5pcYz7/F40/0u9nqe1ZL6
         wQBQdoAPZZkEsHXBhrI8F88GvKoZnKejOa85QLgc4r957TVOWYrWzRcF1S2Zr2A/UEWw
         qs8oOV+llnIkELn+uFTR76g0yovtc2MMtGRN0KuPhvKGtbZoiUJkvXm2VlSi5cucpN1/
         Aicw==
X-Forwarded-Encrypted: i=1; AHgh+Rp+jYCxJagwJvqGt0YFqaFS9MVws1oJKv1eIgvkM+CnzVFUJIbEjPlcW35W2M/X031PuE+8vKWs942W@vger.kernel.org
X-Gm-Message-State: AOJu0YwKLBTt6HTOkHg2v6NO4quLRJXfQlRwG/xuuALLGkDmxC1Qs+zL
	RUCd7j5R8sdEjGXM0U2k+EC6JRmGX9PFWcaVW5aNyzOEdz+KKOjT4ZZf
X-Gm-Gg: AR+sD13kGMhg50YAmU4SW3tvzHQ4BQOfK58erJcw8k09SOghxepXoLDfJwj39XJL/bC
	7WT3+Fg74Oq8JIOWKl9P7g1PEexMm7KPxt0HwUCNQbC6KBlXZeTG9mWGIFpw94xMbhZ9Afsq+3w
	hoEkp91w5hpIL6ise6PTrL6I+ED+ki2VnJksEnSCfrd6vScKPHC1yznmSqfzCFt5KRmX13dZG6P
	Hy4WV0kYTHYuGzSzvLfhfmNYcNW5XNqSSuKkFEnTYPOUUyYo/3FimHraf7vwgZF5lbXpR+dn1dG
	HfN019xZspjPiLfLLa9ZIANo59U4ZCw9iY9mXSMOIih95JarzsVAWZsOU6yyV4KL+pR4RJDeVNl
	JplqAPpuu9hOO0dfIkxLaGI4T1C59/SY2C5VMFqxjGZ/X78T5TcFBM8ia19rQBgnx2x1jyrG0UM
	6CNeNbeCJNu9j4HOM9gH1xJj2WzUDuF3E3bsrpIjgjYbjNpNu99Felk/7sevr8k9r0W4HyRxUud
	jt/OBtJa9UCaZuDT1Bf5g==
X-Received: by 2002:adf:e19c:0:b0:472:3090:d878 with SMTP id ffacd0b85a97d-47fb1ecaf7emr7635569f8f.4.1785334360362;
        Wed, 29 Jul 2026 07:12:40 -0700 (PDT)
Received: from slackboot (93-34-146-61.ip50.fastwebnet.it. [93.34.146.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6ad01b6sm8955482f8f.16.2026.07.29.07.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 07:12:40 -0700 (PDT)
From: Alberto Robazza <robazzalberto@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Alberto Robazza <robazzalberto@gmail.com>
Subject: [PATCH v4 3/3] arm64: dts: amlogic: add support for Orbbec Zora P1
Date: Wed, 29 Jul 2026 16:12:34 +0200
Message-ID: <20260729141234.65037-4-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729141234.65037-1-robazzalberto@gmail.com>
References: <20260729141234.65037-1-robazzalberto@gmail.com>
Reply-To: Alberto Robazza <robazza.alberto@proton.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Orbbec Zora P1 is an A311D (Meson G12B) board with 2/4 GiB DDR4,
an Ampak AP6256 combo module (Broadcom BCM43456 Wi-Fi over SDIO and
BCM4345C5 Bluetooth over UART_A).

According to the original Linux dts, the board is a modded version
of the ODROID-N2, with Amlogic A311D instead of the original S922X
and WiFi and Bluetooth support.
So the device tree builds on meson-g12b-a311d.dtsi and
meson-g12b-odroid-n2.dtsi (using same vddcpu values of N2+),
extended with the board-specific GPIO wiring for the AP6256 handling,
and some modifications for the led, GPIO_ACTIVE_LOW instead of
GPIO_ACTIVE_HIGH and different label (it is a green led, not blue as
in the Odroid N2).
Add the new DTB to the Makefile.

Signed-off-by: Alberto Robazza <robazzalberto@gmail.com>
---
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../boot/dts/amlogic/meson-g12b-zora-p1.dts   | 105 ++++++++++++++++++
 2 files changed, 106 insertions(+)
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
index 000000000..6e696ddbc
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2026 Alberto Robazza <robazza.alberto@proton.me>
+ */
+
+/dts-v1/;
+
+#include "meson-g12b-a311d.dtsi"
+#include "meson-g12b-odroid-n2.dtsi"
+#include <dt-bindings/leds/common.h>
+
+/ {
+	compatible = "orbbec,zora-p1", "amlogic,a311d", "amlogic,g12b";
+	model = "Orbbec Zora P1";
+
+	leds {
+		/* Status led on Zora is actually green, same pin as N2, but reversed polarity */
+		led-blue {
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpio_ao GPIOAO_11 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio GPIOX_16 GPIO_ACTIVE_LOW>;
+		clocks = <&clock_32768>;
+		clock-names = "ext_clock";
+	};
+
+	clock_32768: clock-32768 {
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
+		clocks = <&clock_32768>;
+		clock-names = "lpo";
+	};
+};
+
+/* vddcpu regulators same as Odroid N2+ */
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

