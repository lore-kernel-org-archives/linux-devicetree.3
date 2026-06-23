Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A07364929
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 19:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782244725; cv=none; b=Ef3rzr8RctZhOEWA+3RMTfdvaCJp9Y8B1NfTMVck8mr5EA6TxEHFKG0Y1yGxho46sNXIftMQfiL0SZKsETCasa1O88UGEnuL6YZFWhIL38psfDfkn28GBDgh2E0BKEkN36AE75ECuMRq/n9+eJCEvhUMSwlQzG1TIzwLZBERbfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782244725; c=relaxed/simple;
	bh=+VfUy6yqSHsAmb5HtDKKx6bZtMFoflNBx6Z91ltD8F4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WeOOCOS2VJmX4TT2Crc/m7wtP6aSUh5iGcSSGRDpRiA/bCxQTz8RwYhVkqZyZEHa2WG/jwk4sadWqt+dY7SIvxRU1970xuRgYhgM7HLf6ctBdVAdqq5zZr+KSGwx+e6AlL1GsAkuDuei9UumcDXt8f6Od6nAtfKEjnqUMgr2r2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mP5Tku4R; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mP5Tku4R"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-13810b63a1aso584701c88.1
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 12:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782244723; x=1782849523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x+ayT+LJkMv8hQFHRH8PnvPGyJe7wiPGxkSAMM4IUpc=;
        b=mP5Tku4RR8D2+bSqLFTFJjskrGuhZukXUeSh1Ct0LB46GNVCr2y7Hu0lzVN0ldwBLE
         6gvuMCoWml3x2wdwgXGnGx9QA4hwqU/XrwBAjKJ04N8oOZz1fb9yWUEux+QG3PCUgIiu
         oixdctifUArCVduWAI5NKoUJKjufxVO/ejRmdY6K9A4EUMy3SnsdHpiQxdzquLUEryZY
         cV8yXq0EKY3SF6M2wgLVc3T0qatLqb8KQIy/u4bwZHa8pIKJvL1kj1xhR2/faQsK4Z2n
         KOyZddsFCt3oLoH0g7H+EZ3uU4GTXaPaxAAs6mwNcMKWcscKGgK8be7jaOFgCpKCEf+n
         bgEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782244723; x=1782849523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x+ayT+LJkMv8hQFHRH8PnvPGyJe7wiPGxkSAMM4IUpc=;
        b=S+H2gS1WYqmqtPgzpaYqC0Xgm5l+NODwaEKLbY2JJFRHm9HIzTvJBXmazcmDGb4f8P
         IP7l9ZW0KrdOXi900ji5p88zoDT1fnjOZzc7EJgG0gEvgKlb2u0ovkIAi1lobQrHe68C
         +cnX7dwiSEEKKpBF+SFBDui/6mTDs3HZQi9m+9xeqhrpm+muQRFRkZWxMqVKJYTULgbb
         9z0D8FTf7iVVa3WfB9/hnvBIAc8Ula18x/qBaezxqO7HuJrUPHCeMYMJYvOE/5PERYdF
         MJ/ebQowCergQPerV6m9m+Qjn3rOG2UsF4dbkBm1rJKbqOBBvJt+39IKQ39Ap8Lv8L+9
         fpWQ==
X-Forwarded-Encrypted: i=1; AFNElJ8phiP5RFiGS+1wYzF25/z+VAY5shuJe1X3kfb82IMc2frnbvb9J01a6bTBPssQ4yLRY/uZqfTADdqt@vger.kernel.org
X-Gm-Message-State: AOJu0YxiuyWhlyswGCo+C1soZrgGxnVeES4Jn5VNC8zfbAZUHJRHcKVk
	fU08k8TlJXqxVoA1ObI2f0J+jFn4+RwZsvLAq/oBFzdYFMohO9Upj8j5
X-Gm-Gg: AfdE7cnZfxIdT0OnZUk5E4+E7psIEQGfdeseC/TIXRriqHnu9BlKqFV03tAw1g/LRdB
	GDKcbp0IBX/I4wjRiBu7MlMTImELwhI6iAzn1nLnN/T2zX4vDbm+IMOTWJ2bRFTXvx0S95HDAoG
	POJXlCQRAYHW1bjqvDKqZ8+PfgTUvBrWSa/GbdrycsAU0Y/Sa3NgxvOZD0PGQiY/nSTcNOpOg/l
	QR6JhAgXaDpau9eyghoH5WT90xcu7avq2Aqk0J0RAXvLfkDmzU0fsK+4Yi94eYkNEGhgkYBqBm7
	O6QY3JL2v0MjGyGvUqtjC5+9KwDHyQEC4+HdvMylbzebz9tx/TMTq0bfT58lSIHOW8l1CJ9+Qcq
	5NdiCQDTHlHnDnuUmj1RZ/kTbMJ5b3P+JWv3CsWIVA7sBI4Y+ge6VY+ChTrsB7xnAEgyjItiVvi
	LzBVZWiZADK25c8K9OTqc4oEJj0hKzfYZEqfcRt5rnILmL5S5KJjidzuV/PyGwSuT4V6ZwznpiH
	ezAP3UlkNvKb/uCSsdp8Xc2+2W9DeUhiF+gw+OZxIo=
X-Received: by 2002:a05:7022:3d83:b0:128:d4be:7438 with SMTP id a92af1059eb24-139ad71294emr13401781c88.30.1782244723303;
        Tue, 23 Jun 2026 12:58:43 -0700 (PDT)
Received: from leonardoc-nb (201-68-197-145.dsl.telesp.net.br. [201.68.197.145])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139add85c40sm15730896c88.15.2026.06.23.12.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 12:58:42 -0700 (PDT)
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
Subject: [PATCH 4/5] arm64: dts: ti: k3-am62-verdin: Add Toradex DSI to LVDS adapter with the 10.1" V2 display
Date: Tue, 23 Jun 2026 16:57:40 -0300
Message-ID: <20260623195741.495734-5-leoreis.costa@gmail.com>
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
 arch/arm64/boot/dts/ti/Makefile               |   5 +
 ...dsi-to-lvds-v2-panel-cap-touch-10inch.dtso | 143 ++++++++++++++++++
 2 files changed, 148 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 61ae9039e561d..8b90fef11cb32 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -34,6 +34,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lv
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dev-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-dahlia.dtb
@@ -231,6 +232,9 @@ k3-am625-sk-hdmi-audio-dtbs := k3-am625-sk.dtb k3-am62x-sk-hdmi-audio.dtbo
 k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
 	k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
+k3-am625-verdin-wifi-dev-dsi-to-lvds-v2-panel-cap-touch-10inch-dtbs := \
+	k3-am625-verdin-wifi-dev.dtb \
+	k3-am625-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtbo
 k3-am625-verdin-wifi-dev-mezzanine-can-dtbs := k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-dev-mezzanine-can.dtbo
 k3-am625-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds-dtbs := \
@@ -355,6 +359,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-sk-csi2-tevi-ov5640.dtb \
 	k3-am625-sk-hdmi-audio.dtb \
 	k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb \
+	k3-am625-verdin-wifi-dev-dsi-to-lvds-v2-panel-cap-touch-10inch.dtb \
 	k3-am625-verdin-wifi-dev-mezzanine-can.dtb \
 	k3-am625-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds.dtb \
 	k3-am625-verdin-wifi-dev-nau8822-btl.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso
new file mode 100644
index 0000000000000..dba0b6b9f02db
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso
@@ -0,0 +1,143 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex DSI to LVDS Adapter on Verdin DSI_1 with Capacitive Touch Display 10.1"
+ * Used on Dahlia (X17) and Development Board (X48) that expose DSI_1 via an
+ * Samtec LSS-130 connector.
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
+		pinctrl-0 = <&pinctrl_i2s_2_d_out_gpio>;
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		/* Verdin I2S_2_D_OUT as GPIO (SODIMM 46) */
+		enable-gpios = <&main_gpio0 34 GPIO_ACTIVE_HIGH>;
+		power-supply = <&reg_3v3>;
+		/* Verdin PWM_3_DSI (SODIMM 19) */
+		pwms = <&epwm1 0 6666667 0>;
+	};
+
+	panel-lvds-bridge {
+		compatible = "optologic,scx1001511ggc49", "panel-lvds";
+		backlight = <&backlight_pwm3>;
+		data-mapping = "vesa-24";
+		height-mm = <136>;
+		width-mm = <217>;
+
+		/*
+		 * The timings here are different from the nominal ones for the
+		 * SCX1001511GGC49 display. They are adjusted to ensure that
+		 * the Horizontal Front Porch is long enough for the Verdin
+		 * AM62 DPI->DSI bridge (Toshiba TC358768) to enter/exit LP
+		 * mode. This is required for the display pipeline to work
+		 * correctly.
+		 */
+		panel-timing {
+			clock-frequency = <69500000>;
+			hactive = <1280>;
+			hback-porch = <20>;
+			hfront-porch = <100>;
+			hsync-len = <24>;
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
+};
+
+&dsi_bridge {
+	status = "okay";
+};
+
+&dsi_bridge_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	port@1 {
+		reg = <1>;
+
+		dsi_bridge_out: endpoint {
+			remote-endpoint = <&dsi_lvds_bridge_in>;
+		};
+	};
+};
+
+&dss {
+	status = "okay";
+};
+
+/* Verdin I2C_1 */
+&main_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	bridge@2c {
+		compatible = "ti,sn65dsi84";
+		reg = <0x2c>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_dsi1_bkl_en>;
+		/* Verdin GPIO_10_DSI (SODIMM 21) - DSI_1_BKL_EN */
+		enable-gpios = <&main_gpio0 30 GPIO_ACTIVE_HIGH>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				dsi_lvds_bridge_in: endpoint {
+					remote-endpoint = <&dsi_bridge_out>;
+					data-lanes = <1 2 3 4>;
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
+		compatible = "ilitek,ili251x";
+		reg = <0x41>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_dsi1_int>, <&pinctrl_i2s_2_bclk_gpio>;
+		/* Verdin GPIO_9_DSI (SODIMM 17) - TOUCH_INT# */
+		interrupt-parent = <&main_gpio1>;
+		interrupts = <49 IRQ_TYPE_EDGE_RISING>;
+		/* Verdin I2S_2_BCLK (SODIMM 42) - TOUCH_RESET# */
+		reset-gpios = <&main_gpio0 35 GPIO_ACTIVE_LOW>;
+	};
+};
