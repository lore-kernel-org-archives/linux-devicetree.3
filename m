Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DBB45D917
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 12:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792327508; cv=none; b=dWOgeeiUBUcGG8ongDEcD0MxVy3/RUUlqGkKDsNTP65bC18NwayMNKvt3KIAmOL1YrYvR8ZN+7wD6c1eo2arDP2mQLLcErkSQdS+4qfrUuhP+ntmJ1sSJ8qxtFLORgcpQR6gAAhKLUvuj2v55H0gJ8fVOmct2KBLZSJI4VhbyNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792327508; c=relaxed/simple;
	bh=Noa79Ng+Kn6spWxsKPE81iJBvswXjoskktvFL5rzVvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cBs852lkpzlj5a2xjxP/uV0oCQr1O1BVtuf57w9iQl3oHVAfvSIom+NDM3mbHoGo2nYkPX1nRlHVM5TPS8neDl5f9feUOuQKGv+AS31Ie1GCveEcKLA0WzMs3IryaHZF4oeqfHLYRPAvsFzU0aeyGqBBXxfzluOKSlQ+ZaiWDMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SAzGr6ED; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SAzGr6ED"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-487049569b6so586536f8f.1
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 05:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792327503; x=1792932303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K67aSMdZxcM3oK3NMOeHN0YPY+i1nG2+CE3+Mxl/Mf8=;
        b=SAzGr6EDlfhwmiALdT2dkschS9fxAoWQTfJ6hcVoulQL4Yq/TLoC97AbagUdkqACqw
         zy0bkaMSV04BSiWPOq6C6q0u8zuRf1fOeczYC4+uodd166XWQ5JaAqZTC5Qt/jUUYvqA
         C/xKswqXlCFwtdKxDbYCk9wo5o8YoxeFCuuLyW6HDqpOPr5yv3qbDc8dj61ZNMSdSKqG
         xDSxWtTwNRqOENdtz2FhCv94U1wrimSmoNS94JYpHKjQUh9GSpShVPvQ8690K2AVvaHl
         fPLZAUONuVAaP05+XpkJJnbHBmJ4T76wh/BMpRqY2tA6VA+Jn+z8kd+JdN4lvmp3jVh2
         DSQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792327503; x=1792932303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K67aSMdZxcM3oK3NMOeHN0YPY+i1nG2+CE3+Mxl/Mf8=;
        b=AAnBhgdLqHd7Gx76HXTBx/h34fxEohNH9fQsn7+Ac5nFHCL5ebeIaesIQPHO4bfG8y
         ANj+TEau5wSZYF7zyJ3m7mNkzGrhMnlMK4ExMN815lnDYHz0MM8CMzkQgvnFyQQfHSFr
         I+sifnVA5OE87gQPqKHTv1MQcasXSmkbaGgPsRcvNHhiKR+PV4QYf+/AhO82aOdKKpzH
         uBx5cXro2MX1RH6RW3Qz0nlOAS6TYU3LR5C5X5mm+01eRajqXz9aVplQDstVaP/+PoTP
         XgwPUPvOEQG6Y6o4bKR1FUTaFJcBeQVa21aTvx8H2UZga2CPmpUcLkEGfbayodFTMWsV
         xfrw==
X-Forwarded-Encrypted: i=1; AKwUvBwVMUqTHjdl8W5icmnR7yv4+cvYoyUoKa35LEWzDSAmAWoWkp1A9YjIOV7eKsdjQ0mNj7HLxwmrcqtQ@vger.kernel.org
X-Gm-Message-State: AFq9FYJndAdp8eegyJLHJdcfAeVhc812nf3amHc75m6eKt+1jndpXEuY
	5w8LYiIUGsbzyBdgj40lwK4NtsCBqU0m2YvpxYHsTKuW7QHZtB+JnoJy
X-Gm-Gg: AYBFou0o8p2emsfZqoHBTO0fNnHiB2eI4XRJZMnC8D3z/6FXzfurSspOmiHPlnQdYDs
	tXEeMywqbMKKMpP+WzkxAfNynFrdkiJrLmUDSxDqNv+2Lz1hq3O5boJJv1v9egwWf2cO4Fdke7D
	8YqeDtFsKYM0wgwayDCEN+jY7Q7I63Vrck2Al2bT8buYFtI2wn9Vk9YyTlP4Qx8hympaQXMHE5C
	pSrOab7V8plZelH/w8yXDcMsPSua0ogEpYW1R3Pnzch1QScg3tX0+M0nPg5MncwG7qW+46YVaq4
	XjfszABt4e3WzmtbqyKhBkWtX7hICQJTmtjxKeD6DPVdWyFmbe5cxW51uMyD1mYlQck0EzTToKq
	KXGaq3ISpkYSaJ2BBajljzj+6I97GFNPdUvmRGk8oZf6s0TmMx1oSuoVmPKM2afa2mdt4FjEoZg
	BD/JUwtrfltE7bwG9vLVgySDOXCF539VRACe++mV2H37LR4D7jXGg9mltLQh4zWtbD7zIBywwkM
	HWy2LJx+Y/VkAJHH3U5zt4mFeJXIh15aRoU27ch6jhmQ9WndbFIzPhA6gBDldL4q/koYiuUpO+U
	1UWYZm56u0dBvrRiGa1jf+PFvQS22Zb1joet1PQGWxtcw2lxEVo+/5GWMUM2ZnqTB3bz5vr8UYV
	E9T2RXalkB9AgHekfp5t4Xrk=
X-Received: by 2002:a05:6000:4a12:b0:48d:ef75:8b37 with SMTP id ffacd0b85a97d-48e07fa8816mr9257345f8f.36.1792327502920;
        Sun, 18 Oct 2026 05:45:02 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-318a-f58b-5e43-a2b9.ipv6.o2.cz. [2a00:1028:8388:a84e:318a:f58b:5e43:a2b9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd500e75sm16386408f8f.42.2026.10.18.05.45.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 18 Oct 2026 05:45:02 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: samsung: Add Hardkernel ODROID-U2
Date: Sun, 18 Oct 2026 14:44:59 +0200
Message-ID: <20261018124459.3026-3-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261018124459.3026-1-pepe.schlehofer@gmail.com>
References: <20261018124459.3026-1-pepe.schlehofer@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ODROID-U2 is a single board computer from Hardkernel based on the
Samsung Exynos4412 Prime SoC with 2 GB of LPDDR2 RAM. It is the
predecessor of the ODROID-U3 and shares most of its design:
- microSD card slot and eMMC module socket
- SMSC LAN9730 10/100 Ethernet on HSIC0
- SMSC USB3503A hub on HSIC1 with two USB 2.0 host ports
- micro-HDMI port with CEC
- MAX98090 audio codec with a 3.5 mm headphone jack and an on-board
  digital microphone
- MAX77686 PMIC
- 2-pin header for an optional PWM controlled cooling fan
- blue heartbeat LED

Unlike the ODROID-U3, the micro-USB port has no VBUS supply switch, so
it can only work in peripheral mode, and there is no expansion header
with SPI. The 3.5 mm jack is headphone only and the speaker outputs of
the codec are not connected.

Add an initial device tree for the board, based on the ODROID-U3 one,
and update the comments in the common dtsi, as the LDO22 and BUCK8
constraints are now also set by the ODROID-U2.

Also route "HiFi Capture" to "Mixer DAI RX", as on the ODROID-XU3. The
odroid sound card driver adds only the playback routes for boards with
a single CPU DAI, so without it the DPCM capture path to the I2S
back-end is incomplete and recording from the digital microphone fails
with "no backend DAIs enabled for Primary".

Link: https://www.hardkernel.com/shop/odroid-u2/
Link: https://www.hardkernel.com/blog-2/odroid-u2-u-schematics/
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 arch/arm/boot/dts/samsung/Makefile            |   1 +
 .../dts/samsung/exynos4412-odroid-common.dtsi |   6 +-
 .../boot/dts/samsung/exynos4412-odroidu2.dts  | 139 ++++++++++++++++++
 3 files changed, 143 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts

diff --git a/arch/arm/boot/dts/samsung/Makefile b/arch/arm/boot/dts/samsung/Makefile
index e0143ee8c82d..2a173e4b3e1a 100644
--- a/arch/arm/boot/dts/samsung/Makefile
+++ b/arch/arm/boot/dts/samsung/Makefile
@@ -16,6 +16,7 @@ dtb-$(CONFIG_ARCH_EXYNOS4) += \
 	exynos4412-i9305.dtb \
 	exynos4412-itop-elite.dtb \
 	exynos4412-n710x.dtb \
+	exynos4412-odroidu2.dtb \
 	exynos4412-odroidu3.dtb \
 	exynos4412-odroidx.dtb \
 	exynos4412-odroidx2.dtb \
diff --git a/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi
index 93ddbd4b0a18..b56b92c78c1d 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi
@@ -414,8 +414,8 @@ ldo21_reg: LDO21 {
 
 			ldo22_reg: LDO22 {
 				/*
-				 * Only U3 uses it, so let it define the
-				 * constraints
+				 * Only U2 and U3 use it, so let them define
+				 * the constraints
 				 */
 				regulator-name = "LDO22";
 				regulator-boot-on;
@@ -486,7 +486,7 @@ buck7_reg: BUCK7 {
 			buck8_reg: BUCK8 {
 				/*
 				 * Constraints set by specific board: X,
-				 * X2 and U3.
+				 * X2, U2 and U3.
 				 */
 				regulator-name = "BUCK8_2.8V";
 			};
diff --git a/arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts b/arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts
new file mode 100644
index 000000000000..5cb5f874b562
--- /dev/null
+++ b/arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts
@@ -0,0 +1,139 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Hardkernel's Exynos4412 based ODROID-U2 board device tree source
+ *
+ * Copyright (c) 2014 Marek Szyprowski <m.szyprowski@samsung.com>
+ * Copyright (c) 2026 Josef Schlehofer <pepe.schlehofer@gmail.com>
+ *
+ * Device tree source file for Hardkernel's ODROID-U2 board which is based
+ * on Samsung's Exynos4412 SoC.
+ */
+
+/dts-v1/;
+#include <dt-bindings/leds/common.h>
+#include "exynos4412-odroid-common.dtsi"
+#include "exynos4412-prime.dtsi"
+
+/ {
+	model = "Hardkernel ODROID-U2 board based on Exynos4412";
+	compatible = "hardkernel,odroid-u2", "samsung,exynos4412", "samsung,exynos4";
+
+	aliases {
+		ethernet = &ethernet;
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0x40000000 0x7ff00000>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led1 {
+			function = LED_FUNCTION_HEARTBEAT;
+			color = <LED_COLOR_ID_BLUE>;
+			gpios = <&gpc1 0 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	fan0: pwm-fan {
+		compatible = "pwm-fan";
+		pwms = <&pwm 0 10000 0>;
+		#cooling-cells = <2>;
+		cooling-levels = <0 102 170 230>;
+	};
+};
+
+&adc {
+	vdd-supply = <&ldo10_reg>;
+	/* Nothing connected to ADC inputs, keep it disabled */
+};
+
+/* Supply for LAN9730/SMSC95xx */
+&buck8_reg {
+	regulator-name = "BUCK8_P3V3";
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+};
+
+&cpu_thermal {
+	cooling-maps {
+		map0 {
+			trip = <&cpu_alert1>;
+			cooling-device = <&cpu0 9 9>, <&cpu1 9 9>,
+					 <&cpu2 9 9>, <&cpu3 9 9>,
+					 <&fan0 1 2>;
+		};
+		map1 {
+			trip = <&cpu_alert2>;
+			cooling-device = <&cpu0 15 15>, <&cpu1 15 15>,
+					 <&cpu2 15 15>, <&cpu3 15 15>,
+					 <&fan0 2 3>;
+		};
+		map2 {
+			trip = <&cpu_alert0>;
+			cooling-device = <&fan0 0 1>;
+		};
+	};
+};
+
+&ehci {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	phys = <&exynos_usbphy 2>, <&exynos_usbphy 3>;
+	phy-names = "hsic0", "hsic1";
+
+	ethernet: ethernet@2 {
+		compatible = "usb424,9730";
+		reg = <2>;
+		local-mac-address = [00 00 00 00 00 00]; /* Filled in by a bootloader */
+	};
+};
+
+&hdmicec {
+	needs-hpd;
+};
+
+/* No VBUS supply switch on the micro-USB port */
+&hsotg {
+	dr_mode = "peripheral";
+};
+
+/* VDDQ for MSHC (eMMC card) */
+&ldo22_reg {
+	regulator-name = "LDO22_VDDQ_MMC4_2.8V";
+	regulator-min-microvolt = <2800000>;
+	regulator-max-microvolt = <2800000>;
+};
+
+&mshc_0 {
+	vqmmc-supply = <&ldo22_reg>;
+};
+
+&pwm {
+	pinctrl-0 = <&pwm0_out>;
+	pinctrl-names = "default";
+	samsung,pwm-outputs = <0>;
+	status = "okay";
+};
+
+&sound {
+	model = "Odroid-U2";
+	samsung,audio-widgets =
+		"Headphone", "Headphone Jack",
+		"Microphone", "DMIC";
+	audio-routing = "Headphone Jack", "HPL",
+			"Headphone Jack", "HPR",
+			"DMICL", "DMIC",
+			"DMICR", "DMIC",
+			"Mixer DAI RX", "HiFi Capture";
+};
+
+&usb3503 {
+	clock-names = "refclk";
+	clocks = <&pmu_system_controller 0>;
+	refclk-frequency = <24000000>;
+};
-- 
2.54.0 (Apple Git-157)

