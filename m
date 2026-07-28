Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE021DE8BB;
	Tue, 28 Jul 2026 00:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785198014; cv=none; b=XYmAbxH6EV4XIuEVw/QCVuoxOzDwYOXJw6yfsLGsgTOpfY/G2evZ+QFLCFyz92jnyZT3gjWdnDT6hSHob+m3q8/VnHX/BBr4ATQ/LUti/v7jFkk6MOMg/f1mI3L/yz3TfgzKII56wwYk6kHWm7Rn4fBgozNcdq3CnAs38lF/Eso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785198014; c=relaxed/simple;
	bh=oUsXBdisawrObbLSiAJvaUbTfg0TFW28RxQri0hdQ2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vBb0S+0ObiVTKRh2MXblGe/pWhxpas6OeN3Xx44/1L0/+5bb4jJLKJ5zHl+h1oS0H6pAXkjHeuR4zlFAZNkzy/mbEPZimH45q5Q2ga66mCNC1qKL8EscV1BbeADf/T1T4gX2mwzEEYOtTWveZOQn5APxlk5jmcGCZA4BXZGN0J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VX3HhW7D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VX3HhW7D"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B987C4AF0C;
	Tue, 28 Jul 2026 00:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785198014;
	bh=oUsXBdisawrObbLSiAJvaUbTfg0TFW28RxQri0hdQ2U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VX3HhW7Da4xXiHxrUWXTcH8UMKv4ej6jsMyPFvcUGQ5T42L/EQXQYihI3INooHbp5
	 ldoPPU9NHMrld3E7QZdTY18sGknN4cUJNjIdFQ9x50fYTlRc7mZrSH/0hARyqYShJa
	 wKWVNvL2qoolbmb/dSRngUR0AtqTtXYNEz3Btir+x8faOJDzYWl5H7nOKud6zePQ2f
	 G/yuTs3owyjc+kvDa7mUy2vIDTB9MHsADY2Jdto5ogAkbn6DuuK4nhXfNCwjS7AUXR
	 V7qJq4LHoeT/zZvzyWK4ae6fp59b6QECWVA+TZSwcmr/dYM+/VwStNv5LU0IX2SF/Y
	 iKqtpNG1bfvCg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB10AC54F50;
	Tue, 28 Jul 2026 00:20:13 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Mon, 27 Jul 2026 19:20:13 -0500
Subject: [PATCH v9 5/6] arm64: dts: qcom: Add AYN Odin 2 Portal
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-ayn-qcs8550-v9-5-e3db456e10e5@gmail.com>
References: <20260727-ayn-qcs8550-v9-0-e3db456e10e5@gmail.com>
In-Reply-To: <20260727-ayn-qcs8550-v9-0-e3db456e10e5@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>, 
 Teguh Sobirin <teguh@sobir.in>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785198012; l=3853;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=lheKROE5V5AkF9CK86L17MEhQBVNheFGekfpxBaJjyw=;
 b=dUw/9c3SPziitb0Z0R+q39C8AX8Njpd2vR+nOB4x9i11Q3KK0xEdKL+76NHuRHCOL5yyt5Dxr
 MYcRrKaT+n8Bxbgo6Q9D4uYBnkmrTP1GTGaXYkk3YRrB0HofEMBd3l+
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Teguh Sobirin <teguh@sobir.in>

The AYN Odin 2 Portal is a high-performance Android-based handheld gaming
console powered by the Qualcomm Snapdragon 8 Gen 2 processor featuring a
7-inch OLED touchscreen.

Signed-off-by: Teguh Sobirin <teguh@sobir.in>
Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  1 +
 .../boot/dts/qcom/qcs8550-ayntec-odin2portal.dts   | 99 ++++++++++++++++++++++
 2 files changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 006d5ce1af17b..0f71d5bd3efaa 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -193,6 +193,7 @@ qcs8300-ride-el2-dtbs := qcs8300-ride.dtb monaco-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-ayntec-odin2mini.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-ayntec-odin2portal.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-rb5gen2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
diff --git a/arch/arm64/boot/dts/qcom/qcs8550-ayntec-odin2portal.dts b/arch/arm64/boot/dts/qcom/qcs8550-ayntec-odin2portal.dts
new file mode 100644
index 0000000000000..2c6e63f47cceb
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs8550-ayntec-odin2portal.dts
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025, Teguh Sobirin.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include "qcs8550-ayntec-common.dtsi"
+
+&{/} {
+	model = "AYN Odin 2 Portal";
+	compatible = "ayntec,odin2portal", "qcom,qcs8550", "qcom,sm8550";
+
+	vdd_bl_5v0: vdd-bl-5v0-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_bl_5v0";
+
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		gpio = <&tlmm 52 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vdd_disp_2v8: vdd-disp-2v8-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_disp_2v8";
+
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+
+		gpio = <&tlmm 142 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
+&display_panel {
+	compatible = "ayntec,odin2portal-panel", "chipone,icna3512";
+
+	pinctrl-0 = <&dsi_p_rst_active>, <&dsi_p_te_active>;
+	pinctrl-1 = <&dsi_p_rst_suspend>, <&dsi_p_te_suspend>;
+	pinctrl-names = "default", "sleep";
+
+	vdd-supply = <&vreg_l11b_1p2>;
+	vddio-supply = <&vreg_l12b_1p8>;
+	vci-supply = <&vreg_l13b_3p0>;
+	disp-supply = <&vdd_disp_2v8>;
+	blvdd-supply = <&vdd_bl_5v0>;
+
+	reset-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
+
+	rotation = <270>;
+};
+
+&i2c4 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	touchscreen@38 {
+		compatible = "focaltech,ft5426";
+		reg = <0x38>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <25 IRQ_TYPE_EDGE_FALLING>;
+
+		reset-gpios = <&tlmm 24 GPIO_ACTIVE_LOW>;
+
+		vcc-supply = <&vreg_l14b_3p2>;
+		iovcc-supply = <&vreg_l12b_1p8>;
+
+		pinctrl-0 = <&ts_p_rst_default &ts_p_int_default>;
+		pinctrl-1 = <&ts_p_rst_sleep &ts_p_int_sleep>;
+		pinctrl-names = "default", "sleep";
+
+		touchscreen-size-x = <1080>;
+		touchscreen-size-y = <1920>;
+		touchscreen-swapped-x-y;
+		touchscreen-inverted-y;
+	};
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/sm8550/ayntec/odin2portal/adsp.mbn",
+			"qcom/sm8550/ayntec/odin2portal/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&spk_amp_l {
+	firmware-name = "qcom/sm8550/ayntec/odin2portal/aw883xx_acf.bin";
+};
+
+&spk_amp_r {
+	firmware-name = "qcom/sm8550/ayntec/odin2portal/aw883xx_acf.bin";
+};
+

-- 
2.54.0


