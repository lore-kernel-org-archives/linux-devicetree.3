Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4FB3DEAE7;
	Tue, 24 Mar 2026 09:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774345037; cv=none; b=H4AB4EsdasSG/l+NdIbX52yDU6fPOp/lvzkieRw9oCmekJWnDXmf1rpa1ramTXRrlH8Unn1rdb5CBjM0KaBLixFLZFXFF40nEaD2V7ogXxBTS8LOa6VVBhjO2RuXyG0Bze1zWOD5AJ5Mx3+Vqwns0xIFi63Zy9HMw0PLAG/mMW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774345037; c=relaxed/simple;
	bh=xX3c3Nj6csf5tiilnGCeg87TrGowXjTKCYOAHuO2exM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gJjsZBpjnL5zu+DMzFkIwI8Jqy8Vt0OL4VufK6YjnplpwgjVkuzFl2sWeE/piDL2DFw5j0QV4dj8dliAz8s+oroU/U1SWBDi4tBZLyb/nwmq+u2XnHJdtRkibyYIq9haY4RGQhKLyhzCrHMDn/y8S2Gt86/ikJrcflNxHDDHnNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=ImbO51Rm; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="ImbO51Rm"
Received: from francesco-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id ED995275C4;
	Tue, 24 Mar 2026 10:37:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1774345034;
	bh=c7eM2SJ9kVoOD5IFRfI28dWml91uI1gLjR8xj0U4LUg=; h=From:To:Subject;
	b=ImbO51RmvA6l59VzhnEFQn+wPulCC4OZckR84YlD7aslGfeOFWW7qDioKoFZH8/Qr
	 QyZyRr6zK7DPafshWuYazisjxs2dZ450u/R/5xYCeWUfNgacO01Fa1cv8mpYlbHWXy
	 fr7ft0/JyJcWFgtB90EXv01Zs2eQTovonEeyWhKmz4dIOXVUc5NMdzhZYLZlRCSwH2
	 6IP1SD3Z97/4wwa3HPCP4MozpXEqUy9EjRMiAt5FomAXXuFm19aQp3Ngo9WMg7D0ns
	 r9aef6U/6jMfolaJUwf2eag1qEuV7T7BardPmcmeTkf7tqjNmsHeCenybVVkL62oHf
	 asbXFA4ICd4DQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 7/7] arm64: dts: ti: k3-am62p-verdin: Add Zinnia
Date: Tue, 24 Mar 2026 10:37:02 +0100
Message-ID: <20260324093705.26730-8-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260324093705.26730-1-francesco@dolcini.it>
References: <20260324093705.26730-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add Zinnia Carrier Board mated with Verdin AM62P.

It features 1 x RS232, 1 x RS485, 1 x CAN, 3 x isolated digital I/O,
2 x 1GBit/s Ethernet, a mini PCIe slot with USB / SIM card connector
for a modem, USB and SD card interfaces.

Link: https://www.toradex.com/products/carrier-board/zinnia-carrier-board
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 .../boot/dts/ti/k3-am62p-verdin-zinnia.dtsi   | 469 ++++++++++++++++++
 .../ti/k3-am62p5-verdin-nonwifi-zinnia.dts    |  22 +
 .../dts/ti/k3-am62p5-verdin-wifi-zinnia.dts   |  22 +
 3 files changed, 513 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-verdin-zinnia.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-zinnia.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-zinnia.dts

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin-zinnia.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin-zinnia.dtsi
new file mode 100644
index 000000000000..84ae99dcdda3
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin-zinnia.dtsi
@@ -0,0 +1,469 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Common dtsi for Verdin AM62P SoM on Zinnia carrier board
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/ti-am62p
+ * https://www.toradex.com/products/carrier-board/zinnia-carrier-board
+ */
+
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/net/ti-dp83867.h>
+
+/ {
+	aliases {
+		eeprom1 = &carrier_eeprom;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_zinnia_leds>;
+
+		/* LED1 Red - SODIMM 48 - LED1_R */
+		led-0 {
+			color = <LED_COLOR_ID_RED>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <1>;
+			gpios = <&main_gpio0 33 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* LED1 Blue - SODIMM 46 - LED1_B */
+		led-1 {
+			color = <LED_COLOR_ID_BLUE>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <1>;
+			gpios = <&main_gpio0 34 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* LED3 Red - SODIMM 44 - LED3_R */
+		led-2 {
+			color = <LED_COLOR_ID_RED>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <3>;
+			gpios = <&main_gpio0 37 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* LED3 Green - SODIMM 54 - LED3_G */
+		led-3 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <3>;
+			gpios = <&main_gpio0 11 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* LED3 Blue - SODIMM 36 - LED3_B */
+		led-4 {
+			color = <LED_COLOR_ID_BLUE>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <3>;
+			gpios = <&main_gpio1 9 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* LED4 Red - SODIMM 34 - LED4_R */
+		led-5 {
+			color = <LED_COLOR_ID_RED>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <4>;
+			gpios = <&main_gpio1 10 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* LED4 Green - SODIMM 32 - LED4_G */
+		led-6 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <4>;
+			gpios = <&main_gpio1 12 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* LED4 Blue - SODIMM 30 - LED4_B */
+		led-7 {
+			color = <LED_COLOR_ID_BLUE>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <4>;
+			gpios = <&main_gpio1 11 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	zinnia-1v8-voltage {
+		compatible = "voltage-divider";
+		/* Verdin ADC_4 */
+		io-channels = <&som_adc 4>;
+		full-ohms = <39000>; /* 12K + 27K */
+		output-ohms = <27000>;
+	};
+
+	zinnia-3v3-voltage {
+		compatible = "voltage-divider";
+		/* Verdin ADC_3 */
+		io-channels = <&som_adc 5>;
+		full-ohms = <54000>; /* 27K + 27K */
+		output-ohms = <27000>;
+	};
+
+	zinnia-5v-voltage {
+		compatible = "voltage-divider";
+		/* Verdin ADC_2 */
+		io-channels = <&som_adc 6>;
+		full-ohms = <39000>; /* 27K + 12K */
+		output-ohms = <12000>;
+	};
+
+	/* Zinnia Power Supply Input Voltage */
+	zinnia-input-voltage {
+		compatible = "voltage-divider";
+		/* Verdin ADC_1 */
+		io-channels = <&som_adc 7>;
+		full-ohms = <204700>; /* 200K + 4.7K */
+		output-ohms = <4700>;
+	};
+};
+
+&main_pmx0 {
+	pinctrl_zinnia_leds: zinnia-leds-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x019c, PIN_INPUT, 7) /* (E24)  MCASP0_AXR1.GPIO1_9    */ /* SODIMM 36 */
+			AM62PX_IOPAD(0x01a0, PIN_INPUT, 7) /* (F23)  MCASP0_AXR0.GPIO1_10   */ /* SODIMM 34 */
+			AM62PX_IOPAD(0x01a4, PIN_INPUT, 7) /* (F24)  MCASP0_ACLKX.GPIO1_11  */ /* SODIMM 30 */
+			AM62PX_IOPAD(0x01a8, PIN_INPUT, 7) /* (F25)  MCASP0_AFSX.GPIO1_12   */ /* SODIMM 32 */
+			AM62PX_IOPAD(0x0088, PIN_INPUT, 7) /* (R24)  GPMC0_OEn_REn.GPIO0_33 */ /* SODIMM 48 */
+			AM62PX_IOPAD(0x0098, PIN_INPUT, 7) /* (AA24) GPMC0_WAIT0.GPIO0_37   */ /* SODIMM 44 */
+			AM62PX_IOPAD(0x008c, PIN_INPUT, 7) /* (T25)  GPMC0_WEn.GPIO0_34     */ /* SODIMM 46 */
+			AM62PX_IOPAD(0x002c, PIN_INPUT, 7) /* (M25)  OSPI0_CSn0.GPIO0_11    */ /* SODIMM 54 */
+		>;
+	};
+};
+
+&mcu_pmx0 {
+	pinctrl_zinnia_spi1_cs0_gpio: mcu-gpio0-11-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_MCU_IOPAD(0x002c, PIN_INPUT,  7) /* (C7) WKUP_UART0_CTSn.GPIO0_11 */ /* SODIMM 143 */
+		>;
+	};
+};
+
+/* Verdin ETHs */
+&cpsw3g {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii1>, <&pinctrl_rgmii2>;
+
+	status = "okay";
+};
+
+/* MDIO, shared by Verdin ETH_1 (On-module PHY) and Verdin ETH_2_RGMII */
+&cpsw3g_mdio {
+	status = "okay";
+
+	carrier_eth_phy: ethernet-phy@2 {
+		reg = <2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_eth2_rgmii_int>;
+		interrupt-parent = <&main_gpio0>;
+		interrupts = <42 IRQ_TYPE_EDGE_FALLING>;
+		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+	};
+};
+
+/* Verdin ETH_1 (On-module PHY) */
+&cpsw_port1 {
+	status = "okay";
+};
+
+/* Verdin ETH_2_RGMII */
+&cpsw_port2 {
+	phy-handle = <&carrier_eth_phy>;
+	phy-mode = "rgmii-id";
+
+	status = "okay";
+};
+
+&main_gpio0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pcie_1_reset>,
+		    <&pinctrl_gpio_5>,
+		    <&pinctrl_gpio_6>,
+		    <&pinctrl_gpio_7>,
+		    <&pinctrl_gpio_8>,
+		    <&pinctrl_qspi1_io0_gpio>;
+	gpio-line-names =
+		"", /* 0 */
+		"",
+		"",
+		"DI3_RB", /* SODIMM 56 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 10 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 20 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 30 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 40 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"DI2_RB", /* SODIMM 216 */
+		"DI2_EN", /* SODIMM 218 */ /* 50 */
+		"DO3_EN", /* SODIMM 220 */
+		"DI3_EN", /* SODIMM 222 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 60 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 70 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 80 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 90 */
+		"";
+};
+
+&main_gpio1 {
+	gpio-line-names =
+		"", /* 0 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 10 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 20 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 30 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 40 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 50 */
+		"";
+};
+
+/* Verdin I2C_1 */
+&main_i2c0 {
+	status = "okay";
+
+	temperature-sensor@4f {
+		compatible = "ti,tmp1075";
+		reg = <0x4f>;
+	};
+
+	carrier_eeprom: eeprom@57 {
+		compatible = "st,24c02", "atmel,24c02";
+		reg = <0x57>;
+		pagesize = <16>;
+	};
+};
+
+/* Verdin CAN_1 */
+&main_mcan0 {
+	status = "okay";
+};
+
+/* Verdin SPI_1 */
+&main_spi1 {
+	pinctrl-0 = <&pinctrl_main_spi1>,
+		    <&pinctrl_zinnia_spi1_cs0_gpio>,
+		    <&pinctrl_spi1_cs_gpio>;
+	cs-gpios = <&mcu_gpio0 11 GPIO_ACTIVE_LOW>,
+		   <&main_gpio0 7 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+
+	tpm@1 {
+		compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
+		reg = <1>;
+		spi-max-frequency = <18500000>;
+	};
+};
+
+/* Verdin UART_3, used as the Linux console */
+&main_uart0 {
+	status = "okay";
+};
+
+/* Verdin UART_1 */
+&main_uart1 {
+	status = "okay";
+};
+
+&mcu_gpio0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio_1>,
+		    <&pinctrl_gpio_2>,
+		    <&pinctrl_gpio_4>,
+		    <&pinctrl_gpio_3>;
+	gpio-line-names =
+		"",
+		"DO1_EN", /* SODIMM 206 */
+		"DI1_EN", /* SODIMM 208 */
+		"DI1_RB", /* SODIMM 210 */
+		"DO2_EN", /* SODIMM 212 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 10 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 20 */
+		"",
+		"",
+		"";
+};
+
+/* Verdin SD_1 */
+&sdhci1 {
+	status = "okay";
+};
+
+/* Verdin USB_1 */
+&usb0 {
+	status = "okay";
+};
+
+/* Verdin USB_2 */
+&usb1 {
+	status = "okay";
+};
+
+/* Verdin USB_1 */
+&usbss0 {
+	status = "okay";
+};
+
+/* Verdin USB_2 */
+&usbss1 {
+	status = "okay";
+};
+
+/* Verdin PCIE_1_RESET# */
+&verdin_pcie_1_reset_hog {
+	status = "okay";
+};
+
+/* Verdin UART_2 */
+&wkup_uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wkup_uart0>,
+		    <&pinctrl_wkup_uart0_rts>;
+	rs485-rts-active-low;
+	rs485-rx-during-tx;
+	linux,rs485-enabled-at-boot-time;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-zinnia.dts b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-zinnia.dts
new file mode 100644
index 000000000000..8abf4fe60e99
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-zinnia.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/ti-am62p
+ * https://www.toradex.com/products/carrier-board/zinnia-carrier-board
+ */
+
+/dts-v1/;
+
+#include "k3-am62p5.dtsi"
+#include "k3-am62p-verdin.dtsi"
+#include "k3-am62p-verdin-nonwifi.dtsi"
+#include "k3-am62p-verdin-zinnia.dtsi"
+
+/ {
+	model = "Toradex Verdin AM62P on Zinnia Board";
+	compatible = "toradex,verdin-am62p-nonwifi-zinnia",
+		     "toradex,verdin-am62p-nonwifi",
+		     "toradex,verdin-am62p",
+		     "ti,am62p5";
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-zinnia.dts b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-zinnia.dts
new file mode 100644
index 000000000000..e1df7cffdf63
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-zinnia.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/ti-am62p
+ * https://www.toradex.com/products/carrier-board/zinnia-carrier-board
+ */
+
+/dts-v1/;
+
+#include "k3-am62p5.dtsi"
+#include "k3-am62p-verdin.dtsi"
+#include "k3-am62p-verdin-wifi.dtsi"
+#include "k3-am62p-verdin-zinnia.dtsi"
+
+/ {
+	model = "Toradex Verdin AM62P WB on Zinnia Board";
+	compatible = "toradex,verdin-am62p-wifi-zinnia",
+		     "toradex,verdin-am62p-wifi",
+		     "toradex,verdin-am62p",
+		     "ti,am62p5";
+};
-- 
2.47.3

