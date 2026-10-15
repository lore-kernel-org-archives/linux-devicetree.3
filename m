Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17FC255F2D
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 05:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792043798; cv=none; b=hDIrGq6tRPFGf1eK7saKAHTVWWkn9fuX0GzCYF55Th6BQPayWiV7lnksokbOiDgnZ6hN9J1t/BakbqVgsnbReiTG/tBC/cjhLl/y+HZ+eY08lh6S6cvodmNvfexBBZbrBesLrTSq3dMecvAdoz7swxsXw5LHZ0up0X7MTmkRzOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792043798; c=relaxed/simple;
	bh=dsSNGk/yj15Z4Dv8HFRDtI7ZdJ7nrk/2NTq9ZirqCq4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sz/LBdB4RCf0O8qexNaX4xf0WW8Q0AKttY74coBXGsZpRZo1Wtb8MbthN065VQh+QaDSfYz8kJBTJEPEyOPxE74BJd3/UqnXgNjs+QuiIyw1WvebByJZYmSfzS6K0DpmRBhiARgDBCojGSEhdvsxiQmV7H+bjSLS/TClROXwytw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IAZpxvhn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CiiywLB9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IAZpxvhn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CiiywLB9"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F3wbS21889513
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 05:56:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jFEZswRP1U8cleQbH9pnxyqJRmZmmckJo+PoUqj1wrc=; b=IAZpxvhnJmjaGeBK
	TuEU16WgL1a3FDuZF3QP3T/Tpm1XVeTs7r4xlJ6dX3N101e1Nfd5tnrPsLMLaDYk
	FSTksd5WS2gyKoo2V50ib9e/4qaOvpze6oRgpwF3LEwnEExe6PdRR6+O59cmTVMy
	dLl4PtZpStBpK5O/lkqE0YSXPK1MXL67zDBGMJvLeB09bUkyYBqPppVE+QYWkdJB
	xYuMYl1lngUPMgHmIyK7NNWJH1H5nMghdxSwkhAkL/ZgNoPVzfRkXPAfT5Ofn7/q
	yKr5YmYqrJc0jXqrXkgI8dmPrm2tzM1yCKAIKzXT/cZq3y4J+/9Opt7NxfBLluJZ
	L1ZxDg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqda0cj9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 05:56:35 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso8916177eec.0
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 22:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792043794; x=1792648594; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jFEZswRP1U8cleQbH9pnxyqJRmZmmckJo+PoUqj1wrc=;
        b=CiiywLB9Yz4/H0SePLWCAu1DD39ASYqzmfv3AkVa4yRu2RX/wPSLvpz3d7ThoJoD46
         VJMfIzlNolZXZmIwBUJieR0/nBoJi0CHcdX+t11GtTxHMy7MB2c01KB/ulCv4Ub03ocH
         GCG7FfJSWq0A5+MVepqPm3V8hyl2W4M2iP2EKgtLaN4BOJSXTHuY15cPVTBpwlCWz9hv
         xtoTpgkAzmLbfASB58Vo0r5lXt44ht9d5WaP4MU0J4r7yTedk2sMEHEDPM5wJmQUyNl8
         xtq5ZNtkkpe42tgZkUFMEz9+PDT4uSiWGymoxBUR8DmEnrupwjIRjW3XX6lhDIOEFBg+
         RM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043794; x=1792648594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jFEZswRP1U8cleQbH9pnxyqJRmZmmckJo+PoUqj1wrc=;
        b=OaVi6zREe3lAIna4bnhlrXbkS0TMWD8CEPQvy+cMsPgd5sz66lPpwa8buR0lZ9dJqH
         0EnxbCWBAEvnrZLluajncV5K5gB5XHuWkLFcTQpSdD2sf0JFoaDCpdHPnG++daPss3Uw
         n4dkhK4xnTeHp0jpWqcB6509ZIcvf02dlmsWCAR31zNH0Z+YwII1W8bU/EzZHCd5ApeV
         inNaQN1/irwtdw2heS0PRikGCsmtG6mGOH6+5Hf0Mk18J/pCTUK41+VvC5jBVTlct6y6
         NBDV02RJJbsVab3T8LOo8nHfUILaDKcdaB91/CKhgnJyN8R8r72j9/DC+jEPbbuR2LGe
         IBIA==
X-Forwarded-Encrypted: i=1; AKwUvBzl7+HvMaaOow5/niarG25uiLU6tu+eib4WTaIhZYB6SwtjFnpd+ILSo9GL2zjH/otCYHjHgCsI8lav@vger.kernel.org
X-Gm-Message-State: AFq9FYIUU/pzsVk+gq6Ck9jAmElSiXuxM+zs+eas4OwyLE3zwbTbOxyJ
	KYP3hlgijDT1WWsAg1r27xAEhE6fHnHzzoo+l3oBb0cDt1m1IxhzPydgHL1KeTpuKcewu0Gfks3
	Aerykjo3OWyp22vuUkIq2uf/LgcdnYFFTvR9iC4yZnGYll0sl66DNt5lPG5u9E0GqHthJ4y3q
X-Gm-Gg: AYBFou34SHUERRPFOH4sMciUvD87ODkVbKBwpyQDtLvNoHLnMNSBMqbGLWM/AnEfTwN
	hu7kChF5KX/ERX7TKiRzOlkClSkQ6q/GzyldnWok84vEYd/8QSfKEym6uRiA5OMZ1aGx+6ar02w
	aUMkpHzkdKCCSrx2aUtipMmPm5dKzkFuPnFRhY4I55JSs2zDPhZjjjK8vr0sChq8F8RAvQiRjRp
	UKvqIBzoOHMigfnrfpTRSuGsSVYk/gUuyg7cYHr5khqAWTMHu/qcFYd0sEOLenBbRjxN/Sq91Jl
	s4t9k2sTW14TtGvUC4jaj3FoBMPemjEtqQJkekBJM4ZnRQjuhNcpBzA2sGdA5b99ukQOX80KjMh
	X/XZf6vhM6YwyMtCSXXCkb2dOwFtBiK9EFFiBprg+ZC+kxDXHREzWe+snxDKRH2Fz6pAKcSElXa
	vEHtxQ2B87sXQ=
X-Received: by 2002:a05:693c:66ca:b0:35c:f667:8b9a with SMTP id 5a478bee46e88-35cf6678c8fmr8438020eec.6.1792043794301;
        Wed, 14 Oct 2026 22:56:34 -0700 (PDT)
X-Received: by 2002:a05:693c:66ca:b0:35c:f667:8b9a with SMTP id 5a478bee46e88-35cf6678c8fmr8437991eec.6.1792043793752;
        Wed, 14 Oct 2026 22:56:33 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c61eaa0sm64791975eec.0.2026.10.14.22.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:56:33 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:25:49 +0530
Subject: [PATCH v2 1/4] dt-bindings: remoteproc: qcom: Add Glymur OOBMSS
 PAS
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-oob-support-glymur-v2-1-715435f52dd7@oss.qualcomm.com>
References: <20261015-oob-support-glymur-v2-0-715435f52dd7@oss.qualcomm.com>
In-Reply-To: <20261015-oob-support-glymur-v2-0-715435f52dd7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792043784; l=5875;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=dsSNGk/yj15Z4Dv8HFRDtI7ZdJ7nrk/2NTq9ZirqCq4=;
 b=YgvWl6mmR6mAiSi2XBlfOkOecg7UBimiY9NtQpEnCtiVpOVvZ69xFJHuX2lyY8myQweqm/8z7
 cEUpE+UN06eBi60EDFOpldxCVIv2DSdoEm3rXMJox5HdPpGLu+7gnpS
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyMyBTYWx0ZWRfX14Bd1lwrRFYc
 c+dGYbFogfiKICZbL9t2Rx4kYyw4THpCfnRGAEkx87acM0SS5GWWij7SQRle0C7HB3CZF4GLp1d
 +8oKGm1n33vc3Uol2AwSM4ypDeQUrO4=
X-Authority-Analysis: v=2.4 cv=K9u3jCWI c=1 sm=1 tr=0 ts=6ad06b13 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=PECRw3tLk34I9mwI6-AA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: bd66yAmLuuQ5r-IrDGLAMsrLLuBsY7yU
X-Proofpoint-ORIG-GUID: bd66yAmLuuQ5r-IrDGLAMsrLLuBsY7yU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyMyBTYWx0ZWRfX2jKVlCl8V4pA
 NMEBLvs0/dQ/bM5UkfjZaoxe2gMwbsVIguGfRvSAjT0XXgC6hSIunaI6QvvubagYniWRFzfzv7F
 R/Rz+pa9xSwr3lkgceGaWBpN4XnlEtVdrRtNibwa1x15AQunu/O0EM8IZ3ulOXqWU+JZiVUjXUH
 SCwYRztPR/6dQbPKSAVNUEhAb36rXjMcG2ky1FlhFW291/15F/+KCoODgVOFR9UxGmDGj+tuO+X
 71+GMtYn24Id6uQhfDRspbqxx4q9kN24b0yQQlFZcZurUXS7JIV1Lgwg6qOKnVoT/fKipGA16d9
 nISDLj9aEnmlp9HDIrFHvYu+Zuo1EaktQi7TD8juYEvPlfvWV5aEtOBFIIRZ/R2t/ADqi0ZIaVk
 Hfo8wWlp/ZHw/+OOKKiH7CRdOtQ7UvCjbzPxRs/BBEFNzcga6vKCeBAScaDirHqLEMW0t6Z8dp1
 8cgybkNPA+/lo76sibw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150023

Document the Glymur OOBMSS PAS node with its secure GLink edge,
shared-memory signaling, firmware carveouts, and power resources.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 .../remoteproc/qcom,glymur-oobmss-pas.yaml         | 154 +++++++++++++++++++++
 1 file changed, 154 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,glymur-oobmss-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,glymur-oobmss-pas.yaml
new file mode 100644
index 000000000000..3aa96d2262f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,glymur-oobmss-pas.yaml
@@ -0,0 +1,154 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,glymur-oobmss-pas.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Glymur Out-of-Band Management Subsystem (OOBMSS) PAS
+
+maintainers:
+  - Anvesh Jain P <anvesh.p@oss.qualcomm.com>
+
+description: |
+  Qualcomm Glymur Out-of-Band Management Subsystem (OOBMSS) contains two
+  processors running Zephyr, managed together as one remoteproc instance.
+  The Out-of-Band Trusted Execution Environment (OOB-TEE) is the primary
+  processor. The OOB-Non-Secure processor is an auxiliary processor that
+  depends on the primary processor and cannot function independently.
+
+  The primary processor runs the primary image, while the auxiliary
+  processor runs the secondary image. Each processor has its own DTB.
+  The two images and their DTBs have separate PAS identifiers for
+  authentication and dedicated reserved-memory carveouts.
+
+  OOBMSS is booted by earlier-stage firmware and uses an XO clock and the
+  CX and MX power domains. Shared Memory Point-to-Point (SMP2P) provides
+  boot, shutdown, handover and ping/pong signaling, as well as fatal error
+  notifications. The subsystem exposes a secure GLink edge to the host,
+  with doorbell interrupts provided by the Inter-Processor Communication
+  Controller (IPCC).
+
+properties:
+  compatible:
+    enum:
+      - qcom,glymur-oobmss-pas
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Pong interrupt
+
+  interrupt-names:
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: pong
+
+  clocks:
+    items:
+      - description: XO clock
+
+  clock-names:
+    items:
+      - const: xo
+
+  power-domains:
+    items:
+      - description: CX power domain
+      - description: MX power domain
+
+  power-domain-names:
+    items:
+      - const: cx
+      - const: mx
+
+  memory-region:
+    items:
+      - description: Secure firmware carveout
+      - description: Secure device tree carveout
+      - description: Non-secure firmware carveout
+      - description: Non-secure device tree carveout
+
+  firmware-name:
+    items:
+      - description: Secure firmware
+      - description: Secure device tree firmware
+      - description: Non-secure firmware
+      - description: Non-secure device tree firmware
+
+  qcom,smem-states:
+    minItems: 2
+    description: States used by the AP to signal OOBMSS
+
+  qcom,smem-state-names:
+    minItems: 2
+    description: The names of the state bits used for SMP2P output
+
+required:
+  - compatible
+  - reg
+  - power-domains
+  - power-domain-names
+  - memory-region
+
+allOf:
+  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
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
+
+    remoteproc@1f000000 {
+        compatible = "qcom,glymur-oobmss-pas";
+        reg = <0x1f000000 0x30000>;
+
+        interrupts-extended = <&intc GIC_SPI 86 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_oobmss_in 0 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_oobmss_in 1 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_oobmss_in 2 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_oobmss_in 3 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_oobmss_in 9 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "wdog", "fatal", "ready", "handover", "stop-ack", "pong";
+
+        clocks = <&rpmhcc RPMH_CXO_CLK>;
+        clock-names = "xo";
+        power-domains = <&rpmhpd RPMHPD_CX>,
+                        <&rpmhpd RPMHPD_MX>;
+        power-domain-names = "cx", "mx";
+
+        memory-region = <&oob_secure_mem>, <&oobdtbqc_mem>,
+                        <&oob_nonsecure_mem>, <&oobdtboem_mem>;
+        firmware-name = "qcom/glymur/oobmss_tee.mbn",
+                        "qcom/glymur/oobmss_qc_dtb.mbn",
+                        "qcom/glymur/oobmss_ns.mbn",
+                        "qcom/glymur/oobmss_oem_dtb.mbn";
+        qcom,smem-states = <&smp2p_oobmss_out 1>,
+                           <&smp2p_oobmss_out 8>;
+        qcom,smem-state-names = "stop", "ping";
+
+        glink-edge {
+            interrupts-extended = <&ipcc 56
+                                         IPCC_MPROC_SIGNAL_GLINK_QMP
+                                         IRQ_TYPE_EDGE_RISING>;
+            mboxes = <&ipcc 56 IPCC_MPROC_SIGNAL_GLINK_QMP>;
+            label = "oobmss";
+            qcom,remote-pid = <20>;
+        };
+
+    };

-- 
2.34.1

