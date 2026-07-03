Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EA437AA74
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 08:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068380; cv=none; b=hZHddPbMoZ7fvgXvF1grNAZqzVDJNRUmS9TnT4CYRE5AKYumeWZmjSqXp5yxQ+s5hP8TjPj5aMh2BWgMyXtSBRi2av0gsWmQXuIHd9102MfX1PrORKHfdLlJDBNuDaxebcIPMaL5Idv289oaQSsTXJMdMWjYhMcvkJlxmiaX1go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068380; c=relaxed/simple;
	bh=2BoeXOBMFYutRmc774M9DXJgmuZvvwBP2X8Da0jYDkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eD19UgNytOEtAB26VO2BjkpZ+CFCXH4BSZo/mbOMWkWrrC8ZeNMQtUPsi3MEsT72aJWq5ngMyVvx0by5eFT4thH41OfvJvxil7+bEjmF/M0jNKctUy86TUUeqpgXEHa1RAkD7ReMnAAiz8qY7CxMMhXQ2mWEDUNYYgoUufUAvJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eTybU9P3; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eTybU9P3"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493ae59eca6so2098865e9.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 01:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068373; x=1783673173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/AjVJclaJ0GJ4iLGz88uBV5CsMMvomxW4ot054TBZvw=;
        b=eTybU9P32uBup6qazXU28VN9u4u3pfvavqnMq5svzxBgpLYWgnsc2EzKTFBlSBgdQ8
         +qoxVSr05d1cmCwatzpQI6RUtXW4e3k+anhzz2qWbCE/7ASMUWEoNOmRiOTIxIZ3vdYD
         A33Uj7AVv8uOwU16PIsMVdBYgJaSitB1CcPqIFmdk+S9ndMJJjzb2h9Z5ZLsb5DYqx+q
         H/jJHpG5QR9PnKZBhXhwOO3PrGxS5WN5M9MCK+VCBBa0/TdUSei+vIsaGctrE6Eli27Q
         Tw7HkkD6DPuQ00LaGd83QowX4imufT2+eYaXVw9Nh+j/bxDAzt2tRv9iBeU96cb5egs+
         LIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068373; x=1783673173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/AjVJclaJ0GJ4iLGz88uBV5CsMMvomxW4ot054TBZvw=;
        b=TD8DqgVuHewjaLe70wBDMY8gP6tVlHhAockwNydZvcekmL4u6fsGVgU6W3lQDGHBW3
         be6rpdJjo6kVj2Y2lSKdWtwliMedXU04ZaWy7WAfecFmcgUppGuxiqKwZzj0tlpUjhHc
         rWJ0ckrVcldN+kljL3f7uSYrUhF1tyKP69btuR1O77CnA/b3w+gnfU6gSHwesQhbg7Ht
         Y83UTr2fOx3kXSl+Uqq2vNGMvXZHLHAXirS7DjJZ44c9Y/8AaS3Oy5SmASg5WWHPeEZ3
         SabgK87lvMALZecIMd0FGKwQZzigb4foD5asWlQ+1YeZ6XuGX/OWp53UOb+ihcr32JCM
         NE5Q==
X-Forwarded-Encrypted: i=1; AFNElJ8kOPvmH5XSo1UIOT62bZSFweimLT8ci1plTovHQ8OgW8mamirugrY8dHhJVUu9qBx2wv6CluKcf4ZT@vger.kernel.org
X-Gm-Message-State: AOJu0YxJANdWqibkyz8QpJ1TgK/Upnietyfx+fuOxEtSPUmyYzFjVgCm
	UMcJz9hn1fVTmQNOmrjdstTJUEy+ey+IifeeVNpwQrO+9PMSY9zxq9Rz
X-Gm-Gg: AfdE7cl9rRRVAXB8eS+vnOAgbeQmnrjjyZoGJzeE08zNVfJjdzPaXMtqFgCRqFYhoOq
	COJPIyNqHbiyak8V2+mFv3JqQc+AlcZXar4R4C0grDwjwYEyDaJfboDNAwSq2CMunCFFOyGsGBE
	2Lq/VbvvCczGQqMjkQWVjaYD1xZX4WAt4cXXadyV1t/CyYioN/g6A0HMt3qA6EmtcssansZngE4
	z6AjaJ9eU9lkXvNnq9WVq2dbINB9+w13z/PV/f3ECxxfpUpZnBY22kduqR0td83sXXv708c4tzh
	HgTc+bBy+RrCUTqP8rvOq030r4hyFo0FEz3Kc507Dln8hUN56zM1pDCekKfKf+zjgexULsT8sM2
	BXBm0lHS//9V76E/bSn309FufP93miri+/2SWkTXTyc7HYrBm++WKMKmWYdm/NwGYHHbVptu0mB
	/Ganm4XeaRg/8bv5p1MJTEY4XusUiws2uvwfXcuUVpSEx/LqraIhQBJKfMoGZof0nJBU+l4KsPm
	k7d+PZuwka8H8oZYCzOVPcCgQ==
X-Received: by 2002:a05:600c:828d:b0:493:bf86:85c5 with SMTP id 5b1f17b1804b1-493c3df3495mr124709255e9.36.1783068373027;
        Fri, 03 Jul 2026 01:46:13 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cfb6f199sm6335505e9.3.2026.07.03.01.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:46:12 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v1 05/15] arm64: dts: freescale: imx8mn-var-som: Add support for WM8904 audio codec
Date: Fri,  3 Jul 2026 10:45:52 +0200
Message-ID: <126ae03f37ba587560ab8c94b7833236d97990de.1783067947.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783067947.git.stefano.r@variscite.com>
References: <cover.1783067947.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The VAR-SOM-MX8MN can integrate the WM8904, a high-performance
ultra-low-power stereo codec optimized for portable audio applications.

Add the WM8904 device to the appropriate I2C bus, enable the SAI
peripheral, and introduce the sound node to expose the sound card to the
system.

Add I3C recovery gpio properties.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx8mn-var-som.dtsi    | 98 ++++++++++++++++++-
 1 file changed, 95 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
index 09146ab76385..e2e04ad2fbb6 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
@@ -16,6 +16,14 @@ memory@40000000 {
 		reg = <0x0 0x40000000 0 0x40000000>;
 	};
 
+	reg_audio_supply: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "wm8904-supply";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
 	reg_eth_phy: regulator-eth-phy {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -42,6 +50,34 @@ reg_phy_vddio: regulator-phy-vddio {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-master = <&codec_dai>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&codec_dai>;
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,name = "wm8904-audio";
+		simple-audio-card,routing =
+			"Headphone Jack", "HPOUTL",
+			"Headphone Jack", "HPOUTR",
+			"IN2L", "Line In Jack",
+			"IN2R", "Line In Jack",
+			"IN1L", "Microphone Jack",
+			"IN1R", "Microphone Jack";
+		simple-audio-card,widgets =
+			"Microphone", "Microphone Jack",
+			"Headphone", "Headphone Jack",
+			"Line", "Line In Jack";
+
+		codec_dai: simple-audio-card,codec {
+			sound-dai = <&wm8904>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&sai5>;
+		};
+	};
 };
 
 &A53_0 {
@@ -246,18 +282,55 @@ eeprom_som: eeprom@52 {
 
 &i2c3 {
 	clock-frequency = <400000>;
-	pinctrl-names = "default";
+	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c3>;
+	pinctrl-1 = <&pinctrl_i2c3_gpio>;
+	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
-	/* TODO: configure audio, as of now just put a placeholder */
 	wm8904: codec@1a {
 		compatible = "wlf,wm8904";
 		reg = <0x1a>;
-		status = "disabled";
+		#sound-dai-cells = <0>;
+		clocks = <&clk IMX8MN_CLK_SAI5_ROOT>;
+		clock-names = "mclk";
+		AVDD-supply = <&ldo5_reg>;
+		CPVDD-supply = <&ldo5_reg>;
+		DBVDD-supply = <&reg_audio_supply>;
+		DCVDD-supply = <&ldo5_reg>;
+		MICVDD-supply = <&ldo5_reg>;
+		wlf,drc-cfg-names = "default", "peaklimiter", "tradition",
+				    "soft", "music";
+		/*
+		 * Config registers per name, respectively:
+		 * KNEE_IP = 0,   KNEE_OP = 0,     HI_COMP = 1,   LO_COMP = 1
+		 * KNEE_IP = -24, KNEE_OP = -6,    HI_COMP = 1/4, LO_COMP = 1
+		 * KNEE_IP = -42, KNEE_OP = -3,    HI_COMP = 0,   LO_COMP = 1
+		 * KNEE_IP = -45, KNEE_OP = -9,    HI_COMP = 1/8, LO_COMP = 1
+		 * KNEE_IP = -30, KNEE_OP = -10.5, HI_COMP = 1/4, LO_COMP = 1
+		 */
+		wlf,drc-cfg-regs = /bits/ 16 <0x01af 0x3248 0x0000 0x0000>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x0408>,
+				   /bits/ 16 <0x04af 0x324b 0x0028 0x0704>,
+				   /bits/ 16 <0x04af 0x324b 0x0018 0x078c>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x050e>;
+		/* GPIO1 = DMIC_CLK, don't touch others */
+		wlf,gpio-cfg = <0x0018>, <0xffff>, <0xffff>, <0xffff>;
 	};
 };
 
+&sai5 {
+	#sound-dai-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai5>;
+	assigned-clocks = <&clk IMX8MN_CLK_SAI5>;
+	assigned-clock-parents = <&clk IMX8MN_AUDIO_PLL1_OUT>;
+	assigned-clock-rates = <1536000>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
@@ -375,6 +448,13 @@ MX8MN_IOMUXC_I2C1_SDA_I2C1_SDA			0x400001c3
 		>;
 	};
 
+	pinctrl_i2c3_gpio: i2c3gpiogrp {
+		fsl,pins = <
+			MX8MN_IOMUXC_I2C3_SCL_GPIO5_IO18		0x1c3
+			MX8MN_IOMUXC_I2C3_SDA_GPIO5_IO19		0x1c3
+		>;
+	};
+
 	pinctrl_i2c3: i2c3grp {
 		fsl,pins = <
 			MX8MN_IOMUXC_I2C3_SCL_I2C3_SCL			0x400001c3
@@ -400,6 +480,18 @@ MX8MN_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x1c0
 		>;
 	};
 
+	pinctrl_sai5: sai5grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SAI5_RXD1_SAI5_TX_SYNC		0xd6
+			MX8MN_IOMUXC_SAI5_RXFS_SAI5_RX_SYNC		0xd6
+			MX8MN_IOMUXC_SAI5_RXD3_SAI5_TX_DATA0		0xd6
+			MX8MN_IOMUXC_SAI5_RXD0_SAI5_RX_DATA0		0xd6
+			MX8MN_IOMUXC_SAI5_RXC_SAI5_RX_BCLK		0xd6
+			MX8MN_IOMUXC_SAI5_RXD2_SAI5_TX_BCLK		0xd6
+			MX8MN_IOMUXC_SAI5_MCLK_SAI5_MCLK		0xd6
+		>;
+	};
+
 	pinctrl_uart2: uart2grp {
 		fsl,pins = <
 			MX8MN_IOMUXC_SAI3_TXFS_UART2_DCE_RX		0x140
-- 
2.47.3

