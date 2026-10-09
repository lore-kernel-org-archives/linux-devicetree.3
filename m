Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B36472558
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 07:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791530302; cv=none; b=oBr5eIn7hyNCL42ZWfLZ8xSgSXrBgc8rTA9xhmIoNFsdtYbEzX/xhix5fp7vWRA9Biq6eR9gr8fc7BM7Zp1oZyuYM2B0IFZiYW/8KGfowA20jmW71GXhEqLFpNF0JQ0t5/Wm99uBChFVDczOmKyKXaYnYi5yYBwzbjJVsb2l+u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791530302; c=relaxed/simple;
	bh=2I0TgLGTRUZ3RPGEsp7nurlffiIv1mKimIVCvGo7SiA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gGIh8iKsP8OSOcZuEVQC7hJo0uosQzxSBSkt0WaWNppzfR666sSkhosASWZ+k1i81mq3lPwP+jHm9eNEb5HgHG2v5MHZN01sxJH9mQHRayKv1iftu0LaBhWAj3jzhAjMUtqBh8vu206OS5XEHkaXcpL97GdZE2G8Q4UhDL+qAbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P3rxt+YE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WeQDuPQi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P3rxt+YE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WeQDuPQi"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HION564679
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 07:18:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PNBiUAh4iADHGkL8y8Bp+SPxIEi1/Ic5entnoZHLiuc=; b=P3rxt+YENe/XArr+
	8d+biPs8O0mSpJjBYHYgLWijLGulC9wAy37ZOLRfNOQAieJjMP4Hlpz2FHDTUhbe
	srg4benD4t9DHDPNY4E57rQLLKBkELEdNof+XvPUNxuaxBkGdL84ikEHED3DsG3J
	Cz2ypOcT5YZyrZ5JNQpKb+IA9aAImJ+WxLy1q0HgMnlzyMtIeU0Tyz5Pqm8AJo/G
	E6iFLGY8j1Gq2inpl2yKZwGWGqTCa+2bkREP3Fb5fCWqgJPxXJYYiqABS3/HR0dk
	lsIhDGVVNBoUfAT4PS7NqkA5W6j87lmvF+oDwVkaIA+phZGPBbkcFnFo9Q24glNo
	R+7FOA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxkabc2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 07:18:19 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-88a46301ec5so8361631b3a.3
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 00:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791530298; x=1792135098; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PNBiUAh4iADHGkL8y8Bp+SPxIEi1/Ic5entnoZHLiuc=;
        b=WeQDuPQiOWRdihaOCpZyTopu59LaEQkKyHZuKLU2KexML+2om+2E4aaB5h3RxLb7SY
         +iYw3yKpxMNBHiNBxQA4j2lDahb8oofIjbcwW0ruxZw1sJTKa6Mk1Ja51jKVXxBpUMK+
         53MZN7C+zjmEfgviY2RO7p+8fT35Q8xhbB6tkwsBn2Mxkc8mg5eb2EZ+EreAJfr1yGS9
         qNwZfwFf0woaK5xoJ9gC0uwtozgStEwf3y7cpx+1iRkrhGHW/kv2q444nGFBk1SlSrQy
         k6nTnyOqBuxJuWgmapcQ6AK4HtLxLeYK31xTcKsDwPXE6ddkPmL9NMmJvar8agavoOWl
         vDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791530298; x=1792135098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PNBiUAh4iADHGkL8y8Bp+SPxIEi1/Ic5entnoZHLiuc=;
        b=bHGqdVqfTVC0am5K8sb6QQVxWsIUgidYH9Dh9tyDUO/d/+WkIbPYaK2pKPBW4K7Mep
         XFR1YuJ3H17YNoY4zHmDcQYsZldzWSKclGdTMLp1LfoAZC4B45IL6F3mVGSZBv1FL1Qi
         phoDJnvpuelSqApXxbBzZJIYiXYiqz1/sSD894bRPcU/a8ZHlGuj8zKfjKXdIml9PHfV
         lMVg077LnYDwA04X2SkwYuyYUU92zoWgVNjFWyadA9qcohZaEHUvCt+pSwFhFLLAhLFb
         Qs8Dgty5BLux1iOwXjwRt2yJHqwfmfVSrfrrykB8hC7NtsTAX0seYjqsA2DT7CPQExIu
         4poA==
X-Forwarded-Encrypted: i=1; AKwUvBxMm0+Ais6I8wzZW59KYlXjvkTXi/wHsSqdC7ft3vBNXCnxz3nyFM5hKtxR2NNyCgfFKI/iCEVRmFai@vger.kernel.org
X-Gm-Message-State: AFuF++m9sP8TukZNLxpI+taL6UFJeOhJxTsajQioAPsO/h6VL0wTzLOV
	Fwq6oiK/a3zh6DxIzyyKfFnmirIv/jSPHZ8oCUJrzlXoqd6RC9e8YKq9w7cVdzHRCwS2zELd62o
	iAvs7gVvD07cCemGhG0xtdPN7++wQya2+d//3CSR8MGVG1Zf4VXjKh3D4g2hE15v1LfUVH8qJ
X-Gm-Gg: AYBFou36o9zh8mw6q7O1wJcN5pKPIxYxfJO/FAKDahxCgGrWtMw+6SwRghUHsxq6f+0
	eucDOzkRgccRvomejyFZiUQesfgLCq96vZZVKuaSw/AM827O/TdaGgxcZzHCzzrw9KUBs2RWdGl
	e14HDfsdMqX25CgWN1vbgK8uAsX2J205EmOvAOtRCZ1KFXbYS7Da7dAtg96lJqs6vhWZBfo9hDF
	qVe7+4AtUqU1U4g4ooaTniFJm8fuFVcqB89LdJHhUcdFv4M0Vsb4HR6joEqh1uhVvam61AJc4jF
	U3FL8biestvQJjGDfyH92daF634dSEt2hOrOsSVn7NsDSbpv26P0UF1SsnnYDoDr9TYcvHB3qgE
	FBPHVNpTxntVZ5OtpOBCHx5zcsvoYuptKTyAjvcNXWPaC7htDnByulobscffWFhl20rHnKjoKSt
	EDNfYLNY0AzSEL
X-Received: by 2002:a05:6a21:7a8b:b0:3dd:a196:53a4 with SMTP id adf61e73a8af0-3e16bf071d9mr799028637.70.1791530298282;
        Fri, 09 Oct 2026 00:18:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:7a8b:b0:3dd:a196:53a4 with SMTP id adf61e73a8af0-3e16bf071d9mr798997637.70.1791530297786;
        Fri, 09 Oct 2026 00:18:17 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e1d287sm494387a12.13.2026.10.09.00.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:18:17 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 12:47:39 +0530
Subject: [PATCH 1/4] dt-bindings: remoteproc: qcom: Add Glymur OOBMSS PAS
 binding
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-oob-support-glymur-v1-1-96cc8ffcced3@oss.qualcomm.com>
References: <20261009-oob-support-glymur-v1-0-96cc8ffcced3@oss.qualcomm.com>
In-Reply-To: <20261009-oob-support-glymur-v1-0-96cc8ffcced3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791530288; l=5959;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=2I0TgLGTRUZ3RPGEsp7nurlffiIv1mKimIVCvGo7SiA=;
 b=zqLJnNFoppsKjDsALNRYCT/gZTN4uUgF1TAPyddMSDGYOaFRmea8DWyyePLk70PcGIbZlI4n9
 7RHVM9pFdLDD55+cKufDNTK5pNB0UiI9MguXCzeL8ZbxPKRdW3gsPhw
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-GUID: f4BH0_4FWOY455jZC657Pjiwoak-Axjg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAyOCBTYWx0ZWRfX4QtdrycIHNVd
 oLyYE0bo5z9zRXGO9NJ8uRiv+jtY8bp76TVrKq+hQhvkcsmxtJ7OfBITa/hJzBFnIgunpDFYxMb
 B2osBj/BL2Nv5x/DhRsPkhgm2nH23Kk=
X-Authority-Analysis: v=2.4 cv=Cs0q4X4D c=1 sm=1 tr=0 ts=6ac8953b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=vENXqeAD1IxtdBWlekwA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAyOCBTYWx0ZWRfXy9HzWfvmYz82
 KASkNS2enQzpeJ7nufY+R11vjvkXAaFZPBoHqNYQqS/o/bBupFOCEjIg8i3AFgFkuS/8moCOM5d
 WZPBnl3XOLjDPVKLlDezHCCM0abBijdy6K7l1WSIr1VfjrvhMiMpuKf9WwLqRdVIx9Oy8IgByOU
 Xavbq5hggoLTN38UXfx9ROaaYvLTeT3yaIzFz2dMYTq6TCASL0r6PEw33gaHkebKW+vDyHDGGLG
 SJIHgOVS5FoKv+DSOakO2MlZ/q1ep0rzs7zEvFLGkY8f+QEtpyJsjm58bmdcinesVWdtTbPIBgE
 qbjzfEBBqc2Ryay2En35XxUrwC5do74ssGnSh5tBNLeDdwHhSJOTlqdgf6Ebs/c8IT7kaxABnAn
 EDTqiH+1qUJ4q9jlqQEia/bztQrPb9qSDzd3m71b35EwQNyN+0Xj35VyE1x/dI9MqZViHUDok6Y
 3pci1qE/Xd/f9uuGWBQ==
X-Proofpoint-ORIG-GUID: f4BH0_4FWOY455jZC657Pjiwoak-Axjg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090028

Document the Glymur OOBMSS PAS node with its secure GLink edge,
shared-memory signaling, firmware carveouts, and power resources.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,glymur-oob-pas.yaml   | 156 +++++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,glymur-oob-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,glymur-oob-pas.yaml
new file mode 100644
index 000000000000..bd4f397da40f
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,glymur-oob-pas.yaml
@@ -0,0 +1,156 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,glymur-oob-pas.yaml#
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
+    #define IPCC_MPROC_OOB_S 56
+    #define IPCC_MPROC_OOB   55
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
+            interrupts-extended = <&ipcc IPCC_MPROC_OOB_S
+                                         IPCC_MPROC_SIGNAL_GLINK_QMP
+                                         IRQ_TYPE_EDGE_RISING>;
+            mboxes = <&ipcc IPCC_MPROC_OOB_S IPCC_MPROC_SIGNAL_GLINK_QMP>;
+            label = "oobmss";
+            qcom,remote-pid = <20>;
+        };
+
+    };

-- 
2.34.1

