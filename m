Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792678182;
	b=EOg+uhhA2xIcTXOYFm4aHI7PEYZPHQqNaC09991LUtFcn2rMSsg9p2OdC46VceCbKvN9
	 JUCp9Pc9hi352MTLC0iO2Fffhqn954+M1Nayj7I4RQec0yx9NSBIGSd+DbHewnikFnc6q
	 v9nrf256j6jFWVLZme7rwxj0XGjin4YIJS4hQZm2crBLNSMaIAN7eclXk+Zgqoyhq1ygV
	 ycPrIwYysjMFn8fkigFQ074u7yIuuuVxABO2VAugMSL/0D96aHF0x/YK4TC6freald0Ln
	 cFIUeDBLSkBSeThEXg00lI3D58HVOBASg2r5GmUWFzVJIXtQkrR7gnQqJWONiVs86bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792678182;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=UxR1vV0a0gQBYDHK6NtA7PO5bZkmmtV5vXJv9zlPOvU=;
	b=IaQ0poYNUUNF9A2w6mkPnTPxRsPrHnkEGdAAbDvo6GYL0CJ2jeGXolaMJ+/vDLOgougU
	 q4cRPGftz8jW0Jr6KCKRwELSZJsyeCAv6Hs38+1T4ouy9ufq78YqILaPo8MTa0+URyhnT
	 e6MnBDoeFcmBLi79QaCQelCmNLZEZga1vhYxHcPrG/Fl9dfokIj47By0fxXJinkXLT9U3
	 XoQ9ZiAqYZHNQH79QwAMML3f0JmpLxbrd54IpGe2J5pPI7GP0kw3FnrkUGVudldktNTs3
	 uclMYWWs6NXDaHW3ooNGL76qgczIVr/n767r3hFUIdA1QX296GRjh9kJYlzWtSeclTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CIsMOfPh;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F74606A322
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 14:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3F74606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CIsMOfPh
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso1560619f8f.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 07:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792678180; x=1793282980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UxR1vV0a0gQBYDHK6NtA7PO5bZkmmtV5vXJv9zlPOvU=;
        b=CIsMOfPhDCLPWTQWzUAPvJQb+twWZIQ9eqIFofDc7OfXzdZ45hhIv34kAIReYNnzGK
         NzYokkYokmtMW7ka+m15K3ucPtuWqRJXGQKc+f8pe3A6WIT77i3n27DT/sWQJFu3QFyd
         lmdl2Su6QGbT8eH4kYcOPbOAtcIHyJT7rzRWNcr3BcqT70jx1bSrDDEWukV+cdDZNGKX
         hG2Dc+86FGmWMJU0JMUMf5ZhbUEV2Qp67OB4vVPmmImBtbe/7i42jc43Zj0ONCJWemaV
         4TmWDeQXg7SKAzUivQGovGAg88fbjKG6n7GE8tWSZH89h5K71z8AzKd1KQGfl3sRYNYS
         GtAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792678180; x=1793282980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UxR1vV0a0gQBYDHK6NtA7PO5bZkmmtV5vXJv9zlPOvU=;
        b=XZ2t2+mt0VuUFI7Ld+g90TSo4GfcWPt7vRhaPHKHqSKCs75GQwT6t5m+o1bKRDaupK
         F1hoej4Js/y2Xw6RCz5DV3YnvLrOCRk3nyJpoJ9Q/PfKHribcITnstBvFAtfnHkavzOs
         0OkBM8/LP56pM4pYymZma+H00z+394SzlhmrQPBGbYrj1NDO/2fcccntCYQBDcb5p/RG
         CGUKPDXO6OgmTS8CYb4Cs+qNUDSFdUO07rqc1mUU3hwFzeN7a+Rr3tlxv8Z+fVCImRfy
         W/4vRA4XHxj2FrXhE/baw8YZDRFA0nJOrHYnkHZ1lfrp3is7Jr63bqnpa1eTp/YZDkzm
         dL/w==
X-Forwarded-Encrypted: i=1; AKwUvBwbd7TgAWgYzkuy4Bd47+ORho+7bZtHpZ+856tunXePCvFSOBxognWY91yyzU5eJIVGp/AYcwjGLZmq@vger.kernel.org
X-Gm-Message-State: AFq9FYJHEv4ekL90/w8pmfiZCTfeX/QfLj3iITXg6X0OKcSmPX6YIFGH
	0sn3VXll29szUIOYKinwHOzvvZLecrWC4+AuBQAsoUe/UmuvlvXcNGQ8
X-Gm-Gg: AYBFou1LhlB/+cyw4Egqn5C1f9Krby5a9Xb9Y7REfjLj3URTo0IhoMQ001dL5r1uWer
	Hj5qj8o5K2xhTFuN1f0VU3rwhFC5mqz7ykg3Eb94cQyQW1o0ZZrfAFUibThQ9xfQvOBJnPPMzUa
	7Smm0ElK1vfGZYwNY/Vzm7LAQDyYCYIaNw56gBbtlwroeQqQg+gaueRZJlDaFe92lqW4tg+j7s4
	WIxqBGEXZXx+Qos3K2DppmFS1B9yiWYzP0NIDVx5y9hSD6GoFJrjJ6tW5A4H5wipgW78xKFtKCP
	IZ9Fu1Tt2o9FCehk6nSOQlZwHMxwW5c41gdFoID+hsRpcyAz1ThIbEIkD/RKwxMpM0klJ1oQFZr
	uES1Ps/2QLNVpYV1LngUC1u2H4EicYnrKltCVyWjQDuV0oBwSHWmNkOTfUNIvrL1HxEBA/RXlDD
	VJhB8hkiGB7aZEm/VE38t8/Jr3hoBvVl+vHSBKR/ouyJyfXneDX6Fjm4jRzw87efOgi1tVhsD3q
	W9vjYEi9YTBQacouiiObKyA+VsqVxVJ3GT8UH2ET4FqXEAyDS08suU1Ee3uDf9hpgkkl5AJwQTs
	h0bdmvM2Veqpgsq85ay9+mfiGEsI2y0YI78EgHrN298bpf8BavgTdCo=
X-Received: by 2002:a05:6000:26c9:b0:48e:1299:663f with SMTP id ffacd0b85a97d-48e264f1802mr11901050f8f.56.1792678180098;
        Thu, 22 Oct 2026 07:09:40 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2584e760sm12368150f8f.59.2026.10.22.07.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:09:39 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 16:09:33 +0200
Subject: [PATCH v2 1/5] arm64: dts: freescale: imx8mm-verdin: Share the
 UART_4 MCU overlay
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-v1-imx95-overlays-v2-1-c769d6eb54fd@toradex.com>
References: <20261022-v1-imx95-overlays-v2-0-c769d6eb54fd@toradex.com>
In-Reply-To: <20261022-v1-imx95-overlays-v2-0-c769d6eb54fd@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Verdin UART_4 is the UART the module assigns to the Cortex-M4F core.
Other Toradex modules also assign one UART to their Cortex-M core, such
as Verdin and Aquila UART_4 and SMARC SER0 on i.MX95, but on a different
UART instance, so an overlay naming the instance cannot be shared.

Label the UART uart_mcu in the module device tree and turn the Verdin
iMX8M Mini overlay into imx-tdx-uart-mcu.dtso, which reserves the
labelled UART. The combined Verdin iMX8M Mini DTB keeps its name.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                     |  5 +++--
 arch/arm64/boot/dts/freescale/imx-tdx-uart-mcu.dtso        | 14 ++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mm-verdin-uart4-mcu.dtso | 14 --------------
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi           |  2 +-
 4 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a80cccf34eb5..a40bcbe4876d 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -107,6 +107,8 @@ dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-tqmlx2160a-mblx2160a-14-11-x.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-tqmlx2160a-mblx2160a-14-8-x.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-tqmlx2160a-mblx2160a-14-7-x.dtb
 
+dtb-$(CONFIG_ARCH_MXC) += imx-tdx-uart-mcu.dtbo
+
 dtb-$(CONFIG_ARCH_MXC) += imx8dx-colibri-aster.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8dx-colibri-eval-v3.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8dx-colibri-iris-v2.dtb
@@ -268,7 +270,6 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-panel-cap-touch-7inch-dsi.dtbo
-dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-uart4-mcu.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia.dtb
@@ -298,7 +299,7 @@ imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := imx8mm-verdin-
 imx8mm-verdin-wifi-dev-nau8822-btl-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dev-nau8822-btl.dtbo
 imx8mm-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := imx8mm-verdin-wifi-dev.dtb \
 	imx8mm-verdin-panel-cap-touch-7inch-dsi.dtbo
-imx8mm-verdin-wifi-dev-uart4-mcu-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-uart4-mcu.dtbo
+imx8mm-verdin-wifi-dev-uart4-mcu-dtbs := imx8mm-verdin-wifi-dev.dtb imx-tdx-uart-mcu.dtbo
 imx8mm-verdin-wifi-yavia-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-yavia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 
 imx8mm-tqma8mqml-mba8mx-lvds-g133han01-dtbs += imx8mm-tqma8mqml-mba8mx.dtb imx8mm-tqma8mqml-mba8mx-lvds-g133han01.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx-tdx-uart-mcu.dtso b/arch/arm64/boot/dts/freescale/imx-tdx-uart-mcu.dtso
new file mode 100644
index 000000000000..001bc3286e8e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx-tdx-uart-mcu.dtso
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Reserve the UART that the module assigns to its Cortex-M core, labelled
+ * uart_mcu in the module device tree, so that Linux does not claim it.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&uart_mcu {
+	status = "reserved";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-uart4-mcu.dtso b/arch/arm64/boot/dts/freescale/imx8mm-verdin-uart4-mcu.dtso
deleted file mode 100644
index 8dbecffe9e7b..000000000000
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin-uart4-mcu.dtso
+++ /dev/null
@@ -1,14 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
-/*
- * Copyright (c) Toradex
- *
- * Verdin iMX8M Mini UART_4 for Cortex-M4F
- */
-
-/dts-v1/;
-/plugin/;
-
-/* Verdin UART_4 */
-&uart4 {
-	status = "reserved";
-};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
index 4f64c5da8d15..1ac9d000d415 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
@@ -776,7 +776,7 @@ &uart3 {
  * Verdin UART_4
  * Resource allocated to M4 by default, must not be accessed from Cortex-A35 or you get an OOPS
  */
-&uart4 {
+uart_mcu: &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart4>;
 };

-- 
2.43.0

