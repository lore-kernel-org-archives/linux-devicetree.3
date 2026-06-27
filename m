Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9483AD538
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 12:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782562512; cv=none; b=lDr9UkQvBSAa/4InhY7zK02ui1/WGptv/fSS8BZ0Dp4qaS6xCeHd8uvNaAEwZJS5ER/M6XIZEPctiAa8BaaQ4sxrKnXc+5bPwjjYe5p2yJHEDlnL5tUMOD6UoTxBMGSA3Ypg/UokMiRcPON2hZxP5sKxj5q3xSLEVT88Ovt1Swg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782562512; c=relaxed/simple;
	bh=NAFHKv8hCxv8sgwJUS9ZKI1V9akBr1LdLvBFEZ+oV/0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LPqo4x4ZROlsrKOHIiAD34xlKrLpfup1uDIhY3HSmJ8Lgb5TwSHdlRF+w6PP6DGKVBbkxRYuUvfvHETmjBZBJi8qm94ksLUm3tIu8aW8yq6slEydJflaSNe8UnCb5FY+S3kx56X7Zkyn6tQ0kLmWrEM26SDYDr8qw3Gj7jrdjCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jgmtqWSD; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jgmtqWSD"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49258ac7294so13276205e9.0
        for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 05:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782562504; x=1783167304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BAIXjok/noDXT0EMJbelmqrpI+3GMWHmkOh7wf+FXrE=;
        b=jgmtqWSDVT9ANq0XWTRaB61SiaO1FVTquVgED/IrqxFEeLFzf/AQr6b4C2dv6clrzu
         LcYCIZRMjyPbnyel8B9D5ZCCfVGmgg77pguS7UNLN44HobuDn9Y3tx/fr5ak8Gll0Og8
         21plS6dwHJxdvyl+7C/c+QKhpPF7FOEv9J/dhQhm+lRAcsRb8bYV+Mip/um9mwv9X3tr
         buO94JQtOlQHDZjzLWYjXvcQkw3Ooa1WgTJkvtIxGfHTrhfassZ2DGtRBNwJb/Eq7jFS
         gF76uO1SiLyyHwSJdUu/BrCPi91ceK40uU4vVH7da1ZOrs3aLAot+tVozbYphW+AHEKJ
         oR8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782562504; x=1783167304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BAIXjok/noDXT0EMJbelmqrpI+3GMWHmkOh7wf+FXrE=;
        b=jqmSdPUO8ZDLLR24SvW6ExQ4eYqkQ/Wp8Ny/zdDQmuv505k0nuJ8g3hjUpLcSWFcSC
         R80zkBb0yiJLU2ZGd9+iY5xlRqGcoCtockPq937oc4jENznp9FQnFGgdv+nfZ2E9KJAB
         GwyT2agKXY6myC3E3kX3WztCaAU+5fv9mv+ioehVZjIh4UMtJv2LDMDzj8QqSjjP8v1U
         v2aoxsyeaxn/PGZ7Q2Je4eJJLk4UGK2LU7w2MbIUsV0ZMx9R1nrGaSDo3KcE1NHvMv/Y
         shfkZG9hNfn2VsMJ8iPB3vvoGXHsB7mmELPs/XGK2B+pkF9egNe9khIwkq2V+pm//Mam
         AK3Q==
X-Forwarded-Encrypted: i=1; AFNElJ/zMGfbE4ttCWf3obxgeePcd9r5ItWNW2xX0JkKcynpQrW1HS67fvl28aPxS+Faw1odXKGETHmWWsBt@vger.kernel.org
X-Gm-Message-State: AOJu0YyumdAqnOzMwo6E93VPM1PP92qJTaW6KaxM0f28Ovl+UZD2kvsv
	KiK+fLl67fuluuqdGMO1zZ+nC0w+zWq1R4mnsN/GrxvInmEEmX4wXuzF
X-Gm-Gg: AfdE7ckWg4TKP0mdBcQuKJ0LcyV0Y26ZVtA7yjS52Z+LWolM0lJ+h24RGmNzwWgGRES
	vrsgR8gIgAhP7Z7Vt/CsucKqfbeAyFhnqF8B/SOzZWGxf9MYUzj8HDt7FpLwzWkPGIkdXytaNjH
	F7BMx9vKF+Z+71ulk6Scc7FNkzmaK7EwSGdikBv9PK1CzGTmVFOJ8KuSM3XEZNyKJ7QBKP1fzzM
	KHfDl6u0RDfjPrdfsIMDJ8yOmL/VgHkaw39ABgMl2TEJoTnckYj8TnFZpkbHoecVIMDhufJBvR2
	wiz8B+wXwWwrNOmgvsipxsEeVMM9iEg8NvBzSnDa7SW0s3F8OZDnaeUJc2qifNhzh1WeP+bnovA
	1QkKeWhNdGANq1s7hNEby5uc75AqMEz+kUrRBzGFb+hdskuGEAZhXb3u+P14v/ae/3MFedVnq8q
	hd3ppGlYGc33XYYicPNJkTeYg4Yz6v/DYHX814Vvbe4Mc7kbDIGAj+KEFDdjQL4A==
X-Received: by 2002:a05:600c:468f:b0:493:a40d:e3d8 with SMTP id 5b1f17b1804b1-493a40de48fmr7052115e9.10.1782562504323;
        Sat, 27 Jun 2026 05:15:04 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-89-195.ip49.fastwebnet.it. [93.34.89.195])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49269002511sm149028265e9.8.2026.06.27.05.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 05:15:03 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 3/4] dt-bindings: PCI: mediatek-gen3: Split Airoha schema and document 2-lanes
Date: Sat, 27 Jun 2026 14:14:44 +0200
Message-ID: <20260627121450.3529133-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260627121450.3529133-1-ansuelsmth@gmail.com>
References: <20260627121450.3529133-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To permit proper documentation of required property to support PCIe
configured for 2-lanes mode, split the Airoha schema part from the
mediatek-gen3 schema to a dedicated schema.

A PCIe configured for 2-lanes mode require an additional reg for the
secondary PCIe to be configured and the airoha,scu phandle to correctly
configure the PCIe MUX.

Rework the mediatek-gen3 schema to drop any redundant constraint previsouly
introduced for Airoha PCIe properties.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/pci/airoha,en7581-pcie.yaml      | 251 ++++++++++++++++++
 .../bindings/pci/mediatek-pcie-gen3.yaml      |  77 +-----
 2 files changed, 256 insertions(+), 72 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/airoha,en7581-pcie.yaml

diff --git a/Documentation/devicetree/bindings/pci/airoha,en7581-pcie.yaml b/Documentation/devicetree/bindings/pci/airoha,en7581-pcie.yaml
new file mode 100644
index 000000000000..c690ba7f207c
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/airoha,en7581-pcie.yaml
@@ -0,0 +1,251 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/airoha,en7581-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Gen3 PCIe controller on Airoha SoCs
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: |+
+  PCIe Gen3 MAC controller for Airoha SoCs, it supports Gen3 speed
+  and compatible with Gen2, Gen1 speed.
+
+  This PCIe controller supports up to 256 MSI vectors, the MSI hardware
+  block diagram is as follows:
+
+                    +-----+
+                    | GIC |
+                    +-----+
+                       ^
+                       |
+                   port->irq
+                       |
+               +-+-+-+-+-+-+-+-+
+               |0|1|2|3|4|5|6|7| (PCIe intc)
+               +-+-+-+-+-+-+-+-+
+                ^ ^           ^
+                | |    ...    |
+        +-------+ +------+    +-----------+
+        |                |                |
+  +-+-+---+--+--+  +-+-+---+--+--+  +-+-+---+--+--+
+  |0|1|...|30|31|  |0|1|...|30|31|  |0|1|...|30|31| (MSI sets)
+  +-+-+---+--+--+  +-+-+---+--+--+  +-+-+---+--+--+
+   ^ ^      ^  ^    ^ ^      ^  ^    ^ ^      ^  ^
+   | |      |  |    | |      |  |    | |      |  |  (MSI vectors)
+   | |      |  |    | |      |  |    | |      |  |
+
+    (MSI SET0)       (MSI SET1)  ...   (MSI SET7)
+
+  With 256 MSI vectors supported, the MSI vectors are composed of 8 sets,
+  each set has its own address for MSI message, and supports 32 MSI vectors
+  to generate interrupt.
+
+properties:
+  compatible:
+    const: airoha,en7581-pcie
+
+  reg:
+    minItems: 1
+    maxItems: 2
+
+  reg-names:
+    minItems: 1
+    maxItems: 2
+
+  interrupts:
+    maxItems: 1
+
+  ranges:
+    minItems: 1
+    maxItems: 8
+
+  iommu-map:
+    maxItems: 1
+
+  iommu-map-mask:
+    const: 0
+
+  resets:
+    minItems: 1
+    maxItems: 4
+
+  reset-names:
+    minItems: 1
+    maxItems: 4
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: sys-ck
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    items:
+      - const: pcie-phy
+
+  num-lanes:
+    enum: [1, 2]
+
+  mediatek,pbus-csr:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to pbus-csr syscon
+          - description: offset of pbus-csr base address register
+          - description: offset of pbus-csr base address mask register
+    description:
+      Phandle with two arguments to the syscon node used to detect if
+      a given address is accessible on PCIe controller.
+
+  airoha,scu:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to airoha SCU syscon
+    description:
+      Phandle to SCU syscon to configure PCIe MUX for 2 lines support.
+
+  '#interrupt-cells':
+    const: 1
+
+  interrupt-controller:
+    description: Interrupt controller node for handling legacy PCI interrupts.
+    type: object
+    properties:
+      '#address-cells':
+        const: 0
+      '#interrupt-cells':
+        const: 1
+      interrupt-controller: true
+
+    required:
+      - '#address-cells'
+      - '#interrupt-cells'
+      - interrupt-controller
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - ranges
+  - clocks
+  - clock-names
+  - '#interrupt-cells'
+  - interrupt-controller
+
+allOf:
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
+  - if:
+      properties:
+        num-lanes:
+          const: 2
+    then:
+      properties:
+        reg:
+          minItems: 2
+
+        reg-names:
+          items:
+            - const: pcie-mac
+            - const: sec-pcie-mac
+
+        resets:
+          minItems: 4
+
+        reset-names:
+          items:
+            - const: phy-lane0
+            - const: phy-lane1
+            - const: perstout
+            - const: sec-perstout
+
+      required:
+        - airoha,scu
+
+    else:
+      properties:
+        reg:
+          maxItems: 1
+
+        reg-names:
+          items:
+            - const: pcie-mac
+
+        resets:
+          minItems: 2
+          maxItems: 3
+
+        reset-names:
+          minItems: 2
+          items:
+            - enum: [ phy-lane0, phy-lane1, phy-lane2 ]
+            - enum: [ phy-lane1, perstout ]
+            - const: phy-lane2
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pcie@1fc00000 {
+            compatible = "airoha,en7581-pcie";
+            device_type = "pci";
+            #address-cells = <3>;
+            #size-cells = <2>;
+
+            reg = <0x0 0x1fc00000 0x0 0x1670>,
+                  <0x0 0x1fc20000 0x0 0x1670>;
+            reg-names = "pcie-mac", "sec-pcie-mac";
+
+            clocks = <&scuclk 7>;
+            clock-names = "sys-ck";
+
+            phys = <&pciephy>;
+            phy-names = "pcie-phy";
+
+            ranges = <0x02000000 0 0x20000000 0x0 0x20000000 0 0x4000000>;
+
+            resets = <&scuclk 48>,
+                     <&scuclk 49>,
+                     <&scuclk 53>,
+                     <&scuclk 54>;
+            reset-names = "phy-lane0", "phy-lane1",
+                          "perstout", "sec-perstout";
+
+            num-lanes = <2>;
+
+            mediatek,pbus-csr = <&pbus_csr 0x0 0x4>;
+
+            airoha,scu = <&scuclk>;
+
+            interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+            bus-range = <0x00 0xff>;
+            #interrupt-cells = <1>;
+            interrupt-map-mask = <0 0 0 0x7>;
+            interrupt-map = <0 0 0 1 &pcie_intc 0>,
+                            <0 0 0 2 &pcie_intc 1>,
+                            <0 0 0 3 &pcie_intc 2>,
+                            <0 0 0 4 &pcie_intc 3>;
+            pcie_intc: interrupt-controller {
+                      #address-cells = <0>;
+                      #interrupt-cells = <1>;
+                      interrupt-controller;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index 4db700fc36ba..510f1f2b1c5a 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -59,7 +59,6 @@ properties:
           - const: mediatek,mt8196-pcie
       - const: mediatek,mt8192-pcie
       - const: mediatek,mt8196-pcie
-      - const: airoha,en7581-pcie
 
   reg:
     maxItems: 1
@@ -83,20 +82,20 @@ properties:
 
   resets:
     minItems: 1
-    maxItems: 3
+    maxItems: 2
 
   reset-names:
     minItems: 1
-    maxItems: 3
+    maxItems: 2
     items:
-      enum: [ phy, mac, phy-lane0, phy-lane1, phy-lane2 ]
+      enum: [ phy, mac ]
 
   clocks:
-    minItems: 1
+    minItems: 4
     maxItems: 6
 
   clock-names:
-    minItems: 1
+    minItems: 4
     maxItems: 6
 
   assigned-clocks:
@@ -115,17 +114,6 @@ properties:
   power-domains:
     maxItems: 1
 
-  mediatek,pbus-csr:
-    $ref: /schemas/types.yaml#/definitions/phandle-array
-    items:
-      - items:
-          - description: phandle to pbus-csr syscon
-          - description: offset of pbus-csr base address register
-          - description: offset of pbus-csr base address mask register
-    description:
-      Phandle with two arguments to the syscon node used to detect if
-      a given address is accessible on PCIe controller.
-
   '#interrupt-cells':
     const: 1
 
@@ -177,16 +165,6 @@ allOf:
             - const: peri_26m
             - const: top_133m
 
-        resets:
-          minItems: 1
-          maxItems: 2
-
-        reset-names:
-          minItems: 1
-          maxItems: 2
-
-        mediatek,pbus-csr: false
-
   - if:
       properties:
         compatible:
@@ -208,16 +186,6 @@ allOf:
             - const: peri_26m
             - const: peri_mem
 
-        resets:
-          minItems: 1
-          maxItems: 2
-
-        reset-names:
-          minItems: 1
-          maxItems: 2
-
-        mediatek,pbus-csr: false
-
   - if:
       properties:
         compatible:
@@ -246,8 +214,6 @@ allOf:
             - const: phy
             - const: mac
 
-        mediatek,pbus-csr: false
-
   - if:
       properties:
         compatible:
@@ -257,7 +223,6 @@ allOf:
     then:
       properties:
         clocks:
-          minItems: 4
           maxItems: 4
 
         clock-names:
@@ -267,38 +232,6 @@ allOf:
             - const: peri_26m
             - const: top_133m
 
-        resets:
-          minItems: 1
-          maxItems: 2
-
-        reset-names:
-          minItems: 1
-          maxItems: 2
-
-        mediatek,pbus-csr: false
-
-  - if:
-      properties:
-        compatible:
-          const: airoha,en7581-pcie
-    then:
-      properties:
-        clocks:
-          maxItems: 1
-
-        clock-names:
-          items:
-            - const: sys-ck
-
-        resets:
-          minItems: 3
-
-        reset-names:
-          items:
-            - const: phy-lane0
-            - const: phy-lane1
-            - const: phy-lane2
-
 unevaluatedProperties: false
 
 examples:
-- 
2.53.0

