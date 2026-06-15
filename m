Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EE533F589
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 11:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781524403; cv=none; b=GKQdgD535FPl/Qda7IMhIDjyxeydoL+YVxczU9Dqoe6ZWi+SH64iM3sdWfoxjZFe6Vzmal5lSWi4ryRn7DsNzOU+KztQdD7SegJVoXoqgyhJdKk5L6Li6SdSu7tzUdsYkxnPeFd6zf9iZzY42cGt/6N85RollD4YcPgnngqy6EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781524403; c=relaxed/simple;
	bh=qNfWhApLIn68knz8jFgKCbSfs3M9muAtHyTZokIKFsM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=stxTm/RHDsSDqHtu/iVFLDR4MphxpEdN9BrG8d5WpQm1utmUd/9UP7ntfmGFNW4JTUZg4sKsHPDQt2iOCUZgebeB4oInoZKig/n1YcwVDVw/M3SrmCp+32PGq4hO/WoMz9+BBAmKxPDaam6wUWqHYGDq3YN25QYgU8MlsHAQc5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zv9EGHh9; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zv9EGHh9"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c858014845aso1254306a12.1
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 04:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781524402; x=1782129202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3hx1U56gKBEpPZcX4BqQywBeXTuW2Sbo3tnS/H99bS0=;
        b=Zv9EGHh9Gs3zCl1bQcpSlZqj6WEW5fAhsDhIssDfjIY2rV1Mn3nEKG3/N34sxcP7Z8
         WhoBd/D53XMF5akt4lHmQ9sRW9DoMnNnTM7PzANvm4fYSdQacO9KoMlqIoOGnQnVgf3u
         5ZrPQMJvA53xktWW0prK8/CFL4KfUr6LMTN+hHxAn4TBun55v5drUK8UgnoWfIIODrO/
         3L9LMbWKVlCHoPJRaW+eXI56jQx1/04dnfgCQrIgOforlunTNqPYQ/HDavQtCazdokwE
         GDplaB+8E7U2aIBz1IhbSHTprXFxxmy2xIpuN2fcBm+JDlTFCcdywPU9w7gSfxwuUqGr
         JEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781524402; x=1782129202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3hx1U56gKBEpPZcX4BqQywBeXTuW2Sbo3tnS/H99bS0=;
        b=RJpuiSl/zMJdRIAbosELCtzpUA50XxQkPJ0pTS2E5Tff+p1d3YHc/DETVWHjUauxK1
         b17PMZaVe58cqQbo+X+Wi4Dnlyr114cUWyQM0ESoxb/H/SKdFIL1ZhngKVDbldByPvYs
         XxCh6q8DWMLctYpprdj76v+wdSvp3aTJOhiFsQC8pm9Adtb5k936GZrkwjUKwMMTdJCF
         ean1j9I+W5HIwsWwPR3cv9LcsD6Piyl3z8EQLklpAbDCTjYDz3xNvnVKy2Q+MY+MP98p
         TAZjrLtG5ThydlAxzt7ND7CYjdFI/cwGNnbXSEYfndZCOwR4PEDf3ga6TfQkOW0GotNk
         1ntA==
X-Forwarded-Encrypted: i=1; AFNElJ8zaHYSqxFvxZ8sjj9Jn0Ir6bDJvoSF7gTefIVtmXLfGzD6/cFH2S4zIqidF0B4Q5seywPA7IqXpjUG@vger.kernel.org
X-Gm-Message-State: AOJu0Yz13r8UH6FoNlkYFUqbXMIxO2v7PWbTnpwqSgpG+vjmzSXglUvv
	pHD0U6BYgKATTrTPzZLXNPQkbPUO0zK2WURHPIVlkd1QxudZFDFZrS9DuiBiXGUR
X-Gm-Gg: Acq92OEq5RJPB9X1LIKdE9Nimb89q6uGXBBLtnKAud1+O9ACflQJ16lyBW9WdJz8wm6
	3osl0195TbR0sy9H0jXa/CHuwqDSXCRxGjjv+xmxUeyWpiMLVaYhkzEtk/eSGFtGgFsDuwG2FCI
	cTx+VART2fGMd00IZa8o53E8ckStrpxfHyTu5bhY4u8I5PoUGOFBNEGCk0NiaRj1ulxLupNs2zI
	QrbM1FXvDfbUmX+aNVldjKEFQ9KO48zhJVnuUWWS1Wi+5t48PQczDtJPtCUiYOpStxcSD2w2cU0
	3uTNnNb7ZFiC7pDgGXFDPzi62qbQxeHbNHdZk00iS8hd+C0uxE5fQxV8C5ZHdaSLdU2ymOf+2Z/
	bdhMbacPA7u621ksJlvbRyKnJ5agAvNwYUJ9lV+ec9vLO/bF6nZsMIEs8jaROldJtx16/KlbUos
	fOPO8q9uuimXHSQXAHtIqrvV1HIiQwPTkkvKEYpnxvBLE1MYYIVycL
X-Received: by 2002:a05:6a21:458b:b0:38e:92f6:9ab1 with SMTP id adf61e73a8af0-3b78588b46fmr11919000637.22.1781524401875;
        Mon, 15 Jun 2026 04:53:21 -0700 (PDT)
Received: from inhnjlux1020.ls.ege.ds ([117.231.200.47])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c86651adc16sm8242645a12.31.2026.06.15.04.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 04:53:21 -0700 (PDT)
From: Udaya Kiran Challa <challauday369@gmail.com>
To: tsbogend@alpha.franken.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Udaya Kiran Challa <challauday369@gmail.com>
Subject: [PATCH v2] spi: dt-bindings: microchip,pic32mzda-spi: Convert to DT schema
Date: Mon, 15 Jun 2026 17:23:11 +0530
Message-Id: <20260615115311.515404-1-challauday369@gmail.com>
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

Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
Changelog:
Changes since v1:
- Rename schema file to microchip,pic32mzda-spi.yaml
- Update subject prefix to match SPI DT binding conventions

Link to v1: https://lore.kernel.org/all/20260614175005.435826-1-challauday369@gmail.com/
---
 .../bindings/spi/microchip,pic32mzda-spi.yaml | 78 +++++++++++++++++++
 .../bindings/spi/microchip,spi-pic32.txt      | 34 --------
 2 files changed, 78 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/microchip,pic32mzda-spi.yaml
 delete mode 100644 Documentation/devicetree/bindings/spi/microchip,spi-pic32.txt

diff --git a/Documentation/devicetree/bindings/spi/microchip,pic32mzda-spi.yaml b/Documentation/devicetree/bindings/spi/microchip,pic32mzda-spi.yaml
new file mode 100644
index 000000000000..a0a182cdccbd
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/microchip,pic32mzda-spi.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/microchip,pic32mzda-spi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip PIC32MZDA SPI Controller
+
+maintainers:
+  - Thomas Bogendoerfer <tsbogend@alpha.franken.de>
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

