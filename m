Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB66364929
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 19:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782244733; cv=none; b=evg3NWKkXIWx074cRjNBKrd2l4TjJVl+9n1q1C27TAAO8Yg/oAPksn7Tr/ibaf2qi1PS2JlEaSqSMxvsZvv7poIslYlMxB6OmU+Q/Y8IFkAptk+EFoxQOOoz+BcKsNJ/FJrjvpL+oIfAzNHMGQLmtStzUNn9ivCfryCcgHp2bpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782244733; c=relaxed/simple;
	bh=kM7d9SV6QNOltIRHOIODYyEdnqbe1vu+aFQuV1XO2RM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dUmfHUzfjeeGOBisXw8urhJeW3uKH51o7pjMk6k99w5vLsnQwrzpj9//E3fouhWIsGu8PLj5iwBaEqVrl/ypXcoZ3V4hsX1I0FFc2aLFW8UO7XNMicHnepeNpXgo06E5AV+wUdQJ0sT3k5T5/b1owO/7/6HjXbFJXymIUHxiv3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mc5hWOpG; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mc5hWOpG"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-13986d61b4eso297875c88.0
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 12:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782244731; x=1782849531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/fp9uYhKIZVODXjBwNwAyAJlbCISy/3icMoMCSqHfo=;
        b=Mc5hWOpGGFfcBwF6OHYOgBFBZ905dsulZbtob6ENf5m08hb2tg4BJMKjA9c5WVo4vE
         iFJVeGAbs8o9XwTciIyiHW7zdJBgR7GwZMqtWVnGs6CLONtd8tUvdF/sBFzq0t5nU7HB
         jHONkOoA9WLTwIU9bU+DX0XnbfJ4DqzAQumHDOO8j7IPkotOzez3cKF69z+XZyno+C4k
         HdsM8N0dnAQo8HtKCv6MpXXsoRTMUGusQBp7hhOI21aEqPtn7Ktw8STfJ1ca48VNvsIx
         UIrv2ltoOb6cyUwEvzd175/lBLQZKC8VbHf1U4F/MFOzilxgwEEQV1/1htjElvYpw6t4
         HW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782244731; x=1782849531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z/fp9uYhKIZVODXjBwNwAyAJlbCISy/3icMoMCSqHfo=;
        b=ncGBD5rbhmSlOJYUxGJRxhtlvj6/aF3JKUT5ih5q6X8WUbDHyM/6n4CFmK0FwK+C7L
         gfIu4BAgiOkcj4SwI23R0hwx/3FZV/1Kk+D6SUjCAyPtL91PMvMdy1DyrJ/PfWyJ7nWL
         wG4extIzi2Kc90/Do309TSpeFi4GZ1kV+yRNy3Z6tVUTxIiadKRjLoP4Y3/bOK7eKiwy
         K8/zHOPTbIqcIac2d60eOUyNOePld+DukBVteakT+YUKWx44y4OUUa6LTCbz1cIxCkQb
         0H/08Qg6pdR8dwTy+/scl+KbuIVp6SIYktrFqeig17QfyrYCQB553tKqoXyevCq+0yTm
         em/g==
X-Forwarded-Encrypted: i=1; AFNElJ/UqCC9SvP/hkeKtDgJ2rctHynBuQg7HVd8bY8tdKObpPxyr7016cQuw42ZpqRxzQxpKnAj2VIkUXZX@vger.kernel.org
X-Gm-Message-State: AOJu0YwB0JNkrZH0oCEWG3pbKIwJ6LTqa6bOkZ5bP9Nkgyr/5+ClDETs
	amukiN6X/3KDpOfoSQ0ieizUdny1c6eD0LvqYikTaXLKi5AtyNrlCE9P
X-Gm-Gg: AfdE7ckjYlw7shnEvhVuZSlYYBEFgvRMF4uHoLt4ki4/xUR3GoTeYdbQ21rMPMOvC/n
	ic8YGcmnM3rvqGUYxJ1fSRRyjP/MhnbcVyhnlLy88s5k0ciQRI253sX0gxwVOTM5NGAX2cD2s0g
	tNOiXT/RRJDDz94HR78E6OTlaoLbR4jfKrk0QfUkcDULnSaTJ4w/ojFfDy1E2HcbKgCrBaG7SQS
	32e2yxEXx8R/MVtgdcXZAjCdnEmKINVXXXp/mi6mQC31sH03TCgtl/n8NKA/r05RqmcOt9RLGoO
	X+Jh02uAiwWa4XV5GvQbC3A4acCkvM5hLY72ydYZXn+9wkZmcMcaH527ETO0QY5LT+XlGgKDOWa
	MS28V1NgD89ilRntOQNLKCHVCoMj9/GaKKNm5eIPcWPKYsEgD8eSYUNO3JGyBCiKLwXjmZtc37R
	EU1JFuynAGPYAQ5twNfjpk/6NQGhMUeypy1GpY0mmzftbxEF1RGKKdpJXPIGUGTQPsEnqv7ivSD
	AyFEj/7GRvEodFapVgL+YOvijGukeoHIaSOScwAdJA=
X-Received: by 2002:a05:7022:4397:b0:138:5ae:3eaa with SMTP id a92af1059eb24-139ad6961c2mr13263116c88.9.1782244731170;
        Tue, 23 Jun 2026 12:58:51 -0700 (PDT)
Received: from leonardoc-nb (201-68-197-145.dsl.telesp.net.br. [201.68.197.145])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139add85c40sm15730896c88.15.2026.06.23.12.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 12:58:50 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: laurent.pinchart@ideasonboard.com,
	neil.armstrong@linaro.org,
	jesszhan0024@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nm@ti.com,
	vigneshr@ti.com,
	kristo@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	thierry.reding@gmail.com,
	sam@ravnborg.org
Cc: leonardo.costa@toradex.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 5/5] arm64: dts: ti: k3-am62-verdin: Add Mezzanine with Toradex Display 10.1" LVDS
Date: Tue, 23 Jun 2026 16:57:41 -0300
Message-ID: <20260623195741.495734-6-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260623195741.495734-1-leoreis.costa@gmail.com>
References: <20260623195741.495734-1-leoreis.costa@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay enabling the Toradex Capacitive Touch Display
10.1" LVDS V2 on the Verdin Development Board with Verdin AM62 Mezzanine
expansion board. The panel connects via the AM62 OLDI0 on the Mezzanine
LVDS interface (J10). The panel is an Opto Logic SCX1001511GGC49 10.1" WXGA
TFT LCD LVDS and the touch input is provided by an ILITEK ILI251x
capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   5 +
 ...zanine-panel-cap-touch-10inch-lvds-v2.dtso | 109 ++++++++++++++++++
 2 files changed, 114 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 8b90fef11cb32..d9e0b1b80b28d 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -31,6 +31,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-tqma62xx-mba62xx.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dev-mezzanine-can.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dev-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
@@ -240,6 +241,9 @@ k3-am625-verdin-wifi-dev-mezzanine-can-dtbs := k3-am625-verdin-wifi-dev.dtb \
 k3-am625-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds-dtbs := \
 	k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtbo
+k3-am625-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds-v2-dtbs := \
+	k3-am625-verdin-wifi-dev.dtb \
+	k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtbo
 k3-am625-verdin-wifi-dev-nau8822-btl-dtbs := k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-dev-nau8822-btl.dtbo
 k3-am625-verdin-wifi-dev-ov5640-24mhz-dtbs := k3-am625-verdin-wifi-dev.dtb \
@@ -362,6 +366,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-verdin-wifi-dev-dsi-to-lvds-v2-panel-cap-touch-10inch.dtb \
 	k3-am625-verdin-wifi-dev-mezzanine-can.dtb \
 	k3-am625-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds.dtb \
+	k3-am625-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtb \
 	k3-am625-verdin-wifi-dev-nau8822-btl.dtb \
 	k3-am625-verdin-wifi-dev-ov5640-24mhz.dtb \
 	k3-am625-verdin-wifi-dev-ov5640.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtso
new file mode 100644
index 0000000000000..26f6715463986
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtso
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" LVDS V2 on the Verdin AM62 Mezzanine
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
+		pwms = <&epwm0 1 6666667 0>;
+	};
+
+	panel-lvds-native {
+		compatible = "optologic,scx1001511ggc49", "panel-lvds";
+		backlight = <&backlight_pwm2>;
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
+	touchscreen@41 {
+		compatible = "ilitek,ili251x";
+		reg = <0x41>;
+		/* Verdin GPIO_3 (SODIMM 210) - LVDS_TOUCH_INT# */
+		interrupt-parent = <&mcu_gpio0>;
+		interrupts = <3 IRQ_TYPE_EDGE_RISING>;
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
