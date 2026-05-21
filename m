Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7709736CDF8
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 09:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779354238; cv=none; b=qPitpsCXEsoIl8qAEFZ5/9QlqOf+R+98kmynp1l7Yg+NORv7LSkjWOTBABrEDj8Z2IOmnxe/4Bd/hbIpJk74iySOMj67wz+e8mDUOHX2jeqGiYXtnlLwymKAKJebpKmhDkLkX1LmFUuNyZFiFHTYSaxObyDS2AkssK+vUvRWh4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779354238; c=relaxed/simple;
	bh=xlgIbakHpJWlfb88GgrtOWV5MkVbOQWhi8kTZqbHiBo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gq+Bp+pbhAYKsn5e3DTsCe6xwKgaWgzAGBBFLZupj4o97BzQ4rWhJK49xiclwE69jjK9qnWPY0gctc4+OoyeBsR6R8UnJfi3YRxv3sJxxcgqWhKf4P7fupI1ad98vDSzm+N6EhBkdr9E5L1H0OAOhvO3b4fJV8orYKkTRWqL+7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IFikv1us; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IFikv1us"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49039a8851fso3309715e9.2
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 02:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779354233; x=1779959033; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Y36SgBQ9cIMBn0I5RWu40X8SISnSEeAXBBuc0ToW2E=;
        b=IFikv1useLsa+hTkL1z3+S5cI94Sy36HL9FJskSNJFSv4pATMZ0zUbY2lEJEL1Q3AN
         C75OB343nCt91lPnBpcJv3YGiaJSHeet+X6N47S+SDA46kVmw4t35vmrvVOzo4MQBk4a
         t8NB3im/HF/sPI5IY+DLodcBOa0sr5B8ADL8WmToM3E+ETXei74qtZl8qUfqS3TCtX2G
         29cSf6QsEY0KAIR2OQqj1VgueNCAuo/mgZEktZB10CcVCquysSl7WHj8uldGCPk0JXtz
         BwtgjiYtErPeDy9O7982qetMb2VglTw7JP8eC3/uomDqN2IKNm8PkxaQD0h4pbeMdPHb
         AEAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779354233; x=1779959033;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0Y36SgBQ9cIMBn0I5RWu40X8SISnSEeAXBBuc0ToW2E=;
        b=LYA8kMo37yBPXh6sgzGz+4sio2Rih4SF7CCOpQDQhv4qeHb7ls8Nln09hcYXDdmpRJ
         OhdV666p6EACe1/bUKBkMVjwO7jporkjKZXXwipIKDNzuwPVu/gJ6Jits13fqyVJ9LRj
         h2teZjmQ76aEQVpk0+Iq518tsUMKu4r9p27fKIw3xXvYBUBFd0UntAaUTUv7lq1xQAas
         HV68J5WKXFlKthprZ1MavSiMIl3DLbOt7VdneLYH4Ku3a7fQlk3vRMEJGsFumBj8dOCD
         QHeDehu3gSElo7mwbaI+T7GkOJ1m0w/vGPBZJwbl7dpCe+IgHO3IOtar07RH5280nZ3y
         IJhg==
X-Gm-Message-State: AOJu0Yw5skb/TG8hpFgfxosqV3c6VKCKmJ5TYGKb9M9VW2IlMOwbZZ0s
	1q66klSwiAuV9zdShjcTIvaVuGJDcZDwup0g+DdGwzQtjGebBTtx+XAn
X-Gm-Gg: Acq92OHzNK4RPL4ma47yw2NExhIDVF8HK+FI8MWupsJHvLfggogXobXogTuStUVYjTr
	ixKPbaCZmeUJRbDPnatrxtQX2n9ocl81Sren9SzNJ7nNIwmBH/nU7jByrdlYLgOLfZ25ZutIb4p
	fxnb+Br1QpCRRVCxnbxfKXe1nA4M/78scQgcegIwFydgxabPcFRtfU3k1zoUaty3YlL6h7K60/L
	jAclMNzDlo4xtvEEq6dwVLerhpWSeVjPBzu7ocm/FYeq/XQZ9n3ozM5CyfwAGCYNWWvk2Z4rkDg
	Ou3U7KgqwJLVhiDVmE1dx5JbkTxl7dOGp63Ag0SUcUmmdAJvFsJoiQS4XzdftQPLyST86cji8wX
	HWlMq9VKh6PCILj0PNPkOivYvq751Q8uS2znrNzhCL2b/yyZ0y+kGV2TMnhVMg5zWScEJ72htTZ
	HrOt9Cmoz7KNAD9xeJt9hUW9yA+tpN9l0l2Oks67CyRTqybhF1GOocgs3P8OXVcmNR+iTyTurTK
	81rH1eDwL9rPa1xFBO1GjOjy/TJIWriOOgvCC1cqPNE1BPe/Gfbir+Jz8+FRjx9rJY1oDczxDEq
	pw==
X-Received: by 2002:a05:600c:4d98:b0:489:2005:b36e with SMTP id 5b1f17b1804b1-4903607ced6mr16564025e9.19.1779354232294;
        Thu, 21 May 2026 02:03:52 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49035c72c78sm16151525e9.3.2026.05.21.02.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 02:03:51 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Thu, 21 May 2026 11:03:47 +0200
Subject: [PATCH v3 3/3] arm64: dts: freescale: imx95-aquila: Add Clover
 carrier board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-add-aquila-imx95-v3-3-621843807def@toradex.com>
References: <20260521-add-aquila-imx95-v3-0-621843807def@toradex.com>
In-Reply-To: <20260521-add-aquila-imx95-v3-0-621843807def@toradex.com>
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
v3: Deleted the cdns,* properties from flexspi1
v2: no changes
v1: https://lore.kernel.org/all/20260506-add-aquila-imx95-v1-3-69c8ee1c5413@toradex.com/
---
 arch/arm64/boot/dts/freescale/Makefile             |   1 +
 .../boot/dts/freescale/imx95-aquila-clover.dts     | 289 +++++++++++++++++++++
 2 files changed, 290 insertions(+)

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
index 0000000000000..751232e6fa8dd
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
@@ -0,0 +1,289 @@
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

