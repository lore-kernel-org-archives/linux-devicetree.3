Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81C038E120
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 10:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777888827; cv=none; b=S+i1ExjNxz4uKv8WQOtYKq+3M0k6MOQWJGZwRgeXAKkGdPeaV5DyXrUeib6nVvc2BiuUo63TXSH8E+vPfC/jMc++g6g49e6El/PwA1DELujl1WmpfFu60dOGipYYk2ctcjxHJOFHxKfBcfoH1IGqvK/w+KafSY/O0wJgnl1GtGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777888827; c=relaxed/simple;
	bh=6/Iy5kkgiDFD16hOKi/Kf/Di/bK0BuO/Zg8iKPfSReU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=csgsKq6O1utOEcUpkRrxclY+58+UKyRlOqDGEbJ6gHOLzzhmqrBfASFffe/GU9qcdZK6p6rzT45TtRT2QjwATtJ9ihRLnS9UzXn1vjVOyxNhB/GtxQ3Po5+E/Yadyl0A9eL7XD+TYgQEHPou+CWIegFa/9+YVXOuT4fs/dckY08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=byhWmiCG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dxbnZNaN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="byhWmiCG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dxbnZNaN"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6448fS3d2539178
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 10:00:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iJ0q+BsBMSefHqR+UyMZLu13VRsLLve25e2t8/zYFpQ=; b=byhWmiCGE58UiSSX
	/8hkvyfSy+9fpLARovfnkrJR1+hYYZe4Z91C5IpybB1pMBToYAhvw5Ay1YpU0DTM
	bBqAlXJmc8KpQWmU+V+Vo7A+M7fnFa3gnnhbvMvw6hF/n+0rWedlc6yBjFG3Zqt2
	I4fCJQKgrV6YA2YjlKLnFsxcXZkQkpGo4ruB4SuBrK+bsYcJvfuL3XlrrD0Nd7wZ
	zmgp1luCNT0xaACmBUxMfXxocYt4p65Rg87rhSMxmcJK5vd8GJaLzHHniitwR7/3
	r9tju7cN1TW3QV3uNQpWrEbVqv+FOgk03aavg3yzI6nf6tWgy9Y3mjcWpPhnxgz3
	EoUGsQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dwxk1b207-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 10:00:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50e575a50bcso52284981cf.0
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 03:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777888824; x=1778493624; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iJ0q+BsBMSefHqR+UyMZLu13VRsLLve25e2t8/zYFpQ=;
        b=dxbnZNaN8ol3wJlgrLYa4tjf0J2F6OrLn3P5QyO8/maQNjr2t83YsfcmSfThrCSPc7
         2Cnr6oFGgawGgWay28LMnOPaFU+V8bXoPY8/IpVmfUFsVweuV3lu1OhfK7HbRZKSTXcD
         Y2XMMyupbd9MXpI8hOBAk98kkhZEFaw13r9K5Run1zmRH/XtdFV0r2tgksZUl+NLVWQb
         Bo2y0uGJ5AGvr4RcsGQ1FjAzBiF6W7OsEMg824A/jMbGMQ40SICx0WwXKsBcomNQTkbp
         zeK1gErpT9TdBGJCqFj3B2TiY5YtWo/ZpjDJ+OPili/hzXfQ8HqHpKKHKDJYR8BirnMO
         aD8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777888824; x=1778493624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iJ0q+BsBMSefHqR+UyMZLu13VRsLLve25e2t8/zYFpQ=;
        b=pthsBY6tfrEebm98N/TNeOkYtzCFtmiP8X6XwK4JPm9jBWHfmckxYbGz5anSJuxuVO
         PbbEWz3czyATL0R4GFC339Im+qSzXl4vqzVdxKosgsR1rFZTvr13XbHSzgLdH2H7qqoZ
         oz2usx2i7beBXF//V5iKDqwgeW+P06nSod5FmNIoDI4kG96GLXn/+4AbVL3heWceP4Pt
         zQBplEvW5fqJrq5tvivxxAM/y7PQ9QMcFu121U9K5dNPnL8V2yOvtomH1M72kksjU4mR
         1hr+RLPVxVJWa7R5N7q2BE59XvViRCbpoXFBChxpiKq/AoT63yfMw21gPJBSav5fz2pp
         mO5w==
X-Forwarded-Encrypted: i=1; AFNElJ+R//cTSw7bu39YDx6MoVccwFySVaC5Z1FK1Ov5whwTrbW0qnWsGdWhroaJQX7FT4PvscuUwCyQ91HT@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+IaafApdhAVl0+0m5gEiptMDSbNIkxUFOH4sKV0WNiKAMmZ8G
	zALZLyHuho5BDHmGo7T16CDfn4fAJUeZ+UXnhwu6X91XuS+axRqu/jcDFNM4xqSvFuI7DC9e6Zq
	Q+o9/gORuJ17eXUJ+VWmo5Itk/E/il/UKcvqYwZ+CGvZHnAHBg7RG2DSqK72+N36w
X-Gm-Gg: AeBDiesMeFP+zttFNedgtRUUiV13/+P8jEvte22v1PqxCSg1GDegQyakLrDs6RfWCp4
	u+KKuEm6T0vC7NuWe3ig4moeYFcbSlGQ1N1xA0U4xqP+6LHi+oziY4lQewv9sAbpFQJ+r5Vo6Gq
	JnXCkF/5v98Yj5Xnd1Q26Lslg3Qh7yLcREcoPCDGZQ+C6N5QAACLdEFr7q5Huuo24HdUpPgozQu
	M+pLOfRy6CfmMpeCsNg23RmXHAFq0WG82p5PWdRryALPUz2iPU1W9FLMqqAI8N13E1ralq5CLDq
	30RMyD3P0uBam73LGdqI5aVqXdB/nmPnsTNGw+ihOShibmCBdKYhQCgtrf03DZKwhmtA/8HHsub
	ALZJRUKxwBo0HMT2/wfvILR4xYDQfdXAOq4d+P4m5
X-Received: by 2002:a05:622a:1648:b0:50e:60b7:bb48 with SMTP id d75a77b69052e-5104be8a537mr136719211cf.18.1777888823363;
        Mon, 04 May 2026 03:00:23 -0700 (PDT)
X-Received: by 2002:a05:622a:1648:b0:50e:60b7:bb48 with SMTP id d75a77b69052e-5104be8a537mr136717541cf.18.1777888822117;
        Mon, 04 May 2026 03:00:22 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82307f7csm324355955e9.12.2026.05.04.03.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:00:20 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 04 May 2026 13:00:07 +0300
Subject: [PATCH 1/2] dt-bindings: cache: qcom,llcc: Document Eliza LLCC
 block
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-eliza-llcc-v1-1-d7006c899812@oss.qualcomm.com>
References: <20260504-eliza-llcc-v1-0-d7006c899812@oss.qualcomm.com>
In-Reply-To: <20260504-eliza-llcc-v1-0-d7006c899812@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1641;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=6/Iy5kkgiDFD16hOKi/Kf/Di/bK0BuO/Zg8iKPfSReU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBp+G4w+saXMIInImzTSdiaBkOY77pQBwtLgo4zE
 L8KPJAft5SJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCafhuMAAKCRAbX0TJAJUV
 VkSmD/9JNGdd9hlYuPK5seOdRUw9D3e+kfq7Z5r5ehqQerDcyN7VqHmB59xSRDvlIXWv64aIaea
 iBCjQfDT9rwXqnSqR8sF/5DzLHjg2QO1RNpzsZSEqivn+iwVE0/qsIA3Xb0XRY0q4XFg/1teh5v
 LmgycaH51uFeneKcLgX3r2klCaCoLFiJ+o1Uf5gaZhFBX/eAMQIgBRnWrnVUXIDZwdUv9Bp6br2
 EIy/J40AidD1A01IZDjdbt7PFX84AUG9V3MeQhBIJTSVF9eqTk2HzKWJmDOVo5uZTBVUdPeNRvN
 ROj286zIbTAjH5S9qsjyV8L2vozam+SSHO2LQ28DRosOaY4l8ljLHLU0KBe8iRIMT79kIktHZi4
 +Z/Y+B1gHKgflmFEoGXWZC2Qa7ub2zzgYBGFHq+eQwbQ1x8YG7jwBOMRyupjQTqHDOHOCH7vFZs
 ZHfQJjXX1l0XGdI4sjdrXKQMg9ki9I5k3FPim8POsZhYzc/JybGDBiv7rMZHxLR0mIfh9L9DgQy
 Wry2EzsCE4wYfyN790i1mzMKUhgGW9kJiVa5IHNKYB9ibmadCXCmntgd4lkl3wILfceEnEy9fMP
 Y951inar12KW604qggQojjMaXeqLspk9jmSmlv06F9yZ7xk9/MXGuA/yyRvi7D0Xmj8z+enS5Su
 Mttmbtwwu8KZ4sA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDEwNSBTYWx0ZWRfX5SL99Uj9GAaq
 BghzssLRAALvssJbtxSNvBBBtGCYDpbirN7mXz37a7zKcu8yiCecKJaQ0R0COsiKEWUPrja4r7j
 wHUeGiLasO7BwqG40CwbYtYx+pnYqDxvRmvJPWQrKQkHbGTiDSzAhM52jOzJdDG1wmJuBgM0s5t
 oy/ycw/I2m5XyW5CPuh3zRP9tB7QAmDUan0K9UkgRcTKz6Zs5aHMezpYCgzlNQ2CdTN7V6s/NsV
 iJlK15UkeSKxISpg87pYf2Phi2bn2aWtY2Yy9PmdejcmfmErGFP2G4x5BWvF0y/k29IOxQs64Mt
 OxJA0Y56SeuiVXJeFv7cpFkFkPKV+HcPOiBH0UcncqBHy5F+TuSm3f3uJvgmtO8jNXfnzg16gb+
 mdvo6bzL75hvw5+LAwc3g5bCpEOj/lpSsXatW37g6r9rRDQG9Xzu0xdu5JXZzefmtFvhINuGfTh
 8ALB1eYz2m216YvUrvg==
X-Proofpoint-GUID: NJVmHjFFNF6aUrMKGCw6QSbeadw0ngpB
X-Authority-Analysis: v=2.4 cv=bb5bluPB c=1 sm=1 tr=0 ts=69f86e38 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=rhu6fYff1SmOIWjBxU0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: NJVmHjFFNF6aUrMKGCw6QSbeadw0ngpB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040105

Document the Last Level Cache Controller on Eliza SoC. Eliza LLCC has 2
base register regions and an additional AND, OR broadcast region, total 4
register regions.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../devicetree/bindings/cache/qcom,llcc.yaml       | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index 995d57815781..90f5a54b76e3 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -20,6 +20,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,eliza-llcc
       - qcom,glymur-llcc
       - qcom,ipq5424-llcc
       - qcom,kaanapali-llcc
@@ -341,6 +342,27 @@ allOf:
             - const: llcc_broadcast_base
             - const: llcc_broadcast_and_base
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,eliza-llcc
+    then:
+      properties:
+        reg:
+          items:
+            - description: LLCC0 base register region
+            - description: LLCC2 base register region
+            - description: LLCC broadcast OR register region
+            - description: LLCC broadcast AND register region
+        reg-names:
+          items:
+            - const: llcc0_base
+            - const: llcc2_base
+            - const: llcc_broadcast_base
+            - const: llcc_broadcast_and_base
+
 additionalProperties: false
 
 examples:

-- 
2.54.0

