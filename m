Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136BE3DD870
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 14:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929700; cv=none; b=MNtFCcijpW883rCZuKIXAKzc8yB2dQE6Hs9zZaWP+1rokPx5vXji4G07mBZQmQOtpYLuBfhII79GqSQbMBv/LoFmoGMrSkgh7DXiTYGPFz5soOv5aYVO/D0yJMLcY5ZiC4gM8g3rSBv1AvpfxWnek8TrXXoMTsmL8UEhzJsIxj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929700; c=relaxed/simple;
	bh=YQ3Ts2N7Y7C9SSwL8dwogmxLISVQdcuieA6twL626d4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dUGjo2nEVY+IRmIq0uVfgcYdX+0PlIMMUbE9Kazgqgga7jAssGXKes2khQ+EskLvPwmcKszDppkD7RCFfMYA4NGIXM+iFf549c3AQee50r/1RCj3s2TX/9JbTIwuH1yOdItK1AT0rVglI2LbpPrnkY7W0m6sz6pnXBv5NEoh8AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VlJvzAtj; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VlJvzAtj"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so10348555e9.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 07:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780929697; x=1781534497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zgF2+FSMMZyB7xSc2hmicWFUfptsUmJ1dBy4jYz3nPg=;
        b=VlJvzAtj1NHh8AOcLGr4Tqhm2DyLNHz1fuHv2Z2I9Go5X2rcUXM/jv91mPXWdb7eJI
         jWLAI3IeJNdDxYsHTRtzd5OdYp96rosrgFiGXXYXLZacLtnN2S3xI+2ciArVQulqUWKn
         QULSrZG77HNHaWgiyf+S9cItAxfhkS5dmw/hZTkfn9HGYdkgTPrIr0MIGTlFpkuLawYI
         3w4m7QwcMYl3ovWOhfP64f7p9vEhXH+/SHHU5AExw/mixhv4QQf0ZVcaX0AJz9woJDEi
         ThvMrMB57ts0LdRCLQR6nIZ7/QMWrNIuW4Ajr2eZcXs9Jo3oLATPmaJEAx7AZUpld+58
         xYRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929697; x=1781534497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zgF2+FSMMZyB7xSc2hmicWFUfptsUmJ1dBy4jYz3nPg=;
        b=kFPNFPWuWt0kJTfASHwhAEkf3826d2/GXuqXmlvKQbpUrl1hBv/lfdUswjs/F83dST
         486UTFU9hRBeF9Mi8n2UL5A4LYdYYzwZvNN26stbBDW4Pw/MFnio1lMd90i6yRMDNlq0
         BdOScbHlAeksJ5emCxZToK58zFtopJwAW9+SYJvqHDlAYJAPVlNs9bJfy4AAxgensEKK
         1eraaaBmFbfv2JodYQYHyKvII8YuhhL7im9pQWxA26oSyLTPyX9J6KB/PLzubsZBB12B
         RGE3ULX603d89t6SspUbd9mvo6kzKi76Bzg4iRtIafOvDEpjHKWd4FqQ48PMudf4+Ne2
         8I7A==
X-Forwarded-Encrypted: i=1; AFNElJ+qP8yCDmqk7AkFEaqqdH5hxTroPyxnkZgsKpK6HS4Dkiwi5W+zQUDD8vBCx7t9AF4/uS3uRFJST2kG@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq6f36JhPAvdy+1PEN619XKeMsWBeUS3LAFLdUZDTXdnAOECNI
	BZ2P/Wg1915gCac9mSJjO7/uOmLyfq5FlnyqbozF5Xckhcwfl+6TH2WJ
X-Gm-Gg: Acq92OFk4ZL2flNCuHTwWjAvXV155rU5pjKnYzldJ1DmLLc8rY8GLmGt0eOtKlui7G7
	iGsfXbluJsAa5Xe0zHrPy+dFcepps/5Rtxen9IVjvAubxgTSO/HQr6uwwqeattOafjtSmJUzuQo
	pVDJfkdSVLBW41sJ/NvOshtoR1tVlRBfb/wMmfOeGw/xqmNKgminsd7UIj+/TnnwxwIsz96vPGQ
	Nwa6IIh9qzvcVBpKfhvganS148O2l9o6svgTT2C2X2/JUed+wSMYgVF20piBgOaKEUEhN4LFpAT
	ue35AzvLptfw30s2TOAk9Ihq/M8fJVd38e5/rvyi03Zy0GK8Ybb1HyrGv7cfkhV84ywmSN75dnE
	JMLdoZo7S7429ATWkAtBqYSIdWIdTf9a+2YwBkHutoWwhdoXPR/kYePvTorlKecV5EzumcDrnIl
	kBznyncwkcqk2wfCfyiL7Au+p2okBxJj3wZSfPS8Qznd4cbCU9PUnSiPzAgdCHGXZCtfL6ljkBx
	tdHfGU+OC8+TwbssmwM3CqDN5TLMTyVixtkTzLTtvV1MSkQ
X-Received: by 2002:a05:600c:6087:b0:48a:8b02:ae91 with SMTP id 5b1f17b1804b1-490c25b0231mr276473505e9.11.1780929696365;
        Mon, 08 Jun 2026 07:41:36 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm58222519f8f.5.2026.06.08.07.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:41:36 -0700 (PDT)
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
Subject: [PATCH v5 13/14] arm64: dts: imx8mp-var-som-symphony: add second Ethernet port
Date: Mon,  8 Jun 2026 16:41:14 +0200
Message-ID: <7bcfeb748665154245f5dc3294b82ab79d96e4a1.1780929317.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780929317.git.stefano.r@variscite.com>
References: <cover.1780929317.git.stefano.r@variscite.com>
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
v4->v5:
 - Remove regulator-always-on and duplicated vddio node

v3->v4:
 - Fixed eth regulator

v2->v3:
 - Add FEC controller and MaxLinear MXL86110 PHY support

 .../dts/freescale/imx8mp-var-som-symphony.dts | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 93dee9ec0b9b..e928a3d44b1d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -66,6 +66,16 @@ pcie0_refclk: pcie0-refclk {
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
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		regulator-name = "VSD_3V3";
@@ -106,6 +116,33 @@ &ecspi2 {
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
+			vddio-supply = <&reg_phy_vddio>;
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
@@ -363,6 +400,23 @@ MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13				0x12
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

