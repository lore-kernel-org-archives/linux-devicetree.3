Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5D24248D5;
	Thu, 30 Jul 2026 11:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785412576; cv=none; b=eZr/jrXGUnRAKtC2bgfdqzoIth8yIMiqrZO22ZpxM6zaMVBZ70BWlrJgXi0UepoqlThZRhA50O47fYtDvMnMpczNYgaPPR2SJ3eJyqXzwUq/feSYAEDlOF3hnxss6M/lh/1fqofIg5ux9/OYELfKf4mrPKfI8l5Qdxur3QBurqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785412576; c=relaxed/simple;
	bh=7oNazKhfsq7vU92fN/TwRqkxYMwwPkAHRlZHfQ7/Erg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RqjWaNYddi4kRmL4KMhYak5eTHr8nTuNb9m6EKzv+ecouiLWeLzjkJ+fL9EKkAGnXdDW+wk4BNnViv8ZJ2nHdFuaT5JhtSogPD+QX8++ORy4s5EOXmRtMbhdFzdp/VZhtusCPiC+KWtnmyY16nKtDrbVpf/Td6m3KR5rZ5oEvT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FrYAFo2d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FrYAFo2d"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 14CF3C2BD05;
	Thu, 30 Jul 2026 11:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785412576;
	bh=7oNazKhfsq7vU92fN/TwRqkxYMwwPkAHRlZHfQ7/Erg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FrYAFo2dRBFjXqZRiKeck3MnueC0PbrSgUZTCf2A7dOn8swbeET/ZmkJwYyegW7TJ
	 l8Gg9S/8XxcME4IvVGOqO3om4QfmI0SIibuC7X+o2MBffDDKC8pFWcXz2vSToYYsDn
	 1ARJ4jqlEGKEgG05d7/pw5OuPqkVTaGH5BBbvBZBMiljKMEYIN24D+CnWk3rcNTzxC
	 G7VnYFgVupb/G+Z/kIQ2pZCM/kb8s7du0TDFZ1KzRj7xbGUNPlREeomJXwHbO8VsOO
	 XQQ+wozbL04zUUoo0lEVUL6cU5l5Vz9a6JAmL2UBWteivQNPcItrsfjIkZVLQxqYdA
	 2/H2vheJfUQkA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03228C55165;
	Thu, 30 Jul 2026 11:56:16 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Thu, 30 Jul 2026 13:55:49 +0200
Subject: [PATCH 08/22] arm64: dts: qcom: sm8350: Fix the PCIe iommu-map
 entries
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-iommu-map-fix-v1-8-83405d37ba41@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1620;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=6kfXzJnWLiEZDxHG4p7gqALDFFxuJl73Aay5PvfXXl4=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqazvXU99VEqZrlQR2VZ9hdH1HaJnkXfLU9JoaA
 b7qHlFvzreJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCams71wAKCRBVnxHm/pHO
 9dpMB/4rtkLzDc0+MsdFMm1U1HVzfIEz80Cgtc3IUoUlU8+wO9sVDpZ9SXZWEbOTaUEl+DuuTyZ
 fEztmGHoW9LrAmoN2HBNDo/wFHNv/i+8Q2xHfxlea4teGkkJU74jBv4I+gAUZhHIqT2JYfQsWOE
 W/WYt7Z/nv83LC9MjKIROkSHhyHqm3ScBWaCOWRiLOVQHuaPYAsvY1mLY0ubkOioV+iHtqxGswD
 v8Wf4LU37P6pL0czBPCf3vvJwejEabJhDhFc7s/Ed0OtB0TN8YxyX00HDzQP75fr4bbNw1FLrO9
 z0zwuKxKo11jWpXGuO7n1Mo2p5y/bx+GRXWhWGeiQQu6tLSy
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

Fixes: 6daee40678a0 ("arm64: dts: qcom: sm8350: add PCIe devices")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index c830953156ec..20c3ab9465d2 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1575,8 +1575,8 @@ pcie0: pcie@1c00000 {
 				      "aggre1",
 				      "aggre0";
 
-			iommu-map = <0x0   &apps_smmu 0x1c00 0x1>,
-				    <0x100 &apps_smmu 0x1c01 0x1>;
+			iommu-map = <0x0   &apps_smmu 0x1c00 0x0 0x1>,
+				    <0x100 &apps_smmu 0x1c01 0x0 0x1>;
 
 			resets = <&gcc GCC_PCIE_0_BCR>;
 			reset-names = "pci";
@@ -1684,8 +1684,8 @@ pcie1: pcie@1c08000 {
 				      "ddrss_sf_tbu",
 				      "aggre1";
 
-			iommu-map = <0x0   &apps_smmu 0x1c80 0x1>,
-				    <0x100 &apps_smmu 0x1c81 0x1>;
+			iommu-map = <0x0   &apps_smmu 0x1c80 0x0 0x1>,
+				    <0x100 &apps_smmu 0x1c81 0x0 0x1>;
 
 			resets = <&gcc GCC_PCIE_1_BCR>;
 			reset-names = "pci";

-- 
2.43.0


