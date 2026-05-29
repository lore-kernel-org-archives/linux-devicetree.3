Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C845D3D1718
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 12:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780056567; cv=none; b=gBLQf71anv867AGfXSYD7bzC9nQ+YS+lct9jbazHN5nPGz9BfKKZs6LYqf4HA++tKAfwSP1XtZrH79z+/JMslzRFqbud2D4MnSuVG3rSW0UhVr5jaQMRABJmXiOayLWBeRpStecsoAHJNmu8jSb2eCyGmyCKIzyrHHcpXSiGsos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780056567; c=relaxed/simple;
	bh=u8o6Gm2w8hsZnr+xo+XDhRP6qhi1TCAvq4cGP9sv2V4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aqzfFC+C1VYb3NJ4YXlvXz54Tx4ENnoHMfRqtek1hiT1wycB48Qa/Hvve1MuzE+kJ0Hgb9uOpw/A+AKJ+npkUR3ToWtIGuG8h3gDzemnLtWMTMmcFZE0SXVbzXFL29o4sz8b+rkcZ2pIoY9uu14EuqgTRQrL/K7gKu4AtUgoqFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F3uT8bAB; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F3uT8bAB"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso89468625e9.1
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 05:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780056564; x=1780661364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nWH/um7yqqcmunD7Way6Cqx/i/seIxzuvnT28hRNdEo=;
        b=F3uT8bAB2/fBZmmY1hVHTqTRhfGeY/BwP1Vf0r265HjXvXsG8KYIL5eRc6veLa6xAE
         w53tefc1yvWTzfU1dfAtW8y7eJvcEKxkGoPmZGilwyvhuxY/tS70AZfMYa/1x/ZZL4GY
         ygEGV8VTb62L1ryDAPIS+LRv6MksleC4E421i9xVHMaxD31eAImt7LVCU+7hUasZgW9k
         seDLIxs3QOejMLa7cuncNaEJwTtSQEn8R47Bat7tm79Q/wAqArvp4Eg9uJn8YyGe2hTE
         JMVy+x0fXCl3AWSstOlMlawaGJapnNdAuiDn/R89xIV4/Lxp/jj5juKuwt3xpaBhYSy0
         uWeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780056564; x=1780661364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nWH/um7yqqcmunD7Way6Cqx/i/seIxzuvnT28hRNdEo=;
        b=SdL55s7LICGL1jLo9MXi2FtsbS7fcoMY6/41F6A0/v/ffL8GjlnvMVwUGsGcWVKQq9
         vTIoloBvYpJw3i4rQwYd4WprNzt58Ct+NyHPfHc920EBVsONhv/bimhQNm+htIGZWp1W
         YG5ioOqX/UmcJfziW15K9T5wRPWct+TYLSP+1A5Kepva0VnuDYAtlVf31lyQ0G0ZcSJh
         lS+05KWu0YSTZ6w71YVVCc8LA294vueFHtLZAZ+h2in8fI3Og0/wA4UcD4RFJnZiHFMs
         P3ghp47AUk2XuRix6NAI7oTktXB34H+F5e1jYZJYkxhRMhH/ozuvZmMGblZ1XKHWxgN1
         twNA==
X-Forwarded-Encrypted: i=1; AFNElJ+8sGLqBbx0vqsc0fqjKuUx2zn4uD62A4p6hy/duv52YEBxfxCwbsC0Dd+o50zHv+aYbXRmqW858t93@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ9+JWxX3iC5/b/FNPLzUIyRXtNPi+Ai/Xp46G0TMD4DM/LXVX
	X14v29Gn6OJrQOC75Kc0oZnsIN8lBQo0eI6t8GGKglQ4JpZOJqSFS3Ms
X-Gm-Gg: Acq92OGQ2k7d8Kv6ki5ROo6pM0xR6LEkpONgDl+0gZr2WiFqJtD2BP5JLd1yRFB2KID
	AaJdcVUTLYhELYsdNu5o1agPIPBoBDRtrdccZ1QprKjedvwhLjrq6grc1FliZGx7GQnP87sow11
	wKQ26LZdRq+6xSduD+PRjWEtSwzjUQC1upxQvhjZy93OrPZFowxtQc6pPC6UchXq9UdLbM6SfqF
	KJQ1gB/wY6xXt0OWjfajRMtyuiVN3ULonyQuR2aehwuwLaV4YTVdP+5mzuz+dPUwL/6U+K4jdY5
	hThc3MtrFPUxg3lP9+dKQ8cHRSV8smrx84UM6/5+GQtgypdJYqFHz4AcSwysHyHC1ktc/uSj4K2
	ABN6fQZh827HYIJqfwNe6SjbuXEv5DQjEalSCc8hzqyVmtCZv1dYtJVd3XweyNKjiNN9etjU2l0
	Kl+7TlQKyaeX7sr9ke/REz1ma1QugrqkTvICk=
X-Received: by 2002:a05:600c:8582:b0:48f:d1c0:721e with SMTP id 5b1f17b1804b1-4909c08951cmr39845645e9.12.1780056563956;
        Fri, 29 May 2026 05:09:23 -0700 (PDT)
Received: from vitor-nb ([89.214.125.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c0b8a11sm13586595e9.16.2026.05.29.05.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 05:09:23 -0700 (PDT)
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
Subject: [PATCH v1 3/7] arm64: dts: ti: k3-am69-aquila: Add Toradex Capacitive Touch Display 10.1" DSI with adapter
Date: Fri, 29 May 2026 13:08:55 +0100
Message-ID: <20260529120853.636015-12-ivitro@gmail.com>
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

Add a device tree overlay for the Toradex Capacitive Touch Display 10.1"
DSI used with the Toradex DSI Display Adapter on the Aquila Development
Board. On this board, DSI_1 is exposed on connector J44 through a Samtec
LSS-130 connector, and the adapter converts it to an FFC/FPC connector.

The display includes an internal Texas Instruments SN65DSI83 DSI-to-LVDS
bridge driving a Riverdi RVT101HVLNWC00 10.1" WXGA IPS TFT LCD panel.
Touch input is provided by an Ilitek ILI2132 capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-dsi
Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-display-adapter
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   5 +
 ...la-adapter-panel-cap-touch-10inch-dsi.dtso | 151 ++++++++++++++++++
 2 files changed, 156 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-panel-cap-touch-10inch-dsi.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index bec6f11f3d44..39e4f96a968a 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -174,6 +174,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
 # Boards with J784s4 SoC
 k3-am69-aquila-dev-dsi-to-hdmi-dtbs := k3-am69-aquila-dev.dtb \
 	k3-am69-aquila-dsi-to-hdmi.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-adapter-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-clover.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev-dsi-to-hdmi.dtb
@@ -271,6 +272,9 @@ k3-am68-sk-base-board-csi2-dual-imx219-dtbs := k3-am68-sk-base-board.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
 k3-am68-sk-base-board-pcie1-ep-dtbs := k3-am68-sk-base-board.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtbo
+k3-am69-aquila-dev-adapter-panel-cap-touch-10inch-dsi-dtbs := \
+	k3-am69-aquila-dev.dtb \
+	k3-am69-aquila-adapter-panel-cap-touch-10inch-dsi.dtbo
 k3-am69-aquila-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
 	k3-am69-aquila-dev.dtb \
 	k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtbo
@@ -348,6 +352,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am68-phyboard-izar-peb-av-15.dtb \
 	k3-am68-sk-base-board-csi2-dual-imx219.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtb \
+	k3-am69-aquila-dev-adapter-panel-cap-touch-10inch-dsi.dtb \
 	k3-am69-aquila-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb \
 	k3-am69-sk-csi2-dual-imx219.dtb \
 	k3-am69-sk-pcie0-ep.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-panel-cap-touch-10inch-dsi.dtso b/arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-panel-cap-touch-10inch-dsi.dtso
new file mode 100644
index 000000000000..d24207a149a0
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-panel-cap-touch-10inch-dsi.dtso
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" on Aquila DSI_1.
+ * Used on Development Board (J44), DSI_1 is exposed via a Samtec LSS-130
+ * connector, and requires the Toradex DSI Display Adapter to convert to
+ * FFC/FPC connector.
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
+	backlight_pwm3: backlight-pwm3 {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		/* Aquila PWM_3_DSI (AQUILA B46) */
+		pwms = <&main_ehrpwm5 0 6666667 0>;
+	};
+
+	panel-lvds-bridge {
+		compatible = "riverdi,rvt101hvlnwc00", "panel-lvds";
+		backlight = <&backlight_pwm3>;
+		data-mapping = "vesa-24";
+		height-mm = <136>;
+		width-mm = <217>;
+
+		panel-timing {
+			clock-frequency = <72400000>;
+			de-active = <1>;
+			hactive = <1280>;
+			hback-porch = <83 83 83>;
+			hfront-porch = <12 72 132>;
+			hsync-active = <0>;
+			hsync-len = <1 5 40>;
+			pixelclk-active = <1>;
+			vactive = <800>;
+			vback-porch = <13 13 13>;
+			vfront-porch = <1 15 49>;
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

