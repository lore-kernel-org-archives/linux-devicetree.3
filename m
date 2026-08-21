Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23383490BE7
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 12:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315856; cv=none; b=Zz6RqFsUV8PPwEemme6d3BcZXOLRKODmiFy0G1Sbcv4vnIjpajK/kf7o6dgD2NVgU2EfkPBFKVhYCS58Bp3wMiMRwHYH72LBu+++9qlJB7QSXIMcKladWFw9JzyubHpXg27yL5UdulZlwiIjVjiJW0xYpMxLdq+Ed5VU/co+Erw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315856; c=relaxed/simple;
	bh=fd/UT7AxPRQvjkXClDym0Mq1d/+IXDaxoIQ4lUKy8qE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=P42snIFLzd3c0R91VhJRkXJy4caD2hL/77tHmBBUduGqF6DJhzts20YyH8hSQ1O+9dFPVQrF4q3XwSm0tTInwH4fKUjttO2II0yyM4cbV7nz+XLsRHNFUgGh5De6TwhIyBfm6LT84PV4HMXenG5mTiCwc8Vniw3XbxqLpOksubE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rps2IpGD; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rps2IpGD"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cf27856f9cso9469845ad.2
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 05:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315854; x=1787920654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VlPMLvuSyJKeKr15QpRC8H8+tqS38ya8JdOW5OZvk7k=;
        b=rps2IpGDSLOhg3xBYaYV5XEVw6dtYCb3vqAix2ensjv7WvMoq3L4+qYguzt0CYsA2K
         1HatvHHMrlo7I3Q0TkCAWej9dPLpf5EwGUXu/zcZ+SvBo/LOZw3UhYLaGH43qCbj8xdX
         jTEfh1IR+Fs/YYVJwh1TqTNMHs1jQa99dhLYUtiv5M3YvA2pgE4jAR5EynISPwhc7qtu
         GSPVUCl0duF97h5uNJvRFB9/DyTN/I1EvqNkEl+CDc6kNoX5o+/sCnMmcjZ3jxNSCKc6
         XGEAGp3pCNfabbxLhxTyZ0vxK5uc64g1Ew4+dz95hJAzJrJzXjeuawzy/iQVBSneSLeb
         qUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315854; x=1787920654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VlPMLvuSyJKeKr15QpRC8H8+tqS38ya8JdOW5OZvk7k=;
        b=Hk9k6s1BRPWCiS4dYXAO7KLUhr6eSBofzoCm/m4xPUDsILNi04e8ebat/niebC3yF1
         t+xYVph97JT/Gbq+OE2cA1TaNA56ivxwgZcpy1Z7fD30Kw4s8YDllmEX0npj9D9SAMgc
         UvWvklSElX4KikjDZaPYyFRmALw8LIOD61zB5EtOEQjzWJLUW4GybGx1aLxawxOo0HaR
         pIc+7hLpa498Jc4MVETR0IOHHBrUCf+xMdbK2rwoQIGAtgytnqCkSHUc3Y/8wIZJ3SVW
         i3exoYFu6eUrx2uelFWGeOvjw8tmntwJXos1M77gKPl7zCk8caOvPEfvjwX1mGEOSjSH
         6o9A==
X-Forwarded-Encrypted: i=1; AHgh+Rq9VwcndIS1q91d7lGkNM+zRBLIdUzldc9Vjr5p/DqKm8E/J+RCmdcMM9C3VQJv7V6kmjrpWnUmbdGu@vger.kernel.org
X-Gm-Message-State: AFuF++kq9g7OjKp6c4lAxPvvkyNnnXb2hdlJz84TAfsfmG91jlWK5f8B
	XtHVz5gsgTQilf/FSfpaI9rjyEokfch2Mblf0tQkgRQ4hkRbdH3JxvoG
X-Gm-Gg: AR+sD100g/HM5Q8Hhqv2Ga5e2u0mOY5opwR5W65g8j33LjMcRBAXozKk3tpjgeFh7uj
	F/FNr0NF0lFxcVwSWbX+J91h13jbGHJnyPb6LB1f9VsNpF1y4zyWqDzi2a3B64Qok+IcW3i6A5q
	BOMZ5YkzMet5Dac4xni77HkIk6LZ/8vtL38PS2Igdjk2m0x+kohfUGqcl4z6ZExAhoH73BsjuDZ
	vVOH+Lw2hxx7ZLA+sbZFs7rQT4XrVmr6ZgehmIsFAlSIkYLfbSIO2U09+H2Wh8JEjutTj7x1M+H
	gpH44fiT4ss6f4yW5OyV2anud0atcDIywyR55tjsjKzjDfgTWR/cjCl+tYjxOXTjFt5z80URfB3
	cw6M9vQ0xf50esAkj3Q1VTojq+V2PWswQYpN08Uh2c/Yb/C5/PYKi1Cw9T6t58zTAuAhIcukJr1
	W556ct2Pi6zEf9ZfE56TBFOs3BoMAs/IaOVrKncUkVkhgdx3M3dyMZ+g+aTyRp5TmLhUvWWnKqE
	ti2bgIMWZc=
X-Received: by 2002:a17:902:ce08:b0:2cc:9179:32e with SMTP id d9443c01a7336-2d64afe9569mr119484575ad.10.1787315854187;
        Fri, 21 Aug 2026 05:37:34 -0700 (PDT)
Received: from inhnjlux1020.ls.ege.ds ([2401:4900:7fb9:38e6:333a:f3ce:ece1:4458])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62d588035sm18057615ad.23.2026.08.21.05.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:37:33 -0700 (PDT)
From: Udaya Kiran Challa <challauday369@gmail.com>
To: lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Udaya Kiran Challa <challauday369@gmail.com>
Subject: [PATCH v2] dt-bindings: leds: lacie,netxbig-leds: Convert to DT schema
Date: Fri, 21 Aug 2026 18:07:23 +0530
Message-Id: <20260821123723.198286-1-challauday369@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert lacie,netxbig-leds devicetree binding from legacy
text format to DT schema.

Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
Changelog:

Changes since v1:
- Use pattenProperties for LED child nodes instead of additionalProperties
- Explicitly list the two optional properties supported by the binding
- Place the top-level required block after child-node definition

Link to v1:https://lore.kernel.org/all/20260820150223.108374-1-challauday369@gmail.com/
---
 .../bindings/leds/lacie,netxbig-leds.yaml     | 144 ++++++++++++++++++
 .../devicetree/bindings/leds/leds-netxbig.txt |  92 -----------
 2 files changed, 144 insertions(+), 92 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-netxbig.txt

diff --git a/Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml b/Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml
new file mode 100644
index 000000000000..02759ecb32d0
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml
@@ -0,0 +1,144 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/lacie,netxbig-leds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LaCie/Seagate netxbig CPLD LEDs
+
+maintainers:
+  - Simon Guinot <simon.guinot@sequanux.org>
+
+description: |
+  Binding for the CPLD LEDs (GPIO extension bus) found on some LaCie/Seagate
+  boards (Example: 2Big/5Big Network v2, 2Big NAS).
+
+properties:
+  compatible:
+    const: lacie,netxbig-leds
+
+  gpio-ext:
+    description: Phandle for the gpio-ext bus.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  timers:
+    description: |
+      Timer array. Each timer entry is represented by three integers:
+      Mode (gpio-ext bus), delay_on and delay_off.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+patternProperties:
+  "^(?!gpio-ext$|pinctrl-[0-9]+$)[a-z][a-z0-9]*(-[a-z0-9]+)+$":
+    type: object
+    additionalProperties: false
+
+    properties:
+      label:
+        description: |
+          Name for this LED. If omitted, the label is taken from the node name.
+        $ref: /schemas/types.yaml#/definitions/string
+
+      mode-addr:
+        description: Mode register address on gpio-ext bus.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      mode-val:
+        description: |
+          Mode to value mapping. Each entry is represented by two integers:
+          a mode and the corresponding value on the gpio-ext bus.
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+
+      bright-addr:
+        description: Brightness register address on gpio-ext bus.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      max-brightness:
+        description: Maximum brightness value.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      linux,default-trigger:
+        description: Trigger assigned to the LED.
+        $ref: /schemas/types.yaml#/definitions/string
+
+    required:
+      - mode-addr
+      - mode-val
+      - bright-addr
+      - max-brightness
+
+required:
+  - compatible
+  - gpio-ext
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/leds-netxbig.h>
+
+    netxbig-leds {
+        compatible = "lacie,netxbig-leds";
+
+        gpio-ext = <&netxbig_gpio_ext>;
+
+        timers = <NETXBIG_LED_TIMER1 500 500
+                  NETXBIG_LED_TIMER2 500 1000>;
+
+        blue-power {
+            label = "netxbig:blue:power";
+            mode-addr = <0>;
+            mode-val = <NETXBIG_LED_OFF 0
+                        NETXBIG_LED_ON 1
+                        NETXBIG_LED_TIMER1 3
+                        NETXBIG_LED_TIMER2 7>;
+            bright-addr = <1>;
+            max-brightness = <7>;
+        };
+        red-power {
+            label = "netxbig:red:power";
+            mode-addr = <0>;
+            mode-val = <NETXBIG_LED_OFF 0
+                        NETXBIG_LED_ON 2
+                        NETXBIG_LED_TIMER1 4>;
+            bright-addr = <1>;
+            max-brightness = <7>;
+        };
+        blue-sata0 {
+            label = "netxbig:blue:sata0";
+            mode-addr = <3>;
+            mode-val = <NETXBIG_LED_OFF 0
+                        NETXBIG_LED_ON 7
+                        NETXBIG_LED_SATA 1
+                        NETXBIG_LED_TIMER1 3>;
+            bright-addr = <2>;
+            max-brightness = <7>;
+        };
+        red-sata0 {
+            label = "netxbig:red:sata0";
+            mode-addr = <3>;
+            mode-val = <NETXBIG_LED_OFF 0
+                        NETXBIG_LED_ON 2
+                        NETXBIG_LED_TIMER1 4>;
+            bright-addr = <2>;
+            max-brightness = <7>;
+        };
+        blue-sata1 {
+            label = "netxbig:blue:sata1";
+            mode-addr = <4>;
+            mode-val = <NETXBIG_LED_OFF 0
+                        NETXBIG_LED_ON 7
+                        NETXBIG_LED_SATA 1
+                        NETXBIG_LED_TIMER1 3>;
+            bright-addr = <2>;
+            max-brightness = <7>;
+        };
+        red-sata1 {
+            label = "netxbig:red:sata1";
+            mode-addr = <4>;
+            mode-val = <NETXBIG_LED_OFF 0
+                        NETXBIG_LED_ON 2
+                        NETXBIG_LED_TIMER1 4>;
+            bright-addr = <2>;
+            max-brightness = <7>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/leds/leds-netxbig.txt b/Documentation/devicetree/bindings/leds/leds-netxbig.txt
deleted file mode 100644
index 5ef92a26d768..000000000000
--- a/Documentation/devicetree/bindings/leds/leds-netxbig.txt
+++ /dev/null
@@ -1,92 +0,0 @@
-Binding for the CPLD LEDs (GPIO extension bus) found on some LaCie/Seagate
-boards (Example: 2Big/5Big Network v2, 2Big NAS).
-
-Required properties:
-- compatible: "lacie,netxbig-leds".
-- gpio-ext: Phandle for the gpio-ext bus.
-
-Optional properties:
-- timers: Timer array. Each timer entry is represented by three integers:
-  Mode (gpio-ext bus), delay_on and delay_off.
-
-Each LED is represented as a sub-node of the netxbig-leds device.
-
-Required sub-node properties:
-- mode-addr: Mode register address on gpio-ext bus.
-- mode-val: Mode to value mapping. Each entry is represented by two integers:
-  A mode and the corresponding value on the gpio-ext bus.
-- bright-addr: Brightness register address on gpio-ext bus.
-- max-brightness: Maximum brightness value.
-
-Optional sub-node properties:
-- label: Name for this LED. If omitted, the label is taken from the node name.
-- linux,default-trigger: Trigger assigned to the LED.
-
-Example:
-
-netxbig-leds {
-	compatible = "lacie,netxbig-leds";
-
-	gpio-ext = &gpio_ext;
-
-	timers = <NETXBIG_LED_TIMER1 500 500
-		  NETXBIG_LED_TIMER2 500 1000>;
-
-	blue-power {
-		label = "netxbig:blue:power";
-		mode-addr = <0>;
-		mode-val = <NETXBIG_LED_OFF 0
-			    NETXBIG_LED_ON 1
-			    NETXBIG_LED_TIMER1 3
-			    NETXBIG_LED_TIMER2 7>;
-		bright-addr = <1>;
-		max-brightness = <7>;
-	};
-	red-power {
-		label = "netxbig:red:power";
-		mode-addr = <0>;
-		mode-val = <NETXBIG_LED_OFF 0
-			    NETXBIG_LED_ON 2
-			    NETXBIG_LED_TIMER1 4>;
-		bright-addr = <1>;
-		max-brightness = <7>;
-	};
-	blue-sata0 {
-		label = "netxbig:blue:sata0";
-		mode-addr = <3>;
-		mode-val = <NETXBIG_LED_OFF 0
-			    NETXBIG_LED_ON 7
-			    NETXBIG_LED_SATA 1
-			    NETXBIG_LED_TIMER1 3>;
-		bright-addr = <2>;
-		max-brightness = <7>;
-	};
-	red-sata0 {
-		label = "netxbig:red:sata0";
-		mode-addr = <3>;
-		mode-val = <NETXBIG_LED_OFF 0
-			    NETXBIG_LED_ON 2
-			    NETXBIG_LED_TIMER1 4>;
-		bright-addr = <2>;
-		max-brightness = <7>;
-	};
-	blue-sata1 {
-		label = "netxbig:blue:sata1";
-		mode-addr = <4>;
-		mode-val = <NETXBIG_LED_OFF 0
-			    NETXBIG_LED_ON 7
-			    NETXBIG_LED_SATA 1
-			    NETXBIG_LED_TIMER1 3>;
-		bright-addr = <2>;
-		max-brightness = <7>;
-	};
-	red-sata1 {
-		label = "netxbig:red:sata1";
-		mode-addr = <4>;
-		mode-val = <NETXBIG_LED_OFF 0
-			    NETXBIG_LED_ON 2
-			    NETXBIG_LED_TIMER1 4>;
-		bright-addr = <2>;
-		max-brightness = <7>;
-	};
-};
-- 
2.34.1

