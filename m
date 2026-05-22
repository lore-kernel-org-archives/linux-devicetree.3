Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF9C426EC1
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 16:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779466324; cv=none; b=cxVZRMvYvUvTjorU4ljG5A0rqxCL7iVmhzZKnfzoOiKMS1UJKog3GzaNqBLnAW1DkFpNrs5btBB95PLTA+i0jxPRCLpNFfPpcC7+dfyYEOSh9ecuD/JjAsFISELoXs4mo83NMSHP1fl1tfuXwAGZ29R7kP8+2XyC+lc+bhlvVUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779466324; c=relaxed/simple;
	bh=DYw9VjYd9ipznAYlbXUo4ldfb02okaa/4R9q2kBYgJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hBNGKA9sRtlzWodd03KDxlG0V6uuqcOqZKo/RzQHKmul3EFNcf/sHAuvpPtuKC7Kdgn46DinzFNHkqjcdkbmtxhMFeEpcePU/MJMabT3S2bmRpp6UMvk6esZwfQJ9B8B122uNLFiDOCtWePomnSKsTTYXdO1Yo0oaV5rjQ4Dmv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cXMLEsB6; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cXMLEsB6"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4903fd19957so14884835e9.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779466318; x=1780071118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GnOH4oi9MCTSp//zOnHHBdVKY0oDkBkYij1oiK/rQm8=;
        b=cXMLEsB6VZPT4ku0wpH99Nx8VCU43qjKJbY/fU8bYcAb9PziAB1F9U1QVBjutjl43B
         5rk2GyPfsQzbVSdzTZTg+tOrn4vFL2wrQDaiZdR7ARnLMRI7aj13hAKEvtApAFic0EFa
         ABJi5usREfEEaSMlifFxkpro0r4FHNuHHkcDnWY8aQqKfXJSUbIrAWxgmR89/+iE3PK4
         dUKAKUAuyNbZJBDFE5jfY2v+9f97SzCiPjhf5tMezUxs8mAr8/4Xte/0jg6O5gDuzljZ
         lvSv4Jhv1n5S8T54AnUKCQUcpZFMcOnxaNOkee/F8mJaIyADtouN1dlRMT727Vr+cjTP
         0kvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779466318; x=1780071118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GnOH4oi9MCTSp//zOnHHBdVKY0oDkBkYij1oiK/rQm8=;
        b=akZ8PebWL9EBAJcUe4z+CTgCB/BEJaF3BoBijTSRLVeNNWckvRLmN2aopwAq6HWWXZ
         kp+d8vsiVq0F8zkHrOSQFicOfgUy7CNqdwfgQZ5rXCWRSGFn5wscB2295PnNG4lk3+Xl
         CbwF6dCe6vxSV0JkZXJnTUcgT5XPJalIHlLbk5z9YYgUHJAJ/e5ZUtEVVy6mapGmH4/n
         HD7AdzM7dlHqms/MC2Dh6smxfIa4LIiR1812uovLEEgiZ8VsodZH0PRWg1zL2ffFI6if
         alO+d6ymdvWVCoWlMNcSDtW54z87eEgdkyc0uFTYe+Cb+wk+OH8PpSGd+fIUanMk1Qu5
         H5EA==
X-Forwarded-Encrypted: i=1; AFNElJ/AkoHYVZJZuJxtSRchek1q5Amz+SJSSTvnUhqrwwqnviFtTSXOuANr4O35ivweWnw9eNLwKeoSjZpZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyoRNwrWQfp6ys48uB4dIVCeO+WBi2/XFUbEJGbI3vraLdF0REn
	avLc/lM3neNl0VO7s7DJHYsf5A2lwdST1svGTEAEeOwiHmRiqWMeHk1p
X-Gm-Gg: Acq92OGLD9ez7096/P3ew0xOZXmIrUfTBk/FVcKLLYKbSF2CkBgY24Lkzhi+PNLgBA3
	IA27E2IGYXa7ooVj/gyCkBYXA7CbjZBYZ+jwZj+0J8Pk7jj1TsqQmDLUU8hw+IKFdtFVfOcYMlJ
	HSRojBs397/ygGZ5trtuM3SJFyae5XoEkckSujidYiv46D6e256f3UhYjbw810dul1iHNSpT2nO
	eLmfRWPl9sSwxhDsBCLO0m8U4AAuWOsbNxVKmI7IYq2ldw4saSHsrCi5kijD0xwtet3VwI79Byr
	WzVPU9z/++Gyb8awO0hmzGCajkvOrCu61nPzT2VQGcrWRLkcNmL8jV+Mo5RbFChyzP2OR4yoFm7
	wiuwLWkWrGGaWz7ITXEDTJXHLhBvxjb9h/H0wCB2goPAYzwIjeDsyQlFzZkM9Z8FGo7MxmMA7Ls
	aujmrPlfVo+IjUS2/mUlqgp+QYeLPyl4zWGMHsbP9+eg==
X-Received: by 2002:a05:600c:3e12:b0:490:40f1:5314 with SMTP id 5b1f17b1804b1-49042482845mr63876345e9.1.1779466317936;
        Fri, 22 May 2026 09:11:57 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b9asm51042755e9.11.2026.05.22.09.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 09:11:57 -0700 (PDT)
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
Subject: [PATCH v3 11/11] arm64: dts: ti: k3-am62-verdin: Add Mezzanine with Toradex Display 10.1" LVDS
Date: Fri, 22 May 2026 17:11:15 +0100
Message-ID: <20260522161105.277519-24-ivitro@gmail.com>
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
Changes in v3:
- Add missing regulator-name property on fixed regulators
- Simplify regulator labels
- Rename touch@ nodes to touchscreen@

Changes in v2:
- Use panel-simple compatible form

 arch/arm64/boot/dts/ti/Makefile               |  5 +
 ...mezzanine-panel-cap-touch-10inch-lvds.dtso | 98 +++++++++++++++++++
 2 files changed, 103 insertions(+)
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
index 000000000000..83fc4f3a24f5
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtso
@@ -0,0 +1,98 @@
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

