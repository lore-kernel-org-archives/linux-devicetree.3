Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826403BB12E
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 07:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781679980; cv=none; b=gNTCG64NFhLqIknf47+pUFG3mKp37ssToNdSWcLC+mIgFbcC4Cy9NX0dwyFFdYpIprG8BdzYDg/z1ab6xI5OOncqim8ufUXI/5bMdUaLSHJq/1Gj/yC7J2lA4hxy4Zd3M0V+Y7sFw74u2j+EbDGc7AS9ve/TkxEpujDpGU/5qPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781679980; c=relaxed/simple;
	bh=1ZpgbLFhc7uTynHM6QmCi54UKtHyRhZrUYid+cJ3Fmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V2Nw4KzHQsVaG+k7bY8hiUcNdks1C4VcZsGt+YzqjZvK0jN/q/8W4hIvAMhfn6ocyn73k1y8XGxuhSNjQXWYmY1MpTpOujcj6VW6Tq/joMok5HHUp/jC+DWi0cwnKvYOYCrGjiVLx+iiNhNWuC1SmPmr1Hd6fwVdE/C0WOEpVaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o5t+C5V1; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o5t+C5V1"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-bec449d0af2so655817266b.2
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 00:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781679976; x=1782284776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VN85jO6g8etsAnhUc2JoU6sdjjboKtQLkjRbxbRf3MM=;
        b=o5t+C5V1OIX5WobFQEOuiasNOaVy0ZuFKRMARF2RPp86S+O7B7QJ0kLFJ24yh1/BBT
         Ea+8nSF6NSo3tcl+PrjywqevE+j5keuWUo7AzDjQjHd/FxGO5D0w5LTOIPM/kO7T+QQd
         KIO2Jl4D1N7glZUVloMN1r4s5zwZWOCLo0O9TxMyL+s09ne95rJg47S/MdkpYRa2fAWy
         KjenSNr2VAFs/3pMiByfNWJTHH1M1dqJmWhamZHKj+aHG0tYNL4q5rqbEbKsYB+OpiOF
         yDyRtmxqWtGBQ+6MsZZECI4dMNtVjNk3pt63jwIZ/MeokSn8sXpD0AjJq33rzF5e4oI5
         K89A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781679976; x=1782284776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VN85jO6g8etsAnhUc2JoU6sdjjboKtQLkjRbxbRf3MM=;
        b=cbJH7mYvKMeM/D1xC+k+DapapgHWNG/C1RwFPdrsb3DSYrsi2wADhsOQ5UHrm/ghmX
         XL0Y8nZIJ8K9CEbODCTfT5R5M3XQu5D2nTbaRhS9nxL/T/h6Lzi8q1e3+yKKHUGo4Q1g
         GhGsiziR5u0kQ0iayWgjI+GFYJ1wVmuT8f5EMIU0rXc8PvXxhB/T7Xtt7gWq8ULyYrOB
         7xyOXXpCOHpdknEOdhpVDmL0RpVo/iEST43+QtVXxMEgMItWzOcYvFANAD7LZRsQE4cp
         6O4AZKQ6stMVgenIpIaVgMDcajh3A48TjlcC3Q9MacYtiRfDq46BKFAsAzcjRMeI+nyD
         rGUQ==
X-Forwarded-Encrypted: i=1; AFNElJ8nuBG1tQ6SjKmEGM57xVEndFK0W5gS/gM1Jg95nyFG/0IY+wKAEqZqRAm+5aYY0CdN3mP/ruPBUIvH@vger.kernel.org
X-Gm-Message-State: AOJu0YygHw00MxoB8+6NRSNxCkIKEzm+ujp4hZPoE6kbwVXdxXwbQadB
	60PVIIiG8q/tob8mrtg233HskdI/dOFmierCmcfAOYAVO73HX/Yj/Xdc
X-Gm-Gg: Acq92OE8CiyQBGdYekV9fYmj0sjeokQh46ntVaOceiVlA2Uz7PrQoQR8xRVDaEVTvCD
	WNx4yvLuhkyz1n+ax6sRppZ5os3CWn17t4mF/I2Oed3vp7Lsu5m+9Bbp2HIm8kkEjAEbaJNhU87
	ZzQRs1jWOgmcVQ4jYTZHqTSzT++FG7nfJGAhvxIpauJVzZbhhxLnqp0Tsbh58QsNxcc6aBjP9b/
	OsdBLpNaE046XG6r346p6gpbOPdYc+/gGz2C9SXLuLLxcnpKSopWbCOKFFnT4vPTAFEylRJRjXY
	yrDqYyOD5FGgnqCPX0UXHTzqATNV09pQXhVL0tA8nL+03S6ksJ+GeHvrWN7gwVvwMou/bwFN2fJ
	y0CGl+cE7WKxEymPceF5gII05gTwrkkDLWLcwYe0dG79qzk/805b3zx+KaHMPPdsF1NeYutfqPA
	8kBg==
X-Received: by 2002:a17:907:3f0a:b0:bec:6c5c:cced with SMTP id a640c23a62f3a-c05a69ec26dmr196055766b.28.1781679975407;
        Wed, 17 Jun 2026 00:06:15 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb7b6e6c9sm752857266b.39.2026.06.17.00.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:06:14 -0700 (PDT)
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
Subject: [PATCH v6 1/2] dt-bindings: input: Document Imagis ISA1200 haptic motor driver
Date: Wed, 17 Jun 2026 10:05:26 +0300
Message-ID: <20260617070528.35006-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260617070528.35006-1-clamor95@gmail.com>
References: <20260617070528.35006-1-clamor95@gmail.com>
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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/input/imagis,isa1200.yaml        | 141 ++++++++++++++++++
 1 file changed, 141 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/imagis,isa1200.yaml

diff --git a/Documentation/devicetree/bindings/input/imagis,isa1200.yaml b/Documentation/devicetree/bindings/input/imagis,isa1200.yaml
new file mode 100644
index 000000000000..4bc8630edcdd
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/imagis,isa1200.yaml
@@ -0,0 +1,141 @@
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
+    minItems: 1
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
+oneOf:
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
2.53.0

