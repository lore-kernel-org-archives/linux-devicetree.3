Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F46139D6FF;
	Mon,  3 Aug 2026 06:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785738864; cv=none; b=DC4r4RGHXGw2WIjAC7i2PEX15WelbfVOILLzgDNyIWku5R7ibRiPuWM3j319QxR8LUM7uwgj9Nu58G3Ndkxnj64oVRTrqSPoULh6wKLQi2iIV2BSsmL+6oj69pk14Ug5KmAF6VYr2RpCs2uBGCRCkZZ/SFcoQ5NK2t5OtCtL3Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785738864; c=relaxed/simple;
	bh=XYQqKP2NjpZJhxX4FNO05rAZUXE6LKvcBsYr9HNWGuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ey9uuxxbCAEdTysJv5ZUyebu6k5YIvCf6CzsmOSMch/JkoscVnYgpNXOAo7mtotkZzWAUj5b1q0aPS6XLq1a/l14kNV8QHmbKDpoQ1BAt/D9qJX29E6hRK76lfumuJL5GYKf7RSMdhjnFPE0OgI9mTwbDpNAp/xHSzvnLMeiwpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VcUfRIBx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VcUfRIBx"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD151C2BCFD;
	Mon,  3 Aug 2026 06:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785738864;
	bh=XYQqKP2NjpZJhxX4FNO05rAZUXE6LKvcBsYr9HNWGuE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VcUfRIBxcNpRL+PrKzQd4PxCIK9EX/jiZX4KCthKBuoaxqFBd+Gm7Mf7F6ct1MVxw
	 FMQsgYm9OMArYcakx1DNN+ZEXEWY+nZwqAfM/CbUg8kpe+/X4fIX9R1SBq+iJ+d7KA
	 0IPgLekJ1lVwh+gyAxkiwpkq249cf9ICWtFUPWkLWDzaO7A04U+imw9NHex270UPzI
	 NsJMvEkgVIqrVE9FcJOp6U1Lg1vvxEFemHYBs5oz565617Ct/u5wQOGtCEznGS7Xlq
	 MvnLaoEkbB08Ms4C0ZkZ4rx7Qz0Hn9ohRSemekpsvGJ9e36bCEWYoDyEmWZ0ej5XUr
	 Nur61HG4EMlsw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9874C55184;
	Mon,  3 Aug 2026 06:34:23 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Mon, 03 Aug 2026 08:34:13 +0200
Subject: [PATCH 15/28] arm64: dts: qcom: sc7180: Fix swapped USB QMP PHY
 vdda-phy/vdda-pll supplies
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-phy-supply-fix-v1-15-5880630cde3e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3137;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZTUO48wX/O2TtZs//L9vqYyAfGPkoOl30FEYyaJO07c=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqcDZmMv5/4xNOquldUMxOxUQ2IygYfy07SMENf
 wef7gI5eV2JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCanA2ZgAKCRBVnxHm/pHO
 9TDdB/94sRX7tM8YOCEWiiZnfIIS6ompLwtQzgsofspEAG5Tech4fHd8E/JMjc4w/+ZjDHge1Uu
 azXP56KSP5v70rDHKOQCnww9PBeGzgRVlc8r6Olcu6gbPS4MD3JmgEiqCBGU0AMtt0aGADBoR8N
 eqnRnw4Ye+hL7noo4t88LX57Liena2o5po2sxu9iqKmE+/RylpUumITIOBaY7edbVZLQpmn2n7X
 Pps6WJlz2E7cIK6rn7+3hs0XPYP4Nn31+YTafX5RIRvOVrcvSGnznYkSUVBXKAy88gGTO+Tk7jS
 MZtalwzv/90aN2pu/IOL93SHdRB2FJgwdwUkPvUyjhM7f1mU
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

The QMP PHY expects the vdda-phy supply to be around 0.88V and the
vdda-pll supply to be 1.2V. But these two supplies are swapped for the
USB QMP PHYs on these boards, feeding 1.2V to vdda-phy and 0.9V to
vdda-pll.

Fix it by swapping the two supplies back.

Fixes: 0b766e7fe5a2 ("arm64: dts: qcom: sc7180: Add USB related nodes")
Fixes: 7ec3e67307f8 ("arm64: dts: qcom: sc7180-trogdor: add initial trogdor and lazor dt")
Fixes: 4a9f8f8f2ada ("arm64: dts: qcom: Add Acer Aspire 1")
Fixes: de8eed359759 ("arm64: dts: qcom: Add support for ECS LIVA QC710")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Assisted-by: Claude:opus-4-8
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts   | 4 ++--
 arch/arm64/boot/dts/qcom/sc7180-ecs-liva-qc710.dts | 4 ++--
 arch/arm64/boot/dts/qcom/sc7180-idp.dts            | 4 ++--
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts b/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
index 1514da636269..d9c70897b6f1 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
@@ -631,8 +631,8 @@ &usb_1_hsphy {
 };
 
 &usb_1_qmpphy {
-	vdda-phy-supply = <&vreg_l3c_1p2>;
-	vdda-pll-supply = <&vreg_l4a_0p8>;
+	vdda-phy-supply = <&vreg_l4a_0p8>;
+	vdda-pll-supply = <&vreg_l3c_1p2>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7180-ecs-liva-qc710.dts b/arch/arm64/boot/dts/qcom/sc7180-ecs-liva-qc710.dts
index b84da371581b..3100fab18787 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-ecs-liva-qc710.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-ecs-liva-qc710.dts
@@ -563,8 +563,8 @@ &usb_1_hsphy {
 };
 
 &usb_1_qmpphy {
-	vdda-phy-supply = <&vreg_l3c_1p2>;
-	vdda-pll-supply = <&vreg_l4a_0p8>;
+	vdda-phy-supply = <&vreg_l4a_0p8>;
+	vdda-pll-supply = <&vreg_l3c_1p2>;
 
 	/delete-property/ mode-switch;
 	/delete-property/ orientation-switch;
diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index 0bce3eefca2e..acfb9937651d 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -461,8 +461,8 @@ &usb_1_hsphy {
 
 &usb_1_qmpphy {
 	status = "okay";
-	vdda-phy-supply = <&vreg_l3c_1p2>;
-	vdda-pll-supply = <&vreg_l4a_0p8>;
+	vdda-phy-supply = <&vreg_l4a_0p8>;
+	vdda-pll-supply = <&vreg_l3c_1p2>;
 };
 
 &venus {
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index b398f69917f0..d31ffebe27c3 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -993,8 +993,8 @@ &usb_1_hsphy {
 
 &usb_1_qmpphy {
 	status = "okay";
-	vdda-phy-supply = <&vdda_usb_ss_dp_1p2>;
-	vdda-pll-supply = <&vdda_usb_ss_dp_core>;
+	vdda-phy-supply = <&vdda_usb_ss_dp_core>;
+	vdda-pll-supply = <&vdda_usb_ss_dp_1p2>;
 };
 
 &venus {

-- 
2.43.0


