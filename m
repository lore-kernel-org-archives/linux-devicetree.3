Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E9F4DAF85
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 09:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791969241; cv=none; b=hDVQWu+1f8DSsuqFrMqe0kCOAWbmayUPF3sM5Fpz+R0FTGPASMHQPnHMIynjnlv5tzcm9E7eh/jvQv2PVH3tkSCd9gGy5/JsxUAgaRskLTxtps7Js4eU7H4yiEgWl08yG3ft+32yMoVLZEfpazGVUG3YCWXbMSWqHFOoZskw3U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791969241; c=relaxed/simple;
	bh=EW7mv5boTd2XPeglGx1Jj1JeQwIoToXRbQ3gO0Z4r1g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JJgO4M/sQvsHPraQJN8FZ7PZMGqdxlOeZwAXNuVm1/9y/BguQU7M+vISf3V1g414kTcQgP6WRxURaI1odDxmGHxiFW+pJP1rUa9K4CUYi+/ck+WBY0FCCEqEfaLlDqKkDglDoOp/O/iHApJHgbiiYfKPxGmceBjKjE+6VPymioo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hWsGnRxl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SZ+Xl7eE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hWsGnRxl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SZ+Xl7eE"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E3u5L12222165
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 09:13:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9BftUQ7vtLSNZVUVEtcP5CnaG49A+3gbZmJ1g+cbuRE=; b=hWsGnRxlNzCozimy
	DiDvlID0aYwJPhKxGfVTCtcUYAPq4CJEUb+YvbCAT7LZ3CgBuZG3eQJKPUNDVMcv
	EK36BWQ2t4VlVDeGr6XEG7pBCPYT/oubbufArjwAltg4exWS+SiSnFL0nmlB9JXK
	6r2F/MqK9hZZHtTYbHnCRzmooqaQ7Yf2TVYGjXJ4PvDdLJyczW9auGTEyUNFL3Vx
	gPpGpMOKYXXIUq1tz5OcT5BKBY6YLVpYtdlwFwI1fX3EAy4EqtEyoPR8hie1xboX
	57n6Ycsv8ZXj3lsgXfRUpe15HgBHAvhVqjm1hJZGL3JDyrjDbhBskFd5o+0v9oW5
	0ypiKw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9txsatpa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 09:13:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e61a8eb087so13708235ad.0
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 02:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791969236; x=1792574036; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9BftUQ7vtLSNZVUVEtcP5CnaG49A+3gbZmJ1g+cbuRE=;
        b=SZ+Xl7eEKOu2HnT+H1eUjuJcZKEHO644xs6YRCLkIXefeXplTiTUviyABtIPIv0eKz
         5lMIzwKjOMhpGNLKy4nV48nYZ2Nsyn2hDE6Ga+n1XDvAygl1kCjXLGfWTKd07hPzv30M
         DXNQ9pSjMPsmiISsrH+oX6HL9Elj+LFeqTqxNNWi+de2iQrMKGrvpyIEDVoAuvX/3gWG
         TFciDSC8kUtt/zDxUfKTtyw9956CP7oOCJwdy0LIOaniiHXkkMxvpumKJKYLuc4dGosz
         i4XA64+iLO339UEXzUQrAQryxs5R4cnI7fq6A0YfgoknNyLb4jP6LpS32HSGXkDdSnf0
         prGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969236; x=1792574036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9BftUQ7vtLSNZVUVEtcP5CnaG49A+3gbZmJ1g+cbuRE=;
        b=2VlobZEcaRcxPBxtJAHysNo1vq7RH0zc/Gk8HIYDmtuvLRTJzPHiL3TJ08YadfaB3y
         4EIN68Tb7bR8NJeHz9OWK7hsX/L8DUdiXaxEnSjC/r49eULSqnExMh8Im7mL7W4MYw7+
         qzHb47DWvatro0G39/SDmDfuBK7cv9GiFxwTEhMcmlM5Ca2D9ZwTjrBDuHQps9PYfO+S
         CYZJBw4kGckEfA/wV/LdzYqXyOVnKnUV/Do2qmZ19bOuzIV9kTNkBsycvm8It0Q0lccM
         MAqv0t29DInb2x+9V72SyLejVOFs/Jq1TymbpAymRLVHEKOx3wBbgTT6dXVRHPZDFKKY
         1PUw==
X-Forwarded-Encrypted: i=1; AKwUvByn7RGr/d4Afq81kS/71KGCZipDKfgO8TCM7AoDyYgrLo7RIexQ2m3s+aeK9OF6HzG3/KMPA3/Uaji1@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5OqpxArO4kyjB3n2ba7u38sJo+yQdeGZ//xN+8fT9VXEVEUY2
	jXchj+ufCOrkzgfV+KFu4RfANHjrWYGEwACRDhCN70naBp8zYKczQOWMVe+7wWSYPqhmrC+LCv1
	E5DD6Rzq3KRch+kyPlV6n/VZU56B6J3c/gZKDJDC5Lr3TDTRonswmJeLq0zVYwxkA
X-Gm-Gg: AYBFou2DCQx5gtgG2hW8gO30aA17rLIx0jpNRkj19u+Ig+5NCGNIIpBvgvKZLihhX5K
	Gv7iTlPnX59jkbaHwGItOkAj2UuvMTDBtK1IifiSUrzavZoTxPl0ZdJ0yb3fVm1vbfFXPL9tFyB
	U9M8ZM/0ys5yf67ww1fCl8QD704dcEuPx+ixgSF+xek4A13Rgm3NH1Jshz8ZP/GozNWJpTbelaT
	WslHPLkqQE2daasyJt1DyrBf31zbjqlP6je13ndTGfvnkrDx+rSpv3rNraGDeRfuocprbsGGxgv
	hzWda9tu7nwOXky8cCFn0gBnzyPGU76fkv8/KirUO6lmgfdLhetuLTz7iJ/yV7rscUI29Su609+
	Y2Ywnk/Z+yHzmFJGFIXtKgl7aGGk9h5JqOw4=
X-Received: by 2002:a17:902:e884:b0:2e8:3281:6464 with SMTP id d9443c01a7336-2e842cfe9f4mr135960795ad.32.1791969236229;
        Wed, 14 Oct 2026 02:13:56 -0700 (PDT)
X-Received: by 2002:a17:902:e884:b0:2e8:3281:6464 with SMTP id d9443c01a7336-2e842cfe9f4mr135960305ad.32.1791969234623;
        Wed, 14 Oct 2026 02:13:54 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b16b3sm67088595ad.30.2026.10.14.02.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:13:53 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 14:42:47 +0530
Subject: [PATCH v5 1/9] ASoC: dt-bindings: qcom: Add Shikra RX and VA macro
 codecs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-add_shikra_support_v5-v5-1-fb9f0667e613@oss.qualcomm.com>
References: <20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com>
In-Reply-To: <20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791969222; l=2747;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=EW7mv5boTd2XPeglGx1Jj1JeQwIoToXRbQ3gO0Z4r1g=;
 b=H2dFrhuaXScuqH5pwr4ZP5j16WfbMwuxwGu/YTxpegxr48UqHl/fyWZ9xRcoDy1TtQ1IAhw6/
 /v99FG/AM/0DRuCrAA/Ycdp6VJinfacmtIKoItaYoK3D+GKGTz7bhD0
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfX+6voeMCG8zM2
 p1RqFwgpohhyFscYAIe5bYRVN0eqmrbJeUBchSOy8chqbkYlI560DKdzUlabYrGaKc4Pt7YEivl
 ZWiRzVF9SdC4E7WT6DD0y7/aLP2nN5tCjwzvDp7SBdBx7EJzwek75PRdiy1CSxlPsFC4RdMGY3X
 Ikp+UrahbgOG/AwYmx8AIO1qNeLX3UuULzFpSibvWKkkn6VAO1pkqTlxvHCgfMnVhqkzqxAkNUy
 BXB+iLo/+SQBvxwjB6PuT67amRO+qD18DpGH/o58GaH2LT2sinuM2QIaW0ZIZENj026L/zLJ0/K
 t00fu7FHryMtHEXZlp6QN7r0dkGjFQ5zsNK53C2h3EY0JmtvHoZrm0xverI4sGQ6+duWuUVf0vA
 4un3WVnfVY9Bif6+2Wa7H03BVNr2WiaAIee8lJc8+J/6KpAFABjQ5hpsq7zek7caWI8laq+gNns
 IJN0F5HjWQ+isKz+DzQ==
X-Authority-Analysis: v=2.4 cv=LPPz05W9 c=1 sm=1 tr=0 ts=6acf47d4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=enWoqSm7ZukIuFDY9bkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfXxW4cae+Ucq5G
 5RaofdMZW0Dq71scYWHQ8BLaoA2D5K100gomIi+Vj9TruDnATo+Kei5206zMt7l8yRx2CfEgByJ
 CXsaKHWrn/xWaGXhmv0dlqSGzGOEqV4=
X-Proofpoint-ORIG-GUID: xWdWZlxepZKA-gtiobkrriKV6s6ubiYi
X-Proofpoint-GUID: xWdWZlxepZKA-gtiobkrriKV6s6ubiYi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140036

Document compatibles for Qualcomm shikra rx and va macro codecs.
This SoC does not provide macro and dcodec clock so reflect that in
the bindings.

Shikra integrates LPASS codec version 4.1, which is not backwards
compatible with the already described compatibles.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,lpass-rx-macro.yaml  | 16 ++++++++++++++++
 .../devicetree/bindings/sound/qcom,lpass-va-macro.yaml  | 17 +++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 4988e7ed6..db63a75f1 100644
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
@@ -138,6 +139,21 @@ allOf:
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

