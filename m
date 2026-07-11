Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F54E4499AC
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 11:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783767769; cv=none; b=FpdsXv48FyZpdnSyGw4+8Agh+TRCnYAbx4Vdc/XwK4lHWUOLMiXNBNN5gQhz8Aj36fvgxLPvgH1BWIhG9gpr05pvstRWwccfH79TNEgRJqu3WC4vd8x8R5qJNYeJi+E+3BxtTyuRLsYvZXQBknLE4nJzNd+48kqBVGu1XhY3YMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783767769; c=relaxed/simple;
	bh=EHTpCHdZwja+uN3Dg/J4DQCi+rw6FIewOGElpjfS2sg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g68RLrZwsbMQkVSNtQfUrNq8hKnmaL0vpitZ/i3jQp2w9Cz1IaGI6lfbcTQOxtA02AoyR6ZoyJ3JGQQoaHpnBt+GzjA9nIqb10KRhCFKfxbwXQE8z+CTdLb9KT2n9Mf0188muP6xI/g7CTDys7BoGCAvwTNaQvCV80d8aFqGDsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kp7MPdQh; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kp7MPdQh"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so1290313f8f.2
        for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 04:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783767767; x=1784372567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C8cGHLB3QT8sUHUeTZCVrftP4bgQmCTXrZx4FHEvx00=;
        b=Kp7MPdQheAJiwAi+m7hQUCOvEm9d2MELzlYdLqEuyzkKVsvkDPtkwy2dGNK+lHm4Sm
         uHWFLku85Xlf2W7Vk4WeV4BlSbaX8zsnqmkIc6KRoEKz4NGQgRRk7pnY8wHcHUDKLc5q
         JG4rTM5gdFQmIMreforRkJ5rT3NpjsqIBoSk1bUvexMfqywIJ+Cjz+XeqyRByP4BnRH+
         nhNpi7VrumiK6TXu8eD0athAxqkL1rlMaO0BXxPx/20IqpAaQGUODJ3jvQ+WirNVNls1
         lv5Yy7nfs41DLJ7NpV2RhO6tAmfU79roF7LCi3SkyMJp4p27e+WuQL38RxuD/RGId2UC
         rZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783767767; x=1784372567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C8cGHLB3QT8sUHUeTZCVrftP4bgQmCTXrZx4FHEvx00=;
        b=ryhpj1F1sFITn7Vax7IEuBKLqd+k4KbIKeAOCtalnvTUA7wxlOqx+Lsm7uIiydRdQf
         NZVs6toRtDJxEEFTW52P+waZv2p+SVcVmWrOT2eKRxYTr05mMdyR3gZSHw954Rs3ePn7
         U+8rg7ahU/gH1aC6PRRtnIOgMiNF7tUV8X510UhJPPAu6akx1vfqOghUgksjo4fmXNKs
         DN5u++PMvtlxQI87nONpFlxss7d0yc6o8fxFql21PCPjm1MTyWGmEoK2iy98s9V2rcDz
         Qn2KlAd4cy/Fudk/juR5r8FK8QhaUqrzFftZCaaMpubOdRn4txuNTBZgBMORPr7AWqH2
         RruA==
X-Forwarded-Encrypted: i=1; AHgh+Rrbtu+rYOjFQ0Pbzb6opN60eSH9DcFrQE7lt9AafatW9nOE7DzHWZ8PtqHT80JXJWGKhqOCra5xeHdv@vger.kernel.org
X-Gm-Message-State: AOJu0YzMW1f47dHhanWL1Y0I2EO/hrsgzI1p5rHsTGZ20yYrkMEV7jOh
	PHVbwDna5792z2S6VXUsnEhDcCiDwNxAcUzeGWfx0kXNxWDG04mQ/dsX
X-Gm-Gg: AfdE7cmfTq9ryITyYK2dI4vOstT9YIJWdnWFYNHffi+dXMjuSKRtTGLU3fTBkYCPJpa
	wMc/h0kMho4D9SQXKquHFZCfCOKnnM05K2UbpVT7RfjI5O27pxd3pZ5tdPCwUR+gNeB2EKvbNBr
	cvA1ShvF2WJq/ILaaCu64UcXUK2MUg3/ncAOh8M2Eu4tp1uG44N/iOybnpSMe8stxfXnUgWrHdK
	M+lWzf18jGShdNd9XMAs70aM2FEZfm9fO0JKgiEyq3zwuxOrH6RBK66FcD4M5ybgvFYJ5fZGJWa
	iwofNUIwuLlmnUEjWgqsqPLPCePfFshqsM00Z8+Lbj3rpnLbYwswQ8LqNKp6ZQVfIj4/LGXwSxE
	iNhfBMIkjpDsRoQ1Rvpx/ARoFSux33mSSRHDoYijQAATMJyOQlI4zboOV8GpcR7GQ1nJpl2/MtH
	NO2V8n
X-Received: by 2002:a05:6000:607:b0:47d:ca2:6217 with SMTP id ffacd0b85a97d-47f2dcb598fmr2283679f8f.22.1783767766596;
        Sat, 11 Jul 2026 04:02:46 -0700 (PDT)
Received: from avermoal ([185.13.178.45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d6da9sm67405128f8f.12.2026.07.11.04.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 04:02:46 -0700 (PDT)
From: Mikhail Lukianchikov <avermoal@gmail.com>
To: Rengarajan.S@microchip.com
Cc: avermoal@gmail.com,
	andrew+netdev@lunn.ch,
	conor+dt@kernel.org,
	davem@davemloft.net,
	devicetree@vger.kernel.org,
	edumazet@google.com,
	krzk+dt@kernel.org,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	robh@kernel.org
Subject: [PATCH v3] dt-bindings: net: microchip,lan78xx: convert to DT schema
Date: Sat, 11 Jul 2026 16:55:38 +0600
Message-ID: <20260711105537.11065-2-avermoal@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Microchip LAN78xx family (LAN7800, LAN7801, LAN7850) binding
documentation from plain text to DT schema.

The conversion adds proper validation for the 'microchip,led-modes'
property inside the MDIO node.

Signed-off-by: Mikhail Lukianchikov <avermoal@gmail.com>
---
Changes in v3:
 - Added $ref to ethernet-phy.yaml for PHY node to use standard PHY properties.
 - Dropped redundant PHY description and manual 'reg' property definition.
 - Dropped root node and fake compatibles in the example.

Link to v2: https://lore.kernel.org/netdev/20260709181724.24682-2-avermoal@gmail.com

 .../bindings/net/microchip,lan7800.yaml       | 96 +++++++++++++++++++
 .../bindings/net/microchip,lan78xx.txt        | 53 ----------
 MAINTAINERS                                   |  3 +-
 3 files changed, 97 insertions(+), 55 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/microchip,lan7800.yaml
 delete mode 100644 Documentation/devicetree/bindings/net/microchip,lan78xx.txt

diff --git a/Documentation/devicetree/bindings/net/microchip,lan7800.yaml b/Documentation/devicetree/bindings/net/microchip,lan7800.yaml
new file mode 100644
index 000000000000..730999d11e8a
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/microchip,lan7800.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/microchip,lan7800.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip LAN7800/LAN7801/LAN7850 Gigabit Ethernet controller
+
+maintainers:
+  - Rengarajan Sundararajan <Rengarajan.S@microchip.com>
+
+description:
+  The LAN7800/LAN7801/LAN7850 devices are usually configured by
+  programming their OTP or with an external EEPROM, but some
+  platforms (e.g. Raspberry Pi 3 B+) have neither. The Device Tree
+  properties, if present, override the OTP and EEPROM.
+
+allOf:
+  - $ref: /schemas/usb/usb-device.yaml#
+  - $ref: /schemas/net/ethernet-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - usb424,7800
+      - usb424,7801
+      - usb424,7850
+
+  reg:
+    maxItems: 1
+    description: USB port number
+
+  local-mac-address:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    minItems: 6
+    maxItems: 6
+    description:
+      MAC address to use if not stored in OTP or EEPROM. If present,
+      overrides OTP/EEPROM.
+
+  mdio:
+    $ref: /schemas/net/mdio.yaml#
+    unevaluatedProperties: false
+
+    patternProperties:
+      "^ethernet-phy(@[0-9a-f]+)?$":
+        $ref: /schemas/net/ethernet-phy.yaml#
+        unevaluatedProperties: false
+        type: object
+
+        properties:
+          microchip,led-modes:
+            $ref: /schemas/types.yaml#/definitions/uint32-array
+            minItems: 1
+            maxItems: 4
+            description:
+              Array of LED mode values for each of up to 4 LEDs.
+              Omitted LEDs are turned off. Allowed values are defined
+              in include/dt-bindings/net/microchip-lan78xx.h.
+
+        required:
+          - reg
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/net/microchip-lan78xx.h>
+
+    usb {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet@1 {
+            compatible = "usb424,7800";
+            reg = <1>;
+            local-mac-address = [00 11 22 33 44 55];
+
+            mdio {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                ethernet-phy@1 {
+                    reg = <1>;
+                    microchip,led-modes = <
+                        LAN78XX_LINK_1000_ACTIVITY
+                        LAN78XX_LINK_10_100_ACTIVITY
+                    >;
+                };
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/net/microchip,lan78xx.txt b/Documentation/devicetree/bindings/net/microchip,lan78xx.txt
deleted file mode 100644
index 11a679530ae6..000000000000
--- a/Documentation/devicetree/bindings/net/microchip,lan78xx.txt
+++ /dev/null
@@ -1,53 +0,0 @@
-Microchip LAN78xx Gigabit Ethernet controller
-
-The LAN78XX devices are usually configured by programming their OTP or with
-an external EEPROM, but some platforms (e.g. Raspberry Pi 3 B+) have neither.
-The Device Tree properties, if present, override the OTP and EEPROM.
-
-Required properties:
-- compatible: Should be one of "usb424,7800", "usb424,7801" or "usb424,7850".
-
-The MAC address will be determined using the optional properties
-defined in ethernet.txt.
-
-Optional properties of the embedded PHY:
-- microchip,led-modes: a 0..4 element vector, with each element configuring
-  the operating mode of an LED. Omitted LEDs are turned off. Allowed values
-  are defined in "include/dt-bindings/net/microchip-lan78xx.h".
-
-Example:
-
-/* Based on the configuration for a Raspberry Pi 3 B+ */
-&usb {
-	usb-port@1 {
-		compatible = "usb424,2514";
-		reg = <1>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		usb-port@1 {
-			compatible = "usb424,2514";
-			reg = <1>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			ethernet: ethernet@1 {
-				compatible = "usb424,7800";
-				reg = <1>;
-				local-mac-address = [ 00 11 22 33 44 55 ];
-
-				mdio {
-					#address-cells = <0x1>;
-					#size-cells = <0x0>;
-					eth_phy: ethernet-phy@1 {
-						reg = <1>;
-						microchip,led-modes = <
-							LAN78XX_LINK_1000_ACTIVITY
-							LAN78XX_LINK_10_100_ACTIVITY
-						>;
-					};
-				};
-			};
-		};
-	};
-};
diff --git a/MAINTAINERS b/MAINTAINERS
index f37a81950e25..157a677a284f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27928,10 +27928,9 @@ F:	drivers/usb/isp1760/*
 USB LAN78XX ETHERNET DRIVER
 M:	Thangaraj Samynathan <Thangaraj.S@microchip.com>
 M:	Rengarajan Sundararajan <Rengarajan.S@microchip.com>
-M:	UNGLinuxDriver@microchip.com
 L:	netdev@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/net/microchip,lan78xx.txt
+F:	Documentation/devicetree/bindings/net/microchip,lan7800.yaml
 F:	drivers/net/usb/lan78xx.*
 F:	include/dt-bindings/net/microchip-lan78xx.h
 
-- 
2.52.0

