Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65234332635
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 13:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782394740; cv=none; b=UVJZgYc+QBx6r9HAfuS3O1UAtNWgl/FuesGMTZUE+krh5FFlT0v9fu1LwWUxwOFbhTvNlBfyRM9lZWuOufsLPU6vWWo2rHibKr9JDNIOQzsiHq0TQ57osIsLP8LS2g6Vwm85Z3LnvNt20NgO4ZhzTVLxCzfRwoDeG5IX5MrEeLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782394740; c=relaxed/simple;
	bh=BeeUpBP+MqcSp9z+rfQuEFHTfniuNHSPXQVaYkS/Ams=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JZmoo+D1yyL/aHpE7l1BBGer0Hth+Om4KfnGocsWUVF3zJKO77hBZS0Ej7soI0Go/IFNW3/QphkCegbzEZ6k4kkki60sTktrzLBh1kjB7zvlRn4YaLP8q1y4MLXH2TQB2+iEU5g1PggCoZpd7F1mgub8zsu2OnqALstRXUSQZGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=opcPxYQV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A5B0Zg30; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="opcPxYQV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A5B0Zg30"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9jvRN2046539
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 13:38:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MmXxdsWF9PR
	x9r6aStfR3QBWOWUptVPg6sB1TDaNcaM=; b=opcPxYQVi+iBT5WWXmsCqCBiUS7
	dh1JmgaqWK4TP4YQZalSHGpU7Zmubx9XGAbgp90vCfOCpWxxHeg5udPZTe5cSOI6
	vcJxbjdsUGk+eWowEcl/yM5W8HnEGLFFFFV8K5SI4IswzDlWQRP/UEUo7Sm+K4Es
	EE38Y9a5qwh65nesv1hhDAXUrxcdYvYdum3jIfarz5LBQqsETRBI/Djp3nA/hMx1
	wFUSKkhv/Fvwko7/WOKgN3PTtdN5GjRc7ThUAe19+6eJpzlRNIPVfYhwestB7VoW
	XwCwhI8HwBi6uB3RFjJ4GUz62x6AWHbiinDKxVDRnrBgEouQiUOVBANCk8w==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0uyqj9sk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 13:38:58 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-966a61478ceso641458241.2
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 06:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782394738; x=1782999538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MmXxdsWF9PRx9r6aStfR3QBWOWUptVPg6sB1TDaNcaM=;
        b=A5B0Zg30cbA2qZfVjg2IZSjhX2vHkCz2OjYJKmW20ILcMUg6W64AnkcSSgSLriAOKG
         AEeTugPH53k+Do3ux64liX8PmWqTiipES9GWSq9MQO26A3gfR3o+TMxaMFXXpr9d5eSj
         XvYuYSLjL+rc2vQPegiBO5hvinNKLNC7oP+flKL5oOkU76Aj1zmPjyk2YkLsTYXe7jn1
         5p1dUSAjOh0gijQS5lWR1qgy+4NBf5GIpAvBu1a8wRmKDr7UCqRfJampBr9sUFAF0C8A
         E/sGNL96UtgqizoU6FI/frqEIiEtZB91DnVnUJQQMCXcJEbpT68d79YBKaUagM0nR2aK
         Y9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782394738; x=1782999538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MmXxdsWF9PRx9r6aStfR3QBWOWUptVPg6sB1TDaNcaM=;
        b=seIK06Rq5QSLApBCChmN1tcoG5wW+6poaJPM/iQjhPITqDbac0r5rED5ESl4ooojac
         /PwqP6Gv1/PaeQiUerM2hzJW8SWHX9tVBW2jZvDYLJYenO9B9MtD2tSUF5sAwqYS3v3u
         8tZ5Kv/r7J75ypOurtNRihiBuorNUngAVCgx8Gy6jCkpwbG+qZRj8E24kfkrFKXfJ8Pb
         BhevmcdPWpziVgHYvFfo2JHKDtSRZlytrMTcW3AejgOa/9q06jjI5k+4OkI1AtChYqeu
         BsmFXXubvG8vlyF9P+QUBLPA47hT4gxrWS4Ry8dF/XZdb1CfT7eDMpNZG62mvm+nhlUK
         TllQ==
X-Forwarded-Encrypted: i=1; AHgh+RrKmnF2AsG9wltMApEewsfbHSiJhhF09Ip/yIi9LPC+3DExpjS+9hXrTSakX4jmf3jieaTmZ3GGuLwQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9uxaqaX3sj3/1OoPk5hIrhswa/0U/7rDSeKHMMlVFUywChIIM
	az3TQY8t8sXrDtAC67ptOteLeUZY3XGxxt/AxmP8sUCrGjOn8mE8TXVP1GJYnHxynsUDYbxmtMp
	qIaAlybYRgQdquyiGQ0PQGvhlSk3v/7WkuHSM919ElrItzWu0qmZ9wWD/DrdSAHuRh9QbXiXes5
	M=
X-Gm-Gg: AfdE7ckWFfoD0IcfWlVShkZXOdYwa31ucNDQBM2/bxkykJh7EnOy2DZ5PHsGi46FTdm
	vm8Dz9uU6jWu/dFMFyNCT9CE/jit8DWytMu6KzNsOZOjq5I8O1QhOCurJ7pzEny6bqNscHSrp5P
	8JRTjnO8ozgG5sdlFI8+Wbe/OMVTWr5jMLjbwmaOWWV4umVZkMWAGx8Fy/Z2HDnT61csrCzHoq2
	Zif10cy4EB9/sLLc5eoQY7LUMe8wmGE6s0ofqB0itrvIpSzihzphRt/XsVrQoZpEynhLVrrNDw7
	42nfL95m6+Aa/tTVJkr//LMge+h7zzt2RpzsFiKUdXkoo2IE9NtkcK6kbhD9O0r3VcD+qeaAKX3
	5YjR7m/kjbNGgqqBpnmhta0KpGsUYqXJ/seA=
X-Received: by 2002:a05:6102:8014:b0:6d3:9409:d1bb with SMTP id ada2fe7eead31-734361a0fddmr771919137.19.1782394737643;
        Thu, 25 Jun 2026 06:38:57 -0700 (PDT)
X-Received: by 2002:a05:6102:8014:b0:6d3:9409:d1bb with SMTP id ada2fe7eead31-734361a0fddmr771904137.19.1782394737208;
        Thu, 25 Jun 2026 06:38:57 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbbaa238sm189172266b.8.2026.06.25.06.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 06:38:56 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Subject: [PATCH v2 1/3] dt-bindings: media: qcom: Add JPEG encoder binding
Date: Thu, 25 Jun 2026 16:38:26 +0300
Message-Id: <20260625133828.3221781-2-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260625133828.3221781-1-atanas.filipov@oss.qualcomm.com>
References: <20260625133828.3221781-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: tWrGLF06oacKUtCDGFwnOrQQ1GkCcYIu
X-Proofpoint-ORIG-GUID: tWrGLF06oacKUtCDGFwnOrQQ1GkCcYIu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDExNyBTYWx0ZWRfX2ARX58PMZgIV
 TBKjPv/SYFY9Dci93IIGtyQ1wYHXVggJBSBiAhll8T5j/0SDdqClEvZOCcrGf0RY3LCqFbsUNVn
 cQ5bFMqxohNKdrDbm4D1LmlMzFL3Eqk=
X-Authority-Analysis: v=2.4 cv=EsLiaycA c=1 sm=1 tr=0 ts=6a3d2f72 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VGq5m62kFjE_L6vmAZkA:9 a=o1xkdb1NAhiiM49bd1HK:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDExNyBTYWx0ZWRfX39RGphrTZJTg
 3P4EJDFv/z5vpzOj6nw2mYfGB/4NQzZaPX1wFYIdsAi8Ml//teFn3XzPuc/5YoS//pGJtvUQrnQ
 0CDceEG+NrhWSOHm9/T5zctTbvZxJMuAvo+BIx3flbszbL8gwNowNjbZXuJnl7iT3w4ac50w8w4
 iY78lyngL7+jvrRjrZP3kL92F57Ggbnmp6vwiMTICeLFZuWd99aWyRVvSlCw/5aPTAXriHMtiKC
 Ap1Pos5LqSMbOhuLwT4YdT8zrkN9aod0/ZdIy6kpd0vzECCR6hDey7mZdo3Ogw/utX0Nd2Picrd
 ahvPGlIpX2+avEHy7R6QXFJzHs4kDgolJOE3Xuz4ps3+vMVc344u+uRZBOYoVRYCglOmu6kBwjT
 v2KMSafVU0L8ZjT3KRDFVWdYSR6BTzJEknAIwpNjWjZxRDeqq7Rn3b/xFkHWdErgh4q8R1dVyYC
 ipvHNvbJWhE6t0AzhBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250117

Add device-tree binding for the Qualcomm JPEG encoder hardware block
present in SM8250 (Kona) SoCs.

The JPEG encoder is a standalone hardware IP within the camera subsystem
that performs JPEG compression in memory-to-memory fashion.  It is
separate from the CAMSS ISP pipeline and has its own register space,
interrupt, clocks, power domain, IOMMU streams, and interconnect paths.

Properties documented:
- compatible: qcom,sm8250-jenc
- reg / reg-names: single MMIO region named "jpeg"
- interrupts: single edge-triggered interrupt
- clocks / clock-names: Common clocks and JPEG core clock
- power-domains: TITAN_TOP_GDSC common domain
- iommus: two SMMU stream IDs for JPEG pixel and JPEG DMA processing
- interconnects / interconnect-names
- OPP table mapping performance levels to clock frequencies

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../bindings/media/qcom,jpeg-encoder.yaml     | 135 ++++++++++++++++++
 1 file changed, 135 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
new file mode 100644
index 000000000000..ab8d8951d21f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
@@ -0,0 +1,135 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,jpeg-encoder.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm JPEG Encoder
+
+maintainers:
+  - Atanas Filipov <atanas.filipov@oss.qualcomm.com>
+
+description:
+  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm SoCs.
+
+properties:
+  compatible:
+    enum:
+      - qcom,sm8250-jenc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 6
+    maxItems: 6
+
+  clock-names:
+    items:
+      - const: bus_hf
+      - const: bus_sf
+      - const: iface
+      - const: cpas
+      - const: axi
+      - const: core
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    description:
+      Two SMMU stream IDs for the JPEG hardware. The first entry is for
+      the JPEG core engine; the second is for the JPEG DMA/scale path.
+      The exact stream ID assignment is SoC-specific and not publicly
+      documented by Qualcomm.
+    minItems: 2
+    maxItems: 2
+
+  interconnects:
+    maxItems: 4
+
+  interconnect-names:
+    items:
+      - const: cam_ahb
+      - const: cam_hf_0_mnoc
+      - const: cam_sf_0_mnoc
+      - const: cam_sf_icp_mnoc
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - power-domains
+  - iommus
+  - interconnects
+  - interconnect-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,camcc-sm8250.h>
+    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
+    #include <dt-bindings/interconnect/qcom,sm8250.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    jpeg-encoder@ac53000 {
+        compatible = "qcom,sm8250-jenc";
+        reg = <0xac53000 0x1000>;
+
+        interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
+        power-domains = <&camcc TITAN_TOP_GDSC>;
+
+        clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+                 <&camcc CAM_CC_CORE_AHB_CLK>,
+                 <&camcc CAM_CC_CPAS_AHB_CLK>,
+                 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+                 <&camcc CAM_CC_JPEG_CLK>;
+        clock-names =
+            "bus_hf",
+            "bus_sf",
+            "iface",
+            "cpas",
+            "axi",
+            "core";
+
+        iommus = <&apps_smmu 0x2040 0x400>,
+                 <&apps_smmu 0x2440 0x400>;
+
+        interconnects =
+            <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_CAMERA_CFG 0>,
+            <&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI_CH0 0>,
+            <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>,
+            <&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt SLAVE_EBI_CH0 0>;
+        interconnect-names =
+            "cam_ahb",
+            "cam_hf_0_mnoc",
+            "cam_sf_0_mnoc",
+            "cam_sf_icp_mnoc";
+
+        operating-points-v2 = <&jpeg_opp_table>;
+
+        jpeg_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-300000000 {
+                opp-hz = /bits/ 64 <300000000>;
+                opp-level = <0>;
+            };
+
+            opp-600000000 {
+                opp-hz = /bits/ 64 <600000000>;
+                opp-level = <3>;
+            };
+        };
+    };
-- 
2.34.1

