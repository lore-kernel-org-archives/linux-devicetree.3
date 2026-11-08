Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794162500;
	b=K57n59fMttI/umPriTYoxG80BxV9HvraoH+vyG6ob/GrqFiM2S26D8urUyGyrchDkCIf
	 pLWV3EnL+R8JLIlHMcXibEMqufPMTLT+6r3fJLv1NoHbKfQxjn3PUK9nJytvYLQOnEKkt
	 qjHGFuc4rgCerqJzWktFrswRL5R1PSzLLfQRF7qtF4QM8iv54B7r0cVFx0yEVZ+vSuOM/
	 aYfoUxEoL/eykZd+d9jImYmEKVq6qn2L/e6UT+Z4XP8/SqKgK1Kwqk7ML6XqnVabA2L79
	 mqmeIcb6mNXcEcuee9UAJFqseCyM6HbXqep765zPzWTqw80imDGvIcC1+7IQrMSuLdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794162500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=xD6Dy3y4d1wnxROTLCHN7ijMhBMBe0bu6u+PB8rbtjg=;
	b=FPi+Jt8Fi3J0cd6tOUTHpELKrET10vYySD9A9FhwG4G1ihug4Es5zNlT9AZhApqKDCJt
	 niHYaGkI0Yonp8f9F6Gj7ItpvZX1S4rqAHAI0mHN26dPkSF8KP6oj/VghbrSFDijR2IWh
	 SZk4pI5vGDGywFVaPZzi5vJuiZy9VrtyfKV+aNRV1MBaAiqt+5SYJyE224gbGSvvbMFHS
	 EzxaEBUAjEzwhi/5z1cAqPNI+SYFL/EhkR48oZzMj1D+MlNvD8jnsz68kcbLwEszDooVP
	 hEr0GUtvME9++3LO9s9EgH0eknEXP1OV7r8w6NjCvTJA7S3dmjo3dEb/0KcS6AhAttQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ttDKNk0J;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D637A606A336
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 18:28:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D637A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ttDKNk0J
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4322d310e7so27042266b.0
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 10:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794162498; x=1794767298; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xD6Dy3y4d1wnxROTLCHN7ijMhBMBe0bu6u+PB8rbtjg=;
        b=ttDKNk0JIjz40p5eAC2BNCurW3OhYdjX2lUfcR5EYH+/JW7CeOFl3REBKkIdtk9zKr
         RqOEXHqBxse/3VVVI/EdR3uRRLcgmcnyJXzMWquPJJ4qc7U/VhX9fTgCL1SbITMe242Q
         dV1qKGqiIVwYaUi4fqKPTtmnhkPXKgnFwi+cl2dnOqfY1DT2+IPW9mpm4XHpTAUdTRdr
         RGxMzSHZCz/CW0zC+2pQNVOqqNzjlZVreZyrxS9cJhTYkuirzQ80Nh/j9DS2LKYt7EG7
         3BKh342u1SmEXIxidbd3ptBP8mQvsGAo0uLn4AG5ap1/iXZELVbEnTTzABUGSLIRfFVi
         RWrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794162498; x=1794767298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xD6Dy3y4d1wnxROTLCHN7ijMhBMBe0bu6u+PB8rbtjg=;
        b=2Xjugl+sCqsSvfJgg2lBF4budby0SOBWp266Dm29LtTR/VBj208eTENapMwLZ62QBu
         iNrJO+Ly0fxNQbkUz2To8cVjsADHp/mjpdMjprVfn1VXEGDS4LruB0OeW7oGI1Rh3jnW
         eL21S82PPLTBuPLLSxW/7wJdwNz1FqBESHvROueHdy9641VJI2EiJACsDou/aaXLxiMC
         ZNndt2LE1czRPYUEmidJZ//p7Lrtz4DX8lUtsTKsfC0sZT4IZi2y1G/6aBKQVloj8N8Z
         TY356znR5feCez9afyakNyDM7tW2ZQCrYAlItl354ZoNw8DRN0feFslj5AIWQoGNzsFV
         k56w==
X-Forwarded-Encrypted: i=1; AL+hErGW3/FmgOwk0dLh1+KZTyudP3wFogaD/KaA08QhWi1RFuakbUWnI2BDH3Eogn/vNBa80KCXioA2/Wdb@vger.kernel.org
X-Gm-Message-State: APuU4Z8V80LyAQQLve25VXwOdqYnKfJi38KQ/6hXtrRDmVF7KTtWX2aW
	eQzvJJPh0HInkly+WqKf37IzXWrnnKNGRQYH37s0YW78Q/DZJGb+ZFyF
X-Gm-Gg: AYBFou2OoFLg+ysVi4G2U9oj11Sz3I2uIDEwVZDG8cYJA3yUwBCPxXVivnk567WhenH
	k3K4gm5YZTRp+byC+tzRVxgEXNYOK7u7wOekGTTntYnhZuuF5dkNuXgOWWiQd+jVJhIDkklk2Iv
	/t3fFTXt7LAYYLHLLn9Whq6MNyUpwbzMYA/kMavjZ8vQnVQAY9JkU2VGk+77te1ZNkqorKSfEoe
	AawoXyEsxXSenKs0p+mbY3YQhPX79lU8LEqQnbHXq3Ns8BsNa8uXG1RKcjvxXkPxeWcZEZrb9ns
	j27/soOyBNJ4aYVbe6IqrcfJOvawzD/1wLI3+grOF5+mAPqu5w48UjWuUQQtgMKTxcCjs6sgc7U
	l34ftQQL/qQdtQxTcddhaIajlZchFvQY/wSl4m5YVD3o/7eC6//4DziVOesHSxUOlvehYZC/gnK
	p80yqHPmQ2gG47ZDgpq580QwbpK0Yi0ih1/QolO34MrxUTCbXMl/t0270a29mi5tBTwNn+Fq579
	tsOKTaxK0c64bQjG539/4jYZpCaJYsjqNgH9fpi5ztbKe44ZcAsycPdvTKxCTKMAt281iKM5zOx
	FH4jze2mcIoFKKmYAG7Q5G7q6pcFAcUlAKoSpjEVf0KpEVPpjrT11zzj5zm0vXyJ
X-Received: by 2002:a17:907:1b18:b0:c3f:c856:fb7a with SMTP id a640c23a62f3a-c4d6d166840mr141985166b.3.1794162497894;
        Sun, 08 Nov 2026 10:28:17 -0800 (PST)
Received: from [192.168.1.100] ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a47515dsm75254366b.44.2026.11.08.10.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 10:28:17 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Sun, 08 Nov 2026 21:27:10 +0300
Subject: [PATCH 1/2] dt-bindings: pinctrl: mediatek: Document MT6895 pin
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
Message-Id: <20261108-pinctrl-mt6895-v1-1-f704c443b31a@gmail.com>
References: <20261108-pinctrl-mt6895-v1-0-f704c443b31a@gmail.com>
In-Reply-To: <20261108-pinctrl-mt6895-v1-0-f704c443b31a@gmail.com>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexander Letuchiy <asalde.le1@gmail.com>, Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
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

