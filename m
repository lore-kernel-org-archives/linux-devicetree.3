Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E5D39CD00;
	Mon,  3 Aug 2026 06:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785738863; cv=none; b=UUYycxy3tVhjwfZibK1tgVbQjjzdQRrOX1V+TWLBL9jGgwy8eck7DBGbYVF4NXGZmtz7/6IPedtFSzch/ZiQBhAb5Vx3iIG3DEAQ53lRXlJKbNdsOiGgl9PZhyiqvVyiWHEzZ6Hsw1WIJEUG2jEf2oRB4lbOh9qMx/997QdNtIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785738863; c=relaxed/simple;
	bh=4sJvvMKqDAiUD1FmEolZmRf4tcYfQLC+t7CWNbzC888=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kYvRoRNxdQyYZeK7vnQ841uzBOh9PpzHo3uk231fxy0oaI6oIMVK7EFaD87vGkOR+xqLCO/i6NO+ADkIGu/gujbDfHaZTg9c9En/+ceOABKZyHVNwtFHPBfMtGlC1i2ZvmaiOt0vHNsT1UdNYZmEMmuYyn+P/M/i1ufV+ZIltWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FDx9GwaN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FDx9GwaN"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8D562C4DDE7;
	Mon,  3 Aug 2026 06:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785738863;
	bh=4sJvvMKqDAiUD1FmEolZmRf4tcYfQLC+t7CWNbzC888=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FDx9GwaNrREPI0tQ+5uiDH6BxJljmoH34cd+aSuOKUp9gmu96aczWgWYxrMGh/OH+
	 ydnLnkdp9pWJzUOttlyefi5UxOLkQOfFJ16hzqwEUm9iX5ivFjWPfqiwPKSssMoF79
	 ZjFRucIZHHyHYFiODjljdIRMjZIblydU2DQCh9wViegdKRzmuTROT7PAct16Y3vVBS
	 zapJDhxn5NW3PyjEAu7bj2vTST7ITCLt3qyQaJ8ewwF7xaOF1N2JgCyEdIt7l3syWX
	 Q70nDDLkiZQUlLTYnOGaCS+RTAqhA81TGpIvnArWc9iyRTlm648GWl3ShoNoaAd/ZN
	 /S3FvsJEYitgQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C4ECC55184;
	Mon,  3 Aug 2026 06:34:23 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Mon, 03 Aug 2026 08:34:08 +0200
Subject: [PATCH 10/28] arm64: dts: qcom: sm8550: Fix swapped USB QMP PHY
 vdda-phy/vdda-pll supplies
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-phy-supply-fix-v1-10-5880630cde3e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3081;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=G/hUR4dLz4PZKJ0swTECUN+gPEa0RpM7PDHW0T+4Ez8=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqcDZk6yKeeW3F/RGUvaGLzFI6FzRaREuWHsWUF
 QtuTwl26PeJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCanA2ZAAKCRBVnxHm/pHO
 9QMhCACfLtj3EJO5dGdsOhuoN0INIbeymhTBmZTMi8YzDDGapu9kFAURSotJNRNbzWRll/B3nmM
 jtAJk7BTs3zqyLVu/j2+spKPUD77KLRMl6rJthRCoJnb1Zt1ib37D7mH2iUZCa6yIR1jgenG9V4
 2cxzgrIlzcdsIgifPcSfohK/9W206gts55CHviFwlQQ/nfnJUUtfiHtOlT7X7/gHxQZFywQrlL9
 PnL1oEDqu0O9kLN1YYhPK853BdnXyRJm3sDk/rst9dDQWeav4YsxqfD29C0KkPYX6Ual3gJz/co
 sSQ2n4aCVuuRpfyOtAhNNKn5fJiITiXRvAb2+hTBdsQo7ojs
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

Fixes: b5e25ded2721 ("arm64: dts: qcom: sm8550: add support for the SM8550-HDK board")
Fixes: 772e6bc4a0a9 ("arm64: dts: qcom: sm8550-mtp: Add USB PHYs and HC nodes")
Fixes: d228efe88469 ("arm64: dts: qcom: sm8550-qrd: add QRD8550")
Fixes: 39c596304e44 ("arm64: dts: qcom: Add SM8550 Xperia 1 V")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Assisted-by: Claude:opus-4-8
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts                     | 4 ++--
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts                     | 4 ++--
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts                     | 4 ++--
 arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index ee13e6136a82..25ff5e39dd34 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -1374,8 +1374,8 @@ &usb_1_hsphy {
 };
 
 &usb_dp_qmpphy {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
-	vdda-pll-supply = <&vreg_l3f_0p88>;
+	vdda-phy-supply = <&vreg_l3f_0p88>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index 5769be83cfbd..7c634572c6b7 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -971,8 +971,8 @@ &usb_1_hsphy {
 };
 
 &usb_dp_qmpphy {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
-	vdda-pll-supply = <&vreg_l3f_0p91>;
+	vdda-phy-supply = <&vreg_l3f_0p91>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 2fb2e0be5e4c..ceb5cd3c5bf3 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -1274,8 +1274,8 @@ &usb_1_hsphy {
 };
 
 &usb_dp_qmpphy {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
-	vdda-pll-supply = <&vreg_l3f_0p88>;
+	vdda-phy-supply = <&vreg_l3f_0p88>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
index 0e6ed6fce614..367f6eae5e65 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
@@ -766,8 +766,8 @@ &usb_1_hsphy {
 };
 
 &usb_dp_qmpphy {
-	vdda-phy-supply = <&pm8550vs_2_l3>;
-	vdda-pll-supply = <&pm8550ve_l3>;
+	vdda-phy-supply = <&pm8550ve_l3>;
+	vdda-pll-supply = <&pm8550vs_2_l3>;
 
 	status = "okay";
 };

-- 
2.43.0


