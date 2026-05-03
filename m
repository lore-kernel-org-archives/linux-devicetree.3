Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F2E3033C9
	for <devicetree@vger.kernel.org>; Sun,  3 May 2026 16:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777827180; cv=none; b=JFNhKt3jAkXgCkIXYaXh9Pe/4qC3z0F45YQJ9cSnVS2U1WTWM4LspmGf53tPvWDQZHnKlLR8Mpha3JC21lSqVymPpBpHhLlA4ZQiYFH2KNwCH5mn9IPea0W7rE/gwR14+pFd/KyZ/745kZRqpOXZ5W0NHiaZbktZN/Q/Y+kZiLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777827180; c=relaxed/simple;
	bh=a8DDUbGKi4KbjMV3e+HbsPy4j0FsEQ2efqEYjbF/y8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sv0Px0l3JauVe1BPFSMMzhmWczPsn7tL0GZm2QSFK3wbZ+wwKlBnr65kjPkaHclzbEzpWH0k/dodEqbqmM9o07yq3HPzA///1paQS+OKY9tQuELG+eKGbLmGm+mkTpW0wlM8LTiGDBFyFkWpMP2IARzm2L7/o5AhMajioQ4ty8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nXzoqrbK; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nXzoqrbK"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bc1f3a393c0so37243566b.0
        for <devicetree@vger.kernel.org>; Sun, 03 May 2026 09:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777827173; x=1778431973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tQY9b9kLzwLVCnnN7VEZw07BRk2Ugr4r9Iyui3/2atE=;
        b=nXzoqrbKeazpalkf6bard9fkpZCr2La6Wxtomb0DBOhEDzvpi9jUWM1XDCOVQwU7fx
         CfU9+Lu4t8dkQUnBAUyZ+35fNgKEGcod30gMh1pYhXWqZ9H4nYDQZDNqZopXk1vC3kOa
         0QhBiKUQjUujXXurfW/RosMNu/D6Y1pF8aMJnI4II9UpqBxnXXf7Emgk4YZ5VLO7V1FD
         EOecFeEEn2LVzuDrnTSJx9xf/ihguSVS2Cni+BSkqg86G8wOQJyPhg/+/ksNBfs+t41V
         MtfOSsQEG2bQBUEP+bZIH4UQM7sf9LZ4NedvjQ9xFyXrezYxmQUB536d1UquKMt2KYfs
         Q+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777827173; x=1778431973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tQY9b9kLzwLVCnnN7VEZw07BRk2Ugr4r9Iyui3/2atE=;
        b=JW6E77ABIUHQJ8MbJBmRZveKlrTL3Mq8HwdYhnjrLEZ5DiFJED2dd7se5mXRuv9FEA
         vF1wOiFlYDzArG/hlrHj3pfgdiFxcV38Pe+T6wFBjFaemtQirn0NMDrZ0q3LPlVqDZi6
         uC/ldyRwNz03Xw1hRYGy0ollaDz9C2/M51yr2Ndpaq09ljuE+HlBLL/I95/BpAlEj6S3
         QTwV+I1Yk6bISkzzKuk6BwhOfhRrtVIsJDMMqUuiB9mwPquq+vCcxm2xdQnAu6uyou/r
         2OHCQXVeyZAsa6aG9xnGNGL9RRFluODsrQlXNgAP6xxcpRwOajJtHtLhvpUJC+dlM5/8
         NDhQ==
X-Forwarded-Encrypted: i=1; AFNElJ84Vef0oznpVd6/OdXbZ/wiClB7+4zD3tPEuEpQzkVOw+nVzoeMlSKNDtriK2Br0TLP13sAxK4tTHMD@vger.kernel.org
X-Gm-Message-State: AOJu0YxrJlPoZgbT6Nu2Cx166YsCClyc9LoxOQLSn0RyVMLEWeg96imH
	lNA71SYJKB9AhjuI6nOeMLsDncwHoqiWCngUuVjAltGx+ae8MiwwR/qdvEkOtg==
X-Gm-Gg: AeBDiev4giMnB/sAYYC3aGy0n0vJOERiCgE8E8aS5fJmHvE+TC0lJzymkutEQ6urheZ
	i1U/VIexcZtpZfqpXeM8XOVccNS4Sm/hI2Lb/JjZwh6flTGADPdlGR3TvtOke/r8n9YBKK0vLin
	NuToVa0ypYbflonauIBYh0rsKQ0kkWu9Azgt5y6oDlO2CxYH4qOxjhpsO3+SoWVfFPfxqfcUjas
	F75d/MaC98ZcANvO6g5QijU13vPgJ4/8Edbyq1PFzK5sVXq4y2nh/W+GsYJYWjUVw8x5WFnBD8k
	McsLFLe5YJEw/3vzMRAENDuk+OpVygYX/Azp51kkyfYZnLWnqgXIzHB/ml5cI4soSwRtzjaU22r
	0zZHRZruLoirLLUGpRGrgW59lgHAHkaPk5tDe71DIYhIW1gXNahp/yXCIwoohlr0+xl5LJoP9t7
	DqYqEdYZVe4/r0K7JAKqP5WIkSAe0KA5mnJg==
X-Received: by 2002:a17:907:25c6:b0:bbe:7709:5a8c with SMTP id a640c23a62f3a-bbff8ed4865mr297216666b.1.1777827173127;
        Sun, 03 May 2026 09:52:53 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe69f6b7f6sm316772566b.3.2026.05.03.09.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 09:52:52 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: input: Document Imagis ISA1200 haptic motor driver
Date: Sun,  3 May 2026 19:52:42 +0300
Message-ID: <20260503165243.215979-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260503165243.215979-1-clamor95@gmail.com>
References: <20260503165243.215979-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the Imagis ISA1200 haptic motor driver, used primarily in mobile
handheld devices and capable of supporting up to two motors.

The exact datasheet for the ISA1200 is not available; all data was modeled
based on available downstream kernel sources for various devices and
fragments of information scattered across the internet.

Tested-by: Linus Walleij <linusw@kernel.org> # Samsung GT-I9070 Janice
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/input/imagis,isa1200.yaml        | 140 ++++++++++++++++++
 1 file changed, 140 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/imagis,isa1200.yaml

diff --git a/Documentation/devicetree/bindings/input/imagis,isa1200.yaml b/Documentation/devicetree/bindings/input/imagis,isa1200.yaml
new file mode 100644
index 000000000000..bbe6f99d39c1
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/imagis,isa1200.yaml
@@ -0,0 +1,140 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/imagis,isa1200.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Imagis ISA1200 haptic motor driver
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+  - Linus Walleij <linusw@kernel.org>
+
+description:
+  The ISA1200 is a high-performance enhanced haptic motor driver designed
+  for mobile hand-held devices. It supports various voltages for both ERM
+  (Eccentric Rotating Mass) and LRA (Linear Resonant Actuator) type
+  actuators. Thanks to an embedded LDO, battery power can be used directly
+  in handheld applications.
+
+properties:
+  compatible:
+    const: imagis,isa1200
+
+  reg:
+    maxItems: 1
+
+  control-gpios:
+    description:
+      One or two GPIOs flagged as active high linked to HEN and LEN pins
+    maxItems: 2
+
+  clocks:
+    maxItems: 1
+
+  pwms:
+    maxItems: 1
+
+  vdd-supply:
+    description:
+      Regulator for 2.4V - 5.5V power supply
+
+  vddp-supply:
+    description:
+      Regulator for 2.4V - 3.6V IO power supply
+
+  imagis,clk-div:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Divider for the external input clock/PWM
+    enum: [128, 256, 512, 1024]
+    default: 128
+
+  imagis,pll-div:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Divider for the internal PLL clock
+    minimum: 1
+    maximum: 15
+    default: 1
+
+  imagis,mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Defines the motor type isa1200 drives
+      0 - LRA (Linear Resonant Actuator)
+      1 - ERM (Eccentric Rotating Mass)
+    enum: [0, 1]
+    default: 0
+
+  imagis,period-ns:
+    description:
+      Period of the internal PWM channel in nanoseconds.
+    minimum: 10000
+    maximum: 30000
+
+  imagis,duty-cycle-ns:
+    description:
+      Duty cycle of the external/internal PWM channel in nanoseconds,
+      defaults to 50% of the channel's period
+
+  ldo:
+    $ref: /schemas/regulator/regulator.yaml#
+    type: object
+    description:
+      Embedded LDO regulator with voltage range 2.3V - 3.8V
+    unevaluatedProperties: false
+
+    required:
+      - regulator-min-microvolt
+      - regulator-max-microvolt
+
+required:
+  - compatible
+  - reg
+  - ldo
+
+anyOf:
+  - required:
+      - clocks
+      - imagis,period-ns
+  - required:
+      - pwms
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        haptic-engine@49 {
+            compatible = "imagis,isa1200";
+            reg = <0x49>;
+
+            clocks = <&isa1200_refclk>;
+
+            control-gpios = <&gpio 22 GPIO_ACTIVE_HIGH>,
+                            <&gpio 23 GPIO_ACTIVE_HIGH>;
+
+            vdd-supply = <&vdd_3v3_vbat>;
+            vddp-supply = <&vdd_2v8_vvib>;
+
+            imagis,clk-div = <256>;
+            imagis,pll-div = <2>;
+
+            imagis,mode = <0>; /* LRA_MODE */
+
+            imagis,period-ns = <13400>;
+            imagis,duty-cycle-ns = <100>;
+
+            ldo {
+                regulator-name = "vdd_vib";
+                regulator-min-microvolt = <2300000>;
+                regulator-max-microvolt = <2300000>;
+            };
+        };
+    };
-- 
2.51.0

