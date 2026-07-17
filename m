Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612A1399019;
	Fri, 17 Jul 2026 11:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784286020; cv=none; b=OGKD5H2PNrLgiWzbfelqxF0oJIk5qvXgzS1ejLMjWBAiqly7vXDY1IYoKSO6aSdDiSESzP1IF8RyCNqBwwFIQ8HCzHGmEc7vZio3I9EgiPc5kxf6VtUanoSKjdD87fMqeLDX2+TuvZj7J5fRb1kmj1yjfmjkNwL93KTxeqcFceM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784286020; c=relaxed/simple;
	bh=hXu5ZJYQuDfvrGUlzp1NvXTfaEFbak+St8683/erj7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hpgpZOlzaEjtRyNJCn8SMdJcz6j082lKeCjNcCNyCEpfITuxLTtA7WB8ADk1PRADGdWRNPTkkgLGeny8u7Ov0jQLsVG0oJaR/7pO7S/VVon7SOkon9jB38EO/aF5DXqytku7NHvpmzOIdyqevznYE6HPyMN7DMmszWNePcygyWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C2oLCPND; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C2oLCPND"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B56C21F00A3A;
	Fri, 17 Jul 2026 11:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784286009;
	bh=4ykgKUN106QiuUpR/pPtHZ8x8DWmkRtzQc/ff1xElmo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=C2oLCPNDsCrI9/IDyUygicl5FN+J0T7SGvy3zi0kcOmi4C9s/EELvKLaHUQWcHwDe
	 R2F4TuXsC4hi4LbUXlfMBAgQGmAUM2GJ9qIYU2URekcPK+o0Hkm1wMxUXr7vLIIh+x
	 M0vR6G4dry4k94ui2TuV2UL8eO844PG6ZJFQJ7oW5NI2JgMPZf1lbaOTdqXewDRy6E
	 TFyl8jd/cnbEwuDuDStiCryaCQXexhSiV622AfJMRZdJgNhpzdSEZOi047+acrmiJT
	 4hBCwe8qyYNKvIRsXNWWvvaYFS2LUuGmAuK3XDZRHel24TgC3chbgvFZpglqDeIIeP
	 CNFHOjt6HcbDg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 17 Jul 2026 12:59:58 +0200
Subject: [PATCH v2 1/5] arm64: dts: qcom: msm8998: Don't pull-up I2C pins
 by default in sleep
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-topic-june26_dts_fixes-v2-1-797cd46e5d9f@oss.qualcomm.com>
References: <20260717-topic-june26_dts_fixes-v2-0-797cd46e5d9f@oss.qualcomm.com>
In-Reply-To: <20260717-topic-june26_dts_fixes-v2-0-797cd46e5d9f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca@lucaweiss.eu>, Gabriela David <ultracoolguy@disroot.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784286000; l=4969;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=HUc/8ETLRb60Ij+28JyMmpxO11lI+V490UhpEOFZO/4=;
 b=CLEsCCMXV7VsmTtm+zpZtRBRRpP9UJ3U6vg6sGk0coPK/306wAruKBjPgi8Sw353yOMf3rU7n
 rz4ykUM0bptD3yBx/fIzXyov4n79AEINYabmT4JKBZ7/f+koxrHbtCT
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

When the I2C controller is disabled, no communication is expected to
take place. Without traffic on the bus, the pull-up is unnecessary.

Both the vendor kernel for this platform and DTs of other SoCs in
upstream concur this logic. Change the default and clean up now-NOP
overrides.

Fixes: 0fee55fc0de7 ("arm64: dts: qcom: msm8998: Add I2C pinctrl and fix BLSP2_I2C naming")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi |  4 ----
 arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts  |  5 -----
 arch/arm64/boot/dts/qcom/msm8998.dtsi              | 24 +++++++++++-----------
 3 files changed, 12 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
index 3650f2501886..04d4741cdb5f 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
@@ -229,10 +229,6 @@ rmi4-f11@11 {
 	};
 };
 
-&blsp1_i2c5_sleep {
-	bias-disable;
-};
-
 &blsp1_uart3 {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts b/arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts
index 30222f6608da..69528771eda2 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts
+++ b/arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts
@@ -217,11 +217,6 @@ rmi4-f1a@1a {
 	};
 };
 
-&blsp1_i2c5_sleep {
-	/delete-property/ bias-pull-up;
-	bias-disable;
-};
-
 &blsp1_uart3 {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 347706011637..5038d0009c1a 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -1183,7 +1183,7 @@ blsp1_i2c1_sleep: blsp1-i2c1-sleep-state-state {
 				pins = "gpio2", "gpio3";
 				function = "blsp_i2c1";
 				drive-strength = <2>;
-				bias-pull-up;
+				bias-disable;
 			};
 
 			blsp1_i2c2_default: blsp1-i2c2-default-state {
@@ -1197,7 +1197,7 @@ blsp1_i2c2_sleep: blsp1-i2c2-sleep-state-state {
 				pins = "gpio32", "gpio33";
 				function = "blsp_i2c2";
 				drive-strength = <2>;
-				bias-pull-up;
+				bias-disable;
 			};
 
 			blsp1_i2c3_default: blsp1-i2c3-default-state {
@@ -1211,7 +1211,7 @@ blsp1_i2c3_sleep: blsp1-i2c3-sleep-state {
 				pins = "gpio47", "gpio48";
 				function = "blsp_i2c3";
 				drive-strength = <2>;
-				bias-pull-up;
+				bias-disable;
 			};
 
 			blsp1_i2c4_default: blsp1-i2c4-default-state {
@@ -1225,7 +1225,7 @@ blsp1_i2c4_sleep: blsp1-i2c4-sleep-state {
 				pins = "gpio10", "gpio11";
 				function = "blsp_i2c4";
 				drive-strength = <2>;
-				bias-pull-up;
+				bias-disable;
 			};
 
 			blsp1_i2c5_default: blsp1-i2c5-default-state {
@@ -1239,7 +1239,7 @@ blsp1_i2c5_sleep: blsp1-i2c5-sleep-state {
 				pins = "gpio87", "gpio88";
 				function = "blsp_i2c5";
 				drive-strength = <2>;
-				bias-pull-up;
+				bias-disable;
 			};
 
 			blsp1_i2c6_default: blsp1-i2c6-default-state {
@@ -1253,7 +1253,7 @@ blsp1_i2c6_sleep: blsp1-i2c6-sleep-state {
 				pins = "gpio43", "gpio44";
 				function = "blsp_i2c6";
 				drive-strength = <2>;
-				bias-pull-up;
+				bias-disable;
 			};
 
 			blsp1_spi_b_default: blsp1-spi-b-default-state {
@@ -1318,7 +1318,7 @@ blsp2_i2c1_sleep: blsp2-i2c1-sleep-state {
 				pins = "gpio55", "gpio56";
 				function = "blsp_i2c7";
 				drive-strength = <2>;
-				bias-pull-up;
+				bias-disable;
 			};
 
 			blsp2_i2c2_default: blsp2-i2c2-default-state {
@@ -1332,7 +1332,7 @@ blsp2_i2c2_sleep: blsp2-i2c2-sleep-state {
 				pins = "gpio6", "gpio7";
 				function = "blsp_i2c8";
 				drive-strength = <2>;
-				bias-pull-up;
+				bias-disable;
 			};
 
 			blsp2_i2c3_default: blsp2-i2c3-default-state {
@@ -1346,7 +1346,7 @@ blsp2_i2c3_sleep: blsp2-i2c3-sleep-state {
 				pins = "gpio51", "gpio52";
 				function = "blsp_i2c9";
 				drive-strength = <2>;
-				bias-pull-up;
+				bias-disable;
 			};
 
 			blsp2_i2c4_default: blsp2-i2c4-default-state {
@@ -1360,7 +1360,7 @@ blsp2_i2c4_sleep: blsp2-i2c4-sleep-state {
 				pins = "gpio67", "gpio68";
 				function = "blsp_i2c10";
 				drive-strength = <2>;
-				bias-pull-up;
+				bias-disable;
 			};
 
 			blsp2_i2c5_default: blsp2-i2c5-default-state {
@@ -1374,7 +1374,7 @@ blsp2_i2c5_sleep: blsp2-i2c5-sleep-state {
 				pins = "gpio60", "gpio61";
 				function = "blsp_i2c11";
 				drive-strength = <2>;
-				bias-pull-up;
+				bias-disable;
 			};
 
 			blsp2_i2c6_default: blsp2-i2c6-default-state {
@@ -1388,7 +1388,7 @@ blsp2_i2c6_sleep: blsp2-i2c6-sleep-state {
 				pins = "gpio83", "gpio84";
 				function = "blsp_i2c12";
 				drive-strength = <2>;
-				bias-pull-up;
+				bias-disable;
 			};
 
 			blsp2_spi1_default: blsp2-spi1-default-state {

-- 
2.55.0

