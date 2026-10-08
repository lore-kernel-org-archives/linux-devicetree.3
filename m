Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798B84FE2C3
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 19:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791488435; cv=none; b=pwd/xwZsQZllr4tStIhHlEYmHddcu1x50fUDpJ4PtWiYZ2T+Hv8CqTpdmvA4adwpDywKBVGsbcIJEf1oORB9U0Xl5Qig5uA1AEyN5UfYFNmSzfNu1uWPUnHlKwpFngNchx73PXuBe5CpezYhUHZXjyNTUuH0k3F2otBAIDHuO7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791488435; c=relaxed/simple;
	bh=WDGthqjcnE05o9DI4uqRnViDjz8cSzD7QRL8gJdswr0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L/pGrzxeWWEq3pQ6vgkbbbR9R0BhP5m4IB7mY4kIaYQS1+YXQ98KKiW7itXwDiECQzFlst37fCGRIKUjaFU/oAlOq3awNcNgLcuTlch7VHHUKz2N+fljy4pQ90Y+m/35Hj3HoBhYik2IyEyyOawxyuOCS//2p/cvUCb3jcxToAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ajGzX/Tj; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ajGzX/Tj"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so29367025e9.1
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 12:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791488427; x=1792093227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hHibv6OWsydkGLeRwEagwZyS9SLumTYauYxxj+K9nlg=;
        b=ajGzX/TjLwm5xK+9u8ETVVkIVItm17XhwskW8p0wYdWAoJcGCcB0Z5tYdJaZEkZ1hB
         T3yy4LrNXGVzYsPrsSoFUx6y7WUkBP3pV7d1wnPMsLVqDg96Rt+bICseOpwG0PmYZmeU
         APhQpHXskYtun44+yKhUzQLHVhHuIc9KDTtZhrlH/m6d9Vn5MrAUAwEKi14p04arZR65
         k3BRUezyR2uf9h+m3ZCuws5a2E5+PnLrVwjbrB3FV+x2Lkz44/qgtLExCC3MMFZp5sm2
         oaqNxXv518cqr9WI4MKrMG6/Ytsb/wnYaXjSUxCoHeHJGyBoYgA2K7U46xLhIY5hwb+K
         mcTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791488427; x=1792093227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hHibv6OWsydkGLeRwEagwZyS9SLumTYauYxxj+K9nlg=;
        b=ST8CFU2dT9++prFByC2+6NTUHkyd2dA0+CrVhK4HSbHofPNh+QzqIaG4T6AL9nr9Ax
         x2BrAfL6g63NokX0EMXrGynkkCMx8+d1yTZPDVVhY5vUEmnGRLcP5fvEh6RhscYNvl42
         uZitMbFghqECEdRlCw8ov+zUKP/Ivac5Vw0QGlDYz323igaO7IDtZipn+yhazTE2sko0
         eV6zZOY/THv4JXtCIY7eztMvPMsAqSgrZ2zNrQwpMdELs3rkPMueiY07utEhmEDjRElR
         5Zc1JVlG/3ckgHC5373KyaMjHv8BPnlM82ftSWHcUfxGtQQ/DxtyhB1sVrv525iVH8C3
         TlHw==
X-Forwarded-Encrypted: i=1; AKwUvBxhM2NzQ1uYuG7+C6jeg2GaJ9N2vPe67OqGdLctM/9JVhMo05VsKJ9ttCjvmGeDAH4VlpSR/+Tdjjjv@vger.kernel.org
X-Gm-Message-State: AFuF++kPqjoWiR7Ep7qe0QBpTj+TcSGWi4Y4kv22rUxMcp//nuHY1NX3
	uKdbdqRXweMWGqTfu5xmzXQ8WiLWv991ESsqJpz5oF67b2LWyBrkaIdl
X-Gm-Gg: AYBFou3j8JrSgEq/BUyIz0szeKJNZYyD4ivEMOHkx+YUS4Rug/1kmre/Ai6F0vfKYpZ
	XSQiIV205E1L0p+tNG6FmhC4b7xn6BS9epYtkmqKvXVSFIyzuQ0jF3C/6x1WR+zXhfikyL8IpJF
	Y6sjPmxqqVTGLz5O60M1fV0ZnDwTlqZwykeokj8NdgjeDIfjHb5WPAd+8jVjHhNuVW/4sKnS9lX
	K8UDeoy2bz3O+kWQkps1QgyMCMGpAU7aGufrXKFZ280yFo8ldyudBFH4SajgEl99Qu6gIKQZY/g
	QnQkgZ9qDaf2f12Rc6Cx6iovN2nb3aKaHDA+Ofq4gNRiuw46NAOolo1vFclyNHgrQGpGdSNb4m2
	k+0NaGePfy93TwZBiheak/eeB8LyIpiTVUvVQt7JvgPb6oApznic9bLZQER4xotpm/GDZ4xx3hV
	ZpUsJ89e7fsdE92sxgi2au/OLT6qcjtfhw0cPWvoCTJ/CdlLMM+tPrcTYnFhTOlCmDEgoNguOiy
	Q3awZYk5BIsxQOteZ7y8Nxu/+fegiPqv0aZFAJujsCwQSC/ZKD1sVJiTEVV0WH5phPzKmBE/6ye
	DmcQ2zuxkJzQnQd8FAueC/8=
X-Received: by 2002:a05:600c:3f08:b0:4a1:7703:e537 with SMTP id 5b1f17b1804b1-4a180313b66mr108815655e9.10.1791488427440;
        Thu, 08 Oct 2026 12:40:27 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c1e33d2sm1419065e9.0.2026.10.08.12.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:40:26 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Joseph Guo <qijian.guo@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v5 06/13] ARM: dts: imx6ul: Extend VAR-SOM-6UL and add DART-6UL files
Date: Thu,  8 Oct 2026 21:37:46 +0200
Message-ID: <e11cdc950e41b502e5449830d5f6a82568fc043a.1791487179.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791487179.git.stefano.r@variscite.com>
References: <cover.1791487179.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add the DART-6UL module description and wrappers for i.MX6UL,
i.MX6ULL and i.MX6ULZ, plus an i.MX6ULZ wrapper for VAR-SOM-6UL.

Extend the existing VAR-SOM-6UL files with CPU supplies, a 3.3 V
ADC reference and I2C2 pin configuration with GPIO bus recovery.
Enable I2C2 for the module codecs described in the following patch.

Use iomuxc_snvs for the i.MX6ULL module's tamper pads. Describe the
IW61x power-enable and reset pins on GPIO5_IO02 and GPIO5_IO06
separately from the Broadcom Wi-Fi and Bluetooth pin groups.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - Clarify the title and description: extend the existing VAR-SOM-6UL
   support and add DART-6UL module files.
 - Extend imx6ul-var-som-common.dtsi and the existing SoC wrappers
   instead of replacing them. Keep the eMMC and I2C1 descriptions here
   until the patches that move them and update their consumers.
 - Retain the Broadcom pin groups and add a separate IW61x group with
   GPIO5_IO02 and GPIO5_IO06 matching the power-sequence pins.
 - Configure i.MX6ULL SNVS pads under iomuxc_snvs.

v2->v3:
 - Constrain the fixed touch and ADC reference regulators to 3.3 V on
   both modules so the ADC can report a valid scale.

 .../dts/nxp/imx/imx6ul-imx6ull-var-dart.dtsi  | 207 ++++++++++++++++++
 .../arm/boot/dts/nxp/imx/imx6ul-var-dart.dtsi |  44 ++++
 .../dts/nxp/imx/imx6ul-var-som-common.dtsi    |  38 ++++
 arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi |  13 ++
 .../boot/dts/nxp/imx/imx6ull-var-dart.dtsi    |  44 ++++
 .../arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi |  15 +-
 .../boot/dts/nxp/imx/imx6ulz-var-dart.dtsi    |  51 +++++
 .../arm/boot/dts/nxp/imx/imx6ulz-var-som.dtsi |  51 +++++
 8 files changed, 462 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som.dtsi

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart.dtsi
new file mode 100644
index 000000000000..f7190f6d50b5
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart.dtsi
@@ -0,0 +1,207 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/ {
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;
+	};
+
+	/* ref_clk for micrel ethernet phy */
+	rmii_ref_clk: clock-rmii-ref {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+		clock-output-names = "rmii-ref";
+	};
+
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "3P3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	reg_gpio_dvfs: regulator-gpio-dvfs {
+		compatible = "regulator-gpio";
+		regulator-name = "gpio_dvfs";
+		regulator-min-microvolt = <1300000>;
+		regulator-max-microvolt = <1400000>;
+		regulator-type = "voltage";
+		gpios = <&gpio4 13 GPIO_ACTIVE_HIGH>;
+		states = <1300000 0x1
+			  1400000 0x0>;
+	};
+
+	touch_3v3_regulator: regulator-touch-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "touch_3v3_supply";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+};
+
+&clks {
+	assigned-clocks = <&clks IMX6UL_CLK_PLL4_AUDIO_DIV>;
+	assigned-clock-rates = <786432000>;
+};
+
+&cpu0 {
+	arm-supply = <&reg_arm>;
+	soc-supply = <&reg_soc>;
+};
+
+&fec1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_enet1>, <&pinctrl_enet1_gpio>, <&pinctrl_enet1_mdio>;
+	phy-mode = "rmii";
+	phy-handle = <&ethphy0>;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@1 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <1>;
+			clocks = <&rmii_ref_clk>;
+			clock-names = "rmii-ref";
+			reset-gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <100000>;
+			micrel,rmii-reference-clock-select-25-mhz = <1>;
+			micrel,led-mode = <1>;
+		};
+	};
+};
+
+&i2c2 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c2>;
+	pinctrl-1 = <&pinctrl_i2c2_gpio>;
+	scl-gpios = <&gpio1 30 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio1 31 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+};
+
+&pxp {
+	status = "okay";
+};
+
+&snvs_poweroff {
+	status = "okay";
+};
+
+&snvs_pwrkey {
+	status = "okay";
+};
+
+&tsc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_tsc>;
+	xnur-gpios = <&gpio1 3 GPIO_ACTIVE_LOW>;
+	measure-delay-time = <0xffff>;
+	pre-charge-time = <0xfff>;
+	status = "okay";
+};
+
+/* Bluetooth UART */
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart2>;
+	uart-has-rtscts;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_enet1: enet1-grp {
+		fsl,pins = <
+			MX6UL_PAD_ENET1_RX_EN__ENET1_RX_EN	0x1b0b0
+			MX6UL_PAD_ENET1_RX_ER__ENET1_RX_ER	0x1b0b0
+			MX6UL_PAD_ENET1_RX_DATA0__ENET1_RDATA00	0x1b0b0
+			MX6UL_PAD_ENET1_RX_DATA1__ENET1_RDATA01	0x1b0b0
+			MX6UL_PAD_ENET1_TX_EN__ENET1_TX_EN	0x1b0b0
+			MX6UL_PAD_ENET1_TX_DATA0__ENET1_TDATA00	0x1b0b0
+			MX6UL_PAD_ENET1_TX_DATA1__ENET1_TDATA01	0x1b0b0
+			MX6UL_PAD_ENET1_TX_CLK__ENET1_REF_CLK1	0x4001b031
+		>;
+	};
+
+	pinctrl_enet1_mdio: enet1-mdio-grp {
+		fsl,pins = <
+			MX6UL_PAD_GPIO1_IO06__ENET1_MDIO	0x1b0b0
+			MX6UL_PAD_GPIO1_IO07__ENET1_MDC		0x1b0b0
+		>;
+	};
+
+	pinctrl_i2c2: i2c2-grp {
+		fsl,pins = <
+			MX6UL_PAD_UART5_TX_DATA__I2C2_SCL	0x4001b8b0
+			MX6UL_PAD_UART5_RX_DATA__I2C2_SDA	0x4001b8b0
+		>;
+	};
+
+	pinctrl_i2c2_gpio: i2c2-gpio-grp {
+		fsl,pins = <
+			MX6UL_PAD_UART5_TX_DATA__GPIO1_IO30	0x1b0b0
+			MX6UL_PAD_UART5_RX_DATA__GPIO1_IO31	0x1b0b0
+		>;
+	};
+
+	pinctrl_tsc: tsc-grp {
+		fsl,pins = <
+			MX6UL_PAD_GPIO1_IO01__GPIO1_IO01	0xb0
+			MX6UL_PAD_GPIO1_IO02__GPIO1_IO02	0xb0
+			MX6UL_PAD_GPIO1_IO03__GPIO1_IO03	0xb0
+			MX6UL_PAD_GPIO1_IO04__GPIO1_IO04	0xb0
+		>;
+	};
+
+	pinctrl_uart2: uart2-grp {
+		fsl,pins = <
+			MX6UL_PAD_UART2_TX_DATA__UART2_DCE_TX	0x1b0b1
+			MX6UL_PAD_UART2_RX_DATA__UART2_DCE_RX	0x1b0b1
+			MX6UL_PAD_UART2_CTS_B__UART2_DCE_CTS	0x1b0b1
+			MX6UL_PAD_UART2_RTS_B__UART2_DCE_RTS	0x1b0b1
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1-grp {
+		fsl,pins = <
+			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x17059
+			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x17059
+			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x17059
+			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x17059
+			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x17059
+			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x17059
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhz-grp {
+		fsl,pins = <
+			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x170b9
+			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x100b9
+			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x170b9
+			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x170b9
+			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x170b9
+			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x170b9
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhz-grp {
+		fsl,pins = <
+			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x170f9
+			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x100f9
+			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x170f9
+			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x170f9
+			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x170f9
+			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x170f9
+		>;
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-dart.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-dart.dtsi
new file mode 100644
index 000000000000..eaac0455357d
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-dart.dtsi
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common dtsi for Variscite DART-6UL
+ *
+ * Link: https://variscite.com/system-on-module-som/i-mx-6/i-mx-6ul/dart-6ul/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+#include "imx6ul-imx6ull-var-dart.dtsi"
+
+&adc1 {
+	vref-supply = <&touch_3v3_regulator>;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_brcm_bt: brcm-bt-grp {
+		fsl,pins = <
+			MX6UL_PAD_SNVS_TAMPER4__GPIO5_IO04	0x1b0b0 /* BT_REG_ON */
+		>;
+	};
+
+	pinctrl_brcm_wifi: brcm-wifi-grp {
+		fsl,pins = <
+			MX6UL_PAD_SNVS_TAMPER2__GPIO5_IO02	0x1b0b0 /* WL_PWR */
+			MX6UL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x1b0b0 /* WL_REG_ON */
+		>;
+	};
+
+	pinctrl_enet1_gpio: enet1-gpio-grp {
+		fsl,pins = <
+			MX6UL_PAD_SNVS_TAMPER0__GPIO5_IO00	0x1b0b0
+		>;
+	};
+
+	pinctrl_wifi: wifi-grp {
+		fsl,pins = <
+			MX6UL_PAD_SNVS_TAMPER2__GPIO5_IO02	0x1b0b0
+			MX6UL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x03029
+		>;
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
index 5600eeaa5854..9aab7c402f2c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
@@ -5,6 +5,7 @@
  *
  * Copyright 2019 Variscite Ltd.
  * Copyright 2025 Bootlin
+ * Copyright (C) 2026 Variscite Ltd.
  */
 
 #include <dt-bindings/clock/imx6ul-clock.h>
@@ -37,6 +38,14 @@ reg_gpio_dvfs: reg-gpio-dvfs {
 		states = <1300000 0x1
 			  1400000 0x0>;
 	};
+
+	touch_3v3_regulator: regulator-touch-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "touch_3v3_supply";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
 };
 
 &clks {
@@ -44,6 +53,21 @@ &clks {
 	assigned-clock-rates = <786432000>;
 };
 
+&cpu0 {
+	arm-supply = <&reg_arm>;
+	soc-supply = <&reg_soc>;
+};
+
+&i2c2 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c2>;
+	pinctrl-1 = <&pinctrl_i2c2_gpio>;
+	scl-gpios = <&gpio4 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio4 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+};
+
 &iomuxc {
 	pinctrl_i2c1: i2c1grp {
 		fsl,pins = <
@@ -52,6 +76,20 @@ MX6UL_PAD_CSI_MCLK__I2C1_SDA		0x4001b8b0
 		>;
 	};
 
+	pinctrl_i2c2: i2c2-grp {
+		fsl,pins = <
+			MX6UL_PAD_CSI_HSYNC__I2C2_SCL		0x4001b8b0
+			MX6UL_PAD_CSI_VSYNC__I2C2_SDA		0x4001b8b0
+		>;
+	};
+
+	pinctrl_i2c2_gpio: i2c2-gpio-grp {
+		fsl,pins = <
+			MX6UL_PAD_CSI_HSYNC__GPIO4_IO20		0x1b0b0
+			MX6UL_PAD_CSI_VSYNC__GPIO4_IO19		0x1b0b0
+		>;
+	};
+
 	pinctrl_tsc: tscgrp {
 		fsl,pins = <
 			MX6UL_PAD_GPIO1_IO01__GPIO1_IO01	0xb0
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
index feea24c0e068..2936081749fb 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
@@ -4,6 +4,7 @@
  *
  * Copyright 2019 Variscite Ltd.
  * Copyright 2025 Bootlin
+ * Copyright (C) 2026 Variscite Ltd.
  */
 
 /dts-v1/;
@@ -16,6 +17,11 @@ / {
 	compatible = "variscite,var-som-imx6ul", "fsl,imx6ul";
 };
 
+&adc1 {
+	vref-supply = <&touch_3v3_regulator>;
+	status = "okay";
+};
+
 &iomuxc {
 	pinctrl_brcm_bt: brcm-bt-grp {
 		fsl,pins = <
@@ -35,4 +41,11 @@ pinctrl_enet1_gpio: enet1-gpiogrp {
 			MX6UL_PAD_SNVS_TAMPER0__GPIO5_IO00	0x1b0b0 /* fec1 reset */
 		>;
 	};
+
+	pinctrl_wifi: wifi-grp {
+		fsl,pins = <
+			MX6UL_PAD_SNVS_TAMPER2__GPIO5_IO02	0x1b0b0
+			MX6UL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x03029
+		>;
+	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart.dtsi
new file mode 100644
index 000000000000..4f8d570f5fe0
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart.dtsi
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common dtsi for Variscite DART-6ULL
+ *
+ * Link: https://variscite.com/system-on-module-som/i-mx-6/i-mx-6ul/dart-6ul/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+#include "imx6ul-imx6ull-var-dart.dtsi"
+
+&adc1 {
+	vref-supply = <&touch_3v3_regulator>;
+	status = "okay";
+};
+
+&iomuxc_snvs {
+	pinctrl_brcm_bt: brcm-bt-grp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER4__GPIO5_IO04	0x1b0b0 /* BT_REG_ON */
+		>;
+	};
+
+	pinctrl_brcm_wifi: brcm-wifi-grp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER2__GPIO5_IO02	0x1b0b0 /* WL_PWR */
+			MX6ULL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x1b0b0 /* WL_REG_ON */
+		>;
+	};
+
+	pinctrl_enet1_gpio: enet1-gpio-grp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER0__GPIO5_IO00	0x1b0b0
+		>;
+	};
+
+	pinctrl_wifi: wifi-grp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER2__GPIO5_IO02	0x1b0b0
+			MX6ULL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x03029
+		>;
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi
index f120b1dca75c..ac41ffd353f6 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi
@@ -4,6 +4,7 @@
  *
  * Copyright 2019-2024 Variscite Ltd.
  * Copyright 2026 Dimonoff
+ * Copyright (C) 2026 Variscite Ltd.
  */
 
 #include "imx6ull.dtsi"
@@ -14,7 +15,12 @@ / {
 	compatible = "variscite,var-som-imx6ull", "fsl,imx6ull";
 };
 
-&iomuxc {
+&adc1 {
+	vref-supply = <&touch_3v3_regulator>;
+	status = "okay";
+};
+
+&iomuxc_snvs {
 	pinctrl_brcm_bt: brcm-bt-grp {
 		fsl,pins = <
 			MX6ULL_PAD_SNVS_TAMPER4__GPIO5_IO04	0x1b0b0	/* BT_REG_ON (BT_EN) */
@@ -33,4 +39,11 @@ pinctrl_enet1_gpio: enet1-gpiogrp {
 			MX6ULL_PAD_SNVS_TAMPER0__GPIO5_IO00	0x1b0b0 /* fec1 reset */
 		>;
 	};
+
+	pinctrl_wifi: wifi-grp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER2__GPIO5_IO02	0x1b0b0
+			MX6ULL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x03029
+		>;
+	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart.dtsi
new file mode 100644
index 000000000000..b6a3518a3769
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart.dtsi
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common dtsi for Variscite DART-6ULZ
+ *
+ * Link: https://variscite.com/system-on-module-som/i-mx-6/i-mx-6ul/dart-6ul/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+#include "imx6ul-imx6ull-var-dart.dtsi"
+
+&fec1 {
+	status = "disabled";
+};
+
+&pxp {
+	status = "disabled";
+};
+
+&tsc {
+	status = "disabled";
+};
+
+&iomuxc_snvs {
+	pinctrl_brcm_bt: brcm-bt-grp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER4__GPIO5_IO04	0x1b0b0 /* BT_REG_ON */
+		>;
+	};
+
+	pinctrl_brcm_wifi: brcm-wifi-grp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER2__GPIO5_IO02	0x1b0b0 /* WL_PWR */
+			MX6ULL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x1b0b0 /* WL_REG_ON */
+		>;
+	};
+
+	pinctrl_enet1_gpio: enet1-gpio-grp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER0__GPIO5_IO00	0x1b0b0
+		>;
+	};
+
+	pinctrl_wifi: wifi-grp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER2__GPIO5_IO02	0x1b0b0
+			MX6ULL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x03029
+		>;
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som.dtsi
new file mode 100644
index 000000000000..01087cfd504a
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som.dtsi
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common dtsi for Variscite VAR-SOM-6ULZ
+ *
+ * Link: https://variscite.com/system-on-module-som/i-mx-6/i-mx-6ul/var-som-6ul/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+#include "imx6ul-var-som-common.dtsi"
+
+&fec1 {
+	status = "disabled";
+};
+
+&pxp {
+	status = "disabled";
+};
+
+&tsc {
+	status = "disabled";
+};
+
+&iomuxc_snvs {
+	pinctrl_brcm_bt: brcm-bt-grp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER4__GPIO5_IO04	0x1b0b0 /* BT_REG_ON */
+		>;
+	};
+
+	pinctrl_brcm_wifi: brcm-wifi-grp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER2__GPIO5_IO02	0x1b0b0 /* WL_PWR */
+			MX6ULL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x1b0b0 /* WL_REG_ON */
+		>;
+	};
+
+	pinctrl_enet1_gpio: enet1-gpio-grp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER0__GPIO5_IO00	0x1b0b0
+		>;
+	};
+
+	pinctrl_wifi: wifi-grp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER2__GPIO5_IO02	0x1b0b0
+			MX6ULL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x03029
+		>;
+	};
+};
-- 
2.47.3

