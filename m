Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A7B408607
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 10:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782817023; cv=none; b=nnsTQ1loTwsgkl+KBc/8iTWQx2ZN2RGwZeL6sgcQZF0HwepK7CO0Jvs5YeaIYTXUGnV/halGcrEJKxyF7tGsg0U0K0kvU/Pwx0M21tr+ZI8CWeCWpdKOkg0Q5/yxE3vVvPFisPIKTCEjETKQmMF2YWq9icNdyJV7SSss502Mofg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782817023; c=relaxed/simple;
	bh=MIeXi+Qy8hk6Ot1stqH5yVrx5+17ld2T9dztOgNqqp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cztSZzqUCuHso2t2DP/dfiq82WvuObk/sXMo1XoFN0pCoivwMKHf3ON+7t3AF9OmiA8IO8tEN0PFwSFHX9gy+h+XuomJ1AmvY144kRTIIBqC8hDtPX1hvpygOi03Y+QMKasBg2NXke03s0lP1xDXiZwLOZ0S7Ax815COGuLTDr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W1ccIXKJ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W1ccIXKJ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493b966dd74so3694675e9.3
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 03:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782817020; x=1783421820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CnAUH0IyVjWohICJQD2sZTC1KkDcmw0Frs3noihd5E0=;
        b=W1ccIXKJYtjnUjkKPpwFWHqFXQ0bzL8wrVdP6x9H0YOaemHRZy7suQmZxuP7Ssyk5A
         fysJ/CsR9cUTFUekGYJ3dKcTqilZPTy5jH06NtOthGiSySUEnvzo31qKMSbeU750+FEj
         kBqmNJVYUHTtgnQofUaAb4/jp0vyRvt2ZGyUJnbArl8BGpP9v4uGcP/4A+C7/Y0+7q7s
         NkuuJTbP/TVXgkJmrHYxUmYtmaveFrPBGfmgRFWoqCQave/TKNvEb3MhjqWrKW/hT4t0
         OiHy0NQR0tPgpGZCpVKY8o8KQwEw1rS5icODudpx0q15gCcNby+1/S0GGL+5Nc1IWruU
         7HYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782817020; x=1783421820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CnAUH0IyVjWohICJQD2sZTC1KkDcmw0Frs3noihd5E0=;
        b=Yyh7+nezZPgvOjWwVs16N3gB89bMCiKeLzcCplMlOfEgQTFHAq8Mmt1/JoPa2xqigc
         y+MhNBlEr+f1I4+NyHKvm3th5WanQrCvdMXWOn9V4bcCQwrYzsq8sTPW4ORFJz+dNbFI
         TZZ4GpWyoTcdt+yu2G0wFUQyVnju0/gGYhU8PxXOr0D2UvFsrhhL31l93deeqw6rtjTd
         JhhwKp2Lpgfy8A4S1PZFU2U3CgL543KQpqRSqJPYswC3EVFHYtXW6vgKnAss59Mp21l+
         koyLC6sxvMClA6ranzKdj77aLpzU/xLmQvkzi0Z2U5ikCOfhGExXj5SyU28BiZ8mGerh
         cF7w==
X-Forwarded-Encrypted: i=1; AFNElJ8lIzhqgZEZW1Mz6xngGJ8Ch+dQfrddgWHw1UuXLXbYnt9D3R3w8r8V6iGA284EJruWPSCF6PgvGTxz@vger.kernel.org
X-Gm-Message-State: AOJu0YxkxkENJOefL5lohXrt0kHSH2oTHTZWNayMvyzOd/U/11sn0Fct
	LpabA7wjfd48+UPNR3qgOdHijDh/Rl1UgHJ6y+zV8b+n9SnXIGrCA7OF
X-Gm-Gg: AfdE7cl5c+lPfdJPTVcO5DQ+qEIqmGOvwDxJIxock3nnxy1RFY1sjuVGLyokAJaKMRb
	HMCeyWrw5Yqk32d4+I9zl8lZv10uNat14S3IzfHr4VRYgzOaDioT6qE+jGDWMyxN8woJXWw83/4
	HCW6Dt3BYD2yvQkvhl3HPth+wNoYo1qjaKqVTrdMvqjsEUd9wFli28TUnWIPGaDQwL+iAyPKCZi
	PtWabnW5d8Sl7fk3yM38FeY7K+MtZNSlREF4WeljU/50TEFeL2CsGfRZs6aU/5vAq1NS4FN34my
	fChDsKeFFim2MAWMcGX4GVHDHn5KzR3m+w+ECvsUDRasX4nVEpqP1WxpVS6kM7Spwg2VcfmEuPx
	PAiZFr0tbdWGypxnxvlzC6FIbHY35pqN4zpQXFv78Kgn+4C2sbKwmUBElzk5x2oKku/44bofKBv
	kypssMZ3kMP0lmMg==
X-Received: by 2002:a05:600c:5250:b0:493:b771:de06 with SMTP id 5b1f17b1804b1-493bda3863fmr1280945e9.5.1782817019802;
        Tue, 30 Jun 2026 03:56:59 -0700 (PDT)
Received: from builder ([2001:9e8:f11a:416:be24:11ff:fe30:5d85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493b8d0bbbcsm70701085e9.13.2026.06.30.03.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 03:56:59 -0700 (PDT)
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
Subject: [PATCH net-next v4 1/2] dt-bindings: net: pse-pd: add bindings for Realtek/Broadcom PSE MCU
Date: Tue, 30 Jun 2026 10:56:49 +0000
Message-ID: <20260630105651.756058-2-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260630105651.756058-1-jelonek.jonas@gmail.com>
References: <20260630105651.756058-1-jelonek.jonas@gmail.com>
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

The compatible names the MCU front-end, not a specific part. These
boards front the PSE silicon with an MCU that presents a stable
message protocol Realtek documents. The PSE chip behind it varies
- Broadcom on older boards, Realtek on newer - and is detected at
runtime; the arrangement appears to be a Realtek MCU-based PoE design
carried across those PSE-chip generations. So the 'realtek' prefix
names that front-end (Realtek's protocol and firmware), not the
general-purpose MCU silicon or the PSE chip - the google,cros-ec-*
model. The '-rtk'/'-brcm' suffix selects the Realtek or Broadcom dialect.

A single compatible per dialect covers both the I2C/SMBus and UART
attachments: the wire protocol is identical across them and the transport
is expressed by the node's parent bus, so it is not encoded in the
compatible.

Both dialects share one protocol family and one device tree contract, so
they are documented in a single binding under the one 'realtek' prefix,
with the '-rtk'/'-brcm' suffix distinguishing the dialect.

Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
---
 .../bindings/net/pse-pd/realtek,pse-mcu.yaml  | 154 ++++++++++++++++++
 1 file changed, 154 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/pse-pd/realtek,pse-mcu.yaml

diff --git a/Documentation/devicetree/bindings/net/pse-pd/realtek,pse-mcu.yaml b/Documentation/devicetree/bindings/net/pse-pd/realtek,pse-mcu.yaml
new file mode 100644
index 000000000000..3a414ef38922
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
+  part. The device here is the MCU: it presents a stable message protocol
+  documented by Realtek, with the PSE silicon behind it - Broadcom on
+  older boards, Realtek on newer - detected at runtime and not described
+  here. The MCU's own silicon is general-purpose and varies across
+  boards, so the 'realtek' vendor prefix names the protocol front-end
+  (following the google,cros-ec pattern); the '-rtk'/'-bcm' suffix
+  selects the Realtek or Broadcom dialect.
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
+      - realtek,pse-mcu-brcm
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
+            compatible = "realtek,pse-mcu-brcm";
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

