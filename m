Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517023AA4F3
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 15:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781017400; cv=none; b=s6hV3vp1B834OHdmnIKQ2Uz9XJPPurYv6MI6Kzz7IRaue70ntE339WAL7wCO9aN9caZgGoW7nf97fhn+xNHALoNQZbNoJepeX7d/eRIS7vgisxSOmSewhw9g7vRg/lhbbjs2JFPnZz2PXpAi9rENeIk58pDCQdnJ+sTHX3F7IAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781017400; c=relaxed/simple;
	bh=8L5vYnes7RR9pjKzHTGOJ9KFnzCMRB0Ccsm4tviOof8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K8YtpbEay2CJ8lGQnd864eiqqsaU0SQVW0Eivl7956XdEmL5YqKGhpUZkuYFt/eFOUSf4+fISiWIeG9w+oekwwG+N/Q+uWVu8GgMgapmi/UTE9yYPndiVJ6V0uBdyL2/TTa72i0uQ8jSRndgd7W4BuDCbH7Tm3OIq4z2wabdQKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IcVwrW9o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I6nYiIoS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IcVwrW9o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I6nYiIoS"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClaAV2706270
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 15:03:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6VA02CrdopqkVJ+OxTePh/p8WTcJpa5AIIK2SzS983k=; b=IcVwrW9o+NfapYtv
	CIAduC32ao1/tkLzpvjHCzTlXH1LQoIDE2Kir3Y/F2/ruJFFTJCVaGVzPIc+bMNt
	mTDc9YqfKZygjfDv6dRHAEUN5sOcGsiifl6Cc9hgm1oyPivNdWaWEofrdmc5SzMA
	dRmcY/ACmZeYKnFc9v8NuZ5uxiS2IoT/1m2v6jKoHgVHq9QFpO8IquibhlV4oRNt
	i9rovs3QjjDPCAANZG/gyJ1A9+rqPjt/7phkFPkarTL1inAF8cPeKjKNcb9XScS7
	ZNShJaAGC37mxHklK8aiGIIQXKUWz2VkDpDbN7vToIBNi0iuTVQq5LD6F6R1aRP/
	djV17A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epfdt1u8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 15:03:18 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8422382178bso3803244b3a.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 08:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781017397; x=1781622197; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6VA02CrdopqkVJ+OxTePh/p8WTcJpa5AIIK2SzS983k=;
        b=I6nYiIoSpW5as6KTFcDQmQUYs0qqjmtDlN2Zphn7dbAJ2CaZNQSCcRE4MsQtbfxUWr
         tnA3ZMpQFz80yzVD2aU+Mn+eW+HC9nMhEVZYTn0tYw+BNltvuy//GsRXVQJsBolFvSOx
         WHjgK8CTjYqcZLHflECFME/nZ9IOJXJWdEA4eVf3N2GMZhi3R8fgvhfMQ2HKoX9zw9zW
         XtrSRZi4kc/01DJJ3UAOAKnFgSeOHoOMfzaS3SpL2AxZP0eoOj7GLCYrJJKayCq97AT0
         Dtjxs7Nfjnd9YfWmp+UIhK9Dr95XOHNJ64MvhJl/aYBbn+KfK4+oah9IaQ9dieqBgHFM
         kKQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781017397; x=1781622197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6VA02CrdopqkVJ+OxTePh/p8WTcJpa5AIIK2SzS983k=;
        b=D0rTFNrGOuecZRid4OiP3wBJzh/cSRAAm2H/expeSskfylsj083V5S+VFZav1vLpXf
         OSgJAsIFnI+TitiiUbvZFaaGPqrLHegOa9wxwFawExgSBfrvqY1yQK7mzWCGwSr6shYD
         alJtiocmcEI5Ua4ETSwhNJ2J0KJnrEdSQVtTsyjniFcpQICKNzkp75Y2WrkVcph59h03
         P01S/ZdwwVRw8bc/7MnMtgXVXj6e0pdDDlbNDeLlnsSUKVGAer3WijL9CKS5hvtVaqRw
         RRLDDPLTAnHmB3b0ggdCOs4n8sIhEM0T951TV8QtlnSTWOR86WRCodNe2F1yfY8EvIW8
         /A5Q==
X-Forwarded-Encrypted: i=1; AFNElJ8ob03MCeut3UvI6gIDfYlOtxqT8vhHBwu7H3gzsR8E4fFg1rw3+vlOGi9enI5MTrRYUA34fQo3nDyh@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/Gk6U9JVQcCfAm/3woAPFOXyiL9ZRSEE2g5mcbX63QNfYYFvx
	VBO6iPrR2Y3pG0bpUDxBLMfUCIVGikRt74Z1hihHPv+A9xuqkMeMNV31JoXDOH9b2cuOtEfNsGI
	ZkM1ENqf0vueWZStp2j8sP5DfOvDq0LHE9lk4bzO4jNUi/i42GmYsXO/iL8p/u+pW
X-Gm-Gg: Acq92OHSUNTx0zYzl9+gp4qR1/iro4YeVXy8/semdJ5LB8jCog6wWIXokMxxUNEPrua
	gUHhGRXw0A5H0HgN5Fan8CWc1D8z/LuHdZkU3YaZq3PtDO3zwX/tz6qvKrMR1wWcP/S3h5hFa5h
	x+mGyVAc4p9AsiyW7xn9ml1fzrlmX0DKX2NYHoaLlPI5loTEiBLXljte8oMX0zxiEFRVeFMNeH/
	tk2KNrI1qbGssIb430778M9OGARGgo+C3DBUJFstcv/C6o5n5Nc18r/L3odh77RYm9n4OC/KsF0
	VcSs7WfM4x1UGGX/bEpzen8aWvtBCKqd8yHv5E55GOgfQ+GdYFoTrmFV3Uiw5SrztSLmeNQsL3m
	qQEQkriE/lhA0OxGfnoxw/ge48xqJBVnHKt7fQPkSdutp4RirwbF9XVAI
X-Received: by 2002:a05:6a00:90a7:b0:842:432e:b7ff with SMTP id d2e1a72fcca58-842b0e82357mr21917326b3a.17.1781017396770;
        Tue, 09 Jun 2026 08:03:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:90a7:b0:842:432e:b7ff with SMTP id d2e1a72fcca58-842b0e82357mr21917178b3a.17.1781017395816;
        Tue, 09 Jun 2026 08:03:15 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828d6bd1sm26987659b3a.44.2026.06.09.08.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:03:15 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 20:32:52 +0530
Subject: [PATCH v6 1/7] dt-bindings: clock: qcom: Add video clock
 controller on Qualcomm Eliza SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-b4-eliza_mm_cc_v6-v6-1-17df09e5940c@oss.qualcomm.com>
References: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
In-Reply-To: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: mVh3MbNaK9eOYqtUTfLN0sIn8qWvTrfV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0MyBTYWx0ZWRfXxoMz02mWYmEt
 XuVE/NeF2BnOq6yovTaNKjo7VB880tdVJGAoiw5RuknuFZlsBJijNHDrMlpGiuQN8UyBkFAZhLG
 ODn2uKP8yPJ7f8EYSV4lRS3Nyo5xDwSOsryI1MUH1CALJIzvX/kR75kf6N7nO1ArGUxEtP4MKnK
 3omhaII1x4dc3Q7WyLNMCE60hNCirqKr8Itzb8pFG9YNzci46YodjpBxFaHuGvlIrjd+iY2H7TQ
 ufrHAFdGuQ3cjPmWDDnLSuhOEl+Y6DAnwZt+a+pQaZSu0UA/GCwjHcpV2kT0EC6DmWVYokmzkve
 HOTL80xD6IuLxF5TM4do6u94Gs4qCBQtkXIucbrzBcxqErFKf/OULJk99pTvDWTlgnKCt8sTJco
 w7BGnQewg9KAsJFCeHYd1XqPfxErL91UgceJzycfa2BIvZJA0KS0v8H8mIx/548gIIsedLXKmDt
 3FuFwh1KiHwNgt02lTw==
X-Proofpoint-GUID: mVh3MbNaK9eOYqtUTfLN0sIn8qWvTrfV
X-Authority-Analysis: v=2.4 cv=doTrzVg4 c=1 sm=1 tr=0 ts=6a282b36 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=hPke8q22Y-dA_sy_I1MA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090143

Eliza Video clock controller is on CX and MX rails similar to Milos.
Add compatible string for Eliza video clock controller to the existing
Milos videocc binding and add the dt-bindings header for Eliza.

The video clock controller exposes power domains, so '#power-domain-cells'
must be present in the device node. Add it to the required properties list
to enforce this in binding validation.

There is no ABI breakage and no impact to the existing devices, since the
nodes using this binding already specify the '#power-domain-cells' property
for videocc.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,milos-videocc.yaml         | 10 ++++--
 include/dt-bindings/clock/qcom,eliza-videocc.h     | 37 ++++++++++++++++++++++
 2 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
index 14c31efe1308aadbea61eb7be7e56039a923aec5..c0c9e450b8cda53625b6f6bdb1bdfe5f2bfbee25 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
@@ -8,16 +8,21 @@ title: Qualcomm Video Clock & Reset Controller on Milos
 
 maintainers:
   - Luca Weiss <luca.weiss@fairphone.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
 
 description: |
   Qualcomm video clock control module provides the clocks, resets and power
   domains on Milos.
 
-  See also: include/dt-bindings/clock/qcom,milos-videocc.h
+  See also:
+    include/dt-bindings/clock/qcom,eliza-videocc.h
+    include/dt-bindings/clock/qcom,milos-videocc.h
 
 properties:
   compatible:
-    const: qcom,milos-videocc
+    enum:
+      - qcom,eliza-videocc
+      - qcom,milos-videocc
 
   clocks:
     items:
@@ -29,6 +34,7 @@ properties:
 required:
   - compatible
   - clocks
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
diff --git a/include/dt-bindings/clock/qcom,eliza-videocc.h b/include/dt-bindings/clock/qcom,eliza-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..1e922250a7fae77f5c996208d50ff372b252aa51
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-videocc.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_ELIZA_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_AHB_CLK					0
+#define VIDEO_CC_AHB_CLK_SRC					1
+#define VIDEO_CC_MVS0_CLK					2
+#define VIDEO_CC_MVS0_CLK_SRC					3
+#define VIDEO_CC_MVS0_DIV_CLK_SRC				4
+#define VIDEO_CC_MVS0_SHIFT_CLK					5
+#define VIDEO_CC_MVS0C_CLK					6
+#define VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC				7
+#define VIDEO_CC_MVS0C_SHIFT_CLK				8
+#define VIDEO_CC_PLL0						9
+#define VIDEO_CC_SLEEP_CLK					10
+#define VIDEO_CC_SLEEP_CLK_SRC					11
+#define VIDEO_CC_XO_CLK						12
+#define VIDEO_CC_XO_CLK_SRC					13
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0_GDSC					0
+#define VIDEO_CC_MVS0C_GDSC					1
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_INTERFACE_BCR					0
+#define VIDEO_CC_MVS0_CLK_ARES					1
+#define VIDEO_CC_MVS0_BCR					2
+#define VIDEO_CC_MVS0C_CLK_ARES					3
+#define VIDEO_CC_MVS0C_BCR					4
+#define VIDEO_CC_XO_CLK_ARES					5
+
+#endif

-- 
2.34.1

