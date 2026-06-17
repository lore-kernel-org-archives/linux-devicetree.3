Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092783955EE
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 11:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781694494; cv=none; b=ODy6Yf8suOyk4+Fk6QKi9nBk3CXriXvEe3Z5w5DjtpTX7jkexkAPqM8qfBg9O8fqffOfqyytdFhzpxXHOM4MO9FqoA0RH2R58FqgfWNxAKYf8hWgbSey1kiDFtcngA+eFH03J+FQ2XNxVxyuvdo/V5Av2AH5+Iu2M9+l33UtOL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781694494; c=relaxed/simple;
	bh=ABvMKBubmq7+vT2mslDLycyynxFAYMClsx2j2iUyLrw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bXFjj12wTNLlHfiD3Qafz1O/Ibr7CJwM7KwmUxi0WQ3+c+UpGc02dsxhud2hCY2GcKqNbvdZ6a6Sm9bHTzgnfzw3Gqvym5finmGESPVUQlRklMkPioUMAnQ0AgPuj0Wss/64IEbpbBELDjhf/04uLZz0H8/qVb2db1z7RJGBF5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GBqGCP3X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BH+IQvI6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GBqGCP3X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BH+IQvI6"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UTFN3273524
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 11:08:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZihRVb+s6uPehQzrp2IIPsHydM/cBCcZgzv0SNsTUpM=; b=GBqGCP3X8m2rL99C
	ydcvh/iFR205lX0SQ9F7ezEWcLVpFQ2jorIlmEBdt1rmLiqnJkLXZIEibwbGk89F
	zM40vF2S9TC1QLLRwEU4JNowhtClQuQSh9bXcEUt3zTesW+ai40dAVdVwZ5kRDmE
	DYQufX1O4IrR5uTLvb44SPeEsiL0uTPFszoaJHs9w3wG/WRqfP6lw0E8aoZ2n734
	yPnOq5++ca6Pp8JSwEFhQ2SdH0miVbt+B1FDMePJsQaLQhn84MTWHorEwmTgY5Ix
	GAV5+PPswdqG0h9XtQ4to2YACq39w8ac9MgEzPXXewJ3/PJwhKUm+InSJX/FdxK+
	2zjxQA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euefbtt04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 11:08:12 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8422ca754d8so4314255b3a.1
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 04:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781694492; x=1782299292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZihRVb+s6uPehQzrp2IIPsHydM/cBCcZgzv0SNsTUpM=;
        b=BH+IQvI6ninZJmTP4eBeXan+t5C3FctwiCuw7lgwV31LQo/mARZcNkJcHa8cjn0iVo
         fqU4YJu1sDCV/zGzjvRpbHv+8XdNIBjp7vyJSQW8xG1mv8U+/Eg+zYIxO/CFEcXFvESr
         6TsZYKNKVKrf7txtYqsvqEDNcu5pEVysv0Pyypl4ji7ATjvSq+OqwbqfbHM7+pWI7cFb
         NiudQp1zlgoBzjRYkqKyhP/91Z1IkVt5kr+5Cg1Xr+N4kZ57HuD23UYXLCxOKZwl1pLl
         z9lRRiaxWVGIMuc6Nq5KPhSlcJIGYbM/TIvMqtRGyquJ1S+r24IT3az3cSpovAaI9PXw
         5lqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781694492; x=1782299292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZihRVb+s6uPehQzrp2IIPsHydM/cBCcZgzv0SNsTUpM=;
        b=eNqQTmTp3R40CycNp0uB5Z6awyM1DlmA9JgTeO+2cgE61fR/nXYx6byLaXmhKCFPGg
         MDASV62nu4bDOfI2OE+zi/1ZLG4kcEJQd1OIcCPSbkw67MImCyxN8nDr4hrDPhyz8PJ6
         qybni6rOC/JLqJfyJMCUnbCCxrO60qzox2wdoENUkhq0GwAq5Ch8xmHzJli3vDR4vrSr
         vvivmNuBK1SxEK4/wZH/d1rEycA8WB+xULFibqDpf9zndTGm5eBeTXNTAbz+P0iflidm
         ubSj/SEFRs2mIsELUFyZSBkmCetstVDjHbyPsYe70dMafV5gvIugGo1BGrPZD736SeKF
         GGCg==
X-Forwarded-Encrypted: i=1; AFNElJ+/7oOvtzTm4i8yamehHhqyXrp12tqchrpgvR3Je7rn0RlIN1rrElk7mgfILDzbPPHOvwi1nHQ+0RDi@vger.kernel.org
X-Gm-Message-State: AOJu0Yzws5fyimGNMmj3p0Twpg1RmeR6lr/okp8bj3etqUQc8q1htd1t
	A9Mzepf/Ao46bFAdJMjbyVA/4oKVoHvhO89lplRQ5DdeO2CCsjhzRIaNljcBNPyc8zn/SJjeNfN
	wQlOMTXYup9GVz4RK8dSunwxR0y3MuucC1YQrMg0MY3+oGPbPLM1sCMy1wFRc8fe+
X-Gm-Gg: AfdE7ck32MF2Uuk2OhP8t7gj/vLmJe3f1KUr6WUoRkQrMj1EGCE/vV7mi004xq3Xq2n
	WoNwMSivMArBpHBJu/F6mFvt9D1Qoez8Y6zg+qtRR/e9ou19q/8tUvPNNVbOeCeEwNlDKvpFopO
	0ZZb48+hKJrji8bOst/gQAborGzbGTUax0jXXCyzNKFtEa1n5OfVXtbm5z9ulUJ+jptkKJpfcPE
	QRFmijX0YVPO7M5qe843Dxz61NmbD/l8sMBJuzxydxpvYn6ciliQoPS/y3DeBnOaQ1XypPUPz7u
	yo4c5P/S3qyyHT77bvBC1T/3pyPYfMkx3xGjnV/qYqHP8V+dSYMfTx+0DpizrwQKfR5ARbKqrzU
	5Z03y+XI+r+exU9KRk5CBAT/+Ut/b2Bt5yo4=
X-Received: by 2002:a05:6a00:14cc:b0:83f:2568:d466 with SMTP id d2e1a72fcca58-8452456addbmr3391006b3a.31.1781694491728;
        Wed, 17 Jun 2026 04:08:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:14cc:b0:83f:2568:d466 with SMTP id d2e1a72fcca58-8452456addbmr3390963b3a.31.1781694491269;
        Wed, 17 Jun 2026 04:08:11 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9cf01sm15873609b3a.11.2026.06.17.04.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 04:08:10 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 16:37:53 +0530
Subject: [PATCH v2 2/4] dt-bindings: clock: qcom: Add EVA clock and reset
 controller for Glymur SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-evacc_glymur-v2-2-905108dacaaa@oss.qualcomm.com>
References: <20260617-evacc_glymur-v2-0-905108dacaaa@oss.qualcomm.com>
In-Reply-To: <20260617-evacc_glymur-v2-0-905108dacaaa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: dSoHEMPf51onN1-iI_hRMCPruD6NqxEL
X-Authority-Analysis: v=2.4 cv=IeC3n2qa c=1 sm=1 tr=0 ts=6a32801c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QUVFY6MdtzYYwQCb-hMA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEwNSBTYWx0ZWRfX0oogCauwK+r7
 ljgzwj8TTYmGTb7hvMJVZAkqi2bMqxvKFUlk6WNO0Y2/4K/ulvOahtW/84R/UXy3tJ19fecIs/u
 wiObBLAgpfTEAnqxO6RX1bMLUM6gHQQ=
X-Proofpoint-ORIG-GUID: dSoHEMPf51onN1-iI_hRMCPruD6NqxEL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEwNSBTYWx0ZWRfXysEK3hl0d+Ci
 /Ph5OZKKVMtOJhlkx+eP5atG6tCN2WW+13D1ui0modOjgmAQa258MaImVW7HkkLQ2CEKKJ/z80q
 KfvFoM2QVYx5f0rjOccUdZ4xGQsTMmce1BBFv2HFkbIgXBV97JvDkGc/0aSVRiLF6p4DJZ0DsHX
 bc9YsQ7WI2io0ofB8OePhmHhKWO9sC7nxZmzfDqkX72b4/mS5bDBUacGJh6UIcpN7U82Ca07WHV
 /qqz9k3T/tTIeg0oCXYiKEm6hH6KTTFNETF4dYJKUwT8WeaBXiPvpr1WOo24UvSzM3hHT1zSLbu
 ItlFwjWBkDDD7V6KszMbylnvSQzck+HuiJrIsQ5HxejECSzz2qDrCi55sD+nV2mHUflpRkQzyc5
 3Ojfg/rpMANLF+iPtz0vzYQbSyWdwv5+iZladD3760/ykCn7/0Fh0T8nvQ4k81EUKIMl8x79BBH
 W54XT9ZvUNHpQBDL6Mg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170105

Add the device tree bindings for the enhanced video analytics(EVA) clock
controller which is required on Qualcomm Glymur SoC. The controller
provides clocks, resets and power domains for the EVA subsystem.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,glymur-evacc.yaml          | 72 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,glymur-evacc.h      | 38 ++++++++++++
 2 files changed, 110 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-evacc.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-evacc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..fb0bc1acc920e906033e04fe38bf500c24247e5a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,glymur-evacc.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,glymur-evacc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm EVA Clock & Reset Controller on Glymur SoC
+
+maintainers:
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  Qualcomm EVA clock control module which supports the clocks, resets and
+  power domains for the EVA instances on Glymur SoC.
+
+  See also:
+  - include/dt-bindings/clock/qcom,glymur-evacc.h
+
+properties:
+  compatible:
+    const: qcom,glymur-evacc
+
+  clocks:
+    items:
+      - description: Interface clock from GCC
+      - description: Board XO source
+      - description: Sleep clock source
+
+  power-domains:
+    items:
+      - description: MMCX power domain
+      - description: MXC power domain
+
+  required-opps:
+    description:
+      Required OPP nodes for the MMCX and MXC power domains.
+    items:
+      - description: MMCX performance point
+      - description: MXC performance point
+
+required:
+  - compatible
+  - clocks
+  - power-domains
+  - required-opps
+  - '#power-domain-cells'
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,glymur-gcc.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+    clock-controller@ab00000 {
+        compatible = "qcom,glymur-evacc";
+        reg = <0x0ab00000 0x10000>;
+        clocks = <&gcc GCC_EVA_AHB_CLK>,
+                 <&rpmhcc RPMH_CXO_CLK>,
+                 <&sleep_clk>;
+        power-domains = <&rpmhpd RPMHPD_MMCX>,
+                        <&rpmhpd RPMHPD_MXC>;
+        required-opps = <&rpmhpd_opp_low_svs>,
+                        <&rpmhpd_opp_low_svs>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,glymur-evacc.h b/include/dt-bindings/clock/qcom,glymur-evacc.h
new file mode 100644
index 0000000000000000000000000000000000000000..35a7b4550351661bdb1f7bdfbeec625fafdfcef7
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,glymur-evacc.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_EVACC_GLYMUR_H
+#define _DT_BINDINGS_CLK_QCOM_EVACC_GLYMUR_H
+
+/* EVA_CC clocks */
+#define EVA_CC_AHB_CLK					0
+#define EVA_CC_AHB_CLK_SRC				1
+#define EVA_CC_MVS0_CLK					2
+#define EVA_CC_MVS0_CLK_SRC				3
+#define EVA_CC_MVS0_DIV_CLK_SRC				4
+#define EVA_CC_MVS0_FREERUN_CLK				5
+#define EVA_CC_MVS0_SHIFT_CLK				6
+#define EVA_CC_MVS0C_CLK				7
+#define EVA_CC_MVS0C_DIV2_DIV_CLK_SRC			8
+#define EVA_CC_MVS0C_FREERUN_CLK			9
+#define EVA_CC_MVS0C_SHIFT_CLK				10
+#define EVA_CC_PLL0					11
+#define EVA_CC_SLEEP_CLK				12
+#define EVA_CC_SLEEP_CLK_SRC				13
+#define EVA_CC_XO_CLK					14
+#define EVA_CC_XO_CLK_SRC				15
+
+/* EVA_CC power domains */
+#define EVA_CC_MVS0_GDSC				0
+#define EVA_CC_MVS0C_GDSC				1
+
+/* EVA_CC resets */
+#define EVA_CC_INTERFACE_BCR				0
+#define EVA_CC_MVS0_BCR					1
+#define EVA_CC_MVS0C_CLK_ARES				2
+#define EVA_CC_MVS0C_BCR				3
+#define EVA_CC_MVS0C_FREERUN_CLK_ARES			4
+
+#endif /* _DT_BINDINGS_CLK_QCOM_EVACC_GLYMUR_H */

-- 
2.34.1

