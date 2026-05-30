Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C7D366DA3
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 10:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780137431; cv=none; b=Ef/PYvcdyDGQQ2ftxVeV5OLu4PFmqSC6UGDoOKstkEUzvG9C/5//Zm6xIp3081ardoMXt8/ELG/D0AF9o3mJM6is1aBlU+MUmHTktACtBvG/1NL+koHMOVYTC2tXdr5aBnwGpn4eYwDJKkQaSWn/Cqx0EQ7TjeRyXLdiMId6/58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780137431; c=relaxed/simple;
	bh=q6AP/YsSB67RKFNzB+JOGdIx8KZjL239X/sjIyTEFz0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d0dCLZYa2sUxwJEVksrdIIpHLBVSV5C18EvUaW6ey+3xXYmm7hMqIMcLI4vSUF6FBgjZT1qj7CUwuqlWFeWX85veSCTlAZ7/TxcDHwFZu0JjlPprHbMnrF6kmBnOYDWBWFXo2xrTDsrxG9XLRe364+IOMTJbunRVmScJ8C/9Duw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XBRnBaiN; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XBRnBaiN"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aa65757ef4so10428e87.2
        for <devicetree@vger.kernel.org>; Sat, 30 May 2026 03:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780137424; x=1780742224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AXi4/WHWZV2Am5IoWUT5fE2KIh0QxaqAle3LaIVXAnY=;
        b=XBRnBaiNSq00EZZDAhmMcJXn4/H68bcY059lRezWu7Rqpfz31BigecBmg6my6yti+/
         Y0NfMFGGpbc9I4/PYo2vykUYpKYKPg14pV+/MFqyti8qHeXnXI4jGwx6yAXK2AdC8RRt
         MvkSw6EttKaygHVdLj01tKnifLbGPlnJ+RVSuV/NRkBEyqOt3laMVrVFagEpngXUWvPb
         jTYLQy/lteRW0bKbRnaSmtIilyxw7LXCzIrryFfpLv4ke05i/mLsu4qb09cfM2G8QHQD
         vzcF9Ak33+3sqIohRPZgNxws6tRq2kvAYdEoGH9NOUFar+dW1fbUzFfArCQSlovvWe2K
         CQGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780137424; x=1780742224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXi4/WHWZV2Am5IoWUT5fE2KIh0QxaqAle3LaIVXAnY=;
        b=dLjhlD4Hutc62ieuOjOc89zefXd3IFyouSZzX3yNO2WiEOYgG0pq8M0imJwVOXvdLX
         ngbi9ozM0qvtFLIHrQV498WbEid9DA8KJP7GG81WCFuOCKFojlXPlAMnXTDPM2J3AlFA
         f7w4qIKlqsMNhz8dm7XLqE0r2Ew/o6v3PVvfJ/HYXK/BowVXdTrGYRE8oCeU8hmopC/j
         c61Zw6FytSlNR8CNDTbKk2A5h2HqsdkfZiKqtOEUy65cMP65GcIUl/wJRwTzoBdvweP3
         cnH6wTSoPAxrVxq4yHYLUVLw2fSDoZ7VuCs9EcSuut5b62W5GA94zs5TfsKsDmR1xxOu
         oBaA==
X-Forwarded-Encrypted: i=1; AFNElJ9ZgN/iJPplAqcV38UThkruutaB+LINu96S95VMUuXxrtzcme0ImZGKRKXvg/iqGbDZpWYO9JG54Qa9@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/dWdpDL+BqkVOBXQeJ9YWZHf8ATxT2P1jp/qgVwBFLXX+eQdL
	r/XM20KXrC5Wd8hKsxaZ6dRxTnlXopaMPiIj24sJD341hcQ4s6SLVGBU
X-Gm-Gg: Acq92OE0ftVzjscHVqs8l8+HhEcKRmM/BJKT7pTf5sj29hr/7k/cWvqH1XHYmQq/Ki4
	qfWT6HiJfDMYitnHXu1Mlo8NZQIzg4P+b2B/O28i7wqY+FNIeg47w8JNw39TAVmZqi0vrIX4wK/
	EibEueRqaqmSSP3B8cWsd/TYLVaUy/4zOkMSGwpafFFQxQzJzhQJdCK5BOmbQ9BOiqpZntCK+5D
	LoqczbD7YY9oFs5rEMEE3hFluj2s3Syv3q/jKt4V0vMpvHOfJFlW7OtMMMq0bAtmav25YOgMwjx
	nVAih2XCQzx8cwDfc41hk5cgUOuzA8rQMFA4hey7ez685w12l2QHlEMsyVJ9aoWFLwgGnZh4d1T
	wKqtvh6cC5tQX/PlDhqfSLEzy6DihZds8SbCDFf2QJ8adnLP5aV4wC4DKBbN0cm5u59jxF5KA7Q
	B2Plo8PzR3r/VKM1TJs3zCDY4XMIBOAXvfCBmk0zH6EYpwkw==
X-Received: by 2002:a05:6512:33ce:b0:5aa:635f:7c08 with SMTP id 2adb3069b0e04-5aa635f7d4cmr211707e87.7.1780137424193;
        Sat, 30 May 2026 03:37:04 -0700 (PDT)
Received: from localhost ([5.123.41.120])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b787b7bsm909472e87.57.2026.05.30.03.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 03:37:03 -0700 (PDT)
From: Taha Narimani <tahanarimani3443@gmail.com>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taha Narimani <tahanarimani3443@gmail.com>,
	linux-iio@vger.kernel.org (open list:IIO SUBSYSTEM AND DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: linux-iio@vger.kernel.org (open list:IIO SUBSYSTEM AND DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dt-bindings: iio: adc: Add schema for AD7816/7/8 digital temperature sensor
Date: Sat, 30 May 2026 13:31:24 +0000
Message-ID: <20260530133126.54460-1-tahanarimani3443@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the Analog Devices AD7816, AD7817, and AD7818 digital
temperature sensor and ADC bindings in YAML format.

This resolves the checkpatch.pl warnings regarding undocumented DT
compatible strings for 'adi,ad7816', 'adi,ad7817', and 'adi,ad7818'.

Signed-off-by: Taha Narimani <tahanarimani3443@gmail.com>
---
 .../bindings/iio/adc/adi,ad7816.yaml          | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml
new file mode 100644
index 0000000..7f6a3e5
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/adi,ad7816.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices AD7816/7/8 digital temperature sensor and ADC
+
+maintainers:
+  - Taha Narimani <tahanarimani3443@gmail.com>
+
+description: |
+  Analog Devices AD7816, AD7817, and AD7818 10-Bit temperature sensor and ADC.
+  The device communicates via an SPI interface.
+
+properties:
+  compatible:
+    enum:
+      - adi,ad7816
+      - adi,ad7817
+      - adi,ad7818
+
+  reg:
+    maxItems: 1
+
+  spi-max-frequency: true
+
+  rdwr-gpios:
+    maxItems: 1
+    description: GPIO connected to the RD/WR pin.
+
+  convert-gpios:
+    maxItems: 1
+    description: GPIO connected to the CONVST (Convert Start) pin.
+
+  busy-gpios:
+    maxItems: 1
+    description: GPIO connected to the BUSY pin. Only applicable for AD7816 and AD7817.
+
+  interrupts:
+    maxItems: 1
+    description: OTI (Over Temperature Indicator) interrupt.
+
+required:
+  - compatible
+  - reg
+  - rdwr-gpios
+  - convert-gpios
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        adc@0 {
+            compatible = "adi,ad7816";
+            reg = <0>;
+            spi-max-frequency = <1000000>;
+            rdwr-gpios = <&gpio 5 GPIO_ACTIVE_HIGH>;
+            convert-gpios = <&gpio 6 GPIO_ACTIVE_HIGH>;
+            busy-gpios = <&gpio 7 GPIO_ACTIVE_HIGH>;
+            interrupts = <20 IRQ_TYPE_LEVEL_LOW>;
+            interrupt-parent = <&gpio>;
+        };
+    };
-- 
2.53.0

