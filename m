Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F314302756
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 13:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778072546; cv=none; b=rOdICXbNqTyxtPpP1ovFfMbEIE4zNysh5K0oiZwcqFfk62PfprCojDPIjECBQ7AFmJRdkpE6vFt/pvQ3XLWYpivbToRmTY7oRsSLnHDjfbSL+8AtnD1lJLMg7QXQqNll01YzkFwmfYVQkreVRJwTXTWp6pfKI8g00vxKjc6Kkng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778072546; c=relaxed/simple;
	bh=YWHhGANNZCht1FcmjMje+ZQnQK1/7kwmI+Rwli/9bew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jNbZcdfDm0CHFN/3rTmH8dXN9+sGzg4gh9U4TDM1PhVtZXcXGwZeqh0mtB2lzTL4Bo0uoNSYlNjENgRMFXIFZ/Ts5HKGt4JGIYx+M3Onl4IRJv9+mh2JuRExMeEh5fmwrH1P5Z4NrTzglzPsoO0hTQ0VUyuMWSC+WHNJHPAPkdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sWxFp+v8; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sWxFp+v8"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59dcdf60427so6143004e87.3
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 06:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778072535; x=1778677335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w6H69yYIu0ZRZpt5cxy6DiaQQJZWlk3GmWB+9Tjsp8E=;
        b=sWxFp+v8aVSKRKJt1rMDYtVOeG/L1MS6D4Xfmg33B6YZ9YrFS0WEz4aCgEAYj8W071
         oBbwMHcBSUVKvsc48zf+cNFafu6pDs/YNrvwRZ0Y5sshbUjBt3jMUn3OyMMi4paXdlQV
         ssZFoE6dYAZsA96p3hI7nOV54CHUt5wKMHbWBgLv/SG4pH99IoXlhInqwfSY7G0PyRRw
         A16WiXVBs3LtPtle5gMYujpYaycENmkSz3lKPgCEpNKuGfZnzT89r40rq1hkUUmFXbt0
         cZamDpLWROyoQu+EQC5m7XAUkocjnvowQy67JrBOMUR63APpxel3nlph4dUuJa8/pl7k
         9Diw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778072535; x=1778677335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w6H69yYIu0ZRZpt5cxy6DiaQQJZWlk3GmWB+9Tjsp8E=;
        b=Jeo5yKXNiKMmO0dz4ahrh44nfyrJnT006rGVsH+heaKZnsReuYSQTgYOgzQP+jk/+M
         /g4X3L/uhTuVNVRw5nyGJhBQBXAM3hxC17KQRz9zciXBPBEUnK4r3yDjMU3cogTubukF
         gvsi1TO9/fEmeNSwXIdXG5vAxAw4Ktdl8hFon+EdwIsyXBC7AsFQOYv31C1lJ3uKLFFx
         wLtmrqE9CcGpVkGnNuJkzCCLhGUP20BbWeSXq0/1X9pU45LYJ5JGXc6VM+Z2pobkCjmg
         XmVGVSBZ2bxLI50Msm5T4r4rvEKWe8i+kKD9whx+NTZiR+AX4aiKYx+AKRASXbKWCFWZ
         FmEA==
X-Gm-Message-State: AOJu0YwGmok5BDQOBF9+B3kRHcFwt2gKu+DNMeb4JherqytwzL4+b8u8
	BC/rum6GbU7Yr8ORTyl97qxkwn1jV1C2Ngv3gSg+uuNFGaOhlCNRHuuI
X-Gm-Gg: AeBDiet87ua/bZ5K4L77M8zBhO8gAFQov38yP4e7+rzz337TK5yzeg0opdLLOro/aBI
	AWBFTDqkjJcIgxwx+DlppGWGGvEMQAmIMs+H7g8Z0rxgkZxIsPE8CPLE8CsgcwZ5l6fphOFeaU3
	EPDDCB+M1noaMdMeYcfIaL5ZcUJNZbg8BeYpUwkQJSvyS1SQvHnEfGeqQuASW/TJ3Xd3Ql2uGek
	W4ed662Vu3sOnu7n2CsDldtahziY/P6lKaKIpIfSofaO3fNYyqsmG6c7jQPWCCigCvwlk3fs4Aq
	a8vLi1ZvuN7fX31wLJE6Xupb0BOlXRFkgEfR8aYtbE7kffkr1ovwPB75Idha64mGwF9fFN3MSMy
	nZWoVdKCHHnU1CeDQY8GgyflUmv9Xe4Lm8zMJqs4okEsSZWNvaXrLbnHACmQ0va/cVKhnW5tSK/
	jMl/6H+aohnXKcrMoR92YBSz4gKGshdlYY4bugPClrTb0vpNfoxNIOq+fQwe4on3R6kjQqOM08X
	kmONodhC8+6HV5fdWUom6esFSemE3UByBkqbOlze5/O/ueQaiBsHoaZsrIr3U6I3Uld5LLb9BMS
	5anyZ5o/GjaEwCkU5u/WNQ==
X-Received: by 2002:a05:6512:400f:b0:5a4:1902:3d17 with SMTP id 2adb3069b0e04-5a887adfda4mr1167554e87.12.1778072532373;
        Wed, 06 May 2026 06:02:12 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45052a488d8sm12288076f8f.12.2026.05.06.06.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 06:02:11 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Wed, 06 May 2026 15:01:57 +0200
Subject: [PATCH 3/3] arm64: dts: freescale: imx95-aquila: Add Clover
 carrier board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-add-aquila-imx95-v1-3-69c8ee1c5413@toradex.com>
References: <20260506-add-aquila-imx95-v1-0-69c8ee1c5413@toradex.com>
In-Reply-To: <20260506-add-aquila-imx95-v1-0-69c8ee1c5413@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Franz Schnyder <franz.schnyder@toradex.com>, 
 Antoine Gouby <antoine.gouby@toradex.com>
X-Mailer: b4 0.14.3

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
 arch/arm64/boot/dts/freescale/Makefile             |   1 +
 .../boot/dts/freescale/imx95-aquila-clover.dts     | 294 +++++++++++++++++++++
 2 files changed, 295 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 178f55255dc14..55fb5f9f561ee 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -514,6 +514,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
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

