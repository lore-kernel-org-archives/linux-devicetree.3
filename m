Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94A63DDDB6
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 11:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780401122; cv=none; b=bzujkrJwvXqHqGifKBCIc59SrQoFvSHZo+yGWgC1a89cQhvnPZ/gOkygZLx4Nm6hNATISqh/VufqITVsto8j9bbKcMvXFHFKI8XSmfbn2mqJRoKNQuHbCYfL2KZ3yMGuBZICXp090ZlCGY8jS6G09jf2Ov25p2smm0+dGrpxERs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780401122; c=relaxed/simple;
	bh=II/gGO5V8sFjmKlCpyva7fLUs65Yks5u4HZLgIjluug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ij+apUHT/yYb0pfyZlz65EHo6WYTeA50aA/kQK6VnDejs44u8Sxr5yBT9ewqwomwMsZKoqe04yktwzxo0yMALbk2YveupOkUyRS32Am6vfM/k7ywis5F/RRK6ut4JC4AI2xX6ot5a82pfM65uLGzPWcwJVWW4YUvi4zZ83Tpt5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sJaJxsP9; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sJaJxsP9"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4905529b933so87923035e9.0
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 04:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780401109; x=1781005909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9szoMkSekqXZjHQ58B9YIx1uhfdOHkq/yPwrYOOb5tU=;
        b=sJaJxsP99+ftNbuF41gdbKuTAnOK+ye4mjazX94H/J+50czR+FCzcLOoYV6YQKx1jN
         bEPoNq769DV16bmSUL2IRBfKwiDoRB/Hs123vL6EEWrE8QMm8kRz55ivBkHygA8FoNs8
         zXnnmiGf1CTi9Ec7gNbDFAsr4TeJIHOyzCL1ujjYExB4p08VbqNE2FvSjL1xwonnBr4e
         RLZa/hZQ1jZ/7TTGafZMfaWX620wCj+W+IzPTS4VT9YFAr6UdC//if1lmd79qcUkQOKs
         KkQIh5rThoKdyEdkJLa+rNvpwKV2iljP/s2o3vNnDBoVd0ibX1/zfBdDvaRgUxF3gmmM
         0o4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780401109; x=1781005909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9szoMkSekqXZjHQ58B9YIx1uhfdOHkq/yPwrYOOb5tU=;
        b=Cg6tjXkINS1ZCAPqsBcOI5GhWxkmNAqVyAxmcHKL+VFqaz5R/v9UVCMY/YKdC24L1Z
         aF0FDm6StQZ4RDSw/0NEWRRDeJZC5lkWbwP9bMggL5fMaNTiDoN5lvvH7ZHstDpaFjYY
         oxdvGOEzvh51IFQCRmaK2gKxZSEsr/HoUIcfq8DB61HxaS9xvbCSUPuvKJY7WlFvwuVR
         dPKY8PF4dgf7ZzqwprMo+k2fL/kcKkhHYWqUkofsiLhvC5tQtzj8xPaCHTBKzfR22Ckx
         rjXJjk9abDosDiPQQw2yzD7uf738GK+DdXAZHvtAqV6YApz/SuGxe8FPgRj8hFIqIFFx
         IlSg==
X-Forwarded-Encrypted: i=1; AFNElJ8XIaKR86i0/nx1wMBHVlqO8FQ4LMMW2CPScPZyp3vduKzEOghwR7YeKzmcnhaUQaCRzjuo9uw0g/Dz@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlzuk5sSy43aLdw/H13ThgjfduKMs/6wPUPlboAxC6Eo2HMEYE
	1qWGQXkAUhaXxC0xmvrxek8pmaKhx3/e11sfQjVl4rMfD0ph8c6o7t1n
X-Gm-Gg: Acq92OEuboFVTtMvULBB2XE8XzQS1ZW1ixsHMdcExmfg1JxzRZeHg5CvyzKG6LuU6UC
	GubaY+qibKFzoMO4wNxv+5MVzj/zTDDqMYQe0Ll29VHAFoekF3PXwff1szQUNqiu2qz86/HJ8eE
	CPTXpjBsA9PWDr6D3DaIsSVVxmkyygqzsUyeSr1lTnRMFRgDj4pCpUl2BAHED0oFdBTY5T3r7vQ
	l0aMZIrm4iCkjONvB+hqmqrlp/Mrvd+a1OsIgsbaji81BwqmchSb+YCLhnnHsuILySw8BpNt6ht
	HeLbUFLs2oFgVDdP9xQVru76/I5g0DSvoUUd0Lvqq7l2Zgf0eZdxBtti60juygoS7S9fqtdvUmz
	k4fc+LA57Jk8etrrORSQHenw7jbgpJQA/dhj1FB6bhtxEohA0sMp/i++o+TUffzZlku/0v7fi0L
	JabMY8OCI70Oqez5Dj0KY0QfXbTQ==
X-Received: by 2002:a05:600c:8216:b0:490:b28d:a6f9 with SMTP id 5b1f17b1804b1-490b28da915mr41764595e9.8.1780401108861;
        Tue, 02 Jun 2026 04:51:48 -0700 (PDT)
Received: from vitor-nb ([2001:8a0:c4c6:f00:e8c3:a961:5b26:a2c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c152570sm139480015e9.9.2026.06.02.04.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 04:51:48 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] arm64: dts: ti: k3-am69-aquila: Add Toradex OV5640 CSI cameras
Date: Tue,  2 Jun 2026 12:51:30 +0100
Message-ID: <20260602115123.1324474-16-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602115123.1324474-9-ivitro@gmail.com>
References: <20260602115123.1324474-9-ivitro@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

Add device tree overlays for the Toradex OV5640 CSI cameras on Aquila
CSI_1 and CSI_2. Two variants are supported for each interface: the
current CSI Camera Set 5MP OV5640 with a 27 MHz oscillator and the legacy
CSI Module 5MP OV5640 with a 24 MHz oscillator.

On the Aquila AM69 Development Board, CSI_1 is exposed on connector J70
and CSI_2 is exposed on connector J71.

Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
Changes in v2:
- Reorder supply properties in OV5640 CSI camera nodes and rename clock
  node to match binding preferred node name pattern.

 arch/arm64/boot/dts/ti/Makefile               | 14 ++++
 .../ti/k3-am69-aquila-csi1-ov5640-24mhz.dtso  | 18 +++++
 .../dts/ti/k3-am69-aquila-csi1-ov5640.dtsi    | 76 +++++++++++++++++++
 .../dts/ti/k3-am69-aquila-csi1-ov5640.dtso    | 19 +++++
 .../ti/k3-am69-aquila-csi2-ov5640-24mhz.dtso  | 18 +++++
 .../dts/ti/k3-am69-aquila-csi2-ov5640.dtsi    | 76 +++++++++++++++++++
 .../dts/ti/k3-am69-aquila-csi2-ov5640.dtso    | 19 +++++
 7 files changed, 240 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640-24mhz.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640-24mhz.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index a8c2fae6a212..4f1a8375e554 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -199,6 +199,10 @@ dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-adapter-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-adapter-panel-cap-touch-7inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-clover-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-clover.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-csi1-ov5640-24mhz.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-csi1-ov5640.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-csi2-ov5640-24mhz.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-csi2-ov5640.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dsi-to-hdmi.dtbo
@@ -328,6 +332,14 @@ k3-am69-aquila-dev-adapter-panel-cap-touch-10inch-dsi-dtbs := \
 k3-am69-aquila-dev-adapter-panel-cap-touch-7inch-dsi-dtbs := \
 	k3-am69-aquila-dev.dtb \
 	k3-am69-aquila-adapter-panel-cap-touch-7inch-dsi.dtbo
+k3-am69-aquila-dev-csi-ov5640-24mhz-dtbs := \
+	k3-am69-aquila-dev.dtb \
+	k3-am69-aquila-csi1-ov5640-24mhz.dtbo \
+	k3-am69-aquila-csi2-ov5640-24mhz.dtbo
+k3-am69-aquila-dev-csi-ov5640-dtbs := \
+	k3-am69-aquila-dev.dtb \
+	k3-am69-aquila-csi1-ov5640.dtbo \
+	k3-am69-aquila-csi2-ov5640.dtbo
 k3-am69-aquila-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
 	k3-am69-aquila-dev.dtb \
 	k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtbo
@@ -417,6 +429,8 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am69-aquila-clover-panel-cap-touch-7inch-dsi.dtb \
 	k3-am69-aquila-dev-adapter-panel-cap-touch-10inch-dsi.dtb \
 	k3-am69-aquila-dev-adapter-panel-cap-touch-7inch-dsi.dtb \
+	k3-am69-aquila-dev-csi-ov5640-24mhz.dtb \
+	k3-am69-aquila-dev-csi-ov5640.dtb \
 	k3-am69-aquila-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb \
 	k3-am69-sk-csi2-dual-imx219.dtb \
 	k3-am69-sk-pcie0-ep.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640-24mhz.dtso b/arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640-24mhz.dtso
new file mode 100644
index 000000000000..e7d238da8bef
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640-24mhz.dtso
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Module 5MP OV5640 on Aquila CSI_1.
+ * Used on Development Board (J70). Uses a 24 MHz oscillator.
+ *
+ * https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "k3-am69-aquila-csi1-ov5640.dtsi"
+
+&clock_camera_csi_1 {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640.dtsi b/arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640.dtsi
new file mode 100644
index 000000000000..668658d32111
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640.dtsi
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Common device tree include for Toradex OV5640 CSI Camera on Aquila CSI_1.
+ * Used on Development Board (J70).
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	clock_camera_csi_1: clock-camera-csi-1 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+
+	regulator_camera_csi_1: regulator-camera-csi-1 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_12_csi_1>;
+		/* Aquila GPIO_12_CSI_1 - Camera Connector 24 */
+		gpio = <&main_gpio0 48 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-name = "V_CSI_1";
+		startup-delay-us = <5000>;
+	};
+};
+
+&csi0_port0 {
+	status = "okay";
+
+	csi0_port0_in: endpoint {
+		remote-endpoint = <&csi0_port0_cam_out>;
+		bus-type = <4>; /* CSI2 DPHY. */
+		clock-lanes = <0>;
+		data-lanes = <1 2>;
+	};
+};
+
+&dphy0 {
+	status = "okay";
+};
+
+/* Aquila I2C_4_CSI1 */
+&main_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_09_csi_1>, <&pinctrl_gpio_10_csi_1>;
+		clocks = <&clock_camera_csi_1>;
+		clock-names = "xclk";
+		AVDD-supply = <&regulator_camera_csi_1>;
+		DOVDD-supply = <&regulator_camera_csi_1>;
+		DVDD-supply = <&regulator_camera_csi_1>;
+		/* Aquila GPIO_10_CSI_1 - Camera Connector 22 */
+		powerdown-gpios = <&main_gpio0 2 GPIO_ACTIVE_HIGH>;
+		/* Aquila GPIO_09_CSI_1 - Camera Connector 11 */
+		reset-gpios = <&main_gpio0 1 GPIO_ACTIVE_LOW>;
+
+		port {
+			csi0_port0_cam_out: endpoint {
+				remote-endpoint = <&csi0_port0_in>;
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
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640.dtso b/arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640.dtso
new file mode 100644
index 000000000000..76807176e288
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640.dtso
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Set 5MP OV5640 on Aquila CSI_1.
+ * Used on Development Board (J70). Uses a 27 MHz oscillator.
+ *
+ * https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
+ * https://www.toradex.com/accessories/csi-camera-ov5640
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "k3-am69-aquila-csi1-ov5640.dtsi"
+
+&clock_camera_csi_1 {
+	clock-frequency = <27000000>;
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640-24mhz.dtso b/arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640-24mhz.dtso
new file mode 100644
index 000000000000..607e1c76c86d
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640-24mhz.dtso
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Module 5MP OV5640 on Aquila CSI_2.
+ * Used on Development Board (J71). Uses a 24 MHz oscillator.
+ *
+ * https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "k3-am69-aquila-csi2-ov5640.dtsi"
+
+&clock_camera_csi_2 {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640.dtsi b/arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640.dtsi
new file mode 100644
index 000000000000..454ac120337c
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640.dtsi
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Common device tree include for Toradex OV5640 CSI Camera on Aquila CSI_2.
+ * Used on Development Board (J71).
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	clock_camera_csi_2: clock-camera-csi-2 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+
+	regulator_camera_csi_2: regulator-camera-csi-2 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_16_csi_2>;
+		/* Aquila GPIO_16_CSI_2 - Camera Connector 24 */
+		gpio = <&wkup_gpio0 39 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-name = "V_CSI_2";
+		startup-delay-us = <5000>;
+	};
+};
+
+&csi1_port0 {
+	status = "okay";
+
+	csi1_port0_in: endpoint {
+		remote-endpoint = <&csi1_port0_cam_out>;
+		bus-type = <4>; /* CSI2 DPHY. */
+		clock-lanes = <0>;
+		data-lanes = <1 2>;
+	};
+};
+
+&dphy1 {
+	status = "okay";
+};
+
+/* Aquila I2C_5_CSI2 */
+&main_i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_13_csi_2>, <&pinctrl_gpio_14_csi_2>;
+		clocks = <&clock_camera_csi_2>;
+		clock-names = "xclk";
+		AVDD-supply = <&regulator_camera_csi_2>;
+		DOVDD-supply = <&regulator_camera_csi_2>;
+		DVDD-supply = <&regulator_camera_csi_2>;
+		/* Aquila GPIO_14_CSI_2 - Camera Connector 22 */
+		powerdown-gpios = <&wkup_gpio0 33 GPIO_ACTIVE_HIGH>;
+		/* Aquila GPIO_13_CSI_2 - Camera Connector 11 */
+		reset-gpios = <&wkup_gpio0 32 GPIO_ACTIVE_LOW>;
+
+		port {
+			csi1_port0_cam_out: endpoint {
+				remote-endpoint = <&csi1_port0_in>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
+
+&ti_csi2rx1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640.dtso b/arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640.dtso
new file mode 100644
index 000000000000..d3279f373d32
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640.dtso
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Set 5MP OV5640 on Aquila CSI_2.
+ * Used on Development Board (J71). Uses a 27 MHz oscillator.
+ *
+ * https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
+ * https://www.toradex.com/accessories/csi-camera-ov5640
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "k3-am69-aquila-csi2-ov5640.dtsi"
+
+&clock_camera_csi_2 {
+	clock-frequency = <27000000>;
+};
-- 
2.54.0

