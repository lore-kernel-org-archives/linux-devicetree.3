Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795079166;
	b=maZsv29W4hHxtaMc8ipkoybWbbto96Omj8L+feFhK5C5q9UT9zEKCU253qYTsityBk2p
	 hdE+Eib4BTTPAieUnJmY3om16b+gO8/rxThT/PNpMkPyMlyDvUumfIDUh1CFzHjo13FsY
	 aYGRejh7zVPzTOF6+td3G0pxQHeexmGDPnXxnLU8pK3mb71BhhnO82G4Ickc/JoGJP7et
	 7Gzrrenx2aeY1ypytzmLVKjQxd7Ajv44ucT7IvByqSvBaVhmEVPyNr9UZprJEgT4M/wuV
	 nhaxliirYl5JFJJf1Swn+cZglf5TdlMtUpkRs97brZYJPh1l6v+89IqgA3bm5ksuIOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079166;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5bsnXM9lYnHDcLWwvi6s8sH/ygRCCvDbN6hw3fGCZdQ=;
	b=K6yyRoLw/iqKn+V8MAEwavZ82BKwld8R2Nblcs74JBywYnAWQi/pxUixzdP3+sp4yiEv
	 z8uZ/yHNn/FYHqMKv79qVawMuhwdgsTRsLDnMNRCUJ+2nrM8qfdnJr2wdin82roGvSM8d
	 PwwOtJKANUkTNMt5x/XhzTZ5oG83Coq3s7+PNUgReEYcwVCuEFpHUSmn4+UO3UEqheYWs
	 srVFhNeGXyvM8U77mS1Y0ci9z17wDDj9fqh9sAreeO/9ER1Y46GFbRE42IveTo1i3pMy7
	 /uFJhTv9T7M/yY19b3ytQlgSveeeF03/YzXjUJnKVgKrnPfcO0oUpXdmFtFvVbrdTYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QySlyGjt;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C54606A320
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:06:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53C54606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QySlyGjt
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-49412eb1474so1209779f8f.3
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 01:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795079165; x=1795683965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5bsnXM9lYnHDcLWwvi6s8sH/ygRCCvDbN6hw3fGCZdQ=;
        b=QySlyGjtRBPkHw2wGD1mXgSLwufydC0RKbXztxU872hVZzPocYQCnHwZIyjVVtbjca
         a545c4po4e/8zT6RxCFHQjBUagJpcY9VLJaUOr6tGKe0nV68vCg7Rzxza2GtdWgHVehk
         iYO/xgGYXXpuFk8Y/fFvulJf+l5sL0Y3ISxKnnKx9+QGfJ5XdU+NuK9eOyuOcfZmQnbW
         ZhnSd0xmb0E/T4qXzBmIpraGhAkME7spP3hYvIXRo4+0AF2OMtEI/+aJdaTV2UQAo0E2
         n92LoPsDN8E2ygvff4ywWcMN7x0PD+YxPy9X+PdXnVLbzNvTfKgsA66COIZmmZlHumky
         PYLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795079165; x=1795683965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5bsnXM9lYnHDcLWwvi6s8sH/ygRCCvDbN6hw3fGCZdQ=;
        b=wWHsAAAsodNhowBJTvvLgHd0Cy1fpOM964S4dKBGhJ4sJXccG8IptdwJgF5qE1LYOx
         n4bgX1axrshrBV7kGkZ3RrE2xwEtp+aUk+P63CAaUCv4uKltyt2I4OPoElg3RlG7Fk3H
         OAXUaz9RDFypvqwPfHQ2Jc95U9ljbVskM+HaBPGtYhWkO2QOzhXS2Py/VIzAGm7o9GGn
         HGNo6/JtLq6BBpskOh7CsgF9A3rA4spqZAwksqmIP4ZWlYlRD8pxpRiF8FxqSE3DIQN/
         8WIF67RVH6FTUd8/BP2pQWedbhwYtIAE+7JAmymxEnER4a+EuCVHDDSUgCz7RyWIqj02
         nEjw==
X-Forwarded-Encrypted: i=1; AL+hErHc030ZMMzfiV2kuUeTg47/yKHtvxpYCb5K8Iu6WG55mgqtnKKmA1HLjj6fOce/XJueAY/Tw8Cvc2SL@vger.kernel.org
X-Gm-Message-State: APuU4Z/xzAt/7IO/pu5phIqfabz8ewRUZAriU+ugQu5SBiSgI5QSJdz7
	0iE2sMqEKXnWYR38JEl2dJXGx7QaSfwzJBDyaGXmsAtCRFaMYj4rgeLN
X-Gm-Gg: AZFdTZfLSxMyrSwbPop12wfs6K4vxtS0cWsBb3sB1mrXp/S74lmHwJ1+zJOGGEsfETo
	TdIu3dVuNS76a/SjoCjiaDAvFXi1RzXVk2ECyJj2JIQ3/6PGREabSdVgZKXTrhWM0xadYat2r28
	Ogau3sWDNdi/IMX+1sMLD85QEMmgFYt+Zu3sh1KzKu61ZPcNwSPkbICz154MIwUPzEn/OH/VifZ
	0KQEqhO0ZmR4eUBy3DLX4Yj7txQoGa1/Wt3oSQYJYnbqWFoi1sxCOEbw8IoNY6qxBknoQo5lIyg
	AKez0LkKWXJSjbWQ8sIIT3LtE24RJ6CU76pyWHZuHpv3LFY34TsALfVoR5dt/ZS70A7TWYzaFV7
	jJ1I60dLVtwvtXwcSfoA3wwK+TEsZnaJOY61+BHxMB9SBzNbGT/QtgzvcoEl4D+U+lfWFvtthsa
	LSrIQ9GqlD4HuZ1yqwwC+xBiEKqmce6vBlUjD7e1ulavdzwJVXHivKlu8CLfyGCfSEMcmZ4Bajn
	DE0KLbzSuLUvR/UB3P1g9PdZhKcWe5QWFqGNrBxflDnFmViaeeeTf54avxiN25g8w9G4G1m8rBz
	1QCkRfdDO6JwCx2+GXwHSKDgU0/nEJO23a7k9XDazTCvd95iIQHQ+QnwbDg96FNSuRBdbq01a/k
	IO96L7ttdSyMMQSYm4v8NavK3/jS2JX3Q7oH8R7mqj3ci22E6dmEyUcI=
X-Received: by 2002:a05:6000:4705:b0:4aa:2afc:ea30 with SMTP id ffacd0b85a97d-4aa2afceb05mr1443459f8f.19.1795079164332;
        Thu, 19 Nov 2026 01:06:04 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65683d5a2sm9770644f8f.43.2026.11.19.01.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:06:03 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 1/1] arm64: dts: freescale: imx93-var: Add Cortex-M33 configurations
Date: Thu, 19 Nov 2026 10:06:00 +0100
Message-ID: <20261119090600.9257-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add Cortex-M33 overlays and combined DTBs for DART-MX93 on Sonata and
VAR-SOM-MX93 on Symphony.

Share the remoteproc and mailbox configuration through a common include.
Reuse the reserved memory from each carrier DTS, preserving the different
resource table addresses.

Move the existing DART-MX93 remoteproc and MU1 configuration out of the
module DTSI so that they are enabled only by the M33 overlay. Use the
-m33 DTB when remoteproc support is needed.

Reserve the peripherals used by the M33 firmware and disable Wi-Fi,
Bluetooth and the devices depending on GPIO4. On Sonata, also disable USB
OTG1 because its USB-C role controller is unavailable.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
Changes in v2:
- Remove the cm33 and mu1 overrides from imx93-var-dart.dtsi,
  enabling them only through the M33 overlay.

This patch uses the memory-region-names binding and driver support from
the following commits, both already in linux-next:

- ebb21cc5d1c0 ("dt-bindings: remoteproc: imx_rproc: Document
  memory-region-names to avoid implicit ABI")
- 8396089f91fa ("remoteproc: imx_rpoc: Use memory-region-names to avoid
  implicit ABI")

For dtbs_check on older trees, commit cebd1c0961d8 ("dt-bindings: gpio:
vf610: fix clock requirements per SoC"), also in linux-next, fixes the
pre-existing GPIO clock validation errors.

 arch/arm64/boot/dts/freescale/Makefile        |  9 +++
 .../dts/freescale/imx93-var-common-m33.dtsi   | 24 ++++++++
 .../freescale/imx93-var-dart-sonata-m33.dtso  | 55 +++++++++++++++++++
 .../dts/freescale/imx93-var-dart-sonata.dts   |  2 +-
 .../boot/dts/freescale/imx93-var-dart.dtsi    | 14 -----
 .../freescale/imx93-var-som-symphony-m33.dtso | 50 +++++++++++++++++
 6 files changed, 139 insertions(+), 15 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-som-symphony-m33.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index cfd548284358..05a7556e9de9 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -956,8 +956,17 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla-mini-ezurio-wlan.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla-mini-lvds-tm070jvhg33.dtb
+
+imx93-var-dart-sonata-m33-dtbs := imx93-var-dart-sonata.dtb imx93-var-dart-sonata-m33.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx93-var-dart-sonata.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93-var-dart-sonata-m33.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93-var-dart-sonata-m33.dtbo
+
+imx93-var-som-symphony-m33-dtbs := imx93-var-som-symphony.dtb imx93-var-som-symphony-m33.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony-m33.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony-m33.dtbo
+
 dtb-$(CONFIG_ARCH_MXC) += imx93w-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93w-frdm.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx943-evk.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
new file mode 100644
index 000000000000..51b4cfe143d4
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common Cortex-M33 configuration for Variscite i.MX93 modules
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/* Use the reserved memory and resource table address from the carrier DTS. */
+&cm33 {
+	mbox-names = "tx", "rx", "rxdb";
+	mboxes = <&mu1 0 1
+		  &mu1 1 1
+		  &mu1 3 1>;
+	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
+			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
+	memory-region-names = "vdev0buffer", "vdev0vring0", "vdev0vring1",
+			      "vdev1vring0", "vdev1vring1", "rsc-table";
+	status = "okay";
+};
+
+&mu1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso
new file mode 100644
index 000000000000..d97da9916ef4
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Cortex-M33 support for Variscite DART-MX93 on Sonata-Board
+ *
+ * Link: https://variscite.com/carrier-boards/sonata-board/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx93-var-common-m33.dtsi"
+
+/* Reserve the peripherals used by the Cortex-M33 firmware. */
+&flexcan1 {
+	status = "disabled";
+};
+
+&gpio4 {
+	status = "disabled";
+};
+
+&lpspi5 {
+	status = "disabled";
+};
+
+/* Disable Bluetooth along with Wi-Fi and release the JTAG pins. */
+&lpuart5 {
+	status = "disabled";
+};
+
+&lpuart7 {
+	status = "disabled";
+};
+
+/* The USB-C role controller uses an interrupt on GPIO4. */
+&ptn5150 {
+	status = "disabled";
+};
+
+/* The USB-C role controller is unavailable. */
+&usbotg1 {
+	status = "disabled";
+};
+
+/* Wi-Fi reset is connected to GPIO4. */
+&usdhc3 {
+	status = "disabled";
+};
+
+&wifi_pwrseq {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
index 1ca3ec8330d0..e3afd0efe5c7 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
@@ -291,7 +291,7 @@ ft5x06_ts: touchscreen@38 {
 	};
 
 	/* USB Type-C Controller */
-	typec@3d {
+	ptn5150: typec@3d {
 		compatible = "nxp,ptn5150";
 		reg = <0x3d>;
 		interrupt-parent = <&gpio4>;
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi
index 69495bb7fc9f..6c596d61bd21 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi
@@ -54,16 +54,6 @@ wifi_pwrseq: wifi-pwrseq {
 	};
 };
 
-&cm33 {
-	mbox-names = "tx", "rx", "rxdb";
-	mboxes = <&mu1 0 1>,
-		 <&mu1 1 1>,
-		 <&mu1 3 1>;
-	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
-			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
-	status = "okay";
-};
-
 &eqos {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_eqos>;
@@ -221,10 +211,6 @@ bluetooth {
 	};
 };
 
-&mu1 {
-	status = "okay";
-};
-
 &mu2 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony-m33.dtso b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony-m33.dtso
new file mode 100644
index 000000000000..96860a2dbf7c
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony-m33.dtso
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Cortex-M33 support for Variscite VAR-SOM-MX93 on Symphony-Board
+ *
+ * Link: https://variscite.com/carrier-boards/symphony-board/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx93-var-common-m33.dtsi"
+
+/* The resistive touchscreen uses GPIO4. */
+&ads7846 {
+	status = "disabled";
+};
+
+/* Reserve the peripherals used by the Cortex-M33 firmware. */
+&flexcan1 {
+	status = "disabled";
+};
+
+&gpio4 {
+	status = "disabled";
+};
+
+&lpspi6 {
+	status = "disabled";
+};
+
+/* Disable Bluetooth along with Wi-Fi and release the JTAG pins. */
+&lpuart5 {
+	status = "disabled";
+};
+
+&lpuart7 {
+	status = "disabled";
+};
+
+/* Wi-Fi reset is connected to GPIO4. */
+&usdhc3 {
+	status = "disabled";
+};
+
+&usdhc3_pwrseq {
+	status = "disabled";
+};
-- 
2.47.3

