Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C9935F185
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 06:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782110099; cv=none; b=u6/Iunq5C958VujV9CokvNeEtIb8Cn+csRSicRP61jTB+x9UYjR2cWEAY/6ITBNT7ZsJoKPwUXDF2e1wUsLdcA+sv78aFXqfB16a6EkKM2+TNYK7ES7iJcfk5ytPsm0xMLe3aWtGo2uYShje9GzYNH1tJL/ZncqXI8tlgLGUerA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782110099; c=relaxed/simple;
	bh=z66Gnwm6zHfsJVFwvA3SE3W27HA05hGYS/RXJ88cwUc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sr38xylnyyAAhBu4wxbxL/rqF4I+bU+Svgd0/4l9b/WQYJtggWQ4wSemzi/MzOYpHQmQZiYWYG5Qt6je9Y+M5+RJTpN2YfQ88+4NcYqwmILgpCx/PUOzwWsd91MZ4vYdLaLVTZ2chpYnK3seY11iHW79FUGKOPPCH/BNassVaXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k89mJzNH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hBeXgfD3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k89mJzNH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hBeXgfD3"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M59Poc2428401
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 06:34:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GrFqN2DrqYTVQBgMyzn6UgDGLh2TuuLDXBdZiQoiRjs=; b=k89mJzNHghdJ4nd1
	BFjev5/xpbSXAN4WG3zacAvUkVgSLQzZ95c939Mx/F+5DaB6BBThgo0dWWcIxljP
	Uup0tHEhAaxQg6yLYV882Q2Ef6VB6RX3aCtsSCr86pUwgD24yexP29VR5yg5+kSa
	eCDCMoKiun3qGnpu3CqAEXMLu8cZryCIFGMj1ba4QPclkgLNmM4LcDiRpqdrimV0
	Apv3/864G14m6r4JIdfii8qpyKbo4nBBXSxCG7b1w/i60MwzvD/5HEQGiEI4PTmz
	HX4zOcfhlsU+tgJKhQom9zHYZEsFGak73G5Q2TzkBAR1d15KbH0hjUoAH/kDiOeW
	gMYRyQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewhtsd679-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 06:34:55 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c89956023dbso2163003a12.0
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 23:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782110095; x=1782714895; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GrFqN2DrqYTVQBgMyzn6UgDGLh2TuuLDXBdZiQoiRjs=;
        b=hBeXgfD3jR2ir8Mr48HJ566+AVeXzs+wKFukAkU933Ac6HhlWlZmuV+xn6+jEPNQ5h
         t9ylX6F8M9ocMfHNNhOm2UyXihcp/s68G2MqvRIwJgGzz//dQjn10Qt0VP3pE4UZDbiC
         lMashoLjj2/kDEP4P1PxmVR3bewmU+8sd/61jW/kd/kKQgolSCQRzaL0ISHu759O2ofy
         OwR13aGOop6pIaNRRZxXZiZ2ZW9u1eGbj6CDxGgaf+uN6lBJ5uzZQvvPi11PUaNy7IBj
         uquRFZUiGcYbjxyGbgZldQOxqlZUiW48v4w82OeBSCi3r8y2I1kojnFNrwZQNoOqZhEH
         is1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782110095; x=1782714895;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GrFqN2DrqYTVQBgMyzn6UgDGLh2TuuLDXBdZiQoiRjs=;
        b=jyZPMWCwKY9YxDmXTMuERAz37+dfxXx72YjHvTyHD9yRi1Si/yGKcPMYdN4/0SGaZS
         qezix33hZdtW7n6VmEjltxkkN/GeHDLbuCuv82nO+iFtddmuN1giPkgjRMEviIVM9/Ek
         zgzJ3XMUiCAiyrtAOx4GNlu6ppIqo+yHlw2exerPe2nbsz1OXwfC3lx9iHKFSp5B9dDm
         Y641MCNm0OWF5cq4icO408sfXKQpbOp6iUFI20sXWS2dRt3tbaRNbT4plU3eqQEl3wve
         P6DSgpMWXceuusfiPEtOSsD3hdYNuyc7PtcnXpuNtx8wmS/D/LbUgkXVIJvtm/2ZX260
         Isrw==
X-Forwarded-Encrypted: i=1; AFNElJ/weEJsiVO9r6Ocs7yJf5+iFK8yPhNwR5FSKtiRyApb4593ldXoezZqtSqK3GlzCCMCMu2JcpQD8btc@vger.kernel.org
X-Gm-Message-State: AOJu0YynoyOtWENeP26CKKprGJDUa2zO5tKNVRmGlSboBcW3o5xIU7u1
	TKSZQSMsQQE8oQn7wTFIqn7cNikvJgq+NDlJ6unpi7OU8X+X7vzLKDsUp84Ba5vo+FWS0r/Krdx
	IMvyG4GzCQIT8QPfZqMpNXcw/iR7pQicFxaSTsnzv5qhVYcn6z0UPCvVHL3GPVrEO
X-Gm-Gg: AfdE7cm8NIuK6V31HnIqo40wGXlVYlsyWZFqy4buM1IhSh6EjESdO2FVY22wPzt+NAj
	bVgAfuVxMlK2m5e4fqr5K+iWuTnWIhk6r3iRTe+UvdRh80QAyN/M0D7SMb+Ht06AxqCBaMYQCGQ
	xkJFFqfJeFpsPFwZNQmowvKfCtwFqVTyND9Ffwv2l3JxQ+W0Sjy0qRDnt8sruk+/gGCX1dpPSqp
	raldQXHRweaFeFNpWUiU3qPHcYwcSDyNtYeI7iL+s9BGNtRbzKF6H3wXkbp1uq7GL0CvzMeqGYy
	yl7bBkzALs3QJHJYUqUNozVdbth8XLycaz6htJwhD6ehoV6EABGo/DD5t5oz4l6IAhx2v8V+oEG
	Z8z7nBj4mjdeGzPUkb74k5UiA9wcE4KzdFg==
X-Received: by 2002:a05:6a21:1bc1:b0:3b4:88e7:87c7 with SMTP id adf61e73a8af0-3bc51c683c9mr8878331637.17.1782110095137;
        Sun, 21 Jun 2026 23:34:55 -0700 (PDT)
X-Received: by 2002:a05:6a21:1bc1:b0:3b4:88e7:87c7 with SMTP id adf61e73a8af0-3bc51c683c9mr8878295637.17.1782110094640;
        Sun, 21 Jun 2026 23:34:54 -0700 (PDT)
Received: from [169.254.0.3] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc2c8de8bsm5928321a12.6.2026.06.21.23.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 23:34:54 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 06:34:45 +0000
Subject: [PATCH v2 1/2] dt-bindings: interconnect: qcom: document the RPMh
 Network-On-Chip interconnect in Maili SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-maili_icc-v2-1-18b5ac08c04f@oss.qualcomm.com>
References: <20260622-maili_icc-v2-0-18b5ac08c04f@oss.qualcomm.com>
In-Reply-To: <20260622-maili_icc-v2-0-18b5ac08c04f@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: 9sJnZVq_O06drZU9tHUaOcMIeNZgACZf
X-Proofpoint-ORIG-GUID: 9sJnZVq_O06drZU9tHUaOcMIeNZgACZf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA2MiBTYWx0ZWRfX8m7QnaIpYFI6
 ejNtqvkJb0wsow+EJITpnQizq0MhlH5PolryR94D9t7cO0SHi81KzGibpRTjwPE3qYD8uAZP2C8
 lBski6gqRXOicfN+O2NkpNYp9F1TTXLznXd0rvAN7Bf+Gbh+HYlX2O1GBzLruVBCjtTfmvY60kg
 hoznBb8/c4ZmIP5MiuG4SlEhP4okBWY8M+gfPqcEUUErhd3IiyZ2xEGcS1Ll4Ft6mdN/FBd3ZPx
 Zp+aQw+kq2Jz4xL8bNt6SYIKRYPfO85+BHGaFFvH4UQpusx6O4rkOV/RBvzmOIXrnH7pGHoTs+H
 JvsD339La1ULfiCeAXOtl6RQGi4N2zvM4FBq+7BCBBLafPZauR9TETYYXVk+OMYGHoTv8UW2yqn
 OJdyM1sq1SvMV3TPAJftbwdJzeT+X39sLeljJ518zsXTZdUpZ4oOpOFGFp/F4Y/c/GTL9qwJlF1
 umUqGKjX4d/Y08DbTeA==
X-Authority-Analysis: v=2.4 cv=bcRbluPB c=1 sm=1 tr=0 ts=6a38d78f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=jEvNu9c1Eb-cNSkZFhUA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA2MiBTYWx0ZWRfX+TNR43A0XMJ4
 fUjxvB4TR+DPNnBeFb0+bZWP8jkCh3r+THTaAUcMZDER/LE885ZR4VIkCMjqCJYmjwEgOn/OaLc
 3u8xUu6z+jw4LBmoiO+X78RajVafAFo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220062

Document the RPMh Network-On-Chip interconnect for the Qualcomm Maili
SoC.

Co-developed-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
 .../bindings/interconnect/qcom,maili-rpmh.yaml     | 127 +++++++++++++++
 include/dt-bindings/interconnect/qcom,maili-rpmh.h | 171 +++++++++++++++++++++
 2 files changed, 298 insertions(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,maili-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,maili-rpmh.yaml
new file mode 100644
index 000000000000..3db8d8b23219
--- /dev/null
+++ b/Documentation/devicetree/bindings/interconnect/qcom,maili-rpmh.yaml
@@ -0,0 +1,127 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interconnect/qcom,maili-rpmh.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm RPMh Network-On-Chip Interconnect on Maili SoC
+
+maintainers:
+  - Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
+
+description: |
+  RPMh interconnect providers support system bandwidth requirements through
+  RPMh hardware accelerators known as Bus Clock Manager (BCM). The provider is
+  able to communicate with the BCM through the Resource State Coordinator (RSC)
+  associated with each execution environment. Provider nodes must point to at
+  least one RPMh device child node pertaining to their RSC and each provider
+  can map to multiple RPMh resources.
+
+  See also: include/dt-bindings/interconnect/qcom,maili-rpmh.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,maili-aggre-noc
+      - qcom,maili-clk-virt
+      - qcom,maili-cnoc-main
+      - qcom,maili-gem-noc
+      - qcom,maili-llclpi-noc
+      - qcom,maili-lpass-ag-noc
+      - qcom,maili-lpass-lpiaon-noc
+      - qcom,maili-lpass-lpicx-noc
+      - qcom,maili-mc-virt
+      - qcom,maili-mmss-noc
+      - qcom,maili-nsp-noc
+      - qcom,maili-pcie-anoc
+      - qcom,maili-stdst-cfg
+      - qcom,maili-stdst-main
+      - qcom,maili-system-noc
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
+              - qcom,maili-clk-virt
+              - qcom,maili-mc-virt
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
+              - qcom,maili-aggre-noc
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
+              - qcom,maili-pcie-anoc
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
+              - qcom,maili-aggre-noc
+              - qcom,maili-pcie-anoc
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
+    gem_noc: interconnect@31100000 {
+      compatible = "qcom,maili-gem-noc";
+      reg = <0x31100000 0x160200>;
+      #interconnect-cells = <2>;
+      qcom,bcm-voters = <&apps_bcm_voter>;
+    };
+
+    aggre_noc: interconnect@f00000 {
+      compatible = "qcom,maili-aggre-noc";
+      reg = <0x00f00000 0x56200>;
+      #interconnect-cells = <2>;
+      clocks = <&gcc_phy_axi_clk>,
+               <&gcc_prim_axi_clk>,
+               <&rpmhcc_ipa_clk>;
+      qcom,bcm-voters = <&apps_bcm_voter>;
+    };
diff --git a/include/dt-bindings/interconnect/qcom,maili-rpmh.h b/include/dt-bindings/interconnect/qcom,maili-rpmh.h
new file mode 100644
index 000000000000..ae3e48b14eab
--- /dev/null
+++ b/include/dt-bindings/interconnect/qcom,maili-rpmh.h
@@ -0,0 +1,171 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_MAILI_H
+#define __DT_BINDINGS_INTERCONNECT_QCOM_MAILI_H
+
+#define MASTER_QSPI_0				0
+#define MASTER_QUP_2				1
+#define MASTER_QUP_3				2
+#define MASTER_QUP_4				3
+#define MASTER_QUP_5				4
+#define MASTER_CRYPTO				5
+#define MASTER_IPA				6
+#define MASTER_QUP_1				7
+#define MASTER_SOCCP_PROC			8
+#define MASTER_QDSS_ETR				9
+#define MASTER_QDSS_ETR_1			10
+#define MASTER_SDCC_2				11
+#define MASTER_SDCC_4				12
+#define MASTER_UFS_MEM				13
+#define MASTER_USB3				14
+#define SLAVE_A1NOC_SNOC			15
+
+#define MASTER_DDR_EFF_VETO			0
+#define MASTER_QUP_CORE_0			1
+#define MASTER_QUP_CORE_1			2
+#define MASTER_QUP_CORE_2			3
+#define MASTER_QUP_CORE_3			4
+#define MASTER_QUP_CORE_4			5
+#define MASTER_QUP_CORE_5			6
+#define SLAVE_DDR_EFF_VETO			7
+#define SLAVE_QUP_CORE_0			8
+#define SLAVE_QUP_CORE_1			9
+#define SLAVE_QUP_CORE_2			10
+#define SLAVE_QUP_CORE_3			11
+#define SLAVE_QUP_CORE_4			12
+#define SLAVE_QUP_CORE_5			13
+
+#define MASTER_GEM_NOC_CNOC			0
+#define MASTER_GEM_NOC_PCIE_SNOC		1
+#define SLAVE_AOSS				2
+#define SLAVE_IPA_CFG				3
+#define SLAVE_IPC_ROUTER_FENCE			4
+#define SLAVE_SOCCP				5
+#define SLAVE_TME_CFG				6
+#define SLAVE_CNOC_CFG				7
+#define SLAVE_DDRSS_CFG				8
+#define SLAVE_IMEM				9
+#define SLAVE_PCIE_0				10
+#define SLAVE_PCIE_1				11
+
+#define MASTER_GIC				0
+#define MASTER_GPU_TCU				1
+#define MASTER_SYS_TCU				2
+#define MASTER_APPSS_PROC			3
+#define MASTER_GFX3D				4
+#define MASTER_LPASS_GEM_NOC			5
+#define MASTER_MSS_PROC				6
+#define MASTER_MNOC_HF_MEM_NOC			7
+#define MASTER_MNOC_SF_MEM_NOC			8
+#define MASTER_COMPUTE_NOC			9
+#define MASTER_ANOC_PCIE_GEM_NOC		10
+#define MASTER_QPACE				11
+#define MASTER_SNOC_SF_MEM_NOC			12
+#define MASTER_WLAN_Q6				13
+#define SLAVE_GEM_NOC_CNOC			14
+#define SLAVE_LLCC				15
+#define SLAVE_MEM_NOC_PCIE_SNOC			16
+
+#define MASTER_LPIAON_NOC_LLCLPI_NOC		0
+#define SLAVE_LPASS_LPI_CC			1
+#define SLAVE_LLCC_ISLAND			2
+#define SLAVE_SERVICE_LLCLPI_NOC		3
+#define SLAVE_SERVICE_LLCLPI_NOC_CHIPCX		4
+
+#define MASTER_LPIAON_NOC			0
+#define SLAVE_LPASS_GEM_NOC			1
+
+#define MASTER_LPASS_LPINOC			0
+#define SLAVE_LPIAON_NOC_LLCLPI_NOC		1
+#define SLAVE_LPIAON_NOC_LPASS_AG_NOC		2
+
+#define MASTER_LPASS_PROC			0
+#define SLAVE_LPICX_NOC_LPIAON_NOC		1
+
+#define MASTER_LLCC				0
+#define MASTER_DDR_RT				1
+#define SLAVE_EBI1				2
+#define SLAVE_DDR_RT				3
+
+#define MASTER_CAMNOC_HF			0
+#define MASTER_CAMNOC_NRT_ICP_SF		1
+#define MASTER_CAMNOC_RT_CDM_SF			2
+#define MASTER_CAMNOC_SF			3
+#define MASTER_MDP				4
+#define MASTER_MDSS_DCP				5
+#define MASTER_CDSP_HCP				6
+#define MASTER_VIDEO_CV_PROC			7
+#define MASTER_VIDEO_EVA			8
+#define MASTER_VIDEO_MVP			9
+#define MASTER_VIDEO_V_PROC			10
+#define SLAVE_MNOC_HF_MEM_NOC			11
+#define SLAVE_MNOC_SF_MEM_NOC			12
+
+#define MASTER_CDSP_PROC			0
+#define SLAVE_CDSP_MEM_NOC			1
+
+#define MASTER_PCIE_ANOC_CFG			0
+#define MASTER_PCIE_0				1
+#define MASTER_PCIE_1				2
+#define SLAVE_ANOC_PCIE_GEM_NOC			3
+#define SLAVE_SERVICE_PCIE_ANOC			4
+
+#define MASTER_CFG_CENTER			0
+#define MASTER_CFG_EAST				1
+#define MASTER_CFG_MM_HF			2
+#define MASTER_CFG_MM_SF			3
+#define MASTER_CFG_NORTH			4
+#define MASTER_CFG_SOUTH			5
+#define MASTER_CFG_WEST				6
+#define SLAVE_AHB2PHY_SOUTH			7
+#define SLAVE_BOOT_ROM				8
+#define SLAVE_CAMERA_CFG			9
+#define SLAVE_CLK_CTL				10
+#define SLAVE_CRYPTO_CFG			11
+#define SLAVE_DISPLAY_CFG			12
+#define SLAVE_EVA_CFG				13
+#define SLAVE_GFX3D_CFG				14
+#define SLAVE_I2C				15
+#define SLAVE_IMEM_CFG				16
+#define SLAVE_IPC_ROUTER_CFG			17
+#define SLAVE_IRIS_CFG				18
+#define SLAVE_CNOC_MSS				19
+#define SLAVE_PCIE_0_CFG			20
+#define SLAVE_PCIE_1_CFG			21
+#define SLAVE_PRNG				22
+#define SLAVE_QSPI_0				23
+#define SLAVE_QUP_1				24
+#define SLAVE_QUP_2				25
+#define SLAVE_QUP_3				26
+#define SLAVE_QUP_4				27
+#define SLAVE_QUP_5				28
+#define SLAVE_SDCC_2				29
+#define SLAVE_SDCC_4				30
+#define SLAVE_TLMM				31
+#define SLAVE_UFS_MEM_CFG			32
+#define SLAVE_USB3				33
+#define SLAVE_VSENSE_CTRL_CFG			34
+#define SLAVE_PCIE_ANOC_CFG			35
+#define SLAVE_QDSS_CFG				36
+#define SLAVE_QDSS_STM				37
+#define SLAVE_TCSR				38
+#define SLAVE_TCU				39
+
+#define MASTER_CNOC_STARDUST			0
+#define SLAVE_STARDUST_CENTER_CFG		1
+#define SLAVE_STARDUST_EAST_CFG			2
+#define SLAVE_STARDUST_MM_HF_CFG		3
+#define SLAVE_STARDUST_MM_SF_CFG		4
+#define SLAVE_STARDUST_NORTH_CFG		5
+#define SLAVE_STARDUST_SOUTH_CFG		6
+#define SLAVE_STARDUST_WEST_CFG			7
+
+#define MASTER_A1NOC_SNOC			0
+#define MASTER_APSS_NOC				1
+#define MASTER_CNOC_SNOC			2
+#define SLAVE_SNOC_GEM_NOC_SF			3
+
+#endif

-- 
2.43.0

