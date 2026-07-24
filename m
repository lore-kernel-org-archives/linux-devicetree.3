Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11194457D1
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 16:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784910289; cv=none; b=YmiqwD4M3pOiNxbjJ2HrVDQlsFZvOMvyXDh+B0/mZfabt7kFeWOKuyhDwQVoENWdr7gNbD+4sCP/xuzsaRvDrp83UbIlT7EZ56ue+KS7vd8SacvMYpGGZyOtpa8qmdYc7wPfTJG4mK+cbi0Jb+EvKw3DkopH72aVsL0tz37EQC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784910289; c=relaxed/simple;
	bh=wi//baCSsRrFsqFS+iwXRlFzMQAmActcVA6Fk6Qcoak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IFfEoIQCCku8sz37FnYdMmvwn1WdSGWqaRi4RCmeg63Oh5idjtcK5OYEJJJ0g4npwI/iDqnkLIbdMoEWpVWscJFf2QRCIU2DFsbguTyPI/QC2Wg41rucpFWhat1yJitKwyMxhCclKHYjuORWEmoPzOi7W5xBkh/iGgVJipfsk2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FRQb8cKE; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FRQb8cKE"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493f6de72faso5616105e9.0
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 09:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784910285; x=1785515085; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zf6ooxHCpPCPwrMpnj1PsrPR9RgeZkshiryAmOkeRBM=;
        b=FRQb8cKEKY+bGWJa5owmYD/EcJAEHSJzV4VxYqkVNA9vt9WtoVBTAbuX/OESToubS1
         lo/2u02kjK8NAFHAl9uDR1JlvCTCK/DwrfgOc8zdEfBlPD/qGxhd3tAS6gn/JJzV1zz8
         U9PQ/LGDNr7wUNUvkGVZBihbDdAhIcg3FMoHK00sne6ExwBGsbHVFfXvEhvXHWaxqR+j
         dydeX9Iuw28U/ab4jPvMm2Ga+foQ6Iz/cgVWwPu2BlHjJF5CdlxTVl6JzpjykyhQx/Hg
         iyTMFoI1c8Oq6TwPNcT6YWRSmY47+zrtV67mjewFx2pSi9Pt0nPIPse4+uzXLVfC16hI
         cijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784910285; x=1785515085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zf6ooxHCpPCPwrMpnj1PsrPR9RgeZkshiryAmOkeRBM=;
        b=stWIE2sRExiku3NxtkqHyH76Yyw4v4fZa/zrVZg0EcazkkRmVONk5eLgVV9G4B7Ktr
         NOLEg93ZzoSG4OuLFWh91qEY7jfane9Ro5cJxiFh63wPi3vAM68ZOfUd9OJtzO1TFRz8
         8bJ2VTr6bXn3bKQ1b99XH++TIPlNwrrY0kWEdS8PIb+VL8K8i+krN2cQWqOJZKWlfRGC
         8UDWIF0mY61b+M+H3coY1wzCRB+zIaJqMGRal+QD1koTxJ08ASAtwZX0prqJhJyF0Bbi
         ILrTvSw2tNIIAyy7S3X3lSZTXKK6sNHYlIjI0cWlrkyOHYY3qqL3Un8r5N96kMQmodQ/
         p/zQ==
X-Forwarded-Encrypted: i=1; AHgh+RpbkQwPD21yrKcVo1mqc9EUvF+bhR/UIHEAeAwYgPO8YE9fB8ZA87YTyyXmvTZbz9CgZ1sfP3Y+CGvU@vger.kernel.org
X-Gm-Message-State: AOJu0YwHVZKBhDcKcvBR/IHjRjfdEZBqG+4h9Vl4pNIKKHsw9R9+9vhW
	CEV9650OTmaA7hZlcTHu7mz1Y994cMmTSM/krS/jPu96df+wuUQvBHgS7C9uU7fL
X-Gm-Gg: AR+sD11hVTbOJezIiqsbgnylZE3c6Kv7yyX20lEE3LOIN1TotwdAIo3fFfffGqUCJXA
	I1howQIHALPGWpzQU6OjQ6SX7cbFH5hWLibpI2eaDFiMInggysOFmLSWwR+PzWykX2CEcRtB7dc
	xao4H2AEDWr3HQIJZC6gdMsthIgotU16nreRtgfk7asDMJcLt92rPfJ6Z8IOuA0z53ppc82vY2w
	WdFrCE9mRmXQNHkdDrL2P2tCjOISwN/IW9dRiy5FnyzgJMlFzFmf5AkAaU+VuDDxYv9+AYcOqmz
	fEFVsG++4WlkLanKRsRu4fNGgpy9DIYu0CBa3zHGUOUF/xNwzY9U5VNSbNnJwrV6oKB1qmr09t7
	dRwoA2hbZ27Qp2VJ1MwL+M0cGZ18DZ5OPBYUQOOqPzOfenMux/IsV1nx96WaAG8z/HeXIDtrB3n
	ZkKixqZ3g17H0fdHenpkKgPu99ArbvfcjWfv2MjicKbpj0VvpS5PdY67V2MtvAuLkYHAtiNy6GO
	YM9HQ==
X-Received: by 2002:a05:600c:474a:b0:48f:e230:29f5 with SMTP id 5b1f17b1804b1-4969f3d5ad7mr14824415e9.16.1784910284450;
        Fri, 24 Jul 2026 09:24:44 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a5d9sm24366255f8f.5.2026.07.24.09.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:24:43 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Fri, 24 Jul 2026 18:24:30 +0200
Subject: [PATCH v2 4/7] arm64: dts: freescale: imx8mm-verdin: Add Toradex
 Capacitive Touch Display 10.1" DSI
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-v1-verdin-imx8mm-dtbos-v2-4-9d7988bd76f6@toradex.com>
References: <20260724-v1-verdin-imx8mm-dtbos-v2-0-9d7988bd76f6@toradex.com>
In-Reply-To: <20260724-v1-verdin-imx8mm-dtbos-v2-0-9d7988bd76f6@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add a device tree overlay for the Toradex Capacitive Touch Display
10.1" on the Verdin DSI_1 interface. The display features an internal
Texas Instruments SN65DSI83 DSI-to-LVDS bridge driving a Riverdi
RVT101HVLNWC00 10.1" WXGA IPS TFT LCD panel. The touch input is
provided by an Ilitek ILI2132 capacitive touch controller.

The overlay is also combined with the Verdin iMX8M Mini Dahlia carrier
board device trees to provide ready-to-use DTBs in both WiFi and
non-WiFi SoM variants.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-dsi
Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-display-adapter
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   7 ++
 .../imx8mm-verdin-panel-cap-touch-10inch-dsi.dtso  | 129 +++++++++++++++++++++
 2 files changed, 136 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 91ae54931818..00dc2893c754 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -181,6 +181,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dev-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dev.dtb
@@ -189,7 +190,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-zinnia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-dsi-to-hdmi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb
@@ -202,9 +205,13 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-zinnia.dtb
 
 imx8mm-verdin-nonwifi-dahlia-dsi-to-hdmi-dtbs := imx8mm-verdin-nonwifi-dahlia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
+imx8mm-verdin-nonwifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := imx8mm-verdin-nonwifi-dahlia.dtb \
+	imx8mm-verdin-panel-cap-touch-10inch-dsi.dtbo
 imx8mm-verdin-nonwifi-dev-dsi-to-hdmi-dtbs := imx8mm-verdin-nonwifi-dev.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 imx8mm-verdin-nonwifi-yavia-dsi-to-hdmi-dtbs := imx8mm-verdin-nonwifi-yavia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 imx8mm-verdin-wifi-dahlia-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-dahlia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
+imx8mm-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := imx8mm-verdin-wifi-dahlia.dtb \
+	imx8mm-verdin-panel-cap-touch-10inch-dsi.dtbo
 imx8mm-verdin-wifi-dev-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := imx8mm-verdin-wifi-dev.dtb \
 	imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-panel-cap-touch-10inch-dsi.dtso b/arch/arm64/boot/dts/freescale/imx8mm-verdin-panel-cap-touch-10inch-dsi.dtso
new file mode 100644
index 000000000000..5626903d668a
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-panel-cap-touch-10inch-dsi.dtso
@@ -0,0 +1,129 @@
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
+		power-supply = <&reg_3p3v>;
+		/* Verdin PWM_3_DSI (SODIMM 19) */
+		pwms = <&pwm1 0 6666667 0>;
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
+			clock-frequency = <71100000>;
+			de-active = <1>;
+			hactive = <1280>;
+			hback-porch = <64 64 64>;
+			hfront-porch = <36 36 36>;
+			hsync-active = <0>;
+			hsync-len = <24 24 24>;
+			pixelclk-active = <1>;
+			vactive = <800>;
+			vback-porch = <24 24 24>;
+			vfront-porch = <8 8 8>;
+			vsync-active = <0>;
+			vsync-len = <8 8 8>;
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
+		/* Verdin GPIO_10_DSI (SODIMM 21) - DSI_1_BKL_EN */
+		enable-gpios = <&gpio3 3 GPIO_ACTIVE_HIGH>;
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
+		pinctrl-0 = <&pinctrl_gpio_9_dsi>, <&pinctrl_i2s_2_bclk_touch_reset>;
+		/* Verdin GPIO_9_DSI (SODIMM 17) - TOUCH_INT# */
+		/* Rising edge avoids spurious interrupts from the noisy falling edge. */
+		interrupt-parent = <&gpio3>;
+		interrupts = <15 IRQ_TYPE_EDGE_RISING>;
+		/* Verdin I2S_2_BCLK (SODIMM 42) - TOUCH_RESET# */
+		reset-gpios = <&gpio3 23 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&lcdif {
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

