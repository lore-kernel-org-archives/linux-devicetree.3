Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83EF3DCDBA
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779369714; cv=none; b=b2hi8+dyHnFLPn56MUTs6GN4Sq4JSNyEFy7wqzpGCqcyF5S48GrO2+PuDJSf0T5XCPPsSKYRZhJoNwA8TcCcooiX077nezwC411d3KJ5ZQBxNThk08wqkcEiABWpJBact0qrEfoyE0BmIM/hwkftYJMF1mR4pjzwhqJ8xeoeb+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779369714; c=relaxed/simple;
	bh=WOS9NeC39uxBDmQsKUonAixYkMMIuJtaJNc9JoBZf8g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dFw+uRNJkdWCqCAKSsGnHiungPeFL1tQDFq+ybYpGPr8OqcotxGz5IE+DbPeCh3rdXHS8baRRWoQ3Eg70Noy9/miucPqA9PYtfU7Fbac3JuUdsGrfytikTHDsz1KL69X9+eweAU+WacqcShD4/+vhxvqBMbLA9X8AK90qpcIUGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o7VMxTf4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cyKf2pcx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o7VMxTf4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cyKf2pcx"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9AMaw1731237
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gDgmsAwXYnpFposLGCN80rVsLDgqPUCIlT960vNx4v8=; b=o7VMxTf4FH7ktOKU
	wC3DhOa9eFy3sOMF2ZgPvYfpYLYYhKhlIAvuq8ATEHfGMXeVuPKz62PxcranVWxa
	YnBP0bRCEn1Msry1vah399mOoBk5ZYC7ZOowMBiIVNaYW07Km3R7rLTQA7gLD9k9
	zMn+6KU3214UOMXuwg+nJtEU8JjX97VKdWtswt7SD/ggCXkNw04pF1/46xVMfgVT
	D/MZOO3strIGmK+NPE0md4NKnlYjKvzCMNbwFwykorr73CJXA17uZ5NxXP29RsLr
	iHirprh700rP90vtp2bStYDYKVL4W1B3ghMDgPVAsFMJsrBMSoLFoJZpRU1oc0BC
	Uhr4iA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9c7f5hr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:21:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-365ff2ab7beso6428383a91.1
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 06:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779369711; x=1779974511; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gDgmsAwXYnpFposLGCN80rVsLDgqPUCIlT960vNx4v8=;
        b=cyKf2pcx+Mlfl/3KYSOuwAKFLSpovpU5SkZPzlLSIkp0SS4fPGS7d5sqANGMSe+z9n
         4ppehRsq22z8oCj/1BScKWUr0XsFtzKMnozMC56NGPi2yWgnnRlyIYGCSi6zNEzzb+kQ
         orXOIHX98bi5JkyqKvJ3QesmN5kAvInTCBoBchJLrus/2MaWmkmAMtZaGTHTbO1noj4v
         JKixsRpbS+7oi9NqcHvU2vT/1PaFCaj6ekd2o9NnU4Fmv0Srv13fqS/cOoRhvxVFcOXU
         +71T32vwGkugsVODiATFTX4/NgJjU6vAzUdo46FqNNyTA+nH7CamaLDeqzlN5Fz5Im3D
         ihuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779369711; x=1779974511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gDgmsAwXYnpFposLGCN80rVsLDgqPUCIlT960vNx4v8=;
        b=H9fY3/CIxH6KqmiuRjo8QGk81ph6tR78mg+ML6itbouh1kKQmxLOMj388CwFNl/iS7
         i0/0c/g8CrekjMDgtpOQQP+2u/etXZrH93iKqN89VWBxtlayhvnv4Ke6bP59K7Aw6PGQ
         sygbs8Xl7opNoQRsJUyvxmAnuA047vESPpN2Lf6zwb2JOvtmPA/cRfDZaflJhNOizYhR
         MrNR3ugTC4hq47cJKNxyBUzHEHR8XwiduFpTts3E0dLrxjhN6bRz8KrtRjR+qaaunBPF
         clkeNI510xISFKMwQ5hIgpN4dC8U73U9lLPNv2cnVyk///7WiqYUVB5fvDEz974B/Usg
         cSdA==
X-Forwarded-Encrypted: i=1; AFNElJ8U9w5lPgUoWuku3oXG3T0aEizDXDnpdxMm4ntBvu8ikovB2NIPfql769euvGIoVLQAT3TrYeKgtCRA@vger.kernel.org
X-Gm-Message-State: AOJu0YxMvuKudmzDPp1L1GyWTzUav+MjIHTxgcj2Bx+U2pXTodU97ATl
	I08HfAw2cHxha4zLhMuxou1HamWJvhlPMEkqbzOv+K5GYHtIKGHINLKFiTPm564xGUCG9ufq1sb
	3dkKBHdOfSBZfF7z+uxG1+C9DXk0fXEumenF0HOSHHDaSvGyT+beq4flS0r9c/AMB
X-Gm-Gg: Acq92OEfLIJVoG7OP3YoL2288LJWs6bl2ypqfVyQIzhNua3ViYH+j1Pb4ye2slY1LjR
	7dgFggdSp+x3nMlklolK5ErxIdF76DpwggvILAkVZTpmeK7pa/9vzQa+dLqFCkKVfQ8JpIpiChn
	w1muZIZZMCPYo594YRcp07n00voEnGKmCt3c+AsxU6CNyk04TpV8nInhvlbIoRqaywVYhSdfjRW
	/8jXE3gjUveT/KZH/uHTkxR6F0dbkj6RxQlqmG+kJ3shupGIqtmSlC/KDXxQmYUPFnok7ptZ7KV
	T8F0TnobzsrOrIZ+p3pPjSpLH/8eG3XgPUVafNsOfOqdeyoMocP3YhHsQK0vN07wWNi+R1wpIj2
	d799uSeGvg8R/gxZTiwLy3uJ576yE1NEYjlsC
X-Received: by 2002:a17:90b:5209:b0:369:277b:38de with SMTP id 98e67ed59e1d1-36a47ad959amr2528188a91.18.1779369710633;
        Thu, 21 May 2026 06:21:50 -0700 (PDT)
X-Received: by 2002:a17:90b:5209:b0:369:277b:38de with SMTP id 98e67ed59e1d1-36a47ad959amr2528149a91.18.1779369710107;
        Thu, 21 May 2026 06:21:50 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a3d1e9300sm2927797a91.13.2026.05.21.06.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:21:49 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:51:37 +0530
Subject: [PATCH v3 1/2] dt-bindings: remoteproc: qcom,shikra-pas: Document
 Shikra PAS remoteprocs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-shikra-rproc-v3-1-2fca0bbe1ad7@oss.qualcomm.com>
References: <20260521-shikra-rproc-v3-0-2fca0bbe1ad7@oss.qualcomm.com>
In-Reply-To: <20260521-shikra-rproc-v3-0-2fca0bbe1ad7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779369701; l=5517;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=WOS9NeC39uxBDmQsKUonAixYkMMIuJtaJNc9JoBZf8g=;
 b=s1Db3ywribOPFOGL48RLiERZSRJR9jr7SZgvy+nA029u/cPTYD5/xUAMSnvPjki8sPrsg8PT3
 hjBATZpXr+cCrRXRgnTSJ/3jujwrSe6TEb0eYrCSU28T+LOONjO32OF
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a0f06ef cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=3mtr4TzY_RZMnomRqisA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 3rVOmuAEui5XkWWW8PT9gsk00o8UPCnE
X-Proofpoint-ORIG-GUID: 3rVOmuAEui5XkWWW8PT9gsk00o8UPCnE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzNCBTYWx0ZWRfX/0bPlOgQhi2z
 P8UVrOJeWB1ex/SSIzDnFxjzc8nE1IDVUGjwuIVPWsu+8FnB2AP3NdPEmZThK5O9FNH18sqV0xn
 8i1EMmYE0fr9fJaiWi56uq8AMbDkkeAjGQtfy1mS2E5C2uS0OGzmPjI07+qbRT9aQLvrBPoM/Ix
 7U9vEewAZ/NOFkGEoDW57Or6fDymvcTEBXll1vZyyCOSvu3Pc7e+wGcVOW/Wke2waVBgaZfN48K
 ovlh7VKsbvjGFb8fe3bMfHHciVsRFO5iisk3yBbRlzdZNrqaLiljiP5uE9mgGrcwY3HnAh66PQO
 ADCls2UcRiMdbU3H0ArIF80kHC6pkJ2+gaCre5GB+kHnPcfX5umRpr8cNmYrULnbKU6dlLkQ0B9
 uIrkK2YTylDj4NgoqrTaa38f5l9NhGwIOzOSeWtGzUV/ExneKbqddM7bT3j1W6vqwb15VnChbMO
 frvDR+WX1Bh61gEdPbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210134

Document the bindings for the CDSP, LPAICP and MPSS PAS on
the Shikra SoC.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,shikra-pas.yaml       | 167 +++++++++++++++++++++
 1 file changed, 167 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
new file mode 100644
index 000000000000..253b14eb2b59
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
@@ -0,0 +1,167 @@
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
+        items:
+          - description: Phandle to the Shared Memory Point 2 Point device
+              handling the communication with a remote processor
+          - description: Single bit index to toggle in the value sent to
+              the remote processor
+            maximum: 32
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
+        power-domains: false
+        power-domain-names: false
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
+        firmware-name = "qcom/shikra/cdsp.mbn";
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

