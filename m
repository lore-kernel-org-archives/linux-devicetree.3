Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A5139B94B
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 04:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774499621; cv=none; b=Hh/3l5ym1/1fnYfCNWRs+eePs5Vxrh3iAj93NGInpeOxUyrt/w4IkxpGSey58pub+aSten3YWO8Qb8ExXc3AvpEig08PZHglWC9WyCOJS3F0Y+y2LLQAWas2v8M3l3DQIMcU2A+3xlELkvlh5QZXQNuIEegcxaVR5hUBW/fpOBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774499621; c=relaxed/simple;
	bh=tZNatXF/IsYW2w1moUBh1EQNMMEhjVFjbvCRb3Q9xM4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RFY46JBWY2CEvRymADe0nOryQHyO6oNVcA2cxUU2t5nXy5RBfxBarfnp+QS15zwbYlhqAsgmJ6TlBsIKNLgnlZpNH0bT9r7J3WFJf/77DQO5ONLcuEvQZaRoYgqI3nY9MToZBkgI+hpAnEid1tlA9/WVYCySQQb6PxlhyzlPPrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GpChRbWw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ku+mJFpt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GpChRbWw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ku+mJFpt"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q0nQLW1810753
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 04:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=j++VeohUiIK
	P+Iz5rB7WGkaT/d3QbG8tvRKTOxHJK4U=; b=GpChRbWwGd4U1qcx3uRWc6on1s7
	fHzB5m2NMD8pEoOcv3z6P2pbTnSmtmPVKNWwJO2PutJdwsz5IjgGj/f9uOLOcS/H
	tyzhKyf8f0ByAIGd+pqTqGOh3Al4q/xAlywug7653/FvwnqDfjuLYKyizFJAtlz/
	tD2ugZUZDQ60vsxK30dD59pqX/3E9tk/kJPPS2dadh9nzxJ8xjgg3Oezf8m0oB5n
	naW3UWqAY/3Y3kG2D9+YNBhqJ/3kgHBFcYOKnUy7+7FaOkhw2XCDmjN/nJ3wmQWQ
	9R6ZWvMRVEFCOiq6Bvm9agqBkw/OmC5CYL3p9079YH+yiQRROoWxdhr17hQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4tkn0k6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 04:33:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b0565d77a6so7093555ad.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 21:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774499619; x=1775104419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j++VeohUiIKP+Iz5rB7WGkaT/d3QbG8tvRKTOxHJK4U=;
        b=ku+mJFptgi9sRHlNu2hYAycnoFjd98SFvRsqZikI6QU2KahOjRcErdB1x6durkuEI5
         AizshaWlY9zXrjgPnyGfUYb67UujF1u9f8Kdugxyxl3lGrmlkng1gNgnJw/DnA60lJ/6
         K2pOLeq2gRVJymLpZViEAf5YepI96FBeta5sVdHLPk4cnDiYQClpMOaGpSb0IcIgsNc+
         OZO85OsG5yBIiXNgxTX9zQY6hY5EfHebeUMfBw9WfFoRC3GOO+KsBZl/OC88toArtfgH
         6TLkKZo+eajrrqCeN/mYAvo6QEsd80gccM+5Qg/hIxziXhP/blENLz2nFZSktWUm4UwI
         r3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774499619; x=1775104419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j++VeohUiIKP+Iz5rB7WGkaT/d3QbG8tvRKTOxHJK4U=;
        b=FXrAD+J4DF9f1voAUH+X88oMBHXjExC+l73p4ut2olF18ilqsV/BE+BMZotGiZNSAp
         TYMLqTZZbuNRTTzhH+u+jw0ua/4FXGmon7eidPFFh9tZWgThDSZ/T7CZjajoitSwXIHd
         mXBOxQel3kDjbhaRGrk42SEKq1hNc82NQdencFvRNF/x53QNFRdMVuLspiywcLfP50bI
         PViCX45YI9wMeu3CQ3DoU/2263YKGVs4bHffzJV5YLoWF3VWuP/41EAjaiAHUWZ/aUQd
         V2v0i/FCK+ynAeH9JBNzfSvuhbs5IFlkmCikvgC3gxTJSJd0qn5uEKgoTQd6cWtwYRQS
         dnjw==
X-Forwarded-Encrypted: i=1; AJvYcCUSOgqMKddQdz9D/XaQAHn700CM7xgw9utsS2vGWW86janukBdcFedXeF1CR0OzTWrdQWEhZJA9TTMX@vger.kernel.org
X-Gm-Message-State: AOJu0YzFFoE85kAPxegca3grR0CeFYJmUU5CeoZ/ptHBBF2V2IvL0LzT
	1dAygiINXhva3D0mOx+O2Xho4bApzl8JbUyvYRhblzTsS1K76tWNbyojT+h0eHYvYApOeCUtbfp
	07G/WV6dJgqHf2HgyiND8bThclgIQ1S5mXPCFH0lAjj7riEVLetMdxit5gC7acm/I
X-Gm-Gg: ATEYQzzDsxvdGRTSBW/PGazMV/jqBSZfcR7KpiwY3A0tbsFsa6Wyd4i7Osvw2YXvxUM
	9KJzhyVYtdF2crinOQohYopx+XN3ltisvKSoPzVCPvK7wAY7RJpTDDSWnKUwQyv6lmVk9N8ttX3
	kvcIVo2N/fK8pkBtMBeFnL7wcxw5QLaOGOCB4btvLxHLH9+8Y8sRbL4IxCZw1+3j1AdccMwJvv/
	ciyU4mLkUe/ze5cuKO40C57ERMVjdofm/lh6zZ/BNxS4OWca85U12FHJay1onim1m/7aM5iGrPC
	Gn46ZHQddE0rFBhvGpCdSRoRptA+89G0zBraoOkcUx9OiVAZQ4aypFWi49HL0YpfKPzE/eVXJ5+
	Swa8V6M9DCn5yiwoUpXR4aoq//xdyYL4Pa7zJ8Ldax2Rmp4GN7tLE1QSafOUGMtmf5PJ7HgGIP2
	vwKc0cbXoVSUttS+oBnpoc8Vk0nM80e+bavmzukI797h8OElisyWU=
X-Received: by 2002:a17:903:234d:b0:2b0:6d2d:f1d7 with SMTP id d9443c01a7336-2b0b0b46136mr66431135ad.48.1774499618661;
        Wed, 25 Mar 2026 21:33:38 -0700 (PDT)
X-Received: by 2002:a17:903:234d:b0:2b0:6d2d:f1d7 with SMTP id d9443c01a7336-2b0b0b46136mr66430665ad.48.1774499618097;
        Wed, 25 Mar 2026 21:33:38 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc7b233fsm15163715ad.32.2026.03.25.21.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 21:33:37 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v11 2/6] dt-bindings: remoteproc: qcom: document hexagon based WCSS secure PIL
Date: Thu, 26 Mar 2026 10:03:16 +0530
Message-Id: <20260326043320.2507890-3-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260326043320.2507890-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260326043320.2507890-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAzMiBTYWx0ZWRfX/hw34s6i9goy
 QjXT3UHsaQ89PN4zFGvAyPJ2Roc69EyE0CfrTB78CABgofFyYvQuKTjPoGTrhcERtyr5haTFSTM
 dStEcuOQz/Wriei/RmtyPB9Hgrh9vF9TiRQVRWyMnZITsr0uTp+0KbSlIHhAJFpVamxCNcYhZ8j
 ic94eATA2dpWffATB6WXnLsJPs57YmxgoSo9kMDrMy3IbSlInj8U8O6LLZQazWA2wKxyK7Bu8Si
 TPg6QKLnkr2hAiq8yoYO2Yxw4uMkWA0cFGWVROXaXD27uNDggPakalo6e3NFjqn4vYTRqoQMrEu
 DK3xISfFIVNdLv01XQsP5l+IiNxKTzmIpvRSuVQ8LRCUh6U7sg3+IqzH9uALKnfmbu0xMiFG7js
 1RwxorjoAGY7gYS5EdIzvc32dID0movnh6+aUOtzAl04t8fMYKgYqnptsob7LMW8O2pcqZuvSbw
 2NY/mbLGZGkXovxXpJQ==
X-Authority-Analysis: v=2.4 cv=It8Tsb/g c=1 sm=1 tr=0 ts=69c4b723 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=gEfo2CItAAAA:8
 a=COk6AnOGAAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=RNRoJpfvdE2T6TG_4XMA:9
 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ZIgNjR4-0DKo9oTDaYXkCwKZFDG_h2fE
X-Proofpoint-ORIG-GUID: ZIgNjR4-0DKo9oTDaYXkCwKZFDG_h2fE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603260032

From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

Add new binding document for hexagon based WCSS secure PIL remoteproc.
IPQ5018, IPQ5332 and IPQ9574 follow secure PIL remoteproc.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
[ Dropped ipq5424 support ]
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v10: Add r-b Krzysztof

v9: Rename qcom,wcss-sec-pil.yaml -> qcom,ipq5018-wcss-sec-pil.yaml
    Fix 'clocks' and 'clock-names' definitions

v8: Dropped Krzysztof's 'Reviewed-by' as the bindings file has changed significantly
    Drop ipq5424 support
    Update example to ipq9574 instead of ipq5424
    Change 'mboxes' description
---
 .../remoteproc/qcom,ipq5018-wcss-sec-pil.yaml | 178 ++++++++++++++++++
 1 file changed, 178 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml
new file mode 100644
index 000000000000..a73edb447d26
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
+  - Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
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

