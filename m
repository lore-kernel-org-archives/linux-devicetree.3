Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D2B33A014;
	Wed, 29 Apr 2026 09:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777455027; cv=none; b=DFaVdcFjDqivYHzmxp+fDZcdDabgmJGD5W2hoawh07+L5dTkxZ6uY5GMm/v5gQeiPXKnfkUDQHmNGjJKdXF3xqYjbn/To05msPvhu8S91RJYFIW618daxEvsvJRydvnp1lLl3DjkcAV6kNoI153jSZkRQN23t+vYDt/S6i/KA90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777455027; c=relaxed/simple;
	bh=UjczPjOcgRtrys3/EUzMogDLJ0NH/eLdy2TGRE52QPs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HLsv07W78ie4EJnTHFY8jWhD1Kbi79vmiObgUHNvV023WPa+2/GkC8XTUTkEr84Eqzd6bzVZ0LxfiFIp5nqHDhV3aQEHbyhzxSF6dGCixPcdQ3RPPoVyVpJ+jk756WffwqFujZf4v+Ny0urcjojKiTbQsHgMh3xVZU4Sgd8vuWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=mK8rF1CO; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=oddBBFv/; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="mK8rF1CO";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="oddBBFv/"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1777455014; bh=6ZDnbudYd8Bx04u61QlyRAk
	dIXUfgtcS1rxS8UCJfHg=; b=mK8rF1COlUTFsWBsZMpoQcFewaW37VyGbX8DSuBx8YVVVtMs3u
	CLCDYoRvTTQJSrMhdxUoOiqsapyD3PU6zgFlhYdtbkQhhSZJ4Q8B9UWZ0rgzl4TUjyTW2qfW/pg
	xW6nylu/g+H+dC8rAXBX+Pein1ntZCqFXuOvL8K39i+TQTL/qaOzcTM0+bGz4pSDZKueK3wFDjv
	WG1IeRpgQym5Gq12MI89HDP3/erNZ4FJXmXAnHWPJ/TFXKY9bhAyVaUzV/O9JfGXhxrY2gvrvwp
	pH2nj4xNgU+ybjGZeVH2Mu7+dqHttNaSAn3QSVW50ftW36YyOGmloaaXLpAPnrBOubg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1777455014; bh=6ZDnbudYd8Bx04u61QlyRAk
	dIXUfgtcS1rxS8UCJfHg=; b=oddBBFv/3hpqX5Hvqcvy46xB5zoTHT7t+Jdbd+B297WZvl3YRk
	F8FhKf8WOGeFt5Puo+u1It3P6QY949XGlKAw==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Wed, 29 Apr 2026 12:30:10 +0300
Subject: [PATCH v5 3/5] arm64: dts: qcom: sdm630: set adsp compute-cbs'
 regs properly
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v5-3-16bc82e622ad@mainlining.org>
References: <20260429-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v5-0-16bc82e622ad@mainlining.org>
In-Reply-To: <20260429-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v5-0-16bc82e622ad@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Nickolay Goppen <setotau@mainlining.org>, 
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777455011; l=1669;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=UjczPjOcgRtrys3/EUzMogDLJ0NH/eLdy2TGRE52QPs=;
 b=sd28YXnopeX1LH7aI/Peiyt30twhGRbhfj5oUvfgT3164tz5Q1RB9PjNe5oXDlstakrq19P4V
 tkLhBKOvkJHDznxXfbVG7/mUiNd3kkqZjy7m25zB3N7Lc0hO3WNFaYy
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

