Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585152;
	b=yw4MTHzAqWVjGSOXQtQyBVdth2TTWL67WXYxwbXR81/hu+jFcya+N6nGvU5LvsX/W3Gz
	 ylgIJXGw7XB9L2bth0xQENXWXOGIOeUtR0kVTc27Ux1oDiaGwwhYU+mMlY2WTEebWfqVP
	 MswowhHT/dvoBRiLRLwF2ysg7dQac1YxjDLNr06JsPlzwsXQBDxvIoAcu8eShUNNSpxvQ
	 5pEOoRTCpF6yF4wjVLqKsm9/Aza7bUR+vovTQR1zJmQ7fbrrWXldDFcCxB1imABdCnoGG
	 RAX+oszBuwJu/vf5f2l31WJzzPC7/B5ar3IcAtWMvfzN/eeYIMNpAtA8cqFW3L/685g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=HS8PPeqYM/99TwtIsC0HfLuufEZcQH3nS14cV+C4Nnw=;
	b=q1DA3q/WBOUzYV9deCiOGFPbC/srMprWKVDxqC/ZawNZ78qtoX/+w+fN/B5f7+OF7cnz
	 3EQFnuR7xWwqMehfkuX0btqRbw0qfuVJsEh4ELY8wRGvWPCD60TAPo8jLos3720VK459E
	 VX2HiESJ8pf1P7fUa1w+hiDGaFDlEvEDgQe0BiLV+ORYgdPJw4xQmlWQYd7M9kxDqQ081
	 m/nCOpRQZWRyZOu4ib53C5QcovYsaF16EPoT/scJRhOc/GUfypaWC1Zhz6Qrpk3PHfIQj
	 TsGZrlmDQin9afha52XZv4REtRI3R+/5uxlsWmRxfDUeARr3PE57/ebsNvRy10St9vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wC8JvY7X;
	arc=none smtp.remote-ip=209.85.222.46
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39119606A887
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 15:52:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39119606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wC8JvY7X
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-998d151f441so296517241.2
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 07:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794585151; x=1795189951; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HS8PPeqYM/99TwtIsC0HfLuufEZcQH3nS14cV+C4Nnw=;
        b=wC8JvY7XWlFCtylruT2OQGv3maIhkzJlnmYvK1HsDz9mJcwvsH29+5TEaO5uAzaVSu
         GcqiqlpPwi4maM7XPp78l4zdw2f3Errl0GqbDQ0W5c+7xcBBT72sWVOcJpNKw/ZZNezN
         Y+EJUisjWcv6KCcScD9SKb102YfKhk1IXl62/8Pibz5WOlzGKEpY0rb+128yzq3RkGvd
         qdXtWdzQIJ2QlT/o4rqAhWB4F+X49ahdWVgV5fQo1yB8oKxEdB7P6+VNfCeAYu0vgZzb
         HsR2WAKBTtN1ZBqsddOhx28mmtcy+CA1VYrvj7I1JOCuqGhsu/jk4zOFy32ltEC4FAM4
         8VAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585151; x=1795189951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HS8PPeqYM/99TwtIsC0HfLuufEZcQH3nS14cV+C4Nnw=;
        b=m66hQV1TQ3GQNe9VakGSSUhkj+1z0lu/ioUwOJmtWKgVuaiW4ou+sH/KISrG4WJsm3
         vsZB6TsrTwtqLCuCO8kCqoa1ZTs9NYGxR2lzrrvJRwDUbmZuH/poOiVmfHqlW1T0E2q0
         TFiCVgnqtBSCOjp4zmzQcm4HkbGCn6QObdpLE23IDBv1SE2fQMSfqoawE4UqQ3ECZ3o8
         ThtJAOZtbzs4NsTFLvr2Bb/a+ys27f/7SX6REqGO3/OIKWGz4SDlvEEPqHv5tXNtcOb8
         /kC2XRQ1TzbNN0KsZYOTD1JHKr8fAJnVaMT1WQlrFsKvojtzKQbt8F4WrodYrP1LcENa
         5XWg==
X-Gm-Message-State: APuU4Z+9v0Ouc5EdHF8QoYa+nitB+lQ/eEiTrCmpyFxKFj582pk9u2Pt
	CBn0C6FFjV3QHKnot61K1fMA2w3uold/pH4KdpHGb9T2lLeQSSGTTkza
X-Gm-Gg: AYBFou1R00foodxisRb6yG92AQpFU/bOeFU9nvmum6LkXKb0jxxQfpf5AoEomZU3XUs
	HWiBdDJozEmS61otpfWeujj+TtvZEUyYO1wmlPIMBdJGMreJr3/HQ5Cob1MO7e2aHAEVSEsOAXu
	9DgZZ9/CEFVFbx7JQF13mdCuW/MuCgtqW4T5OR6Rfwuo8+MY3XnoWtoivVTne0LxpEsPmoCWWPE
	IJuFXLqAJ8GlmPmB5naXvDuKrN2hFV+K4CyL4aacwXeWPZ8K4A3cZpRADbUC8Uugvmug/9KWtMX
	wPboXYEW6rEh7GodQuU7Z8aDJe+w3xl9c5QnM/huJxXdsKvNcZ55v7/oGC1yVz0grLk7XEvq2A2
	U6cQP6CRZqRUXXb+E+ZjtOK7ziBDIJLCo4TbjJW6gEKME/6pZGQ01kIQPPIS85XarmxXHcwQEr3
	8c0S3jlm/uE3sFw+/gWMCKYibGuHq60klQLU5sZzWIR0KDCCon927wQ5MKjzRPh4bfPQGhfRKxG
	ihwcZ6rffg/y0MR+Ywqu9Kh05f0bjpoC2FFXETwXWT/BwUJqMpmjCS1qXEv3Gjai3fOPQh8yuux
	j1S77xOtlWO7uGTJoxA85+4GUSgoyBgbbV+Gxw/JhQqyBVCNehnOWw==
X-Received: by 2002:a05:6102:2c85:b0:7cc:232b:f5a9 with SMTP id ada2fe7eead31-7d64d80d3b9mr811140137.24.1794585150917;
        Fri, 13 Nov 2026 07:52:30 -0800 (PST)
Received: from [127.0.1.1] ([179.160.39.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c8428c7fcsm1635449241.9.2026.11.13.07.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:52:30 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Fri, 13 Nov 2026 12:51:16 -0300
Subject: [PATCH v2 5/6] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 Toradex Capacitive Touch Display 10.1" LVDS V2
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-5-327f5d37a9c5@toradex.com>
References: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-0-327f5d37a9c5@toradex.com>
In-Reply-To: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-0-327f5d37a9c5@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 ernest.vanhoecke@toradex.com, Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794585121; l=5590;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=OZsqf/Mxkw+YXhvycv2OCRQ35UFpHe7rjP/Hh/ssQlk=;
 b=uF1NmeAHqkz7VMUSPPnJDBCC2AGpB/Cuqety/UIZlEyshp4f8Y6cdLZA/+OfFpPLwTSiwWptq
 z1EuJaxRsYKBS2WIYr9/7fjK+EIU41XZgjD201AKOx0GGjyaHCAn6mE
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay for the Toradex Capacitive Touch Display 10.1"
V2 on the Toradex SMARC Development Board LVDS0 interface. The panel is
an Opto Logic SCX1001511GGC49 10.1" WXGA TFT LCD and the touch input is
provided by an ILITEK ILI251x capacitive touch controller.

The overlay is also combined with the Toradex SMARC Development Board
device tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |  4 +
 ...x-smarc-tdx-panel-cap-touch-10inch-lvds-v2.dtso | 98 ++++++++++++++++++++++
 2 files changed, 102 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 604bb35675930..f7f09d3cde5b9 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -714,9 +714,11 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-adapter-tdx-panel-cap-touch-10inc
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-adapter-tdx-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-tdx-panel-cap-touch-10inch-lvds-v1.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-tdx-panel-cap-touch-10inch-lvds-v2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-tdx-panel-cap-touch-10inch-lvds-v2.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2.dtb
@@ -726,6 +728,8 @@ imx8mp-toradex-smarc-dev-adapter-tdx-panel-cap-touch-10inch-dsi-dtbs := imx8mp-t
 imx8mp-toradex-smarc-dev-dsi-to-hdmi-dtbs := imx8mp-toradex-smarc-dev.dtb imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
 imx8mp-toradex-smarc-dev-tdx-panel-cap-touch-10inch-lvds-v1-dtbs := imx8mp-toradex-smarc-dev.dtb \
 	imx8mp-toradex-smarc-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
+imx8mp-toradex-smarc-dev-tdx-panel-cap-touch-10inch-lvds-v2-dtbs := imx8mp-toradex-smarc-dev.dtb \
+	imx8mp-toradex-smarc-tdx-panel-cap-touch-10inch-lvds-v2.dtbo
 
 imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10-dtbs += imx8mp-tx8p-ml81-moduline-display-106.dtb \
 	imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-tdx-panel-cap-touch-10inch-lvds-v2.dtso b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-tdx-panel-cap-touch-10inch-lvds-v2.dtso
new file mode 100644
index 0000000000000..0235aa1acbacb
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-tdx-panel-cap-touch-10inch-lvds-v2.dtso
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" V2 connected via Toradex SMARC
+ * Development Board LVDS0. Connect the panel to J48 and the touch controller
+ * to J49.
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-lvds
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8mp-clock.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	backlight_lcd0: backlight-lcd0 {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		/* SMARC LCD0_BKLT_EN (SMARC S127) */
+		enable-gpios = <&som_gpio_expander 5 GPIO_ACTIVE_HIGH>;
+		/* SMARC LCD0_BKLT_PWM (SMARC S141) */
+		pwms = <&pwm2 0 6666667 0>;
+	};
+
+	panel-lvds-native {
+		compatible = "optologic,scx1001511ggc49", "panel-lvds";
+		backlight = <&backlight_lcd0>;
+		power-supply = <&reg_carrier_3p3v>;
+		data-mapping = "vesa-24";
+		height-mm = <136>;
+		width-mm = <217>;
+
+		panel-timing {
+			clock-frequency = <64500000>;
+			hactive = <1280>;
+			hback-porch = <20>;
+			hfront-porch = <20>;
+			hsync-len = <2>;
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
+			panel_lvds_native_in: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+};
+
+/* SMARC I2C_LCD */
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili251x";
+		reg = <0x41>;
+		/* SMARC GPIO6 (SMARC P114) - LVDS_TOUCH_INT# */
+		interrupt-parent = <&gpio4>;
+		interrupts = <29 IRQ_TYPE_EDGE_RISING>;
+		/* SMARC GPIO4 (SMARC P112) - LVDS_RST# */
+		reset-gpios = <&gpio4 18 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&ldb_lvds_ch0 {
+	remote-endpoint = <&panel_lvds_native_in>;
+};
+
+&lvds_bridge {
+	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
+			  <&clk IMX8MP_VIDEO_PLL1>;
+	/*
+	 * This display uses 64.5 MHz pixel clock, so IMX8MP_VIDEO_PLL1 needs
+	 * to be 7 times 64.5MHz, or 451.5 MHz as the internal divider will
+	 * always divide the output LVDS clock by 7.
+	 */
+	assigned-clock-rates = <0>, <451500000>;
+
+	status = "okay";
+};

-- 
2.43.0

