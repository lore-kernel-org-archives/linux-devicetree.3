Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C733E316D
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 18:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785090136; cv=none; b=dMO2exv5A35Fsx48zMCVvb720dvjhDlMh0ewe1TblQkyamziWSc7IvLUrEUF/COe0WuisZqIMnEhIsynshloxUQItguTBjKRgaNTf0E22y2EInFwc2O9g7wd9xM517nKPMQGIvNjrjGnmpLClUt08670f89tQebDrM3ubS0qbro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785090136; c=relaxed/simple;
	bh=RwVrAU4CV+WWF8npDrOGRI5fieEBP/wVB3jz2UcGlSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DO+vJ2myw3/G+bw3G5xR7b51sQ0wRDPwHyzO+Qd7VLfNflQxTna5aGKmZSZZz/ETlhcVeH0vHRBJie+7JpOFiZs+zCFT2LjU5xIpoUMHzYYAp3X03xGKMM0ijdfl7TN6gJvJcfOVdQmpgkKFxHz5JGi3MI0b9MmPK6IyAgkDFW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j3ZfOEEB; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j3ZfOEEB"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso10069565e9.3
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 11:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785090129; x=1785694929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZxKcq+z+SrS9YOgP9Wucayj+sHc3IIcXGTLDJtzMh0c=;
        b=j3ZfOEEBXPxou/KD0VS98NSC13w2oRmZkasdSBaLsgC2QEDZty9/B9MqduU0slc3yi
         XQHS2zAIE6HM2L73Om4mYPtdF59SJ19/xzkHlKcUyOwQiFtJRQ2/R69BM6F7IIXpB91A
         o4ArAWqODVgoua0gZpXset5Hn+5lDp7oI1uubgX1biT8pTuJc3/Ee79OYW2HPYvdJkuq
         w8damyTvJ1XUKRsgEex6w5PlNw/Z7ibvSpfpola55f8Ug/e0tu7dyYVBgqv4sBIopvQq
         C88cwQufzx7aTs+T7+h+fJnFasNnEQs5V9KQ6WY+pC9ouIr7/ZD8/AbYnQ6rgtHV6O3S
         udSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785090129; x=1785694929;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZxKcq+z+SrS9YOgP9Wucayj+sHc3IIcXGTLDJtzMh0c=;
        b=i/ArXX8hp/OK25gskpx5Y4oXd6mdPRbso43Il3raVcBhV8jE1tN1jUJ26JU2CkpMs4
         nuQBqwb7pS+x272SNHf0JrxYou0cJKC6+hY1OL8LwmmYv1BcD2775V9kjC/M9X1+qAia
         8L9floFHW+CoEPeyGDObPuYwqEJWz5JJEPHPx47cH/1UaNFWut9MKhSNdqrWUXPCMOYt
         jT6PMi8wXZD4qTaR2gy6V8s1G3FMMBfAQoXPyEBfdSN02nA+9xA6POOQLQII93an/Sln
         QNFgi1jl1Mt7iWGQmh33+RvGzjhzo3sRWchnjG1c6lkGGo7P8Ov9N1zNxkwtpyRnSrpS
         7tvA==
X-Forwarded-Encrypted: i=1; AHgh+RpdVtdbF3WPaloAjaKd1Qj8CChDL2+aYn6E6mjj7zbFl1tOSZfCklGcNdpxIPC9p94Bkl9GNjgnBtqd@vger.kernel.org
X-Gm-Message-State: AOJu0YygCD+C4gWXwdddiRJrgNrTdlTArqlAfuo92HpPYVy2hNxXfDqL
	yJVx671nUicLUInv+4nKfA9Rh47tD9+dhWtfk71AUsUvpwAv6cXfIxnh
X-Gm-Gg: AR+sD10ASgEJaWQxp9M728xw5FLM2uI9hTjUM2LEZOcCUkpNa1Ftc53NHh8eVo80Han
	e5KfDvkwjGzhcV9NS6mn7ZA51KNllbTa2iXNQa/+AZlqZiFK90CHSQz5KQrHG0kADofKmu379kb
	CVzLFPri3ymu/DJpFNHLAiwADymfZuq2Z0Ha3lKfwjfJnpG1mMl/j7i3wLOurqA/5PfuLAWLRZp
	JiA+3OhNI83t6k10xC4iKQtRdRfwQxJAZMVApBMQiFvD4BI9amPdSNbaWk6uaYggGqeq1/ymzA6
	WW66O5tATA/2xbe1dYIjMzCUXx+94oJDZeYU1Kio57x3sy2yEH0bQ24rHyX5xbFWXdXlIJjkXPs
	p8vUfkiPHhvzLkRVe7c95/7hdXnRv6AzNqm5tkJ/U0IsOCTZfECzImUo9DrWEZGWdrXrFnYclVk
	LPftzJdQJvG65f3O1W5469ublI4nQYgKli2cKGxg==
X-Received: by 2002:a05:600c:310e:b0:495:44f3:4576 with SMTP id 5b1f17b1804b1-496b5710dc8mr79233605e9.7.1785090129119;
        Sun, 26 Jul 2026 11:22:09 -0700 (PDT)
Received: from slackboot (93-34-145-231.ip50.fastwebnet.it. [93.34.145.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b52eec24sm150748045e9.3.2026.07.26.11.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 11:22:08 -0700 (PDT)
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
Subject: [PATCH 3/3] arm64: dts: amlogic: add support for Orbbec Zora P1
Date: Sun, 26 Jul 2026 20:21:58 +0200
Message-ID: <20260726182158.249449-4-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260726182158.249449-1-robazzalberto@gmail.com>
References: <20260726182158.249449-1-robazzalberto@gmail.com>
Reply-To: robazza.alberto@proton.me
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alberto Robazza <robazza.alberto@proton.me>

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

Signed-off-by: Alberto Robazza <robazza.alberto@proton.me>
---
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../boot/dts/amlogic/meson-g12b-zora-p1.dts   | 103 ++++++++++++++++++
 2 files changed, 104 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 57bc440fa..95e9071e0 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -36,6 +36,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-go-ultra.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2-plus.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2l.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-g12b-zora-p1.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-radxa-zero2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-bananapi-m2s.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-khadas-vim3.dtb
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

