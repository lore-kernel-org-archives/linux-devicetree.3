Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4E63E0C44
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 12:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780056569; cv=none; b=OnhEPuFROJqHEA3YsO0BjJyQUgjDD0EXvEqjBFumLLiKAtUHCNLJhzEZxLD9i74x3J1K6XLpKi0v7ZTUVdSuWAUij5RUiPRxwH33f3oV1TuE0j/Kp8sCmKzEgjpTbgrCVpTvjhV4vVN+sZj1JkXDRQsGJp0WG1+IewYCKa+kJ6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780056569; c=relaxed/simple;
	bh=Dq70WaJR0b30iNYwofsfzXjlF3x+oUwnPEndIa+s24w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fA1m9Je7of01xF1A8lihuyKVA2IafI2Apc2SSMElD1XCajSQuH6KKXqBTwDuUOTAy5yyrhjRNZAf+r61wyM0RyDiU44NGh8gpyY09Sj3NsaRI0WEIyqIBeMSJ2emRCVdqajBDoG0TrVWCIOVyXyledwTsxwaJsI2hIjOCR6qNy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SiysY38y; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SiysY38y"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4904c1ce4c1so80390845e9.3
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 05:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780056566; x=1780661366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+LmRi3vqEww8IUkZ6x6Xjh5yc2jTl/AU/ZgSXfkKiI=;
        b=SiysY38yv85V8Fy3Vpzu8+EtqiI4CQFgr2TRJP+du2/0qyT9pgUBNoEp+48g5JP7h1
         zCjjS2FkKOZq+rq038CIX26fD+eW6MgeY78Id87LiESO9N4jh4fYAsS62X5fB48YlbN1
         XmfMtrptv2MVfblcrGj8G9Oemp3X/4yichsArAZyCGpXojAnnI6aHC6PsDa847XlUe6D
         jkq7+7DFHdaLwLEw5dlbeDudIFc23KtQ/hV/PWLIz7bXELXdkYfYA+U1TPH2pNCERVQY
         2f1GWfzGrhGSZorCj6ZzlFmcaz1Lge/tBYT7cqQLMGCDn6BRqMUBvzq+vWOC6F7vnp3U
         kvzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780056566; x=1780661366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y+LmRi3vqEww8IUkZ6x6Xjh5yc2jTl/AU/ZgSXfkKiI=;
        b=bjVrnLtpcRrKKBw2npxZmxGy4HiG47uRWIehX2DrXIh6ygbnDv3DtV/yFYkdMb2hGs
         eiPwH4ImVTZIODcEuOCKxG5WAuCE1N+6ktACu4Z89Q0ftL1X9NZI8GPLHd8p/bm1LT6d
         UMT7rrp2v7n0eF1Vld+f3LVAhNWKc0qKkODqmPg9lUFUFTeOUXiUjmBEVPgFe4QfUgj+
         QTlkFZjZu1eV7+flN2JC/tVv+NqQkbgIMF+O/kQys+wIdf95WzBPuHYwips96phXReyA
         NSW8nkrgnC0nBuEs99VNnBEsiHzDeBalO/TU7DjZqndRmhR2bTLBx+GQ1jEriYAXCDvw
         NOWA==
X-Forwarded-Encrypted: i=1; AFNElJ/Zid0oVuaST9wAdrF/a+GRtYSmrb2KQAvsNtwLHpI2DgsJSTYv/t3oa2UxpZ/D46eUXGMDdPxhHn5Q@vger.kernel.org
X-Gm-Message-State: AOJu0YyFOrl/EhwahaxIGuqjQrS0UqldkQTxgVsfBme+MvGXTC5zDf2W
	nVEOyiskTkC78wlPuqTPiS0rJzW/LrFD2kqNBFhiNHQtW5d1f5cMkwyk
X-Gm-Gg: Acq92OFw27sTGzis07ufzMqAoUgrLukcbOCPJ+B4erd7vmcLIVkgMXlVyt5kD13Ioc2
	Y+kvCB3d6pbmsoHd/qE71KclGrNpDuh1drJRVqHy1+jmcj2VviX621Z0IFz7c+skKefedogvH8d
	OB0UGkvU00hoVfwMqgvt2pfnovrep4pPzFKLgysoGbRzkqWUC+VTjuTO4paJTypA30W2BRcV2AM
	lIBEpq0mOd/wl1QuU8Mk1rhKnWrfy1WTpB/dHYBCwKJHbHbUVKh13CBtD/SY1Wh9deeC52mTutR
	osm0L4SEI7gDfpQ55+pWkDpVOhM/KPqIRTD9EBndq0fsnaKH9jdlKJc02/11XnBv9U43vVsd/2R
	VlFyFnpTatHrdGR7l41hA9UEGbcLgpKObY9/rO56DmInZASNdn4dYBUXJEv+1AGsIlazpr6GbAV
	KG+rz5IQ5yC/rAambe/CGhocLg
X-Received: by 2002:a7b:cc1a:0:b0:490:845c:a1ea with SMTP id 5b1f17b1804b1-4909c0b0c32mr35903405e9.21.1780056566431;
        Fri, 29 May 2026 05:09:26 -0700 (PDT)
Received: from vitor-nb ([89.214.125.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c0b8a11sm13586595e9.16.2026.05.29.05.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 05:09:25 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/7] arm64: dts: ti: k3-am69-aquila: Add Toradex Capacitive Touch Display 7" DSI with adapter
Date: Fri, 29 May 2026 13:08:56 +0100
Message-ID: <20260529120853.636015-13-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529120853.636015-9-ivitro@gmail.com>
References: <20260529120853.636015-9-ivitro@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

Add a device tree overlay for the Toradex Capacitive Touch Display 7" DSI
used with the Toradex DSI Display Adapter on the Aquila Development Board.
On this board, DSI_1 is exposed on connector J44 through a Samtec LSS-130
connector, and the adapter converts it to an FFC/FPC connector.

The display includes an internal Texas Instruments SN65DSI83 DSI-to-LVDS
bridge driving a Riverdi RVT70HSLNWCA0 7" WSVGA IPS TFT LCD panel. Touch
input is provided by an Ilitek ILI2132 capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-dsi
Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-display-adapter
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   5 +
 ...ila-adapter-panel-cap-touch-7inch-dsi.dtso | 151 ++++++++++++++++++
 2 files changed, 156 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-panel-cap-touch-7inch-dsi.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 39e4f96a968a..ce667843e58b 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -175,6 +175,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
 k3-am69-aquila-dev-dsi-to-hdmi-dtbs := k3-am69-aquila-dev.dtb \
 	k3-am69-aquila-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-adapter-panel-cap-touch-10inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-adapter-panel-cap-touch-7inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-clover.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev-dsi-to-hdmi.dtb
@@ -275,6 +276,9 @@ k3-am68-sk-base-board-pcie1-ep-dtbs := k3-am68-sk-base-board.dtb \
 k3-am69-aquila-dev-adapter-panel-cap-touch-10inch-dsi-dtbs := \
 	k3-am69-aquila-dev.dtb \
 	k3-am69-aquila-adapter-panel-cap-touch-10inch-dsi.dtbo
+k3-am69-aquila-dev-adapter-panel-cap-touch-7inch-dsi-dtbs := \
+	k3-am69-aquila-dev.dtb \
+	k3-am69-aquila-adapter-panel-cap-touch-7inch-dsi.dtbo
 k3-am69-aquila-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
 	k3-am69-aquila-dev.dtb \
 	k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtbo
@@ -353,6 +357,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am68-sk-base-board-csi2-dual-imx219.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtb \
 	k3-am69-aquila-dev-adapter-panel-cap-touch-10inch-dsi.dtb \
+	k3-am69-aquila-dev-adapter-panel-cap-touch-7inch-dsi.dtb \
 	k3-am69-aquila-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb \
 	k3-am69-sk-csi2-dual-imx219.dtb \
 	k3-am69-sk-pcie0-ep.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-panel-cap-touch-7inch-dsi.dtso b/arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-panel-cap-touch-7inch-dsi.dtso
new file mode 100644
index 000000000000..9c8ab35ef673
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-panel-cap-touch-7inch-dsi.dtso
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 7" on Aquila DSI_1.
+ * Used on Development Board (J44), DSI_1 is exposed via a Samtec LSS-130
+ * connector, and requires the Toradex DSI Display Adapter to convert to
+ * FFC/FPC connector.
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
+	backlight_pwm3: backlight-pwm3 {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		/* Aquila PWM_3_DSI (AQUILA B46) */
+		pwms = <&main_ehrpwm5 0 6666667 0>;
+	};
+
+	panel-lvds-bridge {
+		compatible = "riverdi,rvt70hslnwca0", "panel-lvds";
+		backlight = <&backlight_pwm3>;
+		data-mapping = "vesa-24";
+		height-mm = <86>;
+		width-mm = <154>;
+
+		panel-timing {
+			clock-frequency = <51200000>;
+			de-active = <1>;
+			hactive = <1024>;
+			hback-porch = <100 100 100>;
+			hfront-porch = <16 160 216>;
+			hsync-active = <0>;
+			hsync-len = <1 60 140>;
+			pixelclk-active = <1>;
+			vactive = <600>;
+			vback-porch = <13 13 13>;
+			vfront-porch = <1 12 127>;
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
+&dphy_tx0 {
+	status = "okay";
+};
+
+&dsi0 {
+	status = "okay";
+};
+
+&dsi0_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	port@0 {
+		reg = <0>;
+
+		dsi0_out: endpoint {
+			remote-endpoint = <&dsi_lvds_bridge_in>;
+		};
+	};
+
+	port@1 {
+		reg = <1>;
+
+		dsi0_in: endpoint {
+			remote-endpoint = <&dpi2_out>;
+		};
+	};
+};
+
+&dss_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	port@2 {
+		reg = <2>;
+
+		dpi2_out: endpoint {
+			remote-endpoint = <&dsi0_in>;
+		};
+	};
+};
+
+/* I2C on DSI Connector Pin #52 and #54 */
+&i2c_dsi_1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	bridge@2c {
+		compatible = "ti,sn65dsi83";
+		reg = <0x2c>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_20_dsi_1>;
+		/* Aquila GPIO_20_DSI_1 (AQUILA B45) */
+		enable-gpios = <&main_gpio0 18 GPIO_ACTIVE_HIGH>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				dsi_lvds_bridge_in: endpoint {
+					remote-endpoint = <&dsi0_out>;
+					data-lanes = <1 2 3 4>;
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
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_17_dsi_1>, <&pinctrl_gpio_18_dsi_1>;
+		/* Aquila GPIO_17_DSI_1 (AQUILA B42) */
+		interrupt-parent = <&main_gpio0>;
+		interrupts = <12 IRQ_TYPE_EDGE_RISING>;
+		/* Aquila GPIO_18_DSI_1 (AQUILA B43) */
+		reset-gpios = <&main_gpio0 31 GPIO_ACTIVE_LOW>;
+	};
+};
-- 
2.54.0

