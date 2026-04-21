Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624171BD9CE
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 06:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776751369; cv=none; b=MeMMP4uE9AGqxZsNgH74BNj2YvQma2dpaQM/CcDnwhyANd/cSei+muYkmkKCAvFI9Ko59gj14nceCgfxIEUatV0Kfgteec4I5NWrLi2ZwvOHe2//O7VFlyZlQwqGhZcXhGVYAjJ5z329WS9BFrYGMEy9Xr8zI9cqgj7l6ASTsEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776751369; c=relaxed/simple;
	bh=o4s7RQJVLaKWZyqTCtdrIQ4el0b9XV5xDQP4/7MQ2uQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hh/tyGiV0MPWrkK28g/6dBJWUSHU10a4GhM6j9yjUX445dh0Sgtp26Fnr40A3SLNJLWJ6qqbAVW0BL/d7KgASmyAnns9Xy1ujIlizDrGx8lIfsoO8c/gamexONcLjRGvadsBW+76Hpcc39G4aTmco3Hw2x/1hx299IpBEAKyRGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=roSS+Vz8; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="roSS+Vz8"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2b0afa0210bso17848615ad.2
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 23:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776751368; x=1777356168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B2GTU1uONrWcOgiwwOslB4zHcwSXJATu+7xJPkzbInQ=;
        b=roSS+Vz8PcYuqAc5WkION7RZEZ3XJrismwcwDLzaHNF5/w8H8y/WL566R/gvy4KzJW
         bOqhLK3QBMtBUJxrvgiEmwgl7gxovAmxSE6dqLX+VDeIVtG1dF4GxTI7FgTHqgFS/udd
         UvVXbgy8YwCfP2cXV469baQInv3Y6MmifI9raZgQl7F61K9W9iRonYE6BVACdgH4zKKS
         ErCdplY7inoy5EV79IIk1ZO0ZG2Yxe0Im+PZ7MNfsdz8GoSB/BZpWIMS1NYFI8Ba9ovs
         U37px9AWy7eSgcQropG9l/a8hZ8z3SOcuIWODm0YDyEqhMfX8Y4VNRO7494TqlKWWLzB
         EvWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776751368; x=1777356168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2GTU1uONrWcOgiwwOslB4zHcwSXJATu+7xJPkzbInQ=;
        b=Z32HPxzmPOuSJGDGurK0lPJXihS1sMDfoVqPO89wwxalXNjWKcUDOx/LQ1apDqnCV4
         rjobJrxV3XCf+w9VAiKJaClA8M4YR6/Z60tjmtgHp5tjYpIj8pKzQhilQ82KzMxwmit6
         LeipPSpy9gt5tg+Rar7NVrBhb/2dW3bnHdAZ58tNBMnfAJeOQzCoEIN4EWZBkEfun1n7
         IvIeXFxqPQdqIT60tOKthUJ9N3C6wp1VC+TqVPzXuvReUx4IZGL3d/ytLC4g+4LEFHOA
         CBAB0cRQjVBn1HpUAs3oRLX0Vp87XYyrnxYL0QuCH3zxjoJjgPfsEOfXqsJMkAgUleJT
         H3Qg==
X-Forwarded-Encrypted: i=1; AFNElJ8vwa36K6CUviHYRzzwXfCaypbO7art3qiRFK9v+y4Pgscqu5pPLruT2bR5PXVCZUJZGQ3J88X2cdS5@vger.kernel.org
X-Gm-Message-State: AOJu0YxtqNvAI05qALhz7Sy4CG9DU2zNeNT8hHktrn2RdblMmG2K6VkL
	PyTO35gxIsQLVczcS2n63luw/B+DZvGW21g6p/UTsGRze0kX7TW4ojFE
X-Gm-Gg: AeBDieufk/KwbIXKt3QiJ3H2x5k2/LqPGk4p8KVMGeDNxPSxdXuTti/G5eYaOn5XvvT
	+pq3EFfJMe6SCvQl3xkBCyNZvnzZpQ46cZWSzepH/PChcePWwRfV5ov74M6ApQiavEZmuUhm2RB
	QNrvgULuNS1Rm1imhfMKfLCOnB/oFLclMX2ItBHYTS0JthGndzE7TDgZimhnSpk/dQ92mqjjTfs
	qKXoAKcwhTU+xCOXVZthsADO6Ay7dUfyh/GmWzQUSHURX1ISGv/e+lGl0nAAJ23v1tW880UHXB6
	B67Ya7D0JPFCxoV+rXFhxkXANcdDlQ0KWWRceXIphPAv1ZKSYA1vKzAUqjmVk1PalC+GL7fw3xe
	QhIaWIclCy1uCAVKmj3Rl7zU2wmLMXJuJVjl82p5iZoYLOO5gUG8s4beHsKp1MZiX43WQyujGq0
	AItkixNNfbNA3Qn7FLjKRN4rgX/+HOUsFIVh1iiHVLdvmnWnAT1e8IpbkEIeyZEAmWF606h+3nJ
	urSsZpxiUNgIQeTVIMTd28FqGrx1HwOq/RSd9DmbMEP5/Yma6bUnrFmVv17pGP+QYc/qEyQFY4F
	Mr2O/kI=
X-Received: by 2002:a17:902:868f:b0:2b4:59bf:5728 with SMTP id d9443c01a7336-2b5f9f3ca68mr127077205ad.25.1776751367609;
        Mon, 20 Apr 2026 23:02:47 -0700 (PDT)
Received: from PhantomX4 ([2402:3a80:51:767:3618:c13a:2d9b:d51a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9fedf0sm144516425ad.6.2026.04.20.23.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 23:02:47 -0700 (PDT)
From: Sudharshan <sudharsanam346@gmail.com>
To: jic23@kernel.org
Cc: lars@metafoo.de,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	Sudharshan <sudharsanam346@gmail.com>
Subject: [PATCH v2] dt-bindings: iio: adc: adi,ad7816: add binding for AD7816/7/8
Date: Tue, 21 Apr 2026 11:30:11 +0530
Message-ID: <20260421060011.12917-1-sudharsanam346@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree binding documentation for Analog Devices AD7816,
AD7817 and AD7818 10-bit ADC with on-chip temperature sensor.

The devices communicate over SPI and expose:
  - up to 4 analog input channels (AD7817)
  - on-chip temperature sensor
  - a busy GPIO to signal ongoing conversion

Signed-off-by: Sudharshan <sudharsanam346@gmail.com>
---
 .../bindings/iio/adc/adi,ad7816.yaml          | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml
new file mode 100644
index 000000000000..6780510aaeb9
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/adi,ad7816.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices AD7816/AD7817/AD7818 temperature sensor and ADC
+
+maintainers:
+  - Michael Hennerich <michael.hennerich@analog.com>
+
+description: |
+  The AD7816/AD7817/AD7818 are 10-bit analog to digital converters
+  with an on-chip temperature sensor. They communicate over SPI bus
+  and are commonly used in robotics and industrial applications for
+  temperature monitoring and analog signal conversion.
+
+  Specifications on the converters can be found at:
+    AD7816:
+      https://www.analog.com/media/en/technical-documentation/data-sheets/AD7816.pdf
+    AD7817:
+      https://www.analog.com/media/en/technical-documentation/data-sheets/AD7817.pdf
+    AD7818:
+      https://www.analog.com/media/en/technical-documentation/data-sheets/AD7818.pdf
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
+  spi-max-frequency:
+    maximum: 1000000
+
+  busy-gpios:
+    description:
+      GPIO connected to the busy pin of the AD7816/7/8.
+      The line is active high and indicates the chip is
+      performing a conversion.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        adc@0 {
+            compatible = "adi,ad7816";
+            reg = <0>;
+            spi-max-frequency = <1000000>;
+            busy-gpios = <&gpio0 12 GPIO_ACTIVE_HIGH>;
+        };
+    };
-- 
2.53.0

