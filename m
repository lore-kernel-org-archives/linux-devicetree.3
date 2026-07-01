Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49863B776F
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 20:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782937057; cv=none; b=J96cIGnYxoP/ftz2gkIbX4buyR1joV9yIVAuWX0uwEEqhYtl4T4s+uE+1+fR4aDBTxkKQYnM1GtOYbxIvFDxYcfhBb1p9lZo9ZCMZMKV6fZIrMNJzGbQXmxQevr7JOSLF676s0aaDwSZ4qspyxu2O5WCzxBf+Uo1SDOOoP1xxsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782937057; c=relaxed/simple;
	bh=O7e+z5O3u9p4uqA/rqmuYxUbGbJniNI35Wn8W2asCMo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QhiBGLfn4aI5ZQEomlsWRjLGaJsLIqHtoqY1nx4xfW6hBV5ii9hSJ8DL6pdm8JvduX6GZLLRZOPjCLt0vSFFMxVIjRD09lbkR4SWGMd9+ydD6erYVMo0idz+qJtP/U1M/ICeaPYX0p7HuJ4wlCjtIZQqsYl9VxS6V0O3gpapUi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y+pe1A9N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iHSKREVV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y+pe1A9N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iHSKREVV"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661GmWlg1710539
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 20:17:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R7pDwUG0o43LTe/Dy+wxU5CdZ2Kvmmv68kgvFJA86g4=; b=Y+pe1A9NvQlS45WS
	Fg4S4EPaUbCjPetEh7nNIPOLgGfSOlqbvIGLOdlObLNeOTxIsrVFvlujRI3nDs/s
	N5V/csiqle80RLbhMeWt6NXEktGvL4n9GwG0Wn17t0RS6qLtWUGppyvSEykBaMPk
	lBRAebl6JdbbJ1OYmR6EDqZe1funFp+bcvltM3XQsJCfKOgeJPERo6FZpjVyokRu
	2D05yT7LZRn7mpaZMBw3FA1ONw3Cz5aWMWyRRTpxC5gnt4zUd0l2RueaNyKE+tZ6
	hDpwKv3Wu6czk1If9EVt0N2CDdINRB50ALc4njdxguN64JmnPpS2P1iTnsU/eQaT
	XPCGWg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f56gprw58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 20:17:35 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-380cf335604so491612a91.1
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 13:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782937054; x=1783541854; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R7pDwUG0o43LTe/Dy+wxU5CdZ2Kvmmv68kgvFJA86g4=;
        b=iHSKREVVVM+Xzzl6EzIPDkAdfq3iG7UJdFrelG6xSJn6TjHOrzXT5XxJjHgJmuDeYL
         Uxl98S2HiDnoHF17V4YaS+hx1YZkl8xHbGlM16OQQeo6IGGILSm0HqLZKg8LfAov/RJs
         b+XEgzBdMD2C12pDEpQ4aYid3O6AqKXKoYRaVzvl1JEsZF9piaQXJvOe5Dr5KjPqw0jn
         vdKluUFcBZAzFhgLODrDm1SSClJ/sSkrSWOAqxbY9rPq4vQ3CSzYJZz5ygLXqX90LosD
         JAs/hEUW5GGm8qSmRxDyIALlXvH/fgHP6CgwpKA7l7fe0XkRSEbczY8okxFSO0KK3rQP
         xe5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782937054; x=1783541854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R7pDwUG0o43LTe/Dy+wxU5CdZ2Kvmmv68kgvFJA86g4=;
        b=T9vSDSPPzNdcXVOKYetJR2RFvObGgaTHuSkMa1f7mKZ6gomzz3zz0Fg7V6Lek1zqo7
         ZcSk+b9d2Yr8d2kSukLAW1ar9Wz0hDZnkYcfM4yhRmiYG6m3dXXb1Uv1x2WeoEnaQJHe
         BuqBC3eyhXR9moXtqji7reCSr3X4ITVJbKtgxUf0ffnXNQ3eFIdpML9vc7nPhPP+K4ed
         UwdeG59U5jcvF4zRTi4+2/IdaGNGPDi88Z0OB0/x3KoZWwym76VPRk8Kil77dgEDalRh
         ckRqaXzNngncGbBd/LD1Bf176EQmmnps0Vey9nI+EtZe4xw3/EERJlPZmnqd1d88wNsd
         F/Nw==
X-Forwarded-Encrypted: i=1; AHgh+RqI72esuFCH++IwfC9ClbL7D7EutfKrTqUgYDOD3iplrEUDBSZeU5TPOfD5Rf+2aUHwJ3CE9s4uPKJ/@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs60TWOy8quooqVurik+hZjf3RS/A52Bnt8i3ndJrxln/kKa6V
	pgB+01LA2aZo2gKesLezYKmQBICwROfKsBSoCw+XSTsgwBdOrL/zc8G0uOaMo8Xvu9/gflEu31p
	XonwUjP8jvcOUFZiCCVPeRQaWZUGnKbra4b9R0GCo/tviXZl9Zu9YILws89dkb309
X-Gm-Gg: AfdE7clsBO3qXWG4e4HfyM3uzNFXlhNjQxOvwhzyL5xf+K2jNg33vmdr93lkJVfLMas
	nryaAtHQtLubMzfSdqZyerSuKWvS9Wk8pqQbJON5+m0/WnpG+3sOGrl0tSid/jTZJ7ee6LKSTAE
	OYWEXl+ngDkTmzNohNnSROf+0Pvw8apZCgTyphfYioq773UJD2ge7KkBJgZMckSCZ9ervfWuqr2
	0Rb+6y3yhYpwAqs5ZgwzQMHXMA8T47laGEVe4Pa2pVGBUfaRiIMFEY3vKNscUSSvQplVzsevd1U
	gpB4ioD+WrTflJQeAgQBT4AIK2TPU2ULhP/DUFu6sXW/iyUStV1UxLNrS5l9fLYE0m7PEKi7AJ0
	Px0urEG6+TQdJgSYIh5SOR/aNt9VdgnWGnh8MyP5ZyPOV
X-Received: by 2002:a17:90b:57e8:b0:37f:caeb:69df with SMTP id 98e67ed59e1d1-380ba94f8a0mr2661482a91.22.1782937054424;
        Wed, 01 Jul 2026 13:17:34 -0700 (PDT)
X-Received: by 2002:a17:90b:57e8:b0:37f:caeb:69df with SMTP id 98e67ed59e1d1-380ba94f8a0mr2661432a91.22.1782937053810;
        Wed, 01 Jul 2026 13:17:33 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bc79231sm948685eec.31.2026.07.01.13.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 13:17:33 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 01:47:11 +0530
Subject: [PATCH v2 1/6] dt-bindings: crypto: qcom,inline-crypto-engine: Fix
 legacy/new SoC strictness split
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-b4-shikra_crypto_changse-v2-1-66173f2f28b3@qti.qualcomm.com>
References: <20260702-b4-shikra_crypto_changse-v2-0-66173f2f28b3@qti.qualcomm.com>
In-Reply-To: <20260702-b4-shikra_crypto_changse-v2-0-66173f2f28b3@qti.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDIxNiBTYWx0ZWRfX+lb36fgV/ZZj
 t1MiejyOciAzV0p4FNhX1JEe9A0f35GKygrUqeeIylGouZ5gi9yErQDdP5v5t92VCWR2/EzMD6a
 64NY0SbJxsatJXPLTswhqcUGAvp66SM=
X-Proofpoint-GUID: r86tCNGrhIkgxE9xhaisOYCbeLnyBcsN
X-Proofpoint-ORIG-GUID: r86tCNGrhIkgxE9xhaisOYCbeLnyBcsN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDIxNiBTYWx0ZWRfX+jay4GW7oh+n
 y1f4/oS5KAVPLX3CJIc3e/1WS7v/BewzVYyYlmqTjyX5N3XL3zmL2PtvPBGF0XWvCCvTFWjJoeV
 thNUrEois9WYP+vRsgrCFvHe3FyxLwAMK0H+7HbwwZfVl6tPy/m2WhMznbY9vcTHxRPvhLrsLJD
 SnWsTpNmlffLuI9EfwQDSxsbgwBBfMMx/EGL8uwL/yi+te4nYJ1PAMSTvKddwILb5uJnu7vPnOa
 9eVOMbLVZ5AiCgpXaQ+FgQvpWYuPxnw6ZjssP5kCYjRcFc1KPyIKgt0GomZHfbXy/mD1Ng6w7aV
 jBvhyD3C8eBaCVjhY3raeBpI7by+vKa4s831BuVNiVExc5JZ9uhLMSU1GrI6aztjccvFKl2y7bz
 7TKzMGpw5XQ34V4akOblUl92fPNhLLgUqxnmDJCvvTU1vPLPhVFec75EfMKhdjntB7hhWJAssUV
 B5td0bjLk5oGqaLx+Lw==
X-Authority-Analysis: v=2.4 cv=K9oS2SWI c=1 sm=1 tr=0 ts=6a4575df cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=F4we2z5FY3kt4yoF36sA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010216

Couple of already merged SoCs describe ICE as single clock historically
which are recently updated with mandatory 2 clocks.

Keep only the known legacy compatibles flexible, and make strict
validation default(of power-domains and 2 clocks) for all other Soc
compatibles.

This ensures old DTs are valid while ensuring any new SoC (not in the
legacy allowlist) must follow latest requirements by default.

Fixes: e27264daac7d ("dt-bindings: crypto: qcom,ice: Fix missing power-domain and iface clk")
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 .../bindings/crypto/qcom,inline-crypto-engine.yaml | 23 ++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index db895c50e2d2..4f3689a24410 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -55,14 +55,25 @@ required:
 
 additionalProperties: false
 
+# Do not extend the list.
+# Legacy SoCs are allowed for single clock.
+# New SoCs must provide both clocks and power domains.
 allOf:
   - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,eliza-inline-crypto-engine
-              - qcom,milos-inline-crypto-engine
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - qcom,kaanapali-inline-crypto-engine
+                - qcom,qcs8300-inline-crypto-engine
+                - qcom,sa8775p-inline-crypto-engine
+                - qcom,sc7180-inline-crypto-engine
+                - qcom,sc7280-inline-crypto-engine
+                - qcom,sm8450-inline-crypto-engine
+                - qcom,sm8550-inline-crypto-engine
+                - qcom,sm8650-inline-crypto-engine
+                - qcom,sm8750-inline-crypto-engine
 
     then:
       required:

-- 
2.34.1

