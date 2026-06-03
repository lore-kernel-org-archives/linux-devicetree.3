Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B5148C3F4
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 14:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497464; cv=none; b=poGLLBwxSZed/5ZeKgu5SVtXg2WKnOkw+Q7i50GTUdgGJCI61fGBRtZSJXtzdOwleHE/konyslOErZ6XOU81EdfWce/n/oYHRy0i9MmyTRdEzvFPy2v3pD4yD7/Brk3Vk52S2aPSE62Zt57J/z7QRBaBqF5E7/qx5LVxn7++SVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497464; c=relaxed/simple;
	bh=pDzCEscj5cctTzxLkpLvzHprZz8vBZKDi4msIQyCjdg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UZyL5IAa8do2VUlzCfSdGp9hHx8NsNzF/hBFwXBE7a46QNkBhOMT/DZur91rlfk+j/61aVzXw8k/yp1jAYac7NrXVOx5gVGmrBxzgRiXx7qI+J07/QyCWjWq+qX/0irzL/0f/5WiK7TU3GzDue2+J49vaJlPdPdqutFkJqJgwJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LzPmqIU1; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LzPmqIU1"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so129348915e9.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 07:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497461; x=1781102261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QlBKUGuvfMnGfuiypEqikRO1coECNduxCotAtZXGnIg=;
        b=LzPmqIU1KPLDs5yJkWk9U4ROoZEMSDtA26JDqQsragKJT8JAsyPlKt6c+0bYFTdpPh
         hum6WG0kp1oPv6mSW/gYhZB3fwj6tVNLlME5TonNtTROF2ml8aoa/GFy6IEOQeq0Woxf
         RS3BqG8VjkRxkwgPNOT0iLPgILau8YcPH1wyvspWm45Nn4T34EJgDpx4CYR/aIgT2Gjb
         045BFfuuPjcUv64sb+3zOlXnc/XLqKxNyccZipj2Gei883HDp3fH4Pw38pIkjYCRG4cR
         MOL2ZPJhtG0x+2XfaXuB71WdaolZ3AmE75+humgmp/ijksVXp74FSBubMJEi7QBKPT3n
         8LLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497461; x=1781102261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QlBKUGuvfMnGfuiypEqikRO1coECNduxCotAtZXGnIg=;
        b=oSAzQ04s/MLhtHB6k9kPOCi8Nd+55lfBUXkymoBMmlflzI53/j3JzIvUjLANsIWGXl
         caq2hJL5mfdbycYsiOvrsDc1Pu32iL0jeHj1DvbAvUN0PwfOZzeN9s3Q6GfkdxFXJey6
         lz5iP/QH8dm6kZM/54DJXjnlNUNemP5whM4zciSBKnWslzo9/j7Pd7VR47rDA6UFQueD
         PmisrjCn6brbh0xGjFjFx1sJRMUnN8fwZ/Ui/F2aMeO7D5jg3bIT5Vz84X5f3UE3a+7a
         111nw0ViYepKVbj3p4fnJMD0CxAwifamBnyTwDyDOI2XcI+U7i/FAO+bHXjDplLnS9ys
         i7Lg==
X-Forwarded-Encrypted: i=1; AFNElJ9rYKr8/7wjsXZWaF2EuSksxvS99dsnedouYDtnQ1QxHprTT88ElZslvXD0NViqsI30ue7i3+2w/+K7@vger.kernel.org
X-Gm-Message-State: AOJu0YyPYpnuA2f6HaZFOsJBg9Zuutrz2KbFT4v+gdXfxzvt9sK3tUEA
	AzJXi5dLUm1W8xVOOhEaEsWdoY1yAahjvUOMpnHZzw957hQOlDnCs3Fc
X-Gm-Gg: Acq92OGkxocmtelFTlj3xeQc64ZYzL2Jf9DrDHZfEH9/K1l4jBp+IIt/12CSB2bx1sw
	3NhnXU+Sp7RWj2iW+JEDpL5/Zd447EUChg3QbjBAR/Q0RB0dlqE/OjTiqTUUTmpbL8Pcbsk8r6Y
	ZpfCQKwLDj+meg435bNzFi2KX39Op0Mag+wo69UctbKG9qqh6yRFe1V5oTjT02+xt5jBSlVx43j
	RVAD2tGbVE8zSMsaPkRWOsM+6+LA8yUfGaHR4LLimYYXPXQC0xfvzX2gO0S43HtJP50d2QewjAy
	sd/llXjSwHZUrLOily/35BdfNaYhSlkCVR8U76RIIxHVQCLuUeLKqddwm1XcmakgGWLnhrk7Aoq
	wUW4qg93n05Bujst1jqdki1sFYRpskCFaqQvndOTUKojEDr4tvVFFKV5M+kUiXq9UnB+8UyjeOy
	JarWQG6A7JBc6LKjLvbwzho3AiMci87HCKMXiUzSZXEu5gSv7AQGMvIzjYWNnXNmOFnUdkBOxqK
	oLgkISzADoTJe0WpDZMCD7ZW7S0C0lXqvCEmdCP05BK1Hmp
X-Received: by 2002:a05:600c:4f44:b0:490:b26f:a512 with SMTP id 5b1f17b1804b1-490b5acf6d2mr67166455e9.0.1780497460679;
        Wed, 03 Jun 2026 07:37:40 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6150bfcsm120267855e9.3.2026.06.03.07.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:37:40 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 13/14] arm64: dts: imx8mp-var-som-symphony: add second Ethernet port
Date: Wed,  3 Jun 2026 16:37:20 +0200
Message-ID: <57b48c65ec479641f3714292fc691ec8b70aa669.1780497188.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780497188.git.stefano.r@variscite.com>
References: <cover.1780497188.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add support for the second Ethernet interface available on the Symphony
carrier board.

Enable the FEC controller, add the MaxLinear MXL86110 Gigabit Ethernet
PHY on the MDIO bus, describe its reset and power configuration, and add
the required RGMII pinctrl settings.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - Add FEC controller and MaxLinear MXL86110 PHY support

 .../dts/freescale/imx8mp-var-som-symphony.dts | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 6b2aaf6bae07..f4926ce0aec7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -66,6 +66,17 @@ pcie0_refclk: pcie0-refclk {
 		clock-frequency = <100000000>;
 	};
 
+	reg_fec_phy: regulator-fec-phy {
+		compatible = "regulator-fixed";
+		regulator-name = "fec-phy";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-enable-ramp-delay = <20000>;
+		gpio = <&pca9534 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		regulator-name = "VSD_3V3";
@@ -106,6 +117,38 @@ &ecspi2 {
 	status = "okay";
 };
 
+&eqos {
+	mdio {
+		ethphy1: ethernet-phy@5 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <5>;
+			reset-gpios = <&pca9534 5 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <20000>;
+			vddio-supply = <&vddio1>;
+
+			vddio1: vddio-regulator {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+		};
+	};
+};
+
+&fec {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fec>;
+	/*
+	 * The required RGMII TX and RX 2ns delays are implemented directly
+	 * in hardware via passive delay elements on the SOM PCB.
+	 * No delay configuration is needed in software via PHY driver.
+	 */
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy1>;
+	phy-supply = <&reg_fec_phy>;
+	status = "okay";
+};
+
 &flexcan2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_flexcan2>;
@@ -363,6 +406,23 @@ MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13				0x12
 		>;
 	};
 
+	pinctrl_fec: fecgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_RXD4__ENET1_RGMII_RD0				0x90
+			MX8MP_IOMUXC_SAI1_RXD5__ENET1_RGMII_RD1				0x90
+			MX8MP_IOMUXC_SAI1_RXD6__ENET1_RGMII_RD2				0x90
+			MX8MP_IOMUXC_SAI1_RXD7__ENET1_RGMII_RD3				0x90
+			MX8MP_IOMUXC_SAI1_TXC__ENET1_RGMII_RXC				0x90
+			MX8MP_IOMUXC_SAI1_TXFS__ENET1_RGMII_RX_CTL			0x90
+			MX8MP_IOMUXC_SAI1_TXD0__ENET1_RGMII_TD0				0x00
+			MX8MP_IOMUXC_SAI1_TXD1__ENET1_RGMII_TD1				0x00
+			MX8MP_IOMUXC_SAI1_TXD2__ENET1_RGMII_TD2				0x00
+			MX8MP_IOMUXC_SAI1_TXD3__ENET1_RGMII_TD3				0x00
+			MX8MP_IOMUXC_SAI1_TXD4__ENET1_RGMII_TX_CTL			0x00
+			MX8MP_IOMUXC_SAI1_TXD5__ENET1_RGMII_TXC				0x00
+		>;
+	};
+
 	pinctrl_flexcan2: flexcan2grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_UART3_RXD__CAN2_TX					0x154
-- 
2.47.3

