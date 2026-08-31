Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C0138AC78
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 23:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788219180; cv=none; b=eGS6BF08wvb8HlGKGER7nGplq7rcD/bLGadLbZsJHV49EaO125OLlWM4YDeHTRiHRp2L0OTjVzenN2GcdcU8BxQFZghn1wFF405MbXKaCjzuPCuLaq5OHyCeKP3uKp6nCJ1032QLWKAk4x9i/narXDQrcqMV5O9TP3cVRUOCF7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788219180; c=relaxed/simple;
	bh=AoHlLmUVrv0UCPPJiNi0th1LWyobNOZqM6w5kHqkUGA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=czvVNwx6QddtUQDTvMVyz8EeY5bH08upS3YGfziAG1EIjdY3BvHtbb4RDHuezhHZnyjLFhqNjO7C/F3YcmjtFNIOJk4Lx16hAmagHFhWAwulzNMCc6RJ4uY0DQWwWLX7WbViCx4zLzu4yPdA43IsQsZWQBJdKB15e0RKUVyNyL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IbBGBvrO; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IbBGBvrO"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cb20b0a387bso412849a12.0
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 16:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788219178; x=1788823978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oe/+b6soCrWQD2YEO2XBQ9XzBFUniWrh2jlWRQSn7jg=;
        b=IbBGBvrOSJy5vBhr6IO0GICD5yQAgJ9gQ3jYZ9xlc8eTD2eXtHh3yY72o+58uJF1Sa
         TILji0ot6YlVRHftEap9jGEEn74Zc4FlFq61ws6iOY/GZTL72RNj1FsSQpM+tVvvTKOS
         y4iSJV7wl/v7dx3Sy1Yp+mx8x2HmjPDDG+jdK7Ja/43jqhfW3lWzlqTihP8iUiLTd+Mm
         PtC5GYsIsgQK/qlQdDRGFfmCCObK8a7zKx1eMIL/5AD3dj3tuVKlfIdopyUukFWJ/Hd+
         Q94viQU0c5hgrH77cI4h1zJI/49b5cRxC/8AcaU7oiLYnfeIcoE5J+iAM2HMFAm80LA9
         BOWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788219178; x=1788823978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oe/+b6soCrWQD2YEO2XBQ9XzBFUniWrh2jlWRQSn7jg=;
        b=qIlrckfGdNu2JTSQ8TwFjmDVsPgIEQEt+BidKtvO2KWpTL2LYVhv088w3ofFNATryj
         EiH/rCLHeIjw1OGM1D2aWsawHYWzhF9Cg+Hx5ULkJJzR3PmiBjsFaeQtRT/jwwA7pWcC
         RHrG9/qHGvlxKifHk1764B8jTARejgTrt4aQaqxrYh1hT6NChIdJcOWpunp51Mp0O5jI
         0XqguyoQ/hWFmHmXHyOsRBOKOCul96kdbuHw2GdJwyyze6shsy2TfEDixaiQchBSdjGm
         wmuMCgVp3JAX1YYDpd//NGTPzr+jae5q5/EJiUFMPzB5fWI0Qbx8YYGMuk+N/qcH8dKu
         OPBQ==
X-Forwarded-Encrypted: i=1; AHgh+RpXPcZ1zjzbiWtqcvGc1kFPTG8n2WTfCqMpmQFuUYyR5F7dMIK87UMj2fctyMhZ80RsWT2G/AGeDz8F@vger.kernel.org
X-Gm-Message-State: AFuF++mjxv0tbEooihUv2RvYPYGEBEPsmdJoKeoiUFuA+I5n4Tqj9P/j
	pKq0ZsGI4TC6AITuUt5r0exGf6jA7oxQvZHwPNiIY4DjWRwvkGt+bFVU
X-Gm-Gg: AR+sD12inaPe1k0WphMmXC4LblgWuhgrv7Z+3VUd0kTUWBOy8n8xsmDJ1UtMtz8NQq7
	pB1ddENJ/9a0TAPg+NsGLVGQxN33JilZFUXRCDVdzK+NnR2FtGQs6Vwt5V+PQv3CtnSGuSCAVuM
	PP9YuyqWMeg/JWoI9bb8Nrxm8evNJ/21Ca27mbzWGsiXYgmXWzGjtCS1DBS5jN7wkLewcfKld9x
	pEypy9suyWGt9sU4ghOt7F7QBx7NYA3mdKmYQL59OSxA5p5o1LaRuRHE0IWhfs+eqomRMNKg7lJ
	6HQF3aMEU5h8IwTzeA2TXL6Xrot+9W+pti1vnwHqDE4acUzmukVe3AANkZF+/EKUW5DlZV6HOcl
	owIHnUCchktuZmDsZHfIkfbmadYLYKt4TNAm/q/p7uWtZ9sJt7u40V7keGTwZzDoAxSEh/+yhMF
	951Kqrpm2qyamTSkpRWQymgfiMXKzH8bU4q+kVVM2sObM4db9ZBlR9pZFPM/3NCUhW7wrzXBo=
X-Received: by 2002:a05:6a00:4449:b0:851:c2bd:43d1 with SMTP id d2e1a72fcca58-85628a85b9amr17918783b3a.1.1788219177621;
        Mon, 31 Aug 2026 16:32:57 -0700 (PDT)
Received: from [10.60.78.252] ([2409:40c2:5002:4362:354a:8f21:7ceb:c8a6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85be5ca747csm154393b3a.5.2026.08.31.16.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 16:32:56 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 01 Sep 2026 05:02:11 +0530
Subject: [PATCH v4 2/2] spi: dt-bindings: ti,davinci-spi: Convert to DT
 schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-ti-davinci-spi-v4-2-92e9c0b2e1d4@gmail.com>
References: <20260901-ti-davinci-spi-v4-0-92e9c0b2e1d4@gmail.com>
In-Reply-To: <20260901-ti-davinci-spi-v4-0-92e9c0b2e1d4@gmail.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788219139; l=9793;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=AoHlLmUVrv0UCPPJiNi0th1LWyobNOZqM6w5kHqkUGA=;
 b=oN0aF37xkqWQ77+dtc3pNHFk+Lt7OJhSd5aVl2EXhCB1gPISphfMF7RK5YTESE9gEtwxsKG13
 8chIjncM9KaBObhgfSUpcJOaSE1hJFrPqSawPdXcAN+WQA3ibfiyyKw
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the TI DaVinci/Keystone SPI controller binding from text format
to DT schema.

Changes during the conversion:
- Create a separate ti,davinci-spi-peripheral-props.yaml schema to
  properly define the ti,spi-wdelay peripheral property.
- Add missing dmas and dma-names properties.
- Add constraints to ti,spi-wdelay based on the 6-bit width
  of the SPIFMTn.WDELAY hardware register field.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/spi/spi-davinci.txt        | 100 -----------------
 .../bindings/spi/spi-peripheral-props.yaml         |   1 +
 .../spi/ti,davinci-spi-peripheral-props.yaml       |  25 +++++
 .../devicetree/bindings/spi/ti,davinci-spi.yaml    | 124 +++++++++++++++++++++
 4 files changed, 150 insertions(+), 100 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/spi-davinci.txt b/Documentation/devicetree/bindings/spi/spi-davinci.txt
deleted file mode 100644
index f012888656ec..000000000000
--- a/Documentation/devicetree/bindings/spi/spi-davinci.txt
+++ /dev/null
@@ -1,100 +0,0 @@
-Davinci SPI controller device bindings
-
-Links on DM:
-Keystone 2 - https://www.ti.com/lit/ug/sprugp2a/sprugp2a.pdf
-dm644x - https://www.ti.com/lit/ug/sprue32a/sprue32a.pdf
-OMAP-L138/da830 - http://www.ti.com/lit/ug/spruh77a/spruh77a.pdf
-
-Required properties:
-- #address-cells: number of cells required to define a chip select
-	address on the SPI bus. Should be set to 1.
-- #size-cells: should be zero.
-- compatible:
-	- "ti,dm6441-spi" for SPI used similar to that on DM644x SoC family
-	- "ti,da830-spi" for SPI used similar to that on DA8xx SoC family
-	- "ti,keystone-spi" for SPI used similar to that on Keystone2 SoC
-		family
-- reg: Offset and length of SPI controller register space
-- num-cs: Number of chip selects. This includes internal as well as
-	GPIO chip selects.
-- ti,davinci-spi-intr-line: interrupt line used to connect the SPI
-	IP to the interrupt controller within the SoC. Possible values
-	are 0 and 1. Manual says one of the two possible interrupt
-	lines can be tied to the interrupt controller. Set this
-	based on a specific SoC configuration.
-- interrupts: interrupt number mapped to CPU.
-- clocks: spi clk phandle
-          For 66AK2G this property should be set per binding,
-          Documentation/devicetree/bindings/clock/ti,sci-clk.yaml
-
-SoC-specific Required Properties:
-
-The following are mandatory properties for Keystone 2 66AK2G SoCs only:
-
-- power-domains:	Should contain a phandle to a PM domain provider node
-			and an args specifier containing the SPI device id
-			value. This property is as per the binding,
-
-Optional:
-- cs-gpios: gpio chip selects
-	For example to have 3 internal CS and 2 GPIO CS, user could define
-	cs-gpios = <0>, <0>, <0>, <&gpio1 30 0>, <&gpio1 31 0>;
-	where first three are internal CS and last two are GPIO CS.
-
-Optional properties for slave devices:
-SPI slave nodes can contain the following properties.
-Not all SPI Peripherals from Texas Instruments support this.
-Please check SPI peripheral documentation for a device before using these.
-
-- ti,spi-wdelay : delay between transmission of words
-	(SPIFMTn.WDELAY, SPIDAT1.WDEL) must be specified in number of SPI module
-	clock periods.
-
-	delay = WDELAY * SPI_module_clock_period + 2 * SPI_module_clock_period
-
-Below is timing diagram which shows functional meaning of
-"ti,spi-wdelay" parameter.
-
-             +-+ +-+ +-+ +-+ +-+                           +-+ +-+ +-+
-SPI_CLK      | | | | | | | | | |                           | | | | | |
-  +----------+ +-+ +-+ +-+ +-+ +---------------------------+ +-+ +-+ +-
-
-SPI_SOMI/SIMO+-----------------+                           +-----------
-  +----------+ word1           +---------------------------+word2
-             +-----------------+                           +-----------
-                                          WDELAY
-                                <-------------------------->
-
-Example of a NOR flash slave device (n25q032) connected to DaVinci
-SPI controller device over the SPI bus.
-
-spi0:spi@20bf0000 {
-	#address-cells			= <1>;
-	#size-cells			= <0>;
-	compatible			= "ti,dm6446-spi";
-	reg				= <0x20BF0000 0x1000>;
-	num-cs				= <4>;
-	ti,davinci-spi-intr-line	= <0>;
-	interrupts			= <338>;
-	clocks				= <&clkspi>;
-
-	flash: flash@0 {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		compatible = "st,m25p32";
-		spi-max-frequency = <25000000>;
-		reg = <0>;
-		ti,spi-wdelay = <8>;
-
-		partition@0 {
-			label = "u-boot-spl";
-			reg = <0x0 0x80000>;
-			read-only;
-		};
-
-		partition@1 {
-			label = "test";
-			reg = <0x80000 0x380000>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
index 880a9f624566..cb5d608998e1 100644
--- a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
@@ -155,5 +155,6 @@ allOf:
   - $ref: fsl,dspi-peripheral-props.yaml#
   - $ref: samsung,spi-peripheral-props.yaml#
   - $ref: nvidia,tegra210-quad-peripheral-props.yaml#
+  - $ref: ti,davinci-spi-peripheral-props.yaml#
 
 additionalProperties: true
diff --git a/Documentation/devicetree/bindings/spi/ti,davinci-spi-peripheral-props.yaml b/Documentation/devicetree/bindings/spi/ti,davinci-spi-peripheral-props.yaml
new file mode 100644
index 000000000000..1060f176c6cb
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/ti,davinci-spi-peripheral-props.yaml
@@ -0,0 +1,25 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/ti,davinci-spi-peripheral-props.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI DaVinci/Keystone SPI Peripheral Properties
+
+maintainers:
+  - Bartosz Golaszewski <brgl@kernel.org>
+
+description:
+  Peripheral-specific properties for SPI devices attached to a TI
+  DaVinci/Keystone SPI controller.
+
+properties:
+  ti,spi-wdelay:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 63
+    description:
+      delay between transmission of words (SPIFMTn.WDELAY, SPIDAT1.WDEL)
+      must be specified in number of SPI module clock periods.
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/spi/ti,davinci-spi.yaml b/Documentation/devicetree/bindings/spi/ti,davinci-spi.yaml
new file mode 100644
index 000000000000..672d03d2492b
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/ti,davinci-spi.yaml
@@ -0,0 +1,124 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/ti,davinci-spi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI DaVinci/Keystone SPI Controller
+
+maintainers:
+  - Bartosz Golaszewski <brgl@kernel.org>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - ti,da830-spi
+          - ti,keystone-spi
+          - ti,dm6441-spi
+      - items:
+          - const: ti,keystone-spi
+          - const: ti,dm6441-spi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+    description:
+      Should contain a phandle to a PM domain provider node
+      and an args specifier containing the SPI device id
+      value.
+
+  num-cs:
+    minimum: 1
+    default: 1
+    description:
+      Number of chip selects supported by the controller. This
+      includes both internal and GPIO chip selects.
+
+  ti,davinci-spi-intr-line:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    description:
+      Interrupt line used to connect the SPI IP to the interrupt
+      controller within the SoC.  The SPI peripheral can route its
+      interrupt output to one of two lines (INT0 or INT1). Set
+      this based on the SoC-specific wiring to the interrupt
+      controller.
+
+  dmas:
+    items:
+      - description: RX DMA channel
+      - description: TX DMA channel
+
+  dma-names:
+    items:
+      - const: rx
+      - const: tx
+
+  "#address-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - ti,davinci-spi-intr-line
+  - num-cs
+  - "#address-cells"
+  - "#size-cells"
+
+allOf:
+  - $ref: spi-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          const: ti,keystone-spi
+    then:
+      required:
+        - power-domains
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    spi@20bf0000 {
+        compatible = "ti,keystone-spi", "ti,dm6441-spi";
+        reg = <0x20bf0000 0x1000>;
+        num-cs = <4>;
+        ti,davinci-spi-intr-line = <0>;
+        interrupts = <338>;
+        clocks = <&clkspi>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        flash@0 {
+            compatible = "jedec,spi-nor";
+            spi-max-frequency = <25000000>;
+            reg = <0>;
+            ti,spi-wdelay = <8>;
+        };
+    };
+
+  - |
+    spi@41000 {
+        compatible = "ti,da830-spi";
+        reg = <0x41000 0x1000>;
+        num-cs = <6>;
+        ti,davinci-spi-intr-line = <1>;
+        interrupts = <20>;
+        dmas = <&edma0 14 0>, <&edma0 15 0>;
+        dma-names = "rx", "tx";
+        clocks = <&psc0 4>;
+        power-domains = <&psc0 4>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+    };

-- 
2.55.0

