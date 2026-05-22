Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EBB47A0A4
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 16:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779466313; cv=none; b=f9uyDPs1tvZ6oJU07TMnYikz1gBqxcxFuEgaMWPIGsqQNJ4YBnH4f5e7vxg+WUczBEPGqFhPsbCD2Z3bX0RJgosVePw+h+rvj+0/5/yIDL1Rn3t330N5M6psyj4H5E4yDVMrV79cmRil5OssiV6nzboIOoPZtpPqaVhIymvHKJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779466313; c=relaxed/simple;
	bh=R/KeMFh1oNyP/AXIJeKBxoV0VJmTpU5JNtsMhsuuc60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=REQ3zrsCGHiV5lkY9H5ehjfIs6GT/SeRPZIAtVkoBkob6eOSVeeewGWat/p893PcdxXrphnuG646230DOi/Ueb51QsTpG2/0PEG05O3bXJAzrFYyIDmlPitiNqpIHM/AyuDvHfUujV7eQ9DlgV2LkWV+O6oCEPPbVdIBSxyCIqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VLL8XZm5; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VLL8XZm5"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso97028295e9.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779466310; x=1780071110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ExPCo+7OplbqNM1SGJnWJNFNJSLaGrXtRbe4xt7kDPQ=;
        b=VLL8XZm5P/KLf51KOq12Mu5IMb96t7Ra6PxMiD1fO/C1b8LBmjBhKgWz+X8AOrtR+d
         CrOzfI06+uBcxrHgXyiFH/19pCorUPkDfrKmwyQiFQVuJlhvnUc1Bf4XflmvX19awT0a
         j+9xUFL8GOtUXl6afO+j6WhMm0VXSun5Y3tdRX3ZsZ8GHixXKzhk+mlABbrFzCrzjuSX
         L3tvxFhBnGqaFbMFH68FKv2beKui+hcMMUZ1UeflMU1+9YiKHczhlQ+Pq7oAYfN5E7rF
         9ELGHhzpYYaSABzm9fOqohJwtG2S/KjDwXzybvS4UZ7Asf5cuirEVS+JG+UjetEs4noH
         UDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779466310; x=1780071110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ExPCo+7OplbqNM1SGJnWJNFNJSLaGrXtRbe4xt7kDPQ=;
        b=MFU2KpxlukDgb2pWzXFylphuxa1yO+BTGGPPrqVnHC/JivZEH+CBf+sO8K2EvmAIoK
         FSVsk1NBVtQ8GLqRsmxHFJdWz7vILMZCTvDV4+Yzm5+GKLiZL4nEvgtkJMr60KHfwdhr
         IxR/au3/xSpsoSy5ARhABd7Pp6M+4g+JRqcBvRhPotHb4Tpa1xDdmES/o9qGgzJ4N1qo
         0yPTzp3jFiElY2Kv/3LY9VYz33kVyFH2LOnHesqql98jLsxdUYt9umeRnrqW2ncrqhdZ
         +b3r1m9ttjEw7n0N/egQBsNx4/33iesWqI7hjcewJ3RQFKCkfp++OsUVGpNeJDkkvQWa
         t+jA==
X-Forwarded-Encrypted: i=1; AFNElJ8SP9TT6zUIYaeNumoXbaSYRg9Tswv6vIShkpdrfejICXo2uVLXexhFfIxgTPR9ulUOdPTbzhvy+dx4@vger.kernel.org
X-Gm-Message-State: AOJu0YxlY+vQxo4dj7YyRfjl98vcS43oS1B2rkEetw5DBTZMQn8ZJngp
	Vo9RoDfeioJBgeU0O4DV0bf++6PT6oznD5Hfog0TKZiAvrm+eHNshpmy
X-Gm-Gg: Acq92OE1lh5v7A7gRuM1vlm65jNDehtWiWgNROMhJTnW3KDO0K9BeCHH3YNZrQfEBL4
	U9AEt1t6vab3F8vxB0yeW0qo1YBXY2yNcBS8Q7dd46xghkyPsDDr9cY62+4DN8RuirLlweGzCct
	LUicc/gF3xs3T3NlmNaTiFD3i/28XY4IdIw/qCJhHDQJ40Ojj/QUZ2bw6a4G/gpHHtnV/jVLQE0
	vm8rnDlIwVBBfLilM7TPUwW5WosRAo4fuD2RTB1PazzvAEP31+EU/vr3bH2FrZlFEo6Y2hmym3n
	5VOcNxhVNblIPTagVpVZytsG/HypqslQ7uUwFGIwV5BwRO2uWwRZn5ZDhmUkOVd6sJFMdPjo1X/
	YjQ7zX9dFMtX0huRTCm89imF6JPF0N3MHqW5Am1Ga7qlPSd7lXbT1OFfeHmiUirlF9ZmsR6ueVC
	vKm2He8Q1lQ/9s5OqtohqGSZkmf0qoQ1L8ZCiYg0R9rw==
X-Received: by 2002:a05:600c:a402:b0:48f:be94:d82c with SMTP id 5b1f17b1804b1-490426d1a91mr45365965e9.19.1779466309761;
        Fri, 22 May 2026 09:11:49 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b9asm51042755e9.11.2026.05.22.09.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 09:11:49 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 06/11] arm64: dts: ti: k3-am62-verdin: Add Toradex Capacitive Touch Display 7" DSI
Date: Fri, 22 May 2026 17:11:10 +0100
Message-ID: <20260522161105.277519-19-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522161105.277519-13-ivitro@gmail.com>
References: <20260522161105.277519-13-ivitro@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

Add a device tree overlay for the Toradex Capacitive Touch Display 7"
DSI on the Verdin DSI_1 interface. The display features an internal
Texas Instruments SN65DSI83 DSI-to-LVDS bridge driving a Riverdi
RVT70HSLNWCA0 7" WSVGA IPS TFT LCD panel. The touch input is provided
by an Ilitek ILI2132 capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-dsi
Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-display-adapter/
Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
Changes in v3:
- Rename touch@ nodes to touchscreen@

 arch/arm64/boot/dts/ti/Makefile               |   5 +
 ...m625-verdin-panel-cap-touch-7inch-dsi.dtso | 132 ++++++++++++++++++
 2 files changed, 137 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-7inch-dsi.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index dc397bc693ac..14898f8ab0e2 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -42,6 +42,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-10inch-lvds.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-7inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia.dtb
@@ -223,6 +224,9 @@ k3-am625-sk-hdmi-audio-dtbs := k3-am625-sk.dtb k3-am62x-sk-hdmi-audio.dtbo
 k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
 	k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
+k3-am625-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := \
+	k3-am625-verdin-wifi-dev.dtb \
+	k3-am625-verdin-panel-cap-touch-7inch-dsi.dtbo
 k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds-dtbs := \
 	k3-am625-verdin-wifi-mallow.dtb \
 	k3-am625-verdin-panel-cap-touch-10inch-lvds.dtbo
@@ -328,6 +332,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-sk-csi2-tevi-ov5640.dtb \
 	k3-am625-sk-hdmi-audio.dtb \
 	k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb \
+	k3-am625-verdin-wifi-dev-panel-cap-touch-7inch-dsi.dtb \
 	k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds.dtb \
 	k3-am62-lp-sk-hdmi-audio.dtb \
 	k3-am62-lp-sk-nand.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-7inch-dsi.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-7inch-dsi.dtso
new file mode 100644
index 000000000000..1f44133f9ca6
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-7inch-dsi.dtso
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 7" on Verdin DSI_1.
+ * On Dahlia (X17) and Development Board (X48), DSI_1 is exposed via a
+ * Samtec LSS-130 connector and requires the Toradex DSI Display Adapter
+ * to convert to FFC/FPC connector.
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
+#include <dt-bindings/pwm/pwm.h>
+
+&{/} {
+	backlight_pwm3: backlight-pwm3 {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		power-supply = <&reg_3v3>;
+		/* Verdin PWM_3_DSI (SODIMM 19) - PWM_3_DSI_LVDS */
+		pwms = <&epwm1 0 6666667 0>;
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
+			hback-porch = <160 160 160>;
+			hfront-porch = <16 160 216>;
+			hsync-active = <0>;
+			hsync-len = <1 5 140>;
+			pixelclk-active = <1>;
+			vactive = <600>;
+			vback-porch = <23 23 23>;
+			vfront-porch = <1 12 126>;
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
+&dsi_bridge {
+	status = "okay";
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
+			remote-endpoint = <&dsi_lvds_bridge_in>;
+		};
+	};
+};
+
+&dss {
+	status = "okay";
+};
+
+/* Verdin I2C_2_DSI */
+&main_i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	bridge@2c {
+		compatible = "ti,sn65dsi83";
+		reg = <0x2c>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_dsi1_bkl_en>;
+		/* Verdin GPIO_10_DSI (SODIMM 21) - DSI_1_BKL_EN */
+		enable-gpios = <&main_gpio0 30 GPIO_ACTIVE_HIGH>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				dsi_lvds_bridge_in: endpoint {
+					remote-endpoint = <&dsi_bridge_out>;
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
+		pinctrl-0 = <&pinctrl_dsi1_int>, <&pinctrl_i2s_2_bclk_gpio>;
+		/* Verdin GPIO_9_DSI (SODIMM 17) - TOUCH_INT# */
+		interrupt-parent = <&main_gpio1>;
+		interrupts = <49 IRQ_TYPE_EDGE_RISING>;
+		/* Verdin I2S_2_BCLK (SODIMM 42) - TOUCH_RESET# */
+		reset-gpios = <&main_gpio0 35 GPIO_ACTIVE_LOW>;
+	};
+};
-- 
2.54.0

