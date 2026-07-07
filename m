Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD62436BE6
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 16:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783443557; cv=none; b=sMeBNLR1Y6GsSW7dQeTyMf7IS9uD3YXiKjBpyOFfpqX+PZMXwwCpCcHvi5Mnaf8zMuUEXS9CWBT66KrxVNi6I016dbHv/9BSkrVBCJWvtigAdNNTaIME4DS0xcJTtR0Z1WZurLRbl5m0wUDFATPIpfyDcN9KRMcGZcigEl6hcyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783443557; c=relaxed/simple;
	bh=rLTIXsUFvhE4fPJRyCHtI/YdnYDF2SJFC4itsl7RNIA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p8luEO1p8Sj0dXE/kZR0ORkJC0eKw6UXUWvtYDFvZkzeptDhLHF3aBx2mdCby1BmG8q0EEfbaoq4Uhjm9SMq+tWOLjgIrP0OidHoc8nr55h6Twk/KW+q7V0esUwFC6GMh7XMNl0iIS+FeW1GiGiSgFRZtPWvOJOcsmmbLSy7z3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jaHkNRUq; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jaHkNRUq"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-476a130c138so4600416f8f.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 09:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783443554; x=1784048354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O3xHqpT60AQCS9WwSt5iUYZRKfih6DmjUlC/H1ZF5ck=;
        b=jaHkNRUqjLF/kIZi2OftbUiE6Dy+Uh+TrRvgwmROaA1ZDPhRpUNcdV9H/DbMhO0SyW
         bt7WKNXjwzxkO3YPJm1svxtVm9hBH6s3+mmDyH44uQqCSa8JAgNBqRo+3n4ogD0HmiFI
         1N2rTMoj/FeyR7AY+sP+4bzb2umLEjKCOHNGDCjIKdQ/6Hk1mGJWMcoHt3k4x+G/+KSh
         BvMErCdmr1OZ9VdQh2TE+DWCejMHn2rzuMGTWIUE4lwYxkb4Swf1QkUWkejdg0zy/QU5
         geSs9zOyhoSdW2SS6OdjtYvR2D8/WsiZNwz+CSn5zEtzLHX2ZbPx2KVo6SYHPxC8PTyH
         +TrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783443554; x=1784048354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O3xHqpT60AQCS9WwSt5iUYZRKfih6DmjUlC/H1ZF5ck=;
        b=kzid2eChfVn9ez810tiWPG/Ul+ITREMStlilqH3hDUdxRLW6q5+QejnAjnahuqf6jV
         7mxYFgrt+5nL1vTxRNzfebcDNjuewh4IuKQmiKJi2ewj/kNSYngySySKDrdH7EwH5Uws
         55YBvVJ7NObwFcacsBJDnNJ+ZHd5tFm2ZhWrCWgDsqsRa18EuW7+LUe0qiuIibn1dqOz
         LbXyDuUS3xi9LDlrgUH+g7W0R/2w9wCM/9IjPScsZhiiDQOnw6pnVfGQy+xjXuiG1BiY
         lCUhYRg8yK1mYYvDoQNKaU6GqvkfZ/09uhjXMHHOq2jsaufo7yh9LRjgmpuVJu6er+2u
         SxVw==
X-Forwarded-Encrypted: i=1; AHgh+RpeRZWvJMYn7JsgfTL1kPncpytjGjuNAkbKyr1z71rp7zmFopNNRaDh3elCyyiVtPId5qqctjnGS9g6@vger.kernel.org
X-Gm-Message-State: AOJu0YwMC4QcH9HoOvxlOO0UjBDdu58B18yhdS1/PI6ywst1yswN15QV
	t14k232Pd296/M51tQMpbpYXy4hedURj07iU86+BlzafAaPFhvu2hGwB
X-Gm-Gg: AfdE7cnbmMt6qghn5uw4wVgMJuo1MWGdylxMIAUAfGwJ/9JkW0Cb7FMP5eI4ev6tJYs
	lyk9vEZJqbapWr4+wq78ddevU7SkimYCD8ivvjQKJB85umwSOnZn9QlFjTG94zIpk5NtjvCvbRx
	j8ykaLzcWIMfTjrgkUvVmlgK4IakXBl4uMxXnCZAJ48W9D7a5PDGkeb/BOj8xttB+qBv8/0rjgO
	a/SnhNRR8C0+ttobSWBHLXkINcU+bqCVbnndRJ+zGi6E7JxXcrXO/YkOzyFY3WSaHni8qSBHNyP
	CBT2geJkqPHds0kbIUWElA/rcrNhL5x1bsNZfUVP0AME/YWS74wxIxlheNdFfmxsIegmE7Hb3L0
	7amaG6tk897+4L3xoPxa+kBNuxdeW2wGIWzz3cK4n43FaOIvbJma5lkiorbDb9NTzxmLj/yZV9v
	QYK9uZ/zbv7Q==
X-Received: by 2002:a05:6000:25e8:b0:477:6874:5413 with SMTP id ffacd0b85a97d-47de66fb84fmr6725303f8f.58.1783443553932;
        Tue, 07 Jul 2026 09:59:13 -0700 (PDT)
Received: from avermoal ([2a00:1fa2:c26a:61e7:59d1:ea98:4610:84d1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039af67sm41069300f8f.17.2026.07.07.09.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 09:59:13 -0700 (PDT)
From: Mikhail Lukianchikov <avermoal@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rengarajan Sundararajan <Rengarajan.S@microchip.com>,
	UNGLinuxDriver <UNGLinuxDriver@microchip.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mikhail Lukianchikov <avermoal@gmail.com>
Subject: [PATCH] dt-bindings: net: convert microchip,lan78xx.txt to YAML schema
Date: Tue,  7 Jul 2026 22:58:40 +0600
Message-ID: <20260707165840.107409-1-avermoal@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Microchip LAN78xx family (LAN7800, LAN7801, LAN7850) binding
documentation from plain text to DT schema format using YAML.

The conversion was validated with 'make dt_binding_check'

Signed-off-by: Mikhail Lukianchikov <avermoal@gmail.com>
---
 .../bindings/net/microchip,lan78xx.txt        |  53 --------
 .../bindings/net/microchip,lan78xx.yaml       | 113 ++++++++++++++++++
 2 files changed, 113 insertions(+), 53 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/net/microchip,lan78xx.txt
 create mode 100644 Documentation/devicetree/bindings/net/microchip,lan78xx.yaml

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
diff --git a/Documentation/devicetree/bindings/net/microchip,lan78xx.yaml b/Documentation/devicetree/bindings/net/microchip,lan78xx.yaml
new file mode 100644
index 000000000000..743667c1e761
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/microchip,lan78xx.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/microchip,lan78xx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip LAN78xx Gigabit Ethernet controller
+
+maintainers:
+  - Rengarajan Sundararajan <Rengarajan.S@microchip.com>
+  - UNGLinuxDriver <UNGLinuxDriver@microchip.com>
+
+description:
+  The LAN78XX devices are usually configured by programming their OTP or with
+  an external EEPROM, but some platforms (e.g. Raspberry Pi 3 B+) have neither.
+  The Device Tree properties, if present, override the OTP and EEPROM.
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
+  reg:
+    maxItems: 1
+    description: USB port number
+  local-mac-address:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    minItems: 6
+    maxItems: 6
+    description:
+      MAC address to use if not stored in OTP or EEPROM. If present,
+      overrides OTP/EEPROM.
+  mdio:
+    $ref: /schemas/net/mdio.yaml#
+    unevaluatedProperties: false
+
+patternProperties:
+  "^ethernet-phy(@[0-9a-f]+)?$":
+    type: object
+    description: |
+      PHY node for the embedded or external PHY. The PHY address is
+      given by the 'reg' property.
+    properties:
+      reg:
+        maxItems: 1
+        description: PHY address.
+      microchip,led-modes:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        minItems: 1
+        maxItems: 4
+        description:
+          Array of LED mode values for each of up to 4 LEDs.
+          Omitted LEDs are turned off. Allowed values are defined
+          in include/dt-bindings/net/microchip-lan78xx.h.
+    required:
+      - reg
+    additionalProperties: false
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
+    / {
+        usb: usb {
+            compatible = "usb-host";
+            #address-cells = <1>;
+            #size-cells = <0>;
+        };
+    };
+    &usb {
+        usb-port@1 {
+            compatible = "usb424,2514";
+            reg = <1>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            usb-port@1 {
+                compatible = "usb424,2514";
+                reg = <1>;
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                ethernet@1 {
+                    compatible = "usb424,7800";
+                    reg = <1>;
+                    local-mac-address = [00 11 22 33 44 55];
+
+                    mdio {
+                        #address-cells = <1>;
+                        #size-cells = <0>;
+                        ethernet-phy@1 {
+                            reg = <1>;
+                            microchip,led-modes = <
+                                LAN78XX_LINK_1000_ACTIVITY
+                                LAN78XX_LINK_10_100_ACTIVITY
+                            >;
+                        };
+                    };
+                };
+            };
+        };
+    };
+...
-- 
2.52.0

