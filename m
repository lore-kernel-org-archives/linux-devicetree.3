Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD19436B043
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 10:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209141; cv=none; b=G9zXFM2xbKL9xk2LiiVeBeR78x8NRiO3vwBI+bLSwhBZs7BoCDdY7kHITVFDiugi+WNiotE4CuneZxfepu64XRNCe2d1/X4/INMj0u/zK+vjYJgEB8K58s3Eemu1hGLbfIamMcMKd2kh5L0nzV4zOU9sh6fD4szuPJKbymte6zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209141; c=relaxed/simple;
	bh=/AyXfvDgL6xS/1UvCVX17NbhNe6WnF28CEFcPHn4+7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tnjImUJ57lJcbH4dbGdB89AkKUt/lXW6eIZcg1aiKR5U3SJg9e6jJ0JB3gHlTsT2tB3oLMkRrq3RfOyAERjjYGsZ6gUO37IxGhptKjJUUSB7qBcdjBJcork338bbbp4ocjga+hk3zwKpkr4q477/FqxxfdjBRVKUkmpIba+qPno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m4DgDeat; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RnA07xM2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m4DgDeat";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RnA07xM2"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NA58qX4126690
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 10:05:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7T5qiIsx+2dwMKk5877pZ1wxVPnaaufjkpooV0Vvk8M=; b=m4DgDeatgXlwGJKX
	cgzU0Mj3MKNi3z2S7XCkDU3Ip9i1B+/emvWAIoNXRlF4XLH5UAQAYDo0qs5ZCB/S
	Jqr3Xs/uLZShgSIDVgvSrXKt7/q7u9u2tQ0Z8BniENJqeeV6LUmdbgo1Ise4hIZQ
	myqLJlIGFod6E1KwBEHwJYciNjjueBy35nA0QlAiC4L+Mdm76o8TZHm8coTqoICU
	C34/qiBfDAaCe/MWRiBtXQ4sOArXk6uloGnaSOqQNik2sUXV4+RDKNBMR9Byr10b
	P/OAZlbWdAlYmPUb6B0c7M/g7ycuOAKrlAE7sHGbzLyrlwn1Ae0bO0JwqHBOVGOd
	t4QG4Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr320067-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 10:05:38 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bccca5620so7486913eec.1
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 03:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782209138; x=1782813938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7T5qiIsx+2dwMKk5877pZ1wxVPnaaufjkpooV0Vvk8M=;
        b=RnA07xM2o6hSLpvZVhm59V3WVlR+uLBarseffIP7VdlnIGlSdkpsUSt0Nwgm3WCr1+
         hQH+Croj77KoeKmot4nnqSoE9ANkai6UhNg1c1gdPp4slkkMg0S4YsTorkcoMQHLk/rL
         ebmp+wQ82PTnYJeT3WtrrtXeLr3iOgH4KnFzTz5/Oaa6aifwnKmfDnBWvyDK4dbsGbej
         9nMP3FFWWosMpWhDN2NmG/P44UYol57xJtlseID+mVGP5bC11my/AZS6LnaLiYSuY99g
         mAMUREcisAylmwL66P6OuCx9hRVzsLe6dxcsFGYAdRkax1ASTUkf4K1QTrYpGcKojOdG
         m6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782209138; x=1782813938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7T5qiIsx+2dwMKk5877pZ1wxVPnaaufjkpooV0Vvk8M=;
        b=sJ7iFnTxj5biaXwuZxPNu56I5J2BHvKf/7G/LoymhPio4C+W81Pkq7xNh2T9TqeAj8
         rZP5Dz/zED6pc/qRndAUVbMUQhjc0xOCgRup8S07oVU+BCleQO2lnTSu5tiBp0PBNWx9
         qhesaQbq+FdGT1i8jWVT5nq3YvCatcIVHMfnJGNytUGrrGq8OhcYaa4CeYJjgh+Sqhpf
         K+5K3C9lPJKlJlilkb5jqrVTH/4UgRRvj6j5QEk53mcdPy0L9O2TYL6nAHECfRDkQaVV
         Zgn6sZPPKC+vTghq64diaBKmHuBxzfaXHQDMXJF5qOHcssssvsK69EPdyfN0fkTIHCuy
         0roA==
X-Forwarded-Encrypted: i=1; AFNElJ8U/bJTujygbHtjz+c3ksw+yOM7DpGOeGVWhXLfTsZYe0v4iByIuVRtDOtOeiv5bBlfWwNepRXxdKZe@vger.kernel.org
X-Gm-Message-State: AOJu0YyaxKLa5KEHnWzZSvdlWeqQVENJNHMlCwzOeQolwItI4SOb3/S7
	K45Ou2doGQA6AS7p5hogALANE+N0ZeAbxZnFOKA3kaeEiByTvAYbQy7FO+jYpJVJl80Y2SUP4KC
	y8JIvwrzI+/HByV0lVtXNVkX22cgne/r/kpn4iV1OgtUZgzI0Hhd31G5uIEfXTjEw
X-Gm-Gg: AfdE7cljcRl9bhJUV72fZ+FrxEluyA0JuEdCizmVz/U1oA6lc0XYoh1SrxKnU1Eu3Ot
	BaER6/ovNfxKSgkInM3kYIcgIhRNlSKrvMIShsaWJPXdWrnT2NdqDASI24dq6pUlcXWbANCI2VG
	B/Nm4oBq/p/Pf4TxAN0utT2kyQEOn7FyO5OBB3bkpoOpkQ6eHY5943QOtTThDloyPFjpyPrI4ZK
	yVI9awap1zIbjOwDuJch4k0g3wdom1tfrcP0bjH2f7U/aSa0GOwuW+SWWRoShSWV2YF8Qqtm/nn
	XnXBQ6a4myVId8unZJUb4rYDUcwPxVOXmbLD7Kk0nHJiQok2c2yidXlctslWD3axnUiTpBffz/X
	vfp6eUBNNz5n3R9j6p+p/CcXaL1LflkYuZy0+1rCB8Q4JKl2XUQxt3Div2GLruA==
X-Received: by 2002:a05:7022:6093:b0:138:6027:b768 with SMTP id a92af1059eb24-139a3880c01mr11720693c88.27.1782209137644;
        Tue, 23 Jun 2026 03:05:37 -0700 (PDT)
X-Received: by 2002:a05:7022:6093:b0:138:6027:b768 with SMTP id a92af1059eb24-139a3880c01mr11720674c88.27.1782209137153;
        Tue, 23 Jun 2026 03:05:37 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139add5824csm11607495c88.10.2026.06.23.03.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 03:05:36 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 03:05:17 -0700
Subject: [PATCH v7 1/6] dt-bindings: remoteproc: qcom: cleanup
 qcom,adsp.yaml
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-knp-soccp-v7-1-1ec7bb5c9fec@oss.qualcomm.com>
References: <20260623-knp-soccp-v7-0-1ec7bb5c9fec@oss.qualcomm.com>
In-Reply-To: <20260623-knp-soccp-v7-0-1ec7bb5c9fec@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782209135; l=2807;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=/AyXfvDgL6xS/1UvCVX17NbhNe6WnF28CEFcPHn4+7w=;
 b=7xdpDTCpx2iK7E3J6J2bs0WvfqwcdzG+erfMrjBxniPOikOuzIlJnHnStAJvqXKbmxanC3C5j
 wKRkUSg8lyYBwTjM4Vllbuw0ajwBPgji20LmcA8HjQESh2Wz8/7FvgW
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4MSBTYWx0ZWRfX+b/HRPzwIa0N
 MK8e6XvufjcIdn2hnjW9HsDIHclqaJiskV45MCYAG9QnY8VMhupat134BZmt9Kg8ncDeLouvU8y
 UHiG/JKYAKTeYEgxIOmvpk/FqiIVxew=
X-Proofpoint-ORIG-GUID: RIdx-XxwyUKOKSi46fsKI_AISyrG1C7z
X-Authority-Analysis: v=2.4 cv=HrxG3UTS c=1 sm=1 tr=0 ts=6a3a5a72 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VspIq9AKIDY_7iLw7w4A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4MSBTYWx0ZWRfX5GG5VlQRYXHt
 ai2aF/UMF/j18mPY1UnFWWvMfvfRt1HktubXMQWWwZfbviD2/ehbq5oSMY23Zxya7fjL+6VSXx7
 Gree5Wnk2X3pw6sP4u1IUpa5pVUbsSnLnWXca5Sui724o/yN79wEdkwL0x5ut5klPo72MNSiToy
 DLsu3AAK8oWF5QS6ylNUpt3pWFgPrua/KzYQntdPrQDubQoZ3PkNPm2j6lAnxkkv0Tzl47OXhPq
 +LmwhDDxqzt1NRkYmx6t4luKsncWViuye3F+TB/DAq6BZd7j45E7XLPD+zsQ/4eKyom1XVuYEX+
 We1u5BHJNAoWEO8hjckUGd+VWXCPE/4olNIfu4/6bhvSLnhThM7rCBf/RcANdf7497DAUJXRsyq
 If4FjhXpRq264U9Kc17TAcDq4qxV+NQ6QwAK9+kkd1JRpc2wtreqoOoqoYRAfywSPi0pi9BBXSC
 ezL3UCXV2lTKOWW4tIQ==
X-Proofpoint-GUID: RIdx-XxwyUKOKSi46fsKI_AISyrG1C7z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230081

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

