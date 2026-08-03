Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FA439BFFA;
	Mon,  3 Aug 2026 06:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785738863; cv=none; b=cz5dp+Qu10KjBpi/+E1hkDt1eRhtN+Tk9StfmIh7Re1YCuPWvC4AT/p4z64ldnyj1nJBm8ejhDtmgFAbGOW7ZFIrMzjJEZYlUZTcU1+ilunefPnigz3+vg8awag4PsE4yC7D5tCML97Ca3HyxdhD4Tp8wjHmg75OIZWTzV4gF1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785738863; c=relaxed/simple;
	bh=JYdiStmYTrNtuu3ikVXzRFMx0Xi87nGIbj9dKFZG75I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y8yKF3Ws/bDHaDvDJAqxgTWYUXPauAIaUk8o+ekpF/e9CNFd8jjjgmz1jEqRf3L7wUahmocKwedbM5luoc9mgwyw89Ef7c56UhRBh7Tomr5CsXbC98z04fFdgck0/89teVDh/iWaMau86FdxSs6Z19ZjYlgvHUxIlU7OVxQDcgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T4W0YQuP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T4W0YQuP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 48B54C4AF17;
	Mon,  3 Aug 2026 06:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785738863;
	bh=JYdiStmYTrNtuu3ikVXzRFMx0Xi87nGIbj9dKFZG75I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=T4W0YQuPsWo4PwKr2R5RLvv9ZW8tp0dcNIxGYclIYWhCHdLlszdsVSgxKVeDwaqe7
	 xFwH/G+hZmkU6G4/6tXvM8/rNdl0dyfRCuqe5oDofEhRCMppkAPTnDspJl6psQ0FpY
	 O90lVLOlPvGwgmOyqs56Dix/k9l47vA+XylLwS3/aZjwGzm8bSzY5dE+4+s1B4jX49
	 HkOaqaJ6F0NjOHN9Qjld2ldlpN1eJSsKPpDb/qM+EZQ8Pk2W3rmAF18DLdshiV8fJs
	 05uburHjfi1EP6nWLikwvKVIiXk5IADwa9/GrD5z24Rf6sMjfTAwhiNqQvfehvL2Dx
	 dnk9ACOM5e8bQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D8C2C55184;
	Mon,  3 Aug 2026 06:34:23 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Mon, 03 Aug 2026 08:34:03 +0200
Subject: [PATCH 05/28] arm64: dts: qcom: sdm850: Fix swapped USB QMP PHY
 vdda-phy/vdda-pll supplies
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-phy-supply-fix-v1-5-5880630cde3e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3412;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=nismIA24fRKl8EPFbT1HEX6ReLKE9mLrsjmrxiEtSfQ=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqcDZi1TZBoMZDsJBX3iArhjdoWrIAqlrYYrRtb
 u0S0K6WK8+JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCanA2YgAKCRBVnxHm/pHO
 9X7aCACqSotDK+2F91lYPnIMELqETBqdHCoGBSyate4CVR5GZF9ta0QZRWFc2V0OoBkyRlHQATh
 VK7sTmTMIygUuNmMFBPq/rm93OVDe+WIh9cS8lC5XxYmTttqKA8ELnJVFBcHLcZPq15yUBkxHw1
 M8Ir8cGXJcgbIo5EJ98R06zoBraESNypmKvc6JmHX+WRgurGknjlJU1cCCnNEa/cwZAylhz6pCj
 QHBk98VPxBk3wg6MCGvzD5m1B4YzzRsU5si3Zaop9ik/sV+YSPqV7+6XwKkNnq1JFOtENTXlT4R
 agq98Ltwr9JS1dI40JQq0/oLdaATx68ECvRHpiyGLN16g/Rm
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

Fixes: aab69794b55d ("arm64: dts: qcom: Add support for Huawei MateBook E 2019")
Fixes: 44acee207844 ("arm64: dts: qcom: Add Lenovo Yoga C630")
Fixes: d4b341269efb ("arm64: dts: qcom: Add support for Samsung Galaxy Book2")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Assisted-by: Claude:opus-4-8
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts | 8 ++++----
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts       | 8 ++++----
 arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts           | 8 ++++----
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts b/arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts
index f04865381870..a4339b562b60 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts
@@ -872,8 +872,8 @@ &usb_1_hsphy {
 };
 
 &usb_1_qmpphy {
-	vdda-phy-supply = <&vdda_usb1_ss_1p2>;
-	vdda-pll-supply = <&vdda_usb1_ss_core>;
+	vdda-phy-supply = <&vdda_usb1_ss_core>;
+	vdda-pll-supply = <&vdda_usb1_ss_1p2>;
 
 	status = "okay";
 };
@@ -898,8 +898,8 @@ &usb_2_hsphy {
 };
 
 &usb_2_qmpphy {
-	vdda-phy-supply = <&vdda_usb2_ss_1p2>;
-	vdda-pll-supply = <&vdda_usb2_ss_core>;
+	vdda-phy-supply = <&vdda_usb2_ss_core>;
+	vdda-pll-supply = <&vdda_usb2_ss_1p2>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index e41200839dbe..d8cb3e5d8d07 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -860,8 +860,8 @@ &usb_1_hsphy {
 &usb_1_qmpphy {
 	status = "okay";
 
-	vdda-phy-supply = <&vdda_usb1_ss_1p2>;
-	vdda-pll-supply = <&vdda_usb1_ss_core>;
+	vdda-phy-supply = <&vdda_usb1_ss_core>;
+	vdda-pll-supply = <&vdda_usb1_ss_1p2>;
 };
 
 &usb_1_qmpphy_out {
@@ -953,8 +953,8 @@ &usb_2_hsphy {
 &usb_2_qmpphy {
 	status = "okay";
 
-	vdda-phy-supply = <&vdda_usb2_ss_1p2>;
-	vdda-pll-supply = <&vdda_usb2_ss_core>;
+	vdda-phy-supply = <&vdda_usb2_ss_core>;
+	vdda-pll-supply = <&vdda_usb2_ss_1p2>;
 };
 
 &venus {
diff --git a/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts b/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
index a676d3ea01b9..b7a1e2317fc2 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
@@ -609,8 +609,8 @@ &usb_1_hsphy {
 &usb_1_qmpphy {
 	status = "okay";
 
-	vdda-phy-supply = <&vdda_usb1_ss_1p2>;
-	vdda-pll-supply = <&vdda_usb1_ss_core>;
+	vdda-phy-supply = <&vdda_usb1_ss_core>;
+	vdda-pll-supply = <&vdda_usb1_ss_1p2>;
 };
 
 &usb_2 {
@@ -635,8 +635,8 @@ &usb_2_hsphy {
 &usb_2_qmpphy {
 	status = "okay";
 
-	vdda-phy-supply = <&vdda_usb2_ss_1p2>;
-	vdda-pll-supply = <&vdda_usb2_ss_core>;
+	vdda-phy-supply = <&vdda_usb2_ss_core>;
+	vdda-pll-supply = <&vdda_usb2_ss_1p2>;
 };
 
 &venus {

-- 
2.43.0


