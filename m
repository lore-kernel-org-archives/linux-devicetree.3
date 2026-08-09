Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132453A4F4A
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 11:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786274591; cv=none; b=Xx0/w4Xe3VbmMklFdZfo8LDFvMjdi5Z4crwlAmB3OB1MmyWha0vSo5pSdfod8701ZuZpBFfI2qlEkmo7um6dD/ZcW0q1YQ3D1UmcvDBTeD2H1+1hLMmkDZPyBXsr2YQCGSg6pTj+Of3NYezmFk/c7nEGbEbNSe7AQDMc1nucCg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786274591; c=relaxed/simple;
	bh=u7ppirKfLU4ZVz/nEOJZj7e8SzDZbS0KCbHmJCtYC4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E3gRth+c+Upj/SZfSsViuO1NjHcOr+AgPYVR78R5UTwN+1LzUDt8GwcCGhBsCXljmPMss2MbQWH7kVqT2JpIM2fQB9lGyDGPL7GU2gq22xzfvV+1tWQlSl6EsheWbCQ6l13EPWrieZ6h6X2+T4u8iIjSo8SVfhNVLHlC7MbwOCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cu/EIFKc; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cu/EIFKc"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47f59f25ec4so253339f8f.2
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 04:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786274588; x=1786879388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QonosjSsHGuiSY52r6oXtU1gWhClDfkzKprjwVtzsIY=;
        b=Cu/EIFKco4AS+82/1qrcY9oMb1iUUprFlpISYhrDdXABV0J4obqiLtb7t11S00jqe8
         Hx9xRVDpG5fSPU7ws7W/Vi046czOFBrlG0awyhB0f4nfDAHXQ0RSvy+l4lNvVg6YiwV4
         Uh49IpgoLDCeDD6IpGp7CRYkQn3NmnbTBKDXMfEKosj0u67tszyfO7pM00P0fKxIMtHR
         pVM9mZhGH6lAEBRPesjY3B4Bii8sYKSsXx1r/3O0/fjRGoKni+uFuILsw5XYjfH262uC
         vtSyTivdhxVilHt74Wxt7M5vBUFhEx6EnQ/rqzrFbNVqTMqQ7cBRaaJbO9jTC/aZxnTF
         gzBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786274588; x=1786879388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QonosjSsHGuiSY52r6oXtU1gWhClDfkzKprjwVtzsIY=;
        b=X/3LWpoO3/VY+SAFMaJHO4llgb6VBi3z/iNuh/yNSPpXYC48xeTIbnPFDgCYYqEO5D
         qq3xeH1VpSP5CeMc9UJ6s3Gk4QkisgUiEqtrlui70pFlDORrFvgGxPmFj4MV8Nii85tX
         EaMNmreG//8M7hc/AOy1hhLUg9j17MprIqYI8l8spXmOo4M4vzogWemBt4Dat2N8ryWh
         R2SPT7PM47KvaW9CDpj2q9Hxvwyynw2AFctAbx7+Vz+9JaW+4eYqfWi8v1lVhrUIwRCz
         zH37Uur4mLP8yBdqV9Y/pErpxGnIdAoiwhf+JBW+mEfoNYrahci40tHOCoo1UVSajR34
         CgOA==
X-Forwarded-Encrypted: i=1; AHgh+Ro2z9WQtqtI+KsqfdGbbhelI6aZ6li+I317LoWs3LsF+2PAMrd8aLwyNwYvZuUGfg9cev8e5eRor4lD@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1T8U76YhY2SUS8v3pgQiY2w0AqOpm+pmcjj9kWlqXZqhiUOYP
	rSepgVtma7j6aJYx0JMr3ximZuwrM9NkBmsIjFSjwlKHEhKdbk9GDmES
X-Gm-Gg: AR+sD11QC1G0YVbtiF4jWCUayMKjlgrPqzFPHL2XrQnT8JMuqOHva6hCgcwHMUIdU9Z
	QFv9eaOGWgeEYhgObyHrNmAlxBAUMt7sO4FrudAxsI1c/vkoMrvgJ1TNfz/bFqmZnl3yONCEuGB
	0xVeCv4rCp2oCOO6XBqajUTQn57t6jFsxZobFRuIUeK3oy7fTZel9RaGAITOsxh0nZRB/sqOMc7
	Ui703OgA/Lg3B/W/MRbmKy5GN0Abx8YBe3OF4wbqy183IsJCSUFxev1RBzMVLqTnWvMeU2PSUwy
	OY+G+ugPQGb3rABeSe92nNFy8okGCUEQ8cxpQDIckE2pAc27hRuoT7Sl90UJJYQjYTap+gjzLrN
	U7/YRgbpqKcjF1aSwExzN2ObUlkUSO1ENTh/plzV/dJJ5K3mEmuwOjgVAzAV/Dd64XAIcyo5pY4
	paBIeSY74rcdybFmVyu/ArQDdm1yWEKTe/XnpfaQPWeCoWhSNhp1JWDOODlrtyeJ8=
X-Received: by 2002:a05:6000:46d4:b0:47f:34ba:2d0d with SMTP id ffacd0b85a97d-47ffd21d9f3mr22800589f8f.8.1786274588178;
        Sun, 09 Aug 2026 04:23:08 -0700 (PDT)
Received: from builder ([2001:9e8:f105:3c16:be24:11ff:fe30:5d85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021f9182sm23156775f8f.28.2026.08.09.04.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 04:23:07 -0700 (PDT)
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
Subject: [PATCH net-next v12 1/4] dt-bindings: net: pse-pd: add bindings for Realtek PSE MCU
Date: Sun,  9 Aug 2026 11:22:47 +0000
Message-ID: <20260809112251.5797-2-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260809112251.5797-1-jelonek.jonas@gmail.com>
References: <20260809112251.5797-1-jelonek.jonas@gmail.com>
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

