Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B7743A7F1
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 15:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785251808; cv=none; b=Bj2qzYmpTYZW/9yy+bF/KZxIhla7Lb3OXQcrB66YInWfBpMLJyTVB6ZQc//9FNaqLiNbpiAOSUDwlIwlyGpkCUYVdacLB+UyMe8iW1FlP9yVCyq4HSa954+YVBnPq5sKdXarctOxrAMPtZSruCX3nHo7zblyoUP+N9hVVKG7VuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785251808; c=relaxed/simple;
	bh=Zpf/AOcLlwqAEBJMqXfBI3Ww0n7PvZZ+fDaqtbIxm1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=epLaPNcwj26JSOjQ5oCZGmZ0/gvZAlyFL2kOHjnIIEzxWeSmLmh/asQFOptm/KMmNjjHwREP/gY3NrNlOK40BFXGcPCvX4Wz9RQxiul2Bdpi/vRlMKd7+PWZxhvJ+QbheR2FM2TPg6v2n7rk+eIwdmLNraTu2GKpDLQfTQbF9HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IfCs6zzU; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IfCs6zzU"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f84023916so3969772f8f.3
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 08:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785251805; x=1785856605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7QNyWJjOlsPLUMiOSNZBEFuwctRhGOyXIhHqXv/w/08=;
        b=IfCs6zzUOM5FOPlGXce4m06kIoe5Bnv+Q8wMJ2/uLBNjejp5egCX06JsX16mYCASBe
         bLE/P9FQk9inJ8BKG8B0j3qnUBtPIHof38TyqYeSpLKpOUiaLvNGbBwmnwI/BwQCuX0g
         qLxDhMwMhOpcTvCrvYyCb6EbiKwRIIbLQ6ZvB63xiWnZhf57Xv1kf6HlLC6JIgrhVHF5
         BORsIF2voyPB7Az7SPH8lCFAIKSwfCv+fCzTr2atSC6mKAluXZyeIDAJGinBKkacifSw
         vwndk7rHSFyyySigXqr94zgMNluCw+d2HJZQIkX9EMKp3epZwRnlwiyoBwhIpCNNEX4m
         N9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785251805; x=1785856605;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7QNyWJjOlsPLUMiOSNZBEFuwctRhGOyXIhHqXv/w/08=;
        b=Az7ZhDaPjxeYAfZ49EJ7u1IdIdnSn0ibfudKkvhKISarOBT0r0wgDZoRHT7NxH0ucQ
         mmWb70hI21s3iKEmQHDKeJqEqo5swUhuOFv1RcicMnI4umZftnjKmC3DCavV9VutpiBN
         bWw3Uu1Ec28kryqFk1PAFUCpsnLK8DRZUb9GwwvdJnCbyIBcbEQoGNkypoqLveKSYt/X
         D8qam5hTjy5IUCfMv7Xbk1gQaBpccTdctyq8M1MyPoDrO3cHgjjDgZ+SYBylfOifOZPz
         DyKliOeAfqIe97WH5l1SrW8zpjcL3xbQ9VDntXFiVrvoSFcoVjzG/SWS2T2kUWd7nJyh
         f3QQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp0jrPrwHWwCpFV1xa6kfRejDEsceUgIAqpfahhQRbPh3PbBQaA76mJJNYdBE26DRgN9o1iV/EFuxfC@vger.kernel.org
X-Gm-Message-State: AOJu0YwxmMTc5RxEJ9OoTTj7YaQJ024yk/9OV8E0vDIbXW5FkHhDg1Dj
	IxpOiEGL/Um0+uxWxB7R0G/t3+pWn9MiafaxLoNcu4qH+wqYzXa8isIG
X-Gm-Gg: AR+sD12goqBbBv0Fw7Sf68vuYVujUaIYmBvA0D5U4AbLWUCTn/hAZq0hvI1GNYCqJqd
	VAVUrZqO2U/meW7Iy2BmJsYPOvzR/XZpJHyVf46t/QOF2361XBkayPfJnNRecJQSRrF07FpuGUz
	WF/54u9f21F/Fr91hsnAPxPRzAC7QijG0DuOmvvE51cmIFXr5bDNQnY64f7EppMWHqnbRDGCaQS
	0aheSlhlUMlp/1ynBhvaFiKkqYQ5O3ekSGrcJLhX+IpD7nKbgg/ZWkvzmnyi6XnAokPWiMqTs4a
	i1LA+xyOn8B21pGSgIt1gn9ji6nY0rU25hMSznUQF30tbORBS7fvLpDDRCaGwULnbjwmBucTta4
	321nkinuZvPJAg67EeDYGw4eu5mMg0ldjf6UysJm4QQWPRXEGi1bXva8YBcuuBgy22o7B3mEL83
	rNh0tuvZe3lCz1q2CSKm1MPzHvhsRFrbFD0hY=
X-Received: by 2002:a05:6000:430c:b0:47f:9254:d453 with SMTP id ffacd0b85a97d-47fb1ec8030mr3188995f8f.8.1785251804447;
        Tue, 28 Jul 2026 08:16:44 -0700 (PDT)
Received: from slackboot (93-34-146-61.ip50.fastwebnet.it. [93.34.146.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c631fdsm58422500f8f.28.2026.07.28.08.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:16:44 -0700 (PDT)
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
Subject: [PATCH v3 3/3] arm64: dts: amlogic: add support for Orbbec Zora P1
Date: Tue, 28 Jul 2026 17:16:36 +0200
Message-ID: <20260728151636.236393-4-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260728151636.236393-1-robazzalberto@gmail.com>
References: <20260728151636.236393-1-robazzalberto@gmail.com>
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
index 000000000..d003582fd
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

