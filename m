Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3CE42CB15
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 14:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783435366; cv=none; b=QhZ7KkvQErrvsfrP3ygvEc1NxV2y+rLbqDNpGxSg15KXwGYE79Xvipnb2yVaD6TTv4rKnwGwkP1acMVwjFrh9+V5vi1/zyxnl08+Qt3YB8NmdzP5H80fRTL9vXqnzCBpWGOOgJaVg/yhlGshtI0LnPgxUeb1M/V6YR+ppxxS534=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783435366; c=relaxed/simple;
	bh=KAnqFS+pXd5ZmI8H/+IzEqlkA+a45bynbVVJ8pNh+kY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hPGIeW502VkNDRp8qzTlk50CcvzZZpH0eta5Rscgq8I1mPza6pVgbb25eemXEVSCDiBpsS+ZkN7zElW61wQIXhqUcJzBzamahr43PxLlt9UcCrZTEGS4kfFe1IogwIPvLOr5Q9z3nTFWpe3mnaVJc2wCYuYfx9/ICORHdY5KpTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bkaD9/qC; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bkaD9/qC"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso3230923a91.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 07:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783435365; x=1784040165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=15Jfi3usaM1xvnYfzLTdvw/7lRtvBMgyiSIFjJe9RNk=;
        b=bkaD9/qCY+Q1Tts0AnZM1QzP26q+D9l9HuCio2UEzEtgB0iR6/QgTXrFfpKL8OJGDh
         wX2eU0MK/LYCLnMKHwYRUAPGzroKaVjWsVFByfu+2syhUA8VUb3NwrJAoqsE2LFUajTN
         Y+IETyEySxcWGHVBYwdCCk+K6DoymonVrdjKZn5i5rZ2mKrNpgjDJPAb9JxR7T3m6KV2
         jxLYxr2QqX0hN1+/d2L4msi3QeNssRdrGOqdY+O+P/DEz6nE4XiUjW0DC8R9a60ZWpR1
         3pyEzwateWNBzXZujR3TaR+9x3LuHJ0S6k6OtMWm1pl7rTRm6cJ51cisw/CXqyCAyh/b
         8xcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435365; x=1784040165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15Jfi3usaM1xvnYfzLTdvw/7lRtvBMgyiSIFjJe9RNk=;
        b=ouKNXb/4xFzNRWWS5XyB6AVDPwTZkLvwL7hCHf0zCepf59C+Q7Pi30b5iBKXrEa4cj
         x6pHReSq9B35tYz+pgnnu8U7sqs4PY5fadLo2b20qm7Z54lGb5mHo2UynRz6jhOTry4M
         ExPXw7LSNfm3wAFqsWkByrzrcER6CX8UIVq3h8xBd0a8g378+k8uEz3z8sCFDNKEHbpN
         BR7ZxYGjaTLoJAE5307te3caXi2QrrLNcrgoac9DUAfWkKjCRXwSdufLg2Sib/ogFzKm
         cHGcwdb20IB47nZuSs7WpGSNFq8p+PrJM/a0xdNeWnKk1sTF6De2fqJBmFgCmzPXQh+Z
         afKA==
X-Forwarded-Encrypted: i=1; AHgh+Ron+Gy5Ze3YejldYLoQ06W3SSOywy/1a/XCuoqJMJsvvKFVZTr4ePbL880GDFaLlGUG6/9AJG5Ccs41@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ9cZaXq0nX52swkOTEb6Njzs6abAg2AGP2LuP/0kzIueeAwSR
	prqJDs6ntrrceyHjONfHcf+arwEdE6a8syN3i1h+JX+b4+s0hmonviRr
X-Gm-Gg: AfdE7cnfdvINEED3RnG2fL7v8MfzfeJZYyTh29RR4cUmFna/6d/p8ocY7OIPaDaWyZL
	exguydXRzzyPk2qfV9xY4juCUK6nZfrsXdm/i6ZJ94K5gWTpyaHx5lfma84PezvLrlqWhPCMurL
	cQe5kD2BhcwnSgJ7QjMiSqF3MeBMJHET5QXFsdujr1pTJ1DjMlQSmrOZHiCBSYbNjyAj0N2GgyR
	pJ8Ov0m+TZ/E7wizaAxF+iw9pvyJiCfwvnSKDcoGeEnAFfZS+0BAfFio2oBQupZN1egZIywG4we
	udhKqrMz5ynf8m4BVewvQzGfpVSu0Rl2HavU93gC4v/0EyIGDllBw2+EuTRkuvF7vlZEKRcWY3a
	Gfe0PoLE/ZFGxfLBJnv81LnTUwJvOntANvKgVm72b0PTwEgDfIMWmW5bmi/QpyvQIFZXdYXM0hM
	ndwsHPjPMEVf0mtJi35NOnxIRj9Y/ikA==
X-Received: by 2002:a17:90b:2652:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-38755573a58mr5320106a91.7.1783435364699;
        Tue, 07 Jul 2026 07:42:44 -0700 (PDT)
Received: from inhnjlux1020.ls.ege.ds ([49.204.165.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d12fcd99sm1264152a91.2.2026.07.07.07.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:42:44 -0700 (PDT)
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
Subject: [PATCH v2] dt-bindings: pinctrl: microchip,pic32mzda-pinctrl: Convert to DT schema
Date: Tue,  7 Jul 2026 20:12:23 +0530
Message-Id: <20260707144223.120417-1-challauday369@gmail.com>
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
Changelog:

Changes since v1:
- Add interrupts and clocks to uart2 example to satisfy uart schema validation
- Corect regex patterns to accept standard DT node naming conventions
- Add function property to top-level pin configuration nodes
- Remove restrictive enum from function property to support all mux functions

Link to v1:https://lore.kernel.org/all/20260705132521.159522-1-challauday369@gmail.com/
---
 .../pinctrl/microchip,pic32-pinctrl.txt       |  60 --------
 .../pinctrl/microchip,pic32mzda-pinctrl.yaml  | 145 ++++++++++++++++++
 2 files changed, 145 insertions(+), 60 deletions(-)
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
index 000000000000..8fdbb3ab88f2
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,pic32mzda-pinctrl.yaml
@@ -0,0 +1,145 @@
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
+  '^[a-z0-9]+[_-][a-z0-9_-]*$':
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
+      function: true
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
+      '^(?!bias-|input-|output-)[a-z0-9]+[_-][a-z0-9_-]*$':
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
+          function: true
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
+    #include <dt-bindings/interrupt-controller/irq.h>
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
+        interrupts = <112 IRQ_TYPE_LEVEL_HIGH>,
+                     <113 IRQ_TYPE_LEVEL_HIGH>,
+                     <114 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&rootclk PB2CLK>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_uart2>;
+    };
-- 
2.34.1

