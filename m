Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E483976B8
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 18:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788977678; cv=none; b=g4RaQdmIg+Xl9tHwPWDKHs1g0hBIhJjyNkHS7HjZvQ9tZ3k/CbgiQmGkuHtVnfiKxgmKCb81Bq4oMp17frjiEBL9cVUZRviX3SbheujDTijKWKzUGc+TJG+tXKBmUYG5RuhvlCejwkmRCihlHKZRrQ1NyJwYk24S8tsM114UU1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788977678; c=relaxed/simple;
	bh=fjag8XIUmwjppadXqwfJ6ZDWGEnY4H5nf0oJuiI0lVo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D18T1yHqxO027tWYDyMxymlPY5rcucT8xb+/orFjWRSeFXsveY33C9VZDWi4LGTnRV5M+vD1fMEmI5GxHi4IkRx4cgpDoqMEGzgv3MjARpUvVDBywrD4ufZp5gNJFxEeWO0zdxyi7lcM5DpWbsNkx5YW9kZWPBTG6WeEadUjuKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HTrGZZZu; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HTrGZZZu"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d560775ca2so44512385ad.1
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 11:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788977676; x=1789582476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pwhnjkKX5SffmqWRw89HSGPh7x+52vp6lBn4P2+YAcc=;
        b=HTrGZZZuTelIjegkzf3iDO8IhpG4BN2tCcdgYGuzNevEvROJuzwHpN8T9g1K0wKbca
         c2sroGJwwbYMMFfvrSAmyl9IoItRGsVx64074gfuK5qb2jcpn82ROsOb9aP/1KMtwgL2
         q0cxH08tybowQP35VAm3Zm7QQp17QFBVy588n7OSUM5Ry4CHoLXXQLr7Yr/2l8g4TMqS
         z0mwGHDKxPrZCK00XPxzELsVJUFuyh0rwPncR0WAt0UNA0QN6SXuV9r0lF3lPHimPLay
         9yBLRfTMK0e5JhWGCjm8oNgfPDUrvSiJQ8RYUTkTzb/AwQK2cpJC51UXk/zO8KMnyaE+
         n9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788977676; x=1789582476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pwhnjkKX5SffmqWRw89HSGPh7x+52vp6lBn4P2+YAcc=;
        b=qoYNfiVNNKJYpKRFHuRbG0v04Ku8mTXyjwRVgP0eiur3LS282sLse4PdE6RchaEx34
         0IyYgTCIlL86zpRwtMaXAt8pDCWJ5X0CLBWLp2O1iqUDd+i1CU61ckcAeHeHZqFjQyN4
         SMJLvYQBMksO/37Z1R8xi7itaLVgDGZalaEyurvwlHjmFBBJDkHpy8umPa+eoZzmXhC4
         OA9ORgdI3ap0kQFv2RcuaqSdrJOUyy7QjEhOmft58Gt1outrrQEmqiXUphALJOEgNYMF
         QlrJgywhWVBAriEr+HlVxrrB5HCd9ghVbXBG0JWiJEmR/OW40P5l0wujUdEEkJr3PfQp
         QjlQ==
X-Forwarded-Encrypted: i=1; AKwUvByXGLMogNEFjXkapf62VP3hPD0cuaFuzr/0w27l1WtEx7MSxZAixZmDCc2ZBIlRAsxYwY4N299HeMv3@vger.kernel.org
X-Gm-Message-State: AFuF++muj9SmbEJtVVialcnRUUatSaXItRfVh9juo5PAvyGmxuWGhV7p
	M7MvPWkOJZ0Z4zUxrRPiSkFL8Ef1ZEkw+lK8Z0H8DyAdgD/rLpoR/uQt
X-Gm-Gg: AYBFou3uX+JrE755WTgH++g+x8udAWMYq50u+kyIzCW0ViDrQp76onIdKX+alD+O3gG
	NPBnDBPi9QldVCkoNTfKkybk+eFKEj6zu+HLprg6e8M6155Lko15M1RNGJGB47kNsPNQ3b0PTYd
	TUj/8VHp7bQ/pBNqMYALEIOfQeoRjS9IaGFKf7U4zrZWc17Ywpm8ikAes8m+Sl2HhoEyjLKf9FX
	JL+z+gkOJy+rjQkjDi6OanfYGEn4fMSaFbrsUU//plz+UbahZOjBXRZnXh3vbdeADI9LuY7UQ2K
	Vh4dqIsVDIa4S2KMRyl4zHAlEZ6U8es0jIouVuX9vwvrQnEjTffm9/BkAfg/XFUcLcu8nPp7jRR
	QFKvliJNOu4KcOM4+uZhWHOPtRzdZYaGJGGm4nRf7GwXxbyxEDWWuqdP5Fscsx0psFq/ABWMma+
	ltGX8Cwss0apE6XdWkE9eXq3i9KdJ0RWmy3PbRPHi66HxGIVP3kdpwDFrhYNnQF2qql5tApmkem
	mm8eL+F0uNHJPgO
X-Received: by 2002:a17:903:2f86:b0:2db:210f:c104 with SMTP id d9443c01a7336-2db210fc254mr424562675ad.10.1788977676106;
        Wed, 09 Sep 2026 11:14:36 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1495b57fsm77694195ad.24.2026.09.09.11.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 11:14:35 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: u-kumar1@ti.com,
	nm@ti.com,
	vigneshr@ti.com,
	kristo@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: leonardo.costa@toradex.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: ti: k3-am69-aquila: Add Toradex DSI to LVDS adapter with the 10.1" V2 display
Date: Wed,  9 Sep 2026 15:12:09 -0300
Message-ID: <20260909181332.1081552-1-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Changes in v2:
- Add comment explaining the panel timings difference between this
  overlay and the ones for the native LVDS interface (without the DSI to
  LVDS bridge).
- Add information in the hardware pin comments about which signals in
  the DSI to LVDS bridge each pin connects to.
- Add comment explaining why the rising edge is used on the TOUCH_INT#
  signal.
- Link to v1: https://lore.kernel.org/all/20260803173705.2268792-1-leoreis.costa@gmail.com/T/#
---
 arch/arm64/boot/dts/ti/Makefile               |   5 +
 ...dsi-to-lvds-v2-panel-cap-touch-10inch.dtso | 161 ++++++++++++++++++
 2 files changed, 166 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 795978e962ee..536a34e132ed 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -225,6 +225,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dsi-to-lvds-v2-panel-cap-touch-10inch.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-panel-cap-touch-7inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-sk.dtb
@@ -389,6 +390,9 @@ k3-am69-aquila-dev-csi-ov5640-dtbs := \
 k3-am69-aquila-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
 	k3-am69-aquila-dev.dtb \
 	k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtbo
+k3-am69-aquila-dev-dsi-to-lvds-v2-panel-cap-touch-10inch-dtbs := \
+	k3-am69-aquila-dev.dtb \
+	k3-am69-aquila-dsi-to-lvds-v2-panel-cap-touch-10inch.dtbo
 k3-am69-sk-csi2-dual-imx219-dtbs := k3-am69-sk.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
 k3-am69-sk-pcie0-ep-dtbs := k3-am69-sk.dtb \
@@ -491,6 +495,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am69-aquila-dev-csi-ov5640-24mhz.dtb \
 	k3-am69-aquila-dev-csi-ov5640.dtb \
 	k3-am69-aquila-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb \
+	k3-am69-aquila-dev-dsi-to-lvds-v2-panel-cap-touch-10inch.dtb \
 	k3-am69-sk-csi2-dual-imx219.dtb \
 	k3-am69-sk-pcie0-ep.dtb \
 	k3-j7200-evm-pcie1-ep.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso b/arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso
new file mode 100644
index 000000000000..92e270611f05
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso
@@ -0,0 +1,161 @@
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
+		/* Aquila GPIO_19_DSI_1 (AQUILA B44) - DSI_1_BKL_EN_LVDS */
+		enable-gpios = <&main_gpio0 13 GPIO_ACTIVE_HIGH>;
+		/* Aquila PWM_3_DSI (AQUILA B46) - PWM_3_DSI_LVDS */
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
+		/*
+		 * The timings here are different from the nominal ones for the
+		 * SCX1001511GGC49 display. The clock-frequency, along with the
+		 * other timings, are adjusted from experimentation to work
+		 * consistently with the DSI to LVDS bridge (TI SN65DSI84)
+		 * across Toradex modules that use it.
+		 */
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
+		/* Aquila GPIO_20_DSI_1 (AQUILA B45) - LVDS_EN */
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
+		/* Aquila GPIO_17_DSI_1 (AQUILA B42) - TOUCH_INT# */
+		/* Rising edge avoids spurious interrupts from the noisy falling edge. */
+		interrupt-parent = <&main_gpio0>;
+		interrupts = <12 IRQ_TYPE_EDGE_RISING>;
+		/* Aquila GPIO_18_DSI_1 (AQUILA B43) - TOUCH_RESET# */
+		reset-gpios = <&main_gpio0 31 GPIO_ACTIVE_LOW>;
+	};
+};
