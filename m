Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2B43FF1CD;
	Mon, 15 Jun 2026 14:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781533346; cv=none; b=drLh0ICmu25+icNJdy7S5HyJMX5OCRcyp8pRoiD89jgWqGQU2vQRfTaSngYQBlkF8fxxKC67fIjFEXZ/4xIzs5xLvJU+4R0ysCY6zadBPebqmNErM7e+Z1T5nUqIVNTj8B1zFRNOWxCY37AK1SeJ4/Ztvu7bak/yASs0yELUuSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781533346; c=relaxed/simple;
	bh=18LkvRiFxJT9LtM/8h1fbVsp7ZRCooqkJ9IjL+qtg1s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BGE4KtXozLNusfCrsnAeO5IaFV81gWaGcd7nf7odU8Yyh+dyl2e+f/SEpWhqeGjDk+JkUzbA0ECdVCHN+/o/Fu3W0PowIIjIpr5NMYfmw4KqF3GAPPT4/ZGpxnOdcNysiJn1jGxlIt8Z8Zxvpbc+dlWoSLXw15nBXvDmFhC4trA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SEqOt/ay; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SEqOt/ay"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 600B41F00A3A;
	Mon, 15 Jun 2026 14:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781533344;
	bh=AMSyNNTik506E+dTuWae467hTPdmPjg+ZBT+jWgmOZE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=SEqOt/ayWVOSec8PHkmUi0+i46FjzdNGU8atsXr2C+WfjSmYw68ulrosAF+1uPC4w
	 hcNRxhxQLQueWDPM5cIc8rrQch1QTgCoqiQTKqQhzD7f9R0j6E+lL8zoqX0nTRHn9P
	 MYlLDjvSXfWjbrHbEoW1pv70p2+WyWIBQQ+Pr9YrVWZji4lMEy3mH70BKAa0fdPQ63
	 WMahubDRPe2C7lU7jhr8SPYa0tPP7QYxBmUyv9Sb+jobMSIwT0UxF0uXWRYHUuIXq4
	 YL/kort18s3SmVV7Vv8pnvTrcBwQoyYlAdDqt3AH6irkAcvWdY0XC7do4waP7tCPaE
	 rqXCEkYcJJ17Q==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 15 Jun 2026 16:22:05 +0200
Subject: [PATCH 2/4] arm64: dts: qcom: sc8180x-primus: Describe the display
 power net
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-topic-8180_disp_power-v1-2-18d36b548c48@oss.qualcomm.com>
References: <20260615-topic-8180_disp_power-v1-0-18d36b548c48@oss.qualcomm.com>
In-Reply-To: <20260615-topic-8180_disp_power-v1-0-18d36b548c48@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781533332; l=2504;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=aVx6FzXdsEdyr5fYijjvYe82JKcUF4w2bhl6br8I7hU=;
 b=VOZp3lWpNxZCC+DsDCceKYfTPD0JmFeaOqLrILJcbVkI4O9a+Qa+xCoKcRNXy+nn6hOn7coPF
 soGHuYRIK5IA8jJHj+960XtGm6nHhwtZ9DRepT35pOVYhalpJNZNsr6
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Describe and wire up the power supplies for the eDP panel and its
backlight. Previously, this was only working because of settings
inherited from the bootloader.

Fixes: 2ce38cc1e8fe ("arm64: dts: qcom: sc8180x: Introduce Primus")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts | 48 ++++++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
index ffe7c45366ed..ed4f7f10e376 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
@@ -29,9 +29,10 @@ backlight: backlight {
 		compatible = "pwm-backlight";
 		pwms = <&pmc8180c_lpg 4 1000000>;
 		enable-gpios = <&pmc8180c_gpios 8 GPIO_ACTIVE_HIGH>;
+		power-supply = <&vled_bl_pw>;
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&bl_pwm_default>;
+		pinctrl-names = "default";
 	};
 
 	chosen {
@@ -167,6 +168,38 @@ reserved-region@9a500000 {
 		};
 	};
 
+	vled_bl_pw: regulator-vled-bl-pw {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VLED_BL_PW";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&pmc8180_2_gpios 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&bl_pwr_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_lcm_3v3: regulator-edp-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_LCM_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 130 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&lcm_3v3_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
 	vreg_nvme_0p9: regulator-nvme-0p9 {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg_nvme_0p9";
@@ -540,6 +573,7 @@ &mdss_edp {
 	aux-bus {
 		panel {
 			compatible = "edp-panel";
+			power-supply = <&vreg_lcm_3v3>;
 
 			backlight = <&backlight>;
 
@@ -769,6 +803,12 @@ &wifi {
 };
 
 /* PINCTRL */
+&pmc8180_2_gpios {
+	bl_pwr_en: blw-pwr-en-state {
+		pins = "gpio1";
+		function = "normal";
+	};
+};
 
 &pmc8180c_gpios {
 	bl_pwm_default: bl-pwm-default-state {
@@ -950,4 +990,10 @@ rx-pins {
 			bias-pull-up;
 		};
 	};
+
+	lcm_3v3_en: lcm-3v3-en-state {
+		pins = "gpio130";
+		function = "gpio";
+		bias-disable;
+	};
 };

-- 
2.54.0

