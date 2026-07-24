Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B163A430308
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784890550; cv=none; b=Bsm1QJ0U5qxonwtFCRHXtXKBd0y/3ll/tq7Xijc9sm0Tf29CvEOUxs93QcXJbm6jN+EUiAwQgBE6gHIi9rBKKIiyY2Zp3e50f8j6WOilmMLrDIVEQP/1KBkt1DsmODhPgu2u69Zk9BE6QG5uTyKmcoPrLcWoqeQvDAigXQtERnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784890550; c=relaxed/simple;
	bh=y7MzUxivN8IflynT9hy1YGmbVOEJxdnihqOzfFWrxh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W1YEp23Zvm2lwkTWNfmPQiNLFRRNPiryrSbjWFXo23fogqIT65+WWR6v8NZtcokL+LXhvUYXSprV+GqK0C0XrByqUSESXUclTckDlayIR+ZLtpZXwprhhxb4FtzNE3QNeiwpItKq5jtNZNGLnakHkApA2iAY1UAfg0ixNMA0ODA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ps1MUgDL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O5FHDPn4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ps1MUgDL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O5FHDPn4"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADria2616192
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:55:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ibjH4CiFgCSEqizCNmb428mh36ODutLz9Cd3c/id100=; b=Ps1MUgDLGeRkS81L
	cWardftW4Gtm6LpX3GvR4pLkqKHfRDHG0rjG4/0DrFHC/nk1EC9V1H9aE/IqATNE
	bfyNkLrgm2NO/KZk2gRrhgJpKLd1npYzpkVSf+1B1fn6P/2y4eiryB1hxZYmSy2z
	V6jLGv2fmXPQRWFLcsnwSy+8czO3id0S4xuhsYdFOJ+I4/bVFOCoStOvD18RRucL
	ugqQ7M2iEt26vL4lMTrBlo6lFbg0bk2MLlMbeN9mFUiPN7iNuUnDk2qfScgATxh6
	qP6QYK2TUohySMyfMNvcF2NJh2vSeh7p68NSg1k266JNTtvwQ5dRpL7ER9yq2KcL
	Upqv/g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0pw9dyn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:55:47 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc640dfde3so4900825ad.1
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 03:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784890546; x=1785495346; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ibjH4CiFgCSEqizCNmb428mh36ODutLz9Cd3c/id100=;
        b=O5FHDPn43yvot0toLXp1UWsk5asG3BGSh1I5XQRsCArt9ACcwCK3ztMxXf56LMDkyI
         QlhcqUBpUNQz/VWxz8ne1zOYKkC0bIiISQ5A1Zmrvz6uCpMA21NP93otoaEUTOErTBq8
         46ykHEhcv3JgREmi6OJlQNeASVXDROgjszkgaOH4XAmnZnOplkjRZc8I7scvx9hTrvH/
         55TxCiYT7nnJNK9C245LO87DAnQTduQwhspBHKznPkf2q4f6lvb3sFEWdfxEMESsUyoe
         AJJDuSvdf7DlBjPK2nJKj35uk1CmhBg5nrP3RKgm56jjmkaakldzdzNW2O3U0xZxwQjj
         2S2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784890546; x=1785495346;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ibjH4CiFgCSEqizCNmb428mh36ODutLz9Cd3c/id100=;
        b=fnuIipoBWaXRMpAbvkrBuHQhwFex09hvDtq8BtYOJITenly64R+WWn8EUDUXLrPTsf
         GiOsPRpV6+SMJDYxOJn3tQGn6JnmDaPMmiX5VteFfKcBGFkdPmLTlIIcRIXKhVnApZ7I
         qoYPQjUA172/+EbXT+LrHVL5JcvOZGge04Sh3PJbGpoQJvvzRjCc13DfN40GSn6qDR5F
         x/+xALBVXhwf8cZk4BMuaCLABJp/XFnkaD/oF9GgNw3a++0r1e1itQIadyihVPLmfm8L
         e6JfNLn2LRI4AwNIvHsPPPlYhR3MN5czDf1XPNF2ZtActvU+bizRBzq6ZagFNt4sEX7l
         mamQ==
X-Forwarded-Encrypted: i=1; AHgh+RqVQAn/yNA9LKH2G/OSVwJpXfo9RLlmgJPcZB9DF6eMKJFMP0SQobSqCSTK57RJkb9lNl5dnxQG9ML2@vger.kernel.org
X-Gm-Message-State: AOJu0YyHKvMtb++dxKyY2Q6Raij56ivVKPcJLlJzvVL7ETl0+unt+8KK
	gYR9MIJ7iyqAQlxmHTE2qra682ocUt5iRi9mt9+4lzul6N0XCKFgv2euMoo8WPT0ziHm2hq/rzC
	pAmjlZ6N9yIxJ4Hd+kzYSFNeTJiailTP0+/zyoBncdZRmmH05GDdn0mSThsY9yC88
X-Gm-Gg: AR+sD13tgINhV+fNbIenrhrxGZQtlIWmq9Rhi67Uc8JQyqYZ+ozrJZge1dz1FmmDXM1
	PCcVO1nrsQ0bMxfQCX6QNLt+MW6W2XvRSk0ViJ9s7GVT09IjD4OyqgCBDvQHJcbO7Zz3kXDvfkJ
	LzYrh2FvORJEISMLS4R9vSnRTJpcPmt/QlIBmxP1egkmneg/H1DoN2+PQ8u0HSZu4ag/3NZxu92
	JwDFpV7gTb8Aq6wFGm6G7X6/cLUoFL8kW7xosU2u0IJR0bGvMp0+brntV+5tEBQemSLgFQ8klej
	JdP5rLIYLDLCdg2LMKeBXpwDZ9QS9iUNpwqTHKQobF0vu3llBMtzccvShD6cv9j1nNH/S1qXTdf
	K7Qq9wgA2OK4FUvjpf9b5Jwb7
X-Received: by 2002:a17:903:32d2:b0:2ca:d873:3b34 with SMTP id d9443c01a7336-2cfa6c79450mr83250635ad.36.1784890546439;
        Fri, 24 Jul 2026 03:55:46 -0700 (PDT)
X-Received: by 2002:a17:903:32d2:b0:2ca:d873:3b34 with SMTP id d9443c01a7336-2cfa6c79450mr83250325ad.36.1784890546016;
        Fri, 24 Jul 2026 03:55:46 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f310644sm49314775ad.55.2026.07.24.03.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:55:45 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 16:25:09 +0530
Subject: [PATCH v3 5/6] dt-bindings: clock: qcom: Document Nord GPU clock
 controllers
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-nords_mm_v1-v3-5-32b45232217f@oss.qualcomm.com>
References: <20260724-nords_mm_v1-v3-0-32b45232217f@oss.qualcomm.com>
In-Reply-To: <20260724-nords_mm_v1-v3-0-32b45232217f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Alexandre Mergnat <amergnat@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5OSBTYWx0ZWRfXwWac1k9hm1N7
 HZIFrprfO5ARrp312mP43Kv4BDnv8S7WMuiCQRHT5jk0oRpU5OlEQeaJdmnNe0XLtplSgJmVn7z
 olsXYOr/OuiXndda1svkjJGNILkm4hytkA4FIi+rjVDfma+EZJtzfuvZH4xoJNmZ9RvzdxUVOIO
 qnGqgaAnpwb8iaPHfpQ8D/EE5x4nKeesesig8DYi7+yHgI/7G3Od3zHKGdm/f8jR1Lc2NScST1f
 +WXgE5GajnaZ36W+TUDhG9StVUeF6ZZlcueyu3VutAVQ8iqvyS1Ur7wHDRhLBqw98Fp5LWuP9xe
 dpetFU+pkgOw9Aefeyi/MT13Z1miQGiC+auyAC+tpxFdD1gP4GszKm7rfofZJY6ol8hB+vvdSwe
 cQwqjc2RDRoI/2Y/JWdUdeJUNoo5cXPIdA9LUXUMBvLYieHls+zo9zWCBv0nZepJVquP77YnPhY
 4S7ImGb67fb99vgRDCQ==
X-Authority-Analysis: v=2.4 cv=RJeD2Yi+ c=1 sm=1 tr=0 ts=6a6344b3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=IpJZQVW2AAAA:8 a=EUspDBNiAAAA:8 a=bOuFlZkiYT1K-aWiZo8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-ORIG-GUID: zaGx04yU4NTnPHM6GeyBccGWEQ7-ZATg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5OSBTYWx0ZWRfX4yoKFRYZJX7E
 5HEUPWLmN4BcvX+eExryDDGyLR19mXXj62mwOwCMpoqlfrP9IiRbv+6u2SeoH1tVsIxZQrWRDjH
 XTxq/iqHLs367cI+gfcQ49cNse67h+Q=
X-Proofpoint-GUID: zaGx04yU4NTnPHM6GeyBccGWEQ7-ZATg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240099

Add Device Tree binding documentation for the GPU clock controllers
on the Qualcomm Nord platform.

The platform includes two GPU clock controller instances, GPUCC and
GPU2CC. Document the compatible strings for both controllers.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |  4 ++
 include/dt-bindings/clock/qcom,nord-gpu2cc.h       | 47 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,nord-gpucc.h        | 48 ++++++++++++++++++++++
 3 files changed, 99 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
index fdbdf605ee695637512ce4f98c9b6fcfacb9154f..2a2d37c59442de427874dfe42849cd0ec1a8b752 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
@@ -18,6 +18,8 @@ description: |
     include/dt-bindings/clock/qcom,glymur-gpucc.h
     include/dt-bindings/clock/qcom,kaanapali-gpucc.h
     include/dt-bindings/clock/qcom,milos-gpucc.h
+    include/dt-bindings/clock/qcom,nord-gpu2cc.h
+    include/dt-bindings/clock/qcom,nord-gpucc.h
     include/dt-bindings/clock/qcom,sar2130p-gpucc.h
     include/dt-bindings/clock/qcom,sm4450-gpucc.h
     include/dt-bindings/clock/qcom,sm8450-gpucc.h
@@ -33,6 +35,8 @@ properties:
       - qcom,glymur-gpucc
       - qcom,kaanapali-gpucc
       - qcom,milos-gpucc
+      - qcom,nord-gpu2cc
+      - qcom,nord-gpucc
       - qcom,sar2130p-gpucc
       - qcom,sm4450-gpucc
       - qcom,sm8450-gpucc
diff --git a/include/dt-bindings/clock/qcom,nord-gpu2cc.h b/include/dt-bindings/clock/qcom,nord-gpu2cc.h
new file mode 100644
index 0000000000000000000000000000000000000000..3886af669c61003f71e2da28f939f273e761c653
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,nord-gpu2cc.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_2_CC_NORD_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_2_CC_NORD_H
+
+/* GPU_2_CC clocks */
+#define GPU_2_CC_AHB_CLK					0
+#define GPU_2_CC_CRC_AHB_CLK					1
+#define GPU_2_CC_CX_ACCU_SHIFT_CLK				2
+#define GPU_2_CC_CX_FF_CLK					3
+#define GPU_2_CC_CX_GMU_CLK					4
+#define GPU_2_CC_CXO_AON_CLK					5
+#define GPU_2_CC_CXO_CLK					6
+#define GPU_2_CC_DEMET_CLK					7
+#define GPU_2_CC_FF_CLK_SRC					8
+#define GPU_2_CC_FREQ_MEASURE_CLK				9
+#define GPU_2_CC_GMU_CLK_SRC					10
+#define GPU_2_CC_GPU_SMMU_VOTE_CLK				11
+#define GPU_2_CC_HUB_AON_CLK					12
+#define GPU_2_CC_HUB_CLK_SRC					13
+#define GPU_2_CC_HUB_CX_INT_CLK					14
+#define GPU_2_CC_MEMNOC_GFX_CLK					15
+#define GPU_2_CC_MND1X_0_GFX3D_CLK				16
+#define GPU_2_CC_MND1X_1_GFX3D_CLK				17
+#define GPU_2_CC_PLL0						18
+#define GPU_2_CC_PLL1						19
+#define GPU_2_CC_SLEEP_CLK					20
+
+/* GPU_2_CC power domains */
+#define GPU_2_CC_CX_GDSC					0
+#define GPU_2_CC_GX_GDSC					1
+
+/* GPU_2_CC resets */
+#define GPU_2_CC_ACD_BCR					0
+#define GPU_2_CC_CB_BCR						1
+#define GPU_2_CC_CX_BCR						2
+#define GPU_2_CC_FAST_HUB_BCR					3
+#define GPU_2_CC_FF_BCR						4
+#define GPU_2_CC_GFX3D_AON_BCR					5
+#define GPU_2_CC_GMU_BCR					6
+#define GPU_2_CC_GX_BCR						7
+#define GPU_2_CC_XO_BCR						8
+
+#endif
diff --git a/include/dt-bindings/clock/qcom,nord-gpucc.h b/include/dt-bindings/clock/qcom,nord-gpucc.h
new file mode 100644
index 0000000000000000000000000000000000000000..3cc348be5668b309a151665fc29bdcb30c480740
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,nord-gpucc.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_NORD_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_NORD_H
+
+/* GPU_CC clocks */
+#define GPU_CC_ACD_GFX3D_CLK					0
+#define GPU_CC_ACMU_CLK						1
+#define GPU_CC_AHB_CLK						2
+#define GPU_CC_CRC_AHB_CLK					3
+#define GPU_CC_CX_ACCU_SHIFT_CLK				4
+#define GPU_CC_CX_FF_CLK					5
+#define GPU_CC_CX_GMU_CLK					6
+#define GPU_CC_CXO_AON_CLK					7
+#define GPU_CC_CXO_CLK						8
+#define GPU_CC_DEMET_CLK					9
+#define GPU_CC_DPM_CLK						10
+#define GPU_CC_FF_CLK_SRC					11
+#define GPU_CC_FREQ_MEASURE_CLK					12
+#define GPU_CC_GMU_CLK_SRC					13
+#define GPU_CC_GPU_SMMU_VOTE_CLK				14
+#define GPU_CC_HUB_AON_CLK					15
+#define GPU_CC_HUB_CLK_SRC					16
+#define GPU_CC_HUB_CX_INT_CLK					17
+#define GPU_CC_HUB_DIV_CLK_SRC					18
+#define GPU_CC_MEMNOC_GFX_CLK					19
+#define GPU_CC_MND1X_GFX3D_CLK					20
+#define GPU_CC_PLL0						21
+#define GPU_CC_PLL1						22
+#define GPU_CC_SLEEP_CLK					23
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
+#define GPU_CC_GFX3D_AON_BCR					4
+#define GPU_CC_GX_BCR						5
+#define GPU_CC_XO_BCR						6
+
+#endif

-- 
2.34.1

