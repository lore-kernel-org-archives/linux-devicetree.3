Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C311A4D90A2
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 11:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780658844; cv=none; b=Gv+ZqyyS0VsyCpN2KrJ3aJ/nBttq8JXYJwdRRoa6WnGM8feTi7g9dVOmO62x4ugFrb/qPz9NTqgY3ihjNjMkgayGBNFiKwsVbk8uPWlQ9hOWjjy92km+4UcyDoy87KrlYDi+NE8OlKLvdjUqzkm/DIY3QrVkBIjKNUqtShla8aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780658844; c=relaxed/simple;
	bh=AawuB1oGtm2VcWy/cNDO3ngim5IUQy6JDtKTA328qNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ew9z1CO3aJz1FOy3IJyXdLAThHtXzEVZpicxopodevs7VqGSEOk/FhR9yW2OMbTi9On3pgfBPAszrryfDiKqst98CiVaxJV4ABHqEhf+lBPjTjOSEn1a4dBlp7QI4gQDfAjTdSth55WK0SwdhSMTMG/lAhQXgPugqBfUjmWaAFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aGkUbw5E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NhnEuGWz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aGkUbw5E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NhnEuGWz"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 655ALrke2975089
	for <devicetree@vger.kernel.org>; Fri, 5 Jun 2026 11:27:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y9upK7aJQL0zjBpJsJSlz9ZdlDK5n6ved3+bFQjUiPc=; b=aGkUbw5ElavX7S5F
	lZNlHKvLO3letO1xvmCgOfmN2SrWo0FJjoldNBdbWJ7RhGqLQiv7KR01FyTJNc3U
	Fi1U5Jf1UCKz+V8/Si0CZzhVD4+qd4fFrYhqBe2TjBpMMDDN1lclkbGle+VOYzqe
	tT7IXKBLPLTpPYpsPqLuUyAgRwujsyXXNxYOjMiQTd3zvYa4OfDttCuBTPSBuT+P
	uO2zi775NICbfOl/OnWYVlKoK2eM+3qNF7QVaLMhEnkqgkGIZISM6BL1DBJtKtkZ
	B7mlxZEv8QXbz4ydlmsLDfJo6egPcplkmh7g/aQR85L1Q4MvIarc/EVv6zB1QCsu
	xkrjxA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekpnu9q6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 11:27:21 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-842208d5b0eso1294782b3a.3
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 04:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780658841; x=1781263641; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y9upK7aJQL0zjBpJsJSlz9ZdlDK5n6ved3+bFQjUiPc=;
        b=NhnEuGWzUWmHfhZWEbTvS9Xy26BzBeL+MFJaCt/ycSdYlXOuiAWXmgqQqlbKKNERp/
         Q/j2xOPYvl7BPYplnPwjG6D5fuIpoMevguzBw477VOAGCyVf2wDI2ammC+hZlg216d5u
         kd1ryB8bHGk7f2kTNffs8yLG2SBJ/El4XxhumJMX4yayx3q1HdAnHlB411PTpQFsnneg
         hKYlwv7MZUL0Hk1cc1d/MPGIjnSgAYq+j4LP3z1B85GpMVKfFVYfEVCe8w34LHAaSLvi
         YUyjs6Jzn/35vwoQOhVjrQdexIru0V1DuNQJVDwTE3TlhbhdC2dNhO4ZZ1dQxevvHZa2
         EGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780658841; x=1781263641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y9upK7aJQL0zjBpJsJSlz9ZdlDK5n6ved3+bFQjUiPc=;
        b=H7uP6Olh/llM4OA2mjIZqfyTvAwlXbDKXQ8RbIScMcqutBolAe6k8C+BXvuSpYg4vb
         ZDNUDP77WCmhjXkRkSqUzPnHvGrltbb+RVBAtl+c598I+mb9y4B2oOypXuLO1IHE+Fzh
         Ld+iDMkm7Erd7m0JI35f4omMUXT+qCaCCRallwMwOUBblU+++DPvD2XzTHtdXB1c7dyu
         M0EUWzSwM+Gkrt072l1I/+AYCHBSbXxCXORNA0avLPSUiVYFUxEz9Tnjm9oqOGeRE81H
         FNkKaDMe4N2knyXC79+pIatGKUQpw4izy0tT3rl3oymNnZ8CVp9fowjfjRaFh022Epie
         cnWw==
X-Forwarded-Encrypted: i=1; AFNElJ+fJAeAtS/17YYZDJhJi6nqzjTA3GfllphFZ/NPHmZAPubq4zcHZKnEW6JQfVzqxsobwFrAyFHfkxpT@vger.kernel.org
X-Gm-Message-State: AOJu0YyA2fi1Nr9XRToiSm0ESnrOhUBhV8KUCu3y0EPP/f67iUUQXLGT
	8Ljngc9jDpwtHTMiBZtSp6dhXBFdi/ArI5SD1bMKXQYEtuKEI8Eyv3mZBcufaIFHFNZcZJfu2ul
	yMbbqeVeiiKFTBjFMZa+pqV+jHi3tNgnrtTztb2gmMmhPPkbKknUJdTX/Yt2KmrDp
X-Gm-Gg: Acq92OEgzoAf6iZaGi4cxDaRvk79o/XjRS9Vj8M2Vv42fgzkxX7LdfL0YRCACIy7jfU
	eUkxO8ZHFIkck8c1lttaVJMt3D3fTSjFs0UTnrm+t+thtFpkhvJgc24FI77D29W2SlQ3GOGsRST
	fh7wgs4EGXY9Z424B9TzUmYoMMvqn4CeAhYMqVG2hJzxrZKx9sDOqRzA712DFJZu1fACTgvnZ/Z
	r15mbB98i8E1QKpRS43JpAXiuJlAt6w+uUY9PE85lT5Df6lImffwPrFEpPn7qNXUwvaztyZbyjA
	HG7varPKGWUzr7znUoREj183KmcKpGlsm70IAeXBNKTfWtxMUKbIa+bVV6dNimdL2L1YVft3xnF
	xdte0HHpO6Xpffjd3ehYQcNT5QOdyO5z9o0p69r0Lh+QBk5wyhgvQFyR6iXTZOLk=
X-Received: by 2002:a05:6a00:1d89:b0:842:4f49:6bfd with SMTP id d2e1a72fcca58-842b10677admr3048291b3a.26.1780658840626;
        Fri, 05 Jun 2026 04:27:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:1d89:b0:842:4f49:6bfd with SMTP id d2e1a72fcca58-842b10677admr3048259b3a.26.1780658840115;
        Fri, 05 Jun 2026 04:27:20 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828e21c8sm10626246b3a.49.2026.06.05.04.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:27:19 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 05 Jun 2026 16:56:31 +0530
Subject: [PATCH 2/4] dt-bindings: clock: qcom: Add Qualcomm Shikra Audio
 Core Clock Controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-shikra-audiocorecc-v1-2-7ee6b5f2d928@oss.qualcomm.com>
References: <20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com>
In-Reply-To: <20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com>
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
X-Proofpoint-GUID: Cv4hLtbvUHsKzjCiAmIvWlg3pcr99-V2
X-Authority-Analysis: v=2.4 cv=Ksl9H2WN c=1 sm=1 tr=0 ts=6a22b299 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=PWWK3QiPue6MOfw6qxEA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDExMSBTYWx0ZWRfX79iikfxdYh2T
 ws820tlX6J7rSTwUu831jdH4QFQytiS0BGLO/oS6nxbtA+UOOYrvjamJ8r4Lq8RErOflBisXlm7
 zfhU4l1fu9hrcQFxobCwjUPrqxg4LJfHZzrOogz7n49kDs/cjIH5elwC7ZWSaNnxfjQ49M2nIo/
 Ie7gA9rdF1PzBRoFJG/2u6HaKd28zsJbxxhFbb4D8p5kcqIkAo1jPcMnnJHzJFr1Huvc4MXIXNw
 Qt2rAIUQ6f/HK07swIlBvF68t/IbtwX967f0r57cG5XLo35mzIUH+mZbQ3DsgQJO2+DehDcUutk
 xyH9fImi7m7Gt4D6f7Xga37YSBrOiVDgqBfXso9jbH4oDwA4xX+3kdo2MAvlIspPNL00ublxjtR
 rS+r62Eti2p3n5kHYnmBDOAgFzgsDGzA6jodGhhvYsuACSLU1BHhkFlfCb+VEgzKQ7XhVcDu/Ln
 2kerhoqJbZNu/06qLKA==
X-Proofpoint-ORIG-GUID: Cv4hLtbvUHsKzjCiAmIvWlg3pcr99-V2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050111

Add device tree bindings for the Audio Core Clock Controller (AUDIOCORECC)
on Qualcomm Shikra SoC. The AUDIOCORECC clocks and resets support differs
across variants based on Audio subsystem enablement as follows:

CQM (qcom,shikra-cqm-audiocorecc): need clocks and resets; audio on APPS
CQS (qcom,shikra-cqs-audiocorecc): need resets only; audio on Modem
IQS: no clocks/resets needed; no SoundWire codecs

To handle these requirements, variant-specific compatibles are introduced.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 .../bindings/clock/qcom,shikra-audiocorecc.yaml    | 62 ++++++++++++++++++++++
 .../dt-bindings/clock/qcom,shikra-audiocorecc.h    | 49 +++++++++++++++++
 2 files changed, 111 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,shikra-audiocorecc.yaml b/Documentation/devicetree/bindings/clock/qcom,shikra-audiocorecc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..2ed1d9d871175ff868584cfd606e14c5779f1766
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,shikra-audiocorecc.yaml
@@ -0,0 +1,62 @@
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
+  Audio core clock control module provides the clocks and resets
+  on Qualcomm Shikra SoC platform.
+
+  See also:
+  - include/dt-bindings/clock/qcom,shikra-audiocorecc.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,shikra-cqm-audiocorecc
+      - qcom,shikra-cqs-audiocorecc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board sleep clock
+      - description: Audio ref clock source
+
+  reg:
+    maxItems: 2
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
+  - '#clock-cells'
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+    #include <dt-bindings/clock/qcom,shikra-gcc.h>
+    clock-controller@a0a0000 {
+      compatible = "qcom,shikra-cqm-audiocorecc";
+      reg = <0x0a0a0000 0x10000>,
+            <0x0a0b4000 0x1000>;
+      clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+               <&sleep_clk>,
+               <&aud_ref_clk_src>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,shikra-audiocorecc.h b/include/dt-bindings/clock/qcom,shikra-audiocorecc.h
new file mode 100644
index 0000000000000000000000000000000000000000..3052feb627ff3dc8beb405534ff94bf75525fcb2
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
+/* AUDIO_CORE_CC resets */
+#define AUDIO_CORE_CSR_RX_SWR_CGCR	0
+#define AUDIO_CORE_CSR_TX_SWR_CGCR	1
+
+#endif

-- 
2.34.1

