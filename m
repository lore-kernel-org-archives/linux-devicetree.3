Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14982239E9B
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 08:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781339180; cv=none; b=HUcUW99wOwqCRknM7MblPJn2ciLax+UBstadDbqCq82d1sRw8bTNUWVNieTia+PWhtPvoyWRHaXlcwhOs3k7JXECnYTr7UUihsHX37VSNs0Jv7K4iJCuDCh0LVjjMnGATv27iG1hP9oojHXgvYSH/+FBOeFSRJC+71rbwaXRofs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781339180; c=relaxed/simple;
	bh=QrjCXuihoGr5gjx1nUVOV4kq3EmrqQj6Xyodjt9ISAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=He6Jgu8FYeaujvHVbgi+DfEhzuHrrVo0h5sdDTlXs3TSAgmONd3DitYn/LJoLKqwb33VHjdJPY41sbLayGhnehFUEIgr15tWGeS5sWVITBhtLvw2InFfMYZ75REEm0xwLCxN1PRwKNjOYiW8rB7kw4zfyu8zHbKj9K639XyC4uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ivSYrcf3; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ivSYrcf3"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c31212104cso7561485ad.2
        for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 01:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781339177; x=1781943977; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bFh4QwOfidNfNO0WUENvp1jz8UmiX7XDMFTl/OPrUew=;
        b=ivSYrcf3qkZj/zRcClDXgYn7zHz0hxYsDjPYIN6jAL/+y0FXB7eNO2Q8ioJp1wT3gp
         LY6a1yMwZOVt/m60d/4kxGZlJspmM+fT8kDr1TfMQL+30r7nC4zm6RNLRbJVwqHvUdus
         AUFUpfwiOcElMuRhfO+DTG/cCL4k5kgMHIyIY8S3BwvaKtyrPxpd0GTNbBED6eg/Bojv
         kQdxhSK09Vh4jVoWkWWWPZ+NXYm02eC62h3Qs1TN0dr47/8k07BMBSaQ87uk2a14Xw/i
         Cdc1K8lFtNedVx3pqK/tRRwmjR/rXOXh3t7lnWmh1Ald5Xn+lNK6XeF1ooQGVO9zmhqK
         WmJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781339177; x=1781943977;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFh4QwOfidNfNO0WUENvp1jz8UmiX7XDMFTl/OPrUew=;
        b=k+bRHuCmWBbc7Zepiribq0gtJamdTHeX/H2oOH+mYuQvaslfqOnlBq352hbepgkoHp
         x/cOsGO3ssZvMBQx+2i70UfQsZpiKxig8jPswO2FULW7JakP7RiNlX1o08V2lpDBJoxM
         y9f3vLziPwJXuU71nuxd6p7uvpc8qbUlNmvlPdod5Iur/GMAcszFAPIesfRxE8jVvtCO
         bjtQK+cSFUTOjHVjI2W0sS95PopLIrPJRv2D3t+4349M93qJeVV0+OlxtqZZg2Ffnd1O
         BZ2XEhdkZG9Qb221XdymcDv8XTg5i6fyHfP7CGOW6XfRR7i08DdEBKoKtcFLGDgwUA8w
         VnbQ==
X-Forwarded-Encrypted: i=1; AFNElJ/5el0ExQBXGYkRvDNLLGCYW5EetNUAym140A+jEsocS9BiQcTOJsP86dqDASqSuz12zg3FTOHCGbtP@vger.kernel.org
X-Gm-Message-State: AOJu0YxiBHoaZFt3Iwl6KYvh7B5jb207Wj6CwJX7uuazACQhQS1ODtJl
	vUFsghIbkfAxjuVnTgtPyHf1DLA4M/5ITEwtvRuRR5U2zW3ebvCcmuYk
X-Gm-Gg: Acq92OGbYvQUSoSb1Oew4n5Tn8eM51UCFVdUVYylKQvv0C7CYr5y+sq8DncCZDlAHap
	suwtx9Rgmu9ff6JjzRdIa+OxU8o5L0+75UgIKE9XbgfqybjiifukdwvoTdO/1xzaV42nhbht0hp
	mN49TMd7sNFF9UMdIhECkCWeKDs0EQpQHtQDpizC4qlIOLPNvQq1LvtAbB1U16lVlqC20iFQd3r
	0rHhBXbCavC3mDWODfn2h7c0chWDL7h/4dQIRPlP9r62RpuWgoZFCe+UbpPPfSehNwsuemBwu8g
	WrEQTLKEDrlC9KvGjUHui7pGnWyodXmVp5/qtN7AFC/Uh/yqZcFYRLyx1pxKXnN9xmqx9XmXSxF
	QQca8FPTbDosgeBpxSe8kDmr+8U4lE6DxwAzt1q53KloqO+SAoR+v+406oPXtmI8JYDqIqPY5qs
	vEDO3csjLAACLGNbRJl2qlMy5x6NrArvKnm8ll1XxlXHNK
X-Received: by 2002:a17:902:cec7:b0:2c1:f29a:b554 with SMTP id d9443c01a7336-2c664271df6mr32125405ad.21.1781339177324;
        Sat, 13 Jun 2026 01:26:17 -0700 (PDT)
Received: from Black-Pearl.localdomain ([49.207.61.84])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2c4330782b2sm45352895ad.67.2026.06.13.01.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 01:26:16 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Sat, 13 Jun 2026 08:24:47 +0000
Subject: [PATCH] dt-bindings: sound: nvidia,tegra30-ahub: Convert to DT
 schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260613-nvidia-ahub-v1-1-5b7e85301736@gmail.com>
X-B4-Tracking: v=1; b=H4sIAM4TLWoC/yXMTQ5AMBBA4avIrDWp0ZC4ilj0ZzAWJS2NRNxds
 fwW710QKTBF6IoLAiWOvPqMqizAztpPJNhlA0pspEIUPrFjLfR8GOHQkpF1i61SkIst0Mjnd+u
 H3/EwC9n9XcB9P2WZ1wlvAAAA
X-Change-ID: 20260422-nvidia-ahub-d2ceb0372744
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.15.2

Convert NVIDIA Tegra Audio Hub (AHUB) binding to DT schema.

The per-SoC differences in reset-names, dma-names, and reg entry
counts described in the text binding are now enforced via allOf
conditionals, making previously prose-only constraints machine
validatable.

Child node CIF ID properties are formally declared under
patternProperties to allow dtschema to validate i2s subnodes.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 .../bindings/sound/nvidia,tegra30-ahub.txt         |  88 ------
 .../bindings/sound/nvidia,tegra30-ahub.yaml        | 299 +++++++++++++++++++++
 2 files changed, 299 insertions(+), 88 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.txt
deleted file mode 100644
index 0e9a1895d7fb..000000000000
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.txt
+++ /dev/null
@@ -1,88 +0,0 @@
-NVIDIA Tegra30 AHUB (Audio Hub)
-
-Required properties:
-- compatible : For Tegra30, must contain "nvidia,tegra30-ahub".  For Tegra114,
-  must contain "nvidia,tegra114-ahub".  For Tegra124, must contain
-  "nvidia,tegra124-ahub".  Otherwise, must contain "nvidia,<chip>-ahub",
-  plus at least one of the above, where <chip> is tegra132.
-- reg : Should contain the register physical address and length for each of
-  the AHUB's register blocks.
-  - Tegra30 requires 2 entries, for the APBIF and AHUB/AUDIO register blocks.
-  - Tegra114 requires an additional entry, for the APBIF2 register block.
-- interrupts : Should contain AHUB interrupt
-- clocks : Must contain an entry for each entry in clock-names.
-  See ../clocks/clock-bindings.txt for details.
-- clock-names : Must include the following entries:
-  - d_audio
-  - apbif
-- resets : Must contain an entry for each entry in reset-names.
-  See ../reset/reset.txt for details.
-- reset-names : Must include the following entries:
-  Tegra30 and later:
-  - d_audio
-  - apbif
-  - i2s0
-  - i2s1
-  - i2s2
-  - i2s3
-  - i2s4
-  - dam0
-  - dam1
-  - dam2
-  - spdif
-  Tegra114 and later additionally require:
-  - amx
-  - adx
-  Tegra124 and later additionally require:
-  - amx1
-  - adx1
-  - afc0
-  - afc1
-  - afc2
-  - afc3
-  - afc4
-  - afc5
-- ranges : The bus address mapping for the configlink register bus.
-  Can be empty since the mapping is 1:1.
-- dmas : Must contain an entry for each entry in clock-names.
-  See ../dma/dma.txt for details.
-- dma-names : Must include the following entries:
-  - rx0 .. rx<n>
-  - tx0 .. tx<n>
-  ... where n is:
-  Tegra30: 3
-  Tegra114, Tegra124: 9
-- #address-cells : For the configlink bus. Should be <1>;
-- #size-cells : For the configlink bus. Should be <1>.
-
-AHUB client modules need to specify the IDs of their CIFs (Client InterFaces).
-For RX CIFs, the numbers indicate the register number within AHUB routing
-register space (APBIF 0..3 RX, I2S 0..5 RX, DAM 0..2 RX 0..1, SPDIF RX 0..1).
-For TX CIFs, the numbers indicate the bit position within the AHUB routing
-registers (APBIF 0..3 TX, I2S 0..5 TX, DAM 0..2 TX, SPDIF TX 0..1).
-
-Example:
-
-ahub@70080000 {
-	compatible = "nvidia,tegra30-ahub";
-	reg = <0x70080000 0x200 0x70080200 0x100>;
-	interrupts = < 0 103 0x04 >;
-	nvidia,dma-request-selector = <&apbdma 1>;
-	clocks = <&tegra_car 106>, <&tegra_car 107>;
-	clock-names = "d_audio", "apbif";
-	resets = <&tegra_car 106>, <&tegra_car 107>, <&tegra_car 30>,
-		<&tegra_car 11>, <&tegra_car 18>, <&tegra_car 101>,
-		<&tegra_car 102>, <&tegra_car 108>, <&tegra_car 109>,
-		<&tegra_car 110>, <&tegra_car 10>;
-	reset-names = "d_audio", "apbif", "i2s0", "i2s1", "i2s2",
-		"i2s3", "i2s4", "dam0", "dam1", "dam2",
-		"spdif";
-	dmas = <&apbdma 1>, <&apbdma 1>;
-	       <&apbdma 2>, <&apbdma 2>;
-	       <&apbdma 3>, <&apbdma 3>;
-	       <&apbdma 4>, <&apbdma 4>;
-	dma-names = "rx0", "tx0", "rx1", "tx1", "rx2", "tx2", "rx3", "tx3";
-	ranges;
-	#address-cells = <1>;
-	#size-cells = <1>;
-};
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.yaml
new file mode 100644
index 000000000000..82738058f672
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.yaml
@@ -0,0 +1,299 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nvidia,tegra30-ahub.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra Audio Hub (AHUB)
+
+maintainers:
+  - Jonathan Hunter <jonathanh@nvidia.com>
+
+description:
+  The NVIDIA Tegra AHUB (Audio Hub) is an audio interconnect block used to
+  route data between various audio clients such as I2S, DAM, SPDIF, and
+  APBIF. It exposes multiple register regions and supports different
+  configurations depending on the Tegra SoC generation. The AHUB also
+  provides a configlink bus for child audio components, which use CIF
+  (Client Interface) IDs to identify their data paths. The number of DMA
+  channels, reset lines, and additional modules varies across Tegra30,
+  Tegra114, and Tegra124 platforms.
+
+properties:
+  compatible:
+    oneOf:
+      - const: nvidia,tegra30-ahub
+      - const: nvidia,tegra114-ahub
+      - const: nvidia,tegra124-ahub
+      - items:
+          - const: nvidia,tegra132-ahub
+          - const: nvidia,tegra124-ahub
+
+  reg:
+    minItems: 2
+    maxItems: 3
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Clock for the D_AUDIO domain
+      - description: Clock for the APBIF interface
+
+  clock-names:
+    items:
+      - const: d_audio
+      - const: apbif
+
+  resets:
+    minItems: 11
+    maxItems: 21
+
+  reset-names:
+    oneOf:
+      # Tegra30: d_audio apbif i2s0-4 dam0-2 spdif
+      - items:
+          - const: d_audio
+          - const: apbif
+          - const: i2s0
+          - const: i2s1
+          - const: i2s2
+          - const: i2s3
+          - const: i2s4
+          - const: dam0
+          - const: dam1
+          - const: dam2
+          - const: spdif
+
+      # Tegra114: adds amx adx
+      - items:
+          - const: d_audio
+          - const: apbif
+          - const: i2s0
+          - const: i2s1
+          - const: i2s2
+          - const: i2s3
+          - const: i2s4
+          - const: dam0
+          - const: dam1
+          - const: dam2
+          - const: spdif
+          - const: amx
+          - const: adx
+
+      # Tegra124: adds amx1 adx1 afc0-5
+      - items:
+          - const: d_audio
+          - const: apbif
+          - const: i2s0
+          - const: i2s1
+          - const: i2s2
+          - const: i2s3
+          - const: i2s4
+          - const: dam0
+          - const: dam1
+          - const: dam2
+          - const: spdif
+          - const: amx
+          - const: amx1
+          - const: adx
+          - const: adx1
+          - const: afc0
+          - const: afc1
+          - const: afc2
+          - const: afc3
+          - const: afc4
+          - const: afc5
+
+  dmas:
+    minItems: 8
+    maxItems: 20
+
+  dma-names:
+    oneOf:
+      # Tegra30: rx0..rx3 tx0..tx3 (n=3)
+      - items:
+          - const: rx0
+          - const: tx0
+          - const: rx1
+          - const: tx1
+          - const: rx2
+          - const: tx2
+          - const: rx3
+          - const: tx3
+
+      # Tegra114/124: rx0..rx9 tx0..tx9 (n=9)
+      - items:
+          - const: rx0
+          - const: tx0
+          - const: rx1
+          - const: tx1
+          - const: rx2
+          - const: tx2
+          - const: rx3
+          - const: tx3
+          - const: rx4
+          - const: tx4
+          - const: rx5
+          - const: tx5
+          - const: rx6
+          - const: tx6
+          - const: rx7
+          - const: tx7
+          - const: rx8
+          - const: tx8
+          - const: rx9
+          - const: tx9
+
+  "#address-cells":
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  "#size-cells":
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  ranges: true
+
+patternProperties:
+  "^i2s@[0-9a-f]+$":
+    type: object
+
+    allOf:
+      - $ref: /schemas/sound/nvidia,tegra30-i2s.yaml#
+
+    properties:
+      nvidia,ahub-cif-ids:
+        description: Pair of AHUB CIF IDs for the RX and TX data paths.
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        minItems: 2
+        maxItems: 2
+
+    required:
+      - nvidia,ahub-cif-ids
+
+    unevaluatedProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra124-ahub
+    then:
+      properties:
+        "#address-cells":
+          const: 2
+
+        "#size-cells":
+          const: 2
+
+        resets:
+          minItems: 21
+          maxItems: 21
+
+        dmas:
+          minItems: 20
+          maxItems: 20
+
+    else:
+      properties:
+        "#address-cells":
+          const: 1
+
+        "#size-cells":
+          const: 1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra30-ahub
+    then:
+      properties:
+        reg:
+          maxItems: 2
+
+        resets:
+          minItems: 11
+          maxItems: 11
+
+        dmas:
+          minItems: 8
+          maxItems: 8
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra114-ahub
+    then:
+      properties:
+        reg:
+          minItems: 3
+          maxItems: 3
+
+        resets:
+          minItems: 13
+          maxItems: 13
+
+        dmas:
+          minItems: 20
+          maxItems: 20
+
+required:
+  - reg
+  - compatible
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - dmas
+  - dma-names
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/tegra30-car.h>
+    ahub@70080000 {
+        compatible = "nvidia,tegra30-ahub";
+        reg = <0x70080000 0x200>, <0x70080200 0x100>;
+        interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&tegra_car TEGRA30_CLK_D_AUDIO>,
+                 <&tegra_car TEGRA30_CLK_APBIF>;
+        clock-names = "d_audio", "apbif";
+        resets = <&tegra_car 106>, <&tegra_car 107>,
+                 <&tegra_car 30>, <&tegra_car 11>,
+                 <&tegra_car 18>, <&tegra_car 101>,
+                 <&tegra_car 102>, <&tegra_car 108>,
+                 <&tegra_car 109>, <&tegra_car 110>,
+                 <&tegra_car 10>;
+        reset-names = "d_audio", "apbif",
+                      "i2s0", "i2s1", "i2s2", "i2s3", "i2s4",
+                      "dam0", "dam1", "dam2",
+                      "spdif";
+        dmas = <&apbdma 1>, <&apbdma 1>,
+               <&apbdma 2>, <&apbdma 2>,
+               <&apbdma 3>, <&apbdma 3>,
+               <&apbdma 4>, <&apbdma 4>;
+        dma-names = "rx0", "tx0", "rx1", "tx1",
+                    "rx2", "tx2", "rx3", "tx3";
+        ranges;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        i2s@70080300 {
+            compatible = "nvidia,tegra30-i2s";
+            reg = <0x70080300 0x100>;
+            nvidia,ahub-cif-ids = <4 4>;
+            clocks = <&tegra_car TEGRA30_CLK_I2S0>;
+            resets = <&tegra_car 30>;
+            reset-names = "i2s";
+        };
+    };
+...

---
base-commit: db7efce4ae23ad5e42f5f55428f529ff62b86fab
change-id: 20260422-nvidia-ahub-d2ceb0372744

Best regards,
--  
Charan Pedumuru <charan.pedumuru@gmail.com>

