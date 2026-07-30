Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BABA422E31;
	Thu, 30 Jul 2026 11:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785412576; cv=none; b=OCm8Lo5quog+twdD1cLsdwubdbHDAH6iY7ZmH55smKgo4LDYMkrj/ZMye+msYvWcK733hyDfXVRaS9ZKeyqv9zvB4q3sEttdYCyPPoEdQHyEnvi+UBmPq+43QSkzwHEiTEA1L6+vZIOSEbyjvgE1rvmWZ/glo7AKjhq/luW69wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785412576; c=relaxed/simple;
	bh=HwAxgMKiima5YtzeRqxWpIbutGA4hoz0U3zlmdyHryI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GAVzxKMkdz/bxtLBQXh2Kx4AsJ/EJTwPcdDAP8ixtO5sds1gNidLq12jCQMMblatpygJ5FiY1lItVtIJdTwrI016H0ZOCm+ifsUsRCrxSAw7xA+4cLZDK34mjHTgos4TXXluvzGz0tND3j/NHCS8teknG32Qr/yiQ2wQg82DaGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vy0cpNT/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vy0cpNT/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D926BC2BCF4;
	Thu, 30 Jul 2026 11:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785412575;
	bh=HwAxgMKiima5YtzeRqxWpIbutGA4hoz0U3zlmdyHryI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Vy0cpNT/C1JBCXqqCK7M+sFUZSx+CyCyadXeJCTDSOqVa8WchkEZJGFBIGDWSmQep
	 l0nkjC4ZYL3luN7aCnFxcw8SNOcnQBedFHoapoaNAIsKFwecdbxSka/7IZXmgRpLrj
	 vAtY0/k8937ZpyHRCrcIKzmPJRsLt0EPIePOMGN7w4YM/AmFiEIBw4PIBxsXzT4BXK
	 bGqKeh9WmelTr6q6C7a3/MK+fxw5xLDsky4nkfbKrzmxmuI/cORBnFVcTQcgKEROtC
	 Fwzom7BTrn9UaRFt477uL/tx/kXFSDcq9BMu/lMZYJyFTyxpXPZul7FBmUSxNSTyCh
	 FFwkuLT+SOFag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9B64C55168;
	Thu, 30 Jul 2026 11:56:15 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Thu, 30 Jul 2026 13:55:45 +0200
Subject: [PATCH 04/22] arm64: dts: qcom: sc8180x: Fix the PCIe iommu-map
 entries
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-iommu-map-fix-v1-4-83405d37ba41@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2503;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=xX/QlIhJhar8K0LWb+hV5c/MI3k1XjNQMSTiC5IMRRw=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqazvWX7ei9QQA1+/3F1v7jPA5JVNOUZ3v4glIC
 lUw0yvFhNeJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCams71gAKCRBVnxHm/pHO
 9esqCACEvuRFNMyb8dHDSGvLvrR0JQ26ljAIe9HTS5E7FRAQBGQuYDeVpjjs0pEkzgbVb1BKPh7
 jWmWn/vvzvpSzzcgbvBpofXsSe3ooyHEN7QgCe7j6Eq7tXqOmkeYMKRHirMI934kSbJm1iSOwgH
 7XIcOQ/3FiXv80M3dV/+GPIPGXgYIQSbBjpVYpuKI3X/CzuGgOvf2fMlgf0aoe3wxSDBxaKJDB0
 ZT4vLfFNRb5t7n3i0W1VVSAGFBNgVj6DgK6SjKCiVRimb3/chNe07jEb0IyasWBNKXqyRg8lVKp
 Hd5h3F/APzBNvOw7vNtr9ytaQrcDRff5IfkzZ3dtdE3+9+Cn
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

Fixes: d20b6c84f56a ("arm64: dts: qcom: sc8180x: Add PCIe instances")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 45391768e245..5d3f0c4d7b46 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -1767,8 +1767,8 @@ pcie0: pcie@1c00000 {
 			assigned-clocks = <&gcc GCC_PCIE_0_AUX_CLK>;
 			assigned-clock-rates = <19200000>;
 
-			iommu-map = <0x0   &apps_smmu 0x1d80 0x1>,
-				    <0x100 &apps_smmu 0x1d81 0x1>;
+			iommu-map = <0x0   &apps_smmu 0x1d80 0x0 0x1>,
+				    <0x100 &apps_smmu 0x1d81 0x0 0x1>;
 
 			resets = <&gcc GCC_PCIE_0_BCR>;
 			reset-names = "pci";
@@ -1886,8 +1886,8 @@ pcie3: pcie@1c08000 {
 			assigned-clocks = <&gcc GCC_PCIE_3_AUX_CLK>;
 			assigned-clock-rates = <19200000>;
 
-			iommu-map = <0x0   &apps_smmu 0x1e00 0x1>,
-				    <0x100 &apps_smmu 0x1e01 0x1>;
+			iommu-map = <0x0   &apps_smmu 0x1e00 0x0 0x1>,
+				    <0x100 &apps_smmu 0x1e01 0x0 0x1>;
 
 			resets = <&gcc GCC_PCIE_3_BCR>;
 			reset-names = "pci";
@@ -2006,8 +2006,8 @@ pcie1: pcie@1c10000 {
 			assigned-clocks = <&gcc GCC_PCIE_1_AUX_CLK>;
 			assigned-clock-rates = <19200000>;
 
-			iommu-map = <0x0   &apps_smmu 0x1c80 0x1>,
-				    <0x100 &apps_smmu 0x1c81 0x1>;
+			iommu-map = <0x0   &apps_smmu 0x1c80 0x0 0x1>,
+				    <0x100 &apps_smmu 0x1c81 0x0 0x1>;
 
 			resets = <&gcc GCC_PCIE_1_BCR>;
 			reset-names = "pci";
@@ -2126,8 +2126,8 @@ pcie2: pcie@1c18000 {
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


