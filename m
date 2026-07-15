Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62EA246BD5;
	Wed, 15 Jul 2026 05:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784094898; cv=none; b=iRk8UabHTeaHVrRZSlnyGu7hQCW58RtpLiLVNdZHBMPTxKqgE1MiKnSNRvAawWz7kwymTxDJmTnVkWMJB8vNHs91M32MNN5edjr8HJCkH0dLdY/PLRzeMmF7zQqx1ndE8V5YQtkUKWw6QPiD7BjR3osmUJdjLBgGbDLr0L/q7s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784094898; c=relaxed/simple;
	bh=GqJHNXHNbW04JFd679dK/hXxgD0rmNCjMiyDOaJxlWw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bcb3ft0n0O+cYBgIATD2mWQimtlZ5W2lu574JL9kNCQohz3lPweI2XDYgpcPsN108/9Fi6lmYuYXAGFyQGuGEHiOezGUjfyhBC0pp/Ov978R5hTloBQAy3QlkitYRTHFZxKzH4PLh1XMI2hrvBE94EmNvH0E4w2P1Qp/aVFYRGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=RYUT3Iv4; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="RYUT3Iv4"
Received: from francesco-nb.. (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 823012299F;
	Wed, 15 Jul 2026 07:54:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1784094890;
	bh=KdFKTeaKuS8bBA1sMGKHaFNH8keJ0yKoGDgEBm5PCyA=; h=From:To:Subject;
	b=RYUT3Iv42mMfHXYHg9YGEkHDkR11OTjZiooB5+/L4/F1inHpq4YeGNFaVQ3/9mIFb
	 eDi+9wRU/sXUYB8lgMcdnT4IvqBdLhPG0EvRWrTsIa9jRhyNoT8ghGlUktNoa8IB4i
	 /4fRnrLSRQELViO3LX0UaNUTpI/k/KKmdGGr9erxTbZ6iO3FittfiHcOHiT76dmPHl
	 WJNKZgFNU8/za90Xs3ewmrsl2wivw5usbxtTc18O0zPvOaSE29V+fADTKOtjswTQqm
	 jzMdxkm9/FCdPYK6PC1nuooporip9jgV2AGnQKF/ER4yRTNRBRCRBL8PaWIut9Qu6I
	 Lsm0w/9643XAA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: ti: k3-am62-verdin: Add RPi Touch Display 2 7-inch
Date: Wed, 15 Jul 2026 07:54:45 +0200
Message-ID: <20260715055446.31139-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add a device tree overlay for the Raspberry Pi Touch Display 2 7" on
the Verdin DSI_1 interface.

Link: https://www.raspberrypi.com/products/touch-display-2/
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v2: remove data-lanes property, not required (2-lanes are coming from
    the dsi panel driver) and invalid (schema validation failure).
v1: https://lore.kernel.org/all/20260623114329.63142-1-francesco@dolcini.it/
---
 arch/arm64/boot/dts/ti/Makefile               |   5 +
 .../ti/k3-am625-verdin-rpi-display-2-7in.dtso | 101 ++++++++++++++++++
 2 files changed, 106 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-rpi-display-2-7in.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 371f9a043fe5..f7f5448fcd84 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -48,6 +48,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-ov5640.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-10inch-lvds.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-7inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-rpi-display-2-7in.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-uart4-mcu.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
@@ -244,6 +245,9 @@ k3-am625-verdin-wifi-dev-ov5640-dtbs := k3-am625-verdin-wifi-dev.dtb \
 k3-am625-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := \
 	k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-panel-cap-touch-7inch-dsi.dtbo
+k3-am625-verdin-wifi-dev-rpi-display-2-7in-dtbs := \
+	k3-am625-verdin-wifi-dev.dtb \
+	k3-am625-verdin-rpi-display-2-7in.dtbo
 k3-am625-verdin-wifi-dev-uart4-mcu-dtbs := k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-uart4-mcu.dtbo
 k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds-dtbs := \
@@ -357,6 +361,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-verdin-wifi-dev-ov5640-24mhz.dtb \
 	k3-am625-verdin-wifi-dev-ov5640.dtb \
 	k3-am625-verdin-wifi-dev-panel-cap-touch-7inch-dsi.dtb \
+	k3-am625-verdin-wifi-dev-rpi-display-2-7in.dtb \
 	k3-am625-verdin-wifi-dev-uart4-mcu.dtb \
 	k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds.dtb \
 	k3-am62-lp-sk-hdmi-audio.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-rpi-display-2-7in.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-rpi-display-2-7in.dtso
new file mode 100644
index 000000000000..8366bebbd5d2
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-rpi-display-2-7in.dtso
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Raspberry Pi Touch Display 2 7" on Verdin DSI_1 and I2C_2_DSI
+ *
+ * https://www.raspberrypi.com/products/touch-display-2/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	backlight_rpi: backlight-rpi-display {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 31>;
+		default-brightness-level = <15>;
+		num-interpolated-steps = <31>;
+		pwms = <&mcu_display_rpi 0 200000 0>;
+	};
+
+	reg_display_rpi: regulator-rpi-display {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "rpi-display";
+	};
+
+	reg_display_rpi_touch: regulator-rpi-display-touch {
+		compatible = "regulator-fixed";
+		gpio = <&mcu_display_rpi 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "rpi-display-touch";
+		startup-delay-us = <50000>;
+	};
+
+};
+
+/* Verdin I2C_2_DSI */
+&main_i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	mcu_display_rpi: regulator@45 {
+		compatible = "raspberrypi,touchscreen-panel-regulator-v2";
+		reg = <0x45>;
+		#gpio-cells = <2>;
+		#pwm-cells = <3>;
+		gpio-controller;
+	};
+
+	touchscreen@5d {
+		compatible = "goodix,gt911";
+		reg = <0x5d>;
+		AVDD28-supply = <&reg_display_rpi_touch>;
+		touchscreen-size-x = <720>;
+		touchscreen-size-y = <1280>;
+	};
+};
+
+&dsi_bridge {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "raspberrypi,dsi-7inch", "ilitek,ili9881c";
+		reg = <0>;
+		backlight = <&backlight_rpi>;
+		power-supply = <&reg_display_rpi>;
+		reset-gpios = <&mcu_display_rpi 0 GPIO_ACTIVE_LOW>;
+
+		port {
+			dsi_panel_in: endpoint {
+				remote-endpoint = <&dsi_bridge_out>;
+			};
+		};
+	};
+};
+
+&dsi_bridge_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	port@1 {
+		reg = <1>;
+
+		dsi_bridge_out: endpoint {
+			remote-endpoint = <&dsi_panel_in>;
+		};
+	};
+};
+
+&dss {
+	status = "okay";
+};
-- 
2.47.3

