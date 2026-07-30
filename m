Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD4642587A;
	Thu, 30 Jul 2026 11:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785412576; cv=none; b=Y8qok+pI2GNV4LbLHyrGw3UqxcmXafRuX9Bj61r43BjQ8B+jM19fBkqcjZw0hDQs4fdxznIKdkp+Yb53M2aOdhFFAPCl8Dn8DOHpgo732hkgQzgUxujuwNNIFXoH6i9wJFpHfxH4y2S1ZLx4PRASxca694lDAe/b/FyKmg+OYsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785412576; c=relaxed/simple;
	bh=chVTMU6yFK1AbEDuzXefTfNRENRx8V85YCUCZ/BECWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qfyiunzu4fqgBaIYmEUh7RbJZW3uoyXxBDAcCe+97o9OXk16vbtvzZ2XvnEbE8lYZ/huGHxXg+UFBv0938Zr7Mh5RqqskysDIFmp0jL+KBTq6tCd7AFYCOzJB82qg95o5ZrpgA3kXtkQ2nW+L5XpzpvH5SdazPTclo6nftOCl/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IZbRLQih; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IZbRLQih"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61937C4AF12;
	Thu, 30 Jul 2026 11:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785412576;
	bh=chVTMU6yFK1AbEDuzXefTfNRENRx8V85YCUCZ/BECWY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IZbRLQihw+A52ZXleECh4YN0bFClj8ho95H+omS8cO2CsYSgjMoXJngwbzOtK4zxZ
	 5kC1JwpBy6nDKxksKb69X2dlzBPsKTG9wASLognRQGO+O5uPI9cCSlaUhazL4NxI6p
	 PuNlraR8v/1TRGY0Kn+F2OzIineP4I6iUlRZbTCJotG/7T39R7rYa3UtdFjkr7uJg8
	 J0rOHFlPec20F9AqEUyOFPpnq2hBzUTZe7pqqT3d6MyNhlE6AKJtfO69GkuJJy84hh
	 MsjCr3K5+CkL7rrJ0BZq/WPs3MNvMpO1M9QaFlCX2tG9W7+toQiMN7huyb7/dK3uLe
	 TYpgxSsRG3vQQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F1DDC55165;
	Thu, 30 Jul 2026 11:56:16 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Thu, 30 Jul 2026 13:55:54 +0200
Subject: [PATCH 13/22] arm64: dts: qcom: talos: Fix the PCIe iommu-map
 entries
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-iommu-map-fix-v1-13-83405d37ba41@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1334;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=7OSGlRaQko8HFbJoyzKNn3gvY6RV4+U4dviVNJnyu48=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqazvZOx7u+ytVugz1dUzBIRXSfJdw8Np/NVc2e
 q/PFs13KemJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCams72QAKCRBVnxHm/pHO
 9W9PB/0VlGvU3kNIS57SSScpzhVs+aSwwmwwSmLEmMdKaWgfZSI05HfpR5kgMXU1RTfHwz44iZe
 ZkC0hGY2HusEvIm4CYOmiMOjXwtDN7K3OTiguqXOH1I50BFerly8rbdFr/SNXQmQtsWVUwDg60W
 OJRlXwCR3nezHpPAZ+4a+ACl+xI/0z4voa4epar/sD71JPobQqFjwqtlxC4maZs8H2oCnnz4S3/
 nMhVeNbD2/WiidSK3pUa4lCX0NRZiR91MfZLr4MrZ4n8dTXzDIYxqdd39/GC/UukE2B043wX2ER
 t5zNGQyFDkC2MvFaK7rd5FQB+hcPVN7hmzElXVlKtyfP17+A
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

Fixes: 718cc7542a00 ("arm64: dts: qcom: qcs615: enable pcie")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index fb1bbc51bb8a..76b1e86b57b0 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1349,8 +1349,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 					 &config_noc SLAVE_PCIE_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
-			iommu-map = <0x0 &apps_smmu 0x400 0x1>,
-				    <0x100 &apps_smmu 0x401 0x1>;
+			iommu-map = <0x0 &apps_smmu 0x400 0x0 0x1>,
+				    <0x100 &apps_smmu 0x401 0x0 0x1>;
 
 			resets = <&gcc GCC_PCIE_0_BCR>;
 			reset-names = "pci";

-- 
2.43.0


