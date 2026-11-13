Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585139;
	b=uYaZ7udRJk5QHj7P0JXHWvc1MMZlTy23mIhOtjFZWBZnZQqQ1tUo0hUyT94h2FQ3jEmt
	 0fzGU0An52JcJAuBScSfwhcQgU6Uhyr5+g7wbS/LatvcIkIVr9q/VJmpducYjSy0GlYGF
	 P0n8JofROyfDZyIqMnpu5DGJUNWanyMo1ejCOICsrLdHlQcOKL01Xwr/XWnuDBoCs7uoj
	 N38UHrhY3iTx2CiavRYuVuPnPpsehn1CrUU0aaEKcKDExStMqzb7Xk2NhzXiVRDwZp0lw
	 n6m0XRBuTwLoH/hA8L8QUrSNhpT30X/U61icJJ5fOBhS9tMMQBUD5552GHLJ5cedNkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=DWMbNnBwrSvxR91OdU/d68rdNUGtXeSdpUo+91mTRCQ=;
	b=r9yoPd49f4NfQRbe7lZhzZgMTs3iVcYcE6QaWFizdPVHojcqivXK12+a5tNFKIQvMiMG
	 fOQA33WB7stNDHtgd7qoz2pNYoFumye1zRvRD2QVdkNZI2LRML+mq/aW3XMC6e/E4ZsOb
	 UGxZunfj1Hl9/voQjM0hDty6uh2J1eSx248r/JW5ziKnKosKhy1AE9mwGcwW3dX5HCHyo
	 wit/r4IABX6UTpxwzQa2q5BTiw7ka8MwFRCoLn/lhKPHOmeWqXg6Ei1i7a9AcCv8hB8xS
	 ozyS/mUXXSbKju0AvrzBXzP3poEqoTXSeVKRApx/hNvawECCYJXuZfHbVOtFDL2MCXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0MutDwwt;
	arc=none smtp.remote-ip=209.85.217.46
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710E6606A338
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 15:52:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 710E6606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0MutDwwt
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7d2e43ff4b4so2543724137.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 07:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794585137; x=1795189937; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DWMbNnBwrSvxR91OdU/d68rdNUGtXeSdpUo+91mTRCQ=;
        b=0MutDwwtiDhIyG5X97yWFC0T4k9TkaLlFbyagUJ5vqR4OFn2D1GtpBRnhvwtBZDVnZ
         0K0ZdQLraoeJLMIEF+KvCWaXN/wgozkyPzbPZsvE9mfr+lIAwC8fqqdymRqPrtmUsAEa
         pTOmba5Piji57x39TvXXhI+Ti7EujC8aMniW+BB/i9coLOi6otsoI7tSih1ox+ft2Vl9
         Zx2J8VcrA2M29JYqxvF6Hdcv2IgbQXZ1nH+nKeY+x13f/ezFWxB2cfcLuGat18ucEFli
         BesAG/0k7RXqNiqpNwjtQHiinMA0bhSldLNhii6DZwCXKarC1twNFvNxn3l8bC2b21dw
         oOPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585137; x=1795189937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DWMbNnBwrSvxR91OdU/d68rdNUGtXeSdpUo+91mTRCQ=;
        b=M3rukfsFlBpayaxeOaZC8e2qx+lzJ+3H+xQdC/M39L07sa6sWJQk4BD7sD4yfyRGKj
         JCdeUOO9+1rvndKYYb+R4jGU8fz0PfR6B/uBluI0RJO4+6Dd2WYitAK14ftdo8xpW7hJ
         EDFu7KGQ/ejrA8xBV13GN5BbgOcO3/vuDWQ2YvugHtEB5/ie2ru2dGDe1ZoiIRWPxOLY
         A4VufakKZdONln/CrwqAicJ5rdJA6cxKXa5QtZ9iwAHY8DheiGeaxE9l+WImQvvfbmo8
         LxTZlr1UqIZJ92QzapIHtBEe4KUbxOCJ6fqEaHtq69r4RAPD70CKhssznCGHfY0NxaAW
         H/YA==
X-Gm-Message-State: APuU4Z9pwtEB4UTGbiywWgcGMlCvwOyRmS3a1TgsLw75SHXA40SxrN7L
	iQDNZeEWe6rEHTqS+imUmUiT8Lg8aM/N8XAeWBxC8GG7/nIOWvlsFtq/
X-Gm-Gg: AYBFou0OdjXPP65A3JB7W4OE14A++zkzXoj6U8GSBB4aFVdeZ4xfF5HTRmv2SeLAXlY
	iWs3/F0pYd/xI9Rn6sH2nx7BSrfLvOY6M1LA5Fm2HWZCsjgHT3bxbfPYTazPoxTG4i7FQVLLCsS
	91ElXgC06COroFh0yNU7SgVApR75Ti0QP60ZoUOjIP3j3YLXjeAR8As37XISVx8a/ux2JMQKCvT
	Z8pI4qILI3RKvYBmRB2GbCKekY9Z236vY5YyjJ3JMLztftnEUXwfUE/DWg749HeKhyS0/A2u9ey
	BCWDj4BwG8dB5XbImAG96q2oefpqJSStImbd1JFSjqinOlFETX6njJZAiZINP8RS6k3eogOr1jb
	Bh+ZqXT5HgG682w/We6j7GaZju2sqDCCk7KdUvkAc6zHTst7hnq+UANpdDl/qYzXMmm5bEnpJUe
	DNFTmhe4LmH1IP6Y+YDZX7hm0pTl/QtpcJA1lafrVsyCALEEWBilauJxbpvpYzzmiDC3jD25SLb
	7Y0kvglmVIGtRlyAeJjF0exSzrYdP/I9/nrDaWnbA7cG0TSrBf/QIOqeKOsm2n0gy8oa13Z1Stn
	8emjAxml2ySLU/egnfgCILDwFVWgQkcU
X-Received: by 2002:a05:6102:5cc2:b0:7d3:133e:a37 with SMTP id ada2fe7eead31-7d6317565eamr1801920137.11.1794585137127;
        Fri, 13 Nov 2026 07:52:17 -0800 (PST)
Received: from [127.0.1.1] ([179.160.39.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c8428c7fcsm1635449241.9.2026.11.13.07.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:52:16 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Fri, 13 Nov 2026 12:51:13 -0300
Subject: [PATCH v2 2/6] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 Toradex Capacitive Touch Display 10.1" DSI
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
Message-Id: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-2-327f5d37a9c5@toradex.com>
References: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-0-327f5d37a9c5@toradex.com>
In-Reply-To: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-0-327f5d37a9c5@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 ernest.vanhoecke@toradex.com, Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794585121; l=5963;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=8tSv2NTD2MUtmsbvIWyNFuTbONv2OsskqyqrqbBXQSY=;
 b=k97Ha0Tg8b/3D2ikrlVa+2pF4Eg8qVw8z5phEKBeB7NU9nPtGSNUsGI6qPB83Wyvg/v2RS8J9
 47IVK5ghI1tB1wTWX0t/Pm4nENKKvZaK4CNT2JYUD+kZCh1q9YxJZzV
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add a device tree overlay for the Toradex Capacitive Touch Display
10.1" on the Toradex SMARC Development Board DSI connector. The display
features an internal Texas Instruments SN65DSI83 DSI-to-LVDS bridge
driving a Riverdi RVT101HVLNWC00 10.1" WXGA IPS TFT LCD panel. The touch
input is provided by an Ilitek ILI2132 capacitive touch controller.

The overlay is also combined with the SMARC Development Board device
tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-dsi
Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-display-adapter
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   4 +
 ...arc-adapter-tdx-panel-cap-touch-10inch-dsi.dtso | 123 +++++++++++++++++++++
 2 files changed, 127 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 3c424071f8fc0..b147b93b2a067 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -710,6 +710,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-bd500.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-adapter-tdx-panel-cap-touch-10inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-adapter-tdx-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
@@ -717,6 +719,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2.dtb
 
+imx8mp-toradex-smarc-dev-adapter-tdx-panel-cap-touch-10inch-dsi-dtbs := imx8mp-toradex-smarc-dev.dtb \
+	imx8mp-toradex-smarc-adapter-tdx-panel-cap-touch-10inch-dsi.dtbo
 imx8mp-toradex-smarc-dev-dsi-to-hdmi-dtbs := imx8mp-toradex-smarc-dev.dtb imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
 
 imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10-dtbs += imx8mp-tx8p-ml81-moduline-display-106.dtb \
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-adapter-tdx-panel-cap-touch-10inch-dsi.dtso b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-adapter-tdx-panel-cap-touch-10inch-dsi.dtso
new file mode 100644
index 0000000000000..170411a705233
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-adapter-tdx-panel-cap-touch-10inch-dsi.dtso
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" DSI connected via Toradex SMARC
+ * Development Board DSI connector J44 through the Toradex DSI Display
+ * Adapter. Open J95 to select the carrier DSI route.
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-dsi
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-dsi
+ * https://developer.toradex.com/hardware/accessories/add-ons/dsi-display-adapter
+ * https://www.toradex.com/accessories/verdin-dsi-display-adapter
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	backlight_lcd1: backlight-lcd1 {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		/* SMARC LCD1_BKLT_PWM (SMARC S122) */
+		pwms = <&pwm1 0 6666667 0>;
+	};
+
+	panel-lvds-bridge {
+		compatible = "riverdi,rvt101hvlnwc00", "panel-lvds";
+		backlight = <&backlight_lcd1>;
+		data-mapping = "vesa-24";
+		height-mm = <136>;
+		width-mm = <217>;
+
+		/*
+		 * Use a combined horizontal sync and back porch of 96 pixels. The
+		 * panel data sheet value of 88 pixels results in unstable display
+		 * output with the i.MX8M Plus DSI display pipeline.
+		 */
+		panel-timing {
+			clock-frequency = <69300000>;
+			de-active = <1>;
+			hactive = <1280>;
+			hback-porch = <64 64 64>;
+			hfront-porch = <72 72 72>;
+			hsync-active = <0>;
+			hsync-len = <32 32 32>;
+			pixelclk-active = <1>;
+			vactive = <800>;
+			vback-porch = <15 15 15>;
+			vfront-porch = <15 15 15>;
+			vsync-active = <0>;
+			vsync-len = <8 8 8>;
+		};
+
+		port {
+			panel_lvds_bridge_in: endpoint {
+				remote-endpoint = <&dsi_lvds_bridge_out>;
+			};
+		};
+	};
+};
+
+/* I2C on DSI Connector Pins 52/54 */
+&i2c_dsi_1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	bridge@2c {
+		compatible = "ti,sn65dsi83";
+		reg = <0x2c>;
+		/* SMARC LCD1_BKLT_EN (SMARC S107) */
+		enable-gpios = <&som_gpio_expander 7 GPIO_ACTIVE_HIGH>;
+		vcc-supply = <&reg_carrier_1p8v>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				dsi_lvds_bridge_in: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&mipi_dsi_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				dsi_lvds_bridge_out: endpoint {
+					remote-endpoint = <&panel_lvds_bridge_in>;
+				};
+			};
+		};
+	};
+
+	touchscreen@41 {
+		compatible = "ilitek,ili2132";
+		reg = <0x41>;
+		/* SMARC GPIO8 (SMARC P116) - DSI_INT# */
+		/* Rising edge avoids spurious interrupts from the noisy falling edge. */
+		interrupt-parent = <&gpio1>;
+		interrupts = <1 IRQ_TYPE_EDGE_RISING>;
+	};
+};
+
+&lcdif1 {
+	status = "okay";
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

