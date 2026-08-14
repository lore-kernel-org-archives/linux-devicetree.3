Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63945420469
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692783; cv=none; b=tyBkgFwaMeMVXwHbjXYDw0UC43huZxKOdDST1j6KLDP9OTpujPVa+iYKJleA45SirJIuAKjwm1EzZLTC4PnBZwM3KeFgPnSl+qYxSGj1ifHXC2MmiLP2Zo6O1MZmfeK30VeBOvnRKNpQHE0aXtb6Ws+ZVWgOuM51CPxJ/mD9ONA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692783; c=relaxed/simple;
	bh=jFRWsP9ISRPrclLZb7Xm99XFKDmAoPy99ddr/r8mkjM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R2orpYWus+qqroMwKoCx67gsoFQlxiNg5wU3r11sYrUhwE3oZaKrueqNBTPxxIpFtPgDfI2ZhjVUXrGXSt8BfIesOHBbNhgFmkhRY1kO3N/rVzoWPP/9KkyI87O7rQrC9tGEs5xxGeBphDCjQNDq7Gx/FeB2npYNiKnyHVvRwiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WIcfgo/7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kJzN6qcm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WIcfgo/7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kJzN6qcm"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4QdLB3614493
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:32:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jpeiabKTD0jeAQh1gSJUWOUbLOHro//2dly8tKNUA1Q=; b=WIcfgo/7KEGV64C0
	J7AKr8WAnY7tgbXIQFTJwndXFAGNINJElsybvR2zepfh1H20VZLK/dejAt7aTwPR
	cp5AxQcqPee9AlvHuiW2RJEomHptjqIeWv8nVUwl65Qk73/ZIbUhn+v5tg7yu4x3
	AxRyAKhskmNzjUrj/aoit9+bSNTrkKUHc+PSvrr2GV0fkaN5n/GUZjPVy9DnvruV
	Yl6ZSJAMw9XZ7Z6+jvPloNOaChrHwmKniqbz40ygAsx48wHCwI36N/ArozgUvqxj
	W9Y4lLvsypZMZowQMlA6FXEH4MguajPvpqzb0rp1frbBWFVi46XNdrH0G2rtYagI
	SiKIhA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1hgy32q8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:32:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso10741555ad.0
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 00:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786692773; x=1787297573; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jpeiabKTD0jeAQh1gSJUWOUbLOHro//2dly8tKNUA1Q=;
        b=kJzN6qcmsfZtZ0mhtAGEjuedHuiKNan0y0xkRXuBt81I4k8l5Gj7BCZOQllZQw7wZT
         SxgP6QQC/y+vMtwLD+RxbMgUL4PSS4ypz/3lzAlz5K8K8EYWWCcQsP8tVzOfi0Um2jkZ
         vDh98B5U+7dGxwAXQO4DHm7W4dCvOVnfpl5EHsPKFJURLgXPaHLiuCPTaFv8Q2FrOkAm
         zKJ6SscZbt/nbGMvHrEiFZfd/RIJIuXHYhl5NhuWejlwAujj1OJwc75VC6XFh4+vebz8
         em9IxbUkLVfMjUL7dY79+zp8R0RJmX1AmqVfth33gS5ub68xENPTjqvjCnOjnvW3SpIf
         5WGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786692773; x=1787297573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jpeiabKTD0jeAQh1gSJUWOUbLOHro//2dly8tKNUA1Q=;
        b=LqMu4HmsxB2NYC+BKr7UaRuzkU0/+QyULSHsXDzVg7Ok242e3WQK73ROBp66mGXFct
         AYhvrHYXFBaGSp1AWtAujcSJ4/sqqEGLTXY+hdZfXVnjszsS4Yrj7W8pGRsEBCk7Ozlg
         obVgWXA5t8Wre1mkcw3Osz6JKmEVDbqtLjGcKiAgThQHqCqYZYd46nS2U2w4bHmtUhRE
         /atKnBn06K6OC8hj94Ca2dpL/YEjhAMuW+hFEpfvw0X46SycnMu0UFSrq+zTPXyEOMaw
         hydrK4ZHhiM0rtwfKMAiBe6ktH6I9rJmAmmzvhXEtHyKbQnkSe3saGDormSmaRMDn+Ks
         U3rA==
X-Forwarded-Encrypted: i=1; AHgh+RpOn0kbEqvyCCBNddU7hFVsiU82bMul5XhE0c6+Db7cHbvtBD75eIFj6REaSTB2kf9ETJdDCAEly1Wm@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6qpGA/jW1Fw9l4rZzdHgwCi87IoDE7ZLLAdHjw/1atEU+1Sr7
	Di0igVEmOXdqpdheY+qkG3qLbNiSt0wEvEfkBXamAsS82TWHNKO3AMKchsoBiUOYc5OanjkyTaO
	nkj9LAhrX6LerpQEDDocK+qOuMAqJzHPTSrGUoXkue7I9bsHuxpd1lvM55KeXWetr
X-Gm-Gg: AR+sD12Lw/hG0WxreMa+GSnoYNoPvqHRTmTgSEWbLN5nPhRkuPRouUJIDUpvVMN1UMg
	ccoxAe+wIo6NuwG6hnZSQbOIukSzlQzkwXeNfrTkBHThHxjztWwJcDQ5NTNdX74XGr7KXrfHAcf
	qCuNNxvAFPncenu1iNgULMcTg5PljY3RnR6fAyMtxpfGk5trc9+q6cyvx6IbMvum0u8dqDhZTCh
	2nzaOFyF/cDYFTQNiQiyyheIAwAmhB8mpb9R7qn3Xr/iOLdY3863reAO60JzGkztslSCZxTZ4b3
	93sdB/TOIyHAiesuOU01cOmgmnVTF9yvicMp0QWLx+P7BafvmVUKn9gMNPEw1rNPT58/SJizM4C
	Q4jf9aktPfkWEbfHPO1McH8Zhqh8SEgESLP0OJzfAmaQXlEJjz/Aqf2GE6dhi7zCbpHexZ47CdW
	IPwteJoOOekPMrKv+9x073wac=
X-Received: by 2002:a05:6a20:12d2:b0:3c3:a024:1360 with SMTP id adf61e73a8af0-3cc71de3b8dmr4123526637.28.1786692772862;
        Fri, 14 Aug 2026 00:32:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:12d2:b0:3c3:a024:1360 with SMTP id adf61e73a8af0-3cc71de3b8dmr4123472637.28.1786692772425;
        Fri, 14 Aug 2026 00:32:52 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea804233sm1062280eec.26.2026.08.14.00.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:32:51 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:01:37 +0530
Subject: [PATCH v2 06/15] dt-bindings: interconnect: Add Qualcomm Kuno NoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-kuno-soc-support-v2-6-3079794f0f73@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786692713; l=5865;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=jFRWsP9ISRPrclLZb7Xm99XFKDmAoPy99ddr/r8mkjM=;
 b=7b2Un2s/M9mSVl4PcO5B7+YBwe8pYT85+NxWU5VAq9nRbWwFhkwfruk2XYApzqPIJwzEU/NBQ
 dxyxR/9bwCpBtxHwy7PehIbzLXwNKJ1HkURps7UyuuYOa1mjc1QsHpF
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX5xbUW8l2KCWa
 9fl8bbHBysY7TrrhKJtQKoP71RpbnNhDsiYrGTvQINII34gsjgGT+eReem9i4P16+5u7kvsNqoY
 UQnAlaLGzhifPGdNDKsPgrkFLHBZqeHdOrnS1SCrEWM5oalVZGQCqRru8JqlCk+nxSNZ198Pv9b
 Oy/b5HG+mI4PFNsbe7Mlf71u0P61aeBOvQ8DtUSJ9FldXGIda/4ATVOPedutJk9cAPaDPfJNx8Q
 wKAGZtdTX7GUZ/vcTT1euglkuILHD0kzLax+pNbBK2MwAIgO9yFMMyXndi90qGoYTQkjGQDzrPU
 n8HKzKRQ87tM18rHyvJpLzUOdeoViJpBH5H2h2gcXTG5VLFNwk+UoiMTYBIJ+vtUoazN2a61M5Y
 56fYW1m69KoWe8yPU920WC8ajgL66mm1J4O6W2jMZ7jLGcp3uHvmB+m2xmEoY4cECCd3kBX/OeT
 jqZqrR8XRT71fKDGYNA==
X-Authority-Analysis: v=2.4 cv=AaSB2XXG c=1 sm=1 tr=0 ts=6a7ec4a6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=UOSSyZSmw6qQ1N8pRZUA:9
 a=_XYWEmbmkuNYmnV3:21 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: UiOFtkTK9BOBmsyKJ6lnciFzDCMgyu-z
X-Proofpoint-GUID: UiOFtkTK9BOBmsyKJ6lnciFzDCMgyu-z
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfXync4PS5vUeLj
 Q5R8hvxZevAXQTtuvr8FWB+s7G5aSMUh7wDK9UZ+BfKKWP5qPHV9JrTVDnJ30veXLayTiXujrJP
 HJEd0roxi5mz6wYF/ePp/fUrxV76An0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140058

Document the RPMh-based Network-on-Chip interconnect providers and
associated node-ID definitions for the Qualcomm Kuno SoC.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 .../bindings/interconnect/qcom,kuno-rpmh.yaml      | 82 ++++++++++++++++++++
 include/dt-bindings/interconnect/qcom,kuno.h       | 89 ++++++++++++++++++++++
 2 files changed, 171 insertions(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,kuno-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,kuno-rpmh.yaml
new file mode 100644
index 000000000000..ffbf14356f12
--- /dev/null
+++ b/Documentation/devicetree/bindings/interconnect/qcom,kuno-rpmh.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interconnect/qcom,kuno-rpmh.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm RPMh Network-On-Chip Interconnect on Kuno SoC
+
+maintainers:
+  - Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
+
+description: |
+  RPMh interconnect providers support system bandwidth requirements through
+  RPMh hardware accelerators known as Bus Clock Manager (BCM). The provider is
+  able to communicate with the BCM through the Resource State Coordinator (RSC)
+  associated with each execution environment. Provider nodes must point to at
+  least one RPMh device child node pertaining to their RSC and each provider
+  can map to multiple RPMh resources.
+
+  See also: include/dt-bindings/interconnect/qcom,kuno.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,kuno-aggre-noc
+      - qcom,kuno-clk-virt
+      - qcom,kuno-cnoc-main
+      - qcom,kuno-dc-noc
+      - qcom,kuno-mc-virt
+      - qcom,kuno-mem-noc
+      - qcom,kuno-pcie-anoc
+      - qcom,kuno-system-noc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 4
+
+  clock-names:
+    minItems: 1
+    maxItems: 4
+
+required:
+  - compatible
+
+allOf:
+  - $ref: qcom,rpmh-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,kuno-clk-virt
+              - qcom,kuno-mc-virt
+    then:
+      properties:
+        reg: false
+        clocks: false
+        clock-names: false
+    else:
+      required:
+        - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    interconnect-clk-virt {
+        compatible = "qcom,kuno-clk-virt";
+        #interconnect-cells = <1>;
+        qcom,bcm-voters = <&apps_bcm_voter>;
+    };
+
+    interconnect@1640000 {
+        compatible = "qcom,kuno-aggre-noc";
+        reg = <0x01640000 0x33400>;
+        #interconnect-cells = <1>;
+        qcom,bcm-voters = <&apps_bcm_voter>;
+    };
+...
diff --git a/include/dt-bindings/interconnect/qcom,kuno.h b/include/dt-bindings/interconnect/qcom,kuno.h
new file mode 100644
index 000000000000..eacbae38f85d
--- /dev/null
+++ b/include/dt-bindings/interconnect/qcom,kuno.h
@@ -0,0 +1,89 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_KUNO_H
+#define __DT_BINDINGS_INTERCONNECT_QCOM_KUNO_H
+
+#define MASTER_SYS_TCU				0
+#define MASTER_LLCC				1
+#define MASTER_AUDIO				2
+#define MASTER_CPUCP				3
+#define MASTER_PCIE_RSCC				4
+#define MASTER_QDSS_BAM				5
+#define MASTER_QPIC				6
+#define MASTER_QUP_0				7
+#define MASTER_ANOC_SNOC				8
+#define MASTER_CNOC_DC_NOC				9
+#define MASTER_CNOC_SNOC				10
+#define MASTER_MSS_PROC				11
+#define MASTER_GEM_NOC_CFG				12
+#define MASTER_GEM_NOC_CNOC				13
+#define MASTER_GEM_NOC_PCIE_SNOC				14
+#define MASTER_ANOC_PCIE_GEM_NOC				15
+#define MASTER_SNOC_SF_MEM_NOC				16
+#define MASTER_QUP_CORE_0				17
+#define MASTER_CRYPTO				18
+#define MASTER_IPA				19
+#define MASTER_MSS_NAV				20
+#define MASTER_TME				21
+#define MASTER_APPSS_PROC				22
+#define MASTER_EMAC				23
+#define MASTER_IPA_PCIE				24
+#define MASTER_PCIE_0				25
+#define MASTER_QDSS_DAP				26
+#define MASTER_QDSS_ETR				27
+#define MASTER_QDSS_ETR_1				28
+#define MASTER_SDCC_4				29
+#define MASTER_USB3_0				30
+#define SLAVE_EBI1				31
+#define SLAVE_AHB2PHY				32
+#define SLAVE_AOSS				33
+#define SLAVE_APPSS				34
+#define SLAVE_AUDIO				35
+#define SLAVE_CLK_CTL				36
+#define SLAVE_RBCPR_CX_CFG				37
+#define SLAVE_RBCPR_MXA_CFG				38
+#define SLAVE_RBCPR_MXC_CFG				39
+#define SLAVE_CRYPTO_0_CFG				40
+#define SLAVE_EMAC_CFG				41
+#define SLAVE_IMEM_CFG				42
+#define SLAVE_IPA_CFG				43
+#define SLAVE_IPC_ROUTER_CFG				44
+#define SLAVE_LAGG_CFG				45
+#define SLAVE_MCCC_MASTER				46
+#define SLAVE_CNOC_MSS				47
+#define SLAVE_PCIE_0_CFG				48
+#define SLAVE_PCIE_RSC_CFG				49
+#define SLAVE_PDM				50
+#define SLAVE_PMU_WRAPPER_CFG				51
+#define SLAVE_PRNG				52
+#define SLAVE_QDSS_CFG				53
+#define SLAVE_QPIC				54
+#define SLAVE_QUP_0				55
+#define SLAVE_SDCC_4				56
+#define SLAVE_SPMI_VGI_COEX				57
+#define SLAVE_TCSR				58
+#define SLAVE_TLMM				59
+#define SLAVE_TME_CFG				60
+#define SLAVE_USB3				61
+#define SLAVE_VSENSE_CTRL_CFG				62
+#define SLAVE_A1NOC_CFG				63
+#define SLAVE_DDRSS_CFG				64
+#define SLAVE_LLCC				65
+#define SLAVE_GEM_NOC_CNOC				66
+#define SLAVE_SNOC_MEM_NOC_SF				67
+#define SLAVE_MEM_NOC_PCIE_SNOC				68
+#define SLAVE_ANOC_PCIE_GEM_NOC				69
+#define SLAVE_SNOC_CNOC				70
+#define SLAVE_ANOC_THROTTLE_CFG				71
+#define SLAVE_QUP_CORE_0				72
+#define SLAVE_BOOT_IMEM				73
+#define SLAVE_IMEM				74
+#define SLAVE_SERVICE_GEM_NOC				75
+#define SLAVE_PCIE_0				76
+#define SLAVE_QDSS_STM				77
+#define SLAVE_TCU				78
+
+#endif

-- 
2.43.0

