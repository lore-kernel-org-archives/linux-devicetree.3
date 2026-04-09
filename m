Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F69034DB56
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 21:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775768503; cv=none; b=kCp11qnRqEbTjYW/4xkQMneTsy8zXNT1U2sqdUGTtxZe+cg07E2oA6DYnRpfRhyMutwAzIH13zMVlDl3CBlreCUHkVRCqAyulFlb4tloT7t5qlXLEarBGfx/FbwRKuVIPJWEJeBvi+gI+ISdFT9WOWpVdAV/6QDzrcqFAkW9vms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775768503; c=relaxed/simple;
	bh=Ob6W0oiZLfqCBw6yYs9XOIpnmLmpUMr1BTuvqxLZ7UU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IWcd/0koQQeHEBrGeqQHughG2Swg9SQyhIR3Cqevx2QX9k/vWVSKSxZm0+ki2dy0QgYNX2bkXb8qwmCXeeqF0FA3iQ1JbcSZhdVwMRwhJXJX9tekwJYIcRTdiRZdIXsXGamaXTsze7oxEh8L8q+jdEVgQ/NK7kAmNZU38mkTYzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aBHhp+Of; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M3nE6s/l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aBHhp+Of";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M3nE6s/l"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639DdLhG2812087
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 21:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b34JrBbVwfCelMOZnB0VD47ts657W7EkA+kg8VZoaJs=; b=aBHhp+OfRiKGonKA
	oXt/qKls4rMH+IODtZiwaesXpHDYqZ4ocptWUELFK+fhK4CWzZxW7IB2HLAdTH2l
	kpGlYQjVOxgqkGColA7G9sHXcJ6IN1VkdBiYvIUNMVRD8bDdHoAEMQ11TQrqHV0d
	c2WZ3Qk3fOvj+AHtv9Ss4OIwEAsgOnibz7r8vHmdUCH8tOe1Jq0ujP1F4YatRHge
	58S7MKBhxJ6Hy6PvyACKXW91KkF1tKh5kPVoNNTS7TuqzQIUfEVwIGytIGzoH3CF
	VV7cyDXp1xee98ma6mzOPGsTzc64pQqvMIVJRnZ0Elr5EjSTeYFaAHC9AVqxPVFK
	4eRGPw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ded6h9gdv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 21:01:41 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c68a134df8so1144673eec.1
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 14:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775768501; x=1776373301; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b34JrBbVwfCelMOZnB0VD47ts657W7EkA+kg8VZoaJs=;
        b=M3nE6s/lZdmg31Epu6k1oojBXBQvNwmfBYsvtJ9vkuC7WMLRXMGS8zKPWuVnhzGg8y
         ds6RvqKZNUAwtmC+awg7t4xJxfDf8CbgUyEYE3m//pjavnubF9wJiq6KXiOOgxOUemOP
         oF0g3wBhx+8f9QEc6R0JSLPPiVEWyxR8psOqP8JjFTwvh1jPO37eA8oglUIaN/yZin9N
         VQY/NWqB9ygx1+QOQadvW84SloCrX9V4uPyV4TPQt8Z4GfBbOkgYkEKR5ieRjJTDjYXV
         apOrJuZFiq4lpn5i7zY588/6T3rW1piscNBVhlCp2tJkWt43uGAt2pXEfO8EJ2tVB+OW
         rEDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775768501; x=1776373301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b34JrBbVwfCelMOZnB0VD47ts657W7EkA+kg8VZoaJs=;
        b=WpFzGvIL6z7/oOBwnduRrv8oXlqCaO5W65qInU3PnPozFh1j15hTWkeMKn+tZIAb7s
         b0OaRhHJMnXzok6uN4amvxFulidMFoDQ6LU44qtwZRbx2el92TBG0UWfMWpQbhzedVZ/
         L+DHc4I4jL4WCdlMQNKNKOVFNtBRmJ/bCHeprhRyL653b0423DY07v/qVw3t+EUJi7zi
         mc89OAqHWU7NC0svShnSyxPJDSEcfttk0yWrQVXIwyNo8UqrAoddUFt/GNKabKztq4pY
         7mAQdziXutoFUOB5x9EPCLaHwGIDCTovTxGZ+la0rERe/WNDXJoqkvkLGh7uHSE/bD0e
         ZZJw==
X-Forwarded-Encrypted: i=1; AJvYcCUQZmeNzPvWXbZXYuTb/fD/mdopT+QPoHFwcYchBPyoHT3R4IRFyl1WP4Dt5ih5iA+krpFN8TvexaKs@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi52Vohf393J8REx1sFpf3ZM8OgQTV6aGUKevvrgsDVFID9cuZ
	u7NLgvUpDRNPBrz2M/KLKhbHWRv+lv6O3RbCRnYemy8JzqdPsrRZmZueU/5CFjTXiwiqT7JEdtQ
	sqA0m6+0ieQ/xaU6LXQxsaaDb8QHldp7LsM9qU7FGv6350cqgNnWln+HtR5XD7+hz
X-Gm-Gg: AeBDievRiLIdaEriMMia755yyttTkRBxhu6yF5BuATXxmjjyGkMEDI0n2/zL/+1csrJ
	CAcY6csqBuwCR2LRIH7FdhvHu39SsFC3T9yRU9ONssWsL09T2r4yeuSkTTqQdt8YkBW+YRB+Zum
	rMZT1Daq8CHtvBdiPrCBbk8kXoA7qf0CVKtTGJlBwsswMYi0d1/xut3cA+WlMd8P6LJxBmXu+/F
	MQmG6WQFzBQyRN4idi0CDvQRKMpAxSrYvT/mCsjWPCMscoiR3OY87Umq8I7Pl/LLxqnpcqfMdZh
	clXkm69epCL+nErsca3h8geaT1qhbHAMTfHeDa2XNCiH739Bprj2arnHhji22grJHQ3B5e3sNvb
	sVgyqU7dgh6npP1ot2J1BhMSSSy82n0L2ttJy4XPx74l2iQFTVL+Gp4oZTik45SB1SUvRV49Xk+
	l2
X-Received: by 2002:a05:7300:7c09:b0:2d4:532e:7e37 with SMTP id 5a478bee46e88-2d589a9850fmr495629eec.29.1775768500660;
        Thu, 09 Apr 2026 14:01:40 -0700 (PDT)
X-Received: by 2002:a05:7300:7c09:b0:2d4:532e:7e37 with SMTP id 5a478bee46e88-2d589a9850fmr495596eec.29.1775768500035;
        Thu, 09 Apr 2026 14:01:40 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d562db6ac8sm1292549eec.26.2026.04.09.14.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 14:01:39 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 14:01:37 -0700
Subject: [PATCH v3 1/2] dt-bindings: interconnect: qcom: document the RPMh
 NoC for Hawi SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-icc-hawi-v3-1-851cac12a81d@oss.qualcomm.com>
References: <20260409-icc-hawi-v3-0-851cac12a81d@oss.qualcomm.com>
In-Reply-To: <20260409-icc-hawi-v3-0-851cac12a81d@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775768498; l=9167;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=Ob6W0oiZLfqCBw6yYs9XOIpnmLmpUMr1BTuvqxLZ7UU=;
 b=5Q+l9vBKEcWCtKqmP9HXufO8CAsDvtHzukpqU6beQLJdN4L0DDb6wXF3Y/HuB3w9IV4G7szXi
 Zt65E76x/xIBbfGIFicbhYkKzvXnC0qQUPYiMG+SD111knvH8PjNLKH
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Authority-Analysis: v=2.4 cv=RfCgzVtv c=1 sm=1 tr=0 ts=69d813b5 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=vAiBlhgdqqMfQzBjTAkA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: EnA3Wy-aaMdzn9oT87HGtCxo0ABK2eFI
X-Proofpoint-ORIG-GUID: EnA3Wy-aaMdzn9oT87HGtCxo0ABK2eFI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE5NCBTYWx0ZWRfX96210RTBdJPd
 eOuXbWGJxwuxlllPKMKrrMiRw7HFdyPWJXOyNX2KAsGnidFak86oT4n6iFZi8mWBWm5Lak8OXMi
 E2XF/2MPwAZa3RhqvwWr/4J7LOe/9ez6vaqD6DqEWGqvDcvae7FxdNHMy48iiUBOeV22XFv/DNK
 5Edj/HFxnldlG9VlPzhbGC41sDyYf/O2RBLRjRd5KamQ16bPwnqTp7pSVsnthcoMVQz67Wxkh4v
 k60qWrTlwwt4Afh9JOB2nq/TQz2kgcs9TWb3wo2xpo/l5/0hxpmp20W98ImhYftzzgPlqrThqL3
 lj4awhRPUUhEQEUjwFMucaMqyczWw3KK/5WPJ4ey3D9CyDwqQKuuCiLBbC5m9Xnjvy5ok+WSzDz
 fFvzPqWvZEWUZDJXMvpYLmBdva005ZH277ZFBhwrV111EmX+dmvuZlEP8CY3zE4U3/llYkZG02G
 R/oVBiuQdye5HjZa7Ug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090194

Document the RPMh Network-On-Chip interconnect for the Qualcomm Hawi SoC.

Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 .../bindings/interconnect/qcom,hawi-rpmh.yaml      | 131 ++++++++++++++++
 include/dt-bindings/interconnect/qcom,hawi-rpmh.h  | 164 +++++++++++++++++++++
 2 files changed, 295 insertions(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,hawi-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,hawi-rpmh.yaml
new file mode 100644
index 000000000000..49a2dca5db62
--- /dev/null
+++ b/Documentation/devicetree/bindings/interconnect/qcom,hawi-rpmh.yaml
@@ -0,0 +1,131 @@
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
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      clk_virt: interconnect-0 {
+        compatible = "qcom,hawi-clk-virt";
+        #interconnect-cells = <2>;
+        qcom,bcm-voters = <&apps_bcm_voter>;
+      };
+
+      aggre_noc: interconnect@f00000 {
+        compatible = "qcom,hawi-aggre1-noc";
+        reg = <0x0 0xf00000 0x0 0x54400>;
+        #interconnect-cells = <2>;
+        clocks = <&gcc_aggre_ufs_phy_axi_clk>,
+                 <&gcc_aggre_usb3_prim_axi_clk>,
+                 <&rpmhcc_ipa_clk>;
+        qcom,bcm-voters = <&apps_bcm_voter>;
+      };
+    };
diff --git a/include/dt-bindings/interconnect/qcom,hawi-rpmh.h b/include/dt-bindings/interconnect/qcom,hawi-rpmh.h
new file mode 100644
index 000000000000..a018248ac6b8
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
+#define MASTER_SOCCP_PROC			7
+#define MASTER_QDSS_ETR				8
+#define MASTER_QDSS_ETR_1			9
+#define MASTER_SDCC_2				10
+#define MASTER_SDCC_4				11
+#define MASTER_UFS_MEM				12
+#define MASTER_USB3				13
+#define SLAVE_A1NOC_SNOC			14
+
+#define MASTER_DDR_EFF_VETO			0
+#define MASTER_QUP_CORE_0			1
+#define MASTER_QUP_CORE_1			2
+#define MASTER_QUP_CORE_2			3
+#define MASTER_QUP_CORE_3			4
+#define MASTER_QUP_CORE_4			5
+#define SLAVE_DDR_EFF_VETO			6
+#define SLAVE_QUP_CORE_0			7
+#define SLAVE_QUP_CORE_1			8
+#define SLAVE_QUP_CORE_2			9
+#define SLAVE_QUP_CORE_3			10
+#define SLAVE_QUP_CORE_4			11
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
+#define MASTER_CFG_MM				2
+#define MASTER_CFG_NORTH			3
+#define MASTER_CFG_SOUTH			4
+#define MASTER_CFG_SOUTHWEST			5
+#define SLAVE_AHB2PHY_SOUTH			6
+#define SLAVE_BOOT_ROM				7
+#define SLAVE_CAMERA_CFG			8
+#define SLAVE_CLK_CTL				9
+#define SLAVE_CRYPTO_CFG			10
+#define SLAVE_DISPLAY_CFG			11
+#define SLAVE_EVA_CFG				12
+#define SLAVE_GFX3D_CFG				13
+#define SLAVE_I2C				14
+#define SLAVE_IMEM_CFG				15
+#define SLAVE_IPC_ROUTER_CFG			16
+#define SLAVE_IRIS_CFG				17
+#define SLAVE_CNOC_MSS				18
+#define SLAVE_PCIE_0_CFG			19
+#define SLAVE_PCIE_1_CFG			20
+#define SLAVE_PRNG				21
+#define SLAVE_QSPI_0				22
+#define SLAVE_QUP_1				23
+#define SLAVE_QUP_2				24
+#define SLAVE_QUP_3				25
+#define SLAVE_QUP_4				26
+#define SLAVE_SDCC_2				27
+#define SLAVE_SDCC_4				28
+#define SLAVE_TLMM				29
+#define SLAVE_UFS_MEM_CFG			30
+#define SLAVE_USB3				31
+#define SLAVE_VSENSE_CTRL_CFG			32
+#define SLAVE_PCIE_ANOC_CFG			33
+#define SLAVE_QDSS_CFG				34
+#define SLAVE_QDSS_STM				35
+#define SLAVE_TCSR				36
+#define SLAVE_TCU				37
+
+#define MASTER_CNOC_STARDUST			0
+#define SLAVE_STARDUST_CENTER_CFG		1
+#define SLAVE_STARDUST_EAST_CFG			2
+#define SLAVE_STARDUST_MM_CFG			3
+#define SLAVE_STARDUST_NORTH_CFG		4
+#define SLAVE_STARDUST_SOUTH_CFG		5
+#define SLAVE_STARDUST_SOUTHWEST_CFG		6
+
+#define MASTER_A1NOC_SNOC			0
+#define MASTER_APSS_NOC				1
+#define MASTER_CNOC_SNOC			2
+#define SLAVE_SNOC_GEM_NOC_SF			3
+
+#endif

-- 
2.34.1

