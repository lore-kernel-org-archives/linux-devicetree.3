Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4204248C1;
	Thu, 30 Jul 2026 11:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785412576; cv=none; b=FSVGFQvr5cUOHA2vjCZdE6jzwKjuTAJp1jqhlVjfMuMeY81SOIMP4k3pbo4QF6MumgGHWMcUzGhatpFo97i64DeFenJ6vu8hS6qlcEC313aIdc55oxWfCDU9ZAwG1fSkSmu0NkMhdSjMgOZobJAtDFaLm2xwANduEDHe/XrGlew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785412576; c=relaxed/simple;
	bh=GDt42p/pGtA+WO9CExdi9ydIbyen+APmWU0pMZBIbTU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bzXwlUQQt/5qo/l4Ik3DCiH4L6dR82bupSqrb8Vul4Y/EX3uPZ7wgCuTE/uNeDKPeWFzkq0tmGETcXR0kuXt27IbCE4QCiiog5JuAVm9CaK6uLAqNI85bbe0obAzsaTZ0wPcbDZPH1uMySr5neSQ2mFYwTuktlWRnKfGouCUhUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lql6Nakh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lql6Nakh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0C39CC32782;
	Thu, 30 Jul 2026 11:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785412576;
	bh=GDt42p/pGtA+WO9CExdi9ydIbyen+APmWU0pMZBIbTU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lql6NakhsDwnHzo1bjk8GtQi0VZDa68Mdnbgfneqaih2vjsnQnQYpK0jjgzPB6ZQb
	 8x11Fh4iDIVUONkHVIUmFNbNayuksNX8lxc/UDvBP93qi4qb+exeLQ6klKnY9o+3Mv
	 TkOpcewMI5qbCxKPAlASrQ7I14qdlxi/YWDQ2tptXZRB/jRUQ7ZYwaBQZOuvsxJs+8
	 pdQSdPAT7XPPRGJgrY5ABIIC9S32jPB5lmdbk1gR5/n+IJms2SuvWIIkXqTVFTKTQC
	 wULGokiXe2nlfLPO5oUZccJsyEabftYyU3pfhSLGZRpwOWT2hFQBYtmIt3nJlxymco
	 o+Y2GSrHLCbcw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E772FC55169;
	Thu, 30 Jul 2026 11:56:15 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Thu, 30 Jul 2026 13:55:48 +0200
Subject: [PATCH 07/22] arm64: dts: qcom: sm8250: Fix the PCIe iommu-map
 entries
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-iommu-map-fix-v1-7-83405d37ba41@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2058;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=766Xcxl9c2bkQXMCUzYlKG2AGpC6CEIMKZmP2PMiV30=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqazvX9ZV8/4k/IPWvc7RhjLeRXvdlXs5zgB7E7
 hdYLO/6suGJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCams71wAKCRBVnxHm/pHO
 9fCwCACbZYh67R8Es1G/jxDfc0IXp9zNy1PMqskvkMkEmGXITcVDu2S/G7ARQdJG2mdSCr6GAjQ
 ifZBp30CfM6PxEttK0HFflRfBmXWK2jMU/NlHdlKk961iy8lcWwUIV0NkAPSWcuivqtX7xintqV
 Add1hDAFiN3AuHFK+NjyCz38a871VxUfMKON2Yfgtk2vhj6fWYEb/6QkMjTpNLZlWYQdHJFetgs
 OLaBIJfmWpSY+BBm6H2jq1OUns/5NYDD+Tjgrws0ojYwPNkLfFnmcW9o9vdPT/87bpu/r+MndnP
 6CnqyljMjLIr8fE+mJK1pjrwe1GG09cWLdp54znBVfAlMKT+
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

Fixes: e53bdfc00977 ("arm64: dts: qcom: sm8250: Add PCIe support")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7076720413ab..c6f49ae9d253 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2190,8 +2190,8 @@ pcie0: pcie@1c00000 {
 				      "tbu",
 				      "ddrss_sf_tbu";
 
-			iommu-map = <0x0   &apps_smmu 0x1c00 0x1>,
-				    <0x100 &apps_smmu 0x1c01 0x1>;
+			iommu-map = <0x0   &apps_smmu 0x1c00 0x0 0x1>,
+				    <0x100 &apps_smmu 0x1c01 0x0 0x1>;
 
 			resets = <&gcc GCC_PCIE_0_BCR>;
 			reset-names = "pci";
@@ -2317,8 +2317,8 @@ pcie1: pcie@1c08000 {
 			assigned-clocks = <&gcc GCC_PCIE_1_AUX_CLK>;
 			assigned-clock-rates = <19200000>;
 
-			iommu-map = <0x0   &apps_smmu 0x1c80 0x1>,
-				    <0x100 &apps_smmu 0x1c81 0x1>;
+			iommu-map = <0x0   &apps_smmu 0x1c80 0x0 0x1>,
+				    <0x100 &apps_smmu 0x1c81 0x0 0x1>;
 
 			resets = <&gcc GCC_PCIE_1_BCR>;
 			reset-names = "pci";
@@ -2444,8 +2444,8 @@ pcie2: pcie@1c10000 {
 			assigned-clocks = <&gcc GCC_PCIE_2_AUX_CLK>;
 			assigned-clock-rates = <19200000>;
 
-			iommu-map = <0x0   &apps_smmu 0x1d00 0x1>,
-				    <0x100 &apps_smmu 0x1d01 0x1>;
+			iommu-map = <0x0   &apps_smmu 0x1d00 0x0 0x1>,
+				    <0x100 &apps_smmu 0x1d01 0x0 0x1>;
 
 			resets = <&gcc GCC_PCIE_2_BCR>;
 			reset-names = "pci";

-- 
2.43.0


