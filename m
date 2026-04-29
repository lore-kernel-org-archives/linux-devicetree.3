Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B723803C1
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 15:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777477503; cv=none; b=VNi3Scv49vOlFItUk2UJwlpVjb1ZoSFy/S+79k3SVNexRFdwRmEqGbXSB9qG9GOFze1XsEMXN5YWdSZQLr9wpcz9DPdRyHJllcZ3jPrj3MFAUyvdsEDCTlxSot/fORZZ9/G+lKZUKYssg6Kkhpd2ece/OTRox+0f431yZtcUPsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777477503; c=relaxed/simple;
	bh=naaaBMARr1xhh3oHzvjOIJ8WvTYfmmL+aUoB+HUe6SY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NKsbUKsbhL4qXfbOUpUpUOmtk8nYSInocchXKwizch5ksZj5V+jhCShgyubwoB6ueDQ17Em+Ly3WtFLSetu6AO+Jidb8UZoggZD1pySbaFrHo7ryzhb5vqo7b+kUEfoUU51TUUDPQWm9LuIDDCZrDxPq7mHZES+q+yoYseZNoHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LtV6dyDt; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LtV6dyDt"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12db7bf1541so10527032c88.0
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 08:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777477501; x=1778082301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yS2i4W3Iab7ck7sMJR72EpBwPoerYuIemmfxcFlxotw=;
        b=LtV6dyDtfIzsDhID3pSPbnucoiFJFkwwXy/7AJ+Ytu2/vtkbWszzSJ5SElQ+ws9C8Q
         coPw/XHjw0Rff5cgFUnXrtpWhgKEkPmSwDlBbD72XBWjOxUga1PAAaE/Tq5gyo16BIYE
         Sz6yNH5n0glLueV1xPB/nvL70M35byjh3JjASiGMEbTaBnHk9w6UQ8MWktaMd4OJ1aBv
         J5LLwDAxgaOb90a4TsK5RJLkDsTabZ07OIfKkSFBA0+fzsfaCBUJaQOQ93lIsro8UlFn
         Twc3M/sHXlBkqeMzPvvHaLAwLwSKTwGTg24+zHrOT2sf7+VY2vM++Rk+Bez1UeyAIPf0
         Gk/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777477501; x=1778082301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yS2i4W3Iab7ck7sMJR72EpBwPoerYuIemmfxcFlxotw=;
        b=D1aarSrBW0c+4y1j1cITpjsWqkJ+/INiudTa9uNV6Dmf4BerWrwiRqCmVV///zmYpV
         WBMR91hvyVIerjgPAN6gBjDCHVvB6mECho8RR8J42n6/KjSYN6zdMOTG7qkIm7dCRZR4
         baunoYqoojxZ3PccW9lnd5NWtlBPf7xj20Zx6ZmRJb3X1QHAl9NnVM4iQTIK9ZsU7gbj
         nn1pf7J72V2CzLrmz7MrPMX+cHpC21X41PcHxMmxHaMXq6jhhUZXjVLUPmkuQRDSLTke
         6ZDFGeiEHCiXjjsoH29qQsvKQoVmtD8+aAbC7gQwWaoGd1kDKZuaw6mNXJeBlRqNIAoX
         mlBA==
X-Forwarded-Encrypted: i=1; AFNElJ+0b8uCKMGAhR9763ZJE2FMFRaG/rufNGPRNkoDgc9Z2gwuH4k0zwPFylk4hCgvvpk8XLoSxRNal63Y@vger.kernel.org
X-Gm-Message-State: AOJu0YwVKtHZKXxT65uQJGOSRM0njtNVGDl7Bes2fBbrxVVU23aFXQDF
	GCwmOka2xeq9/4R16THixK2C/qhGInkr04ybkPSeAqqFNCzaVgCc06vP
X-Gm-Gg: AeBDieswcbWvolTsoB8TqSN1FdmOxJ7fO5Nqw32XY8wDmfJGp0LhvEsjX8YiemOPfXt
	LFhna+8MnFdoTkaKme+CAILdlT3dx78S+mKYUOHzA23YkBPApAiZKFVAPYHaIG/mE6R3cU8brx2
	LTp54U1j/w5PIMJs7MPRQnbkZKQxk7X14wmmb+FahLuw56zZe2Gefzd59FcQaWlwQVFSfh0utbf
	J33GCEKco1B6vJySKanalhyeyHIiRBZKh43UbEYVEpNYVBB5R7lwSQ2umNRonfzZl2KOsPW8WQg
	R21IXO2DXI5yh9ofJNitlaA2I/F6hv20kC20/L9fDqTH48/UTZISWuLkSUv6m/dOW9VI+WSNFaT
	77NTjKXwlASBSPvracq0yO2ayVanN3SAyNnGwD7reLIykfKaWBMBqUxqpFHZ8q33H6VaVRQcJg/
	n9AmYrTVsXJAqrY8sIPED1sSFV0Awx6jo=
X-Received: by 2002:a05:7022:2391:b0:128:d6ed:e898 with SMTP id a92af1059eb24-12ddd9e7665mr4363689c88.29.1777477500669;
        Wed, 29 Apr 2026 08:45:00 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a59:55d1::1002])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12de320ecf9sm3610166c88.2.2026.04.29.08.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 08:45:00 -0700 (PDT)
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
Subject: [PATCH v3 1/5] dt-bindings: leds: is31fl32xx: convert the binding to yaml
Date: Wed, 29 Apr 2026 23:44:45 +0800
Message-ID: <20260429154449.730880-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260429154449.730880-1-jerrysteve1101@gmail.com>
References: <20260429154449.730880-1-jerrysteve1101@gmail.com>
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
index 000000000000..cb4741dee12e
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
@@ -0,0 +1,163 @@
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

