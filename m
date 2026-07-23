Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181A835E930
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 15:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784821586; cv=none; b=EmSP6kTztpZhFQ5Hrbtt244Jo8ADJru2+UBbGMHb8258HlccoNLb45D2W6uI7c2r0XkFUENHOYpZI552nRdjDaouis6ALZbc+v76loC/xe2ytJHqd3BukSxyBy/BnBu3Ra3S93AHFv/TGqEz5oPU62xTq6hpCRyY6OejEnHapLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784821586; c=relaxed/simple;
	bh=G0779222wpHFVE3E6DMAcktV/N1UmeK8d2TO0+SERXM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JB118fTN2va68OnsdltAxhk5rJS6zAcUD5aWeGMGCAnDV3JBjrOVOVS3Ohf/5pKuMnF3Dwh+fSy/Q1WpZwG2rKnj9iN5qKuFyDhKhqTNVVVohuoT4/tTVL+Qn8jdEVwO3DAdGgXrVz3yr9DJwsV9KVVPhxMCh2elIvBe8vn0F9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TehXgNY2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JDxRT16I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TehXgNY2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JDxRT16I"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvWou4078372
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 15:46:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GvaQimzu4p1UCQA6S0UYa6/yf8KCGpkef8kkj0yv/KY=; b=TehXgNY2b3ALEJ2+
	YUS7TOOTPrRrjn19+IWpiiIxxcVWvAzxhicgkSkAUQlpOlnsDVFod+LqdlRA1PEo
	183LJJBImwHRjTCyVo/JgpsDMHSBDAxXbILTJc5aDHHou+84U8Tm98KpJmOaezq/
	V9Y0/EH19iV6gAPgno67MYvCNhRwbFLC2UMTvH7l93eeSCYho1X3wHULbJj2Nxeo
	s0MDtHE4J17ARYsZNxfKzcNyKCfTe66o2ykQQC8qJxu5aQgtuQDudPx+/eM/0Wnf
	sVDZ1ZiyOFVmS+s4tXcCEAoS2orpJcs70dJ4nYEkrKc8saPTFnLbKhjouisZXdXK
	ShFOmg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkg521p95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 15:46:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccb6823efcso8024305ad.0
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 08:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784821578; x=1785426378; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GvaQimzu4p1UCQA6S0UYa6/yf8KCGpkef8kkj0yv/KY=;
        b=JDxRT16IT054WSs+vlSVatiL/je/ymaM+NIpqCw1nM6eae9pEtveTEDtBzSXPZt+yr
         ayN3Qi+oc/1K/63hFfYHaagoSrdQJYKiw4CUVli3uPW0Lpt8NJ0705tv8Yg9Xgoo0L/p
         7AXTxpV1bRCM1FLXhzFdAYEcD6mDM7JFm17ae+bLNk4/AS75G9OTuBE0u9Wp/Oqj145g
         umeE8Mh7rADqTFrmof0sytdvbjRaGKyqlFaEm45ZF2W10fmRY/eOLJSVdQnHAbNnRoJF
         lrhom3QB3BVJTdPIOI0na6jPzTisopWjp72xl+W1Acu9I/j7Hx5vD4ZVePZ2mlJltH59
         0lyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784821578; x=1785426378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GvaQimzu4p1UCQA6S0UYa6/yf8KCGpkef8kkj0yv/KY=;
        b=ehqx9V7/rXDf26/DQRh6K4JfwsLq0ZwPSZ6M+F+bDtZe9fYr+UW7FhL9fpMe8pzZgB
         RO8dzemLu9bGwfFcbxJCX45gN9F+t32sSvpr4aAn5uQirJ4A4xuscjDhQ0dO9JfaJq6r
         UXkO1cz3E537d2gNGF8RFlUJRPS4h/28LrrCXuPgg6iyL/ToLMo4pRXYyxO4HQGZGQVX
         YMXRVYJTYBViA9MqSgvExto4PG6w/Y+bM1FhliRi57y+cGr2njukR+k5QI9my2kNCkGn
         l1uYxatfUfKNM334DHC09867BUhaKZcypE6H13VrVEr7W3a/mqaCEWTAknRCLNgzv/0y
         qR8g==
X-Forwarded-Encrypted: i=1; AHgh+RpgMGDQmScNWhEnprWxLtHCaFgZOOn7J3t6eKRTdxQ3Uwgp9Y/nsx/0DjlUlRdezoSGwxBO++Kklt3O@vger.kernel.org
X-Gm-Message-State: AOJu0YyGVnYBDKyRbbtdkgLXjx5e/Dc4vr5KygU4kmXjKRORqinAaAEE
	juwjFwyR3NHFxmYqaCUB9tIWrDFxtunLLd8GOzqEyb7GEizDFgjGELhvczJuhI134TYpjOiiSwz
	pgKGDOIduv8cQqhQjzDE0uhxoLZHgEyOCvQOa6H8lt+2l24dTFAiQHN8zj5YHze5qezIftyEc
X-Gm-Gg: AR+sD10DxyXENrfcx6Mvh/WTo2drWC/iJpHHx4cjXTy4nV6QYlyxM6Am81Q05QyjufM
	/u4ImjY8gaTKJ9F/Tzqh+JlDicmAUwRVnEbQd0riW2kZevFsGpTCablsmEdh/mU1FU3qftcrAge
	jDUFdh/lABRGo4yCL8MeC0OsdsKmg6ruM/Km3SD3Qo7L9Ko6gutTv0IYca6I9HIPdjrX7eY2uDD
	SBz5Xr+/oUhL+aaIiPoCs9RBtUS7p/Jq6PAMm6gdDoYx348FcdtlE+CU+2D0eEVO+q3epDBZ+hY
	0/gbohd7ibPh91RpFsaUkQvxl3o2VJH0JaHWY2zeAFg4oDuKA2UuzQKlTpJE7jAqHLcEbAVMmNt
	Yv+ydUajRrankE0BDEdflvyLmJe2leIE=
X-Received: by 2002:a17:902:d582:b0:2ca:c68:c554 with SMTP id d9443c01a7336-2cfa6d87214mr39727875ad.38.1784821577542;
        Thu, 23 Jul 2026 08:46:17 -0700 (PDT)
X-Received: by 2002:a17:902:d582:b0:2ca:c68:c554 with SMTP id d9443c01a7336-2cfa6d87214mr39727425ad.38.1784821576968;
        Thu, 23 Jul 2026 08:46:16 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efd7157sm36242625ad.18.2026.07.23.08.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:46:16 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 21:15:51 +0530
Subject: [PATCH v3 2/4] dt-bindings: clock: qcom: Add Qualcomm Shikra
 AudioCoreCC and AudioCoreCSR
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-shikra-audiocorecc-v3-2-90b878ae0d4e@oss.qualcomm.com>
References: <20260723-shikra-audiocorecc-v3-0-90b878ae0d4e@oss.qualcomm.com>
In-Reply-To: <20260723-shikra-audiocorecc-v3-0-90b878ae0d4e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=DtZmPm/+ c=1 sm=1 tr=0 ts=6a62374a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=Z3K_AQPDDkgJnXkyaHcA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE1NSBTYWx0ZWRfX08dCbpWhisGx
 VElqHFGRIQl2r86M/CTg5VbIaUjFhFmzr6UpNgUoLxOcOppq0fwRnzNNvze38N+XyzcVktptgbn
 vDr1OWpwmbTQrgDuRSsZoIyd0V0wOHg=
X-Proofpoint-GUID: 0HXuNTP8FFik_pJoOnD_PrzdVAKe3zkH
X-Proofpoint-ORIG-GUID: 0HXuNTP8FFik_pJoOnD_PrzdVAKe3zkH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE1NSBTYWx0ZWRfX/RHNd7+OHhv3
 Zs4rm73lrrPCGyVtBkZyYF/NlgzacJjuAHu3JY0OgjtDTSURmW2ZwCkt+y/NUBM/aqK+99mvTZl
 dlndS5216wJxVu2OyRL+/ux/aYRY1tOz0Z5Wufyfyk8fkYB4Pe3HBJKI5Rb7I4lzVzPa3V8OTru
 Y5+hawbfXpp3GCfTHvEHVtW3vVypaSughcPDTn4Vph4DWF2dIUT19wg1GNNr9yP9/15m4qj8Egv
 TRMNC62EpcPBASgqbgKIj4klSdMM2Ebgw9zzftL047Vr7Fm/2MZwnuLXNg4OTrhzkHPuU/PzkeD
 ZwL7fC+YEM60or0oKynARW5gnt6NnB6SVpeF78+RxQcYYStRq/nc5vSAXIpi4XDe1g3JYxvNjcQ
 ObG4IXKnSh4DfMM6A/1tUXegSi8U57LhbfOHoA7k/OXNIvjfIWuiqwumRFDOXz9oPQ2y3hTMARg
 w1e7UlxNu/56LWQ1biw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230155

Add device tree bindings for the Audio Core Clock Controller (AudioCoreCC)
that provides clocks and Audio Core CSR that provides resets on Qualcomm
Shikra SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 .../bindings/clock/qcom,shikra-audiocorecc.yaml    | 55 ++++++++++++++++++++++
 .../bindings/reset/qcom,shikra-audiocore-csr.yaml  | 42 +++++++++++++++++
 .../dt-bindings/clock/qcom,shikra-audiocorecc.h    | 49 +++++++++++++++++++
 3 files changed, 146 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,shikra-audiocorecc.yaml b/Documentation/devicetree/bindings/clock/qcom,shikra-audiocorecc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..d59f7e47a0d7d9ee9def49be9954038e43785e91
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,shikra-audiocorecc.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,shikra-audiocorecc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Audio Core Clock Controller for Qualcomm Shikra SoC
+
+maintainers:
+  - Imran Shaik <imran.shaik@oss.qualcomm.com>
+
+description: |
+  Audio core clock control module provides the clocks on Qualcomm Shikra
+  SoC platform.
+
+  See also:
+  - include/dt-bindings/clock/qcom,shikra-audiocorecc.h
+
+properties:
+  compatible:
+    const: qcom,shikra-audiocorecc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board sleep clock
+      - description: Audio ref clock source
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+    #include <dt-bindings/clock/qcom,shikra-gcc.h>
+    clock-controller@a0a0000 {
+      compatible = "qcom,shikra-audiocorecc";
+      reg = <0x0a0a0000 0x10000>;
+      clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+               <&sleep_clk>,
+               <&aud_ref_clk_src>;
+      #clock-cells = <1>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/reset/qcom,shikra-audiocore-csr.yaml b/Documentation/devicetree/bindings/reset/qcom,shikra-audiocore-csr.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..bfad1d20e7cd1281c4c182d5f9f887d8c4c86125
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/qcom,shikra-audiocore-csr.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/qcom,shikra-audiocore-csr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Audio Core CSR for Qualcomm Shikra SoC
+
+maintainers:
+  - Imran Shaik <imran.shaik@oss.qualcomm.com>
+
+description: |
+  Audio Core CSR module provides the resets on Qualcomm Shikra SoC platform.
+
+  See also:
+  - include/dt-bindings/clock/qcom,shikra-audiocorecc.h
+
+properties:
+  compatible:
+    const: qcom,shikra-audiocore-csr
+
+  reg:
+    maxItems: 1
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    reset-controller@a0b4000 {
+      compatible = "qcom,shikra-audiocore-csr";
+      reg = <0x0a0b4000 0x1000>;
+      #reset-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,shikra-audiocorecc.h b/include/dt-bindings/clock/qcom,shikra-audiocorecc.h
new file mode 100644
index 0000000000000000000000000000000000000000..0e64a42523f1ec4213ce8cbbbe6f8262d414f0eb
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,shikra-audiocorecc.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_AUDIO_CORE_CC_SHIKRA_H
+#define _DT_BINDINGS_CLK_QCOM_AUDIO_CORE_CC_SHIKRA_H
+
+/* AUDIO_CORE_CC clocks */
+#define AUDIO_CORE_CC_DIG_PLL_OUT_AUX				0
+#define AUDIO_CORE_CC_DIG_PLL_OUT_AUX2				1
+#define AUDIO_CORE_CC_DIG_PLL					2
+#define AUDIO_CORE_CC_AIF_IF0_CLK_SRC				3
+#define AUDIO_CORE_CC_AIF_IF0_EBIT_CLK				4
+#define AUDIO_CORE_CC_AIF_IF0_IBIT_CLK				5
+#define AUDIO_CORE_CC_AIF_IF1_CLK_SRC				6
+#define AUDIO_CORE_CC_AIF_IF1_EBIT_CLK				7
+#define AUDIO_CORE_CC_AIF_IF1_IBIT_CLK				8
+#define AUDIO_CORE_CC_AIF_IF2_CLK_SRC				9
+#define AUDIO_CORE_CC_AIF_IF2_EBIT_CLK				10
+#define AUDIO_CORE_CC_AIF_IF2_IBIT_CLK				11
+#define AUDIO_CORE_CC_AIF_IF3_CLK_SRC				12
+#define AUDIO_CORE_CC_AIF_IF3_EBIT_CLK				13
+#define AUDIO_CORE_CC_AIF_IF3_IBIT_CLK				14
+#define AUDIO_CORE_CC_AUD_DMA_CLK				15
+#define AUDIO_CORE_CC_AUD_DMA_CLK_SRC				16
+#define AUDIO_CORE_CC_AUD_DMA_MEM_CLK				17
+#define AUDIO_CORE_CC_BUS_CLK					18
+#define AUDIO_CORE_CC_BUS_CLK_SRC				19
+#define AUDIO_CORE_CC_CDIV_TX_MCLK_DIV_CLK_SRC			20
+#define AUDIO_CORE_CC_EXT_MCLKA_CLK_SRC				21
+#define AUDIO_CORE_CC_EXT_MCLKA_OUT_CLK				22
+#define AUDIO_CORE_CC_EXT_MCLKB_CLK_SRC				23
+#define AUDIO_CORE_CC_EXT_MCLKB_OUT_CLK				24
+#define AUDIO_CORE_CC_IM_SLEEP_CLK				25
+#define AUDIO_CORE_CC_LPAIF_PCMOE_CLK				26
+#define AUDIO_CORE_CC_LPAIF_PCMOE_CLK_SRC			27
+#define AUDIO_CORE_CC_RX_MCLK_2X_CLK				28
+#define AUDIO_CORE_CC_RX_MCLK_CLK				29
+#define AUDIO_CORE_CC_SAMPLING_CLK				30
+#define AUDIO_CORE_CC_TX_MCLK_2X_CLK				31
+#define AUDIO_CORE_CC_TX_MCLK_CLK				32
+#define AUDIO_CORE_CC_TX_MCLK_RCG_CLK_SRC			33
+
+/* AUDIO_CORE_CSR resets */
+#define AUDIO_CORE_CSR_RX_SWR_CGCR	0
+#define AUDIO_CORE_CSR_TX_SWR_CGCR	1
+
+#endif

-- 
2.34.1

