Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB283AFB1A
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330506; cv=none; b=PPrnVqvq5FOisytoDFHuMfzW4VmVJPH6d4YTdUsbM/639/Bwe+O/4I4COLflAcrR7NlQ39COLY8snChzgKgyGMNg1/g1fi37OfsthKhqZdDSMkWxw5Kt84fM664uo6Zdqm0PqtrgqtwCfUfUbLdaHrBh4A6K8RnJrZL7isWT2YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330506; c=relaxed/simple;
	bh=6i4Yn4bFzEH/lHxseFhMeKNm4n5MNZlEFyGK/wtiRes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g3OCBktgt4mzBexlGElBwrfFyA8deO5sVBWtT7l0anOIpRrdCLrYB56s7hy1EE9mrp/grFcD9Khffv0mmOeZsSNYsypEVRyzyo7b5IiUjwhlD66OttcICwNSOdbh3yDahnX+Chhv0/ZprAlMITrPHeABWI6LDxyeRVZXqvSTjjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iabLTM6Y; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iabLTM6Y"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493c733f15aso28580035e9.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330499; x=1783935299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kxIkFKzQqrcKn3oguOv50rHYhjrSArtOObsXYJxnkfw=;
        b=iabLTM6YXBJO52CDj0XAlaHWQZHaxgsB01oT3Cyh/aAxtC5s1zGzjd1AvvFoVkeQyH
         0d88j16dvy1sdzLjrFGEP2u118QcfdhFQ05UQ8oinxHdreFznZ6rREYIqUvrwShqHe3P
         DxCBz5ru5P8kdUiI+LBkQhQ4qjEXH6j5h2jaq5VqhvQV/T9avSLRalTOX5X6OJY1p0NZ
         eb4g624AbD4SblGtwkcpW29QOx1U5uYyraz8pnI5JdrXyzcmYDQ1WclFoLkLLasN6Yzf
         NKusITvyEpkV5Yfb26rwXMElewPV3w3S0ikOzP5nvB1IfuvJXcoPAoNSG7QurntGxgNL
         lr4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330499; x=1783935299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kxIkFKzQqrcKn3oguOv50rHYhjrSArtOObsXYJxnkfw=;
        b=RNChkVVUQUTBVv5A5GGtHdhm6cHilgI6KR4WGazmpv2foJjxMDTEHuN5UgdcxVEQ0K
         0LgWAEyDag7FVy5cR97x2ndN7tarh4IJTxDdGy+46Zed+H0gnyFLD2oLXV7Mov2uioOX
         Y7MpF571X+tbClX1BydXt0b/vB6JeRyhLm5M3AGyEY2xArKzUzqWHaZkQSR7j8zGEet6
         ZM0M0VVzL4pNjxpgge3QZCEoRS9eCQg5e2sC75uH3H8OX3MiJafLmURrgXIUtiWQ3Ug5
         vPlqEsDmpoHodycMzk8d1d6BLIbitMwJ9U6EE0U5/h796YqjaeyzW3Q9GUy8r6RXW43C
         oIHQ==
X-Forwarded-Encrypted: i=1; AHgh+RoWZq9WCr5ys/g1aZDHdfe8lEW1lBdV1pKBySLcVafCPntrymqC8WN7RcjSjoe3TaCMBSZh0PgRijWv@vger.kernel.org
X-Gm-Message-State: AOJu0YwCLfdvnHaEk6RupunqjGZGt1UZ7PoBQ9j6uepgQSfohL3Pogvp
	La1OWIjihqQgfNH4shte0OnsDaqB+b35t2/gzkNaVmrNtppn4/UCvE0I
X-Gm-Gg: AfdE7cmZvqU9LCQU7rbUqFLB1MgRSv/6JVLKgv9FgrwMyoh0Gy5b8HLIA5HJFAq7k0T
	uS420vjoFMNlFQ48oW/89NLg5Tsmwc5eQzxZAeePR98pYrwMtjVcQWn8ZW3VkN8Bzj5+2lli/rD
	ch2zzZvu1duZrDF4SpkvA8SFF3kcH2lXwqGFb3xYnm48HiXNrUKF5gIB1EnKBO+jKo0qWZRwVXm
	lUAc6mlXGfjivqPW2JNt6ICz7B6fMXZ/RGDIIP4dNbxWs2bUo5U404PwHMENdQFlxKrDb/9qDW5
	x2sWSjrWpy12fnxRAUR1bIybZ3yFNyoYIWl4hVBaMMwC5MwDQs/Xz5BVuSOFCrzIa2N4Jhl3pIB
	EYr34TuC+z0D08umr4lgUnRdKcvUDGd4VgxmtqsM0vJY1LOxBExV2lPqyeExnfKm5kiVq0Uv1lW
	u3kUR4IqoI184TUNyjktf5pkRIW+4pZUOf/p/OwA/sm9uuyuRRxKYUaicEnYnMU2H62FqlFjdTk
	/q4X/u6t/dhJijnfxrrf6oefg==
X-Received: by 2002:a05:600c:3f0a:b0:492:4a50:41fe with SMTP id 5b1f17b1804b1-493d11f05a3mr108614835e9.22.1783330498855;
        Mon, 06 Jul 2026 02:34:58 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm314379715e9.5.2026.07.06.02.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:34:58 -0700 (PDT)
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
Subject: [PATCH v2 07/15] arm64: dts: freescale: imx8mn-var-som: Rework WiFi/BT and add legacy dts
Date: Mon,  6 Jul 2026 11:34:37 +0200
Message-ID: <ecf72149729d31be30e6f5bcc1cc53a5321a124d.1783330236.git.stefano.r@variscite.com>
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
v1->v2:
 - 

 arch/arm64/boot/dts/freescale/Makefile        |  1 +
 .../boot/dts/freescale/imx8mn-rve-gateway.dts |  1 +
 .../imx8mn-var-som-symphony-legacy.dts        | 19 ++++++++
 .../dts/freescale/imx8mn-var-som-symphony.dts |  1 +
 .../imx8mn-var-som-wifi-brcm-legacy.dtsi      | 19 ++++++++
 .../imx8mn-var-som-wifi-bt-iw61x.dtsi         | 46 +++++++++++++++++++
 .../boot/dts/freescale/imx8mn-var-som.dtsi    |  8 ----
 7 files changed, 87 insertions(+), 8 deletions(-)
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
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dts b/arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dts
index 056ea2f9e963..d9981d9a7362 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/usb/pd.h>
 #include "imx8mn-var-som.dtsi"
+#include "imx8mn-var-som-wifi-brcm-legacy.dtsi"
 
 / {
 	model = "RVE gateway";
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
index 000000000000..9ca2038943d4
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-wifi-brcm-legacy.dtsi
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Variscite Ltd.
+ */
+
+/* WIFI */
+&usdhc1 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	brcmf: wifi@1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-wifi-bt-iw61x.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som-wifi-bt-iw61x.dtsi
new file mode 100644
index 000000000000..9ec341ed57d3
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-wifi-bt-iw61x.dtsi
@@ -0,0 +1,46 @@
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
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
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
index ac22dd3e6542..5d8cd8c13633 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
@@ -371,10 +371,7 @@ &usbotg1 {
 	status = "okay";
 };
 
-/* WIFI */
 &usdhc1 {
-	#address-cells = <1>;
-	#size-cells = <0>;
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
 	pinctrl-0 = <&pinctrl_usdhc1>;
 	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
@@ -383,11 +380,6 @@ &usdhc1 {
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

