Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E303E7150
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 13:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778161203; cv=none; b=H6s9WlXDePP7vx59+V7r7+wS8g1mBzMwqrl7ipcax2jbr0tEHhhNlkEh9jOnhU70bZ+rwiFJ0bHA4SN8+iaxGp/yQNn179FMaRqncmx6zuyI55cCQTfL3LmAqgsGkG8ML5D6M9HV6U++JuUWgzk5nKI3Z1CYEK+tMUdKvHgmrCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778161203; c=relaxed/simple;
	bh=2FvmENfO/vJaQsVl7EbFhKjZmzyDq3pCbM6bhuL7kxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d6/8o7j+q4eHm5lndN0vKOdJl03fQcHnFkf9V8tbglop4W2c2AWQF25t/0eUkiFbJICjIGUFlz+1CqmSEPREx08/+kIAg0fRXT0plp/pgGJT9/SA840nBCilcYcMlJb98Qnnx0WRDziDQXBXs+rxDdpEpIHY/rPjNCd7hCeEUQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QZZ+eSLp; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZZ+eSLp"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso9826785e9.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 06:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778161199; x=1778765999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9P2MUIoe45JJ2qWDf5DbrVjk/FPu8YOqLPxGiP+tPM0=;
        b=QZZ+eSLpWK0j7Mu3tAeSXZ6XUL+CvlIYPDfhFItRmXN16tPB/js94sCHpR/obWe2H+
         vcnCXv5aokltjUhNcofQ53QkjGdYYi0zp+wiY5lwoRPOgR/0Og1yoxJU4LVEWjOJwtkC
         pM97B92SokCx68F1rdnmYZkZjiHvCrFtxMA/MRlmEzBpgBhQub8ifSSAOYHKLuSu6FLh
         SP1bBaeBflz/ij1y4jLMc/ia9FItitZB/Knurt3cbd++Hf/kMstoVSJRGOFkN/lO4bqz
         d/3AmAGQZeMP3v6YjWj1+bNCCaDrH1UBGh5TSwZgQPJZwbidtfzJ27k0oJBqRkcUse02
         Xbhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778161199; x=1778765999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9P2MUIoe45JJ2qWDf5DbrVjk/FPu8YOqLPxGiP+tPM0=;
        b=Hfjk00aP5rVmJxj9NFd1CXic/9to0wFRG4A4IZ2xLyDT7tXMPyPgQ6tf3PqVZFcbCL
         H7CsxxfBATrJ4dw8f+GLVtb0PMZ90lzZntKAgAVD0cEp89DjTmFpot59cgRYWBrXP6LX
         K1nyTboDCGaloCuaFxSsyPiDwRRSWCXGYyrtHn/rq9COahuVEA2/ioS397BfhxwVqSKJ
         KBwUpibc0sJiRDHU8iTaq1VO6+2fUtiMMKkbyEGC/X09kgB+/vQ9jbtJa1mjgFC9gBe/
         D1g9FEFVP/UORaO3UNrI4+6gA/pUZk2d0HWnVC2iURr+P+PvG82ehelX81RY2rVPpkkt
         0Uaw==
X-Forwarded-Encrypted: i=1; AFNElJ9jx0Ca0zNrDrULZxlvj4ZTRfvac4zFho3ZbSSiwN496/sc1CiMgI3+7QpkEdC4SQ6kCdPSVbM/KhZT@vger.kernel.org
X-Gm-Message-State: AOJu0Yz44n+FttUJsGPkRj+m3IcXQtePXbDsl6tQRaI5W2tFIP1zUwHg
	J8XTM6LKRO2Q2Cu5XhJPHXX1Huuj89pN1xxNVH/yJVISnQ21Z9nKCA77
X-Gm-Gg: AeBDievIY+nDJUyNGmWJFUSv9llkN70sL+a43Zq0TO3/LzCUP6twZiiyo8r8SKtsTKs
	PcedHkBaSyE2I41OVWDQgWepfWelLDijrG9xBjNWLNvhCr1+ZEFZ+5gigkl/Tc6gDi5lLOVToUD
	NJ+6MaxCPHdm+M/dTbZhBXZAmhIbRhU4zb+gV7UEdw3wmnZ9AcUkmA2lQ4xGeMApvrFlHWGZfMs
	0WwOryw6gMXBGng5DuACjy+KtA8RexzticWEvjHd1+eVd/8+1jja5k0BvNAmvDDwKVSQA2P5LUO
	KpVEgVQuPaHgoBQGf7qvOI+H4yvWGBZInkbjHkbtfBAwB6J9ZmW02S9UZG8RNl2vPtqiLWVOBLw
	0rYu1YTVyxw2nfcC4VyGKxrtV9Jt/nyBHEc5qpYMvr4N2NzmDqugB16z+hGygCa9lHPxdT6Ykva
	tuAb9gv+Rccs6itpE/00JR8GyyMzqpxFb9Wg==
X-Received: by 2002:a05:600c:358b:b0:48a:525b:e157 with SMTP id 5b1f17b1804b1-48e600c4865mr40157305e9.13.1778161199122;
        Thu, 07 May 2026 06:39:59 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530b05d9sm58003145e9.3.2026.05.07.06.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:39:57 -0700 (PDT)
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
Subject: [PATCH v4 1/2] dt-bindings: input: Document Imagis ISA1200 haptic motor driver
Date: Thu,  7 May 2026 16:39:47 +0300
Message-ID: <20260507133948.75704-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260507133948.75704-1-clamor95@gmail.com>
References: <20260507133948.75704-1-clamor95@gmail.com>
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

