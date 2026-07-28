Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF1A3FB067
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785231355; cv=none; b=D129ZlwtoC4ZgCVj2YrMk6cHY1xozeXaEJF/d30RlYPAmIbMaq7YwCUU01ileq+vGIfA2CV6ZOehxAMJSWsSj0/4KWJscgKt1vcob3+peNMw9CaMev+qs2MUgX+moz66bUDuZULrtuOKf1RHb7FV0oE9KbF3cYNBfG4MgEa+ry4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785231355; c=relaxed/simple;
	bh=5wHZsmRZJkX36FzDROcwG3gCmz+4LTBOmCoFC9DNaFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IW4WS6OYLj5RJtfd+sRMcQIxVaz4HBD1y8YK6JCoC6k+MZB51Y/hcp8Jkg62sMnstF+tM/5/tg/vybZKuCK/WshWNnE8z2V58S1QYgnGCtuEz0UbPDIs7yhueO/q98BhfM4kRB1ROwKQ9IaSocj52S0XzR+kercoUCdmddt4pro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n8PkHBGT; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n8PkHBGT"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-471eeac43bfso3167471f8f.3
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 02:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785231349; x=1785836149; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NJSm/JnxrKE81FhHQMmn4pN/cUcvRnDeftlQtOhibp4=;
        b=n8PkHBGTcybZOz9v1m62kvkR1jzg6M7BU7Zf63FjwcJPH7G76Ya/bBGmN13mSr5I6G
         p189/GhplhMQcmGHdx7k48LLOgTfz5s55xAbpLELPkPcdjo4CyUGmpIEr8XRIC9PvsGB
         JDJw8OOmShcsGrLcccSCjfY0gBE8fk4/Yrx0H520pGlexyWWkDSGs9EIb5DF6qXktQr5
         XIaVsqx7D6QPNmb1eQwOaCCbGpUOlcd7AhUM6xuJNQ1HnHRu03Ucre1KH9cqqg+2/wc6
         gcx48K+dq8gdyYpzBYw0O5FwDfm9nEUxwDmcG3cS6QD0MRmajPGAiBxlF/NLg4I/xVHz
         gnkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785231349; x=1785836149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NJSm/JnxrKE81FhHQMmn4pN/cUcvRnDeftlQtOhibp4=;
        b=ggy7RuAucGkj8eMT2PajcRGeMcaIegbeN4yk2aJsl8/HbjR+QgEv2/OprCjIqEUlZQ
         p+wI79TXcNadlRpiSvNaiwzQiQ8mlaBKyKj5xXoYJTOpOSwv74/Yhd7w52pCrfx7Gumn
         fFJucPH1vVp9o9rCrjc9b/MKezujyTPLt/1V8MvV3HeQ08PCrMUgIny02LG5iU8Js7da
         uYUvW3zrM81YK0R7TnbLU9cZCxFNTOtZA+0sIig0oqn0wI0rfW/QgYwzoN4N+PY3pGel
         fB7qN02DF7HpF7dbn3HMMsE1obaHYaJNxrwReek4fLIXdfWL0vMN44XTcVY6wY1RqKDY
         EFmg==
X-Forwarded-Encrypted: i=1; AHgh+RobyGmr/Fj/aS4GGS9vc2GErGJl4srKcta0JnREM5LVSpQaGWlIapedUD2Y+JrzS7dI+oSFSQqVujtN@vger.kernel.org
X-Gm-Message-State: AOJu0YxBwklReaStqE17kdwIDYCkvflBlr2nIBcTByCzOz3dJvvclHcF
	Y0i2tLHpsGDfVRfYBIUtC26uHhX0YlFGCUQNLW/Hoay0LXCYwElg65W0M6kxfsjR3R4=
X-Gm-Gg: AR+sD10iA90gAYeGTZOa4ai9d12U9p+LaoTEEQObjOIOQU3byMQWepCtIZoOwboRYKI
	9KxehssGfWUWgPHaLdZEHJolgoXtFSHXjygwn3xZOfZW1OUohndKe81Kg0ZVrWYQnQg45ammIHA
	o+lLaYyJ4bYLawZRSNptLPcxaFFBFGHY3Gq8ZISj1gzr/9X5sj8YD9TS88WWj4zh87Rgv1BuFt1
	iR10Oyq1KMUPt3rntc13iSLii0KbHhN5/WXzi/9qC90Z9DxxuybJtlpTDc358nGKn6R0pFGmazn
	pLhiCWYSnnG369uj9rp3ylJB05pHyU3otE/bjciffIYsoOUcuez66Wv/FY/kX/oOcWWNm2cDoYx
	NNcj9yKeaJBbrVx54OXYISuajnIgLkz2evwbu2N0miOEfpXp5b+r/07Ne/Gxv+DES2FqEdkj5wV
	9HEWJQGR3SBLWgugclLKu3ZSM=
X-Received: by 2002:a05:600c:3103:b0:493:f278:ba2f with SMTP id 5b1f17b1804b1-496c643219amr16527625e9.9.1785231349157;
        Tue, 28 Jul 2026 02:35:49 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.204.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c4632263sm68190825e9.15.2026.07.28.02.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:35:48 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Tue, 28 Jul 2026 10:35:35 +0100
Subject: [PATCH v13 4/5] dt-bindings: media: qcom,x1e80100-camss: Describe
 iommu entries
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-4-ae811e2f0799@linaro.org>
References: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
In-Reply-To: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2593;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=5wHZsmRZJkX36FzDROcwG3gCmz+4LTBOmCoFC9DNaFs=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqaHftKWpv80r/kd2OEz0SwpuOlD6R3IYkWLa1/
 UqMkdNx1TuJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCamh37QAKCRAicTuzoY3I
 Ou+qD/9XJ9Kr2dtNDMp3LaXCqRgLwCUXh9WHlrVvWg0IEUWaEpC+qyd6w4rm2xFbsJXMZ0Cv7LX
 uBtcCNSqIDgb98WTUHsRlOCIKcV+N7Zc0DDczm9A0RR1ui19cgMcKZaY0dl6Tk2E3NpgZaOTXoq
 MVcpByF+yJBRETBwq7kDhVMEqOIPiszmPlrWCgT+aoLZ3980RwZVrIy4d3wu3UlzoFGtYRyjFTu
 0irxHZfSOipWleivf/17UYZ/rkdb+ekKGdaQK0XAcuTlcirOXtmhrGOSw4EsRKFZtC6J4tTJh8w
 dSh0whpXzhKJLmPtKSpq/iCL0hE5/WX912Jaap7RUjVR3AANyTVyC+Ud+MMQNxBNRLzDJq1evau
 1gpGTKQifnZs8NYzWyAjUJTF6UIT427qD2F410/GfVYAFZE4dGhiR9uOQTqHO5a6PuSpdma0H8b
 fYW1wZY/ebjcEKGRxWa6w5FH20Ftd5WTjrf8sUc0ge1LCa28Cm/4wAKA7dJ5k/qheaEtp0/ttOd
 fOlP4yBr+2PQ1IERSdxYS+Bq9K7twWG2rJ8KX3bWx6aSJLqfgDvx0BzkUZjXIqc8DiO5Ds4uEO0
 Oifi1v9Xk2RNYux1Q0KT25uOybo2KDQExNIn6XaMDN9xM0cMfGuHQN8eaeCI0OlX1vPUPvezEt+
 5ShgyElMc0/0bHA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

The original iommus list included entries for ICP and BPS/IPE S1
contexts. Only the five S1 HLOS stream IDs are required by the CAMSS
ISP hardware: IFE/IFE_LITE read and write, SFE read and write, and
CDM IFE. The remaining entries serve other hardware blocks which will
be described in their own nodes as support is added.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/qcom,x1e80100-camss.yaml        | 26 ++++++++++++++++------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 2d1662ef522b7..126400772d028 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -104,7 +104,22 @@ properties:
       - const: sf_icp_mnoc
 
   iommus:
-    maxItems: 8
+    oneOf:
+      - items:
+          - description: S1 HLOS IFE and IFE_LITE non-protected read
+          - description: S1 HLOS IFE and IFE_LITE non-protected write
+          - description: S1 HLOS SFE non-protected read
+          - description: S1 HLOS SFE non-protected write
+          - description: S1 HLOS CDM IFE non-protected
+          - description: Legacy slot 0 - do not use
+          - description: Legacy slot 1 - do not use
+          - description: Legacy slot 2 - do not use
+      - items:
+          - description: S1 HLOS IFE and IFE_LITE non-protected read
+          - description: S1 HLOS IFE and IFE_LITE non-protected write
+          - description: S1 HLOS SFE non-protected read
+          - description: S1 HLOS SFE non-protected write
+          - description: S1 HLOS CDM IFE non-protected
 
   power-domains:
     items:
@@ -332,13 +347,10 @@ examples:
                                  "sf_icp_mnoc";
 
             iommus = <&apps_smmu 0x800 0x60>,
+                     <&apps_smmu 0x820 0x60>,
+                     <&apps_smmu 0x840 0x60>,
                      <&apps_smmu 0x860 0x60>,
-                     <&apps_smmu 0x1800 0x60>,
-                     <&apps_smmu 0x1860 0x60>,
-                     <&apps_smmu 0x18e0 0x00>,
-                     <&apps_smmu 0x1980 0x20>,
-                     <&apps_smmu 0x1900 0x00>,
-                     <&apps_smmu 0x19a0 0x20>;
+                     <&apps_smmu 0x18a0 0x0>;
 
             power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
                             <&camcc CAM_CC_IFE_1_GDSC>,

-- 
2.54.0

