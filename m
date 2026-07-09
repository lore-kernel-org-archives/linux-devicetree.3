Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F1A4499B9
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 19:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783626112; cv=none; b=aoak/VhJxn4OAUrOdUqkxj0cO9hdX2w+t5LBv9yL4WPvIpiXJAf5AIdexCVZsXEl5CHDCW+Q2kJ0bovtRJ0LAyfeyA07a1ZWJPRzOS6klroZLROI9J2mtDjv5kJ+zkD4tD1gSOLcFOFrCyk+jHo98qtWGbDOeDorSwX+UDUha0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783626112; c=relaxed/simple;
	bh=v8iQjLjFwyjpWmkI2tw0aBbLptc420t2mngJsBIklC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BvZiWScA7mXRiosCWOAgGTjW37h63w9YHw2SDcX1+8gkSPySuPyiAHoBiyaTlCbHR4062FFE9t/zQhEwNohyrpF62mir+YZL3PCaXec3dnJjilqSnygrblK/uoPaWLPVbFnzAS/ENYxFJHiZMIv98G33cEnWHXWqlKJehEmKKQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xt9bQ8VP; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xt9bQ8VP"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493e497643fso1058225e9.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 12:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783626108; x=1784230908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9bcu/YNEwEm0JDXBC4cIzwtBWsDRz5yLZFBz69Nysfo=;
        b=Xt9bQ8VPYeJQhU42cyBvbPZFMQBSW9MWHkOaTeeRJyNlH/QlDGy3+7t2loo9zz9u3P
         BZNp4YLOwgBaUiVkviFCifViBuKPpqPu0d9hvjoepYEAQjtqVmr/UWDrA5fIDWVw0Caq
         fuEdMD2DzluJxJwtEk4hI0DlPtn2BEziiiiO6/0sksYxp7Xd0Fg9u2/r3JdvxJnWCFCt
         INOlva5ONAka4CPAjhoGR3+kt7qofV2A5csKwa/tDUXppVjp9vjRz4YS4tXRTZYAHCfP
         p1PIm/jWehJdcjbS9LPgDkbA+sSotyGrf3Gd/x2c7K6/DNwlyhkWKoexkvNmzANvqvXb
         kR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783626108; x=1784230908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9bcu/YNEwEm0JDXBC4cIzwtBWsDRz5yLZFBz69Nysfo=;
        b=TUZ9xe44B/byk4krJaMpyPi0e5tChm/+/04A9lrS+Cb9DIBkZX9Mn2+CAaAlYyTh2q
         WlKJLn/LAY07+KBgAkMjXjPMMV3Q+7KaI0xg5ktz4CVo+3eSmipTw6JEPxpQoOKCNTK8
         5GHRMKqIsHYuB5285c0zWg4z1aYNn4pRHbSPmfJ/Vkc0/DZKsRUaUMvDabpJQNEY6kE8
         +r8m8nbShs3pAhrkLt0Om5aTfjgTscOipzBQlOKkhDojYdiVNw4P8NJ4xUdrR5bcVIOM
         5BqrS0A1yC0Y21UeVJ2pVgKoGDORUqQPK6jUXKfCsjDwOnVDUlJ+CxBftYPHJzENcY/g
         DuAw==
X-Forwarded-Encrypted: i=1; AHgh+RpvKAnTnZovIh8wqbRQs2gwKZMhtoHk9mmfl7TkL6f4vpSb3YwIHrlAL64IZS+CqzGZMDj8oAt6CdGV@vger.kernel.org
X-Gm-Message-State: AOJu0YygftWfPXVNPBvLDCloe3y7UVZ6ypLgToFg7IPiAnoSp7dDGTzC
	q4ysqbWKsazbk4a64feIv1wiZl9LRQEKQ2FQGdxV3eaWj0PJZBFQ7Fko
X-Gm-Gg: AfdE7ck96B58Gcdu6qnhj1kJIF7jKoforRcavnRYYoJfXZuc5qZfRn2B8KroOHo/Wh6
	PCtIOh9/A5WRDsWBaUMx46EH/kN5Y43dJVTnSQhKzN2riP1qAnPzGXViZja0m+leOUh0l2njHI4
	3UOGRWIpovr3mqTAU4h41URinrygnhsbMWEFfgiqhESyE+IJTZEwa1gMKOC0v2xviTR2gslWifD
	tAoWmmqCce3jP/PUsAs7jmUIu4T+IiGl05JJ4ngD4JJvbR0Uy36xr7zjPkO65cS7xl3f6j6jxgL
	WY2eBlknjmRqeQCZbXJNQUaGQFNJ3Q7sWRjWI00pIFBLwBaMce2joybADGiPozblT+G9npRYFXw
	GzQZcaHgXcYqKNtkbGjltq+0/xdFM79oNJnvivdXZssb4wW4QHAYpxK+QUHKN590E+N9j5KrskU
	45EnpqOA8eISg8blY=
X-Received: by 2002:a05:600c:34c3:b0:493:bb29:af40 with SMTP id 5b1f17b1804b1-493e689b37amr96818835e9.14.1783626107507;
        Thu, 09 Jul 2026 12:41:47 -0700 (PDT)
Received: from builder ([2001:9e8:f110:7f16:be24:11ff:fe30:5d85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6e8844sm93126605e9.10.2026.07.09.12.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 12:41:47 -0700 (PDT)
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
Subject: [PATCH net-next v6 1/4] dt-bindings: net: pse-pd: add bindings for Realtek PSE MCU
Date: Thu,  9 Jul 2026 19:41:20 +0000
Message-ID: <20260709194125.2784507-2-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260709194125.2784507-1-jelonek.jonas@gmail.com>
References: <20260709194125.2784507-1-jelonek.jonas@gmail.com>
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

The device is the MCU together with its Realtek firmware: the firmware
and its host protocol are what the binding describes, not the
general-purpose microcontroller they run on. The PSE silicon behind the
MCU (Realtek or Broadcom) is reported by the MCU and detected at runtime,
so it is not described here - hence the 'realtek' vendor prefix.

Two protocol generations exist, both Realtek's, selected by the
compatible: gen1 on older boards (fronting Broadcom PSE silicon) and gen2,
the altered protocol used with Realtek's own PSE silicon. On an I2C
attachment the framing the MCU firmware expects is part of the compatible
as well - '-smbus' or raw '-i2c'; a UART attachment carries no framing
suffix, as the transport is given by the parent serial node.

Each board additionally carries a device-specific compatible that falls
back to one of the protocol compatibles above. Drivers bind on the
protocol compatible; the device-specific string identifies the board and
reserves a place for a future per-board quirk without having to retrofit
device trees already in the field.

Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
---
 .../bindings/net/pse-pd/realtek,pse-mcu.yaml  | 176 ++++++++++++++++++
 1 file changed, 176 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/pse-pd/realtek,pse-mcu.yaml

diff --git a/Documentation/devicetree/bindings/net/pse-pd/realtek,pse-mcu.yaml b/Documentation/devicetree/bindings/net/pse-pd/realtek,pse-mcu.yaml
new file mode 100644
index 000000000000..733306193db5
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/pse-pd/realtek,pse-mcu.yaml
@@ -0,0 +1,176 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/pse-pd/realtek,pse-mcu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek PSE MCU
+
+maintainers:
+  - Jonas Jelonek <jelonek.jonas@gmail.com>
+
+description: |
+  A microcontroller (MCU) that manages the PSE (Power Sourcing Equipment)
+  hardware on a range of managed PoE switches. The host CPU talks only to
+  this MCU - over I2C/SMBus or UART - using a small message-based protocol;
+  the PSE silicon it drives sits behind the MCU and is never accessed
+  directly. For example, on the Zyxel GS1900-10HP the SoC reaches the MCU
+  over UART, and the MCU manages the on-board PSE chip.
+
+  This binding describes the MCU together with its Realtek firmware: the
+  firmware and its host protocol, which are stable across boards. The
+  microcontroller silicon is a general-purpose part that varies, and the
+  PSE silicon behind the MCU (Realtek RTL823x/RTL8239* or Broadcom
+  BCM59xxx) is reported by the MCU and detected at runtime - neither is
+  named here.
+
+  Two protocol generations exist, both Realtek's:
+    gen1  older boards, where the MCU fronts Broadcom PSE silicon
+    gen2  the altered protocol used with Realtek's own PSE silicon
+
+  On an I2C attachment the framing the MCU firmware expects is part of the
+  compatible: '-smbus' (reads carry a leading command byte and a repeated
+  start) or '-i2c' (bare block writes and reads). A UART attachment carries
+  no framing suffix; the transport is given by the parent 'serial' node.
+
+  Each board additionally carries a device-specific compatible that falls
+  back to one of the protocol compatibles above. Drivers bind on the
+  protocol compatible; the device-specific string identifies the board and
+  reserves a place for a future per-board quirk without having to retrofit
+  device trees already in the field.
+
+properties:
+  compatible:
+    oneOf:
+      # UART
+      - items:
+          - enum:
+              - zyxel,gs1900-10hp-a1-pse
+          - const: realtek,pse-mcu-gen1
+
+      # I2C, SMBus framing
+      - items:
+          - enum:
+              - zyxel,gs1920-24hp-v2-pse
+          - const: realtek,pse-mcu-gen1-smbus
+
+      # UART
+      - items:
+          - enum:
+              - zyxel,gs1900-10hp-b1-pse
+              - zyxel,xmg1915-10ep-pse
+          - const: realtek,pse-mcu-gen2
+
+      # I2C, SMBus framing
+      - items:
+          - enum:
+              - zyxel,xs1930-12hp-pse
+          - const: realtek,pse-mcu-gen2-smbus
+
+      # I2C, raw framing
+      - items:
+          - enum:
+              - linksys,lgs328mpc-v2-pse
+          - const: realtek,pse-mcu-gen2-i2c
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
+required:
+  - compatible
+
+allOf:
+  - $ref: pse-controller.yaml#
+  - $ref: /schemas/serial/serial-peripheral-props.yaml#
+  # A '-smbus'/'-i2c' compatible is an I2C attachment: it has 'reg' and
+  # cannot carry serial bus properties. A bare gen compatible is a UART
+  # attachment: no 'reg', the transport comes from the parent serial node.
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - realtek,pse-mcu-gen1-smbus
+              - realtek,pse-mcu-gen2-smbus
+              - realtek,pse-mcu-gen2-i2c
+    then:
+      required:
+        - reg
+      properties:
+        current-speed: false
+        max-speed: false
+    else:
+      properties:
+        reg: false
+
+unevaluatedProperties: false
+
+examples:
+  # SMBus-framed I2C attachment
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-pse@20 {
+            compatible = "zyxel,xs1930-12hp-pse", "realtek,pse-mcu-gen2-smbus";
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
+  # Raw-I2C-framed attachment
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-pse@20 {
+            compatible = "linksys,lgs328mpc-v2-pse", "realtek,pse-mcu-gen2-i2c";
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
+  # UART attachment
+  - |
+    serial {
+        ethernet-pse {
+            compatible = "zyxel,gs1900-10hp-a1-pse", "realtek,pse-mcu-gen1";
+            current-speed = <19200>;
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

