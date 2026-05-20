Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE133E1D0B
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 13:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779285441; cv=none; b=qLhZ1+iJZf4bym2aJiuLOTuUB8TsYoRI2OudnJOBbMQ8Lw2OvPLN3seyBGuI0SoWfhV+QNisw8wG/Wbnd6QEYhVMfeUkWG9Zt+qQxyyz9BhylolPojcNSHTjjbxKb8HJ+44sgNQlDrHnazwniyV3ewq6egnUgQtop2Zsb5KFFuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779285441; c=relaxed/simple;
	bh=BjdykeHS9BqEJZE1gE6CCOK/sLg66E2Y5BAmWKBD3Ho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sU7Teakq5XUCfq+PNPzt/5QDk9gjaSEtTtiWlpXM9VVAGAqGdfjPHETUO3TeMaCtUKNCKo/Yigp6bNTSROLCOkmmc9YuZ8Kl4oY5bhdzYe7dP7XnWUgZENkcJKIOfwJJIqs+a87A45GwSmR1RwH32xbLSD8cQFj8kLO/cz2E9ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bOoNNlmW; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bOoNNlmW"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-369576666d5so2228297a91.0
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 06:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779285439; x=1779890239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oAr9Tuamz6G4RMhF+mEaQvtccn86uYkrnM5/9wq0C+4=;
        b=bOoNNlmWt3pzy80/FlyyC22VYbFo2i51ocCe7x7zCmEC7NA0JrkKBzihfKw3xN0nz4
         nSfleDKr1bkrPWlKY5kB67mbAm6Oc7IlCf+js6f41MzwOU42zD8z7/j4s8XNWaRZaRQQ
         /SFlYEbubGRCGqyNJ0WOO1FQi4WmbYEqT18Zocv6dQFW4hECsFNUbcRowpMGiMGR9mQY
         yHdudmTwNCaDz6WvILASZ3895RdcZLi2t+Taeej6e9Q28GChCIEuhto5ppO6R/87Ogh2
         SdnHbK2UNhfl1dtcgP13n9pbWtEUNmB0fXxlcsU8FidgCpy4UPlFuWGHZ3jbwJS6Mui8
         ADzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779285439; x=1779890239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oAr9Tuamz6G4RMhF+mEaQvtccn86uYkrnM5/9wq0C+4=;
        b=Z8jpsM2IYdBoRP3hVokKgqMTPpMzWgv9+MYTUUWVpUp5mpfebprH3O1oj3bylHrU5C
         rx559jS1PI2q7WsYPT35KM+IGBhR0GTh83Ol19LNuHkRQpNi5rwv2znJ4Q6a3+tdKouQ
         A0xvZcOMabRxy4qojHizAXJsfRPj1BU8FvUCZggLO7JHUAJoxQr1xa2NKmTmMUjnvnA5
         JKXp0tOOPQFTQGInU2QepT+HPSjMb5OtC11Q/JEIYjLIRtfKuG+m33lLfL6pjIyli9KF
         hH5XnPJC9bl/Lxjp/bQ4JxM//yvKK8mbGTyJyb+fhOvjQqe9w0j8nZdBJVxCbQYNFZS1
         sfJA==
X-Forwarded-Encrypted: i=1; AFNElJ+0G6SJHKltsS+rjOqKz/x8ZJEvUEwnM5m3XLA/W/ID3iP7bL/KCtOoZLZ9hQEcyFP/5cF9p/wZ/60d@vger.kernel.org
X-Gm-Message-State: AOJu0YwtYNLnKuvvWnnlAI+fEAV3p/WhvqTHq65JXbc1CiKin7Ii8Gu1
	Wx6hvpR2yhu/U1gzzheiD6OOMqJg7Abj/v1vLKl6xATkVlzcbr0z8YDL
X-Gm-Gg: Acq92OESOS4J3lYCyv0n7XUlURQt/zV3hSYZSXbgn8QA9CIk/3Vso++1uWQJOKfqgjz
	wnxqoP3oxXZ6wpSk5gZQaLOU9yE+fupBCC3Rm7J+gHfxJE8y0OeBy7zTOg/f4xffCF4tBxfV1iX
	dCytAJNV6t0ClHPkvQVnhMZ2kAS2iEkXzHmLLymMgf1bkGiZ0DIg+wjMyfRgI5ulbKWORkTzLa7
	isTQK/6Pp6ByVm/GZBM4Nft7YUF5n+5okzHm0YPN6rF5aCHiaQG6rhFshBebwk3PeHUicgqVRze
	/HxAfT3RsxjrNTh/zqp3Xd/VT2cFEoe8NhmgZMwwAPaUk8hdF91D3zPC0hqcbH95aVf2Qc7KpTW
	E+pldmmEM1yW1AqrCig/TJ7/yo1gqENHzt2x7jOxt4qZ56MGUowdmqXqpMD8TKCbsCf9+gAZXek
	hQlU6IxI2+BJMt/OwKLaVlYYnGYXjYSW0T1OYvPTA=
X-Received: by 2002:a17:90b:38cf:b0:35f:b647:d98a with SMTP id 98e67ed59e1d1-369519c6bcfmr22869963a91.5.1779285439101;
        Wed, 20 May 2026 06:57:19 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:5b11:a58f:5208:2fa7:bba5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369572e1007sm7480867a91.6.2026.05.20.06.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:57:18 -0700 (PDT)
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
Subject: [PATCH v7 1/6] dt-bindings: leds: issi,is31fl32xx: convert the binding to yaml
Date: Wed, 20 May 2026 21:56:54 +0800
Message-ID: <20260520135659.1430008-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520135659.1430008-1-jerrysteve1101@gmail.com>
References: <20260520135659.1430008-1-jerrysteve1101@gmail.com>
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
 .../bindings/leds/issi,is31fl32xx.yaml        | 151 ++++++++++++++++++
 .../bindings/leds/leds-is31fl32xx.txt         |  53 ------
 2 files changed, 151 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt

diff --git a/Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml b/Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml
new file mode 100644
index 000000000000..81f1e30e493d
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml
@@ -0,0 +1,151 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/issi,is31fl32xx.yaml#
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
2.54.0

