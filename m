Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584697;
	b=oQLOvHEBsgUbf0fgf7qC8Eps6vGykYfSf+6O8gzxEGcgQ8LFI3Wb6Ej9TDqujcZhTdlZ
	 vNqioNobcMAeWZ/uXL5HWfZi5EBO3aS9ztD2y8nKNeMi2btkAwz19KRRtgsmzW49H7Sdu
	 ees2mrPOpkPaUPKn9WCZA4DZfUbDjU/lDVv3UKOsaNQDRxXhiaQ6GDIK15xYf1p9gc6v9
	 QNsAZTKezoduDNzy+0vwkMvb7BExaKQcmRmMYK7GMvti9/3N0FCRBR1ClbV9edYZ/4MBV
	 g0WKkDmdiDsLlIvsVahpQyWIlNCKoxUbkuiaNQO73ApfRO/z/rOYZAiA2MD+ZOLcHNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584697;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=HzZaPDLW6Ok2/D816MTzOvdhBrNsHMyuYZFKk6EjbIE=;
	b=djIE8wUUqzd4DwXfpnLlrnBhrplSWPSZqAP6004+ErKoqkiXC0fVoI8AMeRzje59iOIR
	 E8rER1awtE+sr7DXoPTZ34h5c75NKnHoqQ786QZY5c/ob3CAxULNacSVaEVISv701Hds+
	 ai08jHPcCFOBdo5rDLq9uoIVwYqAEgVcDpkFjczZ1+HDRVjhygkmnvyVXzmEJ0ngMNs/5
	 aRwqbRDi8vo0vuIeSDUam17NbtoY5BMb8koK79JaPA0xcQGTVQpqrAn1f5fQNNd5ho1l4
	 0Pi9fu4M2yzf44U3bhgaeeQRGEk7oMB9S1u7ccPCa0Fqnd1t7DcjoEFaVaAOsalcVdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GmFPDRsY;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB406606A883
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 15:44:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB406606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GmFPDRsY
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b4a15c84c5so10592007b3.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 07:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584696; x=1795189496; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HzZaPDLW6Ok2/D816MTzOvdhBrNsHMyuYZFKk6EjbIE=;
        b=GmFPDRsYr2kM/ZpRS48pfe5JYfbSXIHtrblHI8lOgoEVNNG4m6Vw2XAdc7lSpaVxcY
         ZoDxREU0Op+VC1bEX+4V8UR/mNiTWHiPC8NEGb7QuugwMjL1b9pcYKx3T6I5xdjkJpd8
         965MjYMXQvuYRUdVQUOkJxImEdnb+W/YldDhmcM0IHSfiDFfQnQiTdpz8N5iIDdY8Ps3
         5wBNd3DvSIpw25rgHsPJ44DvOAJVHgvRgWMixu4gSd4dk1hJO/8jFu2+VmQZDDmSK/u1
         4DctIBwcYmoY9swKKsAMjllMDRknWwjtHn+RQueXp37slW9DEBtQaDwQap/QJ3IroRCY
         wnZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584696; x=1795189496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HzZaPDLW6Ok2/D816MTzOvdhBrNsHMyuYZFKk6EjbIE=;
        b=qx3B2JBt1sC7u2H3JMk/M9NkUJyp38HFgOCtN3+RPHdvVww7z+Lg9susHSctzaWcG2
         FwBiwfTkNX4KJ6hU0UodaEeJjpwNmLVu/qPncL6UlKILA4P58bdpKUHUHqPOAdhb8S/9
         p6oEUV8hWpSiWXmPdaUyZxdB3cwTbuUZ0lQCZ7zjn/SGfRDhBh3GDucYKRzZt8okTGJk
         8XZgD73W/WqfxQjFK9yY8g+r8pnRHW3XaqsdqGZ1el5TAL7ZUAolztaIHq7loHyZc/es
         58SPHhFmL5SvGnUsaSxLPUK2vZDI40DDcYPyhu42vWw833kerQZZ8Imi9QPf+zgw59DA
         /Zyw==
X-Forwarded-Encrypted: i=1; AL+hErGtWFXQrO0A1bgnGFBLfxnSaJ4rXZfiFBC17XnmT9t+w047K9Qf8rGFCm9nwelWCKjPVJbc907BUP2d@vger.kernel.org
X-Gm-Message-State: APuU4Z9alBSU+XNOaxj9uLV7uQAa4TTX35QBAxceUxFTAEZf6gbd1PHX
	sQELisQYlSuQW11/Hif3/ufw5Y6KA6JoPNeI3mducJo1+wlzbzaqtFCy
X-Gm-Gg: AYBFou29VnPDyULMs4u/fIj7rrw7P7sFNnkVSAXje8Axj3ttqenNKDlJb1L1sb5w4Vk
	pRJZKfKBZPPSQZ63mdpM16sUSrnLzXcVcInoMZhu9eAocVirQIUtO5z9/xuh7+UaxkXDITtJxR3
	JNftT1pM7kC66mKkEPPakejYxVif2Y+t/qhWSOrA5/VJXwiKxk7RLyvtXwlWTidOPd7ZaKONG3i
	1YJpsaCIzNpGL4OqTglqi8VKV37mOPku2v+38/8a4NJVRe8Is1CBKLRw6RMJsWCD9xwWWNad/nl
	kI/HbLnHI2AFsXVKaokhRlHTEPr2W1WkfSUlhW83z4gk596V2SehrbwgZxM/2LSiUzMR4yfZlfi
	PZkxglQaGZjNORDqz55sp2Ullnn0ACqm+3S4JnhPYeJ1zevZePmd46kGtnVSiu/GOlotl1Kstzi
	wk70ch7hsMvF4yasY3VgxkpnIg9MihWsfs0FXDWNsyoC4NequCq1X7kkfwIg+bF8+Z7Eko+zHTK
	RqUay0JbW0TNcslpkRKkp3ZLAQTUjMgFo047mnA5ULMeQLgaev0P4BoOK61j4Zy5zLSfM31EYMy
	nTakNyCFq78HrEBSnE1g/sFm6LR4pSCI
X-Received: by 2002:a05:690c:f8a:b0:8ab:485b:9bc8 with SMTP id 00721157ae682-8b4aa257b89mr17110137b3.24.1794584695620;
        Fri, 13 Nov 2026 07:44:55 -0800 (PST)
Received: from [127.0.1.1] ([179.160.39.42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa98caffsm22687767b3.27.2026.11.13.07.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:44:55 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Fri, 13 Nov 2026 12:44:08 -0300
Subject: [PATCH v2 2/6] arm64: dts: freescale: imx8mp-verdin: Add Toradex
 DSI to LVDS adapter with 10.1" display
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
Message-Id: <20261113-v2-arm-dts-freescale-imx8mp-verdin-add-lvds-displays-overlays-v2-2-59c45f0a0d8e@toradex.com>
References: <20261113-v2-arm-dts-freescale-imx8mp-verdin-add-lvds-displays-overlays-v2-0-59c45f0a0d8e@toradex.com>
In-Reply-To: <20261113-v2-arm-dts-freescale-imx8mp-verdin-add-lvds-displays-overlays-v2-0-59c45f0a0d8e@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794584681; l=5177;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=T1cPEZIk+cuERyGphRtG8eWr+AAKWp75eJwZYeMfJY0=;
 b=LHKy+f8d1gKR/GQgJynp2HgVYUNYmk0XOSunC+OOaw980MREimd2/L5xubXvJDkIdWBDQcgh4
 uRE4lIFrIVkD1TX4bIvf5s3tzcG6LCXacLKXzfpm83SN8yT2NiDNGMi
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay for the Toradex DSI to LVDS Adapter with the
Toradex Capacitive Touch Display 10.1" LVDS. The adapter connects to the
Verdin DSI_1 interface. It is based on the Texas Instruments SN65DSI84
DSI-to-LVDS bridge and drives a LogicTechno LT170410-2WHC 10.1" WXGA LVDS
panel. Touch input is provided by an Atmel MaxTouch capacitive touch
controller.

Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-adapter
Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |  5 ++
 ...-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtso | 94 ++++++++++++++++++++++
 2 files changed, 99 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 79ba27665f4d2..4cd72926b80e0 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -731,6 +731,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw73xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw74xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw75xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw82xx-2x.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev.dtb
@@ -740,6 +741,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
@@ -749,6 +751,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-zinnia.dtb
 
 imx8mp-verdin-nonwifi-dev-uart4-mcu-dtbs := imx8mp-verdin-nonwifi-dev.dtb imx-tdx-uart-mcu.dtbo
+imx8mp-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1-dtbs := \
+	imx8mp-verdin-wifi-dev.dtb \
+	imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtbo
 imx8mp-verdin-wifi-dev-nau8822-btl-dtbs := imx8mp-verdin-wifi-dev.dtb imx-tdx-nau8822-btl.dtbo
 imx8mp-verdin-wifi-mallow-tdx-panel-cap-touch-10inch-lvds-v1-dtbs := \
 	imx8mp-verdin-wifi-mallow.dtb \
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtso
new file mode 100644
index 0000000000000..da05a02568893
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtso
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex DSI to LVDS Adapter on Verdin DSI_1 with Capacitive Touch Display
+ * 10.1", used on Dahlia (X17) and Development Board (X48) that expose DSI_1
+ * via a Samtec LSS-130 connector.
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-lvds
+ * https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-adapter
+ * https://www.toradex.com/accessories/verdin-dsi-to-lvds-adapter
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	panel-lvds-bridge {
+		compatible = "logictechno,lt170410-2whc";
+		backlight = <&backlight>;
+		power-supply = <&reg_dsi_lvds>;
+
+		port {
+			panel_lvds_bridge_in: endpoint {
+				remote-endpoint = <&dsi_lvds_bridge_out>;
+			};
+		};
+	};
+
+	reg_dsi_lvds: regulator-dsi-lvds {
+		compatible = "regulator-fixed";
+		/* Verdin CTRL_SLEEP_MOCI# (SODIMM 256) */
+		gpios = <&gpio4 29 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+		regulator-name = "DSI_1_PWR_EN";
+	};
+};
+
+&atmel_mxt_ts {
+	vdd-supply = <&reg_dsi_lvds>;
+
+	status = "okay";
+};
+
+&backlight {
+	status = "okay";
+};
+
+&lcdif1 {
+	status = "okay";
+};
+
+&lvds_ti_sn65dsi84 {
+	vcc-supply = <&reg_dsi_lvds>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			dsi_lvds_bridge_in: endpoint {
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&mipi_dsi_out>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+
+			dsi_lvds_bridge_out: endpoint {
+				remote-endpoint = <&panel_lvds_bridge_in>;
+			};
+		};
+	};
+};
+
+&mipi_dsi {
+	samsung,esc-clock-frequency = <16000000>;
+
+	status = "okay";
+};
+
+&mipi_dsi_out {
+	remote-endpoint = <&dsi_lvds_bridge_in>;
+};

-- 
2.43.0

