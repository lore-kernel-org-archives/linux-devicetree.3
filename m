Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFD037E5D1
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 19:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790191322; cv=none; b=REpAGEGjnQLfFpJ2LShLXTx4DO1/G7wjZlTc005Az9n5AfBwNJlGTz0bvpMUq50ApqrMxm3bMCJGr8if+tCj7PJdFvZBOByRhGqE9BpnRVGT700vDGY0EkZJZUmXsLxKUymAOolo6w6XOlB9pmD1GaBlB90TKU1XXalwlcbdad4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790191322; c=relaxed/simple;
	bh=XfSzh2RA8bORT/gYaruicqFcyICwPciq8TCBpa0zDx0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XNtrjCraKsIRgCH4GtivRhe07aCL/bDsNobcqx2XVSFP4dc+ve8xa2IyGLBObqv1MK4JyHB5+eGGXiz/3hucgWnGhnYW3ZEJgo9E7LJkuxMFu9bXZmaJZCL2UXAXnOQmjGE4yglIlIr+F08i4SlGI/s1Wlot//Se2fhmU4wYc7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QRaUtOKK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b/K8MXgv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QRaUtOKK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b/K8MXgv"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NGU6wo3281197
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 19:21:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bf6GLnn2j60X/tEoyBage8pZiQbutJQgNhGY/VeJuPg=; b=QRaUtOKKF83L6gi2
	rgGoS6Kusyg0I9hz0XYLU5WuFSsDg9eYDOlCstRbuT8AY0U12VeEiPjzKd2x17/z
	hq0BzgRDw7NdhkOuKZOweaTsEmFS5Tlq/JJ4F7RTKLg9P9s4JgX199Gylp5I/iY2
	wYFPyQdIaSBFA/hGAmOrc9TeJnh6axqH/RMU9DvpKGldM6/H92B5DMhocHSQgEaT
	Fuw95MHwgyVroLcyJJgSHoUWWu0CK37VbktXryXM/6SmDX8pQA8zEOMMfuwFGpXX
	H851z8xS5uXhfhGWuO1qxIvsh++DNPmcGBh+dfFDVMhxInJ3u+W9Tx72Ere75W4+
	2FaNUQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv9bqkbvp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 19:21:55 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-32861f5448cso1479172eec.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790191315; x=1790796115; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bf6GLnn2j60X/tEoyBage8pZiQbutJQgNhGY/VeJuPg=;
        b=b/K8MXgvQRFRkb5mQY1V9DsXU5rJpW5t+1l6pYIcNEswVz4jBnAgpY0WYDpYz3M/3c
         zu0JWDkh2XVTTm4ILt+kwpJaqyZheK3s5FNhe2Cqq5UMlXUCmT25ITJ+Gj2dW6agBg4C
         mjILtryy83J6YS+RY/+/MgvtA3rlWmQQREoQsQZtFE7HbcSbs5HCGFA0Sft/C/aA/nUe
         M5PfnDgIL3rNPCX4Pa/29GoTCLWOdlXnK5/qvVK7MlO+sYMMJCBDH0bZwDDRmSTEgual
         kSIHqUuYxjJ2M4zLHcH42nd5igPKOYk4djq4Ddf51haam/SmgWzsGHgMz7pBUKaEMwaF
         578Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790191315; x=1790796115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bf6GLnn2j60X/tEoyBage8pZiQbutJQgNhGY/VeJuPg=;
        b=rKfJEQ/kydrNhqW589eUytosZSso9qFDzEyFU+glH78qZ31Y9zdHWjwQi+/GIpIo7w
         2vswewVCG2o5/bfe8fxkCWg3Gjdq3Fgvz5jVVet0ALsfP8MB4jZsSXHk5+7GqErv12dL
         DYDLfvQsIOqg8zzw+PtvpgHsyy13WdvI309pitCn7QvG/PDXFNCMoPHx5USaRkRxnK7Z
         bR22wG8UdxxeLNj3s1IWboh8DKFxQMvNJWTguUuaMSYhcwyAzFTEvDkcwxrEq1UsqlSU
         Ah5k9duHwScgIZaTkWJZk0OR14Tvp+LkKHTH3L/sEgb9mYkWpsbuNNFK0VUgtIIbzpl/
         U+mw==
X-Forwarded-Encrypted: i=1; AKwUvBwsrJ7mQb6CtGqkGB63knbWyMaF+O5nJ7/qtxNKBb64gVow5BmchSIVkL4UOgR2aI/1cuzkeeBYMMMe@vger.kernel.org
X-Gm-Message-State: AFuF++ntGK9jEUq0fTVvsxq4Tf/0kcbyc/TLEt3JoXbdhoSYmu7JF/ae
	1FM7AYvWqs6ljTVPww5BuS2OJtSznfiF9zB01UQikFjkMYqt3bRZCnmtpk1knj4kXecnS8myYp/
	sAUaatTvRikIqlysRDTnAqzPepIgZ0WnC3+2NmD8WVULAjKdamkVekrvfRqzjmzTt
X-Gm-Gg: AYBFou1KrgM9FSbj5xrn4I1V5kDtYHjkJcDaPM1vNVKjD8m0vfTR5zcEUbqI5oDyzTa
	68S5GuX91PLisSTem4eZdRVxVPxF00VMBRuRrVpEqTa3KWE15U0NNw8VQFWQAKaKAP/hoSC+u5C
	KheUOnViZ0kHboGX8qNx9m6XE9TLgeIHvhPA2vCUZFDiEdij+/s2WprTg0ndKC4HH4wLn1YclSc
	u/bFqfKwTtirZRfAAcS3Xmvr+d5hyq0FUKajdvfh28VbAjMWClwigWyuuKZWt7s9UTej4OuQd/P
	EIhB/M/p0uy+excyUasJKXOKzqpT6qiYpfQpvfygeCYXA7a1tMUJxhl51LO3diwozAVkpoDchym
	vW2eQjij5FxxbFv2ePbB0N8U=
X-Received: by 2002:a05:693c:87d8:b0:33e:bbcc:eb99 with SMTP id 5a478bee46e88-34001eff31fmr90679eec.18.1790191314850;
        Wed, 23 Sep 2026 12:21:54 -0700 (PDT)
X-Received: by 2002:a05:693c:87d8:b0:33e:bbcc:eb99 with SMTP id 5a478bee46e88-34001eff31fmr90647eec.18.1790191314050;
        Wed, 23 Sep 2026 12:21:54 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9684d643sm17609309eec.18.2026.09.23.12.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 12:21:53 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 00:51:32 +0530
Subject: [PATCH v2 2/3] dt-bindings: clock: qcom: document the Nord DPRX
 Clock Controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-nords_dprx-v2-2-fa4364e087ef@oss.qualcomm.com>
References: <20260924-nords_dprx-v2-0-fa4364e087ef@oss.qualcomm.com>
In-Reply-To: <20260924-nords_dprx-v2-0-fa4364e087ef@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: tbCYysUXBtMYEyj3yHPV6Mpr53MUVBbR
X-Proofpoint-ORIG-GUID: tbCYysUXBtMYEyj3yHPV6Mpr53MUVBbR
X-Authority-Analysis: v=2.4 cv=WZuZ+EhX c=1 sm=1 tr=0 ts=6ab426d3 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=1x_EA7c-f_fbMv8ZdKgA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA3NyBTYWx0ZWRfX4W9vgGki5PzI
 i6TWI67txLFBSEVPVrycaBgBrYHfCDIB/14m1n4DTsva50WHPCaR6JnLermOT0Lu5J0CRC6NJKo
 hpqCxMNqueDADINJD+tHxsUKmGFuvrU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA3NyBTYWx0ZWRfX6IiINH0oeVvO
 PJJ4dTx3jjYv9cOFwXRMu5ZYV/GRkx4vZQT4MLdFc/NUEiWP91LOteJjSYH47w3g93H/fMA5Vqu
 DsVLZZgXDZEBIu4HexOapLNUiQfT3dEzUGlo2FjRl1D89+X5elv21SYxJI0ae8J7LugelOPiweN
 AEUgGkoz6zVoEH3IqfUMNTWR1+slY3uoh/UdFHhK5hoiY2rMMcDo3nrOvLql4xvDzSwoUveze8u
 BoBUgcZ+HAcyLUCD4XJ44eO9IOHzX0M9EYnPkcBSXxdY9LK5TwsM/nMX0kmUzRBncBm65inxg2j
 aKTHNbj6S+KbzaxZtr7VvsymJdGeuN/0QZm4CGM/wYJ+8PaW8yhFx0p1syLUjxExQDhnzG2rkn6
 tYfvhaOBXkB7AhzuDewaaPzzGVEsEidBLuR2UdGxw0si6kOOMJ1YndBT30Fk+5v8vQALWHAeacg
 LhGIANgcFXhuo9EKpLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230077

Add bindings documentation for the Nord DisplayPort Receiver (DPRX)
Clock Controller.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,nord-dprxcc.yaml           | 68 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,nord-dprxcc.h       | 27 +++++++++
 2 files changed, 95 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,nord-dprxcc.yaml b/Documentation/devicetree/bindings/clock/qcom,nord-dprxcc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..e3553e0eecd5027155b4dca5c0596e3140641aa9
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,nord-dprxcc.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,nord-dprxcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm DPRX Clock & Reset Controller on Nord
+
+maintainers:
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  Qualcomm dprx clock control module provides the clocks, and resets
+  domains on Nord.
+
+  See also:
+    include/dt-bindings/clock/qcom,nord-dprxcc.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,nord-dprxcc0
+      - qcom,nord-dprxcc1
+
+  clocks:
+    items:
+      - description: XO clock source
+      - description: DPRX CFG AHB clock from NWGCC
+      - description: Sleep clock source
+
+  power-domains:
+    description:
+      MMCX power domain.
+    maxItems: 1
+
+  required-opps:
+    description:
+      MMCX performance point.
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+  - power-domains
+  - required-opps
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,nord-nwgcc.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+    clock-controller@a940000 {
+      compatible = "qcom,nord-dprxcc0";
+      reg = <0x0a940000 0xc000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&nwgcc NW_GCC_DPRX0_CFG_AHB_CLK>,
+               <&sleep_clk>;
+      power-domains = <&rpmhpd RPMHPD_MMCX>;
+      required-opps = <&rpmhpd_opp_low_svs>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,nord-dprxcc.h b/include/dt-bindings/clock/qcom,nord-dprxcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..62c26b58ebef04f05ea1dc77664c03aaad65baa4
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,nord-dprxcc.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_DPRX_CC_NORD_H
+#define _DT_BINDINGS_CLK_QCOM_DPRX_CC_NORD_H
+
+/* DPRX_CC clocks */
+#define DPRX_CC_AHB_CLK					0
+#define DPRX_CC_AUD_CLK					1
+#define DPRX_CC_AUDIO_CLK_SRC				2
+#define DPRX_CC_CORE_AHB_DIV_CLK_SRC			3
+#define DPRX_CC_CORE_AUD_DIV_CLK_SRC			4
+#define DPRX_CC_CORE_RCG0_CLK_SRC			5
+#define DPRX_CC_CORE_RCG2_CLK_SRC			6
+#define DPRX_CC_CORE_RCG3_CLK_SRC			7
+#define DPRX_CC_MDP_MEM_CLK				8
+#define DPRX_CC_MMCX_XO_CLK				9
+#define DPRX_CC_PLL0					10
+#define DPRX_CC_PLL1					11
+#define DPRX_CC_VID_MEM_CLK				12
+
+/* DPRX_CC resets */
+#define DPRX_CC_DPRX_BLK_BCR				0
+
+#endif

-- 
2.34.1

