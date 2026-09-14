Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B081A4483AC
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385716; cv=none; b=gYCAk/MSZurCsH8eh7XPX8UevdmP3uO+M/PaHG2suBNvPEplSewAfXItOarFFqaR3AAqCyUp6YSbSGfamOB/9kMqHIrQfJxkiID3usPbNQ3lm4PFw4arjQBiuq94f5GPqJO4wfDcDUqPOFDWh5YK5/HoDVkGJPY96+hejw1s3ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385716; c=relaxed/simple;
	bh=0gtX+dbD2z7gQkrFNmZkFTj7KcPdJd2m+2n9w8cQSow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A1+nGXTuCcrUEgfL1iPh9ssfrqQOrCEJ9K5zD5YS/876WKVtk+WO0U2+EipII5oyBpLK7V0un+BqdO4FwhnULSo7Ykj6PVAivq/JlrGAWnXd7t5F1w2ljcoABeI5hhINi2GsSC67Jt8z0wLcpcMVaeChxEKWhJb7xBLLPhaJORU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rSz2INX6; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rSz2INX6"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so34580145e9.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 04:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789385712; x=1789990512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LHdGMoxzi2wHxj/rRPHa6zr3JYkbxRfl/EgABIz7bgc=;
        b=rSz2INX6sRJB5nrMh5NYvwhSkSokkbsvFCngMFVIU9H3bt93V79PKe/eh+9nLXhRep
         JsuJpUFIBZfu4y49pFiQh40rCB139RVQY0+D50m2lwaDTJqAznMG6I8JsGWWOJxYYgXC
         iG3+vdhXlXCd5ysYB7V3ddjPHBGcQa42jusOPJk5uONOXtF7o5N+vfU6yheDqoGDbdmN
         yrAx0Tgu+4HLTE2aRmqMzDkBpS1TnBSgObHs//U/GkeUAdQgrw1JoM3deddQZglnZLFH
         dtvyCLiB6c7kb6/CmAPXky4+/OKvu+Nr+RloDvkNMn0dkpx8CN9UuvN7nOHigSh1zp3W
         s/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789385712; x=1789990512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LHdGMoxzi2wHxj/rRPHa6zr3JYkbxRfl/EgABIz7bgc=;
        b=kywBg6QsYqtNMlWHMwK5B5l9T72pfO8ltSgXJXSeSlU2POhOB/sAE/LjYXP9oWxdO1
         oQFPdMsyJsp0UjDVc7N7WXItJMMffxLrui1F2ERnZlZPpmJ2sHPRi+dO+ijUz2yDDRsV
         1BzoTH9piwM9KtyD1WLuCJ1intNZz5JALs9IxEkhgVJzs56Gvguy/uPlHhGiGmsxfTjs
         NO82w5h35qmybwdcqLeL0srQzf81oJxlIVF23EWu9L/CZETESlIv4+xkC04ylk7PaCw+
         Gp5CLQ0yjsJFt3FDZ5RAxGL7sYlvaqz3Yz2ipCA19G9u/w7ABuJ1JjP7kKgq/iGlj7ev
         WQCg==
X-Forwarded-Encrypted: i=1; AKwUvBwj5TIccWlPX/2wv0P/FtL7HyyJ3W+G7ewH2jGYy7W3sut5aMM1poFDb9e0BLQ3HgNwUqA4oG2pRyMu@vger.kernel.org
X-Gm-Message-State: AFuF++mXhIBNYifxewk1NTdQcHxSC0Kh5+oDK7v3lftBCYc62JpiHtMC
	xrf8MPhsLwyBoqJY9P++qB1W1bxf4SJ/lXlL0NX9XJ4ognnKCAI1Qy9N
X-Gm-Gg: AYBFou3gzXihl7VgzmdAcPqtdejmtYY1+/XYsPvjdnOLpGbSQW3L8m1KZ02/YUCJSNa
	r//T7yN7PEnuDV38KA8JFwoynlSefPVe3YxFipr+ai2QxZffk9Ek+x6Cg6P+J6RcX75wJAny9+G
	7R4SDr220o9ZU6ZiIosttK17pdWnvszBzwbyUKwdn8XsQi+MbKWe7klIJxdhbb6uZ6HAgX/4tT3
	20k5XylpviqUzOvvKvjqHJOKljHJH1qcczkIxJdCMMTZIeWXT+rtqoSxq6Ee6sX6UPR4y0Z6Hye
	q2SDIktZRWipjyzq30CTK021Kiw2ae3NnLrGJICZIdUufuM0sVCil144CuH5DqvcDGqKL1iYgH4
	awLguKH+9eVzbVAeKccxnN5jv3xXijJUw/DyOJOO/o96i3ohwFEUoijm0GbLgAUtmcTtuy48Rx+
	7nLtix6qWvFa0PTHnU01pgRos4qn3gkybKWRMBAYVOPILXTlYIfZJf8nQQPxOUCN3D8TSRR6Y0x
	8HwnFB6JsjuL3UG9l6vsKVVJA==
X-Received: by 2002:a05:600d:8644:20b0:49e:7cfc:a9b7 with SMTP id 5b1f17b1804b1-49e7cfca9eamr68145e9.18.1789385711541;
        Mon, 14 Sep 2026 04:35:11 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb36e4a6sm27906531f8f.37.2026.09.14.04.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 04:35:11 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	elena.popa@nxp.com,
	cosmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 2/2] arm64: dts: freescale: add MR-NAVQ95 basic board support
Date: Mon, 14 Sep 2026 04:30:10 -0700
Message-ID: <20260914113010.988-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914113010.988-1-laurentiumihalcea111@gmail.com>
References: <20260914113010.988-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add basic support for NXP's MR-NAVQ95 board. This board is designed for
robotics applications (e.g. drones, rovers, humanoids, etc..) and has the
following hardware feats (list is not exhaustive):

* based on i.MX95 19x19 SoC
* 64GB eMMC
* 16GB of LPDDR5 memory
* 1 x USB 2.0 TypeC
* 1 x USB 3.0 TypeC
* 1 x RJ45 port with RTL8211 PHY

The support targets revision B of the board.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile       |   1 +
 arch/arm64/boot/dts/freescale/imx95-navq.dts | 228 +++++++++++++++++++
 2 files changed, 229 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-navq.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 984642146dd9..b6dd7040c385 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -947,6 +947,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-frdm-pro.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-clover.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-dev.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-navq.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596la-mba95xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx95-navq.dts b/arch/arm64/boot/dts/freescale/imx95-navq.dts
new file mode 100644
index 000000000000..7860c113e9e0
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-navq.dts
@@ -0,0 +1,228 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+/dts-v1/;
+
+#include "imx95.dtsi"
+
+/ {
+	model = "NXP MR-NAVQ95";
+	compatible = "fsl,imx95-navq", "fsl,imx95";
+
+	aliases {
+		ethernet0 = &enetc_port0;
+		mmc0 = &usdhc1;
+		mmc1 = &usdhc2;
+		serial0 = &lpuart1;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		/* actual size filled in by the bootloader */
+		reg = <0x0 0x80000000 0 0x80000000>;
+	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2 {
+		compatible = "regulator-fixed";
+		bootph-pre-ram;
+		enable-active-high;
+		gpios = <&gpio3 7 GPIO_ACTIVE_HIGH>;
+		off-on-delay-us = <12000>;
+		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
+		pinctrl-names = "default";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "VDD_SD2_3V3";
+	};
+};
+
+&edma1 {
+	/* owned by M7 */
+	status = "reserved";
+};
+
+&edma2 {
+	/* channels 30-63 owned by M7 */
+	dma-channels = <30>;
+};
+
+&enetc_port0 {
+	phy-handle = <&ethphy0>;
+	phy-mode = "rgmii-id";
+	pinctrl-0 = <&pinctrl_enetc0>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&lpi2c3 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_lpi2c3>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	i2c3_gpio_expander_21: gpio-expander@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupt-parent = <&gpio4>;
+		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&pinctrl_i2c3_gpio_expander_21>;
+		pinctrl-names = "default";
+	};
+};
+
+&lpuart1 {
+	bootph-pre-ram;
+	pinctrl-0 = <&pinctrl_uart1>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&netc_blk_ctrl {
+	status = "okay";
+};
+
+&netc_emdio {
+	pinctrl-0 = <&pinctrl_emdio>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	ethphy0: ethernet-phy@1 {
+		compatible = "ethernet-phy-id001c.c916";
+		reg = <1>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <80000>;
+		reset-gpios = <&i2c3_gpio_expander_21 1 GPIO_ACTIVE_LOW>;
+		realtek,clkout-disable;
+	};
+};
+
+&scmi_iomuxc {
+	pinctrl_emdio: emdiogrp {
+		fsl,pins = <IMX95_PAD_ENET2_MDC__NETCMIX_TOP_NETC_MDC			0x57e>,
+			   <IMX95_PAD_ENET2_MDIO__NETCMIX_TOP_NETC_MDIO			0x97e>;
+	};
+
+	pinctrl_enetc0: enetc0grp {
+		fsl,pins = <IMX95_PAD_ENET1_TD3__NETCMIX_TOP_ETH0_RGMII_TD3		0x57e>,
+			   <IMX95_PAD_ENET1_TD2__NETCMIX_TOP_ETH0_RGMII_TD2		0x57e>,
+			   <IMX95_PAD_ENET1_TD1__NETCMIX_TOP_ETH0_RGMII_TD1		0x57e>,
+			   <IMX95_PAD_ENET1_TD0__NETCMIX_TOP_ETH0_RGMII_TD0		0x57e>,
+			   <IMX95_PAD_ENET1_TX_CTL__NETCMIX_TOP_ETH0_RGMII_TX_CTL	0x57e>,
+			   <IMX95_PAD_ENET1_TXC__NETCMIX_TOP_ETH0_RGMII_TX_CLK		0x58e>,
+			   <IMX95_PAD_ENET1_RX_CTL__NETCMIX_TOP_ETH0_RGMII_RX_CTL	0x57e>,
+			   <IMX95_PAD_ENET1_RXC__NETCMIX_TOP_ETH0_RGMII_RX_CLK		0x58e>,
+			   <IMX95_PAD_ENET1_RD0__NETCMIX_TOP_ETH0_RGMII_RD0		0x57e>,
+			   <IMX95_PAD_ENET1_RD1__NETCMIX_TOP_ETH0_RGMII_RD1		0x57e>,
+			   <IMX95_PAD_ENET1_RD2__NETCMIX_TOP_ETH0_RGMII_RD2		0x57e>,
+			   <IMX95_PAD_ENET1_RD3__NETCMIX_TOP_ETH0_RGMII_RD3		0x57e>;
+	};
+
+	pinctrl_i2c3_gpio_expander_21: i2c3gpioexpander21grp {
+		fsl,pins = <IMX95_PAD_ENET2_RD3__GPIO4_IO_BIT27				0x31e>;
+	};
+
+	pinctrl_lpi2c3: lpi2c3grp {
+		fsl,pins = <IMX95_PAD_GPIO_IO28__LPI2C3_SDA				0x40000b9e>,
+			   <IMX95_PAD_GPIO_IO29__LPI2C3_SCL				0x40000b9e>;
+	};
+
+	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
+		bootph-pre-ram;
+		fsl,pins = <IMX95_PAD_SD2_RESET_B__GPIO3_IO_BIT7			0x31e>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		bootph-pre-ram;
+		fsl,pins = <IMX95_PAD_UART1_RXD__AONMIX_TOP_LPUART1_RX			0x31e>,
+			   <IMX95_PAD_UART1_TXD__AONMIX_TOP_LPUART1_TX			0x31e>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		bootph-pre-ram;
+		fsl,pins = <IMX95_PAD_SD1_CLK__USDHC1_CLK				0x15fe>,
+			   <IMX95_PAD_SD1_CMD__USDHC1_CMD				0x13fe>,
+			   <IMX95_PAD_SD1_DATA0__USDHC1_DATA0				0x13fe>,
+			   <IMX95_PAD_SD1_DATA1__USDHC1_DATA1				0x13fe>,
+			   <IMX95_PAD_SD1_DATA2__USDHC1_DATA2				0x13fe>,
+			   <IMX95_PAD_SD1_DATA3__USDHC1_DATA3				0x13fe>,
+			   <IMX95_PAD_SD1_DATA4__USDHC1_DATA4				0x13fe>,
+			   <IMX95_PAD_SD1_DATA5__USDHC1_DATA5				0x13fe>,
+			   <IMX95_PAD_SD1_DATA6__USDHC1_DATA6				0x13fe>,
+			   <IMX95_PAD_SD1_DATA7__USDHC1_DATA7				0x13fe>,
+			   <IMX95_PAD_SD1_STROBE__USDHC1_STROBE				0x15fe>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		bootph-pre-ram;
+		fsl,pins = <IMX95_PAD_SD1_CLK__USDHC1_CLK				0x158e>,
+			   <IMX95_PAD_SD1_CMD__USDHC1_CMD				0x138e>,
+			   <IMX95_PAD_SD1_DATA0__USDHC1_DATA0				0x138e>,
+			   <IMX95_PAD_SD1_DATA1__USDHC1_DATA1				0x138e>,
+			   <IMX95_PAD_SD1_DATA2__USDHC1_DATA2				0x138e>,
+			   <IMX95_PAD_SD1_DATA3__USDHC1_DATA3				0x138e>,
+			   <IMX95_PAD_SD1_DATA4__USDHC1_DATA4				0x138e>,
+			   <IMX95_PAD_SD1_DATA5__USDHC1_DATA5				0x138e>,
+			   <IMX95_PAD_SD1_DATA6__USDHC1_DATA6				0x138e>,
+			   <IMX95_PAD_SD1_DATA7__USDHC1_DATA7				0x138e>,
+			   <IMX95_PAD_SD1_STROBE__USDHC1_STROBE				0x158e>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		bootph-pre-ram;
+		fsl,pins = <IMX95_PAD_SD2_CD_B__GPIO3_IO_BIT0				0x31e>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		bootph-pre-ram;
+		fsl,pins = <IMX95_PAD_SD2_CLK__USDHC2_CLK				0x158e>,
+			   <IMX95_PAD_SD2_CMD__USDHC2_CMD				0x138e>,
+			   <IMX95_PAD_SD2_DATA0__USDHC2_DATA0				0x138e>,
+			   <IMX95_PAD_SD2_DATA1__USDHC2_DATA1				0x138e>,
+			   <IMX95_PAD_SD2_DATA2__USDHC2_DATA2				0x138e>,
+			   <IMX95_PAD_SD2_DATA3__USDHC2_DATA3				0x138e>,
+			   <IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT			0x51e>;
+	};
+};
+
+&usdhc1 {
+	bootph-pre-ram;
+	bus-width = <8>;
+	no-sd;
+	no-sdio;
+	non-removable;
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	pinctrl-3 = <&pinctrl_usdhc1>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+
+	status = "okay";
+};
+
+&usdhc2 {
+	bootph-pre-ram;
+	bus-width = <4>;
+	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-3 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+
+	status = "okay";
+};
-- 
2.53.0

