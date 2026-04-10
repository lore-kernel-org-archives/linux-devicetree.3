Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCF6389101
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 07:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775806824; cv=none; b=s/pjp00rI0LTHsVa4xeuZ4z3lny/T0S9nsRDks3lBOaFtbdULzRnfNJtlFr+uJWtySkN4T+2LaiWSyzYMvzTPcd6NAPcMUtjT84EBfrPpiBXt9SefpFYrp1VwUYx1cW6N++g5haKeMSs7MlfTyKMUXJfOmXA9b7MI+lPn2ke2HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775806824; c=relaxed/simple;
	bh=y7kF1wWPK+6FLzptGcrgDYcOJoYLZeLuaC+ADv6HIu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e1ro562ocdLLQ1Pi8gg7pzln2og52y67GnCUtzO6eHUGvNp6HphkHpLmTdFWxCI3mVLPt5RW0Ba3XGkzs0mQyO6erNdnMbzBm+Jr7y1ebFsGuIknUh2YIuGm4gRCwbxNQ3SJ1/RiQP30kOoVmHLZXtcvLgbhgCuQ1VnxwWSeye4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=lTaVXfNi; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="lTaVXfNi"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6708c954b94so581293a12.1
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 00:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775806822; x=1776411622; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZRX6BcXCk5F+FCLA9LCH0VsqPR+RFElb0bC7cHHOd3Q=;
        b=lTaVXfNi43hwgps480WK0yRwWJJa9uKJW8qzbEyMQBm/ZGGyQfMEyvT7sAzCi0ZLPu
         wGyUy/REAvPwnlCCkd7qPIpuBXxerkbbKbxwBW+3GZTSPFfuND5cR0RbeFVSArNLzitu
         /14Dr0RebizlLtrwNVlsn1zjbJG6yyNtave+e6Jo4IzwBgewYDsEvTFclVcRsRiRVD4T
         +3zFByWV+J6sFKE8deMZ9mcUnvoF8aFuG9Jqs61sVNXACFzTdaC3QZjYeudK1p1M903I
         ma0zCE31MeRKzzx24S/FKcWrFlxiSX39IWE6A9vIwrtneO3aFJFF7TxNUgAI0jL9vaKH
         3+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775806822; x=1776411622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZRX6BcXCk5F+FCLA9LCH0VsqPR+RFElb0bC7cHHOd3Q=;
        b=s9IbTplN4Y8+0SaJBlYgf1YpPleX6yvUbktBM2N7zo+PKqH64iKieLo3pkSngcCN1S
         m5yIHa/txvBdjbE3i7VvPmOWoXQ+/6PhKoE/XHZB2yvSZ4yrZFC+0F3PpBuCCB9ahyLX
         M/HVVZLflJ3cDzPMvtVupEbQ9cP6niEGSx3V5ZAL3CIfjSj+dh1QxYR1e0zVeLvckhur
         urqFVyAY9odW4+NoroYUzNUVz7y2D+J1PBOGRkdfpkddNmlnBqIms+/sKjUpB8OxdDEZ
         KlRl8wG5l0jk4Htin9XuPexmOrM280kklurH3RHUWLC2t8emvJe8WeM5+z3FiuaS0efT
         nYiA==
X-Forwarded-Encrypted: i=1; AJvYcCV9s0rGfZiW5fGkI66Ka5S37TnBu/Aj+dKH2ZveuIcGY4jBTsrDrdZVIJxUmcuaERQLjLZ3hG3wQb7/@vger.kernel.org
X-Gm-Message-State: AOJu0YzT8/A6bEZ/yUFaTfnF1LeEmAHor1tGrjf1Y+PiBosVA+132eEp
	wLXfE35Ef+wlM8wc9y6TR+d7J5+TLWO3p3Gpk+QQ7yQ/ykp3VuQpl0p3B7HUZUWK+GM=
X-Gm-Gg: AeBDieuWqV1pFuMu49D7HsB4PD4ydZxPjXSfWtO/ArFiRUKK7qfIikfZtGGl2I5hs7m
	c5lW99N604iPuTfJt/c67q5N4Qu5cwGptRXSrAnZ43hTlMBusx/ANk1mJapVEev178NJuvRliLt
	7auxFouWFsVuupr0my4FCAtY/Zh9Q8bk/JJzGJj2Mwy9vUzr348UuwSsB+JhMeKSGosb8Ehbj5J
	Bpzi+b0qK85bwTx1yxjaDxH7Cc5VuLbVWbzaGSFtn0rBFvn7h3BnddAEBK7s9TlbmAkc0gojjaB
	cZ1Jl3s/OTdc+Zfu2JuevPObH9T5IBB+zEUtasOr4cbWKhc8v/9cgNITG/3vaM7UTkl2SOvr/YN
	XZVaeWBHxzXXz+geZ059OLcsjj9THJOHSsp6ZAmKYdm1/a2Dg2yxj4/VgnzCYG9jGbYVdQb+RNL
	Xm+ep1BwnLBKlxXZ4eW9q7E+FP3Is1lmzjo63tCHvFY+BVIk+LmJiZSczZowZ3GOHHwrJAlSUxo
	6NPyCTDSdhH+hAl
X-Received: by 2002:a05:6402:2486:b0:66f:9480:c1e6 with SMTP id 4fb4d7f45d1cf-6707b1066d4mr850626a12.26.1775806821580;
        Fri, 10 Apr 2026 00:40:21 -0700 (PDT)
Received: from [172.16.240.100] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67070815a1dsm400310a12.22.2026.04.10.00.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 00:40:21 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 10 Apr 2026 09:40:07 +0200
Subject: [PATCH net-next v2 1/2] dt-bindings: net: qcom,ipa: add Milos
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-ipa-v5-2-v2-1-778422a05060@fairphone.com>
References: <20260410-ipa-v5-2-v2-0-778422a05060@fairphone.com>
In-Reply-To: <20260410-ipa-v5-2-v2-0-778422a05060@fairphone.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775806819; l=769;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=y7kF1wWPK+6FLzptGcrgDYcOJoYLZeLuaC+ADv6HIu4=;
 b=aZP3u9u4aF/aWtgstnRFKd1QY1+rp53fkEgNZq0mSVHNE8yfSTsbH43s+yGXWMRCEHxhU8h6g
 iVCA+OBQwlRDn2JtYK5XKW3+D1YJw+fF7dxECHyHVhmNzIeL192zbYY
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add support for the Milos SoC, which uses IPA v5.2.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/net/qcom,ipa.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
index e4bb627e1757..fdeaa81b9645 100644
--- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
@@ -44,6 +44,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,milos-ipa
           - qcom,msm8998-ipa
           - qcom,sc7180-ipa
           - qcom,sc7280-ipa

-- 
2.53.0

