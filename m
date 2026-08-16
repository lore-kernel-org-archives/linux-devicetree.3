Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716C83B774B
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 21:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786917379; cv=none; b=tIuRRHvdK/B6udIQDbdYmJqKQOfKC1NUnZfbVHwhGU0MLi3ctvoeSZ2uDH3mOkATF0TQug5gYff8RJ+POJuBdh4wotExSI08jR+ZjFudXjBfxk/M+zz3U4mGF3cAUkIBdUpyPbsv9P68PV5+9h9/N/3PbwwDOe1PlgWbfV517zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786917379; c=relaxed/simple;
	bh=/zVpg1CccNxq2uZbj+73+VsP1dk+Mxi9XXjr+VzDYGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DrVDkz787mSPKRvvChK97eBgPkS/z1fbsMtwsBYD1OME2BmbaToknsMmqAqvDKW/GEEW+LGng8+Fmr/jwszM44p93lZcN8UuMqfomSTNKAd/VsChQ4WHhqWCHyqC/Acf4iT2Y8V9BKnLuOG93TmnFGiUkZ2fz60sgnOUgewPy6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YBCN6hVy; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YBCN6hVy"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d5862bc921so1517245ad.1
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 14:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786917377; x=1787522177; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O180+pg027B8ZaRGPW3uwegO/XOQQBIPH2jwBsrM9lU=;
        b=YBCN6hVy3AezogqSLC3gh3iGar32yVXD9aKAnwNBpFZuQLTcXWHE2ELfIVBf4LOYPh
         JXmfHzpVTD0vH/+d0z0Ca5Tk+PHfRVlkI48FDhk6Vmp74NPpoNTtqiE0KQzTYVClaHPd
         utORoV2Ju43MeWUeCJXjKfXxeO1o9bTL76LewjnHlT3Mg0X4MxupNsllY8a1zRZzhbTh
         penYQS7V+8BmLvUCb2TXiy/ojYgx2sB1WsSthMXyZ+7KZ3BW0nv18+YpdqzlrqYlW8cu
         /E/Bl5jdV9k57DVO6V5OzIsVkI38NlBffShBuG6KPo+4fSHQ9LPbrQEsbuZo5Jzy7E2y
         Cq4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786917377; x=1787522177;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O180+pg027B8ZaRGPW3uwegO/XOQQBIPH2jwBsrM9lU=;
        b=crYLNqapdHCmc1F7X17sViPsdiSmrALphz+L5NbXdfEozXHvSFpCQeakSSO75FlAIu
         OASIqPMK/6uD7UOK7PyT8h4Pd7ze2l4lP0Tf9wrNDb8u3kwO+t3fe0+zUqu17R3xC2+4
         xlTx9b2PZ3pB/P04iNt854aolbvWyfYM+dPirCm17sKeVjANRhp1RgZ6HMhg7wT+IP5k
         T07prPmunfObdBAw3MJQEdtgqxsSiBPPXMFQjtS091tXoG8yfwSTbNHSU9lGU3cdSJGG
         PDNmDn3A2uOPpgrVAuzrcN4KoOM0k7vBVXyaZhNl3Vak2onntQTmSBTOxPwt/zBT+4Qt
         Djmg==
X-Forwarded-Encrypted: i=1; AHgh+Rq0/cXIk7Z5zdgTD1HNWzV7m0uGsrUNO18nwbJDj8/Umb0wuTUVxqrHvEIaG1U9sc4GXL5FxvwT70PN@vger.kernel.org
X-Gm-Message-State: AOJu0YwT4X/kyZvjAXWqWp3dfsAmr8IoiZVMNOaOQiOWudS5QlRlH0OC
	3QV9EcgpjCodEGdenWFxMEHoGqgD2Y/MMa8LAYGUNbnxLdg6toEsPvS5
X-Gm-Gg: AR+sD137ykTdNPj+RypIV4X5c1MZCJph9sYBknK687rVdLD+WQEz9sCKbN/BfVSDmFc
	FqVo/Ov1MzqD9qD0K+Z1QpiFKE+IwpeGMG0G827MBF9cpyw3YetQElJfYzSiMLMhfKcjWIM1Z1W
	2LgEjI85wx98KJuPobd4Lx5oCFNMnfLA00csIhSof5LAzNaEVvnbnAm0IWuw5KU1vDIgFxtkEFe
	oauHUE3u5IdgTPX4WKOyZhsY85ETMOa7zDMTJeltmbv6MgKSrTEl7KOl37wuDBbZiqoJtxKj/nm
	4EhsXkJC69gZhxGagJlvEfp57Pe7rAOxVYTox0wsMuwk+FrLpnVv4BHXOORJqITkil256j8RMia
	Jg2D4V7sCyMj0X0XsavaG7v4BW6BdUEPGaR6BnNdPiCNFzZbLYDqZMGLUeykIcY69ujgQcexxLg
	C08aah5KkhHXqNta3b7VEpmpxYiEeQLpPvaJQw02YIiZrCUbeXOjZhKPbhWXARqvDEwzcADDMoT
	g==
X-Received: by 2002:a17:90b:35c4:b0:38e:91a8:fb85 with SMTP id 98e67ed59e1d1-3933b8c4c87mr15487152a91.3.1786917376578;
        Sun, 16 Aug 2026 14:56:16 -0700 (PDT)
Received: from [10.112.173.252] ([2409:40c2:504e:1c5e:cbdf:b953:2369:869e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d60eb8eesm30168318eec.10.2026.08.16.14.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 14:56:16 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Mon, 17 Aug 2026 03:25:26 +0530
Subject: [PATCH v3 2/2] dt-bindings: spi: ti,davinci-spi: convert to DT
 schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-ti-davinci-spi-v3-2-23844cfb5e6a@gmail.com>
References: <20260817-ti-davinci-spi-v3-0-23844cfb5e6a@gmail.com>
In-Reply-To: <20260817-ti-davinci-spi-v3-0-23844cfb5e6a@gmail.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786917340; l=9742;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=/zVpg1CccNxq2uZbj+73+VsP1dk+Mxi9XXjr+VzDYGI=;
 b=ZliuSqiZHLfwNTHgXM1xP7wJBe0D+XLjexZuqtkvFbJgWUR8nOfdQl5N/B//QqumPoZbyENqv
 Svaujf+lZgYC9AKThC3jLG1nMm1efu9I/AT9OPu8NjvmMbhrgilNANN
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
index 000000000000..5bf74f3ca588
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
+        compatible = "ti,keystone-spi","ti,dm6441-spi";
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

