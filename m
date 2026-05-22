Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701D247D93A
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 16:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779466318; cv=none; b=QB3SMUdxIUxftQq5RJjzNrjOESyL+BgYon6Qjo5/JolUMcvNOJnwBW4LZk93sD2OjkeI9xu1wbTGIjQUFXohz/c2MACjqQQiIVGD43VYVoRz2ZxbiIV8AEEYMahiswIkSZomGi4G234sTHGL1jYyEWoPUa41UT8AOegjyDXGhFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779466318; c=relaxed/simple;
	bh=vJESy1X8rlrW07EdS/28NqbbyU2RYVCPUBBA2VtwdC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cxSTu2gQyKVej/HjxGpdqS//KBUKsYmpXweLEESlOMc4zo82q7AyEcQdqxRYUchumnHsc0dix83GhIs5pHIMmxukWrd9YAVdctcDLeqLVblWS296dUtTydxV3QOCHPoyUt1lyFQE39JzjpMUctE2AeGqqTdwiiiEj944PhG0M5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QRx5wnaA; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QRx5wnaA"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490426d72f7so9559815e9.3
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779466315; x=1780071115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=feqCuYJiSrJNV96kUr6v72Q4V4YTTvof+UmoeS01S+w=;
        b=QRx5wnaApFvWzDoppG+UlwVg2kXyJmUGsVypQGcbcHdF8AeoIUU80/6q1d0DC+XVcy
         oObtuUgVzRoGsU422GCDe6w/83jmexkGD5efVKpgl5hNv7TaTLJQ7I1lu1TUwfwqIkjt
         kTAtAVaLG+NnvY80XNWN2fn3YQZLP5nSyj5Kj2BuWEnSxLBWsCcjjkpg+xV+IHc6Th/H
         FB4Qpgb+ONHaisT2hydn/BjI/lFGXS7s+HwYZFWSab7k24Ic3Nh8hqBSIQ00i2Cv9dN/
         L0HZGGpirDuXJLVzuNmJgsko8hSBWlSvOjgkVEeEt3dlzqgcU4ytQTgHFScBhCBZcG0H
         VRMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779466315; x=1780071115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=feqCuYJiSrJNV96kUr6v72Q4V4YTTvof+UmoeS01S+w=;
        b=ZBmPhomqEPNW0k2QkdGQDAs9i0/GgaGB1DxhNfQgTKm5cxYwtKasFVv+XbKBQbze7Z
         RnEjTL9BmzElES+tSnevySE0GrNfaB5XP7FMU7PrLTYrONETsgkeQVyKFG8sGneBkcwb
         SSG5d2yfZ5YD+5FqojAzIcAz+9xmrga1zw/LuJuUMRSQmBxqFs9oyzeY3t8JnjXeWEHC
         vwPgrX+Yzayg6E324qIGXWkf/lvz5WLPnr7lazmDZbsQiEuhDJ2bfUKRfIU5k7sGmWC1
         gCKU2Ix5jHRWfuI4tQgXxdQsC8CS/DlA/mvkZ+T/Qjj3ZBI7hbIUg++4WAWaNl/0ewxV
         dC7g==
X-Forwarded-Encrypted: i=1; AFNElJ9X7s80nJfJHbQGYucWtif+FigFfhswsFy4DjUEC1frW6T1k0Uc1+fGAzGFh8QP1LfdDZEMdz6elKFj@vger.kernel.org
X-Gm-Message-State: AOJu0YwQombPp3vQv1dKjrKzuxQqBUVJ1WwDODTl+dnKxzYqIgz0F5XG
	3ESB/aWmhfTWXYYrFMcgrMCcnXD0KkOx6kueZ+JB7Tx2T0D3Ul0xa1RW
X-Gm-Gg: Acq92OFEYHF9V+R3fFaT87mkwvpZ7zdiHOP2ffkAAf5tcNRtBeeedY8sLIrNxka/LKd
	ZKbMfDR9vndKxUBsdiar+iFODDyPA+C2pclg4V8ddA8iiMz3YUofq0FroCocUNiwj+yGJRrxOs6
	/UMUKloOs8mFoeUicdvwY0WAjKejhQjh1GP+7AUPGXaFzi0oa98ZwPJjZBxcJtfGvnRgSN4N788
	qIkbp4vDQj15W5LzG6z5+QO4/HslHkpDrMtT6nqveHljA/JcIg4rJUlCCsgHHopIMpCh6nbjiAu
	Xzp1a+Q/AnavAtRHhsEkxN3wovUhjli6cg0ENAXKkYRrKT/oDraQ2Z0eExEW1KIFravg4dQtRcv
	GxekRqmuJLKAfCgL/1l1ADuNcrxKfn1w1BReT+3gVDnqqaD7nb6aFRmUtSczpW5heYaYQEiRwaD
	JanqktFvlXw1EgMSIWA4WzrzIJi9E246LfxU5PSu5h9w==
X-Received: by 2002:a05:600c:4ecc:b0:488:a824:fdff with SMTP id 5b1f17b1804b1-490426d190cmr61481075e9.22.1779466314619;
        Fri, 22 May 2026 09:11:54 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b9asm51042755e9.11.2026.05.22.09.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 09:11:54 -0700 (PDT)
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
Subject: [PATCH v3 09/11] arm64: dts: ti: k3-am62-verdin: Add Toradex OV5640 CSI Cameras
Date: Fri, 22 May 2026 17:11:13 +0100
Message-ID: <20260522161105.277519-22-ivitro@gmail.com>
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

Add device tree overlays for the Toradex OV5640 CSI Cameras on Verdin
CSI_1. Two variants are supported: the current CSI Camera Set 5MP OV5640
with a 27 MHz oscillator and the legacy CSI Camera Module 5MP OV5640
with a 24 MHz oscillator.

Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile               |  8 +++
 .../dts/ti/k3-am625-verdin-ov5640-24mhz.dtso  | 17 +++++
 .../boot/dts/ti/k3-am625-verdin-ov5640.dtsi   | 71 +++++++++++++++++++
 .../boot/dts/ti/k3-am625-verdin-ov5640.dtso   | 18 +++++
 4 files changed, 114 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-ov5640-24mhz.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-ov5640.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-ov5640.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 31c9bc1d48b1..60844951c9ce 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -41,6 +41,8 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-zinnia.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-ov5640-24mhz.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-ov5640.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-10inch-lvds.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-7inch-dsi.dtbo
@@ -228,6 +230,10 @@ k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
 	k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 k3-am625-verdin-wifi-dev-nau8822-btl-dtbs := k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-dev-nau8822-btl.dtbo
+k3-am625-verdin-wifi-dev-ov5640-24mhz-dtbs := k3-am625-verdin-wifi-dev.dtb \
+	k3-am625-verdin-ov5640-24mhz.dtbo
+k3-am625-verdin-wifi-dev-ov5640-dtbs := k3-am625-verdin-wifi-dev.dtb \
+	k3-am625-verdin-ov5640.dtbo
 k3-am625-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := \
 	k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-panel-cap-touch-7inch-dsi.dtbo
@@ -339,6 +345,8 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-sk-hdmi-audio.dtb \
 	k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb \
 	k3-am625-verdin-wifi-dev-nau8822-btl.dtb \
+	k3-am625-verdin-wifi-dev-ov5640-24mhz.dtb \
+	k3-am625-verdin-wifi-dev-ov5640.dtb \
 	k3-am625-verdin-wifi-dev-panel-cap-touch-7inch-dsi.dtb \
 	k3-am625-verdin-wifi-dev-uart4-mcu.dtb \
 	k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-ov5640-24mhz.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-ov5640-24mhz.dtso
new file mode 100644
index 000000000000..7089336fa5b4
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-ov5640-24mhz.dtso
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
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
+#include "k3-am625-verdin-ov5640.dtsi"
+
+&clk_ov5640_osc {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-ov5640.dtsi b/arch/arm64/boot/dts/ti/k3-am625-verdin-ov5640.dtsi
new file mode 100644
index 000000000000..eb3df9d85517
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-ov5640.dtsi
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
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
+	regulator_camera: regulator-camera {
+		compatible = "regulator-fixed";
+		/* Verdin GPIO_8_CSI (SODIMM 222) - CAM_1_CON_PWRCTRL */
+		gpio = <&main_gpio0 42 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-name = "V_CSI";
+		startup-delay-us = <5000>;
+	};
+};
+
+&csi0_port0 {
+	status = "okay";
+
+	csi2rx0_in_sensor: endpoint {
+		remote-endpoint = <&csi2_cam0>;
+		bus-type = <4>; /* CSI2 DPHY */
+		clock-lanes = <0>;
+		data-lanes = <1 2>;
+	};
+};
+
+&dphy0 {
+	status = "okay";
+};
+
+&main_i2c3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+
+		clocks = <&clk_ov5640_osc>;
+		clock-names = "xclk";
+		AVDD-supply = <&regulator_camera>;
+		DOVDD-supply = <&regulator_camera>;
+		DVDD-supply = <&regulator_camera>;
+		/* Verdin GPIO_6 (SODIMM 218) - CAM_1_CON_PWRDWN */
+		powerdown-gpios = <&main_gpio0 36 GPIO_ACTIVE_HIGH>;
+		/* Verdin GPIO_5 (SODIMM 216) - CAM_1_CON_RST */
+		reset-gpios = <&main_gpio0 40 GPIO_ACTIVE_LOW>;
+
+		port {
+			csi2_cam0: endpoint {
+				remote-endpoint = <&csi2rx0_in_sensor>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
+
+&ti_csi2rx0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-ov5640.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-ov5640.dtso
new file mode 100644
index 000000000000..e7f02cfaa94f
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-ov5640.dtso
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
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
+#include "k3-am625-verdin-ov5640.dtsi"
+
+&clk_ov5640_osc {
+	clock-frequency = <27000000>;
+};
-- 
2.54.0

