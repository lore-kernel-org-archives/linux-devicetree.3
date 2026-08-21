Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42939377AB0;
	Fri, 21 Aug 2026 03:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787283068; cv=none; b=r5eQljTYiaCShqPFedQLr5nty9foqCy+O+XsbE+lhQefCat1fhgI5UjAUlukFhZPSGCeYcsCUirfM6WDd611efpR2D5Eyn/yma5T1djv2GFBJnMjshjEMwDxqFU5MqO3//5qw8VeyRvyL1Pi1vcUACJh0OzdaG/S4hr0YHrgtCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787283068; c=relaxed/simple;
	bh=6vNt3XsrL18Sw77wVcoNbSAXxmAxsbzxcW97hUn5X08=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j7EFny/SQ/p3aV7H+r6GRPExnoANJ7iJkcQFbdpk9r7j7h1Eh0hm0PsWcu7aOFyNN2u4BgQ4HSed8ZyzVc/Cn0wK5LgYbLICUJY2gzwa+KOSLQMkZ1Qxd1gL18Ik5Je9mwHxd6GPq+h7exD9VPDVuf+QM77O1ncE6m3sIa/P/3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h1cn9XkH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h1cn9XkH"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9A853C4AF0E;
	Fri, 21 Aug 2026 03:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787283067;
	bh=6vNt3XsrL18Sw77wVcoNbSAXxmAxsbzxcW97hUn5X08=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=h1cn9XkHlCLGr4oIbL78CGPexFWxaeJtp4fHxAAGT4DRZG767XTQQD8R03uBs9twg
	 K278SXdgGfpgolLRZ1N0YwriL/qQ9oSwljogAycvYHVNj0Ppeuzz3LZqYb9E3N1orL
	 /8Hu1ZITlsmSb/lxebswKybSBN1GBEC1WdIwpd95CEH8eH0Ln5Bv1av15bRMIv0910
	 iDsa8s5jrSWiFUpqG3RTWqIPL0VChuLKUN6bm7HJ/Z/AnMeiJUBJF0J2Q3ixWuoEif
	 1PNZLv1udBg+jz93vkhg1WJAvjBogBzgRcHTWSxUVBK5MNsnAsWpamtcJ0baDbDD8c
	 3Ug3Az5V1qxiQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 878D9C5DF88;
	Fri, 21 Aug 2026 03:31:07 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Thu, 20 Aug 2026 22:30:49 -0500
Subject: [PATCH v2 4/4] arm64: dts: qcom: Add Retroid Pocket Nova
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-rp-qcs8550-v2-4-d4ce78fe9385@gmail.com>
References: <20260820-rp-qcs8550-v2-0-d4ce78fe9385@gmail.com>
In-Reply-To: <20260820-rp-qcs8550-v2-0-d4ce78fe9385@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787283066; l=4225;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=zGBEUz6ABbCf2aMwWD7LVOXr1P8GQTqlrIIoWoLngV8=;
 b=v6S+yDWey4dhdV8bTgg3NF56Yp32I2XmV8/0FWseg0LR3Dws0CMH4d7RrjQ3KUhOVd2lrQmXp
 T9gQY9s/4hhBbtB2JOEklzQ+qmfw6Jp78SnthQY3cD1roPgE402o/aG
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

The Retroid Pocket Nova is a high-performance Android-based handheld
gaming console powered by the Qualcomm Snapdragon 8 Gen 2 processor
featuring a 4.5-inch 4:3 AMOLED touchscreen.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/qcs8550-retroidpocket-nova.dts   | 118 +++++++++++++++++++++
 2 files changed, 119 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 09b3c5b2d9dab..582805e89f4cb 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -196,6 +196,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-ayntec-odin2mini.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-ayntec-odin2portal.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-ayntec-thor.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-retroidpocket-nova.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-retroidpocket-rp6.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-rb5gen2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
diff --git a/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-nova.dts b/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-nova.dts
new file mode 100644
index 0000000000000..2422be63f0f13
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-nova.dts
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: BSD-3-Clause
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include "qcs8550-ayntec-common.dtsi"
+
+&{/} {
+	model = "Retroid Pocket Nova";
+	compatible = "retroidpocket,nova", "qcom,qcs8550", "qcom,sm8550";
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pmk8550_pwm 0 860000>;
+		brightness-levels = <1023 0>;
+		num-interpolated-steps = <1023>;
+		default-brightness-level = <600>;
+		power-supply = <&vph_pwr>;
+		enable-gpios = <&pmk8550_gpios 5 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&pwm_backlight_default>;
+		pinctrl-names = "default";
+
+		status = "okay";
+	};
+
+	vdd_disp_1v8: regulator-vdd-disp-1v8 {
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
+	vdd_disp_2v8: regulator-vdd-disp-2v8 {
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
+		pinctrl-0 = <&ts_p_rst_default>, <&ts_p_int_default>;
+		pinctrl-1 = <&ts_p_rst_sleep>, <&ts_p_int_sleep>;
+		pinctrl-names = "default", "sleep";
+
+		touchscreen-size-x = <1280>;
+		touchscreen-size-y = <960>;
+	};
+};
+
+&mdss_dsi1 {
+	status = "disabled";
+};
+
+&pmk8550_pwm {
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/sm8550/retroidpocket/nova/adsp.mbn",
+			"qcom/sm8550/retroidpocket/nova/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&spk_amp_l {
+	firmware-name = "qcom/sm8550/retroidpocket/nova/aw883xx_acf.bin";
+};
+
+&spk_amp_r {
+	firmware-name = "qcom/sm8550/retroidpocket/nova/aw883xx_acf.bin";
+};

-- 
2.54.0


