Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919500;
	b=jVh47+3k8SROWFbmwWhrdhk+KdkEK6RtVBzg47kpzqTmYIdv7F+yOJj9F6MnISYrbBp0
	 pbEQrVA6zuxHj47tOxy0/tSdSTtqI1qlzP2S6Axpjm1gm3lyYzs9qDXI9Nnf6vlpjA6ar
	 soVL89qWzhMKUhs1DJWwoD4HPYDF53InhimYy4Wm//sI03yfiwApExK7hWVaQXJ/1ax39
	 2jy9mkdqEKI1h/LV00VPMugWRz9ctSQbNR/Tdgx1JyKkwVjKyCNBgwr10PpO5SQJn9Gvy
	 Yu5OnISWXJUT2laUxadusjE3fH7cQHMvV0WrFRM441N1Mc5/4QljtZUi/iq7tSriCiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=U3eIe+zxkNhC3x1FOaH9hTSZUT+PYfO56KR+OgT0gCM=;
	b=N7+lFhx/zQ/7SOyMxlrl6d8rL5Hu74ppThJyryueKWprwwuIHBMi8OlVYaVMj28on29d
	 6OPFYL1lsJSWKhJU8srb42wbao2s6Rf2DSMTuc9T/KOVIZeLbq+I4oGV9wxOJbNeTATvx
	 CeuFIzPU69XPBUnH3ugl6GGGIWNPiZwM925PJr5YkMEkS/8ZvRDUVGzbyMyZ0EqpucyOK
	 R0x69r1YUKGdj2ar0R3AzhVf5uski1/Y9Q51cjqVPgBJT1FR4qCI0B2HNoqDx2WmO2m6x
	 kZWmewRP7mI6ljwXgoupgcCpqY/j18+Aoq744PCYjjibZ28XcBc+9rMKwfI2pqRxwbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fVyKmmA9;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E252A606A334
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 12:44:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E252A606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fVyKmmA9
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b3b75aae4cso452026a91.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 04:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919499; x=1795524299; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U3eIe+zxkNhC3x1FOaH9hTSZUT+PYfO56KR+OgT0gCM=;
        b=fVyKmmA9pEiKvZ14sEq2SvMoWrRIUvuCFQD21JG6KUvGhsrLnWfVtlC12Y2/tO/GMM
         IHbn93ELU2zhrj9H9Pey92WuvkwvcGZ5Ayjmum5hKJuBEC7CuOHENnjpIG+xmywxGEWA
         atnGLb9ziTiT9lzmnEdcMkUHqolDcagRl3cLpSqxwjsP+Nj2qi8lgcXaghy1BlxMbQL5
         VsRHJUTVdHR4taEAVr+SJGU7/QTJG6pfVam7UA8/GM5wgdsAB8dfu2jos5+DezeUA6ZE
         OH4PJsG2Vhc7mdDTtWh40t30mNiUMv8ou6dFtA0krwA8F/x9DyaxZAkA5OtR8jLq4D6j
         l8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919499; x=1795524299;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U3eIe+zxkNhC3x1FOaH9hTSZUT+PYfO56KR+OgT0gCM=;
        b=d6tjgcDmiXcWlF/XGcy0MuPmYyVeakce1VaRsntrmPCE5ubFT6dIUKG5B2slispDkt
         n3Bd18Z+40Z+xIdzUTbbtY4xi9/ZjPILygNsb362ksC5BGtJvOAeTkQfkvEsNn8eMTh2
         bnEfXxqiIdQplan6s5mM1/Gj6XWr8Yc1CGFUGwQOdFyzgtXjy53DW677nppuD/JCf4uS
         pUgjoBZOrmjhVhmoyVAPE6teKipmvxgzzTLXQHbfZyjUcUnKkhHaJ7KxGFeG2eB22d2M
         03r8EMGT426ILM3TsAMlA+7CZayqeIcH0y9NgKl/iYzJUIOMnSP+gVSQq99Yt9q4PAK0
         uOkQ==
X-Forwarded-Encrypted: i=1; AL+hErEBOmK7T/41nXbHGyWRCwU38tdj/jDjcmSLTKzTYgcuK/mnkTIz0FP3wDunhFwEMyg16vzPqmyfnqUa@vger.kernel.org
X-Gm-Message-State: APuU4Z9letzRG5sP9K/EPUgsZY/sI1gJ5XMaQsPx8HGffoVBd2ZMXG8p
	6gPMsyu7fxQbfvdUt2uju1eQTfp1tqx7uwO0A1JzNyzbXiy9p78UVuTo
X-Gm-Gg: AZFdTZdIEAvqkPzRv+JWD/uIwCjybElRKT0oHETRCVWw+qVuE+LH1K6xXfXNq1X1BB/
	002ZfMWrWdimzXuUYnC9mCpGYrbRhVaQnkgbemKwvSudH4eQa3QbegF88hf0dDl0rBj5qQcyNcR
	0zC730Njmi6RD5TbZPTWakeH8AvlSMCetbwSAOKazuNdAutkalY+YAcSgyI8TAhvjpcC+C6qJ4i
	AVgoq/s0uOf6zYMqA9C8aEO9/jjAl2j0fvtrVFmtUVLbfuBCqtNi8tzZoCAZi9BsjbcNNTJlMrT
	PGEcKH0ZmVkb7WHoPVqbCmI8V5cSdTpd8gMqavBg73Ysvckjcl+dPBAyH5+igjPhjZatcbGpAyQ
	G0jtLwZKZdPdYnCGoi4zvIOSWCAExt2d+i2UAn6MIxKjQrpIhUAbN9bJbtn8tSPvd0/qiH3wUQz
	e+/r1QGhTzOm1h5KU4cTtRWPIX5ZfuymFXJmzU1r8LPr/Nn+L3KCrbS98augC6JBRIBxMmG/6WV
	2GxnvfrC3F6nx19/1K6CHBrX0OeEQj2bEV5UJlmEqgxOCnwgrzk7pHVb9Gm30HU3Y/qhse442Hg
	oJSUxn/RzPz9YL6eXTjQQhlx1meNvmCGyBE=
X-Received: by 2002:a17:90b:1f81:b0:3b0:a38a:6715 with SMTP id 98e67ed59e1d1-3b1b0d753ebmr13700852a91.59.1794919499020;
        Tue, 17 Nov 2026 04:44:59 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a85f1dsm14585725ad.59.2026.11.17.04.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:44:57 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Tue, 17 Nov 2026 09:44:14 -0300
Subject: [PATCH v2 2/2] arm64: dts: freescale: imx8mm-verdin: Add Toradex
 DSI to LVDS adapter with the 10.1" V2 display
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
Message-Id: <20261117-v2-imx8mm-verdin-add-lvds-v2-v2-2-ecfd237cf7ee@toradex.com>
References: <20261117-v2-imx8mm-verdin-add-lvds-v2-v2-0-ecfd237cf7ee@toradex.com>
In-Reply-To: <20261117-v2-imx8mm-verdin-add-lvds-v2-v2-0-ecfd237cf7ee@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794919484; l=6885;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=oileKM9NWf3LIxFH+bWjLKnDxeS3R++Bhw1jN8xh1DM=;
 b=W/3ZI6a1L4XOu9EJvQ1kh8Owh9i7WoY6j7p0X/zutKQwN3WSrNF0zCI/TbL7gKsMHvav/4k4k
 bYSyoV5LW7sAo6et2IxZ3Jz/tAIfsNaq/C6eifAqgw3zr+DzFxuWYjs
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay for the Toradex DSI to LVDS Adapter with the
Toradex Capacitive Touch Display 10.1" LVDS V2. The adapter connects to the
Verdin DSI_1 interface. It is based on the Texas Instruments SN65DSI84
DSI-to-LVDS bridge and drives an Opto Logic SCX1001511GGC49 10.1" WXGA TFT
LCD LVDS panel. Touch input is provided by an ILITEK ILI251x capacitive
touch controller.

Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-adapter
Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   4 +
 ...-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtso | 134 +++++++++++++++++++++
 2 files changed, 138 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 0bbc4b6a6b537..b5d4afac550b6 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -258,6 +258,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7903.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7904.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia-tdx-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia.dtb
@@ -275,6 +276,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-tdx-panel-cap-touch-10inch-d
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-tdx-panel-cap-touch-7inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-uart4-mcu.dtb
@@ -296,6 +298,8 @@ imx8mm-verdin-wifi-dahlia-tdx-panel-cap-touch-10inch-dsi-dtbs := imx8mm-verdin-w
 imx8mm-verdin-wifi-dev-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 imx8mm-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1-dtbs := imx8mm-verdin-wifi-dev.dtb \
 	imx8mm-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtbo
+imx8mm-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2-dtbs := imx8mm-verdin-wifi-dev.dtb \
+	imx8mm-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtbo
 imx8mm-verdin-wifi-dev-nau8822-btl-dtbs := imx8mm-verdin-wifi-dev.dtb imx-tdx-nau8822-btl.dtbo
 imx8mm-verdin-wifi-dev-tdx-panel-cap-touch-7inch-dsi-dtbs := imx8mm-verdin-wifi-dev.dtb \
 	imx8mm-verdin-tdx-panel-cap-touch-7inch-dsi.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtso b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtso
new file mode 100644
index 0000000000000..6b0c989dbc75a
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtso
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex DSI to LVDS Adapter on Verdin DSI_1 with Capacitive Touch Display
+ * 10.1" V2 Used on Dahlia (X17) and Development Board (X48) that expose DSI_1
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
+	backlight_pwm3: backlight-pwm3 {
+		compatible = "pwm-backlight";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2s_2_d_out_dsi_1_bkl_en>;
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		/* Verdin I2S_2_D_OUT (SODIMM 46) - DSI_1_BKL_EN_LVDS */
+		enable-gpios = <&gpio3 24 GPIO_ACTIVE_HIGH>;
+		power-supply = <&reg_3p3v>;
+		/* Verdin PWM_3_DSI (SODIMM 19) - PWM_3_DSI_LVDS */
+		pwms = <&pwm1 0 6666667 0>;
+	};
+
+	panel-lvds-bridge {
+		compatible = "optologic,scx1001511ggc49", "panel-lvds";
+		backlight = <&backlight_pwm3>;
+		data-mapping = "vesa-24";
+		power-supply = <&reg_dsi_lvds>;
+		height-mm = <136>;
+		width-mm = <217>;
+
+		panel-timing {
+			clock-frequency = <70000000>;
+			hactive = <1280>;
+			hback-porch = <55>;
+			hfront-porch = <55>;
+			hsync-len = <45>;
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
+			panel_lvds_bridge_in: endpoint {
+				remote-endpoint = <&dsi_lvds_bridge_out>;
+			};
+		};
+	};
+
+	reg_dsi_lvds: regulator-dsi-lvds {
+		compatible = "regulator-fixed";
+		/* Verdin CTRL_SLEEP_MOCI# (SODIMM 256) */
+		gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+		regulator-name = "DSI_1_PWR_EN";
+	};
+};
+
+&i2c4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili251x";
+		reg = <0x41>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_9_dsi>, <&pinctrl_i2s_2_bclk_touch_reset>;
+		/* Verdin GPIO_9_DSI (SODIMM 17) - TOUCH_INT# */
+		/* Rising edge avoids spurious interrupts from the noisy falling edge. */
+		interrupt-parent = <&gpio3>;
+		interrupts = <15 IRQ_TYPE_EDGE_RISING>;
+		/* Verdin I2S_2_BCLK (SODIMM 42) - TOUCH_RESET# */
+		reset-gpios = <&gpio3 23 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&lcdif {
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

