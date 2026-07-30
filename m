Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E55424D46;
	Thu, 30 Jul 2026 11:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785412576; cv=none; b=bZU40JPWfBwdSEpGGRVzzGCcu3tYNgfE0dq6JxwPqJz3nGJ9SWK8LBt9LiGaZMmtXeQtKPs1atjG6sYm23eO8gW9sStYinQfymPKIsdjB7nhM971D8f292uVCb8nlBS43PzHlH7ifBV01PN5xzc0jH2KgP04Etr/0b+RXK+Pqws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785412576; c=relaxed/simple;
	bh=coFKdTZQMb3QABiWt9YWdzSFuQcdcZEvrWIKqdriaAQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ie2Pm0yw1s7xDBNB7n0WA21wvrnRYpE7693WtRBu/GKDS/X4j4kFeNZlOWZveRTZ5plrJ4w3e3lLErT6RanbCQzAwiQew50KekGWeRnTGbQL1aqmnJ6EwIygJbG5RjK6l9gWkbwEz1/I0IjKyNgxQRIm7meiuojc82+DXK7CYPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iOKDnVba; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iOKDnVba"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 43D9BC2BCFD;
	Thu, 30 Jul 2026 11:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785412576;
	bh=coFKdTZQMb3QABiWt9YWdzSFuQcdcZEvrWIKqdriaAQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iOKDnVbaQNCsYXxOvM64bGbb0rVTve7CG50Us5Jm7eGbdNmrNjquUA4mFy1agyq40
	 5cGvA5Yi40EU7e7c1chSBA9d/O7eDfwRvQADeWUn9nBZnAOQsvBwjUUH9kOVB1ZAqb
	 0Z/AQSkFQ1nGSk2sl3UAb5nL/UVdLfE97PuMwtaVlxmwO3QOPscFI5tgRGk2wEplIs
	 wKtHVbwdJYz0+FKzEV6AQhxxyejeZ7uHv/ybKeTl/7H+p5P14Vg7hw56pBtTAReMfc
	 dPR0nqaMs3HHxt7w2sPJtrOylyYc0jFV0uZpvWGCb1yhKrYI9u422WeKsTADA7FTYj
	 Q5FL5/qsPNvDQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30EEFC54FD2;
	Thu, 30 Jul 2026 11:56:16 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Thu, 30 Jul 2026 13:55:52 +0200
Subject: [PATCH 11/22] arm64: dts: qcom: sm8650: Fix the PCIe iommu-map
 entries
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-iommu-map-fix-v1-11-83405d37ba41@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1839;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=MihmNPIjCg03bgfhShEizxZFprozgvv20HsEUf9mtxI=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqazvYSflMuD291y5+oow7oeUkFpxiXhO3CogwV
 UMQYGE1XkGJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCams72AAKCRBVnxHm/pHO
 9UI1B/4uUPw0FZmw+pvL82yl7HiBcVWXaSFuUiys9dYDA9bELogyWqOjP3v91STh90w11NMszQ8
 XzrU61W123pUt3xng5N0CqCNi9Qx9f2s/dfmUio3D39q4dxfi8H6OoDxoxEDauCeOAvCQAJMEro
 EhlVIOw1p0AJ0Egh7CE0ZcNevSY36Z9lhs6UK81dG8oxGoEEYgaHg8HRAEFcdN3l8t6G9fa13cF
 OHWYEj/c11NDkCSLnj6/oFHd3q5ZxuTBtLXpll7WMMln8w1nloaZdTHZXTo1vRPDaytXV3IdsjM
 l+Q5iRfbPGVPkG+KWYT9lTDM/cYNQFspbhf4UtLVjzmctgm6
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

Fixes: 10e024671295 ("arm64: dts: qcom: sm8650: add interconnect dependent device nodes")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 160ead25ecf7..eabceb7d6904 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -3626,8 +3626,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			operating-points-v2 = <&pcie0_opp_table>;
 
-			iommu-map = <0     &apps_smmu 0x1400 0x1>,
-				    <0x100 &apps_smmu 0x1401 0x1>;
+			iommu-map = <0     &apps_smmu 0x1400 0x0 0x1>,
+				    <0x100 &apps_smmu 0x1401 0x0 0x1>;
 
 			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH 0>,
 					<0 0 0 2 &intc 0 0 GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH 0>,
@@ -3819,8 +3819,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			operating-points-v2 = <&pcie1_opp_table>;
 
-			iommu-map = <0     &apps_smmu 0x1480 0x1>,
-				    <0x100 &apps_smmu 0x1481 0x1>;
+			iommu-map = <0     &apps_smmu 0x1480 0x0 0x1>,
+				    <0x100 &apps_smmu 0x1481 0x0 0x1>;
 
 			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH 0>,
 					<0 0 0 2 &intc 0 0 GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH 0>,

-- 
2.43.0


