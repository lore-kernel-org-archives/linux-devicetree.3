Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5E9439344
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 14:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783954481; cv=none; b=hb1luPO0CF9RCxk0s3po3mlPFbTl519dbv+Oqq9RWH3z038uwaQj6eKOCbXUbL1E7Ye+OScb4NEfcf+lwUnJRn2l54iWqDx65qC02M1IMD54wQfNS506i4oXz/6Dpzy1xUbFvLr0Bm6Syznb4yWLOgSXuWhz1TGtMQXpSOJuc1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783954481; c=relaxed/simple;
	bh=X7A8BvifHg9AJtoStT7CZzf1oH5NsdlyLLNOS9sNvUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lsH6Y61kwbSwPS8yN9rG/PidMd1NwnPXJ6QExpO9Pvl6JcYivapsO3uslhhRghvoaGRMPdxOBEYIQX4eWFBL+tNNcL1qnV0dvUAcj2xwUKrEHAni6a2bYGAtYhMGOyWY/TUL7QXzd6flOrtIvc4Tck/uPzUhoqZD7vwpWV6F4/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Of84Rvx4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XFHlMXHz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Of84Rvx4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XFHlMXHz"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDe3A1480759
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 14:54:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lu5u9GFsbziq+/TkOaetbPmiQkrUsx3PaJxt/gHkQ94=; b=Of84Rvx4SMgY/gTY
	wFfMgFYAflXrxMYUmShV03sowxcrcRemNNz1EMjHWRUlupmmBNrVAyXCeQR7qW3q
	XuVRD7HssOxYadGwO4cXLeTpezLehGVR9A1w+qqp+jFjNzJNFZTaaOhvKAL88gPc
	moYemZ1qA3IuYOhx2IBm806zvWXNyoQAyDPam0wHPLJ9ogcYNgV925mPjaZ+GeNj
	9DfaYqSLon4/X3+CjupEGJW9gl6m139bs5Ybm7I/8Pq3by2XvFTZIccXaOyjm22y
	jJ0ZfmZhSFQd0N8/sPwlvgb4fek5YbFw3ftqIZ2jQvhAVJCEhCLVsy1PU0uMfXsc
	tjxVgQ==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwavsa3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 14:54:36 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6a18e349abfso4082538eaf.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 07:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783954476; x=1784559276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lu5u9GFsbziq+/TkOaetbPmiQkrUsx3PaJxt/gHkQ94=;
        b=XFHlMXHzZYdiNtrnhHLyvyXT6bMxContCEBky9BKb7u8P2y1K9UeIy58wncDgxCf7g
         mWpx0tf55SpZ2/TruknHAM64afVHdz1n9pKKOCpJjGx1t7h/3EZCTA2PkvkOGd9UZ2yx
         YraFhHNQmqmjfg9R59r7EvxKLHpj4qVDqbJ5W/nV2eqsV05HvbxmTwYEUzzwAavlxjJN
         rZqorxb0Y/bDpOi3SXrrrqn9liRB47HvGplB3pmrPV3KNIPWXRKY76QkwduIoFsvy9dl
         ClYvIg1AOz2JuQ9BPaCzp43w/w930D6dIgaUYAlTL1wpTc67UdCJ+jfYWIEAi799xOJD
         Df+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783954476; x=1784559276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lu5u9GFsbziq+/TkOaetbPmiQkrUsx3PaJxt/gHkQ94=;
        b=Tns7eQz4MdXD18cBvOYoKsaafsQq0qjvkpbCJR9Q9hIx7tsWOgVhk9ygUDlEACvfqR
         PP59JA2PT+xlBw/CQ1KnuSdyjsoP6r6L3qY+EhCi3cE4eLXuvaWUgQf+YnnD7vBO7gLO
         Vzo0YDSvPismDeVTjzSwf7W7AsSzD9X3/h8K1cTRVqaazG/F1fpUAE/XY3MjY6YRX+QM
         UK/C41RF6YeG496OwRNEERUkTZt8OiLoSICrqDAv7IStKSIS7yFLkllvNS2kZBI8vLd+
         Pgx43gld9/Oqn9M/mpt9D8jS/UER3NaoJBjMsxWQRTEmnHLkXTuF4p/0wYsOC3QS/t5c
         pUJw==
X-Forwarded-Encrypted: i=1; AFNElJ+Tsy7WibvrsXBVNQMPe++qe9S5DxBoEIMlJZ878p0sR7cW3Om2pbmffk4ilD0yYVm8fToP7wobWtaQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzPU7kmcIjCuIWi2SdrEHnAS7zbT4NnqA/5YysWWvMZ5Nm+PXsd
	6EDKSh1leCVAPGozziLvva8/trCFBsfWla0Kvk+43VFgfjMm/e9a0b79bkAOHR/z2UOSdnGZo3d
	yW+1ggazB/kcyijeGcE4C3JyfPKyn8WPngUS4NLKUgj/NF32HFGQp6P2y176RRCbp
X-Gm-Gg: AfdE7cmSYY4NTsu1s985SLYbRhcgXYxUwOsTF7ox3U8U61kHzB62Hv1XXUaT5KM15u8
	iRsrXQxA6KIKwPd+wyQHAR31tb7K+Smw3i2mFBpDQGgDr+fKJ8gbHDxaBM1zHOpyJL+UBJkd4qF
	RcrDrpRWfROVw+mfz8u6n1DrFnEqPCQrzNDFjn6dzH+xga6nTcynuTrjqpNq4PY6QtRywVGrBUO
	ehhzQ9gGGDf/JXHXpzxcX846JkkQMpa4HM20gUfdLYe5/27n7/tL6m182K/nH17YA5vP26li1bs
	+MwLKn5VoFgbWCKC0P8qr2qTgEiHm63yllQwgOpvCAe2S6xtzkE/MxvqU3ka2G9Cd0peKeeluAF
	0TCvrnj3qnyLR1xqQfb9l1XWyB/NpEeUX6L0=
X-Received: by 2002:a05:6820:4c0c:b0:6a3:7681:1f0d with SMTP id 006d021491bc7-6a39be3c2b6mr4862997eaf.21.1783954475995;
        Mon, 13 Jul 2026 07:54:35 -0700 (PDT)
X-Received: by 2002:a05:6820:4c0c:b0:6a3:7681:1f0d with SMTP id 006d021491bc7-6a39be3c2b6mr4862983eaf.21.1783954475641;
        Mon, 13 Jul 2026 07:54:35 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a38e9bc8casm6728746eaf.2.2026.07.13.07.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 07:54:35 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 20:23:43 +0530
Subject: [PATCH v7 05/10] dt-bindings: clock: qcom: document the Eliza GPU
 Clock Controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-b4-eliza_mm_cc_v6-v7-5-4d91bcef50eb@oss.qualcomm.com>
References: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
In-Reply-To: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: eaqZCgojakBzoqg4FDdEqTNA0N_hEKrw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfXwWPuVoaM3oh+
 QMsTYXR/OtRB2GtYpIQMWaB/4vFZZCLgApnrfEl+oHShDagm0O8wch7OdOtaJjFwl/wVQbxmVRo
 ajEkCqgs1Jwr+3u7VexNtpAe2QnsB95mM7uQI4+Wm9SeEebKHNm8obfbyjVEFYAHiw9UTFrZxwP
 mwGLJ8sWOH3BkJ3bKEkcNmigKG8UEtTH9xBHFkgOdb7E3BMIbHfZ66N671/p9rCY3fBSm1+fH+S
 jFgJt/LhOq/EphotdAlCQWiFgAFO8HzF5FE30MvprwZGHcrRac76czfkkYYy1tvWVt8MTNA7hYV
 aoWSv6dzbB8Pa/WsJ3466u0pvUUQcQHL0ttLBlVHSoV3qaisHyZBre8Uqra/QexKw+K4IEO4+1Y
 N3fT/lQBC4vPkyLmi6HSjot4Hr5hmeq/7FX25HVwvPuY5sQmfnFu+ABWoNFUWXqmf4CShMskFBV
 INHEleKntG6rMJ5gMaw==
X-Proofpoint-ORIG-GUID: eaqZCgojakBzoqg4FDdEqTNA0N_hEKrw
X-Authority-Analysis: v=2.4 cv=dZSwG3Xe c=1 sm=1 tr=0 ts=6a54fc2c cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=eqSiwPykCNIpSPSkj8oA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfXycQF523hG0a3
 p5W0loqIgnQ5SEDUfgK5C664wLTk64hXMw/ekklv2vTJJJjwSOl09hu9T+ASjzL+0rjhDenaOmh
 gbkYwaF7MMdgjGiNCk3WFzGmHd3fI58=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130155

Add bindings documentation for the Eliza Graphics Clock Controller.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

