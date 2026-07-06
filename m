Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A66B42253F
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330504; cv=none; b=FpOKgQOeYCU4jmWIOyIrjj/o/p6huFPrFLZuZ6Y1XHTRS36cOZhYZdHxo9L5JJK+aIZ9o/pWpCSUGYlSMESLbUJWpKAGoZB4ov97WRXU/tTIjiOf13yx6vidyYVy0qx+DPVHHR3wnoEkDoNlap/0B4lfF05gG42G4y0V+SVkaAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330504; c=relaxed/simple;
	bh=NX34dqGyV75T5hg1xrnFDf9YiMGGtsH5OyQYePQX794=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rh7jrfaPIaW06+6myjywrNoDXDJuR4sznrnnSZswbvV10nCmq1cUtnKMgWMstrhvEuKUK+xJwWNjquaLHoZp1XoXEPPhwwPupLDBAXc1+Ufx7L7BdoArawyg62on7P1VCL+4ACbxh6MicGps0H16tBvTqEr6quQyNzkfcU7bQl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pa6lvmDt; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pa6lvmDt"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493ae59eca6so20132865e9.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330495; x=1783935295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wcLdsxNIFOZhQkIiIBWMcl6LlY0cWDmbztEcoRQjzXg=;
        b=Pa6lvmDtR6iRpnDdqVrUUVwYMsIi6puc42JwJC98KlQwapa3EKgP+RDaXmOGx+6xR7
         9kFo7TwuKyOau6N5xBpJ1SPLcqk90/txTr4q2x2StPXh9t6wUY+eAMZUATa4vSv2UPdk
         hHlGFd5pNzJ4GNIK0tgQLZ74n/3VfeTuQksJbg/IQFJbBbkdj/Eq574hsmLVKZZ7EzYa
         8mi9Z+dxnBHCZp8YixUS2imc3nmnk+iyp6EejaKY/3SkJ9b6IJu/iqSw7i+Gjbk8NUFx
         +7IyjgP7hF56F4iw15BN6bKfHZ8BySFS0wapzlAnpjBfrpExAYo0CQCeZGGQKRLoRwu4
         /Cww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330495; x=1783935295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wcLdsxNIFOZhQkIiIBWMcl6LlY0cWDmbztEcoRQjzXg=;
        b=QipyfOyahzhw29FdH+VYZYXZ32OrCjXlDCJSqHQ8WQd8VUj/wet0l7pl2dL6VcwSQR
         pVID3Ki2wDoWZo0o6SOiQI83DFNawECh3HmbxIBzmn8lGecnhcOVBVRKLRplg5yQCv25
         cW/klFWW4GPFIUmZl+Q1GHieQkeadfZePMXEvtVA5Pjur9KdJE9KCjgVm7vjIURMsHrA
         2uUNf+1+WN/5Sjt7CmTKS/dSgj3A+vBUxddYjV29ClYGONZrow06V5LMnPLe34rY7uEG
         wnq/GhLlOeD1jBr0hIYC1HEOcliGxjD3LBqJgU4Z+28eqxsY5XEBuNYvN0jZ1U+YB2mE
         Xy1w==
X-Forwarded-Encrypted: i=1; AHgh+Rrh9dgTYVhF47LiXkDjJNpncLI40At/dylPZMD+sAS8FTIyxPR70UT3XbyuajIE5tOOYYN1dW5x/5Ps@vger.kernel.org
X-Gm-Message-State: AOJu0YwqJpvUolVVy8BOElBTUR1K8g6wALeG6EyI80RQXfDm6KvCxLH6
	mP3scppkoTwXdVHXfzc2hfwtA8LY/w6QOc1/Ds7pQnOpfTKiOcy3cTDosPWHkg==
X-Gm-Gg: AfdE7cmlux8HqjcCePjGcQBohDdKXHmHiS1hDVNbwGzfWXA1P6iYTHFb7zk5RHsepNp
	lAl8px/Shh5eQzJzgyohMcDY2GeeYAbI5C6QD2htQR5VHLtrCCNftaz8tqwRuhATfNzNpiGO7+5
	U44309ggoMfq/s57aIygoaTrKEO5pQVi7xVAD6guU/VaX4x1wkaDmu0rawEAZyWOPl2qwLJ6GaD
	/qvWSywPbCXOwX8XQLw1Bob3dTxvEdM9Yzh1LZyzjuH5OKQ2uJ4ugj9dwFz+TKjA0R81H0PNyrq
	gWj8O03msFLkNbw2zFk8r+qrtpTiPt+Ba2hYKag2md05CxDSPACWv0c07X5sNu80k9YO6DJMdjm
	wb7ifK7Ddvk77yJDAp1yK9PXlOJCSkNKxiBLM2qxAj/sJpQUOF7Xswn9/gtSNvB4Cfu3vAPVKj6
	2geL98ywQTsTrp3Yui6GMjeBK3cwOswujIsRjoi8o17rFYu5QD38G7kJ2qV8NDTN5Zn/I2TFYEm
	9drfbq3iqYeyBONhKUcyTD54A==
X-Received: by 2002:a05:600c:a01:b0:493:bd2a:93bb with SMTP id 5b1f17b1804b1-493d11ced23mr113677845e9.3.1783330495380;
        Mon, 06 Jul 2026 02:34:55 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm314379715e9.5.2026.07.06.02.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:34:54 -0700 (PDT)
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
Subject: [PATCH v2 04/15] arm64: dts: freescale: imx8mn-var-som: Update FEC support with MaxLinear PHY
Date: Mon,  6 Jul 2026 11:34:34 +0200
Message-ID: <8fdacc1d5c213685db8552460d04c44e515e85ea.1783330236.git.stefano.r@variscite.com>
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

Update the FEC Ethernet controller on the i.MX8MN VAR-SOM to match the
latest SOM hardware revision using the integrated MaxLinear MXL86110 PHY.

Add the PHY VDDIO supply regulator and adjust reset timings.

The PHY LED signals originate on the SOM, but the actual LEDs are part
of the carrier implementation (RJ45 connector). Move the LED
configuration to the Symphony carrier device tree, matching the
evaluation board LED wiring.

Wake-on-LAN via magic packet is not supported at the VAR-SOM level and
is therefore not enabled in the SOM device tree nor in the official
evaluation carrier board configuration (symphony).
Designs requiring WoL support may enable it in their own carrier-specific
device trees if properly integrated at the hardware level.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Fixed commit message

 .../dts/freescale/imx8mn-var-som-symphony.dts | 20 ++++++++++++++++++-
 .../boot/dts/freescale/imx8mn-var-som.dtsi    | 20 ++++++++++---------
 2 files changed, 30 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index 7308613a48b2..520aff23e587 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -8,6 +8,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/usb/pd.h>
 #include "imx8mn-var-som.dtsi"
 
@@ -74,7 +75,24 @@ reg_per_3v3: regulator-peripheral-3v3 {
 };
 
 &ethphy {
-	reset-gpios = <&pca9534 5 GPIO_ACTIVE_HIGH>;
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_YELLOW>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+	};
 };
 
 &i2c2 {
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
index 71a2f0866822..09146ab76385 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
@@ -35,6 +35,13 @@ reg_3v3_fixed: regulator-3v3-fixed {
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
 	};
+
+	reg_phy_vddio: regulator-phy-vddio {
+		compatible = "regulator-fixed";
+		regulator-name = "vddio-1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
 };
 
 &A53_0 {
@@ -96,24 +103,19 @@ &fec1 {
 	phy-mode = "rgmii";
 	phy-handle = <&ethphy>;
 	phy-supply = <&reg_eth_phy>;
-	fsl,magic-packet;
 	status = "okay";
 
 	mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		ethphy: ethernet-phy@4 { /* AR8033 or ADIN1300 */
+		ethphy: ethernet-phy@4 {
 			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <4>;
 			reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
-			/*
-			 * Deassert delay:
-			 * ADIN1300 requires 5ms.
-			 * AR8033   requires 1ms.
-			 */
-			reset-deassert-us = <20000>;
+			reset-deassert-us = <100000>;
+			vddio-supply = <&reg_phy_vddio>;
 		};
 	};
 };
@@ -342,7 +344,7 @@ MX8MN_IOMUXC_ENET_TXC_ENET1_RGMII_TXC		0x1f
 			MX8MN_IOMUXC_ENET_RXC_ENET1_RGMII_RXC		0x91
 			MX8MN_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL	0x91
 			MX8MN_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL	0x1f
-			MX8MN_IOMUXC_GPIO1_IO09_GPIO1_IO9		0x159
+			MX8MN_IOMUXC_GPIO1_IO09_GPIO1_IO9		0x19
 		>;
 	};
 
-- 
2.47.3

