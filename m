Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B456A3E315C
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 22:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786659658; cv=none; b=cX7jDR1LRP6oof2CncxruHzmX3f2ueFWwy2hYF1yCQzYTG/DcpbuiNfkGIc4hFN/dL/YeuZyY8jt/eFjJprusIwUDhAF/9uaYd2qoHQXOEZkaEUc7UfgyhDXw2+0W4jFpbHOdSwr0Rnp7bEdl7e1dTRpyvRZuZEqPYHzyDIOr9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786659658; c=relaxed/simple;
	bh=AfB3hwTx1xskqIyd/HTsVzwLOu0FSRpO4FosUKJq/ho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bIcBKB6epRbSgBrmst072XSwPDYCRY2hT6UicacDtKsQEQShmyOY1jMKqAQB0Be8vWMaDptGdIF2oQR9QUlLSvelzXr3jP2wgObhYBFppzvruNal71bNMxSkqsiYLLN2pm/koH6RPpzvl8Z864l2Jl56eecFZQ27WiVp6NnpAs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kT4bihPx; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kT4bihPx"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so3540265e9.1
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 15:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786659655; x=1787264455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bcj1CU8MhHkwIWq3YRgopbt/gvcYI2H3LxV5jJFuXDU=;
        b=kT4bihPxParYgInHNxtwmm8d2FOyQAfv6Rd61fIA7tHz2WDmVWQIsU4qOKK5iPPlF9
         OoeElshoPatXwYeMGjo8HIKDimZDZP/+DeGpQEqlg6UNGz38i4CI8YSmBYKjSABIcpQr
         ocLH7Z1PMtUeqwU54zyMeLftE1gC2+8qf+abyaatvZbkW3fKjOSd3zalJqtlqsxbL8KT
         wNIkX0CDNP8PjbseW1KOKtTdDsKqduNiR7cfYii4B7kZiniW6GUqZEp+8Fw2+nGROoRm
         mkv3zgiDrX3n5plDEzeO6vkpDhSiyHv4LYGT9HiSvjQ2kraljDKVQMZOk/yqvkYB1EDh
         2tdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786659655; x=1787264455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bcj1CU8MhHkwIWq3YRgopbt/gvcYI2H3LxV5jJFuXDU=;
        b=ZzEUGltpcUSxHHbIQdokuzMlEvJSdMRstGCxIT1d5MYwj51T9aec8MwVbFVTF5RHsW
         lbDIdyGs36rRmJyQfnxeJ50MUwO+tsCQHx+mCboMOWyicfNq9llknENfXHqY/YaLmv4J
         AA9j+ljm71EZKE8iGQCon9apQMpfQMcVlLbH4fMeS5le5ndQ9nvkX98OH/HJqdtNCpED
         jY5w8tOyAqBYHRUIkw7t2Kjf8xp9ikLXf+8V0Q6Gv34Y2384BOFarrgiCFCDb708AN1q
         lNjmQw3wPQs8rxDDJJDIhGQ454v3R53mNLoSX8Vb09YDu7DiLknB7J/E1FmvQk2KrsFQ
         9gMQ==
X-Forwarded-Encrypted: i=1; AHgh+RpYyGK2tpod08YqkOiq/jcY8YyunqjQ3225bwUAP+TVW5tBqhGI7qftRR0TqPsWcYF30iB8P6ucEpVh@vger.kernel.org
X-Gm-Message-State: AOJu0YwNGCPOfHMFmDdaB8y7e1R6woZey57y8VqCACFJoM/C3s3Pgz1w
	1kzHQveYXFdXl99YPSaBnjBnIX8V6bLL9CiI29HYGKZZ+YnQ5PDiySyr
X-Gm-Gg: AR+sD11mnI5kkeyFMhu1PHpcBCMdIEEZGPT+IeFvu38TK/5P8xHUcrdtnGLBMpr0ph4
	Pf07hjAIckRhYj74/xRNkOmrjP2FXC1oFcugGERFD22v572vhYT+VbijEGdbc1wpEhY2w8sDn4R
	HnC71n53PE7i9uwTQkfXn+i1ZttOEDnn46Ew6bTIDx9LQmveBPqOh2A3Df/51a+++w6P+TLqTVe
	DMgWBW6NgdVI0iHpWChAJBPxSj3i2NUQaydtmRREtjLcVCHm4TKTpemLRwqot0183a3442X0O0R
	++PMLYiobCedjZKvSwT5jW1sMobTrG7kw3KN15acoW2T+LWNUubb8WczBkPgzK/F4SvgR+PsGNq
	QasDiDc2e60OdkLZJ8HR7C+Bk5F86uqwhwI/7h/Ss2AlVcaA70KuUrlLJV5OffjVK8bYStkX6V8
	3HWcYxzgDIhPcFwUoywoo8AtwPTgAyO/LKa0ws19yc7jBh1ZsKLrx2QqEdQMwIzfo=
X-Received: by 2002:a05:600c:3114:b0:495:63e4:7f78 with SMTP id 5b1f17b1804b1-49987971986mr18076285e9.10.1786659654628;
        Thu, 13 Aug 2026 15:20:54 -0700 (PDT)
Received: from builder ([2001:9e8:f11a:1316:be24:11ff:fe30:5d85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49981b0f4afsm112960065e9.5.2026.08.13.15.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 15:20:54 -0700 (PDT)
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
Subject: [PATCH net-next v14 1/4] dt-bindings: net: pse-pd: add bindings for Realtek PSE MCU
Date: Thu, 13 Aug 2026 22:20:32 +0000
Message-ID: <20260813222036.873930-2-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813222036.873930-1-jelonek.jonas@gmail.com>
References: <20260813222036.873930-1-jelonek.jonas@gmail.com>
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
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
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

