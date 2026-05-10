Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5219733AD91
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 20:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778444216; cv=none; b=H4XZwK4VNg4w45WZ34vHziJaB7ogw9hBAc34lQUtU7Huwss47M4KPwiuoJFDsHKEJdt8YTvAV3o56uysy15F99ywySwgv6czJcA2vqyPe1TL+DWkVznbB3GXa5/VEdrKvwOxxyoS3rD2fPSQdPcHVLlCSbI17wCmzBhRWKHuQ/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778444216; c=relaxed/simple;
	bh=3bkx3VnL+x6pBTnYLBenu/+nPX3LrNPMZCfRJtbMhbc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UtUFKZOGnpUsxvC5Cmp3H4mWieuSv90P5Np+z7tLxSX3SfbyRk4LZtQz/uJNwmdf2nBf48lp2EI4KXvHrCSPsYJ/PRljv2d6C1uDfYyvGyjK+jo2kxz1EIay38EYOm2cu2zHKI3HxipRry8M4TJ4wZqhrDExs7d2fDTfkHk8QMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HRheKjm3; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HRheKjm3"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso34295585e9.2
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 13:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778444213; x=1779049013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+WghYeb5qh2dJ7FcM//anDnfYtlQ9gYlpr62YjGme3g=;
        b=HRheKjm3eLUuB1UFnyauuDfLyA/y/iagGLxlTBreqUbdQ/MBSYxVo+bZpqq6nDZMbP
         cKlgv9sqWFkQls4I+yqGYJYezqoKX+2ozZTMrBdFdeTOIaDe9QKSyIxApIOTfBTQvCZp
         PIosqGMBomm8nP2Ds3KVfZRkcV4wdZuCpVzVfY5Gl44wKQoLIXCZdu79c+8L/5VXJ4eb
         h0UFr93E/C+L6GhynpLSFEE/OpA5mpC+G/nEMalDjIOr/J4pSOWMOEZrRrQA7Y6xRWaq
         1sYcBhKbRgLeguM3J6+uxgRgrB1KyaGkjMlEVtFBFyQNLXJ1y95o+G+cGuhGcwup0ZON
         hl4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778444213; x=1779049013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+WghYeb5qh2dJ7FcM//anDnfYtlQ9gYlpr62YjGme3g=;
        b=Rf9v0eM6fy2H0pUvwRHRLH4qnWXOhy4FVK7+3SnjunoxWvoM1lcAd5vdffmWqGD/6g
         uVUexUmammXcQeNuvxKJQ9TaNtaIzWMhLUGKZaUWYMl/dd2PbPUc+2eKAhwGys8cY+sn
         06vkAaBNPWy1xzxSircs28p3GgG05+RpnM7XS9IkwBAs0IiJl62SKNkaiGqnITXEgWhQ
         4slyrorC5bYxIAoQQW9Iga26mqshEEtlbevT1z7/tiq9AIsEJbe4WeNxC5SJBx4sDqTy
         L4TZ3W3aqLdbILQYnx3p5phIa7zFdrHzWAwhbkNoSGjVxpk03FsgMUljAq1CWR/z2p2W
         5BSA==
X-Forwarded-Encrypted: i=1; AFNElJ9A3T0/7xQnmMz/BXD//rLKeojRFzAqCQNM6ZLsMdg2SXISC1PcXmnmYtN7aqq5u46cOsXBPC10BgkP@vger.kernel.org
X-Gm-Message-State: AOJu0YwK5F07MEkJErzlN6s43zjUWbkdNx6LWdh1xyc8yvA9vlfRnNfI
	XnN+CBbHIZDcYdmtXyloZoF9cSw+YPDEPNMO5EY8kdqofbNCmxb58l1Y
X-Gm-Gg: Acq92OEnm2zv1OwJAl4VauyQ+M5S5mYMhyYjyI+O686C8cdaKRPhy+dEVE4AwFXiOut
	cI28o2v77EFRXR3FG89thMGLk09gMc4M7PawMqW3E7H7iU7BXn3ApebJva5jhfKa+rHyrbeGlXI
	fFGyz2ykTNbEuT1igOTJObmjxZAQgHzABCVwklhDCGzyM+yW9/HQMPh5apGpWULfpAbGWP1wN4E
	ni4ULgY8uWZhyrU02F88kIsJs6H4agYxHefGaRpJVNo94MEe2QKdVk1mD5Y2fMWgaLxdTa3eUw9
	L9O2g3mBnwKDXpqjtKWCfvJX3RoiaJIx+tipn9fdl8xjpVC+xq7O2iVbJIvzu6HLvBogyY113RO
	2x2DJrbeUlIUprD+bydjnDRqDxxrbL07G5RzUUE2Gqb+PA/mVV+X0mLJmC3slv3gLnJADFao6PG
	rt6xH1pics3Q6Dwv4a+kMh6ez8GxoAdWEmvB3BpcwyAlxXf4Srol/B4X3cWJfILns=
X-Received: by 2002:a05:600c:1d11:b0:48a:7f90:2231 with SMTP id 5b1f17b1804b1-48e51f364f3mr357997885e9.19.1778444212752;
        Sun, 10 May 2026 13:16:52 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e7040a8f1sm127667145e9.11.2026.05.10.13.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 13:16:51 -0700 (PDT)
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
Subject: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for Baijie Helper A133 board
Date: Sun, 10 May 2026 22:16:40 +0200
Message-ID: <20260510201644.4143710-4-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
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

Changelog:
v2:
- introduced baijie,helper-a133-core compatible for the Core (SoM) board

 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun50i-a133-baije-core.dtsi | 162 ++++++++++++++++++
 .../allwinner/sun50i-a133-baijie-helper.dts   |  94 ++++++++++
 3 files changed, 257 insertions(+)
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
index 000000000000..65b094f30bf5
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi
@@ -0,0 +1,162 @@
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
+	compatible = "baijie,helper-a133-core",
+		     "allwinner,sun50i-a100";
+
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
index 000000000000..ccbca5d0a40c
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts
@@ -0,0 +1,94 @@
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
+	compatible = "baijie,helper-a133",
+		     "baijie,helper-a133-core",
+		     "allwinner,sun50i-a100";
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
2.54.0

