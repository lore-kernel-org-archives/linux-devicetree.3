Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D0027A92E
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 00:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774917636; cv=none; b=qGhhcYyKX13scCH1hD2Pmf1simJCfHeDrh41IPpud24zCluKu6fvalndZGNKSGkS1xyj5kDW3aCMcxyFS55x8nB7nMsS2D+Scb9jRZ/XBWoftOC03GbgMnd2eWLpQK1l/FioXUCEFXV1niC9DeDWjnWyO668CR44dO3I+/YF9eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774917636; c=relaxed/simple;
	bh=2Nt/KdiAzUmhceMOPG5qOhjgZR6aD2x/5Z0vLthP90s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i2UClhe3OST/Xg+97dJn1ob+X9zMAF/lpU7zxWY4qH34Uxwv0fYABJYd8OcnxZ5z/m65C1Nrz72segvgd+6mpMc2Cq6eFFeRkanrFLWFk7RIV1v33ACwYM5GhMwMas0PmJrjQxTx9XqyqlMZRxB6uKUJLHPpZqeekN+VN1/i2Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E0qLod/V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NXmuS6yF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E0qLod/V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NXmuS6yF"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UGNrBk1402844
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 00:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bFH43M5NoNdbcTcz7/DMLpnSptsdV9Qvr2QeodUHg68=; b=E0qLod/VlgsCx36G
	H7SoJ5gx8+JtwVtKIepSHwNmIEEnEC+sKpPZ7GJH21pmVKzUoqTqdDc7SMqSvAO1
	jdSOJiYoKOyVPfn7Qd0AauNGlGBVHBX65G7NZycn/M/qx8l+fLBFa5Gyf4ZNsCjZ
	to1i9BQCcDVd7N2B1VBJ8Nf6Ou7hPY/S1s/NzJQOtAfyQ00xzHdnpLWMkaNiUJ05
	fveq4rJw2SiX8Lq0hkEqNGYHCA9aYvBVxxSJVtm9u+JoStNIQuYHaefAH2bCRiuV
	0tDkpivGmuv5eef54iQ60JLsEkjYSZNurqKlyJabl5dwZrI7KY2oRLWSjVFFN3op
	ya2oIw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7r4hay35-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 00:40:33 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bda35eab74so3925857eec.0
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 17:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774917633; x=1775522433; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bFH43M5NoNdbcTcz7/DMLpnSptsdV9Qvr2QeodUHg68=;
        b=NXmuS6yFCFH2Yi4C6iP7GhtBQvz//V3RXYY/r/Yra9qmy7oAoNS9lpoA9tco2ftN5Z
         AK5aAAz9O5Z3Dtwyk9HO3uWn3XZj9Fir1Qo18x7+ApQGU1O+o0pu7p0CKDAem7eD6Wq3
         XD4iYGEPgCZOAU9gfgKRyoiOoFWfGSqy0CpBUf64yUDES68ywkelTRr4cTAdjbguEPls
         Y9a5dJsKH9gbFnYEESepIgf5Ej3QjWCrPRZQPMDtF5ecv7j5pLvdIF+YYkiDLA0YB3kF
         gZKF5xhsc8ygFki0qUGHM10Jg70JiO6MpOp7ZE1uT/aJU3BdwUYU7lw8+O/+FAI6iKfx
         PKww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774917633; x=1775522433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bFH43M5NoNdbcTcz7/DMLpnSptsdV9Qvr2QeodUHg68=;
        b=SBXB0foSl8Fhoy2RcJRkMj5mLZ+h/S52jneEeseG/oWZaL3gsbuoEHMOHfZnfN3pk+
         +6FECVkSY+ZQMS3d3UjflIFpMXHG5YSrMruSZf5JgEr7B7x+He9MLf6zxhtS3kycwsaM
         7JxpnWmmDYKCOrASg8sQw0+sxkRDeZuZlaUDJIs7OqvOKrRwqUSxX7UO6rPf8nhQ5p3Z
         QKkpQT6qMjNROQomulY1cJPLdSg9CNLi4LZVpIhfNDHYMMygU+BVhibiYH+4YgEoNNBs
         O//1HXK3S2xL6PAOmJWiF6lDpyQbeBKTVwtvYleNs06h6HHnEmzyQnLACO6i2mkpPTwX
         lLTA==
X-Forwarded-Encrypted: i=1; AJvYcCXOQk2+kS0qGSKWhkQlbOYZNHxKBsj6yqNdKWLVgG6TMle3YLXXzWQ6w50Gk9FDJ9P77dr98aFrjKF9@vger.kernel.org
X-Gm-Message-State: AOJu0YyZUns5nEu45A7fNUFRCFHImpK+ZJKTi9CC9SgblfZ/YTVXsCIB
	7hgwgKldldgdEW57HBshlpmJ+x6zN/rYbEpJ4AHOjq/QUVe1Oo/vhpvn20IxWMrh4sfUsZmb2tV
	OM4EjH87lTLX4yxhxitUUd12OOCiXxI6TJDHegr+N8+eGbObFZ42lBNZjDzdNaJuZ
X-Gm-Gg: ATEYQzwSFfBVvrpSag2viYp9ol9L2acxS3bEDULNF6YtBaesKSIkqco0tJ+ZmjIreLX
	vw8JAUdVq8Lbf2qvc6d59a2cc1FossdkimFbgoNTUSGFmPfiUDIRGrcnbHp8M5XIAIVkNMqtyBr
	YS9PP02rAuMKKur3D0DFAZLSi1bLC4R/WpPzKbLdy0FkWiZBamiznKSwxM0TRCPsYV2yYxXEjm/
	RYnGSMF3eSJjcQ9NmwzlkzIZ2I4YaCGO3yB2ZiJn6tTBVoiPqlCVh3+Lmm9yjVt5YphNdu3iJBd
	EnvQ57VEocmO28EUcn33BaC9ZX9fX38zITwWMZTGuttcO+5lEJ+vxQHjsdWvjEBcINg/InGGt4n
	k70VU2QYJS0xTB/iglBAVZd36BRR8J5QV/zOsX+DnFoWiybf6AfdElFjLo1OhOZzQslwgolsQ+F
	bq
X-Received: by 2002:a05:7301:fa0a:b0:2be:17b1:e49f with SMTP id 5a478bee46e88-2c7baf442a2mr854746eec.4.1774917632388;
        Mon, 30 Mar 2026 17:40:32 -0700 (PDT)
X-Received: by 2002:a05:7301:fa0a:b0:2be:17b1:e49f with SMTP id 5a478bee46e88-2c7baf442a2mr854731eec.4.1774917631836;
        Mon, 30 Mar 2026 17:40:31 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c10361e7sm8959988eec.0.2026.03.30.17.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 17:40:31 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 17:40:00 -0700
Subject: [PATCH 1/2] dt-bindings: interconnect: document the RPMh
 Network-On-Chip interconnect in Hawi SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-icc-hawi-v1-1-4b54a9e7d38c@oss.qualcomm.com>
References: <20260330-icc-hawi-v1-0-4b54a9e7d38c@oss.qualcomm.com>
In-Reply-To: <20260330-icc-hawi-v1-0-4b54a9e7d38c@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774917630; l=9144;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=2Nt/KdiAzUmhceMOPG5qOhjgZR6aD2x/5Z0vLthP90s=;
 b=VDKXU9kBHHbRvwxgFA3mqdrm8MbDDLQMbIMCmkHm2OMpZpOIu2qsFXXIjUzvOU9GgW7c8XBLj
 I5NpN+MWoBOAy4hY7WoPNYX2fN3VwSDzicVbqANrEqWO7QG/wIE/g8g
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDAwNCBTYWx0ZWRfX561/vfR6CEYE
 ZL6EPTqxiinMzRDRleQSA6tOVa90r2EHNuYD0DuUImvFX3YXOH782JtypFmdspNnSoXIPIoipDs
 BAMKpQW92v5Wc2bzkPIWe1WJjC4aY0U7HT8NjRD4mdjdTTj5w5w0IfM1mcM05lMIxZubopF9QVs
 pljZiz76SLLdk5an4drsjW3fmlZSPOI2PrJTpIu3XeEsJ87NUGvmqEnPh+71UPVVqv6ZyL9Aw0q
 XofbnNy4X27AItXmuIEzkVElk0fDskM3ni9Sj8URemv3PKDNgdnajkbxovhzJFH9Qm4CT91/6JA
 QUQAe+zXo8t4EeqOCyKGL1ncSkrOuIW+WhJEaVHAbx0D717O8IhCL+vJhjKxiqwtSRBQU+pt78m
 SmUnyxkAPI0kiONIeOHfwmJN2f/xatCYaui348nWFmBlFxDt7mHgTWEfXVXxZAZE2CFGtd4hDv2
 OmLUloDB2IDjjbUBr9Q==
X-Proofpoint-ORIG-GUID: NifiQzQREG1_NQcrTV-nKk-V-XUgzwAm
X-Authority-Analysis: v=2.4 cv=PI0COPqC c=1 sm=1 tr=0 ts=69cb1801 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=OWpMj97m4owJn-abWywA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: NifiQzQREG1_NQcrTV-nKk-V-XUgzwAm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310004

Document the RPMh Network-On-Chip Interconnect of the Hawi platform.

Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 .../bindings/interconnect/qcom,hawi-rpmh.yaml      | 126 ++++++++++++++++
 include/dt-bindings/interconnect/qcom,hawi-rpmh.h  | 164 +++++++++++++++++++++
 2 files changed, 290 insertions(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,hawi-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,hawi-rpmh.yaml
new file mode 100644
index 000000000000..f10701025647
--- /dev/null
+++ b/Documentation/devicetree/bindings/interconnect/qcom,hawi-rpmh.yaml
@@ -0,0 +1,126 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interconnect/qcom,hawi-rpmh.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm RPMh Network-On-Chip Interconnect on Hawi
+
+maintainers:
+  - Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
+
+description: |
+  RPMh interconnect providers support system bandwidth requirements through
+  RPMh hardware accelerators known as Bus Clock Manager (BCM). The provider is
+  able to communicate with the BCM through the Resource State Coordinator (RSC)
+  associated with each execution environment. Provider nodes must point to at
+  least one RPMh device child node pertaining to their RSC and each provider
+  can map to multiple RPMh resources.
+
+  See also: include/dt-bindings/interconnect/qcom,hawi-rpmh.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,hawi-aggre1-noc
+      - qcom,hawi-clk-virt
+      - qcom,hawi-cnoc-main
+      - qcom,hawi-gem-noc
+      - qcom,hawi-llclpi-noc
+      - qcom,hawi-lpass-ag-noc
+      - qcom,hawi-lpass-lpiaon-noc
+      - qcom,hawi-lpass-lpicx-noc
+      - qcom,hawi-mc-virt
+      - qcom,hawi-mmss-noc
+      - qcom,hawi-nsp-noc
+      - qcom,hawi-pcie-anoc
+      - qcom,hawi-stdst-cfg
+      - qcom,hawi-stdst-main
+      - qcom,hawi-system-noc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+    maxItems: 3
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
+              - qcom,hawi-clk-virt
+              - qcom,hawi-mc-virt
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
+              - qcom,hawi-pcie-anoc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: aggre-NOC PCIe AXI clock
+            - description: cfg-NOC PCIe a-NOC AHB clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,hawi-aggre1-noc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: aggre UFS PHY AXI clock
+            - description: aggre USB3 PRIM AXI clock
+            - description: RPMH CC IPA clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,hawi-aggre1-noc
+              - qcom,hawi-pcie-anoc
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
+    clk_virt: interconnect-0 {
+      compatible = "qcom,hawi-clk-virt";
+      #interconnect-cells = <2>;
+      qcom,bcm-voters = <&apps_bcm_voter>;
+    };
+
+    aggre_noc: interconnect@f00000 {
+      compatible = "qcom,hawi-aggre1-noc";
+      reg = <0x0 0xf00000 0x0 0x54400>;
+      #interconnect-cells = <2>;
+      clocks = <&gcc_aggre_ufs_phy_axi_clk>,
+               <&gcc_aggre_usb3_prim_axi_clk>,
+               <&rpmhcc_ipa_clk>;
+      qcom,bcm-voters = <&apps_bcm_voter>;
+    };
diff --git a/include/dt-bindings/interconnect/qcom,hawi-rpmh.h b/include/dt-bindings/interconnect/qcom,hawi-rpmh.h
new file mode 100644
index 000000000000..75312cbbb80e
--- /dev/null
+++ b/include/dt-bindings/interconnect/qcom,hawi-rpmh.h
@@ -0,0 +1,164 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_HAWI_H
+#define __DT_BINDINGS_INTERCONNECT_QCOM_HAWI_H
+
+#define MASTER_QSPI_0				0
+#define MASTER_QUP_2				1
+#define MASTER_QUP_3				2
+#define MASTER_QUP_4				3
+#define MASTER_CRYPTO				4
+#define MASTER_IPA				5
+#define MASTER_QUP_1				6
+#define MASTER_SOCCP_PROC				7
+#define MASTER_QDSS_ETR				8
+#define MASTER_QDSS_ETR_1				9
+#define MASTER_SDCC_2				10
+#define MASTER_SDCC_4				11
+#define MASTER_UFS_MEM				12
+#define MASTER_USB3				13
+#define SLAVE_A1NOC_SNOC				14
+
+#define MASTER_DDR_EFF_VETO				0
+#define MASTER_QUP_CORE_0				1
+#define MASTER_QUP_CORE_1				2
+#define MASTER_QUP_CORE_2				3
+#define MASTER_QUP_CORE_3				4
+#define MASTER_QUP_CORE_4				5
+#define SLAVE_DDR_EFF_VETO				6
+#define SLAVE_QUP_CORE_0				7
+#define SLAVE_QUP_CORE_1				8
+#define SLAVE_QUP_CORE_2				9
+#define SLAVE_QUP_CORE_3				10
+#define SLAVE_QUP_CORE_4				11
+
+#define MASTER_GEM_NOC_CNOC				0
+#define MASTER_GEM_NOC_PCIE_SNOC				1
+#define SLAVE_AOSS				2
+#define SLAVE_IPA_CFG				3
+#define SLAVE_IPC_ROUTER_FENCE				4
+#define SLAVE_SOCCP				5
+#define SLAVE_TME_CFG				6
+#define SLAVE_CNOC_CFG				7
+#define SLAVE_DDRSS_CFG				8
+#define SLAVE_IMEM				9
+#define SLAVE_PCIE_0				10
+
+#define MASTER_GIC				0
+#define MASTER_GPU_TCU				1
+#define MASTER_SYS_TCU				2
+#define MASTER_APPSS_PROC				3
+#define MASTER_GFX3D				4
+#define MASTER_LPASS_GEM_NOC				5
+#define MASTER_MSS_PROC				6
+#define MASTER_MNOC_HF_MEM_NOC				7
+#define MASTER_MNOC_SF_MEM_NOC				8
+#define MASTER_COMPUTE_NOC				9
+#define MASTER_ANOC_PCIE_GEM_NOC				10
+#define MASTER_QPACE				11
+#define MASTER_SNOC_SF_MEM_NOC				12
+#define MASTER_WLAN_Q6				13
+#define SLAVE_GEM_NOC_CNOC				14
+#define SLAVE_LLCC				15
+#define SLAVE_MEM_NOC_PCIE_SNOC				16
+
+#define MASTER_LPIAON_NOC_LLCLPI_NOC				0
+#define SLAVE_LPASS_LPI_CC				1
+#define SLAVE_LLCC_ISLAND				2
+#define SLAVE_SERVICE_LLCLPI_NOC				3
+#define SLAVE_SERVICE_LLCLPI_NOC_CHIPCX				4
+
+#define MASTER_LPIAON_NOC				0
+#define SLAVE_LPASS_GEM_NOC				1
+
+#define MASTER_LPASS_LPINOC				0
+#define SLAVE_LPIAON_NOC_LLCLPI_NOC				1
+#define SLAVE_LPIAON_NOC_LPASS_AG_NOC				2
+
+#define MASTER_LPASS_PROC				0
+#define SLAVE_LPICX_NOC_LPIAON_NOC				1
+
+#define MASTER_LLCC				0
+#define MASTER_DDR_RT				1
+#define SLAVE_EBI1				2
+#define SLAVE_DDR_RT				3
+
+#define MASTER_CAMNOC_HF				0
+#define MASTER_CAMNOC_NRT_ICP_SF				1
+#define MASTER_CAMNOC_RT_CDM_SF				2
+#define MASTER_CAMNOC_SF				3
+#define MASTER_MDP				4
+#define MASTER_MDSS_DCP				5
+#define MASTER_CDSP_HCP				6
+#define MASTER_VIDEO_CV_PROC				7
+#define MASTER_VIDEO_EVA				8
+#define MASTER_VIDEO_MVP				9
+#define MASTER_VIDEO_V_PROC				10
+#define SLAVE_MNOC_HF_MEM_NOC				11
+#define SLAVE_MNOC_SF_MEM_NOC				12
+
+#define MASTER_CDSP_PROC				0
+#define SLAVE_CDSP_MEM_NOC				1
+
+#define MASTER_PCIE_ANOC_CFG				0
+#define MASTER_PCIE_0				1
+#define MASTER_PCIE_1				2
+#define SLAVE_ANOC_PCIE_GEM_NOC				3
+#define SLAVE_SERVICE_PCIE_ANOC				4
+
+#define MASTER_CFG_CENTER				0
+#define MASTER_CFG_EAST				1
+#define MASTER_CFG_MM				2
+#define MASTER_CFG_NORTH				3
+#define MASTER_CFG_SOUTH				4
+#define MASTER_CFG_SOUTHWEST				5
+#define SLAVE_AHB2PHY_SOUTH				6
+#define SLAVE_BOOT_ROM				7
+#define SLAVE_CAMERA_CFG				8
+#define SLAVE_CLK_CTL				9
+#define SLAVE_CRYPTO_CFG				10
+#define SLAVE_DISPLAY_CFG				11
+#define SLAVE_EVA_CFG				12
+#define SLAVE_GFX3D_CFG				13
+#define SLAVE_I2C				14
+#define SLAVE_IMEM_CFG				15
+#define SLAVE_IPC_ROUTER_CFG				16
+#define SLAVE_IRIS_CFG				17
+#define SLAVE_CNOC_MSS				18
+#define SLAVE_PCIE_0_CFG				19
+#define SLAVE_PCIE_1_CFG				20
+#define SLAVE_PRNG				21
+#define SLAVE_QSPI_0				22
+#define SLAVE_QUP_1				23
+#define SLAVE_QUP_2				24
+#define SLAVE_QUP_3				25
+#define SLAVE_QUP_4				26
+#define SLAVE_SDCC_2				27
+#define SLAVE_SDCC_4				28
+#define SLAVE_TLMM				29
+#define SLAVE_UFS_MEM_CFG				30
+#define SLAVE_USB3				31
+#define SLAVE_VSENSE_CTRL_CFG				32
+#define SLAVE_PCIE_ANOC_CFG				33
+#define SLAVE_QDSS_CFG				34
+#define SLAVE_QDSS_STM				35
+#define SLAVE_TCSR				36
+#define SLAVE_TCU				37
+
+#define MASTER_CNOC_STARDUST				0
+#define SLAVE_STARDUST_CENTER_CFG				1
+#define SLAVE_STARDUST_EAST_CFG				2
+#define SLAVE_STARDUST_MM_CFG				3
+#define SLAVE_STARDUST_NORTH_CFG				4
+#define SLAVE_STARDUST_SOUTH_CFG				5
+#define SLAVE_STARDUST_SOUTHWEST_CFG				6
+
+#define MASTER_A1NOC_SNOC				0
+#define MASTER_APSS_NOC				1
+#define MASTER_CNOC_SNOC				2
+#define SLAVE_SNOC_GEM_NOC_SF				3
+
+#endif

-- 
2.34.1

