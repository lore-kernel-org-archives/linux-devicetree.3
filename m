Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E463E275E
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 13:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778245917; cv=none; b=Z0z1ohkeLa8DouluP/6li0fPlvV/IfnjiS223gTSyfA/89+D6NJ9+sxbqFAJbMt3lnbxdYAhaErbZ2AsxBWKpXUwG5ZB/DVfJiTKydWgZHzYbmvhoBdeNzWjOF8o6xT1wW/Tqfj6si3z4r2Y+TIsiYWRj+X4ZiKtVsG1t4JJa3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778245917; c=relaxed/simple;
	bh=OgCcMb4gplFU8la6RcwEtc9k9G+jCDy7i1x/OuMCftU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tBMCH3Wbnqxvc0BqLQP3TH+SApLnF5PC4pFIlJUdsjC+VZUTKYmEuVCoAXBuWh/zw4LJppkfLUhMvFBF9U5AEIIlnRZFjMQVM2SHZTk8+7l6BINDGvuKBWw0UpwCYEE3GG1ddQ5oT9Qwg5PLc7mJARZURheAnW9wfHw3wD00IyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F2c1B55i; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F2c1B55i"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12dfee30612so1015638c88.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 06:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778245915; x=1778850715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UqP9B5E97q5AjLcp+nXB1X0SsMVGTRPGCzEJd9lRdaU=;
        b=F2c1B55iPPUvae9cEibPGqxyzosYRcGtX0A7ORAvR50TNTjoeo20jEqypiKtgkz56T
         /nffB2Mt2sT+6BZglHpeJIFmCcQ5wHSmWNvxiT3968AUsyamNVdBZie4JwKHcQOZArFT
         Wamd6RLfCq0zKlxVIl8Xas2Asi9mn1JoJMpepSSClJaYPfr4ZmXLsPwKmmh0QCVdXWiJ
         qQ1I6uEYRz05AWsmkLSP208ZE+btGUt/+DCp/g0YBqh83QziZ+LSz11xXcTBcesj4XOx
         j5Xh4F+A8HSesR0HgLNpOby4A/DXq5lvt7zLTSj6eih8pjoCArxXnEiXO9NpKxlBM9yr
         GmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778245915; x=1778850715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UqP9B5E97q5AjLcp+nXB1X0SsMVGTRPGCzEJd9lRdaU=;
        b=fugX9qJr9mxqGL52rjtzyDnYQrJsZWqU+FanKpDnE6If9O/N6vWwk40TfmZw05TfP5
         5oYiwc0nEP/VGRhgpvPKdO4IkrM/NNfQqNbNNxdACn/YECJs+q925WnGCVEC0AyUmNg1
         HIzXuqr0NShjY/lIlk8net040QS7uuY3WC28CsMeyh+Ke2kEVb2JBC0NHrwO6sUPo1F9
         VuDA8teDCDXL3+4jIQ4iDBTECIGZ5/SZFrxLDXCEhlyDX2Wg29XOL+fAn+0ShXLb38Ry
         CZBVxPWg7sUwM3QvvBEUCtG2ltk4Wu/0melw1DMGUoa3Nzar9GW8uOgFyz3DpgrXjYD6
         hKEQ==
X-Forwarded-Encrypted: i=1; AFNElJ8wLGcZIlM3i+AfITq1GdwU3gAfkIRp7JNJxi0pdqvt9/R8AV/hNIyG0TXQWkPNAMyMey+KJyFiyaKo@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi242CoR53Af1ZoGG/eQfLo2vWvJK61WbG3UXC0L063PFZx+FP
	Gw+Clg7s3RzCad+A7OZ2rRYXopDTX6vwDhcbF7EqDhHPBDhjJ3+TuEoYqp62O7tD
X-Gm-Gg: Acq92OG0Wp1Qmub1COsv791pTcMUQMVVaEU3Z0p+Ey2XeXFsFFFNBHiG/bBO5K9hjXT
	omnrZ6+Xoi4OsXviO/f83ckgSL2LoXj7noX9dCEhOoznNf9rHSzu+C0jmfpGdXzYZNACP+1AIH9
	Wcwi4RPmiguRFsr+/yY6+cKm0eBkSegQYbQMPBGUSSkdyoBhzffDPzh//v56uWST5zlamaHnY/e
	P+oUq1UNpzSuZ5pXxJnnAo2qzeC2SGWakCJlg3IPpngEFKXRQ/M0/XVZv/I4fiuf1XOCmhIVyKI
	iaHsAA5R4NzydSbDFltImWEe/md6vBCG0djLKzTYTtL7nc+tw+p0lZ1CuQWCtru1hqmndak3Y72
	N3sJgSKc7bog4LeVXxfJ28Sys1fJti7iyl57S7uZMhKmzhuaBv+y/J/M8Ngnp3UptcnI+nZQfQD
	PQIG2IKtlmDUPnIBeeVjOvPmFN9rMDFtAJ8To0G88=
X-Received: by 2002:a05:7300:e7ab:b0:2ea:b7a9:580d with SMTP id 5a478bee46e88-2f85bf850a6mr1325407eec.9.1778245915059;
        Fri, 08 May 2026 06:11:55 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a53:11::1002])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f91004b6a2sm683666eec.0.2026.05.08.06.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 06:11:54 -0700 (PDT)
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
Subject: [PATCH v5 1/5] dt-bindings: leds: is31fl32xx: convert the binding to yaml
Date: Fri,  8 May 2026 21:11:35 +0800
Message-ID: <20260508131139.1523597-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508131139.1523597-1-jerrysteve1101@gmail.com>
References: <20260508131139.1523597-1-jerrysteve1101@gmail.com>
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
 .../bindings/leds/issl,is31fl32xx.yaml        | 151 ++++++++++++++++++
 .../bindings/leds/leds-is31fl32xx.txt         |  53 ------
 2 files changed, 151 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt

diff --git a/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml b/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
new file mode 100644
index 000000000000..f4a6ef99b477
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
@@ -0,0 +1,151 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/issl,is31fl32xx.yaml#
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
+  "^led@([1-9a-f]|1[0-9a-f]|2[0-4])$":
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
+        "^led@":
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
+        "^led@":
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
+        "^led@":
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
+        "^led@":
+          properties:
+            reg:
+              maximum: 28
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

