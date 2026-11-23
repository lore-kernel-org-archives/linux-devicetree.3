Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449075;
	b=n9hR3yYwffz1pMKQHpFB+blZv4vdZtWJJcib72qKoPm1CSU0qJ82fxzqWTkeLHocqi5g
	 g3POH0udmVDJ23Cy4+NMGT+C6GXqYjRjPQW6AhFq+34WvkWC+AcR16Rg508PZO6V3rou8
	 5GV6LgakuR2WMFXqPAb9bx/DZxyh4G8DyK4fPItPTTZt/whJp1Py+2PTxrN8Um6ck2bE7
	 TMOqnUp8KzOfzGn64BL+6XRig4/R72Cy4EPEVL+AJqtXwqn5H31yAaFnMPUW4ttzEkKjt
	 dq5uazg808/PuhPw3p8BhzUC4weDJqy/nKrkd8THAUOZfN6uf8N5G5ECX95w9v1bxPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449075;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=iwW4D+m71B5CxLSMynQlEBxdCbxx1WCbpTKr3ckwzGM=;
	b=axr+cQIAoURlRw/rlxWa79D5k5Pqo7Hrf7b4WflgQSNvJFY5WvnbIinzJy3pP5TqoFvc
	 JiW7SjRBwFHdTYx7pLaHQ4W3zQ1WhMPFLT+yUwtOltkluAVKNznA61vLCmaFr/VF0fSzI
	 z7+9y08PaeYsTPfMSa9RkcaF+dfUAglgqSVjmpfU4wMPAtd2gIaIvjLccJJvXoYe3zIIq
	 i0UXkXNT58uLOdEV6CifQoCBCRfM2JPyDE7MEj5eLMoUp6UB0NdtuXAy2kxOYWOnf+WfF
	 Mu2r4+9/blrQc9+Wf/vHCrtTlCoexwcqFNg8BMRqyUqp8w59NL2HybUBHxPbrzIq3fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=K5Ph3BY6;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=XRD7wNwh;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A26606A32C;
	Mon, 23 Nov 2026 15:51:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38A26606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=K5Ph3BY6;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=XRD7wNwh
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1795449064; bh=iwW4D+m71B5CxLSMynQlEBx
	dCbxx1WCbpTKr3ckwzGM=; b=K5Ph3BY6ceCHydCZf3KRRQEfeJLu/IuZFxcil0I+QTbiJXq9gL
	3sC2FAqiYT2o1NddtAC8LE3UTC7Bo/4qkbY8QudLnjD5cgYwIKTcRHTp/0mxhWWHBKmMJPbG2Hi
	KEs7Tq0MYo3zI+lVVzDICn3UIe+tdQ30NSle1B/IF/jf4rkB2qk7zD/myIf58LefCezNFkvC5KY
	XxZ4wK3j7nmZyrzeUwofzFMG6TF7eSj4c0u3LOwKrjf8OI+5M5iAZNGdj4xaDiSt427F5bh2HRK
	EDWddHCwU0rjn24c8LLEKXKxnPqY0b4I2GlYbTE4SIqgh6APZWDJgHncp8xmXCjSnoA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1795449064; bh=iwW4D+m71B5CxLSMynQlEBx
	dCbxx1WCbpTKr3ckwzGM=; b=XRD7wNwhVmejRm9nTZpbfu4FLv7QLpmLubgpQPDniJexuzrfHV
	xxO1+J09UQRpOohpErvPnp7ibwDtnG2aGoBw==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Mon, 23 Nov 2026 16:50:53 +0100
Subject: [PATCH v2 1/3] arm64: dts: qcom: msm8917: change prng compatible
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
Message-Id: <20261123-prng-fix-v2-1-042100ff94f3@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795449063; l=971;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=NcfZD9bsAfu2keC9kLoa/FhLCZwv2urxn5fR9qTCLF8=;
 b=tY9fZd1QnztWQZdXALIMJxq4QX6yfBHoiKuddduhNOhfqJDoR5PHuFmIQSGq0ZiqQScSO93x4
 M0rIMemG2FlAzm/MBwcw5EOxJ9qbEzft0ihRtW+zCCwlqVF356Y2jl8
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

On MSM8917 HW QRNG is configured by TZ. qcom-rng driver
will not have access to the configuration registers.
Change the compatible to qcom,prng-ee for skip the initialization sequence.

Fixes: 7f18b1ea7987 ("arm64: dts: qcom: Add initial support for MSM8917")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/msm8917.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8917.dtsi b/arch/arm64/boot/dts/qcom/msm8917.dtsi
index a2907f8a6376..ca647efc883f 100644
--- a/arch/arm64/boot/dts/qcom/msm8917.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8917.dtsi
@@ -610,7 +610,7 @@ tsens_s10_p2: s10-p2@232 {
 		};
 
 		rng@e3000 {
-			compatible = "qcom,prng";
+			compatible = "qcom,prng-ee";
 			reg = <0x000e3000 0x1000>;
 			clocks = <&gcc GCC_PRNG_AHB_CLK>;
 			clock-names = "core";

-- 
2.56.1
