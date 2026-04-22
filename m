Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723FC34C80D;
	Wed, 22 Apr 2026 15:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776872397; cv=none; b=sWTv7Xp0cuQvtdh3dwpbmcENUTsnTbKo+gFqmlZ8szQU75b8jdiG0CrfvHV0zYhufV//rbi+qdWLZyVuimAs8SyM2H1TkZDSTaeINF1DVCMYUt7jaS9gltWw7RQc7QbcEnp/E+DmGd7K+I2MaKYgFFvBwkmkz3M86AzRHlSIddw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776872397; c=relaxed/simple;
	bh=UjczPjOcgRtrys3/EUzMogDLJ0NH/eLdy2TGRE52QPs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nYnJ7OpWvfeaUykvNGst0ydff+k/pNu60fB51RFg9y7Uz8JufwRRNoihpN/TmaPpfrcGvzUbL3rxrp7INS1XLT0cRsFPARD9ns4GFA+kvplltH3tCvs27wV0p8mO5lqPtVVkuKbf2LMNr9QZXBNBTDL2zmYjNGYaou2PLCcDmbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=RymC1zRN; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=/5wl5d1X; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="RymC1zRN";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="/5wl5d1X"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1776872384; bh=6ZDnbudYd8Bx04u61QlyRAk
	dIXUfgtcS1rxS8UCJfHg=; b=RymC1zRNcwjzkEozhOvs3Odrp8J4Uw073Vk+2t2/Kfbwp0peWL
	Q3FpzhasaARPJH9EbMD3zD8GF49IHfo2FzCEI26mrFNYqfkpipXI8r3XaTmUsZHCQjcdZFab8l8
	htXE2xW9CqtIJw4GDvpncvol8jGNhThDQKi2lnaJZohYgtMdPczyxdhAKccgnOWOaW31VN1J8Sm
	76hW0nOxYNCikkmUKgWA7vBLKoHUpmIFOKq1GWg6ZWhKvGqbxSW52Ao4LApJFEIawnePWSlXkj2
	88AlcBowPRWRSwf7sb+gQOJbv+RErQJNL6fHSP0pjTJGH2KepjTMxHSanpBrlG6dfMA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1776872384; bh=6ZDnbudYd8Bx04u61QlyRAk
	dIXUfgtcS1rxS8UCJfHg=; b=/5wl5d1X+gn3Hz2osmXz2iRul1tWBsN/ydIehu5r7IVTNHoupD
	dseTwPcjtzUCRmWeWZYnFDc8W2MBVD3ELsAQ==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Wed, 22 Apr 2026 18:39:21 +0300
Subject: [PATCH v3 2/4] arm64: dts: qcom: sdm630: set adsp compute-cbs'
 regs properly
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-2-274ba3715db0@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776872382; l=1669;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=UjczPjOcgRtrys3/EUzMogDLJ0NH/eLdy2TGRE52QPs=;
 b=CyzERvBgEpZWbHk6m/RaxnbLrG8WNVpd3asdPZA0mSTQtYIPbZ24K/rSbkBSA3kR0VFRnqoHP
 SsgVAghRyT+BjqC5EEIXyY6Y+sLyXEUa6/P0Ktr1+zIntB641ca5Zv1
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

Changing FastRPC compute-cbs' reg values to matching iommu streams
solves SMMU translation errors when trying to use FastRPC on ADSP
so change FastRPC compute-cbs' reg values that way

Fixes: af2ce7296643 ("arm64: dts: qcom: sdm630: Add FastRPC nodes to ADSP")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index bef3213165d6..4b47efdb57b2 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -2459,27 +2459,27 @@ fastrpc {
 					#address-cells = <1>;
 					#size-cells = <0>;
 
-					compute-cb@1 {
+					compute-cb@3 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <1>;
+						reg = <3>;
 						iommus = <&lpass_smmu 3>;
 					};
 
-					compute-cb@2 {
+					compute-cb@7 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <2>;
+						reg = <7>;
 						iommus = <&lpass_smmu 7>;
 					};
 
-					compute-cb@3 {
+					compute-cb@8 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <3>;
+						reg = <8>;
 						iommus = <&lpass_smmu 8>;
 					};
 
-					compute-cb@4 {
+					compute-cb@9 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <4>;
+						reg = <9>;
 						iommus = <&lpass_smmu 9>;
 					};
 				};

-- 
2.54.0

