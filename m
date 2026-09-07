Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BD248C41C
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 11:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788781304; cv=none; b=fg0WY6vjosueJWx+ZF2AHkSFtu/V6d9x4kRv19GN2FNXOR4/4lvdaeWvg9GFKOFwEPnfWRId7rLQJRFeMaXy6xkkymiwjunrFQPgAvj6Jj07rcGvCKmfwzUgtqVHnBkXxIqKxh85s4xi/Ab9oEhFv9gcG/arO5O3wk2OQ9R0unY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788781304; c=relaxed/simple;
	bh=qSrnIjouD/TKi71DHXVe6sXMsvNaH+M7UQUCcAfmL1A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FCzjl//UsT2keONLGMJi9xz2AHxibgIFriXwKknJV/sF00NimUXzvwLRorKmfT3QKx5iRGswe0HcsydPz4BTHONSAsuSHuBUDSzIeQjPmNmzTRW0cs0+hdcaoLqzWxpRRgMmJDl8Q8T7fVWIfDj7UTpNFlp9x70OxsRkcBDpMaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gdgTXdnx; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gdgTXdnx"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4843efcbdb2so1820727f8f.2
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 04:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788781301; x=1789386101; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lGhU3g1EDTqUexinuXLvBxRKleBWMVdoNp6t/M9e0oQ=;
        b=gdgTXdnxjijCUleXKE/tEJmbstWmi1arqKBr6086KXVxj3MBx+3yMQ2S4ICd4d0rHr
         4ldVaFCHMAFAvWbOhaWRv+69DxJzOiirBt+D7zPyoWe/FjrKa3aq9/64GVuDUWpbdIZH
         dkf01euV7C3s4NheHMvmtzBKqJvaD4fNWJmHGXg0Au+0k/yTttrxTsIvEINIJpf5MrCn
         nC3az4gSSoM9ZNqFgLm8pV6fv/REpdI6UpoumyIyNhWuPAVHO3uvcpO/3IN/Hbyz5y+3
         6gymYSrSzKimiTxgUcohzIjwKLz90WuVOk9B7mYdZ9EQ4wi0ORfVndOvNsveHZ6LIB20
         zhRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781301; x=1789386101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lGhU3g1EDTqUexinuXLvBxRKleBWMVdoNp6t/M9e0oQ=;
        b=ncj9Q06Vis3nPgraHsmIZfR70k9ek9/BFw3P+1QcqOXhrjI+ORJiiVQROR/AqZ1uMT
         RhFhk+IJVLkvlQj9G3o9Hkva1nU8gyw2Y+o6H1NaIz0DRv+16mbSpgVgJPES8lc3JwMl
         PBy7BZTkRQ8FWKMy8Y1zaoDcWvqftc9bNl8TtOXdv/6sRNR2W2g0fYf7mKA+YC9KqQaX
         a2ZQ+COwOBJr/YqtkxTB7brzco+z0doe4xgaVeu8/2CIYd2dovhu6QiYP6sbmpefDfL5
         rrqeqHny/RHHNoh4Jf171ovLGwDEhhdNm92TqRJOrNkoLkQ7rcRxDj9eV4UOmbzw40pr
         fbuQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3gYNetl1ke3p75TKGNZ7ZR9geNd3q/vd6hyVleKjqGCu+FvzpbmWuW5yiZvnxsRXrhkKE8auyohro@vger.kernel.org
X-Gm-Message-State: AFuF++lcUJYZpZJl2iTRCCjTF8P5r/KdxmxOnlC1Zg5RSDhkTJvGQvib
	viBXo04SEX/VQtQ2b+ZpnueGrEESvPRel1rRjf9E4FmxBceiK2TJ8j8c
X-Gm-Gg: AYBFou2Gs9FxQqsMCDjibnrSmHbC4ZutjV+uoU2O4VfZZZlfalZQnLJBTX1OJdN15Pq
	D2bUOBxT9JuYk6Duu88bWh0aPxlAjwP4OxGV2QMvuQFLsddVO3oOpZNTB6TI/4vjRoeWVlJNRG3
	lM3r5S/G9UxG/UpbWqG2y2XtsxZEQxwxqLlf0aAyZOqo1xo2X+hKv4u7jrmJpQDPzhurLjm9BiO
	QJZZrmoehX0QMj4NcAuifeQB7e2/qg/z80onivGzO3sQMcWR51dnvr34DLcT6oNWw3LMCtK5Q9n
	8bb8D6QXBG3yhx2GovJW1Otej9ExTKxvjybFGtTdoHRJ8LxYSm3g3ohKuyccJW9pyNW03jqK70m
	pUyiAVwZwBU8k3wOBGoSKQRUZZOmVpAwj1zUAF/jlRxrvAEfrVr54Mc1ieIg7dQMSPHptOKaWlk
	UfOsDbZiZ1PTCSGqctT8C2oBl923w/rKB3cUAWE2rgmBgkK7nd3U9BJdfCOCc37eZnvsfsnX0az
	L1BztlYakyR3h1kSmhytTamte8sTbc0xi5GHzJJXnIaQ+tdTCR8mMqWOhZDz64=
X-Received: by 2002:a05:6000:25e1:b0:482:f270:65c5 with SMTP id ffacd0b85a97d-4858708dcdamr24060589f8f.9.1788781300517;
        Mon, 07 Sep 2026 04:41:40 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm26763182f8f.3.2026.09.07.04.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:41:40 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Mon, 07 Sep 2026 13:41:33 +0200
Subject: [PATCH 4/4] arm64: dts: freescale: imx8mp-verdin: Add Toradex
 Capacitive Touch Display 7" DSI
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-verdin-imx8mp-non-camera-overlays-ready-v1-4-ca0c63c2994f@toradex.com>
References: <20260907-verdin-imx8mp-non-camera-overlays-ready-v1-0-ca0c63c2994f@toradex.com>
In-Reply-To: <20260907-verdin-imx8mp-non-camera-overlays-ready-v1-0-ca0c63c2994f@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add a device tree overlay for the Toradex Capacitive Touch Display 7"
on the Verdin DSI_1 interface. The display features an internal Texas
Instruments SN65DSI83 DSI-to-LVDS bridge driving a Riverdi
RVT70HSLNWCA0 7" WSVGA IPS TFT LCD panel. The touch input is provided
by an Ilitek ILI2132 capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-dsi
Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-display-adapter
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   4 +
 .../imx8mp-verdin-panel-cap-touch-7inch-dsi.dtso   | 133 +++++++++++++++++++++
 2 files changed, 137 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 14ea662bdcfd..ca4fec7c1038 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -741,11 +741,13 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-panel-cap-touch-10inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-panel-cap-touch-7inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-nau8822-btl.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-panel-cap-touch-7inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
@@ -763,6 +765,8 @@ imx8mp-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := imx8mp-verdin-wifi-
 	imx8mp-verdin-panel-cap-touch-10inch-dsi.dtbo
 imx8mp-verdin-wifi-dev-dsi-to-hdmi-dtbs := imx8mp-verdin-wifi-dev.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
 imx8mp-verdin-wifi-dev-nau8822-btl-dtbs := imx8mp-verdin-wifi-dev.dtb imx8mp-verdin-dev-nau8822-btl.dtbo
+imx8mp-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := imx8mp-verdin-wifi-dev.dtb \
+	imx8mp-verdin-panel-cap-touch-7inch-dsi.dtbo
 imx8mp-verdin-wifi-yavia-dsi-to-hdmi-dtbs := imx8mp-verdin-wifi-yavia.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
 
 imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-7inch-dsi.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-7inch-dsi.dtso
new file mode 100644
index 000000000000..f1a82796a9c6
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-7inch-dsi.dtso
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
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
+
+&{/} {
+	panel-lvds-bridge {
+		compatible = "riverdi,rvt70hslnwca0", "panel-lvds";
+		backlight = <&backlight>;
+		data-mapping = "vesa-24";
+		height-mm = <86>;
+		width-mm = <154>;
+
+		/*
+		 * Use a combined horizontal sync and back porch of 160 pixels. Treating
+		 * the panel data sheet's 160-pixel back porch separately from the sync
+		 * pulse results in unstable display output with the Verdin iMX8M Plus
+		 * display pipeline.
+		 */
+		panel-timing {
+			clock-frequency = <51200000>;
+			de-active = <1>;
+			hactive = <1024>;
+			hback-porch = <100 100 100>;
+			hfront-porch = <16 160 216>;
+			hsync-active = <0>;
+			hsync-len = <50 60 140>;
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
+&backlight {
+	/* Verdin PWM_3_DSI (SODIMM 19) */
+	pwms = <&pwm3 0 6666667 0>;
+
+	status = "okay";
+};
+
+/* Verdin I2C_2_DSI */
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	bridge@2c {
+		compatible = "ti,sn65dsi83";
+		reg = <0x2c>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_10_dsi>;
+		/* Verdin GPIO_10_DSI (SODIMM 21) */
+		enable-gpios = <&gpio4 28 GPIO_ACTIVE_HIGH>;
+		vcc-supply = <&reg_1p8v>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				dsi_lvds_bridge_in: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&mipi_dsi_out>;
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
+&mipi_dsi {
+	samsung,esc-clock-frequency = <16000000>;
+
+	status = "okay";
+};
+
+&mipi_dsi_out {
+	remote-endpoint = <&dsi_lvds_bridge_in>;
+};

-- 
2.43.0

