Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01874279FC;
	Thu, 30 Jul 2026 11:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785412576; cv=none; b=ngb3rzlz1VFLG4NRrA9xsavHrpaIaH8SU5R73yghL4UuzITZuZZ8wBLLHBmmu6bgYFkqxWZH1q07JSFnECY6aZ43BVqQl5LkB/kklIZiaxGKBmY97Hcn817qZKbC3Ney1J4eV0aJ7aJnv8U/jsH5ziYE+WnkVL4tYwvw8TM6nCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785412576; c=relaxed/simple;
	bh=sDocAUuFjmmE3Xrx//CILHyFB7YJZ38Cx4dLlPjRC44=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kOae7JThDi9kJ5pws/mfC0bZ/6Btfn3EWAHC2JL86NR45DY2CVEneJYF3R8j918g3g1s1X8zxUjFeXunQ6vbvTi/tXk8nEHtaQhm/ylfhrVs5uoJuPqVmVsP8j7uKVuQreE88/Qw0+1sCorWs4YtKF9tDSXnzmu0zxqlberWOwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=So52B/FN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="So52B/FN"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3B83C2BCFC;
	Thu, 30 Jul 2026 11:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785412576;
	bh=sDocAUuFjmmE3Xrx//CILHyFB7YJZ38Cx4dLlPjRC44=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=So52B/FNUS1C/e4is42+u829vTrJcwp5uHGrz5EVXLKlA9u7tyE/U9TdtbjjVEhoZ
	 93G0K4vwYRe8+2DsxvvAO9wxNuQ40pm4UX7BI5UMzFBMQ87FSHqWHiooYPRmABb1/i
	 iOnVs2neVQwrsYex1PIOfx2drglZ9GizmlmymRGgBzORtyqFF18vC6WOYu7q9ZUso4
	 7fjjfXopzF4erGAEAxdx5bGbZ7/93xfzqS7x1R7u7sV0LT2Kg+VrsmWX916shmmhsz
	 fq0+vhc3h6zCo4iT9i+1EAZr970H2xu0wbRunoXC8mtb55UVSp/qxVgcF6CjPJEycx
	 p9dk8BfcMddJA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B9BC55162;
	Thu, 30 Jul 2026 11:56:16 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Thu, 30 Jul 2026 13:55:59 +0200
Subject: [PATCH 18/22] arm64: dts: qcom: lemans-evk-ifp-mezzanine: Fix the
 PCIe iommu-map entries
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-iommu-map-fix-v1-18-83405d37ba41@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1808;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=6/fejk3AUzlk1STcYkZQ4EwteAhTMlV5L1LTi7u62zo=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqazvbxsNv6wZ428gGrnwtbVCX7aa9MTOu8MEka
 l9wqZTxVymJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCams72wAKCRBVnxHm/pHO
 9RZECACOa9itTFox0FsxKXOkZ92rTwi8LjeqqnwdnFCVbypRUyjI/bCZcP1yEULa/rFL0Pkf/75
 SA2GOWHY2cZGgWBFGwPJcQJAv3fZJ6Y713yX+vllbu1j/fpl+qp9LJwlqbjBSi23sBl/I5mPqQ8
 OZofoL+vn2h6MKSBSljTgEhysPWNUSAicR2VAj8RMlkUfWWVV+QmKYEyT4a8370Lsx2zB83qEJw
 y6sRfh0GAuLqOrBxLEjnrbD+27bAptsMojH+okaUi/WVWXu5v4UvUFq8ftuZSygZZGSEeN3plRE
 K8SFe8mdbWG1CflNI9zbOETM2IRrB4jAAmDRDyKbwHARxhQZ
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

Fixes: b64abb26a291 ("arm64: dts: qcom: lemans-evk: Add IFP Mezzanine")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
index 44bd9b1a1765..22c975628ed7 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
@@ -204,15 +204,15 @@ &mdss1_dp1_phy {
 };
 
 &pcie0 {
-	iommu-map = <0x0 &pcie_smmu 0x0 0x1>,
-		    <0x100 &pcie_smmu 0x1 0x1>,
-		    <0x208 &pcie_smmu 0x2 0x1>,
-		    <0x210 &pcie_smmu 0x3 0x1>,
-		    <0x218 &pcie_smmu 0x4 0x1>,
-		    <0x300 &pcie_smmu 0x5 0x1>,
-		    <0x400 &pcie_smmu 0x6 0x1>,
-		    <0x500 &pcie_smmu 0x7 0x1>,
-		    <0x501 &pcie_smmu 0x8 0x1>;
+	iommu-map = <0x0 &pcie_smmu 0x0 0x0 0x1>,
+		    <0x100 &pcie_smmu 0x1 0x0 0x1>,
+		    <0x208 &pcie_smmu 0x2 0x0 0x1>,
+		    <0x210 &pcie_smmu 0x3 0x0 0x1>,
+		    <0x218 &pcie_smmu 0x4 0x0 0x1>,
+		    <0x300 &pcie_smmu 0x5 0x0 0x1>,
+		    <0x400 &pcie_smmu 0x6 0x0 0x1>,
+		    <0x500 &pcie_smmu 0x7 0x0 0x1>,
+		    <0x501 &pcie_smmu 0x8 0x0 0x1>;
 };
 
 &pcieport0 {

-- 
2.43.0


