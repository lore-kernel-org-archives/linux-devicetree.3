Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC6B3DD51F
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 11:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779276652; cv=none; b=itBW8zxKdEWnihyDWTCGAckncPKCpGu/cOTYWT53vXCrW0K2W3Vwv2JG3pMQVvKVllhg6v+7F6FTakfly5JruhmGIOI9Lg4Bg4HtzICyK2O6W8KFCLlNfc9NTb+SxT9wbTRqsrSf3evDbC47BIUDD1FWLwPFBOVFLO/2ZiJIadY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779276652; c=relaxed/simple;
	bh=2e8b0M4uNeWedv6NB/3GyL8xLLu1YJtlv19qlyMXonw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cWZpA03A734f6GzBhZEylPm3g5Rwt2P1nxNA+4tZX+rwKdjmYzzKU+MVIRHMyupKnMdFMIkoKZDIzAwrEBTEFW64Kko9DqGnXqlNVFJSrfuVd3n+KVhn5KH6nDmAi12pFPxvv2T/v7vaIVTvi+vVKisVXbm9ZbQpSa57tV8fyGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GEjBGMtE; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GEjBGMtE"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so69384045e9.2
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 04:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779276649; x=1779881449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=75AeIr75fobPYjOr1b7dv2ioRyiyydGt2gFhT2IfAuY=;
        b=GEjBGMtEwQG0BNZ6dDvyokCBkkIJwmQoJ2QYFVQBK2X09TtpCrrFnjQKRSFtnDZtpk
         S9D+TviiuxNylNP+4tOc3k0ioS+J0+c/dMbdnoEfaJDNDIjsVW4gEtD+1DW8+ybePphc
         7x2kr6vfjeZ8dVFyznLZ8PUBXXvqxxAbLtpN51n1e5jFPwlibYTiiZ1h+ZiC0wSpZyBa
         SQI1+eZmteWFcKt0PYHkKBIadB18goKQTXBuCwePPu5SNx2wj2cLXzVy6Yhb8N6XncS5
         40vMqxmMqUyRRGHxe3rjdaNKs9O5ehHe0kAr/r1lzeRGGECJ3ST2fk48TGYD9kppJvfr
         kHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779276649; x=1779881449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=75AeIr75fobPYjOr1b7dv2ioRyiyydGt2gFhT2IfAuY=;
        b=Ho6P0ykZiRMP41vo6PrTEgFRhqSi+YmoO09eOZfu62svVyeCK0pDrMTHe32zgkpNQr
         rYQjotFejmKduswlv14tkSQCKUbLJnzgpCOhWLKm3DgttTPJZ0bK8XlzOOf04mq7KKEZ
         dFXzLeUIzgKA9/br08RploY1NdWqvpNHuEhCvaxwDbSltEMtHwe3gsLPyP/DHf5qXqeX
         VcuoYK83tRr4aqjO3sYPG1yUNpAw1mTklOby2IJHxVoxcIEM/+f0kporNhREB6MuZQQv
         wugmVjYnIERtElXg1eF08K0wy2/H2nUZMlrtPB7MDosIqBnXIR+94CJEQAIXXD3X/jZ8
         JYZw==
X-Gm-Message-State: AOJu0YxUtUcqSPL0ilZpaqyoQUip/Y7LBDh0TjC6XY1KFGiQlt7ucWMr
	W9aSMSuzNjOLkHVymqPhfthVkRr63pmx2WUgZhQ5gFi0xTNMnFvzrfML
X-Gm-Gg: Acq92OEdqJgTf7c+KEF/K3NC6TFiIo/NWZ4J+qp0EkxIe1GbxiZpLXaUYsyuz4ycb7I
	MnrPoI+oXJ74Orwfbnljxx/PCeSPNR/Z4Qiw5GgR9ziOlaW04howRsgWqyoW07qplHD87Ny9Q4K
	tybIqGFnKLW2pWkQj4LpvFVsjNMi7ibB3seCCwEt7UFsxWcDJjVo8rv5AW62+zhBzaMBiiCgcLd
	/3rmM8GUM9M9jXttaocJ9VF3SqV6L/TbrfCdEicGjHDFGb8oFGONuRYr+HZl038hR6WlNl/Ap+1
	zNsRMTDDPzkrw3bv1ZobpV1p16BQtzZrAtPpx7eHxVm9n3+UV4YCbfhEaLdGq6CRNQq5ds/s/yW
	6hx7hWBvzUG/9BZH7lI49W7nfkfwAF2MzH4D03eyY3u8tX3eyXcP7TDKJJvHcoQc/C71D8KkAil
	0gv8YT9MxTBQFzStY9JO6Lslu7/cqZkKr/vspfv5f+n7u3p5Ni6Z8ExjOsJ5tseSqYc0QwyZZyp
	NnLEavS6m0F+BY0mMsE99X2iu0dWMo8G5XEvra8Vm/eSzdVNowf1vGzpplkMmh8wF4THfnKprdI
	v7xSgtM6dqnt
X-Received: by 2002:a05:600c:4fc9:b0:489:1c1f:35df with SMTP id 5b1f17b1804b1-48fe60e58ecmr337661595e9.10.1779276648507;
        Wed, 20 May 2026 04:30:48 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5ab3977sm430363315e9.9.2026.05.20.04.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 04:30:48 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Wed, 20 May 2026 13:30:34 +0200
Subject: [PATCH v2 3/3] arm64: dts: freescale: imx95-aquila: Add Clover
 carrier board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-add-aquila-imx95-v2-3-06424a51e33a@toradex.com>
References: <20260520-add-aquila-imx95-v2-0-06424a51e33a@toradex.com>
In-Reply-To: <20260520-add-aquila-imx95-v2-0-06424a51e33a@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Francesco Dolcini <francesco@dolcini.it>, 
 Franz Schnyder <franz.schnyder@toradex.com>, 
 Antoine Gouby <antoine.gouby@toradex.com>
X-Mailer: b4 0.15.2

From: Antoine Gouby <antoine.gouby@toradex.com>

Add support for the Aquila i.MX95 SoM mated with the Clover carrier
board. Clover is a low-cost carrier board for the Aquila family
featuring a small form factor (Nano-ITX 120mm x 120mm) and built for
volume production.

Link: https://www.toradex.com/computer-on-modules/aquila-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/clover
Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
v2: no changes
v1: https://lore.kernel.org/all/20260506-add-aquila-imx95-v1-3-69c8ee1c5413@toradex.com/
---
 arch/arm64/boot/dts/freescale/Makefile             |   1 +
 .../boot/dts/freescale/imx95-aquila-clover.dts     | 294 +++++++++++++++++++++
 2 files changed, 295 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index c8697b6ae01c5..3ce082c121036 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -523,6 +523,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-clover.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts b/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
new file mode 100644
index 0000000000000..021d437763412
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
@@ -0,0 +1,294 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * https://www.toradex.com/computer-on-modules/aquila-arm-family/nxp-imx95
+ * https://www.toradex.com/products/carrier-board/clover
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/pwm/pwm.h>
+#include <dt-bindings/usb/pd.h>
+#include "imx95-aquila.dtsi"
+
+/ {
+	model = "Aquila iMX95 on Aquila Clover Board";
+	compatible = "toradex,aquila-imx95-clover",
+		     "toradex,aquila-imx95",
+		     "fsl,imx95";
+
+	aliases {
+		eeprom1 = &carrier_eeprom;
+	};
+
+	dp_1_connector: dp0-connector {
+		compatible = "dp-connector";
+		dp-pwr-supply = <&reg_dp_3p3v>;
+		type = "full-size";
+
+		port {
+			dp_1_connector_in: endpoint {
+				remote-endpoint = <&dsi2dp_out>;
+			};
+		};
+	};
+
+	reg_dp_3p3v: regulator-dp-3p3v {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_21_dp>;
+		/* Aquila GPIO_21_DP */
+		gpios = <&gpio3 21 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "DP_3V3";
+		startup-delay-us = <10000>;
+	};
+};
+
+/* Aquila ADC_[1-4] */
+&adc1 {
+	status = "okay";
+};
+
+/* Aquila CTRL_WAKE1_MICO# */
+&aquila_key_wake {
+	status = "okay";
+};
+
+&dsi2dp_out {
+	remote-endpoint = <&dp_1_connector_in>;
+};
+
+/* Aquila ETH_1 */
+&enetc_port0 {
+	status = "okay";
+};
+
+/* Aquila CAN_1 */
+&flexcan1 {
+	status = "okay";
+};
+
+/* Aquila CAN_2 */
+&flexcan2 {
+	status = "okay";
+};
+
+/* Aquila CAN_3 */
+&flexcan3 {
+	status = "okay";
+};
+
+/* Aquila CAN_4 */
+&flexcan4 {
+	status = "okay";
+};
+
+/* Aquila QSPI_1 */
+&flexspi1 {
+	pinctrl-0 = <&pinctrl_flexspi1_4bit>,
+		    <&pinctrl_qspi_cs1>;
+
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0x0>;
+		spi-max-frequency = <66000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+		cdns,read-delay = <0>;
+		cdns,tchsh-ns = <3>;
+		cdns,tsd2d-ns = <10>;
+		cdns,tshsl-ns = <30>;
+		cdns,tslch-ns = <8>;
+	};
+};
+
+&gpio4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio_1>,
+		    <&pinctrl_gpio_2>,
+		    <&pinctrl_gpio_3>,
+		    <&pinctrl_gpio_4>;
+};
+
+/* Aquila I2C_2 */
+&i3c2 {
+	status = "okay";
+};
+
+/* Aquila I2C_1 */
+&lpi2c2 {
+	status = "okay";
+
+	fan_controller: fan@18 {
+		compatible = "ti,amc6821";
+		reg = <0x18>;
+		#pwm-cells = <2>;
+
+		fan {
+			cooling-levels = <255>;
+			pwms = <&fan_controller 40000 PWM_POLARITY_INVERTED>;
+		};
+	};
+
+	temperature-sensor@4f {
+		compatible = "ti,tmp1075";
+		reg = <0x4f>;
+	};
+
+	/* USB-C OTG (TCPC USB PD PHY) */
+	tcpc@52 {
+		compatible = "nxp,ptn5110", "tcpci";
+		reg = <0x52>;
+		interrupt-parent = <&som_gpio_expander_1>;
+		interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
+
+		connector {
+			compatible = "usb-c-connector";
+			data-role = "dual";
+			op-sink-microwatt = <0>;
+			power-role = "dual";
+			self-powered;
+			sink-pdos = <PDO_FIXED(5000, 0, PDO_FIXED_USB_COMM)>;
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			try-power-role = "sink";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					typec_con_hs: endpoint {
+						remote-endpoint = <&usb1_con_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					typec_con_ss: endpoint {
+						remote-endpoint = <&usb1_con_ss>;
+					};
+				};
+			};
+		};
+	};
+
+	carrier_eeprom: eeprom@57 {
+		compatible = "st,24c02", "atmel,24c02";
+		reg = <0x57>;
+		pagesize = <16>;
+	};
+};
+
+/* Aquila I2C_6 */
+&lpi2c5 {
+	status = "okay";
+};
+
+/* Aquila SPI_1 */
+&lpspi6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpspi6 &pinctrl_gpio_5>;
+	cs-gpios = <&gpio2 0 GPIO_ACTIVE_LOW>, <&gpio4 18 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+
+	tpm@1 {
+		compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
+		reg = <1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_6>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
+		spi-max-frequency = <12000000>;
+	};
+};
+
+/* Aquila UART_3, used as the Linux Console */
+&lpuart1 {
+	status = "okay";
+};
+
+/* Aquila UART_4 */
+&lpuart2 {
+	status = "okay";
+};
+
+/* Aquila UART_1 */
+&lpuart3 {
+	status = "okay";
+};
+
+/* Aquila UART_2 */
+&lpuart7 {
+	status = "okay";
+};
+
+/* Aquila PCIE_1 */
+&pcie0 {
+	status = "okay";
+};
+
+&som_dsi2dp_bridge {
+	status = "okay";
+};
+
+/* Aquila PWM_1 */
+&tpm3 {
+	status = "okay";
+};
+
+/* Aquila PWM_3_DSI and PWM_4_DP */
+&tpm5 {
+	status = "okay";
+};
+
+/* Aquila PWM_2 */
+&tpm6 {
+	status = "okay";
+};
+
+/* Aquila USB_2, optional Bluetooth USB */
+&usb2 {
+	status = "okay";
+};
+
+/* Aquila USB_1 */
+&usb3 {
+	status = "okay";
+};
+
+&usb3_dwc3 {
+	status = "okay";
+
+	port {
+		usb1_con_hs: endpoint {
+			remote-endpoint = <&typec_con_hs>;
+		};
+	};
+};
+
+&usb3_phy {
+	orientation-switch;
+
+	status = "okay";
+
+	port {
+		usb1_con_ss: endpoint {
+			remote-endpoint = <&typec_con_ss>;
+		};
+	};
+};
+
+/* Aquila SD_1 */
+&usdhc2 {
+	status = "okay";
+};

-- 
2.43.0

