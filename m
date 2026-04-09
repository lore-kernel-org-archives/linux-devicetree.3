Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8CF37CD5F
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 08:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775724756; cv=none; b=nv6B+j2YNvMZ+ChOY9jdAshrgykK1fsFLVQU9hRghtLBWCimIpG4mir1csOwp0/sqbbUoelj5vjb+eKmC4suQ79zPt8SksApkXuKdSc9t38hzrZhRmtS8t/dmMXF48osbC7XzhlS41kOLkEdooyQeXREVHHbPtqkW3ovoNv8/Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775724756; c=relaxed/simple;
	bh=/AyXfvDgL6xS/1UvCVX17NbhNe6WnF28CEFcPHn4+7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UNW2LAIhXTRPgHspEpQM4dLT2xqwBBDV3VI8sW4wEPsruWLZCjmR7QW0c8bA5Jlrb8TEbwWojeLj0uc3tWaCTu/2nCnuXh3dF5Oj8AwOJnHq30atHo8WjAqiMlRDbmkNpN95LOGlqqurSvSonDzH+hSjnAZyh01rKOsO8/FXllU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B4B5RlPK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KvcGtD8I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B4B5RlPK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KvcGtD8I"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6392uxAD2247247
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 08:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7T5qiIsx+2dwMKk5877pZ1wxVPnaaufjkpooV0Vvk8M=; b=B4B5RlPKTTgJriLq
	l1ChMPjnmx536My1oGDjauUCeHUHDiLpMZcHS4dSDxW5g96j/ScFsqvtkefCG4Kg
	Etvy3P4cO3/qRH7NETllHgnSEDk2oNt/KJj6N9byzHOkKx3R/+JsU7bayroPCtQu
	OTf8y2cIivHphYWuchNtYceFd/M/nSpYc+E0OKJciYcgOGUPkxPFr6D0BDLm09SD
	nMKyFkHpqIPH8miHChrwTYXv7tRrDYbvt0MBD+16w4VyCk40bDXDQgr8ssz/DdoQ
	U54mUqdi0w3gGI9wFhT/ypYBmWTTBS6Ez10ikgaq/D16+HcKuTuSHjSU+lNRjnmS
	H9xbMQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4de3s6s5kb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 08:52:34 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bdc1b30ac8so2151497eec.1
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 01:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775724754; x=1776329554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7T5qiIsx+2dwMKk5877pZ1wxVPnaaufjkpooV0Vvk8M=;
        b=KvcGtD8IhbjbmxaAJ/L4XVtTGtrerQb7BCIUHDf9+slUGrWUlAB9oe+iWFW7A1UtVN
         CuTMTSorqlYIDTEJ9277Y1wboLpcWcfqdMgcHtOYn16JGH2zdeyICqOeYmAmkqPwuHoh
         JvhtR9gIUvncwFwUFwez67RDYOOzY3pXoAETNPd+BusKh+QdF8tjBNgzqQytWLhZQAgw
         B9CI1hA+Ov6KTKRKHkXiZP30fNE/ELsmtwUbglJX9veMrsd0S6/SjMUraKsu/DlgYc/8
         YAXHq7y2YH5IGbzbVPzg+S3CGdQqW7qGWapBBoo6+5l8YatigXdGwOJ/m/2Xnwg7tR6I
         sJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775724754; x=1776329554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7T5qiIsx+2dwMKk5877pZ1wxVPnaaufjkpooV0Vvk8M=;
        b=Mxo5TUSYqjOJ/ZEQNhAhU8CqX78fTuCj0Aujzl+3GFQfj3+8Vi3ZtcKGZ4QSsr+sIE
         ZpO4G329IzLdjfCdm3ctO3BqJw48G6MFZLtvz9/F55E80nJqW5WRdd4tqsXVsOinccCE
         Vpw5qzl6vVtQFFGKRUCBb+lfBRxhuL0t1Hvw5YHS2giMGaSgLZxnxRfcEd0nGP/2/Vcd
         wH1DGcdUJf4IfjE1G5cJX2wRiVIFTUobh4GyqDcxOL8TIs1QT8cgIWtgwiNL6wXg9eya
         2OybVu2//LN5+QfVXYliKVg7dtVaiWpalEzkWMLckqLeoLhtud94FvYPTOcDNSfx1JGX
         hIug==
X-Forwarded-Encrypted: i=1; AJvYcCXLZqTC1yhuFg9UsZvkLw4w7b2VqHbIUiMi8gMwCfLsjAluRPe2fotzac6oh99ID/gFOUAa3uDs6IjD@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0BAX3ged9IMzMKa4pN152VrQ5eWpWJVnwR0+/P5dWMEYjOahc
	b2a0/6L94es7bY0qly8izQdhgbUkvJ9CUrhJfIV0fJwHY7GToiT9PPl32GGq8/ULLLz/IYjMzE+
	1+Gvy7JZsHFn7KdDzE4Y6SnB2Pj6Fejsy2SAkb/FloEAOJLBRx6Sniy1rEzOyNuy76Ig0y7PerB
	c=
X-Gm-Gg: AeBDievGLwfMkAsZnvnwxGy/s5f/+gYluZuiWJwT8eNm5G2tyIYM69ZA5oI03QxhXH0
	5rwCds2lGDbV1lMjc++XRtBoeV3IO7ncauONjiMNX88cTN0psVL2GOOqaOz3tXypPsm8j9/WJ5A
	qIcMsSdEJsqxV0nqxxBck5INtToqwpE+Ak9MJ53urvV2SZGXt0Xf8cbeZOqEGeUlWZo1oxF1GRK
	0G+3DkSsVHnKNJQ0fpSaEBaod59tSq4v1NpJpd+DK/oBTSNom6EGGuG9qvUnKMizVP5O008Onhh
	QPZFo0ECwB/RJ97IEymIHRAFABoVlK6OM8cIeqUlntDYdhjKzbSETNQwnXyHwPPhXb00uzGsL8U
	fEfWrIQfH/TYAv8uNOVEkwv6A41yQlllqr1OwMTUclaDId0WtBkILP48HVwmm+AQA0xkwD180
X-Received: by 2002:a05:7300:fd16:b0:2c4:d01f:6ef7 with SMTP id 5a478bee46e88-2cbfa4c41f2mr14169750eec.13.1775724753612;
        Thu, 09 Apr 2026 01:52:33 -0700 (PDT)
X-Received: by 2002:a05:7300:fd16:b0:2c4:d01f:6ef7 with SMTP id 5a478bee46e88-2cbfa4c41f2mr14169732eec.13.1775724752976;
        Thu, 09 Apr 2026 01:52:32 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d460c8e9a5sm2312889eec.17.2026.04.09.01.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 01:52:32 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 01:52:24 -0700
Subject: [PATCH v5 1/5] dt-bindings: remoteproc: qcom: cleanup
 qcom,adsp.yaml
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-knp-soccp-v5-1-805a492124da@oss.qualcomm.com>
References: <20260409-knp-soccp-v5-0-805a492124da@oss.qualcomm.com>
In-Reply-To: <20260409-knp-soccp-v5-0-805a492124da@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775724750; l=2807;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=/AyXfvDgL6xS/1UvCVX17NbhNe6WnF28CEFcPHn4+7w=;
 b=Pb+jPWKDcC45WGJHg9WVboFQh65d7ITa284WAAQJcSvKRDijifM+KPUsCIaFSCxdiZlFTAH6p
 GxqElbILrjPCrYtiVfKgxpJwbIwFOXvyqgr+u07O8ip9UG7nn2N43P3
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: b6GJBpB77xqf166YgQwGUXOnO2k3tKR4
X-Proofpoint-GUID: b6GJBpB77xqf166YgQwGUXOnO2k3tKR4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA3NiBTYWx0ZWRfX47krkFbkv+nL
 PV5vTaatlR43sxM0DZtZx8MbAk/GL8+YPtdH04Hit/cztdL49eeDmv/jJduN2lQNAVJy4AXxObX
 S3lPhANptS1iAF+DHcXZti02d+e56wYLiUX6Nn29NlS7unRQ8yOpm5//h7Oe/7IIkd3CBRxYEQ2
 FX9+8h4aSj4ltc1lIdhu0IV5Pk3HVsgpqvY0sSOBBtWhvhRXd3RTiG61w86HpkxsJUQRUEwqOtS
 dq1iVtezgwrN/gxXq6uwBjSy7oI0a5trNjF+hs19uJ+x7cPr5pHdzF9nw7jSDPRGl8NzLkx2/Rq
 pGJMxjTSP6p0qSmTbE3xlChAX/vBVtNxiiYHtwcO9FFqva9V80B02qGhXaPnrzBBrwpyZAajB+R
 ymTirK8vgBloi/bPj17BQUIabv5kOBnNtFKyqoBd1FC1/TyFodcEKrCWuw0XQRquLc7Kinwxf6Q
 05KAHnA0+hTcaqc9X4A==
X-Authority-Analysis: v=2.4 cv=TZemcxQh c=1 sm=1 tr=0 ts=69d768d2 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VspIq9AKIDY_7iLw7w4A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090076

Items in qcom,adsp.yaml has common clock and interrupt properties, move
these out of the allOf section to avoid list the compatible repeatly.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,adsp.yaml  | 64 +++++-----------------
 1 file changed, 14 insertions(+), 50 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 16a245fe2738..a270834605da 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -32,6 +32,14 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    items:
+      - description: XO clock
+
+  clock-names:
+    items:
+      - const: xo
+
   cx-supply: true
 
   px-supply:
@@ -49,6 +57,12 @@ properties:
     maxItems: 1
     description: Firmware name for the Hexagon core
 
+  interrupts:
+    maxItems: 5
+
+  interrupt-names:
+    maxItems: 5
+
 required:
   - compatible
   - memory-region
@@ -57,56 +71,6 @@ unevaluatedProperties: false
 
 allOf:
   - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,msm8226-adsp-pil
-              - qcom,msm8953-adsp-pil
-              - qcom,msm8974-adsp-pil
-              - qcom,msm8996-adsp-pil
-              - qcom,msm8996-slpi-pil
-              - qcom,msm8998-adsp-pas
-              - qcom,msm8998-slpi-pas
-              - qcom,sdm660-adsp-pas
-              - qcom,sdm660-cdsp-pas
-              - qcom,sdm845-adsp-pas
-              - qcom,sdm845-cdsp-pas
-              - qcom,sdm845-slpi-pas
-    then:
-      properties:
-        clocks:
-          items:
-            - description: XO clock
-        clock-names:
-          items:
-            - const: xo
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,msm8226-adsp-pil
-              - qcom,msm8953-adsp-pil
-              - qcom,msm8974-adsp-pil
-              - qcom,msm8996-adsp-pil
-              - qcom,msm8996-slpi-pil
-              - qcom,msm8998-adsp-pas
-              - qcom,msm8998-slpi-pas
-              - qcom,sdm660-adsp-pas
-              - qcom,sdm660-cdsp-pas
-              - qcom,sdm845-adsp-pas
-              - qcom,sdm845-cdsp-pas
-              - qcom,sdm845-slpi-pas
-    then:
-      properties:
-        interrupts:
-          maxItems: 5
-        interrupt-names:
-          maxItems: 5
-
   - if:
       properties:
         compatible:

-- 
2.34.1

