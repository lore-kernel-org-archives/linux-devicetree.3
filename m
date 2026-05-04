Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8662537F725
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 09:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777887687; cv=none; b=SnP5Gtc8wI8cediwnVceeYkKGw5/iyYmPx04PHasooKBIbDPKxHT17N8+ADQxuiFf6wOi1QiHDK2v6MHDWWxBjvuZcXTN1L15GvNSIcgadH0OZAnzoIPFghz2b2HaOVZ/deCB2ZhfdpxgMi8xKj1am5jplZmqr3NOCsujyTtMP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777887687; c=relaxed/simple;
	bh=Si7yuu+HRyAdIGfalC5YraABFRTtwM9u5ryKhaCtqgc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pNhM6yNuEk8mxREfQHlbcjr1a4Q+nqWzYctOzy80ifxjSa8ZaZ1Di/bUnKsE4QBc1HSgru89MFJHh20b7zGC76zkqCGEMKBZr8iq7BfdErfbqOWHzGsk6LTeUpXchNT3jw6n90l7J2Q7O1LMTGc0WGfOJs/izJSqxTxBUWlyzVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NZS30OTA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bZ4v9cA+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NZS30OTA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bZ4v9cA+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6448fFG03845901
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 09:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1obhzKc2K8HlM8Stp75IyDN96iE+Eb/faq4qkERB0pU=; b=NZS30OTACgAOwrLx
	pefDX8AWw4HwjsFqulWdFxejBdvPTqJXgqy43NZCfgpszjk8BvSIxRCzjpgUybpg
	A/dWsfWFDCMk6LDOJR8m5v6YzR/OXuISIc3Nd577ZLwCMPTKTNyORlEoS8f7+nCx
	4gMXC4WRcz0DrDfJOuPE/1MmejMQb6pveTL7SkcGsvNBkeja8ecPfPQ4jNycmwnU
	pYviQUxotCtpnk2HWHJQOUa4NC6s34joyTHTYVfOdHiFNHzCQr26ChVRJCl9OtG2
	2oJDoszjZo0jactAPx+LIFXWcbeuzG4zuSWLlBj/GEXosJLIqHDQ/U0aP9Pnm0Lc
	Bn4dTg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw6yfdfkx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 09:41:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba268cb5e6so6109605ad.1
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 02:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777887684; x=1778492484; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1obhzKc2K8HlM8Stp75IyDN96iE+Eb/faq4qkERB0pU=;
        b=bZ4v9cA+rRZxzd25DYmRUfnS3Fc/rGEHylHfFl8VXxkr8ROq3v0W65RugB/gWx6Nk0
         UxxtXsaqn2sEQFfx6mlGKG5V+g1yuN4Rb7f3dSwJl4+XE+Wlw8BpK5d+wvCksdCaZasz
         iytUr/whr9nOiNXfXcp5Tc+0vwjWFAmEbUtiBhVZ+n3A2YW7gzE/3O35kErSNBvxSiiW
         T0LOpiWIL3rVC6o3NcfS/JHnvJzW0FrSrOtVpWgAd4Nq3gb5bFuj9ThniuNClN57n2G+
         +RKKcb56tXXYW4BqXK77g46OZAJHG4aycwflIwTkB0PMxpN0B6hrH5CdWsyQwSUxN8nX
         +6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777887684; x=1778492484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1obhzKc2K8HlM8Stp75IyDN96iE+Eb/faq4qkERB0pU=;
        b=hIXzLIRfWmMJ7sJ7vdMY/AAPwnsRvmjzKmeKihu1GvcDTUCB4ZzK4KWgJIcs2QJFop
         kXoXTi5B+HH9RFpUwN58PM54oAFZ5tL5zRyCscheAB2eXZ1hrCO/Vcp2P8asDck3jt8L
         qVEooCmto/Z4JuJnINWwJFPHrJ7fPfZY88ifLFIhKmWbKzCDUE1Vu+EHiQpmhmCUDPz8
         IJyvawPLUQEHN1otPU6z0MUKLpSa66jVduotaFh6o+KZMsLxilZ+vUhrlzzOWC+6sz67
         rzJxbfTyqsgyKX6YyGTfKRhl6INXIn8wbzwhu66xKDwwZ9a78+hv/cpxtXkeiwjWq/KW
         jCow==
X-Forwarded-Encrypted: i=1; AFNElJ+NwDxcgnZXDop7PlxZt84R3tXcWJX95uT3BBC2At8AU8c3KW5D0YSdF+DnIT5M8pqnQOCzOZMogSc1@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9+YseEdOV3G4No0HPn7Wdp6hN8pRXupUu1lKVRZI8szV5+nDb
	Ftb28lxOlfJ3Xcodkvb9PK2jrdmFgesvMqArQRiv+98wte/+d3iQBG+ZJoXm2mb9HYH16Sp7hq0
	YyhfA1LAxvoUff8PExYaBQFIcUlHbObtV8tz5LsXLk4u9kO6LmkCmZNoAjTIjUBAY
X-Gm-Gg: AeBDiesAr7kwitG9CaugDK7nTd2hzBb7EZOVohT/2R8PhUkr1ulbXK3D1jjSm+tIpzH
	rxB2t1c8gga/DRd0Z45FJyVS4qHxD3bU5r6+5cyNwaH84rIE6gyjeoOaIhi3SioCadIBiH7noD9
	dQUro8yurKvNSkwQ7DHsUzDzrxnh4KmVDBXp1lxJ25L3cBJy32fJszU5Oc7d29neeRDLVqxPuZz
	Ek2j2uSdTFh8w4VzZP6I5gF9a+FHsUlUUGDA2sxtWfMnXSyMRsRMZflVtrTc/LbopJuyuik+CN/
	eZ33XKGGX0uyAnakG8yEI7JcdevlDeVHLYPt1hM8N9eKobff21QSJ5KHDqzg1FTFU0ipi2dlc0z
	E326EJZ9p/xVADR+51D+zj3C9CUIntgY4KlaLozVXuvTPQ8U8mHp+MMU=
X-Received: by 2002:a17:902:f787:b0:2b7:ca38:975f with SMTP id d9443c01a7336-2b9f25dfe17mr81809735ad.23.1777887683789;
        Mon, 04 May 2026 02:41:23 -0700 (PDT)
X-Received: by 2002:a17:902:f787:b0:2b7:ca38:975f with SMTP id d9443c01a7336-2b9f25dfe17mr81809315ad.23.1777887683216;
        Mon, 04 May 2026 02:41:23 -0700 (PDT)
Received: from [169.254.0.2] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ba038ae95csm58985045ad.46.2026.05.04.02.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 02:41:22 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Date: Mon, 04 May 2026 09:41:13 +0000
Subject: [PATCH v2 1/2] dt-bindings: interconnect: document the RPM
 Network-On-Chip interconnect in Shikra SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-shikra_icc-v2-1-81076171e010@oss.qualcomm.com>
References: <20260504-shikra_icc-v2-0-81076171e010@oss.qualcomm.com>
In-Reply-To: <20260504-shikra_icc-v2-0-81076171e010@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-ORIG-GUID: bk8jd4daZGODeuStYxt5y0890d2-Cs82
X-Proofpoint-GUID: bk8jd4daZGODeuStYxt5y0890d2-Cs82
X-Authority-Analysis: v=2.4 cv=QY5WeMbv c=1 sm=1 tr=0 ts=69f869c4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=8QtCtDovb98T9R5Wn5QA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDEwMyBTYWx0ZWRfX/I0HFg6VS694
 uIUhyCdmKBBOE+EziYpXQb9MYERJ8C6MizYi44x5jd13LdZFreQ71o1svvJdyf1wUKJNF1Q49yg
 1cFaG9agLIzvx366U+24li3vx4bhrikw3N1MNMGwGzKiWPNpsRT7FKotGwS7Tru98XPe1muViF9
 7iF5qVrt9QBS0iox3ybgKjlsDyD1clCSwTrPOTbdISDeXqR6gqbyteQXtP1/ZHMNqNadxTPQYi4
 nCWRUd/fwDsWOBdhSGMRxZlDcZ/5GBN3kyVweILKphO1+Qf+3YFcvogi6HAQn12yGw3ZFnD5ZrQ
 LhVFqsCZK51e5QCwc5Mwo/psUa4nW4nTmb5JUaRUuSrhmov2zY8yRj/TNlC5Ew+vOGZtRy2QhKW
 1BUlbptFuM6wXCu9C2W/0DPslCTmrugL/fjtrhcMntAWVMCDq3dTcer5WjN/7V/9T9WqFc5jfDG
 uo7NV216bCKZxs5dVLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040103

Document the RPM Network-On-Chip Interconnect for the Qualcomm
Shikra platform.

Co-developed-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
 .../bindings/interconnect/qcom,shikra.yaml         | 134 +++++++++++++++++++++
 include/dt-bindings/interconnect/qcom,shikra.h     | 121 +++++++++++++++++++
 2 files changed, 255 insertions(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,shikra.yaml b/Documentation/devicetree/bindings/interconnect/qcom,shikra.yaml
new file mode 100644
index 000000000000..48b8f3b67e97
--- /dev/null
+++ b/Documentation/devicetree/bindings/interconnect/qcom,shikra.yaml
@@ -0,0 +1,134 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interconnect/qcom,shikra.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Shikra Network-On-Chip interconnect
+
+maintainers:
+  - Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
+
+description:
+  The Qualcomm Shikra interconnect providers support adjusting the
+  bandwidth requirements between the various NoC fabrics.
+
+properties:
+  compatible:
+    enum:
+      - qcom,shikra-config-noc
+      - qcom,shikra-mem-noc-core
+      - qcom,shikra-sys-noc
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
+# Child node's properties
+patternProperties:
+  '^interconnect-[a-z0-9]+$':
+    type: object
+    description:
+      The interconnect providers do not have a separate QoS register space,
+      but share parent's space.
+
+    $ref: qcom,rpm-common.yaml#
+
+    properties:
+      compatible:
+        enum:
+          - qcom,shikra-clk-virt
+          - qcom,shikra-mc-virt
+          - qcom,shikra-mmrt-virt
+          - qcom,shikra-mmnrt-virt
+
+    required:
+      - compatible
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: qcom,rpm-common.yaml#
+  - if:
+      properties:
+        compatible:
+          const: qcom,shikra-mem-noc-core
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: GPU-NoC AXI clock
+
+        clock-names:
+          items:
+            - const: gpu_axi
+      patternProperties:
+        '^interconnect-[a-z0-9]+$': false
+
+  - if:
+      properties:
+        compatible:
+          const: qcom,shikra-sys-noc
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: EMAC0-NoC AXI clock.
+            - description: EMAC1-NoC AXI clock.
+            - description: USB2-NoC AXI clock.
+            - description: USB3-NoC AXI clock.
+
+        clock-names:
+          items:
+            - const: emac0_axi
+            - const: emac1_axi
+            - const: usb2_axi
+            - const: usb3_axi
+
+  - if:
+      properties:
+        compatible:
+          const: qcom,shikra-config-noc
+
+    then:
+      properties:
+        clocks: false
+        clock-names: false
+      patternProperties:
+        '^interconnect-[a-z0-9]+$': false
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    system_noc: interconnect@1880000 {
+        compatible = "qcom,shikra-sys-noc";
+        reg = <0x01880000 0x6a080>;
+        #interconnect-cells = <2>;
+        clocks = <&gcc_emac0_axi_sys_noc_clk>,
+                 <&gcc_emac1_axi_sys_noc_clk>,
+                 <&gcc_sys_noc_usb2_prim_axi_clk>,
+                 <&gcc_sys_noc_usb3_prim_axi_clk>;
+        clock-names = "emac0_axi",
+                      "emac1_axi",
+                      "usb2_axi",
+                      "usb3_axi";
+
+        clk_virt: interconnect-clk {
+            compatible = "qcom,shikra-clk-virt";
+            #interconnect-cells = <2>;
+        };
+    };
diff --git a/include/dt-bindings/interconnect/qcom,shikra.h b/include/dt-bindings/interconnect/qcom,shikra.h
new file mode 100644
index 000000000000..a42ea22ee162
--- /dev/null
+++ b/include/dt-bindings/interconnect/qcom,shikra.h
@@ -0,0 +1,121 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_SHIKRA_H
+#define __DT_BINDINGS_INTERCONNECT_QCOM_SHIKRA_H
+
+#define MASTER_QUP_CORE_0			0
+#define SLAVE_QUP_CORE_0			1
+
+#define SNOC_CNOC_MAS				0
+#define MASTER_QDSS_DAP				1
+#define SLAVE_AHB2PHY_USB			2
+#define SLAVE_APSS_THROTTLE_CFG			3
+#define SLAVE_AUDIO				4
+#define SLAVE_BOOT_ROM				5
+#define SLAVE_CAMERA_NRT_THROTTLE_CFG		6
+#define SLAVE_CAMERA_CFG			7
+#define SLAVE_CDSP_THROTTLE_CFG			8
+#define SLAVE_CLK_CTL				9
+#define SLAVE_DSP_CFG				10
+#define SLAVE_RBCPR_CX_CFG			11
+#define SLAVE_RBCPR_MX_CFG			12
+#define SLAVE_CRYPTO_0_CFG			13
+#define SLAVE_DDR_SS_CFG			14
+#define SLAVE_DISPLAY_CFG			15
+#define SLAVE_EMAC0_CFG				16
+#define SLAVE_EMAC1_CFG				17
+#define SLAVE_GPU_CFG				18
+#define SLAVE_GPU_THROTTLE_CFG			19
+#define SLAVE_HWKM				20
+#define SLAVE_IMEM_CFG				21
+#define SLAVE_MAPSS				22
+#define SLAVE_MDSP_MPU_CFG			23
+#define SLAVE_MESSAGE_RAM			24
+#define SLAVE_MSS				25
+#define SLAVE_PCIE_CFG				26
+#define SLAVE_PDM				27
+#define SLAVE_PIMEM_CFG				28
+#define SLAVE_PKA_WRAPPER_CFG			29
+#define SLAVE_PMIC_ARB				30
+#define SLAVE_QDSS_CFG				31
+#define SLAVE_QM_CFG				32
+#define SLAVE_QM_MPU_CFG			33
+#define SLAVE_QPIC				34
+#define SLAVE_QUP_0				35
+#define SLAVE_RPM				36
+#define SLAVE_SDCC_1				37
+#define SLAVE_SDCC_2				38
+#define SLAVE_SECURITY				39
+#define SLAVE_SNOC_CFG				40
+#define SNOC_SF_THROTTLE_CFG			41
+#define SLAVE_TLMM				42
+#define SLAVE_TSCSS				43
+#define SLAVE_USB2				44
+#define SLAVE_USB3				45
+#define SLAVE_VENUS_CFG				46
+#define SLAVE_VENUS_THROTTLE_CFG		47
+#define SLAVE_VSENSE_CTRL_CFG			48
+#define SLAVE_SERVICE_CNOC			49
+
+#define MASTER_LLCC				0
+#define SLAVE_EBI_CH0				1
+
+#define MASTER_GRAPHICS_3D			0
+#define MASTER_MNOC_HF_MEM_NOC			1
+#define MASTER_ANOC_PCIE_MEM_NOC		2
+#define MASTER_SNOC_SF_MEM_NOC			3
+#define MASTER_AMPSS_M0				4
+#define MASTER_SYS_TCU				5
+#define SLAVE_LLCC				6
+#define SLAVE_MEMNOC_SNOC			7
+#define SLAVE_MEM_NOC_PCIE_SNOC			8
+
+#define MASTER_CAMNOC_SF			0
+#define MASTER_VIDEO_P0				1
+#define MASTER_VIDEO_PROC			2
+#define SLAVE_MMNRT_VIRT			3
+
+#define MASTER_CAMNOC_HF			0
+#define MASTER_MDP_PORT0			1
+#define MASTER_MMRT_VIRT			2
+#define SLAVE_MM_MEMNOC				3
+
+#define MASTER_SNOC_CFG				0
+#define MASTER_TIC				1
+#define MASTER_ANOC_SNOC			2
+#define MASTER_MEMNOC_PCIE			3
+#define MASTER_MEMNOC_SNOC			4
+#define MASTER_PIMEM				5
+#define MASTER_PCIE2_0				6
+#define MASTER_QDSS_BAM				7
+#define MASTER_QPIC				8
+#define MASTER_QUP_0				9
+#define CNOC_SNOC_MAS				10
+#define MASTER_AUDIO				11
+#define MASTER_EMAC_0				12
+#define MASTER_EMAC_1				13
+#define MASTER_QDSS_ETR				14
+#define MASTER_SDCC_1				15
+#define MASTER_SDCC_2				16
+#define MASTER_USB2_0				17
+#define MASTER_USB3				18
+#define MASTER_CRYPTO_CORE0			19
+#define SLAVE_APPSS				20
+#define SLAVE_MCUSS				21
+#define SLAVE_WCSS				22
+#define SLAVE_MEMNOC_SF				23
+#define SNOC_CNOC_SLV				24
+#define SLAVE_BOOTIMEM				25
+#define SLAVE_OCIMEM				26
+#define SLAVE_PIMEM				27
+#define SLAVE_SERVICE_SNOC			28
+#define SLAVE_PCIE2_0				29
+#define SLAVE_QDSS_STM				30
+#define SLAVE_TCU				31
+#define SLAVE_PCIE_MEMNOC			32
+#define SLAVE_ANOC_SNOC				33
+
+#endif

-- 
2.43.0

