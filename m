Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F201F429005;
	Thu, 30 Jul 2026 11:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785412577; cv=none; b=H5SR8Z4FsGdccnSwyjszeFIb54sscMGKuefaxJE6VfGhc7kxjY2n537PRVqXSQ7Ssf0Fw3v3+SLK6q/GV+9YPURo1GcEDLrIO5Cj5I8XxCZrHSK4pW+c4OR/5d3rYT9JU93rKqcqPRYYGLBvlGkyz38urV7ZqxkoHJRp9EPGMb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785412577; c=relaxed/simple;
	bh=luh/GwZugk787AcCckf/MF1aaWn8mD/Im/Et5FudK2w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iGKyawCDDualsWSEzOcp/mITSQSUMngoEJG7F+c7xREa3m0nSE+0FpnmdrQbpIeeJFhi4/wU5xey2PyF/EISQTwXapXaD0kOz7ceY0rRNHT3Z7Q/l6Y80TbQIlmHWpJWcGGxGhSWFXDmwEBS/QdTg15VkgpvvTYZTRC0ZjaBdIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gK5fUSgU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gK5fUSgU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D34CFC2BD01;
	Thu, 30 Jul 2026 11:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785412576;
	bh=luh/GwZugk787AcCckf/MF1aaWn8mD/Im/Et5FudK2w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gK5fUSgUM57OI2ArNoNyxvyt3umoxWfJT8yWUuu1NMJ6SjNH0u7VI5q8mwYrQlslG
	 6bDx2nIJU0KTEdesEG/oMvAMABYL79iJpYshsZG0oM597yFbym70s10Ex89TZdJaNT
	 Ib4c5xNw8qBW88n1X0FQmFvwy1+FI2+hqA8Qge7RjiCTJE6X78LDt3XM5QlHoWaTnK
	 uW61YBfmeYtMoN2nilWITKcL1AfC6BdU1+tdFCLr1+iejYn2Jyo90aQnUJ/Irp/tiW
	 oD9cFKj+UGTqYMsTBaz/BncfhhE27iOtnIug3JcFwbPJJnzOSw+4cJcxm1M166i4XR
	 pwThO72xAI53g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1140C55168;
	Thu, 30 Jul 2026 11:56:16 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Thu, 30 Jul 2026 13:56:01 +0200
Subject: [PATCH 20/22] arm64: dts: qcom: qcs6490-thundercomm-minipc-g1iot:
 Fix the PCIe iommu-map entries
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-iommu-map-fix-v1-20-83405d37ba41@oss.qualcomm.com>
References: <20260730-iommu-map-fix-v1-0-83405d37ba41@oss.qualcomm.com>
In-Reply-To: <20260730-iommu-map-fix-v1-0-83405d37ba41@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1939;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=pfcWZx6IcFkcSOE5S8mYrgwKp4U4QnIt/UuG8C2Oa0g=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqazvcBm/e4prH1Ag/wJZ42uJyYr20eR1rd/82G
 0HCQ6vz/m6JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCams73AAKCRBVnxHm/pHO
 9RZOCACZtzfnFb/NzSnlQ81OLUXvXgIDjHObW4dzCAkQvgRwlrr+gPjqGkiZ9vNvu1dOOSl3gs0
 bYeJC3G5yjhgSyHygI2h8xKYTK9o4a8iFiaGal1IjnyhzQ1o0zfxQXha/Cx4I2hQgXFEwzz+hMK
 soZeVHbScy5Y+krAh2RJTyVr0ySInzm2UjEbSyQg9v2bmpylGjnM7S5XlVh1ylC6wBEsUltG3do
 1UvXm9WozTBs9JholrSI4FUXP5ngQCOFq5MovlL72FlKcXhOCmU2v7Oa+AdYKqfs0HL+5ha6v0c
 rFHJXqGf4vtrYglJt+fqY8HXqUkhZgNtEIfgdD+14weStIYI
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

The IOMMU provider apps_smmu uses '#iommu-cells = <2>', but the PCIe
iommu-map entries specify only one cell for the SID, omitting the SID
mask. This went unnoticed until the OF core started warning with commit
ccb2fd725d41 ("of: Respect #{iommu,msi}-cells in maps"):

  iommu-map has 1-cell entries targeting 2-cell #iommu-cells, treating as 1-cell output

So fix the entries to match the provider's '#iommu-cells' property.

Fixes: 1cde54c54b83 ("arm64: dts: qcom: qcs6490: Add Thundercomm AI Mini PC G1 IoT")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 .../boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
index a5ad796cb65d..2fc8987204e9 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
@@ -711,15 +711,15 @@ &pcie1 {
 		    <&pcie1_wake_n>;
 	pinctrl-names = "default";
 
-	iommu-map = <0x0 &apps_smmu 0x1c80 0x1>,
-		    <0x100 &apps_smmu 0x1c81 0x1>,
-		    <0x208 &apps_smmu 0x1c84 0x1>,
-		    <0x210 &apps_smmu 0x1c85 0x1>,
-		    <0x218 &apps_smmu 0x1c86 0x1>,
-		    <0x300 &apps_smmu 0x1c87 0x1>,
-		    <0x400 &apps_smmu 0x1c88 0x1>,
-		    <0x500 &apps_smmu 0x1c89 0x1>,
-		    <0x501 &apps_smmu 0x1c90 0x1>;
+	iommu-map = <0x0 &apps_smmu 0x1c80 0x0 0x1>,
+		    <0x100 &apps_smmu 0x1c81 0x0 0x1>,
+		    <0x208 &apps_smmu 0x1c84 0x0 0x1>,
+		    <0x210 &apps_smmu 0x1c85 0x0 0x1>,
+		    <0x218 &apps_smmu 0x1c86 0x0 0x1>,
+		    <0x300 &apps_smmu 0x1c87 0x0 0x1>,
+		    <0x400 &apps_smmu 0x1c88 0x0 0x1>,
+		    <0x500 &apps_smmu 0x1c89 0x0 0x1>,
+		    <0x501 &apps_smmu 0x1c90 0x0 0x1>;
 
 	status = "okay";
 };

-- 
2.43.0


