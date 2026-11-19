Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104072;
	b=QLdopz32q2U3z7lj6Gd24Tc4fegGt1+ebgMhRb9Cj4k7ZIW36vNFUYtOQQBxtGQdBcVO
	 +GS47bL7bDf8PPAEsnMczzc8D2kAFeZ/JTAr9NvNRGjMyHAWZ2Y/qyVeDtY7hf5i5repk
	 yt2db9lSz52RsSVD7BnXZVulgXwmvG66KeBsw3Ygi5rcbtzyMulD8QZeypjkZxPbFGTNu
	 8JOYGamt970fjTu4pxPohymfV0s1B12ggqJNTfzumiUowzV88AHVw59tLpsDAIZAX71yE
	 nX0hLe0mA5TfZYE9JNkhDnRCsvdsbK5VYKbIoN0CJYiasQtTW9KlH4TviyJn37feBHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=kguNqPOSlh7fe1C453DDiUzdHElyaO7Alv2xhzvgL+o=;
	b=BTxxRbH4I9eHNfyV3ySyRUHh60OgbCyI1hs1mDLVK7Phz2gsgpvW+97tYtCN24HVZkYd
	 Q1/xbr//9RWbsetFurywvld6gumE1DrX46nnZ/MM+l5A5AB2PX/0SzRt/a08c9y3wCv8J
	 2M3ItL9m3iVIcJJPcFlvL4Nh7ZlbyG6iyHCFKrU/QORf+i6JQm7rh8GndHcEQlz6HvbwQ
	 iO0iuy+LFube4+D7LMbxqliGbHYVrTjIBdYpLc1Av8maXQnWAYjXWt21dgZsOJWoMTCGd
	 I4UFThPO3KLHcfhiBO7CCiXy06tJfmQ5rUhlQvYRdpBOVbDf43MUQ8OcA8Mdho4kJ+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PManqnll;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBE760A2622
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:01:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACBE760A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PManqnll
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c5127c7abd5so170958966b.3
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 08:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795104070; x=1795708870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kguNqPOSlh7fe1C453DDiUzdHElyaO7Alv2xhzvgL+o=;
        b=PManqnllVK0xOEkGqCE76wegtiJG0Z2TXIp2HESL6BcCyUP3+PVwE15QmQ9Y/w4B66
         mnmAVr0khh3Y4Q5jsX1i0gsDukrB/45HkVSjDVCdxEDRZ3gKBGfYSF5YLZoQMUh8rkBy
         GPtz3NJVyq1HpI4bPlG3nzCW4CcsdADA6+/EhY4SR1rYMJNXfXFK8OdSqiEl+MK6IRu1
         y1KBLKPicnEpJaVZA3dpU9b3rH3rQ8u/7tTjzvz8biA/kFCMBw4Uv2M7GohOMSPDzRch
         LzAaDqCdXJCl95q61S0VTpUOeI/8tCYYrxiQqU4losxa044/FCq+bgczN+rvHcliG3NZ
         mAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795104070; x=1795708870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kguNqPOSlh7fe1C453DDiUzdHElyaO7Alv2xhzvgL+o=;
        b=ZeYjI8A4BFhqxgDFAiKSOrcNoCvbmgbdKh7/0o0kXPRw6TKkZnEb9tgDI4n7rM2n3k
         vrzFoboe4MugRVWeBEwdxQ1LedtKoC++S8vF3wseiolID/xgEa9aMah47/CQ35Uf9Isf
         6VzWq5WKzYHq5W5zjxGxAMem/DmimciwMOgaDhBeDRvaiVRcY7i0iRN9+T6vwBeGMtxO
         iRP4ca1I/VOEKSatRxhmf1J4MNlMK75c6WwPbeIhyxJU5fAeAOjrheoFe9b+tG+tHkA8
         GabdfxAP3vEKbG0V5enoGf3MsRl+cnssRTjD1aXDPUDDN7qDcMuBdZgt8dQ9UDDVeaPz
         2fLg==
X-Forwarded-Encrypted: i=1; AL+hErH6/tUTMolnckFYZeMpH1MuenxJ3UHqVI0OedyPMiOOj97BJUwHJSCtjQUJuEFPufqMe/pJX02PJPl/@vger.kernel.org
X-Gm-Message-State: APuU4Z8pzgJxP3kcsUNzuDG3d6xtKt9fMaQjYCShav4c9uKpB3YN+2X5
	DL0f54wwrBMJmZ6RSFVJI8VdsRUG4qonkZ+BbFERipWlv+dfdg0HFWZ1
X-Gm-Gg: AYBFou2EmBbxCoSbQ9Q+sMo2CTMSm9qrIcZJySBadbSeIhV6rm7XQUwTgqISghxmOHQ
	bhk20QBaHHu5wwJgb6Z8R2/eKNPGSRlAb/OV+JdKY5JdqvIl/AH5InayXf5xS+8/qebpVwvmkLo
	xhWtbMjzq4iiH17aRLLQe6oCui4sPkEX6g58Ad/NiP9JD3WnVUwTAolkfCdkfiGXZc8qZpJ8ytD
	4FGSfLLxB55b+fyS3jHUJ49gtp+YEvFx4bvw1fz3J9W5MOX+2ufniRqcwjXUw/azPm8ty3dzGIn
	8Z+HxvVlT4kCwPe1Lwa4n1wOQ+wXRy9zJP2XZTx0jMDmb9FPH4UTIoOiE2L3elDMFUICoxfqfaT
	6NQlqweyjQjaWZ3syjwTvWOXZec1t7FCz2djVIjAdeJU0cJNaa+C/MnsuCpREhOHjJLONkkZL90
	elr6u0RAN5DWQ8kbOnzNqbeo/gLVlmi3oKbMCB6Wh581w6bwnqCobg74+QtXn40yChXUzhzVuhV
	u2m8FjxRinRcSps+QG6iNnqYBbMvNmk+ahXodvs3B/gyXRLyruUH8qgRKQlrb8nQOqFidJyvgyW
	eIfXOOg87DkC4Bh/+Mt1G4A/Tuaft9CI2oabEAYGa20TMhvdkwh8XoNbi3MYr5d7SqbXizNfxWh
	NgafstqNwJ+BfacFtWyw7DM+efnKtqfjyNvE0gegMGsrJ8kH7J+E9lUI=
X-Received: by 2002:a17:907:3e15:b0:c51:249f:7331 with SMTP id a640c23a62f3a-c513a3aacc8mr39598366b.1.1795104069371;
        Thu, 19 Nov 2026 08:01:09 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm323784f8f.44.2026.11.19.08.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:01:08 -0800 (PST)
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
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v3 2/2] arm64: dts: freescale: imx93-var: Add Cortex-M33 configurations
Date: Thu, 19 Nov 2026 17:00:54 +0100
Message-ID: <f52268cdb748fc4fcca95f8de1384054da8d7964.1795103362.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795103362.git.stefano.r@variscite.com>
References: <cover.1795103362.git.stefano.r@variscite.com>
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
VAR-SOM-MX93 on Symphony. Use the common remoteproc configuration and
identify the existing reserved memory with memory-region-names.

Include the common configuration only from the overlays, so remoteproc
and MU1 are enabled only in the M33 variants. Use the -m33 DTB when
remoteproc support is needed.

Mark the peripherals used by the M33 firmware as reserved. Disable Wi-Fi,
Bluetooth and the devices depending on GPIO4. On Sonata, also disable USB
OTG1 because its USB-C role controller is unavailable.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
Changes in v3:
- Move the common configuration extraction to patch 1.
- Use "reserved" for peripherals assigned to the M33 firmware; keep
  "disabled" for dependent devices.

Changes in v2:
- Enable cm33 and MU1 only through the M33 overlay on DART-MX93.

This patch uses the following binding and driver commits, already in
linux-next:

- ebb21cc5d1c0 ("dt-bindings: remoteproc: imx_rproc: Document
  memory-region-names to avoid implicit ABI")
- 8396089f91fa ("remoteproc: imx_rpoc: Use memory-region-names to avoid
  implicit ABI")

 arch/arm64/boot/dts/freescale/Makefile        |  9 +++
 .../dts/freescale/imx93-var-common-m33.dtsi   |  2 +
 .../freescale/imx93-var-dart-sonata-m33.dtso  | 55 +++++++++++++++++++
 .../dts/freescale/imx93-var-dart-sonata.dts   |  2 +-
 .../boot/dts/freescale/imx93-var-dart.dtsi    |  1 -
 .../freescale/imx93-var-som-symphony-m33.dtso | 50 +++++++++++++++++
 6 files changed, 117 insertions(+), 2 deletions(-)
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
index de0e56f322a2..51b4cfe143d4 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
@@ -14,6 +14,8 @@ &mu1 1 1
 		  &mu1 3 1>;
 	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
 			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
+	memory-region-names = "vdev0buffer", "vdev0vring0", "vdev0vring1",
+			      "vdev1vring0", "vdev1vring1", "rsc-table";
 	status = "okay";
 };
 
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
-- 
2.47.3

