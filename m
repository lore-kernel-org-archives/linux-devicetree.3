Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F494C041B
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 18:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783535138; cv=none; b=FwLjWrObyc1szxSsr0jnBCBsgEjcfMr5jrnIpxk18mftZvqwz5xvD32WeMo8wAMZVg2kWi/JAkMx2DYG3IfI++gendpgxghqV9tx50LafSyShCho/Siqm1pj5/SRx46drVHEoHjtssK5RS4sibhspIUgsNBZKM4DFBl66xwvabA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783535138; c=relaxed/simple;
	bh=5+tOIwKjFEOViCePhwuk8uzWNUyFlbnCkTYOxe+u4rQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tfBSjek+D7robGqqQhQTMMis6Wa/lI2yq8xkM9RGh190KYUXTJV7JmJRyQPDmQ6F2CG0kOsaJ5n2OC4Ljv2NtZxeS8S2EnZHLzE9C9Zkviyo7nJ41BWUhhdEJ3m31ElrDAnADuqAsrKVYh25tEjzSl3yTiLmbxT+AbdI/SpRsKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sk8FfjU5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R6fNoImJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sk8FfjU5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R6fNoImJ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668I5bUA3574553
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 18:25:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tN5xVRl1DL+Wo7vUVaiIf7dOahvY+oVlKkNrh3pgNME=; b=Sk8FfjU5GLvHMFJB
	3eR1yBnF/n8m0LnjcEUPdFp6W/2DibP0GV8EiXaNkX2pF/hJV7Hbh7/am8uG2A3E
	Acy3qLxLSfjWC4xmZlRYGV+XSA3mmPGqK54et9igrS8Gs5EYvq50iLKrKfAlmIDw
	ERTaVKd/FwhrCUV3LVl2J7XAW+0Nd7txz1dsDNXjRTF7NB/LsK1KuS0eeQdHwsA4
	y4+0hqNTLV6QyDIfkr6YSqR948nJAmMx6dPR6RtN9yFHu4pGR0YPuFLALoaWAHd+
	mrvQfnJ7sb02+7ulSIpK4udiANZOYPpXdaKhAZht/OJNXPko7bM0fiDkz/eY27dd
	kSg6ww==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9ug6g47x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 18:25:34 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c9c26587e67so159944a12.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 11:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783535134; x=1784139934; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tN5xVRl1DL+Wo7vUVaiIf7dOahvY+oVlKkNrh3pgNME=;
        b=R6fNoImJIB65+ZMz/VpvGr7x5ZcH5zJODn7VckrtpqXl12c3+xS1AQ/FOt6Db4C8wW
         m4mQfNPgAaITW6xD15bmkycDbm2d3P+7autDCThz8wC28wwYq6vTJ5uqI48tQqhNngIW
         11pLa9SnhU+gZ/xxL70En+3kFwok6rV56DOOr+Ry/UEuuSK7LovbzZvKnu3GoD1to4EC
         BCV/WE9X0LUrKywhrJOkjyTZTkFhBLSEaFpZ0Vwi7owHh2UfkDKWzBczDnvPt/LPoHPG
         uG00+kU4AJ5sQtDwZapNWLfsPWlOGMtKf/H1rmWTE8crtuDgtp0NZB/DodUYItN06XDr
         HsrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783535134; x=1784139934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tN5xVRl1DL+Wo7vUVaiIf7dOahvY+oVlKkNrh3pgNME=;
        b=fGsB4Jr32UehMdou31+bA5oDQqTp5QFKUYO9+KrDmoBl4tV3MtqWXPC+AIbh6qtJZM
         vma45Sz39xm+qf2pKKdNOMBW4th+/j3HYr+kxNguUbqqE4AFf7Y8Gd7brVd/B8T0ebzq
         zvQeopOGpQs1x+fW7mkBhVCWzImENBtCf1CaynUMXlyYpA0vHZI37ryyBj5BO5njVYhq
         tS/VedQr9IDAbNz4Qia7s0RywhcyLKJwvpeYDxH7b+oYJtruVCimpFlTliPDV0C6D/pK
         f6BFSTYxjK6i6LOcAI2lV3cwED7HXePCalvmutxWBNg/me7FSDDJTXzhOpspFMjG6Vub
         vxNA==
X-Forwarded-Encrypted: i=1; AHgh+RoF7oI7Q9y9uKondIaR/F3y2rMmoB3UqZ26pvVcxhjoH4n8jbCR2zA0d/WnWB+I9VFPlVRCXYqnO0im@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4yNUhD0LosmCMdwsbudfaan9Har9qQ5sF696ZaUBcYoDBuSpb
	0no7AyGDlWPUeIcMZEdzbYqFCUCbhsvuVxWoSU/ZoXN9DLQ+g6DfnWpHdr7bCJZ5JgRFfyA9W4P
	/JaOsmt7+Yo+5q2jIO0BU0JFp1pf/hSWa0mJpS4PkYWmhXkH5xXrZBoXUA/jjrXV4sPP1341l
X-Gm-Gg: AfdE7ckaJwEC6Lk0iGujgb8MEnRGiEDyqWHJI0nHa7cZufeTl/FzTwslXq0Tj2AO1GK
	8oGqWV+/LtvdkblIdqXdzgJh07a9FrOiDkNc//zGmlG47vDDLKw0CX3gzqFk9oKgdMvMl5m5O8d
	m8UD5iOe8rXFZ1usWs1nHQDkOzlY07/Jjzqkg1yYShPy1TRTX41T7eO0tUR9emf1egKGW3bziXk
	ZzEDnFK7GgXL/i1sOgWb4iKaWSmCZwNQrVDNyS/M1ySElAiRdEPZO02clO30l4HQTaH5KIdzZVp
	407A+CtC6rtNdCLEpJSBhXoBaXTIYkpe3OciSlLYnmHbFiDFj9qr19wgv4JCzAAo6KHYl2rgFHD
	egB8iIECni7nVyvRiN72jdeT0IUIF9kLPGGj/hjVZQg==
X-Received: by 2002:a05:6a20:cfa8:b0:3c0:9acb:3ff with SMTP id adf61e73a8af0-3c0ba29e14cmr4396672637.36.1783535133967;
        Wed, 08 Jul 2026 11:25:33 -0700 (PDT)
X-Received: by 2002:a05:6a20:cfa8:b0:3c0:9acb:3ff with SMTP id adf61e73a8af0-3c0ba29e14cmr4396641637.36.1783535133447;
        Wed, 08 Jul 2026 11:25:33 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af7d5946sm2671098a12.7.2026.07.08.11.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 11:25:33 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 23:55:06 +0530
Subject: [PATCH v2 2/4] dt-bindings: clock: qcom: Add Qualcomm Shikra
 AudioCoreCC and AudioCoreCSR
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-shikra-audiocorecc-v2-2-b320d822cdd0@oss.qualcomm.com>
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
In-Reply-To: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE4MCBTYWx0ZWRfXxhWcrm9UXq8S
 ZlzYLRPW8DxDz9wnKHJJJeBDR2YijHkJ7OD1i6O4to/grZ9v3GI9j0qUF+fvBLRdxMAD+WfzSVJ
 Y7MUVOjscYDXn7BxqiwJReFR0cnxFIk=
X-Proofpoint-GUID: 0wn6_6etuhZZO7DE6gnrGdqSDg6WPWrd
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a4e961e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=Z3K_AQPDDkgJnXkyaHcA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: 0wn6_6etuhZZO7DE6gnrGdqSDg6WPWrd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE4MCBTYWx0ZWRfXzODXr3PqReRi
 J6xAXc7jKSvxSIoctIlzCxhDEZciVvOgcj2PwOocuh5wsnz60SkxP37Afzz0Xb512qaBdanLWJz
 U8ERhs6aDZ4FP87DAcMIv71ChieGSo+He7nghsnCaHPOYkCb6xakcGCGbc7CUHSW0uboasFkWtL
 fOmfTsxblfgkGNWwK3cU2QoqKn1zAN77xdW1pRifuUWyzcx+7dMsS06l28IG52J/3H12J+GQA8I
 IGngamEaJLG++C9AVd8aDoAycZBsPJn9pVq71roqJT9YEneOCIraLu3Z/H/KYrXqaEob7OFQKrG
 XUXTV3yUHrC5KAnp7ehxRRAlR4FTGI87lMibDYQfpeNVFssBlrMdEnOwvF8LAj5pGY8BJ5I5cX8
 UL4Wfw8xR9u7UFXz6Y7P1od+bn725ewZ/b/sUAhcApUQ5zLbswfp/cYUkAg5jx1mh/G51HzgmxO
 lkudUY1TN7IY/zo+y5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_03,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080180

Add device tree bindings for the Audio Core Clock Controller (AudioCoreCC)
that provides clocks and Audio Core CSR that provides resets on Qualcomm
Shikra SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 .../bindings/clock/qcom,shikra-audiocorecc.yaml    | 90 ++++++++++++++++++++++
 .../dt-bindings/clock/qcom,shikra-audiocorecc.h    | 49 ++++++++++++
 2 files changed, 139 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,shikra-audiocorecc.yaml b/Documentation/devicetree/bindings/clock/qcom,shikra-audiocorecc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..1ec24951316842fbe3b0bc5c0e7e80c0d9d8d637
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,shikra-audiocorecc.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,shikra-audiocorecc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Audio Core Clock & Reset Controller for Qualcomm Shikra SoC
+
+maintainers:
+  - Imran Shaik <imran.shaik@oss.qualcomm.com>
+
+description: |
+  Audio core clock control module provides the clocks and Audio Core CSR
+  module provides the resets on Qualcomm Shikra SoC platform.
+
+  See also:
+  - include/dt-bindings/clock/qcom,shikra-audiocorecc.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,shikra-audiocorecc
+      - qcom,shikra-audiocore-csr
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
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,shikra-audiocorecc
+    then:
+      properties:
+        '#reset-cells': false
+      required:
+        - clocks
+        - '#clock-cells'
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,shikra-audiocore-csr
+    then:
+      properties:
+        clocks: false
+        '#clock-cells': false
+      required:
+        - '#reset-cells'
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
+
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

