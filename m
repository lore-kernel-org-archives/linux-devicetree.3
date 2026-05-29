Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FC23E1230
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 12:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780056579; cv=none; b=jcy2yV70w46t8QkOfCxYPsMDRVd3/65wXl3874sLmlBGNXL8Aul8qJWSA1cg5WywriOZbQKQyynnO78it5p9PbLxMWgPSyomiqCP7zZPyBn3uR0djrNK0yFglKm/dGU5xF6aIelBE1Gqyv4zGkeruX3cn92dRmNt5f4kNtw9X0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780056579; c=relaxed/simple;
	bh=lfd7h6jow24hXxMp5MG1a5yE/ic1EJpm4slGtQzMliY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DwJkUWsxy5CnBGCB60We6Ru1B0KEgpuhFX0K5oJz5p1ywb8e5SstU78y6w7HH62FP4FP6Zyrfy4avCAkAYe4bWcTdno2R3gTnAULA6StoH2LbqwUSaCEHepMHXKCxpI2SVd3xQ7lv0MT8gEWRNbH99hiHcyJb8GLBw7p363ULSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sGt3tzSG; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sGt3tzSG"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45ef5146b56so193934f8f.0
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 05:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780056576; x=1780661376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FR0GOKqUKK69xFGpw8JrWZnRSOWzPjh/TNYLZAuisSA=;
        b=sGt3tzSGdO856mmFqZX4CdixjilZ5wjWRuBstkblnxlhYJ0SoN+qkw3AGrVE1uxDI3
         hDcDvKMCB5vMUtgnqYpQ2VSGhT6O9fER72WcpLh4nPQ286dhU9aBYKcceMS2Hy9Tb/O6
         RbXSPhpPTLrcTA6x24cIdz+crGbefJ/BZPXv2hZ9pMEGwwibOwQja5XCjLhRwrmCkHsn
         oxFRsuCqLa0ctHfK1q+B+/o//d3DKnf0UfwkwCUJSHVNWfZiGcDXGjvx9JoiMMzFacyX
         93JlD4pIGp98ACI+jNVrpZuO6wtLrgqz1hkdxt5aWCrfj6pl5uwUb/1D0dzkRCheoTn9
         BdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780056576; x=1780661376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FR0GOKqUKK69xFGpw8JrWZnRSOWzPjh/TNYLZAuisSA=;
        b=i2uQ0rcXafYQ49b9J9cRckC8uqSxE1NCIz3ytgsPsv0HkDAij9OopFW+zrBNIpGUhy
         CLqERbhyU5JtMLBI6vmP0jAfCCAR4StvvDfM2oprunwitGN0k/tKHt5P0cBD3sd1oq9Z
         Nu42ctBnW0nkziH69k3cEfZZXMZy/yxKsxuLIZXtpvSFdkI65RToKpg7LHM2gVFBf+1s
         dXmJJGAO6QJpw5TkfHefyQ8dVFvXUanFVeH4l0BHNno9je8UQCUfwmKmXQur1L+HC82d
         k/xNoMK/fZnLowdbMbiRXqSLfU0Bddrrrldpsp9rHV/gW1iTNPIB6ciXgbCWEyGimx0l
         3HTQ==
X-Forwarded-Encrypted: i=1; AFNElJ9DeeZf88gyFI5CWjsowYqwmYqqcfOjWzQipJqNN0cc8iePg47QFHKF+ciKe+FftFcCOd4o2yOyADkz@vger.kernel.org
X-Gm-Message-State: AOJu0YzNjDnuKPukOM6TfKHji7SRfBGIDV5f1SK+RCoTf7gUZuz6rmwN
	d11SAepIJcyuurLfyauM7uuf481mdeaMa0D/jHt6cKryxPq0eu8y/aliUw/n1A==
X-Gm-Gg: Acq92OFsm1/UZgJTUuKaJUo338/BdMR6dVyTagbGjSwKo+CEckP8Lq1mcI2szovsUoU
	1w/f+pwg5ti4RkNinhkNzgoaFzF9HcqN8u1uAzC9YaN+oYKUPqgW38yYG7s1NFrnKc1Dhh3AwcB
	XtUKzu8cBOn3f01c4s/BgpZVF4Z5+8AHrOjsi1MdCmhd3Oiur6/FXC0YSCIBhpBmOzAC8p9dXeN
	ipbJev2cbHVC+/iSsDD4xdt+ZKliD/Q6foQImbV7KHNptMiOJu+3wzhAsjEQUswXJcvnWifHqiz
	gUVJhl680eznXz0FZyt/pGgzx2mttuPKxCNUsd/JtClfjxmnZNow40WTGosw4c97xLWc084ftD1
	DVgJ8bvn6MOja8XO5ZBrByrXt3U/LMULnO+1zefN/3kFedmdco44Or5iMLZYj4CGYbPGnBFqbpt
	OYe0x6zemF7gLnR4F+jqImjBpa
X-Received: by 2002:a05:600c:3110:b0:490:f7c:b19 with SMTP id 5b1f17b1804b1-4909c2af1bbmr34673195e9.0.1780056575683;
        Fri, 29 May 2026 05:09:35 -0700 (PDT)
Received: from vitor-nb ([89.214.125.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c0b8a11sm13586595e9.16.2026.05.29.05.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 05:09:35 -0700 (PDT)
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
Subject: [PATCH v1 7/7] arm64: dts: ti: k3-am69-aquila: Add Toradex OV5640 CSI cameras
Date: Fri, 29 May 2026 13:08:59 +0100
Message-ID: <20260529120853.636015-16-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529120853.636015-9-ivitro@gmail.com>
References: <20260529120853.636015-9-ivitro@gmail.com>
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
index db205afeb7a0..428b1d2e817a 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -181,6 +181,10 @@ dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-adapter-panel-cap-touch-10inch-dsi.dtbo
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
@@ -288,6 +292,14 @@ k3-am69-aquila-dev-adapter-panel-cap-touch-10inch-dsi-dtbs := \
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
@@ -368,6 +380,8 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
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
index 000000000000..3ef3d793c288
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
+&clk_csi1_ov5640 {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640.dtsi b/arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640.dtsi
new file mode 100644
index 000000000000..931bc5c9f21c
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
+	clk_csi1_ov5640: ov5640-csi1-clock {
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
+		clocks = <&clk_csi1_ov5640>;
+		clock-names = "xclk";
+		AVDD-supply = <&regulator_camera_csi_1>;
+		DVDD-supply = <&regulator_camera_csi_1>;
+		DOVDD-supply = <&regulator_camera_csi_1>;
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
index 000000000000..40a8ad575dc5
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
+&clk_csi1_ov5640 {
+	clock-frequency = <27000000>;
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640-24mhz.dtso b/arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640-24mhz.dtso
new file mode 100644
index 000000000000..8ee50adb7896
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
+&clk_csi2_ov5640 {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640.dtsi b/arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640.dtsi
new file mode 100644
index 000000000000..589666c2c043
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
+	clk_csi2_ov5640: ov5640-csi2-clock {
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
+		clocks = <&clk_csi2_ov5640>;
+		clock-names = "xclk";
+		AVDD-supply = <&regulator_camera_csi_2>;
+		DVDD-supply = <&regulator_camera_csi_2>;
+		DOVDD-supply = <&regulator_camera_csi_2>;
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
index 000000000000..bcf597e9c5a4
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
+&clk_csi2_ov5640 {
+	clock-frequency = <27000000>;
+};
-- 
2.54.0

