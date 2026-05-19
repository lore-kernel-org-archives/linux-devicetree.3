Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7F33B27F8
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 19:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779218792; cv=none; b=GwBkjPrhdHp8LRzJluCxLM9fDOF46ADoEkq9bRHI7a9v9lqdPjFtXw1RnjzjxBatAUvN+PJzxlBvxA2j/X4Qx3oIKSbu1yIp3a6Jn/kVsAdTe7z/Ge50wrtDkXizr1phmsS8Y72V3IVcRrmEQAKnGjq33RCwb1K5aKAs35L2OFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779218792; c=relaxed/simple;
	bh=1lFy1/KVGt8kir2N7X7UW0rU/0gxbDM1TUcSnq2hdEA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U7KorTNhmHX07EE+I5gA1Km18pSgXOJfSunk9uAwvOIFoqZrIO+W+pqw5aJ37HSw4m22toDJyjOqbg3qlIBu4acQMH525OxUtmZ6qwE1Fl+L0ZMNnMDryWY3D8EDYmELtswO+3YL/NAqBGbCTtB8HeTfKYc5++/PGshvaLYdrfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=li355mOv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fCo4k0Iq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="li355mOv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fCo4k0Iq"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JExJOD2983959
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 19:26:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CjJLrz362PhuykAP63jpFZNV+oJmp2KS4Wzse9a7adg=; b=li355mOvR2mIGzPy
	qykL5rmu/eWQGbWp20nE9Ht0fK2BE9Akn6P3PTnPX/wYHhLkSnngrzbfHS8HOqXf
	sa8CiRJIBY7BXV/RXf1YsxpCeMQEgbc791FQLBTTgyHQihgJym/PXad6KTmym2mS
	LrsnTMryPm6WD0y1aSmOuE8I2otLvObtCSrs4yemX4xJaNdTg3DOzHAr1horwo2u
	GOghyU/beBVedpjf/fmneDyK38wcfMtORpta58oeTheoRs0Q/76dfQ+9NLUD/62E
	s5GbMF35tIunIED/O0Lj09fPsOWBWvAnvBGYAx0WmrgfAlT0V92di16Kba8+Sr8a
	7wM+fg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3t1631-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 19:26:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bc763c7256so93469605ad.3
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 12:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779218789; x=1779823589; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CjJLrz362PhuykAP63jpFZNV+oJmp2KS4Wzse9a7adg=;
        b=fCo4k0Iq3TVStNZdfUkITOntmeBKP/5iJZHyl+XDE/ZLNRZu5VJl40jiMkNifb4KXf
         BrUW5QKOXmzc6A/87AEbcM8XHmuqxvjgS+hikkupaUT4NxLPiej3L74DRDN2P40eB6YM
         ydazvfyILC2UeoaOWeV8LcOce6sKy4ddCAEUxyL6HYu1wESCimDeShbE1Em3pEmAF4sG
         9ZSue6/160yWnAG++0bPnRM1eykJ4cx0NzvaXnjdaBqMLiGEKtOWB36fHBJbFU2s1AMj
         afBFxuOmFhRIMVSXI2peteai2YppUstY7GKVqP75/OgMPaUyLgYEzGgUf005aK3ob5Kf
         5CEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779218789; x=1779823589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CjJLrz362PhuykAP63jpFZNV+oJmp2KS4Wzse9a7adg=;
        b=hxWVo0Q2BQPUDQ/0fYNeOL8GXujeA3w48s1xphn6DRMfRL6nq9zze7zjql4vGKgnky
         rbhF+Jpf25r/fqBNQtUB7xWRGJUneRUg4NpyUHuXpM4bPtB3B//ss/AUal+xzBKLYAdT
         G+hrnKDa8T0BZASzKBEoNvsg1vHyaaiG+ijmLnNmP6mdaPbKhgBwlSbRn+CL5HihTOdw
         t8kcxNyrWRTN+qybAsiWTZpOnpuuE+7cS5cZUv9wqiiQP0A5X/jKTh+zirNwJ+9B4H+g
         J6Vfujbecx7yTCD0Zzbw16gqJl6Mvor2wRXH7uNHLiu+9zSkjAyPFgYpQt/sF2aqjegx
         CHrA==
X-Forwarded-Encrypted: i=1; AFNElJ9wyOssZsKX9mwIqxfvU5e7/ZwadE1kZzbGGCAHyqM4NjMC/AqAjoc4fArTifF3TFpXY8uT3WYuDsoc@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk89obVhyNnVgBNn3dDVe9WCoiaG9qvSiK8u/tfDZ1zOVaeR33
	N/JHlG6hUr3YH6lsCjg8uY6gTj+23mTaW6hZPq4f0Mmm+EEa/YiWLZW+uFFDis8DaDrfaTkeGh+
	fzv+E7FKKUwHufMHwzH+eZg2hW1fDDhyp/8ZLtfQFRy8ivTeoNki9F3y+9HjVpTLn
X-Gm-Gg: Acq92OGyu2EP/CipzzgmT+4DjA3iI6+q6t3m/HJ+leckgNdTxzlmStARsuaT8DwiSg8
	I91cKPEvrMOFZAWRQToatO4+3I+KRMKTp/KR61wLO29NCNdvDhOhFsQUDfhk+/n8fB/69bRDyPw
	LIAZA14v1Pj0Pr2SRnHCdsaDLeLYYm+PaVS5S0KhbtI4Iz1aRdfcYPWpa05hwhtDQI46ZIFfdAb
	WT8kPOURkxat0u9VatVWfUrHQOIZXYGjd0GBDOvFM5ISeJ5jOqsPRmaxFSfIGRzt5xhW9dE3RES
	JE8sGGCuj25NLZj08PatF7r82UJhPXAV05rHtCpGv8gGWnsKCaTfaraouMbNcjAPicLnwRYk9TB
	dGMer8TkHRvESfGPZlYW3KyuZ/P7TAjCyrdgyd6BlJ/ZVxj0kOVbXSs93fMn8o7Ffpyb1b350wW
	Y2d563fQntFp4AgnfPQWn1xUW3DvdLgT/oAvEq4KLmKkvZ03nYcNk=
X-Received: by 2002:a17:903:f8c:b0:2b9:ff02:a14d with SMTP id d9443c01a7336-2bd7e8057ccmr228258365ad.18.1779218788530;
        Tue, 19 May 2026 12:26:28 -0700 (PDT)
X-Received: by 2002:a17:903:f8c:b0:2b9:ff02:a14d with SMTP id d9443c01a7336-2bd7e8057ccmr228258015ad.18.1779218788058;
        Tue, 19 May 2026 12:26:28 -0700 (PDT)
Received: from hu-viswanat-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd791e0b06sm173927925ad.22.2026.05.19.12.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 12:26:26 -0700 (PDT)
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Date: Wed, 20 May 2026 00:56:17 +0530
Subject: [PATCH 1/2] dt-bindings: remoteproc: Document IPQ9650 Compute DSP
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-ipq9650-remoteproc-v1-1-542feb6efb2a@oss.qualcomm.com>
References: <20260520-ipq9650-remoteproc-v1-0-542feb6efb2a@oss.qualcomm.com>
In-Reply-To: <20260520-ipq9650-remoteproc-v1-0-542feb6efb2a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        sumit.garg@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779218778; l=4891;
 i=vignesh.viswanathan@oss.qualcomm.com; s=20260518;
 h=from:subject:message-id; bh=1lFy1/KVGt8kir2N7X7UW0rU/0gxbDM1TUcSnq2hdEA=;
 b=w+VpxpjrmFEtMUzKVwgnCr6WCbwP02k5ANDXHEzTy6GQ8VlF0THP+VkKWkBoc9Z3Wrfu4jx42
 V56sD3ISOOeBXbJhrkYGRjS7BiMmYrxstO+B2/5mEe1cZslKYsjmUl7
X-Developer-Key: i=vignesh.viswanathan@oss.qualcomm.com; a=ed25519;
 pk=/lHspsTTqZQg546ZudgrbywCsk3Whx/C0XNVUevaKNk=
X-Authority-Analysis: v=2.4 cv=BOCDalQG c=1 sm=1 tr=0 ts=6a0cb965 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=6YxgiQdSAjwN7wmE9mIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: FW8Pi8-F1mPC5gXZ9JV0ajGFWBclAX0I
X-Proofpoint-GUID: FW8Pi8-F1mPC5gXZ9JV0ajGFWBclAX0I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE5MiBTYWx0ZWRfX9fd+Y+6bHC0B
 OzMkn/+++dPo+YBRUbvLus2M41/8FucGoZ0kmhg07T58ne8C6q3yOvxPsJS5tJ3TrAACSsTnuPn
 xRcA9Nyfm3NT0WA6sfIVnle2cSnfOfPrjyubTzmj53N6GClKGaIZIZWC0ap6iqc83GIpCsa7Hdv
 WzZOZEKXYQheb8wOKAtCVHSE35fnqpaHTyBQHB54dYVz1whhJROqencgV6DGN9J9V6F3PQppkWG
 Br1Q6AFhnrE1kAKNLzzI7FF9qAGoDjXgy8GHLuLpYZdCbyucSBI/GcANkoSXm2qV2UyBPgdtPSm
 1iWtVu9Wy9a1rnREYlafdgLLkLqylSLRS2kZWDg7LpTX733q1Wgh1KyZcQ2i5gZKK3ADp09BNud
 nW9ClpRmFpZR9zXlOT/0RW+0TUw6k6PcoW2rSjZJkk+3IYiQJjNoKUBNQiJpvECtWqA2Uuu43li
 NzwQ6y5wxL4JqKAKI6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190192

Add device tree binding documentation for the Qualcomm IPQ9650 CDSP
Peripheral Authentication Service (PAS). Unlike existing PAS
implementations, the IPQ9650 CDSP does not require power domains or an XO
clock, requiring a separate binding.

Signed-off-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,ipq9650-pas.yaml      | 136 +++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,ipq9650-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,ipq9650-pas.yaml
new file mode 100644
index 000000000000..58b3a9352d87
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,ipq9650-pas.yaml
@@ -0,0 +1,136 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,ipq9650-pas.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm IPQ9650 Peripheral Authentication Service
+
+maintainers:
+  - Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
+
+description:
+  Qualcomm IPQ9650 SoC Peripheral Authentication Service loads and boots
+  firmware on the Qualcomm CDSP Hexagon core.
+
+properties:
+  compatible:
+    enum:
+      - qcom,ipq9650-cdsp-pas
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 6
+
+  interrupt-names:
+    maxItems: 6
+
+  memory-region:
+    items:
+      - description: Memory region for main Firmware authentication
+      - description: Memory region for Devicetree Firmware authentication
+
+  firmware-name:
+    items:
+      - description: Firmware name of the Hexagon core
+      - description: Firmware name of the Hexagon Devicetree
+
+  qcom,smem-states:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: States used by the AP to signal the Hexagon core
+    items:
+      - description: Stop the modem
+
+  qcom,smem-state-names:
+    description: The names of the state bits used for SMP2P output
+    items:
+      - const: stop
+
+  glink-edge:
+    $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
+    description:
+      Qualcomm G-Link subnode which represents communication edge, channels
+      and devices related to the CDSP.
+    unevaluatedProperties: false
+
+  smd-edge: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - memory-region
+  - qcom,smem-states
+  - qcom,smem-state-names
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,ipq9650-cdsp-pas
+    then:
+      properties:
+        interrupts:
+          items:
+            - description: Watchdog interrupt
+            - description: Fatal interrupt
+            - description: Ready interrupt
+            - description: Handover interrupt
+            - description: Stop acknowledge interrupt
+            - description: Shutdown acknowledge interrupt
+        interrupt-names:
+          items:
+            - const: wdog
+            - const: fatal
+            - const: ready
+            - const: handover
+            - const: stop-ack
+            - const: shutdown-ack
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/mailbox/qcom-ipcc.h>
+
+    remoteproc@24000000 {
+        compatible = "qcom,ipq9650-cdsp-pas";
+        reg = <0x24000000 0x10000>;
+
+        interrupts-extended = <&intc GIC_SPI 447 IRQ_TYPE_EDGE_RISING 0>,
+                              <&smp2p_cdsp_in 0 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_cdsp_in 1 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_cdsp_in 2 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_cdsp_in 3 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_cdsp_in 7 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "wdog",
+                          "fatal",
+                          "ready",
+                          "handover",
+                          "stop-ack",
+                          "shutdown-ack";
+
+        memory-region = <&cdsp_mem>, <&cdsp_dtb_mem>;
+
+        qcom,smem-states = <&smp2p_cdsp_out 0>;
+        qcom,smem-state-names = "stop";
+
+        glink-edge {
+            interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
+                                         IPCC_MPROC_SIGNAL_GLINK_QMP
+                                         IRQ_TYPE_EDGE_RISING>;
+            mboxes = <&ipcc IPCC_CLIENT_CDSP
+                            IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+            label = "cdsp";
+            qcom,remote-pid = <5>;
+
+            /* ... */
+        };
+    };

-- 
2.43.0

