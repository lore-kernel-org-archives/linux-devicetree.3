Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D8D39C015;
	Mon,  3 Aug 2026 06:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785738863; cv=none; b=pHpLZ1QVw+bSskmWyzoX/HyoVLZz5h3V0EfmQ6fXdr3ssM0avDYP/xB6erPQ3n870e/+I354fht8K7FZ25jFBT6FlqhWKVo7EE76ETzms6xTJgcUqUqpbck7XvOx7S1LdNWiuWhkZzqS2FTTZSwvd/WsYrwVq92bcWoZ2AtTL54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785738863; c=relaxed/simple;
	bh=RHjYr6A9bDGWoSjs7vbkBnNLu0X993I4pOtfEg0ex3E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UWsBhVhiVRsD0bM2A/CROwUH96IrxzzmT/5Ydd25ptM+6UBopnRnBfO1oLu60mSl9fKRX/LswoRdUggSGY28sad60GkyLcCQ3vKf8qzG8EBshPKzMneAf9SiIjLOM2l68HYbzQqEMDM5IVLaKm4+ZV7Gli83r7PDNtrZDU8DPq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d1Hs4w49; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d1Hs4w49"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51FD5C4AF10;
	Mon,  3 Aug 2026 06:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785738863;
	bh=RHjYr6A9bDGWoSjs7vbkBnNLu0X993I4pOtfEg0ex3E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=d1Hs4w49d9NvpNMtSm+Z1nZ8kMpJ8ruIhQ2tvfDQ1LHNMBcyd1/raotFThB2TIVOy
	 2QWnHUKVFhFVeRRhc+6B9tNyHsqaAjLMqLtKTwfeA4alKe92pCd+1vnoCCezsnP1DC
	 43fH36t8mGFS4WXnQJDqNRsi1gpuOjVNY6Rlp6YBUMy2SKclmm67q7RgrL00VdFniN
	 HKZ5p9wHCN7iHgCCHSDjXFQq7s/eMz6LTSOjI596/jJLCQMulTPF7CxpvcgQ0nxqNR
	 0bocBNyblIy+1oL7STlfQJOdQCIwCg7EMNCTynVzezE/KMlOnRLUaGnaa6tIS5Eguh
	 /8Yrg8k4h3HaA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DA11C5518E;
	Mon,  3 Aug 2026 06:34:23 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Mon, 03 Aug 2026 08:34:04 +0200
Subject: [PATCH 06/28] arm64: dts: qcom: sm8150: Fix swapped USB QMP PHY
 vdda-phy/vdda-pll supplies
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-phy-supply-fix-v1-6-5880630cde3e@oss.qualcomm.com>
References: <20260803-phy-supply-fix-v1-0-5880630cde3e@oss.qualcomm.com>
In-Reply-To: <20260803-phy-supply-fix-v1-0-5880630cde3e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3477;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=R9gWgGPsJc/ReITNmuw8OdtfAfHDTeozmBiKZBujo5w=;
 b=owGbwMvMwMUYOl/w2b+J574ynlZLYsgqMEveIpdlUGaUEvVx0cl9RyIqlHumtsRUefT2sq3p+
 H/dLYS/k9GYhYGRi0FWTJElfamzVqPH6RtLItSnwwxiZQKZwsDFKQATyYti/+/W5Tu559g902/H
 HrtGSqSImITzZ7esbGdL+2H4Six8ktcspuf3/5+Q92vP7FvjUseVcvVVR975s7y6PG3R8cWL+gq
 DYj99al3rOWWvs+eF+zfkpYVF7pnLybxLybZawzS/tSju1gWT6n0pK4+VW2X/aMz60dGS/ajxV4
 BXS++xCX4qdod85HhrzYot3nz2zYjyCT5Qea5y/zXpwhuHlqTc1a8o+v49UM+ZreDizMTKAx8XO
 8+NPTxBq/mskvmBAx255emrOj6GXf/SvISpd4XQ1r6k0i+T/RbcPlOw5Pc35U1v5STPv483sihT
 qT+9Z2HMRZ/NpbY+Zy1OHG0SnxhR7aVUfrDi9KcfGRmrAQ==
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

The QMP PHY expects the vdda-phy supply to be around 0.88V and the
vdda-pll supply to be 1.2V. But these two supplies are swapped for the
USB QMP PHYs on these boards, feeding 1.2V to vdda-phy and 0.88V to
vdda-pll.

Fix it by swapping the two supplies back.

Fixes: 0ab1b2d10afe ("arm64: dts: qcom: add sm8150 hdk dts")
Fixes: b33d2868e8d3 ("arm64: dts: qcom: sm8150: Add USB and PHY device nodes")
Fixes: d1f781db47a8 ("arm64: dts: qcom: add initial device-tree for Microsoft Surface Duo")
Fixes: d0a6ce59ea4e ("arm64: dts: qcom: sm8150: Add support for SONY Xperia 1 / 5 (Kumano platform)")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Assisted-by: Claude:opus-4-8
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts                   | 8 ++++----
 arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts | 4 ++--
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts                   | 4 ++--
 arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi   | 4 ++--
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
index 8fb04ce72f91..cdced5c848d3 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
@@ -801,8 +801,8 @@ &usb_2_hsphy {
 
 &usb_1_qmpphy {
 	status = "okay";
-	vdda-phy-supply = <&vreg_l3c_1p2>;
-	vdda-pll-supply = <&vreg_l18a_0p8>;
+	vdda-phy-supply = <&vreg_l18a_0p8>;
+	vdda-pll-supply = <&vreg_l3c_1p2>;
 	orientation-switch;
 };
 
@@ -812,8 +812,8 @@ &usb_1_qmpphy_out {
 
 &usb_2_qmpphy {
 	status = "okay";
-	vdda-phy-supply = <&vreg_l3c_1p2>;
-	vdda-pll-supply = <&vreg_l5a_0p875>;
+	vdda-phy-supply = <&vreg_l5a_0p875>;
+	vdda-pll-supply = <&vreg_l3c_1p2>;
 };
 
 &usb_1 {
diff --git a/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts b/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
index 835ef929ff2d..f37e11bde067 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
@@ -520,8 +520,8 @@ &usb_1_hsphy {
 
 &usb_1_qmpphy {
 	status = "okay";
-	vdda-phy-supply = <&vreg_l3c_1p2>;
-	vdda-pll-supply = <&vdda_usb_ss_dp_core_1>;
+	vdda-phy-supply = <&vdda_usb_ss_dp_core_1>;
+	vdda-pll-supply = <&vreg_l3c_1p2>;
 };
 
 &usb_1 {
diff --git a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
index 0f2d511624a8..6a6564d8d7f7 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
@@ -438,8 +438,8 @@ &usb_1_hsphy {
 
 &usb_1_qmpphy {
 	status = "okay";
-	vdda-phy-supply = <&vreg_l3c_1p2>;
-	vdda-pll-supply = <&vdda_usb_ss_dp_core_1>;
+	vdda-phy-supply = <&vdda_usb_ss_dp_core_1>;
+	vdda-pll-supply = <&vreg_l3c_1p2>;
 };
 
 &usb_1 {
diff --git a/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi b/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
index 70fd6455518b..6c2e2bf869d0 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
@@ -869,6 +869,6 @@ &usb_1_hsphy {
 
 &usb_1_qmpphy {
 	status = "okay";
-	vdda-phy-supply = <&vreg_l3c_1p2>;
-	vdda-pll-supply = <&vreg_l18a_0p8>;
+	vdda-phy-supply = <&vreg_l18a_0p8>;
+	vdda-pll-supply = <&vreg_l3c_1p2>;
 };

-- 
2.43.0


