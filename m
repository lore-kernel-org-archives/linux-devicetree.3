Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184203;
	b=ejE2tJ7nVxsfjmcAsxZEyiELmama7qrp+yQWmnbkbTAb+sO/owufJQ635x2UpkunfcZs
	 W3ImxydopE1RxzNbwlJl+D4C4KN3ojWEO6wvWdUkogQTiFtyxDqWvHb0S/G0dn5XWd6Vq
	 xm+b3p8Mwl+Og1/9Yf56sZzBCs+P6PkEzpAMy3D/USPklO47DtmsEO9997pgb9/uEym6A
	 oniJL+TFLcafkfxMKOSxOCjDfC4s4dSc/4v7rGwpQGZKLTNeTNMS7NpiZTBTnTYM4yFmX
	 tGSItHaQOkcTuo66N9TDbn6L+z7ZyiF9YfdNN/+Pj5hiE7eVbFB3840JhKz6/bjNlNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=voGU7Tv7fR6KB00DVUkpHf7HMBXoJCHAbHEv6SU5X8E=;
	b=yIqGSno4eApwua6T1SI5cmRBUB8bTlLF3cmSwKUUp5SiGwq7Cbj+Yr+qpdmVsDFqPZVS
	 Mfcy5jG93n2RLrsYnYABSu9iybLDkBNLvzA1aOxNSaM4OXAXZCIZDvot2nUpNlstntZB6
	 CjTd2Ojuuf5vxF3BI33TW2TAvd/AahvBPgE5FFhW1U66iOsIrCVWgew3XS3VTZYSjvcac
	 8KFpUlVb2kI8+h3MwaYN4KJR/bT0B91+8ECA1zFzo0PldCiyEpyF/qZerF7+g9e+fyBL4
	 2Zbhv8WeACFONXTz8/u1v6oemh/Fx/SEsQrp5RldWWqYn+aRtCJDhKdrhWW8hNh0RpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IyB5Esnh;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FED606A33E
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 00:30:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44FED606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IyB5Esnh
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so3549855e9.2
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 16:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184202; x=1794789002; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=voGU7Tv7fR6KB00DVUkpHf7HMBXoJCHAbHEv6SU5X8E=;
        b=IyB5EsnhYiE/glJxhXv/ZYU/Tr+InZrrbQcyWNm96kjBbOs9cymBzNewAyCQ4r2Sme
         xKeGI24iZtrumCfnnVFlK+dKfQTYVx88F3IZdzunhKNN3cSddKNNihOV9g3XJuXIVYwI
         TzOcYXCfsZ3zf7tOnCe+vbZBtA4eLagLAMvtL4Un4Z2Mq8t/SGYfvgjKQ9ezMDTxTmxG
         2y8bMymP+gktaLMhbQZtjg77JGjZHNpnAbuiEShqTBzcPdXs8JoKt63Oe+G7RrSLvuJ5
         RxEDMu/i6NsKXPtrcOEZx5zeIbyKrgKwsSl5bOubyCpbjunreb17vyQd3fmpvXxxqxaj
         vvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184202; x=1794789002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=voGU7Tv7fR6KB00DVUkpHf7HMBXoJCHAbHEv6SU5X8E=;
        b=G9DQatHU3Pkn6eXMbi/sTdXXETMNrg0/Y/uONmjRaX7/hwFbE24GvAQn2EOb5FJBD8
         bFEmgeXbO4Kv5jl77k8llVjTGdnYunB1k5KKBI4GfvcRrzFH2VGkUJF7gBEzvJQw2/lT
         HlRRZ6Z/ewUHaE7YYgwoATZPcpj01uiqsbu5d3aJcVN4lIffy8Il98THC4Fuer54uDcb
         YSn+X2xcYpqy8VeZ+L1f08LEXJGRhnrSawoIs38kxsXy8HyJNlRf4YrWE4JvxFhDGBZ8
         lz20p8lBTWRrIyKhWcOVBaUBcZfUBI1IHqctP2SNWiby/hXjtCzXjY5BTunuiCZebz0p
         NooA==
X-Forwarded-Encrypted: i=1; AL+hErFZLs56N49NvJOPYXUMDIz4/+j18/KFnHGv3kfJe5EVolQQLoPInlwHu9wQPS6JZun7zTbawjnXh9Ew@vger.kernel.org
X-Gm-Message-State: APuU4Z9v4SrBB2vZa0T6gtlAAixEnHtGL6auy32Y5U1ZzWha8sNR1mLx
	fFWGA9+C+hFt181nabftRqkA2wcoWPdh3tBOLLZGDyv9tr2cMfIZ6xZfcnzXTMKIQ3Y=
X-Gm-Gg: AYBFou0k8FKSDTYpEDKv7uHqQr5eDDMr0Q8+cCFv/cTGhHg4LUFMutJ2R8WY4SHvp2g
	6K9jXwXF7uVa+GuMJ6F62eoIV07OIk9xo2q3u5uN26EZazGID4OFnAq17AoCm/JPW8pf7WM0KjB
	ajjXoMfcTGfJZ40Afqw7NY0Q5BGX4DjHiqlRQaFdEIx01BQ6F/vPPwre6GWUtj6ZPMRtTsRBLS2
	20+kHdue+blI6DGaLe8I4nsX2FLl9H4E+hzs9NZEKKBHSezrcQWokIFqceZTnfoOoux2MGRTUxS
	73zmRYKhzXWXPK+ctzG/QTn9gbLJNj3AotTTQA+XFS4K8V1pgMt/ZCqMYwbE2FSi9fypNt5Se+9
	gDIYahpkRA0OxESiOZ6ECWSc6Ya3hj29rHO2srwbdtobA6vsM6tBI9huyfOfVx1NOSaUyv4DETB
	2xIIl7jNU/cwfP09UgM+xnK6Y4h0dXOxGj9EWyCGXOeltMkRovcTFUb70YFiF5pxVDOCgCpS4pb
	B0es7BL0Y2Yzwlv9+drxqA0zsGfIFcT2FRQz+D6e4tcRyadIeqX8TbF1tDLzKdI0N1TK38Ofopj
	BDnLpDAYRRYnyAR7A5Z6gDXFtFhFgSOr/KpNkwbZ
X-Received: by 2002:a05:6000:220b:b0:48e:4f1e:5e24 with SMTP id ffacd0b85a97d-4958a016028mr5255812f8f.14.1794184201825;
        Sun, 08 Nov 2026 16:30:01 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4967a70a35dsm3479742f8f.9.2026.11.08.16.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:30:00 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:29:53 +0000
Subject: [PATCH 1/2] dt-bindings: interconnect: document the RPMh
 Network-On-Chip interconnect in Halliday SoC
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-halliday-icc-v1-1-def7cf786f75@gmail.com>
References: <20261109-halliday-icc-v1-0-def7cf786f75@gmail.com>
In-Reply-To: <20261109-halliday-icc-v1-0-def7cf786f75@gmail.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184195; l=8805;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=M86V6R814tMy3S6XEUAkpjxhyI75umVhUUot4udVZXU=;
 b=2qS493Riaiafgy8U1TXUJWeJJB3UCTQdaLMg6DCxxOFD8N0LjhaHDMNVm1s4SNSiyPDC7PRlz
 nqnZ7PQtAM6C0afY+3SxmWkOfyKkyWJE7mF6b3zDKeQBt8aaNFEUeJc
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the RPMh Network-On-Chip interconnect on the Qualcomm Halliday
SoC (SXR2250P).

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 .../bindings/interconnect/qcom,halliday-rpmh.yaml  | 131 +++++++++++++++++
 .../dt-bindings/interconnect/qcom,halliday-rpmh.h  | 158 +++++++++++++++++++++
 2 files changed, 289 insertions(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,halliday-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,halliday-rpmh.yaml
new file mode 100644
index 000000000000..0bc27ace965d
--- /dev/null
+++ b/Documentation/devicetree/bindings/interconnect/qcom,halliday-rpmh.yaml
@@ -0,0 +1,131 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interconnect/qcom,halliday-rpmh.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm RPMh Network-On-Chip Interconnect on Halliday
+
+maintainers:
+  - Stanislav Aleksandrov <lightofmysoul@gmail.com>
+
+description: |
+  RPMh interconnect providers support system bandwidth requirements through
+  RPMh hardware accelerators known as Bus Clock Manager (BCM).
+
+  See also: include/dt-bindings/interconnect/qcom,halliday-rpmh.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,halliday-aggre1-noc
+      - qcom,halliday-aggre2-noc
+      - qcom,halliday-clk-virt
+      - qcom,halliday-config-noc
+      - qcom,halliday-gem-noc
+      - qcom,halliday-lpass-ag-noc
+      - qcom,halliday-mc-virt
+      - qcom,halliday-mmss-noc
+      - qcom,halliday-nsp-noc
+      - qcom,halliday-pcie-anoc
+      - qcom,halliday-system-noc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
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
+              - qcom,halliday-clk-virt
+              - qcom,halliday-mc-virt
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
+              - qcom,halliday-aggre1-noc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: aggre UFS PHY AXI clock
+            - description: aggre USB3 PRIM AXI clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,halliday-aggre2-noc
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
+              - qcom,halliday-pcie-anoc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: aggre-NOC PCIe AXI clock
+            - description: cfg-NOC PCIe a-NOC AHB clock
+            - description: aggre-NOC PCIe SF AXI clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,halliday-aggre1-noc
+              - qcom,halliday-aggre2-noc
+              - qcom,halliday-pcie-anoc
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
+    interconnect-0 {
+        compatible = "qcom,halliday-clk-virt";
+        #interconnect-cells = <2>;
+        qcom,bcm-voters = <&apps_bcm_voter>;
+    };
+
+    interconnect@16c0000 {
+        compatible = "qcom,halliday-pcie-anoc";
+        reg = <0x016c0000 0xc080>;
+        clocks = <&aggre_noc_pcie_axi_clk>,
+                 <&cfg_noc_pcie_anoc_ahb_clk>,
+                 <&aggre_noc_pcie_sf_axi_clk>;
+        #interconnect-cells = <2>;
+        qcom,bcm-voters = <&apps_bcm_voter>;
+    };
diff --git a/include/dt-bindings/interconnect/qcom,halliday-rpmh.h b/include/dt-bindings/interconnect/qcom,halliday-rpmh.h
new file mode 100644
index 000000000000..d60086489b38
--- /dev/null
+++ b/include/dt-bindings/interconnect/qcom,halliday-rpmh.h
@@ -0,0 +1,158 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2026, Stanislav Aleksandrov <lightofmysoul@gmail.com>
+ */
+
+#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_HALLIDAY_H
+#define __DT_BINDINGS_INTERCONNECT_QCOM_HALLIDAY_H
+
+/* aggre1_noc */
+#define MASTER_QUP_1				0
+#define MASTER_A1NOC_CFG			1
+#define MASTER_UFS_MEM				2
+#define MASTER_USB3_0				3
+#define SLAVE_A1NOC_SNOC			4
+#define SLAVE_SERVICE_A1NOC			5
+
+/* aggre2_noc */
+#define MASTER_QDSS_BAM				0
+#define MASTER_QUP_0				1
+#define MASTER_A2NOC_CFG			2
+#define MASTER_CNOC_A2NOC			3
+#define MASTER_CRYPTO				4
+#define MASTER_IPA				5
+#define MASTER_SP				6
+#define MASTER_QDSS_ETR				7
+#define MASTER_QDSS_ETR_1			8
+#define MASTER_SDCC_2				9
+#define SLAVE_A2NOC_SNOC			10
+#define SLAVE_SERVICE_A2NOC			11
+
+/* clk_virt */
+#define MASTER_QUP_CORE_0			0
+#define MASTER_QUP_CORE_1			1
+#define SLAVE_QUP_CORE_0			2
+#define SLAVE_QUP_CORE_1			3
+
+/* config_noc */
+#define MASTER_GEM_NOC_CNOC			0
+#define MASTER_QDSS_DAP				1
+#define SLAVE_AHB2PHY_SOUTH			2
+#define SLAVE_AHB2PHY_NORTH			3
+#define SLAVE_AOSS				4
+#define SLAVE_CAMERA_CFG			5
+#define SLAVE_CLK_CTL				6
+#define SLAVE_CDSP_CFG				7
+#define SLAVE_RBCPR_CX_CFG			8
+#define SLAVE_RBCPR_MMCX_CFG			9
+#define SLAVE_RBCPR_MXA_CFG			10
+#define SLAVE_RBCPR_MXC_CFG			11
+#define SLAVE_CRYPTO_0_CFG			12
+#define SLAVE_CX_RDPM				13
+#define SLAVE_DISPLAY_CFG			14
+#define SLAVE_DISPLAY1_CFG			15
+#define SLAVE_GFX3D_CFG				16
+#define SLAVE_IMEM_CFG				17
+#define SLAVE_IPA_CFG				18
+#define SLAVE_IPC_ROUTER_CFG			19
+#define SLAVE_LPASS				20
+#define SLAVE_MX_RDPM				21
+#define SLAVE_PDM				22
+#define SLAVE_PRNG				23
+#define SLAVE_QDSS_CFG				24
+#define SLAVE_QUP_0				25
+#define SLAVE_QUP_1				26
+#define SLAVE_SDCC_2				27
+#define SLAVE_SPSS_CFG				28
+#define SLAVE_TCSR				29
+#define SLAVE_TLMM				30
+#define SLAVE_TME_CFG				31
+#define SLAVE_UFS_MEM_CFG			32
+#define SLAVE_USB3_0				33
+#define SLAVE_VENUS_CFG				34
+#define SLAVE_VSENSE_CTRL_CFG			35
+#define SLAVE_A1NOC_CFG				36
+#define SLAVE_A2NOC_CFG				37
+#define SLAVE_CNOC_A2NOC			38
+#define SLAVE_DDRSS_CFG				39
+#define SLAVE_CNOC_MNOC_CFG			40
+#define SLAVE_PCIE_ANOC_CFG			41
+#define SLAVE_SNOC_CFG				42
+#define SLAVE_IMEM				43
+#define SLAVE_SERVICE_CNOC			44
+#define SLAVE_QDSS_STM				45
+#define SLAVE_TCU				46
+
+/* gem_noc */
+#define MASTER_GPU_TCU				0
+#define MASTER_SYS_TCU				1
+#define MASTER_APPSS_PROC			2
+#define MASTER_GFX3D				3
+#define MASTER_MNOC_HF_MEM_NOC			4
+#define MASTER_MNOC_SF_MEM_NOC			5
+#define MASTER_COMPUTE_NOC			6
+#define MASTER_ANOC_PCIE_GEM_NOC		7
+#define MASTER_SNOC_GC_MEM_NOC			8
+#define MASTER_SNOC_SF_MEM_NOC			9
+#define SLAVE_GEM_NOC_CNOC			10
+#define SLAVE_LLCC				11
+
+/* lpass_ag_noc */
+#define MASTER_CNOC_LPASS_AG_NOC		0
+#define MASTER_LPASS_PROC			1
+#define SLAVE_LPASS_CORE_CFG			2
+#define SLAVE_LPASS_LPI_CFG			3
+#define SLAVE_LPASS_MPU_CFG			4
+#define SLAVE_LPASS_TOP_CFG			5
+#define SLAVE_LPASS_SNOC			6
+#define SLAVE_SERVICES_LPASS_AML_NOC		7
+#define SLAVE_SERVICE_LPASS_AG_NOC		8
+
+/* mc_virt */
+#define MASTER_LLCC				0
+#define SLAVE_EBI1				1
+#define MASTER_DDR_RT				2
+#define SLAVE_DDR_RT				3
+
+/* mmss_noc */
+#define MASTER_CAMNOC_HF			0
+#define MASTER_CAMNOC_ICP			1
+#define MASTER_CAMNOC_SF			2
+#define MASTER_MDP0				3
+#define MASTER_MDP1				4
+#define MASTER_CNOC_MNOC_CFG			5
+#define MASTER_CDSP_HCP				6
+#define MASTER_VIDEO				7
+#define MASTER_VIDEO_CV_PROC			8
+#define MASTER_VIDEO_PROC			9
+#define MASTER_VIDEO_V_PROC			10
+#define SLAVE_MNOC_HF_MEM_NOC			11
+#define SLAVE_MNOC_SF_MEM_NOC			12
+#define SLAVE_SERVICE_MNOC			13
+
+/* nsp_noc */
+#define MASTER_CDSP_NOC_CFG			0
+#define MASTER_CDSP_PROC			1
+#define SLAVE_CDSP_MEM_NOC			2
+#define SLAVE_SERVICE_NSP_NOC			3
+
+/* pcie_anoc */
+#define MASTER_PCIE_ANOC_CFG			0
+#define MASTER_PCIE_0				1
+#define MASTER_PCIE_1				2
+#define MASTER_PCIE_4				3
+#define SLAVE_ANOC_PCIE_GEM_NOC			4
+#define SLAVE_SERVICE_PCIE_ANOC			5
+
+/* system_noc */
+#define MASTER_GIC_AHB				0
+#define MASTER_A1NOC_SNOC			1
+#define MASTER_A2NOC_SNOC			2
+#define MASTER_LPASS_ANOC			3
+#define MASTER_SNOC_CFG				4
+#define MASTER_GIC				5
+#define SLAVE_SNOC_GEM_NOC_GC			6
+#define SLAVE_SNOC_GEM_NOC_SF			7
+#define SLAVE_SERVICE_SNOC			8
+
+#endif

-- 
2.55.0

