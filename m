Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795700777;
	b=cbbSABTI5Ipim9pB/zbbtmasgjW16+4vKfQgiOYK5AIb1z44dFbPhPW+rvL5XWt0RCGI
	 mB2CYAUdAczIUUV9Oymh+uX8+S1grKgn4JTtnvHXThprfDbe/ctwxfu/n1A49885ZYDSY
	 R7trL3n1MvK9HkSkPyJ/4osVNA9tL7vOFs2nXvHeXXcPYIqr3v5NUSVAt5NQ4aEu8k88x
	 gkAqc4onypcM8qSklEDIL7Vn1lLFbsGUbCnK7Tt+MgyIAWHqsd+o7cRhAiKVVlTogbXJ6
	 oXCEB80WUm+h//KTObkcEgvjbYuS/8wkmys+r9E+1UKIihHR5bGmgGjuenNF70DtjiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700777;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=GM0knM8CZmPBsRo84TZenc8h+9hHSMZz/2xEKakNC6g=;
	b=MCp1OBhIjCmy+PO8MPfF9NgtzsPkVyUg68n3jNMpV5jrk1vhylyiTIGxptOx7Hn7l+xH
	 NwBrht1L5U5Dz03IZS/xyRW88MlZ0qB/ZkHfqrXmbWWjTiVtCcFoxQ/wLToCfQiLv8uqH
	 qfTjKD3F1eHrSjfAfuH8BMsnGQ/Sj2vCU9SeJa2zxlpvge0qWmabr6mdknOGDvR0kN8ch
	 pGssN3Uu09vF0n4gUgcdTdXKksd5fMpyedP0i9C1Ojc2+Q1aRqdeEzDlQ7BjXH5LaOEFO
	 gbwRN5yaud1+6K/M/kYo737nYk/Wz2fJygaLrY9VIKV49F5wpOohQbl+6ncbJEkUO4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AotPOypH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8F8606A31E;
	Thu, 26 Nov 2026 13:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AotPOypH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 323101F00ACF;
	Thu, 26 Nov 2026 13:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795700777;
	bh=GM0knM8CZmPBsRo84TZenc8h+9hHSMZz/2xEKakNC6g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AotPOypHn3Bk9pGgkpM0G9nFeXMaq+DKqMVadOdbk7Opo9IJVGHvYruZ5aNOuz4Hb
	 FqsemuVB+EHhnUf+YSe5P3pjpapZecq8cS3TooOuqwWYuww/yc0TiIoS3da1+0dZKA
	 gHp95ERPSJkJoEdOWzZRsu3k9g/0nOW8RFROjCV4pd46gqmnONEvDkpy2N6Quuz19l
	 B7mDCaDfuoYYh67rdnAkXlBqtgt8uba5s4ASx9WanFWlFSpzZnCVxmhdA4D2TX+lYC
	 S72+Uf6uNI+MXV5CG0lOotGds8m74mqkyuZDsYMImGjx+eK25V+sfDnbgP9XNcrqqh
	 7t1b4SXw7zOyg==
From: Vladimir Zapolskiy <vz@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Ritesh Kumar <quic_riteshk@quicinc.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 08/10] arm64: dts: qcom: sm8450-hdk: Add display card overlay
Date: Thu, 26 Nov 2026 15:45:06 +0200
Message-ID: <20261126134508.320700-9-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261126134508.320700-1-vz@kernel.org>
References: <20261126134508.320700-1-vz@kernel.org>
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

The SM8450 HDK board can be connected to an external display card, which
carries a 1080x2400 LCD panel module powered by the Novatek NT36672E
display driver IC with an integrated touchscreen controller.

The panel is connected to DSI0 over MIPI C-PHY links, power is supplied
by VREG_L12C_1P8, the bias supplies are on the panel module, and they
are enabled by signal PM8350 GPIO8 (LCD_BIAS_EN).

The backlight is controlled by the PM8350 GPIO9 (LCD_WLED_EN) signal
and the PM8350C LPG PWM on PM8350C GPIO8 (LCD_PWM).

The DSI0 output is shared with the on-board Lontium LT9611UXC HDMI
bridge, thus disable the bridge and its power supplies in the overlay.

The touchscreen controller is not described, since there is no binding
or driver support for it yet.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
 arch/arm64/boot/dts/qcom/Makefile             |   4 +
 .../dts/qcom/sm8450-hdk-display-card.dtso     | 144 ++++++++++++++++++
 2 files changed, 148 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8450-hdk-display-card.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 19310879349d..96f1b98a06b8 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -467,6 +467,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8350-microsoft-surface-duo2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8350-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8350-sony-xperia-sagami-pdx214.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8350-sony-xperia-sagami-pdx215.dtb
+
+sm8450-hdk-display-card-dtbs	:= sm8450-hdk.dtb sm8450-hdk-display-card.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8450-hdk-display-card.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8450-hdk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8450-samsung-r0q.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk-display-card.dtso b/arch/arm64/boot/dts/qcom/sm8450-hdk-display-card.dtso
new file mode 100644
index 000000000000..3fcaae7f2abc
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk-display-card.dtso
@@ -0,0 +1,144 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Linaro Limited
+ * Copyright (c) Vladimir Zapolskiy <vz@kernel.org>
+ */
+
+/*
+ * Display Card kit overlay
+ *
+ * S5702 switch 7 should be turned OFF to route DSI0 to the display panel
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/phy/phy.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	lcd_backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pm8350c_pwm 3 65535>;
+		enable-gpios = <&pm8350_gpios 9 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&lcd_wled_en>;
+		pinctrl-names = "default";
+	};
+};
+
+/* Disable HDMI bridge related nodes (mutually exclusive with the display card) */
+
+&i2c9 {
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
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "novatek,nt36672e";
+		reg = <0>;
+
+		enable-gpios = <&pm8350_gpios 8 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
+
+		vddi-supply = <&vreg_l12c_1p8>;
+
+		backlight = <&lcd_backlight>;
+
+		pinctrl-0 = <&disp0_reset_n_active>, <&mdp_vsync>, <&lcd_bias_en>;
+		pinctrl-1 = <&disp0_reset_n_suspend>, <&mdp_vsync>, <&lcd_bias_en>;
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
+	data-lanes = <0 1 2>;
+};
+
+&mdss_dsi0_phy {
+	phy-type = <PHY_TYPE_CPHY>;
+};
+
+&pm8350_gpios {
+	lcd_bias_en: lcd-bias-en-state {
+		pins = "gpio8";
+		function = "normal";
+		output-low;
+		bias-disable;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+		power-source = <0>;
+	};
+
+	lcd_wled_en: lcd-wled-en-state {
+		pins = "gpio9";
+		function = "normal";
+		output-low;
+		bias-disable;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+		power-source = <0>;
+	};
+};
+
+&pm8350c_gpios {
+	lcd_pwm: lcd-pwm-state {
+		pins = "gpio8";
+		function = "func1";
+		output-low;
+		bias-disable;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+		power-source = <0>;
+	};
+};
+
+&pm8350c_pwm {
+	pinctrl-0 = <&lcd_pwm>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&tlmm {
+	disp0_reset_n_active: disp0-reset-n-active-state {
+		pins = "gpio0";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	disp0_reset_n_suspend: disp0-reset-n-suspend-state {
+		pins = "gpio0";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	mdp_vsync: mdp-vsync-state {
+		pins = "gpio86";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+};
-- 
2.51.0

