Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A76B3C9ECF
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 11:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780401111; cv=none; b=XxVa8DfaQYEUWzOK7eOqt/zz7JLhU5BHbqQO6A17S9LSJ/cW6tDHr4IZM3QMlJCHWUOEdE8rx5Mf4lUCB1D5dvriwKlDEADnOuJXsDwhuuOGXdPHw/fbFuFJlNbBqSBfS2im1g06WeAq5SpgLaX/lxA0um3ORobNckgDXKrjY4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780401111; c=relaxed/simple;
	bh=w5ctk8Zq/uV66DdOJr2QO1eWq5iVrdzTkk/NAhJgNuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=db6AvqdqmIJupy0xdaXM9JNG9BZD2UWJYH0pYqHlrI8i2qtAZdL0scf/Q2zRo/u3Txk0dLQ/c5C9+RCB2OEWtZKx3F6h+MSJ3Bf2JVdhad0P1JE5xOmvYIoTqTrF7F3Zl6nrIRfklHcpr02m4o6mzptM9y39bWekg09Gx7xLotg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jx4bVvtz; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jx4bVvtz"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490abf12f0fso9918155e9.0
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 04:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780401105; x=1781005905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bgq/rpd3JEcdUUkFe0w5iXVXSOWYK+r8uwHWH60wipA=;
        b=Jx4bVvtzfoH0v2XY2tYJ+RfkJn3RcY6VBBk4nzqF6NrTUU+6GdRCdT0CRdSCfID36n
         Hf8yzzXH/vP1PrTGaSxjJiKUCtYOa4Oq+Yqi0JRBFR93k58/wlxfb4Xm910BkgaXPJzG
         gRxYXJ/C5NXD6S55ZN8b1Qiq8jeaWFob9G7QfSh0RRpJ1a+dRGTl7bKCY0U3mNJv49aP
         d6wroPA0E3NxvF5gyVlsMeiZbGkP0w0zCdzilfd9xZYId3q2uGckLG4ET+/VAxMuqn/w
         Wu7uY+4Umv6Ike0bLZHbknb+Yl1YQoqYUvLRBTNoB202eMQmAUKgOrowK1y6mAo9LpBP
         6zZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780401105; x=1781005905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bgq/rpd3JEcdUUkFe0w5iXVXSOWYK+r8uwHWH60wipA=;
        b=fNmbWFvTBI3h5eut8YEA1dwVdu7c+g+X8twgcnhPophy+l1qMLuXCVsVW6nLbY6yhf
         3eI95X962hrE20hm/j/WRem+u/mGGDLINaZmKQIDTgml9/4Fr4jmJvTw8BAXQElhtRkV
         DabODd8zgenWMd7buLKmf1KW1o00utf9NZa7iOEdWlRGzK1lD3dWfIhtzyLEqUEig+qq
         91yiTMnfkvgcegPmTxcReyCLeolSXRXVhDLa7KmGZvMDu0Bn/dAtzKL4QHMkzVnSFnHZ
         xgZGDct4Fgl0i8r8xriwL6tE78UCMwiEB5DaJn2rxFfWDGUTmmYVJhHOkloTgNo97FKW
         3i/g==
X-Forwarded-Encrypted: i=1; AFNElJ8NYH4nj52J+RunUBfl5o6OjTHX8idl8kmRboqOVQuMyyWn+F6fQaP+f2v9l/ZPyTBeNTPjkhTW+GFQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+nRIIPDKQDAmdWunMJb5QN9aOYfk/CVJMnps05+jXS4ovLRKe
	93nZBVbWN95yOyW65R35QAD8P/ikY5QODQv391awBHD5vLwyeQNyhOsk
X-Gm-Gg: Acq92OFtt7v+bPDTTKEF8tZvOF4zU14jiu8GieevFRDRWaLciMbhoxsHJaJL/Vhz3ML
	QCmPtB1wwJDWD0oS6/IoI1ymvOtUVJLOAq1KG7LlH6LCaCTxoH1Dd7jigTakk5jgvZtcl5jfWTq
	oSNnXqOrAcnhaBLIE0JvYJ0UEkhtOfh+39jZ6N7KMiZL4s2dtAc3HbD/7pnkM3DZIjfMdD1T7WW
	gA4W+Oi60kQ5ydw8v5PZSvZaaRaWEOPdP4EVtarcA1ewOQEAqz7FB8ykqZyAZdiLcJFgAVoXkTb
	dfoMM8HdN76bhIH8Xhhri027aBVgdpOF2WUeILhHce6ySuU1gHPt98Yn+z7lre25LJUlOygVpgX
	yUIC0RAiLjm4CrqpPBSi+JycSRJqalSRrr4S3IpqYE5eO3c6GF0S+VDatVXGWFRWMzLWi6v22wR
	Ll2UxwC76ANcz6aJWteOwa4XE2gA==
X-Received: by 2002:a05:600c:c0d1:20b0:490:4b89:5372 with SMTP id 5b1f17b1804b1-490b0e80be1mr41306365e9.11.1780401104789;
        Tue, 02 Jun 2026 04:51:44 -0700 (PDT)
Received: from vitor-nb ([2001:8a0:c4c6:f00:e8c3:a961:5b26:a2c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c152570sm139480015e9.9.2026.06.02.04.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 04:51:44 -0700 (PDT)
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
Subject: [PATCH v2 4/7] arm64: dts: ti: k3-am69-aquila: Add Toradex Capacitive Touch Display 7" DSI with adapter
Date: Tue,  2 Jun 2026 12:51:27 +0100
Message-ID: <20260602115123.1324474-13-ivitro@gmail.com>
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
 ...ila-adapter-panel-cap-touch-7inch-dsi.dtso | 155 ++++++++++++++++++
 2 files changed, 160 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-panel-cap-touch-7inch-dsi.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 966cec4c5b6e..c145cc4ca7fc 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -193,6 +193,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
 k3-am69-aquila-dev-dsi-to-hdmi-dtbs := k3-am69-aquila-dev.dtb \
 	k3-am69-aquila-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-adapter-panel-cap-touch-10inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-adapter-panel-cap-touch-7inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-clover.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev-dsi-to-hdmi.dtb
@@ -315,6 +316,9 @@ k3-am68-sk-base-board-pcie1-ep-dtbs := k3-am68-sk-base-board.dtb \
 k3-am69-aquila-dev-adapter-panel-cap-touch-10inch-dsi-dtbs := \
 	k3-am69-aquila-dev.dtb \
 	k3-am69-aquila-adapter-panel-cap-touch-10inch-dsi.dtbo
+k3-am69-aquila-dev-adapter-panel-cap-touch-7inch-dsi-dtbs := \
+	k3-am69-aquila-dev.dtb \
+	k3-am69-aquila-adapter-panel-cap-touch-7inch-dsi.dtbo
 k3-am69-aquila-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
 	k3-am69-aquila-dev.dtb \
 	k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtbo
@@ -402,6 +406,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am68-sk-base-board-csi2-dual-imx219.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtb \
 	k3-am69-aquila-dev-adapter-panel-cap-touch-10inch-dsi.dtb \
+	k3-am69-aquila-dev-adapter-panel-cap-touch-7inch-dsi.dtb \
 	k3-am69-aquila-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb \
 	k3-am69-sk-csi2-dual-imx219.dtb \
 	k3-am69-sk-pcie0-ep.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-panel-cap-touch-7inch-dsi.dtso b/arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-panel-cap-touch-7inch-dsi.dtso
new file mode 100644
index 000000000000..36d3746c8bd0
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-panel-cap-touch-7inch-dsi.dtso
@@ -0,0 +1,155 @@
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

