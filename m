Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854E93A6B94
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456042; cv=none; b=A6d2HitIghJuMhBKCaeECs02kVRyHlGremrWNq0jGEjSpz8FXorCT3BQh7Z5Euspl64v+NgjqDgQjahGPCQJGZJOkNCvsuQ0Vybqt6fdKRoUjewh2ljbqZPokBajDneUWGnpj4iqxqlLtIrm63tKtk5l1k91EBqSkoOk4gyoZL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456042; c=relaxed/simple;
	bh=cHCaWaKHSAVlz3hbAE4AqeMh8fvDrBYkXwMJtSBTMP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g8JIzHid9P4dU3ZyLz9jnioqjgU+Mik8M7HSRD+f/OXUPHkS/qqPoBDxHCgDMIebSF83l/Uk4OkONlnKaJ3ev9269hubiBsf46A4XLEydMgyJfuZO59g6l/kcg4uIZ7HJy5T/c/cB9qWnsAcDS78rJODfRxFegSvKtrOndlpoYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DOht/yxL; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DOht/yxL"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4903d5c67bfso8132395e9.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779456039; x=1780060839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wF/xdHDvjpswHjQlyB9UB/0Ql6EbDcVwyoLerz8dv4c=;
        b=DOht/yxLzniWrJsAjcA623FTifCDGownKnrKLn1jo7nz9N2JsBgS1c25c4x/NodlBD
         vR0+gdrMKgzz/wbe3y1ANwwsRdEHJdD3VD1/SbGBlQvqqMmzIpCf07LawBQorU+tltNj
         oeoffFV56buFEn0wXM3YLLjE/eHMda/hIqj/2EIyYzXJdhQa4jby69ZJHXk1FddloEr9
         TSwvw3PoHotszsT0RiTjPZpzNVaaFAN+Mk3CXZ56xbI0dqZMzNm9/RH9kA5fg3QO2G7k
         DU0ovfsGU3WGlUygmHTQVeSauhdo69TCo9XIq3gNoWVJtqytGYunmMcPjfZOJBSQHmhg
         NImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456039; x=1780060839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wF/xdHDvjpswHjQlyB9UB/0Ql6EbDcVwyoLerz8dv4c=;
        b=H8TcJsS3dXxeI2n1WbW6CTdw6evBckxe946oeC1Rbl1QgFTBiQnP66Ux6uMieeiJqE
         I7lqUoXSDYsdUt/eC/hGlxWjYVRwqLC+kfVzTmHZwJZOLo9eMc8gMkMPTa0D5fNhFbOk
         Jp7CtVuqVVjLhwVNF0hvI3ZTb7DPudeLWFhRedeSJRKkYOEfxnJjy05Tzyp526yu6mV4
         fUNQDF1qqMPNan6ES10rMWg4Z9bRYfcDSXbF1UIyudvhXHa4kfCnG5znfP1Oj988847U
         pfd/09wAo38W/lklmmkqWepS3hcS6SFUgOYQ+ORW54TOwn7kMEyZ3+URnVVeLIhKeTlF
         HSzw==
X-Forwarded-Encrypted: i=1; AFNElJ8bhZStzka+NrZKvfNuSJXhhar+qdCAPsZ3WOp7s+Emor8R0VE23Sx7TZOWpspslgogmdSZc4y7u8x5@vger.kernel.org
X-Gm-Message-State: AOJu0YyZCHMc0z0qOGBP7xEpgUbNeMlaE2fmZZmBcBus425O/j3JvlYK
	ZzhG6sn8oTGol/Zy9o4Cyf8h6Hy4IDKBiQdewB7kuh1rAUluHGui7K4l
X-Gm-Gg: Acq92OEHyTdhcFCkc+lYL4g4AGBmLk+uXIG1pD2tWdKccT1OR2nCwqyn7slTwqjfyie
	DpTPtjTWrLFmIhnGTfPAsBMyW8gP8acLGmG7BXCaUa1FhP2pw7B3B2BJmwS7Apjvt8VKu3LFOYj
	aOdk0JP+FFkTeoPjAGg23Ds/ixZaKRg987bXGR/ZiN5ukW+GqsXDVSl/y7IfSdXH/W55HAD6l8u
	e2YHKDgHE+Wd7OrAg0VUyzpVfAx3XpuUP0HQw5zSDIv/BANd9gfJzDRD9hj80Y9Vb2bhLptBsMM
	jPCU9YCgz83pzjcEeTj/sqbAcZltAkTC/X5HeNnyuO06zYEjFF/voIW1FrWwH7Mh1jGAOdokwG0
	TurRh/BuAHq01bmIKZ9joJRf7T1VLbGJrOmisWmtYupVn57OaPu5oEkfpUaTepCggPquRvcp/Wh
	UjOmLCkSF6L1CdX2ZO5j07Q0ZKwRVaWvcRNKsgd2kTfg==
X-Received: by 2002:a05:600c:4ecc:b0:488:a824:fdff with SMTP id 5b1f17b1804b1-490426d190cmr49964645e9.22.1779456038767;
        Fri, 22 May 2026 06:20:38 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0cd5sm52220755e9.10.2026.05.22.06.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:20:38 -0700 (PDT)
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
Subject: [PATCH v2 02/11] arm64: dts: ti: k3-am62-verdin: Add Toradex Capacitive Touch Display 10.1" LVDS
Date: Fri, 22 May 2026 14:20:15 +0100
Message-ID: <20260522132014.226721-15-ivitro@gmail.com>
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
LVDS connected via Verdin AM62 OLDI on carrier boards exposing LVDS
interface (e.g., Mallow). The panel is a LogicTechno LT170410-2WHC 10.1"
WXGA IPS LCD and the touch input is provided by an Atmel MaxTouch
capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
Changes in v2:
- Use panel-simple compatible form

 arch/arm64/boot/dts/ti/Makefile               |   5 +
 ...25-verdin-panel-cap-touch-10inch-lvds.dtso | 119 ++++++++++++++++++
 2 files changed, 124 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index b2408f62c139..867c05b675d1 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -33,6 +33,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-zinnia.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-10inch-lvds.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dev-dsi-to-hdmi.dtb
@@ -213,6 +214,9 @@ k3-am625-sk-hdmi-audio-dtbs := k3-am625-sk.dtb k3-am62x-sk-hdmi-audio.dtbo
 k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
 	k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
+k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds-dtbs := \
+	k3-am625-verdin-wifi-mallow.dtb \
+	k3-am625-verdin-panel-cap-touch-10inch-lvds.dtbo
 k3-am62-lp-sk-hdmi-audio-dtbs := k3-am62-lp-sk.dtb k3-am62x-sk-hdmi-audio.dtbo
 k3-am62-lp-sk-nand-dtbs := k3-am62-lp-sk.dtb k3-am62-lp-sk-nand.dtbo
 k3-am62a7-phyboard-lyra-disable-eth-phy-dtbs := k3-am62a7-phyboard-lyra-rdk.dtb \
@@ -315,6 +319,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-sk-csi2-tevi-ov5640.dtb \
 	k3-am625-sk-hdmi-audio.dtb \
 	k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb \
+	k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds.dtb \
 	k3-am62-lp-sk-hdmi-audio.dtb \
 	k3-am62-lp-sk-nand.dtb \
 	k3-am62a7-phyboard-lyra-disable-eth-phy.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds.dtso
new file mode 100644
index 000000000000..48479e83dcd3
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds.dtso
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" connected via Verdin AM62 OLDI
+ * on carrier boards with a Toradex standard LVDS display connector
+ * (e.g., Mallow).
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-lvds
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pwm/pwm.h>
+#include "k3-pinctrl.h"
+
+&{/} {
+	backlight_pwm2: backlight-pwm2 {
+		compatible = "pwm-backlight";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2s_2_d_out_gpio>;
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		/* Verdin I2S_2_D_OUT as GPIO (SODIMM 46) */
+		enable-gpios = <&main_gpio0 34 GPIO_ACTIVE_HIGH>;
+		/* Verdin PWM_2 (SODIMM 16) */
+		pwms = <&epwm0 1 6666667 PWM_POLARITY_INVERTED>;
+	};
+
+	panel-lvds-native {
+		compatible = "logictechno,lt170410-2whc";
+		backlight = <&backlight_pwm2>;
+		power-supply = <&reg_3v3_lvds_native>;
+
+		port {
+			panel_lvds_native_in: endpoint {
+				remote-endpoint = <&oldi0_out>;
+			};
+		};
+	};
+
+	reg_3v3_lvds_native: regulator-3v3-lvds-native {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+	};
+};
+
+&dss {
+	status = "okay";
+};
+
+&dss_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* DSS VP1: internal DPI output to OLDIx */
+	port@0 {
+		reg = <0>;
+
+		dss0_out: endpoint {
+			remote-endpoint = <&oldi0_in>;
+		};
+	};
+};
+
+/* Verdin I2C_2_DSI */
+&main_i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touch@4a {
+		compatible = "atmel,maxtouch";
+		reg = <0x4a>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2s_2_d_in_gpio>, <&pinctrl_i2s_2_sync_gpio>;
+		/* Verdin I2S_2_SYNC as GPIO (SODIMM 44) */
+		interrupt-parent = <&main_gpio0>;
+		interrupts = <37 IRQ_TYPE_EDGE_FALLING>;
+		/* Verdin I2S_2_D_IN as GPIO (SODIMM 48) */
+		reset-gpios = <&main_gpio0 33 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&main_pmx0 {
+	/* Mallow Touch RST */
+	pinctrl_i2s_2_d_in_gpio: main-gpio0-33-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x0088, PIN_INPUT, 7) /* (L24) GPMC0_OEn_REn.GPIO0_33 */ /* SODIMM 48 */
+		>;
+	};
+
+	/* Mallow Touch INT# */
+	pinctrl_i2s_2_sync_gpio: main-gpio0-37-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x0098, PIN_INPUT, 7) /* (U23) GPMC0_WAIT0.GPIO0_37 */ /* SODIMM 44 */
+		>;
+	};
+};
+
+&oldi0 {
+	status = "okay";
+};
+
+&oldi0_port0 {
+	oldi0_in: endpoint {
+		remote-endpoint = <&dss0_out>;
+	};
+};
+
+&oldi0_port1 {
+	oldi0_out: endpoint {
+		remote-endpoint = <&panel_lvds_native_in>;
+	};
+};
-- 
2.54.0

