Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9BD3B2D0A
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 19:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783884192; cv=none; b=oYdNnpW6fp7817VxgrmaNzgplRWD1P264TZzrkVZKfcYs8fnzW+02bEED2Hl5bUSUhd3/R8F9FsRR5C72vOIfP9OxX25WesxSpd0FEU+UG+RZZ4HxYRTrAgwMkCFsc8gk9qBK6ahb714qbFGuC3JnHr6jCzKAm1rkVF3i0Uvwjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783884192; c=relaxed/simple;
	bh=2oRB4a+z2t9Fo9vPY6UXtJUCiauY9oUzE/0RWKkqyGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RBlh3KuUDF44rPS530GlhnKFanYmK0Qvmu3pghuEUCNkE0NqUwg8HMSs/UOINE+q7FC2DtT0CC38DRTFAnzeNzYGY8gpqKyrwMnuaDW70aIlYFFj239W4gol6fNQqjixPUNhk6hMXLblZ71LHlaeTmltPJgN7iMZa1+69PrKdsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SPsjBLIz; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SPsjBLIz"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493f45e20cdso14363755e9.2
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 12:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783884188; x=1784488988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GkL6oy+oeuQ7d/Np+QunoIXoSDJWWHkC9ejPHuF8rQA=;
        b=SPsjBLIz6KovdaxCgnZdF4xE08yQZnjAMKKSYcJOYOnsBxKxr1uGwzJ4+B8pcHaw6s
         Lvczon0BWIDLKfZ9JfC4G3alLCmH4OjjVhXSWqZSPYP4SnGr7O5NG3QSkxc8s7JgmiA8
         RaAHUbTvqolh6ZM1ylYrD2Yk9/uNy4nSJMBoE970mP5oNnzC8KWTgb8wLI+RT1uco+Cp
         vl1lzwDqhH+eATbM2B5MUUwgDjYuoWodUoxA/ahsI/j7Yy1oAe8HsuXdcmLagwuN9jT+
         EXgdD71ockQ25BxJnNxg5nLOpIlQ3+7l8QduIZC9zSKTekxJDZ2yxBTnk/0j6euI0Lr2
         eX1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783884188; x=1784488988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GkL6oy+oeuQ7d/Np+QunoIXoSDJWWHkC9ejPHuF8rQA=;
        b=C5BmnqmrDty8n6iBvzotrlRocqyLKCo0Vr0jRo+uLZPqmvL+7DFZZamPeTD20+/g/z
         9/E7lvrMF3UO3hNWCwe8MFrB4CckwbNG6ik9WvEo8k0UPU+vo8zfvHSnP2lqUw9yXHmL
         Ah8c0j621RiDIkOEMDoupu+hqK11+r56Jp2QZvdrAyDHMDTM5EaK1igBeG8pU9ebfbJd
         h3sPPWfze6glx9KLc8EdSPwkNMsb46guMuiEkO9ixV1SydSlD6O0sQv6SadMeo1DQVmr
         s+4W9eITtatb5gsbAielm9MeN9GBP7nn52ZSWovj3QBRrKypQnIBBWt1Je8qwcG1Hv8p
         p42Q==
X-Forwarded-Encrypted: i=1; AHgh+RpAIez4P+9q46Lo0GzE3lrcFzJkSs3vqnZWszyLApOslUOVepPCg9KSRivbHWkI8OYWLogRwItvH1xt@vger.kernel.org
X-Gm-Message-State: AOJu0YyXPDhMgE3y1RMe/vzbrFsWY25Ngkv3IDRtnpfyKs7lO/Fm0W+y
	zMcofbhuqwKU0fFgpAbZcdGkTQPZTqSWyriJdIBdwfLn6L1hcVf78Iof
X-Gm-Gg: AfdE7ckCVvwhl+aqt7VsnjlVZHhg1lK0lnd2tLJnj20wNPOKlVfbWTn0aM/AJORy5SU
	fUwt5K+d7y7Sd8XrbYVa9W0MhI+6upXhobXQPzjQQLnHde4LThWI9s4f5wPmjcgYKhfcgsPmFIN
	tyuWbxYZL2oN546yhD0iXBFmh4XDUssxUIbND1L5CpOvWOOzSc7tQuT/kh2w8iNBg1lBhrCg2NU
	ZwiAnSSaoqP1JvQi+V9dBvz1ldeZJVN8Rii7/rbO/mQpAv+ZrxOyirDUljyQiLoG8OhvVF6DtU4
	8Jb/hq0/ZuLpVneIzvRUUdtB6su9jSef/NndWfpzb//Tem4kFOb7QsT86vEOsNbYmLyDwerrlPk
	IEOGrmiqEK9Qd8/hbRG+na9uD9F0/8+uElYxYgv4B9gwlNBzCbjlMgZ23UsgkdngTvFc399wTyg
	sdmOXNKDEYSSxrcW0=
X-Received: by 2002:a05:600c:55da:b0:493:c182:6b08 with SMTP id 5b1f17b1804b1-493f88390dbmr41395655e9.36.1783884188484;
        Sun, 12 Jul 2026 12:23:08 -0700 (PDT)
Received: from builder ([2001:9e8:f120:f516:be24:11ff:fe30:5d85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47df6a31dd5sm34883190f8f.16.2026.07.12.12.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 12:23:08 -0700 (PDT)
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
	Jonas Jelonek <jelonek.jonas@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH net-next v7 1/4] dt-bindings: net: pse-pd: add bindings for Realtek PSE MCU
Date: Sun, 12 Jul 2026 19:22:47 +0000
Message-ID: <20260712192251.1413279-2-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260712192251.1413279-1-jelonek.jonas@gmail.com>
References: <20260712192251.1413279-1-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a binding for the microcontroller (MCU) that fronts the PSE silicon
on a range of managed Realtek-based switches. The host talks only to the
MCU, over I2C/SMBus or UART, using a fixed message-based protocol; the
PSE chips behind it never appear on the bus.

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
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../net/pse-pd/realtek,pse-mcu-gen1.yaml      | 176 ++++++++++++++++++
 1 file changed, 176 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/pse-pd/realtek,pse-mcu-gen1.yaml

diff --git a/Documentation/devicetree/bindings/net/pse-pd/realtek,pse-mcu-gen1.yaml b/Documentation/devicetree/bindings/net/pse-pd/realtek,pse-mcu-gen1.yaml
new file mode 100644
index 000000000000..2b0661c9e31f
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/pse-pd/realtek,pse-mcu-gen1.yaml
@@ -0,0 +1,176 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/pse-pd/realtek,pse-mcu-gen1.yaml#
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
2.53.0

