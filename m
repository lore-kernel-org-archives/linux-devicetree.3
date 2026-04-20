Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E465376BEC
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 02:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776651270; cv=none; b=oFDIwN9kU4GaaTk/TbgH2Matmb5JhLpk+YHJRWwReH9S8MsEpd/6goiXG5ETSuJ825DNUfxLQImNqUmNbB5yk6Lr69ZBrW3CkgWPPEm1RKoMS0K6DneJhcWzqCCeFh0AIwvULPsOkKS4z5eqCwTHq0TKCRBXqPRYQYDy4AOf94o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776651270; c=relaxed/simple;
	bh=8io58Bp3kgInQGhYg1UeOYyGGseBwFbpBiYkdaeH3g0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fjn8sHP7lwuM9gqeDsgayBr1P/vpzmrAZMUCgWNaTyUhTIjHgD/dTNND/y1+KRg8IpxjwAJ2ad2gqaPmY16fZVphEv4W2AmOlX0sAv6HtWIpJp7zApXbVN6pPUolqNjBnJ3RxChxBmGXOrF/NUp+NaL1hNC9nlHifcf1NtrCFH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ctm1tYbl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KlubkhVh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ctm1tYbl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KlubkhVh"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63JNfV9e1019834
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 02:14:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=o/mKdZC77Sr
	nFmvUi7YNKSIKU8SrBqwABS33LHNDvNo=; b=ctm1tYblKcmRv0eXvJhdNsiDApr
	IfoLsGiqfD2C3y6Ic4L6OriJ7NfiXaP+T74FoL0gE/7/cm0j5ZqJJ/XglKjACvQe
	vQzi3y7j4JKlnFHAUApTrPw/cXxwomNKe6iYcR50ATmp7YzoA+2/ZZfFE43Pa7ub
	7RQTeg/RW239IT/y74VjoO/eu64Vc+T5Zcp5nrRpgOLVGAU1EcKOnkNbgiPsNfOH
	NVaqkmjHXwTLltDNaEFLxHy1QltBxKh98Ehu2qhn2WcVb7Heb8gfmkd/4a0IZVqo
	3Rtjf9J+cfABiw8RY9DljkpUYW+//4RLnNoMj7msMSb2rh0cOvXjdox4vGg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm1hx3pcv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 02:14:28 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ba9a744f7dso3140328eec.0
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 19:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776651267; x=1777256067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o/mKdZC77SrnFmvUi7YNKSIKU8SrBqwABS33LHNDvNo=;
        b=KlubkhVhbAARZ6m5zAY0lszVv8x5ijxaHlDab5hJsuiaCvujmOSZJtByoJXwpia1Dx
         GinetHq1FiJgGwNmb6iCmvpyZYhWfCr8AB0ka2Xr+qEcjm2Mbf4H1rpl5hKrn2CPjTVp
         M8uDm9K1mMR90BqcEDnJk7gYxk/fPxCtPQms9DW3f4Pg26Gx+pSCKI+bWoBjQTzlfnKA
         VIZ6pdXa8a8xGUr0yD3j/iqVNF1hCUuCWBqGURz/lpg27lWRMqjbnEJX4Qpq4E/RlN6g
         1DXHCI03zk40PXNQxaQCl3kw+6O1TfrRrIczveQJ1UguEImXk92lIoO6moxA7/iSprGN
         +w2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776651267; x=1777256067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o/mKdZC77SrnFmvUi7YNKSIKU8SrBqwABS33LHNDvNo=;
        b=ifRXP8BMKuNmnjEhCXCfv8Xey1JQgTcVgQz9LtDx2iBBX8TIBOvneXncxEm6MozYam
         XM5ZVX2++9IdCGBds+KHWbJ88xXX/UjPxNNNE3e1djXBNYdqmN9hw1cjI5KIzzwVwWzY
         JQjhRYbCz0EfSD71OXdwJMnAuOmwEZKk+qL9aP5z5hkrQFLLgOFZWeWN0MqpxBdOA38A
         N5hBLdcPeOkRQrlzHb68y4rOGDvTLJM57WvQ6pgojO9bHJa3E2hzV7dnBnzzUjcWyezo
         yoMIFAz2JqGHI7oTWKqmcKDxIp0B3s1WjSmnYuuN4YULrxJNjYEF2Lw6c6Te+MecupoJ
         xz0w==
X-Forwarded-Encrypted: i=1; AFNElJ/z3VxVd+w3qNGpcOJprc4Zr/X++QFR5m56+r6ScqRVbH2r9JAfjJDwYgTZwuXtp7bIU/3asUOr0mS4@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/7TxZLJe4QhHimCFLHCH4ipKooGBAhidJD5UY9SBG+obfQ+3S
	cUPdG7QzAszVy+Y9HM0X3ixXmrRJb++D2s7T84GslvpcFgroYbRWho+RjfsOTLpOH/yH6TNr+Vp
	lWafhgyWC6N2edRcU8Jlv+7pAkdqXI3Tmz01QIhsJTmcDPzX/ZsATAaofDKSpSThX
X-Gm-Gg: AeBDieuoJurXkfVYRcpMmyKdJt9fro2fBVDBbO7bz7LO9Lhr7MRw9RMaBecx/0X7Axz
	O5o21uznETZTgyDwRB6n3NEJbt5latSlfFZzsXvgIf2qIfH2jtZJegYlqNTQKC2g+oyjvX84YXF
	RgaXHqZcWYevfdrbcaFix43MJ5rFqSE/6KNDMX7zCN3wY76LGm+4eLKHX1xvgAR7q0CrrfyIerQ
	xJz0MfV/Ttr324yMFXsg9F5rnv0O74+TIqFOsoZZ2HOGrehlSWgNCZRWe3R5kQ+P7vaFWxe1dr9
	98hTXbculzi2K7j2xmxrEYFEfVwuClzaBdN/Nn65rZga5RnN1P59kj4cWDdY4Yf3/4Rz/Q5tjm4
	0IDG+dqxlFjXEyQ+g/THfyy1VbDXXxqF9ANnX+HARLyJ0Am56srMQImYF/E97YHiBmOuF29CR2R
	2fGLy1lQBBOgO5zNV3
X-Received: by 2002:a05:7300:214e:b0:2c4:dd55:ffc1 with SMTP id 5a478bee46e88-2e464ea4fffmr5113259eec.2.1776651267094;
        Sun, 19 Apr 2026 19:14:27 -0700 (PDT)
X-Received: by 2002:a05:7300:214e:b0:2c4:dd55:ffc1 with SMTP id 5a478bee46e88-2e464ea4fffmr5113248eec.2.1776651266449;
        Sun, 19 Apr 2026 19:14:26 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ab8b89csm12556600eec.12.2026.04.19.19.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 19:14:26 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: interconnect: Document RPMh Network-On-Chip for Qualcomm Nord SoC
Date: Mon, 20 Apr 2026 10:13:50 +0800
Message-ID: <20260420021351.1239355-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420021351.1239355-1-shengchao.guo@oss.qualcomm.com>
References: <20260420021351.1239355-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6JxkIHjftSVJ4y323UYfP8b6s4G698bf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDAxOSBTYWx0ZWRfX6DiBaa+ajQrQ
 ZTjQAs4tV9ISkhwzNUT6WgLB6ThSTlwUYPv4vs6CHmnlTvyIWQaBlwCdC8gQj3ddT9lzbtW2z2U
 qbJZyAuKFxbqzAqerQzLmClWFHL3734nMY7smtuHWtSDELtu/38QFvamExw/s90ECf1xtiSl/p5
 LZOPhEGpge0p/RoZxtwD4nYvmJZdFn/99oTTdE75d1COh2CqvvY+WYGuGBMlBTCoB079/o1nkAQ
 9luQBpGTPc8yiSqdVv/5Lf1o7HJSSD+EuGMorl2KA7kH/6THDzXHvA3ptWQ9segqpulC+vgyyoH
 F3kmt2LLAXIn/y8FO9929Fe4r4vKThk/wDBK+iDdxiGFmboQNzYV0ObCA6y4yFak9Yu5lRGiRz6
 oqifl63Xx8/0eJoR36P8s5aq6CPsPNtIQJyAmGKuca/6VEG4j00bt9Rsy0I1CCg3sHPUSWQ8V7l
 8jek+Q9vAHT9Kx+KWBQ==
X-Proofpoint-GUID: 6JxkIHjftSVJ4y323UYfP8b6s4G698bf
X-Authority-Analysis: v=2.4 cv=RoX16imK c=1 sm=1 tr=0 ts=69e58c04 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=3U7udxK0YKKcqa3c1UMA:9 a=scEy_gLbYbu1JhEsrz4S:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200019

From: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>

Add RPMh Network-On-Chip interconnect bindings for Qualcomm Nord SoC.

Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../bindings/interconnect/qcom,nord-rpmh.yaml | 131 +++++++++++
 .../dt-bindings/interconnect/qcom,nord-rpmh.h | 217 ++++++++++++++++++
 2 files changed, 348 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,nord-rpmh.yaml
 create mode 100644 include/dt-bindings/interconnect/qcom,nord-rpmh.h

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,nord-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,nord-rpmh.yaml
new file mode 100644
index 000000000000..3650d3d5b918
--- /dev/null
+++ b/Documentation/devicetree/bindings/interconnect/qcom,nord-rpmh.yaml
@@ -0,0 +1,131 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interconnect/qcom,nord-rpmh.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm RPMh Network-On-Chip Interconnect on Nord
+
+maintainers:
+  - Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
+
+description: |
+  RPMh interconnect providers support system bandwidth requirements through
+  RPMh hardware accelerators known as Bus Clock Manager (BCM). The provider is
+  able to communicate with the BCM through the Resource State Coordinator (RSC)
+  associated with each execution environment. Provider nodes must point to at
+  least one RPMh device child node pertaining to their RSC and each provider
+  can map to multiple RPMh resources.
+
+  See also: include/dt-bindings/interconnect/qcom,nord-rpmh.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,nord-aggre1-noc
+      - qcom,nord-aggre1-noc-tile
+      - qcom,nord-aggre2-noc
+      - qcom,nord-aggre2-noc-tile
+      - qcom,nord-clk-virt
+      - qcom,nord-cnoc-cfg
+      - qcom,nord-cnoc-main
+      - qcom,nord-hpass-ag-noc
+      - qcom,nord-hscnoc
+      - qcom,nord-mc-virt
+      - qcom,nord-mmss-noc
+      - qcom,nord-nsp-data-noc-0
+      - qcom,nord-nsp-data-noc-1
+      - qcom,nord-nsp-data-noc-2
+      - qcom,nord-nsp-data-noc-3
+      - qcom,nord-pcie-cfg
+      - qcom,nord-pcie-data-inbound
+      - qcom,nord-pcie-data-outbound
+      - qcom,nord-system-noc
+
+  reg:
+    maxItems: 1
+
+  clocks:
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
+              - qcom,nord-clk-virt
+              - qcom,nord-mc-virt
+    then:
+      properties:
+        reg: false
+    else:
+      required:
+        - reg
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,nord-aggre1-noc-tile
+    then:
+      properties:
+        clocks:
+          items:
+            - description: aggre UFS PHY AXI clock
+            - description: aggre USB2 AXI clock
+            - description: aggre USB3 PRIM AXI clock
+            - description: aggre USB3 SEC AXI clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,nord-aggre2-noc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: RPMH CC IPA clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,nord-aggre1-noc-tile
+              - qcom,nord-aggre2-noc
+    then:
+      required:
+        - clocks
+    else:
+      properties:
+        clocks: false
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    clk_virt: interconnect-clk-virt {
+      compatible = "qcom,nord-clk-virt";
+      #interconnect-cells = <2>;
+      qcom,bcm-voters = <&apps_bcm_voter>;
+    };
+
+    aggre1_noc_tile: interconnect@1720000 {
+      compatible = "qcom,nord-aggre1-noc-tile";
+      reg = <0x01720000 0x23400>;
+      #interconnect-cells = <2>;
+      qcom,bcm-voters = <&apps_bcm_voter>;
+      clocks = <&ne_gcc_aggre_noc_ufs_phy_axi_clk>,
+               <&ne_gcc_aggre_noc_usb2_axi_clk>,
+               <&ne_gcc_aggre_noc_usb3_prim_axi_clk>,
+               <&ne_gcc_aggre_noc_usb3_sec_axi_clk>;
+    };
diff --git a/include/dt-bindings/interconnect/qcom,nord-rpmh.h b/include/dt-bindings/interconnect/qcom,nord-rpmh.h
new file mode 100644
index 000000000000..5bdce6a9bab7
--- /dev/null
+++ b/include/dt-bindings/interconnect/qcom,nord-rpmh.h
@@ -0,0 +1,217 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_NORD_H
+#define __DT_BINDINGS_INTERCONNECT_QCOM_NORD_H
+
+#define MASTER_QSPI_0				0
+#define MASTER_SAILSS_MD1			1
+#define MASTER_QUP_3				2
+#define SLAVE_A1NOC_SNOC			3
+
+#define MASTER_QUP_2				0
+#define MASTER_CRYPTO_CORE0			1
+#define MASTER_CRYPTO_CORE1			2
+#define MASTER_CRYPTO_CORE2			3
+#define MASTER_SDCC_4				4
+#define MASTER_UFS_MEM				5
+#define MASTER_USB2				6
+#define MASTER_USB3_0				7
+#define MASTER_USB3_1				8
+#define SLAVE_A1NOC_HSCNOC			9
+
+#define MASTER_IPA				0
+#define MASTER_SOCCP_AGGR_NOC			1
+#define MASTER_QDSS_ETR				2
+#define MASTER_QDSS_ETR_1			3
+#define SLAVE_A2NOC_SNOC			4
+
+#define MASTER_QUP_0				0
+#define MASTER_QUP_1				1
+#define MASTER_EMAC_0				2
+#define MASTER_EMAC_1				3
+#define SLAVE_A2NOC_HSCNOC			4
+
+#define MASTER_QUP_CORE_0			0
+#define MASTER_QUP_CORE_1			1
+#define MASTER_QUP_CORE_2			2
+#define MASTER_QUP_CORE_3			3
+#define SLAVE_QUP_CORE_0			4
+#define SLAVE_QUP_CORE_1			5
+#define SLAVE_QUP_CORE_2			6
+#define SLAVE_QUP_CORE_3			7
+
+#define MASTER_CNOC_CFG				0
+#define SLAVE_PS_ETH_0				1
+#define SLAVE_PS_ETH_1				2
+#define SLAVE_SHS_SERVER			3
+#define SLAVE_AHB2PHY_0				4
+#define SLAVE_AHB2PHY_1				5
+#define SLAVE_AHB2PHY_2				6
+#define SLAVE_AHB2PHY_3				7
+#define SLAVE_AHB2PHY_ETH_0			8
+#define SLAVE_AHB2PHY_ETH_1			9
+#define SLAVE_CAMERA_CFG			10
+#define SLAVE_CLK_CTL				11
+#define SLAVE_CRYPTO_0_CFG			12
+#define SLAVE_CRYPTO_1_CFG			13
+#define SLAVE_CRYPTO_2_CFG			14
+#define SLAVE_DISPLAY_1_CFG			15
+#define SLAVE_DISPLAY_CFG			16
+#define SLAVE_DPRX0				17
+#define SLAVE_DPRX1				18
+#define SLAVE_EVA_CFG				19
+#define SLAVE_GFX3D_CFG				20
+#define SLAVE_GFX3D_1_CFG			21
+#define SLAVE_I2C				22
+#define SLAVE_IMEM_CFG				23
+#define SLAVE_MCW_PCIE				24
+#define SLAVE_MM_RSCC				25
+#define SLAVE_NE_CLK_CTL			26
+#define SLAVE_NSPSS0_CFG			27
+#define SLAVE_NSPSS1_CFG			28
+#define SLAVE_NSPSS2_CFG			29
+#define SLAVE_NSPSS3_CFG			30
+#define SLAVE_NW_CLK_CTL			31
+#define SLAVE_PRNG				32
+#define SLAVE_QDSS_CFG				33
+#define SLAVE_QSPI_0				34
+#define SLAVE_QUP_0				35
+#define SLAVE_QUP_3				36
+#define SLAVE_QUP_1				37
+#define SLAVE_QUP_2				38
+#define SLAVE_SAFEDMA_CFG			39
+#define SLAVE_SDCC_4				40
+#define SLAVE_SE_CLK_CTL			41
+#define SLAVE_TCSR				42
+#define SLAVE_TLMM				43
+#define SLAVE_TSC_CFG				44
+#define SLAVE_UFS_MEM_CFG			45
+#define SLAVE_USB2				46
+#define SLAVE_USB3_0				47
+#define SLAVE_USB3_1				48
+#define SLAVE_VENUS_CFG				49
+#define SLAVE_COMPUTENOC_CFG			50
+#define SLAVE_PCIE_NOC_CFG			51
+#define SLAVE_QTC_CFG				52
+#define SLAVE_QDSS_STM				53
+#define SLAVE_SYS_TCU0_CFG			54
+#define SLAVE_SYS_TCU1_CFG			55
+#define SLAVE_SYS_TCU2_CFG			56
+
+#define MASTER_MM_RSCC				0
+#define MASTER_HSCNOC_CNOC			1
+#define SLAVE_AOSS				2
+#define SLAVE_HBCU				3
+#define SLAVE_IPA_CFG				4
+#define SLAVE_IPC_ROUTER_CFG			5
+#define SLAVE_SOCCP				6
+#define SLAVE_TME_CFG				7
+#define SLAVE_PCIE_DMA				8
+#define SLAVE_CNOC_CFG				9
+#define SLAVE_DDRSS_CFG				10
+#define SLAVE_IMEM				11
+
+#define MASTER_HPASS_PROC_0			0
+#define MASTER_HPASS_PROC_1			1
+#define MASTER_HPASS_PROC_2			2
+#define SLAVE_HPASS_AGNOC_AUDIO			3
+
+#define MASTER_GPU_TCU				0
+#define MASTER_QTC_TCU				1
+#define MASTER_SYS_TCU_0			2
+#define MASTER_SYS_TCU_1			3
+#define MASTER_SYS_TCU_2			4
+#define MASTER_APPSS_PROC			5
+#define MASTER_A1NOC_TILE_HSCNOC		6
+#define MASTER_A2NOC_TILE_HSCNOC		7
+#define MASTER_GFX3D				8
+#define MASTER_GFX3D_1				9
+#define MASTER_HPASS_ADAS_HSCNOC		10
+#define MASTER_HPASS_AUDIO_HSCNOC		11
+#define MASTER_MNOC_HF_MEM_NOC			12
+#define MASTER_MNOC_SF_MEM_NOC			13
+#define MASTER_NSP0_HSCNOC			14
+#define MASTER_NSP1_HSCNOC			15
+#define MASTER_NSP2_HSCNOC			16
+#define MASTER_NSP3_HSCNOC			17
+#define MASTER_ANOC_PCIE_GEM_NOC		18
+#define MASTER_SAILSS_MD0_HSCNOC		19
+#define MASTER_SNOC_SF_MEM_NOC			20
+#define MASTER_GIC				21
+#define SLAVE_HSCNOC_CNOC			22
+#define SLAVE_LLCC				23
+#define SLAVE_MEM_NOC_PCIE_SNOC			24
+
+#define MASTER_LLCC				0
+#define SLAVE_EBI1				1
+
+#define MASTER_CAMNOC_HF			0
+#define MASTER_CAMNOC_NRT_ICP_SF		1
+#define MASTER_CAMNOC_RT_CDM_SF			2
+#define MASTER_CAMNOC_SF			3
+#define MASTER_DPRX0				4
+#define MASTER_DPRX1				5
+#define MASTER_MDP0				6
+#define MASTER_MDP1				7
+#define MASTER_VIDEO_CV_PROC			8
+#define MASTER_VIDEO_EVA			9
+#define MASTER_VIDEO_MVP0			10
+#define MASTER_VIDEO_MVP1			11
+#define MASTER_VIDEO_V_PROC			12
+#define SLAVE_MNOC_HF_MEM_NOC			13
+#define SLAVE_MNOC_SF_MEM_NOC			14
+
+#define MASTER_NSP0_PROC			0
+#define SLAVE_NSP0_HSC_NOC			1
+
+#define MASTER_NSP1_PROC			0
+#define SLAVE_NSP1_HSC_NOC			1
+
+#define MASTER_NSP2_PROC			0
+#define SLAVE_NSP2_HSC_NOC			1
+
+#define MASTER_NSP3_PROC			0
+#define SLAVE_NSP3_HSC_NOC			1
+
+#define MASTER_PCIE_NOC_CFG			0
+#define SLAVE_PCIE_AHB2PHY_CFG			1
+#define SLAVE_PCIE_CFG_0			2
+#define SLAVE_PCIE_CFG_1			3
+#define SLAVE_PCIE_CFG_2			4
+#define SLAVE_PCIE_CFG_3			5
+#define SLAVE_PCIE_DMA_0_CFG			6
+#define SLAVE_PCIE_DMA_1_CFG			7
+#define SLAVE_PCIE_DMA_2_CFG			8
+
+#define MASTER_PCIE_DMA_0			0
+#define MASTER_PCIE_DMA_1			1
+#define MASTER_PCIE_DMA_2			2
+#define MASTER_PCIE_0				3
+#define MASTER_PCIE_1				4
+#define MASTER_PCIE_2				5
+#define MASTER_PCIE_3				6
+#define SLAVE_PCIE_HSCNOC			7
+#define SLAVE_PCIE_OBNOC_DMA			8
+
+#define MASTER_CNOC_PCIE_DMA			0
+#define MASTER_ANOC_PCIE_HSCNOC			1
+#define MASTER_PCIE_IBNOC_DMA			2
+#define SLAVE_PCIE_DMA_0			3
+#define SLAVE_PCIE_DMA_1			4
+#define SLAVE_PCIE_DMA_2			5
+#define SLAVE_PCIE_0				6
+#define SLAVE_PCIE_1				7
+#define SLAVE_PCIE_2				8
+#define SLAVE_PCIE_3				9
+
+#define MASTER_A1NOC_SNOC			0
+#define MASTER_A2NOC_SNOC			1
+#define MASTER_CNOC_SNOC			2
+#define MASTER_NSINOC_SNOC			3
+#define MASTER_SAFE_DMA				4
+#define SLAVE_SNOC_HSCNOC_SF			5
+
+#endif
-- 
2.43.0

