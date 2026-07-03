Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9F737F73A
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 08:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068380; cv=none; b=DtX/C49K0LP1qxEDSf3mhbLAuVSZNMO2K9DnOtZN8RHicRDRuApMcyyTbt6FLwHE/kWjQWAwucodw4gZIZxAfix/CiaPLCpmdHF/XQKS66bCWU6X5k7xrqkqpEHoUXPD45GcIB+JSMcxbbaBKn/tPO4YPEMh0pa0St2WGJ91lMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068380; c=relaxed/simple;
	bh=ISC6DqMirGP1nzZzMZCnk62AyXpTA5rq52dNkhDF7SY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GhnYDSgvhls5i238HxKlI4RWwzVSqaVO8LgHuQkma3npG+OjObhy1VazmfCsrBYSLNw2B2PSeolqoyuEYYc3Kivm0ZT/iw7Choqw8caRikpBr+yNb6hTfBWMmMGe1/3VYtRiLSp7h7JoOqqFHmQ1gwGKm6c4w41LwTDfS1JirLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=advVS6PU; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="advVS6PU"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so2425625e9.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 01:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068375; x=1783673175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FmmAHjNMs7Om6TixgyBkqUS0t0rXWGeYaaijHGTlz0E=;
        b=advVS6PUFNhzrqcYMu2kaYToyjEI4r1yrEknLrZ+PFdRPMsHwEPeL01tK4TCaFMTS5
         51wM5hQxMbzXhclqpMpqRLDg3F7ydnJwhlH48G4808Gbr+my6dqnzm2gxb0RCu3ERzmB
         ok7/uidWc45aBtJqMLQtPEZma7jV4SqyThujCryNAQ8eTL+yOfkuYgq6oaWpzG01KNnf
         fZdFE3RmKuGkPo2wULOTpxx0FeXzon4cp5+y1rhyTEh+uc1zSHe97nOPW4Gmc4YGbz9F
         q0g07AsvYmcXbjTAH4vvg8t86es+IVksJwcAbbu8Wh3JKtxB+WwAxARm6R0E2eO3OQLG
         4Bhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068375; x=1783673175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FmmAHjNMs7Om6TixgyBkqUS0t0rXWGeYaaijHGTlz0E=;
        b=Z0S6ldvVbvvsKmFy/4vNV45WI+D1L5G05rDfXgVtrNZtSILI47BzppLIZd/mVHE2OX
         pASc7urb0NTHq8R1ah/LChidifieJSUKE3yyL0kHKfC/dsh2jDF8RqqBR3r2d4QLYDDz
         VoH2rXtGtMYXrVQBqQMx/ONOdDO95MwRJyNwNCaO0vCTB9l33YayMCDLmU+Tk2Opoyg6
         G9oLxMFnTocR4oNa445etGiQskdlCA/aExOoriFApfRKerrZTYeS7NBW+Vhm3p+44/g8
         NUxQeFrjsqtQUikPmNucovssAYIGNTo7ydGmT/GuI22fikDqxo6b1PqDsUVv96WXTxZX
         +x9Q==
X-Forwarded-Encrypted: i=1; AFNElJ/pA/CD/YUogGhuK0Bwved0v1nCqGc8IOGMMFKQ9iNtIE2BUZPOyvmIprlQxz0N6Z977F5irGKIIu6E@vger.kernel.org
X-Gm-Message-State: AOJu0YxslohtOC4TaxL/rPByUHCdoZ3m70DCq3lXgnRma470QSAnviqL
	ZU/RcMhQCGy1phfv0D6ZPvQ/OCS9s9PxwZgDttfqDSueCLD6xoz1zfTC
X-Gm-Gg: AfdE7cnl1msadUB24LxWRUfHWWwgZ4oaWaWAEW7IVuXlnBHOB8xqwj5l4IEm3iD9LPZ
	Ix5y+pr/wMKsaGcA2g57X51l7EeqjQt7DtDC8D1CWTQur+SSIKrpVvv/IDnX7buMFitPU9Igpd+
	ftzYZXrJjq/WZLQ8iF6gt9opq8SysXcFt4/JbNthbNpUGjY9vSO+LLXW/xqQDplu6VmoLLT9+Ut
	5Wse4MWoKyECKBuWumXUamD6+oc+GitlhGW8SNLwlIhfeHX+hJWbIGEn7eOpz5l1wTBF3gTnS29
	UNfkZpB+Iq2lIt1QC5ce/a3EQRB4Na1mYscmeUa0OAE3MD7C1ZSzOaoyuHldNYScyeox65UwVX1
	hlfjZ1hIuYkv0+cqUm6gPzc1nHHx6x+xqFOoJSKOn+dsV4kDPmXq50oNw0J7beieHL71R9OB0ei
	vEJARFK8i5dEckoZI1Czjtk/WBhPkb/vDVrv+Jk7t2QvQ7oaobR19KHWMa8CSZCkc5oGmkJmdw2
	mcDkTlR/v1DZ5oahAhTf130bg==
X-Received: by 2002:a7b:cb55:0:b0:493:aaa2:f034 with SMTP id 5b1f17b1804b1-493c2b7a70bmr103534135e9.26.1783068375278;
        Fri, 03 Jul 2026 01:46:15 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cfb6f199sm6335505e9.3.2026.07.03.01.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:46:14 -0700 (PDT)
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
Subject: [PATCH v1 07/15] arm64: dts: freescale: imx8mn-var-som: Rework WiFi/BT and add legacy dts
Date: Fri,  3 Jul 2026 10:45:54 +0200
Message-ID: <541308c48bdc3b6860ce25027ed1a01e38aa2971.1783067947.git.stefano.r@variscite.com>
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

The VAR-SOM-MX8MN currently integrates the NXP IW61x wireless module,
providing WiFi over SDIO and Bluetooth over UART.

Move the wireless module configuration out of the base
imx8mn-var-som.dtsi and provide dedicated variant includes.
The IW61x configuration is moved to imx8mn-var-som-wifi-bt-iw61x.dtsi
and used by the Symphony evaluation board device tree.

A separate imx8mn-var-som-wifi-brcm-legacy.dtsi include is added to keep
the configuration for the legacy Broadcom SDIO WiFi module used on
earlier SOM revisions.

To preserve compatibility with older SOM revisions, add a separate
imx8mn-var-som-symphony-legacy.dtb, which disables the IW61x setup and
applies the Broadcom-specific configuration.

The Broadcom-based SOM revision is no longer in production, but support
is kept for existing users.

This keeps the VAR-SOM-MX8MN support aligned with the existing
VAR-SOM-MX8MM implementation.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  1 +
 .../imx8mn-var-som-symphony-legacy.dts        | 19 ++++++++
 .../dts/freescale/imx8mn-var-som-symphony.dts |  1 +
 .../imx8mn-var-som-wifi-brcm-legacy.dtsi      | 12 +++++
 .../imx8mn-var-som-wifi-bt-iw61x.dtsi         | 45 +++++++++++++++++++
 .../boot/dts/freescale/imx8mn-var-som.dtsi    |  6 ---
 6 files changed, 78 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony-legacy.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-var-som-wifi-brcm-legacy.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-var-som-wifi-bt-iw61x.dtsi

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 430085123b4e..bdd3818d6e79 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -206,6 +206,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mn-solidsense-n8-compact.dtb
 DTC_FLAGS_imx8mn-solidsense-n8-compact += -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-tqma8mqnl-mba8mx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-var-som-symphony.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mn-var-som-symphony-legacy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-venice-gw7902.dtb
 
 imx8mn-vhip4-evalboard-v1-overlay-ksz8794-dtbs := imx8mn-vhip4-evalboard-v1.dtb \
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony-legacy.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony-legacy.dts
new file mode 100644
index 000000000000..5998ebcef474
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony-legacy.dts
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Variscite Ltd.
+ */
+
+#include "imx8mn-var-som-symphony.dts"
+#include "imx8mn-var-som-wifi-brcm-legacy.dtsi"
+
+&bluetooth_iw61x {
+	status = "disabled";
+};
+
+&iw61x_pwrseq {
+	status = "disabled";
+};
+
+&usdhc1 {
+	/delete-property/ mmc-pwrseq;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index 520aff23e587..53130b521b5b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -11,6 +11,7 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/usb/pd.h>
 #include "imx8mn-var-som.dtsi"
+#include "imx8mn-var-som-wifi-bt-iw61x.dtsi"
 
 / {
 	model = "Variscite VAR-SOM-MX8MN Symphony evaluation board";
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-wifi-brcm-legacy.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som-wifi-brcm-legacy.dtsi
new file mode 100644
index 000000000000..f44a846ea6f9
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-wifi-brcm-legacy.dtsi
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Variscite Ltd.
+ */
+
+/* WIFI */
+&usdhc1 {
+	brcmf: wifi@1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-wifi-bt-iw61x.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som-wifi-bt-iw61x.dtsi
new file mode 100644
index 000000000000..cb4b282a25b0
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-wifi-bt-iw61x.dtsi
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Variscite Ltd.
+ */
+
+/ {
+	iw61x_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		post-power-on-delay-ms = <100>;
+		power-off-delay-us = <10000>;
+		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>, /* WIFI_RESET */
+			      <&gpio2 20 GPIO_ACTIVE_LOW>; /* WIFI_PWR_EN */
+	};
+};
+
+&uart2 {
+	pinctrl-0 = <&pinctrl_uart2>, <&pinctrl_bt>;
+
+	bluetooth_iw61x: bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
+};
+
+/* WIFI */
+&usdhc1 {
+	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_wifi>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_wifi>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_wifi>;
+	mmc-pwrseq = <&iw61x_pwrseq>;
+};
+
+&iomuxc {
+	pinctrl_bt: bluetoothgrp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD1_DATA4_GPIO2_IO6	0xc1
+		>;
+	};
+
+	pinctrl_wifi: wifigrp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD2_WP_GPIO2_IO20		0x140
+			MX8MN_IOMUXC_SD1_RESET_B_GPIO2_IO10	0xc1
+		>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
index ac22dd3e6542..ff5f658b33de 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
@@ -371,7 +371,6 @@ &usbotg1 {
 	status = "okay";
 };
 
-/* WIFI */
 &usdhc1 {
 	#address-cells = <1>;
 	#size-cells = <0>;
@@ -383,11 +382,6 @@ &usdhc1 {
 	non-removable;
 	keep-power-in-suspend;
 	status = "okay";
-
-	brcmf: wifi@1 {
-		reg = <1>;
-		compatible = "brcm,bcm4329-fmac";
-	};
 };
 
 /* eMMC */
-- 
2.47.3

