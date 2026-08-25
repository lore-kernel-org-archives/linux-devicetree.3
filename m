Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5A13451D6
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 16:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787675008; cv=none; b=iP8Tt775Iq9iWaUaMZiCG74fkzGN9tmMvUnJwfYuN+cZWosrC15A+4ob2SS9AFIjGSefWWwylErfFiYmHeiw7WkN1gLWzHOIv+kE3gIjgG3zalivVSpM5oak5hv7k/o6xB0Jm/uriSs4U+uFyG7qy5beQkvaKS2OLGwDIEYAiqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787675008; c=relaxed/simple;
	bh=ysoHY3SLi8Xlfwy2rIEXN2Q/taJhPUpIC77tj83FcYU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=D7mUO94zK3BWi90nD4o7XxfHx5jHeWOu36G6UqC+Ce0iHwyCrH7V3gjbh/KMd7hY8fIGJQICJkex4Nph31P44IEygjIUjw2jWF4qsEfYLLo9a0q6sql9o5/q1eT1IJ1o21Fz3fEYh8Zffyrfj4iVB37WGCquaJXhysJljmpgnKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZJkxLZ5e; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJkxLZ5e"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cc891373e0so514525ad.2
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 09:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787675007; x=1788279807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1WQ9kthHmMpag/c69Wm9Q+6Otvy5A1GAgbAGrjlGGoE=;
        b=ZJkxLZ5eGpqqdoOsh5D2mHWmP1B75jx5A0wtOtjJFzzwiCBxe4pl7PPGTA+K2K4XCJ
         cdgVOWcMvV5Fn3fQJUW/TboBcsvYn4Im86Hpbq6cXvUr7sYrXLAP6GvuhD6UbtBu4NDh
         GEPZcwuaEhiNcF91mhgus6kOJ8yd9vbKWnDmbHR9edTXLeQQwUkc3AV9Bxn/XwjSlusz
         P52YSWNaE3uyAJE2wc3komRBuPQBidpYiWmWDYrCn3HSBohV5VXSbhm/7DKyk28o6U44
         IdH5Hyo3HYPNaxYmx3EocNnVXhQ5ilbNhrUgIaR8w1hjM1BjkSkpnbdTdvnviU44r2+t
         xkBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787675007; x=1788279807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1WQ9kthHmMpag/c69Wm9Q+6Otvy5A1GAgbAGrjlGGoE=;
        b=gpeUPYa9XAT8kWkDwJbRQfjPNT3A6YAFoxyBXeW6EUEeOKyEDKHpBmvobDRoCIccuu
         SLzLAIEqaepWu0jXrqXFP4IM/YNGSwW9z264JWNWXHoqkhGlZr2DPFCxHfLH7ZBsEr2h
         xyx5LrM74T2/+GhhpfoAQoZLayC7aluFPxM2aTuurFLZW4Gb30DdufMSgNC3FtFFwZxO
         l50WiKdw454Xdyc+5vie4CS1Bz8A358sB7EGeUBv0F8ufiqZcGpPZdSAHXgv3OdzqvQB
         tCzNsj2RQk/OGrFcrJEN0jAcg33GSiXHqYIy7ld9ImDZSdWOPEYnFmlqJKxq+LmJUGAe
         i2WA==
X-Forwarded-Encrypted: i=1; AHgh+RqAgiWtXQ3m9N2jjKj9hc0TeK3b1xqpsQ/7INqN/r68H7T32UX0pQFTqZ85pqQHCVBxHmxCC87aQoWf@vger.kernel.org
X-Gm-Message-State: AFuF++miZOH9/tH0siAeBEg+vjLQ7x1WMyDCDqa5Vi6nIYxy+Ooj1xnC
	akgIDbEt9WERxgo9Ud+ZFR/zan6+caFBOJlk0GF8VAzxcVkPkFv/IIdv
X-Gm-Gg: AR+sD103hi3jaiMegdKMnWsdOWIUIbuVWgkSQUsF62eB/a4geZ+YwFsHzaxEhpmldj+
	K3Ic9rfzyMaU0u2wijAlBRifewaSpHb/789gD5o6bMq+DzNRvM2MpLxMLclyG8n0hL6gefFAL9V
	XVCBGZBxVO16Pzfmfi9/1nSXobO0qnjBybagl1+/XAzdrDV+XKPAnD3aFTOa0573Xn+vFHvMVca
	L3/TviMfKtHAvDg15q3WY/qKeaI7ZsJ/Zlu5DPJlAgsEWwQwIXPK8MiPwvZ+4TrutOAkzhpXE54
	TcbaStsuxkpWnIfxuUQV5N4HQLw7KJEUg2c5uJgJ5ONssjGf+9EykGxsxQF9lh7FEzvbOQo5hfs
	HRC6cUWrXxo0mQblFHml6HFLXPlreDf5vowBBVb4FoTQT1sIVnIBhtHiFDNw5c7qRyqhSNFO3Yd
	WisYvUWDFHJbld+/ee3phezyYtMR4F7X1ErIMrBIEEcrSpuqkjGv5vIJy4aSa6fD0WMffxT4+Pi
	+zWZA==
X-Received: by 2002:a17:903:b85:b0:2d6:ccc5:a3dd with SMTP id d9443c01a7336-2d6ccc5a4dbmr260612805ad.4.1787675006324;
        Tue, 25 Aug 2026 09:23:26 -0700 (PDT)
Received: from inhnjlux1020.ls.ege.ds ([2406:b400:53:dfb:c17a:6cf8:3d2c:cd28])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d704c11ac2sm540925ad.68.2026.08.25.09.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 09:23:24 -0700 (PDT)
From: Udaya Kiran Challa <challauday369@gmail.com>
To: tsbogend@alpha.franken.de,
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
Subject: [PATCH v5] spi: dt-bindings: microchip,pic32mzda-spi: Convert to DT schema
Date: Tue, 25 Aug 2026 21:52:57 +0530
Message-Id: <20260825162257.77042-1-challauday369@gmail.com>
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
Changes since v4:
- Update the binding maintainer to Thomas Bogendoerfer

Link to v4: https://lore.kernel.org/all/20260814083221.34606-1-challauday369@gmail.com/

Changes since v3:
- Change maintainer to SPI subsystem maintainer

Link to v3: https://lore.kernel.org/all/20260617101009.148851-1-challauday369@gmail.com/

Changes since v2:
- Add cs-gpios to required property

Link to v2: https://lore.kernel.org/all/20260615115311.515404-1-challauday369@gmail.com/

Changes since v1:
- Rename schema file to microchip,pic32mzda-spi.yaml
- Update subject prefix to match SPI DT binding conventions

Link to v1: https://lore.kernel.org/all/20260614175005.435826-1-challauday369@gmail.com/
---
 .../bindings/spi/microchip,pic32mzda-spi.yaml | 82 +++++++++++++++++++
 .../bindings/spi/microchip,spi-pic32.txt      | 34 --------
 2 files changed, 82 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/microchip,pic32mzda-spi.yaml
 delete mode 100644 Documentation/devicetree/bindings/spi/microchip,spi-pic32.txt

diff --git a/Documentation/devicetree/bindings/spi/microchip,pic32mzda-spi.yaml b/Documentation/devicetree/bindings/spi/microchip,pic32mzda-spi.yaml
new file mode 100644
index 000000000000..4669b521fa1f
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

