Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F9042A150
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330504; cv=none; b=Oa8SvdBBh9zFApmQhOA0bOY61rOGBzJsHMekJM+oGt0ckT/RM7SY9MW6obmsrG+7ZgZqqAnauXWwkUysOFpntZfYcELtwIW7ojvO1Mi+C1gXeJeNeaXir9kWu6B2AF3DhwBhKyTOLpr+IV8eMcXQ6UkrJydv1kCjHIlKiGpoBfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330504; c=relaxed/simple;
	bh=2WLpuBc/ObZMdsxva51SzL8lzN0MxES9k4ot0lwT4rE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DTqNNhXvl2Zg91NtISav7ygtjWnxTCdVALaaUpSU34iWl1Fmd7hZ2wNDnH15xEVlRz72D2XSuv1izs5fg8XFClTLqOdLLlEcA2iveBqxuNPMP4et5jHW2mvD4P88fMOccogviHRBRcxgEa4X0YEObQgWx3gUEvm8gb2NBdCPumE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gsq/w6Nf; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gsq/w6Nf"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493b27c7451so34207515e9.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330497; x=1783935297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1E6upsvne5jwrnGnndBKXWLBOzbDPqaqq+E/51rCoP8=;
        b=gsq/w6NfYkzktytGYClCndE1Qy+odcjeOlOSmityilCWn2Ky8GvMP0e2ECfoxDzSQ+
         RkvS9SD7xmcvkMnmiHVDp8Gdbk46nWpWzqat95zzQqpIRvOqEbhzM9mmR10S8diEDhzl
         Om953/liV+BBlPshDFJRZ+G5SZqlbiFSbJrNgDI+W00CDA/XlajIWSpBiATpnZgC3dLc
         CHOvluk/pHuzFOTLVdrbr43QfnhaTy0dt+1SicTEDrw7tYlO+ZhmhOIwHcVjEPq35M6Q
         NzVamUlYCh62qqlsxEFYH6qsQOf+QW8tbgcuIvUQurCxdIhy96lyDH9fQ4ewyt3p4UKc
         bWbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330497; x=1783935297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1E6upsvne5jwrnGnndBKXWLBOzbDPqaqq+E/51rCoP8=;
        b=K+FKk/w8Vexoz6sXZo0Hyg4ixtW8yLnVhzFOd2ob2wdsjCaurQA6dr+kryJo7ptmof
         2b8/1nCcfnM78YKM1AB6obm74bQ7lP3KInvRq4aaYx46+NlF7pGQF0362qm+GaI08z1/
         +PnbX9rybO92kwPUUXhnyBUVnbe8sPjXI+sceFL1OhV+q0FFFU+2ji0RJTUigycQMPk4
         BuwMWpYmBBIgOPr65V8m7vWJdbNfptsdBwgQvxGmznJYksZKKs3RIng3rPozFHpSJBvt
         A2F/KgSNX1IKEsoNXNpZjt6EZGWJloDKUnu3TdGbJOds8ZYSbiTPkpgU/XwLSjbE4DoN
         rnXA==
X-Forwarded-Encrypted: i=1; AHgh+RoAflbyYVJ9e5dba9M9MxgpP378zdFZypTQy8jubgbgM5v1CzbRnUm/tV69xuhhRM3aaeDNTcuNpmcD@vger.kernel.org
X-Gm-Message-State: AOJu0YwgvDRb2LGE/Y2GshYjWvtK43NbnfgvcaLZBsV1iibjderfxbh5
	j3UvWMULJADj2q808HlNVn3DaXAIs2JnP5XKSM38ZOM8lDtb3kB5Kx4k
X-Gm-Gg: AfdE7cmRrMme8jRuzMeI5B90E9WpIyfhORUreYKhvmXcAH9DRAz8dNd8ZXN2ZnMBsy7
	Fm4HpMoidM+dx+ijwDS9kKCQTkDuIXmyyD0kbbUBY/lF2U2OfQjdUkL0SVr3Aj0KF0Zr3UhSw2R
	eb5WrDEvoKuSNTtbo4OUwPdS+Dbz6seaQkLoVnJqMv7Zl3++ScrGp8UDaOh3iwwWfLumwBUFboR
	I9iUWuYm872vUZbynYfr2D1AAjKboqOR9tAckxUjeMRCewAGZpVE25oj2WwxcirTd+eZqybv5jX
	9oTWME1J+HNADg87Kei37eZ6r3l1kF21KSlMvhMISnfPOhWVmsyPNkJT8XMynmpUUUs2omkwlOs
	/BRr5ydF0Oi2idBWy+PEZMk8PVvBYmIGAjaxI2pw1KqlnsznvYzzE96grEVlvnrhydSLywWEjzp
	USCzD7nbyM9WnmKQp3752XNm72qzMvdqb6m5dF8r7303l90UK93fw9U5anmB+f8jWW5OLjZde59
	uiFWRg16w4Xp0XQGeG2dOE1iQ==
X-Received: by 2002:a05:600c:8a1a:10b0:493:d117:18a8 with SMTP id 5b1f17b1804b1-493d149a38amr69499795e9.9.1783330496583;
        Mon, 06 Jul 2026 02:34:56 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm314379715e9.5.2026.07.06.02.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:34:56 -0700 (PDT)
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
Subject: [PATCH v2 05/15] arm64: dts: freescale: imx8mn-var-som: Add support for WM8904 audio codec
Date: Mon,  6 Jul 2026 11:34:35 +0200
Message-ID: <4487a350b0e4667816c3fe62e9fd6df2696c18cf.1783330236.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783330236.git.stefano.r@variscite.com>
References: <cover.1783330236.git.stefano.r@variscite.com>
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

Add I2C3 recovery gpio properties.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Fixed I3C to I2C3 in commit message

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

