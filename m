Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553563A6B82
	for <devicetree@vger.kernel.org>; Sun,  3 May 2026 19:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777835938; cv=none; b=WRsud1dQfb5GezTKb87d5nbIHU2wJ5kQrils31m5E35560E0IGUFIo6KR1r2xrg5EWrdJCAGC0ZSt1KCqenS1ZA7f6uTPR30pJJYgBzBpKvinu5/BZ7J8FQ1cr9ftrxM5dk21uri35P0MH8fgW84WWFPhdp6/f0ASXaU8gNys8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777835938; c=relaxed/simple;
	bh=tWwW8xlK/MSqrFa9aQd299c+0S/IVYTry0ZrZ8XSNPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UeFRO3SE0PYVeOnSUie9H+mWjKRqW8zhKO2q5g6UpKCR2zrOJ3/EhY8XTVxMe0zFIkEfC9EFZB3o9xphgSoAMeSjJRDy+yZY8LIEyIzqWiZbfK+W+8A7rfm14yj/gGEsV2TCeJb7KzZiOxyHjKYQaluFWlfU7an52Bq8AznLz68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q8xYe6OH; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q8xYe6OH"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso23360115e9.1
        for <devicetree@vger.kernel.org>; Sun, 03 May 2026 12:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777835935; x=1778440735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5SVr5FfGqw1uBAV0gP9IimhA/pN8ipjATE7h+sfzNk=;
        b=Q8xYe6OHB4T0pK0RN+R4fSzxi3OcRIJiYnVrGUh7s5MEvC12ryBTaeSKdQMoUexmSC
         L4ThlqH6EKf/3H+bQ28wZy4j5fXRNtF0QkHxRywW9KzoIwzg979OSjo56qkROm4GI/PP
         XqaAlTEX0mcRZ1DBoQglV9n465EgTHDM6/3m9BaC5SXxDbYadcyr+gDqhYQQyyAbHno9
         lfJuwp6Ok3GcedtxPLv/+N6ZKXd5bJS1RgVXtb0dzbWOrrhc5cTW52HTEr48+dMH5jwn
         XG9JCYheW/HAdhF4pfObxWzNGOv08U2WXBfnH+NU4iEUkHNaoPt6GpfRdRWAU0mPMF2u
         jk4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777835935; x=1778440735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/5SVr5FfGqw1uBAV0gP9IimhA/pN8ipjATE7h+sfzNk=;
        b=qaLAGxhNBxpnAe9pKZM5iiYbqPIsx+YeEw5WeBXAhcvL0DC05CJN9WrEsMddQmelUE
         Dj3q1vHizVobAmL4W/UO4kwjZfx/OU0KhoFizKNq+jdWDJAmP7Iou+0+jcny/wO2zVde
         Yk3qk/Uu8wKi9M5mxlht3bNqc8S9hcljUE7JvM7ibtJhs56ehtVWOJ0JpccacLrTDHGe
         jQTd/nit1+IYK9WQpLVjwvKwYuuP/2y3wiNlRsxDBhtUginwr+Gn1rnyn3xvEzAhZ1MG
         qwNgEkLZiawwQ/WqtVaP10wwWxOtR6H1s5w6jOAQLFPKNoA+voL8AjmVfY49IGWDVreK
         7fLg==
X-Forwarded-Encrypted: i=1; AFNElJ/3CG6oGIhK9Ktav6zoXu+I7pkIkSXOu/XB5BIaTqDYAWpjmUF+uJ/LTinvzc+UjATOfVkMmYp+49DG@vger.kernel.org
X-Gm-Message-State: AOJu0YxZw2SpkUi81ZoKlHvip2CwGtgDPKblccELq4riGQioBgNtij13
	oXeJr3MP257QUro6dFLiiUyIOJl/q990aE+DhjTEdQU9nyFpQxIIwi9+
X-Gm-Gg: AeBDievEqkXT4NAhyGYkzKKBDKEOda3wJyi7CNuDJ/U/4YZghX7q+ZY64PDU98LJbyv
	OxZPXclIclKiuu+PYqgSYdgs2OHFLL3a7cW7/zdNZqIE9nwRr98Iz3bMg1WQki40zGxx2TF9VMT
	LuNcq+j9tv8Xsuzdp5QvlY6gGzIUSf9NxQTth5tJtx+4x5cnPO6gya7HDopQ3s5LXhIJQwHzFdy
	2jJaN9oMSe+/YJ1raUdhPceEKKd4sIjPfkJajrurfgxl9QAYYnsnl7OoDT03VNGg1bBRWU4Iaeq
	HyqZn8KiVvyWcyJsIeGDsDv2xpVr0sxzLRzXS6uMs4adG4oJ4uoFZjb5BEcI++h1hnQMnsD+pYd
	dsyrew/Iy4rN0hKIfuLhwxVPZx4NwfcPgvfTgzg9LjqRezqkZE0SisIYZIwtZe203SxKKDqmhhm
	ne4UdgRuoV3PiFIV7kq90EpONjqIWMIlNAG6AQvARXbFRpsjmo5FgUxnmw1EcUBJs=
X-Received: by 2002:a05:600c:a316:b0:489:2005:b36e with SMTP id 5b1f17b1804b1-48a988a4cfamr83350095e9.19.1777835934701;
        Sun, 03 May 2026 12:18:54 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8fe928f6sm62230925e9.6.2026.05.03.12.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 12:18:54 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: allwinner: A133: add support for Baijie Helper A133 board
Date: Sun,  3 May 2026 21:18:38 +0200
Message-ID: <20260503191842.2736130-4-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260503191842.2736130-1-alexander.sverdlin@gmail.com>
References: <20260503191842.2736130-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Baijie Helper A133 board is a development board around Baijie A133 Core
SBC. Features:

- 1/2/4GiB LPDDR4 DRAM
- 8/16/32GiB eMMC
- AXP707 PMIC
- 2 USB 2.0 ports
- MicroSD slot and on-board eMMC module
- Gigabit Ethernet
- Bluetooth
- WiFi

Add initial support for both the Helper and Core boards, including UART,
PMU, eMMC, USB, Ethernet.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun50i-a133-baije-core.dtsi | 159 ++++++++++++++++++
 .../allwinner/sun50i-a133-baijie-helper.dts   |  92 ++++++++++
 3 files changed, 252 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index d116864b6c2b..926dfa851100 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -18,6 +18,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-sopine-baseboard.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-teres-i.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h64-remix-mini-pc.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a100-allwinner-perf1.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a133-baijie-helper.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a133-liontron-h-a133l.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-bananapi-m2-plus.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-bananapi-m2-plus-v1.2.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi
new file mode 100644
index 000000000000..78da3baa65bb
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi
@@ -0,0 +1,159 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2025 Arm Ltd.
+ */
+
+/dts-v1/;
+
+#include "sun50i-a100.dtsi"
+#include "sun50i-a100-cpu-opp.dtsi"
+
+/{
+	aliases {
+		serial1 = &uart1;	/* BT module */
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&pio {
+	vcc-pb-supply = <&reg_dcdc1>;
+	vcc-pc-supply = <&reg_eldo1>;
+	vcc-pd-supply = <&reg_dcdc1>;
+	vcc-pe-supply = <&reg_dldo2>;
+	vcc-pf-supply = <&reg_dcdc1>;
+	vcc-pg-supply = <&reg_dldo1>;
+	vcc-ph-supply = <&reg_dcdc1>;
+};
+
+&mmc2 {
+	vmmc-supply = <&reg_dcdc1>;
+	vqmmc-supply = <&reg_eldo1>;
+	cap-mmc-hw-reset;
+	non-removable;
+	bus-width = <8>;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	status = "okay";
+};
+
+&r_i2c0 {
+	status = "okay";
+
+	axp803: pmic@34 {
+		compatible = "x-powers,axp803";
+		reg = <0x34>;
+		interrupt-parent = <&r_intc>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+#include "axp803.dtsi"
+
+&ac_power_supply {
+	status = "okay";
+};
+
+&reg_aldo1 {
+	regulator-always-on;
+	regulator-min-microvolt = <700000>;
+	regulator-max-microvolt = <3300000>;
+};
+
+&reg_aldo2 {
+	regulator-always-on;
+	regulator-min-microvolt = <700000>;
+	regulator-max-microvolt = <3300000>;
+};
+
+&reg_aldo3 {
+	regulator-always-on;
+	regulator-min-microvolt = <700000>;
+	regulator-max-microvolt = <3300000>;
+	regulator-enable-ramp-delay = <1000>;
+};
+
+&reg_dcdc1 {
+	regulator-always-on;
+	regulator-min-microvolt = <1600000>;
+	regulator-max-microvolt = <3400000>;
+	regulator-name = "vcc-3v3";
+};
+
+&reg_dcdc2 {
+	regulator-always-on;
+	regulator-min-microvolt = <500000>;
+	regulator-max-microvolt = <1300000>;
+	regulator-name = "vdd-cpu";
+};
+
+&reg_dcdc3 {
+	regulator-always-on;
+	regulator-min-microvolt = <500000>;
+	regulator-max-microvolt = <1300000>;
+};
+
+&reg_dcdc4 {
+	regulator-always-on;
+	regulator-min-microvolt = <500000>;
+	regulator-max-microvolt = <1300000>;
+	regulator-name = "vdd-sys";
+};
+
+&reg_dcdc5 {
+	regulator-always-on;
+	regulator-min-microvolt = <800000>;
+	regulator-max-microvolt = <1840000>;
+	regulator-name = "vcc-dram";
+};
+
+/* DCDC6 unused */
+
+&reg_dldo1 {
+	regulator-min-microvolt = <700000>;
+	regulator-max-microvolt = <3300000>;
+	regulator-enable-ramp-delay = <1000>;
+};
+
+&reg_dldo2 {
+	regulator-min-microvolt = <700000>;
+	regulator-max-microvolt = <3400000>;
+	regulator-enable-ramp-delay = <1000>;
+};
+
+&reg_dldo3 {
+	regulator-min-microvolt = <700000>;
+	regulator-max-microvolt = <3300000>;
+	regulator-enable-ramp-delay = <1000>;
+	regulator-name = "avdd-csi";
+};
+
+&reg_dldo4 {
+	regulator-min-microvolt = <700000>;
+	regulator-max-microvolt = <3300000>;
+	regulator-enable-ramp-delay = <1000>;
+};
+
+&reg_eldo1 {
+	regulator-min-microvolt = <700000>;
+	regulator-max-microvolt = <1900000>;
+	regulator-enable-ramp-delay = <1000>;
+};
+
+&reg_eldo2 {
+	regulator-min-microvolt = <700000>;
+	regulator-max-microvolt = <1900000>;
+	regulator-enable-ramp-delay = <1000>;
+	regulator-name = "dvdd-csi";
+};
+
+/* ELDO3 unused */
+
+&reg_fldo1 {
+	regulator-always-on;
+	regulator-min-microvolt = <700000>;
+	regulator-max-microvolt = <1450000>;
+	regulator-name = "vdd-cpus-usb";
+};
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts b/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts
new file mode 100644
index 000000000000..d48b47ef2ed0
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2025 Arm Ltd.
+ */
+
+/dts-v1/;
+
+#include "sun50i-a133-baije-core.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+
+/{
+	model = "HelperBoard A133";
+	compatible = "baijie,helper-a133", "allwinner,sun50i-a100";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led {
+			function = LED_FUNCTION_INDICATOR;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&pio 7 13 GPIO_ACTIVE_LOW>;	/* PH13 */
+		};
+	};
+};
+
+&mmc0 {
+	vmmc-supply = <&reg_dcdc1>;
+	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;	/* PF6 */
+	bus-width = <4>;
+	status = "okay";
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pb_pins>;
+	status = "okay";
+};
+
+&rgmii0_pins {
+	drive-strength = <30>;
+};
+
+&emac0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&rgmii0_pins>;
+	phy-handle = <&eth_phy>;
+	phy-mode = "rgmii-id";
+	allwinner,rx-delay-ps = <200>;
+	allwinner,tx-delay-ps = <200>;
+	status = "okay";
+};
+
+&mdio0 {
+	reset-gpios = <&pio 7 11 GPIO_ACTIVE_LOW>;	/* PH11 */
+	reset-delay-us = <10000>;
+	reset-post-delay-us = <150000>;
+
+	eth_phy: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <1>;
+	};
+};
+
+&usbphy {
+	status = "okay";
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
-- 
2.53.0

