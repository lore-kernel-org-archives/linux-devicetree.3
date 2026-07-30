Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC8D428464;
	Thu, 30 Jul 2026 11:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785412577; cv=none; b=o9ouvdSz4Btbg6l2eQ20jsoIrBaxPPaeFi1qyG4AKPRkAbSdJ6KQbOsn4RO+8Guh4DleV5DPIuVNxmXS+Mv9gD8X7hioKXAgZfxquyL3NmBOJEtUJcRPi4lo3i5kgKuu3yQOcd3AjLQ0YKDS/orxx0dl4KR+pni/DnWh5v69oMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785412577; c=relaxed/simple;
	bh=6xR1gYLXH0KYH2/bd2iw9ZQTH3sCyqgrmFs9iViatj8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OKo5TBelhbP+0wdwI/p+hJJpps0lMRrhkG5W84suzhKvyJnQwjbAyF1Xpj6rW4zXWwUab2XT8g9jrDc6/4ff45SSl1hjK625pv/t1K6fqSIqRyQnJK93YExd464mf7VRkYkg4G5Z/S2EEUkKamwK2lDoSSuH+Q6xT4AWr4JOecg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tEr1kwqO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tEr1kwqO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C400BC2BCFD;
	Thu, 30 Jul 2026 11:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785412576;
	bh=6xR1gYLXH0KYH2/bd2iw9ZQTH3sCyqgrmFs9iViatj8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tEr1kwqOFfbk4Nf3+FBT1/G1d70RTizVydpxtEQwRDQtTEWHfauVYuzMjcyWMUzeN
	 MKKYbgxPSJsb7c8OgJZ63l75OaTzV/JPN9jhAy+idUErk5jFlwQKtenH20HTjiQ9D2
	 4NafaYU+Xzqm4JH0xEEIXew4vLMXF+Hvub6nxrppeziGC0iPEdi0xCNcizYkM5JugD
	 J5myI3snOIUtM1UzRxDi9dGKtO7Or83KRhSXZZX6zEu69Ivlx3URdSTp7vidyw7nqe
	 SaEt5ZGJM50ZLbhHPTrCcTz6bYDVkzfYWabgGDyZKhiQ7zHL7i6SWMNpyhRyTvB3X9
	 F1egfYIFR+lfQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2795C55160;
	Thu, 30 Jul 2026 11:56:16 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Thu, 30 Jul 2026 13:56:00 +0200
Subject: [PATCH 19/22] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Fix the
 PCIe iommu-map entries
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-iommu-map-fix-v1-19-83405d37ba41@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1914;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=yQ3EczfmlH5tclHAyLdwGVhLjIjwDxyncav3jqLDXM4=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqazvbTQqUxYxoHuisGCWMUxPnIor7OIBv9xX1u
 +AN7UtXGaGJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCams72wAKCRBVnxHm/pHO
 9bQfB/9EmoO4EFz+tCO83RtMcEaHt8f7QFKRkLVnOFe3boYOXC1wyjGLn6MIxFXWnXljxHojb4B
 hwnu9LR8+RZZyN0yTmCQlCMgAeWELU97DqFlJ+ezvYbDr+q9JYrljG/fZt/IRuEviOZX0Lmk2T/
 3RNXWbtBwIzXxicM43BeFWqZPrXsjKjUzoEx5y5akLfC2Gv82wXLIXJUZb5W941l5ldvJZmYw8F
 Z2WoxT4ylY/SCkp+L+i+ldo3jQw+XvhYFAxIyTFuoWkpzV7LgYITtCkXrocUu5u0G6LPU5jbyGU
 3zBWNXkJ4lhM5yUpFys3mvCozPok/o/SAj/zpoc0Bt35Sw0v
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

Fixes: ef254b12ec60 ("arm64: dts: qcom: qcs6490: Introduce Radxa Dragon Q6A")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
index bb5a42b038f1..696fef50f577 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
@@ -546,15 +546,15 @@ &pcie1 {
 	pinctrl-names = "default";
 
 	/* Support for QPS615 PCIe switch */
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


