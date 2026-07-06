Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A57C403135
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 11:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783337085; cv=none; b=ERW4YlIHP2zGwJGIaL0x6rBB1Q4UyWHTX3bWw6D7mAJJ3Edtaiz72sy204yJiXrUzzRncNyAWrV/tbbuPRaqMDK49YIK/sCHduA3Gbb2TWqSaIw6CjPNhbavVcapNg5FmF4pAU3QT0LLYVLvmI/BA40rpt3Igr6yrqOSqq7doec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783337085; c=relaxed/simple;
	bh=1E1CkvRq4zgoyuRVYKQUN2G5DqoDNUVjSieh3Io0qlE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rlYa6+HBsNvrGINqoAKPErgpy8/sP+/u0Yw7ENHPtJ5aLzEWQ2+ZrSjqW/hthhkSRdciUjtb53Q6ECzI8BYEgv+XxubF+1GvVhzwxcwpM2uYJY6s1uzANBwHrPW3g/vB1DPQQ65I/yLQhERcxVzZvMKhUvvrxDhPyrKvnuHPGLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UjaxE9Xi; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UjaxE9Xi"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493c55d5c7aso28116445e9.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 04:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783337082; x=1783941882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6p8F76x4cZ/nj8Q0sQnXgqRb5F2npcETsYgFsOmIKWI=;
        b=UjaxE9Xi3sjMgZQQkPOTFfeCDmahAjmKdOB8EdsaN6RZbKIEQmsEd88F1N5FMZCTIJ
         Z7vCQmqJw1ONkjdRP4IXDVYpDPBpZl9xzQzV+CusxqnPNKVi2sgt5NvbBI+Dw8nC5rYr
         8HKAQ6nQdmE2KPVYwq2t7RJUb++wSuG9VxRApdvne42HZm+QQFw1Fbb6UMFxR//xgfEl
         kUwH3anUv6JVaPqQFtBv80J3jnEYF4VUa5mHeo0xfBqahRtS6IkfXlkv3t7yeIKpD9/T
         UhzbGO5VCspOBzKzQDPDmHXqlAx9Y88lf/02UlxM46sZPqCzZvfBzNzAyaKKlLcvgzlt
         MY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783337082; x=1783941882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6p8F76x4cZ/nj8Q0sQnXgqRb5F2npcETsYgFsOmIKWI=;
        b=c8JywQ7Zs8v5s5avR+cVTWvlCGk0bwYteoF8rxE9LWpHoQuBWiPTw0zkurMuJ3T7vn
         RpO2b9U2KeLvYpNO7E/u5UqlKS2yjLJAQ++ezmEhXFbovISIFAlvn9QYBT7a/Nc9tUvV
         CVZcsnhDQNAX+M6WcGfmItLsn6LasM67GCyDLKpyLdnuedLMp+Y3696iAHMo+XOLmgEM
         V5lFZ748cyE15a6SGhsV2Fhtkv6qRrEyQTb1pNMeSjld8tXalcjNFNtwP3IGDG3/A8ZU
         QuklvaFepXCbWARxZhUebvSCdnKtpgamGHkrsSvESlK+5FGhdrecHyDDfCn1uslHBHor
         FJPw==
X-Forwarded-Encrypted: i=1; AHgh+RrBl2zuq1oKiEOZ/TA1fQI0QLGI6s+mrjdA//aot4ZqVqSJe24YyEy4acoMwuMD4U2J1JX6AfW0QpgI@vger.kernel.org
X-Gm-Message-State: AOJu0YygSMkUkrXXVAVCiHbrmwrxI5CJjp8CMwT82Fr8jrEGDxB/Kxz5
	w+z4umSX1E4uVb16vOyq64CP9ZJ9J4if+Carui7XST1UmPx2RFrvXZm+
X-Gm-Gg: AfdE7clqjDw1x9ZAPFU+NI91uS0YHYIXFNLYSfirViozWhEf+cUb2mSUx29ClVau8ws
	pFzTEmZiw5ukykuZNbJIoE0CAq4TH7bCv4+SPX5ryDJcBwQ3axU6M+BDAT5LEpXDw1pSIzgx9Jr
	M8Wsqa5J4qPAxS1vxAxRW9NwFAjRCDy/t80TVKwDjbGX6+mPneVtcBKxNzVeERhCUyu3l/h/hoi
	0GYx8WM+4lpN3i/DLuTF7FKB+YdJipvMWZADUUBoG+m/fY/6OSSx/k1L8BBrjTafptUvJR4HH+E
	SXhuoqg8YL5EUWmD4/HTAirijsj7LUqOaY0DGXTx57mY7/olCj1shzUuQYh05iRrJoqTvPKcOM0
	vMXLuXYIUAa50RFKsJul/RrnCNd1UZXvQto9UK4Kpa8FtJj12ezVB6J/JsVvg9jJ3f4IVMDleqU
	EfElhsoon7pNLbTjA=
X-Received: by 2002:a05:600c:5296:b0:493:d741:5d72 with SMTP id 5b1f17b1804b1-493d7415e1bmr68994125e9.38.1783337081938;
        Mon, 06 Jul 2026 04:24:41 -0700 (PDT)
Received: from builder ([2001:9e8:f13c:d516:be24:11ff:fe30:5d85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccdab27dsm258903245e9.4.2026.07.06.04.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 04:24:41 -0700 (PDT)
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
Subject: [PATCH net-next v5 1/4] dt-bindings: net: pse-pd: add bindings for Realtek/Broadcom PSE MCU
Date: Mon,  6 Jul 2026 11:24:21 +0000
Message-ID: <20260706112425.3149226-2-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260706112425.3149226-1-jelonek.jonas@gmail.com>
References: <20260706112425.3149226-1-jelonek.jonas@gmail.com>
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
index 000000000000..d0dfae220dc1
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
+  (following the google,cros-ec pattern); the '-rtk'/'-brcm' suffix
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

