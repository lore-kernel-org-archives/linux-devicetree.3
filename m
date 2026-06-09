Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233CF47CC67
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 15:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781017407; cv=none; b=bbW5Vg39DB6uGuOSJwKeXI4oxKqA/oxpM2HgkNEpON+mWAoztqo8BwS3nszZvGV37kzJyjmrBBqBNNf+uT7QLDjtbT6E5nAjVCxQi+OWwrJIGIpHtkpXomav4Bk7l++lyoWHTKXUrYfmFjvHHzlXdtCfgWijor5DM2O3dEOH6mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781017407; c=relaxed/simple;
	bh=X7A8BvifHg9AJtoStT7CZzf1oH5NsdlyLLNOS9sNvUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iSudM+NxaKqAWsx58oqg4aVgiOO9iQOyMT1AtlQEdz+VHoa0EFwfCo1MNS6q1Ud4SI27dpzbUS4AEubtNLrhheeAKFRSOnWCBGv16EM/Wz3iw1L6KhEAUXQDGWM9qAxq7Z6H5lPO7k4gDPz0rbhkFtmLi9dq7F3vWDM5BnXpi+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P1k7XNYv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DwKTQya8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P1k7XNYv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DwKTQya8"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659CmLHn2588047
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 15:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lu5u9GFsbziq+/TkOaetbPmiQkrUsx3PaJxt/gHkQ94=; b=P1k7XNYvWkjAlAtm
	n4ayrXTq4wktwI9mgcGcvab+oAlzTpu82qdlvu+oqB2rbm5fKbOKUJ96ylfkKjbM
	ChUEQHmQCb5NNKixFLdOKUBiFRAyQ2zH9NT+m2J3lyfxMAmIFEAi61+XylEodkzu
	sz1pSHctu9SQcT0eJoZljjhFYh1VrQk3zWbC1JKWoA2qjE8A5Eau8oGsRP7gdEXR
	OalDIBkqZo5lfyDdjBh0wfyaRMtYiMJ6sg8oiH4OUYlWBj37H3OaBB60fGYmD7xe
	+XohJakXa6CRYlrDUMjPOdnQkZZKSlA0b1kEbAeUON/AIAv+zEyQiZuNE1UT5jcP
	C+hzCw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epee4j2nu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 15:03:24 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-842b0dd8107so3156841b3a.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 08:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781017403; x=1781622203; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lu5u9GFsbziq+/TkOaetbPmiQkrUsx3PaJxt/gHkQ94=;
        b=DwKTQya8ozhVOnLyuEP9bH2FI0SMVMyD90qGtL64F9BYPE8m+WULsK9HAGG0t/jruN
         IUd4bEx62xh+SvnCjd05Bs39VkAwGOeB+493qGkWI1T7dVueZif1smCHVN8EUgk1IIsq
         Iou4pElpkcY5VvcXXUMmKiHQMBF1zTd7KROrnYlZqcsSIEJTMVp6buEkkGZNCuSx1mjJ
         mDtBAaNNkyOwT0tZ7yO10JYHp0U7quWARlPv4WrR5xeUI5HMgm8kyObO9Ks2CbKq9jZe
         4txWNDbO6DJPFXMgRDQ/cAjOVQUt5hXYPxqXjcUfkcQRpJ6+4rdJvpEuae8ImuFUm/sT
         2V9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781017403; x=1781622203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Lu5u9GFsbziq+/TkOaetbPmiQkrUsx3PaJxt/gHkQ94=;
        b=G7KfIM0t/2weq92Tt7zRMjqHHLMs27hA70G3WFYeviRGCzlaSuVOcQnFzMc+we3SO4
         qgKDGaBfQLKcNxORP9LQ6pML3VO7Mjp3a5YlNjvjk7cbHS3hUXSyh696Oo9HGIm93ygw
         nX0L+gK+LHGb13qn8P065rKYZRao1G8u1AIbAgRrbY7Y72QenZfTCuSpcLPf7whO4uS2
         +1SwhKmffZJxCj42vUnOxnm9lab4OJXKcK+rJ/830stvakQlNF3l4e6ZNHefiHVgbEYH
         Cn1tWwbrAkOPVOJ1MgOx69OH8iRK5pbM3BX5pRB1EM67qlurttna5COrcaN47iG2uZNc
         dN6A==
X-Forwarded-Encrypted: i=1; AFNElJ/0wkDF0XR1GL+u9491SWjbaQDuKnunU1wrm7wuaSh1IB3Y3dtkAQ5zltz4YvQiF2pWOOi9zZl0kRJY@vger.kernel.org
X-Gm-Message-State: AOJu0YyZn8ATGUnuY/+ULNeu2jTHZTXPhJBPFiyEASxMb57YphnbD48k
	SgU+GG7jNk9yqlSrDteu/tHk9pgHindgZNVLWpheiR26Wn8CrPeRZL2NXQUNcalpHGOeXPINceq
	u8MEgMHd6QoZ5lQnsKNsNhA8IrCH6CTykXqGl4SlnlPqp6MrXQyM8nYO4migd7673oB5p2p6w
X-Gm-Gg: Acq92OHNTz2Ijd752u/qHezljX3pOEspw1Ca4WJz7qjQZq9dHS/lbUemV7VXs2F0XZ0
	bdJaESR7jjHaj/MdGhBICxSvSaVDoy2Wn8Qk5L75eCi8DlEGrTzSnQ1rsLZbs5sxRXvHi0w+Noc
	OZRvJR5URnND4RZwjXGFX3CkMmpDkPNcPjBp/+/Egq1ndx/Py40jeLucuXVAO98xDuRM5A2q6Is
	4vIMgAuVWXqVA2xjtZ10MWPIim7DbQkcmVPBwiI0v6LhViCtemGfX9b4OWfIY2qc8laezyvWE91
	mdIiU+7Y+rc8kMQBFUpmt6urZD3pwbPo//htjRYkZsW/dqjNTk2CYQbO7zXLEO5rpG1KjY+4dM+
	nkg1XuoHO4VTqmkvKD6EAAkYa2fr1iHDjzU0LABd+f+AzSc9ddGdeY40n
X-Received: by 2002:a05:6a00:4216:b0:835:41f3:f440 with SMTP id d2e1a72fcca58-842b0e5d0ecmr22209057b3a.14.1781017402835;
        Tue, 09 Jun 2026 08:03:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:4216:b0:835:41f3:f440 with SMTP id d2e1a72fcca58-842b0e5d0ecmr22208978b3a.14.1781017402222;
        Tue, 09 Jun 2026 08:03:22 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828d6bd1sm26987659b3a.44.2026.06.09.08.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:03:21 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 20:32:53 +0530
Subject: [PATCH v6 2/7] dt-bindings: clock: qcom: document the Eliza GPU
 Clock Controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-b4-eliza_mm_cc_v6-v6-2-17df09e5940c@oss.qualcomm.com>
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
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=PIs/P/qC c=1 sm=1 tr=0 ts=6a282b3c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=eqSiwPykCNIpSPSkj8oA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: FnQDWKZGejWsmPXbHyfjI_nHmpBfmBZ2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0MyBTYWx0ZWRfX02pKskVzTBqU
 wu2rR9kL+qerQPV6KE3dIpmqkbS6iFrc8TsAdXu8zn4JxEIkqfjQzTuOW1Cu0Xtm9f/G0Kj5ure
 ykW4N3pUfPW6xciAhBj5m571Epyq0HPQ//rVsZFKijRkyOdSiFgNGZiynTBTwT2ieqt3LFTCtuB
 7dzkxKYfbFJURbiAgMSI82HJvSUZXtsJLKMl/1LMi4w42l4jJbQprpHeauvn/uflX9hRYY3hft8
 FuMbe4XxNjGGXqKKxsWgQ6PXu+79JqbhGQjC78YM6+94W6yg4/5rymiwDVYcTo2rT6NrzOIc1k9
 b29acqwWeFNreRBOqt7nf3vxPBwwAle605lZjqr/WqxhIDwbBaQLrAGQw/EExW5NrBCzIR1ONTL
 eASJp8xkrdloYHhITXl5nE11QROpTY/ythRg2wCJG4B2J2Xp6E0mW6tgxcIBVHXpJM2jKUEJqkU
 Ze+eHI2N5y/RCiwyB6Q==
X-Proofpoint-ORIG-GUID: FnQDWKZGejWsmPXbHyfjI_nHmpBfmBZ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090143

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

