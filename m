Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE7C39184C;
	Sat,  8 Aug 2026 17:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786210676; cv=none; b=rpzyM4hYZYQw5NeF8PRer8SLypNNFftgPSi8XZu5sqaVSHoEUwmLBrqCK2ELM7nRKnanmgCdETdsQvjrkFqHuoJHSElvQa0Oe2roqWYdHvfLTkiHSm6kIwTMUJE4C4LjG0VNObFyaC5w5p9tmOqbgFsnV9HY8bK11R1CxuRazQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786210676; c=relaxed/simple;
	bh=i2QLLnUlNOAbhHiR0Xs4H4ywCm9s/u7JdazPxY+h7fk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wu+rfWC1zQgUfB3OCiMK29mHYTkmM5IIbWTD2bj+F2j4t0ZEYAKSDUQ6zzP9CJWzKFx6CEXV4ah0omd4+X8NeDbgw3v5UUMPS7bGcHci4RedrZECtuIv+hCNEZ+YGnSwmQukbrRZAhpUqalzrunge9GGlICMtPGRScHSd3yAt+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eTQB5IAu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eTQB5IAu"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9518BC2BCB8;
	Sat,  8 Aug 2026 17:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786210676;
	bh=i2QLLnUlNOAbhHiR0Xs4H4ywCm9s/u7JdazPxY+h7fk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eTQB5IAu+Jvd1dEsmLOOpvh54CtMPpwZmE9hZKNgkl74g8fgJF+vRDv0W/pHv3SxV
	 LhXx7fVTw0FOnaFsQP/f80/jRLnQaKrevmNKu29xNnItTdwj/3JGWdCKj0haOR1sNy
	 geiCB9ej0drgb0EnlEL+QLOrprb6BgoiwNnXBDqNJAkTudRIxjBXyz1qfR3LLVsLJt
	 sSUJO25a8YRjiXtHOc45UimHilsKQ0MqsHSr6yo7IDmdPoFC5P6oGhbl4DV0pz9enB
	 ZrFy2Ebn4xLN792Gl6NjLjjMjvkAiUiJ4T4Qr+5TBjV26p3eHxvBg9Hv1iJbGmF705
	 9ypfVili8db4w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79E63C5AD56;
	Sat,  8 Aug 2026 17:37:56 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sat, 08 Aug 2026 12:37:57 -0500
Subject: [PATCH 3/4] arm64: dts: qcom: Add Retroid Pocket 6
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260808-rp-qcs8550-v1-3-a5a365ba3dc5@gmail.com>
References: <20260808-rp-qcs8550-v1-0-a5a365ba3dc5@gmail.com>
In-Reply-To: <20260808-rp-qcs8550-v1-0-a5a365ba3dc5@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786210675; l=4453;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=xW7sPVcXO5gmQnFSGLSqYPvpeyeYU4Nka+t7HsfMyXk=;
 b=0RGYqNJHmY9CtnKhB4wjXHr9LSlTOQ1RfCCGj1TAUj7JLuT5MD6+f4+K84HqFT4GxQJxwZnoA
 UoZbeY3BTC+DAGfB6cLP/HntHvdVWrTLRZWj8Ta5bYE9FSF+40zd9mF
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

The Retroid Pocket 6 is a high-performance Android-based handheld gaming
console powered by the Qualcomm Snapdragon 8 Gen 2 processor featuring a
5.5-inch AMOLED touchscreen.

This is based on the support by ROCKNIX, however their history does not
show who the original author was, so direct attributation cannot be
given.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/qcs8550-retroidpocket-rp6.dts    | 122 +++++++++++++++++++++
 2 files changed, 123 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index a7b0fb759099e..09b3c5b2d9dab 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -196,6 +196,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-ayntec-odin2mini.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-ayntec-odin2portal.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-ayntec-thor.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-retroidpocket-rp6.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-rb5gen2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
diff --git a/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-rp6.dts b/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-rp6.dts
new file mode 100644
index 0000000000000..eaffa2bd12671
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-rp6.dts
@@ -0,0 +1,122 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (C) 2026-present ROCKNIX (https://github.com/ROCKNIX).
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include "qcs8550-ayntec-common.dtsi"
+
+&{/} {
+	model = "Retroid Pocket 6";
+	compatible = "retroidpocket,rp6", "qcom,qcs8550", "qcom,sm8550";
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pmk8550_pwm 0 860000>;
+		brightness-levels = <1023 0>;
+		num-interpolated-steps = <1023>;
+		default-brightness-level = <600>;
+		power-supply = <&vph_pwr>;
+		enable-gpios = <&pmk8550_gpios 5 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pwm_backlight_default>;
+
+		status = "okay";
+	};
+
+	vdd_disp_1v8: vdd-disp-1v8-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_disp_1v8";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
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
+
+	ts_avdd_3v0: regulator-ts-avdd-3v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "ts_avdd_3v0";
+
+		regulator-min-microvolt = <3000000>;
+		regulator-max-microvolt = <3000000>;
+
+		gpio = <&tlmm 144 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	ts_vddio_1v8: regulator-ts-vddio-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "ts_vddio_1v8";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpio = <&tlmm 102 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
+&mdss_dsi1 {
+	status = "disabled";
+};
+
+&i2c_hub_3 {
+	clock-frequency = <100000>;
+
+	status = "okay";
+
+	touchscreen@38 {
+		compatible = "focaltech,ft5426";
+		reg = <0x38>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <15 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 14 GPIO_ACTIVE_LOW>;
+
+		vcc-supply = <&ts_avdd_3v0>;
+		iovcc-supply = <&ts_vddio_1v8>;
+
+		pinctrl-0 = <&ts_p_rst_default &ts_p_int_default>;
+		pinctrl-1 = <&ts_p_rst_sleep &ts_p_int_sleep>;
+		pinctrl-names = "default", "sleep";
+
+		touchscreen-size-x = <1080>;
+		touchscreen-size-y = <1920>;
+		touchscreen-swapped-x-y;
+	};
+};
+
+&pmk8550_pwm {
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/sm8550/retroidpocket/rp6/adsp.mbn",
+			"qcom/sm8550/retroidpocket/rp6/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&spk_amp_l {
+	firmware-name = "qcom/sm8550/retroidpocket/rp6/aw883xx_acf.bin";
+};
+
+&spk_amp_r {
+	firmware-name = "qcom/sm8550/retroidpocket/rp6/aw883xx_acf.bin";
+};

-- 
2.54.0


