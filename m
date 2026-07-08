Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CD936A35B
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 00:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783471465; cv=none; b=gb9SU5YKwQ0VqFkNrQ78DKqBcO8DsIsBbbwzA6+oljySk6lr+x/ZMVu0ZNqYQv3iuQqIldiYryAMB418BByyjV/a0ZPbmonmf1Zbfw/HpTRaNSM7NztiT2fhCrHdfT7HVigRd7KhB2xiXLja9bGpzuPsvrfhk4Y4K0LbMuJomRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783471465; c=relaxed/simple;
	bh=NFCULpzSRjECzVlGvUwWPvWRDgzlp9R6F9Sy+uS9w/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XRSq2Oz+oIHXLcKLB81t1VGWGHpzyODVtYaNLVhTHyV41KPjEfZe8QHpSznbph3Gb2zg7Iraxq2b6J76tOmq6n7Qrv8nnCWA5lfsLm9vhvEDbIj10jjUZx0vkp6ltJzI/vCP3dGVZk7vM8NNva8G1kP3sR2OH19tdLN2R96FRmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mc5CUGrv; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mc5CUGrv"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493b61b52b6so741255e9.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 17:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783471462; x=1784076262; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TyBwsulYkPGNh82Flz8VkrGYyu0iw+yuSg8oZwZidi4=;
        b=Mc5CUGrvxSHfNudsjS/bzvN6PdVVgB7ZY3lxqQo46pJKxLKW6e2p6XXiTdcVLSw04z
         n4TUkxFzcN+jiY7Vn2+3GjB2PZRNo7KtxvjHVsYL86Cd5uAWWjI5oZdz9MYsITSzyES2
         RPXeiLEI/qT/vjpnGy0M3chU74sYhy6g0JI+dOt7tdRp9Mcq7pszAF4s7hAxjtnWLmk6
         EBNw/Kg0g5z4W94rksZzLQ+CiLoqgTwU/PffHNGPK6L6D4meNANgqBVSJRts+NP2MN4r
         PESVtpCNqhsIOZjEDypFSmwfeuEkGcLTNLwH+bAW1V9pG4x2tRNq5MgXi8xMxDXbGm54
         kfaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783471462; x=1784076262;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TyBwsulYkPGNh82Flz8VkrGYyu0iw+yuSg8oZwZidi4=;
        b=Y//88NHjfCQFBv2YSNv93NgFEmFr4LgH2RVX51+3xR8XNDMMQWmi8roi9rWbEEYQrU
         8G+emzmo6NuwCSbEzfzWQZ6WrM1VNYUuEj4Uvit9u5byCiJB7+EaMonyFk4Tn3IgCtOc
         SmTJfNTxUkeyUFFtXN4CCAOhnY2gyR85vLFZeohvt3u451SfM6uTk9u9w0a1z8HnMeF1
         Y3D/6UVlscUnAnPAuLnXv7dN0xGzxYz3Eu9Vr2JW/AS+1uRxwZbnGg8pSMSY90dPSGdm
         oI692W9qZhdnw93uV9X8BeuBPVy0jWiykcU165brMHFzU12THg7deXfV2RbCGL4hEGhc
         KfTg==
X-Forwarded-Encrypted: i=1; AHgh+Ro43x/ZY7Fqp7v5l2Hy2s/a6YLhO6cxuO6xmhHXK3XY8nQUCo8RTWBJV/q9M2BG0+ib0Xd+n2Ukym8O@vger.kernel.org
X-Gm-Message-State: AOJu0YxMd7EB8eNEiE+6ZDgrHqgxahE0oAkZI3E3cwyDjhY8c4f9YBcy
	9+sQQimja9JXEQUWLS3HQxqTeoW5Hp/qcgQT9d/0ehiNe+sCHzMjJexNLh480RokDPs=
X-Gm-Gg: AfdE7clxOplX4kcO3xiY4EmrtVcH3dxfsYMh4JU7QUoTBHmkrx8uCEai2rEEzI2svuy
	XOo8KtEWa2lDVylzBAdTDrujJDjIx25V5J9HW9xkSsvgJsDxzQEkLpjFdtm/i44jthgdo2+anne
	PguU54LvXBksURCBdDzHxX0GwV9OA3w/MB+PbNEd24tP/IcQGvFcFMqomJJ81wYPIZaDoVhRq4m
	hMHzrXWYlOqzbtrz24yVdI9CssO9B3fc0gLD82R7vHCwejaB/hsy1w3RO3P7EwEDlluD1zORRJW
	HMLZdBfI1pQhnMYxAJOhfY07ML/YXKgidvs8BvE3URD0qx7jGK2wIhmvDUNai7nTh7UhgSYGFLX
	eKIQPS2eGuVYP59oIMVwuNp903YxtBEqmioEfZS89FkvKBI+2dIm+wvce8DBF0FL8G9n9ud9KZj
	V3/7PLF/ab7ORSe6kwxEroHio=
X-Received: by 2002:a05:600c:c167:b0:493:dfc8:77d6 with SMTP id 5b1f17b1804b1-493e6894732mr1947095e9.12.1783471461674;
        Tue, 07 Jul 2026 17:44:21 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.92.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0fc1348sm99727985e9.14.2026.07.07.17.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 17:44:20 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 08 Jul 2026 01:44:09 +0100
Subject: [PATCH v4 02/11] arm64: dts: qcom: x1e80100: Add CCI definitions
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-x1e-camss-csi2-phy-dtsi-v4-2-572348ad1b2a@linaro.org>
References: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
In-Reply-To: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5126;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=NFCULpzSRjECzVlGvUwWPvWRDgzlp9R6F9Sy+uS9w/E=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqTZ1bTLfReG5P5FbPFDIuxHQipmEWLb2+0PLSO
 nS67ohetgCJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCak2dWwAKCRAicTuzoY3I
 OhSpD/41+Rz8EY5a/BArbJmsFZddNdR4KlrNPqkLEU9WSqVMMs2sBtlwBo+4xKQ0QlUQi09CPnL
 K0UTL/FzgSxI3p0Sq3w9IAOk9nDci0iwaBgrqA3ZjhHm+1PwHf/j7cn0b1W2IP/n4GBHBSvHm0e
 SU+G1m3sm9o3GQ8cdKkZ394GCivIMC2FTcD/p7iaXXqb/H1vMg5ckDuLqNylfsHhfEWEjsocY6H
 DzKRAFs97E0rktbZWl4ehG2cfmF+RGO/ezqKOsy7pKk7nlL7DSmAz3dcfoVsm2S+Wxp9IyRLOOW
 kWrGxyjr+GHlfrC+BzMonhdjpR/AvKEsdBTwYqkgg+ARVlBpHruP+bEx62BSr5PISDgovTh0ovE
 vW8KXDkvTnH1dKEzmYt+ufY5V5PId4W4/1+rSvP5WfSvBCbyWBnbTyRnsoCoZXqYQqqzYoG7yRf
 WNDI8VpzQoneNdXXpwQKO5m0gh7W2lbCrbukhQm1TLcS+uWVh8ca0On29ZgJ/D+gwKNIYvAq5GI
 Px7WoJ9aHYY54Pj1P/ogF2OHTrSvbZL1RPkWhqT4f+WndhyWqz0TdWL/hD6X5vV7QFMXiolKAuw
 JJjAwB1jlv++G1YI3F9b3t7gkPCkHIrYoKIChmIOOlmg+IiLkzpPjONGrCGvio23tXEs0+O8wUz
 2wL6ad1dTmhB4kg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add in two CCI buses.

One bus has two CCI bus master pinouts:
cci_i2c_sda0 = gpio101
cci_i2c_scl0 = gpio102

cci_i2c_sda1 = gpio103
cci_i2c_scl1 = gpio104

The second bus has two CCI bus master pinouts:
cci_i2c_sda2 = gpio105
cci_i2c_scl2 = gpio106

aon_cci_i2c_sda3 = gpio235
aon_cci_i2c_scl3 = gpio236

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 150 ++++++++++++++++++++++++++++++++++++
 1 file changed, 150 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 9a8d6f020a391..9a854da9550c3 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -5551,6 +5551,84 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		cci0: cci@ac15000 {
+			compatible = "qcom,x1e80100-cci", "qcom,msm8996-cci";
+			reg = <0 0x0ac15000 0 0x1000>;
+
+			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci0_default>;
+			pinctrl-1 = <&cci0_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@ac16000 {
+			compatible = "qcom,x1e80100-cci", "qcom,msm8996-cci";
+			reg = <0 0x0ac16000 0 0x1000>;
+
+			interrupts = <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci1_default>;
+			pinctrl-1 = <&cci1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,x1e80100-camcc";
 			reg = <0 0x0ade0000 0 0x20000>;
@@ -6148,6 +6226,78 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 239>;
 			wakeup-parent = <&pdc>;
 
+			cci0_default: cci0-default-state {
+				cci0_i2c0_default: cci0-i2c0-default-pins {
+					/* cci_i2c_sda0, cci_i2c_scl0 */
+					pins = "gpio101", "gpio102";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				cci0_i2c1_default: cci0-i2c1-default-pins {
+					/* cci_i2c_sda1, cci_i2c_scl1 */
+					pins = "gpio103", "gpio104";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci0_sleep: cci0-sleep-state {
+				cci0_i2c0_sleep: cci0-i2c0-sleep-pins {
+					/* cci_i2c_sda0, cci_i2c_scl0 */
+					pins = "gpio101", "gpio102";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				cci0_i2c1_sleep: cci0-i2c1-sleep-pins {
+					/* cci_i2c_sda1, cci_i2c_scl1 */
+					pins = "gpio103", "gpio104";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_default: cci1-default-state {
+				cci1_i2c0_default: cci1-i2c0-default-pins {
+					/* cci_i2c_sda2, cci_i2c_scl2 */
+					pins = "gpio105", "gpio106";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				cci1_i2c1_default: cci1-i2c1-default-pins {
+					/* aon_cci_i2c_sda3, aon_cci_i2c_scl3 */
+					pins = "gpio235", "gpio236";
+					function = "aon_cci";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_sleep: cci1-sleep-state {
+				cci1_i2c0_sleep: cci1-i2c0-sleep-pins {
+					/* cci_i2c_sda2, cci_i2c_scl2 */
+					pins = "gpio105", "gpio106";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				cci1_i2c1_sleep: cci1-i2c1-sleep-pins {
+					/* aon_cci_i2c_sda3, aon_cci_i2c_scl3 */
+					pins = "gpio235", "gpio236";
+					function = "aon_cci";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
 			edp0_hpd_default: edp0-hpd-default-state {
 				pins = "gpio119";
 				function = "edp0_hot";

-- 
2.54.0

