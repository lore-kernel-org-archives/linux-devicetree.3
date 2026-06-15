Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BBF3FF8B4;
	Mon, 15 Jun 2026 14:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781533355; cv=none; b=eR7S7ck9PTUftpDu4yjNijA4/x728R9XI3r79C445zVNnRJXfM5sXH1umUhgPIqBLH4QiX3QmpfbKycWMDuiYdXuQBa6oNGtnUq2uvGkk4fgWYpUhlDTpkCjRsTJJhuGUqD+17uzyCO6GbgsTfQ0EhWNpKtmPLx2AJJkuvYuBFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781533355; c=relaxed/simple;
	bh=rZaVt8Ws5gtAJV+GoGQAWHPqAVxY5skFXxkyhwS/8JM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UL5h7jsiy/AW404DraLf8i/qeUK/1nFEvMPN1CiWM0+GAwK3UDig/+3ddnruN0/uQx27qwktcPHoVWzRwW6lyYwbRX1ckSb0crwgm4k9Uk+RqYD7KsvTHbvmwEdpRaSW67Xntyx6NFkbWwOKUFt3AIIBZVl+p5J3BScYkJk8Tqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dkB3ow2n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dkB3ow2n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DBF51F000E9;
	Mon, 15 Jun 2026 14:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781533353;
	bh=afxo2q67tV47U2FNyPKEGjT+gagcWsu+AwA1kg7ekPs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dkB3ow2nVpHeRl6oVTcUslzuUNe3cESpDUSy4pIGsHcyaRuosXFfPm/h6S8dkKZzC
	 Hwlw9qB7dbML7T2VSLF89GmNRyqhquLwLDy2Y1L/rMjBiSZm4xwSlo/4Unw2bZYI6g
	 OTrd2KDRygNvIsOe0WT2SERObCQE1wk+zDEFtnFP2l185lInE6MhBfRodsH4+CIlvM
	 cHCLhXEWpFODxKj3O5C10woALhQcaaAlwZOPGpYhdOucyfoj5NDcUSp3DksXIL4FJT
	 EojmhByhdP4VkBx7xXpxwudq8jWij75izb+VF+PRfrcEplmX0oANFcPU4GDa3YBdq+
	 7bUhb4RE12gSQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 15 Jun 2026 16:22:07 +0200
Subject: [PATCH 4/4] arm64: dts: qcom: sc8180x-lenovo-flex-5g: Describe the
 display power net
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-topic-8180_disp_power-v1-4-18d36b548c48@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781533332; l=2593;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=rnn0bOizRXEWen7is6SUvyZOZuwIq1kQ7NZm59fxIkM=;
 b=1zVR3mBgzZpzFwE9w394y/0ueK2NLLt2PHoG4OwotnXkqVwGNyJDCcxzoaWXkNIeOkRLtBaH2
 Ongebu+nEmFAziZbULGg7zmyc0Ajq98ei+x/lSHr7GUWztYbceldzgw
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Describe and wire up the power supplies for the eDP panel and its
backlight. Previously, this was only working because of settings
inherited from the bootloader.

Fixes: 20dea72a393c ("arm64: dts: qcom: sc8180x: Introduce Lenovo Flex 5G")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
index 0d2cfb830e83..0a8980c36c4e 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
@@ -26,6 +26,7 @@ backlight: backlight {
 		compatible = "pwm-backlight";
 		pwms = <&pmc8180c_lpg 4 1000000>;
 		enable-gpios = <&pmc8180c_gpios 8 GPIO_ACTIVE_HIGH>;
+		power-supply = <&vled_bl_pw>;
 
 		pinctrl-0 = <&bl_pwm_default>;
 		pinctrl-names = "default";
@@ -157,6 +158,38 @@ cdsp_mem: cdsp-region@98900000 {
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
 	vreg_s4a_1p8: regulator-pm8150-s4 {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg_s4a_1p8";
@@ -438,6 +471,7 @@ &mdss_edp {
 	aux-bus {
 		panel {
 			compatible = "edp-panel";
+			power-supply = <&vreg_lcm_3v3>;
 			no-hpd;
 
 			backlight = <&backlight>;
@@ -472,6 +506,13 @@ &pcie3_phy {
 	status = "okay";
 };
 
+&pmc8180_2_gpios {
+	bl_pwr_en: blw-pwr-en-state {
+		pins = "gpio1";
+		function = "normal";
+	};
+};
+
 &pmc8180_pwrkey {
 	status = "okay";
 };
@@ -765,6 +806,12 @@ ts_int_default: ts-int-default-state {
 		drive-strength = <2>;
 	};
 
+	lcm_3v3_en: lcm-3v3-en-state {
+		pins = "gpio130";
+		function = "gpio";
+		bias-disable;
+	};
+
 	usbprim_sbu_default: usbprim-sbu-state {
 		oe-n-pins {
 			pins = "gpio152";

-- 
2.54.0

