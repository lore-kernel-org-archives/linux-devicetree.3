Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E133B1002
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 13:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781271007; cv=none; b=PRzoPi/xrs01VUb+24wVTvet/m1CG9632YipGXZN9NZ9b3USAgrnKljK29BaNvpjHtpTiPRLkmD3RaJizhFKuhtpN3/WBYpiuqzRqsb8EWs9vV1Zv6r7D3N6idOo3aCb+0f6pPzO4I0IF4Km8kVZljVAWghw5SUv2M8Seq0RI4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781271007; c=relaxed/simple;
	bh=Adlvqfy4/RiVofJyXdnjYaiEBf1qc1usUCMPJaHxVWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZLlPnFekiOgpN6QIxDtzMHABjUQZVyz2HENfNC5O6HalqeobLzSPWHtvlg+W0lWOuau7byz7mKuBuw8P12zh8TcurbfSVhaILfQmDJOzTrLE+13PgUmfyw0OJrZxCEQDMUD+CbPZjx6weLytcSNJvRg0KDPCAsObIAlicxOQGaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZndX8/jp; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZndX8/jp"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490b8ac62baso16300135e9.0
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 06:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781271004; x=1781875804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F03FjO4LjSiNWn1/BhvBC+hqEK9VBACUAnKsqMGfyeQ=;
        b=ZndX8/jpH4Uk5FVriV0hgXR5pi+FBCIS4DLp9bXSsHesKU/7jxG7z5aL0sr+rjQquP
         rbbsDu1tRYSmQWbikIcnyiVT0MTj1Tmq0OS7cB5176wo1TCGt5WI4/DxsJlr9UagVf1a
         UN2nk5ZG2++MunPqqb/dwqVPgLUw/cNEU+nMPEgvCpO7zTkI2EIsEZh6kh21silyvcuR
         8moQHixrQkXT1m7l6rq54gjkMVnJ5JC3m4Bddd9yfmm0Y1Q0pyeVr3oOuvzICeytb5Ns
         8UtFuVv6VIfRhD5gysnWkxzixSKDOby8fSMR4+OCzekJGiGMuqUcAXSGUp+HmskPClpS
         YlvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781271004; x=1781875804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F03FjO4LjSiNWn1/BhvBC+hqEK9VBACUAnKsqMGfyeQ=;
        b=hEAgFBBPhAsm88vzDaThfRA7vIkCJVYLc7rqydG83OxD8lTjmXvpdoP9lfbIbWP6Jb
         0QEeTrc5NcxDs1iWP5unv69kjh8Y+32a7TksoGbF7oZZZvKuvP05Ha88Zl3aAw7L8Gp3
         6NKbaspRfPVoNxOMwqgZsp3Aw689BOGCx6upbtuxiZDOTfg54fZHnSW9KVSf1OaeXVpn
         V/2l2SFHdoowALqLyqr5a+JWbWeP+3vRUOvypYKi9VlqHC9vR8z1goG+ghAOS/FPzjyV
         HWlp+AQv5G5sOPwyRAFHDW4X6wpDeTBrY27sFUN+9+Uw27QVfaR5BQCYdOuMnk44pYJI
         nc5g==
X-Forwarded-Encrypted: i=1; AFNElJ8AghtDYF0hY0COK4ClbohSuTbEb+YxBL3ox2JDzvbCRwUfL0BsSJm1BEz3neWiJUGdOpsz0wn2M7sI@vger.kernel.org
X-Gm-Message-State: AOJu0YxYiu1+XXPrNKe6I9IWG2aRQeHKVET8fV/YdQDNfC3X4YB+HXi5
	6PDO7rDdSo1KMqXaO6eU/Q9Dfc9ke2cSsmBNwkdMzFL4l6ZyjSbEaPyC
X-Gm-Gg: Acq92OEsVvBkw7Ws4GI1GrtJF9pNsKcr9R4WLRVoOFIqncDTQP0DaYjGWpxGyd+0O0c
	LSw6YKWloKfpApHGI+xEoDDg48QqUEsmGHpgSOi+Tbpiw/edjitW1XXYazZsAmTjqu/4k5t4BT0
	WvdCuZHTOtZPJ0FZkfvROynb5ZCebiMa3GNEvgEKChCIGX+SlvZL71b3scmehjpws64K4CvtvCT
	hcLFX3pyQ7Cz/B6cHGqzh1LP5+Tnr6kt2ROL5BL3Pd5gHtRL1elIenU3x5AtN6UEAf3Q59wYXW+
	GNl/Lv8eLqnIwWSlgR9O321B6eeVzwOMqQsICXl4Gz1lLVEdMSLhqqRe896wup9S/nHlAn+McMn
	QZcEVyUM8zmQRva/qCoNt/PNv1aqLy9VZC83CnkYO/IT3ZDpSX2ohG/HlPpQ8JL4lqmFqhpyE5V
	OP6NqUYkYAyoU2Nw9I3lU6Y/6rNg==
X-Received: by 2002:a05:600c:3542:b0:490:b4a8:e031 with SMTP id 5b1f17b1804b1-490ec480e65mr32033545e9.4.1781271003902;
        Fri, 12 Jun 2026 06:30:03 -0700 (PDT)
Received: from builder ([2001:9e8:f11c:fd16:be24:11ff:fe30:5d85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e2cf582bsm166811555e9.10.2026.06.12.06.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:30:03 -0700 (PDT)
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
Subject: [PATCH net-next v2 1/2] dt-bindings: net: pse-pd: add bindings for Realtek/Broadcom PSE MCU
Date: Fri, 12 Jun 2026 13:29:41 +0000
Message-ID: <20260612132944.460646-2-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260612132944.460646-1-jelonek.jonas@gmail.com>
References: <20260612132944.460646-1-jelonek.jonas@gmail.com>
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

