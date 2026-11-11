Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423898;
	b=NkO/55Ge7FdloLx+1FmBQIYEqmuhrR1/ajs8dAX/7CTUm7R8vPXL9NNc2j9POcBox7k1
	 eeh2awetX/SeGfOfp7Jr+XqNM2ptemsqMqI7wSLx8GO0b1/bMyY3qkO9KaMkiDGDwVoZz
	 iMsC5Hum3xrLQGYPv97Q5oYDpHZV4O6K2ZehOeJA9UDonxwKdM9vYeHTVk6bmNtaSHMA7
	 X131j/67COTxQpUnl/PoMA9oimkouHTcV2I0fPcSEO5PpM4IexiToVQJan9Xos2PF3cbr
	 gwGFm9/Jn+7ovgDU/Y3KRba6QkLNTC6Rfhf7BPi0kfcR7yVoqhXsV9D4C/Fh89hCIwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423898;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=eZIEIN8efIigBkbOd6hBVcrdB9WVuz9I7UGw1PelOF4=;
	b=LyyRorSoZt+A07AfMPE53HrQ+pSIJe2nhh0S3oKympibu0hoHypbcqhdzjuXHW4eiGIB
	 rTq8bPisErqoUzdjbbAvOv0eRbwtt1H0kSQkc5+kkJQDReCoyZinK59wge5jhTQYqmzJL
	 OCnBoXRxqjw93ZoUJYNXvTuPhlC0UiAmkubJWuQP4flb8BD1Q9bdI184Fn0xgZtP4T9UC
	 NimSOUreqxSSuMdH7ANs8D3b1maMaLRgsPt2mrvUYPtgoXqRwTgZq6gE+1wwordrGumBg
	 DYQ47ueq4buhxZUb2DDr7rPhsxl+Gh2Ai2QgmVqtG11mejzXb/OrGNOanaV6xsUZTNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sxASRGt3;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C39606A896
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 19:04:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3C39606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sxASRGt3
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso1400358a12.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423897; x=1795028697; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eZIEIN8efIigBkbOd6hBVcrdB9WVuz9I7UGw1PelOF4=;
        b=sxASRGt3V5xzm1UdWH7vI/0AXyR5fORrUZk7vNixbKRUTToD7H3H4JquVh5CAgMy0e
         17GqF+S/7PwmcH1SHUa/0ob1RI84snARMbE1n9/KsicBOxXB/JEFXEojykTBIS5C2QDK
         6Pa0JCQyxBH3Rt/srRFpEzZ7AUjrPtcxtSslYyaI4nA0QtD1wZaeErwwjKb0tOe4H9X0
         jnSA5ljuk/aod4KaBOfUCnF4zUzWOPucsFCbp7wPLqNZVGTYBOcQMV3KRNy+RTUZNMnO
         pW6HnNMCGLQ9b5QmhGStXbwUzM+fuPqfkh43SWJfWTEq+S0hlkn9E/m+cssC++sx/1aF
         GLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423897; x=1795028697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eZIEIN8efIigBkbOd6hBVcrdB9WVuz9I7UGw1PelOF4=;
        b=q0F0dGIjeD1+FMSEkPqo5w9WYLasIrBqEGNve6/RHXugyY/55cw2/xNPy3vZIvSj+4
         uMWJia+Cx7a8lNgpvcB2/skldMCY6cwMBqd4yfoThCxew1woJuprrqM3xiau/gqQbpKH
         7YbRrN4TUDUErqcTKkK1rnT2ZcSrBWjUHRJLwWjfJFQdFn5dgUiI79sT5/a8OY8oSWAC
         ExZBNOlGKjHo6846rAzOgOoMrFnKGA/2N9TKnWfBYcSUL9lz8Ja0M2sKHWDDw7BNAwdj
         4UQrR6levPDFHsX4NB4/fj8Q4yuMfIk0ibEfrMF8eScdUFV40GCF+DEeq2ziDyvb7umT
         wpqg==
X-Gm-Message-State: APuU4Z/4sYflC2bTnFULrH2yXAB56t3iC9gLhxnk4uAfGlHnp9EExU7u
	wIvuqXWeljnpi7XcXIbTJTNDbdhRq29/WtzXluO7qPf2PqtuAjFDtVrULluCf0oY
X-Gm-Gg: AYBFou3iiP//cifYXHwwAv3ZOnRO4JPJzBjE5AmeowTlTJLmqZfk4tj2hPXLjbHs97u
	fd6C4MlqdXDeG+FBDqEe8FWvtNT2dTQt3GYjycr1zXXKor/ur0Im2NWEvKslmNVHUhMa/Tkl96x
	b9IAkHuXLvRoa+5gItdFrfX4j2aQynEGjpKBy4p56QBsTjvgQzj9F/GsUvwaZMr3om3MYgrGded
	tQZPLowiPTmlUKL+z2+U41k2FHjj9qpOR0o+HZNwexATRpWRfSY5FAL3taGPgeEZ3zNQG0IOzTv
	K1UOdUFdDUK+tP1PyZMiKfzz+Jn5d2gOEUzzSMG+jTIDu+i/vbY+CDmfn70Lo3t4zgKpkGNIWGT
	9enaUSLU9o39w6Guhfj7uEe+kObY4zcs6YqBJQYZSyyFErCxh+sFN0SGGT4tF7GcZpZYP8MhVxx
	cwGHcXniL7A7m1cDnpSNrkdxKKvKmnPPJM1+M6VbmEAmP0cKbbKIm9qDxFnZ9P3Ysq0zfoL4anI
	lg/JqfaAg+M4mI5/tC0dIBN7SEmB1RxHIARroFN7984QRFL8JH0UIRNR8O2I/mDgAVVw9mrOv7o
	QZViTT2ahhDnq0HnCu5dRJislZ+C93AEBg==
X-Received: by 2002:a17:90b:37c3:b0:3ab:413:49bc with SMTP id 98e67ed59e1d1-3b182ee2462mr3383157a91.37.1794423897010;
        Wed, 11 Nov 2026 11:04:57 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b181f8fd59sm2727366a91.1.2026.11.11.11.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:04:56 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Wed, 11 Nov 2026 16:04:03 -0300
Subject: [PATCH v2 7/7] ARM: dts: imx6q-apalis: Add Toradex OV5640 CSI
 Cameras
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-b4-v2-apalis-imx6-overlays-v2-7-8129b21634c7@toradex.com>
References: <20261111-b4-v2-apalis-imx6-overlays-v2-0-8129b21634c7@toradex.com>
In-Reply-To: <20261111-b4-v2-apalis-imx6-overlays-v2-0-8129b21634c7@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-bsp@toradex.com, Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794423849; l=9208;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=x1z10zXP1ksLFs1FWBKlLpD4vvdYJg4UXNaMofSb9Do=;
 b=S68AEzLKc6vFUBWjXAXqDy1fRragvHk6RDlg3Dvt+81hdBwAMn87RdCZWhEvtgmZmJAap0DVC
 CTRzpH2W7+DCGSSVS8zzWpOQO0SHxy5LBpIzyBGyb3Y0Z4dTFolVzKf
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

Add device tree overlays for the Toradex OV5640 CSI Camera on Apalis
iMX6 CSI.

The default overlay describes the current CSI Camera Set 5MP OV5640 with
a 27 MHz on-board oscillator. Add a separate 24 MHz overlay for the
legacy camera module.

Remove the ov5640_mipi node from the Apalis iMX6 dtsi, as it is an
external component that does not exist at the SoM level. The camera
modules have their own on-board oscillator, so the sensor xclk is now
described as a fixed clock instead of the SoC CLKO2 output.

The overlay is also combined with the Apalis iMX6 V1.2 Ixora Carrier
Board V1.2 device tree to provide a ready-to-use DTB.

Link: https://www.toradex.com/accessories/csi-camera-ov5640
Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam/
Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                 | 12 ++++
 .../dts/nxp/imx/imx6q-apalis-ov5640-24mhz.dtso     | 17 +++++
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtsi | 68 ++++++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtso | 18 ++++++
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi      | 73 ----------------------
 5 files changed, 115 insertions(+), 73 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index fffcc54545b09..c3f42563dda97 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -168,6 +168,14 @@ imx6q-apalis-v1.2-ixora-v1.2-hdmi-dtbs := \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx-hdmi.dtbo
 
+imx6q-apalis-v1.2-ixora-v1.2-ov5640-dtbs := \
+	imx6q-apalis-v1.2-ixora-v1.2.dtb \
+	imx6q-apalis-ov5640.dtbo
+
+imx6q-apalis-v1.2-ixora-v1.2-ov5640-24mhz-dtbs := \
+	imx6q-apalis-v1.2-ixora-v1.2.dtb \
+	imx6q-apalis-ov5640-24mhz.dtbo
+
 imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-cap-touch-10inch-lvds-v1-dtbs := \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx6q-apalis-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
@@ -337,6 +345,8 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-ixora-v1.1-hdmi.dtb \
 	imx6q-apalis-ixora-v1.2.dtb \
 	imx6q-apalis-ixora-v1.2-hdmi.dtb \
+	imx6q-apalis-ov5640.dtbo \
+	imx6q-apalis-ov5640-24mhz.dtbo \
 	imx6q-apalis-tdx-panel-cap-touch-10inch-lvds-v1.dtbo \
 	imx6q-apalis-tdx-panel-cap-touch-7inch-parallel.dtbo \
 	imx6q-apalis-tdx-panel-res-touch-7inch-parallel.dtbo \
@@ -351,6 +361,8 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-v1.2-ixora-v1.1-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-hdmi.dtb \
+	imx6q-apalis-v1.2-ixora-v1.2-ov5640.dtb \
+	imx6q-apalis-v1.2-ixora-v1.2-ov5640-24mhz.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-cap-touch-10inch-lvds-v1.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-cap-touch-7inch-parallel.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-res-touch-7inch-parallel.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640-24mhz.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640-24mhz.dtso
new file mode 100644
index 0000000000000..3e4bbb11ce203
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640-24mhz.dtso
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Legacy Toradex CSI Camera Module 5MP OV5640 on Apalis iMX6 CSI.
+ *
+ * https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx6q-apalis-ov5640.dtsi"
+
+&clock_camera {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtsi
new file mode 100644
index 0000000000000..302f1ceb6a102
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtsi
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Common device tree include for Toradex OV5640 CSI camera on Apalis iMX6 CSI.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	clock_camera: clock-camera {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+
+	regulator_camera: regulator-camera {
+		compatible = "regulator-fixed";
+		/* Apalis GPIO4 - CSI Camera Connector pin 24 */
+		gpio = <&gpio2 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-name = "V_CSI";
+		startup-delay-us = <5000>;
+	};
+};
+
+&i2c3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&clock_camera>;
+		clock-names = "xclk";
+		AVDD-supply = <&regulator_camera>;
+		DOVDD-supply = <&regulator_camera>;
+		DVDD-supply = <&regulator_camera>;
+		/* Apalis GPIO2 - CSI Camera Connector pin 22 */
+		powerdown-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
+		/* Apalis GPIO1 - CSI Camera Connector pin 11 */
+		reset-gpios = <&gpio2 4 GPIO_ACTIVE_LOW>;
+
+		port {
+			ov5640_to_mipi_csi2: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&imx6q_mipi_csi_in>;
+			};
+		};
+	};
+};
+
+&mipi_csi {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	port@0 {
+		reg = <0>;
+
+		imx6q_mipi_csi_in: endpoint {
+			clock-lanes = <0>;
+			data-lanes = <1 2>;
+			remote-endpoint = <&ov5640_to_mipi_csi2>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtso
new file mode 100644
index 0000000000000..9cf7587c263bf
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtso
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Set 5MP OV5640 on Apalis iMX6 CSI.
+ *
+ * https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
+ * https://www.toradex.com/accessories/csi-camera-ov5640
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx6q-apalis-ov5640.dtsi"
+
+&clock_camera {
+	clock-frequency = <27000000>;
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
index 8f5a9ab1f20fa..2a01480947910 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
@@ -36,12 +36,6 @@ backlight: backlight {
 		status = "disabled";
 	};
 
-	clk_ov5640_osc: clk-ov5640-osc {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <24000000>;
-	};
-
 	gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-names = "default";
@@ -116,26 +110,6 @@ reg_module_3v3_audio: regulator-module-3v3-audio {
 		regulator-name = "+V3.3_AUDIO";
 	};
 
-	reg_ov5640_1v8_d_o_vdd: regulator-ov5640-1v8-d-o-vdd {
-		compatible = "regulator-fixed";
-		regulator-always-on;
-		regulator-max-microvolt = <1800000>;
-		regulator-min-microvolt = <1800000>;
-		regulator-name = "DOVDD/DVDD_1.8V";
-		/* Note: The CSI module uses on-board 3.3V_SW supply */
-		vin-supply = <&reg_module_3v3>;
-	};
-
-	reg_ov5640_2v8_a_vdd: regulator-ov5640-2v8-a-vdd {
-		compatible = "regulator-fixed";
-		regulator-always-on;
-		regulator-max-microvolt = <2800000>;
-		regulator-min-microvolt = <2800000>;
-		regulator-name = "AVDD/AFVDD_2.8V";
-		/* Note: The CSI module uses on-board 3.3V_SW supply */
-		vin-supply = <&reg_module_3v3>;
-	};
-
 	reg_usb_otg_vbus: regulator-usb-otg-vbus {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -687,30 +661,6 @@ adv7280_to_ipu1_csi0_mux: endpoint {
 			};
 		};
 	};
-
-	ov5640_csi_cam: ov5640_mipi@3c {
-		compatible = "ovti,ov5640";
-		AVDD-supply = <&reg_ov5640_2v8_a_vdd>;
-		DOVDD-supply = <&reg_ov5640_1v8_d_o_vdd>;
-		DVDD-supply = <&reg_ov5640_1v8_d_o_vdd>;
-		clock-names = "xclk";
-		clocks = <&clks IMX6QDL_CLK_CKO2>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_cam_mclk>;
-		/* These GPIOs are muxed with the iomuxc node */
-		powerdown-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
-		reg = <0x3c>;
-		reset-gpios = <&gpio2 4 GPIO_ACTIVE_LOW>;
-		status = "disabled";
-
-		port {
-			ov5640_to_mipi_csi2: endpoint {
-				clock-lanes = <0>;
-				data-lanes = <1 2>;
-				remote-endpoint = <&mipi_csi_from_ov5640>;
-			};
-		};
-	};
 };
 
 &ipu1_di1_disp1 {
@@ -740,22 +690,6 @@ lvds1_out: endpoint {
 	};
 };
 
-&mipi_csi {
-	#address-cells = <1>;
-	#size-cells = <0>;
-	status = "disabled";
-
-	port@0 {
-		reg = <0>;
-
-		mipi_csi_from_ov5640: endpoint {
-			clock-lanes = <0>;
-			data-lanes = <1 2>;
-			remote-endpoint = <&ov5640_to_mipi_csi2>;
-		};
-	};
-};
-
 &pwm1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pwm1>;
@@ -930,13 +864,6 @@ MX6QDL_PAD_DISP0_DAT23__AUD4_RXD	0x130b0
 		>;
 	};
 
-	pinctrl_cam_mclk: cammclkgrp {
-		fsl,pins = <
-			/* CAM sys_mclk */
-			MX6QDL_PAD_NANDF_CS2__CCM_CLKO2 0x00b0
-		>;
-	};
-
 	pinctrl_ecspi1: ecspi1grp {
 		fsl,pins = <
 			MX6QDL_PAD_CSI0_DAT6__ECSPI1_MISO 0x100b1

-- 
2.43.0

