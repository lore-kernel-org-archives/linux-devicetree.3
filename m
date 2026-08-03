Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9E9384CD3
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 10:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785753998; cv=none; b=jC99lZ9IDIqg8nC9lYYG9EN8lAq3XvPNN71wSlbKY3sp10JvuPQEp532LyMOs7InYLoM0JQgKIJVKHW7dKIJmDWc6OQuf0gbwr4zgGOtPJJoibgIcscCg6CKvspyaotLTcL7ZwgBcwl0ZZUI2GYA0hB5bzY2uW+15bo6lww+e/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785753998; c=relaxed/simple;
	bh=J5kLzpcGAggDIeQW+fQPYzewYd1o/kWfbMTjKjCVFA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K7RlwC6zCvOp40rZMOn7CC6u4K9mYsxvsatREDLFGd2gur1usNi1nkg3IFAAZteMM11++hmXyblBkYa5Cj3aFNwUEdevs6TGGanbY70TJBVXBWGcA2KsEO0X5hhb23luFMqQ5kkyRN6HmSQOH+ygew9Lpg5zDEoxSN5mRWBUvs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JQZGuJAM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JyvypykZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JQZGuJAM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JyvypykZ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736SCvY250196
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 10:46:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AKU/jH/o9BLwulyA0T+6aROAyUKGXiL1SkjBLw77A4w=; b=JQZGuJAMbe/K89YE
	KLeUfdRHfqKqY8FzkGhX+0Mc7UgpkRbdFUWPuKsGhLFa7A/wPj032Me+Ibh1pvID
	O/PY3pbyZD0FY21o+KhSzccz7wimxlDeON3PNo9jTm8hV1B1/OcEtCMGGsdRc3i/
	L4+s7oBdwfPHwB+4IwHk7ue8+LSfv2W6WsTtHpruSXIDxiCM81LkQwDb7MKvJMe1
	nCcIPCz/a2uKx9A2jq5D7xKLjjuB4CxNx9d18FGc2AAPxE0fbLgFlXWsp52ygGXg
	2uk4wkvuytHOGpkwsVmwF+5owAKHhynuv971EQiQOtfaPwAm4sogBrwhyLRlqPCM
	XMepWw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrd93ne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 10:46:36 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2caf4173b1cso68476045ad.3
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 03:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785753995; x=1786358795; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AKU/jH/o9BLwulyA0T+6aROAyUKGXiL1SkjBLw77A4w=;
        b=JyvypykZ80o5OftCJGRo7BRx8auDjslo06leLEE2MLc/c9bBRU3uDqxvu0juvkfaFl
         +IJwzmG+3hwkrI8rO+vbiMxvfas3+FDZhbYMzGaQHeXBRMR1YjMVoduH6l9OY9SxAEv8
         LACkBNBHld+aDL8F6OmpJebAo5MgILM24C/445DWIJktFsRkIsmLPAvMKNoTpwJbntU0
         j6dFutcXMRP+LmJcv005QlaamtdpVyMJPjXA3BhhHEQDQ0qIMuEnxAMGMBPk0MhmESrj
         tji4XIE8oa0r/F8tzMDHAy1lP9x8Fol1sHyifpHctSL8el8O1idXQrE8BNdBSWALCwFZ
         p9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785753995; x=1786358795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AKU/jH/o9BLwulyA0T+6aROAyUKGXiL1SkjBLw77A4w=;
        b=UDkzMHlBrmnBXjF/z/cd5GfEjCTjg2QseRSsF//2hJJbSDd6WBACtIlgzx3A/B7kQ5
         MtNW7n8yQYU/DD1s97qb9gFDQWhMulskD1+vGsl1OPZhCdEyqiwn7O1nE9KYuN3Zi78M
         3jJ/tMIXEEJcEFf0Qqa32NUdj7bK339u1neLj1nKXX/lyn0p15wlUGCz8gEwHNRDznC+
         y5nGU86uMNK5FMxTSA42afCVfMi9M1cgQkCeTep0jrPpFwQE5D+eebBGS4CNFZOzK9Dv
         36ByrsnHEPoxErB+pe0rDwMct0F+4kaPEvts/6tmqFiUa6HzcU6LO23hjap/Fowv+h7V
         NQoA==
X-Forwarded-Encrypted: i=1; AHgh+RpSTp4nnHeTrofeVsZLIyiwcLo2YcRzW60DY7GCrtGsJWiXZ1ZROF4wqKssa8hTcUTHUik2IQThAu/z@vger.kernel.org
X-Gm-Message-State: AOJu0YxRF3EJsn+nsXCsLeiiJuPekGORcHdDzlIbqimgLD9gCMevs+Cg
	zfwblnRxirs+8UA93lFhEaGktcDE2KIzyE9Mu2imMya1pfNwKAjWYhTKazH0Kn4xm2BrIsfNj2A
	aL36YFOtznbNWf1Ln6eoxWuNAnx+thcct7kQPFTNr2a+g1zPYYbk0KehrL3grDlzJ
X-Gm-Gg: AR+sD112NAX4N4iwgeTPoCmEtCEL0jXdyZcWATTTrwO4d7Oz71MD38Fhxdfz47aNtT/
	q4MJCGioQTsdpf5qizc3d3vT++WoGasiaJovKN63dr6f3dgtqQEjru0RgwCGE5/gz6cluQ7hzLA
	qGtF2mw2fbsoEhu3FE/hJX06OF6gypf8MackBxV6gv3shxm7J2oMwsU6PK6F9eUWD2dqFlMB7Up
	9gK3AKzaPVNLbg38jnEZ32UmjhJNkur2xfqQesO6crUFLZJ0mM+P9AEX2848JVBjx6r23lyQr0N
	Ww1murzFpMEV1VA0j7q+gXy7jTILN600IUrBUh2MQk31RxHozV/hPtEiGi2pX7QhfcmT1W2OKwz
	oSCUeRnfA5+UvRK4mkzTUyVvxCFsNRFUv6uOPyGb4kEukvp/pbyLUHvfvhM8pgi8g8Z8SseIFlD
	MecFWcTcRKcUhiuxcRlGW/XSSuAAYKow==
X-Received: by 2002:a05:6a21:3a44:b0:3bf:6c08:2843 with SMTP id adf61e73a8af0-3c92a89c7a3mr9455790637.50.1785753995519;
        Mon, 03 Aug 2026 03:46:35 -0700 (PDT)
X-Received: by 2002:a05:6a21:3a44:b0:3bf:6c08:2843 with SMTP id adf61e73a8af0-3c92a89c7a3mr9455770637.50.1785753995146;
        Mon, 03 Aug 2026 03:46:35 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4e506csm29993730c88.13.2026.08.03.03.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:46:34 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 16:16:08 +0530
Subject: [PATCH v14 2/9] dt-bindings: remoteproc: qcom: document hexagon
 based WCSS secure PIL
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-rproc-v14-2-a1f87b0b0ad2@oss.qualcomm.com>
References: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
In-Reply-To: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfXy1eo+kpS9I8u
 ZcdaB5Y2/nu4vrBnquRCAldon/4C+yazWBfZ28dYTY1BcSk7Lqng7nju/JTtgIoiSo5h//BgKGK
 PvI2ba7nbbcHtX8nkaaaA2VJY9P9Dwc=
X-Authority-Analysis: v=2.4 cv=f/94wuyM c=1 sm=1 tr=0 ts=6a70718c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=fvnyRN_YwKOm8-nVNuIA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: SqD7HKToemlp8H9Xeivq7CONVC7dNyNY
X-Proofpoint-ORIG-GUID: SqD7HKToemlp8H9Xeivq7CONVC7dNyNY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfX9As/AaVKgogR
 0EgATvkl2pHWYO3EcvLxrDAmmzjbK7usVYV3E6Io6PGH9RViMAsh5mOZTdcYh1PLXmb8VRDzAKl
 TR46WzguiwKWSrFmEKDUD7Rq3glXnAh0eEW5gTmrVdcZsgOeIe6IR1lcMU6sutUGvmKyNtRpmDW
 hu6UTIplfF+RCC8uRW1aVYiMbz3czIRyM2jfV6C6ZrYreX6YVMvyj3rRCM87sagD0Rup8i/ehJv
 Y9H2deK1VVsN1JKcP0y+1h1E02c0vgSs6tPo1bWe0BbhgOKGP7KHwA3NkuSCUgKZhX4FemsywFM
 oQ8D2msulctLAsa0gKO+sQ3uQo5AU/z6zWLAy36yAUBPVwcKplh0vrr0srexS+xGnc5/qvVt7gh
 i5NDKbtXYgiLOL9GgNXJs1hWNmhx0kCFV6sWAjaWDefVG+3du5Ht7vmmP1BnAMqYOPQjco1K2O/
 RIgGqZdPSGau290k2fQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030096

From: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>

Add new binding document for hexagon based WCSS secure PIL remoteproc.
IPQ5018, IPQ5332 and IPQ9574 follow secure PIL remoteproc.

Signed-off-by: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
[ Dropped ipq5424 support ]
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../remoteproc/qcom,ipq5018-wcss-sec-pil.yaml      | 178 +++++++++++++++++++++
 1 file changed, 178 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml
new file mode 100644
index 000000000000..1ec8df60d963
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml
@@ -0,0 +1,178 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm WCSS Secure Peripheral Image Loader
+
+maintainers:
+  - Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
+
+description:
+  Wireless Connectivity Subsystem (WCSS) Secure Peripheral Image Loader loads
+  firmware and power up QDSP6 remoteproc on the Qualcomm IPQ series SoC.
+
+properties:
+  compatible:
+    enum:
+      - qcom,ipq5018-wcss-sec-pil
+      - qcom,ipq5332-wcss-sec-pil
+      - qcom,ipq9574-wcss-sec-pil
+
+  reg:
+    maxItems: 1
+
+  firmware-name:
+    maxItems: 1
+    description: Firmware name for the Hexagon core
+
+  interrupts:
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+
+  interrupt-names:
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+
+  clocks:
+    minItems: 1
+    items:
+      - description: sleep clock
+      - description: AHB interconnect clock
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: sleep
+      - const: interconnect
+
+  mboxes:
+    items:
+      - description: TMECom mailbox
+
+  qcom,smem-states:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: States used by the AP to signal the remote processor
+    items:
+      - minItems: 2
+      - maxItems: 2
+
+  qcom,smem-state-names:
+    description:
+      Names of the states used by the AP to signal the remote processor
+    items:
+      - const: stop
+      - const: shutdown
+
+  memory-region:
+    items:
+      - description: Q6 reserved region
+
+  glink-edge:
+    $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
+    description:
+      Qualcomm G-Link subnode which represents communication edge, channels
+      and devices related to the Modem.
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - firmware-name
+  - interrupts
+  - interrupt-names
+  - qcom,smem-states
+  - qcom,smem-state-names
+  - memory-region
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,ipq5018-wcss-sec-pil
+    then:
+      properties:
+        clocks:
+          items:
+            - description: sleep clock
+            - description: AHB interconnect clock
+        clock-names:
+          items:
+            - const: sleep
+            - const: interconnect
+      required:
+        - clocks
+        - clock-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,ipq5332-wcss-sec-pil
+    then:
+      properties:
+        clocks:
+          items:
+            - description: sleep clock
+        clock-names:
+          items:
+            - const: sleep
+      required:
+        - clocks
+        - clock-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq9574-wcss-sec-pil
+    then:
+      properties:
+        clocks: false
+        clock-names: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    q6v5_wcss: remoteproc@cd00000 {
+        compatible = "qcom,ipq9574-wcss-sec-pil";
+        reg = <0x0cd00000 0x10000>;
+        firmware-name = "ath11k/IPQ9574/hw1.0/q6_fw.mbn";
+        interrupts-extended = <&intc GIC_SPI 325 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_wcss_in 0 IRQ_TYPE_NONE>,
+                              <&smp2p_wcss_in 1 IRQ_TYPE_NONE>,
+                              <&smp2p_wcss_in 2 IRQ_TYPE_NONE>,
+                              <&smp2p_wcss_in 3 IRQ_TYPE_NONE>;
+        interrupt-names = "wdog",
+                          "fatal",
+                          "ready",
+                          "handover",
+                          "stop-ack";
+
+        qcom,smem-states = <&smp2p_wcss_out 1>,
+                           <&smp2p_wcss_out 0>;
+        qcom,smem-state-names = "stop",
+                                "shutdown";
+        memory-region = <&q6_region>;
+
+        glink-edge {
+            interrupts = <GIC_SPI 321 IRQ_TYPE_EDGE_RISING>;
+            label = "rtr";
+            qcom,remote-pid = <1>;
+            mboxes = <&apcs_glb 8>;
+        };
+    };

-- 
2.34.1

