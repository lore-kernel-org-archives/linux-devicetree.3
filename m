Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18930422E24;
	Thu, 30 Jul 2026 11:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785412576; cv=none; b=kAylKlTv2eBW5D3cB0Ndygp6UXIYNNIy9SQZUvJe4oLcAovP9xuEsasBfNbte2Vnf5MIU8rbZ/r5rJChr9JLG/kXRDkUx96k58/KYMnT3zoOEUrZQIhMekBGgz2cWGVnERCbOc7ZAegMerd6hjAchy1NF1eJ7uL2114gvsvBAs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785412576; c=relaxed/simple;
	bh=NLZP4AAZzrH5DJTWxorrumh58yd7RsQ6t+ORU+yI/m0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cp4+gOZzU5uGMO3A9uhaqV3K8/SFWpLrm3Diij77ThxLaCeLZbHLdqvCTxr4VqIwQF0JwpE4IE5uvFCkBwL3AadJF5Xv0i9ZS4jYg2fFzvbJV3eb621g8Ltwmm6sxrFcLKUqBH4YUKEFCGjCICCU/jhP/Ldu6UCGnEU2ZJzZ+Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iQNpMadz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iQNpMadz"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5FDCC4AF0B;
	Thu, 30 Jul 2026 11:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785412575;
	bh=NLZP4AAZzrH5DJTWxorrumh58yd7RsQ6t+ORU+yI/m0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iQNpMadzCGWhbvK32z9UH6qlXqPrg7QPnfv0/eeXxUEXmdibD/k2nzfvneSNmsupJ
	 5a2d0t31kZSszp573gdAVh+TzQvRYhUkowgNJST49YGK0Hz+RHXF9CKBCqzJKxTWHe
	 i0JCHH0B85akMuCy9gl7hGKsl+HCwlnGiYe+sdYWowjMf4c6tPEWO8HoTsFxzR/eIf
	 hTTeMNn9VEmM6Ikoe/7ydlNskW4GTotWqzO1B0YncL+6EsIBLdPVhK62rDCpvJ9ZBD
	 DgLZJS0hxsIj28FgQ6NqqWcuCZOUtAcPSKjyMFBm1Qani2zEKqdOhIhl+vKybXjOg6
	 +tnQqv3+tbD9w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C679C55165;
	Thu, 30 Jul 2026 11:56:15 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Thu, 30 Jul 2026 13:55:43 +0200
Subject: [PATCH 02/22] arm64: dts: qcom: kodiak: Fix the PCIe iommu-map
 entries
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-iommu-map-fix-v1-2-83405d37ba41@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1580;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=u5umQY4RpI4bndoHDt9p9X7nUakt6H/UIdXBtvA+1Co=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqazvVYh0sEYeXURVUG7SdNmTHK0ve106HfRHx/
 vce4U/sZReJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCams71QAKCRBVnxHm/pHO
 9RfVB/4qnPAcy+Yn8FeS2ffMN7320emBNVdaedFOdqo7R6uzYJZ48MnvKfj0W5Sz4/mA4gsvWnm
 YLBXFwpTuaPuDo1HGD5FXFuQIPReLUQ2q592gLpNzfRbfC9WvgJWJJDC5mW4mK5ECBuvSQgJpwA
 +CCD2sus+jRDW5to+UdF1U/lYT7CX/osnM8BLvt/o1SLS/+YRPowQ147NGxi0wbLJ8JBliL/nmL
 s996NQZ0Votxz8pbAKJphwEZQ7lQZT7UR9w6bTnNtDJM8FNhpk4hrHPW0PRBMCqZgfkmAVtEZtx
 nVL29WVftohtVkHyv6b9Hlm6ivROjXYrMNxtXQ3DrR4RDlNJ
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

Fixes: f8328b7549e1 ("arm64: dts: qcom: sc7280: Describe the first PCIe controller and PHY")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index fa540d8c2615..2eb613dd6716 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -2278,8 +2278,8 @@ pcie0: pcie@1c00000 {
 				      "aggre0",
 				      "aggre1";
 
-			iommu-map = <0x0   &apps_smmu 0x1c00 0x1>,
-				    <0x100 &apps_smmu 0x1c01 0x1>;
+			iommu-map = <0x0   &apps_smmu 0x1c00 0x0 0x1>,
+				    <0x100 &apps_smmu 0x1c01 0x0 0x1>;
 
 			resets = <&gcc GCC_PCIE_0_BCR>;
 			reset-names = "pci";
@@ -2424,8 +2424,8 @@ pcie1: pcie@1c08000 {
 
 			dma-coherent;
 
-			iommu-map = <0x0 &apps_smmu 0x1c80 0x1>,
-				    <0x100 &apps_smmu 0x1c81 0x1>;
+			iommu-map = <0x0 &apps_smmu 0x1c80 0x0 0x1>,
+				    <0x100 &apps_smmu 0x1c81 0x0 0x1>;
 
 			status = "disabled";
 

-- 
2.43.0


