Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA6547F2DD
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 13:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786628104; cv=none; b=MldrIIcheQaGls8w9rcw70+ahH4ZIyHebGmEi4wt1Ml6jsMjP2nOesD6vnmOiY3Tjf4VwNyOhZu5MP/CH8Lw6zRU3pnHn6sC3UQxJtSa3yhCUZlST5RkNLVvvI6w3DiFPM4cxXXOYlcWYsYTTSNtUWVWQdo5wu59BlY/io+pxx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786628104; c=relaxed/simple;
	bh=zZoKzN8tl/pLMaQsHBiSwOGEOXk0cIHPZ4G0xdfxhGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BcabYdMEV1+o1MYpfb8S6rzKexSw4yzvpRfEVNGsb/ZotxITaLslIBPW7GKibxpUx2ENgezUT64VwLFzibA8YEaFjdwqTiBntYIyHZsjtFefu+0x5opOLgMTFSNftTPO4Aqid4piz5ytXvnC8FuavjQG34mYCn7jLOEIlxnnUpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y7dfFDUh; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y7dfFDUh"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cbedda4c154so1358164a12.1
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 06:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786628102; x=1787232902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TpCX0meP81IgLMRKrMih3dFzB8TrFYkEOwnV4YJCCJ4=;
        b=Y7dfFDUh3C2cIZIHoJIOWAkVEItwCN93RYtMSP2lLCtiAxRqKOWOK3yEHLtOz6P3je
         9TKcERyE8ITZN26D1py9oQvhQ12dLKqX1AuFhrnblvCJ7vMsqS/+LzfQzYZgFsIDhOud
         gWGEaRWIQ8LJGyyzLPqKpbaXs+DyPySmYH0pgtAh9dFbot3VTLDC1VuPJrfPcPTMBffK
         z7aK5mwk8fHduyeF5JrQ/vQvz8g0uAT3x2t7i/jLIOQlLtSP9k4nm+qMuuD3fo8HACwB
         HJouPI5eMsngvcpj9D297f9rBX5VaJqKfSZsJ/ijK694T8rgXJ+SbeFcPmhAkzvZQlWg
         6kcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786628102; x=1787232902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TpCX0meP81IgLMRKrMih3dFzB8TrFYkEOwnV4YJCCJ4=;
        b=lI0v4Ye50dnVEfnGbTIK9Y2kOpmVRUVd+W1L/waejitVcbU6ReDMj7DDTdOnCw5INW
         5pQy2ccvqxXvhaCr/IvRuTYxTy6Bl17Nx4UMAi2pIpKjCg7vz/DxCtCvRyr0QX+00i5r
         Ee1Ixhyi1CW7KjKhskrDmNs3yollEEtsrfRuswD/+8t9fcdpyFvZFtjV4SPEOWEaaEur
         qSvRdR1SEDr0uNTTlKpxZc7vIvYVKQY2zT+DYGUY+ziJx/IBezOd7xazPaxHBYHBDeNG
         pm2+y8oaeNQyfloVQnUtvWJgVXoqPds9F+Rxi8v57S7LkccgMdLQ3AHAuaQX5/Axmkjn
         byIw==
X-Forwarded-Encrypted: i=1; AHgh+RrMIqOl6P3EVL5vkLVtFvQYCcwhL6k3XAgnz34syHBGs5z0dE35LevPqjEzH/wAWI61QC+QlhZGd7Jw@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt5zYXI+FaACkuHNKDNn6L47lGdfVDa300FC/52IIMF9ssbcE5
	F6XvkrwApZ9baw8fBb12ljQm7tk2D8OQZkkE1QY6dxEPCIuJDHVTaUkKykyuo1ZyOM0=
X-Gm-Gg: AR+sD13J7aiVGbepDbExKvGNKkMyYJSGl4+NCSlnpcaEM4+Ab9kC9J3EidJFq6iNDLA
	udKA1F4MJ9tQF/UIL575arKfpNOfo7HFIZbCfr3+54zizdgg0CVcCz2XVIZTGfcGi0g/plaR7NZ
	ehg6bR/c3X0OQ5O7eprlLYNGBBoDxC3y6hpJqCxDN5WCX0v7Su28+0OjASmKYKhZo1GG0s8eeSm
	55DDgMwT/AWhyJOWFDRlBaKITNpABZKlAHUaI8zcoEI89E2tf/NMuDXExt0Ao+uooiTgVHVpaLy
	g9B7G5WM9QJ46vh6BldoexXNPF+vRmsmtjynfPB8g4aRr1OLJsuB+n0eblHLtl4bP0FHFsa/ygb
	5igxjjNMlG8KW24c6tJLVbXPgi/KkvKR3iIVWxWE36NOJfrNdZTbFXHug5D2749Hx0HK8y0cs/E
	ipyhREcQmK/qd6m3/zTl/W1i9Qh4RcY950JlLTsNyVqXv54IhiuMH5Ji985zVLjb1D6J4=
X-Received: by 2002:a05:6a20:2d26:b0:3c4:3672:ba6 with SMTP id adf61e73a8af0-3cc5539719bmr7639940637.22.1786628101706;
        Thu, 13 Aug 2026 06:35:01 -0700 (PDT)
Received: from leonardoc-nb ([179.160.38.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebc75d891sm8447990eec.5.2026.08.13.06.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 06:35:00 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: [PATCH 5/6] arm64: dts: freescale: imx8mp-verdin: Add Toradex DSI to LVDS adapter with the 10.1" V2 display
Date: Thu, 13 Aug 2026 10:33:34 -0300
Message-ID: <20260813133335.1941580-6-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813133335.1941580-1-leoreis.costa@gmail.com>
References: <20260813133335.1941580-1-leoreis.costa@gmail.com>
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
Verdin DSI_1 interface. It is based on the Texas Instruments SN65DSI84
DSI-to-LVDS bridge and drives an Opto Logic SCX1001511GGC49 10.1" WXGA TFT
LCD LVDS panel. Touch input is provided by an ILITEK ILI251x capacitive
touch controller.

Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-adapter
Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |   5 +
 ...dsi-to-lvds-v2-panel-cap-touch-10inch.dtso | 129 ++++++++++++++++++
 2 files changed, 134 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 2bfed5ac66ac..236bfb6a1e19 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -510,6 +510,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw75xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw82xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-ivy.dtb
@@ -521,6 +522,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-panel-cap-touch-10inch-lvds-v2.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-lvds-v2-panel-cap-touch-10inch.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
@@ -532,6 +534,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-zinnia.dtb
 imx8mp-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
 	imx8mp-verdin-wifi-dev.dtb \
 	imx8mp-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
+imx8mp-verdin-wifi-dev-dsi-to-lvds-v2-panel-cap-touch-10inch-dtbs := \
+	imx8mp-verdin-wifi-dev.dtb \
+	imx8mp-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtbo
 imx8mp-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds-dtbs := \
 	imx8mp-verdin-wifi-dev.dtb \
 	imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso
new file mode 100644
index 000000000000..32828e9bc534
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex DSI to LVDS Adapter on Verdin DSI_1 with Capacitive Touch Display
+ * 10.1" V2, used on Dahlia (X17) and Development Board (X48) that expose DSI_1
+ * via a Samtec LSS-130 connector.
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
+	panel-lvds-bridge {
+		compatible = "optologic,scx1001511ggc49", "panel-lvds";
+		backlight = <&backlight>;
+		data-mapping = "vesa-24";
+		power-supply = <&reg_dsi_lvds>;
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
+
+	reg_dsi_lvds: regulator-dsi-lvds {
+		compatible = "regulator-fixed";
+		/* Verdin CTRL_SLEEP_MOCI# (SODIMM 256) */
+		gpios = <&gpio4 29 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+		regulator-name = "DSI_1_PWR_EN";
+	};
+};
+
+&backlight {
+	/* Verdin PWM_3_DSI (SODIMM 19) - PWM_3_DSI_LVDS */
+	pwms = <&pwm3 0 6666667 0>;
+
+	status = "okay";
+};
+
+&i2c4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili251x";
+		reg = <0x41>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_9_dsi>,
+			    <&pinctrl_i2s_2_bclk_touch_reset>;
+		/* Verdin GPIO_9_DSI (SODIMM 17) - TOUCH_INT# */
+		/* Rising edge avoids spurious interrupts from the noisy falling edge. */
+		interrupt-parent = <&gpio4>;
+		interrupts = <25 IRQ_TYPE_EDGE_RISING>;
+		/* Verdin I2S_2_BCLK (SODIMM 42) - TOUCH_RESET# */
+		reset-gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&lcdif1 {
+	status = "okay";
+};
+
+&lvds_ti_sn65dsi84 {
+	vcc-supply = <&reg_dsi_lvds>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			dsi_lvds_bridge_in: endpoint {
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&mipi_dsi_out>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+
+			dsi_lvds_bridge_out: endpoint {
+				remote-endpoint = <&panel_lvds_bridge_in>;
+			};
+		};
+	};
+};
+
+&mipi_dsi {
+	samsung,esc-clock-frequency = <16000000>;
+
+	status = "okay";
+};
+
+&mipi_dsi_out {
+	remote-endpoint = <&dsi_lvds_bridge_in>;
+};
