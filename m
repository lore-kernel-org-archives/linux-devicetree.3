Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB129449EB6
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 16:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779466306; cv=none; b=Vmck3BKukp40HLktyXoordlMyIQKU3C/jSrf6imaiSd97xk6FEE1XIPNpXZ4EzBwOm0KqcCTmYA8vq49EYScAYCntchz0woyMSL+54XEQFLE/7zV2fYCAPKA3XHEYG3nMiehmQ9EF4mYTOGqtXZHTu5RatWnOM0itdQgn/xaglk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779466306; c=relaxed/simple;
	bh=48kcuJ/i/8PepOHTSjMzjN6b2+s0XJ/67+SfBUSkqYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r+JbeTocQGxOG1RiryY9LJWxvUgI85DSeCkOvJikXO8NerEYllQX95akv1b1TalNv+bnl6CralSE5VheILkRKpaDtFSPI4+Nm/NHQqE6vwVHLMqCxiBHBKJt+nC+RE6ErxXbKp6Jg3oUnznZUBIcHYklY8uJ3ciYU7iBnwwQRlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FlHTaUVv; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FlHTaUVv"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4891b0786beso51626445e9.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779466303; x=1780071103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Ik325qS+IlSAnQ/mwoET7pUu3OO4SnjA2/txbOoUzg=;
        b=FlHTaUVvkvzm75TpMb9ljgPTeNTE+R1p2Bpdwz4nQ/I+JMHOHycdBszRVmS38Vy+G/
         HmymI1db5wAf+0WRZw6LsCwIu/Trxzjuda5FAJRG7RT+Cviy6el0ME3e7Zg11PFYzPP5
         JIuy5xdDh42ivox1EtQeA3Zp5CTxg31XTJ9LLXpHGmgoGooWhajrrB7IR3P+zk2wy/wL
         zBH5JHWHA5hnHsXwdRAvBaWCFscT2WvMeKoIBoAp9Cck+7k4EWuWq3x3+ATwL4PpZcDA
         MZhEtV7yYHrTkqBjD/QYuLVo+SJtHnIhN6bC5ulU0JTHf2wvsMFAQKrBZ3zPnfUsg9Ra
         KP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779466303; x=1780071103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8Ik325qS+IlSAnQ/mwoET7pUu3OO4SnjA2/txbOoUzg=;
        b=eX7w4mK5L20WjhfR/iUHL861mhbLN5JUKlb54FQhJ9zYncMs7elAJ+7BU8kN34+uJZ
         mGPvvKRVgMlrffmJ91BVhZP3mUUxWZqfXKwLwy6z87VASZyAlWs9ndi1FLN8n2EJvOa3
         1S66qKwTlC1rQ0ZYN/8z3NwDsChho59JbRE+NpMsCif3c6H/cWALoAQb5MXbCgcTI7eD
         ydTh3V4FLFGeL2tC505+gvkWwh8wX5sRd1M1h6fID/P3Ju2yD3kIKdwkKoMpThDGGay7
         KcFdANVDi9io/kh7BbzrsoHffn68oFmUZWT7feiQDjIZt080Yy2hjfhilp0TWWYIu6wi
         4VQg==
X-Forwarded-Encrypted: i=1; AFNElJ/FAa1F4/uDb+Uirb67Qp0d5KHw4b+K9UjL29sVzMWRgTKNDtX5XwNVBYN8TqvIZNs8N3PJsz3x2glI@vger.kernel.org
X-Gm-Message-State: AOJu0YyU8MGKryGzNHGcrS2ixOuOXAtGAEUrgZGJMCThkqiGRUwipt8Q
	hRvFpHMyTMNi90b+y37w/TeQDV+3lN34eYxHrXrK1ZrIPirUEYcmuswd
X-Gm-Gg: Acq92OH8A/xpoLPo2JpyNHN342dJ9Ixl+ml6oCFtpUi1hjFyGvpAjj0SDwXUSSoVOsu
	kupPyLQ9zFE0B+pbqTW9M2BUGVXTHPgyihBFJOpDFuB3RI1jTNHKoW28864R11qFvIdSfQsBWpt
	wbPfo9bcn/ySJNMFGoeDg/FQS/ZGgpzrPtakijSyxe1jlFgktbZPnoYXbHSJW3eUtBZLdj/VtPJ
	x12z1tHeTdxHOR7Qt3KluKz2wa1gSBHStuu1/yeeplcN/STvbhMLT+FBm/Y5PEne2yP60HxulXQ
	tdqe8/U8BiVuLSKMy0wRvDZoWiUVgvqwUPuypVDFByyTlpg3PxRfzDOD3LrNhduJgsy9ybrNaWD
	UsiiSWy9ZoDbO5rQg6VmtAIvMDVfC0F1xroWsZBK5qm1p0hi2A1ep8VwX1zLZzewzhyTtyGgL/V
	XfkqmmwKnBoBou1U7ZxAfVz4eDFHmReVhT2oVJTKRPfQ==
X-Received: by 2002:a05:600c:3587:b0:48f:e230:2a20 with SMTP id 5b1f17b1804b1-490428eb9eemr61826885e9.31.1779466303106;
        Fri, 22 May 2026 09:11:43 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b9asm51042755e9.11.2026.05.22.09.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 09:11:42 -0700 (PDT)
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
Subject: [PATCH v3 02/11] arm64: dts: ti: k3-am62-verdin: Add Toradex Capacitive Touch Display 10.1" LVDS
Date: Fri, 22 May 2026 17:11:06 +0100
Message-ID: <20260522161105.277519-15-ivitro@gmail.com>
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

Add a device tree overlay for the Toradex Capacitive Touch Display 10.1"
LVDS connected via Verdin AM62 OLDI on carrier boards exposing LVDS
interface (e.g., Mallow). The panel is a LogicTechno LT170410-2WHC 10.1"
WXGA IPS LCD and the touch input is provided by an Atmel MaxTouch
capacitive touch controller.

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
 ...25-verdin-panel-cap-touch-10inch-lvds.dtso | 120 ++++++++++++++++++
 2 files changed, 125 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index b2408f62c139..867c05b675d1 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -33,6 +33,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-zinnia.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-10inch-lvds.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dev-dsi-to-hdmi.dtb
@@ -213,6 +214,9 @@ k3-am625-sk-hdmi-audio-dtbs := k3-am625-sk.dtb k3-am62x-sk-hdmi-audio.dtbo
 k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
 	k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
+k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds-dtbs := \
+	k3-am625-verdin-wifi-mallow.dtb \
+	k3-am625-verdin-panel-cap-touch-10inch-lvds.dtbo
 k3-am62-lp-sk-hdmi-audio-dtbs := k3-am62-lp-sk.dtb k3-am62x-sk-hdmi-audio.dtbo
 k3-am62-lp-sk-nand-dtbs := k3-am62-lp-sk.dtb k3-am62-lp-sk-nand.dtbo
 k3-am62a7-phyboard-lyra-disable-eth-phy-dtbs := k3-am62a7-phyboard-lyra-rdk.dtb \
@@ -315,6 +319,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-sk-csi2-tevi-ov5640.dtb \
 	k3-am625-sk-hdmi-audio.dtb \
 	k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb \
+	k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds.dtb \
 	k3-am62-lp-sk-hdmi-audio.dtb \
 	k3-am62-lp-sk-nand.dtb \
 	k3-am62a7-phyboard-lyra-disable-eth-phy.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds.dtso
new file mode 100644
index 000000000000..f83366b11bdb
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds.dtso
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" connected via Verdin AM62 OLDI
+ * on carrier boards with a Toradex standard LVDS display connector
+ * (e.g., Mallow).
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
+#include "k3-pinctrl.h"
+
+&{/} {
+	backlight_pwm2: backlight-pwm2 {
+		compatible = "pwm-backlight";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2s_2_d_out_gpio>;
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		/* Verdin I2S_2_D_OUT as GPIO (SODIMM 46) */
+		enable-gpios = <&main_gpio0 34 GPIO_ACTIVE_HIGH>;
+		/* Verdin PWM_2 (SODIMM 16) */
+		pwms = <&epwm0 1 6666667 PWM_POLARITY_INVERTED>;
+	};
+
+	panel-lvds-native {
+		compatible = "logictechno,lt170410-2whc";
+		backlight = <&backlight_pwm2>;
+		power-supply = <&reg_3v3_lvds>;
+
+		port {
+			panel_lvds_native_in: endpoint {
+				remote-endpoint = <&oldi0_out>;
+			};
+		};
+	};
+
+	reg_3v3_lvds: regulator-3v3-lvds {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "+V3.3_LVDS";
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
+	touchscreen@4a {
+		compatible = "atmel,maxtouch";
+		reg = <0x4a>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2s_2_d_in_gpio>, <&pinctrl_i2s_2_sync_gpio>;
+		/* Verdin I2S_2_SYNC as GPIO (SODIMM 44) */
+		interrupt-parent = <&main_gpio0>;
+		interrupts = <37 IRQ_TYPE_EDGE_FALLING>;
+		/* Verdin I2S_2_D_IN as GPIO (SODIMM 48) */
+		reset-gpios = <&main_gpio0 33 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&main_pmx0 {
+	/* Mallow Touch RST */
+	pinctrl_i2s_2_d_in_gpio: main-gpio0-33-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x0088, PIN_INPUT, 7) /* (L24) GPMC0_OEn_REn.GPIO0_33 */ /* SODIMM 48 */
+		>;
+	};
+
+	/* Mallow Touch INT# */
+	pinctrl_i2s_2_sync_gpio: main-gpio0-37-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x0098, PIN_INPUT, 7) /* (U23) GPMC0_WAIT0.GPIO0_37 */ /* SODIMM 44 */
+		>;
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

