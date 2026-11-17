Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904169;
	b=OtySxZQyCKdp4dfeyPwqVeNxJBSarhIy2TX7gdNJkBDuKuaMwD49dWQVQOeyVX3KwIro
	 4STwYokJrQMUfeNnb1Nf2LMaGvgCqwQlGhO4dwJGzjbMD5HjV0AgxpBJsmQ42ZeP7VKkR
	 bvJyzdkwPn66nzYAP/TBGLKL/0COlDWdkEIuxYDEjX/x0yTIY7xsYfdBb3HL+gwWN/uAw
	 HqJ/gl3ZuhqEZQjuu6/15aKtLK06/qLz4gVJsH58UzBJy4Ehr360BnqgLNRbCHJxO6yea
	 +mmnCkXOnFeYSj00Nwwdp6Xal5gp7AnHFlb0/VdefhhdVAbRtQxm6FQcEt/mOHAnTdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904169;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ip7WW9LYq2XaFn3cz3EajUZgkrneTRdDmQiuR96TXKk=;
	b=XSEUO2v4evCAlrMY41sKkJ+advBFSNgRTY0WkV6FgFz3/6TGmLxnr2d3cmuR0khG98/t
	 LJIGTu38OBWPsz1YiEtc4I8bmOYLSOsvooLOzpoGZB7+1zPnXioj8R5Co2SpWJ75GZ8mC
	 qKaqlB8ApN1sUtZmA0Tg0WlrdV20YRGdjMTpPWS53RIuswkX+AGKu2/VRXV7IqSMUk86u
	 89bItRa9xf+I8MWun3VvC0OsYBpBm4TrsysLx9IFk4MmUtcQeBsgee2mZ5Nzmt80F6Wcw
	 ujE/5YisKuGWBE6AIx6mH8kTEQ2Kt/BNzzVPyFo+c3rXc3TNlOTkINm8QbVeAV5MCBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m9z5qMMh;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CB8606A897
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:29:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17CB8606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m9z5qMMh
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8b5a6f2f27fso1891036b3a.3
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 00:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794904166; x=1795508966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ip7WW9LYq2XaFn3cz3EajUZgkrneTRdDmQiuR96TXKk=;
        b=m9z5qMMhTCwVGbK0jltnORbane119HPk76dPICM/qyFTH57ccGkF/WJoF31FUR3RsH
         Iy5OH03dik5q+0Y1DrATfpeDLLaBMordqf3fnpfvhKhDJqfEqCpismAAVqFOkoAKpAe8
         jbvcUhFpwossrGkTj+nr6uGeqxCxOqKSmggzCkf+J1N/es4XpsPiUlzCD/7XV8HLvXDO
         gGoD5KQqiwrhVOvHRJ5FuQbWYRGqr+3h0VTmlV5ahvMaKHLk9P9c0RIMqTYuAn8ZlpyR
         8DdyVSGtsb960A/HBKtPSbLu120swOcZ4MTEEVfanV4IeMHrsd3GDJ3L+9ZEbG7lRF1X
         ECgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904166; x=1795508966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ip7WW9LYq2XaFn3cz3EajUZgkrneTRdDmQiuR96TXKk=;
        b=U9EnuZsNqUY6wgUty0IZD3KWa5vpJGQK4S+ewFF3tI1gi39qcEFra5nyMbV43woXSi
         cC8PqklKm+NUAUj8CHjsw8bbyzvm0iK0PVLP6Yqjx9tZfpqYfP2ivXSpt7cFnlx4w3ac
         oTeP6PDiFExBKPUkzTYgIhKcfHqfPbQ6m3SXg13eq+9EtUhPg4ynZOWtMaogekTHa99F
         lfziO46qnGqBqTuYL63vw7pa2Lx2Zt2AVwDgQx7mT7IcRZNC66Vm0Xdcr72So2HzQx9C
         yTXhLMNzZSk3Y2DcTNbjyQEnHoYQN9cUydpfbZSZeF8GRCJ8n5QvZ4Gt8oWmGtDrJDJl
         zAvw==
X-Forwarded-Encrypted: i=1; AL+hErHwQtl1bApuG5WMgdnMLHaIm5nZZ/i1yCuFFrBAcEXlpua/46dZeoVyfsgkMIPPai2R0LSoBrW+dTtu@vger.kernel.org
X-Gm-Message-State: APuU4Z+WoJpjn6ilh7BVC/3r4SNMczRL58wt9HC76tm28qQGoncHCqyj
	0imlWO451heK7XtdYAtesbdxLuzsJz/TFmxZAtGuFzuTGkGEza+ZuFED
X-Gm-Gg: AYBFou0Fn2AOC1vQRAFD7OmGlWB3BbFPv+xCJXu0Id8hbqRflzL6oRVN5WiPmEN+DoO
	53lPFPRxiNmmjldYIDjTEqiOs7jH32c1Wti6k/VLZP6My+5Z7uM2eG6ywcdt8Q1ZVcJAMp1xpdu
	U5ATcMoHp2FlfLR1dmIDS7nEYb5hWfjn/+zavDLRZ+3PE1MHjr8bor5WBOx7+n/8gn5vENL+rLS
	soHAvPw8Sk4LPughmmbhMXlaD1V2+NHxcR2tP5iqI42GxMXHUp4WchgfHjaUQKwVU165vRKYv4d
	5dT8sLBSgG+dgWpQG05ycK17gPD6/XnXJtxiAVj5oLEECTsCRti91xOO9BLx73CXpZRhe+Bzxbj
	7iPxT6Gh/kB1TBNAQt+kXLa29vNuXgajIugDmknypYc+qI3WskeQdUYClkTOheBWVJoYWuyL8WJ
	D7EScKF4x1HSYq8QaojPy3L3DYGhz8iaY4be2hvelg4eyCJIJpnCMXmU32sdL44Ruv5LKoj8nSF
	4kon+ysF/VV5XHKbs6qoC24oYtrOJdG5ud9xEbygXo0Akjc0mUEmCIzSSjKJlYCdfxAi9iUvCBg
	5Of2lXUMO+dKHhF6FONJTYZUZUb4y3MXvnEoUEfHt742XKjb3VgVOhVBRxQhcMgFwbqVuA3V3Xr
	My8zm28DjW3v0dLs=
X-Received: by 2002:a05:6300:6f97:b0:3f8:c147:955e with SMTP id adf61e73a8af0-3f8c1479944mr7741046637.61.1794904166400;
        Tue, 17 Nov 2026 00:29:26 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18a2191sm5422907a12.21.2026.11.17.00.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:29:25 -0800 (PST)
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
	chernyakin.victor.j@outlook.com,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH v5 2/3] dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
Date: Tue, 17 Nov 2026 16:28:31 +0800
Message-Id: <20261117082832.1551574-3-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261117082832.1551574-1-cwweng.linux@gmail.com>
References: <20261117082832.1551574-1-cwweng.linux@gmail.com>
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

Add a binding for the Enhanced Analog-to-Digital Converter found on
Nuvoton MA35D1 SoCs.

The controller provides eight external analog inputs that can be used
as single-ended inputs or as the four fixed differential pairs 0-4,
1-5, 2-6 and 3-7. The VBAT input is internally connected and needs no
devicetree description.

Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
---
 .../bindings/iio/adc/nuvoton,ma35d1-eadc.yaml | 174 ++++++++++++++++++
 1 file changed, 174 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
new file mode 100644
index 000000000000..1bf64913d67d
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
@@ -0,0 +1,174 @@
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
+description: >
+  The Nuvoton MA35D1 Enhanced Analog-to-Digital Converter (EADC) is a
+  12-bit successive approximation converter with eight external analog
+  inputs and one internally connected VBAT input.
+
+  The external inputs can be used as eight single-ended channels or as
+  four fixed differential pairs: 0-4, 1-5, 2-6 and 3-7. The VBAT input
+  needs no devicetree description.
+
+  The controller provides four interrupt outputs, ADINT0 through ADINT3.
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
+      - description: ADINT0
+      - description: ADINT1
+      - description: ADINT2
+      - description: ADINT3
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
+      supply is absent, the internal reference is used.
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
+      The cell selects the logical external EADC channel identified by the reg
+      value of the corresponding channel child node. Only channels represented
+      by child nodes are valid I/O channel specifiers.
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
+    description: >
+      External EADC channel description. The reg property identifies the
+      logical IIO channel index.
+
+      A single-ended channel may use single-channel to select an external
+      analog input independently of reg. If single-channel and diff-channels
+      are both absent, the external analog input is selected by reg.
+
+      A differential channel uses diff-channels to select one of the fixed
+      hardware input pairs: 0-4, 1-5, 2-6 or 3-7. Each single-ended input
+      and each differential input pair may be described at most once.
+
+    properties:
+      reg:
+        maximum: 7
+
+      single-channel:
+        maximum: 7
+
+      diff-channels:
+        oneOf:
+          - items:
+              - const: 0
+              - const: 4
+          - items:
+              - const: 1
+              - const: 5
+          - items:
+              - const: 2
+              - const: 6
+          - items:
+              - const: 3
+              - const: 7
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - resets
+  - '#io-channel-cells'
+  - '#address-cells'
+  - '#size-cells'
+
+anyOf:
+  - required:
+      - channel@0
+  - required:
+      - channel@1
+  - required:
+      - channel@2
+  - required:
+      - channel@3
+  - required:
+      - channel@4
+  - required:
+      - channel@5
+  - required:
+      - channel@6
+  - required:
+      - channel@7
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
+            clocks = <&clk EADC_GATE>;
+            resets = <&sys MA35D1_RESET_EADC0>;
+
+            #io-channel-cells = <1>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            channel@0 {
+                reg = <0>;
+                single-channel = <2>;
+            };
+
+            channel@1 {
+                reg = <1>;
+                diff-channels = <0 4>;
+            };
+        };
+    };
+
+...
-- 
2.25.1

