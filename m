Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AD13DA7FF
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 11:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780401114; cv=none; b=ZcBBYsqBPYKXupxhZCbtNYfavbZUWR+sdv8pjkHc9Iqe+MDEG+FNAD6vUF1q0niLXrN4K1te1hwFIDmIzuoXUH53+RzaTRLHqz+Pz3Q+PtmqBCiUsfFb9ZMu+npiswSzVprBnF+3bO7PyxqR0YDEpHPoLYyqLh87jP+YeD6ZL3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780401114; c=relaxed/simple;
	bh=CBnTBF2b8ru+ARGKY0BL/auQy3YbEtK08w2Gn946fo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m+K2oIwBzy9pOrEoIDoIiGJDmlozbVeeufO4Ox509gyUscd6tX0lFmDM/iIRiyKhgY5NGna+2Ew+43rpA7mHXWTpejk04HSid9n+damJ/C+N12YhEaVVvMvRUmBc7J/lQ2HuGygZBTgaEEf9D2O7JuOUcCXj/f0B5+MZC6xu05Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XhSuWa+8; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XhSuWa+8"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490a765d410so27487085e9.1
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 04:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780401103; x=1781005903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S6nMamazsyQtYMLkplyeZLnOvImIi25TqQ6cMt5t+/U=;
        b=XhSuWa+8QnfPm7cWQsdDZCPRlLF+JJVX1MbfEXlLRZJsSeD9IUdFSZgn2GoeX6Z11Z
         cy5+k0H3PWFAH01mT66vSqqPuXCuaa3AOGNq60UBC7VQ2JcaKlUvN6tkus/5vmHQIYtQ
         ILYcVonNjY7Mju8IT/PGBinipIuCzFG5uxi9AluBJqNTZIIL2BLz41svQM0JhLSbry5b
         YdHA0Zy7nxqiUMctcb8/DsHZhYAfD+c7nuIzldrRMKXZ7BDSQatOvyaNshBFhpBEI68S
         NeXzUPA4p5AJs7FmAW/94eczS/EbRe5Iu5Hx7IrPRjTcuDbhIsxcQYKbzJR6RkbrdXXF
         ojSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780401103; x=1781005903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S6nMamazsyQtYMLkplyeZLnOvImIi25TqQ6cMt5t+/U=;
        b=GrR3n+ljM/exy4uE3opEmrebCr5ajcomEFLR3kX9LKf6hbza1VtjVJ46dJU6bi0Qk2
         pWwZQkrQXRTIii9byheTDH8J/mmy85JDZJCGkci6tB9I9rQE2E5ZkMXt576hEl5ZxoDX
         9iyG8Uy5sXvu6qON9U5HU5S1aaaQ3Eb399jB58fd6frOnd57DFDMXzYQ/w/6Tp/qR0bf
         xGH8j6+/gaNvqLBbOyW/AYdxe0FpD7OrbaG36unHzxuC8HpkajbPOVrBiI70eBejlTSw
         OQKE/lq5NjSo25xljLkF9/eG/QS2EeSk14Jg0kNFw9yxAis+aAFB1HwHfZyi43iBuFO3
         ocrA==
X-Forwarded-Encrypted: i=1; AFNElJ+06TDHf8P6Ua9tt2tEZobT4w2psu51QRXfULD39iYElTR7xG2pX/CbG3D/6PxYh4tjnkZ4Rj/CYGOP@vger.kernel.org
X-Gm-Message-State: AOJu0YznZcxroN0E1heBw5aCiO/2wWdCKjHdEdweMVpnH8GidYTO1pUx
	7SYHAWX17TraUSdqAFIEs6VqsXbZizyZxbDPuSHxMwAbyg7tCa7g846rr2hu3Q==
X-Gm-Gg: Acq92OGS6cqdqzgVKpMw1xmWQrWCFObKupk58XmptBXYeMIYch762Ez7wExJ3Y2FnBT
	QeZzzuH07L1NyLCHFeLB9xy4vtb11y8owFPTXwkkA4K9CC1yXhi1yjjQQwsp7UidRQFJ7pQW86S
	r2+9hhvWu5HeNU5EFjPiEYX5KHtqF+UGuH+j5MVOHpRx791f8KgC6uvP3RtxjZ7nEq60a8yqO8c
	c39Ak6ximBM9XF3Kpu1rm4O/APY5WbcyrrzeL1KKb6Z4/HnShzzt/U5TyiSiTzWqzitOljEcZzm
	n7sMpAKhtmAjreT8sdB8LFmG8ZpjneSnSCf9FSDWuA8ZuuUE9/ck+ujRQm/KQvU1yIbuZ/qTTlY
	Hb7TxFnWPNQdiA2+ILmE6VLsxAv99L/on6DQ6Tk/BvT0s35AcKMX6/O9fniZvRisX41kXwrRT4I
	wpQXVqAtwDn19OomKMeP4hjJsDuw==
X-Received: by 2002:a05:600c:a111:b0:490:469c:556b with SMTP id 5b1f17b1804b1-490a2933355mr220673185e9.12.1780401103218;
        Tue, 02 Jun 2026 04:51:43 -0700 (PDT)
Received: from vitor-nb ([2001:8a0:c4c6:f00:e8c3:a961:5b26:a2c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c152570sm139480015e9.9.2026.06.02.04.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 04:51:42 -0700 (PDT)
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
Subject: [PATCH v2 3/7] arm64: dts: ti: k3-am69-aquila: Add Toradex Capacitive Touch Display 10.1" DSI with adapter
Date: Tue,  2 Jun 2026 12:51:26 +0100
Message-ID: <20260602115123.1324474-12-ivitro@gmail.com>
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
 ...la-adapter-panel-cap-touch-10inch-dsi.dtso | 155 ++++++++++++++++++
 2 files changed, 160 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-panel-cap-touch-10inch-dsi.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index d216b1e1e8f6..966cec4c5b6e 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -192,6 +192,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
 # Boards with J784s4 SoC
 k3-am69-aquila-dev-dsi-to-hdmi-dtbs := k3-am69-aquila-dev.dtb \
 	k3-am69-aquila-dsi-to-hdmi.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-adapter-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-clover.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev-dsi-to-hdmi.dtb
@@ -311,6 +312,9 @@ k3-am68-sk-base-board-csi2-dual-imx219-dtbs := k3-am68-sk-base-board.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
 k3-am68-sk-base-board-pcie1-ep-dtbs := k3-am68-sk-base-board.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtbo
+k3-am69-aquila-dev-adapter-panel-cap-touch-10inch-dsi-dtbs := \
+	k3-am69-aquila-dev.dtb \
+	k3-am69-aquila-adapter-panel-cap-touch-10inch-dsi.dtbo
 k3-am69-aquila-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
 	k3-am69-aquila-dev.dtb \
 	k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtbo
@@ -397,6 +401,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am68-phyboard-izar-peb-av-15.dtb \
 	k3-am68-sk-base-board-csi2-dual-imx219.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtb \
+	k3-am69-aquila-dev-adapter-panel-cap-touch-10inch-dsi.dtb \
 	k3-am69-aquila-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb \
 	k3-am69-sk-csi2-dual-imx219.dtb \
 	k3-am69-sk-pcie0-ep.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-panel-cap-touch-10inch-dsi.dtso b/arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-panel-cap-touch-10inch-dsi.dtso
new file mode 100644
index 000000000000..a5ee6c867fb1
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-panel-cap-touch-10inch-dsi.dtso
@@ -0,0 +1,155 @@
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

