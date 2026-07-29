Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03EE175A84
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 02:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785292536; cv=none; b=VehLxNvme0kCzMReeK9R7ZVt5dNqxx3VFiMw8o5dsKlEnyzACcQT91GdeWr8Eq8vSYtkLNm4ozdE7aHtDZyZdkdvcOQyMVR6Ikoj6DpEsH7yrTewxHj60XteLpJZlxNSPUm0Ryc0GLLmrUZvc6QYWBPOc80yo92xbMkdzu2lDP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785292536; c=relaxed/simple;
	bh=HsvPBVX9FVNksgzuHsuw5nLhZW8s06EG/VphF3F6oyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=taN7Ls8DrMH8Al+r4MiBnwEsSmAtaOS8bjxuUYUm/c8/KGwixOpaoTUVLWDuQldXLbcevsBWsx6LHsJW3xf3E9V+ed6qG2oWwOaJLPVAXGUxa10UjT2bE/eHcYKqzh/kFmcVGFWUqE9BWP/VoMlgeHTaAej81MQ74Xq684uE0A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hUDXgb2a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fhPDJ2b8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hUDXgb2a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fhPDJ2b8"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T1HD4T526600
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 02:35:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wjFila/Vnva
	jjrGjT7HBEfP7JaWBYji7/kPJO6j8C88=; b=hUDXgb2app8s9i3/IA1pSG/CWXz
	gyIbarON2GHbw0zJuPFT6ghWCUswKWE1tg0zi51xaNf2XA/u0tgzPLzbFkmdP4L1
	h2xTZAbrDjFVC/+HL3pZ0APmP/49bFoRzrUf6ovcS5yEdY7st+DioPEZfOId3iaN
	8v7zlgAQxBT5RTmcF8ZDQi8EJ0jWxrTWVLFgWxxdT8uazfphLcIry/kBO2e3ev0A
	AIM42tjqy+nZQSxF83Tfj3QZP1AVwRNWkQnvI1nhDZXg49pgKprjdypJzxvWV6Lh
	eCgmKjI4qgVWa37tlJmNCGHAltokWZEI40o0sBlBhLADJTNBueglKGXvIAQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq0q09rxx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 02:35:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cccfa32670so5488965ad.2
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 19:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785292532; x=1785897332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wjFila/VnvajjrGjT7HBEfP7JaWBYji7/kPJO6j8C88=;
        b=fhPDJ2b8IXRNz0wYquXr0uIbxGlZLCZvPfYP7gNSv9TdKRg2jmjj3yQBIj+6kwNPTz
         7qO/NOuHReuTE2RiMy9Jety65xWCIpwhcf9HMIRvfYFfTxGYn9SrK/WU5gOVrib8IZhF
         jYtO25w8HLD1+7yr0BfmcTpDMO7jZICYHassTgl2YhhTumbWclnuuTJej+R/WzZyjodE
         NEMxc3BWMczG3xHiV86rl1FwSy9E7Mz3IqSGkUCW6NbOvGjEmikgMm3nYgFVvHNrGt9B
         Ybyl6yZr9We57gZv+jfJ/OpNSkyd+VnHwwWU6DBgkr0C0EFhKEuNWlr7zk8Teqwq1d0e
         QtJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785292532; x=1785897332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wjFila/VnvajjrGjT7HBEfP7JaWBYji7/kPJO6j8C88=;
        b=D7+QXqSWMlXUhBLDch+7TwiM/2aobZOu+bUrvIuUqwfmF2hCWXjJV76xcE9TAPLgkS
         kc8L1lQq6InLv3auZu388GAnroCaKMX9DVUG7oag4823I9BW93ZTUJEsTLGqP1nd8lMc
         qWC8243mlpJRNO5ynngk9LFklQ5YfsVNz29eLQXWoX5sXF84OMdE5KzSlEKsheQ6fDZp
         IEZinR9iquZZl9GmZbfiUvtVXUxM/tQKBYClKHfcLBkzmKm7eHHnPjqGiNlkBtjZH5Cc
         rNefAOIRuBJsT/u6mgTtR8tdLpyi4ZzADGpNH+fhjN5ho00S/3yDRGhnOYD3GlK7Fbd7
         IvXg==
X-Forwarded-Encrypted: i=1; AHgh+RpskgcrAyLGoajxDx9slwr570upq+3U8V5HwmmkZTwjt+lDFRSXb5M4pUuQUE/o+hR9EdKcRe0mKq5Y@vger.kernel.org
X-Gm-Message-State: AOJu0YyvDESt5NQph45AW1Qg9/WXaBBd3HiHw8I2QFksEJzcaD+HkS7b
	nZWcpXUorMiAzoEN7XrkFTGe+OGmI+1F4iV+aXTW8sKN0do2SEvegEGy+fQTh+U1TzQMZ7PyjWU
	s6fOjeC3cPMKZ8nylRVUBFbOw328rdXU9JlZO8E4GAcd4XpR/EV8jfGYkKoqQcxWJ
X-Gm-Gg: AR+sD13EbnavnTZyHpt5YtjdKFwL9jABERD46dTd3d01DKuRtNHKJzTfA6zInCv7/st
	MUh8nI5qZkKMWuzFTfG546n8pEQxpqhLDSziOEK99D4OoAEkfntXOFQagvgNuwsaMwkw/IijfTl
	Z2DiMF1IHYuXgHd/t3R4HtbkUNjtfqUXlgw5P9EOTAV+UiKrjNRLX7dAtyKnE/nWZ4M6+x0ZK33
	u5rU93qWQP6Dpoh8zu5qVTU1d9MPJWo3h5LNYfbOchUGXGfwctBBHSit+LKhsN7wCZh8UP75Qsf
	6GWxaxSMYuTFkfGuwUdmE3NDHqbBhM06N7BcyBgPdmYV3HwwTl6vMFkiTOdvW7KJb3yY1gbPAqh
	wSyzcTxamSgkvs/YXacQnlF+atApQLTQ/ptapEptbn2a6/F/WeeuMUeTlcyBY
X-Received: by 2002:a05:6a20:94cd:b0:3c3:7cfe:b337 with SMTP id adf61e73a8af0-3c8b71c6e85mr5681330637.30.1785292532188;
        Tue, 28 Jul 2026 19:35:32 -0700 (PDT)
X-Received: by 2002:a05:6a20:94cd:b0:3c3:7cfe:b337 with SMTP id adf61e73a8af0-3c8b71c6e85mr5681313637.30.1785292531676;
        Tue, 28 Jul 2026 19:35:31 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7265be48sm3899837c88.8.2026.07.28.19.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 19:35:31 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 2/3] dt-bindings: remoteproc: qcom,nord-pas: Document Nord PAS
Date: Wed, 29 Jul 2026 10:35:07 +0800
Message-ID: <20260729023508.879752-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729023508.879752-1-shengchao.guo@oss.qualcomm.com>
References: <20260729023508.879752-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZOPnX37b c=1 sm=1 tr=0 ts=6a6966f5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=ubVXmmWBUKpdC42ABFkA:9 a=1OuFwYUASf3TG4hYMiVC:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: N0t-uVO6477PLwhtybPqLUO_ANFZJWPg
X-Proofpoint-ORIG-GUID: N0t-uVO6477PLwhtybPqLUO_ANFZJWPg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAxOCBTYWx0ZWRfX4bHyEZjABMU3
 eR8pmARidyhUf3hzrbg8jc99n3kLS6rcq3Tt/sxv0A76iGYAd15NTicoaN0lBl+XE3a1JqPfbff
 WxgDCLQcHd6kVAVOexn5lFMQ9eOFASeLXBiMIi4oeV20uXIxW7/nl0MXIRRjCo12UI3i0Ty7lYO
 dpm2N793zBOY4rTI85nyRuqAP+s5uip/Bde+v3Tyf5ZJHWaMXis7lD8oBW63uU+Nsjl/3cgHIgd
 cmffPGdiLCCkrDAsn1+bvhi1bc3rYfueKnHeYw3MP2W9Je+BcjiXnLqoKJr+GjiwQTiU2Yes68U
 Ny9MWkO0H4AzciKVaBUmxKli5Ex6y672VYIScys/p8JwaQ1tWzxwbnyVhvme5y3XG4yr3xh3FKI
 wj0JVsOe43Z2EW9dG/PeWvcpbTSRp7E7wP71PJVRvV0zGwZrKaw5Im0MgXYC2fOVT8NTt3j4jSS
 hqaUX2R4VC6lb02dYfg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAxOCBTYWx0ZWRfX//WCh1clFOH6
 ip90NSd9WWXLYIKrD1U/drPO8A0mtldDiTlUX+rzzUA+Ksan/ac2DPCyUavrWYZs95zCk4AbrYf
 kN6jsEqVNcsIbc/DUDdsT3nv5go6VU8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_01,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290018

Add a dedicated binding for the Qualcomm Nord SoC PAS devices: ADSP
and CDSPs. Nord ADSP uses CX and MX power domains while the CDSPs
add an NSP domain on top of that.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,nord-pas.yaml    | 173 ++++++++++++++++++
 1 file changed, 173 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
new file mode 100644
index 000000000000..e90d2953ba69
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
@@ -0,0 +1,173 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,nord-pas.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Nord SoC Peripheral Authentication Service
+
+maintainers:
+  - Shawn Guo <shengchao.guo@oss.qualcomm.com>
+
+description:
+  Qualcomm Nord SoC Peripheral Authentication Service loads and boots firmware
+  on the Qualcomm DSP Hexagon cores.
+
+properties:
+  compatible:
+    enum:
+      - qcom,nord-adsp-pas
+      - qcom,nord-cdsp0-pas
+      - qcom,nord-cdsp1-pas
+      - qcom,nord-cdsp2-pas
+      - qcom,nord-cdsp3-pas
+
+  power-domains:
+    minItems: 2
+    items:
+      - description: CX power domain
+      - description: MX power domain
+      - description: NSP power domain
+
+  power-domain-names:
+    minItems: 2
+    items:
+      - const: cx
+      - const: mx
+      - const: nsp
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: XO clock
+
+  clock-names:
+    items:
+      - const: xo
+
+  qcom,qmp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Reference to the AOSS side-channel message RAM.
+
+  smd-edge: false
+
+  firmware-name:
+    items:
+      - description: Firmware name of the Hexagon core
+      - description: Firmware name of the Hexagon Devicetree
+
+  memory-region:
+    items:
+      - description: Memory region for main Firmware authentication
+      - description: Memory region for Devicetree Firmware authentication
+
+  interrupts:
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Shutdown acknowledge interrupt
+
+  interrupt-names:
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: shutdown-ack
+
+  qcom,smem-states:
+    maxItems: 1
+    description: States used by the AP to signal the Hexagon core
+
+  qcom,smem-state-names:
+    maxItems: 1
+    description: The names of the state bits used for SMP2P output
+
+required:
+  - compatible
+  - reg
+  - memory-region
+
+allOf:
+  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,nord-adsp-pas
+    then:
+      properties:
+        power-domains:
+          maxItems: 2
+        power-domain-names:
+          maxItems: 2
+    else:
+      properties:
+        power-domains:
+          minItems: 3
+        power-domain-names:
+          minItems: 3
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/mailbox/qcom-ipcc.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+    #define IPCC_MPROC_ADSP0
+
+    remoteproc@4c00000 {
+        compatible = "qcom,nord-adsp-pas";
+        reg = <0x04c00000 0x10000>;
+
+        clocks = <&rpmhcc RPMH_CXO_CLK>;
+        clock-names = "xo";
+
+        interrupts-extended = <&intc GIC_SPI 159 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_adsp_in 7 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "wdog",
+                          "fatal",
+                          "ready",
+                          "handover",
+                          "stop-ack",
+                          "shutdown-ack";
+
+        memory-region = <&hpass_dsp0_mem>, <&hpass_dsp0_dtb_mem>;
+
+        firmware-name = "qcom/nord/adsp.mbn",
+                        "qcom/nord/adsp_dtb.mbn";
+
+        power-domains = <&rpmhpd RPMHPD_CX>,
+                        <&rpmhpd RPMHPD_MX>;
+        power-domain-names = "cx",
+                             "mx";
+
+        qcom,qmp = <&aoss_qmp>;
+        qcom,smem-states = <&smp2p_adsp_out 0>;
+        qcom,smem-state-names = "stop";
+
+        glink-edge {
+            interrupts-extended = <&ipcc IPCC_MPROC_ADSP0
+                                         IPCC_MPROC_SIGNAL_GLINK_QMP
+                                         IRQ_TYPE_EDGE_RISING>;
+            mboxes = <&ipcc IPCC_MPROC_ADSP0 IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+            label = "adsp";
+            qcom,remote-pid = <2>;
+
+            /* ... */
+        };
+    };
-- 
2.43.0

