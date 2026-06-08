Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84B63CF21B
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 10:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913397; cv=none; b=KW9IomIAXDBcgK8vQ+07YuEbNSkbtalPyQWr7wLRelR6mqgZS1i+S/Qs6x27voPaxekI3oWQI/WwueK29i36h8WSAEBoqhxBzC4hiLvzB9mQymy/OiGX8jIpsRo/3PbEONQ+Tp2vSsNq1PqmhbgPMo2PwLbhYAyYL85leX1pRHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913397; c=relaxed/simple;
	bh=a7g87jezxjhzlogqQlFoiz7UOw1n6QOOw9H1s+yqYYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a3u07AhJALwBCu6AYrWfQuXicXo4ZzLdhmMYMD/nUJf32qISWdIrbeuYFpt9jgvn47U0bJyG/I+kEkZFd3p9Xnj/X1gJH3k9VqS8QCtHaN/dEBkVpjl1VYo74P4/X6U4RTTXD3iTMA/OH3Uf8XwGABENwTqtID5kTWb0+szjltk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDNezqVv; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDNezqVv"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45eeba68948so2856325f8f.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 03:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913392; x=1781518192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ROhWAzt0nmjg7jEU5/oWSczs/XecwX3hU3s4az+MIks=;
        b=HDNezqVveC8Ob9UdtORICeA5sFO0KNn6a8iDCWZuxTlzLx8083vXvYscnioa7PSoSX
         juDcOL74QuSFLwgoEZ/QPHcju8XUt/Bt+0ZsC0D4ge2BsmcNmDFuvvn13I4ToV+bliuZ
         jcJz9XhgxBfq9EJtGarkp6XvfWCuSPKQPSlA0Kj6hTn5/8y+CZDw7lZb5cN+lZU4jJUT
         ArQFyCA8NVrlia1Cd34Ko2D8TL+cs3DV007QotYyCjQvD+/hXITtK8Da9yA3tfN4WTjY
         7hcwl7TyhhAMqVe28EvErGuECGIxJ0CZegLgQhpj1ltzNsdoSCMtpd47HWxojC1Npnfa
         J3fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913392; x=1781518192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ROhWAzt0nmjg7jEU5/oWSczs/XecwX3hU3s4az+MIks=;
        b=hjU+MQ+/5pPRzZBl7kjq2cXIdZ3mbp4pdY9eiHsGc6zgTQfE10U5BFEkiFvPeV5DfQ
         NH9BKUWwoqqxfXsQD3m2Ff0F0pAU5lLOI01J8/xuuSOk88sryfnGOdffUYT1emdE891b
         orm9bik+sNGOOtAQLH6/+UK7x3oDa7b4DKbLo5vEXC5QHSKPfMO3hV7l+X3TeUpa0RYg
         hF+DTE+wTzuLFLAjqrJk+vRpnFfF/vRwkXv6X3m2COIDvbw9QGE0yAd42/+lN4sPXKJv
         XOJV4M1mYU4ltpPnASlM4EeW1i3ctehuRw8IbJm4VZrXtYEl9VI+fRsPwKrqoCGoeAZ4
         P3HA==
X-Forwarded-Encrypted: i=1; AFNElJ8/dgScPKtdfYmaAhn7H4fXiW2bUyMg+7CtvdDyA1FXoCsB8agDN8G3k7llgE+hgAf7TUKQlPWxTaoL@vger.kernel.org
X-Gm-Message-State: AOJu0YxDf1vZCTTrl9Z9Q6Zb6DtUzKuTQa9bvtiQS3Wrl1u6aE8haf7U
	ESzLek+5zToeeiiohUT0T/1qMIiBViZI+MHbsLBDcJ56ILdwRqNa3x9j
X-Gm-Gg: Acq92OENOKfbQKV98NrZTGSd8aa2VPsLDXbegxOW6A6PqrO01JAELR8oHoOpEuqThzP
	9HYSEL45mDa6hFnAlfttfYXwfSLg/Z2b3zxNYmcNzuZ6qtrUDrjwUCF7YmuzbYuOI/Xl3CDwF5G
	6EJBdG6gmnq3tHfsXCXRaP9cLYtwlut+GU+eAMrWNFvuit00ReJA8P+Y81F45C6jsevOn+PMgRx
	OkrUEgSXoA6u3BO8Qnr+aoi48e759VBIvGnUhAy8IaywbNvp7F+6jKfT76yiaxbsdxR4XZl5tbH
	FBEvaB37Io4+cTSpjN+BGVAElDld7K5C5TAtqkfuc2dClnf3chffIxI93X3XzTdiHCFWpay5wtD
	P3Oha7LV+UpsGbCbZ7fSErJ6mvWvcUHnm++DsRGv0KQ26rdwYYi6hNnKv8r4DqKsg2uaRUGl0Ip
	NOQ/UfvM+rPF7ygIMhN8zKVHQkfYtJm+UTaLKYjL7NeziwOmRiotN1CuPj2SwNKo+3FYT8zpfsf
	GSxtWqbGipeM78Gi3mY0xZSDkiQ+qQ2KmqkPjeVDWhCMlJi
X-Received: by 2002:adf:fa89:0:b0:453:e3a1:6580 with SMTP id ffacd0b85a97d-46030501f74mr15797982f8f.25.1780913392055;
        Mon, 08 Jun 2026 03:09:52 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm39503219f8f.32.2026.06.08.03.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:09:51 -0700 (PDT)
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
Subject: [PATCH v4 13/14] arm64: dts: imx8mp-var-som-symphony: add second Ethernet port
Date: Mon,  8 Jun 2026 12:09:31 +0200
Message-ID: <302638ba16d4684c5b0bf8660a42615dad67f3eb.1780912893.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780912893.git.stefano.r@variscite.com>
References: <cover.1780912893.git.stefano.r@variscite.com>
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
v3->v4:
 - Fixed eth regulator

v2->v3:
 - Add FEC controller and MaxLinear MXL86110 PHY support

 .../dts/freescale/imx8mp-var-som-symphony.dts | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 7ad57caa0f1c..c5a38018d494 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -66,6 +66,24 @@ pcie0_refclk: pcie0-refclk {
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
+	reg_phy_vddio: regulator-phy-vddio {
+		compatible = "regulator-fixed";
+		regulator-name = "vddio-1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		regulator-name = "VSD_3V3";
@@ -106,6 +124,33 @@ &ecspi2 {
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
@@ -363,6 +408,23 @@ MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13				0x12
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

