Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24DA3BF677;
	Mon, 23 Mar 2026 16:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774283269; cv=none; b=XtbRb1P69qFQzuA8YoUh+Qu1/5jnI5N5900LAfhHbhg4rROI9WPWNzuBxo9eU2ipBhcZQJihwlbpWksn0cDyoiXfvmbtordwUC34GXfjbPEz94Ph0Tt9kI5QINv5+B0KAcv9cZDYZrGDxZ89ual+bjRKN1SIU6RO201kEaZol/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774283269; c=relaxed/simple;
	bh=aYoLJh09cL4RvjP6b/lmgRvFFyBy6BfjrUniTniFO1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qcbjrazWDoSq2jdRB+NqIS455XRMMntXJf46Dz/HK9q1CV+0gwJi59aw6N9KzIXCWUcLU8AWMw6wbJcNdDwOaKxSGW1CcsYr63t82uyoL2FIG+GkFOWwrlbkDodtQ/d4BqgTA3FeU4yiH6Us0CmYnzOnpqWBYYK7AJFKldmNgkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QZAjT6O0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QZAjT6O0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55768C4AF15;
	Mon, 23 Mar 2026 16:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774283268;
	bh=aYoLJh09cL4RvjP6b/lmgRvFFyBy6BfjrUniTniFO1k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QZAjT6O0R6t5ig33cvF1V6dOyjODQz+aH8hI7aPNZvUhsejxxqAta4k+NIKIUBwx0
	 kM6loSaE/V1Fi+O62bsud3AgSi2UAAo1uGizyau9m+OVQRAxtvfFpNGRPKIIKW0/o5
	 K0GajAPsvOpOkFSIOgbYGX1kV/aTJ/5fsL4hRo2X7JxRS8LzeBcxLFHAH3p5XkgMkd
	 o91ehBuObeVe508PZZpaIz+T3kpoGo4OVLHsvT7KG8S8rNZ2KYJh8WDRSxKWGaj9i+
	 1yUGJOZf0bgnZvLenEBF/zv123cHVF4xxHwObc3MiC+yIXu2h1JtPSnzyagOEsTDq/
	 gU4JIclMVaA1A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B9CDF483D0;
	Mon, 23 Mar 2026 16:27:48 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Mon, 23 Mar 2026 11:27:47 -0500
Subject: [PATCH v4 5/6] arm64: dts: qcom: Add AYN Odin 2 Portal
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-ayn-qcs8550-v4-5-33a8ac3d53fa@gmail.com>
References: <20260323-ayn-qcs8550-v4-0-33a8ac3d53fa@gmail.com>
In-Reply-To: <20260323-ayn-qcs8550-v4-0-33a8ac3d53fa@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>, 
 Teguh Sobirin <teguh@sobir.in>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774283267; l=3470;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=ZfKW7/YbZ5ckdEGFxOTvbAnJnJuzjIknocRzI5hh6Ag=;
 b=kqQbllFW9SlGBPqcd1PpGgPcUansk0XJhyDdJt9+Rhm/PA8OECxzHURoHR1vWWkE2GQSJcsJB
 6xL0sWCuNLUA9hZMZomyJhQYdJgOxG3OD0xee+xaBA1AiG6/39gxb5T
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
 .../boot/dts/qcom/qcs8550-ayntec-odin2portal.dts   | 84 ++++++++++++++++++++++
 2 files changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index da534d839084ba60bc794b8f420baf06bcbfc6d8..5ed85a8843c5ac5cf943f9d0c40ad6da7cba219c 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -172,6 +172,7 @@ qcs8300-ride-el2-dtbs := qcs8300-ride.dtb monaco-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-ayntec-odin2mini.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-ayntec-odin2portal.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/qcs8550-ayntec-odin2portal.dts b/arch/arm64/boot/dts/qcom/qcs8550-ayntec-odin2portal.dts
new file mode 100644
index 0000000000000000000000000000000000000000..bd6ba0ab941d3325f76f53e7ed65478c67b9d028
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs8550-ayntec-odin2portal.dts
@@ -0,0 +1,84 @@
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
+&i2c4 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
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
2.53.0


