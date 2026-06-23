Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC64029ACC6;
	Tue, 23 Jun 2026 11:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782215031; cv=none; b=ZYzpzE64VnjnDd3inN5eGX44LhsQuSHMYMyDocvTghXX4FCoTl+dXqQt8XQp1GnGJ0xxG+HdkX3BrOwJCkmDGtYYn2YhGcBUh0EUXEcEkjA0fa4Hmcq7Gy2SWz09Oa3BLPloteSnuAGpu5AiXksSHZ8Lq0VOn+is9mdlN3bsyiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782215031; c=relaxed/simple;
	bh=Eee0tnv+UWqDLJtNk9gcKkqiwrk15KGjs/NUUDeeecA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JUJoKowEZCkIdu2g3uw9JifgQ4P4ROwvBRU+ENR1vMT3ms3Z/wVqeQ/zBmmw6VLHxa9VC9aVOyRUwWgdPaDSX7NylH7HYCfc0Ictwb2+L5BaJgrBnWzNVcuqsPRshN1OKWSAF/r7+Ure17iu/jFFPpUt7NXTeb4GQyoz/KgdnA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=zBYG71Be; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="zBYG71Be"
Received: from francesco-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id BCABE1FA3E;
	Tue, 23 Jun 2026 13:43:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1782215020;
	bh=yb7UQDLlZzHtaJasaGAKrl3Sd5Bz4UqqdhtbFQ14iyI=; h=From:To:Subject;
	b=zBYG71BeieZ6hEoP8aqXPIYezzJDMVt5aUWYdAV1z8603//yFkLxtrvX/bHfmljHv
	 5tjVsyze63BdPd80M9jaBDPRhsxeNutX37ooW0Zinwlv6W4zH89is8nT1HNcRBW/wm
	 I2tIel5ssTRjKq0bNspbYSzeS20+iZmU9Zr9I1FMM2JCmc4UYqiFoujTZchpyeBa+l
	 YWYPxZi+0hHISQwcuqRPTy9Drqwnm4Ss5jiwyZHMCqnWrtEJAXAp89Gk98MdHy3Okl
	 KKU+Hf9TNoUpuoErhceTcpPYVIUCoQvVS3NguXt287wljt1J4/EKy0jMIho8+/Qv5C
	 6KyeAGjS7E+Ug==
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
Subject: [PATCH v1] arm64: dts: ti: k3-am62-verdin: Add RPi Touch Display 2 7-inch
Date: Tue, 23 Jun 2026 13:43:28 +0200
Message-ID: <20260623114329.63142-1-francesco@dolcini.it>
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
 arch/arm64/boot/dts/ti/Makefile               |   5 +
 .../ti/k3-am625-verdin-rpi-display-2-7in.dtso | 102 ++++++++++++++++++
 2 files changed, 107 insertions(+)
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
index 000000000000..9a2e7a170a28
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-rpi-display-2-7in.dtso
@@ -0,0 +1,102 @@
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
+			data-lanes = <1 2>;
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

