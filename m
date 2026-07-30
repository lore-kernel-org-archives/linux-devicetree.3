Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092BF429008;
	Thu, 30 Jul 2026 11:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785412577; cv=none; b=PjDVUBJ/HbPWss2uBxoW6autGqrtSlZ8hRjtUXCX61OikTX2QlM/D/mFaWOic8ppSrz5pCtc9qxFizkSLB+D1L+7Jjcxan6R3MKicb1nDbYtVCos9QbyDuGWgAov6lKE0/FkYnCYsdsB9/N7IuoLaAiOhqr5LrJBM9ZTcaijoxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785412577; c=relaxed/simple;
	bh=1zuPPu/XETUGu4ZQI9B1HwMpcyDzKpqXzRxc/GQLL9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MpzSurNJM76IkBnisDClS+PJ0powpe8V1goTM1Rz6JU6ELV+3ey4tt43TFa1XdIjXpj2Tg5g283fopmmDzoOdDRa1TOtY5q78PM5JYvmi1p4MCtbUlcDunfpNn9A60/eHOBmbG6EyBz6v8NwemTSH1zIrGkaLgq4L1EO8JIKNIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I1Oq35PC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I1Oq35PC"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E14E3C2BCFB;
	Thu, 30 Jul 2026 11:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785412576;
	bh=1zuPPu/XETUGu4ZQI9B1HwMpcyDzKpqXzRxc/GQLL9o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=I1Oq35PC2kdksZuz7VOGhK3sApQBTURkxOnXL34zGPTqOjqDg7JuYVUxh02ODWPLD
	 eDLfCMTK7dc810rhrxp+HjVZTTUTfBDIXC/zPSAlwsMHZXJ+BomCkjrU6FcCUD2fhw
	 92P/NKN7kT8nFNOF4PYfLlcIe3tQTJFeRQEJ2CFBrbzJHVue2m6SVKGXGWiP+KFPmH
	 RXAeKIxdnl8iaTisHOAa2zxLF8RJ9+t/ShSTXr1AVBr/ODZRDMzyCc3KwW++Py5mtw
	 6AHCKxTp1fAVJvTVaCplFPy5iC2AdInWIzWor50rTvlyRF1Ym/YzT0w1ve6sJkStgU
	 vL6tX7FrtN/1Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF20C55167;
	Thu, 30 Jul 2026 11:56:16 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Thu, 30 Jul 2026 13:56:02 +0200
Subject: [PATCH 21/22] arm64: dts: qcom: qcs6490-rb3gen2: Fix the PCIe
 iommu-map entries
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-iommu-map-fix-v1-21-83405d37ba41@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1894;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=IH4Gps4f8sySvNdxSMIBp+cjuzoM0ZJM9mja6twy/fw=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqazvcujnpbWtJHLF8R0WuTnJWHZhsVnVVc/l+b
 pEyPAN0HS2JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCams73AAKCRBVnxHm/pHO
 9RDcB/9JyuZ4jCfjKbkVYtqk2huaLx3QouYyNcygKzPg6nqpODHaTuGrSjlUasc7Xat4RNsPB8L
 gQsv/hTAxPK1NNx3gcPPaLnL+Mm0bes+lSWeRu2GrKr5UYOahGU6juzGtXwG6TOZe/63JIy5Z2p
 jjc+n3EmQjxtUrIPPeCzE3W2OKHz6Cr5B2cN1C3o8ATL3MkpusQM36CzdjYtYBQq52g0juBgPpk
 694MlOP2KtiZ0ndYlz14R8vO10aT7dsGGmTwMySvZzUOQPU5bOYXSpWDN0ow0hTwhJnSw72SEnM
 gdz8z1loOchiXAnXzyKcCScue2FLxA+vgfyvLk2biFpsGaJf
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

Fixes: 267643b3e3a4 ("arm64: dts: qcom: qcs6490-rb3gen2: Add PCIe nodes")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 37a3b51323ce..03fe7d58f6bf 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -846,15 +846,15 @@ &pcie1 {
 	pinctrl-0 = <&pcie1_reset_n>, <&pcie1_wake_n>, <&pcie1_clkreq_n>;
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


