Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8724B35838E
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792120922; cv=none; b=jO522/LgeAV6H+NddYYbZ6mxEMCPfzrHaFC+/1ePtPwYl3fT12QaATxOFGneAUkT54JaI5BGqqvSYDyYrVs4WvyfWLqhZ6apbckftrWbljGXpYTli+iaTLjtPCVMSYZS7qbe+5eVHsCpt2M66DLKGIY5TvZR4c95KnKrL5nbjD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792120922; c=relaxed/simple;
	bh=dJPjGJ8Rj1VlQxPyjR35h/QvydWoxDZhoPBw5mGTYO8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k0WxdYSDQGiuCRS6O5iBNDfNNKyb/xZYNGdPO5bmYJ5ab8rXIVW6gEaaS/rfYoQ5Yu5vut0xE3/mJe4zhj7XhMfAyNbOHNJ6NZOVl8WetJuAC7OB6vBtgnYL/HvahD4shRmduv9EPBYMS0fudrE3HNPC6X6APQL3aQLAbmrU6yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l7S/g4JR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eRuaqdMs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l7S/g4JR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eRuaqdMs"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FKKDA33800047
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:21:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kq+7PKqldQcvs5CJO0ETAevA2lMbQZ78vlkTg3NcVtY=; b=l7S/g4JRKtxzw3Lm
	tlwbaH9ymNwBtjn+TX5+OlzR+kStZ9BOWa1AoR6Tn/GcHljRRFRen3DE/k9Bl0Sc
	rjVk65HvowuGKy8HYJ3lwR47LrmYiBOk2sf2vYcaWnc6c/ZQjpo+7yg8qa9W+J0n
	dnN/3l9LZC3Y8wBXZCCjo7/PC10RNHIbu3oYO8M8109P8Svu3amCQz2TjPY9K7A9
	h1i6NJKQUMS10bLIL4DSrmxcnSKPFbP8MW4nanb8WRBYOtYulsE/pLxWEDLXcYE9
	x8J7XHz1aTy3YtJ7/KkZYQ1tOnCeS1oSL2pDFeuaAVTqLLHN8puvbS1LEuL5gKhI
	3U9s5g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb5se99nx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:21:54 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35fb6be0f9fso2607229eec.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 20:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792120914; x=1792725714; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kq+7PKqldQcvs5CJO0ETAevA2lMbQZ78vlkTg3NcVtY=;
        b=eRuaqdMsjMS82SRWs7KQysdrUdaiCOlKCXZRDzC3KDQQF8CmqG4Lmsw8cghgIfuwoW
         Y4odAkHQ9ibOS5FOAVU0gg8RQVcl/ZoIJ3CYnv58WQPnvTXeVK1xyB9kkR1N9SVQymhz
         eu78pbwuswBDh0TDE7Es2o4DMxY3hcWcJcEkCBS+61WtYven8meVdFAXCWKxVrMtXhzJ
         QtlrlAqSxafNvlQgZVd5Eur7u1j0rC0Nwn21gHY6wk8dkNea7P9oAGt+xPBgmlPJU0kZ
         CnxI/CRnR0IOMUbswDpIrUdlTVhpRjwo076r021rd7tZHMwdqCDwjFrS3Sp4MAa5btsb
         NM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120914; x=1792725714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kq+7PKqldQcvs5CJO0ETAevA2lMbQZ78vlkTg3NcVtY=;
        b=gTRlzF8rXrJUiX/os+y65pJ0vTeordV8Mor/cczviv7G7gv7P9S6Dh8YtTzo6GON7b
         u7XtQdKigW+PEnblU1TA3l13uJt/bTzqw3+mDSeg0YXjFitgw4nTZOVAJMgSJU5W5ZqA
         ssiO1r/SS681BGosUN6tgTPU5ELnStqKVcpR8J4HC6VJSAQEVql1doXLFgrbsQtP4IrU
         jHYiy4aF5CfaZj8XvASu51j9htddzw0Ugr4aM5w0V1ISVAvxJoGiq/sY3VPp8GsZPqAh
         e9Dn4ACXsNSUGaoSIqe3gZkMnIBoTu6QmbUiz5o+5ghhgsz5a6Z0jScoVS2CPTW/4XJM
         Qpmg==
X-Forwarded-Encrypted: i=1; AKwUvBw1AFu/tHiAGZg6X6Pd+yCXQFtHBqiE+p7kYzAoa5QUc9qgBeuGunvepHvbFH/3Jy+HGrfPfcNRI6oL@vger.kernel.org
X-Gm-Message-State: AFq9FYIOiO6XOcSUIf/CrfC0B4cc1O6AZOCUFVPNuSjz/8s0gHqkcXHn
	qrgIrK/XxkbQiwjgTfn/wPEGscsim0d1Jwek9wjD+dynckFf9MX/gw45JoVGsuVt+9cqS++RLa4
	QfNPMNNjNxhsPznhyO8iIJ8FWc1LmLCM37mZOQn8/qo1j9Br4zgJWeZB9/uGROKpg
X-Gm-Gg: AYBFou2TveTGL3YN8V6UIPUb8H7xnrL+fImi6RztBhXZacgZXFhkgL7MNW33T08JekW
	q4CmeldGFtSmMRL8O79cPwfA9eiuPVHiwFw0oBzJ8pMuzeFWxIfrytD1fzIt3Qgt/SYNvvHF3oc
	AsIfsi4n3EyRAAr3GD7tMNCMfzR2GidZ/5XErrALokUlgUzxr4GsG3cPK1+GnrT+JARj+o57D0a
	jVzRHtZTh1MtUID5YVnQUbjVXOZzfjfQigNbPBuGELxaTs7dcN2litJKNWBi9UdPa4p+vy3u54o
	WIxyeHFV/D+iCweKZYLFzS6nTOvnBufjWQqLijTYSVgPNu1gNLvIrLyj6dlYv6XmfuG8g2BNqM2
	R2Qj3YAJStu3/MQYoWQPwv1qzuO71gJqECLMqIR2uBXG3u+yHdU0dOxtfCgL3JJ6zLV+x+sJ9KX
	qD6olFikhFa/mO/QULLM8YMA==
X-Received: by 2002:a05:7300:d18b:b0:351:1e2e:da4d with SMTP id 5a478bee46e88-3537e0bdfe0mr29159191eec.23.1792120914174;
        Thu, 15 Oct 2026 20:21:54 -0700 (PDT)
X-Received: by 2002:a05:7300:d18b:b0:351:1e2e:da4d with SMTP id 5a478bee46e88-3537e0bdfe0mr29159167eec.23.1792120913628;
        Thu, 15 Oct 2026 20:21:53 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm2256698eec.13.2026.10.15.20.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:21:53 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 08:51:38 +0530
Subject: [PATCH ath-next v2 01/17] dt-bindings: net: wireless: Add QCN6432
 device tree binding documentation
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-mpp-bringup-v2-1-f510c33bfcf5@oss.qualcomm.com>
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
In-Reply-To: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX8F32vKk5Rhpd
 ng10MIFtZ5UFMUNER2Ym2VUH0G3Yc94YuBFeHEKVZu86OpPVQ7QX8BZZLjS5yiJfC6kYjAsSM9Z
 SYIHZfp0bOBaHI0XRH56vDFByrT66lo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX4mzNLEbCcmmV
 qW5WhrL+HsfTpkzuaX3jp7wFgxIsHcB79T/6o3sG57m1ltUeJz7lnW661HuiGIq0JOzgxhPGcCP
 XRHjdZq5LlsQjPNu2vcEXC9cxQgQz/0uld01jtaHMcrVGjwckEHOp7bmkXrQY7edcLxxkFoFPjb
 +7kgpK89pxcisf8siqcCWkaGLrwWF/wfzJS1bW4797TqqyI2P6uDjCjkUDOPnHMdAXFYPsmx0OC
 IfQ1dkn+0JVqObironoqMoMQ31kNK6OVau5SZaW+9a7pwB7Fo29crHH7sB2KyFHKMXanAXDX6SN
 iMv0mKzsmGTUmprOrSXoRBO2eXxYxsca4pXHwSlq3IpfA/C4A4WGlij7VynUsMUXrHlTCLeQd3d
 qFfIh1NlP1/QUnOsZgTU+f/2DItLM8TeEBKHHzRBU8YPDE7J5u8uDLg5ERR0gIfDLzZer//vvPm
 UGbmZTiyONqsjbX9ylA==
X-Authority-Analysis: v=2.4 cv=P4yvFSAu c=1 sm=1 tr=0 ts=6ad19852 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Zbx1xPUqErz4vskW_SEA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: zf2lFoxWripTFHSqcgLu_uxOK_tiNJ0v
X-Proofpoint-GUID: zf2lFoxWripTFHSqcgLu_uxOK_tiNJ0v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160012

Add Devicetree binding documentation for the Qualcomm QCN6432 IEEE 802.11be
wireless device.

QCN6432 is attached to the WCSS Q6 subsystem and is represented as an AHB
platform device, even though the Wi-Fi hardware interfaces over PCIe.
Document the compatible string and the resources, including the Q6 remote
processor phandle, MSI interrupts, SMEM states and memory regions.

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 .../bindings/net/wireless/qcom,qcn6432-wifi.yaml   | 149 +++++++++++++++++++++
 1 file changed, 149 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,qcn6432-wifi.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,qcn6432-wifi.yaml
new file mode 100644
index 000000000000..291d96aefc2f
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,qcn6432-wifi.yaml
@@ -0,0 +1,149 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/wireless/qcom,qcn6432-wifi.yaml#
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

