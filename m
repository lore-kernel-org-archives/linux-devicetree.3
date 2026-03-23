Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF18383C67
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774257503; cv=none; b=lZnUwP/ertiFAcDu+/jv5AY+lOOZP0i6rm+3Ia9SVperSzAAPnzx2cYCTELR0fOXNkoQL2wAudPIajzMteGf9+P32eLgcaLSoZSgk70fQF2HRPqCgvmNV0Wqpp0j0dZY08Q4O7Rt3aMkYCMqqrcNknePsbXsC0vLkbNykeLJZVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774257503; c=relaxed/simple;
	bh=ZkSKYFbNGjak0Dho+sw2XFyENeFl4F9edtmWT5qEn8I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QCgUP5cW22cUTOjUBCp7w9Cu2nDURN7M1nWweODKGVBC5CI+biI20CJFZdkFxwt+epbnIbGKLEILg2SpTg5OJrOM+av2LHCWvZLGwCO36Nu6eLvb69D9zMUbePZkQ8w8Bel+yrM8CH6JAVhPq7gcO1Tot6+j6XXuPx28T3JRT7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AEj0+6TD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WJi+Zuc5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AEj0+6TD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WJi+Zuc5"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7LP2e394547
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:18:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fBQnVcwBQGVsncjSxa74jLLcr1ZR+vADPj+TOnhgQ0E=; b=AEj0+6TDepAkektK
	gl929XK97X92Xj93AxV5AMxxWbZom6YkZdXiZWCBqykDIHXFpzxKVwJD0dHRCeFr
	XNHFOmWIF1RBeKruoQtt6fxkP9nGgZ5ETa4KCFPbdqhTzNtkNqI26Su9h7clpcDR
	Uas5LH7W3j/cHt5pxqF+8V1xYVoFBWuE+N5vQDovgI0GfQLTZ/44j2QkcjJa9+z4
	3evruiak/jJDHJWatURiQQzcgQxmjF0GyXhHYo7N3SPO4ZnmsBcr260Z+PdnyuJ5
	KPs1AAaBsBCkiQjAFMS8v/54J29lLzaFKNLvGebDOnIpNZhUjNbE5vL8WkSz8ykQ
	pJcyVA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1h1e4t4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:18:21 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35b9333cbfbso2652066a91.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 02:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774257501; x=1774862301; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fBQnVcwBQGVsncjSxa74jLLcr1ZR+vADPj+TOnhgQ0E=;
        b=WJi+Zuc5J71l0KxZASwWcNcgY80c/7tsmd8SQHLeqAS0z5lO9nD0lwH+2LRfKgINSn
         LBa88ojq8IyGnGDrhCptUMBtg28vLxmkNUOWcdYhdTb9GxwhBbHk++7KVdAQu1ld+D8t
         Y67CH2iKGQ4YTzi5plLDz/lorhiX9xGThXirlm5xqYZfcBRnTdV4s/EJjeE5zCzVrp0F
         BsNeO637rTYjkU5vIsC6UfTWp/NzxUboLLLb2jVHkBYk7EG6vrsiDxRdz55CsR8QyD93
         wKcMATRHJd7G87m4KVtKH2G+F4GMXN6w+HqS8xN5sVG2QKDolfad+r30aZs6FJQgr6Bj
         RiWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774257501; x=1774862301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fBQnVcwBQGVsncjSxa74jLLcr1ZR+vADPj+TOnhgQ0E=;
        b=QH7sKjB9zVf0k1KAHqu4UlgAMhT1aeKC7ajodvPXrWUjj0kNLNJjFqw5yP/HOZK+NM
         3llrFWatKJm1YfYJg+WfmsElP28V37Hy2HgmqTUTYM6BBHlEfi6oRJDSfJaAubGXgk6h
         klbX/DP2ZXh5IUgbZaVBjCYT8SnbM1NMjHinU8OGIDiVTPUjfmsydLi7wqKugThW6ozn
         emFycZ3Q5NV/XOw/ea+J7F0zTsK4uDJJm+Gi5jRq1xFOEHXE5nHsiftSAONMkKaeGvvX
         lKl4O83sl4aeWVrf6p3YoiMgW6Dl9DUIKBhxR1GotdfQsGq6D9CVfsiorW4RivkFk63V
         N80A==
X-Forwarded-Encrypted: i=1; AJvYcCWNhlItrDt5S+zZ9vN6kwjw9v8/tNjKBJcb70HdFHrolCu3fccfoEnchYMkv+jIRKK4uOVjLLDfmoPc@vger.kernel.org
X-Gm-Message-State: AOJu0Yya4U7YKlVkv2JF0M17b5z1tH8C5ZjYzTN3CKnLkjtC6ewvXUzB
	vt4CI2yyu849dag2A9jwt88/6JDWiI6CiYjRsoAtjA2gwRs/4Y7lg0dUhlLtj5ZVc4TfWl1i85u
	jwm7oElyD9htZJRLZAfh+sSkLeWOkuZ0odxWzQbS4aY6WIml+UPgsaAUwSJUc4flW
X-Gm-Gg: ATEYQzzKIfIXoviFq134g0ueRHcl2lXAwjlNIKheVBtgMKaOxDXTmh1pptAXO0b5yaW
	F9WbmY4rFkRDQIn4O9a9p8mCQyUZ7whUJejVHG7yt3akXYkWZxdk20povyYURoyBrvfcEPB2Ul7
	viVSK7q7huZ/WhmurRdGEakfQoZRXYk4lTtECShg7TWrvgoOURxx8mwvQzSjAIOPngR8GSwSOfT
	yIa2jNNsckovMJWXA/1nNSHYQpo/Rfqv19s2f57vrq54tFhEPgq3A7D2YEuZZvPfHdfVe2vJIiX
	9VtkUrsyIhEAtp5dOMgCZl7yUY8KcLqF6k+9WvHPZ/ba8H0CVzwcer2gLqk5iN0G2CjJxw6Kw39
	rvwToYKqrAjNN8Eob3yAY7NsJGI9V0csuLwbwFW33+Ug4Akk=
X-Received: by 2002:a17:90b:4b04:b0:354:a284:3fff with SMTP id 98e67ed59e1d1-35bd2d187e4mr9885938a91.25.1774257500854;
        Mon, 23 Mar 2026 02:18:20 -0700 (PDT)
X-Received: by 2002:a17:90b:4b04:b0:354:a284:3fff with SMTP id 98e67ed59e1d1-35bd2d187e4mr9885892a91.25.1774257500337;
        Mon, 23 Mar 2026 02:18:20 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd358b5ecsm3923448a91.5.2026.03.23.02.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:18:19 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:47:54 +0530
Subject: [PATCH v4 01/11] dt-bindings: crypto: qcom,ice: Fix missing
 power-domain and iface clk
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-qcom_ice_power_and_clk_vote-v4-1-e36044bbdfe9@oss.qualcomm.com>
References: <20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com>
In-Reply-To: <20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774257482; l=2604;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=ZkSKYFbNGjak0Dho+sw2XFyENeFl4F9edtmWT5qEn8I=;
 b=3ogJNiFMZD+SsmLzmxVbrbnwcmwDDcXVV2MpBtJuZ7PqL4ZR4j9qyX8pHgxnnjUpQcLljmBG9
 kiHfJkPAbWTAAnYi0vsijUZYjfStyZ97yHZSTuEpLah8Egi4FW0Emrp
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-ORIG-GUID: Bhkz_4YC2lehe389XCeUmz8P-Z2B8AEb
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=69c1055d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=nlf9mDh_Z9TmLa7YYksA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3MSBTYWx0ZWRfX10SJQF0YMS5P
 N3YD5NrT/SzmcoPdkmes6cB0P1zei2m5F6IOP9ucV7RvB+9koInlH1aOqmbglMz2AgpGlkIz+UT
 oSokZ5NJcX3N1N6SjXqkjG5n7LzB99SiAyebGYr6zlRM5Qxi4xeH90FftU+7rXjV50ruzWJB/aW
 WLGLUCNAseLYR/vBTHsIjjToqIleAGNbTD+jlGXrU4t04A+kzE6EJC8zCa7Kn6bnCBqL/DArjCu
 //AhYEurgwsrUtgnOpmty6B7FkZ4Noeo+z1GMeiRD6fQHoVHazJLxMFoIPkorerM2sLLOBaI1LO
 iXqe9py/6/c14wYKlKtNBoQtsGwglajfy2hnLA8LZQvrIasdAPOljxbUuF1nH9CgEaE1QfM2v7C
 aM7hIHj3NSn4TICtUFGZUTL7KN2QbuQfU9l8Cikx04GXqoQijp/ZJlzbGfYuIIriyjga6BjBzLq
 QSzb2c09i6LGlJkPmQQ==
X-Proofpoint-GUID: Bhkz_4YC2lehe389XCeUmz8P-Z2B8AEb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230071

The DT bindings for inline-crypto engine do not specify the UFS_PHY_GDSC
power-domain and iface clock. Without enabling the iface clock and the
associated power-domain the ICE hardware cannot function correctly and
leads to unclocked hardware accesses being observed during probe.

Fix the DT bindings for inline-crypto engine to require the UFS_PHY_GDSC
power-domain and iface clock for new devices (Eliza and Milos) introduced
in the current release (7.0) with yet-to-stabilize ABI, while preserving
backward compatibility for older devices.

Fixes: 618195a7ac3df ("dt-bindings: crypto: qcom,inline-crypto-engine: Document the Eliza ICE")
Fixes: 85faec1e85555 ("dt-bindings: crypto: qcom,inline-crypto-engine: document the Milos ICE")
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 .../bindings/crypto/qcom,inline-crypto-engine.yaml | 35 +++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 876bf90ed96e..ccb6b8dd8e11 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -30,6 +30,16 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: core
+      - const: iface
+
+  power-domains:
     maxItems: 1
 
   operating-points-v2: true
@@ -44,6 +54,25 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,eliza-inline-crypto-engine
+              - qcom,milos-inline-crypto-engine
+
+    then:
+      required:
+        - power-domains
+        - clock-names
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,sm8550-gcc.h>
@@ -52,7 +81,11 @@ examples:
       compatible = "qcom,sm8550-inline-crypto-engine",
                    "qcom,inline-crypto-engine";
       reg = <0x01d88000 0x8000>;
-      clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+      clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+               <&gcc GCC_UFS_PHY_AHB_CLK>;
+      clock-names = "core",
+                    "iface";
+      power-domains = <&gcc UFS_PHY_GDSC>;
 
       operating-points-v2 = <&ice_opp_table>;
 

-- 
2.34.1

