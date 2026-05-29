Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55233DFC7E
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 12:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780056564; cv=none; b=XzFzrzm8cfTMySBXNjzRdDexGo1lt98HijpgE0Dh9J9rTl1IeW3By4ScaFHOo/IyXDnqZeL2TRBy7JB2wGwEhmXaWf2zjbShHklGs2eyQ4nUE+nko24n1SU9B2tPv3gPPXFEZdj4k9eI+nEdc88gUSdjug/sujk7XQ4JjBzbcp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780056564; c=relaxed/simple;
	bh=+hraTXUBwX0E8zervQMBX6U+aoZlE1mM4TA1k25/Tao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PDzEbOJyiUxDEnDh73TBcYTN4sssomgR5jGcNkfLsppy4LTv63A9m2IpOyt5JjaoYYDr3+ZsQuvBPT5r15bXV6x9vxT8oKZ/SrXkV/reLifBuPIHTJy91w7nBUKc+rug+mUhZesMNndkIOBnqId7c5nusC5CpJ+c1OLB7OeZtvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JRruSqD6; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JRruSqD6"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so81357725e9.2
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 05:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780056561; x=1780661361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0rbuKL9h3xKy6UeQjAxSG2GvoC0sCeu/W5fIdC5/v7k=;
        b=JRruSqD6RpuTeUXexa88eeO/1pfbIRTeNSCGaGEW+txJcFGKUkaxGFAGZwpvl8YOqK
         JDHcGnsvhAlvifn1Jl0+iUXUm/Wp39ZhfPC40n5GReOo/1Dc1h6Oc+3EGXhByMlA+pZf
         Y5HnrBoo+vnNfqfVLaIhDhrsdPA9tc0N7pd6h5kxxYJoECVSnTmo3XPwY20jLHydxVgq
         sFBUFBWcbxGs8LUHsqznyg8hgS9dJLHAseRoeYKy9I3NzTJ3zZohIEz1ImMa8XBJrBPf
         LyqLtqxDTR78a5AmBPo3FLNWtXlH+eXQXfa47BWGAEnUUFeZdVTQhnccMTB3+9KxUaW9
         L/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780056561; x=1780661361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0rbuKL9h3xKy6UeQjAxSG2GvoC0sCeu/W5fIdC5/v7k=;
        b=CiAQTyG0FxH3E+UFEdhyV63ADnJv1Kx6f7IgIeH0zRlNwZ/yKr31ALUzAblEiAcGfz
         ofI/JIQO9n6a9LuykNZhZ6JlBXEI/5CuKpVb07JLcRZI6z8fho7hSQOcqKaY13a82DCD
         b8o7SIJY/2XR7JrJDQ7jlhnB5ds0u2ZaY19w2OQ+JnatxAGrguL0h5zT9d+s6bZJ0Oqv
         alNpRTPOLwp4IQR/s9Eq0BygcMvcsZAnhGEieoTVS8pX0TAUhLoGaJpU3D2T1qiVSDxv
         cnsa60YhZLt1zGDvXoS2xJdhuNi7UJYw6+MRDVnehpMfFKrFepPtWM/iuLGLMA9EIEm3
         NBSA==
X-Forwarded-Encrypted: i=1; AFNElJ9jcxUqdfAsT7f69itQ/2pH0i+jFNf/YZM1MQUQCiueJKvEtepxdLy5yiDecPHMWivnjEiahpD+WeYS@vger.kernel.org
X-Gm-Message-State: AOJu0YxK6jxSF0A3p2gDBprs3BqvBVJne1sL06xLo80r9w6JZVHVIAYf
	HPvsRDGmuZtHr9dqQIxgBzPSzVUZpYRb7I0F3P2VDK3bi/y+FVDWSUES
X-Gm-Gg: Acq92OF85audWvyx9Vx7MFBJU/NVg3SPFkhwgzBGADCp0ms0kEHhKK0+MN+/g9qBxeb
	2oWXNIvgnkLh3mnbwS1L2CeEUbYjzQy+bY20OVb+vdptxbx8svxKq7PgnNfl7Cx+BkP29NO76u+
	ivxLEOsL/jiqxkUCRg3AunQsl4yK8MmvdS4OkvGvVLXUZWmNY4/NjQeVvoKe17csds3W7fypFDc
	bF1T/Uw3bpqYbEr8xegXqEvzisaCdkZwFKKoElP4AkXfCON8XQGcRo7l6Lm4Gy77dQFXtXLN/PN
	ofIK3daPWgC4Cgi+ig7MT5MnYZMMtHYrp3vWkLfArIcgG/dcE31w5E78wPY/e2vSjcJVuI0HOIk
	HaUrGwXcFrewZ3aTYb+fOf/o8v0sI3j9mfvWmpsdfL9s4gnW5XfA6It3a9vknuVDdO2G1Ox8sVn
	/2AZIEe3iRbt+LikPeu1OvN/Fr
X-Received: by 2002:a05:600c:c4a4:b0:48f:e6de:1cba with SMTP id 5b1f17b1804b1-4909c0d67f1mr48432655e9.17.1780056560703;
        Fri, 29 May 2026 05:09:20 -0700 (PDT)
Received: from vitor-nb ([89.214.125.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c0b8a11sm13586595e9.16.2026.05.29.05.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 05:09:20 -0700 (PDT)
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
Subject: [PATCH v1 2/7] arm64: dts: ti: k3-am69-aquila: Add DSI to LVDS adapter with 10.1" display
Date: Fri, 29 May 2026 13:08:54 +0100
Message-ID: <20260529120853.636015-11-ivitro@gmail.com>
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

Add a device tree overlay for the Toradex DSI to LVDS Adapter with the
Toradex Capacitive Touch Display 10.1" LVDS. Used on Development Board
(J44), where DSI_1 is exposed via a Samtec LSS-130 connector.

The adapter is based on the Texas Instruments SN65DSI84 DSI-to-LVDS
bridge and drives a LogicTechno LT170410-2WHC 10.1" WXGA LVDS panel.
Touch input is provided by an Atmel MaxTouch capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-adapter
Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   5 +
 ...la-dsi-to-lvds-panel-cap-touch-10inch.dtso | 142 ++++++++++++++++++
 2 files changed, 147 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index c1aa5c1df927..bec6f11f3d44 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -178,6 +178,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-clover.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dsi-to-hdmi.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-sk-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm.dtb
@@ -270,6 +271,9 @@ k3-am68-sk-base-board-csi2-dual-imx219-dtbs := k3-am68-sk-base-board.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
 k3-am68-sk-base-board-pcie1-ep-dtbs := k3-am68-sk-base-board.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtbo
+k3-am69-aquila-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
+	k3-am69-aquila-dev.dtb \
+	k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 k3-am69-sk-csi2-dual-imx219-dtbs := k3-am69-sk.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
 k3-am69-sk-pcie0-ep-dtbs := k3-am69-sk.dtb \
@@ -344,6 +348,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am68-phyboard-izar-peb-av-15.dtb \
 	k3-am68-sk-base-board-csi2-dual-imx219.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtb \
+	k3-am69-aquila-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb \
 	k3-am69-sk-csi2-dual-imx219.dtb \
 	k3-am69-sk-pcie0-ep.dtb \
 	k3-j7200-evm-pcie1-ep.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtso b/arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtso
new file mode 100644
index 000000000000..4bbcdb420143
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtso
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex DSI to LVDS Adapter on Aquila DSI_1 with Capacitive Touch Display 10.1"
+ * Used on Development Board (J44), DSI_1 is exposed via a Samtec LSS-130 connector.
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
+#include <dt-bindings/pwm/pwm.h>
+
+&{/} {
+	backlight_pwm3: backlight-pwm3 {
+		compatible = "pwm-backlight";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_19_dsi_1>;
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		/* Aquila GPIO_19_DSI_1 (AQUILA B44) */
+		enable-gpios = <&main_gpio0 13 GPIO_ACTIVE_HIGH>;
+		/* Aquila PWM_3_DSI (AQUILA B46) */
+		pwms = <&main_ehrpwm5 0 6666667 PWM_POLARITY_INVERTED>;
+	};
+
+	panel-lvds-bridge {
+		compatible = "logictechno,lt170410-2whc";
+		backlight = <&backlight_pwm3>;
+		power-supply = <&reg_3v3_dsi>;
+
+		port {
+			panel_lvds_bridge_in: endpoint {
+				remote-endpoint = <&dsi_lvds_bridge_out>;
+			};
+		};
+	};
+
+	reg_3v3_dsi: regulator-3v3-dsi {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "+V3.3_DSI";
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
+&i2c_dsi_0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	bridge@2c {
+		compatible = "ti,sn65dsi84";
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
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&dsi0_out>;
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
+	touchscreen@4a {
+		compatible = "atmel,maxtouch";
+		reg = <0x4a>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_17_dsi_1>, <&pinctrl_gpio_18_dsi_1>;
+		/* Aquila GPIO_17_DSI_1 (AQUILA B42) */
+		interrupt-parent = <&main_gpio0>;
+		interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
+		/* Aquila GPIO_18_DSI_1 (AQUILA B43) */
+		reset-gpios = <&main_gpio0 31 GPIO_ACTIVE_LOW>;
+	};
+};
-- 
2.54.0

