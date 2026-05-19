Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E71C34F48C
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 05:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779169923; cv=none; b=VgZOSxsrb0YpqzqwScwHspN8HWYeUflwLDW9v3lk7p0cLtxhIsEDUkuYyxvZIGea7kWfU7JzOTV41s1HTLe6yBLw1lgAAyvKLvy2EIvIdZFeO76KyRaKluRPZ+Y4DVuYCr6j5y7ibK5ckG4gsd8eu2ADv5KjqzwpTGKICHTVvc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779169923; c=relaxed/simple;
	bh=qfHhz4f5PD7XUE6LrVYjxB4fzL5ljo7pJsmakZI4XMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=czQD15dOKlQLnbuDRgoUa+qgZD5j0Ju1alAN76RgZ55mRS7uwZpguf/8Z/n7cmtf6sAsXuC7CZQUGs85fXeXype7RYOxpPyqM/ZZ9t8sruCkVKM5YcBIm91BTme7c4p67C4ulD9VuEdBR/hJoh8xXdrk32pv5sxadtrOXng3B/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XXJNuBaQ; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XXJNuBaQ"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-838d0b7c950so2183167b3a.3
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 22:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779169921; x=1779774721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uErCr9zi75Tnls+mLi86yEzEO9RwxFHR5lw/x24Nf98=;
        b=XXJNuBaQhDGnaVmhck2yqbDKwa3pKqfCin1atElK0uPz0v5DN4QRvvtn1kBY//gYeu
         sx+BWQyHP02o6aOSzC8rHAa71LQKyq5U1+L+NXy2j70Ojm3lfRs58nnxDxWJxXTcE99G
         9Fylyg8i2iXg9S0Uxw7cZcMx4d5Plklt4WsNYT8zz47oo9fL9tKFjSUUYksK2eOa5JRv
         8nXPuC4vgEbV9YB4WWzGakC0w2XszQwRYTDNZ9yxLLj1UmyYz8HLrb9wYKvtOauB6eZr
         wDtWeqa2b6qQxmeU2HSYRkgXnoQHWbqs3iaVx7QW7b+ABKKT1yzG4xyDYtkqV1Pe9pjE
         7ZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779169921; x=1779774721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uErCr9zi75Tnls+mLi86yEzEO9RwxFHR5lw/x24Nf98=;
        b=My28/gve5TcTWumJzvjkWduUhGp2ke1P8qfcTxRkcvg4LEXajsmjA3dT2RqKP4tGv2
         kwLNoaqyrsGu8j3gDdg8ILA8HSRJEAu6yEhFjZD5K+9IytrJt3nmrH+FVmyK33ibmcdV
         8zMqZPW7mzdYtL9O33U/NvWjDq9fDwnDizWYr3xSwu3rDl8qITYsraOrS+iwZULD4bmo
         j7bgVntDfA85cMjmcuKBRqHKKCI5lTUVTowIGMBHGoFYdw7uMoWJmdVl3pja2Q+3U53L
         mPqxnRU+07U/lSLUu0u5xfGnxyYpg2k6pL5yaNudwTaVkXVqeo/1ohHJ40hTkCVIhLef
         93YQ==
X-Forwarded-Encrypted: i=1; AFNElJ8mSP+hjFEA6GNuRzWb2qfZjFV5hrp+s3ZJZOS5Fm+FEegnI09jFgFy4Jxb3kPVsi4oa96Guq7462X1@vger.kernel.org
X-Gm-Message-State: AOJu0YwooQjf7n7gMhvzlE7g3kjPd47R8nwEjJmSajlGqHxzqiaZHFZw
	9YEncDgcWS5V72DViM6B8CfqYZcQFcBbp5AWq+LB53OufNt+D59sGQyW
X-Gm-Gg: Acq92OGnzMinrc0tQFKJ3WxiME529qD3fMAjL07kX6TAXYq27GZ2FJF9PiJUG5rITVl
	5cRjzUPX9uxgaT6FdYIEwVzK1Hb0PkKiYPZ68g+lu1jePQnWXeDEXb5MI7OQJuVt2ol1nCRMP7O
	XRMperlvggTvCXCh88NQ+LzgLyrfakgGU8THIkhsID5dLtyn3UDrYZKh51Lf/O/wBpiNOMiAQ/n
	Z2enwI1AY3THr2qE6bDur9ubR403d7JVJwukwW+j2oaFHNCbnd/UkswpAJ32bu0jriYOsajd3Zn
	ncb9+vj2bQIoB86xUAucMXVSL8B2Zas71fw0LJ+Ln6KjHMG5yn5Tjwev5IGfO4OnVni3PzHgATA
	qAw6A5BRavtZ1jUcVXOGxwjy+o70zIJ6awwdaGncLSEXtyMXsuc/hYLtmYsXgkMSTmpEe1A+F68
	o7L8TC6OSC7Rac7+yyHQ3On2RW6XInMt+NE6H69JEcwsbH+xqIjO5KuRee321Rc72QzCsZ08zUl
	6Ozpaz1TmV3
X-Received: by 2002:a05:6a00:299a:b0:83b:c487:43d2 with SMTP id d2e1a72fcca58-83f33df451fmr18417039b3a.36.1779169921605;
        Mon, 18 May 2026 22:52:01 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f8b9c2ea5sm2641252b3a.13.2026.05.18.22.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 22:52:01 -0700 (PDT)
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
Subject: [PATCH v2 1/4] dt-bindings: display: verisilicon,dc: generalize for  single-output variants
Date: Tue, 19 May 2026 13:51:06 +0800
Message-ID: <20260519055114.1886525-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519055114.1886525-1-a0987203069@gmail.com>
References: <20260519055114.1886525-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing schema assumes a fixed clock/reset topology and dual-output
port structure matching the DC8200 IP block.  This prevents reuse for
single-output variants such as the Verisilicon DCU Lite used in the
Nuvoton MA35D1 SoC.

Rework the schema so that variant-specific constraints are expressed
via allOf/if-then-else:

- The thead,th1520-dc8200 compatible keeps its existing five-clock,
  three-reset, dual-port requirements.

- A standalone verisilicon,dc compatible covers IPs whose identity is
  discovered entirely through hardware registers; these have flexible
  clock and reset counts, a single 'port' property, and no 'ports'
  requirement.

Changes to the base schema:
- Replace the fixed clock/reset items lists with minItems/maxItems
  ranges; variant sub-schemas tighten the constraints via if-then-else.
- Add a 'port' property (graph.yaml single-port alias) alongside the
  existing 'ports', for single-output variants.
- Drop the unconditional 'ports' requirement; each if-branch enforces
  its own port topology.
- Tighten additionalProperties to unevaluatedProperties to allow
  per-variant schemas to add their own constraints cleanly.
- Fix a stray space in the port@0 description.
- Add a DT example for the generic verisilicon,dc compatible
  (Nuvoton MA35D1 DCU Lite).

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../bindings/display/verisilicon,dc.yaml      | 135 ++++++++++++++----
 1 file changed, 108 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
index 9dc35ab973f2..3a814c2e083e 100644
--- a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
+++ b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
@@ -14,10 +14,12 @@ properties:
     pattern: "^display@[0-9a-f]+$"
 
   compatible:
-    items:
-      - enum:
-          - thead,th1520-dc8200
-      - const: verisilicon,dc # DC IPs have discoverable ID/revision registers
+    oneOf:
+      - items:
+          - enum:
+              - thead,th1520-dc8200
+          - const: verisilicon,dc
+      - const: verisilicon,dc  # DC IPs have discoverable ID/revision registers
 
   reg:
     maxItems: 1
@@ -26,32 +28,24 @@ properties:
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
@@ -59,7 +53,7 @@ properties:
     properties:
       port@0:
         $ref: /schemas/graph.yaml#/properties/port
-        description: The first output channel , endpoint 0 should be
+        description: The first output channel, endpoint 0 should be
           used for DPI format output and endpoint 1 should be used
           for DP format output.
 
@@ -75,9 +69,75 @@ required:
   - interrupts
   - clocks
   - clock-names
-  - ports
 
-additionalProperties: false
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: thead,th1520-dc8200
+    then:
+      properties:
+        clocks:
+          items:
+            - description: DC Core clock
+            - description: DMA AXI bus clock
+            - description: Configuration AHB bus clock
+            - description: Pixel clock of output 0
+            - description: Pixel clock of output 1
+
+        clock-names:
+          items:
+            - const: core
+            - const: axi
+            - const: ahb
+            - const: pix0
+            - const: pix1
+
+        resets:
+          items:
+            - description: DC Core reset
+            - description: DMA AXI bus reset
+            - description: Configuration AHB bus reset
+
+        reset-names:
+          items:
+            - const: core
+            - const: axi
+            - const: ahb
+
+      required:
+        - ports
+
+    else:
+      properties:
+        clocks:
+          items:
+            - description: Bus clock that gates register access
+            - description: Pixel clock divider for display timing
+
+        clock-names:
+          items:
+            - const: core
+            - const: pix0
+
+        resets:
+          maxItems: 1
+          description:
+            Reset line for the display controller.
+
+        reset-names:
+          items:
+            - const: core
+
+      required:
+        - port
+
+      not:
+        required:
+          - ports
+
+unevaluatedProperties: false
 
 examples:
   - |
@@ -120,3 +180,24 @@ examples:
         };
       };
     };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+
+    display@40260000 {
+        compatible = "verisilicon,dc";
+        reg = <0x40260000 0x20000>;
+        interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk DCU_GATE>, <&clk DCUP_DIV>;
+        clock-names = "core", "pix0";
+        resets = <&sys MA35D1_RESET_DISP>;
+        reset-names = "core";
+
+        port {
+            dpi_out: endpoint {
+                remote-endpoint = <&panel_in>;
+            };
+        };
+    };
-- 
2.43.0

