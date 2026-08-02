Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D913B8BDA
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 15:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785685591; cv=none; b=afvC+T36w3QlGA98lzWHZqMermcP6qRG7kF1cqP5wVFbAtWqOfkdNGAElhd9GYnAnNAjmClrqcafhZ/aDBrkyyByu97WqsYd9R1aPHfAEIVCQfA80n1AGpp5OUsCUm/9d2RXYZAnbONS4Q/xzxoTJBU7mQtKMdtUxfWFlaruexw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785685591; c=relaxed/simple;
	bh=cLrS7qXp57cQ0CJ93Ue4JPXTnXTOGbW99vQlMqWVd/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lqND8Xd3uwSXjhGgYOvvqxAhSjvpISzYqeuErBKjtEEDz0hOYx9t16tF0kcB6XZ/Ynr14sZ6t/C63ZBfI46esQuv3YWhjCAIvDjHoETqqxeIbrhifpXoMVOErhkAfbT7n7oi7oX6dzhW8K56mxsvFVSO9dXvcDgb3gvqtt/LQCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F1fj5dKF; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1fj5dKF"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cf452def93so24962955ad.1
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 08:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785685589; x=1786290389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+VgJgsAsYz6ZQBu8o6pNRg8dz6ngWsg0lMioHUZEeJs=;
        b=F1fj5dKF9rGHy+T2vqrkIdEjgW3Fv6h3GgYVFy3ikHKrEASciEZMSsw2sOYW2KyiQy
         POETdTKSgxfywMF6Z4/iHs9VUVoLDng7MBOCI6YJsPbt1DaM7kWl+/ux0TqFJLNMEeYp
         LWfNei2B+TXcv5U//WhlXh5Q7mYjZhkDurpv5GSCLnv4aWaupdFpG6mx92CgRyIJVrA6
         W7JumN0UzmPcKjBstPdnMyLyjI4OITirdMyhNy+oM3NnnnNzeoBkiN4dr3B9z/Kh2x2D
         0/girRARsqUxgEZ6E/8JsCwqJgKXyNKbw+lZ6MuIXLNOmambq7LZftvyELAhNiKtKhhI
         Oe3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785685589; x=1786290389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+VgJgsAsYz6ZQBu8o6pNRg8dz6ngWsg0lMioHUZEeJs=;
        b=J5eWp6OWj53Fxo4ZGC7Is/omRXr3HlHUbq/PPHtuCwt2quqJNo6Y/IiTIzJyDJHdiO
         OI1A8HsCsOimDczUhcxXtOghGlTKjArjdJCfF3x70nvUpNuF1wC6WxDm1MSXUFopMPbJ
         1qbhKMI0bk0JzhPLdHUAkR2Q7AnTZUxeImbzSqncx6KVkxGUqH8LvtSUWJdxzbJgTUm4
         S62ZAtZw2aO6CH2KoKJhWFrHVy2/8frUOoAXjTWGln88bQ7NqcA5gClxiYZ/4EfMH+06
         iZ2WADrT4e5itiiMM0V/y5j9IXxXDGa01E41VWM1iXJnDQLcJBwqg1hV0ngVOgI2k0D3
         jtkw==
X-Forwarded-Encrypted: i=1; AHgh+RpcVBTsdmnNWj6XGiquvzjTBq/zQuScHTmK4o8F9Gnb4MFXtr+6wabJmshz7U+RzQCcFJ15L7k8IhCj@vger.kernel.org
X-Gm-Message-State: AOJu0YwKzdRr+9AjHh5jP9WSkshfmWs2w3PfSQOlVlbDHE5PWvzW8gAg
	chdIpZmURZ21ZoYVroGSoV/Ue3Wr6oYqxlv3xAOPTy2oA912KPRr0PRS
X-Gm-Gg: AR+sD10nnz5557ADCgDv0Xt+mGaE3ewdrA1vDX/Ig/4u/yRUdRGy6rJglHcRwAdr4Wz
	yUxO+uxSA/h/pa9imm1K2ua44NKN2GzaQFpe7TFq4fh4oP2HUmqwSpCUJKmF2rKCvus9Bkj1Gag
	nHxJgwk2DbN1IKi1VVzbpY6SE92F+l7M4BAA17UrUuzPSVG3fW2yIXl4w3LPWK59NvSLe2Q8NAX
	O0I9JteefoH0NZdTGoZHC5MWdVG/aLVVeMVB6iTn7NkIpTD5/ZpTbZVPcBVeC6iLKggg8ZNExIG
	G7yNmKGlJ2YDAuKyZYtEgd9ZzwAQxteRvVYItUaizwvFcG/Wq3Ca3kpTHJJ51lGoCmlVypGJlMB
	+5JAdxo8ttwX+BgBxL8mY1tpYO5JGXLhNNPCZGCziKQUEGcElib1WKCNy4bixXfleOoaat6iyYb
	ogT8PaL+5xVPOsX92uPMQrIljztLq97gCGLtq1XXMuQYl83MujVqliDBvUHXk0ggyRnFluE3yEu
	Mhl1eJ31Kn/VyySqeAqRM24ptbAHZa1bVN4194=
X-Received: by 2002:a05:6300:6186:b0:3bf:b7e8:68ab with SMTP id adf61e73a8af0-3c91a7131eemr9627291637.2.1785685589201;
        Sun, 02 Aug 2026 08:46:29 -0700 (PDT)
Received: from Mac.net (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e29a126sm30602192eec.31.2026.08.02.08.46.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 02 Aug 2026 08:46:28 -0700 (PDT)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Andi Shyti <andi.shyti@kernel.org>,
	Peter Rosin <peda@lysator.liu.se>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ahmad Byagowi <ahmadexp@gmail.com>
Subject: [RFC net-next 1/4] dt-bindings: leds: Add IS32FL3207 controller
Date: Sun,  2 Aug 2026 08:46:17 -0700
Message-ID: <f45601f5a51e94e4d0fb58652fdd9a80eec8361f.1785684064.git.ahmadexp@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1785684064.git.ahmadexp@gmail.com>
References: <cover.1785684064.git.ahmadexp@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IS32FL3207 is an 18-channel constant-current LED controller
with per-output PWM and current scaling.

Describe I2C addressing, power and shutdown controls, RISET, and
individual or multicolor output groupings. Require board current limits
for each output.

Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 .../bindings/leds/issi,is32fl3207.yaml        | 204 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 210 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml

diff --git a/Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml b/Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml
new file mode 100644
index 000000000..06a12cfb1
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml
@@ -0,0 +1,204 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/issi,is32fl3207.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lumissil IS32FL3207 18-channel LED controller
+
+maintainers:
+  - Ahmad Byagowi <ahmadexp@gmail.com>
+
+description: |
+  The IS32FL3207 is an I2C LED controller with 18 individually controlled
+  constant-current outputs. Each output has 8-bit current scaling and up to
+  16-bit PWM control. Outputs may be exposed as individual LEDs or grouped as
+  multicolor LEDs.
+
+  The data sheet is available at:
+    https://www.lumissil.com/assets/pdf/core/IS32FL3207_DS.pdf
+
+properties:
+  compatible:
+    const: issi,is32fl3207
+
+  reg:
+    enum: [0x34, 0x35, 0x36, 0x37]
+
+  vcc-supply:
+    description: Regulator providing power to the VCC pin.
+
+  enable-gpios:
+    maxItems: 1
+    description: GPIO connected to SDB, asserted to enable the controller.
+
+  issi,riset-ohms:
+    minimum: 2000
+    maximum: 76500000
+    description: |
+      Resistance in ohms of the external RISET resistor. The resistor sets the
+      maximum output current according to IOUT(MAX) = 76.5 / RISET amperes.
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^led@[0-9a-f]+$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        minimum: 0
+        maximum: 17
+        description: LED output number.
+
+      led-max-microamp:
+        minimum: 1
+        maximum: 38250
+
+      color:
+        not:
+          enum: [8, 9]
+
+      max-brightness:
+        minimum: 1
+        maximum: 255
+
+      default-state:
+        const: "off"
+
+      default-brightness: false
+
+      retain-state-shutdown: false
+
+    required:
+      - reg
+      - led-max-microamp
+
+  "^multi-led@[0-9a-f]+$":
+    type: object
+    $ref: leds-class-multicolor.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        minimum: 0
+        maximum: 17
+        description: Lowest-numbered LED output used by the group.
+
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      max-brightness:
+        minimum: 1
+        maximum: 255
+
+      default-state:
+        const: "off"
+
+      default-brightness: false
+
+      retain-state-shutdown: false
+
+    patternProperties:
+      "^led@[0-9a-f]+$":
+        type: object
+        $ref: common.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            minimum: 0
+            maximum: 17
+            description: LED output number.
+
+          led-max-microamp:
+            minimum: 1
+            maximum: 38250
+
+          color:
+            not:
+              enum: [8, 9]
+
+          max-brightness: false
+
+          default-state: false
+
+          default-brightness: false
+
+          retain-state-shutdown: false
+
+        required:
+          - reg
+          - color
+          - led-max-microamp
+
+    required:
+      - reg
+      - "#address-cells"
+      - "#size-cells"
+
+required:
+  - compatible
+  - reg
+  - issi,riset-ohms
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/leds/common.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@34 {
+            compatible = "issi,is32fl3207";
+            reg = <0x34>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            vcc-supply = <&led_3v3>;
+            enable-gpios = <&gpio0 4 GPIO_ACTIVE_HIGH>;
+            issi,riset-ohms = <4700>;
+
+            multi-led@0 {
+                reg = <0>;
+                color = <LED_COLOR_ID_RGB>;
+                function = LED_FUNCTION_STATUS;
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                led@0 {
+                    reg = <0>;
+                    color = <LED_COLOR_ID_RED>;
+                    led-max-microamp = <8100>;
+                };
+
+                led@1 {
+                    reg = <1>;
+                    color = <LED_COLOR_ID_GREEN>;
+                    led-max-microamp = <8100>;
+                };
+
+                led@2 {
+                    reg = <2>;
+                    color = <LED_COLOR_ID_BLUE>;
+                    led-max-microamp = <8100>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 932ea1db0..ff3a93474 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13821,6 +13821,12 @@ F:	Documentation/devicetree/bindings/hwmon/renesas,isl28022.yaml
 F:	Documentation/hwmon/isl28022.rst
 F:	drivers/hwmon/isl28022.c
 
+ISSI IS32FL3207 LED DRIVER
+M:	Ahmad Byagowi <ahmadexp@gmail.com>
+L:	linux-leds@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml
+
 ISOFS FILESYSTEM
 M:	Jan Kara <jack@suse.cz>
 L:	linux-fsdevel@vger.kernel.org
-- 
2.50.1 (Apple Git-155)

