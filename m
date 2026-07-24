Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CCC41D100
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 16:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784910287; cv=none; b=ISTTqTSAhm4ynbIImkr7OqRT6V/XqGxZOXgargqwGUISj+7vZgyANiX9me/NJvx32zvss4oApqkeVDdp77L4Lwtx8GmkgqWYMlzKEqwAC77p87+9vvDNxL4U55EnNIMUxaO1SwzQoWHe/X1KwJpwbwYj4kMzSfqhEkYaYc4MY+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784910287; c=relaxed/simple;
	bh=pse+ydYpLstFn4KCwh9AhUkS1mX1I23Ida50UVw/6GQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Us6A7iRcLr3b/wsX7DixQxOLmKy/yXPtpNfwG6FjvpIqerDtqgmiiDlfzT59QJctr703v7W0tV4OlkaKftK0i+YveX/K2CerXiEbNE7h3RfA//BdUlF3IoWxEdIYQgalrE3CzHdhYxvDy9S11OxT/zEo20JRo6fVd1pvxLCEwhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OKca99iW; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OKca99iW"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-476a130c138so692930f8f.0
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 09:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784910283; x=1785515083; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aCWxL+gdHp3rawACd96l5HhEzAGyed8VGNhhwwNNZMg=;
        b=OKca99iWZfiBy/B9R6EnO8QkGCpz2hZHLuS/LCq2vEFzyCOi/4jgcidjPE9XwSXpHC
         bRh+mOVJB0YsIPd73tDq+HXQ6Blp3+5pQV3ZEH58uY8YzC3Vaq2E/eu5UMkP4x5F17pZ
         cGn/awNh4HQP4RKZNU+M71+dnzBXhHqNJrcCajKFrKK9L+f8dtm1Um/AJC+mKbBdCj/7
         GdQnwcyfLkIKkSBnov7sFI2LCYh2aesl9mJdy5HakWDAR6Qpi21VXHBNxCpHXh1fv7iQ
         QTZUZHFhqIYiOS5M1dT30TDdaqtWEtUYRyGT6iUK/S/2fe+xbAQsS2C4DiYxciT9D6Fb
         JlFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784910283; x=1785515083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aCWxL+gdHp3rawACd96l5HhEzAGyed8VGNhhwwNNZMg=;
        b=hXbdPKC5rh2xjLk4urfUQ+wLxtzZVHux8i63DXev+dRKnbkNh7N/xvtEVsNTAME193
         RU+SvCT7eQfhriPCRhp8zZNxYu7zX7mozbk3RvSEazfOS5biItF8FgZRZPeTl2P/guDj
         zD55+Tm8j8D+7gU13tRWYksf6PlCUGyvgs9uE2KLBQ/YdOKUdZKjCa/CKxBg0bdL6szD
         tlyYN4EKiVHtm2rhxeKFsilWrR31aIBzNtacN9fFbKihEUArch5u5+mTJ3kq31/jhXQF
         KGKwggXzUnSCDBPrruusbNnnWXSIyf6rBKQglLP5GvhBd26V3Ob8JkyoQ8qXgeY1XNH3
         iiIg==
X-Forwarded-Encrypted: i=1; AHgh+Rp62LW1mhaN0KpfWnlCwi56w+S7gDdm6UhaijjrwX5YI4Ydn0XdDwzNcRWgaONcOsBC7Jop0XDJGi+D@vger.kernel.org
X-Gm-Message-State: AOJu0YylsNaDowb5hsAb/lQIIu4MD2ji3jJUNA4bmyHTsdWLcjmO1bHa
	ww4A6FAq8AU6fdS9lwbHb3YNt0HlSuU1vVGC/Nsqn8nst4bNwiDxdtbk
X-Gm-Gg: AR+sD11xu8VfL6XwGh53Af+IIQsBAC6rcZUrUg2u/ydFKqMD2qLqqibF62b1OhEG3DH
	paFfA2RSDudKnArgyk4Ur1u3CNY9FbaBeq6+rmMj9rkz1K1u6Yh52CIDaUXeRnlsD+8kgEzEnC0
	Tr6dcPQkwoJVAKAlnuET6WoO6pg4P6d9X2lGEKGpat7kBrfHwR10oTraw7q7puYP6RJn7rJqL5r
	r53exoIGRD1KAIz94FSN441hPhzBfCnJwWQiEI5ft8o2ybjnRAUbIPh8xJSsxuh/rQiLocnTSBW
	YxQi/korTZAbIh6wzwzMq+PKxJwEDAfYOIu4IJXjAe2DYQ/0YuIQXev9tw/dAE0r+26nPS0qVfX
	XeunnzTLjrIal1cuBjOqFvBiy1ZYbjxJ4LO06Odek/tGPSec6Yr5toyHW8GKxT/OD4jDlheYdPB
	tgHti0Jz0GxUIm0wzIaNY5FkJBQ+eeKe3jjJBjmjyEdA9XvpLF6+91hNlIyWqmtsC19SQkWX/eB
	keyMQ==
X-Received: by 2002:a05:6000:178b:b0:475:f100:35fb with SMTP id ffacd0b85a97d-47f8dcab0a4mr11547786f8f.56.1784910283133;
        Fri, 24 Jul 2026 09:24:43 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a5d9sm24366255f8f.5.2026.07.24.09.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:24:42 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Fri, 24 Jul 2026 18:24:29 +0200
Subject: [PATCH v2 3/7] arm64: dts: freescale: imx8mm-verdin: Add Toradex
 DSI to LVDS adapter with 10.1" display
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-v1-verdin-imx8mm-dtbos-v2-3-9d7988bd76f6@toradex.com>
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

Add a device tree overlay for the Toradex DSI to LVDS Adapter with the
Toradex Capacitive Touch Display 10.1" LVDS. The adapter connects to the
Verdin DSI_1 interface. It is based on the Texas Instruments SN65DSI84
DSI-to-LVDS bridge and drives a LogicTechno LT170410-2WHC 10.1" WXGA IPS
LCD panel. Touch input is provided by an Atmel maXTouch capacitive touch
controller.

Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-adapter
Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   4 +
 ...-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso | 104 +++++++++++++++++++++
 2 files changed, 108 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index f55c570cb3e3..91ae54931818 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -179,6 +179,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7903.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7904.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dev-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dsi-to-hdmi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dev-dsi-to-hdmi.dtb
@@ -191,6 +192,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-hdmi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-ivy.dtb
@@ -204,6 +206,8 @@ imx8mm-verdin-nonwifi-dev-dsi-to-hdmi-dtbs := imx8mm-verdin-nonwifi-dev.dtb imx8
 imx8mm-verdin-nonwifi-yavia-dsi-to-hdmi-dtbs := imx8mm-verdin-nonwifi-yavia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 imx8mm-verdin-wifi-dahlia-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-dahlia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 imx8mm-verdin-wifi-dev-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
+imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := imx8mm-verdin-wifi-dev.dtb \
+	imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 imx8mm-verdin-wifi-dev-nau8822-btl-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dev-nau8822-btl.dtbo
 imx8mm-verdin-wifi-yavia-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-yavia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso
new file mode 100644
index 000000000000..2c253018893b
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex DSI to LVDS Adapter on Verdin DSI_1 with Capacitive Touch Display
+ * 10.1". Used on Dahlia (X17) and Development Board (X48) that expose DSI_1
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
+#include <dt-bindings/pwm/pwm.h>
+
+&{/} {
+	backlight_pwm3: backlight-pwm3 {
+		compatible = "pwm-backlight";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2s_2_d_out_dsi_1_bkl_en>;
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		/* Verdin I2S_2_D_OUT (SODIMM 46) - DSI_1_BKL_EN_LVDS */
+		enable-gpios = <&gpio3 24 GPIO_ACTIVE_HIGH>;
+		power-supply = <&reg_3p3v>;
+		/* Verdin PWM_3_DSI (SODIMM 19) - PWM_3_DSI_LVDS */
+		pwms = <&pwm1 0 6666667 PWM_POLARITY_INVERTED>;
+	};
+
+	panel-lvds-bridge {
+		compatible = "logictechno,lt170410-2whc";
+		backlight = <&backlight_pwm3>;
+		power-supply = <&reg_dsi_lvds>;
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
+		gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+		regulator-name = "DSI_1_PWR_EN";
+	};
+};
+
+&atmel_mxt_ts {
+	vdd-supply = <&reg_dsi_lvds>;
+
+	status = "okay";
+};
+
+&lcdif {
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

-- 
2.43.0

