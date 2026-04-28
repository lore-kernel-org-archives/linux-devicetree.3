Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1FE238150
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 00:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777336494; cv=none; b=oOGssZk9LQ8D6XlzJvZgVLCTo0ArUIr0Xmck14RgwA3JJ5hRkQgsYuC12/wNCtQVs5Sv0J1dKTh/dKkZ352h89Z9sq5QXz72rDtyz7aSAqpOrc1AyZVBMrl5nWPd+cYiwHIQjbXr9SoPCXjLC+2sez2CN59WxRIlZ5CI0MflBtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777336494; c=relaxed/simple;
	bh=7AFeZRKYHhKdbZGYpztJASVTeLt/uduXrRwo9TjffRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f+wkOnFqEWmuD2RpbO9Kcud9PNOWCpHsNI7LpetwWk796DPk/1fCSpgeeNLyKoOBDqfKVEqRhZ8xOUz9nytrjEyvhyjUfazC+kdlk/FTXm5qHLpCqtPdE+GwO8uQq9W6XizEG/RycqJekobhv923EBJwiwCxtZ8rIO7GG05V3Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l1UTS7df; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l1UTS7df"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2c156c4a9efso14885195eec.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777336492; x=1777941292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEco3FG0UtC/n5OT9Mg9TVs5Yf+gi8zemuKqizDpXuM=;
        b=l1UTS7dfu8WsJQRQTr1jo0UwutDarHFW6FPhEv9N8vHAggsGpInxc3G7TElvSQeRLg
         NFFdDaVcR+EtQkrbYlA8njLVFvxvJG8CyUiLDP2KmMQ0xkhhvUUArgmU/5JOSS9OxrEe
         ErN4x0oaUFjMOyEfQCMeh0vt+ipwuTuD7H+ZO07N8zdru17dfjyMcBw7WM7pY5I2HghE
         HaDDwUYF/jPwgsEN6IVEzNVM5CC+tqUcirJBGlMmo2Kd86CP6c+8Hi0EjGyeXZYz6NLG
         2hW9UGwEdphCtXbDCz3JHid2XGJ3mkC96yLn3WjI9yfwbOwGTPWYUQEiHUDxRYUWO8tb
         LgSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777336492; x=1777941292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WEco3FG0UtC/n5OT9Mg9TVs5Yf+gi8zemuKqizDpXuM=;
        b=p9yeuP0X3oXjoxHDfeIg43f6gyKZaf2WPDF2ucbv2OtYJrLexNXVfB6J5KWAqHkm1Q
         +UTmfzWUEU8k7bRebvGMTISd3f4hvapq964Cle05MyBNWqUWX1gPF2qS5DU9Jjm9OEYv
         aAGE0P3qBR804/z7K6b/fMShd5rrEfSnWhbUGKblB9WPuAZPsRmvC3xiVBvVAkEgcEhR
         2Wzwyvag9rVliNGBlTbcJi+cel+ekulUZXQl1wkECwst82z3eG3Bff1yp2AsGg/sS2td
         kqd6zYFPolr/6PuUgXQfjFAPapMT7X/j4cxTHzk/YdY/tLrF0lDjDdNgzxouNOKahK30
         Yu3g==
X-Forwarded-Encrypted: i=1; AFNElJ+M5a3w66stQZL4hDDPVnfEQIP0PPwVGRPZ4xMjkw6898kV+CYhzuaxIxGqCemGnxDSLHScX72iL+bp@vger.kernel.org
X-Gm-Message-State: AOJu0YyKlbfBQi8/9G87+aIREHKCOUJsDeKk/tlKTz6JhAOOwkyjervy
	cnd9wug8rt3E0pc+4aadLQP3zlq/AFZC2Rb7H8fG8VjWnBGdqv5OAH46
X-Gm-Gg: AeBDiesO+HrfJKEkR9XH13C7RLZnTEDDor7Mfru8phVcunkeIliog2xXGv2G+zCjVb1
	nsYCQ4rXLIVn9P+psdMHCh+JxuW43V+NLk6d5N7xE5fHptIQsKOjJZw5+p8mg3xoBNebf1w32V4
	u28USrad4FOMl31jePShDmA8LHLJyNzo2dVV5NhmwKsEQltuDVpDkPmUWpp/2O+OKWGqqcAvOQ+
	Emg4VwzOPZdhByRhv9emMB86AWCFJgnvAkN6O6sCCIFOp/qzN69cqNlcfMC5VYTlG6VHiL3Va0l
	GVL0JqDRUJUlBjFqX7V+KLpgKnA1Wem9qI4CzYjEB3hBUaiR+AfRhh/V0QuuWN8qIOgH/zau5e/
	KdRC54fsb332JD3Os9U7MCburJZ07pjGCZn/F0FtR2QTVdYzGvzxsK7N+UNQ9HXe8aZ8/1dXwWb
	Ue3ikO+a3FxdnU+MgmA9vSxg/XNaipb1s=
X-Received: by 2002:a05:7022:688e:b0:12d:c3fb:14ac with SMTP id a92af1059eb24-12ddd9aa209mr460188c88.19.1777336491672;
        Mon, 27 Apr 2026 17:34:51 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a59:55d1::1002])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ddd927bbbsm957144c88.2.2026.04.27.17.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 17:34:51 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	luccafachinetti@gmail.com,
	pzalewski@thegoodpenguin.co.uk,
	daniel@zonque.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v1 RESEND 1/5] dt-bindings: leds: is31fl32xx: convert the binding to yaml
Date: Tue, 28 Apr 2026 08:34:08 +0800
Message-ID: <20260428003412.322032-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428003412.322032-1-jerrysteve1101@gmail.com>
References: <20260428003412.322032-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert leds-is31fl32xx to DT schema format.

Co-developed-by: Lucca Fachinetti <luccafachinetti@gmail.com>
Signed-off-by: Lucca Fachinetti <luccafachinetti@gmail.com>
Co-developed-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 .../bindings/leds/issl,is31fl32xx.yaml        | 163 ++++++++++++++++++
 .../bindings/leds/leds-is31fl32xx.txt         |  53 ------
 2 files changed, 163 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt

diff --git a/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml b/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
new file mode 100644
index 000000000000..ae5736e1b8e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
@@ -0,0 +1,163 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-is31fl32xx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: IS31FL32xx and Si-En SN32xx LED controller
+
+maintainers:
+  - Lucca Fachinetti <luccafachinetti@gmail.com>
+  - Pavel Machek <pavel@ucw.cz>
+  - Jun Yan <jerrysteve1101@gmail.com>
+
+description: |
+  The IS31FL32xx/SN32xx family of LED drivers are I2C devices with multiple
+  constant-current channels, each with independent 256-level PWM control.
+  Each LED is represented as a sub-node of the device.
+
+  For more product information please see the links below:
+    https://www.lumissil.com/assets/pdf/core/IS31FL3216_DS.pdf
+    https://www.lumissil.com/assets/pdf/core/IS31FL3218_DS.pdf
+    https://www.lumissil.com/assets/pdf/core/IS31FL3235_DS.pdf
+    https://www.lumissil.com/assets/pdf/core/IS31FL3236_DS.pdf
+    https://www.lumissil.com/assets/pdf/core/IS31FL3293_DS.pdf
+
+properties:
+  compatible:
+    enum:
+      - issi,is31fl3216
+      - issi,is31fl3218
+      - issi,is31fl3235
+      - issi,is31fl3236
+      - issi,is31fl3293
+      - si-en,sn3216
+      - si-en,sn3218
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^led@([1-9])+$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        description:
+          LED channel number (1..N)
+        minimum: 1
+        maximum: 36
+
+    required:
+      - reg
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - issi,is31fl3293
+    then:
+      patternProperties:
+        "^led@([1-9])+$":
+          properties:
+            reg:
+              maximum: 3
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - issi,is31fl3216
+              - si-en,sn3216
+    then:
+      patternProperties:
+        "^led@([1-9])+$":
+          properties:
+            reg:
+              maximum: 16
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - issi,is31fl3218
+              - si-en,sn3218
+    then:
+      patternProperties:
+        "^led@([1-9])+$":
+          properties:
+            reg:
+              maximum: 18
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - issi,is31fl3235
+    then:
+      patternProperties:
+        "^led@([1-9])+$":
+          properties:
+            reg:
+              maximum: 28
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - issi,is31fl3236
+    then:
+      patternProperties:
+        "^led@([1-9])+$":
+          properties:
+            reg:
+              maximum: 36
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@3c {
+            compatible = "issi,is31fl3236";
+            reg = <0x3c>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            led@1 {
+                reg = <1>;
+                color = <LED_COLOR_ID_RED>;
+                function = LED_FUNCTION_STATUS;
+            };
+
+            led@5 {
+                reg = <5>;
+                color = <LED_COLOR_ID_GREEN>;
+                function = LED_FUNCTION_POWER;
+                linux,default-trigger = "default-on";
+            };
+        };
+    };
+...
+
diff --git a/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt b/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
deleted file mode 100644
index 7082ed186dd9..000000000000
--- a/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
+++ /dev/null
@@ -1,53 +0,0 @@
-Binding for ISSI IS31FL32xx and Si-En SN32xx LED Drivers
-
-The IS31FL32xx/SN32xx family of LED drivers are I2C devices with multiple
-constant-current channels, each with independent 256-level PWM control.
-Each LED is represented as a sub-node of the device.
-
-Required properties:
-- compatible: one of
-	issi,is31fl3236
-	issi,is31fl3235
-	issi,is31fl3218
-	issi,is31fl3216
-	issi,is31fl3293
-	si-en,sn3218
-	si-en,sn3216
-- reg: I2C slave address
-- address-cells : must be 1
-- size-cells : must be 0
-
-LED sub-node properties:
-- reg : LED channel number (1..N)
-- label :  (optional)
-  see Documentation/devicetree/bindings/leds/common.txt
-- linux,default-trigger :  (optional)
-  see Documentation/devicetree/bindings/leds/common.txt
-
-
-Example:
-
-is31fl3236: led-controller@3c {
-	compatible = "issi,is31fl3236";
-	reg = <0x3c>;
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	led@1 {
-		reg = <1>;
-		label = "EB:blue:usr0";
-	};
-	led@2 {
-		reg = <2>;
-		label = "EB:blue:usr1";
-	};
-	...
-	led@36 {
-		reg = <36>;
-		label = "EB:blue:usr35";
-	};
-};
-
-For more product information please see the links below:
-http://www.issi.com/US/product-analog-fxled-driver.shtml
-http://www.si-en.com/product.asp?parentid=890
-- 
2.53.0

