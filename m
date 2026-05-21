Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8F0315D49
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 15:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779375676; cv=none; b=ZHokfsbWouxOr3NchF8QKR2+0p2QgocgUC5YigixuhjNkUCRKwmCxWWC3279jjkD+abE3HwHKsQPIV5UY7CTjRPV/gkBplWRCJjwUzZbAIYjvODdZ3Vd36Yo/Adu1IRk/HapuXBGd/CI5LnUGIQeKgWEEtL/wwbPg/diP/2/TMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779375676; c=relaxed/simple;
	bh=JhPMQ3+KMhTapsRXkAedrsBaM+cdzGK7XgnBMSBIUok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fvs2XAwQZpBGa3QdKqOqx1ydhbUFeS5EXMqTeNItsQIjBSv0VTS0RreOORhvN7ySkENOz3B0q2eqbglU4mWoDOM5r0d21y9uOUzwEEkiG7IaO16SZUrlCiEVCRqUcLo6YNAkFJSA+GxVg0rMSA4Uw68LquKqclpWkbvhx8V5AEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DkYClQlf; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DkYClQlf"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4903cbfad68so4492205e9.0
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779375673; x=1779980473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7D35dABqjaav5/0u2KUMA47QmCFUbfMXIhJqIGOMGE=;
        b=DkYClQlfhprJxtGREExsfT0U09qUPkgEIGNsMZx0VoaEhFDfMaHrDU71cW+AwdykUB
         2dKGELDmQx/rs6kR/1o6oI5wBBqbzw1lnUE5lpJuAAt23BTL9T3finEzwvcBG2NmAu8w
         rYpSndxl+BvHJUqMCl13tJsf/su0ikNRXf8HrL9+zjO8WBPJanm4Y2t2ZOaUP5ocj/oQ
         lnXpTRgxpcTZ5ECBJc0XniHkJ/eLeWiFctyJwUlalaMgZKzmub0O+TZxFGjMUpElgNbA
         2nfechaXKiKYX+JJJOSgv0yDFLYsBFOSj7LjNkLhoyKCYaXn6haUYIEr6sC/LLslknNp
         caIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779375673; x=1779980473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w7D35dABqjaav5/0u2KUMA47QmCFUbfMXIhJqIGOMGE=;
        b=rqYnD3a7GKc/r9kZ7fDugvkovalg3UAmaR2ieS5DpWqmG0fc2Jr1LS4U9lE4l3tyJe
         mKLiZstY65Y3u+fMpQkWQ7H0cjF0kUcWJw5OEpGNImDnn8cN6USEktCUpVpKMkJYmko1
         lbRddgOxmLAUDvQxLejcuKNkAgq8+3yV53TTBlLgG5bVD0WYRpLYsTgNRgA4pXe3ykUc
         a3SKMtunQt5VpQp6g9Xg6l1AVGLpxihWerpqgyScGnWFsgfZGT2dDmjOjtUgubVgTAd1
         f+IpNf9sVUlBHFIrDf7y7f4mLCOAiyig/Fp2xEWLblO413kolhPtY85fe3BPLZtAtaYt
         l/Jg==
X-Forwarded-Encrypted: i=1; AFNElJ80m1tj+7w3IT6TXNjW4DcgfcWveChkxBoeOQMeX4X5Ug5itRCob3Ukw+w4djL0NjSX//7c5W9zZn4Z@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa0ZEUOd8lWWW1v1+VaBm0Grr5gISb/sSVZ5E5sPqhaaJ55cGL
	oE/ILnC/+P55bQ8bgs7DNIw71AE3wTfSsFM4wV6+nEC6EDdZ/P9pOLs5
X-Gm-Gg: Acq92OGhjjU3OnS3MwOVDzm+8+G2VMHlBEGrT++R8zpV/VzI12fV+G+wzJOpspQhm4u
	zxxSgs55avkMiQNmVh9JiainRPZsVSWzKLYcGvOXsJSrf/uy3CgmH/0BzxHJdL+YR02mAommZCa
	bAZeYYDL4p12ObXYQc8aGguVWU2dV6A0NtjhR5M99zZ5sdEexa8AHiFiB2RFJ1EW4mHirPGGsSf
	crF7Xz7QBKJZMA1AEFyE69W5BAE/3pTLymQwkONVPKJnYNEvWmhZ65k9bDHAykYcr9HsEYenaf/
	T+5co2CKyMaUiagbMjFAjX+VF9nXXkMmcIzzkKaRkdIISqOv6P38vMYqZ3ZWGz8mWWXT0ShPIPv
	9jFyNZbDd/kKpiK9UJEfvkfFzI6f1aIwCsLvjeSKFVm7CNrPVw+XTM+E4+BwclN3mSF7LTIy09M
	Fk7emVhhtOHr/Y3bNk8aQ6VlGJ+83MlHWS6mw95zoUxg==
X-Received: by 2002:a05:600c:5298:b0:490:3d48:6cb9 with SMTP id 5b1f17b1804b1-4903d486e41mr18147755e9.3.1779375672165;
        Thu, 21 May 2026 08:01:12 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm34056745e9.14.2026.05.21.08.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:01:11 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 06/15] arm64: dts: ti: k3-am62-verdin: Add Toradex Capacitive Touch Display 10.1" DSI
Date: Thu, 21 May 2026 16:00:42 +0100
Message-ID: <20260521150038.103538-23-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521150038.103538-17-ivitro@gmail.com>
References: <20260521150038.103538-17-ivitro@gmail.com>
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

