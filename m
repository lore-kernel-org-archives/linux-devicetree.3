Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A12D3A7F61
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783930331; cv=none; b=S/+/Ymn6ufYjUBA1eZ2yOAMKfuK9W6ebwlKmG+GBRxvO94QsOkDkLFh8wXBRL0HZB2kMfRJ2AIxjhaASGjJ/Prttu1QYz29oOpyAr87w7qsNEozUTmuVB8MQuqWTcxV/ZWKwt26Hg8LG4XOpV3ViPdeMaXuyIrGH0GTkifXGeOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783930331; c=relaxed/simple;
	bh=gAwrYaW8vCsSAnNCmcchp0PHhs5DGs2/EkBdFCJYnAc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jbx57Pfr31q1igOUia1GQK3mBIACX3KbFOOJ0/+uwurvnswhQnKwPWJReEhEcxl/cbo5Y0b3G5MLAF3tTkL174CEUmEiZKp7KKvJANUJsDsD8c5Z+htG1RMElIArO6Lp1Ltr60HcLhuuyZ9cFtkb39xSRI1TK8zPxuTuVFbkkLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CO9nszE6; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CO9nszE6"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38dcbade417so1220316a91.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 01:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783930329; x=1784535129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eO0942WY587PlgQYOqbKcvLrhgs/k5YOSOmJGEVN3qc=;
        b=CO9nszE64xhN8Ol1AA4n8cbGm7Pi/b0YrPWkTiAE0Xc0NGtf8ytpwHt0mSXbaqqpJL
         6ja6Ptb3WOjo4doFxOmqFc/R7Ezo3YRiTOmDy93hALFQm6d+HD9ykbpe57AavahXbuq6
         /kIhN1KSLDAW1jPbNQStscH2qKaC8orae0yoAGW5FdxPLalAma8qyhpLGG2KyjVyH4Yl
         gfn81xLlTeMpCqqz7JeYTtUDrby4zQrjD8HzvyK8FJYAPjwjdjLOhl0KUgtyaVECq9SW
         WmzrunXJosjfHwEn6JyRj9pteKboBdp5KRzyil6X7KavJ9CqWEkoO2HZ4HcExdVjzjqF
         UJuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783930329; x=1784535129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eO0942WY587PlgQYOqbKcvLrhgs/k5YOSOmJGEVN3qc=;
        b=dB8XvXUCYohQf4bIO39BptEuzZHkLmyQr0vFL5z+cQDoppYCGeaGh+T6goBdlPgNNF
         fldPK8/e2z8SDeacfFEjoR6UrdrOLNu6onsCay1LA3knyAJFRgVwH1qSPDlhROdK4Tw/
         OwQM/ai7XAc8Cw+JKViVwHdu6FW32HIUVwhmu99vhScG7NC4mrdlSG3NVujKEd6v4SIC
         WE2/cUcggpMBOp01vlv8lwFJ8F+rB9Mxiy85X/jO8e1gL+MRPCa1JLXD2YglXtdrHnWn
         wcu5p1MBK+FYagdHzYoeb8x89JEDJM2CgmLjED4Epb3vjSm10MQyHXEEE3Kj0fcQ6S8P
         DR7A==
X-Forwarded-Encrypted: i=1; AHgh+RqQgVGyuaklBXGHyPccxH22fBPu9KKn7DrjoR5fD2zPcd3TAF2uaK7FFo3rbxSzoe7J7RYsgOKAgMEz@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu2mvAoR3kVrv+48yRePqhm262mg0rupEypfdA8JZ7CJesK8fz
	1Igptmi2pYYmTqVGm+cndBuUoIDThNuRI3z/QiMMhbbVsfjFMwot2VOM
X-Gm-Gg: AfdE7cnsmYRf9FzTD1qN/vV+3u0RlhY5/l6CR+b99blBrX/YFlMmOpVpcicdL+9vgEe
	1TOhMw4MnBAMMjk/2tGQ2l2Aowb9nRe5UEQFFAHA2LIIwlwNaL8sBCHalZPXpEAKkyQ1I6SaVSN
	qlX3cv3d0YS85VJQKsZpCN+3VGwPeePB3conVQAQaa4DhuosVoyA178l3wPq/wIrz6pxUi9e9xh
	QpIM2YkP/Dgm7WnYcnGziOOi8oXFXB8Dry5Oza/auZZhKiv6/EBJs/T2MBIjzUihAKSAspDjHuC
	vf+JJ7IJS0n8Eblg1WY8TIzKJol4son5opoAPSf1QdzPIU8K1zqsho4CdTS3zP80KbpMTBdhhBc
	X029/BwfBRoBqE/p64QEOdG4JipLfGxk+H/Wji0vgoGbFigzG4fU0vR1lBqU/4RpJgjnlfufenu
	EbfoufklgshAowYnxqN2g5ePdviGFegLNxaiFqp/mWRT9Ux4Rg2x3vCX9cVFypZHrADlRyt7ucH
	LM=
X-Received: by 2002:a17:90b:2f47:b0:389:8f6c:4d70 with SMTP id 98e67ed59e1d1-38dc77f74d5mr7473535a91.28.1783930329361;
        Mon, 13 Jul 2026 01:12:09 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e0e033de6sm269636a91.13.2026.07.13.01.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 01:12:08 -0700 (PDT)
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
Subject: [PATCH v2 1/2] dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
Date: Mon, 13 Jul 2026 16:11:26 +0800
Message-Id: <20260713081127.115197-2-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260713081127.115197-1-cwweng.linux@gmail.com>
References: <20260713081127.115197-1-cwweng.linux@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chi-Wen Weng <cwweng@nuvoton.com>

Add devicetree binding for the Enhanced ADC controller found on
Nuvoton MA35D1 SoCs.

The controller has one register region, up to four end-of-conversion
interrupts, one functional clock, and an optional reset line. The
binding also describes the optional external reference supply and the
optional DMA request supported by the hardware.

ADC input pins are described using standard channel child nodes. The
external ADC input channels are 0 to 7. Differential inputs are described
with diff-channels and are limited to the fixed hardware pairs.

Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
---
 .../bindings/iio/adc/nuvoton,ma35d1-eadc.yaml | 163 ++++++++++++++++++
 1 file changed, 163 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
new file mode 100644
index 000000000000..1be5470643d1
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
@@ -0,0 +1,163 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/nuvoton,ma35d1-eadc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 Enhanced Analog to Digital Converter
+
+maintainers:
+  - Chi-Wen Weng <cwweng@nuvoton.com>
+
+description:
+  The Nuvoton MA35D1 Enhanced Analog to Digital Converter is a 12-bit
+  ADC controller with 8 external input channels, 4 fixed differential
+  input pairs and 1 internal VBAT input. Board wired ADC inputs are
+  described using channel child nodes.
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-eadc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    maxItems: 4
+    items:
+      - description: ADINT0 end-of-conversion interrupt
+      - description: ADINT1 end-of-conversion interrupt
+      - description: ADINT2 end-of-conversion interrupt
+      - description: ADINT3 end-of-conversion interrupt
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  vref-supply:
+    description:
+      External reference voltage supply connected to the VREF pin. If this
+      property is omitted, the internal 1.6 V reference is used.
+
+  dmas:
+    maxItems: 1
+
+  dma-names:
+    const: rx
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
+    $ref: adc.yaml
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        maximum: 7
+
+      diff-channels: true
+
+    allOf:
+      - if:
+          properties:
+            reg:
+              const: 0
+        then:
+          properties:
+            diff-channels:
+              items:
+                - const: 0
+                - const: 4
+      - if:
+          properties:
+            reg:
+              const: 1
+        then:
+          properties:
+            diff-channels:
+              items:
+                - const: 1
+                - const: 5
+      - if:
+          properties:
+            reg:
+              const: 2
+        then:
+          properties:
+            diff-channels:
+              items:
+                - const: 2
+                - const: 6
+      - if:
+          properties:
+            reg:
+              const: 3
+        then:
+          properties:
+            diff-channels:
+              items:
+                - const: 3
+                - const: 7
+      - if:
+          properties:
+            reg:
+              enum: [4, 5, 6, 7]
+        then:
+          not:
+            required:
+              - diff-channels
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
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
+            interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&clk EADC_GATE>;
+            resets = <&reset MA35D1_RESET_EADC0>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            channel@0 {
+                reg = <0>;
+            };
+
+            channel@2 {
+                reg = <2>;
+                diff-channels = <2 6>;
+            };
+        };
+    };
+...
-- 
2.25.1

