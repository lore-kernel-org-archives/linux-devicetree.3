Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449073;
	b=15xttd4+iePD1NWPk65sG7lPX1lRLI2fpYEPct3NkCsyd6ZCJKfKQAOSMMP9fWMVC+1E
	 +j8Maf8v3MclOi4D8pVERKWj9BJjVYK+b27aMmfi1X5uJFoNSoCy4eujyt6lBl9IWCp58
	 wLPsjtJ0W44wyIt1z1fhsspDdPuwgLIt8bY9OTvDwmdhh3sQTohRgVKB3GzyoDFyQgV+P
	 7bCBAtJIlP5gXr06+k/ilvb7+qN/eOUjSBCrIEohPSsBSs532r/Z3lC/kh4VvwnYkSojs
	 mmJlOgmQZdGAspd2wJb5ESlK0KbLAb2v0sMBAfm9rQQ6T36zDfvsJMJOcb9y5a3c9fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449073;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=XvwMVqqGag7YGpnQ/EJzHOSDkncfiHyP6I6YcxFVW9U=;
	b=a8cIttakcsk/UMQeEKU0wxrPkrbgBhmjsHtUwGbIBRGI8nP8ah8e5q1+xt53USZCH2cU
	 yZTQnV/Jhxo3i446h4jaaPS+7pnPKXV3hh8WGlZ++3AcnflP+sEJDWZK23oFaG0Zsa5Vh
	 lJ4Jy/zTc+ERZew5P+utEQc6NpgI08Mw+TBUvcATf5f8QemFt/FVcQwMtFI6Ttojug1xU
	 lG+RMoR+QeTtAaLT/gviUiSnsbh7Lhgh6x6MwXlmuwa1U6NK9q4G2oEqcny4VWUpIOi+B
	 l37loSVDW8NiEthugdoIH/FoWGFmVTcyRIL9RBWfizyuag4P8ga06HBYd40ox4IT4qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=QBZs4hFM;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b="rtFv5s/W";
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2140606A31A;
	Mon, 23 Nov 2026 15:51:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2140606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=QBZs4hFM;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=rtFv5s/W
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1795449065; bh=XvwMVqqGag7YGpnQ/EJzHOS
	DkncfiHyP6I6YcxFVW9U=; b=QBZs4hFMk1kTxOA71eLImcfmshsBeqe6IPFENLx5VP35UD+eEN
	fFUJVqOLPOUjNO3I5CMZVCPdvmUKH4exauGWW6c6bQaC5zAg3pqWfC5T9n+aC6tyWVkU4ZUbJuI
	ZkRopnW1xTD3ZXzIcL3aAH22hLTGUnmWxKNpxf2/ZlhAQkEhokH08JUnfTfpaJvlwPF5iHm2YBe
	wrp0dMweF5mJDLwwvCUPlQXihEgYTeYY+kHN7wrBvEDLSiZgXl1X6+3aFCMGwRCm6opSD0BHvpi
	722YPIuJnL8s7iYdyMPH36jyQKLLwn4UIKz0c3by2CTc2l3sI+P8EIrU47Lg4652/yQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1795449065; bh=XvwMVqqGag7YGpnQ/EJzHOS
	DkncfiHyP6I6YcxFVW9U=; b=rtFv5s/WqOE09Ay/nlUJ6EiDOelWhtbuUPo8doQVw3fLGWhCyY
	J5V4EJDQAraLbmudE/B//QPhCYt/houtdlAw==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Mon, 23 Nov 2026 16:50:54 +0100
Subject: [PATCH v2 2/3] arm64: dts: qcom: msm8937: change prng compatible
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261123-prng-fix-v2-2-042100ff94f3@mainlining.org>
References: <20261123-prng-fix-v2-0-042100ff94f3@mainlining.org>
In-Reply-To: <20261123-prng-fix-v2-0-042100ff94f3@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dang Huynh <danct12@riseup.net>, Vladimir Lypak <vladimir.lypak@gmail.com>, 
 Luca Weiss <luca@lucaweiss.eu>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795449063; l=968;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=tLle1UIK8fLBvqa/RAvXkfiLE9S9PI0NND5NYc02GZY=;
 b=81fZOhEh2YqslbnxlLsSbCkIypLjlhRquj+d1J337Xa1px3KKjke6nuYCY1yv1Yi+m8OkfuS9
 mohHRGBViAXDN++jiqi76CEKhEiCIZEELUMlPQogrQmurNNMRMeMmze
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

On MSM8937 HW QRNG is configured by TZ. qcom-rng driver
will not have access to the configuration registers.
Change the compatible to qcom,prng-ee for skip the initialization sequence.

Fixes: a829f6f2e8a7 ("arm64: dts: qcom: Add initial support for MSM8937")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/msm8937.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8937.dtsi b/arch/arm64/boot/dts/qcom/msm8937.dtsi
index 7de6447de48f..73909d6179c3 100644
--- a/arch/arm64/boot/dts/qcom/msm8937.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8937.dtsi
@@ -653,7 +653,7 @@ usb_hs_phy: phy@6c000 {
 		};
 
 		rng@e3000 {
-			compatible = "qcom,prng";
+			compatible = "qcom,prng-ee";
 			reg = <0x000e3000 0x1000>;
 			clocks = <&gcc GCC_PRNG_AHB_CLK>;
 			clock-names = "core";

-- 
2.56.1
