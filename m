Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DC13C2BA4
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 07:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784102163; cv=none; b=ePV2pBGzamlsRq23t39OuDwuB5t5OS/FYBfrfajRSvpnkhfPEwBOKJ09aU3pEBOJNgUY7T7abKLiWCy0hxd7cSSD0nnmGvmwspz6vr9FdY49qLeXUSATH9HOSiqXavV51xA0qTugYgm+Nc2TrI4s04GX9K0H5P/FJszzb1L2pEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784102163; c=relaxed/simple;
	bh=ymZzzbin+CGvkdy9ibFNll1+e91uSG/AC+bKOxm+bOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sGKHeJKQ4MTrXZObdSpP+tzJdnDA9KrEewWp+c/xGIKuEmuWqJv0iNa71WzaMOcAAu4tCPwwu3BZ/V7k7HQo3KeTy0IT79XzoV3sovptL0WRytyWAV1q6Q8J8FeIt62VE/0cXn+DIeEoZWCmVetUvPqfU9Q2Enutm0JHT+97qt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cCReDKKm; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cCReDKKm"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4720f3bf164so191649f8f.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 00:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784102160; x=1784706960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wMEGZS/K8kcOq2Kd1mSS1d30uqTvRdT8WQAAP8QhYz0=;
        b=cCReDKKmfr19wVyOg9rtXKM5ovkkpm/yZYWdcGMyzgbPb46LW/4fLbqhEql4EyLuaJ
         iLUQTT2picZgXJQhJY8I/Ncpj+oI0QFoU65EzqX51B5caZBUcC6L4QMam1H+Z40LYn/d
         ++K/08cNu/5urvohcq/IUXyuwmP/Wxx83SmZ2VvvaaPheLfBJM37f9rKGg8u7rz0dRZW
         UoRX+zJf/m32oBt+asqeWOkOE8mS/JwiFyjkcjoFPaPSNRrLmo5e/OpYjuf5ylHFOVpQ
         lGrG0VFgV2GeFPebAYq7HZseBhHICMorujdMXjclODOnQjWTGllZw8RE6bm9I9bSTQmj
         wdlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784102160; x=1784706960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wMEGZS/K8kcOq2Kd1mSS1d30uqTvRdT8WQAAP8QhYz0=;
        b=nb8S2r3l248m8AeRqEnI3MrYAsCxzz3qAgAIAu+FAGqPweZptbuHaKWUniQvrSbFHf
         3KmNYOjkkLmqm+5KA3dUaZF7R+56rP7vzzYz6D3CCGFg+LWFVUhIH6EWlP8cAKAnwN+e
         W3AKXtT5g6LXIfjmJywaShjfW4wtUZuNrNxO8JS++ptw0VoEn66pH7ePxU/JWFbeGm5/
         teC2kB1A8ciDkU6b8Xac1/2Im1PyjuDoYtxbrVZ5kyR4WZZRZsjf/45+Q6QF9ihaJOVy
         LvZGYbbe8VxKNCaCYfblZdYbBWGqF5uuKEEYhH9SIhqU5cCqpSt6xvPWq9zBXMmjgo58
         7ZbA==
X-Forwarded-Encrypted: i=1; AHgh+RqCztlQYwgeYuGjp6ygEvDIouemK/5iOOUHpH7QqR3EveoI6vqXNAKilTm5nSXYn+1v1+WsDMHtkZKe@vger.kernel.org
X-Gm-Message-State: AOJu0YxHNNLCF5am7QG0wJ0KvqHoeqTUeY8KJ97Rmm97KL/df1h5sSh9
	qbJ/8d5sTs1VAJN1tKaVI/Bwm2n6XHIZfPTzvKKsLBq2HYzUUDqVo4HG
X-Gm-Gg: AfdE7clQseDthFFyN+bESmdN1ZG+bhKSssn2XpHG/PylMziKFHhIBOyT459UqGqSpHv
	p2g8/BJTT7fvdb0BQUdXjLWMFaI35tqigRFmWRhmRQKBCq1kHRkjatJUeZlFjxcllwOsmK7SrLk
	1id3U2Um2cx7LcHKpiikf+WkyYcFKTDpc13SY8Asd0Vemi0qvtaeyBuY9i9ywiXH97cXh0bC/P0
	mFHo0BCUAXpnMXK6c/+uUvgrYj18YqW6G5iKwX8cZAepGTdd4qnUCdu55ArGGSu6hOeJY5espvV
	x2OgtceTvV//ybOILsCaquOsR3cunZfUU0naKWqjZPt7DwwtkmViWincK65XHbUe+m/y8yVz0p/
	r/2pxi9kz5+ehf3cYlXyqQvnYH5PrQf/fWpqVXlhTdz+Cvk/USB7UNqDCGBbedIdGIiiN+K+PnW
	A7c6ZUhq0/JoIEBU5mLeLCfrsNHg==
X-Received: by 2002:a05:6000:2dc9:b0:473:c2ec:7a79 with SMTP id ffacd0b85a97d-47f2dc92701mr20266110f8f.12.1784102160006;
        Wed, 15 Jul 2026 00:56:00 -0700 (PDT)
Received: from builder ([2001:9e8:f12f:cb16:be24:11ff:fe30:5d85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464a974csm16219701f8f.18.2026.07.15.00.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 00:55:59 -0700 (PDT)
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
Subject: [PATCH net-next v8 1/4] dt-bindings: net: pse-pd: add bindings for Realtek PSE MCU
Date: Wed, 15 Jul 2026 07:55:25 +0000
Message-ID: <20260715075530.2491534-2-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260715075530.2491534-1-jelonek.jonas@gmail.com>
References: <20260715075530.2491534-1-jelonek.jonas@gmail.com>
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
Reviewed-by: Oleksij Rempel <o.rempel@pengutronix.de>
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

