Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725361;
	b=wcUzbR+gi/YVLg7NRfR53eqnviEwJLIvQwLyov6Xr810mP1mAqalJuQNpbm5avfoZiea
	 ezTTVwljYcQIQ/qtb3oMtVogAJU8JEabhMLR0idAP0n4kV00N527kK+8KVPeL89Zs+y57
	 jM1wUi8YBwSxPsX6B+ExTPamubeHXdQ0tx4YPH2BZ1+aJHcM5yOluazMK5suVEyGEis0y
	 paHcmGv+3haqbzQJd5te/AhEqtJJw4qfVtwOoU3QQRrlv2f61w9GX0UlxvgVnPmTF+9yO
	 LyxB9U5H9tARpEA6oLwEiH84v3on8rQ2pqb9XNlZk8EbbKRf8gJOi0aOOjkvctKBgDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GYQ/8mRa+rNincTB4E2wqlqplAQOpEoznj3zJjc2l9I=;
	b=X6uCznVuWRAMH+borHOuJxjak4+P2P84NyUx4ozsAgHjMfly/5IHdMZzxsiXa7HJMBAi
	 2DosRuNgT+K+S3k4rUkce4XWEhplpOhBcJ0n/+/7BgSLkw3OtoZjDd2qTU+ApacZoMxfh
	 CHU7Q2W50nX7QfmD09xi8Pm/9zYulBKW51EvPq3oP24t+q838gaqIf+RNgZBDvlYcWEN8
	 1jWqK2aSkGa3Wy4Wj2xsymfMKZK00D54v9/gvjIfeaffIuC7sZcTQ23+58jkito/D/I2H
	 GxgPOkNFmxF+TaUF64gP1rFf6kgRs8sPa0WocZrP3vPu6k7VFDwmOtiLWfVYdeFs3qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sgmcrRry;
	arc=none smtp.remote-ip=209.85.160.46
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9E5606A321
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 20:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB9E5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sgmcrRry
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-48eee44b908so4173764fac.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 12:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795725360; x=1796330160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GYQ/8mRa+rNincTB4E2wqlqplAQOpEoznj3zJjc2l9I=;
        b=sgmcrRrySRVehH1HfNTdmhhjoScIxYcFqPLvjBRTrjeeeCsLAyQCs4Xe+qiB/RwhOp
         Me+JMvIlTt3UwFaoCI/Cuj28AoTwN6B5rwjE8xUJWDIT8S+iiFHOn8d9Acs1ghismxKr
         MIeiU3YMPLzpc65LoJ75c0RVahDguukmsVQxB5KPhXpZ13ocbMCW4e6DNF5hveRzsLuB
         nDpbwMx5ZHhLSkvkbv+1r2g4FFWtW4G5XPeNyJV7H5usPOKGLgLvibW4Y8F48xu2+zei
         5AYu2ssStDlI06wAqtX0hVr6+nOdUAWz2L5nI8TkCjLTvthJPliWNGYEU0KekdznYPFy
         juAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795725360; x=1796330160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GYQ/8mRa+rNincTB4E2wqlqplAQOpEoznj3zJjc2l9I=;
        b=DFdd/EQqHRit+ibkckqpXlUNFgofuSq8FFlece5SHFtPsnbo2OHWUtZnXa3/i/9N7l
         s3kAp0c7CYjtbx3MZPmQt5Ir1VvWGwUvzA0BixV8XUSGbpnPfCYSbGrwwmdc753rL/zq
         cguvUPDdyRccMYTDhQDp6z2tbWc/5YvAc+8zibMvkDcp4FXfLKXipYTNALh94RQsPMbA
         B+zjLQYCR8hgaV67/l61K2uZ85lYpTYCszGkZ0NLB+fYuqRHTPeg30QJ9tIpk3AQ9Zz/
         lpWHFFmWZoNtkp/OpTLApqucdRuBO+tnASEfWdXiLlD2Mg7xulwSxM0JGCWduC6yN4eQ
         L4gA==
X-Forwarded-Encrypted: i=1; AL+hErEprdF04rERBTEGsqnTQLaHX0bksINf+76JxMqdcPBiUw3csAjKITh5C0V5vz22EqiFgLHNQpZp7GTe@vger.kernel.org
X-Gm-Message-State: APuU4Z/u90yRVhBBZAtlsyCMU7J/UsrbzwdsG8qr7a1nxSI5NSV+X2ad
	VNpmg3ozfPXFdswfyVM90QLlPWlFFYTgHpGqSVjpcRFba5no67/Hxg6D
X-Gm-Gg: AZFdTZcpV7xryL0l/oeHZaIA6lLbe9Uu/5IzgY6blbtxlb8vjiHmy+SLst+eLDti4Rr
	xr2TvIdrfXJsmODwGtOJRjdfNiHuZnHEGyj07eOb8f0aqqQRttxzBrARwVFslA1wQLFE3p+/LyH
	FT4+ODSISCH+KLg89UF25BipmL+2uTItg3k6QtSuKdRMqF+oVOHvd9XtuKBVxe0EF11gGce/K9j
	L2YE8yJNLQ22JaakLd/q9j+yFCvAHu8SF0kF68nqfMlacmOMKSydnBz2wraYtGdS6yQXgUz7PNw
	R3Z4RCwmUwFdwhDpWcQ4mxAFLL0hiwotGs4SIk0OW+rJPKfx9XSoxUGGvqh2v175EfMrAKNVMhC
	UK6EDdMloDmae1W+x5I4IYaMsR/PXkp1/dz5QhXdape4SxqlX3IZWCLuz2V2VBjy0qnfxD+C2xx
	yRvguHETj58fp3DfcOg2JofWf379rAI2rElwP1T5b5jyQQbtdaonbkHxLTMcNWcI2OqmvOaEtHY
	p35C0EoEypVH4OFnxuNk2yl3MODqf3zuSQeH19Q/aTk7B2KLFdtIRMal8Rl05yfgJFHnvRzb/CJ
	VhxdzqT678ASpNAhe1JHVnm42RHN2ZAydhIsIlY1jUQ5NFB+bM5L+MFj+vrxkmstKb+jlHxHc3K
	uHCt+
X-Received: by 2002:a05:6808:13ce:b0:4e5:c2b4:33a4 with SMTP id 5614622812f47-57a0c6c0ed9mr23486300b6e.50.1795725359663;
        Thu, 26 Nov 2026 12:35:59 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5ebdbb4fsm18636738fac.5.2026.11.26.12.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:35:58 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Cristian Filipescu <filipescu.cristian@gmail.com>,
	Norman Herms <dockseed@proton.me>
Subject: [PATCH v6 4/5] arm64: dts: allwinner: add Radxa Cubie A7Z board
Date: Thu, 26 Nov 2026 15:35:56 -0500
Message-ID: <20261126-a733-cubie-a7s-dt-v6-4@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>

Add the device tree for the Radxa Cubie A7Z, an Allwinner A733
board with LPDDR4, a microSD slot and a 40-pin header.

Enable the UART0 console, AXP318W PMIC on R-I2C0, MMC0, RTC and
green user LED, and describe the board regulators and pin bank supplies.

The device tree is based on Enzo Adriano's Cubie A7S board description
and has been tested on A7Z v1.11 hardware.

Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
[enzo: use regulator-ps-output to satisfy the DT schema unit-suffix check]
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
Changes since the DT series v5:
- Bring in the standalone Cubie A7Z v2 patch. Rename the PS supply
  node to regulator-ps-output because the -ps suffix is matched as
  a picosecond unit by the DT schema. The regulator properties and
  connections are unchanged. The hardware report is in the cover.

Link: https://lore.kernel.org/r/20261125131435.33190-1-vinicius.eduardo.pedrosa@gmail.com

 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun60i-a733-cubie-a7z.dts   | 349 ++++++++++++++++++
 2 files changed, 350 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index 9d1e740ff19e..62fab1d727d0 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -70,3 +70,4 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun55i-h728-x96qpro+.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-avaota-a1.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-orangepi-4a.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-cubie-a7s.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-cubie-a7z.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts
new file mode 100644
index 000000000000..049e6b67c23a
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts
@@ -0,0 +1,349 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+// Copyright (C) 2026 Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
+/dts-v1/;
+
+#include "sun60i-a733.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "Radxa Cubie A7Z";
+	compatible = "radxa,cubie-a7z", "allwinner,sun60i-a733";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	osc32k: clock-osc32k {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			function = LED_FUNCTION_HEARTBEAT;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&r_pio 1 2 GPIO_ACTIVE_HIGH>; /* PM2 */
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	/*
+	 * Discrete SY8089 step-down regulator, present on v1.11; v1.10
+	 * feeds BLDOIN from SWOUT2 and CLDOIN from PS instead. The schematic
+	 * names this rail LDO2V5-INPUT, but it is set to 2.4 V.
+	 */
+	reg_ldo_input: regulator-ldo2v5-input {
+		compatible = "regulator-fixed";
+		regulator-name = "ldo2v5-input";
+		regulator-min-microvolt = <2400000>;
+		regulator-max-microvolt = <2400000>;
+		regulator-always-on;
+		vin-supply = <&reg_ps>;
+	};
+
+	/* PMIC PS output, fed from the DCIN pins. 5 V is nominal. */
+	reg_ps: regulator-ps-output {
+		compatible = "regulator-fixed";
+		regulator-name = "ps";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		vin-supply = <&reg_vcc5v0>;
+	};
+
+	/* Board wide 5 V supply from the USB-C connector. */
+	reg_vcc5v0: regulator-vcc5v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0-sys";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu1 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu2 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu3 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu4 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu5 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu6 {
+	cpu-supply = <&reg_dcdc3>;
+};
+
+&cpu7 {
+	cpu-supply = <&reg_dcdc3>;
+};
+
+&hosc {
+	clock-frequency = <26000000>;
+};
+
+&mmc0 {
+	bus-width = <4>;
+	cap-mmc-highspeed;
+	cap-sd-highspeed;
+	/* v1.11 has an external 10k pull-up on PF6, v1.10 does not. */
+	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>;
+	disable-wp;
+	vmmc-supply = <&reg_swout2>;
+	status = "okay";
+};
+
+&pio {
+	/* VCC-IO */
+	vcc-pb-supply = <&reg_swout2>;
+	vcc-pc-supply = <&reg_cldo5>;
+	vcc-pd-supply = <&reg_swout1>;
+	vcc-pe-supply = <&reg_bldo1>;
+	/* VCC-IO */
+	vcc-pf-supply = <&reg_swout2>;
+	vcc-pg-supply = <&reg_bldo5>;
+	/* VCC-IO */
+	vcc-ph-supply = <&reg_swout2>;
+	vcc-pj-supply = <&reg_swout1>;
+	vcc-pk-supply = <&reg_bldo1>;
+};
+
+&r_i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&r_i2c0_pl_pins>;
+	status = "okay";
+
+	axp318w: pmic@36 {
+		compatible = "x-powers,axp318w";
+		reg = <0x36>;
+		interrupt-parent = <&nmi_intc>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+		#interrupt-cells = <1>;
+
+		aldo156in-supply = <&reg_ps>;
+		aldo234in-supply = <&reg_aldo1>;
+		/* v1.10: BLDOIN from SWOUT2 and CLDOIN from PS */
+		bldoin-supply = <&reg_ldo_input>;
+		cldoin-supply = <&reg_ldo_input>;
+		dldoin-supply = <&reg_ps>;
+		eldoin-supply = <&reg_dcdc9>;
+		ips-supply = <&reg_ps>;
+		vin19-supply = <&reg_ps>;
+		vin23-supply = <&reg_ps>;
+		vin45-supply = <&reg_ps>;
+		vin678-supply = <&reg_ps>;
+
+		regulators {
+			reg_aldo1: aldo1 {
+				/* Port L powers the PMIC's own I2C bus. */
+				regulator-name = "vcc-pl-usb";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			reg_bldo1: bldo1 {
+				regulator-name = "vcc-pe-pk-mcsi";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			reg_bldo2: bldo2 {
+				regulator-name = "vcc-lvds0";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			reg_bldo4: bldo4 {
+				regulator-name = "vcc18-codec";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			reg_bldo5: bldo5 {
+				regulator-name = "vcc-pg";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			reg_cldo1: cldo1 {
+				/* LPDDR4 VDD1. */
+				regulator-name = "vcc-pm-lpddr";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			reg_cldo2: cldo2 {
+				regulator-name = "vcc18-hdmi";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			reg_cldo3: cldo3 {
+				/* DRAM PLL and PHY 1.8 V. */
+				regulator-name = "vcc-pll-dram";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			reg_cldo5: cldo5 {
+				regulator-name = "vcc-pc-combo";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			reg_dcdc1: dcdc1 {
+				/* Board 3.3 V loads and the SWOUT1/2 input. */
+				regulator-name = "vcc-3v3";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc2: dcdc2 {
+				/* System and DRAM core supply. */
+				regulator-name = "vdd-sys";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <800000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc3: dcdc3 {
+				/* Powers the running Cortex-A76 CPUs. */
+				regulator-name = "vdd-cpub";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1050000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc4: dcdc4 {
+				regulator-name = "vdd-gpu";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <960000>;
+			};
+
+			reg_dcdc5: dcdc5 {
+				/* Powers the running Cortex-A55 CPUs. */
+				regulator-name = "vdd-cpul";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1050000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc6: dcdc6 {
+				/* DRAM PHY supply. */
+				regulator-name = "vcc-draml";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <800000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc7: dcdc7 {
+				/* DRAM VDD2 and VDDQ. */
+				regulator-name = "vcc-dram";
+				regulator-min-microvolt = <1100000>;
+				regulator-max-microvolt = <1100000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc8: dcdc8 {
+				regulator-name = "vcc-ufs-io";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+			};
+
+			reg_dcdc9: dcdc9 {
+				/* ELDOIN input, needs at least 1.2 V; firmware leaves 1.24 V. */
+				regulator-name = "eldo-input";
+				regulator-min-microvolt = <1240000>;
+				regulator-max-microvolt = <1240000>;
+			};
+
+			reg_dldo1: dldo1 {
+				/* SoC eFuse supply, no consumer is modelled yet. */
+				regulator-name = "vcc-efuse";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			reg_dldo6: dldo6 {
+				regulator-name = "vcc-ufs";
+				regulator-min-microvolt = <2500000>;
+				regulator-max-microvolt = <2500000>;
+			};
+
+			reg_eldo6: eldo6 {
+				/* Standby CPU and USB supply. */
+				regulator-name = "vdd-cpus";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <800000>;
+				regulator-always-on;
+			};
+
+			reg_rtc_ldo: rtc-ldo {
+				regulator-name = "vcc-rtc";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			reg_swout1: swout1 {
+				regulator-name = "vcc-pd-pj";
+			};
+
+			reg_swout2: swout2 {
+				/* VCC-IO to the console and microSD. */
+				regulator-name = "vcc-io-ph-usb";
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+&r_pio {
+	/*
+	 * PL powers the PMIC bus itself, so firmware must keep ALDO1 enabled:
+	 * vcc-pl-supply = <&reg_aldo1>;
+	 */
+	vcc-pm-supply = <&reg_aldo1>;
+};
+
+&rtc {
+	clocks = <&r_ccu CLK_BUS_R_RTC>, <&hosc>, <&r_ccu CLK_R_AHB>,
+		 <&osc32k>;
+	clock-names = "bus", "hosc", "ahb", "ext-osc32k";
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pb_pins>;
+	status = "okay";
+};

