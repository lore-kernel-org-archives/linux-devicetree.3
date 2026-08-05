Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5BA471439
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 13:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785936108; cv=none; b=N1wkVIsCKpQu73SSDFBpIws1NWxoIbgFlQ4i6o0hyH8TjYdws5VB/gh442aw51GA1cYm1G5BB9WIuljszxR5D/YvzN1wzRNyK7mTERbZIctRVVkLtVFifb0KtcctSaMkLAZ6FML2tgaaKHTz9Awv/cLLmDo+A0jgTqYxQJpQ5hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785936108; c=relaxed/simple;
	bh=qqssz6IAbBbmca9JLdbkbyj96NpcQiOlBuVMR0m1Xzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aOKr0AykrzpnszlaF7hubYTleCsO2xwRMwRkqh9cxvmQMKRjQkZivfvqVoFvbz8zMWTQpJAGruMvFdFJuQ78bJFRTxlY6e7UD0xdIFSOv2ghgNtxnxb7lelfFA3PtFYs4ZnWH4LRmr6y2IL0BeSrM3rnf/ZWi3h9Nm6lLRehfkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pmaNVZ10; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LuikS8VV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pmaNVZ10";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LuikS8VV"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675BvbZZ3998351
	for <devicetree@vger.kernel.org>; Wed, 5 Aug 2026 13:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6bSVO5mGpfC
	x4cQJzy/bAyG+VV8bdvhBoSx/CKDEJPQ=; b=pmaNVZ10/NfWj+6ZXvG9/o+gFLB
	BB+M2+u+Alit61RR1zgPveP7na6ubzZAc72nZ2DMO3z4Vc73ZINkSwkJrD9E1HnO
	+oATETM4kk5oA4cBi+2Mi2Qw8b9YY6O33p+XGJ/KHrBYFxBbXxp48ett5Sx6Ueb0
	pAApOTzni5VKOEabfQ9YZzSviBFLICFZ+asWQJDh8pRQHiwZAI6x9BgHdh86K/sA
	bb7OIGddrGv8nKQBoRCArXfzqXhBx/cB0GqvtAzmM8EISBQqax2m+lil4bF5qc5p
	IMd7YTL6tc74Sl87Q0AJE26H9bIlzCfGlRnvibm4LMWFRRcMzu/BNLK0mIg==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fuu3ujv9f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 13:21:45 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6a17dafd042so894531eaf.2
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 06:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785936105; x=1786540905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6bSVO5mGpfCx4cQJzy/bAyG+VV8bdvhBoSx/CKDEJPQ=;
        b=LuikS8VV926U5yUjmnibtZUew9hcuVZbI+pdh1LVJFUsbCImFsRJgFD35zYTpJQZBY
         dOQmUOBf/MSlWNy/Av1eCa0RkZMR4JgRFZ8+DoCW6F6ipkAKZrhERK0+/ZFD3ODoLSi8
         US2FEoObFSmkRCQR6OOTq5iLRN1IcFQrA7LH9MYLZpa5W1+QPsLINZ5qxgm8+8GWEzHC
         +B2qvJ7D1xpN3FzJu2NHBmJ+p1pNfsJPmzf0ywqWS2c8m3nygYT71z4k6sy45u2wtOPa
         rgbINOP3wxr8tcWWrF84t3Z9fEfz3tQX/LfYMsgNwZsbB2cYE7lWlUhWiFRtiSUwoNdl
         CDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785936105; x=1786540905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6bSVO5mGpfCx4cQJzy/bAyG+VV8bdvhBoSx/CKDEJPQ=;
        b=IzCmMg8I9V2APg8pgO8p6YqYPc5g2abcpuKfRy7HxJHDlOLmKXeFUkjIybCK3pNvk9
         SmLZI0+6TN3xHWJoQND0xWzCJAQMznXTvmVcpUhwvhsothL7LbtqRk47bhhy2ITa1frv
         vvx5WlWJeWRP8vOkOtjiBbQ5I6np4RwYilo+HGXPArDD52SwzPL5y85r3jmiYgKBgF54
         zUAiFcUzrb6/3oe86mUpxh5hJTeMpSqjuYDmdOYZrT5YJMAQDhuM+1CgTeWJcLCSzvOX
         gl3VvvaeLBKzR86HzrdeHi0qZ3l35GjlLhEfow2s+WX02gsN5fxrJAAs1+I6HV3GEOv+
         ozhQ==
X-Forwarded-Encrypted: i=1; AHgh+RqsJTbuW9eomI55FeIQt1vRnAnwmwKfUn8RSEye5b/G9P/UdFFdc7Lt/yV8Vt+0ZChzSOXBBuLzmOTD@vger.kernel.org
X-Gm-Message-State: AOJu0YyXY2d8vd5gW8MDdFPQpGM97NUxesb+gxHKiGlRWYWX9D5X8XQ2
	Kd/T29+8t0FMmih5gF+EsbBiLMBfiW/3pwcWgYelwolwekDdBgYDO9R7oYe4J+uD6DYjgbz5peV
	3hntgus40gLmWYmzWEsbsKZGQpPrhazpq9cVKb+MMbotKwXlj7brnwf+yNWmrVuTi
X-Gm-Gg: AR+sD12BFbOLV6iBPG8o8jrAHj331A1Ef/XEeO4WVWXqEs7gEFTtEPtFDda8u6G6DeS
	OnhnGBUP5biGbDYmKE8mCddOJPYcvXQ5t/RHUZhLU6lSs1Ra2BQjJ47vCOOpaWLU3jjkzNM8OXS
	eO/wDVpPMSZQevmexVuOEFet2yICkF6rMQHvigF8RW0NsljT1KJDvLWYuuYww1rx93ugyXu64HD
	ckv1sQ8k/NU3SpMTkUYGhpgFUzM4l0z6qPJzMBF9W9WztLhZYQxL8zAwf5JJazJpPY7ZngLaloF
	4fYUx4+Q0RR+RQMq/gqAAl7qs6Qm6BVFBho+Ideu1gJfnOGDbqGCMN/Tzjek4CNtF9iGROyc6Aa
	VuZHMS3z/V3878ba+oCNO9/VYqzY=
X-Received: by 2002:a4a:e84a:0:b0:6a3:7ee4:11c7 with SMTP id 006d021491bc7-6ae96f9d0e9mr3269009eaf.29.1785936104886;
        Wed, 05 Aug 2026 06:21:44 -0700 (PDT)
X-Received: by 2002:a4a:e84a:0:b0:6a3:7ee4:11c7 with SMTP id 006d021491bc7-6ae96f9d0e9mr3268976eaf.29.1785936104303;
        Wed, 05 Aug 2026 06:21:44 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4599e63d64asm2412596fac.13.2026.08.05.06.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:21:43 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 1/3] dt-bindings: remoteproc: qcom,sm8550-pas: Add Hawi and Maili MPSS as SM8650 fallback
Date: Wed,  5 Aug 2026 18:51:27 +0530
Message-ID: <20260805132129.2713174-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260805132129.2713174-1-mukesh.ojha@oss.qualcomm.com>
References: <20260805132129.2713174-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEwOCBTYWx0ZWRfX21qDmBuL5ywm
 V1PGk1bx6dfpYwYlC+7V5hWKI0e3ljL6IY/y/Z0D/3zMe16YAWgZd5ElhFd+O1wagihS+KXFWh9
 qW4Q9p0h9NFreXjs5es1Hl00eRHJ5S0=
X-Proofpoint-GUID: 81jwzvcsqjkmuDgohUI-TMNlfumB_ejM
X-Authority-Analysis: v=2.4 cv=B5aJFutM c=1 sm=1 tr=0 ts=6a7338e9 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=TCzjUf_GE5tPdZehUmUA:9 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-ORIG-GUID: 81jwzvcsqjkmuDgohUI-TMNlfumB_ejM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEwOCBTYWx0ZWRfXzmWiIIirH593
 rY9C12wfI/pu/lcI1mFhZPX9p63OuI2J+ttQ3bEiblyA9VtMLE1RmeMXyerTJRcPwyzWQbbriSX
 qUZHcYsSMnycHJbN/SpwTfbqMg4+djr1AF0ufNG0cNrHneL+yXjznzsCEhuXkdC4uRIgBo4BPb6
 7c0NMbSogsjG9TB9gjTqkhhR+VRzqaNi+xDNmJgepO51fj3OaoQJC5hKKrG7ruSGjxauCpIgMOL
 EFqp38AXbsWqBzDsPuy1AWcfJouJNTNvGMi2YtHp2cl3V2+QeT3vkxMpvSh6QQ4RRG7sTE6Jobr
 rgQs0Qn8sfPsau+2OUzycePwWB3T+r2iaPbUnjAgYuLZCrmdP6I5XgW7l9/wrjrcdYPbCtp9bK0
 sljPEOAxMObT+Rk5e5gAdVxkGqiD5tQq+uA2PADRUK+cXOWyDS844w1rKE/19urxVzYXE9U1zJy
 XjCGwCQX+ZQlsYHqHhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050108

The Hawi and Maili MPSS blocks are fully compatible with the SM8650 MPSS
with identical interrupt, memory-region, and power-domain topologies, so
they should ideally fall back to the SM8650 compatible.

Introduce a fallback items block that pairs qcom,hawi-mpss-pas and
qcom,maili-mpss-pas with qcom,sm8650-mpss-pas. Switch the mpss
memory-region and power-domain allOf blocks from enum: to contains: so the
constraints apply whether the compatible appears in the standalone form or
as part of a fallback array.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,sm8550-pas.yaml  | 23 ++++++++++++-------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index c58e8a6c7fe1..ae74aa4bb6cd 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -47,6 +47,11 @@ properties:
       - items:
           - const: qcom,sm8750-cdsp-pas
           - const: qcom,sm8650-cdsp-pas
+      - items:
+          - enum:
+              - qcom,hawi-mpss-pas
+              - qcom,maili-mpss-pas
+          - const: qcom,sm8650-mpss-pas
 
   reg:
     maxItems: 1
@@ -203,9 +208,10 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - qcom,sdx75-mpss-pas
-            - qcom,sm8650-mpss-pas
+          contains:
+            enum:
+              - qcom,sdx75-mpss-pas
+              - qcom,sm8650-mpss-pas
     then:
       properties:
         interrupts:
@@ -253,11 +259,12 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - qcom,sdx75-mpss-pas
-            - qcom,sm8550-mpss-pas
-            - qcom,sm8650-mpss-pas
-            - qcom,sm8750-mpss-pas
+          contains:
+            enum:
+              - qcom,sdx75-mpss-pas
+              - qcom,sm8550-mpss-pas
+              - qcom,sm8650-mpss-pas
+              - qcom,sm8750-mpss-pas
     then:
       properties:
         power-domains:
-- 
2.53.0

