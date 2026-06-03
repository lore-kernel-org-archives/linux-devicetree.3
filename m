Received: from outbound4.mail.transip.nl (outbound4.mail.transip.nl [136.144.136.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE242D73B8;
	Wed,  3 Jun 2026 08:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.136.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780473786; cv=none; b=qp8UfesDEHkYvPwAQ0pzswTO2BMXjCpraN3blxFiXmHQWgDBzeYkjeE5clAZVWv+LVx+MrQ5aobhc2t5YorxUmpXIXh8B03lZdDD1nv1OHKsQRbDgBfSCeMzz/hD0shX+ZvLLaA9J1t/ZSZwPrzgf1a6RLxTLixoohM1PnesMIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780473786; c=relaxed/simple;
	bh=oXhDMhGNvOu0Z2QRKEyTiI8Ee9328zxkB/5yVPSAtJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pu/413nWV77k+VondmEkAOKzGWWSRklzd8zAIbxdnt0K6o0ZTl1k9wvQKlUkM1SFbm+Hjf1MB0B6XVEk/jwX2GRu8gSsxeKO/IjvZG3GmSltTnHUAPQy5XIVccL0ZvJjLPEcyxnM7nnbZw01PfWQnOxgKCN+1OrXyBNT9xGqNHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=thygBC2m; arc=none smtp.client-ip=136.144.136.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="thygBC2m"
Received: from submission2.mail.transip.nl (unknown [10.100.4.71])
	by outbound4.mail.transip.nl (Postfix) with ESMTP id 4gVgDL0TY8zwPdZ;
	Wed,  3 Jun 2026 10:02:58 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission2.mail.transip.nl (Postfix) with ESMTPA id 4gVgDK1MzNzJjhXv;
	Wed,  3 Jun 2026 10:02:57 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: lee@kernel.org,
	robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Herman van Hazendonk <github.com@herrie.org>
Subject: [PATCH 1/1] dt-bindings: mfd: add ti,lm8502 combo LED + haptic controller
Date: Wed,  3 Jun 2026 10:02:56 +0200
Message-ID: <20260603080256.853037-2-github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603080256.853037-1-github.com@herrie.org>
References: <20260603080256.853037-1-github.com@herrie.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission2.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780473777; h=from:subject:to:cc:
 references:in-reply-to:date:mime-version;
 bh=MZyOEVD0dPezzZH05iuJhpzJt+ZEbD/3JISpizAZrwc=;
 b=thygBC2mEFoVySLPEw+yii9zqv8Prabpmafvgka0lmSwnaqfrnSf6ImPDiDi9L83UToWt0
 PZzDxg+6ig3V5V0vN6hCRmzdR12JSIDi8F8/lp31sBwGHpOMALoD6rh1m0j6YqVOcNVbSb
 p5LqAj2Zv5I4RHDme6WCT4HIEDMJmb1mh/aOxny+CYYBKn6myTHGN1L9fkJmUBHPSBnymw
 cdAD4V5ip8rn0WoOvcI9HQ2RrwB1pQdp9bvo8V2ewxnbHCx8pVbu9INrimkHvrnMqGT7JB
 +UsRBHXZK9PyfeKHAMY9mSNJA3FnIG2B60PZDY4K9MpG4Y5UhSsOQcOlODX4Ug==
X-Report-Abuse-To: abuse@transip.nl

Add a YAML binding for the TI LM8502, an I2C combo LED + haptic
controller used in the HP TouchPad tablet. The chip is exposed as an
MFD with two child sub-nodes:

  ti,lm8502-leds   - LED-class outputs D1..D10 (with per-LED reg
                     and led-max-microamp properties)
  ti,lm8502-haptic - EV_FF / FF_RUMBLE input device for the internal
                     H-bridge vibrator output, optional
                     ti,invert-direction property

Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
---
 .../devicetree/bindings/mfd/ti,lm8502.yaml    | 160 ++++++++++++++++++
 1 file changed, 160 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/ti,lm8502.yaml

diff --git a/Documentation/devicetree/bindings/mfd/ti,lm8502.yaml b/Documentation/devicetree/bindings/mfd/ti,lm8502.yaml
new file mode 100644
index 000000000000..10f2e32a0738
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ti,lm8502.yaml
@@ -0,0 +1,160 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/ti,lm8502.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI LM8502 combo LED + haptic controller
+
+maintainers:
+  - Herman van Hazendonk <github.com@herrie.org>
+
+description: |
+  The TI LM8502 is an I2C combo device with ten constant-current LED
+  outputs (D1..D10) and an internal H-bridge that drives a vibrator
+  motor. Pin D10 is shared between the tenth LED channel and the
+  haptic output; the haptic driver writes D10_CURRENT_CTRL = 0 at each
+  start to mux the pin to the H-bridge path.
+
+  The chip is exposed in Linux as an MFD with two children:
+    - ti,lm8502-leds   - LED-class outputs D1..D10
+    - ti,lm8502-haptic - EV_FF / FF_RUMBLE input device
+
+  The parent node owns the I2C client, the chip-enable GPIO and the
+  vcc regulator; children share access to the parent's regmap.
+
+properties:
+  compatible:
+    const: ti,lm8502
+
+  reg:
+    maxItems: 1
+
+  vcc-supply:
+    description:
+      Power supply for the chip (V_DD). On platforms where this supply
+      is provided by an RPM-managed LDO with "regulator-allow-set-load",
+      the driver will request High Power Mode (~100 mA) so the internal
+      boost converter and ten LED outputs are not current-starved.
+
+  enable-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the chip-enable pin. Pulled high by the driver
+      at probe time and dropped low across PM suspend.
+
+  pinctrl-names: true
+  pinctrl-0: true
+
+  leds:
+    type: object
+    additionalProperties: false
+    description: LED-class child for outputs D1..D10.
+
+    properties:
+      compatible:
+        const: ti,lm8502-leds
+
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      '^led@[0-9]$':
+        type: object
+        $ref: /schemas/leds/common.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            description:
+              Zero-based D-channel index (0 = D1 .. 9 = D10).
+            minimum: 0
+            maximum: 9
+
+          led-max-microamp:
+            description: |
+              Per-channel current cap. The chip's MAX_CURRENT field
+              quantises this to one of four buckets:
+                <=3000  - 3 mA
+                <=6000  - 6 mA
+                <=9000  - 9 mA  (default)
+                 >9000  - 12.75 mA
+            default: 9000
+
+        required:
+          - reg
+
+    required:
+      - compatible
+
+  haptic:
+    type: object
+    additionalProperties: false
+    description: FF_RUMBLE child for the internal H-bridge vibrator output.
+
+    properties:
+      compatible:
+        const: ti,lm8502-haptic
+
+      ti,invert-direction:
+        type: boolean
+        description:
+          Flip the H-bridge polarity bit in HAPTIC_FEEDBACK_CTRL so the
+          motor spins in the direction the board expects.
+
+    required:
+      - compatible
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/leds/common.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@33 {
+            compatible = "ti,lm8502";
+            reg = <0x33>;
+
+            vcc-supply = <&pm8058_l16>;
+            enable-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>;
+
+            leds {
+                compatible = "ti,lm8502-leds";
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                led@0 {
+                    reg = <0>;
+                    label = "lm8502:white:navi_left";
+                    color = <LED_COLOR_ID_WHITE>;
+                    function = LED_FUNCTION_INDICATOR;
+                    led-max-microamp = <9000>;
+                };
+
+                led@1 {
+                    reg = <1>;
+                    label = "lm8502:white:navi_right";
+                    color = <LED_COLOR_ID_WHITE>;
+                    function = LED_FUNCTION_INDICATOR;
+                    led-max-microamp = <9000>;
+                };
+            };
+
+            haptic {
+                compatible = "ti,lm8502-haptic";
+                ti,invert-direction;
+            };
+        };
+    };
-- 
2.43.0

