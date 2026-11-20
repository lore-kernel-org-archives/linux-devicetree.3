Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795199594;
	b=FebPlhoX2KLFlNN120HaZsWSTz9BrQ9wgNx7SHb7oB/eKXqYtEPpso0uTEd9x0Cd9LkR
	 OeKYPufstQRXpWWkoUrIupRzpQui+QY6CsEeHfeTqeynmKfQe4T6c7cfnuSWMemK6jOve
	 3WChOYHWXF8zgJbP37Gf8lGWmp877G4cbehM9mft1jFND9ZbDxHw0Hrr9AkQW68QsSg+h
	 g4R6UCGN8uGvzhYH9WYTajGFCAW4m74/HnoYmmitvsRjbeNPDvLew50GYRL8QTFXfEGRS
	 U5l1E2vmLkwU7QbV0fJ423WadwNwos8GOTt2XFdqvQKnZPSjphQJs6WhIY+UtrnoJZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199594;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=gQSQjSRJnKJyi/DyI9dUqIc7eXSvEGbjLptiauw7SSs=;
	b=Dsr9qsEScRutPUW+DBq89RUWjp9HsJVTCVLVgmuOJPWAnGZRqJLUMFhkwCR/5VPw01zM
	 wf8CJAaO2FfhWQMOQlQQkyhV520yxx638cgCjftzyoasnE/I8BkEZUCVbsQUCQT6ZrOu9
	 zHzxjkQ+IOSFxmcSZt1X84GpsftuWHVrhC0+1MDKTfMTde19zYFc8C3kb1Crc9XRA+Zq9
	 kVEV3iWEMmq83wWSPkKlrG5sZHSY7V8uYrpRl5HAPw0GbGxDOfDiuFQ9rVsDc+wGKIDum
	 xC4NJL8bDDZMsXInjNRjyl5mjD/2eiixbBg4m/pc5w2HjfRQOaHfbdjWZOXFXUOVbug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="pTEUd5C/";
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A1960A2631
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 18:33:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3A1960A2631
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pTEUd5C/
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so11030225e9.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795199590; x=1795804390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gQSQjSRJnKJyi/DyI9dUqIc7eXSvEGbjLptiauw7SSs=;
        b=pTEUd5C/hIe7qQkEy2T1eATjszBjP4VbVP2WPRY7j2zaLAbW6vFyOiqGI0iOo12aFA
         8RH8449uqSe18ZaujUS12kVx5Vt6jp6UI45LqH9OnNRI15w1Dti8qwr03gTvlLLNeZRi
         y8yqBpBBdJQc0eDokPgMkzhtW8MZ6AvnTFuDgMRD41ZMP2E1dZYXtASMsSe0OfXtK82J
         yfe9meHSvMFyEJy7xzgWHPtmyt/ynuXwUPh1jekwgcmAHj1voZY4ukPCPtjwrC/chUpY
         sdfWEsihKmH68Z1I1+S3Noa4PIJNvxaJVQZxxjtRHKo4QSiZPciXyUiUYJLD5vF6eybm
         J0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199590; x=1795804390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gQSQjSRJnKJyi/DyI9dUqIc7eXSvEGbjLptiauw7SSs=;
        b=MUAKRa0HfzxibltOKqGBMPsSgTfwD3B8izz3412wahNGg9Ku/owplHhf/mUUA8NIvw
         DI+m3jDQgu4RgEAL66IxJ6OqYFtL5ogRbeliSZ7BI0hqnsEi6e/W9VtpGLy9lg1uvuf2
         7O1/fHln697Yk6n+vdy5KHewHpAQAijn/gQVX8Fl93kga2qm6m6Afy9clzi+FKxSYgdl
         i2qrQWx+rXxw3pzfB0qmWS3sjBgrYkYuiIu4syKAK0Z9Yki8nNedEDIzxEchPTb8NTk8
         gCKx0QEI8GNkOekxp7jpAUW9clx9N7xlrSviifIEri+Ph+gEoc9zE7yg8bAJwKuSyDqy
         6bJg==
X-Forwarded-Encrypted: i=1; AL+hErEb7uVoof8OARBDulce6YCplu36bul+QTASpGBY6R69g884DMoEpBUgCH+NlqaarmRZZknj8moyBXyq@vger.kernel.org
X-Gm-Message-State: APuU4Z+dZLlPL0dECZXIF+LbmPorrWkiY2LiYDaXXCEypTTmX0Ke4bv4
	78SN8aVvLNRMYHSLkMT9pWjPOAquZmZ13WuypcCoxGqjQwKw5SHtnKoy
X-Gm-Gg: AYBFou3q1uB/zclyeMqr0lDEFdJZTP30xU1wZNKFafDk79kv6/MR338d3TulX8bDi9B
	7n/yZdVGDVHClb2FxS0tEa5bA4O9j+SIKvolJreC6wMLaQvm8rDRmHFlxh3YzGpOfQh5xbUIiAc
	9w3FxtFwMwhL3yNFCYCMxEZ7Tx9CggryG6YVMzBFbv21JUQfl0hidLIrywoKFoGwa7wiQyga2Tu
	ONeDgicatrKJZs29i21vH2xk0jUJuqzQkPHpr0J5WXNfmfuFbxRlo55YwMwAGRyFqFio9UCABwC
	iKPctBO/u7huaBFqaDB3uKWMz6KZWuqNVGHzY/MQVtAFTaLtauRd65JM/1qsnx/5z1S/qN43S7F
	uYHasepT+YVj67pR3qIf0BDWtoWcI1o1Vn5Z9MRT7/fvfQuZketGevAkj23napt9sET8mI6kpvn
	u26ZlNEQmJ3vpLP52ZAU8N1zEgojQJUd1MfJnd9eI4ZvrFGpGSQeCZxMpOwOY6SxA3E7fJ+jckc
	Nv9Eq+35CW5dmbeoeVs/ZyWDAgLDIN8q/6viyECYxi/V+IsanG2gZVEN2hZs5+tGoai5Yzkf5Kp
	Y8VcJEwzfSlZBi2scXMv+iOu0PnzdBUwSXchZ75j0HxqEH1bpLadvMsbhxKz3zIiLUetAbGJkEB
	bwE/xN1T8qU6ncDdZglJwRCPml+ujOVjoHQS7ADQIbgCYffE=
X-Received: by 2002:a05:600d:18:b0:4bb:9001:1aa with SMTP id 5b1f17b1804b1-4bb900102b8mr10489545e9.10.1795199589928;
        Fri, 20 Nov 2026 10:33:09 -0800 (PST)
Received: from GLaDOS.station ([193.207.36.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb98b4dsm7467718f8f.53.2026.11.20.10.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:33:08 -0800 (PST)
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
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Mathieu Othacehe <othacehe@gnu.org>
Subject: [PATCH v4 3/3] arm64: dts: freescale: imx93-var: Add Cortex-M33 configurations
Date: Fri, 20 Nov 2026 19:32:30 +0100
Message-ID: <947a7bcf39d89b4a162f296278ccaa3db6512983.1795197853.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795197853.git.stefano.r@variscite.com>
References: <cover.1795197853.git.stefano.r@variscite.com>
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

Include the common configuration only from the overlays, so the M33
memory regions are reserved and remoteproc and MU1 are enabled only in
the M33 variants. Use the -m33 DTB when remoteproc support is needed.

Mark the peripherals used by the M33 firmware as reserved. Disable Wi-Fi,
Bluetooth and the devices depending on GPIO4. On Sonata, also disable USB
OTG1 because its USB-C role controller is unavailable.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
Changes in v4:
- Move memory-region-names to the common configuration extraction patch.
- Remove the common include from both module DTSI files, so the M33
  memory regions are now reserved only in the M33 variants.

Changes in v3:
- Move the common configuration extraction to patch 1.
- Use "reserved" for peripherals assigned to the M33 firmware; keep
  "disabled" for dependent devices.

Changes in v2:
- Enable cm33 and MU1 only through the M33 overlay on DART-MX93.

 arch/arm64/boot/dts/freescale/Makefile        |  9 +++
 .../freescale/imx93-var-dart-sonata-m33.dtso  | 55 +++++++++++++++++++
 .../dts/freescale/imx93-var-dart-sonata.dts   |  2 +-
 .../boot/dts/freescale/imx93-var-dart.dtsi    |  1 -
 .../freescale/imx93-var-som-symphony-m33.dtso | 50 +++++++++++++++++
 .../boot/dts/freescale/imx93-var-som.dtsi     |  1 -
 6 files changed, 115 insertions(+), 3 deletions(-)
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
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso
new file mode 100644
index 000000000000..51ec0beea7c9
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
+	status = "reserved";
+};
+
+&gpio4 {
+	status = "reserved";
+};
+
+&lpspi5 {
+	status = "reserved";
+};
+
+/* Disable Bluetooth along with Wi-Fi and release the JTAG pins. */
+&lpuart5 {
+	status = "disabled";
+};
+
+&lpuart7 {
+	status = "reserved";
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
index efd51f6364f3..57007f716f22 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
@@ -260,7 +260,7 @@ ft5x06_ts: touchscreen@38 {
 	};
 
 	/* USB Type-C Controller */
-	typec@3d {
+	ptn5150: typec@3d {
 		compatible = "nxp,ptn5150";
 		reg = <0x3d>;
 		interrupt-parent = <&gpio4>;
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi
index 4ee4d74cadea..6c596d61bd21 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi
@@ -12,7 +12,6 @@
 
 #include <dt-bindings/usb/pd.h>
 #include "imx93.dtsi"
-#include "imx93-var-common-m33.dtsi"
 
 / {
 	model = "Variscite DART-MX93 Module";
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony-m33.dtso b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony-m33.dtso
new file mode 100644
index 000000000000..8df03ed3c004
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
+	status = "reserved";
+};
+
+&gpio4 {
+	status = "reserved";
+};
+
+&lpspi6 {
+	status = "reserved";
+};
+
+/* Disable Bluetooth along with Wi-Fi and release the JTAG pins. */
+&lpuart5 {
+	status = "disabled";
+};
+
+&lpuart7 {
+	status = "reserved";
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
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
index 46b739a147e3..b0ffcb534cb6 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
@@ -7,7 +7,6 @@
 /dts-v1/;
 
 #include "imx93.dtsi"
-#include "imx93-var-common-m33.dtsi"
 
 /{
 	model = "Variscite VAR-SOM-MX93 module";
-- 
2.47.3

