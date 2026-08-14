Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C4D45A28C
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 09:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786698716; cv=none; b=Qu9eCIGFu5tl/YiWm+TyXWAYm1TwatGemNlQrqm/q3ZsakC3fPMkgYBr2sSKxwIYD9Oq9jAOU57jCBE/g/f0H0mjpHJaFDVa5XcffiNyH2+BGWz6ODDTe426TC6sXOaTmf0xJJrMy09y6uG7Eyuxc1i/DwYBPP8Qhp2RsWiv+18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786698716; c=relaxed/simple;
	bh=b1flEFBBB5pSRywJbhy0tWS1DoKL3Xvpz+gL+1tBUlo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eTXwtdpFX5HFkFV+60S/jVl0RdG+IVj8TOTva9BEVPlfXdntmNeoOvfUYVVSLnXKR8WPtFMMJ6L+7MVkaqLeJ0g8CXka285xUg5xH+p7pNqjszXDl6W3wHL/twiFe9a3iBwS0NlfPDotCCyQB7vP9ZWBOq831SYfCUQwqQl3WBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YuHTWmpM; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YuHTWmpM"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so10720935ad.0
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 02:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786698714; x=1787303514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sh0jELV6wXAl8geoy8ozmQkFmiQd9XY1RhSMTEwwSY0=;
        b=YuHTWmpM/r4nDvtxH9NbyfC/PocxJH1vJhbOtlEcGXLzDc3Wntxi1jwC/TC/yRQGuG
         yXMY30h5eAePIDnfZoOIoJIO76vDX2XBdA1HYSlrKivPAPkUyWXiVIJA0GvgaC5tfLaJ
         RuxqlrxVgDF7XWUIkuPAZd1S6A+mtbbSQsvj3CdlTP7Cj0vnTriC0qaacN1iicZ/vKeg
         R1az962jTmhQYzKUSo70cifL9qB2VvNnEyPFtzXWWWXkLOjIF0YJmYvTs2/Bac4nLe5R
         MEdSTtVdiKCeeKKtnWK95Uzu596xvb7hzLZBz7+eVKDl9OAyQ5CcZO49olUCB/bvDp97
         rv8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786698714; x=1787303514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sh0jELV6wXAl8geoy8ozmQkFmiQd9XY1RhSMTEwwSY0=;
        b=LTIgIX1pQhwf1/sPRgd93DklDFyGmEOI3A8hxnTAzoP3y2PvGDmSBK9rHS1w5sF93U
         41O8ukqX4yraLrSpKxsimO+QLgVjiZivDp1QoN4xbo4xwpz+1Gxjk2pKTd//gXsfZG6g
         vu/7udZwnH3gBAg637OlSi6reLM6ZryztI8XFHwcKL/a6eebmTKPN4g6XDJSOX7IoQn/
         Ex2/ZF8P4s0FQYH3fFFIwLKxos4lFRACPJVA9WjdK5Eb3VLHIKAczeZFs2ZIQ6EXdatD
         9A2qCyqWCBmcPfhUpHmLPjiaA5VkZl/jD9rkBJGR/vgr2Vh3NR0qvlkJqTqT36QIUcgr
         wd5g==
X-Forwarded-Encrypted: i=1; AHgh+RorZYvtoJQTV0vkHVSFnoZ6JLYqcpfNgAOfJfTs2/oin6fTydSTfLUk4oaxZRUF2TKL9w77oHC+iufR@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8UyS3IAIczqdrYc2czxBfdgYWezaP4jyVVx1kU/+RBhSZJl88
	Ny5Qu4luIC0StpOBrMI9Ac685YrekcRlUMF5SRjGfiueNb/phCG5Z2I8
X-Gm-Gg: AR+sD12/2Fu0HhVuAH8i9VbTYQBJIW5GrFn01Fo8V0JN5W4uVfhnawkede0b85Z7rR/
	/GZV/h+pRaFTI47Dsns6Ea093PaJm2GLQkVZYZH8RkEu8w/Om8vmFRoyKVifJiYk7RKoKQI0VjL
	nfFe46HyWcX8Tqprnb2P31461zJ5cj+dbaoIWBYCWFzwlM7T4U5wA05+pqXjCNDkmhvT1ZIzcwW
	Xl4X5LA3j7OdZZYB/7VCNi+R/C+YDXtB29ZnnSjxRCTxWTVgIz9ic8o7C1AyvHQOGIXGzXNar4/
	qFXwIuWvT47I/8835iXDs8YV/XKQ+Ei+Y7eBxExvUkGf4hs3MCf7OcFcbYDOwwEr8dkVVHXRhMI
	loMwnjh+hGQ0vHCKkF2QeuM9zrPl4/rCCYj5Sy/JqpvN6pOhn4NoFwE/uJQQDN7mkjM43Z94rbY
	IWftDps9qV4N6ds7aJw8jHtwsWuLfpLiq2F95f9ORUaCnyTASVQbZiFKhTFMnRICRzsR8m77lCL
	8Anu3OyuNy6ZvnNTQ==
X-Received: by 2002:a17:903:1ac3:b0:2ca:d9b3:715e with SMTP id d9443c01a7336-2d3b088ac7fmr57723285ad.9.1786698713992;
        Fri, 14 Aug 2026 02:11:53 -0700 (PDT)
Received: from inhnjlux1020.ls.ege.ds ([2406:b400:53:97cb:f41d:ee6c:db4b:ab7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3aeb88bddsm6702765ad.63.2026.08.14.02.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 02:11:53 -0700 (PDT)
From: Udaya Kiran Challa <challauday369@gmail.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Udaya Kiran Challa <challauday369@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4] spi: dt-bindings: microchip,pic32mzda-spi: Convert to DT schema
Date: Fri, 14 Aug 2026 14:02:21 +0530
Message-Id: <20260814083221.34606-1-challauday369@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert Microchip PIC32 SPI controller devicetree binding
from legacy text format to DT schema.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
Changelog:
Changes since v3:
- Change maintainer to SPI subsystem maintainer

Link to v3: https://lore.kernel.org/all/20260617101009.148851-1-challauday369@gmail.com/

Changes since v2:
- Add cs-gpios to required property

Link to v2: https://lore.kernel.org/all/20260615115311.515404-1-challauday369@gmail.com/

Changes since v1:
- Rename schema file to microchip,pic32mzda-spi.yaml
- Update subject prefix to match SPI DT binding conventions

Link to v1:https://lore.kernel.org/all/20260614175005.435826-1-challauday369@gmail.com/
---
 .../bindings/spi/microchip,pic32mzda-spi.yaml | 82 +++++++++++++++++++
 .../bindings/spi/microchip,spi-pic32.txt      | 34 --------
 2 files changed, 82 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/microchip,pic32mzda-spi.yaml
 delete mode 100644 Documentation/devicetree/bindings/spi/microchip,spi-pic32.txt

diff --git a/Documentation/devicetree/bindings/spi/microchip,pic32mzda-spi.yaml b/Documentation/devicetree/bindings/spi/microchip,pic32mzda-spi.yaml
new file mode 100644
index 000000000000..2ef3480fa63e
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/microchip,pic32mzda-spi.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/microchip,pic32mzda-spi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip PIC32MZDA SPI Controller
+
+maintainers:
+  - Mark Brown <broonie@kernel.org>
+
+allOf:
+  - $ref: spi-controller.yaml#
+
+properties:
+  compatible:
+    const: microchip,pic32mzda-spi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Fault interrupt
+      - description: Receive interrupt
+      - description: Transmit interrupt
+
+  interrupt-names:
+    items:
+      - const: fault
+      - const: rx
+      - const: tx
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: mck0
+
+  cs-gpios:
+    maxItems: 1
+
+  dmas:
+    items:
+      - description: RX DMA channel
+      - description: TX DMA channel
+
+  dma-names:
+    items:
+      - const: spi-rx
+      - const: spi-tx
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - cs-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi@1f821000 {
+        compatible = "microchip,pic32mzda-spi";
+        reg = <0x1f821000 0x200>;
+        interrupts = <109 IRQ_TYPE_LEVEL_HIGH>,
+                     <110 IRQ_TYPE_LEVEL_HIGH>,
+                     <111 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "fault", "rx", "tx";
+        clocks = <&PBCLK2>;
+        clock-names = "mck0";
+        cs-gpios = <&gpio3 4 GPIO_ACTIVE_LOW>;
+        dmas = <&dma 134>, <&dma 135>;
+        dma-names = "spi-rx", "spi-tx";
+    };
diff --git a/Documentation/devicetree/bindings/spi/microchip,spi-pic32.txt b/Documentation/devicetree/bindings/spi/microchip,spi-pic32.txt
deleted file mode 100644
index 79de379f4dc0..000000000000
--- a/Documentation/devicetree/bindings/spi/microchip,spi-pic32.txt
+++ /dev/null
@@ -1,34 +0,0 @@
-Microchip PIC32 SPI Master controller
-
-Required properties:
-- compatible: Should be "microchip,pic32mzda-spi".
-- reg: Address and length of register space for the device.
-- interrupts: Should contain all three spi interrupts in sequence
-              of <fault-irq>, <receive-irq>, <transmit-irq>.
-- interrupt-names: Should be "fault", "rx", "tx" in order.
-- clocks: Phandle of the clock generating SPI clock on the bus.
-- clock-names: Should be "mck0".
-- cs-gpios: Specifies the gpio pins to be used for chipselects.
-            See: Documentation/devicetree/bindings/spi/spi-bus.txt
-
-Optional properties:
-- dmas: Two or more DMA channel specifiers following the convention outlined
-        in Documentation/devicetree/bindings/dma/dma.txt
-- dma-names: Names for the dma channels. There must be at least one channel
-             named "spi-tx" for transmit and named "spi-rx" for receive.
-
-Example:
-
-spi1: spi@1f821000 {
-        compatible = "microchip,pic32mzda-spi";
-        reg = <0x1f821000 0x200>;
-        interrupts = <109 IRQ_TYPE_LEVEL_HIGH>,
-                     <110 IRQ_TYPE_LEVEL_HIGH>,
-                     <111 IRQ_TYPE_LEVEL_HIGH>;
-        interrupt-names = "fault", "rx", "tx";
-        clocks = <&PBCLK2>;
-        clock-names = "mck0";
-        cs-gpios = <&gpio3 4 GPIO_ACTIVE_LOW>;
-        dmas = <&dma 134>, <&dma 135>;
-        dma-names = "spi-rx", "spi-tx";
-};
-- 
2.34.1

