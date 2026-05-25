Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BCC3E9C06
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779705991; cv=none; b=D4/Ol1bv8ma2z7PQFp+1wj0sttcA/2RhjAU5TlxfO0qM8eaTtp6ZtqHY1f2rKN7kBcBDs/UgQIuzwgahxgz/KhrQQlL4Kxr0tbc/sromJioWqSXamfE9fLwNpnySnz1U5SrsAc7HKGHhsoNZT8jIg3b7A1O+zhDjlg7RsOx4trs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779705991; c=relaxed/simple;
	bh=41QQEsNriEBz6yXk/FYaQ9SbHf1IVwArxBrG16YlvOk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AgFkRSChpOdcD6LSITms+797Jeq1RS9V5EVRuQc9JTh2vyAl/F1IkfFHbcedQPEWuI0E03ok01vCLzuQY4GQYqceIbOul8w/aPwRSuampkZ3Ewb643NYO576s34aj2o0GGJ724JjDJI5+Gaebdc0y8cepvJJ1BQifXvMFfqlWXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hyujLfCl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hqp2rLuX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hyujLfCl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hqp2rLuX"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7hGgq1588803
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:46:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2FDYCVYSqplVLXvPyGm2q7sANsvd9yoUscKzKGF/D/E=; b=hyujLfCl+/Vz1yng
	AFNgFf2wEJWfZp9aFWHwcwlwSswmQv17YNi5t/Vm+gEwzFN4h+pdHGCbwCIdg3J+
	9axuVT/NuLlIFaqZ3Q9c1VyBqeSyZmgsdFNCR2solExGuVsH0PQhfQLLMurY13sG
	FxefoQYHKLKo1L4xNY1xbJ2hp6eU2OnmhGqmXelmrPZBaJxgMSPmgRsj9lDM8kXX
	IM+nHRnZD6Ojm21sMIHDgVBOAJduFByFgybaxPBDaDlna83pLsZO2BkFRIwrttZV
	MW0xJfzq8oFfp+Q7iKiHU6lvOfUUnUQltWnDl0UDTWPcbGtBHxwFRcl3xa8IOBOu
	/8vPFA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb3txpb0e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:46:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2e8bba2e6so128144335ad.1
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 03:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779705987; x=1780310787; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2FDYCVYSqplVLXvPyGm2q7sANsvd9yoUscKzKGF/D/E=;
        b=Hqp2rLuXMXMycYXH9I0phcaMOa+PAeCI9gLu0GhjZtC60v6imQAHAzdKuCT+ViFJAE
         5NR16HcjZAQ/vovZt7pj52ors7nVzSFx3Fv5LSWpfxwNBSPt9w98X2N2HvBqE+qb6F+b
         dL4mhQDpMFcGtZiUIi4rKPrqP16/1mNY6cxHmeIYL/9rnLxVW0gZOXcF+KNcoO5LD0o6
         ruGKqQUzzAVxKwuD+M+XhfGZFgljeRGM78caEnHQh2xxrcCqoHL5KDG6y8NetX3O32EW
         JDKpKSFt5MIeSHZC9sjLAuFYd2oJw/aSiquVn8l0fSPvNuyx3gG0In411ZlbdSgU3bkz
         8VbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779705987; x=1780310787;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2FDYCVYSqplVLXvPyGm2q7sANsvd9yoUscKzKGF/D/E=;
        b=AI5zBnR1YYkM+eKAQsihPLi0zlpFHLyfRG2X9YzKIeDu7Cy1rd2lyWDOwUcpO5yaWK
         //v8DzWxQ6GOUMGPMw4q3orj/x7Fw/AVRxlW1A5a6hKRwCC42x14DVTsXMaokOVTIN+I
         CvQuuwZJJnJcYtd9mI5XlrCKTIchs8Lyz+IEkoTV+YggE7IxbqWb/YHKVWRBqcL/Z8ba
         NKuBa59rJTmacR02FUJEyIi71M+RoXos7oFpgFfbzhIV66rfkFqo0w/2/gHLN5ldX++v
         FN+8KH83ryzj+qiU9yywRdCCNJt49LG5I2osFhYYhatON2Z6tkF2POkEkh+EQRMIwcqY
         QnXw==
X-Forwarded-Encrypted: i=1; AFNElJ9eUnEm0ZW1O70iGhNefO/ghjD7CGPMmi9aocsI+xRCT7jhy26AhKYxZNp0FYwwKf2/7QrPWt11kHY6@vger.kernel.org
X-Gm-Message-State: AOJu0YxOxl2eNFCrvXz0onq9YTt4XS61gCyCRVeJaacxc3GmiYKhCJxl
	cALb3ulqjj4yngXpgal4mM0BRxlEiY4y6SBJ5cM1xIm1gWbuM8rGR6qTZXVjXpFmiamCRpGK37Z
	zmmVBUYW9cdILphmXuvKyhixM0DKqugi3aFvJ74bu5aaEOb0A7+oJS0fYQxq3TNwf
X-Gm-Gg: Acq92OGD8HAWC9u4u7hyHd1+vzImLbdFa39psE9dT0UfuqoWQDoVntPCKLtRJkuhIKt
	24TUdpLu1iFSsMf6GA1BK0gtybFrkoCBQwua+hiZRV4CG9fbbk9mnhm2lotwOLK1jftp8gz/b3n
	1hmfaMlTarVfKcLLtdCYJPT2Bop/bnbb+5UvGM5IqO6/hC5qGXi1flUSEcwVsFgJa7yYb90eiyU
	iVdxBX1W89M9Sgh04x86DwpN2y7rQoLzKwaiB455tIFKlpAARzsdNsc27Pef3FE8wo3eIqWrnZB
	WFgIcdhQr5gCWjhzWwZ1GeJuYPcBB2i7RBsb1jvcWAVky2pS2ErwE4KYpwmaMqDpKa+nk+G1TLS
	MtapIwVmn/RPCftM1Uf14IjuUFA4XwFBgIBaVdRFX0qBDDA==
X-Received: by 2002:a17:902:da89:b0:2b0:c59f:3b58 with SMTP id d9443c01a7336-2beb06552d6mr168809955ad.9.1779705986960;
        Mon, 25 May 2026 03:46:26 -0700 (PDT)
X-Received: by 2002:a17:902:da89:b0:2b0:c59f:3b58 with SMTP id d9443c01a7336-2beb06552d6mr168809375ad.9.1779705986325;
        Mon, 25 May 2026 03:46:26 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb591f63dsm118666175ad.83.2026.05.25.03.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 03:46:25 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 25 May 2026 16:16:04 +0530
Subject: [PATCH v5 2/7] dt-bindings: clock: qcom: document the Eliza GPU
 Clock Controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-eliza_mm_cc_v2-v5-2-a1d125619a5a@oss.qualcomm.com>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
In-Reply-To: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEwOSBTYWx0ZWRfX1BTjmlSuPOU5
 SFposvXneBwiOKIQ4r0Z2KhP3CqO/mCBj56I+NPF7LBG9iUo+TjD4Y5uNkp0Y3RyzCFxoP/TNHm
 +0IMTLRUAg0VwSG01JhwkFZTi1z/djGZKT/tkxhzP+9J993/ezESnFNQusrtlOmjsyaYkVPjgaG
 8jYsQTAisaRAGZCGho30BwY9uzuh5pEWqJ/p8wKpS3xyvyIvQMzRRWTm+2KsL8g8Xq2i+0VOHDZ
 SNZKFZ66b/I622NYwOp5cMr4jX+cwuyrMWbfxchkWNBKFbWG+1fMXCIv3pezxATMZtihOzA4jQy
 P77DyDHkwQfxNGpYcQ8WHpLdiUJP8WMOfnOJX7air8MBeEqughdEk5bEygHvMdDyyA9Qk8ZrQ3I
 BEV3o0T41qg7LaXCX83+YdQPyfw7vSO6fBkuXSA8OWSdxymUCa1StdiufkGqacthZl7SxD0AUok
 d/GtpJejnPpB666Xi0w==
X-Proofpoint-GUID: xubzDsy-x8CIqj09sT_Wn_f2VYKrgqj6
X-Proofpoint-ORIG-GUID: xubzDsy-x8CIqj09sT_Wn_f2VYKrgqj6
X-Authority-Analysis: v=2.4 cv=MetcfZ/f c=1 sm=1 tr=0 ts=6a142884 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=eqSiwPykCNIpSPSkj8oA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250109

Add bindings documentation for the Eliza Graphics Clock Controller.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |  3 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       | 51 ++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
index fdbdf605ee695637512ce4f98c9b6fcfacb9154f..734bab762a30800bda94c726f48013679f9ec542 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
@@ -15,6 +15,7 @@ description: |
   domains on Qualcomm SoCs.
 
   See also:
+    include/dt-bindings/clock/qcom,eliza-gpucc.h
     include/dt-bindings/clock/qcom,glymur-gpucc.h
     include/dt-bindings/clock/qcom,kaanapali-gpucc.h
     include/dt-bindings/clock/qcom,milos-gpucc.h
@@ -30,6 +31,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,eliza-gpucc
       - qcom,glymur-gpucc
       - qcom,kaanapali-gpucc
       - qcom,milos-gpucc
@@ -71,6 +73,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,eliza-gpucc
               - qcom,sm8750-gpucc
     then:
       required:
diff --git a/include/dt-bindings/clock/qcom,eliza-gpucc.h b/include/dt-bindings/clock/qcom,eliza-gpucc.h
new file mode 100644
index 0000000000000000000000000000000000000000..c3d9b7827325c5b8db696d1d95b4876e17c01c83
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-gpucc.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_ELIZA_H
+
+/* GPU_CC clocks */
+#define GPU_CC_AHB_CLK						0
+#define GPU_CC_CRC_AHB_CLK					1
+#define GPU_CC_CX_ACCU_SHIFT_CLK				2
+#define GPU_CC_CX_FF_CLK					3
+#define GPU_CC_CX_GMU_CLK					4
+#define GPU_CC_CXO_AON_CLK					5
+#define GPU_CC_CXO_CLK						6
+#define GPU_CC_DEMET_CLK					7
+#define GPU_CC_DEMET_DIV_CLK_SRC				8
+#define GPU_CC_FF_CLK_SRC					9
+#define GPU_CC_FREQ_MEASURE_CLK					10
+#define GPU_CC_GMU_CLK_SRC					11
+#define GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK				12
+#define GPU_CC_HUB_AON_CLK					13
+#define GPU_CC_HUB_CLK_SRC					14
+#define GPU_CC_HUB_CX_INT_CLK					15
+#define GPU_CC_MEMNOC_GFX_CLK					16
+#define GPU_CC_MND1X_0_GFX3D_CLK				17
+#define GPU_CC_MND1X_1_GFX3D_CLK				18
+#define GPU_CC_PLL0						19
+#define GPU_CC_PLL1						20
+#define GPU_CC_SLEEP_CLK					21
+#define GPU_CC_XO_CLK_SRC					22
+#define GPU_CC_XO_DIV_CLK_SRC					23
+
+/* GPU_CC power domains */
+#define GPU_CC_CX_GDSC						0
+#define GPU_CC_GX_GDSC						1
+
+/* GPU_CC resets */
+#define GPU_CC_ACD_BCR						0
+#define GPU_CC_CB_BCR						1
+#define GPU_CC_CX_BCR						2
+#define GPU_CC_FAST_HUB_BCR					3
+#define GPU_CC_FF_BCR						4
+#define GPU_CC_GFX3D_AON_BCR					5
+#define GPU_CC_GMU_BCR						6
+#define GPU_CC_GX_BCR						7
+#define GPU_CC_RBCPR_BCR					8
+#define GPU_CC_XO_BCR						9
+
+#endif

-- 
2.34.1

