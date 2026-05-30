Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5825D3A9601
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 10:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780138725; cv=none; b=qbJQ62hKFq/cVHgLZxbHYzlEH/aPxcRT+wq6oa3FxxM+yLuSsN9KnIMKH6HMa0p59S96Fz1P6YEMUX6cmtUebEz0QjUo32+LB8PDGV1DtRB/8frC9Tx59w7mK+ZrbJ+TdONQoCXiOgFlzJXlaqRO37M5tDCvVThL8bK6Rpsc2GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780138725; c=relaxed/simple;
	bh=YT8mvnkk2uYolxFaRtXhF8hze7MQ+eLcZ13FI2O6eB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kKGd8zxmZY91u/O/eYgO2b6Aw3MXLeGnxDK49TOyJGnTziQ9JkQv3OQgIbYqu++tl4BTBywMtDpmKQ5nC+OlUeOWQ7xFINNvmRmhFnN6LeEMtD1jTg8tn6OmRW3NLWeRnQAWNPSpafGOaCuQ0aomqcIib4i97r+kEE5pA2hx0Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ua2Jby85; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ua2Jby85"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-396745b9abfso7361fa.1
        for <devicetree@vger.kernel.org>; Sat, 30 May 2026 03:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780138720; x=1780743520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5pD8Xbzo0jMdeHguX3rWZL0ZKKQW0EJedb+G014+CI=;
        b=Ua2Jby85HEoNHmAPsi65E6K5l/HpI1tp1fgKuWle6UfkP+KhDeEt9TIrtqCMBXl6VH
         7y4eXrgRFjrEO2aB1Qi6Q3u0cW8jBdmZYMkiK4idK/epXyXPz+p5WjZPdKe6D7HBvNdh
         SgvorultNIjSorK/GY9rPA35mvXv+mr2HYQllDsK0ALLbVbKDL5juLhmu6ulcApBCxXi
         8i+3MW9fmxSLe9gjIN/WtGyiF//oJD44jtWEpdL/2GSQO8Mh02o3JRpeH5jsANhHuil2
         OyZpz8t2IF0gcblX07NKdKdVa1e2nmY7bE5HKrrIBO7ZLUXsqUMXDtAY7KsTt0tDwyC5
         29mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780138720; x=1780743520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E5pD8Xbzo0jMdeHguX3rWZL0ZKKQW0EJedb+G014+CI=;
        b=aBARVzpjMJ3IGPFXXXl6zEanwXMnpkXoeOgBjYICLSzPyMmMhh87N850MrY8HVsudf
         3NQRChHGKTn0g4P9pZBhb1Ghbn8mwuGnyYqAd8q6yabvOHldCBELBxFcc7Vh3ww0PNk6
         99DBXHZIQOa0i+TcqoBGOi0f9quUN5ypFL0L1ql21JfeJPi9wxg0VJfvLu1rnF2oR2/m
         MHT3X3Zg/TbhBf+24e9xJhvsvDLQYatgqvPupMeatNjWFvU9/ocrlcL7vLzV2eKo6nHb
         iUdjOxyJT6YevPJF1Vfs/P/5cMQXQjhMfmnmMPnJ28uPfPC45HYjKI1x/xztH/ztOKu+
         HyQA==
X-Forwarded-Encrypted: i=1; AFNElJ/7tKyZupag9at8WfSalqitlV3fGJnHMuvvIoofpHXgXRhV+Sg5iICBQHR2PkzyVdJFlCjR0y4NFjLA@vger.kernel.org
X-Gm-Message-State: AOJu0YzkEDVdBs8vUsIeiUvXPeYHvYhanwd7QxlZjnrKlJg4aJlt0hn8
	Pmo9M1auOR5qoG46/3PFsY5iNbLU20XkWPeBZmf3BvA2UKt3Mxs5BYKx
X-Gm-Gg: Acq92OFURw3h6rK09EGjR3c+aSKcvwN8zofA8XK0h53rRkvZT/zoiVCTHD/lASZUoyV
	ZN+KtcohBhaW6LcHVyJwzhBTbQdro5ZHmkcn4RHYThxJ72YT9JwQhXTILT7NcPenh9MQukIPMCQ
	RB6HNFOl+ib1Wvs8TFfeVBL0yHVePrz6GjcWtbPuLJU/IvM7oeLsvPSwqymYbDN1xq38mOxYFgZ
	wSZ5SuVfRPs2xqbU6tYEaXyXPuZH7joQmnIJ5jzyxGXq+wMN6rnwWM9suHYseWo4kdlVHUk4Cux
	z7XiC9l629EU2Vvt0SJ05C8EGWRFJvH7Vt+EjmBBU1En9dBpb/MI7VVgZbv7Wm2JfrMmFCeDSlm
	asdxfENPdONjGVg+KWW22PQq74vSkaJBzTFo2r8/voOos/oyAfKY2heSDQz3jcmyW7WQ/52b/Wd
	yeOM4KX5y0d5wtXAw9JXWf/3tigeCvSsywdL+AzL4x5TxoNVegv1ikF8/1
X-Received: by 2002:a05:6512:400c:b0:5a8:fbe0:bc61 with SMTP id 2adb3069b0e04-5aa5fe81b29mr569956e87.0.1780138720231;
        Sat, 30 May 2026 03:58:40 -0700 (PDT)
Received: from localhost ([5.123.22.254])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b596d5asm919454e87.40.2026.05.30.03.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 03:58:39 -0700 (PDT)
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
Date: Sat, 30 May 2026 13:53:00 +0000
Message-ID: <20260530135302.54688-1-tahanarimani3443@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260530133126.54460-1-tahanarimani3443@gmail.com>
References: <20260530133126.54460-1-tahanarimani3443@gmail.com>
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
v2: Added conditional schema constraints for busy-gpios as suggested by Sashiko AI.
---
 .../bindings/iio/adc/adi,ad7816.yaml          | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml
new file mode 100644
index 0000000..74008c1
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml
@@ -0,0 +1,87 @@
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
+    description: GPIO connected to the BUSY pin.
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
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - adi,ad7816
+              - adi,ad7817
+    then:
+      required:
+        - busy-gpios
+    else:
+      properties:
+        busy-gpios: false
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

