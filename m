Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D99D3845A7
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 02:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789611378; cv=none; b=ZYiLj+FoLYLaLfa2AlpVKTGddltxWNaK5+08Tq/bHT7XeouqM8o/k8CmTzN7eKrrBGC7pq1ajVxOw9x/eSJIwLpS6+mGJKe/ysUOooEOFnGRAaxgkIGl9wsvE7wBch4cZ/UenxJjELnTS4mJfqwJsDl2FXToMdG6z7rQEi1ow88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789611378; c=relaxed/simple;
	bh=2W5RObKszArgoD/A87TmkLDGOjvuwEXcOAx0z60Pp+k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ke690WVHN4EpdTvl/u+bBqQMBgxdOxa2Te1OX8xkQGoG46Xs37b5wR5AyPL1IOCLj70D1zMb+z44+VyCD/8NHAHGDmyrEaLSmC86gYJFhJSoHELBoT1ysObiaiX7YYJik+V3I88E76Rus5H28pIK8/VNdgfooeRt4l4zYectnvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BBuWnxio; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j/45cdoE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BBuWnxio";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j/45cdoE"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GMrx8d2430502
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 02:16:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U+25ut/u/ktG52cH9j/Y9VE3SglkY0dcyP6JoqO5Rao=; b=BBuWnxiotT+QOb1X
	u/orUgxKluow1+AyYeSCXRdW8zYPbgmSd/oJDkJlk6/NaNJax6PsY+hPz64e1egL
	c0OqLl9kqMEplYejF0lnn9HfUS4DKxkTsme5dxfMfYUmTxiwEwS7lNTC9y15Q5/+
	cFIUL+pzjjji4RAgHQ5G1+WSYFBq7ZiBPlROJCHr7h7JCZBrLKj6rYG+P9K/Fv9W
	T4fgNv/qfG6Lv/QhchRuADp7dAsiAoURb7lz3OiqSQD/fIdIrTRJ25wfKZAJ1chj
	rfJi0PZmWdi/tyOIqhaUmn2TPCWDhRGPIWfDWNJE6a6g6bM87to1eo8hoHdT+6TK
	HtiUtA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqthnuepp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 02:16:16 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4c1fc9ceaso257623a12.3
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 19:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789611375; x=1790216175; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U+25ut/u/ktG52cH9j/Y9VE3SglkY0dcyP6JoqO5Rao=;
        b=j/45cdoESpZSFZQPV41HW+XuJ159fAAvR8fUKAsfJIQw38bs1DmwFYuk5P2hHjLHgG
         qFyoFhkp12l/+rI6J02iOZLUW/zQOClcEpBmmQoRhsD9Gt6iLl7pHOcgtaxlXMAgObCo
         5UwI+DZGTYEa6b5ipwbJZKqEPKNOfjNXWJb50omQTir4ADTq76Nuf+vB78+5vvGdCj9R
         hTjplPY/90KU4YQXkGiIkzn3YmKZM5/NkwPMal4Yj6hbm6sVVq1EobkOWSvHPZNOzPvQ
         fLbX9EOyANT41QZxXOuXSCjfUaES7Osg3pEgHNNg5qshb8hGhJMHop9A089Wwr8zrxmY
         W7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789611375; x=1790216175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U+25ut/u/ktG52cH9j/Y9VE3SglkY0dcyP6JoqO5Rao=;
        b=q0a5CiGgGaj0KrJbNmrGZ7v2knrVxsCVSFIB+yUUvNG6lka5cjooM1byCrCoDKk0fq
         3QoImSMS3XrtJEUGWoPozkhk0ifkAJ6XqgKl3pz8hUTvvOErqzbRtobBDHxvuUjMHCEV
         TXzL8RPRZlWCUI0fJX5iNETAp0R6hKLMcXDIVDjGqmNEue68KLD6tN9pTHyFY1opAQKT
         Tww4RCiBEO/nWKQnJJvyFmzzfx1GIZWJE8+rZI6afFfYycsLv7DJNgihbyQlwJSbg2x7
         8P5lis5NseAqUcWaSnwlYnP7o8atmE80Nv6CVZNadtvhalgo0ysJDmL8ac9f4ehnslOK
         68Iw==
X-Forwarded-Encrypted: i=1; AKwUvBw6VA9TY5NePs9JZNGBuIYrK9s66vqNbyttIgzE4XZMBGjwOHe9ntBegRYOaKFG07OGDl1I2sB7i1j4@vger.kernel.org
X-Gm-Message-State: AFuF++nEiQ0eiV0kp92YJS2zjyTy7/W84tSSQVthtHXH+jkoYQpDKqTf
	gYjdHAAlxOMp/f0K7Rdz1QR7EHpbzYZVnRsq/Qhk+1IQY//D081IUKX+8ER1rs0rJ1BvWKHRTKJ
	DZFWfPfo6l/Yhw67fdgTny5ZtOF+jaLCL1fM2rX8Mu1MGP7bRva50SBGemv1X7f6T
X-Gm-Gg: AYBFou1E5NZHWPpYYgKJsc8HuNlYiQfkzl0T/ILNSCrbJTnaNQF8FaSSUbo8vBR+Guc
	pgabdogqf5WOTY4Vp4cZPnwn6ECsj7KDFGcDQWMhg59fExdP3sf1rGXixQjRsP7P6qmvi9lshND
	jemlmfKzJ7tE0n2/S4Gajm7M/anf6y4uPdR++xEvRRk/rRCaumrAEQUn6sK7x5irwOOgwsZa3UH
	moN/X+kBH5h5OpiL6BCoyTUpH9bN2f0zL8pDA9h66Y0/Fxh9A2TSs6V/v6UiPQaOGhkLDd3/pXD
	4sYNXuybIp/P6EXkmMJGU+iNyYhZ9jb3loOu0VDEHylVaTMNKrfHOiFzrqBvnypBVpYT/6uxOt3
	oUpCoY+7qZHGy56AO5RhW60ah9EHt4+RpRluC
X-Received: by 2002:a05:6a21:4d0c:b0:3d3:b00a:6f03 with SMTP id adf61e73a8af0-3dd5f7dac4dmr13014926637.28.1789611375528;
        Wed, 16 Sep 2026 19:16:15 -0700 (PDT)
X-Received: by 2002:a05:6a21:4d0c:b0:3d3:b00a:6f03 with SMTP id adf61e73a8af0-3dd5f7dac4dmr13014876637.28.1789611375102;
        Wed, 16 Sep 2026 19:16:15 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bfb19f8cesm14372881eec.2.2026.09.16.19.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 19:16:14 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 07:45:32 +0530
Subject: [PATCH v3 v3 1/5] ASoC: dt-bindings: qcom: Add Shikra RX and VA
 macro codecs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-add_shikra_support-v3-1-fc0e79c341aa@oss.qualcomm.com>
References: <20260917-add_shikra_support-v3-0-fc0e79c341aa@oss.qualcomm.com>
In-Reply-To: <20260917-add_shikra_support-v3-0-fc0e79c341aa@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789611365; l=2699;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=2W5RObKszArgoD/A87TmkLDGOjvuwEXcOAx0z60Pp+k=;
 b=wKNHIkmZJI741JO5dQr0bnQahikCmBI1jV4CAGTzQQk2lWYuHtnUCpVXmfHE6NRc6cZyyQLqs
 HL499LhxNMpCO19uK9PC8xM8oneJFmDJqplXxDfk0zTjL5Lqk4aLbCU
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-ORIG-GUID: LLXHJwkZX2pCRrG_RVP6m2R1vHJL5LFR
X-Authority-Analysis: v=2.4 cv=IsKL47/g c=1 sm=1 tr=0 ts=6aab4d70 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=cvJDH5HnDjnG4tsKpogA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDAyOSBTYWx0ZWRfX/OEpBqDprVlA
 kQo7VCOf3fiwdlKkEDyWgDpaqq19CSxAtZHWUhKac5pRqwN/CXPBJGSc884EN19h9KeHOW6S+bR
 gcp72cUKTKY8lJVtjo024i+MPK95dOPvB+yffnFo7J4unleMThs+Cq3TZJ8YKWx14WcxiwTvgiX
 PGb7mKLWmEKyRlWl3G3dwDLqTeGVDaFqOOjC791YwXR/xzLT6E6nJBLsmlK7ArL1NyhYSmEb/9r
 EkZpjyPucIeNZ7xHj0ytuk5RDpt0rqVJnL8oQuKhiPh/I3JfaoZgatwGsx1PB1M6OyP8s4u1Vvp
 Tzisf8J3FqP4FkUhzc2XyDCrqY4F3xlvzTC66OnymuFeK1kkcIZ2FZt96YcKIFt4Lv5Bb2ASAKG
 GBbec635NPqHYCKDlbHqX3DnB8358RtBWBTzSfC349bgxEj3MwTDzMenG3VeJ70O3n3CBE/I8Fp
 oE6PRTa9tqG/t4uHoZw==
X-Proofpoint-GUID: LLXHJwkZX2pCRrG_RVP6m2R1vHJL5LFR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDAyOSBTYWx0ZWRfX0pdBKCV88e45
 zMJx3OjjsR0XYImYhrOGG0gkilZOjyuL7tZaps7jwgaTA5Ypq2A08SoxzzNpud0GtznLoFlypQ8
 eDQSd95ij9juv/5pZWaUDNUkrsateeE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170029

Document compatibles for Qualcomm shikra rx and va macro codecs.
This SoC does not provide macro and dcodec clock so reflect that in
the bindings.

Shikra integrates LPASS codec version 4.1, which is not backwards
compatible with the already described compatibles.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,lpass-rx-macro.yaml  | 17 +++++++++++++++++
 .../devicetree/bindings/sound/qcom,lpass-va-macro.yaml  | 17 +++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 4988e7ed6..69d7b7332 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -14,6 +14,7 @@ properties:
     oneOf:
       - enum:
           - qcom,sc7280-lpass-rx-macro
+          - qcom,shikra-lpass-rx-macro
           - qcom,sm6115-lpass-rx-macro
           - qcom,sm8250-lpass-rx-macro
           - qcom,sm8450-lpass-rx-macro
@@ -138,6 +139,22 @@ allOf:
             - const: dcodec
             - const: fsgen
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,shikra-lpass-rx-macro
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          items:
+            - const: mclk
+            - const: npl
+            - const: fsgen
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index aea31fbda..683ebf702 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -14,6 +14,7 @@ properties:
     oneOf:
       - enum:
           - qcom,sc7280-lpass-va-macro
+          - qcom,shikra-lpass-va-macro
           - qcom,sm6115-lpass-va-macro
           - qcom,sm8250-lpass-va-macro
           - qcom,sm8450-lpass-va-macro
@@ -168,6 +169,22 @@ allOf:
             - const: macro
             - const: dcodec
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,shikra-lpass-va-macro
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          items:
+            - const: mclk
+            - const: npl
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1

