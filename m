Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CAD384242
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 11:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785064971; cv=none; b=flxNGmonuSl/WGVokL9sjTn8kAJfrf1Usk0KpbHSO48qjraOHnefedPjYqeNPOODqXxopJuf3MDFYoQTceWrd/rPKhzv9LrrWjAjgrLCRwF/mxqqOPGyUUiw6xLhKWo1+9vd5BQQUNJyecnLiHVWhoW33CMYpmOWAeDQhk1+USU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785064971; c=relaxed/simple;
	bh=+fJaezT5Qyk92yI3mtzGQ/jLmHG16HU2ENzynzriwoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gHzhSYQljwwXyr63wth9JlRx3BhYn9ZPDQqrJu6wMsynkkxJJL+ZaYgMMCE9d27lZem7wceF2V8yDqK8Z/P8vqoZ2cmkAVjyDPP2Fq5Y+IjkY+TDCgbF+HiBH+xB1u7tdba9KdOl4vf0bP3AHPSKiM54t9FT0bBv+cT5DCMigqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=miMD6Z9r; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="miMD6Z9r"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-476a130c138so1812357f8f.0
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 04:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785064966; x=1785669766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W/d+2Ao1HRBsuACqk7R2z8Jr73fTQFf2BR9t/cEB5dM=;
        b=miMD6Z9rU8X3/De0eJUeGdAjI9WaPs/xAqeQa/uusq8krsaQIgc5HIC8CbPicire9X
         vo19L80Yos1iKkCbSNl1ItcbDoDsn0qmwf8T+97YaybuOJaOp+kKgNCy1FtTqxts8ZQi
         tHyc93+HewKiorFECfpOohmO1sI1Uj0RNVLe2gwYz6Dh4wY4NnXmQ+ACs5K5Y3hop/iU
         +jmOn3MN+e4WwBo2y/Pf/fHh0+icr8Mq/h1D3iIiBMWGNcIXa8Q4CFnhHfDyG/0eqNpf
         Fx853DzofhY6lv6ZaR2pjj6GLwAH4RpzjrUMvRHvOPZ8XQXJRY5PTDsyuO83RuPvRO08
         JBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785064966; x=1785669766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W/d+2Ao1HRBsuACqk7R2z8Jr73fTQFf2BR9t/cEB5dM=;
        b=FR2UkLKfSKkw27Z5ui+ORr19zpkeTg9V4eEQMRKCqRpVDDVkAiFIlNBMhxfrhidwh7
         9U0BxImZ+AfLNua/mrVUgOZUIx6TZVSZoFQhE9cCYPjLhdv4zzBAX014soSr+TI0IZF2
         wX/fSWhweWp6Q6j9v2N7fQw9LVd4VOJIBgooATwvb1Swf/XPlOaiK4WmQLWg3Q2kBMK2
         S6nUrspT5B4H9DiycHPtpGfamuZj0xDIX4Ndq5ib/Eb4++32QzaDFcvzbY5ojc2wg+b3
         utcYzwhWcOvdSDALVsaYzo3B4BCubjVqbUiaCGi18aQHLq2p/UWnvd9YeiFnvO2Tx+6H
         tZDQ==
X-Forwarded-Encrypted: i=1; AHgh+RqQo21IEPqYpOUDEU+Lif1hdZ/RGlGinjiOgq9KJZjdX8yKzKqmq5Wwh10hg0dVcR7ncs1OZRjxo2B/@vger.kernel.org
X-Gm-Message-State: AOJu0YyTIpewBMAdl41EQ9EKmmXYB84S1z5NxGoqrtGW5dy/VUcDsnRr
	bLZXPzkwwhB/EZJ+oEpN2ulF5QyaNSfSgWsOzUfuE7WvDERxq/eMUWY+
X-Gm-Gg: AR+sD11cCIiQpn7lfRqoG2HykcZWZaLe+uWZvMGw35chPlvdiNoMVgpAvYPjEctomrA
	P+A6SkdVWuLNYQAU5gu4dAGd02BcMKFzvT/KsJbgc3xumznC0zZRKboXM9UzVKsRLP0zP7YmAd6
	1Vnf7QKjm4cuhefcBc+ERSroTCn5ER4y9uPMKOAwBOolHTVhR+wZA/0YJA4zL3Gq42ZiJvMSjkE
	KW6pyvRL/lX7K9PMF4NjT4jxAqss1dCaoagTLT3kZURY4eXjzZYIxZfZhaKpGiv5AA5iSZwVdWL
	YFZ9rK4rWPaLWJSrDfuwjOvAWkGnQGKxjS7QeRDFKihks06qu35nmB2GXY4HgxEC5iPeL8OODmU
	tkC3pUeOIKV7hm7YnmQIE9stdz8Y1T2p7cZA7MHcwAtIfYMaYyeJxuTn4/dxXH1AHV62e+bKC6a
	9nt5MqLWRhjKl9YD8=
X-Received: by 2002:adf:e19b:0:b0:47f:8183:e9b8 with SMTP id ffacd0b85a97d-47f9fc8dce3mr6024682f8f.22.1785064965623;
        Sun, 26 Jul 2026 04:22:45 -0700 (PDT)
Received: from builder ([2001:9e8:f12e:8416:be24:11ff:fe30:5d85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f939c1465sm24902981f8f.26.2026.07.26.04.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 04:22:45 -0700 (PDT)
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
Subject: [PATCH net-next v9 1/4] dt-bindings: net: pse-pd: add bindings for Realtek PSE MCU
Date: Sun, 26 Jul 2026 11:22:19 +0000
Message-ID: <20260726112223.1286074-2-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260726112223.1286074-1-jelonek.jonas@gmail.com>
References: <20260726112223.1286074-1-jelonek.jonas@gmail.com>
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
---
 .../net/pse-pd/realtek,pse-mcu-gen1.yaml      | 180 ++++++++++++++++++
 1 file changed, 180 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/pse-pd/realtek,pse-mcu-gen1.yaml

diff --git a/Documentation/devicetree/bindings/net/pse-pd/realtek,pse-mcu-gen1.yaml b/Documentation/devicetree/bindings/net/pse-pd/realtek,pse-mcu-gen1.yaml
new file mode 100644
index 000000000000..0f1a819db49b
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/pse-pd/realtek,pse-mcu-gen1.yaml
@@ -0,0 +1,180 @@
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
+  reset-gpios:
+    description: Reset line of the MCU.
+    maxItems: 1
+
+  disable-ports-gpios:
+    description:
+      Hardware gate that forces all ports into admin-disabled state while
+      asserted.
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

