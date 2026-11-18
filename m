Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018684;
	b=jkIXoexzGC20UTO0UV5mGyIl8BBWBlZ2ccGwWoLVRdOqmt2Xw5Dv13jF821NzialET7W
	 NeyYI4vDM/t4WAHgr8hnhOBYZB9HEc+sw+8QSPaE2V+ZPBnU03jcY4lRJU7bX/e1bhQVr
	 ahmvor1FqUuEGDsJq/yI9SW4+4f/9GlKB0Fb/wYdXRdxvUGvGfMW4dr9u1YTPlw6MVZ1D
	 ZWwFLOt9U5fPudL0jpB+OYaJ6AOnfSD8Fst0r6+fgjo+LTk0XL+XKVUc5545y/hQLwnD0
	 zkI6zdwGwl7Tjl524epiYXq462jjXhKuoHxcGcLVEMBn1+DmYow+oioJ8p5G8KPXwzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018684;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=xD6Dy3y4d1wnxROTLCHN7ijMhBMBe0bu6u+PB8rbtjg=;
	b=qv003cx3aoQNOsPxH6DtnMw6GT9I/WQn6e7lDc3192NJtjx2xXRFGW876BgzkeImDT38
	 NoXd7g2Df4oK8qL4JaevE0KjvgCRmyg56Td4W8RxUXpsUQfE0KmkxI3jGnsXZN33CpPPn
	 nzMtAI0smsCeN7SHT6uzOwgjd/QFwCk+RRGPKGRep3BoB69LOeXb/r2qcYsqYWjdGvNuy
	 gqihgoeCHLc23Zoe8Dr0RiBSBzUpXTD7sH73hrunVHtDh/ltmvx9PPl2189Anaf+bUh7z
	 tXTzpu1bdTu7kiUjLiqRXER8EeEUDcfm2cpMD6NtlFT55cWRZo8UcF/F2DCmsaOTI+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=INhYelj1;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F27E606A325
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 16:18:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F27E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=INhYelj1
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-49d64a88222so1493070f8f.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795018682; x=1795623482; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xD6Dy3y4d1wnxROTLCHN7ijMhBMBe0bu6u+PB8rbtjg=;
        b=INhYelj1LEYaqGoBDCuvrrveeso60ukOgq2hTL9neUaVi+4X4/dVhfcMu0L3u8Ddwf
         pyExioSsOWNW8wX9PQIejlbwVoqC3NpuG1IwH8HYCwXcZVv+6GSKyxSHnUESrRowaS55
         QUDF+me8xb7sOQqEUPqTG/jH6doQ+HnmcvGOG2sXKCP8ThuHHVIe9L47H6hiM93o2Nws
         3Vkc0XjJQQdDYefMY17+oyAgf4hrCbqFX0iWVzHFHJwYzHl5kX5lK63dGBkkmwpmzHyX
         EsCCoPR0F0+Jhl1Fd887rNbWcaOkQtrHc/VuKaL+nGiwG4ylx5aEQIcFJk4EyCo+7gWK
         mD3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018682; x=1795623482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xD6Dy3y4d1wnxROTLCHN7ijMhBMBe0bu6u+PB8rbtjg=;
        b=g+WhyFB+o7uQStvWdgee3sHrK6vcCkR+l1kwnGQ6xLkv09QJsfwOLBppQzHCyBjLfU
         ylYSBhKIo5T+0wnB/C0gfc1AIR3BGupt0ilM1HF4BL/UK/DCmXfua9+ZdLn3QIs9keiB
         VL7ldzuxmQONJVqYSHfnF+kXu1j37mX87Zw8LnunVx4tEsIBEtqkjctFtclbLfiQB8vP
         0WFaLNm1I7w1+WJMBe3A8InW+rpiVdfVUfDb1OgPuTkf3+jWcsx62gxJChY+8TR/jEtn
         ZnAQOVn8YbMHTWhKJnJb/sVnRygqBs/9Qa2HJ3zZV99EI7ejW6f74iELW60JKjzCvG5C
         31Kg==
X-Forwarded-Encrypted: i=1; AL+hErHNNhEKWLbyLf+mvMA84kMLm8eLpGDN0OPqnDHiKutn/296LCEkRdAenIf/rDZUXXCduhhr/bs6nOy0@vger.kernel.org
X-Gm-Message-State: APuU4Z+4dweqdzEOSPl16eNEa9T25+uN+DCRh0Ahq6yI6e1H6+jyP+A6
	mKMPmuIOstQeHZFVZGLMZszynTe2gNODZXKpfOoLw0PkJty2sfkJaSab
X-Gm-Gg: AZFdTZdLIce+VK6MT+mfD42XxLhHWZ19bUILtGTxiXnzhVt0BtWD6MSMd+iAkXcSLkU
	tNs2mIQiRNnVFKZxa4PT6RiBJ+b9GHNa0NVHAbKEj7VZuTx9ZLOn0AxpMkfOyKRa87P3Ined8dC
	anZc0yRqdhwjomb6Ny9GqDiAHtmAep4K7Vfdnyc0VeMFJh9QBnyXXXaQ0iXgtJ4Bi6wRhnirGVl
	NbrM1PsYktUUFE3+xr7rkkycWKEVPn5J9spmjvEYg+ZEJMtVtVhpmmLaZ24WLRBwEkoYLUHQQs9
	VUkg3zjt5wIeGYl19aOamP17DQzzEFUvpa4tN7h7ijyAG0VrHQUJ3GeF4I164mN8bo153eCXn+8
	IY8yRWHrXgrBElracttNAPYMk+aHYeigyoXuZpMcDyEQIoKC1mhAZ376i8Imm0CEmVhPksoFp0F
	2s+J2P1EhtcZ/0LWEBucGdbQxC2IzEXp8Av0uIJVIazJZnd9abH0BQPWcWcEdP7xBalhIvVHHBk
	7UXpVtDtoleTwTNDrLKN4ZQ1ZAfNHlh13Voo40rczGasYXYOneGQk1MEeuiGguxDTREDEcS+Un+
	0iNmHLbancuUHZ4DJk65ZJeX0hjQpLCB0V4SbRw8NTPUfSJVy4XRF6zB1VlIHCHiB7AoIzjXNhr
	dfPKcvbHtNsTXV+xW/is9lHOX56+wiDnymw==
X-Received: by 2002:a05:6000:29c8:b0:4a3:c963:c1c3 with SMTP id ffacd0b85a97d-4a63937fce8mr4376849f8f.15.1795018682433;
        Wed, 18 Nov 2026 08:18:02 -0800 (PST)
Received: from [10.161.246.232] (host-164-37-100-34.net.onlyservers.com. [164.37.100.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65100bf42sm5329699f8f.1.2026.11.18.08.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:18:02 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Wed, 18 Nov 2026 19:17:36 +0300
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: mediatek: Document MT6895 pin
 controller
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-pinctrl-mt6895-v2-1-0728c4eddcac@gmail.com>
References: <20261118-pinctrl-mt6895-v2-0-0728c4eddcac@gmail.com>
In-Reply-To: <20261118-pinctrl-mt6895-v2-0-0728c4eddcac@gmail.com>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2

Add device tree bindings for the pin controller found in the MediaTek
Dimensity 8000/8100 (MT6895) SoC.

The controller has 227 GPIOs spread over a GPIO base and 13 IOCFG
blocks, and an EINT controller made of five blocks (W, E, S, N, C).

Pins with PUPD/R1/R0 or RSEL pull-ups take the raw MTK_PUPD_SET_R1R0_*
and MTK_PULL_SET_RSEL_* values in bias-pull-up and bias-pull-down.
There is no public table of the RSEL resistances for this SoC, so the
binding does not offer the ohm-based values used on MT8188 and MT8195.

Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 .../bindings/pinctrl/mediatek,mt6895-pinctrl.yaml  | 228 +++++++++++++++++++++
 1 file changed, 228 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6895-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6895-pinctrl.yaml
new file mode 100644
index 000000000000..e3ecfffc084e
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6895-pinctrl.yaml
@@ -0,0 +1,228 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/mediatek,mt6895-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6895 Pin Controller
+
+maintainers:
+  - Alexander Letuchiy <asalde.le1@gmail.com>
+
+description:
+  The MediaTek MT6895 Pin controller is used to control SoC pins.
+
+properties:
+  compatible:
+    const: mediatek,mt6895-pinctrl
+
+  reg:
+    items:
+      - description: pin controller base
+      - description: rm group IO
+      - description: rt group IO
+      - description: rmm group IO
+      - description: bl group IO
+      - description: bm group IO
+      - description: br group IO
+      - description: brr group IO
+      - description: lb group IO
+      - description: lm group IO
+      - description: rtt group IO
+      - description: tr group IO
+      - description: tl group IO
+      - description: lt group IO
+      - description: EINT controller W block
+      - description: EINT controller E block
+      - description: EINT controller S block
+      - description: EINT controller N block
+      - description: EINT controller C block
+
+  reg-names:
+    items:
+      - const: base
+      - const: rm
+      - const: rt
+      - const: rmm
+      - const: bl
+      - const: bm
+      - const: br
+      - const: brr
+      - const: lb
+      - const: lm
+      - const: rtt
+      - const: tr
+      - const: tl
+      - const: lt
+      - const: eint-w
+      - const: eint-e
+      - const: eint-s
+      - const: eint-n
+      - const: eint-c
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    description:
+      Number of cells in GPIO specifier. Since the generic GPIO binding is used,
+      the amount of cells must be specified as 2. See the below mentioned gpio
+      binding representation for description of particular cells.
+    const: 2
+
+  gpio-ranges:
+    maxItems: 1
+
+  gpio-line-names:
+    maxItems: 247
+
+  interrupts:
+    description: EINT controller interrupt
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+# PIN CONFIGURATION NODES
+patternProperties:
+  '-pins$':
+    type: object
+    additionalProperties: false
+
+    patternProperties:
+      '^pins':
+        type: object
+        allOf:
+          - $ref: /schemas/pinctrl/pincfg-node.yaml
+          - $ref: /schemas/pinctrl/pinmux-node.yaml
+        description:
+          A pinctrl node should contain at least one subnodes representing the
+          pinctrl groups available on the machine. Each subnode will list the
+          pins it needs, and how they should be configured, with regard to muxer
+          configuration, pullups, drive strength, input enable/disable and input
+          schmitt.
+
+        properties:
+          pinmux:
+            description:
+              Integer array, represents gpio pin number and mux setting.
+              Supported pin number and mux are defined as macros in
+              arch/arm64/boot/dts/mediatek/mt6895-pinfunc.h for this SoC.
+
+          drive-strength:
+            enum: [2, 4, 6, 8, 10, 12, 14, 16]
+
+          drive-strength-microamp:
+            enum: [125, 250, 500, 1000]
+
+          bias-pull-down:
+            oneOf:
+              - type: boolean
+                description: normal pull down.
+              - enum: [100, 101, 102, 103]
+                description: PUPD/R1/R0 pull down type. See MTK_PUPD_SET_R1R0_
+                  defines in dt-bindings/pinctrl/mt65xx.h.
+              - enum: [200, 201, 202, 203, 204, 205, 206, 207]
+                description: RSEL pull down type. See MTK_PULL_SET_RSEL_ defines
+                  in dt-bindings/pinctrl/mt65xx.h.
+
+          bias-pull-up:
+            oneOf:
+              - type: boolean
+                description: normal pull up.
+              - enum: [100, 101, 102, 103]
+                description: PUPD/R1/R0 pull up type. See MTK_PUPD_SET_R1R0_
+                  defines in dt-bindings/pinctrl/mt65xx.h.
+              - enum: [200, 201, 202, 203, 204, 205, 206, 207]
+                description: RSEL pull up type. See MTK_PULL_SET_RSEL_ defines
+                  in dt-bindings/pinctrl/mt65xx.h.
+
+          bias-disable: true
+
+          output-high: true
+
+          output-low: true
+
+          input-enable: true
+
+          input-disable: true
+
+          input-schmitt-enable: true
+
+          input-schmitt-disable: true
+
+        required:
+          - pinmux
+
+        additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+  - gpio-controller
+  - '#gpio-cells'
+  - gpio-ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/pinctrl/mt65xx.h>
+    #define PINMUX_GPIO0__FUNC_GPIO0 (MTK_PIN_NO(0) | 0)
+    #define PINMUX_GPIO6__FUNC_SCL0 (MTK_PIN_NO(6) | 1)
+    #define PINMUX_GPIO7__FUNC_SDA0 (MTK_PIN_NO(7) | 1)
+
+    pio: pinctrl@10005000 {
+        compatible = "mediatek,mt6895-pinctrl";
+        reg = <0x10005000 0x1000>,
+              <0x11c20000 0x1000>,
+              <0x11c30000 0x1000>,
+              <0x11c40000 0x1000>,
+              <0x11d10000 0x1000>,
+              <0x11d30000 0x1000>,
+              <0x11d40000 0x1000>,
+              <0x11d50000 0x1000>,
+              <0x11d60000 0x1000>,
+              <0x11e10000 0x1000>,
+              <0x11ea0000 0x1000>,
+              <0x11eb0000 0x1000>,
+              <0x11f20000 0x1000>,
+              <0x11f30000 0x1000>,
+              <0x11e50000 0x1000>,
+              <0x11ce0000 0x1000>,
+              <0x11de0000 0x1000>,
+              <0x11fe0000 0x1000>,
+              <0x1c01e000 0x1000>;
+        reg-names = "base", "rm", "rt", "rmm", "bl", "bm", "br",
+                    "brr", "lb", "lm", "rtt", "tr", "tl", "lt",
+                    "eint-w", "eint-e", "eint-s", "eint-n", "eint-c";
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&pio 0 0 227>;
+        interrupt-controller;
+        interrupts = <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH 0>;
+        #interrupt-cells = <2>;
+
+        gpio-pins {
+            pins {
+                pinmux = <PINMUX_GPIO0__FUNC_GPIO0>;
+                bias-pull-up;
+                drive-strength = <6>;
+            };
+        };
+
+        i2c0-pins {
+            pins-bus {
+                pinmux = <PINMUX_GPIO6__FUNC_SCL0>,
+                         <PINMUX_GPIO7__FUNC_SDA0>;
+                bias-pull-up = <MTK_PULL_SET_RSEL_111>;
+                drive-strength-microamp = <1000>;
+            };
+        };
+    };

-- 
2.56.0

