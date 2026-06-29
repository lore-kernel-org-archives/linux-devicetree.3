Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3360B343882
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782718579; cv=none; b=tgKaQJPvKvkgnTQwfNcB7CfuoFDs75qfsa0vS4wj/T0xt7I+3ydIE1nWD27auo27F3D5+hpytOQWtgJXD3C+zYoD7a/8jMbjc+pmSFtdh5uxvCmSovS9TNndxbF4b5djqZSXi//Q/sLiCEh0a68YQNLz1ojqE3TKyYTdO18HXTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782718579; c=relaxed/simple;
	bh=UG9Kp7jY662Of04sDVmPvTQnEYnBxLOiWQ1vf2oQK7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A1VoRfQz3bXJI9GPBAYpnPIHfuEK12g1y4wEddYEl0qdWCBKf2CaBU7ihxpDst/Wdgh2WRoa8np3nwLtKLcL5Zsf+14SjeWUbditib2GDiUkpbuMuBq/4baii4zw0ojZngCeH4dINNw1j1rH1gqT5nWiVUiroGh52+DY3Mb1kl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hqjETeMv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RgQnFyt3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hqjETeMv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RgQnFyt3"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6rW472116016
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:36:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	badozWK0W2Cr2Afkm10JULzGCoMptdbDOA7a+6f5rF0=; b=hqjETeMvFYVWdf8t
	FMhcAOlDxiA/vAvsKjSHGm02gm9MOHdrzSJawyAtAoJGh8Xz1C4hC1rjHlGZjLcb
	Fq0kmq0Zzt2V91LF2EDwbuWR5F0n7/m7cvlwbKI8BqIyw0ZJxGr6DHEjo+nM8EwP
	ErROz0K/zWKIDGNeg657fCKrN0HnDEkn5TKzRnPfI0XnQDDXFJ4F+0dwope/sxbO
	OZ0+XBznxX639+E/+urI90lVjh6VuKU0TBehSIu7vcE9mT4okwfLti5xWQZAYsY8
	WzX9MTGf//TGhnAMN8pguPVd4YS94v2B1iNhFtZcmPk0bHaOdfnYuW8NTSrI52c6
	MTKkfg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f2734dbee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:36:11 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37fc0aaa94cso1141194a91.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 00:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782718571; x=1783323371; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=badozWK0W2Cr2Afkm10JULzGCoMptdbDOA7a+6f5rF0=;
        b=RgQnFyt3flSYfsWtTfXGT67cXACtfrHDVTcl+Q8YmpDIe9X+sy0YsELXL3bDOaxmeN
         HEy/OhukSeL7cTZih2Rh8KOCU/lfiwcxSpIFF6B4mGu+TBy8QqNCS15sY1D7cYITLkrN
         NSJK9IIr2CC4+6jdkpoo3+p0hqwVDa4+Zl3aJzMl5knMCGWXRtA0dDDn2swTYt6cCdCV
         9m5O/0DCF+as2Cy29wT4Ao89F8gZzAiPRf4sFzSXQTYmnwVI0tPlFOnZGifaIt4aLPZJ
         onqfxn1l5gyxpMSO4FXZv7/V8V491mvxHLeJx+cbJmdduDDKQPLoAUN3jt2Ike4kiU03
         1T3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782718571; x=1783323371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=badozWK0W2Cr2Afkm10JULzGCoMptdbDOA7a+6f5rF0=;
        b=H6W1MUVK3jIsABV76HXw4J5DtOBWbl/hmTL1Q5wpMDsKvhFasPuorP9a+0MwKhc3YZ
         zN8EAjGXc5MqfDnHAwT4tO1/pPONmfSKvPQJDSfO9ft4nhMonQWTRhbOqxTXpTxp4Zy6
         7LnYt+2/56eC+F2//jjXoEGMF7yRr+VcS5LMWUCOENCxjD09NaPYJxKX5eIkqCzLiIVY
         VaJlfz66nOP14jY+scbOUHj8Lji//0hMxr2gbBCxT5KniK0k/xQ5kPCXssSxiobY0xB6
         9GN2IGeiT01eU8VYHo1RTlfVpOQ8sQPjm5tLJrpW0Dki0pQSZdkSDiHCbec8qzSL7D3C
         YvDg==
X-Forwarded-Encrypted: i=1; AHgh+RqzKrWHfYHrDU6evuf3zykVTRL+a4TxvfFIO/Os6epzZFStrPhfq/+E8odWXLe6kRGGvcbBu2657yLa@vger.kernel.org
X-Gm-Message-State: AOJu0YyEkSjShRu7G8vWAjWaLW0pAxsAXICeWEvb2z84ycvqyLZjQJZC
	pGFkCc7/4zSO3Y88Bh32H8THRmxCqSgFpqOcIOqQMU8JA64Uyj3bjRsQJu/VjIi5E6l3UYaxK+3
	l4WfwXYZ3ST78ZkbJFcQfTK1a30RKY+R9DISIb0HekKiUfuRtbmBNK/TcDr6kFGud
X-Gm-Gg: AfdE7ckhkQQZWvJddWQYH1vaMN6Eg7quhDosKIKois1NCGIls37iGriQKvsD1gl2kE6
	r9YHFdeZfwwfkPKtbQA3M9SjEpgnkYV9t/cudNioKeVggzTR//CEEZqkT3UOjOmRe/LBEPHaUPC
	gYA1aDY73xsTUdJMANpRWpqwR9G9I5eCkFqMiW2pGvbgS0vixMzJJ16OmCwTM8DicKxTGAdQrt7
	Du2GBSSxa6dF1SWfLTlHrd0VxVnxZ5THngjuznNRN3P1KCIPtZyrLYnkbwq0MTlU547Y0+0H7hB
	QJhuaWC/y6JaB41lGDD1zrWd9R8NLofDFcn0hi/3vE+78K0NaqVheQlpA3fr2IC/TpVOof08Fxn
	vHel+vsm1RHlrFGjIldv08Ec53aegpe1hM0uAvkTaw6wj
X-Received: by 2002:a17:90b:17d1:b0:37f:133a:3e07 with SMTP id 98e67ed59e1d1-37f7a52c17dmr7650805a91.2.1782718570911;
        Mon, 29 Jun 2026 00:36:10 -0700 (PDT)
X-Received: by 2002:a17:90b:17d1:b0:37f:133a:3e07 with SMTP id 98e67ed59e1d1-37f7a52c17dmr7650789a91.2.1782718570446;
        Mon, 29 Jun 2026 00:36:10 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37fa9629f8fsm4537979a91.8.2026.06.29.00.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 00:36:09 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 13:05:31 +0530
Subject: [PATCH v8 1/3] dt-bindings: mmc: sdhci-msm: add ICE phandle
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-ice_emmc_support-v8-1-1a26e1717b85@oss.qualcomm.com>
References: <20260629-ice_emmc_support-v8-0-1a26e1717b85@oss.qualcomm.com>
In-Reply-To: <20260629-ice_emmc_support-v8-0-1a26e1717b85@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: PkML1TholcxMZUa7RLFl4bvgMgJMS0rK
X-Proofpoint-ORIG-GUID: PkML1TholcxMZUa7RLFl4bvgMgJMS0rK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA2MSBTYWx0ZWRfX7+Axi1oATQag
 ynWmSBQNiAPRFumCLwVi8OQn1QlfOXJBsPSwGXLUedYW50+rFHSrDFoenjSfNraFbRV83hAkBoC
 sPzJ1v/kQqFg5JQx6ey8VkVQNPdyfi4=
X-Authority-Analysis: v=2.4 cv=HYokiCE8 c=1 sm=1 tr=0 ts=6a42206b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Hwb5qPKBi1csoFV4ZQQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA2MSBTYWx0ZWRfX5ghAn1/k8hyn
 KQtDXbyEdPdB6CSvDjz8AhcwHKssqXMUZSA95O5DQbH4livg+mtq6Zpr2nrdyWTRgdRXahX1zm8
 +gqmcpeM9yr+HGW2qZG+qPZ7Z61Yj234sR4J5MuWTdmfU28ns8UEumzKsNyGiVokd8wQ+s4mChD
 J6Kkv3V8u5YruxvYCKnAy6uXbvdDTpglZ5gtKkTZT5e4x3iOTUYcvZbeuEIxJ4DnMOizyUJFu2d
 pGmqMjuQs03u7r9KpfhUtpyQqAUaXIQBO6VUXn84VfBYM/9SrJlLUNI8zrIM3iDROa0ipcTLgsm
 YMkpU1YlpGbmoFl47ON+cchN7nIXFPBfj5JMwz9pt5BxJBDrYYqhJZ1IlRDuDlbFupWGtCLs+4r
 VInlfJtAxxYhM7MEMsSZiwfdySnf9lJD9ECYdFkMkMBWevLtL2mKuatGQPwptYdWAdHIRpArmyC
 weFMliSHnHDGtVHtSfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290061

From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>

On newer Qualcomm SoCs (starting with sc7280/kodiak), ICE is modelled
as a dedicated DT node. Add the optional qcom,ice phandle to reference
that node from the SDHCI controller.

When qcom,ice is present, disallow an embedded ICE register region in
the SDHCI node to avoid double modelling. Older SoCs without qcom,ice
remain valid.

Co-developed-by: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Co-developed-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 .../devicetree/bindings/mmc/qcom,sdhci-msm.yaml    | 95 +++++++++++++++-------
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

