Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873A435200B
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 14:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779287900; cv=none; b=QtDYFtIyx510puAATcB8xIFw8yM7wBsu43DC63AmjkiIuuYmYlBWNTio2UpBoSpMLTJrCsHf4pAibxHRX3qM9iYgauCYphXajCzqzb+yNmTgcpTHvPqjYVm0eSIjO6+rvYFmA36sprH/6gI+yofhrPlQ+DEYq18XZkomvO0/S4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779287900; c=relaxed/simple;
	bh=EGM9jvLWLNGeQvHKK9ztbADqFJh7+FqdmpPCclQmMXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S2N9/TmqvA+KwKGFaEbJ/7MgRy1TGeQKohVg03LC9q/5viZuyuMQiJwqPt/26wxFYl9iHvyvU4p6qM7e7e7X8F/UXDJt8BSsrtVuVZItQLXQt/QqREo5WbaJD0ESrUI1Vty6odPPT9+qnXPmNzVRshcQad/Q3OQtToZ1zA07FsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BgCxv1rN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kSxw9xgt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BgCxv1rN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kSxw9xgt"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9oMja1177868
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 14:38:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5ZKCu+AXC9KWnypjLBANGuqc2jfUvzBKHQUUKqDNOGQ=; b=BgCxv1rNlLNI7E5c
	6P/Zni150XgBWVtJZtdLxwwgARejEnoCvmChQWBUIo4WSMWOkYeXFYh7WvSUwjAa
	NcMIFhXPEK8tVOc/0MxPbzQLuohUnepbNYLmMTQ02p1l5gZlItNyJEws0KDmpU7M
	g6CG0ZtqMWeDuBFTpzpKeQXVD75w5cFb6QhC8rD7GCJqY0LgFnSmpGcWDu42WtRy
	sbVdHBQfDuGzImbrOFIkfW4TrKohwHprttwerqp5KqhUMbG3jBuPB1KO/Vrr2Uig
	zqMTSJs4BJcTTN/Zqk9w+h+ta8zhHClpE4oPkdsTzkETzdfuV2XV0+lrmZpaLCdX
	PoPpYg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ap6s1k2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 14:38:18 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bd6aeb3637so121621235ad.2
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 07:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779287898; x=1779892698; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ZKCu+AXC9KWnypjLBANGuqc2jfUvzBKHQUUKqDNOGQ=;
        b=kSxw9xgtCxQgsUrZmbLyVygIxtauJXYSYFEOiESp+LH+Ac+xuAoaDc4hKF7WjI2/C4
         7w+7MVbFwzM99/dBY6IPSUu+dQDmpeq5+Lt2aU9EVUxk7GOsLnGEQ/LwlyDq319QUMGB
         9mQa43yZc5J430dASWnRr6Z9/FJA8KKtB0Zt71ualJQk/J3BAp7gi6rZStXuQr4HHKV/
         US/xVOFuOv0LhsUeYKgJunSeL8x+x8MXJHJNEl10B1kJfINI29EzSOkWTcHpfIJh/1kk
         o7mXXqqBVfwWsLoSHGtrxg/9ZsZnNURDj7mkHiU6vtBhBOJBVKmc/lL9jRNEIjZuTvd6
         BenQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779287898; x=1779892698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5ZKCu+AXC9KWnypjLBANGuqc2jfUvzBKHQUUKqDNOGQ=;
        b=l6iD9hriagKLy8JShm8DSWJuiODo3K7Mbu9doH1nM8Ioh4NX6Uo91kXrjwvUI+elmO
         v1w1nNgOD4z6fiBHyOa4xpcLcy3eiQPNbkTqlybc7X4PMoIzD7VManrJfRwTtblfzo/x
         L7E7ws/IFQn66Z1CypISSawjN5nRl1S7LBlRiRZ9vT/ExAVMPEjLrtOFvXjUkw74kBea
         oM9FqNB+OlxMc+vJktwTudItgLGg9vZ6WOLf2l9VPYOC0fja5vGZhcxP6ZdKy1bqb2jL
         Y5/L/zlrm/dc7KAJAPtU6aAgKvAmfyiZhIreq0ksqcCcuZg36wfWorEC576KAyggpv3l
         XEeQ==
X-Forwarded-Encrypted: i=1; AFNElJ8AOhV/HpaZ42wmVVFRQ8s9yYVnvRxdGUSztRPGpfxtoDVHtxtrGTiIzVYLjF3MM0zOm9iayd15Ymqy@vger.kernel.org
X-Gm-Message-State: AOJu0YyEWATftEVEH0AXSGkhT96TX1SIBUBkaLVXQ5sL91EUkIUE87tW
	EFQ7kxvfCoC363O2ksMa/GS/+58OJwclXI4g2meeBgRzIn2VtJ8/O3cZXzI/gSm4dwXYuYRiAOg
	vuWus5GcJ2pipEIpjRsd9JSH63yLHB4261znBn7vgAmjboRhLZNt/ygdg2iKs0MsY
X-Gm-Gg: Acq92OGqb+OBDq7MiS/bQGTP8B2EIzvN9/bSIQyPgQsT/Y/A3u/W1gS/wk7zu2CJ9wz
	u0C4FLsmPfs0hFMV6sLdWaREns+jpWj+uSIUFStTmKp38/LF2h06XLc04N+1wdnQob6DSLZNfAT
	0VwZuuDSe4VmgaNYN69EJWU2ipYui6s3d4iWbyByG65VEqJRxy7/9WY7kjVK5bNSJczgmOUIeFA
	2AmFIEGG2Q7Iwi40IxT9zMeCntdxMFaeAf46QUb0i5mqdGaON2GM9RbTVlKnKMixBueEhsy/i1X
	ZwgrqzUV6cy7PEH6btZD9U9f0jE8k77ATwiKY5V02AeE5sClTWvqpZIpKYmt2InKPhNBsu/XPG5
	wME/I4vabhBEjzdJXh03oF/8bp32IflruQ4pz
X-Received: by 2002:a17:902:b597:b0:2bc:f38f:15ad with SMTP id d9443c01a7336-2bd7e8f09dbmr180303015ad.38.1779287898027;
        Wed, 20 May 2026 07:38:18 -0700 (PDT)
X-Received: by 2002:a17:902:b597:b0:2bc:f38f:15ad with SMTP id d9443c01a7336-2bd7e8f09dbmr180302725ad.38.1779287897553;
        Wed, 20 May 2026 07:38:17 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5fc60sm232999015ad.9.2026.05.20.07.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:38:17 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Wed, 20 May 2026 20:08:05 +0530
Subject: [PATCH v2 1/2] dt-bindings: remoteproc: qcom,shikra-pas: Document
 Shikra PAS remoteprocs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-shikra-rproc-v2-1-583a2e413a3a@oss.qualcomm.com>
References: <20260520-shikra-rproc-v2-0-583a2e413a3a@oss.qualcomm.com>
In-Reply-To: <20260520-shikra-rproc-v2-0-583a2e413a3a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779287888; l=5098;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=EGM9jvLWLNGeQvHKK9ztbADqFJh7+FqdmpPCclQmMXQ=;
 b=w0rJb+4BXU4R97Dbnv5FHtnhIASBcYfiTqfalTddb2DgnNB/CBYiOuvSGMNw2zFk10xzzG3XO
 5o20/N/Qa5KDD19MLOE3RaCUV/TFBTnim3CpLMG2DeTISRRpUZwUvnr
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: D83zWK7W_hVrefQTLURpBoVaaU-siq4_
X-Proofpoint-ORIG-GUID: D83zWK7W_hVrefQTLURpBoVaaU-siq4_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0MiBTYWx0ZWRfX1PFbwYh5jMIX
 IbzEcIXaJ1e8n3aWIs5eBF3AeDdZsRgcoFm7JDXa+O+sdaDOh3CSDOl203AiuaSovJ2d+lYXEE3
 sSlsCT54iJbLFfZ1GbBOiuJlIvMo+6+JGgVRHROVpR1Z9fQ9+xc1CAU2xvteDO9xTAQvcdLs1jw
 ozWkrh22gSfI6/7xMCN2LXbAcOrkpaDDroHpiSwMKc3+4UqODaxPwgmKBMJsRUprStYhJIJdlnY
 871I/vUQMc9l20dvecq2mqcmtsDnl8t15VMYB/4/7Db2rqbtvhd1UOC061BewdXMeV8NViNBduo
 4WB2wLQGHhbmXGceuwoPZcej1xQDTM23hLCFPU200yb9e77kWJmdq6r9vCProWODB/vEGuiyYUM
 EniSxMl+/AN2bhgBnSdy14AN3iw0mArKjmAk8n2XpwGB+YrYjRF/5pDK4eAN29Gn7yZMohnrBY2
 fs3NkYyELiymQgIOP9w==
X-Authority-Analysis: v=2.4 cv=FesHAp+6 c=1 sm=1 tr=0 ts=6a0dc75a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=S-WjIMExaCF90Us_d_cA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200142

Document the bindings for the CDSP, LPAICP and MPSS PAS on
the Shikra SoC.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,shikra-pas.yaml       | 157 +++++++++++++++++++++
 1 file changed, 157 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
new file mode 100644
index 000000000000..f0b9e04d8462
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
@@ -0,0 +1,157 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,shikra-pas.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Shikra SoC Peripheral Authentication Service
+
+maintainers:
+  - Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
+  - Komal Bajaj <komal.bajaj@oss.qualcomm.com>
+
+description:
+  Qualcomm Shikra SoC Peripheral Authentication Service loads and boots
+  firmware on the Qualcomm DSP Hexagon cores.
+
+properties:
+  compatible:
+    enum:
+      - qcom,shikra-cdsp-pas
+      - qcom,shikra-lpaicp-pas
+      - qcom,shikra-mpss-pas
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
+  memory-region:
+    minItems: 1
+    maxItems: 2
+
+  smd-edge: false
+
+  firmware-name:
+    minItems: 1
+    items:
+      - description: Firmware name of the Hexagon core
+      - description: Firmware name of the Hexagon Devicetree
+
+  glink-edge:
+    $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
+    description:
+      Qualcomm G-Link subnode which represents communication edge, channels
+      and devices related to the remoteproc core.
+    unevaluatedProperties: false
+
+  qcom,smem-states:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: States used by the AP to signal the Hexagon core
+    items:
+      - description: Stop the remote processor
+
+  qcom,smem-state-names:
+    description: The names of the state bits used for SMP2P output
+    items:
+      - const: stop
+
+required:
+  - compatible
+  - reg
+  - memory-region
+
+allOf:
+  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,shikra-cdsp-pas
+            - qcom,shikra-mpss-pas
+    then:
+      properties:
+        interrupts:
+          minItems: 6
+        interrupt-names:
+          minItems: 6
+        memory-region:
+          maxItems: 1
+        firmware-name:
+          maxItems: 1
+        power-domains:
+          items:
+            - description: CX power domain
+        power-domain-names:
+          items:
+            - const: cx
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,shikra-lpaicp-pas
+    then:
+      properties:
+        interrupts:
+          maxItems: 5
+        interrupt-names:
+          maxItems: 5
+        memory-region:
+          minItems: 2
+        firmware-name:
+          minItems: 2
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
+    #include <dt-bindings/interconnect/qcom,shikra.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    remoteproc@b300000 {
+        compatible = "qcom,shikra-cdsp-pas";
+        reg = <0x0b300000 0x100000>;
+
+        interrupts-extended = <&intc GIC_SPI 265 IRQ_TYPE_EDGE_RISING>,
+                              <&cdsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+                              <&cdsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+                              <&cdsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+                              <&cdsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+                              <&cdsp_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "wdog", "fatal", "ready",
+                          "handover", "stop-ack", "shutdown-ack";
+
+        clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
+        clock-names = "xo";
+
+        interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+                         &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+
+        power-domains = <&rpmpd RPMHPD_CX>;
+        power-domain-names = "cx";
+
+        memory-region = <&cdsp_mem>;
+
+        qcom,smem-states = <&cdsp_smp2p_out 0>;
+        qcom,smem-state-names = "stop";
+
+        glink-edge {
+            interrupts = <GIC_SPI 261 IRQ_TYPE_EDGE_RISING>;
+            mboxes = <&apcs_glb 4>;
+            qcom,remote-pid = <5>;
+            label = "cdsp";
+        };
+    };

-- 
2.34.1

