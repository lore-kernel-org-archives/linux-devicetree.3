Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D300936AB54
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 15:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779375689; cv=none; b=gj35c6un+k4RPJ1qGP6Vv5SjrZMRBV7II1+jle2HkidSfRLDdEoiN7DxuatxZp0vbajwd5J4nZUrLeaWVsi++FqwgCbbqC1MafcNYaJl+L5tt5gvssP7e61ODhSSmcO+jlW7RAvbA/+MPENFy0EBr1y7sh5b1oAzN/flAkRrrGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779375689; c=relaxed/simple;
	bh=ZfE84iNTLJHvpNXuuHofhxb+0xe9pbTqoFX2KJJmZ7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tP0uOoObGoowDFdpKrLeNc5/2AE1VrB6p0WuVHARePqr7+mdhXnvZaImEfXjT/BrDjAOmkRcUSyzi3wXPf13i3zdwFHOWdr19+VIb7E7wmxMe5d/vZ6as2VTRV4Was/PZvAiMd8+QfaYWFK36oN7g9epBoMKj2kZ1Z4ktBN35hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pka27xUQ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pka27xUQ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490388fd0dbso7442765e9.0
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779375686; x=1779980486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bEspAflfqXVOBaHB7nYaBvfzdQiHssyglqXp6Klx3RM=;
        b=pka27xUQtJO4ismDYbe2xJ2sn3x7CCJVHv8s5rqLT3rtKLbd3UeDqIkiniXYXUWhwj
         iieknvE3A6yxcVGEDPf4YN9ImtOtuowrzpQlmxn/GopNjrwozPrVg3/3M0U47ob/Jkq4
         cDBrKDKMEINf/rUCtee0RXsU+WHdc6XafAotO/mDg6JT45OJr3drqHcHLWjygGmVw+LJ
         qHoUrYGBmHeMTntaGWO5liLd/pUP8YH6MbW/7y6C9hAaDC/cPL57znjlKaYi8fdWAobt
         wVJ34X65Y36KWocj6VpvIoxDUi5GQN9C0PDDeRMzJV05QhOKBLvFKw7i7WgmBVgDSwHO
         cFbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779375686; x=1779980486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bEspAflfqXVOBaHB7nYaBvfzdQiHssyglqXp6Klx3RM=;
        b=cnmIM6sLKksy6NVk2FSk3B6BshlVNSvFzvRAiflemFaVfG6zdyGE7UWXz6eb+IFqly
         bh1wBO3ZvFhzHg5twpt2uzobVuuC/Bq4x5SBQn3ImtlkmSOuKTJA1sDMKbaf0mdWmuKW
         9SWmJykoDrpKwwIgSrZCFDGYJOzg4sZqku+nG0h4xvspHlmqM5HZGM4ceRb4vnVd+bV1
         jsZ9Rs8gCozNyLOW6Rih9Vy+piBv5au3A1kFsXwrlgVqLOD+r+a3PiJktFmpaQj9LD+R
         Mxy/FPY/1Vjv+qegM/QTCBrDRtwbzEJyZ3zxim13A8R0X4ylPyjzKILd07Cez1gFNv7Y
         9FRA==
X-Forwarded-Encrypted: i=1; AFNElJ9ZBwBxbNuXNT/lpEGJpLLJ8Lb6kaE/Lud5j0d0se2g+3ljeqtbSnpZmhbvblo+ZP5XfVmWgZGxYN9D@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrkl9tUNYest9hbp3y3t+o7JK6SlwwfI8SR7GZBZiZ+RkgTYm2
	RsEwOlusd/Krmbs0b5CRbhTuhzj2giZwuReP350ZSY92YRf5AEhWnpYi
X-Gm-Gg: Acq92OEiwIg9M1zJ/K5EgMcGbi1+Oja8B3evYnKdhksGVc6PJwJZE1aygssF5W6fi6n
	5w4LuKe/ufrqZlEqpqPN3kfvyMDZPsbIro6SF5YnoR+IHFvJDF87lSvLJa85DsC1YK2FCsTDDnF
	3jjPY4XAGDSfkMLJAFL7ZWVBM3kGMctCKwoIZ7tjZrPUxFiHnFVks0WaZKrnJzE9zft+fFwvBsk
	/Q7tH6PYRFRtICffrqJyDG/7aP8+TC3l4OtOdvtM1gpju+xdnM5E9iqlg48249skqCEZwUOgeNw
	MjYT3m/s78/DpNt91UWxMcfCuMMhYtM7QZx/jniImUJrNj4QcUYgo8H9LePJdhWUIm4mYouu6bt
	SdHioKevrKcB66LovOdtRYkEFlpeUtONhmx/KxsMYGgu2adCCyHckKn321DZK1/BjXrN853lLCt
	GtmwqW4wKtzOIR146H1tYSd+kCTlUw2OFirY+LmeZSVQ==
X-Received: by 2002:a05:600c:42d1:b0:489:1ba8:5bf0 with SMTP id 5b1f17b1804b1-49036089466mr28660825e9.21.1779375685813;
        Thu, 21 May 2026 08:01:25 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm34056745e9.14.2026.05.21.08.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:01:24 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 12/15] arm64: dts: ti: k3-am62-verdin: Add Mezzanine with Toradex Display 10.1" LVDS
Date: Thu, 21 May 2026 16:00:48 +0100
Message-ID: <20260521150038.103538-29-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521150038.103538-17-ivitro@gmail.com>
References: <20260521150038.103538-17-ivitro@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

Add a device tree overlay enabling the Toradex Capacitive Touch Display
10.1" LVDS on the Verdin Development Board with Verdin AM62 Mezzanine
expansion board. The panel connects via the AM62 OLDI0 on the Mezzanine
LVDS interface (J10). The panel is a LogicTechno LT170410-2WHC 10.1" WXGA
IPS LCD and the touch input is provided by an Atmel MaxTouch capacitive
touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   5 +
 ...mezzanine-panel-cap-touch-10inch-lvds.dtso | 109 ++++++++++++++++++
 2 files changed, 114 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 90bb3b0522d3..371f9a043fe5 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -30,6 +30,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-phyboard-lyra-rdk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-tqma62xx-mba62xx.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dev-mezzanine-can.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dev-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
@@ -231,6 +232,9 @@ k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
 	k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 k3-am625-verdin-wifi-dev-mezzanine-can-dtbs := k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-dev-mezzanine-can.dtbo
+k3-am625-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds-dtbs := \
+	k3-am625-verdin-wifi-dev.dtb \
+	k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtbo
 k3-am625-verdin-wifi-dev-nau8822-btl-dtbs := k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-dev-nau8822-btl.dtbo
 k3-am625-verdin-wifi-dev-ov5640-24mhz-dtbs := k3-am625-verdin-wifi-dev.dtb \
@@ -348,6 +352,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-sk-hdmi-audio.dtb \
 	k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb \
 	k3-am625-verdin-wifi-dev-mezzanine-can.dtb \
+	k3-am625-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds.dtb \
 	k3-am625-verdin-wifi-dev-nau8822-btl.dtb \
 	k3-am625-verdin-wifi-dev-ov5640-24mhz.dtb \
 	k3-am625-verdin-wifi-dev-ov5640.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtso
new file mode 100644
index 000000000000..9c44d39a9498
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtso
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" LVDS on the Verdin AM62 Mezzanine
+ * LVDS interface (J10), used with the Verdin Development Board.
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
+
+&{/} {
+	backlight_pwm2: backlight-pwm2 {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		/* Verdin GPIO_4 (SODIMM 212) - LVDS_BKL_EN */
+		enable-gpios = <&mcu_gpio0 4 GPIO_ACTIVE_HIGH>;
+		/* Verdin PWM_2 (SODIMM 16) - LVDS_PWM */
+		pwms = <&epwm0 1 6666667 PWM_POLARITY_INVERTED>;
+	};
+
+	panel-lvds-native {
+		compatible = "logictechno,lt170410-2whc", "panel-lvds";
+		backlight = <&backlight_pwm2>;
+		data-mapping = "vesa-24";
+		height-mm = <136>;
+		width-mm = <217>;
+
+		panel-timing {
+			clock-frequency = <71100000>;
+			de-active = <1>;
+			hactive = <1280>;
+			hback-porch = <3 40 51>;
+			hfront-porch = <43 80 91>;
+			hsync-active = <0>;
+			hsync-len = <15 40 47>;
+			pixelclk-active = <1>; /* positive edge */
+			vactive = <800>;
+			vback-porch = <5 7 10>;
+			vfront-porch = <5 7 10>;
+			vsync-active = <0>;
+			vsync-len = <6 9 12>;
+		};
+
+		port {
+			panel_lvds_native_in: endpoint {
+				remote-endpoint = <&oldi0_out>;
+			};
+		};
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
+		/* Verdin GPIO_3 (SODIMM 210) - LVDS_TOUCH_INT# */
+		interrupt-parent = <&mcu_gpio0>;
+		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+		/* Verdin GPIO_2 (SODIMM 208) - LVDS_TOUCH_RST# */
+		reset-gpios = <&mcu_gpio0 2 GPIO_ACTIVE_LOW>;
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

