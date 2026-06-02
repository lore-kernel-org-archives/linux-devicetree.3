Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA003D7D60
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 11:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780401109; cv=none; b=B78hKyw06ZZ69BF6nzA7VW5l/8ap5FbnUvRDajoZ00EFXmJZZ4ti1ynDCUIQxRsPadOUoweT1U8AvGsSixLBSp5YQKSxaD3FtcxK8zWvfryIlHkV1dN5oWhNIOAFFW2Qh5RYHktCCpWREDZm+aHj+jbv5lyWuY5pUC/BljalWdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780401109; c=relaxed/simple;
	bh=rWjyq6+pxNER/22ODNaRiQe3slaNu5LoMxd9EvQbM2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Eok0kwnVCtLmnsWjytsVO8wbaL8SjildB2qU24dMJMHGLrzHuvSDo2yRuORx7BVk1WHDNSJ0AOdhBgLJtINfuPfGCScx/1Okigm7ifo8i/yom835Ym8vYRrt1dmaekvn4xhuYGPcrAvHVlfglNpCW9CYyzmTxA5Wg0rAepaG3xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FXC4ISEU; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FXC4ISEU"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4906238c62eso92249005e9.3
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 04:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780401101; x=1781005901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lqrONscvrYMt5SVKXcdUyP2T4pB2G6tq9E1v1z7r7aw=;
        b=FXC4ISEUEMgfX9H8BuZR5aRUvxSCqme8GnV1087nM9CR6Ysbg1qbYE1ZpZRxJVWLIe
         JBh7RkpWWdbU5g++xPNPTBIZr9HemI2GnmJR6QhFSlOmRzSjE4Fnapi9GteO9ulr6USX
         xF2EjzX5psQHkDHI4MDcwT6CM1hIEup+LBI5siWx99G1FBQe0V7WZ1j5lXt/iJTHqVJW
         PFd2ObNWS8mwtvD+7PRUWJ1t+yUPWjqrSUgSBAnj79wRnIa7PY++vtXapOQYuiP/jnIo
         6j3ViYd7RKsLVYiSNNEM2I4pOcTM/EmR6HbTeIc33dHoKZdT+KZ1CXmdFK3xxHoAOvkh
         F/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780401101; x=1781005901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lqrONscvrYMt5SVKXcdUyP2T4pB2G6tq9E1v1z7r7aw=;
        b=GrJrHhie7oJ43YA807MyxypjgsUSBr4rMXqDROztYKdc1dNDNNEwiJRDJ/vxl7SErK
         Zm75Ln/Eerlm94pHeQxJAUzGp6gPN3mELWzD30Dy+UsRyoVsaaPrGJAfqxQrOeNEd1Gw
         lwItbxbz6jMXMLt/cFMcXH0GAe+9mZx93+aSA5jTN8AC2ZtYkv7qH+OH63si3loRHho6
         /Evtu3pMPr6TntVwCxg5I3tXdYplBnR3O1P7zO8Y7vNZwTU9IYS8fqqLYZn2y6pHqD3u
         GbTu16c0YDw3+abVyAG/FkbzCUhBHoGEV+pD/fAucjUNsabpRt5MdzHUudWlfJSidLYa
         Tn4g==
X-Forwarded-Encrypted: i=1; AFNElJ/ep1JmQVcU5AoCbVU5Rqizmmgsl+6V/SEUYQvu0sHtIUmlrRgaMOnt8PBBKsbjNjnCgiBpAcvh2aIj@vger.kernel.org
X-Gm-Message-State: AOJu0YyFfMFWjDwXJb6TpCsYIIsG+HUxS5t1N98qaZYt9hPVQ+cPG4O1
	KQgl7FnvlKfgWLJAcGvrI6u8QrTa/rrcZ9D2KLGEN8ZQXZ8qPlJzNTDf
X-Gm-Gg: Acq92OHSdPbM9C9QoiFPyg8yCrMQnkZBL8N5CPfKLodMdJ22SP1oGFUlH/PdJGvmUGw
	itIOOlLI5UMAfKWD5xoM0bdXgALho/1SYQmN5HjLLjHCnjtxxyH6iK/+TotrEXm+OmuP4twh+Vg
	QWe1mzajYs+hqCzoEDDRTV/t5bXB4hy3MbS3FP4ZQZG3x3dzc+rXcCNur8GUYHcp6+7/4mDW6Qe
	tcpgTVWTGJMHORsD7IsRLfZD5XqxcyywVjxKLVhSKU9UPh4v2ww96psPZ4gnkBTe29UEU3ZbxJJ
	//FjxOO/iok9jAtnTeYoz74BAWG+7p8wF9STi7Nf0tR/OosZD7Bhc92rh0h5mHfG/oAXd3uGCAa
	XLXsesq8GNS/bNAQMSyvRxJKedFx+jHdmtPy/Agq1pkPNaXzwwdgSmyg9Gm1JY7aI3DuIKvrl2Z
	WGgSuqoFGRk74eyIpFPpOdPiC+ng==
X-Received: by 2002:a05:600c:1c06:b0:490:a298:3859 with SMTP id 5b1f17b1804b1-490a29838b6mr313200345e9.24.1780401100850;
        Tue, 02 Jun 2026 04:51:40 -0700 (PDT)
Received: from vitor-nb ([2001:8a0:c4c6:f00:e8c3:a961:5b26:a2c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c152570sm139480015e9.9.2026.06.02.04.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 04:51:40 -0700 (PDT)
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
Subject: [PATCH v2 2/7] arm64: dts: ti: k3-am69-aquila: Add DSI to LVDS adapter with 10.1" display
Date: Tue,  2 Jun 2026 12:51:25 +0100
Message-ID: <20260602115123.1324474-11-ivitro@gmail.com>
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
index 7709bb58d4ca..d216b1e1e8f6 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -196,6 +196,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-clover.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dsi-to-hdmi.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-sk-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm.dtb
@@ -310,6 +311,9 @@ k3-am68-sk-base-board-csi2-dual-imx219-dtbs := k3-am68-sk-base-board.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
 k3-am68-sk-base-board-pcie1-ep-dtbs := k3-am68-sk-base-board.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtbo
+k3-am69-aquila-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
+	k3-am69-aquila-dev.dtb \
+	k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 k3-am69-sk-csi2-dual-imx219-dtbs := k3-am69-sk.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
 k3-am69-sk-pcie0-ep-dtbs := k3-am69-sk.dtb \
@@ -393,6 +397,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am68-phyboard-izar-peb-av-15.dtb \
 	k3-am68-sk-base-board-csi2-dual-imx219.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtb \
+	k3-am69-aquila-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb \
 	k3-am69-sk-csi2-dual-imx219.dtb \
 	k3-am69-sk-pcie0-ep.dtb \
 	k3-j7200-evm-pcie1-ep.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtso b/arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtso
new file mode 100644
index 000000000000..0cb662e023d4
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

