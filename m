Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFF637DEAA
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 08:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068378; cv=none; b=Tz0JAfQwgtWB/UDNF/bIb3N7oYeVqkE1mZ4WgZZqOqJvrbuq1cmZMFbnQ9rK998ZkTaZZ/ff6xfDVNUcTmU1OuvoNB5oG26BxmfepzTOuqV3aIXScOL3fICaZ9grl5W5lsaxJEvl2Wi/vDZoQ57ZsPB9KzI/B1kc0UFJaHd5S5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068378; c=relaxed/simple;
	bh=CHVuDcmthljhm/+QuQQ7+dOlRBMF2WQBn3NwgyY5x4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cJ+YqBpnfKjO5tY/zZsrjHCzr8mtqnMPN346+9nHlwTDcA2IjUs2GHv4dG28NPCR8h1WL4hAHDhgRdYYqdJbTzt60A1lk7fWG3l16fwahYNuf5LyF6asoeFP80f8/fbOW6zw8RzZ2AjKKEIaug9tFbzBu3sd4mqTiaxn/oOaan4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qRHb9S8R; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qRHb9S8R"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so1949935e9.0
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 01:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068372; x=1783673172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fVUtoItzoPm0+8nMg3WUJmehJ16QEtEOKQagUMReJZE=;
        b=qRHb9S8R/HTwsP3GCcgtc4fq7U/0Tqve/uEoeBm2Z5m8/QjYBl4AkZVHT+drkHgmrZ
         vAZqTxouIDXc2JJ/QczIXxesK3H4+wYg05ZQf6tL0yzj510bf1CYB70vmBr1tuyg4Q0L
         0Nm0hlWz0XPXs3XF7Bz4XPzAFPyMMYmqGzfPRzogWQTjCPtLP4A16HX3LCZKg8QSYxBj
         2gXu7t8q0xWESeDT+JbHN+vGM1ivLlXeN5ETJmwhQw3bUlnRoYk2d+dpSaLXrXpItUlc
         04NQyKQ3w12mzq8okaULbBEqTQNWm9SQUiUednaLrQdXKeA/4eD0/gGuDdIwG7qmJXbA
         RNyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068372; x=1783673172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fVUtoItzoPm0+8nMg3WUJmehJ16QEtEOKQagUMReJZE=;
        b=PxN+zfijJtbshwNSdBb4WNK9v9U25O0GPqblwZqevsOAFsQXHQPdxHN7RLoxlV6UjO
         X7+i2hoq27CkKFK+ja0e5bXhpB23rTWtDAXO2d5SOl93dxYn/80xZGQk7khvLmVtdZht
         w75KzafmYraKfH8O4Y/OUf/d1tQ82ovNUT+Eh6wMCfRsiprITaG7vMe5rDkK9JQV//qf
         mdttllqP8ldFUI/9uznagond+Qy42V5YnvAI262B4sExPms612jyyJagaq4PvW3kJqxS
         V9GCP1G33+r+C8OQnxXfiQBYft8cbrIbPILmMnmrLi5PjgepyEA7WMb3AIoxqIU2Wz8q
         gBUQ==
X-Forwarded-Encrypted: i=1; AFNElJ+zwR5AoaUTD6QKoRyr4sebuQg86t3hnjpbtOQmESJYomGxswOUbWgEgxW0VnCS1SomGL0xhDPMlFvQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyYRlCzZvkhe9Ug+i26EbtJsx516NNEAbEfqQpZ/m+/4ZoIW5bw
	oI+aOQT8U5NgBilD7J3Mox+Ee/kJykHFMTxnJbyLoGZx2kRd0GwT0r5/
X-Gm-Gg: AfdE7cnq1iphVkRJ8nIyxgM/paJFw15n4LqKsUOQfP9qGZ9PSSo5AYpJ0w5wQIHkS9Y
	Wkzcat0WwCeOw1vwOUpBQgCM+ZOyQW6i4+VcaNPljWjlwV715NX9ZFU+PVQvCgXaQjgasG+WDF/
	sg4awCU/cIOW1HkUpVnpsO17jVDHKU4BC9Lez+yU6p9mPFcldc735AHtr9TQ4PgaL2tHkOILS/k
	0rGC5RONoTkEMCp93j2cXMBbhNUbAuIQNLqRYObwISWjGD3gHEkXbBZ+0rmoYBE2FUJnRzCml+D
	ZZNQoavPcLYgH8ykK+d1B3wkh6Ib/9TThirHzK8M6XyrIK3da037dBF7Rs+306kCMPsPZwdPx/j
	0Ge1R6OoT3+9tVAJjKN8/ZkSDEChyiiomle9FvN/l1Rq+3LB4Iu4RGwSX5QTPkKcf0WCLI9D++A
	Rw9ESVZPj0yI7fH5qhPVaLWakcPcLL69YYbUAvMP5D4TV+6RkcVsEPgSHTC+p0iwdDI/YCiq80w
	4cv6m+saD2qrwMckeMYNwstiw==
X-Received: by 2002:a05:600c:c118:b0:492:62d9:4e57 with SMTP id 5b1f17b1804b1-493c2b382c2mr105386325e9.2.1783068371937;
        Fri, 03 Jul 2026 01:46:11 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cfb6f199sm6335505e9.3.2026.07.03.01.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:46:11 -0700 (PDT)
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
Subject: [PATCH v1 04/15] arm64: dts: freescale: imx8mn-var-som: Update FEC support with MaxLinear PHY
Date: Fri,  3 Jul 2026 10:45:51 +0200
Message-ID: <bd2a524c39372518dcdf128220f3bb210afa290b.1783067947.git.stefano.r@variscite.com>
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

Update the FEC Ethernet controller on the i.MX8MN VAR-SOM to match the
latest SOM hardware revision using the integrated MaxLinear MXL86110 PHY.

Add the PHY VDDIO supply regulator, adjust reset timings and add a
pinctrl sleep state for low-power operation.

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

