Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6E23B2FE9
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 07:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485931; cv=none; b=Sq9ENc3dOt56Yz33ndB+5/L298IwLvtHM8JIWqlfFyNsbRlP1I8svIWjY5A4MdvWE0PX8uWt4Jafxcefn9/2XqQ0ix3C1dfqUWHx31kx2UZ9NtsSU7rjGOfvG1h9ChMjcJgLHXVX9YdcrXpLrVl+LgwDVXaQzqbzO7XZIeVxM54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485931; c=relaxed/simple;
	bh=/MLmavJk4/lqJ73GxTD24COxo83kklOQff2Pj/3I2dQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f3BOjj7IHvZBQ9FSabi9YUB7pp+TIMiArmJaszCAraPOcmdtQXm7DPZ5R03kIztQ0Y5HpnC/CCF7WdrGoJ0W+24VfCwXMctOsbQ+EeWgMWH4Ibjdanbyu3PhLYSh8bD7qNkgXQLtqzpQ+6uexl8xEC8Tz+uwizPuYUJ1ry+IUAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CtbC/qyA; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CtbC/qyA"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8353ca0f1f1so1958088b3a.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 00:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778485914; x=1779090714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fz3/iPbkPkVJpg+21eyeyZQXc8fO7eG+LOXjZ7wm054=;
        b=CtbC/qyAcWup2iRw9quFjZgWS9HJv9cMuWFUlTjoHNTfclIv4WCl5MH98GmLApFW4n
         MG+P6qc9PcxdCrNh0Envlf121Ye36GA03XJjFQ3l/pJqedSTis9zONLvZBerZX9JEEre
         6IczowsRDDzNBPVv7R+yRkJKwT95SBZ7YT7/D7bkd9Jk9sdL4aLAStcV4MmE/XNn0Lpc
         tzYs+L+Vh34tEN80hWviEpAMtJxSoe4Jxfe/w5LOkAXULUGgsvA5yw+xOwraY4R8DY/W
         frg2NR8uXPXGS8R/FX6hZfrYIboxWdXpgrpxCQMqJA9aNS2a11t5jfLCfI6AcarjvtMc
         9I0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485914; x=1779090714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fz3/iPbkPkVJpg+21eyeyZQXc8fO7eG+LOXjZ7wm054=;
        b=EESO0dCrrblOd9mTHFyrZLDScnHICA1DO6tgScmw2uxghK+lwLbiOZ/glOGh3Roqrx
         uC4OulY3bln/rGvXN0Er4Q4wuTMVG7QcCz+sunTD2OdRL2cDeVqm8x7o1GyvRW5OFxEl
         fu6W58vgSEolKTFhwpXcQ0wuGhW9t0nY/Rhx51+nzTjZVuZ9R+g/HEKt0JZnAJvMKnnx
         PGAxqt2pL80JcMlsgqMDDpOK/+uTdSeCnnLg0/OsHyBlaJfKb64ZA6u4ZC+bgWm3/VoH
         1ZrjK8yW7cSmGYlSx7ONSCb8YaJPrERRe9Ags/Ms667g/VLYXI9LjhXr4PkLF657QBK7
         LKeg==
X-Forwarded-Encrypted: i=1; AFNElJ+61JJ1A2Tsrw47tNcPn7xN2Oh2V6h0QqWjLavmVqB3a1CjI0CeBvA/ZLJw953bDmNv9o+A906bziYg@vger.kernel.org
X-Gm-Message-State: AOJu0Yx069c0v/Qczss/QvmiMC3Ib9yony6/OmpUP4Y9C+zkq90z/vsh
	8qblU11khrX9BlzlkBB55WyQCzmA6dOAnMMe5ZNQJESvCtmEupkc0wBH
X-Gm-Gg: Acq92OEvK84FjplKvRm/16oG63c5sxMV34r7wN2xPWKYRc7EvvHVuBuIPmBRVM0BvQI
	/yu0lCV6/d0RwMSji/WViW+WkvVko8kKSigjAfVQTwGieOyz8iNh4MlWfPKxidlKkkKh9B7b2q4
	+or70vAyNQFAlUuln+k9bFozOKOTXjuzhU9FahzKb6N3ab3mwhY/hQI7uHR3sihl0hDKHOJ/tyd
	NpRtDjv7oMUUM0XMQVjRC2qN9vlD+n4HS/d7+uDnAvx1CR3Rh9W1o5au4l5fn/ZJDoDvBRy11f0
	ezxHCohThp0TJtMWUZpDFthbrOZLe3UN5aDU0LLPfiWe/oIB1TjcoKzTUie59kkAoslc1z/w3Tz
	o6PahEFVz5+XcxIVqeadYL7CRLgD8buJxf1hC/PUUQQj/72SugIyLXwTHFMEPl61BRyJyTQxnIO
	QtXTmkgNWQv/gbRHtCN8nhhCtW1T34kK8ex2Eu+zblOuu+ucO3j9WpecLd7EanQqjSBbBfjQ9ul
	/A59EmhiCVT
X-Received: by 2002:a05:6a00:2304:b0:837:8a0c:8f70 with SMTP id d2e1a72fcca58-83bb8691c49mr14478252b3a.28.1778485913610;
        Mon, 11 May 2026 00:51:53 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965d36a12sm17694642b3a.27.2026.05.11.00.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:51:53 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: zhengxingda@iscas.ac.cn,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH 1/2] dt-bindings: display: verisilicon,dc: generalize for DCUltra Lite variant
Date: Mon, 11 May 2026 15:51:41 +0800
Message-ID: <20260511075142.54752-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511075142.54752-1-a0987203069@gmail.com>
References: <20260511075142.54752-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the verisilicon,dc base schema to accommodate the Nuvoton MA35D1
DCUltra Lite (a previous generation of the DC8000 series) which has a
different clock topology, no reset control, and a single output.

- Replace the fixed clock/reset item lists with minItems/maxItems ranges
  so sub-schemas can enforce variant-specific constraints
- Add a 'port' property (single-port alias) alongside the existing 'ports'
  for single-output variants
- Remove the mandatory 'ports' requirement from the base schema; sub-schemas
  shall enforce their own port topology
- Add a 'select' stanza so the validator matches any node whose compatible
  contains a known Verisilicon DC string, including SoC-specific glue
- Relax additionalProperties to allow unevaluatedProperties enforcement in
  sub-schemas
- Fix a minor whitespace issue in the port@0 description

Add nuvoton,ma35d1-dcu.yaml as a sub-schema for the Nuvoton MA35D1 DCUltra
Lite display controller:

The Nuvoton MA35D1 integrates the Verisilicon DCUltra Lite display
controller. It is a single-output display controller with a 32-bit
RGB (DPI) interface. Unlike the DC8000, it does not have discoverable
chip identity registers, does not support the CONFIG_EX commit path,
and uses dedicated IRQ status/enable registers at offsets 0x147C/0x1480.
The clock topology uses two clocks (bus gate and pixel divider) and
does not require explicit reset control from the driver.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../bindings/display/nuvoton,ma35d1-dcu.yaml  | 94 +++++++++++++++++++
 .../bindings/display/verisilicon,dc.yaml      | 64 +++++++------
 2 files changed, 131 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.yaml

diff --git a/Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.yaml b/Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.yaml
new file mode 100644
index 000000000000..9279004ae27c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.yaml
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/nuvoton,ma35d1-dcu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 DCUltra Lite display controller
+
+maintainers:
+  - Joey Lu <yclu4@nuvoton.com>
+
+description:
+  The Nuvoton MA35D1 integrates the Verisilicon DCUltra Lite display
+  controller. It is a single-output display controller with a 32-bit
+  RGB (DPI) interface.
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - nuvoton,ma35d1-dcu
+  required:
+    - compatible
+
+allOf:
+  - $ref: http://devicetree.org/schemas/display/verisilicon,dc.yaml#
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-dcu
+
+  reg:
+    maxItems: 1
+    description:
+      Register range of the DCUltra Lite controller. The address space
+      is 0x2000 bytes.
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Bus clock that gates register access (DCU_GATE)
+      - description: Pixel clock divider for display timing (DCUP_DIV)
+
+  clock-names:
+    items:
+      - const: core
+      - const: pix0
+
+  resets:
+    maxItems: 1
+    description:
+      Optional reset for the display controller. The driver does not
+      assert or deassert this reset; it may be used by firmware or
+      boot loaders to bring the hardware to a clean state.
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      Output port to the downstream display device (e.g. RGB panel).
+      The DCUltra Lite supports a single parallel RGB output.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+
+    display@40260000 {
+        compatible = "nuvoton,ma35d1-dcu";
+        reg = <0x40260000 0x2000>;
+        interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk DCU_GATE>, <&clk DCUP_DIV>;
+        clock-names = "core", "pix0";
+        resets = <&sys MA35D1_RESET_DISP>;
+
+        port {
+            dpi_out: endpoint {
+                remote-endpoint = <&panel_in>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
index 9dc35ab973f2..00884529f8c1 100644
--- a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
+++ b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
@@ -9,15 +9,34 @@ title: Verisilicon DC-series display controllers
 maintainers:
   - Icenowy Zheng <uwu@icenowy.me>
 
+description:
+  Verisilicon DC-series display controllers.
+
+# Select any node whose compatible contains one of the known Verisilicon DC
+# or DC-derived compatible strings, including SoC-specific glue variants.
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - verisilicon,dc
+          - thead,th1520-dc8200
+          - nuvoton,ma35d1-dcu
+  required:
+    - compatible
+
 properties:
   $nodename:
     pattern: "^display@[0-9a-f]+$"
 
   compatible:
-    items:
-      - enum:
-          - thead,th1520-dc8200
-      - const: verisilicon,dc # DC IPs have discoverable ID/revision registers
+    # Enumerated in full so the schema validator can verify any compatible
+    # string against this list, including those from child schemas.
+    contains:
+      enum:
+        - verisilicon,dc
+        - thead,th1520-dc8200
+        - nuvoton,ma35d1-dcu
 
   reg:
     maxItems: 1
@@ -26,32 +45,24 @@ properties:
     maxItems: 1
 
   clocks:
-    items:
-      - description: DC Core clock
-      - description: DMA AXI bus clock
-      - description: Configuration AHB bus clock
-      - description: Pixel clock of output 0
-      - description: Pixel clock of output 1
+    minItems: 2
+    maxItems: 5
 
   clock-names:
-    items:
-      - const: core
-      - const: axi
-      - const: ahb
-      - const: pix0
-      - const: pix1
+    minItems: 2
+    maxItems: 5
 
   resets:
-    items:
-      - description: DC Core reset
-      - description: DMA AXI bus reset
-      - description: Configuration AHB bus reset
+    minItems: 1
+    maxItems: 3
 
   reset-names:
-    items:
-      - const: core
-      - const: axi
-      - const: ahb
+    minItems: 1
+    maxItems: 3
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: Single video output port for single-output variants.
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
@@ -59,7 +70,7 @@ properties:
     properties:
       port@0:
         $ref: /schemas/graph.yaml#/properties/port
-        description: The first output channel , endpoint 0 should be
+        description: The first output channel, endpoint 0 should be
           used for DPI format output and endpoint 1 should be used
           for DP format output.
 
@@ -75,9 +86,8 @@ required:
   - interrupts
   - clocks
   - clock-names
-  - ports
 
-additionalProperties: false
+additionalProperties: true
 
 examples:
   - |
-- 
2.43.0

