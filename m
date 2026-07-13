Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB9937AA97
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 06:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783924388; cv=none; b=ndLuu2X7MgJeO8o11HU5dr4yULbEw6n9OPuxYWsqggEfy/7o4L9cfp30wvUjdpn3UD6TicCbBjsk89JL1P+vC72JV7qMCVOu1Ys7cggtSiM71X0ae7MON18rjjqxBjd/mfOe+PcenkwH05cs3BttkZdaYFiLHf2BWrO46gpKPM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783924388; c=relaxed/simple;
	bh=27EaIAhqGp+mquHVB6kjkp0Z2doJh2GJOYZQSDehpyg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oBGN79dksNLXpDBTrgX9zteQwCyI6anIaQZ+2wu8ytm7jw6RgQqFccwD/dEiGCPffa+Eaez1DTiWWvI4HeBbFk4qYIu/f3fhTuTKAY6kw5tEFLEfIKdUBnZ//EnUiBE+Qh0K67kY5zjcOmbWai6P/l8wvbcYT9q+S/hGyO4bd+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TtMHN7Lk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F3wEtf33; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TtMHN7Lk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F3wEtf33"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6O1hc472924
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 06:33:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qprFpyjG0X97ZmZqIX1N021KXVlLLLyX73couEvv2lg=; b=TtMHN7LkPIKiJb1W
	T8Or4o+d02tJskQ+r7Gtnzgr7+v89b67hR/V8P1KOS8LN5cDrvhhhzDeGsafzE9e
	HoUGUR6X+scfM0Y+7La72sZDRjTB0PVzXyLSCWG+l0Ze9/PZHqzyoaBqsU6HXVfJ
	h100H1FEQ08F091PF8XlCP1E7p0SjW7r8qAFVCmB/JHdXpnKYhxTmxVSLDLiaK3V
	HW9UApulTmxDu/JFn5Zv5ZP2oht6CB/Cb6EOJnK/kLqvw5u2Zx8kZT19PXfS1UOH
	cFxevUeVakDEHu3O+tiLgZVfAie19CkqW45sN1EqSdrUbZgZC0vpxDG7NnzgikYB
	sV0vgQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbee9mqrh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 06:33:04 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8423f1fe39eso990140b3a.1
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 23:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783924370; x=1784529170; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qprFpyjG0X97ZmZqIX1N021KXVlLLLyX73couEvv2lg=;
        b=F3wEtf33LVJ3+qYup22bAv5ee0E2InRQ+3VCHQwxaKWFxnTmyINd3H/1JTd8lCeMAi
         k0mRGXZf8IrzbTxi44YKuFuNfj7MPuTKOcNtS9cRXTErT2XT+2xWTU/8cJQFM3dZ/Kh3
         8K3LyWo2iX0vTpIZg2MjtIcBz1NSXKwZKerK3PQ0sIy34zW43vmUZ9bidqcSRKoLsDEC
         csSa53LJHLGHOiaVdvTXcDGJs4hR5K4MkhUXtVke8UFauvWeSrt8PltOUFOCtMEB4TCr
         BL4ImCM649NwSK4lmsZaRL+a0ONApUqiwAYAk4CcTngHBD4LfpSfC4ikU1lND5lbMj41
         9JBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783924370; x=1784529170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qprFpyjG0X97ZmZqIX1N021KXVlLLLyX73couEvv2lg=;
        b=ET+S/vDtICVRYpNd0hvy3vAEaeDWqSYGJr41Mn3q6IGIlyAFwWRpY4HhHOCAdxmTX9
         Ye6WxnYJJG76b3M4OIDXyuJhVRo+JwcflsxFx9Y+z3s7fGQL6n4dL3no2lBoaEubu1D0
         n5c5n30v4V6AhvTLuUru6sdoBMStHQPMOMKE5aL70lWmk0oUoDwo3EU23to3AwKA8jHs
         Ew6khnf+I7eZkY6HYKJsxcIAZoP7yJlDvguPE/KBrp/RlM0tJ69DluRwBdkzG96Q+UWT
         awWw8o6TLE+uKPY8zEF2mwBqVfEio+Jp3R+L1ojjY+zRhZm89w/HJzA5z9e1oTW4hUB1
         hAPg==
X-Forwarded-Encrypted: i=1; AHgh+Rpe/g40c0kE+kYzhDprmOtTI12FIkcZrbZuMifq2KxNmdbOe/31l7lSkwxHPlqkSbVDPx9gjgYmqaFg@vger.kernel.org
X-Gm-Message-State: AOJu0YxawuJBlXTahtDMRrJD/0lh9KUUJGeyk9ixgxMSZspTGza/M8WH
	QWPIeHeRwGf6Tt1tpcb21ya1u5ZpsJZ2Nkf403ZkzJTJUXIw70gCjdyIFfkKZkPZzmBpY1Tgxug
	9ZsoOsPBL2uePz8y4WFNkDYLvBMDRkOJEaGZ17JBaLDcXcmUcqt6xHx4hLLI6wqk4
X-Gm-Gg: AfdE7ck2tP+wBpJG0izBUV+cTWKTSy7I6Csm4KEiqdsXx4Z41MFbW2HKPyHLA1UwXuX
	FAAhMCUDONB4N5oR4Gsjp3e99JoyqyYbxZi5q0PE3btsPqy6YqLpL6v+iCBaU4YjSpK2NSrY53X
	f259zeYuYbrVAXDYjZcRoodoaXZiZWmAAenQJzrqu+qyVeuEUCKlBpN0RKG3jO6sG+XvvDvJmad
	CiUjNRvqPOwrjFzG0GGDP1EAHUEl068ccCN873Ub5wkkhNV2N9K+6mAPykqTc0RKww/o4/8QvNH
	k2JgnNIcKvAc9pLxrtCdz9/FajTk69JesAXo2vZw4VmAkbYOdVF1WL3vT0HAhK1k44CiZ7QPakD
	RUA5r0WAtuTJpCaJ1ycENiwjzwd1lJEkc6/TIc30EBuuYSTQnlYI8qqE39pwGRCKMIj/EobMTf1
	18fhSLqY5x2ZPGAcwE7yq+O+rnNmHeLpIZxeXdru2r
X-Received: by 2002:a05:6a21:50b:b0:3c0:9c1b:d0b7 with SMTP id adf61e73a8af0-3c110a1213fmr8922188637.66.1783924370392;
        Sun, 12 Jul 2026 23:32:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:50b:b0:3c0:9c1b:d0b7 with SMTP id adf61e73a8af0-3c110a1213fmr8922173637.66.1783924370005;
        Sun, 12 Jul 2026 23:32:50 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b87b92b27sm25435361c88.6.2026.07.12.23.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 23:32:49 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:02:18 +0530
Subject: [PATCH v13 2/6] dt-bindings: remoteproc: qcom: document hexagon
 based WCSS secure PIL
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-rproc-v13-2-41011cbcda3e@oss.qualcomm.com>
References: <20260713-rproc-v13-0-41011cbcda3e@oss.qualcomm.com>
In-Reply-To: <20260713-rproc-v13-0-41011cbcda3e@oss.qualcomm.com>
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
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA2NiBTYWx0ZWRfXwU2V2t5+HBAA
 5pU1iXCVvHG37yhdgSYzzsqPLNvcdw0k38wX2OQcKech22A99TPTYvdR6z4xvhrdbOQGa0qWZbZ
 MnnMeXeUtGQ0K4t4+6RdJv6ARhyZqdU=
X-Proofpoint-GUID: 9sJ2gXaYseN5crH5P3LyT_4FdbSHmXFm
X-Authority-Analysis: v=2.4 cv=a7UAM0SF c=1 sm=1 tr=0 ts=6a5486a1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=fvnyRN_YwKOm8-nVNuIA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA2NiBTYWx0ZWRfX21uhWQ1bsMJA
 VFjlAN/DB+qgtNduFkJBlQwYJbJPED5t9Z1vMk6BlxKJmAH2Uf7CGHPyOy2rfUhSc6vvJOAi/he
 nW7L+jgqP9Ituban0DIfOaI5Zi4D63mlwbbblHo6VJ8bIx3Gr1J2kAQ91eXEesicesxF4xIwXEQ
 4pJFPKKH8V0I/Gl2wDAkq5djm0UBobzB+fH/wicS8zZWHkuHRBtSwMDvvj8wix1RLBdfidH7oiK
 p5xiij0wJy2efC2Nge2znHm5ecJTBdEB7A1RCz0hvsSwPVji6rELikuZLM8umIBYA6G1nLddOm3
 +PMLxG7LJtNabUk6sTBsTjYlwCnNRQr4dDiTZBi+mnLnDR3XLB64Lztb+IQVlklzUXOY+cKd7YN
 f4YSN1Xp7yYQulThdoJLMg3fCzqRsF9YB4nEBILiUKskgwXnnkiAIjvCqmZybrr75S5WObY48ED
 gfSvABBvKHzFgIWKTBQ==
X-Proofpoint-ORIG-GUID: 9sJ2gXaYseN5crH5P3LyT_4FdbSHmXFm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130066

From: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>

Add new binding document for hexagon based WCSS secure PIL remoteproc.
IPQ5018, IPQ5332 and IPQ9574 follow secure PIL remoteproc.

Signed-off-by: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
[ Dropped ipq5424 support ]
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../remoteproc/qcom,ipq5018-wcss-sec-pil.yaml      | 178 +++++++++++++++++++++
 1 file changed, 178 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml
new file mode 100644
index 000000000000..a6fc3a9db621
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
+      - description: TMECom mailbox driver
+
+  qcom,smem-states:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: States used by the AP to signal the remote processor
+    items:
+      - description: Stop Q6
+      - description: Shutdown Q6
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

