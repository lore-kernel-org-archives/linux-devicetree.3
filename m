Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789B7421A1C
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 16:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779466305; cv=none; b=KcnHlxp4Yg/DOZCf+JfE5+wKt7Od76LOzvh4BDqm1NI21PL83cIOuWkVp7vam+k7Sj8GgGtdZ9CLMPsBba6AlPKZoiY17J8vurWtKS5XY8qeDdqZalNdUDwrop6UBObCWnb2k3Eg7XE48OcHtkaA9teqLPevcBFwceTRtIXXV9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779466305; c=relaxed/simple;
	bh=FIvPmg7KiObO6Zwe6se+RdfO8rNbDvealG79mKHG+g8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J4jVFZxBfS2DMHXVcsGW8IaJl23tiNm6+dFXQgksbQ4/y9BFu5DY/vi8z0HFYA1BqYdjkgPGHa7OEH4FpTnr/vjZQj19diPajvOUZBWDsCuLECcZgcf9bxi7tlXX60QtKZOeS4lOjiyCBznjdslto1Q3g4/Q4jKeYOM8xRfki54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CF1ndKGK; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CF1ndKGK"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso62932125e9.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779466302; x=1780071102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=faRA57l3q9/4JTm73KCHTJQQxgO9NSEH0WnYiOq9hx0=;
        b=CF1ndKGKNb1BjnTuGFe9VFiesEI3OcBOyRrH1e4GJjIRwrlbSX07lHKZEtbMk50Nt9
         2uXMYmfwzoPvOqmgLgG8DQRUSapda8NIvJU5OiDcw1np5ocUsWCNtGZDYl+e8iCTcjF9
         0ZcDbcB9ZDerFoT9gShcnVR2rZG5tX5E/BmEmgj79nB5Ni4axN9/BvJOtxwxc9W8J6kQ
         C6x5SkpumIMDzumn90OEC6GiLFawUsTJ+25Mo84WO8Ngeb/nM4tjQ2XmFRrfbGbJIXLh
         JuxxXm6Vs085bAfBnNz+wBhZ1EnVggN2SNNNnhx6TRqgApQ3VVP6DFtpWHQoxwl0EJyL
         ZQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779466302; x=1780071102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=faRA57l3q9/4JTm73KCHTJQQxgO9NSEH0WnYiOq9hx0=;
        b=lZ4/EV6Li10W1s0oGE6YoEj5aEYGWgRs5NR4I8ZybmLWdDTIf+Nkzjo/P8a1FAyJvb
         0zmKwL6/2j6/49P3C7BlcsoB1YJjAn/gPJ8qj40OwPzir9kOnploTkzynzZYbtjNWi1c
         EdOi+dngkglOVSgacA4lzJXf8x05kPhqNYVqX5crchNUN5b7OgLp1SdNDnFeJ2uEH7NE
         mF/M/29Mzm7TJtrna4EK96d+kRzRBMGFraiHu+CnS6wU52nzPxMDWvHQrPV26P4qlDYW
         IvYggGt9dPPG8HvPIRy+UcRUqM/GA4D07T6drpYr68sAayEwKvRxeMGiYGn1Pc1VHI2m
         ZVTA==
X-Forwarded-Encrypted: i=1; AFNElJ/M71hxT68TkWfx8UWZQX6aBEm9FRTRpORmpQMO1tO4LM9WZkD+jzqKiBus6AF6qTWQa2aBOgVfIjub@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9bW/HK5rS1qs1RljxEkq7Mi/Vg7MIy3/aOArvtF/rf9RjFYxv
	zyD6Loye6n+spX5Mr3AKnA7H81bKoCa0W+HZZJ3eVYyF/8GQGKC9R62F
X-Gm-Gg: Acq92OGhuTcb7s4BOEPhu5aTMIo5k6wDex9PGGqGOmAKGh1bZidqS/Ak7IQ2d7/8ZkX
	VkxTE9a25ug2ebYMHcUvPy7Jqf1KXZP9feElbitjGV8SqODJBxd59WkGPxrPhQGbq5RT0cDYKUQ
	dHZiQoXogU5lK+UHGkjWf99/CBK/BAN/SeMOKjlXrEc1qLG87JITJTr08UY+RzFSrxzaVhOSUay
	tNSjH0UhwgsQBqumiIaTT0luvApOu/G91YtyDruDg+RU3Id/RWXndRb4C0ZzBLbcaglM2xyUekl
	HCJfktPnKehdolp0K40DkOl5lA1Z8yy1PcNE3dp1y1ic3MCNUIR39xF9Ygxjzs4Vl78CDqia56e
	7lLp9ITpiPcLiOuhRBsm1CEdLSoEfVn+M2IsktDbKCLoEw9f5nUb0PnbY4frJ9q8cSupQw6NigI
	Wy3lWkjDZA/lWdIO3OF42iJO4vnA+8LRs2kytVE6Aa8g==
X-Received: by 2002:a05:600d:844a:10b0:490:4b89:535d with SMTP id 5b1f17b1804b1-4904b8955f6mr12256945e9.1.1779466301527;
        Fri, 22 May 2026 09:11:41 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b9asm51042755e9.11.2026.05.22.09.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 09:11:41 -0700 (PDT)
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
Subject: [PATCH v3 01/11] arm64: dts: ti: k3-am62-verdin: Add Toradex DSI to LVDS adapter with 10.1" display
Date: Fri, 22 May 2026 17:11:05 +0100
Message-ID: <20260522161105.277519-14-ivitro@gmail.com>
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

Add a device tree overlay for the Toradex DSI to LVDS Adapter with the
Toradex Capacitive Touch Display 10.1" LVDS. The adapter connects to the
Verdin DSI_1 interface. It is based on the Texas Instruments SN65DSI84
DSI-to-LVDS bridge and drives a LogicTechno LT170410-2WHC 10.1" WXGA LVDS
panel. Touch input is provided by an Atmel MaxTouch capacitive touch
controller.

Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-adapter
Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
Changes in v3:
- Add missing regulator-name property on fixed regulators
- Simplify regulator labels
- Rename touch@ nodes to touchscreen@

Changes in v2:
- Use panel-simple compatible form

 arch/arm64/boot/dts/ti/Makefile               |   5 +
 ...in-dsi-to-lvds-panel-cap-touch-10inch.dtso | 124 ++++++++++++++++++
 2 files changed, 129 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 21db60cd19de..b2408f62c139 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -24,6 +24,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-phyboard-lyra-rdk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-tqma62xx-mba62xx.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dsi-to-hdmi.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-dev-dsi-to-hdmi.dtb
@@ -209,6 +210,9 @@ k3-am625-sk-csi2-ov5640-dtbs := k3-am625-sk.dtb \
 k3-am625-sk-csi2-tevi-ov5640-dtbs := k3-am625-sk.dtb \
 	k3-am62x-sk-csi2-tevi-ov5640.dtbo
 k3-am625-sk-hdmi-audio-dtbs := k3-am625-sk.dtb k3-am62x-sk-hdmi-audio.dtbo
+k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
+	k3-am625-verdin-wifi-dev.dtb \
+	k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 k3-am62-lp-sk-hdmi-audio-dtbs := k3-am62-lp-sk.dtb k3-am62x-sk-hdmi-audio.dtbo
 k3-am62-lp-sk-nand-dtbs := k3-am62-lp-sk.dtb k3-am62-lp-sk-nand.dtbo
 k3-am62a7-phyboard-lyra-disable-eth-phy-dtbs := k3-am62a7-phyboard-lyra-rdk.dtb \
@@ -310,6 +314,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-sk-csi2-ov5640.dtb \
 	k3-am625-sk-csi2-tevi-ov5640.dtb \
 	k3-am625-sk-hdmi-audio.dtb \
+	k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb \
 	k3-am62-lp-sk-hdmi-audio.dtb \
 	k3-am62-lp-sk-nand.dtb \
 	k3-am62a7-phyboard-lyra-disable-eth-phy.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso
new file mode 100644
index 000000000000..deb74ecc5eb4
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex DSI to LVDS Adapter on Verdin DSI_1 with Capacitive Touch Display 10.1"
+ * Used on Dahlia (X17) and Development Board (X48) that expose DSI_1 via an
+ * Samtec LSS-130 connector.
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
+		pinctrl-0 = <&pinctrl_i2s_2_d_out_gpio>;
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		/* Verdin I2S_2_D_OUT as GPIO (SODIMM 46) */
+		enable-gpios = <&main_gpio0 34 GPIO_ACTIVE_HIGH>;
+		power-supply = <&reg_3v3>;
+		/* Verdin PWM_3_DSI (SODIMM 19) */
+		pwms = <&epwm1 0 6666667 PWM_POLARITY_INVERTED>;
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
+/* Verdin I2C_1 */
+&main_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	bridge@2c {
+		compatible = "ti,sn65dsi84";
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
+	touchscreen@4a {
+		compatible = "atmel,maxtouch";
+		reg = <0x4a>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_dsi1_int>, <&pinctrl_i2s_2_bclk_gpio>;
+		/* Verdin GPIO_9_DSI (SODIMM 17) - TOUCH_INT# */
+		interrupt-parent = <&main_gpio1>;
+		interrupts = <49 IRQ_TYPE_EDGE_FALLING>;
+		/* Verdin I2S_2_BCLK (SODIMM 42) - TOUCH_RESET# */
+		reset-gpios = <&main_gpio0 35 GPIO_ACTIVE_LOW>;
+	};
+};
-- 
2.54.0

