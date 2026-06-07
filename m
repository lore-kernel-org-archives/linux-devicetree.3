Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21C52C3266
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 15:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780845625; cv=none; b=XpnylU4Vsj1Uxij3+KyLF0DSCoguVknrErigIYA8OvxBoSDQ1vsSFks8yF331v0vY+6H330c+kFpHBukl3a44tq3D1m+0C73UdOt0afN97IQQoTPdeCF8qEMRB8Eg1WeNYyrppl8GupYHhdNCUBEEmtl83wX/xsDEKvlTDlUcUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780845625; c=relaxed/simple;
	bh=pLPZ2qxy1mURLCfMx28oL72xNnXwdxw1jIyb7AYdfDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CzCNlPHjvLwFX+ApnCosMCsDuioY59KcItDPLD5yzd38LXRX4JKqD74xvbk+AITF/PNjvoEJV9NTeZAwMoXjIXwJUs0L2Mn+9WDi7qnaeJ6zmQ4IxZUuyElH98UKob7lxwLZLTfbR2frngvEwXVaGg5LGDf895LaKAT995oDmOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MaRCew9x; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MaRCew9x"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-36b8e1760ccso2042803a91.0
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 08:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780845623; x=1781450423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1b+y0Qup+M/gjFnTORp7fBeyfCCPksUKAUMCQ266z2E=;
        b=MaRCew9x9QEwP2MF1sFigm2EpG3SNCiwiJRazVMdh4ORIje5o0CKvrx4VZQ4Z6pAs1
         Gwwq/TjEt9BMiPAsQEMyujRDi/sGDtKCs7t5OYykaaeGaQHH9UWEbK1e9Wfh7Dy21zVW
         AEUsHoMx3Fivn2duMFmHv2r1/DGZqAe73jkOi9iR4tS+Ou6RKrs1vfAkFMPF11o/LDw5
         kNRdTJFQ/BoZ3xPVnN+MyEdMQPpu7Zc5MDZjNRMik+CPPTJlB8vixNA7BmNxnz1xOfio
         qs7Fj6zmWU+OnMT5kkegCRUDjoERPsR4YQvI3O5SpsreyashVzlqtqdAMh0bngvCbLSf
         Otyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780845623; x=1781450423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1b+y0Qup+M/gjFnTORp7fBeyfCCPksUKAUMCQ266z2E=;
        b=qLkYFbkd3EDZCb5c1otoeDUAfozMCR19x8yXMrScia3e2SxZ5TaGC1dEocaHY+oTNX
         X8W7oY/etvkMdCdOEhX692NgVvsjffumFKWJOzgS8eSQLk6zOMHlyf3YBW3IbiTWkFvq
         UM1IuUxx6E0nTVAUiqp0i+UFZrbbVXJMsKwvhkSqJ2K/Grfo5OFBIIEz81cYHf5WyrGW
         wUVt0v9QoTygAWnH08fjD+5xqJQJ5PvVRbcr2vn9s9Vyc9hej3gQj7cVYMGzReu4hci7
         ppd1ALlIHcNHcdVjkRtcA+cPwYSb65LJlqnpE7M64/mEE0zsn2HJ/61PzEtlTIkG5yks
         iA1w==
X-Forwarded-Encrypted: i=1; AFNElJ/n10ADhOSWRB/dHdTbhpV8Gv8HCujgL4P75+EeCl5KqsvsM2lWexsCrHi+hgHW5dh+P64Bn0Dao14B@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7X/dn8qZwZvst1cv4jC4wr8PeJ7BX0m63nCzW8DhNgwxNMO99
	H4GFajPBnpwL02RG5L0zK0fDWzt3bZz8KpiUQnz4NE2codnuunaS90GE
X-Gm-Gg: Acq92OH23B1YDOYEmX8Iu9XnmTfsiO/Yy6OgYWwH+FgFEdrYMQnjSoF3xBhMKE2BKWs
	6EGEfKBA2yrqXRGi7rdQnAV6JmrAVK8poRLV6KQxWc90NUZCj3NuyjXYIcvXq7kvS8YCKvNwroj
	erO2zUYl7WFDhg3eb1ubssJMnWEnkzEB8zqIXGyAkO6bg93AODRdeI1hxNxqUcmzNOex+NyNhsX
	6ru6jid94mGtryOog/16BYhtAtFpnoQnRR2WJ6Cxr7DVJutugyrQRjSciLHNwv6IqpHe90sdyfi
	B8UVVtllfmzbI5fd99GUHSP7w0/KdKDphfUXk0x0WSEurPEgb+NMZNLkUFEr/Jyw4iw+NeCuLcO
	TEBdFtsKZUB+bn6QjUwx48F5xkFEQHFbuwWW03SXpSnRCY+CaCCT0eodbayIM7pFcxq9eRvze0g
	tE82IdWN+/ovoSL2RJdnC108qiVNmg5HYuqUSTIWuq1cvwpKtwXw==
X-Received: by 2002:a17:90a:d643:b0:36b:b4a1:2939 with SMTP id 98e67ed59e1d1-370efda7ab1mr14545460a91.15.1780845622994;
        Sun, 07 Jun 2026 08:20:22 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a54:e741:3a5a:3245:d3dc:4b5d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37135861581sm4130659a91.2.2026.06.07.08.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 08:20:22 -0700 (PDT)
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
	Jun Yan <jerrysteve1101@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v8 1/6] dt-bindings: leds: issi,is31fl32xx: convert the binding to yaml
Date: Sun,  7 Jun 2026 23:19:57 +0800
Message-ID: <20260607152002.446617-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260607152002.446617-1-jerrysteve1101@gmail.com>
References: <20260607152002.446617-1-jerrysteve1101@gmail.com>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

