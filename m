Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936B83ADBA1
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456047; cv=none; b=DjPD4ZbsZrrY4zusSDg5Yqj62m/ES4Cjp6HPVsOvnLzgXJGA7igu1fVY6DENoACqv/yLxTjkwcDiiliDf0tOCpfV5SHPZ59C5h0WtIVrUaGVrXBugRYa1AO8EWuj2S6cDE+sD1XkjM2vj0p2PkgmHr+9s+HBGmaUJZIp+x05iYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456047; c=relaxed/simple;
	bh=JhPMQ3+KMhTapsRXkAedrsBaM+cdzGK7XgnBMSBIUok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i0y68SqjKm5cxDGQy6hlfjCEBwhiLzOwFTFDyeS58l6LWpcaT01+4ugvZtETe6CTnBHLN9Fo+BQ6X+f0hST2eWZU+ApoMUfcJkmAqVf/hRZI6Qkx7Y6S3LU/+JjHOyKT/PqOk+V+Eb/5Ll4J7XcVl/bQ5/rCUqawLM/BiG4Bd/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gUkgWG0H; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gUkgWG0H"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49042aeeb75so11671885e9.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779456044; x=1780060844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7D35dABqjaav5/0u2KUMA47QmCFUbfMXIhJqIGOMGE=;
        b=gUkgWG0Hw3WoxJJF8g3MNh7/4BqXfA+XCxrlC+I+d4+SGo9ZAEsiDjQZ2hu8NoEd0b
         L50Fbp+2Mp1Z0/Qe4jiwjTK/bwQ8j52uQgEMcWRD/6srpLffniK7Xbr5OfmgaLRzAw0x
         guhlfeF2WUWAUsERxUChS2p3WaIrN+7oQ4J5dbrQi7kLPyrkg+XJhLLeij0M9KPYO0rQ
         9Vts+bnNv9i1M5Ehi/NseJVu8srLjhcSQzzK/mDzRjOC13OPLwqVn9D+Iyt7GFrPKqm1
         vsxmbRxIkZpvneRXJ0kvfawmz0NxPk/hwkjk7iG7JTaEfMBhJcS1Bv5xWLCLxB1aApoU
         1bKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456044; x=1780060844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w7D35dABqjaav5/0u2KUMA47QmCFUbfMXIhJqIGOMGE=;
        b=DabL7wF4ySXb3HEsgdkhca1LabhYiwkRxVaACqq/Rw7hPOZi7axVxLAniLTxalfQR0
         zoef+RG5MnAR0lm4sxfCLg6vu9AFG+DPBp6p/jkxAyWzJ7Rv6gcCd8PqNX8anCmEbU5a
         leBKUezfY4sYSpE+5LruN/4gl7ZTpdtJ949goBG91Axt5qfOEaV/fj3C/5rd1bpkcruK
         JzOESHrhJ7fXx6hLYpEtdr9HN1rg13igePsqY0cABG7S24cDgUosTJp5il6CVZxvKMNF
         Zuck/2vPSVqkg7ciOf2terVu0uedmv0tnvYrlq/0NUKmxsVmfX0kLkl+BYG25MsXufO2
         ytMg==
X-Forwarded-Encrypted: i=1; AFNElJ9dJDcoyyQ6DiTvRXbKQg6Udm6ZHwab2+kldcJ4dVJUFP9qx5GfX1gGgmP/+/x3lvDyP9/VZUVl3+hq@vger.kernel.org
X-Gm-Message-State: AOJu0YyFfgKBA8qJaYjwi5INwDkjb0XS04IW/mi9tPnnTMhZMCYlY0AH
	RzhBVAWC6LIIe3V8kWR3lC80DjnQyfWquR1RwiR5AsX28dobOTKFhU7o
X-Gm-Gg: Acq92OFpVgOrLHyi5aeR31Q7SNZEH243AORy2UM05+bGaiSKoyuJ6f098FfsCDOI+Jw
	AcgNTeeGk9iskwhyMPiCMrGBPMt2VspNB+gFNxHhy7V9bU2NS4B0GluuH6eFsXvK+V8XbXnzDmM
	Ro2LdXkRx0Ak64YGN1CxI96HHm/ZIamJWt9a510wg6srmVqKSKrmTQnoz+QKcQX7/65xA75mcwa
	Cf/mEnMI9eqDPPKAFo1HFPH6MhN4mqVSZ4nj9122lKCJ5hDbZZ5NvRPPigKbaKw67u+qFloffU7
	5wmlgDtCXKHHx9Etkn7tkMIyfc0kyoK7FtHzzqxE6V8BBTh4ZzXm8wIwudodVhtXXDL4LioLQ1Y
	eSmmSFoovivj5z0uwI0TLhsz0yTzZihk928r4Qhx19UO0k93btZ8+CiOc3g3pOkdp36dW4tUVKn
	q457AARqiNc2RzfMbYAaKZDCCo9Cw+Hi/2E8Eu03st7ZzEYODLuBP9
X-Received: by 2002:a05:600c:5298:b0:48f:e230:2a26 with SMTP id 5b1f17b1804b1-490428e16bamr53107105e9.33.1779456043753;
        Fri, 22 May 2026 06:20:43 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0cd5sm52220755e9.10.2026.05.22.06.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:20:43 -0700 (PDT)
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
Subject: [PATCH v2 05/11] arm64: dts: ti: k3-am62-verdin: Add Toradex Capacitive Touch Display 10.1" DSI
Date: Fri, 22 May 2026 14:20:18 +0100
Message-ID: <20260522132014.226721-18-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522132014.226721-13-ivitro@gmail.com>
References: <20260522132014.226721-13-ivitro@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

Add a device tree overlay for the Toradex Capacitive Touch Display 10.1"
on the Verdin DSI_1 interface. The display features an internal
Texas Instruments SN65DSI83 DSI-to-LVDS bridge driving a Riverdi
RVT101HVLNWC00 10.1" WXGA (1280x800) IPS TFT LCD panel. The touch input
is provided by an Ilitek ILI2132 capacitive touch controller.

The overlay is also combined with the Verdin AM62 Dahlia carrier board
device trees to provide ready-to-use DTBs in both WiFi and non-Wifi SoM
variants.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-dsi
Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-display-adapter/
Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   9 ++
 ...625-verdin-panel-cap-touch-10inch-dsi.dtso | 132 ++++++++++++++++++
 2 files changed, 141 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-dsi.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 867c05b675d1..dc397bc693ac 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -11,10 +11,16 @@
 # Boards with AM62x SoC
 k3-am625-verdin-nonwifi-dahlia-dsi-to-hdmi-dtbs := k3-am625-verdin-nonwifi-dahlia.dtb \
 	k3-am625-verdin-dsi-to-hdmi.dtbo
+k3-am625-verdin-nonwifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := \
+	k3-am625-verdin-nonwifi-dahlia.dtb \
+	k3-am625-verdin-panel-cap-touch-10inch-dsi.dtbo
 k3-am625-verdin-nonwifi-dev-dsi-to-hdmi-dtbs := k3-am625-verdin-nonwifi-dev.dtb \
 	k3-am625-verdin-dsi-to-hdmi.dtbo
 k3-am625-verdin-wifi-dahlia-dsi-to-hdmi-dtbs := k3-am625-verdin-wifi-dahlia.dtb \
 	k3-am625-verdin-dsi-to-hdmi.dtbo
+k3-am625-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := \
+	k3-am625-verdin-wifi-dahlia.dtb \
+	k3-am625-verdin-panel-cap-touch-10inch-dsi.dtbo
 k3-am625-verdin-wifi-dev-dsi-to-hdmi-dtbs := k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay.dtb
@@ -26,6 +32,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-tqma62xx-mba62xx.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-dev.dtb
@@ -33,8 +40,10 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-zinnia.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-10inch-lvds.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia-dsi-to-hdmi.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dev.dtb
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-dsi.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-dsi.dtso
new file mode 100644
index 000000000000..de0148ddd596
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-dsi.dtso
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" on Verdin DSI_1.
+ * On Dahlia (X17) and Development Board (X48), DSI_1 is exposed via a
+ * Samtec LSS-130 connector and requires the Toradex DSI Display Adapter
+ * to convert to FFC/FPC connector.
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
+			hback-porch = <88 88 88>;
+			hfront-porch = <12 72 132>;
+			hsync-active = <0>;
+			hsync-len = <1 5 40>;
+			pixelclk-active = <1>;
+			vactive = <800>;
+			vback-porch = <23 23 23>;
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
+	touch@41 {
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

