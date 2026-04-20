Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85A938F236;
	Mon, 20 Apr 2026 09:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776678150; cv=none; b=o4vKDOit6MsRAz7M+hNuujl6kSBo0w8XiHf/9vNq21F+fYgNzevluK6vCstDT54PhgI5wSp4ex6IUYiYmcDWzFolPsamu6/m/JXCOtWPR+VTwCpgINjyhv7m8VvVMIZM4QTx2SV/+vU1Rj5XqFm8aGXy4erkvP0lRbspSyFLf5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776678150; c=relaxed/simple;
	bh=qnJOqg7gPa3TsorHUFESw9J+oibe+eLNIc9tZ4HLreo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OaIVK5gI4DHLY5Y2KfSA2K7YrTV2jHyxIK9riOevx66n2RtMKAZuaxiSpa51L9yTZspGm6cigdNr908RSmQorkJ5IVMTvD+V4ZIaQl8e/J/FHhLl6mNyx2OJ0ZORIRuS0v7oY7XeIwsCm36//PWK1rU8io+rGhpFrrspWMuIcRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=oX/v/5U9; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=9PIUVGYS; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="oX/v/5U9";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="9PIUVGYS"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1776678137; bh=3ujqzBWtRDWdp5zmmSaRRts
	8A0NFQcr0WTRYGteNTgc=; b=oX/v/5U9nTwTLhMpKPGQ7ioAqeULxkfAY22GR7jDOVBVLvOrLe
	hHxPY38yX/EPLHwbJZlsItP/EuKgwkFgZ3XShA+iywlVVF3BAM4yn4FyPgtu46xQjXYzb3z9bCF
	N2JXANW23xC+fnZg3dPwYP7HuO3FJce2ybbpMfB+i3j58PPEXqxnYFvhbEJiRTKEE8SPKAgQG//
	zi0yBAyIgIDs15yad2dyaiNhhcHBrCiqMT5oTNKCKGOKTlFVLLf82IDzOX1iqRpLZVvqlgJiJYu
	F1nK6yPh6PY9ZYG07iknv56Hi001P0VPDp+5A8Tugxy61Tm3nAlRs28dKjFnFL6Z8QQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1776678137; bh=3ujqzBWtRDWdp5zmmSaRRts
	8A0NFQcr0WTRYGteNTgc=; b=9PIUVGYS+gvjHHERJY0pxVzdAD4l90xqGi5el6g355hMhf3U+K
	WQuw4vU879whou9lJ2jAcgOac+TygtFB3KBA==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Mon, 20 Apr 2026 12:42:09 +0300
Subject: [PATCH v2 1/3] arm64: dts: qcom: sdm660: set cdsp compute-cbs'
 regs properly
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v2-1-f6c7ab3c889a@mainlining.org>
References: <20260420-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v2-0-f6c7ab3c889a@mainlining.org>
In-Reply-To: <20260420-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v2-0-f6c7ab3c889a@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Nickolay Goppen <setotau@mainlining.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776678136; l=2455;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=qnJOqg7gPa3TsorHUFESw9J+oibe+eLNIc9tZ4HLreo=;
 b=Hn/MGxneysV42Vb+q2z/rAVKnKxBI2dZ+K2tBVvcP6VHDg3/IADQtvHpBusdPtzoXT8ppSZH3
 mkyotWZ8hlPAW2o4vtKkfjiwFh1BrTLeibyZTeunR02GTVDQkkCdeuM
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

Changing FastRPC compute-cbs' reg values to matching iommu streams
solves SMMU translation errors when trying to use FastRPC on CDSP
so change FastRPC compute-cbs' reg values that way

Fixes: c0c32a9e3493 ("arm64: dts: qcom: sdm630/660: Add CDSP-related nodes")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
2.53.0

