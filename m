Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4FD3A872D
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 20:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780952289; cv=none; b=cT+frYkHiwlC75H2wsYnkwDmGur/rRpsgGULExxNSCzVNTmfVj+BFvs8PinlrT1lsgn7afPRaVZihYNH3EuMigCHU11iNAyBP0G80A7JfgBEjaU74mzXiF4KsnfOM7PM84fxpgcdALhYiq1/hpFBO8bvNF/+XVEqngt+1JptRfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780952289; c=relaxed/simple;
	bh=Adlvqfy4/RiVofJyXdnjYaiEBf1qc1usUCMPJaHxVWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=njkFu0sDp02IpWfDyk0kWrGWJf8vAipBdzF6TP2HxZmXG6HIlkdu+RCCnjv7DR2HieJIwh+mkdB5CiQzBwUPWdZZR8XUoMM9OJ9gL0viku4gUo1d8pi+11K26dGz2PRH5gQzLdrUdyHvd7uSxgSuBG1T8rNoy7mHA6NUpftS5fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LfApxshA; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LfApxshA"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490c1915793so30859025e9.2
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 13:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780952286; x=1781557086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F03FjO4LjSiNWn1/BhvBC+hqEK9VBACUAnKsqMGfyeQ=;
        b=LfApxshAA3zp6m4ef2G6XGVf7C0Bg+sSAwCBZ4weTVvMN9ddLpUfgK6u52QKcjvAPF
         4T4v3SbLSVBwwhPKVrCFlScVY5vyQLfYYNWuAoqLUh9DilnnkHFx9gsVqkqEG0I6vgZP
         +w2anXtOKzIF7dhwGlcq0wtizrYkEdI4eYQSD3RV603ADjCSuwA6yKvIy3bLMc6Y+ae3
         GTLZY2YSIv2oeInrI3I+Fvc+no7J8slKraHQaE9hi6Tnc8A+0sHEWUujqjqsrElmufuU
         O+M72ZsjTkHutJjsPX5/u3156DBpQBftbmtrJ3GXdVw0qTh4Q/QDSwmkyuwKHqcabItb
         IHOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780952286; x=1781557086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F03FjO4LjSiNWn1/BhvBC+hqEK9VBACUAnKsqMGfyeQ=;
        b=FGN6uufuOfriV8hxthqJKkVsTqTuf/3+zU+Bzh5OoXw21TBbJuz6UQZAjpYl7dU8ZW
         YPiJc2AOzQqePvxs41giPlOQbMdx5+r6bR8czy0z6H5Cbq2f3HTjIru1hi3b2xO+rKn0
         8oU8wSWkUse+gF8MGBkOU5EVkb5kH90nTruTQ4IY03t8drx+yrrSD8SyAyewHd3PGxAs
         vxgJpZj2en6yug3lAO2+nkKAGjB9eAw4g4HdcDEl812lr/IqcTbKUPDOkW5EkYGqkyH/
         8W7NlfWHXk4ttjc9Ppd/hxxyq6LP8DJ0Zd+tH42JZOR4jbgGb+X9M7z5GSaGyQDSwSnP
         dIFQ==
X-Forwarded-Encrypted: i=1; AFNElJ9qgtqgDHeAxbiIncr3j5gD5fy+awcGwqFs9m5Yx+U7J9V04SD5bOwIS3yO/6Da+AKQFhGY0u5J10Ln@vger.kernel.org
X-Gm-Message-State: AOJu0YxAAYxZ7+sWuY4DiT9BsWd5IPhuJF51teRubtzrTMSQ+rVffKqB
	CuKzt84azkOIQ68WJsXE1uEHHJVlHqkfrZFw/3tY8domb/Ns57S7nHgZ
X-Gm-Gg: Acq92OF7cdNgWRzwS7uh/9pQ4UpeO9oe20OIMT2KvNS+/JE1tTswRXzPtJwjXYY+sfK
	O6zAhWCHiLqCTC1nrefgm9C1XwNhcTz5FabVeCmQGf4tKxXVOqkieOY2XwsHNmT4GbO+GZNbObh
	1YEiXbLZ/DTb743Mmjw1ZVSriIf8adEmAc25Tx7NKwRwOVF8Y56kU2UFzTn4egKFqv6LXDUzYjL
	fRi9tMs5REGplCbzEx7bg6X0iBnu6XAJJgkLGOWqZR4SBDdgvr1e7qvuUUVUQKAB6wa0TZ9A2mU
	4sPKJmqK8uBzAfpDdo9B42DV1neaJ1j2s9PenIb+cFywjSBp2LzIOyrElnpx6LSqYvqN5jC+qVj
	H0uaqy/Y6enBuCdj+ywIuwR1z0U136TR0QwRyu+U6/VWjJOAKGj4K6Pyx0ScmdZ0ryJB1KtoFBa
	D6KNRvHlZSXB6gAuqDSvSt7Tfs0U8vT3uG3wql
X-Received: by 2002:a05:600c:45ce:b0:490:b35c:88ea with SMTP id 5b1f17b1804b1-490c25e74b7mr261048755e9.15.1780952285658;
        Mon, 08 Jun 2026 13:58:05 -0700 (PDT)
Received: from builder ([2001:9e8:f105:6a16:be24:11ff:fe30:5d85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d4891csm231011875e9.1.2026.06.08.13.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 13:58:05 -0700 (PDT)
From: Jonas Jelonek <jelonek.jonas@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Golle <daniel@makrotopia.org>,
	=?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>,
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [PATCH net-next 1/2] dt-bindings: net: pse-pd: add bindings for Realtek/Broadcom PSE MCU
Date: Mon,  8 Jun 2026 20:57:56 +0000
Message-ID: <20260608205758.1830521-2-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260608205758.1830521-1-jelonek.jonas@gmail.com>
References: <20260608205758.1830521-1-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a binding for the microcontroller (MCU) that fronts the PSE silicon
on a range of managed switches. The host talks only to the MCU, over
I2C/SMBus or UART, using a fixed message-based protocol; the PSE chips
behind it never appear on the bus.

The compatible identifies the PSE-MCU protocol dialect
(realtek,pse-mcu-rtk or realtek,pse-mcu-bcm), not a specific part: the
node describes the MCU - whose silicon is a general-purpose
microcontroller that varies across boards - and the 'realtek' vendor
prefix reflects the platform these MCUs are found on (Realtek-based PoE
switches), following the google,cros-ec-* pattern rather than naming the
MCU silicon. The '-rtk'/'-bcm' suffix selects the Realtek or Broadcom
dialect within that one family. The specific PSE chip is detected at
runtime and is not described here.

A single compatible per dialect covers both the I2C/SMBus and UART
attachments: the wire protocol is identical across them and the transport
is expressed by the node's parent bus, so it is not encoded in the
compatible.

Both dialects share one protocol family and one device tree contract, so
they are documented in a single binding under one vendor prefix. The
'realtek' prefix is used because this MCU front-end is found almost
exclusively on Realtek-based switches; the Broadcom dialect is expressed
as the realtek,pse-mcu-bcm compatible within the same family.

Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
---
 .../bindings/net/pse-pd/realtek,pse-mcu.yaml  | 154 ++++++++++++++++++
 1 file changed, 154 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/pse-pd/realtek,pse-mcu.yaml

diff --git a/Documentation/devicetree/bindings/net/pse-pd/realtek,pse-mcu.yaml b/Documentation/devicetree/bindings/net/pse-pd/realtek,pse-mcu.yaml
new file mode 100644
index 000000000000..2fb729dcb41f
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/pse-pd/realtek,pse-mcu.yaml
@@ -0,0 +1,154 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/pse-pd/realtek,pse-mcu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek/Broadcom PSE MCU
+
+maintainers:
+  - Jonas Jelonek <jelonek.jonas@gmail.com>
+
+description: |
+  Microcontroller (MCU) that fronts the PSE hardware on switches using
+  Realtek (RTL8238B, RTL8239, RTL8239C) or Broadcom (BCM59111, BCM59121)
+  PSE chips. The MCU exposes a small message-based protocol over either
+  I2C/SMBus or UART; the actual PSE silicon is not accessed directly. The
+  Realtek and Broadcom variants share this device tree contract but use
+  different protocol opcodes, selected by the compatible.
+
+  The compatible identifies the PSE-MCU protocol dialect, not a specific
+  part. The device described here is the MCU, whose own silicon varies
+  across boards and is incidental to the protocol. The MCU is not
+  made by Realtek or Broadcom; the 'realtek' vendor prefix reflects the
+  platform these MCUs are found on (Realtek-based PoE switches) and the
+  '-rtk'/'-bcm' suffix selects the Realtek or Broadcom protocol dialect.
+  The specific PSE chip behind the MCU is not described in the device
+  tree either; it is detected at runtime by querying the MCU.
+
+  A single compatible per dialect covers both the I2C/SMBus and UART
+  attachments: the wire protocol is identical across them and the
+  transport is already expressed by the node's parent bus, so it is not
+  encoded in the compatible. Transport-specific properties differ
+  accordingly - the I2C attachment carries 'reg' (and, for Realtek,
+  'realtek,i2c-protocol'), while the UART attachment carries the serial
+  peripheral properties such as 'current-speed'.
+
+properties:
+  compatible:
+    enum:
+      - realtek,pse-mcu-rtk
+      - realtek,pse-mcu-bcm
+
+  reg:
+    maxItems: 1
+
+  power-supply:
+    description: Regulator supplying the PoE power rail.
+
+  enable-gpios:
+    maxItems: 1
+
+  realtek,i2c-protocol:
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [ i2c, smbus ]
+    description: |
+      Wire framing the MCU firmware expects on the I2C bus. "smbus" means
+      reads carry a leading command byte (0x00) and a repeated start; "i2c"
+      means bare 12-byte writes and reads with no command prefix. Only
+      applies to the Realtek I2C attachment.
+
+required:
+  - compatible
+
+allOf:
+  - $ref: pse-controller.yaml#
+  - $ref: /schemas/serial/serial-peripheral-props.yaml#
+  # The I2C attachment (identified by 'reg') cannot carry serial bus props.
+  - if:
+      required: [reg]
+    then:
+      properties:
+        current-speed: false
+        max-speed: false
+  # 'realtek,i2c-protocol' is meaningful only for the Realtek I2C attachment;
+  # the Broadcom variant and any UART attachment must not carry it.
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: realtek,pse-mcu-rtk
+      required: [reg]
+    then:
+      required:
+        - realtek,i2c-protocol
+    else:
+      properties:
+        "realtek,i2c-protocol": false
+
+unevaluatedProperties: false
+
+examples:
+  # Realtek PSE chip, I2C attachment (SMBus framing).
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-pse@20 {
+            compatible = "realtek,pse-mcu-rtk";
+            reg = <0x20>;
+            realtek,i2c-protocol = "smbus";
+
+            pse-pis {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                pse-pi@0 {
+                    reg = <0>;
+                    #pse-cells = <0>;
+                };
+            };
+        };
+    };
+
+  # Broadcom PSE chip, I2C attachment.
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-pse@20 {
+            compatible = "realtek,pse-mcu-bcm";
+            reg = <0x20>;
+
+            pse-pis {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                pse-pi@0 {
+                    reg = <0>;
+                    #pse-cells = <0>;
+                };
+            };
+        };
+    };
+
+  # Realtek PSE chip, UART attachment.
+  - |
+    serial {
+        ethernet-pse {
+            compatible = "realtek,pse-mcu-rtk";
+            current-speed = <115200>;
+
+            pse-pis {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                pse-pi@0 {
+                    reg = <0>;
+                    #pse-cells = <0>;
+                };
+            };
+        };
+    };
-- 
2.51.0

