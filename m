Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585157;
	b=TzPsqWzIUlQ8YCwnaxcoqnI7Zk1oGJtuVoui1Ed9RL2LUl0scj8pYjoVWLUmFFZBEpEf
	 ImYEOu0AxpZ92Rp6XqPy0ABemD4LSeyfqedPve0+UaZDOIPOZ08aceWm24U2JOmfUL7kV
	 7Tf580akODJ3cAu4V0cQZ/4qfv+NmcgGDCpPl61s4dTyGR5TQ3QKvXpaKKqAq9RgIrKqS
	 kpF0c2o2CB9q8vkaqGy5uv6wC87dc7FJA+3vksh38njzwDp0ZBphhwWBsDQ2OUPo5Gw7b
	 Kr6B5bNb8M/JW60OWbUqdfRvzsVM4kArp24TDGhDrO5qvTkB8XZsbNebV435Ws40FIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=xnb0TsUDMM6mvvewwzJCHHeHrkTz0VtyskRaUpI6ZnY=;
	b=XXHkTXKYoLFPesocVBq/1i/VEVSDesxEXYmfwD8xPYmOTUTIwtl8+Wa4K1I19a64+b2H
	 HJ06so2X65Ou3tYNSMWiT01RmBeFyrKHzK7TWgR9U9E4lt28oKL3S8jXPjvT6eAiCvKzm
	 rEx8P2IksE35J/aNJ396wu+hOJuXpDdEUMNwO7F6LuJRrJKelVUo3Gd11TE29X/X8dsdV
	 9EiosQ0LaQ9OhGP316LA50byhiVzQm3DibzTdeisBVxE6Spu51qJV5OGZUs8OTgHcLbv1
	 a4/uefujLhNTj/s5Ly8m4wOoBvw32AD8ludFVlruybNhFz1o6wr9XzSamG3BSLSv9OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XznCE2uU;
	arc=none smtp.remote-ip=209.85.217.45
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D55606A332
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 15:52:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07D55606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XznCE2uU
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7d6554d96d3so977997137.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 07:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794585156; x=1795189956; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xnb0TsUDMM6mvvewwzJCHHeHrkTz0VtyskRaUpI6ZnY=;
        b=XznCE2uU6oYqmpPrSDJtdz64znuaRmpnMxa67YWHGtG4E1ISGHyxKAJBXALQCXi59/
         gkyzyHHSxIlumzF1Hn9W1/ZYPdVredYiqHHOxrBXu9HlluGwrLyKkE8SVQgLyviS7KtK
         RqGWX3MLt4Mh8lhMkwlbAmrtpFlqUCdJlXK02ayagkWYj6biknlZv4vRyor+eU37QmLh
         reOj6HSzJMzz7QnoLUox8h9IaFCLPZ0KqaibqCwPvlfp7Jz0x1IFgKQmrYBodGh7rLsO
         rcT9dfSXeUzoqnWJtNQhu3iXvJ1qvgEdpswWhAs0AuggbJ+QvkufEWA7w1RehodWDBWB
         ndiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585156; x=1795189956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xnb0TsUDMM6mvvewwzJCHHeHrkTz0VtyskRaUpI6ZnY=;
        b=tgepHX0kkoA26Ail5D4h37dTk2whWxPV9b5nbjAkuMPTqLz+N9Vi3LAx96qLeOIy8P
         UoHxg4548GqwdFKHf9wEiIj3LHr3sADxkAEbT/oJWlgNvP+jQgWuQXCkiVuK88hv3pql
         JORFzHCS4kU81h6eQcEW3PoatOme4sdvFHzpPvIff6wlSX9DwuPvgG0no48s7Yk+M/dm
         7/wXeTzyfyfoqMCLLSPMMCUVpq5IzACJoiFVVvhRlV458QF4kT7uQzlmnipwYDiPRyVj
         TIG7G9bc29Kk4MYNI22/ulqy8rUsBgpG54RGUwjDuBRUnDYRdDHoBwHXxHf6iLJWMsVX
         U11Q==
X-Gm-Message-State: APuU4Z/ZL9iGm2+E6eA0tt+vMkMg8J4rPblnNnGBl61BRjCYTz4jU5cw
	Sz9CcbW092Yd9BInkIHwk9BP4nAoMbJAdw6bw8eM8DV2ALba1Y0nDSPj
X-Gm-Gg: AYBFou2nuGLGKWAQ/WLm7HEPonn0zEywMKEmK6jVpRETY4euIhCkN0mKbYqCqhwVPDb
	GBBFjYmSWdU3Tf1coSOwsUYsMcxA88uxQKxDG3XnXmXI8APQ5cVpUgXJ+Ay15SsiKNTeGzmZmMi
	dDU2Ozffbya/CHqBMQ6BqbwC2T+13/sqVJbmT38n+F1BWGp0caW4yeqKSn9FCXKFK87Uxce5lP4
	HrjCKsbkJt5sSY5ubbEulEoAwsBR553a30UCdIktPT5YlkAJewEfxiR1p2STVOL2lVRUa3Oa31g
	uT9YkUHEIvSVjw90K6b6wKbWdxyBw38KsJMzszvJtdxgwRj8iEG9C7a511LvcUbET3rtzGKw3Gb
	ykbTdovRucOurLkrGEa+BnI5E/cX0r37sgFNXgDpQjL+sHv8qMIXf/WLHbFeK/zYaYSGEvQTTa9
	CoYK90PxoLYgUGPkDJJ9GuB97iArlsQR4LS2AMq7ZJGseFCZ/N7B77Ft+DxchKX1hHTXu8XpMdj
	md4O7qljbyk+nvlNfYlRD/mxN5uilqFYu2hVTdyoqeh8TdjBaVkiem7+RfjWiNScVNMcX6qATQv
	AErhScGeREt6QOLrYwZKWlTs2KjVAnwD
X-Received: by 2002:a05:6102:e0c:b0:7cc:1045:604 with SMTP id ada2fe7eead31-7d64d8b000bmr1043710137.30.1794585155774;
        Fri, 13 Nov 2026 07:52:35 -0800 (PST)
Received: from [127.0.1.1] ([179.160.39.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c8428c7fcsm1635449241.9.2026.11.13.07.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:52:35 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Fri, 13 Nov 2026 12:51:17 -0300
Subject: [PATCH v2 6/6] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 Toradex Capacitive Touch Display 7" DSI
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
Message-Id: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-6-327f5d37a9c5@toradex.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794585121; l=6302;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=zqUvY4zOrV9zsetMEWnPahdPPKNar6p2vUjkX9DFzaA=;
 b=iMCNgkbfdU6eahVhSqwyui8gtR+da/xFAMCm3x+Jzi3C3tTnxFHG5DAbeUc21eWkypoWE5UoN
 4VFZlWii6z+DZ5nMlbTnfuZca4pwzapDydm0HfoFB+axS74kkfMRXIQ
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add a device tree overlay for the Toradex Capacitive Touch Display 7"
on the Toradex SMARC Development Board DSI connector. The display
features an internal Texas Instruments SN65DSI83 DSI-to-LVDS bridge
driving a Riverdi RVT70HSLNWCA0 7" WSVGA IPS TFT LCD panel. The touch
input is provided by an Ilitek ILI2132 capacitive touch controller.

The overlay is also combined with the SMARC Development Board device
tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-dsi
Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-display-adapter
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   4 +
 ...marc-adapter-tdx-panel-cap-touch-7inch-dsi.dtso | 124 +++++++++++++++++++++
 2 files changed, 128 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index f7f09d3cde5b9..2af5c5f8ec230 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -711,7 +711,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-adapter-tdx-panel-cap-touch-10inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-adapter-tdx-panel-cap-touch-7inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-adapter-tdx-panel-cap-touch-10inch-dsi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-adapter-tdx-panel-cap-touch-7inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-tdx-panel-cap-touch-10inch-lvds-v1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-tdx-panel-cap-touch-10inch-lvds-v2.dtb
@@ -725,6 +727,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2.dtb
 
 imx8mp-toradex-smarc-dev-adapter-tdx-panel-cap-touch-10inch-dsi-dtbs := imx8mp-toradex-smarc-dev.dtb \
 	imx8mp-toradex-smarc-adapter-tdx-panel-cap-touch-10inch-dsi.dtbo
+imx8mp-toradex-smarc-dev-adapter-tdx-panel-cap-touch-7inch-dsi-dtbs := imx8mp-toradex-smarc-dev.dtb \
+	imx8mp-toradex-smarc-adapter-tdx-panel-cap-touch-7inch-dsi.dtbo
 imx8mp-toradex-smarc-dev-dsi-to-hdmi-dtbs := imx8mp-toradex-smarc-dev.dtb imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
 imx8mp-toradex-smarc-dev-tdx-panel-cap-touch-10inch-lvds-v1-dtbs := imx8mp-toradex-smarc-dev.dtb \
 	imx8mp-toradex-smarc-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-adapter-tdx-panel-cap-touch-7inch-dsi.dtso b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-adapter-tdx-panel-cap-touch-7inch-dsi.dtso
new file mode 100644
index 0000000000000..bbf945997703e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-adapter-tdx-panel-cap-touch-7inch-dsi.dtso
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 7" DSI connected via Toradex SMARC
+ * Development Board DSI connector J44 through the Toradex DSI Display
+ * Adapter. Open J95 to select the carrier DSI route.
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-dsi
+ * https://www.toradex.com/accessories/capacitive-touch-display-7-inch-dsi
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
+		compatible = "riverdi,rvt70hslnwca0", "panel-lvds";
+		backlight = <&backlight_lcd1>;
+		data-mapping = "vesa-24";
+		height-mm = <86>;
+		width-mm = <154>;
+
+		/*
+		 * Use a combined horizontal sync and back porch of 160 pixels.
+		 * Treating the panel data sheet's 160-pixel back porch separately
+		 * from the sync pulse results in unstable display output with the
+		 * i.MX8M Plus DSI display pipeline.
+		 */
+		panel-timing {
+			clock-frequency = <51200000>;
+			de-active = <1>;
+			hactive = <1024>;
+			hback-porch = <100 100 100>;
+			hfront-porch = <16 160 216>;
+			hsync-active = <0>;
+			hsync-len = <50 60 140>;
+			pixelclk-active = <1>;
+			vactive = <600>;
+			vback-porch = <23 23 23>;
+			vfront-porch = <1 12 126>;
+			vsync-active = <0>;
+			vsync-len = <1 10 20>;
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

