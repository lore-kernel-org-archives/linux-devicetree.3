Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449075;
	b=UCxTZelcv2K7L6qbtTSOUc7S2TJfGOTBgDvJIq7YYthyt4qB2moGbfKJWeVin2ucTnMH
	 6lxW7YAAZYGnuhGS41IMAy6kqlVK5iLt5ZjiVXHhW6ne9xEma5AjmFX6RBvF2xGYWbkIW
	 VxuvpWLzkVeojwI8yrwVomiJr2N632kirUMImJSfK4NMVcApx6HzzeDV+ZFPZwvarrdK/
	 HWqbCNTXRXkTx9R5QDQBBIDluLw2mi/gvYnU/dLLld0T2NHOy9QvsEyA/4kFtZcXvZwrN
	 C38c4V2D94aAmhLus4Ls4UPpjqej2KW3DF+BLPtX1mOFTZoAZP/S1QI8FNOt3FzabiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449075;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=+pXrHin3NvQfGI12Ieu/r2kNJ58Z170tjoUorf7AEeY=;
	b=iIxVKQtVxRq9NO6NpMxz5PPsmGBdpQEFHG9hlSrLB77G/wi1RuQs6WVyPNFFJgVZa4ZC
	 Gi15YVcMwrkaQSsm3rc6Uo+RZJJv8l5nYdFClrSpX8k6Ea0D+KDCahiIrZtbqlc5wJ1aj
	 ClPItebqH8q5TYe/NW5/tVnDUOGSGKBpvnj4fXp4Y0wpZIgk/74qOOc4uEAEXpoMTfRLl
	 bfBeMRIIrpvPjz0znLpibY5XZt68tYX1wMVlbZ0W2c39SZMB6g/13sRUZmn7ByfwGGArS
	 tzZOXUim9uEZK2ewo17JhKJxPKsAjDn7Bei4yOrc+EtXtf0slx+SuVx/OgghkWZs24w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=Efs8Fv8b;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=TYs4U3xz;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388AE606A32A;
	Mon, 23 Nov 2026 15:51:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 388AE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=Efs8Fv8b;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=TYs4U3xz
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1795449066; bh=+pXrHin3NvQfGI12Ieu/r2k
	NJ58Z170tjoUorf7AEeY=; b=Efs8Fv8bSwbSWAEW2XmvLzBzhpmKnOLpBFKzwxMa5krllkTX4m
	foH+pYX2fJ80f+zy0xomMZOSepuRdieZT+xwtPzU3AoNzt8dLaTtMIkGw5aFRi26IeeM8b/zLM0
	YPfr3OtGrhgIet8Ed9F9uMPg2O0ZLftue1mDy0PYtL3nBYlawbjYRBX1MTFxSY7KHK08q+Cbobp
	M1t3kB+cE4wUnPMrceKBwdQZnbUGbFA1/0kMvh278M7GsQNESSZID51gImUwcQeS7bnQWEKiJs6
	tCkYpt7bsBsR+Qcl4fVhIZlhjD+H8m7aX95/3s2RjNeIzBZIeuSyydF1XXTJQJn+Kbg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1795449066; bh=+pXrHin3NvQfGI12Ieu/r2k
	NJ58Z170tjoUorf7AEeY=; b=TYs4U3xzqRPIsXG1YsDiZsJg3/+CgTKdlAp7itm9x6pDD+0VFv
	KTWH/Pm1hPvYhLaILxLacJpL7AMBBQ5OfHAw==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Mon, 23 Nov 2026 16:50:55 +0100
Subject: [PATCH v2 3/3] arm64: dts: qcom: msm8953: change prng compatible
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
Message-Id: <20261123-prng-fix-v2-3-042100ff94f3@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795449063; l=959;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=G9bnwaVZrLF0XvKBhZ4NCSlVVqrldtWDi22f9BUF1Uk=;
 b=XuhACulCJBWKGFD1lyo0qZyuswXf4dMvWKy6LQKsZ2fPWQaBa2Dr/FNgEB7ggSTV6opLMV8wZ
 K/dbpLHxEMdDcv8CoSJaW12d42TluIHb4ghEX1MCbBb4NwVVcXDQaSA
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

On MSM8953 HW QRNG is configured by TZ. qcom-rng driver
will not have access to the configuration registers.
Change the compatible to qcom,prng-ee for skip the initialization sequence.

Fixes: 9fb08c801923 ("arm64: dts: qcom: Add MSM8953 device tree")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index 753167c3f861..99a1bca8e13a 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -483,7 +483,7 @@ hsusb_phy: phy@79000 {
 		};
 
 		rng@e3000 {
-			compatible = "qcom,prng";
+			compatible = "qcom,prng-ee";
 			reg = <0x000e3000 0x1000>;
 			clocks = <&gcc GCC_PRNG_AHB_CLK>;
 			clock-names = "core";

-- 
2.56.1
