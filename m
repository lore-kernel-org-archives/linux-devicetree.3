Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9743DE425
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 11:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790855073; cv=none; b=sZdvX0c5QMXNI2LV4+pbOaagDA9CjY6AL9XhEpKMWv47/56k+lYMuoRsRo1SrutD4LSFKF9ixOGZ4ag/Z+i2nIfMYZMVcKZN91pa2+TjZnywZExIw89tdIh3mx90yjQ2hnVlGs3RZRYvDLJoLnX8FiOo0bZmMPfiddd3ZxFvuak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790855073; c=relaxed/simple;
	bh=xoVMNYf8Nwl/PKO/kO7Ryn4fBqZKSBGJV1JqBiyCp7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R1ZIOi6cMwDW3WFiYFce6QkDc54lALWgqKx29G1m7jwTK0TtivJ8dOBBz1AfpNEdgZKpp6b83qHvD01RfyS1MW5RLS/oPhBc9sGdIWX+mLSzCc4LymXG81el3o6Mt5bwXwfvCKgIxEuCHQ+HEhzWWbN4JpSTilY7NuPRI02P68o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FPJAzI7N; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FPJAzI7N"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48b01d89b23so1002106f8f.2
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 04:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790855060; x=1791459860; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LVQmS12MxXyX36+BsGMFjJITni/wBAXfD6G55zc4COE=;
        b=FPJAzI7NEb1hHnW9qn9aoXLMeSv5RdTIwjn/OgAdWKQkw5YOJkJN8y61cTKNVGGSjZ
         bWxgu029yKaAbMAIyGudp8w5eIVnDVAFMbdrQhTLfb1v+aGsr+H9QmbzhJH8L70ZChH+
         MGKocfCn/9OrF1mWwTtfqGtwZKT6uqMuuRebq5x3ilizXdNo+dxcP9CbAzvqZDdWFfny
         x5grA0fACnlB9EmBthFaCvhDZgAmydzkfbq7HEGS5eQg+E66Lx6ciFt5YswzXtaYAjN7
         LClJcZ7B6vy1T+ocMUyW+qNzU3hLOy9NLEVb9sODUmSFMJz9Xqim+0epq/Wetz4BrOJV
         4JFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790855060; x=1791459860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LVQmS12MxXyX36+BsGMFjJITni/wBAXfD6G55zc4COE=;
        b=GfZEFiXgiUKbBe1O0q4CRwcfDfDmPEM9DxqVjqS/fs/ZJ3v6FA6WkGhg/P9b51c3Pi
         5zzUx3YMnP1NH9ogmduzhkkynldyrt+jqtr5lvySow76SlleGVDIITRcc1AZekDxQzEJ
         gcAodFLAqc0e8Ua6E9LGOBs4dcnlbOWZ+d3OTE4VDreohPumeedhWlZLwVwRuzLS6uMO
         /sy6bgnmI381wzZoi+rC/WMeIZX270kz/cpcqfO4vEk1x6WthKQVN7SyxCi+lv4/m2EB
         BWF8lF3xDm1MudShDU8qBWt34GR4m66SPQNPZIlCN5zNdKIb4pjI670ns6KClT4dli66
         5Ssg==
X-Forwarded-Encrypted: i=1; AKwUvBzLYMEsmPgR6RXZZlWW1jV6CepdiNHmg5hJjANCasPtDTCVYtjCu8jJtvT5btYSOgWxWN32WWnoGQ/V@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4JistLr7ieN+BPxQ4Rf5jr5Vtbtt4tB75lenhtSw1Ceif8Gy2
	ozoYJSI13ohB5+eANeCEeGSayw7IvPr0nJ7yksnsGpLuP1MSUFO9jalH
X-Gm-Gg: AYBFou2BKM1UD6gudMawg7yqBwa4VUSTuGBkegx1Z3MbKOZnIVDXENfmHCA47lkvxzP
	9c6tNVEz8fvLp9zeOXHIyB2pFv44EfCBZJomgDFF34ynaZleR8M2BYsvP82EM0GvYCaSjK5MUNB
	ZD2RPLYCdrdjxHY6dnG+Mh7ITehcAjqg1WRw8ZmVefY292uDi8a+efrwx93XFwji3v0emS+/eKU
	optL8pJbreZE9FQNRRELP6uZrnIVfXJWOIm0xxXwYemNvz8mDbder5EcDV3tNpMvE1m7lVZTBiF
	EjA6a0KTCO/YdugzqTj84IXJUKFXElaprdBCN92vGoJ2ufIZ6I1/tSthpfqd9+iOI1vhfEkPK1c
	3HgadPzzSFZmqHKdFb+F3JGm2ft7yp4cDqHuWZeWmQCpVf/m/DLxVt4Jugnk7+0fT6waokIQMw5
	sdwrQzKElzUFrU46edn5pFDQdX9lWympVQfWXMKirvsZcr0d9bZ9nbXSnZ2ZNLvz62SZxSvzrIy
	A3bz291EFz7Fz5csw7e0d3N+jkkqgvE8BOLu/HSJUf2pehzJWUBTBzflEy5OP0+ellLr4Fr+w==
X-Received: by 2002:a5d:5846:0:b0:487:1575:ebef with SMTP id ffacd0b85a97d-48b025371fbmr9115810f8f.47.1790855059733;
        Thu, 01 Oct 2026 04:44:19 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b1035eff8sm1243705f8f.7.2026.10.01.04.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 04:44:19 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 01 Oct 2026 13:44:13 +0200
Subject: [PATCH v2 5/6] arm64: dts: freescale: imx8m{m,p}-verdin: Add
 shared OV5640 overlays
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-verdin-imx8mp-hmp-camera-ready-v2-5-7d1343ecd3ec@toradex.com>
References: <20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com>
In-Reply-To: <20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

The current and legacy Toradex OV5640 camera modules use the same connector
on Verdin iMX8M Mini and Verdin iMX8M Plus. Keeping SoC and carrier GPIO
references in the overlays would require a separate camera description for
every combination.

Use the connector nexus and stable CSI_1 media labels to describe the
camera once. Keep separate variants only for the current 27 MHz and legacy
24 MHz camera oscillators.

Build both DTBOs for installation and compose each with the two Verdin
Development Board DTBs to validate the module integrations.

Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             | 10 +++
 .../dts/freescale/imx8m-verdin-ov5640-24mhz.dtso   | 17 +++++
 .../boot/dts/freescale/imx8m-verdin-ov5640.dtsi    | 78 ++++++++++++++++++++++
 .../boot/dts/freescale/imx8m-verdin-ov5640.dtso    | 18 +++++
 4 files changed, 123 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 649be5b6aab4..d2422f1d692a 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -120,6 +120,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8dxl-hummingboard-telematics.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdp-mba8xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdps-mb-smarc-2.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8m-verdin-ov5640-24mhz.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8m-verdin-ov5640.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-beacon-kit.dtb
 
 imx8mm-data-modul-edm-sbc-overlay-cm4-dtbs := \
@@ -275,6 +277,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-nau8822-btl.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-ov5640-24mhz.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-ov5640.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-panel-cap-touch-7inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev.dtb
@@ -296,6 +300,8 @@ imx8mm-verdin-wifi-dev-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-ver
 imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := imx8mm-verdin-wifi-dev.dtb \
 	imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 imx8mm-verdin-wifi-dev-nau8822-btl-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dev-nau8822-btl.dtbo
+imx8mm-verdin-wifi-dev-ov5640-24mhz-dtbs := imx8mm-verdin-wifi-dev.dtb imx8m-verdin-ov5640-24mhz.dtbo
+imx8mm-verdin-wifi-dev-ov5640-dtbs := imx8mm-verdin-wifi-dev.dtb imx8m-verdin-ov5640.dtbo
 imx8mm-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := imx8mm-verdin-wifi-dev.dtb \
 	imx8mm-verdin-panel-cap-touch-7inch-dsi.dtbo
 imx8mm-verdin-wifi-dev-uart4-mcu-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-uart4-mcu.dtbo
@@ -751,6 +757,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.d
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-nau8822-btl.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-ov5640-24mhz.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-ov5640.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-panel-cap-touch-7inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
@@ -770,6 +778,8 @@ imx8mp-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := imx8mp-verdin-wifi-
 	imx8mp-verdin-panel-cap-touch-10inch-dsi.dtbo
 imx8mp-verdin-wifi-dev-dsi-to-hdmi-dtbs := imx8mp-verdin-wifi-dev.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
 imx8mp-verdin-wifi-dev-nau8822-btl-dtbs := imx8mp-verdin-wifi-dev.dtb imx8mp-verdin-dev-nau8822-btl.dtbo
+imx8mp-verdin-wifi-dev-ov5640-24mhz-dtbs := imx8mp-verdin-wifi-dev.dtb imx8m-verdin-ov5640-24mhz.dtbo
+imx8mp-verdin-wifi-dev-ov5640-dtbs := imx8mp-verdin-wifi-dev.dtb imx8m-verdin-ov5640.dtbo
 imx8mp-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := imx8mp-verdin-wifi-dev.dtb \
 	imx8mp-verdin-panel-cap-touch-7inch-dsi.dtbo
 imx8mp-verdin-wifi-yavia-dsi-to-hdmi-dtbs := imx8mp-verdin-wifi-yavia.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8m-verdin-ov5640-24mhz.dtso b/arch/arm64/boot/dts/freescale/imx8m-verdin-ov5640-24mhz.dtso
new file mode 100644
index 000000000000..af77c065c3c2
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8m-verdin-ov5640-24mhz.dtso
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Module 5MP OV5640 on Verdin CSI_1.
+ *
+ * https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx8m-verdin-ov5640.dtsi"
+
+&clk_ov5640_osc {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8m-verdin-ov5640.dtsi b/arch/arm64/boot/dts/freescale/imx8m-verdin-ov5640.dtsi
new file mode 100644
index 000000000000..39204a14f0d0
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8m-verdin-ov5640.dtsi
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Common device tree include for Toradex OV5640 CSI camera on Verdin CSI_1.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	clk_ov5640_osc: ov5640-xclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+
+	reg_ov5640: regulator-camera {
+		compatible = "regulator-fixed";
+		/* CAM_1_CON_PWRCTRL, pin 24 */
+		gpios = <&verdin_camera_connector 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-name = "V_CSI";
+		startup-delay-us = <5000>;
+	};
+};
+
+&verdin_csi_capture {
+	status = "okay";
+};
+
+/* Verdin I2C_4_CSI */
+&verdin_csi_i2c {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio5>, <&pinctrl_gpio6>;
+		clocks = <&clk_ov5640_osc>;
+		clock-names = "xclk";
+		AVDD-supply = <&reg_ov5640>;
+		DOVDD-supply = <&reg_ov5640>;
+		DVDD-supply = <&reg_ov5640>;
+		/* CAM_1_CON_PWRDWN, pin 22 */
+		powerdown-gpios = <&verdin_camera_connector 1 GPIO_ACTIVE_HIGH>;
+		/* CAM_1_CON_RST, pin 11 */
+		reset-gpios = <&verdin_camera_connector 0 GPIO_ACTIVE_LOW>;
+
+		port {
+			ov5640_to_verdin_csi_rx: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&verdin_csi_rx_in>;
+			};
+		};
+	};
+};
+
+&verdin_csi_rx {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			verdin_csi_rx_in: endpoint {
+				data-lanes = <1 2>;
+				remote-endpoint = <&ov5640_to_verdin_csi_rx>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8m-verdin-ov5640.dtso b/arch/arm64/boot/dts/freescale/imx8m-verdin-ov5640.dtso
new file mode 100644
index 000000000000..332811f53743
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8m-verdin-ov5640.dtso
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Set 5MP OV5640 on Verdin CSI_1.
+ *
+ * https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
+ * https://www.toradex.com/accessories/csi-camera-ov5640
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx8m-verdin-ov5640.dtsi"
+
+&clk_ov5640_osc {
+	clock-frequency = <27000000>;
+};

-- 
2.43.0

