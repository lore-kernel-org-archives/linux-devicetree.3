Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6733DAC13
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 06:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785910740; cv=none; b=uyxv4csaNw2tDTSz7lR4075td28ZvhAckd/isX5IqFkyu4oNLuMIZusYhQ/eKduZBZtIzTcKsQziEe/OMrKA2SUxn0P0h4EKsXscK8D1HyFfY8lfUvkaXpFj5hnEPn1ie1Byi5T50L6pNkZA0RYT8UyfT3JefP5QnV7c449HFBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785910740; c=relaxed/simple;
	bh=6OpzcuW/vXrBd8EEvVAzR0F/OfZ6uSTpUvNzXmgWi9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lGI4AIvwcr7uCOKhe7H4Q6CwyxSmVI0dotIHqgTNtTZSH7SB1WS7FTMcCnAEumy+773gM3YgB7PLheiOHxBvFbSQ9FiVgJNniTjropOZGoxyb5Ma7w2ESrX6nrdxS11mPfNcN8RBCiYydi9xlDE312cHJidM/NF26ybkqdPaVRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nFbKLD8J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BKwsaiKk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nFbKLD8J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BKwsaiKk"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6755ktuD1680446
	for <devicetree@vger.kernel.org>; Wed, 5 Aug 2026 06:18:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	68gUZ7LqB0jU7pBbWZu2QhSNvnpL1hcdM6zSdwGD5Nw=; b=nFbKLD8JtsOzU//C
	mVjBAr6xlf4exwHvm5Hqyq6k+PF36kqkwkitUtfu6mM00FlJayAVTy1qKQSOS375
	OobAQ1R8rwHwi3lwmaG8YsiM4K7WQ9nKtfMUNog4Ju/dD8aQ7XWHn4LBG7eG9eyY
	Qg/jhOnxmCvrsy4jEHGRWZc/PLyFe8g7+QNL/J8lN4SewkjrJwrtm4o19Ghz5N+T
	z386bK+TRWjFt4m1wb7oeLYD0yqpDKuXsou3OxXOzZFrAlBNk5RThBtHAeTIMLu/
	7nXT2kIFHGmvcJTCD6jlc2u4fkso8OcXGA549hGuobcz1V0d+cosITKNAW3mx3TA
	bQJdbw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fuk9u38j7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 06:18:57 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-848474825ffso1069791b3a.0
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 23:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785910737; x=1786515537; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=68gUZ7LqB0jU7pBbWZu2QhSNvnpL1hcdM6zSdwGD5Nw=;
        b=BKwsaiKkO3VM6ludeDzi3bUlIzxB3fnOVcWo+hcdAE+N0bp+x1NQGpadclc4h08PKf
         E/IXGrput5BoSp2VxurKnI1v9eRlRT8P4JSZQnqkh/1tULTW/i0cQYR24ldx6XUr0fjw
         qPHOy1FSV6dzVaQw19FA99+Zewxl5z9nWRgaWh2rNpPIFinhpJgWueJOXhIDhkLc9wbr
         FGGJiYuVf7SUedgTs9zXYCvugQEIqV6KStF97w71hmpK6CJA3twOw3aS41vw+jdAahRZ
         JSBftoIbczrUH0Dh/FI+9R+PBn9AY9277aTr+DwzfXiXb/Gg2kvSs/7c0klbsI9Iafl9
         CluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785910737; x=1786515537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=68gUZ7LqB0jU7pBbWZu2QhSNvnpL1hcdM6zSdwGD5Nw=;
        b=qZ0XBhdMqwPJZx99xv8rOA9n7zNxQs5O/lkiPASdtIkme98TL3kaJVt6koVz8OQj3H
         +Q7iygBsYX8dCzOb8dPOxk5uch3qfnvV6FwvPeta1yET1dduRRdwng34l9rsXnhcjHFr
         fvJtsuwsd8l3U/Fy/yH+Ch2w3pLh5kggK+JCMXDGwyZDb1tPzh45Z412Ll5EmjDklNsE
         KSUmQzznaXEmdzjnRTrxPsJG4mrEWacAJr7xFZTFGMKOR8aJuK1nf/UohOblTL5pGKQl
         sSKOQGr08LCf/G22+nfii8Fq640hTXfYFPJqY8wJWkooXa46R0bAH2eo6d89dCsAEeV5
         R0cg==
X-Forwarded-Encrypted: i=1; AHgh+Rq3QkzP+QTVi6Tsyu/5qXmQ5TJA9lL/ahS8dZSRXJxt9rbeplqAGs09wBNXNztrNsibiZWurgfhAXmZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxkHLJCOdismcsVEmGOsFsmNwt4SefV76mBkkesuFzbHIviLwlI
	HegPIpoRs/KeVkdiaKRxsI+ycXJciqsZTq9Z7OtX7XbmUNR3wdmKOuagjR6gQCD4vmcXo7xoaPe
	fx7lb5JoVsXiweUQD8RpXIzSdAtdXcOUPZCifeN+7zQ7ighIxpslf50LRag7pu4+R
X-Gm-Gg: AR+sD13Xx5RaS8Bct7d/A45YgGvepg8wgNQbqLok1hb/jxw92u6W019MUdXqK2merO3
	i++mYTClhBACmDWK7g8rs/ifIbMx2b5kg0diB+tmF7JIMlaCcvd68eh5jXfBLv4VFLbtSWKxiU5
	SxUlwfe+glS+NbI0Gbbdp/MSyk1YxJefbnIizHDMWjPaJ96dovWG00GtN7JsGiX97GJJGxa6ZyB
	zvLrzPmDYryp1PcpbVUNFobDnJO03VOHlrlaYYfxrjFTnl8iDSo6ExP+111chsNCPSL4oZZPwIN
	gwk0XEliTM80UKkAI8RXfue7IkflXoAyjHHgWdJQplOOoSQEpE0LeM9ChEQp7svJUxRSklqCslb
	Diz5rdyt0bjMGk5jy0x86jsXjU2/3JDAX3q/zOFrx4g5CCtvWNw/5
X-Received: by 2002:a05:6a00:228e:b0:84e:cd14:aeba with SMTP id d2e1a72fcca58-84f2dbc9c99mr4633698b3a.6.1785910736763;
        Tue, 04 Aug 2026 23:18:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:228e:b0:84e:cd14:aeba with SMTP id d2e1a72fcca58-84f2dbc9c99mr4633646b3a.6.1785910736112;
        Tue, 04 Aug 2026 23:18:56 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f2e30d660sm487801b3a.25.2026.08.04.23.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 23:18:55 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 23:18:12 -0700
Subject: [PATCH v5 1/3] dt-bindings: input: Add Qualcomm SPMI PMIC haptics
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-qcom-spmi-haptics-v5-1-77128ebbdd2d@oss.qualcomm.com>
References: <20260804-qcom-spmi-haptics-v5-0-77128ebbdd2d@oss.qualcomm.com>
In-Reply-To: <20260804-qcom-spmi-haptics-v5-0-77128ebbdd2d@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785910733; l=6327;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=6OpzcuW/vXrBd8EEvVAzR0F/OfZ6uSTpUvNzXmgWi9w=;
 b=8wc6AploFOWoDOJBFrkhj1sMlMettjKquC61td1SGP3k3nvV3+FCfCl6njrcln/KNiluyrA44
 cOFPdVhdO2nD8cQQvZBVoDtYfAQjRGmfOgCixkWMJT4fjF2Ub4sc/gA
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Authority-Analysis: v=2.4 cv=NInlPU6g c=1 sm=1 tr=0 ts=6a72d5d1 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=bI6yuv9Qsz7HNVLwNVgA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 5xncebQlkKTKqRRN8Fdu1m8q95dHok89
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA0NyBTYWx0ZWRfX4FKHlJiAOTOJ
 vY9c/iHHWLLwi3+VBi0F7fbj5umRiaID/WbXYjsL73jLSsS83lNiuGBXIeCQQaQbk+Ik90MzzSF
 jLexIGge7d8UdjHKpVAxKfLj3oEBBr0=
X-Proofpoint-ORIG-GUID: 5xncebQlkKTKqRRN8Fdu1m8q95dHok89
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA0NyBTYWx0ZWRfX7CAltpzUM0Xg
 jyTEyjBWrQKPwTyUtLp8ghMleixMaUw5GpGHovY6rSgqdDOccfqsm9JjenWlmsXbHXMzlM5TJnV
 DOyvASO0QU8wmAMNxAEYcinzbTw0RE1HwBD1Hec8/HAR029MkIYUDFfvXJfq4rP/6xC6OVGZzUX
 xCWyx74vb+x5SY5lLW36I2EXQ59IhDD8ghJgibilvlSv/Uq9rg/VcEnlq7PsWD/ETIUP9f1Z+cl
 /OGPSpsqsHkQWHGR7wuExGoXbgmT39U+tYgAXc3lfYospAVZi4ZarwTMXmmfuRds2ZrGls0lqfp
 60ylMSlHhZ2h5Sm83HEA97n6PYHOdfAUFJKeOZPBOZTghZMQu0NXeP0rP6zFzmm579Q/PgShv/e
 z8ccvJXRBrkWyku1YUMpG1vet3B+1aEIVVHUPKXE2xyh5qILFI8fUWo6O6EbZF+oW7RE0oua03F
 CvHNfbW5KOf246hTjmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_02,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050047

Add binding document for the haptics module inside Qualcomm PMIC
PMIH0108.

Assisted-by: Claude:claude-4-8-opus
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 .../bindings/input/qcom,spmi-haptics.yaml          | 136 +++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml b/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml
new file mode 100644
index 000000000000..b1a69e9886ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml
@@ -0,0 +1,136 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/qcom,spmi-haptics.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Haptics device inside Qualcomm Technologies, Inc. PMIC
+
+maintainers:
+  - Fenglin Wu <fenglin.wu@oss.qualcomm.com>
+
+description: |
+  Certain Qualcomm PMICs integrate a haptics module, such as the HAP530_HV haptics
+  module in the PMIH0108 PMIC, which drives an LRA (Linear Resonant Actuator) with
+  an output voltage up to 10 V. Several play modes are supported in HAP530_HV:
+
+    DIRECT_PLAY: The hardware outputs sinusoidal waveforms whose period is
+      defined by qcom,lra-period-us and whose peak voltage is defined by
+      qcom,vmax-microvolt. The driving amplitude can be scaled in the range
+      [0, 255] via a single register byte.  Hardware-based LRA auto-resonance
+      tracking is enabled by default in this mode, allowing the haptics engine
+      to follow the actual resonant frequency of the LRA and update the driving
+      period accordingly to achieve stronger vibration magnitude.
+
+    FIFO: The hardware can play an arbitrary waveform composed of a sequence
+      of 8-bit samples at a configurable play rate.  Samples are pre-filled
+      into the internal FIFO memory of the haptics module and continuously
+      replenished via the FIFO-empty IRQ until all samples have been played.
+      An 8K-byte FIFO memory bank is available in the HAP530_HV haptics module,
+      shared between the FIFO and PAT_MEM play modes. The memory partition
+      between the two modes is configurable via registers, and FIFO mode always
+      uses the 1st partition starting from offset 0.
+
+    PAT_MEM: This mode is very similar to FIFO streaming mode but without the
+      data refilling capability. It is designed mainly for short, latency-critical
+      vibrations. The memory space for PAT_MEM mode must be reserved for dedicated
+      usage, and the waveform data should be preloaded and remain unchanged
+      thereafter. The haptics module can play the waveform data from the memory
+      region specified by the PAT_MEM play start address and length registers.
+
+    In either FIFO mode or PAT_MEM mode, the following play rates are supported:
+      -- 0(T_LRA): each FIFO byte drives one full sinusoidal cycle with the
+        period defined in qcom,lra-period-us.
+      -- 1/2/3(T_LRA_DIV_2/4/8): each FIFO byte drives a half/quarter/eighth
+        sinusoidal cycle with the period defined in qcom,lra-period-us.
+      -- 4/5/6(T_LRA_X_2/4/8): each FIFO byte drives 2/4/8 sinusoidal cycles
+        with the period defined in qcom,lra-period-us.
+      -- 8/9/10/11/12/13(8KHz/16KHz/24KHz/32KHz/44.1KHz/48KHz): the FIFO
+        data is treated as PCM samples and drives the output with an
+        arbitrarily shaped waveform.  This mode is typically used to define
+        custom driving waveforms for specific vibration effects such as fast
+        attack, crisp brake, etc.
+
+    The drive voltage in FIFO or PAT_MEM mode can exceed the value defined in
+    qcom,vmax-microvolt to achieve a special vibration effect, but the waveform
+    must be short enough to prevent the LRA from being damaged by operating at
+    an overvoltage.
+
+    Also, hardware-based LRA auto-resonance tracking is normally disabled in
+    FIFO or PAT_MEM mode, as these modes are intended to drive arbitrary
+    waveforms that may not follow the resonant frequency; autonomous hardware
+    resonance correction would interfere with the intended output.
+
+properties:
+  compatible:
+    items:
+      - const: qcom,pmih0108-haptics
+      - const: qcom,spmi-haptics
+
+  reg:
+    items:
+      - description: HAP_CFG module base address
+      - description: HAP_PTN module base address
+
+  reg-names:
+    items:
+      - const: cfg
+      - const: ptn
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    items:
+      - const: fifo-empty
+
+  qcom,vmax-microvolt:
+    description:
+      Maximum allowed output driving voltage in microvolts, must be a multiple
+      of 50,000 uV. This is the peak driving voltage in DIRECT_PLAY mode,
+      which outputs sinusoidal waveforms. The value should be equal to the
+      square root of 2 times the Vrms voltage of the LRA.
+    minimum: 50000
+    maximum: 10000000
+    multipleOf: 50000
+
+  qcom,lra-period-us:
+    description:
+      LRA actuator initial resonance period in microseconds
+      (1,000,000 / resonant_freq_hz).  Used to configure T_LRA-based play
+      rates and the auto-resonance zero-crossing window. It could be also used
+      as the initial period if the LRA wants to be driven off resonance.
+    minimum: 5
+    maximum: 20475
+    multipleOf: 5
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - qcom,vmax-microvolt
+  - qcom,lra-period-us
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pmic {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        haptics@f000 {
+            compatible = "qcom,pmih0108-haptics", "qcom,spmi-haptics";
+            reg = <0xf000>, <0xf100>;
+            reg-names = "cfg", "ptn";
+            interrupts = <0x7 0xf0 0x1 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "fifo-empty";
+
+            qcom,vmax-microvolt = <1300000>;
+            qcom,lra-period-us = <5880>;
+        };
+    };

-- 
2.43.0

