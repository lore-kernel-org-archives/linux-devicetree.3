Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F269427F84
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 17:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785778673; cv=none; b=ZrF/5+nphQXoWN4lF56qEkGMKyVcum6PNOk/wn0vLjqV+Q6db9YStaXJPlFVYjhMD/9HdU4pCrF7LHo6kUAcrwXoUyTvxMvzWOsN2EFUk5JiGe2Jod6L6cNTka6TraORzc0nZrMQxSWmv+j+0PAlwPs0W0xalqQKJCCGGsgYklo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785778673; c=relaxed/simple;
	bh=daEJTOa812yXG7IHRVw5IFyb9/7iw6DSu9/oUwjnaWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=orqQl+I1A3mzioY4BE1T/jdK5bRHIN0qCLv8uUhhWW/iW110234mp+RVG0X9k2y7n2VbiwN22ZvjYDl4lLlcyilo7kS7Jhsd46rEIvsFgpmtmCTlDvgrl1IZRSLfOGqIWrZGl5Ocxwq2p+atf49VawssUww22F8j7mFtEnBdQyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WTyGQzQF; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WTyGQzQF"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-848479c9bd5so3085769b3a.3
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 10:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785778671; x=1786383471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y/qLJ1/y71ijAg3Bk0GazyA79RdGxTRnQsyRhckXMf8=;
        b=WTyGQzQFrVJLYOjT0Nn8mVHE6kA3l1uUsvr7NEGF53fguhoC3pLkJu2Ylxu/Axa4B2
         A7XpDqCqKvnYViU632voNeXz02PAXrDwAXZT5GYgbKoQArm00JcDyQc8tJkMj4ain+gF
         nK4PVQ/C93TuYgmdtwrR/UqcqIwuIe7m+8uBE0AVJTA1ghaL+9rLSuac06MwzArsiaRy
         3O+MMwCat6oC/Ou/cCbXAhyPA396/d5cvwTBRKbeSp0p4I2g07rCg8O19qfWOGX0F1hG
         K8OSVjJuMgGpBpAw72Gp+d45kBi297WTG7nhA+c15vQVXkbiGvwbxkS/hha+XpDDT2/h
         mqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785778671; x=1786383471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y/qLJ1/y71ijAg3Bk0GazyA79RdGxTRnQsyRhckXMf8=;
        b=By8S3ZGUEeA0iA0ZvrrCryh/zWSd2oqhdKhL1s6amev+TenrM95VoUcmBMaS3NjezL
         wk31uadZTBF6OIBErHm/z76b9VAEgsmXP+mwyPBb4QR1KUdvRlG0vJVO5+ejeYEJk4sY
         VdKk7NN0p4+9z+hFbzRrriXixmY6YJTCOxALsf+DQ52JKVpBRf5/CE2hmb0RL+Wy4lWR
         UCD/dnDeVgCa0tw761UPgUFcwXoLmj+w4M+qhfzMZhxK9JxbrdNG3EhmMq9memBxWVHU
         /OfU5cKWvvKgbQpOFitKaEimVNl+qv+colXAuZ072dGCDH8OOnr1UfHiKv+iIHbnIzIO
         5l5A==
X-Forwarded-Encrypted: i=1; AHgh+RpUcH11hE06rICpy/prtVziJCSqnyboL3eA08z5KxiXI+5fFcL/SgAhxIp2BvD0gpG/TliYo0j3owdn@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr3Zc3Yhjxa0RTdp8phZmgXXgojlr7VxjhPF0LjXfnDJWyd8Kw
	96odNPx3/9OSa8bQ9wVQ2Ub7V/zoYFpXdXQVBOM+SjwI9/mX16rRyjzo
X-Gm-Gg: AR+sD10+OUdl8CEW6kLJBmGCtv7FHzK6BowBtR+WVaeKN3NKIWzkLFJh+T5TKF2vYG/
	TXuWDtQqbe3DydPAFvF8hLq0DJr8kdn0U4B1cE/ZgsH3Nwu1kqjQnmRQ4ijRITMkOprIgFx8v5M
	nA6t8bmMGLT3OpkiLQ3DtW7sKJxqUtycDQHBerbuWx4wu3cXc8vm5VLLYsVwQf/q1+FbHzii3Nq
	bVzA2LueUMxQI2sPmrCiHZaEhIMO7x/mhvswxAYMh6BqrRXh/kGLKEwG0wZTtQ373vgYd1k+KAM
	4bZ3XnqgIQoInF01Tm16mpgdFVT3wIK7vTwNvy6yLSnG1MzXt/2whyTU5uYZDQ5NDZ7ooYKPCr3
	+ZtZhzhNQZKLfeBHdrorB5QIw1t0G3uTtkZWbJvmScCPAq+PLOWu2DRugkl8FRJIrsPRD+VCgq3
	qDo6XyuwBK6lzvVTfsFiiMCxoUWn8EubZLWQA5yJ+xIC+G2mwCglTFykc7eH3uqGYUDu8=
X-Received: by 2002:a05:6a20:d80c:b0:3c3:c4cd:6b66 with SMTP id adf61e73a8af0-3c92a8f5e97mr10841598637.63.1785778670972;
        Mon, 03 Aug 2026 10:37:50 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e18e114sm65612331eec.28.2026.08.03.10.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 10:37:50 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: nm@ti.com,
	vigneshr@ti.com,
	kristo@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: [PATCH 1/1] arm64: dts: ti: k3-am69-aquila: Add Toradex DSI to LVDS adapter with the 10.1" V2 display
Date: Mon,  3 Aug 2026 14:34:29 -0300
Message-ID: <20260803173705.2268792-2-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803173705.2268792-1-leoreis.costa@gmail.com>
References: <20260803173705.2268792-1-leoreis.costa@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay for the Toradex DSI to LVDS Adapter with the
Toradex Capacitive Touch Display 10.1" LVDS V2. The adapter connects to the
Aquila DSI_1 interface. It is based on the Texas Instruments SN65DSI84
DSI-to-LVDS bridge and drives an Opto Logic SCX1001511GGC49 10.1" WXGA TFT
LCD LVDS panel. Touch input is provided by an ILITEK ILI251x capacitive
touch controller.

Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-adapter
Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   5 +
 ...dsi-to-lvds-v2-panel-cap-touch-10inch.dtso | 153 ++++++++++++++++++
 2 files changed, 158 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index f4d109ef6798a..8a59fc597aede 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -218,6 +218,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dsi-to-lvds-v2-panel-cap-touch-10inch.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-panel-cap-touch-7inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-sk.dtb
@@ -374,6 +375,9 @@ k3-am69-aquila-dev-csi-ov5640-dtbs := \
 k3-am69-aquila-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
 	k3-am69-aquila-dev.dtb \
 	k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtbo
+k3-am69-aquila-dev-dsi-to-lvds-v2-panel-cap-touch-10inch-dtbs := \
+	k3-am69-aquila-dev.dtb \
+	k3-am69-aquila-dsi-to-lvds-v2-panel-cap-touch-10inch.dtbo
 k3-am69-sk-csi2-dual-imx219-dtbs := k3-am69-sk.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
 k3-am69-sk-pcie0-ep-dtbs := k3-am69-sk.dtb \
@@ -471,6 +475,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am69-aquila-dev-csi-ov5640-24mhz.dtb \
 	k3-am69-aquila-dev-csi-ov5640.dtb \
 	k3-am69-aquila-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb \
+	k3-am69-aquila-dev-dsi-to-lvds-v2-panel-cap-touch-10inch.dtb \
 	k3-am69-sk-csi2-dual-imx219.dtb \
 	k3-am69-sk-pcie0-ep.dtb \
 	k3-j7200-evm-pcie1-ep.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso b/arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso
new file mode 100644
index 0000000000000..834f23e75cbc3
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex DSI to LVDS Adapter on Aquila DSI_1 with Capacitive Touch Display
+ * 10.1" V2 Used on Development Board (J44). DSI_1 is exposed via a Samtec
+ * LSS-130 connector.
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
+		pwms = <&main_ehrpwm5 0 6666667 0>;
+	};
+
+	panel-lvds-bridge {
+		compatible = "optologic,scx1001511ggc49", "panel-lvds";
+		backlight = <&backlight_pwm3>;
+		data-mapping = "vesa-24";
+		height-mm = <136>;
+		width-mm = <217>;
+
+		panel-timing {
+			clock-frequency = <70000000>;
+			hactive = <1280>;
+			hback-porch = <55>;
+			hfront-porch = <55>;
+			hsync-len = <45>;
+			vactive = <800>;
+			vback-porch = <5>;
+			vfront-porch = <5>;
+			vsync-len = <3>;
+			de-active = <1>;
+			hsync-active = <0>;
+			vsync-active = <0>;
+			pixelclk-active = <0>;
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
+	touchscreen@41 {
+		compatible = "ilitek,ili251x";
+		reg = <0x41>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_17_dsi_1>, <&pinctrl_gpio_18_dsi_1>;
+		/* Aquila GPIO_17_DSI_1 (AQUILA B42) */
+		interrupt-parent = <&main_gpio0>;
+		interrupts = <12 IRQ_TYPE_EDGE_RISING>;
+		/* Aquila GPIO_18_DSI_1 (AQUILA B43) */
+		reset-gpios = <&main_gpio0 31 GPIO_ACTIVE_LOW>;
+	};
+};
