Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793330122;
	b=a5ZCOV1YZJr9AXjGFaH1rX0QJbSgz4QUvt/UtHxu8SESzX8f5RYfBDHzxypCan7thwO0
	 7jgpZ1R/VLu4LWYjzp1qhfBnCxsAc2qKc2b7lGwVGMoXQ8nBPf64QopJn7804Z6lLHuRZ
	 yC+277mFGCaVZJE+nTfXzAZC47RDAUFqC3+oJRy2NqxZZ1mi9wdGXNiub1Eqqh6GFMK/+
	 AV7X2LYbEIl339vPyIzZaPfBTjUMmYnNS30le0a72U4ejAxVM0kq+9oEv8bc1VYT/byTI
	 P/mp6DbOguJjg9s82vE6bS7tw/dgNBHttrwbGoVoMDdLOMiU/gzlcSHiJ9DsNjUTGeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793330122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=641clQSedyAr6js8nLvcdTQj43W5pE3bK82vlQ2g1uE=;
	b=OEeca6vcnRn4MhnQj3skoDf56Kp0fsUXoozp2N5PXZOrtltY7D3Zy7QG5mSngkedE7NW
	 TMsnc2YNH0TWXK+HTc9+hReOwfgIEC+pj/mr7fvccqmNxYX3MsCI/NqjUXti30al3hsJb
	 ZxoRuI05lCL9tkRdzRtgTCJhnqz6JIuy53FxmQoqqgfkkO17wcmer/9ny0zy5K4t9CtBV
	 mBsccTM47tPgexkFZR/N037gKhkdjnzpBx2/MPP8QE79aVf62iQx5P7rGkbhK3bwQcuZ/
	 5ATpsbp42yHGHhvyM6p+Y2uKsRp3YBIYGJA4Ie6uJ3u9dqB6lD/QNFs6hF9A68VZ1hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xL15a6kr;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA97606A31C
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 03:15:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FA97606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xL15a6kr
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-89f639ba307so64576b3a.3
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 20:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793330121; x=1793934921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=641clQSedyAr6js8nLvcdTQj43W5pE3bK82vlQ2g1uE=;
        b=xL15a6krLbvCIT3U780ddPNT/ABi/CHbzO4KAdxU+oWODPgfF+RSafxBFSFecVv03C
         IiEwsF6sBwt1HKB5MvUrf+774NwZr9SDQrV2aJl30mEY9crjEOFseF5mVH0BDrTSUkok
         cpsnvVpbJFIPq0lBm41MfSkxi3CvTzJob+Amul7M1Awlpfrji+FMn9hadX/QC+fk5OEe
         172Z24qyCQ4qZ5J63VH5he9Iby18fIu65z6f8JY1L2McBX2H+q114vF8o9hUt5yWCcdr
         oFp7OPGCH9Am/zCYjWREqephIMlNGLxSkAHMcW0T0XHVlaKQKedQH6NayNEjGrnmr9it
         MJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793330121; x=1793934921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=641clQSedyAr6js8nLvcdTQj43W5pE3bK82vlQ2g1uE=;
        b=oK/a1/TSfIRJg0fY2oSWQ3cs2rRMulxpX+heNcwW/W6Eff0GjThGo73gFzL6yQkXnG
         rJ3kpc1UMao0Ic6Xiof/BWvS93CBH8/vF2wMjZ/wJ1wfHxFuQ6YkP0imFoMw/UMVf6kf
         7UCkI8//K2P2la2w9393ODK/I4Rk3qqMwMriP6WCWLxI81jldFboxg0Yl9xzfcMtd3bx
         Hviim8dhs1HcoKQtU1GveWiO0WF83CAcAqtjMpgdsPwS1IcLdqMqu5z0T9WwSqi5aUin
         ihoprSThq8IxKH4kAjX2/xVwIg6Ito9rphY1AFhhcz89Vl7JDk3Vksvttd3pPN4vXj99
         b+wg==
X-Forwarded-Encrypted: i=1; AKwUvBzDTE59XmDgitV52mYxOe7JMHv0vMj+vq2NkzwekZ99dlso9oubVa7T87WufMZvSysdLoS7DMmQzZnQ@vger.kernel.org
X-Gm-Message-State: AFq9FYI6mUfJyRp312k4racDLMw8b8A5cctKnUfboS6KoV+1W/SmD3y/
	V+XVXEcb5W4WF0cjQ6/Ukz95aQHuxWk5pMwQuuMBXsDTlNY5L2uIukkF
X-Gm-Gg: AYBFou25uHsYh9hEZS4UOecemQqGL84X59EtS5YXdbkSYhKMnCELyEXxPIb4Fy9xcZq
	T2iseU+tssUszuYK2GOvhR1nfEtRylcsDNjKvRPKgPbeC5efWS6hUplW0zS05mIo0oKAb4BB48t
	0oHHe9/N7z6mFiVhA/dmH3E8FtSP3XFubsHC6xXAWrM/6nFVqA5KmlmC/tvA/SHdxIZSp8kOmuI
	9RLJzsLYRkwjS6tiTEY6frLhu2xDH3FFakIB8w+vAwthAY4kFo7fdoG0VesyCpiCkRzKXcEQpSP
	czA77ShDvGLG61KWy0+0j5+faT7zlUNCdORmW6cNaqaJMfViEAOgpcFhYE/mKgnhpFV0+jh1xeM
	qaiIrYyqItGzokPJfgV9r8YcHdRqyT4KMZHrWAdBoQrK9Jn/WQYhBY/kUApCZ2ahI/6WL0I/CSM
	NKX3R0lmXP0IoBrxVAxvlcvVyKR7QO/ncPSHvKCO7t4USkgkoto4Wz4zdp1OGOIWlCE5SDViksY
	Pxy1RnSCPmCf8HgCrynzG8DRY+Ogu74b+4UGn39FnkRoYV8HvtkJm7wweSZL1YpJz8EWhI0v67p
	1dOS5S0azei34LfEpMk3DjOPg5XfJVqiZvhqvDHqIeDlfKF9wr4uGRE4aD7fpkv5csrIh3lyGaX
	ktkaFsO79gIPJ/sU=
X-Received: by 2002:a17:90b:1a8f:b0:3ad:eb38:9778 with SMTP id 98e67ed59e1d1-3ae897994dcmr757560a91.48.1793330120801;
        Thu, 29 Oct 2026 20:15:20 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e2a703esm6590630a91.0.2026.10.29.20.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 20:15:20 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH v3 1/2] dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
Date: Fri, 30 Oct 2026 11:15:00 +0800
Message-Id: <20261030031501.130290-2-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261030031501.130290-1-cwweng.linux@gmail.com>
References: <20261030031501.130290-1-cwweng.linux@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chi-Wen Weng <cwweng@nuvoton.com>

Add a devicetree binding for the Enhanced Analog-to-Digital Converter
(EADC) found on Nuvoton MA35D1 SoCs.

The controller provides eight external analog inputs which can be used
as single-ended channels or as four fixed differential pairs: 0-4,
1-5, 2-6 and 3-7.

Describe the four hardware interrupt outputs, ADINT0 through ADINT3.
ADINT0 through ADINT2 are associated with the corresponding conversion
interrupt flags, while ADINT3 is shared by the ADIF3 conversion
interrupt and the ADCMPF0 through ADCMPF3 result-compare interrupt
sources.

Also describe the functional clock, optional reset, optional external
reference supply and optional DMA request.

Expose the controller as an IIO channel provider through the
DT #io-channel-cells property. The cell identifies the logical EADC
channel selected by the reg value of the corresponding channel child
node.

Restrict the channel binding to features supported by the MA35D1 EADC
hardware and use the common single-channel representation for
single-ended inputs.

Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
---
 .../bindings/iio/adc/nuvoton,ma35d1-eadc.yaml | 175 ++++++++++++++++++
 1 file changed, 175 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
new file mode 100644
index 000000000000..97144a8eeb5c
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
@@ -0,0 +1,175 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/nuvoton,ma35d1-eadc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 Enhanced Analog-to-Digital Converter
+
+maintainers:
+  - Chi-Wen Weng <cwweng@nuvoton.com>
+
+description: |
+  The Nuvoton MA35D1 Enhanced Analog-to-Digital Converter (EADC) is a
+  12-bit successive approximation converter with eight external analog
+  inputs and one internally connected VBAT input.
+
+  The external inputs can be used as eight single-ended channels or as
+  four fixed differential pairs: 0-4, 1-5, 2-6 and 3-7. The internally
+  connected VBAT input is not described by a channel child node.
+
+  The controller provides four interrupt outputs, ADINT0 through ADINT3.
+  ADINT0, ADINT1 and ADINT2 are generated by the corresponding ADIF0,
+  ADIF1 and ADIF2 conversion interrupt flags. ADINT3 is shared by the
+  ADIF3 conversion interrupt flag and the ADCMPF0 through ADCMPF3 result
+  compare flags.
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-eadc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: ADINT0 conversion interrupt output generated by ADIF0
+      - description: ADINT1 conversion interrupt output generated by ADIF1
+      - description: ADINT2 conversion interrupt output generated by ADIF2
+      - description: >
+          ADINT3 shared interrupt output generated by ADIF3 or by the
+          ADCMPF0 through ADCMPF3 result compare flags
+
+  interrupt-names:
+    items:
+      - const: adint0
+      - const: adint1
+      - const: adint2
+      - const: adint3
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  vref-supply:
+    description:
+      Optional external reference voltage connected to the VREF pin. If this
+      supply is absent, the controller uses its internal 1.6 V reference.
+
+  dmas:
+    maxItems: 1
+
+  dma-names:
+    const: rx
+
+  '#io-channel-cells':
+    const: 1
+    description:
+      The cell selects the logical EADC channel identified by the reg value
+      of the corresponding channel child node.
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  '^channel@[0-7]$':
+    type: object
+    $ref: /schemas/iio/adc/adc.yaml#
+    unevaluatedProperties: false
+    description: |
+      External EADC channel description.
+
+      For a single-ended channel, single-channel specifies the external
+      analog input number (0 through 7), while reg provides the logical IIO
+      channel index.
+
+      For a differential channel, omit single-channel. The reg value selects
+      one of the four fixed hardware differential pairs: reg 0 selects 0-4,
+      reg 1 selects 1-5, reg 2 selects 2-6 and reg 3 selects 3-7.
+
+    properties:
+      reg:
+        maximum: 7
+
+      single-channel:
+        maximum: 7
+
+      # Differential pairs are fixed in hardware and are selected by reg.
+      diff-channels: false
+
+      bipolar: false
+
+      common-mode-channel: false
+
+      settling-time-us: false
+
+      oversampling-ratio: false
+
+    allOf:
+      - if:
+          not:
+            required:
+              - single-channel
+        then:
+          properties:
+            reg:
+              maximum: 3
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - '#io-channel-cells'
+  - '#address-cells'
+  - '#size-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        adc@40430000 {
+            compatible = "nuvoton,ma35d1-eadc";
+            reg = <0x0 0x40430000 0x0 0x10000>;
+            interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "adint0", "adint1", "adint2", "adint3";
+            clocks = <&clk EADC_GATE>;
+            resets = <&reset MA35D1_RESET_EADC0>;
+
+            #io-channel-cells = <1>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            channel@0 {
+                reg = <0>;
+                single-channel = <0>;
+            };
+
+            channel@1 {
+                reg = <1>;
+            };
+        };
+    };
+
+...
-- 
2.25.1

