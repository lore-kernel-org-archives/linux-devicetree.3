Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51110369D68
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 14:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784124624; cv=none; b=dVeG6Qm32zxh/7UQmAXWJhaCcZv2UPNXDgsJ5dYkKbIKkfaeowLzrIlNZOzobWt5MQ/l3F2HfyTgobcEkaqsCXp4/2s4+7ejivCvQ3h5Vu3oRYVB3TmY6Bls4Do2nMs3CRUgwaxaZwwq6cGgZ3gKVX5NgEfUUixNqKwRZordj/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784124624; c=relaxed/simple;
	bh=1LU9FZJPUHPC+RR4k/K6YKuTMFeyNyLyZrcpzk2OuRQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BGgKkgMbzkwSPD+XsPqr72QgMBIIjwIFCo6w+23wTlNshe9dH9z9zSerN8QX1KeQh68I3M4j6z9t04/Tk72usCyOxkjmY6f8YTrwUiPt0PtV/V+EKTpk2yniqDnCg3RBUtrDU6Li82tTBaEaTGcyGjKTr/8EalUHsZuVDYtnJgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gCQU0py1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ns8ZUv56; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gCQU0py1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ns8ZUv56"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FE3aEg4097428
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 14:10:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HMXXtz5wPsY8Ow2Jocn+uz6khfFEAxGAmMr7OIuVcu8=; b=gCQU0py13sk6F1TA
	A+Zp5HbYT96+HD5eGEy6BrJwIB2Ij7vC4rE4W6t2SkEHgTEEk3rEOxCNJpDeTyNJ
	MxiLEPkLo6RsuOHlX/rcKkCtAUa6bQalQky5SIf2s6pUL5zKGsEW7c/NWho7NjHV
	EO+smhmVqUnXzbzxSeiZdgVr4L0kG9V4XkKx8SbmOJHffmKIHh4+mc6HyXuh7AWC
	NDPPIgIttAe3fUwruUCVruD/fFLRxfrARpfHWpaBnCLAJAFZtYExoguKPAbzclgD
	jbkFrJI+QONs0NFUUL6lhVRyYUIOP2M7MbW2ie4kTYOZ8rxn9TZG5T/tzZKEV6RS
	ReSADA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe8558yea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 14:10:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso70552985ad.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 07:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784124617; x=1784729417; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HMXXtz5wPsY8Ow2Jocn+uz6khfFEAxGAmMr7OIuVcu8=;
        b=Ns8ZUv564923YP2DPwXQNJxZwEizmt+DXTwXDvaLmu2c9Rkwu4P1XcQhf9EwyRGI6p
         7akPbKqqENubxnYXxZJxbSZQeblcOWp61uFqthabmlQrcIbkPVDJwepj4JyHuXVMsv6t
         5giyY3sLfZTsZsE3a3FJ2P+533tf1mLb8B+DpWGNrEwK5rI3IilFHclmvNp8G651BvnM
         m9T4mZqA0s2CioMAsAzcEue8Xg8qyOuZZWoVabndmtaRt7gWCDc1D0bOBHJ729pGzTlD
         CU258ofICLzbfQXGBHND3Q3T+lOYggRZ7iEVChq+jZEql9ye0am1N2wFdXbcfLleqlJF
         +IXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784124617; x=1784729417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HMXXtz5wPsY8Ow2Jocn+uz6khfFEAxGAmMr7OIuVcu8=;
        b=Dw+i+CS+qLJqDmwDaLBI3TzJVL9Fk/ln+WL5d9WK3ImXbVd6czWKjmVdL3r5+lTKfZ
         5WuWxehY6UNZFPDSSCt7COnqMAAeXRhK4iZHMuS9ueDG/rpzKQ653f/98aX3vEjQdI2v
         LBlClndoFiX3v3GM0gqh2eK+k7T/cdjxpcAqgt0oDOzr9xXUVP2euKb80LGdLEpEc7Wq
         NnZxiIm8FBq7lfAj+jpbPQAPbfgcH/qf6XngiRBs8YKlsg3HcmyrtDhYpKg7YyRkSsNw
         Z8BXBzBIZmdR+w+26aLQ0TJCQ2pRNefsgKaWvCprlM4070CHvQ2pwcfosG7JhSi1zKjL
         UoVA==
X-Forwarded-Encrypted: i=1; AHgh+RpufZ3sWkKn11LRlWvBAN7iaYRmtWghLZcAKdTEdSqopt1u43lBQt4gnJT1Unn5sDjGBkDf9NZx96KM@vger.kernel.org
X-Gm-Message-State: AOJu0YzKEgjNLpRSaGOXjcyr9++fDeCGSyJNZvJUZUGXq2/hVVskNXaP
	u9Yb4gZf/Sc2LTO5DWE87Nr+whrItw4Ie/6lJkyTAqOrkUxBaP4dAsrGfVlJTp2PQjIBdlONauX
	rIibTupmstwBoJ5UvRoJtIjsnIrKxCVwE/67YFhLnnHjCMCVhfB8dDmIPwQy7LKmD
X-Gm-Gg: AfdE7cl2xESaktIKO1fWm32swCU9aGl1jlq/FBGVOS94Pie347VB3ABsSEWxIyXs/BY
	rcPZ+SZhRl9Egxxwkg141Sw1CG70olhEcP3Q7aRIUWd+OoDx6gd/RGZajgh5RMW2+L0Ss2NGVLx
	97duGQJT6QKaKkPlUj8L6VDq1iAJp7lOI38Y6qSW9WgPteva8IN3bRal32HOBsE52rD/hi52wdl
	DcMBoM53JhV7TNLtky6T5MZSFHYvI/ifBZn/lneXOqMqhVxqClSXuvFseXJ1Y2HKSSCtybT0xve
	6Njt35NAh+41MzQyvOljU0rOStJdc/nY5eqXpzoGMkXhUqkcNAprglyFCd4fyE8cPVMrYPi4lvu
	zSuX+aNJmsmhT59WUqGYVDfpdR/bUBeyU7cinK3d0tGEt
X-Received: by 2002:a17:903:1ad0:b0:2cc:5fae:cc56 with SMTP id d9443c01a7336-2cee9b5901bmr91480335ad.27.1784124617299;
        Wed, 15 Jul 2026 07:10:17 -0700 (PDT)
X-Received: by 2002:a17:903:1ad0:b0:2cc:5fae:cc56 with SMTP id d9443c01a7336-2cee9b5901bmr91479855ad.27.1784124616751;
        Wed, 15 Jul 2026 07:10:16 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1070b68dsm2913215ad.79.2026.07.15.07.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 07:10:16 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 19:39:55 +0530
Subject: [PATCH v9 01/14] dt-bindings: media: qcom,glymur-iris: Add glymur
 video codec
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-glymur-v9-1-8cf2cbe12a07@oss.qualcomm.com>
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
In-Reply-To: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784124602; l=9342;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=1LU9FZJPUHPC+RR4k/K6YKuTMFeyNyLyZrcpzk2OuRQ=;
 b=0MdfozpThvGAEEWS2NFRySTBrrY2ZrUgxlrOm3S4wJh9UlYugS7dUZnCQtBIjdbz7tXmUsphK
 djEgUzjW3mlBrATWATzAepCIDgLBiKWW4y8D8VO/ZBRfY6tI7HeIJob
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: XZZkHpZWXykQnzRjfbIoVF_SWVM9OtrJ
X-Authority-Analysis: v=2.4 cv=KOlqylFo c=1 sm=1 tr=0 ts=6a5794ca cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=fd_FPlQsB3JEVrxK6XYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDE0MSBTYWx0ZWRfX6Gbtdzvt1Uk9
 qCAjv3QHneBHft0F2vvc5SmdpTHsS+sjXgWMMxQS2vvVbCGw+/xl4tkk4Y3aEhvhYvWsupP1dSM
 ENxYsmt8zZaYSZ6jddJ3yXfWkdB2xnsOj9X4LVXLcdMHi32tgTiHXk0PJyPvbprP6pePR/D5mNe
 8cjqd5WWj/k8KF60dIqbUFXzi/gWwH3f6Phrammfxo42Hmxedob1O54LdaQ0ecuNctDOGkK+OeA
 SJeWeAUIFt9gm3T/iov2sKKkBJzRsrW0N3OUhJxVZUq0F+NgtEJ9JqaCoqm0+kLlQH8jrHKUZ0Z
 B3DkIAzgb2sAYxiGepqCbwPVog/kmuViCWyLo4GAJujoZkt9NgYszmCfiC3HfsnchWnFT8CIs0F
 jfFwNBpW44F2OhDOpBJOdg5VGpA2X2qBhrAUR5yrrimHqKzbCrcsUjs6+IzuKjaIMIp4PkonWO+
 RAhRTYxT5S5k9tveUCg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDE0MSBTYWx0ZWRfX/ENp8lQeFQb1
 3JlltKbRWhBWJ5A9YkDixn8Pi1PIOHgazcBBSo68C6Utasj9PhASEObIm0ZIBKl4Q4U6+ZLd5wF
 vRd9mN9uxJ6266L0ixu3XDvip99jieU=
X-Proofpoint-ORIG-GUID: XZZkHpZWXykQnzRjfbIoVF_SWVM9OtrJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150141

Add device tree binding for the Qualcomm Glymur Iris video codec. Glymur
is a new generation of video IP that introduces a dual-core architecture.
The second core brings its own power domain, clocks, and reset lines,
requiring additional power domains and clocks in the power sequence.
The current maxItems constraints for clocks and power-domains in the
common venus schema were sized for platforms available at the time of
authoring. The glymur platform introduces a dual core architecture
that requires more clocks and power domains, exceeding these limits.
Raise maxItems for clocks, clock-names, power-domains and
power-domain-names to accommodate the glymur platform.
The glymur platform-specific schema have fixed constraints for these
properties, so the common schema only acts as an upper bound.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 .../bindings/media/qcom,glymur-iris.yaml           | 255 +++++++++++++++++++++
 .../bindings/media/qcom,venus-common.yaml          |   8 +-
 2 files changed, 259 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
new file mode 100644
index 000000000000..4db6c58e4a88
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
@@ -0,0 +1,255 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,glymur-iris.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Glymur SoC Iris video encoder and decoder
+
+maintainers:
+  - Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
+
+description:
+  The Iris video processing unit on Qualcomm Glymur SoC is a video encode and
+  decode accelerator.
+
+properties:
+  compatible:
+    const: qcom,glymur-iris
+
+  clocks:
+    maxItems: 9
+
+  clock-names:
+    items:
+      - const: core_iface
+      - const: core
+      - const: vcodec0_core
+      - const: vcodec0_iface
+      - const: core_freerun
+      - const: vcodec0_core_freerun
+      - const: vcodec1_iface
+      - const: vcodec1_core
+      - const: vcodec1_core_freerun
+
+  dma-coherent: true
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: cpu-cfg
+      - const: video-mem
+
+  '#address-cells':
+    const: 2
+
+  '#size-cells':
+    const: 2
+
+  non-pixel:
+    type: object
+    description:
+      Context bank for VPU non-pixel buffers, including compressed and internal buffers.
+    properties:
+      iommus:
+        maxItems: 3
+      memory-region:
+        maxItems: 1
+    required:
+      - iommus
+      - memory-region
+    additionalProperties: false
+
+  pixel:
+    type: object
+    description:
+      Context bank for VPU pixel buffers containing uncompressed video data.
+    properties:
+      iommus:
+        maxItems: 1
+    required:
+      - iommus
+    additionalProperties: false
+
+  firmware:
+    type: object
+    description:
+      Context bank for the VPU firmware processing domain.
+    properties:
+      iommus:
+        maxItems: 1
+    required:
+      - iommus
+    additionalProperties: false
+
+  operating-points-v2: true
+  opp-table:
+    type: object
+
+  power-domains:
+    maxItems: 5
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: mxc
+      - const: mmcx
+      - const: vcodec1
+
+  resets:
+    maxItems: 6
+
+  reset-names:
+    items:
+      - const: core_bus
+      - const: vcodec0_bus
+      - const: core
+      - const: vcodec0_core
+      - const: vcodec1_bus
+      - const: vcodec1_core
+
+required:
+  - clocks
+  - clock-names
+  - compatible
+  - dma-coherent
+  - interconnects
+  - interconnect-names
+  - non-pixel
+  - pixel
+  - power-domains
+  - power-domain-names
+  - resets
+  - reset-names
+
+allOf:
+  - $ref: qcom,venus-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    video-codec@aa00000 {
+        compatible = "qcom,glymur-iris";
+        reg = <0x0aa00000 0xf0000>;
+
+        clocks = <&gcc_video_axi0c_clk>,
+                 <&videocc_mvs0c_clk>,
+                 <&videocc_mvs0_clk>,
+                 <&gcc_video_axi0_clk>,
+                 <&videocc_mvs0c_freerun_clk>,
+                 <&videocc_mvs0_freerun_clk>,
+                 <&gcc_video_axi1_clk>,
+                 <&videocc_mvs1_clk>,
+                 <&videocc_mvs1_freerun_clk>;
+        clock-names = "core_iface",
+                      "core",
+                      "vcodec0_core",
+                      "vcodec0_iface",
+                      "core_freerun",
+                      "vcodec0_core_freerun",
+                      "vcodec1_iface",
+                      "vcodec1_core",
+                      "vcodec1_core_freerun";
+
+        dma-coherent;
+
+        interconnects = <&hsc_noc_master_appss_proc &config_noc_slave_venus_cfg>,
+                        <&mmss_noc_master_video &mc_virt_slave_ebi1>;
+        interconnect-names = "cpu-cfg",
+                             "video-mem";
+
+        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+        memory-region = <&video_mem>;
+
+        operating-points-v2 = <&iris_opp_table>;
+
+        power-domains = <&videocc_mvs0c_gdsc>,
+                        <&videocc_mvs0_gdsc>,
+                        <&rpmhpd RPMHPD_MXC>,
+                        <&rpmhpd RPMHPD_MMCX>,
+                        <&videocc_mvs1_gdsc>;
+        power-domain-names = "venus",
+                             "vcodec0",
+                             "mxc",
+                             "mmcx",
+                             "vcodec1";
+
+        resets = <&gcc_video_axi0c_clk_ares>,
+                 <&gcc_video_axi0_clk_ares>,
+                 <&videocc_mvs0c_freerun_clk_ares>,
+                 <&videocc_mvs0_freerun_clk_ares>,
+                 <&gcc_video_axi1_clk_ares>,
+                 <&videocc_mvs1_freerun_clk_ares>;
+        reset-names = "core_bus",
+                      "vcodec0_bus",
+                      "core",
+                      "vcodec0_core",
+                      "vcodec1_bus",
+                      "vcodec1_core";
+
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        non-pixel {
+            iommus = <&apps_smmu 0x1940 0x0000>,
+                     <&apps_smmu 0x1944 0x0000>,
+                     <&apps_smmu 0x19e0 0x0000>;
+            memory-region = <&iris_resv>;
+        };
+
+        pixel {
+            iommus = <&apps_smmu 0x1943 0x0000>;
+        };
+
+        firmware {
+            iommus = <&apps_smmu 0x19e2 0x0000>;
+        };
+
+        iris_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-240000000 {
+                opp-hz = /bits/ 64 <240000000 240000000 360000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-338000000 {
+                opp-hz = /bits/ 64 <338000000 338000000 507000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_svs>;
+            };
+
+            opp-366000000 {
+                opp-hz = /bits/ 64 <366000000 366000000 549000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-444000000 {
+                opp-hz = /bits/ 64 <444000000 444000000 666000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_nom>;
+            };
+
+            opp-533333334 {
+                opp-hz = /bits/ 64 <533333334 533333334 800000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_turbo>;
+            };
+
+            opp-655000000 {
+                opp-hz = /bits/ 64 <655000000 655000000 982000000>;
+                required-opps = <&rpmhpd_opp_nom>,
+                                <&rpmhpd_opp_turbo_l1>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
index 59a3fde846d2..10716a93dd35 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -20,11 +20,11 @@ properties:
 
   clocks:
     minItems: 3
-    maxItems: 7
+    maxItems: 9
 
   clock-names:
     minItems: 3
-    maxItems: 7
+    maxItems: 9
 
   firmware-name:
     maxItems: 1
@@ -41,11 +41,11 @@ properties:
 
   power-domains:
     minItems: 1
-    maxItems: 4
+    maxItems: 5
 
   power-domain-names:
     minItems: 1
-    maxItems: 4
+    maxItems: 5
 
 required:
   - reg

-- 
2.34.1

