Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360E2423782;
	Thu, 30 Jul 2026 11:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785412576; cv=none; b=eVJNb8MIB6H2Yqp2LD+xLsK4e9+s0gzPHITKpOXGfKGF/TYGpzeY3WeRvW4Q76u/KjuHPQZj810CLh9Q/pyPyGPUX4HM+YjEKHLeFgIWjf9460G+KnGsV1GiqY8R/fT1/Y2yF2uUODaZhTQnZ5bUcbLLu4NZigftzGMKfPA2o4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785412576; c=relaxed/simple;
	bh=yv+MIf9zJoNi3I6NjlQX09apV2NGHGDndWBMtr24YJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=btzDhA6v+NNoqDnwG1UCE0b8+raCqikYuxJdu1MRFSOljfzU+oYqHUry0eXDjDBEVfWuIVmLJdGT5k0csf79m2iBI9y6fGhKJz5k4jtqXGV9Pbc/V8J+CuBZmFyF4Vc2Zb74xK2zx4Zm9cLU81WpswPFLiztDtD+zrQgATZ+3z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OjhmHa86; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OjhmHa86"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EEE30C2BCFA;
	Thu, 30 Jul 2026 11:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785412576;
	bh=yv+MIf9zJoNi3I6NjlQX09apV2NGHGDndWBMtr24YJ8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OjhmHa86fQpt5KA1ONq0L8f+PAv+C4jFgo+Yr+9kQYXmBFzOH0qzSvBWreNlCpDZV
	 2oGu+31I2co1QLH6ykfN9HnSyCgts6zAm6W8EQN/ogFHSsfacnfA0muons2iQEcgZF
	 GS4l4Ug+W32Llf0Xg7EKaumdC2vRg0qRUGbpbeK71wtp4He8c+HRMnog8fmpRK8DPE
	 7SeaAtBHwJ9xQ4f/ZcdND7mLK4aMG3+BCU2xf/IBvF6SEgyGmJgQ6ZwmeeoexqbsIo
	 uIcNveJmgVHD2kUFzXMzpLpWnrBsuU8SVAq7eaPOhH5PJl3dcQrtzQuPtExbMybPQg
	 oCZft+0yOTYrA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B07C54FD2;
	Thu, 30 Jul 2026 11:56:15 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Thu, 30 Jul 2026 13:55:47 +0200
Subject: [PATCH 06/22] arm64: dts: qcom: sm8150: Fix the PCIe iommu-map
 entries
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-iommu-map-fix-v1-6-83405d37ba41@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1664;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=QnBvbHpNJklZT/OMpk4X8TW2N9zpNrlZjrQlf9FYJvk=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqazvWbbMX+7jRYFbDcREWGI6ijLONG3Atok+/L
 LqM1c3O4+iJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCams71gAKCRBVnxHm/pHO
 9ckOB/oDsqAthNARGMeRoptGRYg1yQNUR+j8M9hp4N1gcSHTaRQWRpq6YPD3G/izIwEPoCi5pW5
 mr68x6ClmfxDgu1fYZ6/fjmIBWiEvem0XNX5BP3r1RqgB/VJF+TZJ19sMN91JKfRn8SrukldvnR
 uEmcwfbhNO7hRdsVj4PVfzjyh89kat8gpgey9hEj/uY3Qh6g2XCjr+M3sSkv571+TuBcuh88tVP
 2SjV2+vPRlNVRGGhPeblreDJHjEGRuIgxev8CtOhSgobi5saemD1AkSv5P24uuYMQ7ShGCD2nc0
 EM73VgOO2c1Ad4oZNT3I5KnvFGdYDQvJCLK/D3cpXoNRdyAX
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

Fixes: a1c86c680533 ("arm64: dts: qcom: sm8150: Add PCIe nodes")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 0e101096209a..109a76f4ca75 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1893,8 +1893,8 @@ pcie0: pcie@1c00000 {
 				      "bus_slave",
 				      "slave_q2a";
 
-			iommu-map = <0x0   &apps_smmu 0x1d80 0x1>,
-				    <0x100 &apps_smmu 0x1d81 0x1>;
+			iommu-map = <0x0   &apps_smmu 0x1d80 0x0 0x1>,
+				    <0x100 &apps_smmu 0x1d81 0x0 0x1>;
 
 			resets = <&gcc GCC_PCIE_0_BCR>;
 			reset-names = "pci";
@@ -2011,8 +2011,8 @@ pcie1: pcie@1c08000 {
 			assigned-clocks = <&gcc GCC_PCIE_1_AUX_CLK>;
 			assigned-clock-rates = <19200000>;
 
-			iommu-map = <0x0   &apps_smmu 0x1e00 0x1>,
-				    <0x100 &apps_smmu 0x1e01 0x1>;
+			iommu-map = <0x0   &apps_smmu 0x1e00 0x0 0x1>,
+				    <0x100 &apps_smmu 0x1e01 0x0 0x1>;
 
 			resets = <&gcc GCC_PCIE_1_BCR>;
 			reset-names = "pci";

-- 
2.43.0


