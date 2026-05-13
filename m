Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6237630C619
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 13:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778679659; cv=none; b=rUA8VKVhji9dVz0Z9sySXGAO7hFBbELPjZr2r4hg0gIKgVGG25609Rqi4d0ETNgOlBtpSCMhjq09/gY065vkgz9hyfmqqvSWRAAfRBdrwKkxvPLr6yZQPZfU4XFhHvEyYacpGqZhHTnGjCczK9DCrbhaesoq/U4OvsAlDpyA5CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778679659; c=relaxed/simple;
	bh=zjHZlUWyJcyXeRZYOGVOkl/BkM9iscfpl/MqwmfdlXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h2KreU7H2D5de0otk52c2FzAarCLBYzFHlaygzVPQRmLZkWYK+eo07tmGyGOCP/k83tXghJCrOZ2qyOncl7+3cRQ3xfukS5uEP/55bKYDaI4k33ep0NDnKS8g6iY3hCnNEyBr4bt8EJGyDLpvZNqX8AT70gd9+87AyL2bywwY3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BJfI6FBb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hEwnQzaY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BJfI6FBb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hEwnQzaY"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8nTDq2888500
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 13:40:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Og7zLYM2ewiyQqmgb9e8qK+45a/W/Fnm/o3b+5Pe1g=; b=BJfI6FBbIvzQgrQv
	gFGgYKG6uAnzo3GulN5rYMiga5c3sPlFyKu0wXo/CAopzFzlCR5B1GxsQwi5uonB
	gI+uaRar27jtLRi5WYln6+8eP83yYiZ/24Iv59Nj240yqx5Oh3WYV/Ue89BZFv4X
	PKQFJSgFm+Qg52IYd2xi/wVKFhkaxnrxaAMkDGFrvmS72xDaW7uC8dAGKZWzTAWU
	rbQP8s/jUv/iVRcIfSIN+WtjN6WQnugudlMvf6CP8PwH6gDDRsWWNUz7EdJ1ssgh
	zKYVqk28rqQUm7bRFMwGRY80LPkDUK7GXUd2GTXrsfpYPHtohHJWy7KVqs/XOz+Q
	PuyQxQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p4gh2ep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 13:40:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-367f715cbd0so3838033a91.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 06:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778679657; x=1779284457; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Og7zLYM2ewiyQqmgb9e8qK+45a/W/Fnm/o3b+5Pe1g=;
        b=hEwnQzaY5b8iL38QAZPsim/YMz1/tgflZ1/cgX+ZSbciv3B8TSJRgp/9oKwdFvLPsc
         enIsgQBt3qG0hWsIfXhVf2FnOsEy50m8aHJzPyg5yK1Zsx+Gu2BTDcdHZORMAu8L8sRJ
         a3l2NmbE+rKjBiAaoa16dhBVT1jCG1oi3WR3R3RlJYxN+hQVuYNWAnq0NxuG6t1cleXb
         AUoTc33OvEdrE5qy/uEYUuiMEweveMc2aKWuwJPfVfTuYU6oyrPgTkl5o90Hekq/JtvA
         fSaw7X9AxA5aZ3g8XJlVwnrguGfJz3pdbBn+YBo6OLQr/07I0gFNi7Lx+MvUJZelyAWH
         r6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778679657; x=1779284457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3Og7zLYM2ewiyQqmgb9e8qK+45a/W/Fnm/o3b+5Pe1g=;
        b=P5xznxn0fSoMS/MgOaD+jor8ZpXbM8dXn08pv1XWwYHiAFxt3VAW3eGiu17cC11VM/
         6yik/t30cQ2lC5NaIAkVl78HK1xdWPEYlcW4K2VdhgGF/8rfyFzcZ2QKRv49YctY4vZ4
         OnCr+6uqnnS0BjkfgTx5m7qDqWWm34xeXST4/1qvCn9dySRHCblpVYGeKdU+HlCYtK+G
         ySrdmbzvx8fi4U7aGeoY/vAfrzh8h9M0VutRR3tLLX8QO8Zma3h6FovCjQ5Hf1AhUPCk
         Gw2Jle8JJyMz8+JYkC69E8x0cUEU9C3/3q/qWLPBBtagzYid5tyjFF6QIqDfWastL6ZW
         A4Mw==
X-Forwarded-Encrypted: i=1; AFNElJ8oQsTHxzdvmg4shGR9SaIIQD0zXGj58udFgnFpnQHRRBk0/f8vl041EHpnLPkE8fV5HgMMc3qSbbcI@vger.kernel.org
X-Gm-Message-State: AOJu0YxAW2bzbxABhXFPCfFco0zIfW480H7ScLBfQhimi1G/EYsjKmFE
	pKhFodAkE215EoCqB0+/I7ZmBKxt6LaLQZrz7QDVFOlcPL6orxxKywyt3dzJEkZjxesSw6K5eHB
	6tmWXnPccsTyZRE5MttahQMB4fq4xLCqzZuWQmNW4AqzMQhViua+eTmIQsvj4WCZGoFAl9mIp
X-Gm-Gg: Acq92OEu3l/dDO5R5Goxa0cy82m25uu2kWE+bbTugCJ9FPeFjnYbIOScwq8XzTtQtod
	V5JgnZCSYH+QhmvFxQVL90/YANsCdHx5RFCY0dqY9EMvXMTnFs0Bx56OCttRg2lN2siwwvo2O+i
	B4pi+Olg4yrdYlIeVd8O660hkKYgrqIwExdiEDc1hdwIx0oWYLK23skHVK9fyuPAupSi5fDYPHG
	rEzaHhg3Zxd0gYcSf4b0D0MQNkXCt5F1+wDf94V+NNvFCmmDVyRamejxv9p77Ro97V4n/dVS0ns
	aXBoownpIVKDAXnA3VdO0Q3uOWgB8ZTGpnFfa6Q/Gi4oGRgv1g1uwv8lw2ix3ljF6aOMVStmyky
	ao7lfLH3MrKeY6+mbHAjgeOlJoYLyMzecwsL0Hthj7jxgYEZalSAy
X-Received: by 2002:a17:90a:617:b0:368:f7a7:daee with SMTP id 98e67ed59e1d1-368f7a7df06mr1778011a91.8.1778679656843;
        Wed, 13 May 2026 06:40:56 -0700 (PDT)
X-Received: by 2002:a17:90a:617:b0:368:f7a7:daee with SMTP id 98e67ed59e1d1-368f7a7df06mr1777979a91.8.1778679656235;
        Wed, 13 May 2026 06:40:56 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368b00d2131sm4317403a91.1.2026.05.13.06.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 06:40:55 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Wed, 13 May 2026 19:10:36 +0530
Subject: [PATCH 1/4] dt-bindings: clock: qcom: Add Shikra Display clock
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-shikra-dispcc-gpucc-v1-1-5fd673146ab2@oss.qualcomm.com>
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
X-Proofpoint-GUID: PdfYeunXNLVvawwM_oBMVFfyiPfWK1hT
X-Authority-Analysis: v=2.4 cv=DOS/JSNb c=1 sm=1 tr=0 ts=6a047f69 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=MM9pdrEQ6VUtxjYSux8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: PdfYeunXNLVvawwM_oBMVFfyiPfWK1hT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0MSBTYWx0ZWRfX5m+4tj3WEFS3
 f7aP685XNNUJCl8MGEyyUgratygrjYgWDDPe66pPTIj3H99bpKbLqaC3Xa1CBy29rtnYf1uu/y4
 Y2GB4zESzGG4AueareFZ0Ovvaf9heCZMiFvBKlcZ4vBW77ekrgpz416GryZyf3R2Lt+GVOMY6B9
 qSzyEeo3kjdtyNXw9IHU6ZBNA18dayQxOD9PCcKtukGUQbbmKk0bApXgrh1cIntSFSnfsSEcO8V
 0dItWWU6/en8HbjoyDoPIGjFza5uLgWjfV/8NEQwZgjEaQydsR3H3UvnBjwYz4fEFAkejxUUG1X
 gPgTFgeG2HPzTh/jHV7XrtPXjIumBm6IpkoDOcQg34QRaqeQeMt/Olr7XtfQ8x4wLkLxb9Cq0hv
 2QJeIwE3F3sGqvVbkQC/Kw0OYceG64jixdAZCLdR0lFGBzzmOPf4oL1Fcejx1zsX3TtYrZY5ott
 rB3PjJa9B1D62Rzuebw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130141

Add device tree bindings for the Display clock controller on the
Qualcomm Shikra SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 .../bindings/clock/qcom,shikra-dispcc.yaml         | 62 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,shikra-dispcc.h     | 39 ++++++++++++++
 2 files changed, 101 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,shikra-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,shikra-dispcc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..38302eda7942ebc2e4dfecae511b75cba0b09916
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,shikra-dispcc.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,shikra-dispcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Display Clock & Reset Controller for Qualcomm Shikra SoC
+
+maintainers:
+  - Imran Shaik <imran.shaik@oss.qualcomm.com>
+
+description: |
+  Display clock control module provides the clocks, resets and power
+  domains on Qualcomm Shikra SoC platform.
+
+  See also:
+  - include/dt-bindings/clock/qcom,shikra-dispcc.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,shikra-dispcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board sleep clock
+      - description: GPLL0 DISP DIV clock from GCC
+      - description: Byte clock from DSI PHY0
+      - description: Pixel clock from DSI PHY0
+      - description: Byte clock from DSI PHY1
+      - description: Pixel clock from DSI PHY1
+
+required:
+  - compatible
+  - clocks
+  - '#power-domain-cells'
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+    #include <dt-bindings/clock/qcom,shikra-gcc.h>
+    clock-controller@5f00000 {
+      compatible = "qcom,shikra-dispcc";
+      reg = <0x05f00000 0x20000>;
+      clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+               <&sleep_clk>,
+               <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
+               <&dsi0_phy 0>,
+               <&dsi0_phy 1>,
+               <&dsi1_phy 0>,
+               <&dsi1_phy 1>;
+      #clock-cells = <1>;
+      #power-domain-cells = <1>;
+      #reset-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,shikra-dispcc.h b/include/dt-bindings/clock/qcom,shikra-dispcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..088a7c692ad5d2bae38d2799ec1fc6e8ebbe6c0f
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,shikra-dispcc.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_DISP_CC_SHIKRA_H
+#define _DT_BINDINGS_CLK_QCOM_DISP_CC_SHIKRA_H
+
+/* DISP_CC clocks */
+#define DISP_CC_PLL0						0
+#define DISP_CC_MDSS_AHB_CLK					1
+#define DISP_CC_MDSS_AHB_CLK_SRC				2
+#define DISP_CC_MDSS_BYTE0_CLK					3
+#define DISP_CC_MDSS_BYTE0_CLK_SRC				4
+#define DISP_CC_MDSS_BYTE0_DIV_CLK_SRC				5
+#define DISP_CC_MDSS_BYTE0_INTF_CLK				6
+#define DISP_CC_MDSS_ESC0_CLK					7
+#define DISP_CC_MDSS_ESC0_CLK_SRC				8
+#define DISP_CC_MDSS_MDP_CLK					9
+#define DISP_CC_MDSS_MDP_CLK_SRC				10
+#define DISP_CC_MDSS_MDP_LUT_CLK				11
+#define DISP_CC_MDSS_NON_GDSC_AHB_CLK				12
+#define DISP_CC_MDSS_PCLK0_CLK					13
+#define DISP_CC_MDSS_PCLK0_CLK_SRC				14
+#define DISP_CC_MDSS_VSYNC_CLK					15
+#define DISP_CC_MDSS_VSYNC_CLK_SRC				16
+#define DISP_CC_SLEEP_CLK					17
+#define DISP_CC_SLEEP_CLK_SRC					18
+#define DISP_CC_XO_CLK						19
+#define DISP_CC_XO_CLK_SRC					20
+
+/* DISP_CC power domains */
+#define DISP_CC_MDSS_CORE_GDSC					0
+
+/* DISP_CC resets */
+#define DISP_CC_MDSS_CORE_BCR					0
+#define DISP_CC_MDSS_RSCC_BCR					1
+
+#endif

-- 
2.34.1

