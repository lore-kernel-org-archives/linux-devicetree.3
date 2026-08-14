Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF18C427F80
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692807; cv=none; b=djhJsBza0vso8qSlsLMiVXJgCyGwM6mKs+WVsYiibdXjKc05gp9PJ7Kl3YXobmyHwVjhQXvr57xOy55yUxWCGUbbJQCMHdaEy/7e7onmqqL349KQInlLO7MW7l3bsugjG5x+oBtOdfbkr3DlB3pfG0WuRHF8ZJmpvPdccQDXVZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692807; c=relaxed/simple;
	bh=4z/M2eUF++qMVVESopEVCO5xHLKHISN/jqlSOg71SV4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bPm2UjEKfzZSrbn1tGq7iTJ9p4q7uZUNVjAm2lu3TW7BIQQe0NdGDKd01rqScQJyWjUjysSUqZ7aMuEZRZ+QKDRxzs/u5rvd3ZlmS44QAd8ySSJ/+DPhnSSm+BTB9E87HMMbg5zkdL+eQBjQ5yPvY5QozjQ6HddcfH5DsS2lX8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JO7d7EFR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZJX4ryXt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JO7d7EFR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZJX4ryXt"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4QYer979898
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:33:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A3v6CEl22R3ZSvcqUczYoW5Tyuq2qb91XkxugMVwZ7o=; b=JO7d7EFRu2glBHAw
	bAN6yPdczbHuZT1pSDgP9hlRmEqT6vOP87+s8dHg4552v7Tk12oQLe0lIqbF4eKM
	op+GKvuYKB930gzHJ6FFgNUaBYrN+6lNPQJZih9uHF0xsuFfopszmdtxghveuzSe
	hgfC4jWrQsut9KLyUIJdFiyWKgoutmhpI7yCaQ1gUYaRUCBoe63lBNjHxHa43A/5
	fzysoF61a8zX/XmeAowlHubC3SrUHYe6Zi7suXXBP5Ly5q3DtG2VxR3/Ze2hVHQ2
	zWbBRU/2DtMYNstHb+mhw10DjMJw/b9p2FXY7wWP0mjywQCbB0PXYdNo0FXzQdkM
	w/WPcg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1pea1qns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:33:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e2f61c09dso917495a91.2
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 00:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786692790; x=1787297590; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A3v6CEl22R3ZSvcqUczYoW5Tyuq2qb91XkxugMVwZ7o=;
        b=ZJX4ryXtAEghn+R46jGvq936F2ElKD/9vZ0A7Nkxx9x5YhrVSRpG4cxBqH5ZlDl0Q9
         EFIcU9qxdov9TUNI0JR6jFxhmpdHSj0v6rOEImQe+B5QkD68lBEj+E8OtOUzSTjqp7LD
         tgDt23wUFWbhwBSQqCI3NdV0wlsVpBss5oXM6gAP97aC3kE/3XGxzi1Iz0m5E7Nzyg7D
         g6w6bqUb2ZSMqJXQMfDHgf2kBqViTd0WRM7JLE77M38pIOMMVepTqEgbWYRoBFz3zhDs
         9JgUvsBBkSy89tHsm13vYm866z9cc7/QkN8I1DdE2Ce1rWOFISkTbkMbMmTBeHt4ZyXK
         GC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786692790; x=1787297590;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A3v6CEl22R3ZSvcqUczYoW5Tyuq2qb91XkxugMVwZ7o=;
        b=pzEUIP7OuXE7cIa8v3ZNy/EiBSDQEM83Bo4mZygiJqE/8PBvfnX6wPd3RzezdIGGv9
         xKz1zGhMUFvj9+OwpNOeM5HHdJV2VjXN97fbsb0M7cfMIj0Y/41dqurjI2ap+3GakUH2
         e/xvXS1qckrIiKy4dMbiQMhFbjFjPipH9KWBVxpsX73zy10/la2zqfw7zYHIMC8J6Rzr
         XDV90AoS5SEdgjX5T00BFouCJgZk3D11LIlhbiBnvmFiO2z4bEwp4pF2jnKFVq479CNj
         GvihhiGOf7o1D/1NYhnFH7l/+k1GqY/aY9bzULwPGQ9DjB8App2zChcCJhgOLY1PZqJM
         I8FQ==
X-Forwarded-Encrypted: i=1; AHgh+Ron9/DBMB/OFfDs+1V5rngEsv2uqxnpj67pKs+otShsUtaBz39+5uyUelyHnGRKzHRHrqiA/HbL4m8Q@vger.kernel.org
X-Gm-Message-State: AOJu0YyAVdN222oIslXyDtHthYVvOIGXllBS+OIVVcFEJMIkFsuahVcA
	TsjVDRTpVtZNuHzSOKLhIbjrfppzPJWJ1q/I3DHJTs+niTVyt0wA+oqMwUZSeZmW1tGDUanhpq/
	uEzCvfphBm8dkDkN2+VJrhcr9KBr/iIgia22EFaPkYt26ISOs+JyQQq1uHwzQorYB
X-Gm-Gg: AR+sD13j0c6mBNWB4wDKW8tTEBss7G9/L6iDsYYcUDGLzt36WXbiuzQPWqr1v0xVizP
	mYG6zaurcsxLw7iQY5j4SMjIrahJeN+mvfQWPq2T53vpsWN9Ay5smHzSa7qFs+FZmE3150Fj4fB
	m44pLIM2KAGLbwK6C9ASl4FOw2EJWQZeApFeU0zyQLGxyOimqTRY6U2+DY1pV69SXNn8vQwn+vV
	k23gg7oCqXkutKxL88ODLVHQpETWoRDFv0TP6TdJeq9POwE4o3ELwqHv4WaAu4m8PDxd13v8ACU
	i6pBnb6WjBUMG0/ypHNVPDX6wgIJCAzipM+vHx6q8k6Tj75yu0m7eCiTRtBTXhp6aa1an+a4W6U
	m9jzuJuHamsTspvb3v80BY5lPeqr8MOC+1nwcePYvMb6oSkO3SniaDce5sCf2+4ESoREXJQA3jE
	45IDcWp+NuDx4i/WsTjMRp7KU=
X-Received: by 2002:a17:90b:1f88:b0:392:c868:35af with SMTP id 98e67ed59e1d1-3933bd46d96mr4390030a91.20.1786692789842;
        Fri, 14 Aug 2026 00:33:09 -0700 (PDT)
X-Received: by 2002:a17:90b:1f88:b0:392:c868:35af with SMTP id 98e67ed59e1d1-3933bd46d96mr4389986a91.20.1786692789380;
        Fri, 14 Aug 2026 00:33:09 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea804233sm1062280eec.26.2026.08.14.00.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:33:08 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:01:39 +0530
Subject: [PATCH v2 08/15] dt-bindings: pinctrl: qcom: Add Kuno TLMM
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-kuno-soc-support-v2-8-3079794f0f73@oss.qualcomm.com>
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786692714; l=3960;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=4z/M2eUF++qMVVESopEVCO5xHLKHISN/jqlSOg71SV4=;
 b=hEeDgEgfigIgPHtEobpT5LzskiygxdZVnX2CdaOAWLjSjBFijGbnfdypOdmfi+V70J0wZrgYV
 9Uxtp4FCfLTAxs6dYTuBNUJPLrrVOKEgljY70GNM4h2fQK31poTO2zu
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Authority-Analysis: v=2.4 cv=TbGmcxQh c=1 sm=1 tr=0 ts=6a7ec4b6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=CaveSyEksWnKhASb3GUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: n9pyt6O-miHGYDGCnwxey1Jbu6UPbVqR
X-Proofpoint-ORIG-GUID: n9pyt6O-miHGYDGCnwxey1Jbu6UPbVqR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfXwrF9omVKhVHc
 sRoDpH+o91Tzb963UeuVdt/5gRC2fL363lafhz+tirJtg+Hw8F2HugEqw8k+LwPthhozIvK0aMG
 JzRwYX0RYFJcSsoA+TFaK+B9AqmWOkjmJgnqwWQz4fJ8t03JXDgVlefUGux70OZruuA0EkvYMFW
 +ShQbq8FZ9qzkEg70zy8PIQJ9JdnfHHf155smnLX7lgJPd/qFTOlMboGPfQyDkEuDLJzpdaESQu
 6aYeJfdS9ja0MaQ8ae8f2VAMZ7BpLnF2BAh0hGmbxAfCIxHxo4OdFH92UH13LK61ZkZeo0USLoU
 7grI5r2WoNB3u2xziny0lAPromDpJuCErIXOWhVra8Zx2G6r0UCw00SnPEELhV7nHcNtg1Sx8JM
 wOYC6bkaalklCbWnmJ0c+wbUaKV4NFA5gNkVUyO21ByzKAniQ09aVp/ZcLpMPmiaALQYHqPj6xz
 YDwzjhs3/IKI5M9zjOg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfXweHoGh/h84bp
 dW9SuVWVtW+FGsiKO3iP79vX+n0OJTvZM0VRjff/4kZ4wQafQ3y/qdBRXe48b2YXjtPdqCJFRI7
 u3EcF32MTPaLqOVLh/35c7Cv73HUHEw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140058

Add device tree bindings for the Top Level Mode Multiplexer (TLMM) pin
controller block found on the Qualcomm Kuno platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,kuno-tlmm.yaml           | 109 +++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,kuno-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,kuno-tlmm.yaml
new file mode 100644
index 000000000000..6db65d2e1c23
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,kuno-tlmm.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,kuno-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. Kuno TLMM block
+
+maintainers:
+  - Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm Kuno SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,kuno-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 55
+
+  gpio-line-names:
+    maxItems: 110
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-kuno-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-kuno-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-kuno-tlmm-state:
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
+    unevaluatedProperties: false
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          pattern: "^gpio([0-9]|[1-9][0-9]|10[0-9])$"
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+        enum: [ gpio, audio_ref_clk, coex_uart, ebi2_lcd_a,
+                ebi2_lcd_cs, ebi2_lcd_reset, ebi2_lcd_te, emac_mdc, emac_mdio,
+                emac_pps_in, emac_ptp_aux, emac_ptp_pps, gcc_gp1_clk,
+                gcc_gp2_clk, gcc_gp3_clk, mi2s0_data0, mi2s0_data1, mi2s0_sck,
+                mi2s0_ws, mi2s1_data0, mi2s1_data1, mi2s1_sck, mi2s1_ws,
+                mi2s_mclk, nav_gpio, pci_e_rst,
+                pcie_clkreq_n, pll_bist_sync, pll_clk_aux, qdss_cti_trig0,
+                qdss_cti_trig1, qdss_gpio_traceclk, qdss_gpio_tracectl,
+                qup0_se0, qup0_se1, qup0_se2, qup0_se3_mira, qup0_se3_mirb,
+                qup0_se4, sdc4_clk, sdc4_cmd,
+                sdc4_data, sdc4_tb_trig, sgmii_phy_intr, spmi_coex_clk,
+                spmi_coex_data, spmi_vgi_hwevent, uim1_clk, uim1_data,
+                uim1_present, uim1_reset, usb2phy_ac_en ]
+
+    required:
+      - pins
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    tlmm: pinctrl@f000000 {
+        compatible = "qcom,kuno-tlmm";
+        reg = <0x0f000000 0x400000>;
+        interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 110>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        spmi-state {
+            pins = "gpio78", "gpio79";
+            function = "spmi_vgi_hwevent";
+        };
+    };
+...

-- 
2.43.0

