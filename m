Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725370;
	b=LERdwzKsrmkfjX125uy/+EpLwwdfEpfZVlu7zVuqAwRqvgiOnNsFbVHmHbXHUu8nJ7Z7
	 e+34Dk4HEQWbppGqbf7onLaYXz3j+QabOealyojx46ezy7W9R4RKSwWlrumRxG0vi8b9n
	 eWohNeZuJMWOeEk4h4DQ3T5/G4xfqYxo9/7lxuiAxdQ+7amJw/rNJgRkEW0k2Fz+cFR3k
	 0dh62NKl95t3MBpxiap0BR9ZYFr7F9Y3ZbUtR84ruqGQtFao/lOgLbij+BbIQ3x3Q0TGI
	 Tpc0PDYQwySP02nHaFEaUbYL0GdqtYF5gwEPz/eHJMx+CxrCfTzZbt0Q3pUqhuPtylw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725370;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5HFgmolTYhuB893XN9CD3I2MuvNR8OrZNKJS6ArKOlc=;
	b=uRQiTIt8BuKrJNAJIKY7cCNPQv1kgCwy01y4C0F6qpWzcu+nThGuH7kRLBfvbCN+PYhC
	 BrZ5c708sRArhcFQEDCPtdBu/B/hisvzuz/WRxD6LSK/5SLmu51k8zR0UTdn7UlU4HNxo
	 O2RslOqVClbMpjrsJ50sbfDJPwD15KZPAqiBmuji2giumN4ceNE6SDb0/O7ofenTLWyAk
	 X+BdVLRECRkewqpGqC1fvmIN2sha3vNkZb5/XfyfBeh3nvYub5h0OP7SPFxSGt1VItLW+
	 pwhnMmuZInj5ww9CxbNbaOXN4aWJ4OIrJopQtOq97skeMnIY7KHjm8zuwL/1nttKGeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="rYuT70/j";
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2CB606A327
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 20:36:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D2CB606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rYuT70/j
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-71b945cc4a6so96973eaf.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 12:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795725368; x=1796330168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5HFgmolTYhuB893XN9CD3I2MuvNR8OrZNKJS6ArKOlc=;
        b=rYuT70/jS2aWDcDDLYI4bWUcXRjc85G7/w7yDxigUrBkOOSPDngvpHp/zxGwaZG0/I
         i03INPsGKD4Lvc6Q3lWDxH+vMQmt/AHjpvXZ3lg/QZONRLLaHm/ewRsX4MdXloY8FWQI
         X28uPgpW12ZURtJHg8SVrjpwmzT7p67L9orL/C+ILxnGGAqCt4dIO7e6yC5WJsEAdZvT
         oGp/1HYRcUtLlZ242ViG5DrI4iFjy7ZgveNXP7iXvuWmcDcBXdOuV0oFgFaogJVrxbGm
         kyHN+521v++NxIAStbq9jw1Gu0AlK39dAWA2fVYbIa/HSFAN9uWqZaTDFvIncXAh2/As
         g55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795725368; x=1796330168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5HFgmolTYhuB893XN9CD3I2MuvNR8OrZNKJS6ArKOlc=;
        b=fl2iEFykf2tZQmHGrgPW+Rof/h+h7ZGuJ5ivSIGlstVBVUONKx0CA3++swR0l+vCkc
         Qqy9HYmS5MXgRT4KOTMHaSbyM3pf91pyHRO3uqGwrNQbGiue6SJk+7K7rNzhv1CvLlvS
         vtjWbDzhXpTCD4vfrlvRz99GkhYRbqz9j0txqE0GFkEL1uj/WsmxvGbNRnZzIRV4yGlM
         h/XPT1Y3obD7xslDhKClOKdFqS6B/pYo4GFGww3M0zPWk3ALXp4N8P98lwb1DLgfE60O
         k7Gjz7nRkqnp2vqHeuCps9SBL8JBcQW/wIjEzWmIdaxOfI63CbFkBNTyOZXjwIjUdJVi
         QB5A==
X-Forwarded-Encrypted: i=1; AL+hErFAZnEllKNySB27ZjRBtNn4hCfmaUkHANc7buRo7qbIjwBNuiE8n076HOVsTk3rHMcFSPeYZ9hlsegR@vger.kernel.org
X-Gm-Message-State: APuU4Z++35ZWw4cFYlQCBCDpZDtnfjyKMXO6M7DCQa3P9ISG22bfJ6rZ
	dpGa2bquFOKeFO/bcSWWrCYkVS9HE8oKUKMNmRucryM6OzeC7pPZtYfw
X-Gm-Gg: AZFdTZcXBj+E4davnxvuixLThCtW16JJSayFw4MWjD7eWPYchDR6tHIt0sErNEb1OvR
	996O7vDdsBhFINzTvWTL96UkYw4o/wZBIYaPXuriHOmGXOUzKi2GF0D+L9HZKf6EaH6G7Kfk+N2
	76bb33z1pa1zboUenpRtsrP5GWcW/d9+lCWdy3ZXgi69E8uXJ1GuxApBx47f8MNmbSvmRIdeisB
	G3It40UFs6qFZs5AZfLauHNJi91jUjhMLHZPnvf3iJjeE6M8KsXvChA1HTMPx7BZetAKkAlAS7Y
	3QXs7fGo/RLeIsqwarcHsp4tvgo6DTD0LnmmnR2GtfaLUIirLbr2NBGrFVtjfVamMDNdXIqlsiV
	aPYtzab9GhVunFibFOU09yb1uRVpx//cvf/5WvWNsVRT1b26Wy9+gCgXuMnlYGucObgv0K1iaG0
	KFDe9sn9RcPe2+V6b1oSPPaMKLKfdvpAO2MLyxYrkN+tOdMYZKxCMWsolqCGzd40NUkJP7VBV2n
	3dTviCLg+IdujHxhok8yDPNrr4RaU44EIf006N8ZcmfYMDKVkSeyCxdhcj23OTWC6KBl8kLXu8E
	GE+tCNWI+IIT6irM+GjuxjC0sQ0sfEqI9keyR44X7HteTETCcs/mT3WjAqjmbnftLYyZoxSS8qU
	lauLK
X-Received: by 2002:a05:6820:f025:b0:71a:f211:9547 with SMTP id 006d021491bc7-71b39260cf4mr18968038eaf.4.1795725368381;
        Thu, 26 Nov 2026 12:36:08 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b38015c51sm14573917eaf.3.2026.11.26.12.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:36:07 -0800 (PST)
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
Subject: [PATCH v6 5/5] arm64: dts: allwinner: add Radxa Cubie A7A board
Date: Thu, 26 Nov 2026 15:36:05 -0500
Message-ID: <20261126-a733-cubie-a7s-dt-v6-5@gmail.com>
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

From: Andre Przywara <andre.przywara@arm.com>

The Radxa Cubie A7A is a single board computer using the Allwinner A733
SoC. It features:
  - Allwinner A733 SoC (6*Arm Cortex-A55 + 2*Arm Cortex-A76)
  - Imagination BXM-4-64 MC1 GPU and 3 TOPS NPU
  - 2-16 GiB LPDDR5 DRAM
  - AXP318W PMIC
  - eMMC and UFS socket
  - single lane PCIe 3.0 via FPC connector
  - microSD card slot
  - bootable SPI NOR flash
  - HDMI 2.0 and MIPI-DSI connector
  - MIPI-CSI camera connector
  - GBit Ethernet socket, with optional POE support
  - unknown Bluetooth and WiFi
  - USB-C 2.0 OTG port (also primary power supply)
  - USB-A 3.1 host port
  - 3* USB-A 2.0 host ports (via hub)
  - 40 pin GPIO connector

Add initial support for the peripherals we have DT bindings for so far,
including UART, PMIC, SD card, some EEPROM and an external RTC chip.
The PMIC rails assignment has been determined by the schematic.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
Changes since the DT series v5:
- Add Andre's posted Cubie A7A board patch. It now gets its R-I2C1
  pin group from the common DTSI. The board DTS is identical to the
  posted version. The Makefile context includes the A7Z entry.

Link: https://lore.kernel.org/r/20261126172253.1097838-3-andre.przywara@arm.com

 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun60i-a733-cubie-a7a.dts   | 385 ++++++++++++++++++
 2 files changed, 386 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7a.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index 62fab1d727d0..cdeb966031ee 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -69,5 +69,6 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun55i-a527-cubie-a5e.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-h728-x96qpro+.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-avaota-a1.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-orangepi-4a.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-cubie-a7a.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-cubie-a7s.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-cubie-a7z.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7a.dts b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7a.dts
new file mode 100644
index 000000000000..9017cadf6c6a
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7a.dts
@@ -0,0 +1,385 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/*
+ * Copyright (c) 2026 Arm Ltd.
+ */
+
+/dts-v1/;
+
+#include "sun60i-a733.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "Radxa Cubie A7A";
+	compatible = "radxa,cubie-a7a", "allwinner,sun60i-a733";
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
+		power-led {
+			function = LED_FUNCTION_POWER;
+			color = <LED_COLOR_ID_GREEN>;
+			/*
+			 * The LED is connected between VCC and GND, so it
+			 * turns on as soon as the board gets power. But a
+			 * transistor allows to pull down the anode to GND,
+			 * so the LED can be turned off.
+			 */
+			gpios = <&pio 9 26 GPIO_ACTIVE_LOW>; /* PJ26 */
+			default-state = "on";
+		};
+
+		status-led {
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_BLUE>;
+			gpios = <&pio 9 27 GPIO_ACTIVE_HIGH>; /* PJ27 */
+		};
+	};
+
+	osc32k: osc32k-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
+
+	/* discrete SY8089A DC/DC step-down regulator */
+	reg_vcc2v4: regulator-2v4 {
+		compatible = "regulator-fixed";
+		regulator-name = "ldo-input";
+		regulator-min-microvolt = <2400000>;
+		regulator-max-microvolt = <2400000>;
+		regulator-always-on;
+		vin-supply = <&reg_vcc5v>;
+	};
+
+	/* board wide 5V supply from the USB-C connector */
+	reg_vcc5v: regulator-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-5v";
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
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pg_pins>;
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "belling,bl24c16f", "atmel,24c16";
+		reg = <0x50>;
+		pagesize = <16>;
+		vcc-supply = <&reg_aldo1>;
+		wp-gpios = <&pio 2 7 GPIO_ACTIVE_LOW>; /* PC7 */
+	};
+};
+
+&mmc0 {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cap-mmc-highspeed;
+	cap-sdio-irq;
+	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;   /* PF6 */
+	disable-wp;
+	vmmc-supply = <&reg_swout2>;
+	status = "okay";
+};
+
+&hosc {
+	clock-frequency = <26000000>;
+};
+
+&pio {
+	vcc-pb-supply = <&reg_swout2>;	// via VCC-IO
+	vcc-pc-supply = <&reg_cldo5>;
+	vcc-pd-supply = <&reg_swout1>;
+	vcc-pe-supply = <&reg_bldo1>;
+	vcc-pf-supply = <&reg_swout2>;	// via VCC-IO
+	vcc-pg-supply = <&reg_aldo1>;
+	vcc-ph-supply = <&reg_swout2>;	// via VCC-IO
+	vcc-pj-supply = <&reg_swout1>;
+	vcc-pk-supply = <&reg_aldo1>;
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
+		aldo156in-supply = <&reg_vcc5v>;
+		aldo234in-supply = <&reg_aldo1>;
+		bldoin-supply = <&reg_vcc2v4>;
+		cldoin-supply = <&reg_vcc2v4>;
+		dldoin-supply = <&reg_vcc5v>;
+		eldoin-supply = <&reg_dcdc9>;
+		ips-supply = <&reg_vcc5v>;
+		vin19-supply = <&reg_vcc5v>;
+		vin23-supply = <&reg_vcc5v>;
+		vin45-supply = <&reg_vcc5v>;
+		vin678-supply = <&reg_vcc5v>;
+
+		regulators {
+			reg_dcdc1: dcdc1 {
+				/* VCC3V3 on GPIO connector and power LED */
+				regulator-name = "vcc-wifi-hub-pci-gpio-led";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc2: dcdc2 {
+				regulator-name = "vdd-sys-dram-ve-combo";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <800000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc3: dcdc3 {
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
+				regulator-name = "vdd-cpul";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1050000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc6: dcdc6 {
+				/* Voltage set by DRAM init routine */
+				regulator-name = "vcc-draml-vddq";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <600000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc7: dcdc7 {
+				/* Voltage set by DRAM init routine */
+				regulator-name = "vcc-dram";
+				regulator-min-microvolt = <1050000>;
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
+				regulator-name = "eldo-input";
+				/*
+				 * The schematic says 1.25V, but the
+				 * granularity of DCDC9 is 20mV in this range.
+				 */
+				regulator-min-microvolt = <1240000>;
+				regulator-max-microvolt = <1260000>;
+			};
+
+			reg_swout1: swout1 {
+				regulator-name = "vcc-pd-pj-lcd-ephy";
+			};
+
+			reg_swout2: swout2 {
+				/* SoC VCC-IO and USB 3.3V supply #2 */
+				regulator-name = "vcc-io-sd-emmc-ph-usb";
+				regulator-always-on;
+			};
+
+			reg_aldo1: aldo1 {
+				/* PortL (this PMIC) and USB 3.3V supply #1 */
+				regulator-name = "vcc-pl-usb";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			reg_aldo5: aldo5 {
+				regulator-name = "vcc-ac101-codec";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+			};
+
+			reg_bldo1: bldo1 {
+				regulator-name = "vcc-pe-pk-mcsi";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			reg_bldo2: bldo2 {
+				regulator-name = "vcc-lvds-lcd";
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
+			reg_cldo1: cldo1 {
+				regulator-name = "vcc18-lpddr";
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
+				regulator-name = "vcc-pll-dram-avcc";
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
+			reg_dldo1: dldo1 {
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
+			reg_eldo1: eldo1 {
+				regulator-name = "vcc09-lpddr5";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <900000>;
+				regulator-always-on;
+			};
+
+			reg_eldo6: eldo6 {
+				regulator-name = "vdd-cpus-usb";
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
+		};
+	};
+};
+
+&r_i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&r_i2c1_pl_pins>;
+	status = "okay";
+
+	rtc@51 {
+		compatible = "haoyu,hym8563";
+		reg = <0x51>;
+		#clock-cells = <0>;
+		interrupt-parent = <&r_pio>;
+		interrupts = <0 3 IRQ_TYPE_EDGE_FALLING>;	/* PL3 */
+	};
+};
+
+&r_i2c1_pl_pins {
+	/*
+	 * The schematic shows external pull-up resistors, but still the
+	 * internal pull-ups are required somehow.
+	 */
+	bias-pull-up;
+};
+
+&r_pio {
+	/*
+	 * Specifying the supply would create a circular dependency.
+	 *      vcc-pl-supply = <&reg_aldo1>;
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

