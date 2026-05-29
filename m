Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7660F3BCD19
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 12:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780056575; cv=none; b=N4A0NdrM9LMu+Wv5Otpr2KgtZ/XxnoAtISPjp2M78xPlElT+aMKEnvHMTtgqqbkyRoaFkzqYONX227xWnjtcZTbXueFhWJkkkwU36mkTZlzorxH6JbqBUbqJcHhnddB73PoWuUG8ajkNdx4RfBw9JM+W2BeS9TzqRgg+8bSdSt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780056575; c=relaxed/simple;
	bh=kw9o8sJAbTWcx7ieWkvjMkBoJysGFzzlT+R6dRo9y4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QZTa3lR/zlA0hcLsm3YDaQJkTJWybvun/D6D2n/SZyY0ACcFX+sU5suMsbLy261DyCxe/t563djyZLyZ5tfc7CaWG0uUFq3p8AxvxxVbwAcfUY4E6IXqCTzzp6lCKXRdk+eYyD6dtmtbYCrDAOFDkkKgRNLxbwR4jAW30muAOeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sS+J4Zdz; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sS+J4Zdz"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso49024445e9.1
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 05:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780056572; x=1780661372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFvIY/GDecpuofqBDwkXXTy/louuoWZsklrxVH63APU=;
        b=sS+J4ZdzBkOOsDwe2W8kNaV4oQxpeQJ21kP+qs9uipPGqt+T6/hwCUcnrpm/zEpA9U
         oTaAMbw2cexFtyFdRs7aki+enrnLUj7hth/nJ7xexlF+YSUl7cEVW0Ger5TwJVfQGLSe
         KeZzvxMxJOOch9B1iqsqZlKb8cKvLTHS7h17rN8wF/g+34wQjGdv9RmlhQ5TFdnk5ZTq
         vBccyDEoVrHkaSSSTTPFOPD/EPKz9sI0CZGJsUp0wf2qiz7iENo9CdFNnEXwg7xap7Oz
         oIwojkta6wue/GUpvxCd7IKeoYyMOpQU6qkC6exZcIBRdhlTWarpziqI7p2bx3JNV6in
         VosQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780056572; x=1780661372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GFvIY/GDecpuofqBDwkXXTy/louuoWZsklrxVH63APU=;
        b=op4FyV+bSJTsN05C0T6yn4wTtbC7/kwoyVxtsgigj0ZZYpruv9lkhZgq+ouLGRgi39
         TPU55FxJ6P0MLDmpGDMPyde71VMr0uhDcq95F2xpgQSk/SdmG03uFx4gEWbOamRBg4eT
         V3K1ogWuaT/cvsJXGTTLNRxbhIWhMX5XA10dMzkoOKXLuwHV42KrgHN08INoh4InLZg/
         oitEfL+p0smAEKunKI9Hnvu1IlM4EwvlX/lpxZ9jREhmU4sYIKHlGbQtbKWwieZNENeE
         q1Xtmx0+R5AQBrCysoycDb9zhEZv3XnDIJUhDPJnyqLpTlRpkg1LhmFZRA3SDJJfug7+
         Ycqw==
X-Forwarded-Encrypted: i=1; AFNElJ8f9C7V0jb2MsmS9ygcWr4XLJ0RuEGBAVsEJwaN8HRSMId9cQFoRu3CeVYykAn3F2Yfiw60+eSqx+bm@vger.kernel.org
X-Gm-Message-State: AOJu0YwlD+2j2/DvTjWaP7hpu5aGZ83n+IVm3WLvff4ftHE/4vG0Ciz3
	xsgnm9EQLJCNmccao3l/6av94knWIdRuyehCE2NDk+3UeZmxJxZdMHvY
X-Gm-Gg: Acq92OE1KNJkZ5WLYl4FzEagP6pkV5ibIMT1ACKp+t/JnAEj4/2BpMOhA3Rocm/51e8
	phAObLBj8pPGNkd2UkUYoywrccIv+vo+HC+5ykZEagiu611ukrmINHWA7aEG52Oj2M+XHeZ3lS1
	uP6oBCrxHuFROHjHpPXfAvIPqKD8rLCWy99mjixTZBjTs80a/VXZDMqJtOWOkA4wqfJWdyOMolI
	RyikEWpxvDyNMsTmpUrMjfUgTu03BP6qZygQyujzm/5pkeqRbyHJswX9KuqmeuSttdn4w0yLiRd
	DIZKL7AsLpriHZ+uGbgucRNLyTAq2Pu295ZqksWwC2kSkbQiJ0FJV6f1E5m450F+ZIvTAtr+xqv
	bHHvpW80CBx+Gq8w4aHoIKdXt3NoDAx9suBCquLImxheNxKlXbWGHdp5nI8nCwdWJWC2NT8chr3
	Uynn1fSZxS0ttDbE2+jwg+cEa3
X-Received: by 2002:a05:600c:5697:b0:48f:d5e8:758c with SMTP id 5b1f17b1804b1-4909c0b3493mr34058095e9.16.1780056571739;
        Fri, 29 May 2026 05:09:31 -0700 (PDT)
Received: from vitor-nb ([89.214.125.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c0b8a11sm13586595e9.16.2026.05.29.05.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 05:09:31 -0700 (PDT)
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
Subject: [PATCH v1 6/7] arm64: dts: ti: k3-am69-aquila: Add Toradex Capacitive Touch Display 7" DSI
Date: Fri, 29 May 2026 13:08:58 +0100
Message-ID: <20260529120853.636015-15-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529120853.636015-9-ivitro@gmail.com>
References: <20260529120853.636015-9-ivitro@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

Add a device tree overlay for the Toradex Capacitive Touch Display 7"
DSI on the Aquila DSI_1 interface. Used on the Clover Board (J12), where
DSI_1 is exposed via a FFC/FPC connector.

The display includes an internal Texas Instruments SN65DSI83 DSI-to-LVDS
bridge driving a Riverdi RVT70HSLNWCA0 7" WSVGA IPS TFT LCD panel.
Touch input is provided by an Ilitek ILI2132 capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-dsi
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   5 +
 ...am69-aquila-panel-cap-touch-7inch-dsi.dtso | 149 ++++++++++++++++++
 2 files changed, 154 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-panel-cap-touch-7inch-dsi.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index f9163643291d..db205afeb7a0 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -186,6 +186,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-panel-cap-touch-10inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-panel-cap-touch-7inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-sk-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm.dtb
@@ -278,6 +279,9 @@ k3-am68-sk-base-board-csi2-dual-imx219-dtbs := k3-am68-sk-base-board.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
 k3-am68-sk-base-board-pcie1-ep-dtbs := k3-am68-sk-base-board.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtbo
+k3-am69-aquila-clover-panel-cap-touch-7inch-dsi-dtbs := \
+	k3-am69-aquila-clover.dtb \
+	k3-am69-aquila-panel-cap-touch-7inch-dsi.dtbo
 k3-am69-aquila-dev-adapter-panel-cap-touch-10inch-dsi-dtbs := \
 	k3-am69-aquila-dev.dtb \
 	k3-am69-aquila-adapter-panel-cap-touch-10inch-dsi.dtbo
@@ -361,6 +365,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am68-phyboard-izar-peb-av-15.dtb \
 	k3-am68-sk-base-board-csi2-dual-imx219.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtb \
+	k3-am69-aquila-clover-panel-cap-touch-7inch-dsi.dtb \
 	k3-am69-aquila-dev-adapter-panel-cap-touch-10inch-dsi.dtb \
 	k3-am69-aquila-dev-adapter-panel-cap-touch-7inch-dsi.dtb \
 	k3-am69-aquila-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-panel-cap-touch-7inch-dsi.dtso b/arch/arm64/boot/dts/ti/k3-am69-aquila-panel-cap-touch-7inch-dsi.dtso
new file mode 100644
index 000000000000..0333c7e62e29
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-panel-cap-touch-7inch-dsi.dtso
@@ -0,0 +1,149 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 7" on Aquila DSI_1.
+ * Used on Clover Board (J12), DSI_1 is exposed via a FFC/FPC connector.
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-dsi
+ * https://www.toradex.com/accessories/capacitive-touch-display-7-inch-dsi
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
+			hback-porch = <100 100 100>;
+			hfront-porch = <16 160 216>;
+			hsync-active = <0>;
+			hsync-len = <1 60 140>;
+			pixelclk-active = <1>;
+			vactive = <600>;
+			vback-porch = <13 13 13>;
+			vfront-porch = <1 12 127>;
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
+/* Aquila I2C_3_DSI1 */
+&main_i2c0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
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
+		interrupts = <12 IRQ_TYPE_EDGE_RISING>;
+		/* Aquila GPIO_18_DSI_1 (AQUILA B43) */
+		reset-gpios = <&main_gpio0 31 GPIO_ACTIVE_LOW>;
+	};
+};
-- 
2.54.0

