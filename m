Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331DC43E083;
	Thu, 30 Jul 2026 14:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785421188; cv=none; b=d+ZIHJ/ZXpIyJ/bHn91gE5vsVr/hUSI9QuqHFHxgsbIlDQ7HdGEyDb7kM+bfcWzfL13itQ6bLHoZFeNl/V37BCYSznMVSrfzzSO7rPYJ55fK/rZRzXt2VrA3gMxsRRb2q37suwKqMlA74sBGj3OH4kUovsoIaB98lKi8zLgsW+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785421188; c=relaxed/simple;
	bh=Hi1YkxfceVgtFipgjjIpyUNM5m6gLUbxZ4gNCTloBX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qQfnAtS+oVrD5ncWTCTgnlpy9XAJfZfe9kJtwrfUJ6iJ1C2zj51rhn+LAOfHDkk5d/+cT2OFKKHGGzDn8AkG2Lq2ha5nwc/BHmIL5oVbG4Awvw6RFre+tlkS/QL8ISz9mUE41xQEFDo4vDJ2p6DxVPZgS0Z969mQkH+7GHPFpH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TdXDqXct; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TdXDqXct"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 383C81F00A3A;
	Thu, 30 Jul 2026 14:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785421187;
	bh=skqm43f8A9GOCLRYP1KcI8fxx/C4GFRkSpyDI6bYb7k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TdXDqXctKZDe/JO8j/W4kA/HBO5Qi4tWyONZ2XgyjSESDHB9J+OzMonro3hRk8a5O
	 6/EU8OWXAOaJFhdEIiF5xExoF9a/UkSKGuMA+TG8F8nsrDJQ0X7nyYD6xvm31NJG8/
	 +O2vNxvwAVV9NppZ3Tg2uOZwuAUxvRgaKol5H9pLNZFBc5z23JsyNSdWpp2SDfv8p1
	 sCdb+IEIKqZ9nmJq9Fp6UV7nRfSqszFhBlqQYDl2z9bYNtTrwmcY2FtyrpEwSBOoUD
	 0Fw2qP9qHXqgG+TLESQ9/P/YYuQbqITPmw1Pr4Rv674tjhIzb4xSFYkzw1kcRsnLPP
	 U2zYdhbt9SE1w==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 30 Jul 2026 16:19:17 +0200
Subject: [PATCH v3 5/5] arm64: dts: qcom: hamoa: Extend QMPPHY description
 for USB4
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-topic-usb4phy-v3-5-ccf0f7ea98b5@oss.qualcomm.com>
References: <20260730-topic-usb4phy-v3-0-ccf0f7ea98b5@oss.qualcomm.com>
In-Reply-To: <20260730-topic-usb4phy-v3-0-ccf0f7ea98b5@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785421158; l=2242;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=HwZ6zVPV1o6/tn+zDaCV5RCzPgfTxZ8V3UFPWZd8A4U=;
 b=WRcrqx4HggPofrb955ImTPuwJfi7cNzvgGYCsMsUtYxyZzhlpOKfeqEYAEEGjF5VLpcxrr89j
 j1H0mlFTsTACnOvrVk1EjSZaM79acCIbghGgHkWyffo0pm+bF8Y4ylk
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The USB4 part of the QMPPHY requires that one more GCC clock (P2RR2P -
PHY-to-Router, Router-to-PHY) is enabled for the PHY to initialize
successfully. Describe that.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 09527dcf9576..2effc0319a01 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -2825,11 +2825,13 @@ usb_1_ss0_qmpphy: phy@fd5000 {
 			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
-				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>,
+				 <&gcc GCC_USB4_0_PHY_P2RR2P_PIPE_CLK>;
 			clock-names = "aux",
 				      "ref",
 				      "com_aux",
-				      "usb3_pipe";
+				      "usb3_pipe",
+				      "p2rr2p_pipe";
 
 			power-domains = <&gcc GCC_USB_0_PHY_GDSC>;
 
@@ -2896,11 +2898,13 @@ usb_1_ss1_qmpphy: phy@fda000 {
 			clocks = <&gcc GCC_USB3_SEC_PHY_AUX_CLK>,
 				 <&tcsr TCSR_USB4_1_CLKREF_EN>,
 				 <&gcc GCC_USB3_SEC_PHY_COM_AUX_CLK>,
-				 <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
+				 <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>,
+				 <&gcc GCC_USB4_1_PHY_P2RR2P_PIPE_CLK>;
 			clock-names = "aux",
 				      "ref",
 				      "com_aux",
-				      "usb3_pipe";
+				      "usb3_pipe",
+				      "p2rr2p_pipe";
 
 			power-domains = <&gcc GCC_USB_1_PHY_GDSC>;
 
@@ -2967,11 +2971,13 @@ usb_1_ss2_qmpphy: phy@fdf000 {
 			clocks = <&gcc GCC_USB3_TERT_PHY_AUX_CLK>,
 				 <&tcsr TCSR_USB4_2_CLKREF_EN>,
 				 <&gcc GCC_USB3_TERT_PHY_COM_AUX_CLK>,
-				 <&gcc GCC_USB3_TERT_PHY_PIPE_CLK>;
+				 <&gcc GCC_USB3_TERT_PHY_PIPE_CLK>,
+				 <&gcc GCC_USB4_2_PHY_P2RR2P_PIPE_CLK>;
 			clock-names = "aux",
 				      "ref",
 				      "com_aux",
-				      "usb3_pipe";
+				      "usb3_pipe",
+				      "p2rr2p_pipe";
 
 			power-domains = <&gcc GCC_USB_2_PHY_GDSC>;
 

-- 
2.55.0

