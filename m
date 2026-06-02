Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2FC3C8C5E
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 11:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780401113; cv=none; b=Hu3hC34fQKQkGnauYa9J6Tmrvc9l1ORAGV9Q4wbfGJa3xEsD9X91NuGSvHh0TiMNg8znEN18If5SXJcLY/iI2s2HmpkDC731Tihh0BxkRlDX+DomoBc+Z1rcpZXHyqZ2LeXAjZRWZ5He3Aj2dj5dO+cS/xKqCKpXINYrocTsd50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780401113; c=relaxed/simple;
	bh=huJSha/vBHDgVvprsuUDvcbacjXmFi6mxRwgk4rmUSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LoMj1lppWFG2h5gpe5fS/FU4uw9Iy0iRENG/+DKCszYF4xNcpTzvJSbz4/GoQWDymkEP4kqaMwsfGwiE48cebnQ/nSp5VU9LxR5bEk0t/7MINcoL5lftse96UZss3lBQ9q+XDxIndEA2GxPcIW05dvzlQBernpC3eTY2CbMt8IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aLS2RVZH; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aLS2RVZH"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49041e84237so92116815e9.1
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 04:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780401106; x=1781005906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rW3dGwAqiUruHWn/0Ai/AGMfG26DoRiScxLbS+CHlR8=;
        b=aLS2RVZH+5RQmkpq4+5tC9rs9s8bYcAKOubOOTB5ZNwa5zDZkR1vemu3ZGWs+G6Qyl
         9qEr0HiQrfa41N1gnIJt61VZ/AbKNrq8sot5z4RiQduYn7KTyt9u6F3rHGs4I2R/SyVx
         v+AtnJyt5eR9N4LA0Q+BIqiFnMd8d8gIt7LGcEIXJqRHDaZx9vVDfyBNML9haEEjVRo7
         UQYd6UagdYfSc56xLwBz7e6vBEPBvbTSrbcYwzPFklHVs/BUIZO8hd1nu+B0wyY/dbAL
         7aEbzthFahct9vzqNuYy+oZR8SJ1WSIRu8OUvHQY/u1o3AHIXAiAwcL6npusS6OrXL1N
         bMBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780401106; x=1781005906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rW3dGwAqiUruHWn/0Ai/AGMfG26DoRiScxLbS+CHlR8=;
        b=k3+cjzhOCpHsXB2mmiscQPoKAEap9Wq7pVZ9m9Ke9BfOfyPyEXxuBBFU9MZnaG59H5
         2cBsxyloKg80xTayjR6pjsaIapk1z/rUjYybprlSGVM749uj/1G3xYgXlGk8RoCB7b4o
         aCxugkJbaD3kF64RlQXuCwyywOt4InwvaOgeu+fCrho2MMBnQEWRYpz0sFkG4tJ5AUC3
         InoA7Wu+C1JxG8M114+l8fqyry3HDEJIAzHeGXQMsQqlAakA8miVfwt4z2yqaML1KoQ+
         WdfOY57SCt+CC8b2qHbZ86PVH+mfS4FkDpWtnyPACQJBo8zgddbEPPCe0LTEcE+loWgo
         q3YA==
X-Forwarded-Encrypted: i=1; AFNElJ+CxaKAjfPIvGvkzliJn3Hp7YyJE0tHCQ9/wE+TeiJuB6mNsi2KHxkkjhG5RE5J/jKLhF48ob68gNKJ@vger.kernel.org
X-Gm-Message-State: AOJu0YywXX59PnSprVHGSYNUDcXIRFgHdKV9u2b4lqY8ZTW7AkiCsVch
	poGDUO0oIpgD024cY/XybEwMK3FML/U/hifoLLtSQWbcDisRQcL4FrbI
X-Gm-Gg: Acq92OHOuXyoCq+12ZHEsAbGgSxJZBB8tSf5jmoDbZ7RR4+GBTF5v3Pl+oONnT+WrhV
	Bbq0pb48XflwjrE77aLWf1XhWdS4hJl3I1fYX01vMkRuVbAkLi48evxzQbohxEaGyrGCSmR53oe
	1zI4ERuOCc2ZrCjAwgWySg4PPoxQ7BEd4pE0gXYgiAvAv6Z5qxvTX5lkkRpaG1UXA8EbL1PTGzw
	S0KapKzMnnhDmjiM/xPQwwbcT0IzjwIYOCpmuHCOvmvTkwk/02Sxm6wbAZTMvVzDZcfRT6YlNnx
	d28SeEubVvbd4fSVqyv8MW43z6TYt6v0SobjDPG5fO9NlRez9+K+ZKHD/+JXzLAWmjWPlbFO33F
	icy/qzGIoa3apH8oH2e9EQsJp9CZi3rH5e0jIzw9MWy+Sa91klTEkuaKXqFiXD079RUe2g3FrRd
	sD1/1M2m1eEg/Ah/IRuR/Fjre3uw==
X-Received: by 2002:a05:600d:8488:10b0:490:9dc3:3483 with SMTP id 5b1f17b1804b1-490b0e373a0mr40839215e9.2.1780401106125;
        Tue, 02 Jun 2026 04:51:46 -0700 (PDT)
Received: from vitor-nb ([2001:8a0:c4c6:f00:e8c3:a961:5b26:a2c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c152570sm139480015e9.9.2026.06.02.04.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 04:51:45 -0700 (PDT)
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
Subject: [PATCH v2 5/7] arm64: dts: ti: k3-am69-aquila: Add Toradex Capacitive Touch Display 10.1" DSI
Date: Tue,  2 Jun 2026 12:51:28 +0100
Message-ID: <20260602115123.1324474-14-ivitro@gmail.com>
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

Add a device tree overlay for the Toradex Capacitive Touch Display 10.1"
DSI on the Aquila DSI_1 interface. Used on the Clover Board (J12), where
DSI_1 is exposed via a FFC/FPC connector.

The display includes an internal Texas Instruments SN65DSI83 DSI-to-LVDS
bridge driving a Riverdi RVT101HVLNWC00 10.1" WXGA IPS TFT LCD panel.
Touch input is provided by an Ilitek ILI2132 capacitive touch controller.

The overlay is also combined with the Aquila AM69 Clover carrier board
device tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-dsi
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
Changes in v2:
- Enable main_ehrpwm5 for Clover board

 arch/arm64/boot/dts/ti/Makefile               |   5 +
 ...m69-aquila-panel-cap-touch-10inch-dsi.dtso | 158 ++++++++++++++++++
 2 files changed, 163 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-panel-cap-touch-10inch-dsi.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index c145cc4ca7fc..bf50b7a72973 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -190,15 +190,20 @@ dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
 
 # Boards with J784s4 SoC
+k3-am69-aquila-clover-panel-cap-touch-10inch-dsi-dtbs := \
+	k3-am69-aquila-clover.dtb \
+	k3-am69-aquila-panel-cap-touch-10inch-dsi.dtbo
 k3-am69-aquila-dev-dsi-to-hdmi-dtbs := k3-am69-aquila-dev.dtb \
 	k3-am69-aquila-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-adapter-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-adapter-panel-cap-touch-7inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-clover-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-clover.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-sk-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm.dtb
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-panel-cap-touch-10inch-dsi.dtso b/arch/arm64/boot/dts/ti/k3-am69-aquila-panel-cap-touch-10inch-dsi.dtso
new file mode 100644
index 000000000000..c5d597873440
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-panel-cap-touch-10inch-dsi.dtso
@@ -0,0 +1,158 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" on Aquila DSI_1.
+ * Used on Clover Board (J12), DSI_1 is exposed via a FFC/FPC connector.
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-dsi
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-dsi
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

