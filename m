Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793568982;
	b=MPXBK2dOseBC5d4c4c3SKW0wk0gSQ3rYDjvBhK3F3wPizgfeodJGHQyw8xDkpyLEdZWM
	 43kdTT4pRm7eC/5gB7uPD9e2Ml2ezb4TkQEPsJOe8RAasqehCSJyBnnI5WwDrqHInPPYo
	 5NgEHIpp1z83NJkk+75afoeMbuizMOWN9OkKDcP0cZ83zvZ2AnC0zHmzAxuByDEOLRB8+
	 DdEBVGvTZu3LIjfMPK4uT5vjB2JFSjXbM1lwWr7H9vWPPP1wjbeebuZL+153mLGAzeV6E
	 KlK2x4yqCCaCfZqV4p5p0S+hQ7xKh3lXZjsa9UznGIgqfrL+LESb3JD2dTbM7ebaNCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793568982;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kG446rYKQPRndMGat8LXDMFeyitll/HZKwIlM0LE+XA=;
	b=sVMNiEKNtKEuvV4MBDJqjJPQ51ZLiSdOvO2wz1ZVTasYylP++rREvZe3y0cYoqMqtwqd
	 VrqI9D1+wRQ9Y8zWgvmSnhI8DS8KjoAc+JIv3MlrxgoO5lqho/YyC+L/rqOD7v7ArL6pl
	 aV80F14Wd/Zg2ywkqGXGV5rO0mhJtba2uciL4aKGVJMLMm1o/JytKeHSHKETn1ymfvue9
	 zMNIy1ZncGcTuQctWn0Z6EXpDHq2JDr6JCkw76NMfdpza75OcR8yhIXU7z5Tqr5rh3B1/
	 K8mXV9sYKzLbnc00FI5dzuUCK9c0CBfGCeZp5YWBXyR1BVf8l/j3wxxr1+lQDn4sYNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iW4SiUCD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C68B606A324;
	Sun,  1 Nov 2026 21:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iW4SiUCD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CE6A1F000C1;
	Sun,  1 Nov 2026 21:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793568981;
	bh=kG446rYKQPRndMGat8LXDMFeyitll/HZKwIlM0LE+XA=;
	h=From:To:Cc:Subject:Date;
	b=iW4SiUCDE1cBdvVYPz6cv/Scr1CNGxyr/DklISgFKthZzZ6BaZ6GNlwCEUKxjdOV4
	 YBPQBnqFpiaj/ZNESVtpZ1Qlc/bYvJUrQITZFlOTyoiVBAeWj1IRzex+c+1k5OqKMR
	 B+VeB5akQs0zbn1ZED3klWBr2dkCEWzmet9sSKKjhKQTZsJ2kQv51lipB32/hWr5Gd
	 W5+WchkiPH3aSuDNQZhUBMM7P6VlEfMj1/LK1FzHFl922OYB8sNKxr12QeYAG59lYa
	 FPqz1jrL/3nCqW2mof1eu7oA7/7pYwN6Z90IcW1L1CYBev1o06zhCsFbYDZj3hEcwN
	 nzlEOIKshCB4Q==
From: Vladimir Zapolskiy <vz@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm8350-hdk: Add display card overlay
Date: Sun,  1 Nov 2026 23:36:16 +0200
Message-ID: <20261101213616.2433513-1-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an overlay for the SM8350-HDK display card kit with the 1080x2340
Visionox R66451 AMOLED DSI panel and the FocalTech FT3518 touchscreen.

The panel is connected to DSI0, which is alternatively routed to the
LT9611UXC HDMI bridge, so disable the bridge and its supplies to enable
the panel.

The panel OLED_VDDIO supply is PM8350C L12C at 1.8V, and the OLED_VCI
supply is PM8350C L13C at 3.0V, the ELVDD and ELVSS supplies come from
the PM8350B AMOLED regulators, which are controlled by the panel over
SWIRE and need no software control.

Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
Two small fixes can be helpful to test the SM8350-HDK display card:
* https://lore.kernel.org/dri-devel/20261101212458.2431191-1-vz@kernel.org

 arch/arm64/boot/dts/qcom/Makefile             |   4 +
 .../dts/qcom/sm8350-hdk-display-card.dtso     | 157 ++++++++++++++++++
 2 files changed, 161 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8350-hdk-display-card.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..5eea5c5d6121 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -417,6 +417,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-sony-xperia-edo-pdx206.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-xiaomi-elish-boe.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-xiaomi-elish-csot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-xiaomi-pipa.dtb
+
+sm8350-hdk-display-card-dtbs	:= sm8350-hdk.dtb sm8350-hdk-display-card.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8350-hdk-display-card.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8350-hdk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8350-microsoft-surface-duo2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8350-mtp.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk-display-card.dtso b/arch/arm64/boot/dts/qcom/sm8350-hdk-display-card.dtso
new file mode 100644
index 000000000000..0538b63e4160
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk-display-card.dtso
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Linaro Limited
+ * Copyright (c) Vladimir Zapolskiy <vz@kernel.org>
+ */
+
+/*
+ * Display Card kit overlay for the SM8350-HDK and Visionox R66451 AMOLED panel.
+ * S5702 switch 7 to be turned to OFF to route DSI0 to the display panel.
+ *
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+/dts-v1/;
+/plugin/;
+
+/* Disable HDMI bridge related nodes (mutually exclusive with the display card) */
+
+&i2c15 {
+	status = "disabled";
+};
+
+&lt9611_1v2 {
+	status = "disabled";
+};
+
+&lt9611_3v3 {
+	status = "disabled";
+};
+
+&lt9611_codec {
+	status = "disabled";
+};
+
+&apps_rsc {
+	regulators-1 {
+		vreg_l3c_3p0: ldo3 {
+			regulator-name = "vreg_l3c_3p0";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12c_1p8: ldo12 {
+			regulator-name = "vreg_l12c_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13c_3p0: ldo13 {
+			regulator-name = "vreg_l13c_3p0";
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&gpi_dma0 {
+	status = "okay";
+};
+
+&i2c4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	touchscreen@38 {
+		compatible = "focaltech,ft3518";
+		reg = <0x38>;
+
+		interrupts-extended = <&tlmm 23 IRQ_TYPE_LEVEL_LOW>;
+
+		reset-gpios = <&tlmm 22 GPIO_ACTIVE_LOW>;
+
+		vcc-supply = <&vreg_l3c_3p0>;
+
+		pinctrl-0 = <&ts_irq>, <&ts_reset>;
+		pinctrl-names = "default";
+
+		touchscreen-size-x = <1080>;
+		touchscreen-size-y = <2340>;
+	};
+};
+
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "visionox,r66451";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 24 GPIO_ACTIVE_LOW>;
+
+		vddio-supply = <&vreg_l12c_1p8>;
+		vdd-supply = <&vreg_l13c_3p0>;
+
+		pinctrl-0 = <&disp0_reset_n_active>, <&mdp_vsync>;
+		pinctrl-1 = <&disp0_reset_n_suspend>, <&mdp_vsync>;
+		pinctrl-names = "default", "sleep";
+
+		port {
+			panel0_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel0_in>;
+};
+
+&tlmm {
+	ts_reset: ts-reset-state {
+		pins = "gpio22";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+
+	ts_irq: ts-irq-state {
+		pins = "gpio23";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+
+	disp0_reset_n_active: disp0-reset-n-active-state {
+		pins = "gpio24";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	disp0_reset_n_suspend: disp0-reset-n-suspend-state {
+		pins = "gpio24";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	mdp_vsync: mdp-vsync-state {
+		pins = "gpio82";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+};
-- 
2.51.0

