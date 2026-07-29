Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E54E3A0B05
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 17:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785347509; cv=none; b=jmbnswd7gn1kWqehrcmylIYJZ4AF4g3yxXJdRq45iEwpPkQ10zgXMa7zMMwARXBPljIOUzrLqKzHL8r55IyzMVaPVcXVxKADBOzjs62FLKsgts+yNNviXArcLxI9VN7YXTN4EoSL5vHHOpiqJ34JJRi5BqkuC9J5w2nCoNecIq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785347509; c=relaxed/simple;
	bh=7cCz1MwGca2wIcac9bznYwcXoSt7EFaPvTPA/5+qPdI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oOhsVQU3rnD8l7lSlpZgqOQus5qy0IcgkQM+umRpiab8qEQ7C6Uh9o6I3IZ4EihwaNxpNa8boH31BWTe4GeplelcQND7Y58oWWd5nzNyJD82lnsFrNHmnVfy2FIxotsSm3nWn3aMEXNeq3k7v9imtG2pqyRKaVKEwzQv0DO1ZQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hjjBDdGs; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hjjBDdGs"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49550ec592cso1039975e9.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 10:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785347502; x=1785952302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dg/MbR2Z6TESuIFxgaSk9l6XDWrZ8tDzJ8s/nIWGkrA=;
        b=hjjBDdGs0AbPtpYtV73tZJYRYLxeE1tS2p59XmKLYltGGxvJx3P+vHqRjMZBParK1z
         69bT3pyFTjJID4zjNelzwZOsCrxFyV0aXEZp4EMPTDsaxYqEI50Hi0UaXoXlK/D2cVSS
         rWDXhVHu+wrozmKyoc9/4N3IsGu6swibLX5wvinU7deu95xJniw+z15yG3YB3zUJyhho
         nqvGb7fabccfNKZELNKcwkSu2uA0tQ67GkA9FqUgVoyNDkDxEGVYnSDdfpV4zeR7P5kC
         tQMB/CTDFUhgeqvxhPT3eIdew1oSc4INcCZXscrpUrz6VImQDq5bqbuW8brXuVUUie6o
         Mxhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785347502; x=1785952302;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dg/MbR2Z6TESuIFxgaSk9l6XDWrZ8tDzJ8s/nIWGkrA=;
        b=qbUWMhbD5wCa49Qvm7+7eapMLvqQsCXbei5//SKQzanAVfUGlbftDcm8Sgxz/jYqaF
         LO/q1f8B3INrpitU65OuNanl4zYgQ1a+5lv5OZ1pAMCjgWedtW/EAcNQYIeVMA//a85R
         aCoiANKMj4dIqwGW1ikExn0HoJOeWNonOmwsYYmDznStKjpO9nnKi1a7I0XwOZzMOUmj
         yAREitqaBfBorC9wizCpfUKsHyQWJlXwr8AEQLNnPdpIKjtBQBKls6uQ/5rLQL0db3f3
         vSr6D5os+IIuMTBgfUNCTZWActPxGjURDjEWEhd7Q+XWszV9KpdkdXG/AD/WUXCaook9
         92yw==
X-Forwarded-Encrypted: i=1; AHgh+Ro19a6MUXWsposFA18MSZj+jZ74jJv2wFG0QYW55tA/Wt9k0Pj4A3aBsLxhhzMFTIaQ5ZhqYkMenOKa@vger.kernel.org
X-Gm-Message-State: AOJu0YzKS+lprGKqS0ERvrkhuzhNcOymuMgKP+rN6E3w7tKjatjqR43q
	ZQ6ZzzEfC12CtS5dqQMDuPUfT9VvoLsXnzcJ+nWzwxUIut+IHMNVIXGY
X-Gm-Gg: AR+sD100LYNffMAyt9kpC1lElYauhNhbQygaUl1hJ7Hw9U4q1V1m5C2vb262K3XLn6h
	qqvz8ziN1EfmME1yPg5UAtpSsaZ9jG3AZ66Ev7qIuH2iYWKEIaHZcPhNw17xTunzD085R72Hsjp
	+XuLHPBLyWO7CwQVd/VB5yDkrfNs+w8DJgLqpXFy+q9C6OpZWqu08blJdfxt1k5N6Z0pDERbdaa
	rHOtHNEICkLhBt4m0/EUry+/y/xs7wumw5FcNcFcfaP6PCeHD6cA5v/cjXeoA9F81mBCrfY1EYt
	vgAvswMPeLqTvXTazShR17PJmnOgH0Ssjlm04Vsl8/bv6WB9R8U7NSSdE5llIS13ixJfOM8B1ZS
	DVMCDdyg23S7sgbvZ3l6bh0ZUiPZ+CfIYqWlAFFTo6cAoURokmPNtBc6HIYnTbo2iPfBZY4eq7O
	eY3JUacBhpkLK4E4lPbRHiy7gxX446GoSg1wTcx4YOBBBheggyT3mA0p0ADTULcBm49UUo6/yz5
	w/fJvlkEmQefVsiLeS7eWGriLrmQYTB
X-Received: by 2002:a05:600c:45c3:b0:495:69eb:27d3 with SMTP id 5b1f17b1804b1-497fd3014e6mr32775345e9.8.1785347502214;
        Wed, 29 Jul 2026 10:51:42 -0700 (PDT)
Received: from slackboot (93-34-146-61.ip50.fastwebnet.it. [93.34.146.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4976bd83fabsm75723775e9.15.2026.07.29.10.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 10:51:41 -0700 (PDT)
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
Subject: [PATCH v5 3/3] arm64: dts: amlogic: add support for Orbbec Zora P1
Date: Wed, 29 Jul 2026 19:51:34 +0200
Message-ID: <20260729175134.92909-4-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729175134.92909-1-robazzalberto@gmail.com>
References: <20260729175134.92909-1-robazzalberto@gmail.com>
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

