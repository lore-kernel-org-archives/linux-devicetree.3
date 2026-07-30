Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4C8426689;
	Thu, 30 Jul 2026 11:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785412576; cv=none; b=bgxbxIl0GPu8zPHeCCd8oKeK9ldnOgZlCMEqM3hhDsXyWrJyVTcwGVazDTxUmW3L7UBXHl7nPKH/JNaD2MLCcs5JMME9dd/8y+16ydfE2eA0vJVCoAFkUJ2jLnncRG2q4ztgxu7tCRkH6jwRBoIQqTFRjArG8N1MM/vwDkwlfFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785412576; c=relaxed/simple;
	bh=qo1rdRr2O+Ewp2+1i1TF/edICQNyfSePtsepAqGH3ng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=baNwQh8JUQrcCxbynteBSUPHVpUP7NGtV6g9eP7Y1n54oRykf6cvipGelF9lfTsIhPbmX7TRB9+bHVyDBAa8NtJeeIgxak0AsmIsgLhtWmPFAJ2VhsXB4YvAZJDko3HJIehS4k4UhXz8/z77NDusBF0KLMrRfmj4VT+Uj+4gXqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TamtomDa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TamtomDa"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93CECC19425;
	Thu, 30 Jul 2026 11:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785412576;
	bh=qo1rdRr2O+Ewp2+1i1TF/edICQNyfSePtsepAqGH3ng=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TamtomDaQLBr75DfOKdm416ekk0p9EVp6q7JFgExEtTxQMFee7BxjzGWcFrXI3qtO
	 GY3sqPNm1KmKd7qt7l7w6J3EucIyKUPTghLuc+qQTniK0FkgGbH+/AFSrXhjO14f1+
	 1Lr7SgoYfc5paZO/gJ5we0wm+8vLicBViAmB1Jb2/rL0usvI+YmBSMFkbb7a16OR1n
	 h8M6bAmBtmDyKEa4g7ryb4PeuID4t5jmoveSQ+UTpDVZDQe1JQQlkPYMvGbGGLUDsg
	 DHDMjpUwVW1p0yloM+53Llwk3/dSNvEOgveVeBerwADvX2S3enF5f/c1Lk98A5xqI/
	 rXLPPgs+jvsbQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81871C55168;
	Thu, 30 Jul 2026 11:56:16 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Thu, 30 Jul 2026 13:55:57 +0200
Subject: [PATCH 16/22] arm64: dts: qcom: monaco-monza-som: Fix the PCIe
 iommu-map entries
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-iommu-map-fix-v1-16-83405d37ba41@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1742;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=4Y7qxUSzkNOLqJefhft4hjG0ihS1PeYGE/kul77ZLc8=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqazvaGxkhrqu3i8XxNGgCFTYBu3GorvpGcvJmq
 gioFKqPS0eJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCams72gAKCRBVnxHm/pHO
 9WyzCACpLfE1ZURwJzT4z+FC4eSpEDSO9S8mt9eSC702kk/CNfak7uc43XTJtpHgPqSxf3Q/KwV
 +X0mSPydiLS/a+pDe5qw1N+a1BV8KuvWUyQXyBd4CjIxxvbdAT3hXeHQUIUPSjutiftRpAr8AYW
 AXRQjU4pkcRrOSOWio6oAzpbi2QQ7XbMB7edHl/uktN7/gUlQ6QYc+G6D/f4l2NQxA3xb5okPfP
 Ieoyk/OsXXORglP8zqQ0LZFJEmSNStjf8wpExvWOJG10FZU6COTjgA6BDLBnBxBz2ZcG6qmJ5ye
 WHxemB6HQFhwSGKQRIySqbyN1CDFfrKm/4MJTqGpQPD4ky9p
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

Fixes: 5238f4e7169f ("arm64: dts: qcom: Add Monaco Monza SoM")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
index 9b5ed55939b8..36af1ad2105d 100644
--- a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
@@ -196,14 +196,14 @@ &iris {
 
 /* PCIe0 Gen4 x2 */
 &pcie0 {
-	iommu-map = <0x0 &pcie_smmu 0x0000 0x1>,
-		    <0x100 &pcie_smmu 0x0001 0x1>,
-		    <0x200 &pcie_smmu 0x0007 0x1>,
-		    <0x208 &pcie_smmu 0x0002 0x1>,
-		    <0x210 &pcie_smmu 0x0003 0x1>,
-		    <0x218 &pcie_smmu 0x0004 0x1>,
-		    <0x300 &pcie_smmu 0x0005 0x1>,
-		    <0x400 &pcie_smmu 0x0006 0x1>;
+	iommu-map = <0x0 &pcie_smmu 0x0000 0x0 0x1>,
+		    <0x100 &pcie_smmu 0x0001 0x0 0x1>,
+		    <0x200 &pcie_smmu 0x0007 0x0 0x1>,
+		    <0x208 &pcie_smmu 0x0002 0x0 0x1>,
+		    <0x210 &pcie_smmu 0x0003 0x0 0x1>,
+		    <0x218 &pcie_smmu 0x0004 0x0 0x1>,
+		    <0x300 &pcie_smmu 0x0005 0x0 0x1>,
+		    <0x400 &pcie_smmu 0x0006 0x0 0x1>;
 
 	status = "okay";
 };

-- 
2.43.0


