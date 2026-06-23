Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FC238887C
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 19:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782244719; cv=none; b=GemQtbSpor0gF9MAt+IVZL47gtwdcaUH7vpMTFdlCoPoy8KGfj2LC5jUh00OwU26Ac61V2EurO0/hCfZFepdaSdV22CfFTbxDHxgWQByB0boZGS++fJQSLTFKVlUmuy15pR1Hp4G+1EHIc9dUkL0A9zPOzFfkbjr0tLzuUt7eEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782244719; c=relaxed/simple;
	bh=N1ulM1PAntlT6Qfn1yAQeXu+OY0pigboH9QHb4DCIE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FJn+7Uqk+FqQmtOzC/Q80UmMSS967g5qtodtSwlMiJKm87jTJpOf3hoRTAUaAz5DhzH1I6We67ID+xm7Jwd0bZreHKZdG6WsKmcFuulsZYFm5vRi+wODqqEh5ygAAuMkp+5UOjn+2NUY8p9qe0qhAHB/PCO9WCjpUzDn2SGrWCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oPNv/bEv; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oPNv/bEv"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-13809223fd4so286052c88.1
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 12:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782244717; x=1782849517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uq8bbh6aLPw7xItUXqYkRP3ERWtfg5d1F8ZxaWAUzYU=;
        b=oPNv/bEvJM1NZ4JjvKsZZmWp93fZ0xXEgzwVxOaJv2mjY7dY70/MZ/p34qruAxogUk
         zXeyBGhUkCoeXK+am8wiNWWKfx3LlhaXu7ZEgB3iO8j7rNU05Xfcv+Aznw33Wzn7JJLb
         ClDKMLEZY3C1luWG6EIkSKS+cePs6LcPC6hJ8kE578hvsXnRc2YT9VXifvRtj6k++1sS
         g0L3qsr24T3PJe7nh4OJt8AN/Qs1XtEFsAquttvy/VZIRLkiHw4VfZobYJVSPfhAaKY9
         uCo/UYzZWCIInw4yc1tCt1bSQTsgN2pX7jRzF5znPmySkK1z8nN9puSXDyDcCMaca7Pv
         Rwww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782244717; x=1782849517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uq8bbh6aLPw7xItUXqYkRP3ERWtfg5d1F8ZxaWAUzYU=;
        b=b3v0yhuQoRDnY4H9yDX9vR6cgKkF6bYmt/xMPkRm1rniJQwfW90u0TplG6UMvoaHVh
         W+CfKNQ0e/IN0h1Qjf0iYrgb5cWsWsnldg4DHAihFFd6UrpnQI9SbrB66/xlYsnHtXcl
         z1ZiXtVv0O1L21Kbrr5DEbcmSrFixUdu0fzqFgPfX2qSTgkLrnGw66Cin4VsuT+3nUpx
         6yZwg6VmoY1gC9wEWSaHnm+OTOD9F9iWhdols/8qWCMRtsG33Yen4sudJScQwaYkeWsz
         4IqM9q75sh2kyqakNRttIeBm+VS/9X2GCVagIqO45QBBlGRmPKamEfJ2CD3C60/nVTaS
         u8hQ==
X-Forwarded-Encrypted: i=1; AFNElJ/myy0Nx8oPZ3kG6l93gx4yKCEQdRVgmIslwIGwXknLRoZF/rrR0DgYy+vy2/k2ICdz3Qb0u/5Bxcxc@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2cdet+t7z0gt9vhU8hTgXCYI11k5gEz/9n0BO+el8QVs5HinW
	Rj8+lhYQCVMa6zlOCkJgEOziZTKv35mshaLf8DCPBvxvqVqUGS0cf963
X-Gm-Gg: AfdE7cn0zfO+cZhcPjjk8WFlqhWMZT+2wWyX2RkPiwHmPkVz5n3zx3M7HjYv9h8QY40
	LnXURqKaC8QUoMDCLiWGLO/sYYSrn62eeSxTunj9UdGLwyTbTWz1PHf1QmCX92uHMRaJH2ScgDM
	v/RHt8KNMFq9ZPilMClOPEO62wb8OYI5odhIHtTorAbRzdeQUUADcC1Vb5FHsoxJqZU8w21gN4l
	29oQ0yZAO+1v20FAOeicxCsTjWXvsNxQB3as7JaqqaNlEHYm5muvgzwaIck6hv0+UjY6L+J4zt9
	Yg/bOeuh2VFa+0lYuFNjeAkBIKCxDR2jpC9wBcgQBwRbaLDS6GVX+w7q7tCm92SBVYXO5LQq2gj
	OIxYwH79R1J9h0U/ksEmgyyNzdcJLdU3kEtNBUFle0k2jmoUhF0+avIVVOGThNyGL/W0LEg/GXk
	yvjM4ZS7kSdV6giwK9CIB/Q4xpIQszflMbgxUj2REbyT94OF4t0VmWBKzWXS7eJDC2S2NUCUSUN
	V5ft8xqayRM8wVVqMEq0ZDadkEvz21ghy8feJyo1Ng=
X-Received: by 2002:a05:7022:203:b0:132:5d31:dcb4 with SMTP id a92af1059eb24-139d0c780a0mr163196c88.23.1782244716536;
        Tue, 23 Jun 2026 12:58:36 -0700 (PDT)
Received: from leonardoc-nb (201-68-197-145.dsl.telesp.net.br. [201.68.197.145])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139add85c40sm15730896c88.15.2026.06.23.12.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 12:58:36 -0700 (PDT)
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
Subject: [PATCH 3/5] arm64: dts: ti: k3-am62-verdin: Add Toradex Capacitive Touch Display 10.1" LVDS V2
Date: Tue, 23 Jun 2026 16:57:39 -0300
Message-ID: <20260623195741.495734-4-leoreis.costa@gmail.com>
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

Add a device tree overlay for the Toradex Capacitive Touch Display 10.1"
LVDS V2 connected via Verdin AM62 OLDI on carrier boards exposing LVDS
interface (e.g., Mallow). The panel is an Opto Logic SCX1001511GGC49 10.1"
WXGA TFT LCD and the touch input is provided by an ILITEK ILI251x
capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   5 +
 ...verdin-panel-cap-touch-10inch-lvds-v2.dtso | 129 ++++++++++++++++++
 2 files changed, 134 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds-v2.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 371f9a043fe52..61ae9039e561d 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -47,6 +47,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-ov5640-24mhz.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-ov5640.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-10inch-lvds.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-10inch-lvds-v2.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-7inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-uart4-mcu.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia-dsi-to-hdmi.dtb
@@ -249,6 +250,9 @@ k3-am625-verdin-wifi-dev-uart4-mcu-dtbs := k3-am625-verdin-wifi-dev.dtb \
 k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds-dtbs := \
 	k3-am625-verdin-wifi-mallow.dtb \
 	k3-am625-verdin-panel-cap-touch-10inch-lvds.dtbo
+k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds-v2-dtbs := \
+	k3-am625-verdin-wifi-mallow.dtb \
+	k3-am625-verdin-panel-cap-touch-10inch-lvds-v2.dtbo
 k3-am62-lp-sk-hdmi-audio-dtbs := k3-am62-lp-sk.dtb k3-am62x-sk-hdmi-audio.dtbo
 k3-am62-lp-sk-nand-dtbs := k3-am62-lp-sk.dtb k3-am62-lp-sk-nand.dtbo
 k3-am62a7-phyboard-lyra-disable-eth-phy-dtbs := k3-am62a7-phyboard-lyra-rdk.dtb \
@@ -359,6 +363,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-verdin-wifi-dev-panel-cap-touch-7inch-dsi.dtb \
 	k3-am625-verdin-wifi-dev-uart4-mcu.dtb \
 	k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds.dtb \
+	k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds-v2.dtb \
 	k3-am62-lp-sk-hdmi-audio.dtb \
 	k3-am62-lp-sk-nand.dtb \
 	k3-am62a7-phyboard-lyra-disable-eth-phy.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds-v2.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds-v2.dtso
new file mode 100644
index 0000000000000..3ea8ccb8bff99
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds-v2.dtso
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" V2 connected via Verdin AM62 OLDI
+ * on carrier boards with a Toradex standard LVDS display connector
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
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2s_2_d_in_gpio>,
+			    <&pinctrl_i2s_2_sync_gpio>;
+		/* Verdin I2S_2_SYNC as GPIO (SODIMM 44) */
+		interrupt-parent = <&main_gpio0>;
+		interrupts = <37 IRQ_TYPE_EDGE_RISING>;
+		/* Verdin I2S_2_D_IN as GPIO(SODIMM 48) */
+		reset-gpios = <&main_gpio0 33 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&main_pmx0 {
+	pinctrl_i2s_2_d_in_gpio: main-gpio0-33-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x0088, PIN_INPUT, 7) /* (L24) GPMC0_OEn_REn.GPIO0_33 */ /* SODIMM 48 */
+		>;
+	};
+
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
