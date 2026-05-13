Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF58A413256
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778682219; cv=none; b=fLVFuN5DNL2gaRiCqFmON4SB5kpeldVtt7u7mV8XFb2rgkiEpvKXAueK1wPqMVhgDQEWOh2cJMcWQ0jzXxobO23clN7yCQk3/wFLMTVgx+PDJp5UMnFC3B4lCISKYSYSQHZnoyy2LUR8EQnrcGyO17q8aFIHq1UT8WhFcvmSXmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778682219; c=relaxed/simple;
	bh=4pHAiCPa/I4+70l4WTTxBfo7ZLYJXjIsYdQ2M+8BWJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MO4thhxa2GGUWPn8MBo0fj6qie9+hNW3aX4rx1VS6Ycz32ozD1xLh1/TFNkGwHrO80ePbjBRtCLomOB2GqsfUJ7Mj1bVV5H+vOtIaXnHCRwdXbcSVFrIBGTCCDTHWuotlhGxpPxtI5xtCv74A20aIH+MpS/HPGo2lzYSFwMi0ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T7keGP9P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YR+1j4N4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T7keGP9P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YR+1j4N4"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAVQPc3430275
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:23:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yB6RmntczqRFUMYtWGGfsH29TNbbMgoNZLAW4MMdSzo=; b=T7keGP9PZUy06gHb
	PBF4WB/ZORJ69mjF3HZqt6D7ndoN4RMfXxuvK6ti2/qIf2ElSSt6bsepvRx8WaRD
	l0Qdtq6hhOjDoRAK2DPk5h4nsVJdDqPTPItZGp2ZfRk/N5wQFfiRGuFXAAcJLFIe
	CCqoW+zn5rt+T+Z2IAOTuBD0s8a9AlQGMxznCFrB1DZq5pEZlLDpQ9dYVPNG5Xuh
	sjZZud8RwRANjL+2GM+snCZE5j6YEBpI8TwtRYSwqom5BuMeGSFGG69VvZJd0Hi9
	4SugpZx14bK8ZWGpu3EFkLxxJ4EOZh8PxT23OGSfYOzCdzQykqHPgrEnXLSeZlFg
	Ve2xoA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4qmcgutk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:23:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba224c3ffdso102952955ad.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 07:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778682214; x=1779287014; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yB6RmntczqRFUMYtWGGfsH29TNbbMgoNZLAW4MMdSzo=;
        b=YR+1j4N4wNACbA8UM9w/DlXyehTj/fmgCKvHXRKMGUEbPcVxk+arOJG5JvabmRFynn
         hwWkVQlVZFagqDberzEGTVdeWISMRXaK1qMzZBzIMj9mPq66Rs4imYA0fEr1H7STZYuQ
         sLRD7qaZ2L6rVF3z0puunrxaZ2+w6t5d8q/miQKQ0NnKBm1bMl7EZhVduEA1hTHlmUoG
         oR9GdZhpiNy+nAc9lFPQIIYWrnb/ydDXHr5Gwd1iHuQytckwZUCJpE0ZL+R5+0nYi0Q5
         SQtLZNt2YPBs9mKUoYUYAlTaW/vnsPQ9qOgARsjBrUl8RFBxjT61KufK8aRnBOOKg99D
         WUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778682214; x=1779287014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yB6RmntczqRFUMYtWGGfsH29TNbbMgoNZLAW4MMdSzo=;
        b=lq5R3/07Zd8xwN4BkZcf0wqXtxgi+GrWH71lyuEffShk/KqQom7+8mRUQgKf4RVhpD
         078OY5iv46NrSc4iV40B1NZfckOfGuDx8RSRps5I+wPy2njZZXHWFoA5J197Q3pZmB/N
         S/FfHZqEZWUmTHCnJZfe1hfqkSU3H8doXHH2VmRsRSRetY170F0M4mcxEjj1TBeFd56f
         tlGQ6tuRSnI0QP1zZNXrC7vhlVOUkJdoex2APwil+dYqR7xsmuMvxODs7dRUeRc8l+8n
         e/N2YwGp/z4JHEqiUd3Lhi74RR4AZQo79aEsEVQPpu0DROLm2n3+Dg8GN3dV/bqgznJZ
         xygA==
X-Forwarded-Encrypted: i=1; AFNElJ/DGefXYWkSOJdHI+fgGALnYOp5JDzrt1O3NchRFUsqFMy4rTH8Ggf7r6PS1xwHoMAYlhw91MjEZ/vI@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmt0Jb5qWTuEHjWFN3h0erSleYs5NQT9bjWQdOqtz3sWPRNBSJ
	Bs9O3WanZu/HgKtIZOBi5Z5kcwpBKJqnSGFI1sxEV7tLBR8qlvaGTSqoyexxIMqN65poeRQrFNw
	Qqz7ceki/owy9VFSvy9NB164mZM9zgC6xKcs2Ew2X4fvhW60d3aCJbmpmTawnEHu2
X-Gm-Gg: Acq92OHplnPdpFWEAC+aOEW6NozYBHP0PGV4qbtkWb3JMjZQAN9e7ccDw8WKVrgP2fx
	R1tBk3/ZEsdCVAuwUKz8NTRnh3OzF0i/yDBmH7ZY3kOV8s+ucyZxenqgwXGO2uKQyLgPXMHXkuC
	rOnPvDevGa1n+vUiMujBPHE7B7XK6wVVEQa/2y8UE8exDh1lGVREQYgeYU4ucNRnSp+p9AV6Q6s
	BsOjUlceMpoHEx+4UrGNrDGmdWucnZ+aQu6qMFEzWUiyWfhY7fMC30k9JGKWYlNGLXPbTtUkfwO
	ZtL9NH8RPmZUw6WRYVokU9jCVs0E6uF+oR9HDdV+cTgMzR/q8Voex5mVgZdmYko6Q3L8HOP3rHo
	x5QKpW1qB+xJSVGy1iSjqDQHLqbvRNwRja6tRQmA3qk/TEw==
X-Received: by 2002:a17:903:2910:b0:2bd:2439:25fc with SMTP id d9443c01a7336-2bd27147127mr22226115ad.7.1778682214381;
        Wed, 13 May 2026 07:23:34 -0700 (PDT)
X-Received: by 2002:a17:903:2910:b0:2bd:2439:25fc with SMTP id d9443c01a7336-2bd27147127mr22225835ad.7.1778682213847;
        Wed, 13 May 2026 07:23:33 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d40427sm179296105ad.24.2026.05.13.07.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:23:33 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 13 May 2026 19:53:07 +0530
Subject: [PATCH v3 2/7] dt-bindings: clock: qcom: document the Eliza GPU
 Clock Controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-eliza_mm_cc_v2-v3-2-b59c370dc281@oss.qualcomm.com>
References: <20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com>
In-Reply-To: <20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com>
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
X-Proofpoint-GUID: dPrka-AkdchG3k2BBgp5Wec7YS8izqoj
X-Authority-Analysis: v=2.4 cv=Hu5G3UTS c=1 sm=1 tr=0 ts=6a048967 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=eqSiwPykCNIpSPSkj8oA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0NyBTYWx0ZWRfX5i7aA18OqJna
 S9bGI6EUVtTEVIt7LY6V6ohH9oVlY1RHJvvlTXPfA3+3CaK3IwPITw48LxJopwXTJDWjoVTu11k
 ILgqnMcUu9j/49y8W3jp6EW7gFxrdI0By52dxDFKDaBp8n/OgVGtdThaG6Vk8V14XAaBgzzetIT
 SqAVoigiVuXuv8YbT2JDpVN7sqmsvi+tDJ2j/+ihQQs5Fq+tR/YesMzQcjVsZXcWL+9q2dtzKrJ
 6XGKJS6kuW8bF/GhH/t+wOrczdht7VMPAyZX8tfiAN7jFg7y4ewHIHGIuZTu9g3ql5kcu0WEpc2
 dETLkOx1Bi9VgbTxqu0rgKhJflDzW4zJ2FMWFr6bwZhDWRdo1WtKQMT79plm1/f966rYLDfcny6
 rkH3OySQyYolXDCEBbJ1KiKcoW+jkOwYztc1DJgoXgzZ9s1c5n9Wrp4mcTtIB3QQZLUEB6PVdnR
 sO0iaYr0Osk2XlBS5Pg==
X-Proofpoint-ORIG-GUID: dPrka-AkdchG3k2BBgp5Wec7YS8izqoj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130147

Add bindings documentation for the Eliza Graphics Clock Controller.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |  3 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       | 52 ++++++++++++++++++++++
 2 files changed, 55 insertions(+)

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
index 0000000000000000000000000000000000000000..706e1c93240a8234dd8017ee181d19e58091fd6d
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-gpucc.h
@@ -0,0 +1,52 @@
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
+#define GPU_CC_GPU_SMMU_VOTE_CLK				12
+#define GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK				13
+#define GPU_CC_HUB_AON_CLK					14
+#define GPU_CC_HUB_CLK_SRC					15
+#define GPU_CC_HUB_CX_INT_CLK					16
+#define GPU_CC_MEMNOC_GFX_CLK					17
+#define GPU_CC_MND1X_0_GFX3D_CLK				18
+#define GPU_CC_MND1X_1_GFX3D_CLK				19
+#define GPU_CC_PLL0						20
+#define GPU_CC_PLL1						21
+#define GPU_CC_SLEEP_CLK					22
+#define GPU_CC_XO_CLK_SRC					23
+#define GPU_CC_XO_DIV_CLK_SRC					24
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

