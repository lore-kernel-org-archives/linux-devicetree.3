Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584713;
	b=Fu7XLShkn3ZXSzs68Lh9f7+BRet8U57enJMqRnSwmKMBpHc2KhaMuIIpepcT13qRPYOu
	 Vg0xYcpEpF5vVfz9Qzq8Ov4t2FbBuOFSxspPcx1xCR+Wxhe+kNT9gENmTecN9FLV+k576
	 EXkYcQEeDFC7ZGUX0P75HMeI6BYRHHBAEOyBogqE22NvnzvfwLmmWB8gmpIc3nI4d1EKf
	 ka3+xON201vxksAy9YyLdX1VTJC4rqg0QD+ARxFIr3hgIluKhQPnKeDSx3MHR3dSUcLXo
	 o3pbIGIjjQMWv4NoyK4K3N7K/EqFW/OXQbW/4yrwnsGgB1Jtdge0eFaWjLgcLPc1//w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584713;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=5yZ9nFLzi/IVM9qZ/Dl5TkDwqEm3bc7pG3aeLHjq18o=;
	b=udOfr4oGUUFGpgXlxsunhgunHTZSJr/BLuq7WS/5Pd/P/C7RLc1lc4fLpHYyOGviwYk4
	 R4YjhYMTxb1vj14No3xxrr6r9oB3FouxCAx8dKmfSzLwDOwL4xnTVg3Pjn8//zDV+d9cG
	 PFSI5o1nykvVEZj8FrTsKG/qoAMXCwX/lomtORVLpzxZiPI2wRtwnMYXB+RzKlBUCkZ0k
	 RVQdr9GCbPdXublPJ6fZzUAAOSa05tnB0hsLQPC1jFYonxNvG+QQvGdjCHiP9k6bbs0bS
	 UrsZzIDMRH2ZMMrtJMwyOcL2v55b+gZA3geETocx0QlN/6d/srQgrSScL3R7961rfMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jdKnIEfH;
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E8C606A33E
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 15:45:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50E8C606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jdKnIEfH
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b309147589so10471597b3.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 07:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584712; x=1795189512; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5yZ9nFLzi/IVM9qZ/Dl5TkDwqEm3bc7pG3aeLHjq18o=;
        b=jdKnIEfHGftxRbntU8r8avGkfzOgzgW2cYo0zaqOT94pE+T/kT/Oz+U46jW2wXfCrU
         tPFTYhdKFe7KCJK5EKALraqRCmSoIlcY3obKve2csif6Ed7fZw2TrR98jTcunB35cjOq
         js/OHDeYr3rlJsEreFHrrSfG/FLzI9i2/KLeeANcUg1PjAostMpm3c8WBujZNRbSzk5v
         +yuhXNX/x9BFOiPh3KHDyvu42k3QhmmyFyQFlHeOesvKQzeTcPdNwvLDj4LXhyXWNaNP
         kIWqI2a+dGtwN3J7mJWCV6Bh9yHmjNmxrL44H20A5KWKBHpRjR+fTcCoZCXiQ22i05kf
         WaWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584712; x=1795189512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5yZ9nFLzi/IVM9qZ/Dl5TkDwqEm3bc7pG3aeLHjq18o=;
        b=jx4vtesr3OcxCzE4VPvTdIQEQZ9/KrduKQOIFR2GobCMsf0xQbZRvDroHcwX3b4TXj
         H7kz/rRzcVaFud52vKxr4JAuubATNNVoJQyqly4IGg47w+qoFcjLxnr25hThJft1IvlH
         AnsezoHFzuDjteAxzThHijHdrR9g09FQEJoxra4wU5uwqs/bJV/YQjQKlszdS6UqN6Qa
         Hsxf6n/HNOt25B0tpQMjNRaGbIG9MHfmppZzR0evAkGZ8JsDo6KLM0hPokQF1a6jOSo1
         /P6iVzkpXhkdx7n88Ah58kTs2Nx2YKWBY10cQrIybhIk4Q+IGUlJ84pcTr1z2CFRWHYl
         Yvjw==
X-Forwarded-Encrypted: i=1; AL+hErFtF1c57J/4AbBA4FH39chuJyzmb3d1ICsiPbixYqiWn/bwYH0IU9OVvXAqsB7edswA1le6PxvrBkD0@vger.kernel.org
X-Gm-Message-State: APuU4Z9Nd+xqR83YHRCRe2nEqT8AmN4kX8IpYlXkBwbXJii5e/5Diydx
	PYxrOL7Pt44EFasdlPYhu0sOwqnVqvUsiNcINfzyh2HuyyToFFFXFEZo
X-Gm-Gg: AYBFou3q5eIe1DLDAXS7UFnI2a3Wa+dC1tL+6vLgcX32Onedp+JIAEkX5BWmydlVFzc
	UI6uK+viJapU6SyOo1YoTjX54LgIMO8xG5CMajkioP26YYeEhskgqqGAHOIZZtBMrAP+8Ldm6zL
	vmHilQ7bX+a5IdQebk77HjEgw6C6P5HMhQckHxyUOCQvchyZbeg9rzko/QsiKc4AFRyYJMKHDnr
	mkZKIgo2yGDykYU1u9omi97HtfCxN3W7oYx8g5be2NR4d4LVwx0LPKwC7feLF0W+rTxahwK4cSK
	zcONvht6znhwafqGnFKQYhToIpBtjs99bujc3gXESSrz0Eo3ahR7WGaNXuKHFMLo4/w/8eXLkco
	tUVCmrYK+UbNAwmwA8E8Z8nBNwngmsYbhM5ut5Yyl64artFFBY6PUZUpJSs021EXGIwygOB0Oxb
	htC6/nf43Z54pA8kjFPIdOS9mJX5s4GgPG3crnnnSp/qCaGjXBussLhsPO5Fu6bTUjFlyWQwvLa
	eTHaNSk74KWUuc+hJRlwM8mPv+P5HQuwGY4YiKywY5w7TOzePgRnqhcTEAhtfXajZTwkn4WKtbk
	k8HhXlMJq8lIbEQhQBIQfq34cjvUyInc
X-Received: by 2002:a05:690c:389:b0:8b1:e7c:cdd0 with SMTP id 00721157ae682-8b4aa32c3femr17342337b3.64.1794584712093;
        Fri, 13 Nov 2026 07:45:12 -0800 (PST)
Received: from [127.0.1.1] ([179.160.39.42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa98caffsm22687767b3.27.2026.11.13.07.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:45:11 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Fri, 13 Nov 2026 12:44:12 -0300
Subject: [PATCH v2 6/6] arm64: dts: freescale: imx8mp-verdin: Add Mezzanine
 with Toradex Display 10.1" LVDS V2
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
Message-Id: <20261113-v2-arm-dts-freescale-imx8mp-verdin-add-lvds-displays-overlays-v2-6-59c45f0a0d8e@toradex.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794584681; l=6069;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=txaBxqv4+PaOkzLDW1SkXD75PImddU08PwTp86fxwao=;
 b=8y/uTmOJLn+jgmmGpDHs5PgQIZgRYwL6PxoNop4M87VGhiv8aL5HCdlSR3gN3M2fIMCiO7sm7
 yukjShAkecqDHUN1TzYBFzE2aifBUK6ybFvEIVyfZCfznAb4gJNCJGA
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay enabling the Toradex Capacitive Touch Display
10.1" LVDS V2 on the Verdin Development Board with Verdin iMX8M Plus
Mezzanine expansion board. The panel connects via the i.MX8M Plus LCDIF
on the Mezzanine LVDS interface (J10). The panel is an Opto Logic
SCX1001511GGC49 10.1" WXGA TFT LCD LVDS and the touch input is provided
by an ILITEK ILI251x capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Link: https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   5 +
 ...zzanine-tdx-panel-cap-touch-10inch-lvds-v2.dtso | 107 +++++++++++++++++++++
 2 files changed, 112 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 2a4118add28b5..e4020ea6381b8 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -732,6 +732,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw74xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw75xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw82xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v2.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
@@ -747,6 +748,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
@@ -766,6 +768,9 @@ imx8mp-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2-dtbs := \
 imx8mp-verdin-wifi-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1-dtbs := \
 	imx8mp-verdin-wifi-dev.dtb \
 	imx8mp-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
+imx8mp-verdin-wifi-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v2-dtbs := \
+	imx8mp-verdin-wifi-dev.dtb \
+	imx8mp-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v2.dtbo
 imx8mp-verdin-wifi-dev-nau8822-btl-dtbs := imx8mp-verdin-wifi-dev.dtb imx-tdx-nau8822-btl.dtbo
 imx8mp-verdin-wifi-mallow-tdx-panel-cap-touch-10inch-lvds-v1-dtbs := \
 	imx8mp-verdin-wifi-mallow.dtb \
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v2.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v2.dtso
new file mode 100644
index 0000000000000..b78322907192a
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v2.dtso
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" LVDS V2 on the Verdin iMX8M Plus
+ * Mezzanine LVDS interface (J10), used with the Verdin Development Board.
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-lvds
+ * https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine
+ * https://www.toradex.com/accessories/verdin-imx8m-plus-mezzanine
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8mp-clock.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+#include "imx8mp-pinfunc.h"
+
+&{/} {
+	panel-lvds-native {
+		compatible = "optologic,scx1001511ggc49", "panel-lvds";
+		backlight = <&backlight_mezzanine>;
+		data-mapping = "vesa-24";
+		power-supply = <&reg_3p3v>;
+		height-mm = <136>;
+		width-mm = <217>;
+
+		panel-timing {
+			clock-frequency = <64500000>;
+			hactive = <1280>;
+			hback-porch = <20>;
+			hfront-porch = <20>;
+			hsync-len = <2>;
+			vactive = <800>;
+			vback-porch = <5>;
+			vfront-porch = <5>;
+			vsync-len = <3>;
+			de-active = <1>;
+			hsync-active = <0>;
+			vsync-active = <0>;
+			pixelclk-active = <0>;
+		};
+
+		port {
+			panel_lvds_native_in: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+};
+
+&backlight_mezzanine {
+	/* Verdin PWM_2 (SODIMM 16) */
+	pwms = <&pwm2 0 6666667 0>;
+
+	status = "okay";
+};
+
+/* Verdin I2C_2_DSI */
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili251x";
+		reg = <0x41>;
+		/* Verdin GPIO_3 (SODIMM 210) */
+		interrupt-parent = <&gpio1>;
+		interrupts = <5 IRQ_TYPE_EDGE_RISING>;
+		/* Verdin GPIO_2 (SODIMM 208) */
+		reset-gpios = <&gpio1 1 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&lvds_bridge {
+	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
+			  <&clk IMX8MP_VIDEO_PLL1>;
+	/*
+	 * This display uses 64.5 MHz pixel clock, so IMX8MP_VIDEO_PLL1 needs
+	 * to be 7 times 64.5MHz, or 451.5 MHz as the internal divider will
+	 * always divide the output LVDS clock by 7.
+	 */
+	assigned-clock-rates = <0>, <451500000>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			ldb_lvds_ch0: endpoint {
+				remote-endpoint = <&panel_lvds_native_in>;
+			};
+		};
+	};
+};

-- 
2.43.0

