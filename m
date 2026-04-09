Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8033D1CC0
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 18:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775758270; cv=none; b=rVFj2PHOoFDeOmA4FHcKiqq3fMVJBnJiTogmpMztkQl0oxIpcmhcVqGivWoAMdN43A9NnOx3Hc4vIuY0qiNc53suZ0aQhhDhi5EoGnW5ei0oqdAg0k/wi+8zRyfBHWICgkuR/PzPduwYVkMhEJIbBQ/8YnEzury0VsaHfr9VGCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775758270; c=relaxed/simple;
	bh=1yjzO1sLMiJzWkzUgEx7Z3qRZZ14NfNa5E01DO1kMUc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EEdczjDI42C5+BDMgL5MPW56nJaAeVgZm2OI4ZMnovPSOwk/MlrwJrS0RrEV6OXjE+rQiFeX1diUVCxtIL+zgctqBZk78RxKib2nXvOronoQJovkpTcjspfJl8kTFZ4LDjiXUEUHyqOsvxMPRdZbstQgk1tN0B/69Y7F75TMf6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XKvrJSQD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WeaynBQV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XKvrJSQD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WeaynBQV"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639Cxmgw1729917
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 18:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LsdYNRKM7gJvG9sWEFYTczXbszVaCSCTuz9faLmMR/A=; b=XKvrJSQDAgXU8sK3
	xbOjc8eraxv+LNeSD8Eq9ob7R9xjRHIl6mnk/g5ngqdG4Sw4eTrnsf6lYhK8nXbV
	ZJnswpX7BKqcdN7CrMQzv91IJhIE2exj/5WnzYMrMqdVEBfECnIdmsGp4nR6iQZY
	IHITAuUgU0HDbIywHv6QQg1E7nd2/0VDlL7va2iN4++fTRAULc+plre7OWbCPhV5
	Zl7bNSYS2iFNujDhIYuLDgh/TEsTkL3HCgdyl1rSif8LHaMuz7sBtHSX3ZXkqXcs
	awVH1bllaa9171wbpCMBBuPtD/BMjEOGP3VUSaQmsH2RBgsZ5P756+tsgQP3BaPA
	bGJRBw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deckxh5xa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 18:11:08 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c76bd4feb9fso841647a12.0
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 11:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775758268; x=1776363068; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LsdYNRKM7gJvG9sWEFYTczXbszVaCSCTuz9faLmMR/A=;
        b=WeaynBQVFyudviqQgMJ4eF8tOfnYafZNJ1PRusE1yFrn36rnJSO+uxtmEa+FAAyo4M
         VRbdUPEXAUFzCot8TxfeNKalNERCAAM4bpBBPhbIRpPX6vrSJLRoS6NreQDPe/VDArzY
         KFhXp4wX0ZPc1Bqe9ODfy2ElKNhuLc3fGs/hGUCnC/KppEXhPUnmcwU2yZlstRL9+9U5
         7ZDqFGm9x9MtfFW4EiZzX/L43e0BweYqgXQst/TCJgDmoW4QQlRUxLAxGGfEH3bIbxBt
         /tVEcAZzkeymrP5U4o1vojvl/tMlQHUxc4JJkFFrbBtuhg71hraBdu9KrdRvUgGlp7et
         EHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775758268; x=1776363068;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LsdYNRKM7gJvG9sWEFYTczXbszVaCSCTuz9faLmMR/A=;
        b=rHBxg3xG9r9Ega/iRhaVaA1Z1KVmqyyXZ/WlbYiwi243+RbopxowZOEEhTTmQv8N3R
         SoUMsXM4lHDxChBead2Pa88Lt42Ky2hV5UaThFccrK2w/vJARembeMuEjhrTNfw0GeBR
         HVqrtVOoFmLpQTpdB67QJeEKaFfr3xUDgHEQdvtDh5Fh7zTJKqV7h76g7UAndmAvzNvh
         dR8zLqmSstT9DW+YT8AYWKsvPJ2WjtXCxZkTJ1Wca95zbIUM5g6KtIlt2L75SxcZxkd4
         RCDKT+ji+Pz2cT8NoOEhdHqVsEY4veggH4QeZ3tdnsM+dY9sgJZIX6LERue5Pvo0kS2w
         MlnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWD8nyMuUiSki5WBDpFw81ioInmD2KoMHbGTDN1iSafWV/H7OK7D34wutX4R/tTAy98KRkc42ZayUyh@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/uWeJHbWLGlTpt5aC8YFRuLhvggGO/UTHhw93NrVAZGBtrJMj
	eAxHM02154x/KP883dS0c43qKkPNXktdd6gRTwsXRhqZ6JIarOoQxoUIcFOWnihIH6ZhcWeWqb9
	DzRYd6qlxiJP5+dQGl8beSfQ9WVlCX6WkbGQdZs7mjvAFb601PyvloatKPGezOHVL
X-Gm-Gg: AeBDiev1PDF16hcwjpR8VWSjLJCU5aVFtQ/bznooAPZO8xwlRCMGM4P+YAygSNxrnxN
	200qTmntfuOyCDeCOPWFPxaKH5Y5rNEBFVb7v6Wch/EJ77Drw/nAQwNMFciMrbATptLx44pIndB
	K7VMLG3Y1skuy/2rFCRec3pqxH5xM0JQwnnfpz9tkkWVTHgkz5iyij76b2VTmiriduBO+eSo0pB
	rVcb6/qwX1aHNXDclJHi8uA44QbIbqnq2w1IbAXVkgfU7duUn0Jts/LIpfWJb7pldjJUt2l/wRf
	ivUrPHbhpl3E+SH/lDz+mIxnm1w+XHjZELUInCoXREd/kGKFsfIUN5nD5aeeuzNH2QdZHtCZ6XX
	UNCbpDV1pMf6W30XEsHn0nl5TlxUU7eA8LFo+QjXhn2zQxA==
X-Received: by 2002:a05:6a20:3d0d:b0:39f:2b71:d79c with SMTP id adf61e73a8af0-39f2f2f733emr26752539637.60.1775758268190;
        Thu, 09 Apr 2026 11:11:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d0d:b0:39f:2b71:d79c with SMTP id adf61e73a8af0-39f2f2f733emr26752500637.60.1775758267599;
        Thu, 09 Apr 2026 11:11:07 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7921a2d9ebsm66132a12.30.2026.04.09.11.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 11:11:07 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 23:40:42 +0530
Subject: [PATCH v2 1/8] dt-bindings: clock: qcom: Add video clock
 controller on Eliza SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-eliza_mm_cc_v2-v2-1-bc0c6dd77bc5@oss.qualcomm.com>
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
In-Reply-To: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
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
X-Proofpoint-ORIG-GUID: WuRovcVm_QRGgzTV82_Z6LtZoli8zYig
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE2NyBTYWx0ZWRfX78g4YtjlmVTC
 0ioIyHIVToiCyPR0eDR2zHCbGFxVBiZvlx4z1axZSFmnWl9gNNQe1OROsYwXXdmSE3Il4KRr+bo
 rKjbmLN2iBTjGtxio3naTRjcvklPOvAnPmhe2C0SNC6DAGk28WlYeVncPL93d16QPxUw4W7WRNh
 FR1n4GqUnxBlx/BkeKb8M7xk/pwyUwEfoP3N5s+UW4DrQz+IJblWvn/t/Nx9tKogPdmLW3oR8G6
 2l813g9clOQzYvKQ9nXKg2oaEQHIMeu0NwEvUazjo9wPPTyTJZOflrESe026/2KEQ9QqAoJgjWV
 2WWpOPFYseytszwzJN0QkJbK7M78LFfu6GIfho+G90cjY5LZh9RAVIsyOms01ken55sntj3WawO
 UvEMEqlUO1k08ZTONz3F7MVmuvMxlyQXMIye/A/WkWL3kHjsCMkScHYi3oqoMo4foTmoI1MQTij
 lDiIqHD4ESrn7J25QCg==
X-Authority-Analysis: v=2.4 cv=OMcXGyaB c=1 sm=1 tr=0 ts=69d7ebbc cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=O5AFsRJ8ltlpu4YWMHwA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: WuRovcVm_QRGgzTV82_Z6LtZoli8zYig
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090167

Add compatible string for Eliza video clock controller and the bindings
for Eliza Qualcomm SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,eliza-videocc.yaml         | 51 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,eliza-videocc.h     | 37 ++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,eliza-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,eliza-videocc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..26a0c85f26b13ca8e7a4f5f418e8c98235f10558
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,eliza-videocc.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,eliza-videocc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Video Clock & Reset Controller on Eliza
+
+maintainers:
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  Qualcomm video clock control module provides the clocks, resets and power
+  domains on Eliza.
+
+  See also: include/dt-bindings/clock/qcom,eliza-videocc.h
+
+properties:
+  compatible:
+    const: qcom,eliza-videocc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Sleep clock source
+      - description: Video AHB clock from GCC
+
+required:
+  - compatible
+  - clocks
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,eliza-gcc.h>
+    clock-controller@aaf0000 {
+        compatible = "qcom,eliza-videocc";
+        reg = <0x0aaf0000 0x10000>;
+        clocks = <&bi_tcxo_div2>,
+                 <&sleep_clk>,
+                 <&gcc GCC_VIDEO_AHB_CLK>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        #power-domain-cells = <1>;
+    };
+
+...
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

