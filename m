Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF6A2DEA61
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 10:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785664885; cv=none; b=fWwQXUANcJ6RAdkgZLPyN16h9n0gy0BAP5m/KDH81/X4aN/PbtIYmK0LDdnsXW+hocJWdCDmuZcGQgHsWgkwXTN1jvH8skM1bQ7mpDuZyCf9jC5+7i/pxoYrfEhGLLTR7fqrhzJniaoN6qet87Sj+i0vSO2ST21vYPdn0qqV+Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785664885; c=relaxed/simple;
	bh=u7ppirKfLU4ZVz/nEOJZj7e8SzDZbS0KCbHmJCtYC4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RQ1r0oRCL9Fpv55eFOam6lZ+KaB1UtTxVbFcKCADd+kCkLD/vzPIanXPRlBdgNN14zoqVzCvBKtww8JXGbPlYPk5ZLLkC+aXar+VTZYV6QcJz/fhbmAkFKGePYI3ntVpnn1miYa8+EL97LbnXtpYL1hjuWPHlzy3Qvm0Gx9IQAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pSnSugIB; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pSnSugIB"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4954afac04bso13668905e9.0
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 03:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785664882; x=1786269682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QonosjSsHGuiSY52r6oXtU1gWhClDfkzKprjwVtzsIY=;
        b=pSnSugIBLzbKihrI6tLvVbVQIajWncuOleL4EgHTVCGwh4iC1T9igZ6V6bnIaQ+/Nw
         CyYPyWpr9hZtTcXoDjAfk69hA1/GtarWKU7tOErCFpBToOkXj3qBewhssHFCSr01W+ji
         ZPVjQa+Ox+Gs6tjAgBBHwbszX8oR3DT5bJpNcuc2zntNEKpPNpQhStxWcw+7DJ5AELgr
         zRR5NW4YH07o3fMW+6IV+BVP8cAIE2wSwlHkjv5T2PtMmBLnSXwrufDe62OXOJW7lyYe
         3u13JmC8BlJQufIlf5ZHjmNwdNOhOa5QCagyk5g6r4bT9fG8jJathNhs73r6g20n6CTU
         E5Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785664882; x=1786269682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QonosjSsHGuiSY52r6oXtU1gWhClDfkzKprjwVtzsIY=;
        b=eaozmwa4pXv+j+scs7xUU8qzXtHf1sndRd6ZpmgOvRqjw4sbo9ZPuOTqSq7pgKez6I
         Ds2L0wivDEIzvy7NQkYKH9esFe3UpkeWnGxJm7B3B+H8OLRb1REGXxyqxUcV1d+Pdmd/
         UnRLYjPF3LfyjuFWYfzGdE/HGltN0/YZUXvtK4ErtJEQeL7Fi9XSV+LnP7G80FlP2VUD
         sZulPuLRJLoACanUau8D8njC8Kzywn4+vlMqu3OcHFmzXWHXgWZDsf2H3r1/fYPEunIB
         q7rNJFgW2WcVUGyfD+WLmywyMDcUpDhg9TEKyJBajMcCczfQd16zLcp/kqcVL7NBcTbm
         HLxg==
X-Forwarded-Encrypted: i=1; AHgh+RpEmGiGbw1lQRlUTYSh7wljK2jN50u4UAtDT40/hIOp5cbPnppfkKwJqXZvGhNsGvhmzP91YKMyvupt@vger.kernel.org
X-Gm-Message-State: AOJu0YznCZCgu56YCmFjyiPKtpKTVo84lbE6J6+WV/6g+RRakrNNvggb
	JAqIe42dmvM3gmOR7r5n1+ZL1i02hUMYRwzcJDzKMKsjI/h+DmggyTp+
X-Gm-Gg: AR+sD12TDjIb20UaC//rXrT7AXCuoqsWvriH340eJuqLexSzQ26Ml7w4ZF/bZzoKGMA
	iO7tVtCYN4VA7lkhMc6xC6ylaWnoNR165CZFj+sxCjXZezTrRhtM2EHLBbcTu8gkUor+YrN3UH2
	XiBOr5APzpwoQQb6dkhA3Xj/ujh7juuA/bH96Ma/fjPpwaiIcsEObyh6STKnARVZt6pxc9zDRAN
	M2OxgfuHReecprorNkGfniCAX91j2fSBIZuASBbxk7l6aimNjfaSt0+aHTRh99hPDGGGMGCXxH4
	HIrnNX8c5H8NbKYeyZSTIAnIw98Iscde1oa5Ykr/FGNM5LkiEqb198rFHJjAl3Bi+MT4qC54edd
	+tapwcEUNnXt8DNs9ewialUuGbbb/4JASE+JjVe9C17pwSlRGOHiDYCRUCzv7Ec+/Kowk97yY42
	B+4lBdu/xX/xMLxDTO8wejq8NPQIqguwooyBXk/tt0SOSiVDOJOYgUgiZLYJYXA0I=
X-Received: by 2002:a05:600c:314f:b0:495:4572:21af with SMTP id 5b1f17b1804b1-4980c673252mr95812175e9.9.1785664881820;
        Sun, 02 Aug 2026 03:01:21 -0700 (PDT)
Received: from builder ([2001:9e8:f117:b116:be24:11ff:fe30:5d85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b5b4a2sm140991375e9.1.2026.08.02.03.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 03:01:21 -0700 (PDT)
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
	Sander Vanheule <sander@svanheule.net>,
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [PATCH net-next v11 1/4] dt-bindings: net: pse-pd: add bindings for Realtek PSE MCU
Date: Sun,  2 Aug 2026 10:01:08 +0000
Message-ID: <20260802100114.720594-2-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260802100114.720594-1-jelonek.jonas@gmail.com>
References: <20260802100114.720594-1-jelonek.jonas@gmail.com>
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
Reviewed-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 .../net/pse-pd/realtek,pse-mcu-gen1.yaml      | 182 ++++++++++++++++++
 1 file changed, 182 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/pse-pd/realtek,pse-mcu-gen1.yaml

diff --git a/Documentation/devicetree/bindings/net/pse-pd/realtek,pse-mcu-gen1.yaml b/Documentation/devicetree/bindings/net/pse-pd/realtek,pse-mcu-gen1.yaml
new file mode 100644
index 000000000000..3bb32349c28c
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/pse-pd/realtek,pse-mcu-gen1.yaml
@@ -0,0 +1,182 @@
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
+      allOf:
+        - $ref: /schemas/serial/serial-peripheral-props.yaml#
+
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

