Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D883C8700
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 14:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777992850; cv=none; b=nGsGfXCLtL75e3VXPCtL5W08+r3oAKfPAzzmqwXE7oee3RSuZ9n6coOJaH5X6cRbRns7uGqd7bEF0Yt/HqV5SW9pv2hhAZxPbZRlGn4WB3RT3zLzv5ZHNA9mzB726PmqxfDMbGVsFy04+BT2M+8f2JG9lw1XkcvdHwHv0SUvjCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777992850; c=relaxed/simple;
	bh=naaaBMARr1xhh3oHzvjOIJ8WvTYfmmL+aUoB+HUe6SY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=msqvtNro5TbL8U4RiQSaRNDHb242Y9Bs2LZm8e2hwtXojLW3XfXZnwOJe3EdY5Qgw/dfpNLoSSl6s7pdxw3WbU8PYYpWhijEdzOoA2m0rKElxSYhoqYSr+FnPrdfv5BWCnb6PIaqaqt1JemYMmEJ9kpB/Fy6ewRQaaowbRHFt04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4ky92cg; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4ky92cg"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2bdd40d3c61so6784249eec.1
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 07:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777992848; x=1778597648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yS2i4W3Iab7ck7sMJR72EpBwPoerYuIemmfxcFlxotw=;
        b=W4ky92cgF5wf7BTGp9WHPj7qwM8GUk66dqpBk4ymuFc1joKP862Fi1AKAVM0sNLPn0
         4iKlcgjKkIl6ZyxyYLsDFJTn/bweN8SLetz64ux3ne4WxDaAIRTxJBfTkiGRmob1iK7j
         7liAkRnNvq54a2G3dxOGXrRl/Urro5lexLZ7d7F6g1PUMXF+HW9eTIQt6qBHXcVnVeZS
         +X3swxPP049u7sK6OTp8yLb3YvEbkRH6uhV6hMqPwGG2XMlAlsen+wLB+gQfOkkpCDbE
         iFw7JmDuvW4xKmj75mU1cuu4S2kC0rkU9pM8OfSvHb59JsWcQpDvb/YY+UTou9Y7lv+S
         o8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777992848; x=1778597648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yS2i4W3Iab7ck7sMJR72EpBwPoerYuIemmfxcFlxotw=;
        b=SwStDuxy5S+7RI9zyUVbufnUsoybubivjgO7M+HzEEgQAEkxXkNTaqjbZsFOScacSc
         pkXJuVfSyhR1/Q6LFUG6AXT6HMuXdqfOj6xi5Q2oaPuBXBkXCpq5p2RSKqMzB8v5NnkG
         TlndGQp8EeIgoz7x8B2R9yo4etpkZX4fOeubXebJjA2dY7xYGbMOEnoHXbgP/5M/mhyg
         IunRc65TD5Qghxu1kAOBmKSvmwQ07XSwleF9JYnRh9wQhxdqBw9PzyT7rJUlHItydkQH
         pcLCJmfeKEiLAjW2/qOdp4zywlElZy8ims5cb8NNYF0kol3JV4FVVk0F0ab5eAy1fKCp
         0x+A==
X-Forwarded-Encrypted: i=1; AFNElJ/pnRFfNj2rF13D2Sc/+BPgKFwOzbfGfwXIljRBS0ASPmay8zH8TeLJoZtCnj5hI5t3I/P3gmMLxoTk@vger.kernel.org
X-Gm-Message-State: AOJu0YwK47mGw6YoFXMC0lpKgLDmQ3RqLdaX04w99ekkVDVugAU76SEq
	Dpv8MdL7NOAdaA2nc+ooCj+zCaLWeCGsN6rcEeRRVoWYSCtZvSP+Hgeu
X-Gm-Gg: AeBDievMek6qB6Xh+ZxgbiSj5FZ9Biq934PPX0/1nkbkn8FFtxtgqRQISIRae9vXrsj
	OPCSJQ6/WfHyFqAkHlYZaFd0nTwtrrJv+nVOXmyyNCfR5aEMv1NQTsw5adywxq9j9sVSyQOUncY
	NO2x3Hy34TNRA/08nu3gmiEcUc8zTks65w+ms9+qIkBTKvYpwpD11RSlJXyaAL5aSWdJA9yiO0v
	WG5Mv3lmyVU05sC9Zv5JKoGce4sK4y3+gj5CdEeAsBdRIjK4IPrwBHuNpwz+QbCNeAuLkgzgLSQ
	sVSkaWQIWDgd2HTijgSm2VoX5ntpCa231PZWxbyZlpMS25CNTso2yiGp31UjhnQTkH3hZenpIw8
	8krpKFOuGnBJwJFIuBXd5m5xalTXU7gr+Drt/RpiH4Zf4E7ejpOqW76Kvh8hN6gZggvKkJmYIVA
	sJIu8C4LTLM2GrugAgJmNgykEdB+XRc8M=
X-Received: by 2002:a05:7300:b54b:b0:2ed:6f94:9d96 with SMTP id 5a478bee46e88-2f4097d361fmr1523773eec.19.1777992847643;
        Tue, 05 May 2026 07:54:07 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a59:55d1::1002])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f3bf67cf8dsm5793545eec.6.2026.05.05.07.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 07:54:07 -0700 (PDT)
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
Subject: [PATCH v4 1/5] dt-bindings: leds: is31fl32xx: convert the binding to yaml
Date: Tue,  5 May 2026 22:53:50 +0800
Message-ID: <20260505145354.1267095-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505145354.1267095-1-jerrysteve1101@gmail.com>
References: <20260505145354.1267095-1-jerrysteve1101@gmail.com>
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

