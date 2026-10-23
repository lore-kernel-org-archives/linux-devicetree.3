Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738881;
	b=wtvlW4zcHtd9IwsnNs3eXjNXpkk1OvKOLrN82soOc0xPurQqVqimLW8UgPeOQs5ItEvZ
	 FOTkWNqnQnV8ucDcszbwrXVrkGy/0QEWGJDfDW0hbz8Pv30+VMsSa7pLKCypKNB/iwXA9
	 0AYKX3PqWJlEGRfnBMhaaLSl8xiSOkoEyvHIDNZ4LPLprzW0Qozllgz5G6s8xQfZD1Y/Y
	 CxNWt4nMRjWdQYu8QRIknqNnVC/MrRs9Jtm30/6AYHOWAARUluvIWmGs48SKbua35l1ch
	 vE+L5osXI07dXrAQVIeNjrUPx0HuViCcC9fYzxXmsMG1I6DECnOjoiKjqwpx4QBfsDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738881;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AACcgwhYkC3KUc2WR3EDrO9YGPVQuZ9/nNSNkiIADP0=;
	b=hDqGdcPKE63CISz4AlEHJAzQvqfqo5nIP1xCo6QcKjNTDbSx+TuiCWazrESgwCi+76HS
	 5hW6X3lCK/MouOkYYZby3G5hW1zV8hrLOykFleY1UCkRDI+i6SKrpcrP/RWwAZZyL9oWT
	 W9f8sY3uIeKHCogBWPGuDLE+OrBVz4mCklmUL6MhoQIJ8G/EqNHyGa9gGizBMttl0d7MJ
	 ujT/eI4SnUo8lntEQ8VBXyCGqL9MSD7MdynFCuTmDkgXNlW+zel3uLJaz8n5OphGcr3wo
	 CDEJeshoNHZuTeYLCxoFOYgRCtwZiJ4SbwD8wPbaZCAGevJGtPDcHmTYzAgHnVFTM3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C6Pg3Mau;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bLuSimw4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9457A606A327
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:01:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9457A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C6Pg3Mau;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bLuSimw4
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1FZE9775990
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:01:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AACcgwhYkC3KUc2WR3EDrO9YGPVQuZ9/nNSNkiIADP0=; b=C6Pg3MauuJR9m3Rg
	nM7VfMaqEJnktOK9ECURmTXmZwy1qnTPK/9EPKAV1PD13LVVc/Phq8BW8a6P1z79
	1uqInJF79LacbA+H0OqSa1r2RlRE34e0ZYyUPNcvnE4cIBo/Rpmu4urJhiu+eHBV
	Uw2GQvx5DdasfZmtwgDWEOI53T1yOO5b/nE656qItGg45sfQsCu+JDIsRg8h0pnP
	qe00nF7XqO9EM1Q7LmpO2QAYnpoaJRYIKuFbb+rpD4Xf+iBLEvi+TbNXobD2hv5K
	74Bh78hlIxnofyin7/AUFPbRX1GzPBTGTR/PCrM/81eIFsRV18TSbC7rpVRasjHc
	j9bxpg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmttbka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:01:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3aaf955db5fso981739a91.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 00:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738879; x=1793343679; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AACcgwhYkC3KUc2WR3EDrO9YGPVQuZ9/nNSNkiIADP0=;
        b=bLuSimw4nC+VEE7IPyYlu9ZY9BMQuI3/knPhUU3kHqhivZCHfCkXfD73Z+LE6a836t
         y/PKsVy4JI1xc3q10O5bAFxvoAx0AkibCsMKyypSvU1ei41iaMhK68p7HAUA+43FuJVS
         s8uv3oA4e/FUYH6tQphWrWkzWl6Bf5zoIcBYWhT1XQssTb1eCuUBe0GREYu6gzQYZwFx
         p/+pQAU2W9x9SanqlKPfRDa79NLxXwhkqxBKLYuCu4gnwRsoQbW2TmNmFxWMe52ccXB5
         CifOXe0L++JyP77uvRWgeDBFdSghh9VulNr8p49TGlk4PhWKZXNYFjVQC3qHN9xjLECp
         uxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738879; x=1793343679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AACcgwhYkC3KUc2WR3EDrO9YGPVQuZ9/nNSNkiIADP0=;
        b=wZ+b9pv/J5QaKX/eyhTflnB0D3Kj6yRq3O2x49vyMr9kDvVCYDtuXzHityJKTcxfK2
         vGpl4XujVIatJ4ztuuKjIUlzSrChJ4s9qsIQDwaHb0ehWxaSzHAHxDGtuQMUYRzMOWTr
         A2I9A9gc3LmETUDAlTUMVusPFyQsuwy6/0Cy4Boy+GjMnrqr2IenDsxEF9j9/wntO+w8
         vXuEe4CLVA78H9dmxwX4nWxvDR8Iy2GorzlWSv0nLWJg0waAurMTTghffPPALvuN0oAU
         Jd69vl3LUS5ILlrVOocnxVr8BgwGfPRNqPKJ0guaTAb4FoLxEJ8YPiRIEV7fmftGnymg
         4wgA==
X-Forwarded-Encrypted: i=1; AKwUvBy09C3g+Hrp9+IyX8HnKACslM/RPxN1GiG5dXH7OOBjWd4S6XQqHHMrYENwT2qFPuwlYEKxjJcg0HnT@vger.kernel.org
X-Gm-Message-State: AFq9FYKf0aI1zkLZtxw0/9nltZA5BDCRg+hZSN28uj7dPBQGIMccIZpc
	Ad1VckyQtLSgxIP1FHlxB8DnooLBG7nuf+YwfB+xFfegbaGZ9DFjKbCZVHzGSlC7crOjaFCoQW7
	Pp/Q44GyvsugxXEAuGkQWOqr7MtkPSJHAHtQCKMBOZNODXpG2DGU0qsCa8BWKWix7XPofU5xX
X-Gm-Gg: AYBFou11AbN+etHwUtzGq8Aj5cMGMRrFEsRKyWMWX3Z5UD8fTAASHzgIfarpXjOV4mA
	FsNuoGUj3cTF9kXe0nyJwNbSdp4aqbXAGfpJqJMxbyMmWximL+B1oPkc6DCzYpcLP+2m1socF66
	FmgMJj9J4Akx8ra9B7cocMl/BGyhYwfaYopCY6DwzVefBif3SgcPCguBg9jHcREKTw0/I8QrjL0
	+38GVqjYcEwCPtrZnBdCWO+IGhugk7l5rezN3jKsE02OYxm0Hib20a0rcSVaNkWMBTEkar40JQL
	gGZaq1I+q4aQNJb7MptLIlKhrZLYErdceJM1ReUcuq8OjNzcA4qj/04fzvM5OWyKRAN8zrhADyK
	dbQIvEqq41WiB6UvJ/d1yqHo+rULBySnc64UY2/xvWujv0BUSOd701FA4zJcJ9KwYwzdR117i0q
	cQHdSJs+8kF10ri0zSVQrXrw==
X-Received: by 2002:a17:90b:17c5:b0:3ac:86a0:5766 with SMTP id 98e67ed59e1d1-3adce0cfd32mr1195280a91.63.1792738879074;
        Fri, 23 Oct 2026 00:01:19 -0700 (PDT)
X-Received: by 2002:a17:90b:17c5:b0:3ac:86a0:5766 with SMTP id 98e67ed59e1d1-3adce0cfd32mr1195233a91.63.1792738878394;
        Fri, 23 Oct 2026 00:01:18 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8a6dcdsm399751a12.18.2026.10.23.00.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:01:17 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:31:04 +0530
Subject: [PATCH ath-next v3 01/17] dt-bindings: net: wireless: Add QCN6432
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
Message-Id: <20261023-mpp-bringup-v3-1-19f3fcbf7b5f@oss.qualcomm.com>
References: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
In-Reply-To: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb063f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Zbx1xPUqErz4vskW_SEA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: LqkTE-UjckHXOcvLr2s-Vw06g1C4lPHI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX30s+zQ/Yqn0d
 ZoN880ZjP7K1V4qN04/MfVsYiPMP8UkvyppoKO+J7M+rM/w4cjg4iztkb4kiVpl1MKQ8KlrR8Ng
 OebCKWT8xnX9abgIe550zOUcr/IsN/V3KT1uBneS7U3QGL48S0Nk0+0oRgVK0914OwxsJw5lMPw
 aXJ0FvHVr1gC3ytk9X/dMMSKb8n+ns7sdfEjm4Itzmz77L/uONldec7D3eQl0mdx1Ki3ey0zhRx
 Wp8NIhqBLIkQxwelFnnsTrhEveg8j9Kfvh0rVozll8O15/aW7anKktqLewqQypUq3b3YtS35CMO
 vsMP0DPdgPECQ/LxTeh3YlPA/hra9uhPnMTywoDh8xZ7Q6zl8VN7rPESFQDJNtzIbRHiSmS9SgY
 /5VcUMEXWZjZvoPHQ2+9daIN9k8u6SpoEYgAWnmY2367FeKxD2zOIgUkohYgFao9iQpFE82IiK0
 1VN7Kqw8FppHwMVyF5w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX0a9verzckPnD
 RA13twZIxV5M/TGkMsr4e4jzKzF51vxIaaKs1zM63GElnyXe3SNw8h5928Hg4M9KrmKyDi7Xt4D
 v3ETqhrlZpcuXVoRpr9feR1WuekcHxE=
X-Proofpoint-ORIG-GUID: LqkTE-UjckHXOcvLr2s-Vw06g1C4lPHI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230027

Add Devicetree binding documentation for the Qualcomm QCN6432 IEEE 802.11be
wireless device.

QCN6432 is attached to the WCSS Q6 subsystem and is represented as an AHB
platform device, even though the Wi-Fi hardware interfaces over PCIe.
Document the compatible string and the resources, including the Q6 remote
processor phandle, MSI interrupts, SMEM states and memory regions.

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 .../bindings/net/wireless/qcom,qcn6432.yaml        | 149 +++++++++++++++++++++
 1 file changed, 149 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,qcn6432.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,qcn6432.yaml
new file mode 100644
index 000000000000..96e164620574
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,qcn6432.yaml
@@ -0,0 +1,149 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/wireless/qcom,qcn6432.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies QCN6432 wireless device
+
+maintainers:
+  - Jeff Johnson <jjohnson@kernel.org>
+
+description:
+  Qualcomm Technologies QCN6432 is an IEEE 802.11be Wi-Fi device
+  associated with the WCSS Q6 subsystem. The device is represented
+  as a platform device and uses MSI interrupts for its Copy Engine
+  (CE) and Data Path (DP) rings.
+
+properties:
+  compatible:
+    enum:
+      - qcom,qcn6432
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Spawn acknowledge interrupt
+      - description: Stop acknowledge interrupt
+      - description: UMAC reset interrupt
+
+  interrupt-names:
+    items:
+      - const: fatal
+      - const: ready
+      - const: spawn
+      - const: stop-ack
+      - const: umac-reset
+
+  memory-region:
+    items:
+      - description: Q6 memory region
+      - description: Combined firmware data memory region
+      - description: Multi Link Operation (MLO) Global memory region
+
+  memory-region-names:
+    items:
+      - const: q6-region
+      - const: data-region
+      - const: mlo-global-mem
+
+  msi-parent:
+    description: Phandle to the MSI controller.
+    maxItems: 1
+
+  qcom,calibration-variant:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      String to uniquely identify variant of the calibration data for designs
+      with colliding bus and device ids
+
+  qcom,rproc:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the Qualcomm Hexagon DSP (Q6 remote processor), which is
+      utilized for offloading Wi-Fi processing tasks. This Q6 remote processor
+      operates in conjunction with Wi-Fi.
+
+  qcom,smem-states:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: States used by the AP to signal the remote processor
+    items:
+      - description: Shutdown WCSS PD
+        items:
+          - description: Phandle to the Shared Memory Point 2 Point device
+              handling the communication with a remote processor
+          - description: Single bit index to toggle in the value sent to
+              the remote processor
+            maximum: 31
+      - description: Stop WCSS PD
+        items:
+          - description: Phandle to the Shared Memory Point 2 Point device
+              handling the communication with a remote processor
+          - description: Single bit index to toggle in the value sent to
+              the remote processor
+            maximum: 31
+      - description: Spawn WCSS PD
+        items:
+          - description: Phandle to the Shared Memory Point 2 Point device
+              handling the communication with a remote processor
+          - description: Single bit index to toggle in the value sent to
+              the remote processor
+            maximum: 31
+
+  qcom,smem-state-names:
+    description:
+      Names of the states used by the AP to signal the remote processor
+    items:
+      - const: shutdown
+      - const: stop
+      - const: spawn
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - memory-region
+  - memory-region-names
+  - msi-parent
+  - qcom,rproc
+  - qcom,smem-states
+  - qcom,smem-state-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    wifi@21e00000 {
+        compatible = "qcom,qcn6432";
+        reg = <0x21e00000 0x200000>;
+        interrupts-extended = <&smp2p_wcss_in 16 IRQ_TYPE_NONE>,
+                              <&smp2p_wcss_in 17 IRQ_TYPE_NONE>,
+                              <&smp2p_wcss_in 20 IRQ_TYPE_NONE>,
+                              <&smp2p_wcss_in 19 IRQ_TYPE_NONE>,
+                              <&intc GIC_SPI 33 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "fatal",
+                          "ready",
+                          "spawn",
+                          "stop-ack",
+                          "umac-reset";
+        memory-region = <&q6_region>, <&data_region>, <&mlo_mem>;
+        memory-region-names = "q6-region", "data-region", "mlo-global-mem";
+        msi-parent = <&v2m0>;
+        qcom,calibration-variant = "RDP442_1";
+        qcom,rproc = <&q6v5_wcss>;
+        qcom,smem-states = <&smp2p_wcss_out 16>,
+                           <&smp2p_wcss_out 17>,
+                           <&smp2p_wcss_out 18>;
+        qcom,smem-state-names = "shutdown",
+                                "stop",
+                                "spawn";
+    };

-- 
2.34.1

