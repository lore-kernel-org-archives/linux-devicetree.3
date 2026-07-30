Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378D2423783;
	Thu, 30 Jul 2026 11:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785412576; cv=none; b=KYE0aym58LRy/QXAHHsQJ7DRzK5O0LILFCoV7p+8p23WLjPO1UqME7RfJxqI4oxPevgMcIRHb/cZhCQ3TwRMTJFN/JsRVQYr98K0BQoXbucpIt4fd0EBMD0SSJqYWkIo+QJLNhVJ3e/LhtS9XwRZMdac0jo+znYKlqZ+xulVWrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785412576; c=relaxed/simple;
	bh=0ZsN1jvteD2mKlo1aIKpG7yxgCDJ5treNrnI0Kt/q94=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rbwSNyn8oLzLXoeRRHYq9GtQgesGcaONA+fm7fn9ozaStVkTsceb9yM7tGcIwM2QCagAJLwku0VG3DGD4G6UHK/EX9GuLooTW/KABjGHkNRNPGCUCVQL/sBU0oRKcn749wwLfkjaxnWact9XVxINg8RnCAZPqCwPRFmhN39vn9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ehKOQsPG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ehKOQsPG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E037EC2BCFC;
	Thu, 30 Jul 2026 11:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785412575;
	bh=0ZsN1jvteD2mKlo1aIKpG7yxgCDJ5treNrnI0Kt/q94=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ehKOQsPGsHfOXmD+cVj9RoCvPaDJgzFc4X+e6InhO3PlWGZkZrpDpHjZ3TxF4Rkox
	 glkV/0LbZ3qTw6jvUFuOifcTsALT+GUGFp6e+v/AuGO6koiLBzx1CoeFI3Dukgi7dX
	 NE45/Vc5kzUsCNAyg+gKVRGnvrWuCrDaKLQiR2MPFvzRpdxnL0SgjUWA1Ajkamp9sM
	 uG+MfIzyEpHV/b8XkdH9LgJBKw0Uf7t1dJPvaNk2g81a+csyBocKovb7kLuHBFloNo
	 MXtFk/zkeVXx+yD2rJsntStt08YglCTa23gw/ZjRoi2QNh3tg5qvYCcV0EfDeF6hU8
	 JlIYjXLOgEHvA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C96F3C55167;
	Thu, 30 Jul 2026 11:56:15 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Thu, 30 Jul 2026 13:55:46 +0200
Subject: [PATCH 05/22] arm64: dts: qcom: sdm845: Fix the PCIe iommu-map
 entries
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-iommu-map-fix-v1-5-83405d37ba41@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4120;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=wlpEC9w6e0tfjOxFcmjwLckBwe7ZRZ+GpYrL2UiwxeY=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqazvWaf2SgO1YHXOFReU7/M0hHKY9HK5eXOC3a
 65hSv0fAMaJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCams71gAKCRBVnxHm/pHO
 9Yf1B/9PQfDAhMoy1x7Bq/0tsXuaGag+psisfYSRjPGKHrs75LJwUoMJplsFX+VlwcQiplOsBub
 ffR84h9537/fYSbl9tY3AMSpJW9IILKMKE+vGkNfqp+Etjhr1qq1XwP8OhoPLTv2Px7u5zz4WNH
 eEmwi9ANFM72YRD+NZzC0QZW9c0XqYu9GNtpu718J3uhRdXBlfDCVNRYNxtvjyMLXWzwOod+OHS
 oYqkTnxb3mfYwWfn/WZTwxKb2MZBIc77eEiy9u4RhGlOal/hHZs7lsmIPqSiDS4d65OFrKjoZIf
 GcX8pQbw5bSLPcq8Z+Ey3BalgA1NUQMd7TixLIiT9GMMKdsZ
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

Fixes: 5c538e09cb19 ("arm64: dts: qcom: sdm845: Add first PCIe controller and PHY")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 64 ++++++++++++++++++------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 4ae8627d6dbc..7c2a439dffdb 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2372,22 +2372,22 @@ pcie0: pcie@1c00000 {
 				      "slave_q2a",
 				      "tbu";
 
-			iommu-map = <0x0   &apps_smmu 0x1c10 0x1>,
-				    <0x100 &apps_smmu 0x1c11 0x1>,
-				    <0x200 &apps_smmu 0x1c12 0x1>,
-				    <0x300 &apps_smmu 0x1c13 0x1>,
-				    <0x400 &apps_smmu 0x1c14 0x1>,
-				    <0x500 &apps_smmu 0x1c15 0x1>,
-				    <0x600 &apps_smmu 0x1c16 0x1>,
-				    <0x700 &apps_smmu 0x1c17 0x1>,
-				    <0x800 &apps_smmu 0x1c18 0x1>,
-				    <0x900 &apps_smmu 0x1c19 0x1>,
-				    <0xa00 &apps_smmu 0x1c1a 0x1>,
-				    <0xb00 &apps_smmu 0x1c1b 0x1>,
-				    <0xc00 &apps_smmu 0x1c1c 0x1>,
-				    <0xd00 &apps_smmu 0x1c1d 0x1>,
-				    <0xe00 &apps_smmu 0x1c1e 0x1>,
-				    <0xf00 &apps_smmu 0x1c1f 0x1>;
+			iommu-map = <0x0   &apps_smmu 0x1c10 0x0 0x1>,
+				    <0x100 &apps_smmu 0x1c11 0x0 0x1>,
+				    <0x200 &apps_smmu 0x1c12 0x0 0x1>,
+				    <0x300 &apps_smmu 0x1c13 0x0 0x1>,
+				    <0x400 &apps_smmu 0x1c14 0x0 0x1>,
+				    <0x500 &apps_smmu 0x1c15 0x0 0x1>,
+				    <0x600 &apps_smmu 0x1c16 0x0 0x1>,
+				    <0x700 &apps_smmu 0x1c17 0x0 0x1>,
+				    <0x800 &apps_smmu 0x1c18 0x0 0x1>,
+				    <0x900 &apps_smmu 0x1c19 0x0 0x1>,
+				    <0xa00 &apps_smmu 0x1c1a 0x0 0x1>,
+				    <0xb00 &apps_smmu 0x1c1b 0x0 0x1>,
+				    <0xc00 &apps_smmu 0x1c1c 0x0 0x1>,
+				    <0xd00 &apps_smmu 0x1c1d 0x0 0x1>,
+				    <0xe00 &apps_smmu 0x1c1e 0x0 0x1>,
+				    <0xf00 &apps_smmu 0x1c1f 0x0 0x1>;
 
 			resets = <&gcc GCC_PCIE_0_BCR>;
 			reset-names = "pci";
@@ -2502,22 +2502,22 @@ pcie1: pcie@1c08000 {
 			assigned-clocks = <&gcc GCC_PCIE_1_AUX_CLK>;
 			assigned-clock-rates = <19200000>;
 
-			iommu-map = <0x0   &apps_smmu 0x1c00 0x1>,
-				    <0x100 &apps_smmu 0x1c01 0x1>,
-				    <0x200 &apps_smmu 0x1c02 0x1>,
-				    <0x300 &apps_smmu 0x1c03 0x1>,
-				    <0x400 &apps_smmu 0x1c04 0x1>,
-				    <0x500 &apps_smmu 0x1c05 0x1>,
-				    <0x600 &apps_smmu 0x1c06 0x1>,
-				    <0x700 &apps_smmu 0x1c07 0x1>,
-				    <0x800 &apps_smmu 0x1c08 0x1>,
-				    <0x900 &apps_smmu 0x1c09 0x1>,
-				    <0xa00 &apps_smmu 0x1c0a 0x1>,
-				    <0xb00 &apps_smmu 0x1c0b 0x1>,
-				    <0xc00 &apps_smmu 0x1c0c 0x1>,
-				    <0xd00 &apps_smmu 0x1c0d 0x1>,
-				    <0xe00 &apps_smmu 0x1c0e 0x1>,
-				    <0xf00 &apps_smmu 0x1c0f 0x1>;
+			iommu-map = <0x0   &apps_smmu 0x1c00 0x0 0x1>,
+				    <0x100 &apps_smmu 0x1c01 0x0 0x1>,
+				    <0x200 &apps_smmu 0x1c02 0x0 0x1>,
+				    <0x300 &apps_smmu 0x1c03 0x0 0x1>,
+				    <0x400 &apps_smmu 0x1c04 0x0 0x1>,
+				    <0x500 &apps_smmu 0x1c05 0x0 0x1>,
+				    <0x600 &apps_smmu 0x1c06 0x0 0x1>,
+				    <0x700 &apps_smmu 0x1c07 0x0 0x1>,
+				    <0x800 &apps_smmu 0x1c08 0x0 0x1>,
+				    <0x900 &apps_smmu 0x1c09 0x0 0x1>,
+				    <0xa00 &apps_smmu 0x1c0a 0x0 0x1>,
+				    <0xb00 &apps_smmu 0x1c0b 0x0 0x1>,
+				    <0xc00 &apps_smmu 0x1c0c 0x0 0x1>,
+				    <0xd00 &apps_smmu 0x1c0d 0x0 0x1>,
+				    <0xe00 &apps_smmu 0x1c0e 0x0 0x1>,
+				    <0xf00 &apps_smmu 0x1c0f 0x0 0x1>;
 
 			resets = <&gcc GCC_PCIE_1_BCR>;
 			reset-names = "pci";

-- 
2.43.0


