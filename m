Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2273B2E6CB3
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 13:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778679665; cv=none; b=DJR+vfhGlddXdEWUUmKVvP54oOoCL6Qx4DPDJNk6bpmaap/kx8kN5cgJLpcvma0tBCCIbqF1k+rNpK8ziJFNgb24vQXeOygMa797AKHG6u9ZMwN6v7CGX08wbqAueMF6yS5PBK/ko/vvY9UvF8WRMphCcTUVdks9mfNutTgdup4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778679665; c=relaxed/simple;
	bh=SerrYLkCZYUr0xfvtsQ2ytwhAZ/g+vYA8m23pQmL9nU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HObdVZw5Cz5tzEJUp8uC+SQDjJFcDjWe3/RXAFxxgYUGvdh7LgRGUrJU7G8LuETK9v6DfxvK1FL9yBi4vbcLq5av5wdFnawx+ONBbBGkKzvkvopEBOIRfQ/d8dcR4jNSSf5czHbCvy9RANuRMyCMOU3Eem0k6bH/WeODTzfP8Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FgHOGwyN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GsUxQVVW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FgHOGwyN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GsUxQVVW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DCA23L2965293
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 13:41:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JswDgSjfnV0AZgkGaR61BVdAxtT3/FmLy7VTcw+dNvY=; b=FgHOGwyNCI/jVOTi
	z2KXHSDCODLJYN4LOEy2RsqRVMzIjMstt8RNPPM8g/5QehVwi4LErX7IST7BlLcJ
	7OvBB+HW2nPaLcKIpI7WpKbJf36MkvFVsv4LpwzU/9ALKOYf4ALvMbmlhsoSXcUl
	pS8ygRPE4MPjkFxd1jXV041kjOBPSLkD542m1iINZlylQ9eI630PN6Cb8o8GJVSJ
	clej+LJc54VW5UvMBHIszgqVmXz4/pM9WZJXcrLE9tZ5X3w56Bf/JbfexOErKMvK
	Ok9TkDaaKxUMwq+Ml6K5m+9XbaAamfFMa1lj5O9wxfDmoDo4MV2zbFnNPu9BXcx/
	Hfbagw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4ma59j6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 13:41:03 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-365d4d2fa04so6516184a91.3
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 06:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778679662; x=1779284462; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JswDgSjfnV0AZgkGaR61BVdAxtT3/FmLy7VTcw+dNvY=;
        b=GsUxQVVW0ljdKUKmE5KCUIawO7gUoxlyItBOPL2Ui8Sy8AGAvKAhRp08w3ApEwhVIl
         4mVXlVFwWKFFk/LdTdvcC/tcOmA7t3fSEhhod+iUm/xybq6mL5Yvt7rlEM4IGej16f2J
         KWdV0SSpQiAhA7qlOlDWue0cjpTfntJ92qN7wte9TYW961YMpQreVbKrOmwRSxXsBJNl
         R/wYLrN7CHiZiJyX51ArmdicGU021VRmD9H6WqlWTryT4KWzfjnYSsF5wvsHBF0AnX0+
         RmabBhgzh/VxTZSlaPA3ARW1PMu3Yl6uSG0ZhsiRiLm4mDfISPDb94q/VlSOXWBLOd2p
         el8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778679662; x=1779284462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JswDgSjfnV0AZgkGaR61BVdAxtT3/FmLy7VTcw+dNvY=;
        b=Q4ON0NFO5Q5AdN7eD8eJ6D8ioLw6yYQlViuvXql50spRx96ag2Rw0uR5s/B5RoaTde
         gUG3ax/h+kgYStvsln4RHLluz3uRFMLSJsVfiMc9DCF233GyLIzS0pGt4H+jGvo6GNN/
         xi5x5OF6RRJlb4+C51yMxudfdPxprmfoGUhLAWc/LaaVc3RpuyEq7HvLsyM4ZdHtXvCC
         kr1ppRK7t1tb2KulLMgqda/hCrJf3uQb+Aiejdu44Lp0JiiA4ON1+DJKoKGjYbqhj1Nv
         0HnBFmcKsz75yPWx+KGwxuA6v4AYtpcIcpG/4SVE5RGcxaV7t7vTGjaLPXDUE5ALAz5W
         V2sA==
X-Forwarded-Encrypted: i=1; AFNElJ+tOwABplj3cKglHMTJ6OW9FSHA43HNg+IEhoYvl5yiHiUVV5qZLmPvVEJsaNrVvkRiw1y2wXiDEqMB@vger.kernel.org
X-Gm-Message-State: AOJu0YweFug8fta1koomJ3ib9jr07DIQXFBeroUQdnku3LvVStjfLxJt
	YgwFvIKfpBSp1lds2g3IG0ydh4S2g6IKmhwVWK8zcP98cl9+f02TNU6fhFMh+od1zzLPmZOzagy
	BHpstHPtA6P510HxYfoNSKpbbLM1CFWP6W18IyyqGrB9OtNNQgK8a4CxufrOnf2t1erji+ZU1
X-Gm-Gg: Acq92OGkADQ25dgZtWIXs/63Mi1JKVFQAWwZyQ/bvzHkyAi8xQds2FcEuQi9AfgINfg
	+eDmNM7HdLWnaJCPoF28K294jUZtOZAI4selDe9b0/NXwX0dBsaI+sw+X/d1ydom6681fypHNXK
	nlklR2KBtU818ma2p6omxWBS8RvksowaJU5CMDh9lvpajCE1CO+pZSFR6oRwG7sQ6IXWPKdn223
	bbj0DHBba4BqHtUbfgj9w2gEJi8fhOhsWG34H0CVJPxvXvUdrgDjCHnHiXLB+wgGQi8fGrpS13m
	Wyx8cQTjsLqeJSX0AcGHUZtvIvMtyWddLSxxkAPIA7t7vb0RrK9woKOqcOyoRfBdv/dN7wiH99K
	MUpLCOZcLmaauciFvqCEPb6GteyJ/Wzt31VNP9dGJJkk/R9uAdMkW
X-Received: by 2002:a17:90b:1c8d:b0:366:346a:6891 with SMTP id 98e67ed59e1d1-368f3e5d5a9mr3648991a91.16.1778679661928;
        Wed, 13 May 2026 06:41:01 -0700 (PDT)
X-Received: by 2002:a17:90b:1c8d:b0:366:346a:6891 with SMTP id 98e67ed59e1d1-368f3e5d5a9mr3648957a91.16.1778679661395;
        Wed, 13 May 2026 06:41:01 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368b00d2131sm4317403a91.1.2026.05.13.06.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 06:41:00 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Wed, 13 May 2026 19:10:37 +0530
Subject: [PATCH 2/4] dt-bindings: clock: qcom: Add Shikra GPU clock
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-shikra-dispcc-gpucc-v1-2-5fd673146ab2@oss.qualcomm.com>
References: <20260513-shikra-dispcc-gpucc-v1-0-5fd673146ab2@oss.qualcomm.com>
In-Reply-To: <20260513-shikra-dispcc-gpucc-v1-0-5fd673146ab2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0MSBTYWx0ZWRfX9St53xHSembu
 QE8wNZtSdXarrBEZtJ4Jh+LBtSb1uPyXQB93lKNxwZNrD0Jd/k39YOgDrxjDTdVxvNmvRMIOmKI
 DH5fQr+42h4ktehQY1otSmjVzcg1EkOtZqRSTgoWGmGWX20hXfiLtzhp+Q+jqNzz7Ll/NIGcZ/7
 wLwGoafg94n2619BIWU7UwObuT1zssP71PDWGNJBIK1NE9qhxbs+IeO67zxnT/ACXBZyrdFJt07
 3ktvZqJKLovNwHO1fKbhY0s+ySyTCXMi8w7B8S+viLf2QRjoifX6rnQDr+0qDKptRO1P9o/oIiu
 eK1f6ueyFrI+rmADL3skkOyiEDXtGQZw40x9kcUimv/6IvpgzS9K1u0XbUEJIsv2ZXTHfeI35Rk
 BERBoEptzCLHJa6gM006n5wDJCP+vc/kfFI34CUmfcyo4DprolWL1u5FSDDvKOspC8DE2kE9T8F
 KNgWSKmRezYwS/el75Q==
X-Proofpoint-ORIG-GUID: JL0WwPdEx-dR5ZJL6h6pNRtJuLUJXf5D
X-Authority-Analysis: v=2.4 cv=TJZ1jVla c=1 sm=1 tr=0 ts=6a047f6f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=lM1BZXIhDmX_0k9ByEcA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: JL0WwPdEx-dR5ZJL6h6pNRtJuLUJXf5D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130141

Add device tree bindings for the GPU clock controller on the
Qualcomm Shikra SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm6115-gpucc.yaml          |  6 +++-
 include/dt-bindings/clock/qcom,shikra-gpucc.h      | 37 ++++++++++++++++++++++
 2 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm6115-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm6115-gpucc.yaml
index 104ba10ca5737ee1ed94fcb2df5a38bda9c86d14..5f0f94074e43034c2241283241e10551ae90ee24 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm6115-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm6115-gpucc.yaml
@@ -7,17 +7,21 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Qualcomm Graphics Clock & Reset Controller on SM6115
 
 maintainers:
+  - Imran Shaik <imran.shaik@oss.qualcomm.com>
   - Konrad Dybcio <konradybcio@kernel.org>
 
 description: |
   Qualcomm graphics clock control module provides clocks, resets and power
   domains on Qualcomm SoCs.
 
-  See also: include/dt-bindings/clock/qcom,sm6115-gpucc.h
+  See also:
+    include/dt-bindings/clock/qcom,shikra-gpucc.h
+    include/dt-bindings/clock/qcom,sm6115-gpucc.h
 
 properties:
   compatible:
     enum:
+      - qcom,shikra-gpucc
       - qcom,sm6115-gpucc
 
   clocks:
diff --git a/include/dt-bindings/clock/qcom,shikra-gpucc.h b/include/dt-bindings/clock/qcom,shikra-gpucc.h
new file mode 100644
index 0000000000000000000000000000000000000000..60714f6cc6cd2c37a0a4caba4473259756bb9d31
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,shikra-gpucc.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_SHIKRA_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_SHIKRA_H
+
+/* GPU_CC clocks */
+#define GPU_CC_PLL0						0
+#define GPU_CC_AHB_CLK						1
+#define GPU_CC_CRC_AHB_CLK					2
+#define GPU_CC_CX_GFX3D_CLK					3
+#define GPU_CC_CX_GFX3D_SLV_CLK					4
+#define GPU_CC_CX_GMU_CLK					5
+#define GPU_CC_CX_SNOC_DVM_CLK					6
+#define GPU_CC_CXO_AON_CLK					7
+#define GPU_CC_CXO_CLK						8
+#define GPU_CC_GMU_CLK_SRC					9
+#define GPU_CC_GPU_SMMU_VOTE_CLK				10
+#define GPU_CC_GX_CXO_CLK					11
+#define GPU_CC_GX_GFX3D_CLK					12
+#define GPU_CC_GX_GFX3D_CLK_SRC					13
+#define GPU_CC_SLEEP_CLK					14
+
+/* GPU_CC power domains */
+#define GPU_CC_CX_GDSC						0
+#define GPU_CC_GX_GDSC						1
+
+/* GPU_CC resets */
+#define GPU_CC_CX_BCR						0
+#define GPU_CC_GFX3D_AON_BCR					1
+#define GPU_CC_GMU_BCR						2
+#define GPU_CC_GX_BCR						3
+#define GPU_CC_XO_BCR						4
+
+#endif

-- 
2.34.1

