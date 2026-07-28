Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D4E3CE49E
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 08:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785228210; cv=none; b=KFDQoZ4uTMunujxyj06e6kppvywtWT3bp5s0FA6lP0GnnL9F3yamKyc4ppl+7FLqtAOqbPA86YUI0JzuPEoU1QWdr88p3uyYs20PcaCPt6LcIK0GmgdVCUfMR+8rsKYWpW8t0LABo7pJzpN7ZOUvlCPt2lMXiD78pAzEivV5mXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785228210; c=relaxed/simple;
	bh=+fJaezT5Qyk92yI3mtzGQ/jLmHG16HU2ENzynzriwoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rcfdg+kbn2vxuFGSMHdocnnWM5CCoe6M/nXa6EastOr+iMLk2A7SUHAGE5+3TVuKsxplg99npZT4celU0yIIFcyXzzno8q//YC0UVNsozlWSpzB7lQ9gRs5jiaLjGUjdt23HSA8SC5/0HjmJqx76FwL8V6VB9RnTSo7tKM4ydlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D458nSoD; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D458nSoD"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-495590dde14so39723515e9.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 01:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785228205; x=1785833005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W/d+2Ao1HRBsuACqk7R2z8Jr73fTQFf2BR9t/cEB5dM=;
        b=D458nSoDGZi+FhfBRW0G3P8fM1UQy/OkSFYSL0kPbp4F1knqwmGAQHyiEkwXKw4gv3
         3I50GUirm+yACKCCY+97PkPlEANXCbkjIFIcAA7R0bdANJ2kkInFl4fkIZLVdRzcN7XC
         oTpg4ubdrHgrZBJDEgdKi+aaf9XFsX5hNrJQg7TxtSPj1RaTwXbtVhJQaUP1mwdvSTBM
         tJfYQbJ3747LSZyUnN7KMNcCbq98o1Hj5QJUNb0k+F1ozYcm1KvQQiYgY/6jF4k6WERz
         foq6CHdowCM9nbuLcYyYltxzSX63K+usUWjHNXXe8UAK4xFQS9iETL2Rormrp5Th8+x/
         j35A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785228205; x=1785833005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W/d+2Ao1HRBsuACqk7R2z8Jr73fTQFf2BR9t/cEB5dM=;
        b=iFCiDTriHQ/GVH75ILA52nEVtc2cRh/JvSnIkHIP90IRIm2T9R7n7bInWQP62QCHv0
         jX5NUDKzG8Pafe9QmycqXwh/CqdZ9AAXezIaWVq+L1pkowsXpAjfmurbkMBPofhZk6T4
         c2Zs4G8YGYB1tajTPnri/S6UwKBr7ukoMUmpceAqil5ePr2WPyVViatQSCW1ASwxmK+2
         VPEjaZxIo8BQG3XgWU54Ch9UT5dWci6My68z5PMzdu4atf6RLmwAswJwmHLcIVU3h0t/
         rX5DoJpi4o6kbwlJemIYaMtzOT/a80v+8AyCgGaZszEdgNE8x92OgpWpQk9K5pj53igj
         ReAA==
X-Forwarded-Encrypted: i=1; AHgh+Rr2wdytXWOlv8EQMO/Yq/iicNtva+L8uAp2ALvqyEHKtajzFA5lf1uJ/0+mWqamflhfgjc622BUl5fE@vger.kernel.org
X-Gm-Message-State: AOJu0YwMiAPtMIZfXs+y86Cq37azvXY1LBsQq2ly3CvvqzGjPUxRFqSj
	pWeUygHMgsqo36tc9qVOVtKUVJzmt/aU9FfVCgnj168N6z69+i+TkP/ot/fj6w==
X-Gm-Gg: AR+sD12Eq/vKQLvom8/7X7sa8g8FcwsyAWNDZpvTDe/UZFIOXRK2oVBUc0Q12eQ0hoe
	DP54f8U9yJ8qDcWVhlvKIK7rGOVEUjhNh8JAZPfps4vei9WDMM8SaAJ1+RXam++JV4+S4wfX2LK
	ZCBGfLD3VMCkI2EwwPQYlMgakcb2gQDPvt3rwapCBdmLFJqhFEZNbY6eWiF2Lcs5YlUPLUu/zSw
	GOfv0Pz+JVas8wEr/Lu1Ip5llWBAfq3TRNeC7HrhiQMxJudAk7QbL+/LiUKNmWVi7GGju7n3/ku
	6FguWKktGSHorF4yaSoBbcDXrEyEJaIMj5F3NptQNh0yCpoNdup/3lZ8gJ/rkFzNmIRwU0LalI7
	ezWmMNbgeQ5RBEjJwcgrZF2kaX5cOgB0XS2/QtcT6meA54tXGWgS2OZluZiDpnACH4m0GV7TsEH
	YwVZrvX24QgpCZTL8=
X-Received: by 2002:a05:600c:a46:b0:495:52dc:73a9 with SMTP id 5b1f17b1804b1-496c6421d73mr15070305e9.11.1785228205117;
        Tue, 28 Jul 2026 01:43:25 -0700 (PDT)
Received: from builder ([2001:9e8:f139:f416:be24:11ff:fe30:5d85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c444304esm57730845e9.0.2026.07.28.01.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 01:43:24 -0700 (PDT)
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
Subject: [PATCH net-next v10 1/4] dt-bindings: net: pse-pd: add bindings for Realtek PSE MCU
Date: Tue, 28 Jul 2026 08:43:03 +0000
Message-ID: <20260728084307.2129515-2-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260728084307.2129515-1-jelonek.jonas@gmail.com>
References: <20260728084307.2129515-1-jelonek.jonas@gmail.com>
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

