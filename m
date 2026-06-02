Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6102B394EA6
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 11:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780401115; cv=none; b=unc9jxudePK3/cWzX2VZDxRm8WgON/EoeYL5CN0lVN1gqd2+mL+sJMpWBDkX0Eyn4Kx0Gh4aMR1hw8sB3w4BTQ8QRb5F31f7NDWWypv54Rpo0lgGCMpvd3GHgIL6/c21uC+7IktBYO67nQ/kYFLGetinjplEgm3Jo1yN5Y0rfXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780401115; c=relaxed/simple;
	bh=JdY3hvmJaPh3+/o1HU5uhJ4gmsfMid7x6UtR6uhLrSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hs/SZfW+Hg2c5mVYbRgHtJNiuCWJMJPZizBotUmXLOlxIOTexJuuyCAmqKB0ZyovHb9BujbJeGq6U/OdJhywgdbkxHIBQeU4EWxzIkpHr/aP4cpYTRDQjO8xPUyFd+6Mw1GgRQYhmx48b/HSO1+Dj1zz3erg4ovRyw+BdmHambA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qBUHXLGl; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qBUHXLGl"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490b09e4cccso7520785e9.0
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 04:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780401107; x=1781005907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXcmuDuWbm11caMZgoFDNnNhGqzpwO02IBzSYCaXizM=;
        b=qBUHXLGlvse7aQRnisTsC5oakuJBPsqJGPq8IIKQr3tT8JaEsJZJ3mVfh4uQxTXlH4
         Eg9rYATevgqptqrpGvf77YrQGb3zJyXYjqcnGc920oGJ1tXg1ppQ6xBZz7OfTqqiQBMz
         H9cEBWO0GIcCqh86YYdAhjlY+sPk+wDSV0v27Yjs7sR6x6mQg10whjFF1cUCLUkbmVRf
         fB0Iu3n3KtpaZHUeE2tVBhL4VoLWP0WFxM37MvrD4PbMxF8PldFgiyUF/2ABGrnpu2V+
         jY/54Pc47Uf9nrihtTl/flTtfd4OxFzu9A0RwQRYYpy9PlO8fkKSXY0vW4r9vnaRBZNb
         Okow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780401107; x=1781005907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oXcmuDuWbm11caMZgoFDNnNhGqzpwO02IBzSYCaXizM=;
        b=g0u/fjdz9CTgAMbq/TQCRR6eWNc6k/4OfCXjpltqGQjyRNBkYJ20ufLuLLO1OvPVVG
         W5/ofc4Vz6Kr/hL2RfMojW0d+ZSrcPnircXvUU89ps8NmCBFyJO1Fdr3eDNmZAFeIGQI
         Xc/CD/rB5Z/WtYOhuXVJBhbDlFtHPC7+kK1UVIdFsguOEQzOtf4HXj5WLLe5T49lKbDP
         cU7UdNsQFzr6HmPzfQRcHs4+JrpAvDzSVJXMt14KVghF7uWL9Q50vDqbj2/SAI5LeFiD
         O5Njvjc7/36IO55D8jvM2MJeUOBVffzSyhU3hZrzta9WMX5wem+r6cvkbhBtaxs4ZgMN
         Rz7A==
X-Forwarded-Encrypted: i=1; AFNElJ8bbUurXIGKzkqX8z08/V/EquyIimyZAgXfrIs2n/UXHFZiI0l+D5YnGKzGxyouwg/WEsMD1prswpD3@vger.kernel.org
X-Gm-Message-State: AOJu0YxGxMk/ehykD6SENrKKR+WSiTmQ09VeuTsbqLJyxD3cj6MtFeS7
	SLdX5oCWiDfiw5z8fwm//1qaCt0PDmDLZcLC0McbahdlT9aEutKNa7cZ
X-Gm-Gg: Acq92OE3GtwooKTEjs3C2TGcx3/ao6DCeCDwN5E/Mgc8nHz5/BEf9NbnRvOokCLkwkI
	6G7ohRhu519skabB5a1VMbeFDp+9nmZqYKLvmgU+r5VwkvWlXY/orf2RO9TeWEiifz2vcISASKR
	NPeOk06workE46xF+jUOdkwFLHYXPuqibDIUpL670I/jl79Ww8RebuC3Q7Ac2+yjvC08us44TJ7
	ID5aWgTmiQ/SPZ3RxXhIo7XireQGFJ6AN7XACc02w6gb6qgDZDvjid4cdmKM0BM3cW7FTiu4xM+
	Ow3L/YJEgrFQlYqc7D5ubN/kEpDnUg9plpMBZxnvm8dvzzfIGpy79UGZHi+0tDMBxYXfOXJN68b
	AZ3kxuWtX48PnjQwHoa1SylyBAkLyhIfxsl+nH+resklktqd/Rx+r9uttokFNebtupL6+UFhxok
	QJC22UT25Q25HIUWTjeY0GApsc8g==
X-Received: by 2002:a05:600c:82c3:b0:490:59cc:999f with SMTP id 5b1f17b1804b1-490a2901c21mr287671715e9.4.1780401107527;
        Tue, 02 Jun 2026 04:51:47 -0700 (PDT)
Received: from vitor-nb ([2001:8a0:c4c6:f00:e8c3:a961:5b26:a2c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c152570sm139480015e9.9.2026.06.02.04.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 04:51:46 -0700 (PDT)
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
Subject: [PATCH v2 6/7] arm64: dts: ti: k3-am69-aquila: Add Toradex Capacitive Touch Display 7" DSI
Date: Tue,  2 Jun 2026 12:51:29 +0100
Message-ID: <20260602115123.1324474-15-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602115123.1324474-9-ivitro@gmail.com>
References: <20260602115123.1324474-9-ivitro@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

Add a device tree overlay for the Toradex Capacitive Touch Display 7"
DSI on the Aquila DSI_1 interface. Used on the Clover Board (J12), where
DSI_1 is exposed via a FFC/FPC connector.

The display includes an internal Texas Instruments SN65DSI83 DSI-to-LVDS
bridge driving a Riverdi RVT70HSLNWCA0 7" WSVGA IPS TFT LCD panel.
Touch input is provided by an Ilitek ILI2132 capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-dsi
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
Changes in v2:
- Enable main_ehrpwm5 for Clover board.

 arch/arm64/boot/dts/ti/Makefile               |   5 +
 ...am69-aquila-panel-cap-touch-7inch-dsi.dtso | 158 ++++++++++++++++++
 2 files changed, 163 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-panel-cap-touch-7inch-dsi.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index bf50b7a72973..a8c2fae6a212 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -204,6 +204,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-panel-cap-touch-10inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-panel-cap-touch-7inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-sk-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm.dtb
@@ -318,6 +319,9 @@ k3-am68-sk-base-board-csi2-dual-imx219-dtbs := k3-am68-sk-base-board.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
 k3-am68-sk-base-board-pcie1-ep-dtbs := k3-am68-sk-base-board.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtbo
+k3-am69-aquila-clover-panel-cap-touch-7inch-dsi-dtbs := \
+	k3-am69-aquila-clover.dtb \
+	k3-am69-aquila-panel-cap-touch-7inch-dsi.dtbo
 k3-am69-aquila-dev-adapter-panel-cap-touch-10inch-dsi-dtbs := \
 	k3-am69-aquila-dev.dtb \
 	k3-am69-aquila-adapter-panel-cap-touch-10inch-dsi.dtbo
@@ -410,6 +414,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am68-phyboard-izar-peb-av-15.dtb \
 	k3-am68-sk-base-board-csi2-dual-imx219.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtb \
+	k3-am69-aquila-clover-panel-cap-touch-7inch-dsi.dtb \
 	k3-am69-aquila-dev-adapter-panel-cap-touch-10inch-dsi.dtb \
 	k3-am69-aquila-dev-adapter-panel-cap-touch-7inch-dsi.dtb \
 	k3-am69-aquila-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-panel-cap-touch-7inch-dsi.dtso b/arch/arm64/boot/dts/ti/k3-am69-aquila-panel-cap-touch-7inch-dsi.dtso
new file mode 100644
index 000000000000..ce8490837c76
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-panel-cap-touch-7inch-dsi.dtso
@@ -0,0 +1,158 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 7" on Aquila DSI_1.
+ * Used on Clover Board (J12), DSI_1 is exposed via a FFC/FPC connector.
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-dsi
+ * https://www.toradex.com/accessories/capacitive-touch-display-7-inch-dsi
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
+/* Aquila PWM_3_DSI */
+&main_ehrpwm5 {
+	status = "okay";
+};
+
+/* Aquila I2C_3_DSI1 */
+&main_i2c0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
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
+		/*
+		 * Data-ready pulse is ~200 us; either edge can be used,
+		 * use the rising edge because the falling edge is noisy.
+		 */
+		interrupts = <12 IRQ_TYPE_EDGE_RISING>;
+		/* Aquila GPIO_18_DSI_1 (AQUILA B43) */
+		reset-gpios = <&main_gpio0 31 GPIO_ACTIVE_LOW>;
+	};
+};
-- 
2.54.0

