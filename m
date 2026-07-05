Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A59A37DAA9
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 13:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783257934; cv=none; b=D9gE7Yum6tDlGtm1d4tTtWSUGcvOn2e5CY9ADwb7ZYOnFtCVOfY9I1Pts+lEqAehhLxaoUrmPJapvd7U1FnBKaSrDpMbJRJqhRe7vpCJSn6DneiGnuoKBZMQC+NjRhjV6rjw3Emgz4y7qBjR4ItgmOwQEG/VerdAmmiHQhTD9EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783257934; c=relaxed/simple;
	bh=2n+9kHjJ+NgQUCaJGlzIGcRg5Y9SXBiYR+V2oD3Q67I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WIlBYUjkcLQ6WR9D+RSAvtiQklUnE9pKVkiMCoNfYHTxTmRLCa8J7BR2NAKN3H8E/bBDf1fCj+/Mptc1YRK7YOFb/ejloA/l84AXvbSYGWrORXAHhsrAi0ABen4Co+01q3X2E0pdu1dHa8e/sOnPYJcSyepJ2MzAQ/El6q43lKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CMQ4r7Uz; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CMQ4r7Uz"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38175907a56so1115967a91.0
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 06:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783257932; x=1783862732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yCUQEdLKr3eavP6cJqECO8YF71F1Siq9zhvu6pN/EkA=;
        b=CMQ4r7UzvpJxkxJ3rwhxsUSIW9NkpRU/7jdXdSZEa66j2VZgvmeO7C12bVF55vmmnb
         S/W40bYyi/p2xRXy5yIju0MeF/zBFH+4UvhwZE7k0CekLwLJa1ahsCimYMJ8AbSEWQ2H
         VthGjw4+Ie+B3yVYRxwzMXPri1ibyORcXx23vmJrd8i/liOZhSs106H0w1+7fVYcIszz
         6RsvYyLXPscf+6zoxSf4g+9s4QBMZn12aEiBharbIhkUPPrjJVlIRJ6YqB/HWm+Ud5Dg
         PbHa4uA5t2ZbHwHBw2pIiLIE0pwDhK9X0ucs8T19c+K0VjZ1vTORkTxL8eQCD/4vMlM+
         a0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783257932; x=1783862732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yCUQEdLKr3eavP6cJqECO8YF71F1Siq9zhvu6pN/EkA=;
        b=hrXeCFkj9KL53fAOoRxh17tKNBTvqfW6eQgkdyQU7TF3O9SffLr7DLNZ2F0h4CzA+O
         24PxU1tjYy81/j9Ja+aZ1ydXLd7LxsqFR/WfUgme0Zz+I/Y7s8iJXxGtuO1iQNL3UoKA
         cAtPC78UGQIVo9C5vTh647oX+f92kuLA4XW+AieL5IYIbzMvr0bp87utfVMv2mv0V3DQ
         mAs0E+2Dw02s5s+XsZsp4ZRqr9MddctppCpcmT/3aZod4KdPwHlZcQS3RRGlfdvuDNuf
         CYVEgEME2yYzTwkrHdxRdYmGFe1rmEqWo7zxWakvWmvkz4xIoeOH0GKHi4GxaBzdWvlp
         o5pw==
X-Forwarded-Encrypted: i=1; AHgh+Rq0xZkPPx2m+wf+pQIB7W6naAQ/T445EhEMZ3SoO3v5rq4thEhKIxH5rZI99JZ8MEACDUqz8hw6VHWI@vger.kernel.org
X-Gm-Message-State: AOJu0YxnLs5FPUMqI9l2YGaBqoOi2s624CDV7oiXuRo3nyKztGlxhRmF
	eCLiNOlOAhrBUtAO5mmzbvzLrjA6Dw+NHKuUHlhiyBr+tVVl1VKBlrdi
X-Gm-Gg: AfdE7clJU7oxU8JuzBG6uKwdyzmXkYoBkVJPXFJhwwcSRlO6iTYBL4rRjZ8tabM9UBl
	pCjysmdwPOfDdCS2ntLRVK5iH+7+baTYVt8PEDsO9EwPEqG8pjxkI7ZIZmcidClv4X6Tq+z+tFg
	NA/gr0CT5AwUD1TCaVPmODq83S+D8cZIilEsebVEqknBSH7upRyfYoWz41n1otpMHllpwPYqfHI
	mcBNbyz4zFjrZIqgVjv8Wg3uR16RKuoq8S8iuEigVlof5yFQeUr/zQoSQkldU8wUHq/dbzLVFVE
	rdNK7kbXOkaUZU+HcOatp4kXll+wEBA1YKS1obaZQQpV15nxana8Ixcob62GsPS73GUdI9iiVcz
	GXqo2uFKyNOUMYkngGB5qrdIHJPKkj9JhFv3INDQLpS32TGtFqv4osDBeqjVCW/9HcdxL+9t0JY
	Mt+v0NOqFcu1fxIJavPFw2VsK8aatIGuq/j5LYXvh/8w==
X-Received: by 2002:a17:90a:da83:b0:380:9052:f4b9 with SMTP id 98e67ed59e1d1-381122ebe5amr11898566a91.11.1783257932301;
        Sun, 05 Jul 2026 06:25:32 -0700 (PDT)
Received: from inhnjlux1020.ls.ege.ds ([49.204.165.177])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f4453996csm18659165eec.17.2026.07.05.06.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 06:25:31 -0700 (PDT)
From: Udaya Kiran Challa <challauday369@gmail.com>
To: linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Udaya Kiran Challa <challauday369@gmail.com>
Subject: [PATCH] dt-bindings: pinctrl: microchip,pic32mzda-pinctrl: Convert to DT schema
Date: Sun,  5 Jul 2026 18:55:21 +0530
Message-Id: <20260705132521.159522-1-challauday369@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert Microchip PIC32 Pin Controller devicetree binding
from legacy text format to DT schema.

Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
 .../pinctrl/microchip,pic32-pinctrl.txt       |  60 --------
 .../pinctrl/microchip,pic32mzda-pinctrl.yaml  | 141 ++++++++++++++++++
 2 files changed, 141 insertions(+), 60 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,pic32-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,pic32mzda-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,pic32-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/microchip,pic32-pinctrl.txt
deleted file mode 100644
index 51efd2085113..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/microchip,pic32-pinctrl.txt
+++ /dev/null
@@ -1,60 +0,0 @@
-* Microchip PIC32 Pin Controller
-
-Please refer to pinctrl-bindings.txt, ../gpio/gpio.txt, and
-../interrupt-controller/interrupts.txt for generic information regarding
-pin controller, GPIO, and interrupt bindings.
-
-PIC32 'pin configuration node' is a node of a group of pins which can be
-used for a specific device or function. This node represents configurations of
-pins, optional function, and optional mux related configuration.
-
-Required properties for pin controller node:
- - compatible: "microchip,pic32mada-pinctrl"
- - reg: Address range of the pinctrl registers.
- - clocks: Clock specifier (see clock bindings for details)
-
-Required properties for pin configuration sub-nodes:
- - pins: List of pins to which the configuration applies.
-
-Optional properties for pin configuration sub-nodes:
-----------------------------------------------------
- - function: Mux function for the specified pins.
- - bias-pull-up: Enable weak pull-up.
- - bias-pull-down: Enable weak pull-down.
- - input-enable: Set the pin as an input.
- - output-low: Set the pin as an output level low.
- - output-high: Set the pin as an output level high.
- - microchip,digital: Enable digital I/O.
- - microchip,analog: Enable analog I/O.
-
-Example:
-
-pic32_pinctrl: pinctrl@1f801400{
-	#address-cells = <1>;
-	#size-cells = <1>;
-	compatible = "microchip,pic32mzda-pinctrl";
-	reg = <0x1f801400 0x400>;
-	clocks = <&rootclk PB1CLK>;
-
-	pinctrl_uart2: pinctrl_uart2 {
-		uart2-tx {
-			pins = "G9";
-			function = "U2TX";
-			microchip,digital;
-			output-low;
-		};
-		uart2-rx {
-			pins = "B0";
-			function = "U2RX";
-			microchip,digital;
-			input-enable;
-		};
-	};
-};
-
-uart2: serial@1f822200 {
-	compatible = "microchip,pic32mzda-uart";
-	reg = <0x1f822200 0x50>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_uart2>;
-};
diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,pic32mzda-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,pic32mzda-pinctrl.yaml
new file mode 100644
index 000000000000..87ac5aace5e3
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,pic32mzda-pinctrl.yaml
@@ -0,0 +1,141 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/microchip,pic32mzda-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip PIC32 Pin Controller
+
+maintainers:
+  - Linus Walleij <linusw@kernel.org>
+
+description: |
+  PIC32 pin configuration node is a node of a group of pins which can be used
+  for a specific device or function. This node represents configurations of
+  pins, optional function, and optional mux related configuration.
+
+properties:
+  compatible:
+    const: microchip,pic32mzda-pinctrl
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+patternProperties:
+  '^[a-z0-9]+[_-].*$':
+    type: object
+    description: |
+      Pin configuration node with pin muxing and configuration properties.
+      Can be either a direct pin configuration node or a container node
+      with child pin configuration nodes.
+
+    properties:
+      pins:
+        description: |
+          List of pins to which the configuration applies.
+        items:
+          type: string
+        minItems: 1
+
+      bias-pull-up: true
+      bias-pull-down: true
+      input-enable: true
+      output-low: true
+      output-high: true
+
+      microchip,digital:
+        description: Enable digital I/O.
+        type: boolean
+
+      microchip,analog:
+        description: Enable analog I/O.
+        type: boolean
+
+    patternProperties:
+      '^[a-z]+[0-9]+-[a-z]+$':
+        type: object
+        description: |
+          Child pin configuration node.
+
+        properties:
+          pins:
+            items:
+              type: string
+            minItems: 1
+
+          function:
+            description: |
+              A string containing the name of the function to mux pin.
+            enum: [ U2TX, U2RX, U4TX, U4RX ]
+
+          bias-pull-up: true
+          bias-pull-down: true
+          input-enable: true
+          output-low: true
+          output-high: true
+
+          microchip,digital:
+            description: Enable digital I/O.
+            type: boolean
+
+          microchip,analog:
+            description: Enable analog I/O.
+            type: boolean
+
+        required:
+          - pins
+
+        additionalProperties: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/microchip,pic32-clock.h>
+
+    pic32_pinctrl: pinctrl@1f801400 {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        compatible = "microchip,pic32mzda-pinctrl";
+        reg = <0x1f801400 0x400>;
+        clocks = <&rootclk PB1CLK>;
+
+        pinctrl_uart2: pinctrl_uart2 {
+            uart2-tx {
+                pins = "G9";
+                function = "U2TX";
+                microchip,digital;
+                output-low;
+            };
+
+            uart2-rx {
+                pins = "B0";
+                function = "U2RX";
+                microchip,digital;
+                input-enable;
+            };
+        };
+    };
+
+    uart2: serial@1f822200 {
+        compatible = "microchip,pic32mzda-uart";
+        reg = <0x1f822200 0x50>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_uart2>;
+    };
-- 
2.34.1

