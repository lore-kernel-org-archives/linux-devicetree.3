Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D975938756E
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 09:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777021690; cv=none; b=YKbmGrrAXQ7XOAtifzMgBUs6R72TRl8+vUGUMXPTXesjos4M8gVntoI+D7OEDmHjehOo1PI5kG1E/kTVT3MFgKag50MbF4XxQVPSgQlwAIhNBEOEj58FQjTRsgSUaFP3rbzwN7GcRLyrPM3NVda3LGGJy/Cw0E3kumTwsOh9QvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777021690; c=relaxed/simple;
	bh=8UCqKS51w5RlR7Z5z2QLTaDqXfPwDG1/feXb0enazX8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QkB1vmljDmEG3cBl6K7R4oy6kXQ6vp3+FqZXoD28i5WsCPd8+B1x+4iYZk/rq0/APsntCcPzcvqAT+izlPhE5zwogGJegwhTWJ2VBHvAgDO+scyzqUA/cOvBkMKNd0KMMgIfh+L5F9HZbfCQBEoQi4gSGwX766j/9s+IaIGNAZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WPKWvahR; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WPKWvahR"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso47682465e9.0
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 02:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777021686; x=1777626486; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQrbXesEIOG1EUuEQC/o8Fu4R0n53iSwERhl/LZDWYU=;
        b=WPKWvahRzfWoC7R6dC7k92M9/d/I8f4edHU75oc0LpV07Un6Z7YVmo9cpvFfZQOgcR
         VJ/EDVEvNcE1es/UfLLXnfnnWwrx+a2WAkqMTwImAU8BSQMghrU3Ua9Qk8O21J1/O1R2
         u00tQL18OYxGW92ujLaO786GDh6viT7n4yfj+ZidR67PwYSRvLHXd7mHOhDW9/yPpEnN
         eAcp3FAJ5/dEBUO5+INpAULhfRqkSnEl/GFnSL04Uj2ZLeBPV2RuDKB0cVTHF2hWRMtz
         CL4zzL5vYhJZQ+ST468iTqyhBh48iIaj4srlnYtf6reKKfETX4gpiIS6vK46L6gWoK/d
         Cswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777021686; x=1777626486;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DQrbXesEIOG1EUuEQC/o8Fu4R0n53iSwERhl/LZDWYU=;
        b=CmZXD28SgwqyO2ai+O8YzujMvzluK2/mb+4OuNj9zX3kT5gmxZICFl12+NB8Xg1Ejl
         AHFXfuxF4nG/V0Or4Vw9tZ+4bavMHNKC0T9bhtMv6liSpkvaWXBSgoBTI/OaHA8TPyjz
         S20XJzAbeGkj6oN4k/txI9Odji5M0DQUb0sGgYcCcP2SsfTOd05fSUrXGZuhPkg039zw
         M6+M5tURyz839/sGQSDtKrBFwNg2NQme32+yvJ73Oc71tS+ABysJeQp1o9/sO5/pGjj0
         7xShVie0zURvXfPMkRU5AlT6ZH3rnjfMEKj7MWgOaTSFWWibZT1U7M2+pzDYPdhoruNp
         OYNg==
X-Forwarded-Encrypted: i=1; AFNElJ9Irla9BkklGV064kWmS1z4HWUgQX6Y1KM54J9g8mYxp8w6vIuuCLIKwXoQy7VK9TOET4kB+leBALXO@vger.kernel.org
X-Gm-Message-State: AOJu0YwAgD6mBkZChKkRsUSZvJ3CcW/mY+OIqBJFSUsZplj5QNGBU6LN
	qy4YeL67z0DOuTNPLxtelz3ezMUIIi9hFYKfD7xIJ98xh/o69Tz6WlMBCg931Gcy6iQ=
X-Gm-Gg: AeBDieukRiOyU8pX1IBXIRCGpScakg2UmYN3x4Iu542uP6nm38gl9UyomO5d3JULZkq
	VbJtkC8zQUB7GrDB8zV6IkV7BgWrvr6nrkSK4qrIhAYO2HhWphia75J3fp8nNyysO88LxLIhnBt
	iObxJfmD8bB9CzQ5x9GArW2We5dwNRhwoZjtLL5S7AoDDVGtHdwNEPN60BdHdeE7A+7Z6Wm2Pbs
	HqJnRKahQ4B4OR+b2IZMYhsB/qTMTC8dpdvWTalBTaGF5S3Xd/Vmv2NyWXzTBi4aiTtExUl1dQS
	APBaE8JG6PNcSVJpZenA9iYwCV9hd1RHM5/k3sfzwHTfpszZlAsLoK8foAsagm3jyWIcagvoS2i
	HZLNVi8xFgMromnYR1rdXCv7ycVOs51Ch0UZUcBrGz0jvZlJyNLj8andjoDbig5b4vQhv++b1Qo
	bFmOVU3HA3LxWizaYodlnh4n0mO6naHzyR01KjsuZwMJg293yNo8o0tLk=
X-Received: by 2002:a05:600c:a106:b0:48a:58ae:9933 with SMTP id 5b1f17b1804b1-48a58ae9fbdmr130325715e9.18.1777021685898;
        Fri, 24 Apr 2026 02:08:05 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1c0354sm537222545e9.11.2026.04.24.02.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 02:08:05 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 24 Apr 2026 11:07:59 +0200
Subject: [PATCH 5/6] arm64: dts: qcom: sm8550: Add missing CX power domain
 to GCC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-5-4b6e09d532ce@linaro.org>
References: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
In-Reply-To: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=973;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=8UCqKS51w5RlR7Z5z2QLTaDqXfPwDG1/feXb0enazX8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp6zLvyBrEYR+ArzyGkPCEiEmwtaEWLvFZBUT1TvPm
 yJlJ1y+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaesy7wAKCRB33NvayMhJ0WO0D/
 0YqTqQstSGrGRomLVAS62j65Ksgxddo0d7wwfv+D69PT2/hFkSpbOY0CjA/UYijLV4+LJwG9uTNlQE
 +WDMnFND3Zwh/0FeGpfg97DVHD/R1ot9DZn4+ssfUganOBrBQXgkQzAvBFX++Yxi6rORtsf6FsGkr/
 ykMX288/kj51VkHDB0bxweKQl8aNmfId5HJXc2EhKHaTgtDV1YA8gzaq18zvwQ6zrwql4TZMaPxLam
 JrT0a5qG95CMMV3lZZhPQyt6CdoNzCZJvAt0ZeBGeiNbGSaxceYkijALXXEmzXNvRfLJ+qW/UtRPJD
 RRXGbLmUm9W8782bGcaehV2GUWmZWNNcJ4+JctuMnpxUQrnvvMFIaaofe5SgvA1d/6mUrX87h3PE4c
 uXlCqNNk0nMWpmchm0o6o6H+KUV0vIj977slU834IhNT+TSWnmy/Y+EUpy5k/SJTip2nvkD4qSIEyj
 AZO8/IyuG+J9nJrOcHTknbyi/zI33BiFp4BUY9MAeunIYWX76wLlYBH5TqqzpPCGDfws/coLj0afjV
 9tWpfl8COuk1e4MP0IBV5/Wmc+M7D0HmXbWrnuhA2+cwqyY65SBg6zLREWWXGCuk8UftO3SqRtBRzs
 hgwrpMz2cQSJYXHsmmu9IuS0fBaokIk2TvelJSlsQoNwMdzdlYk66a/1Puvw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Unless CX is declared as the power-domain of GCC, votes (power and
performance) on the GDSCs it provides will not propagate to the CX,
which might result in under-voltage conditions.

Add the missing power-domains property to associate GCC with RPMHPD_CX.

Fixes: ffc50b2d3828 ("arm64: dts: qcom: Add base SM8550 dtsi")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 912525e9bca6..bc97259b378a 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -826,6 +826,7 @@ soc: soc@0 {
 		gcc: clock-controller@100000 {
 			compatible = "qcom,sm8550-gcc";
 			reg = <0 0x00100000 0 0x1f4200>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.34.1

