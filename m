Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584705;
	b=xwAg2YFZUnsEGsUtue0i6EFU9+OYAv4CDfaPaFugTz2903hRjg8rVhQpYLMmk+0mZcjO
	 v6gTs9elSVRfxIDak2OiGDp3QyJs1azSX6N0h7canZ4MiwbmuMZU2BHf/w7P+sSTE90pY
	 mINzuXsIdZtwzKS+9vQYauqfDXipPjKO/RVag6JpV99UDAmf9ZROUpvyd63luuJiColO2
	 H5uq9KgBnIxrTMcEs3wLY15GgkCCDDdi9xa6c9ruGdFavAsmmgMp5yZf+A12dm+OnLboj
	 +cShlAEAnka7/JWzElXSCkMbiPWhWDB8hBRp/q1FfuEZZ7682vF17mkSKE5aHF5l7Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584705;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=SL7U9XOTOx+APgRR8YLQnTh8OeScFnHHAxVLwwDeNFU=;
	b=A+7N1DdWhqw5agbNQ+DNPdUm/3izN61MNif24noMk44LDwLAmhjM4QLLjNDkr3SpreAW
	 Rv0dodmtiNwq1mlhMvTRN5Dpyiy+CwVHJzGhxjVO5OJH5mbSQmMwMToPTV5acnNQAmfJW
	 SdlxjVcaRazYpzKkqmTpCCXDnnYUNaVKyRiCxh4zI0oy8EgsYmA/SKIDXIVnNFOXNwt2e
	 lYlcLT60+76xGe7ucmi33A/Z0XfLW9Ffpu9vv0D8/O1GhyotPzPQbmSGx7kOa93T89N2N
	 pyeqWFI4u9ICuiNv/Y5ftjX7nGSjA8ueX+ZPQSg1iWkWQK4l2Ma0EE1pzahB4cgvRFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HXMWARFE;
	arc=none smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778B1606A335
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 15:45:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 778B1606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HXMWARFE
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b4b2e52baaso3824227b3.2
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 07:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584704; x=1795189504; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SL7U9XOTOx+APgRR8YLQnTh8OeScFnHHAxVLwwDeNFU=;
        b=HXMWARFEgb+oAe0mg7pMHhDOeDxO4GH5Vrq9jwy0K1gmAqkkTZ+SPTah+oh7xsMiC4
         oFOBvp2+0WGoYo15Ezwiryg3ow/sq2H+mHqxo3xaiJ/CRXQ5mV2PMHkIXNDQurg9QkVf
         rp1JqGGgz6SgLzuTtuTZLdQTTYeZzG/6YTOgfCjVAXAxeRbQD7YI8lfv5D3FIfy7BwXK
         eFSfpr4wCmjXYzT/gzYzf7fTi/q7IxleV7NP0sher9IptJrDv5vA0dw5EsUHncwNR9Le
         BJteuEslHDqSugIgJzMxQUq7Jic27AgL3is3evBL2CcR1eIgtoWymeO0r+e/KDJ3npjZ
         u66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584704; x=1795189504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SL7U9XOTOx+APgRR8YLQnTh8OeScFnHHAxVLwwDeNFU=;
        b=CZPDP+CjNoXIbTkrxF+hh+2LEDOru4IlZKucbbvBDMxyRY5F9pwsIuep+WrFW836Gf
         HwoDz+LW1+Kyy8Qnp0mZurEQBaIil1xxU2Z03ANs7jTLBjc6XEhlUov2qNAq/LQvS+u2
         bDHTzYhoFgKhBnKkKouFfUK2TITUkEN5cEWsqPEs678EXFD8W6gYsYw0VwJFWxpd8Xui
         U8pZzWK/IV9N9WQvj1MUjxZddyhxAFnLJXfNMAqwGVTPvQGVp2K43yey3AvHKG61lfpD
         gSw2CFZQ5IVIslNY0CSwUh9tIzgMX8KE1fX+nkxXWYnJwgdSmkY5cQwiF+q9McjPeKUm
         j6GQ==
X-Forwarded-Encrypted: i=1; AL+hErHL04j9Iq3ZLSQDKzjL6A7yseerQL+S4kVeVFmG4d1LxovT0LIb/TP+vCFX6X5SLPnUf8Hu79IZxskY@vger.kernel.org
X-Gm-Message-State: APuU4Z9EPkkleOxbZE7Qs9nxQxi5H5AMno15GxxPDyqhCdf5x+5n4q0P
	j+SfHwAFzDxjqWMOkVjFa0XvrW4U8v178GuKeRYTB2aPBywC8rXDekdS
X-Gm-Gg: AYBFou18dWzwYswpLhTLbEZ3SEBl/eEKa60etSgQ+0BNuRNWE+607jcrGdSsVLK+Phq
	G53P9/zeqg0nFmicNqqCjDeUopnTcEpSuolldklIxO8ANmWH6XXbZQQqHJHyCPTH35ItRX6liwE
	Bjo947vmA2iANCG5cEQpEEDNWSRS777vmjtGUSfSzaCfNSKifdyGY0sIxM/TtVo43j+2ecDtF8A
	Q62DgmRLZYGlZSE3c5qvDSQI0tX7t/CPJiLnYTb8QR86fj40jvFP2T0JX8toad+Lw0KseaFK26C
	TQkXteJCfRPh4HQkKLu7nQkS8EFqJj2hcCB1mUi06b94gejc4A/wCyOTuU0T09zqM6Ufqg5XX3q
	tVeVV1vmooNps4nu7dhdfxEzv7B71Kssv21hexoWSGJte/T3+uUyAeISdKl4bVemSiNfO2YY7rr
	fsHsarfHlYux89r4ziF7I3TgbdNPpqpS/+80vWHpYqgczClV5PsKJso1Snj5iopvaMcnesxAniZ
	Ew/fozD4hZTqhiDK76y0VRKJz0jSx4p4RGaaFC6xVLAL+LLFdKUzz3e8xDh9v109O08jXlsG6Fu
	eG0my6iTpenkwjCibkI+HpPEZm/zRYhi
X-Received: by 2002:a05:690c:19:b0:8b2:9c73:95aa with SMTP id 00721157ae682-8b4aa3c17dfmr16559497b3.68.1794584704381;
        Fri, 13 Nov 2026 07:45:04 -0800 (PST)
Received: from [127.0.1.1] ([179.160.39.42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa98caffsm22687767b3.27.2026.11.13.07.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:45:04 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Fri, 13 Nov 2026 12:44:10 -0300
Subject: [PATCH v2 4/6] arm64: dts: freescale: imx8mp-verdin: Add Toradex
 Capacitive Touch Display 10.1" LVDS V2
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
Message-Id: <20261113-v2-arm-dts-freescale-imx8mp-verdin-add-lvds-displays-overlays-v2-4-59c45f0a0d8e@toradex.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794584681; l=5946;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=aCRXq5ggGAK0uezl8OeiOliynvx2lSh59aVdl5UwyoE=;
 b=ZLl09oRDrgj0qFrvx1+g1k3SBVWb33UfmuULHRjl3TW6/lpRWdHewv41x4OqGTbG3O+o+jb/v
 B3QeEJxo6qLAi6Nk/emeF3zSufNsZ6v+lqy4RQdF9LF9FCOePBlrI0x
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay for the Toradex Capacitive Touch Display 10.1"
LVDS V2 connected via Verdin iMX8M Plus LCDIF on carrier boards exposing
LVDS interface (e.g., Mallow). The panel is an Opto Logic
SCX1001511GGC49 10.1" WXGA TFT LCD and the touch input is provided by an
ILITEK ILI251x capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   5 +
 ...-verdin-tdx-panel-cap-touch-10inch-lvds-v2.dtso | 118 +++++++++++++++++++++
 2 files changed, 123 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 915507fe936de..51c74fbb8e0ce 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -741,6 +741,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v2.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtb
@@ -748,6 +749,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow-tdx-panel-cap-touch-10inch-lvds-v1.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow-tdx-panel-cap-touch-10inch-lvds-v2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-zinnia.dtb
@@ -763,6 +765,9 @@ imx8mp-verdin-wifi-dev-nau8822-btl-dtbs := imx8mp-verdin-wifi-dev.dtb imx-tdx-na
 imx8mp-verdin-wifi-mallow-tdx-panel-cap-touch-10inch-lvds-v1-dtbs := \
 	imx8mp-verdin-wifi-mallow.dtb \
 	imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
+imx8mp-verdin-wifi-mallow-tdx-panel-cap-touch-10inch-lvds-v2-dtbs := \
+	imx8mp-verdin-wifi-mallow.dtb \
+	imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v2.dtbo
 
 imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtbo
 imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-hdmi.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v2.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v2.dtso
new file mode 100644
index 0000000000000..6b0c1a10ae2a9
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v2.dtso
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" V2 connected via Verdin iMX8M Plus
+ * LCDIF on carrier boards with a Toradex standard LVDS display connector
+ * (e.g., Mallow).
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-lvds
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
+		backlight = <&backlight>;
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
+&backlight {
+	/* Verdin PWM_2 (SODIMM 16) */
+	pwms = <&pwm2 0 6666667 0>;
+
+	status = "okay";
+};
+
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili251x";
+		reg = <0x41>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2s_2_d_in_gpio>,
+			    <&pinctrl_i2s_2_sync_gpio>;
+		/* Verdin I2S_2_SYNC as GPIO (SODIMM 44) */
+		interrupt-parent = <&gpio4>;
+		interrupts = <31 IRQ_TYPE_EDGE_RISING>;
+		/* Verdin I2S_2_D_IN as GPIO (SODIMM 48) */
+		reset-gpios = <&gpio4 30 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&iomuxc {
+	pinctrl_i2s_2_d_in_gpio: gpio4io30grp {
+		fsl,pins = <MX8MP_IOMUXC_SAI3_RXD__GPIO4_IO30 0x1c4>;	/* SODIMM 48 */
+	};
+
+	pinctrl_i2s_2_sync_gpio: gpio4io31grp {
+		fsl,pins = <MX8MP_IOMUXC_SAI3_TXFS__GPIO4_IO31 0x184>;	/* SODIMM 44 */
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

