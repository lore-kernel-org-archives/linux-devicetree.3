Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC4B425880;
	Thu, 30 Jul 2026 11:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785412576; cv=none; b=qWdYaNGKPZLQ74NfOc7LEX01m8cNKDV04DgMT1zDgetlM0oTr2hvb+o9CqNheZSLrB5AcVIyBOlovMJQ1T/JsdWAO83mjYHeQ8yp+W+SSEdQGDb/Z/CPTOSAVhKej1mHfoeNXtzG9kC8C7d2KroP8j9qOS0o3D6c1cWA92Jg6DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785412576; c=relaxed/simple;
	bh=r+KEb991zN8OLoZ/xRIQM7UeQ2P3XkGlWmQtShlQnco=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r7gzf2HE+3hFxB9QpfkJgUpdnCL7v3ABDm7JjCaHXHMWkPMMd2aGV7eA6eh5oUebB1AL2ds6qO8fxwq1NsVqNVObvE3hi5BnoGj4KxNH4Kguu7ILmGOz0zjjANVNfzI21qUuJVtzlW0hMhrPjm7fYKB7CKUjJldAQk9T6E4XfT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VNGY7tJ+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VNGY7tJ+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 738A5C4AF0C;
	Thu, 30 Jul 2026 11:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785412576;
	bh=r+KEb991zN8OLoZ/xRIQM7UeQ2P3XkGlWmQtShlQnco=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VNGY7tJ+OnMztpBxIy4gpaZg8uAL2HK7rFXIIDBTsjR92b5zijxrirZfTw5qByMA1
	 x1hZX+2ZUIMFjJlad8QCzhWhfSNqFpOsW81HL++BHbc8vBSbwoVnWBauHssxnqHe06
	 qnzdZNbC37YW8ZkeUyAPR4vQlWJB6NAlFu99NX2fCjl5MvreHJQ5M0OlKazc6BlYUe
	 PlzCK3NVRbNqTgaZNvqw8BoEQmbBJnlAsr5nPKM9/ACLkLSnKm2e0GfR0mC9F0kMjH
	 H/qETsVDjCil1HD7/esG06/u9tk1xc/GOvmIMlGV18h792a899qzZ2Reznp4a1pmbk
	 kNf22hiT1Bogw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60014C55167;
	Thu, 30 Jul 2026 11:56:16 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Thu, 30 Jul 2026 13:55:55 +0200
Subject: [PATCH 14/22] arm64: dts: qcom: lemans: Fix the PCIe iommu-map
 entries
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-iommu-map-fix-v1-14-83405d37ba41@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1788;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=WUGl85XwKyUnHkHJbCy8Ez4R/q9SpowAjvVun1e0zOs=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqazvZHOQW0N9cydQNtTFCcU/bN8g0nIrk4LW6k
 NxgU7+aRNWJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCams72QAKCRBVnxHm/pHO
 9bnSB/9SZ8sAauAp9GICmfZ7GwQgSeDOc7hnMnSCmmwoSrtiXyIrwJQsaGsyj5FqY4AV/pYVWqP
 S5/CPbi2rPE7OgTWoFqt5aIUSKuCFwYhWqSY/ENhlrfxGf6q54iek2yIkro9LYP9ESKAmshUWec
 +i9HqDFWXAYP7en4RqvsPL0gf0ov2+RGbchss1H6cFN9ZtjMCmi7+0/qWPKjQytXf5Ol8BgEIPE
 gc5Bwt/KqQoTNMLNEgIm7wUvW5w6cW1r7EdfJZu69LEuSsgSaD0zq8u90ZBf8vMbrTsvKk1E7lS
 9AQzuEXBnciLR7aRuEWlvKfbIycT3P6hiS5v3BGAaGtKarJ+
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

The IOMMU provider pcie_smmu uses '#iommu-cells = <2>', but the PCIe
iommu-map entries specify only one cell for the SID, omitting the SID
mask. This went unnoticed until the OF core started warning with commit
ccb2fd725d41 ("of: Respect #{iommu,msi}-cells in maps"):

  iommu-map has 1-cell entries targeting 2-cell #iommu-cells, treating as 1-cell output

So fix the entries to match the provider's '#iommu-cells' property.

Fixes: 489f14be0e0a ("arm64: dts: qcom: sa8775p: Add pcie0 and pcie1 nodes")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 353a6e6fd3ac..47d26dd832f7 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2760,8 +2760,8 @@ pcie0: pcie@1c00000 {
 					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_0 0>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
-			iommu-map = <0x0 &pcie_smmu 0x0000 0x1>,
-				    <0x100 &pcie_smmu 0x0001 0x1>;
+			iommu-map = <0x0 &pcie_smmu 0x0000 0x0 0x1>,
+				    <0x100 &pcie_smmu 0x0001 0x0 0x1>;
 
 			resets = <&gcc GCC_PCIE_0_BCR>,
 				 <&gcc GCC_PCIE_0_LINK_DOWN_BCR>;
@@ -2933,8 +2933,8 @@ pcie1: pcie@1c10000 {
 					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_1 0>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
-			iommu-map = <0x0 &pcie_smmu 0x0080 0x1>,
-				    <0x100 &pcie_smmu 0x0081 0x1>;
+			iommu-map = <0x0 &pcie_smmu 0x0080 0x0 0x1>,
+				    <0x100 &pcie_smmu 0x0081 0x0 0x1>;
 
 			resets = <&gcc GCC_PCIE_1_BCR>,
 				 <&gcc GCC_PCIE_1_LINK_DOWN_BCR>;

-- 
2.43.0


