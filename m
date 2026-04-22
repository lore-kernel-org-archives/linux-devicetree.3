Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C952A347532;
	Wed, 22 Apr 2026 15:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776872404; cv=none; b=eBZPdpZOW4lBkwL87VQqxwIbHhPbwMdTGGHC3lZHRLpK9dADraEn2bRnoOhPB01JZXG1Yx8yJnVIV2AMR5XyCCH3lWhvsLhpVRNk7oyd/VOtvamwyd0KhLGfi5hiTgG3DfzPzXwd0FxAUA3gWj2UEj29cuA1vc/Gi+5x50mKMbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776872404; c=relaxed/simple;
	bh=fFc+ks/fhFMVcUXciNTDaM9xhx0ui+E2LIol8KwmBWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LX4MHTP8pjYnzv2/1fqMxnERlGpKJkrJV/FO2xqRMqvH5Wtwzo/Ye3eDBsTtByT8sdqQNnM3FkCd9oZ2G9j6BWrUaJYdo0ENU4XEkwjQKcWHKoJdm0DNK8jj1aRDA8B9mlUUPiJWih5mpl4STCsGMk7KHsWKuSqpoUXNvwyu/LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=fHaSNoaC; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=+0SoQDNB; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="fHaSNoaC";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="+0SoQDNB"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1776872384; bh=Frjjk/YjfGcE2eAnwcc/WBQ
	vWEsPQ7ulWqCq9RkplYg=; b=fHaSNoaC4GyQefQQq5XocBfiuCjqM9M481QVBDolcx4o7rNaY/
	I2Xm/EcwlPA1Y4d61C/ntAum4V0RbIItWALOOHQ5RQ1zA6a0lF8vELgTjS5vlwS+wORnkNWGKEk
	k1peZTQDgpjqBqNYFMb9RaqsCLmde+BPJUhM07Wzu/hfGh5ltqbE6dmY1sFKfT1nkx4abQ/1POg
	P8jB9CBQbcepwrHgJeGZo58Qn0mW/KysN/khcyGqXtzOG0Hsa/+v025oy7D8/yOL5Pg0zgx32wW
	0dZlvaUyOvChxWpUOAG/DIgyhT4stCK/d8OqATQ+yNaDGZGfI4c6ETOwMQhQRfd6ilg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1776872384; bh=Frjjk/YjfGcE2eAnwcc/WBQ
	vWEsPQ7ulWqCq9RkplYg=; b=+0SoQDNB2kV73i8xUpzxsgBSlFMQJ4CPgoWGkfdC1nsUInj70e
	YllxWVV1BX5E9daZHhuQgE6bkqetYw9NJpAA==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Wed, 22 Apr 2026 18:39:20 +0300
Subject: [PATCH v3 1/4] arm64: dts: qcom: sdm660: set cdsp compute-cbs'
 regs properly
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-1-274ba3715db0@mainlining.org>
References: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-0-274ba3715db0@mainlining.org>
In-Reply-To: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-0-274ba3715db0@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Nickolay Goppen <setotau@mainlining.org>, 
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776872382; l=2514;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=fFc+ks/fhFMVcUXciNTDaM9xhx0ui+E2LIol8KwmBWc=;
 b=pJa2M8xemTpOQqXRn7rY8V41HJQ1xXrUNKaoF3tsRFZGEBnUh8YZB8m8rLOjdeaLammJ14QRz
 7+XCg2UzOkRC5oeu3jjEf04CN5wZtxFD7i6Nh9xDKCpGWrDLhW3MUNT
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

Changing FastRPC compute-cbs' reg values to matching iommu streams
solves SMMU translation errors when trying to use FastRPC on CDSP
so change FastRPC compute-cbs' reg values that way

Fixes: c0c32a9e3493 ("arm64: dts: qcom: sdm630/660: Add CDSP-related nodes")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
 arch/arm64/boot/dts/qcom/sdm660.dtsi | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
index 3fd6dd82a992..0fca9662c64a 100644
--- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
@@ -350,57 +350,57 @@ fastrpc {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
-				compute-cb@5 {
+				compute-cb@3 {
 					compatible = "qcom,fastrpc-compute-cb";
-					reg = <5>;
+					reg = <3>;
 					iommus = <&cdsp_smmu 3>;
 				};
 
-				compute-cb@6 {
+				compute-cb@4 {
 					compatible = "qcom,fastrpc-compute-cb";
-					reg = <6>;
+					reg = <4>;
 					iommus = <&cdsp_smmu 4>;
 				};
 
-				compute-cb@7 {
+				compute-cb@5 {
 					compatible = "qcom,fastrpc-compute-cb";
-					reg = <7>;
+					reg = <5>;
 					iommus = <&cdsp_smmu 5>;
 				};
 
-				compute-cb@8 {
+				compute-cb@6 {
 					compatible = "qcom,fastrpc-compute-cb";
-					reg = <8>;
+					reg = <6>;
 					iommus = <&cdsp_smmu 6>;
 				};
 
-				compute-cb@9 {
+				compute-cb@7 {
 					compatible = "qcom,fastrpc-compute-cb";
-					reg = <9>;
+					reg = <7>;
 					iommus = <&cdsp_smmu 7>;
 				};
 
-				compute-cb@10 {
+				compute-cb@8 {
 					compatible = "qcom,fastrpc-compute-cb";
-					reg = <10>;
+					reg = <8>;
 					iommus = <&cdsp_smmu 8>;
 				};
 
-				compute-cb@11 {
+				compute-cb@9 {
 					compatible = "qcom,fastrpc-compute-cb";
-					reg = <11>;
+					reg = <9>;
 					iommus = <&cdsp_smmu 9>;
 				};
 
-				compute-cb@12 {
+				compute-cb@10 {
 					compatible = "qcom,fastrpc-compute-cb";
-					reg = <12>;
+					reg = <10>;
 					iommus = <&cdsp_smmu 10>;
 				};
 
-				compute-cb@13 {
+				compute-cb@11 {
 					compatible = "qcom,fastrpc-compute-cb";
-					reg = <13>;
+					reg = <11>;
 					iommus = <&cdsp_smmu 11>;
 				};
 			};

-- 
2.54.0

