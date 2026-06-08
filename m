Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E0133A702
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 04:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780892225; cv=none; b=f49/LmCVDzQJkzvQn04WlHyvwB3L6Ln3mqm385vm2m4HYtobGLwQDHCz9Jz7fa7tdIOO/G0DV8NKofOynVWODuDBJwHqizhgMP/Kg3XXvwl/C73iY0rWL9NKi8VJwTEF4lTZJmosvlpF8Zw6n1KnDa8WE+UFFIouQW1ZFg/Eg2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780892225; c=relaxed/simple;
	bh=dnB4haTnxLNv/W9YyNEoPXMc1c+7V7T83HixH4SP3ZY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gjQAPfsF2L2j1PaJHNJvx/95/OD4A0o73ZanBfDWfgCTHsEILsIWPglQSzt06sV19fve8+NZ71Ew7YjH3wYLE2E6tPjUnDaHwrB6B0gearrZQmSJcvVsu6TKVnv1XjSRjWIJt1gbjc5nQGUrH+9q+bzEWxDcCb4rKJyom0v8rdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ynz+Fh8G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hk9LE3bm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ynz+Fh8G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hk9LE3bm"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580GY0i1991549
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 04:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sJz5BwmvSXG
	q2tTusHm0s+Mx0VgX96nElV4Q0+9M+Ow=; b=Ynz+Fh8GrEKmUR/MzLsQdPBQIRl
	L1CGfruL09gjaDyCNXEjUywVo66Nd7tZ3fXx7LrHyh45HwulzJhWZrmAQ94AiQEt
	g+QnOzDlXpz4+IvijBti9m8OqrvcFacXrIJ/l0L+zYbnFvp0zjLZu9mHroMsfU5I
	UvE+zvFGKI9nNAWgXA2X43LjbczXCPFDciJqn99XC1Jx3tzoKGJ5BoN74btdtMvH
	+sxxlYIrrWZrX2LktgekfGIMSHVxK3S3vxAjimJF4D2fYm6RJcuvPxVzt3RlNOKj
	LXP/wgF1hc2xoUdvSQsfFB7/T48qN9tV7h7Rt4RUJUUU8lpH+ZkPXZEXyEg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em9k3p58c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 04:17:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0532a6588so36916545ad.0
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 21:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780892221; x=1781497021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJz5BwmvSXGq2tTusHm0s+Mx0VgX96nElV4Q0+9M+Ow=;
        b=hk9LE3bma62OEDt71asn4VkiG1vjHBXAHHXZhcwB0kQ6CBmXsj5zHcZw3S8bCn+PVM
         kqpSM0SrWtG8TRjQcycCPHESOn+lSprxMbxTRhT7dBRFxo4xk6K5sBeVyWtx9iRbxVt8
         8AXROOQiMXrqtw2VpumOPv4Zegua26sUez7pLhoFaft4e0dMTA54o25fIUZLfaSkfFZH
         fANFgCdaFK6k2oFuAeAIx9sm3uBm9SZ31/plsoqycWvJiwo/COtgtduz0TZvGu1WsahU
         wdkIDINdFj0DsWmWFe/JoNZViYdhdtUOoido0D/t+Rn6ltGxtm52mC+1zCwq/7yHFr0w
         ZM1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780892221; x=1781497021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sJz5BwmvSXGq2tTusHm0s+Mx0VgX96nElV4Q0+9M+Ow=;
        b=gS7FGwH3WYGQlhse2a1xHCLaVmXTs3tZzhRt94ioAp1o9PpRoROqhQOGLPgqzZVp8/
         6XVwphamEBKY82rTR6ECPi4xT8OXpfgz0F8lIxc+cgy5aURif9RmIEbA9m5Zhz05Sy6e
         4M+htCkAb/HRbovp2tFM+16HXkneaOQOO1FZf8X55dcGtc2/Hsd1Y4XUoBy5tKrK359d
         iMuu157OjPI5+328P45ri1WoRxZHLihYVpuny9zfVmSDO+WaaG4zMnAVnK6TSjn56Jsa
         njrbdZfbix0SUvWg3j5PUNuP9wZzujjRrTHzP0Gbwmwu3Ggss8M0WEQ9B3DqrxPPWPeB
         886A==
X-Forwarded-Encrypted: i=1; AFNElJ9H0J3DtOhUyBG+liJjjHzVF0tAjs15BZYyTrGPEYWSfhnzBq8lwFkG6gPzEHYIzTaPABN+Elm6MNJs@vger.kernel.org
X-Gm-Message-State: AOJu0YxP56S+PmvfOqS34Di2jFxVy4oIVZAgQpitXyUy/IieHY56VbJ4
	1BTNlopNMqZSnwmr1rvxt44y81EwxGRYr/wJrS7lRM0bGxbfmQzwLwI+3+aInK1gMBdjsJYw7sk
	GIjyBj9iAfqJDeY1/Qexn/58clrm8hs3Y2pKRwu9Z1kapFDkCgkBTaql6BwXOQ1Ml
X-Gm-Gg: Acq92OHF0d5M0577XJPZ/pwkByQpd/sSDFvT465wDI4JfpkUvl9PV+nVI7QrWNFdPQM
	qhIAI+AQMn4IOzstv8KsZ3M69sHdelJ7r4qwC4+RpXqX7SUC19WHJONrqOzVaWmYwMb0lDkRGB9
	W2xVVG86Nxc8elqyGn5joK5LTlbZgMGrwqaL9w251O1lU0kpEt/E73YPVsWxWeKnVTinMF4es/r
	DhhCStl4O4Mbx8TjtdgIuHVPmt+Vui1vOUspMXpL41Y+pMzn60WgG6VS3RE72H5iFfQBJ2R4iAg
	o5tYgmYW9X9Zf1V673xikX6AQjnqm7hkpySnJFqh+oNXD/lEU2VfNxOSWTY16S3Q/ybawqlnJEU
	Zi152rYGRvjm18RVJDweWKkLgZItolZlo6TkOrJ4AzlLTcmrPJigBez8kTceKauc=
X-Received: by 2002:a17:903:1b47:b0:2b2:5491:e32f with SMTP id d9443c01a7336-2c1e8344ef4mr160006185ad.16.1780892221391;
        Sun, 07 Jun 2026 21:17:01 -0700 (PDT)
X-Received: by 2002:a17:903:1b47:b0:2b2:5491:e32f with SMTP id d9443c01a7336-2c1e8344ef4mr160005735ad.16.1780892220923;
        Sun, 07 Jun 2026 21:17:00 -0700 (PDT)
Received: from hu-neersoni-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649fcdfsm209392525ad.78.2026.06.07.21.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 21:17:00 -0700 (PDT)
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
To: ulf.hansson@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, neeraj.soni@oss.qualcomm.com,
        Abel Vesa <abel.vesa@linaro.org>,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v7 1/3] dt-bindings: mmc: sdhci-msm: Add ICE phandle
Date: Mon,  8 Jun 2026 09:46:48 +0530
Message-Id: <20260608041650.541502-2-neeraj.soni@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608041650.541502-1-neeraj.soni@oss.qualcomm.com>
References: <20260608041650.541502-1-neeraj.soni@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDAzNCBTYWx0ZWRfX4qwSDQO/QKyo
 b2X0OmTQBlgjtON9d+lxnR7ThlfMkulMEGNQSRGCNTGVATI5MFR6adHNYQZObPdmUmi74hH7EPR
 0JFZcUrzA0/O6YInPOnTe66iICdYanyM2QTiPlW+F80HIacMHCIDH0zXQKG5QknWahRZcdCsVMi
 XkWwAP+OtMNDYJeHr0UjURb8fj92Y+CTDCWSuJ4ptpkI6rQkODReY3OSRh2LLNJOnn37VZxbCty
 UqQ4k+NPSnl7KVWzSdCSIHIVTdOXu1y4PsRgpGp+ZT5hNiEj/tywzWi22U2ZHxoW3fNHkflMBS3
 Jk+JzC09EJre1lDf3c5VxnZQFEZ9w1PLGsY80sXONuHOF5OzOW9SyKgyoW+Pb/TXwZ2JvDQlomN
 sHW/gbSVMxvCtDxa91M8L/NOZc1GRNkVIjUcE65H4Dd5yqVRW1unjDhLYC2JMXM0r6/w4AHQ3eU
 hHYj8slk9Dt6fC5eoog==
X-Proofpoint-ORIG-GUID: f6xvA3aK86Sqeq2tm1TLEBAC3Fw7dVhG
X-Proofpoint-GUID: f6xvA3aK86Sqeq2tm1TLEBAC3Fw7dVhG
X-Authority-Analysis: v=2.4 cv=TIB1jVla c=1 sm=1 tr=0 ts=6a26423e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=kJ_adD4HZfoOqhAMuKMA:9
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080034

Starting with sc7280(kodiak), the ICE will have its own device-tree node.
So add the qcom,ice property to reference it.

To avoid double-modeling, when qcom,ice is present, disallow an embedded
ICE register region in the SDHCI node. Older SoCs without ICE remain
valid as no additional requirement is imposed.

Co-developed-by: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Co-developed-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Link: https://lore.kernel.org/r/20260310113557.348502-2-neeraj.soni@oss.qualcomm.com
Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
---
 .../bindings/mmc/qcom,sdhci-msm.yaml          | 95 +++++++++++++------
 1 file changed, 67 insertions(+), 28 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
index bd558a11b792..b3fcc1673c10 100644
--- a/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
@@ -145,6 +145,11 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: platform specific settings for DLL_CONFIG reg.
 
+  qcom,ice:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to the Inline Crypto Engine (ICE) hardware block for this controller.
+
   iommus:
     minItems: 1
     maxItems: 8
@@ -198,35 +203,69 @@ allOf:
             enum:
               - qcom,sdhci-msm-v4
     then:
-      properties:
-        reg:
-          minItems: 2
-          items:
-            - description: Host controller register map
-            - description: SD Core register map
-            - description: CQE register map
-            - description: Inline Crypto Engine register map
-        reg-names:
-          minItems: 2
-          items:
-            - const: hc
-            - const: core
-            - const: cqhci
-            - const: ice
+      if:
+        required:
+          - qcom,ice
+      then:
+        properties:
+          reg:
+            minItems: 2
+            items:
+              - description: Host controller register map
+              - description: SD Core register map
+              - description: CQE register map
+          reg-names:
+            minItems: 2
+            items:
+              - const: hc
+              - const: core
+              - const: cqhci
+      else:
+        properties:
+          reg:
+            minItems: 2
+            items:
+              - description: Host controller register map
+              - description: SD Core register map
+              - description: CQE register map
+              - description: Inline Crypto Engine register map
+          reg-names:
+            minItems: 2
+            items:
+              - const: hc
+              - const: core
+              - const: cqhci
+              - const: ice
     else:
-      properties:
-        reg:
-          minItems: 1
-          items:
-            - description: Host controller register map
-            - description: CQE register map
-            - description: Inline Crypto Engine register map
-        reg-names:
-          minItems: 1
-          items:
-            - const: hc
-            - const: cqhci
-            - const: ice
+      if:
+        required:
+          - qcom,ice
+      then:
+        properties:
+          reg:
+            minItems: 1
+            items:
+              - description: Host controller register map
+              - description: CQE register map
+          reg-names:
+            minItems: 1
+            items:
+              - const: hc
+              - const: cqhci
+      else:
+        properties:
+          reg:
+            minItems: 1
+            items:
+              - description: Host controller register map
+              - description: CQE register map
+              - description: Inline Crypto Engine register map
+          reg-names:
+            minItems: 1
+            items:
+              - const: hc
+              - const: cqhci
+              - const: ice
 
 unevaluatedProperties: false
 
-- 
2.34.1

