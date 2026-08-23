Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB0930C157
	for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 16:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787502915; cv=none; b=Dp0DBsHlImvI2sUQIZf6KZnz7Jh6lHXXdp0y5r2dP7nOJHEBsZTPXC0kHWp5+pPkJCcqXQT/77t4V0IXdWJx0Ih+lNbh3Ds9c4sTdTLGaW/lWR/58a3NydaHLXXKszLmhT84U8O8m3CsmgQUWIDfeCiKKXleucO3bclSfV7aUzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787502915; c=relaxed/simple;
	bh=yOi5wvby6p7MASNrD+JThJXjczShryYeqdw32eBGRQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YST3UrgDXLiwQBFfWGiv6wHE3rBehKh7wKDmQLVv3jrS6LpVG59ysHzl2yP+fagSoA03Z/bZbKHRWRuedWXwQTSdvlPlNtSSllJYxHeZiQlJWGgyrqL0PCA4gxMwASuqWAQUWneMrZj7KxnPKcyv/LNucEB7dXswexHxslWG6lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ldk6a4kq; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ldk6a4kq"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cca0c5799eso21981975ad.0
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 09:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787502913; x=1788107713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pd6T48A7aApc+pE+AxMi1CyromQqyIH35NBi1IVtFiI=;
        b=ldk6a4kqTH5yfzQnN8dHFUmGtFbW9Wulmv0kbL6muvHtwfMB6kRFra/TKJtwWWNbTO
         aHBgCaq+4tcPqEfWbruNT2wBUds68qR8JFpBJZzpdsGbQJl7YR3UWH216n/Q0HCHnnR1
         jyg/V5xKjnpf/fsWZ/vyRl6qfukcu8jP6J6BrVqaLORWL5nI5HrWuKYzfr22eZoy9kcC
         pLWxxO5fIGPw5VE5VCwLIzTqNkNvSavvqZqKhAenjkWoW0gGO/+HCK1/oYUIZ0YEYsY/
         MaE+rSrYQsDHfvtI5xD4ww5b3/5Qp0sPyW3qMmQcR5IpN/VhHWFdYzlcotDcL+FZMVCg
         2tzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787502913; x=1788107713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pd6T48A7aApc+pE+AxMi1CyromQqyIH35NBi1IVtFiI=;
        b=GMoMcGs8i5uCRO2TWQt9gwSBkGr/SoK5KxBsmVsuG3gbIHmva5iE+IkuA0E9qL6rXn
         J6IUTMqBr1Nsv3ksPa7/ds2TMfzz4zNaUsDUvKQzETkRZIhbg/oUNyEMV+Mzb5PB0oG+
         UQwq9nTktnCwV+ScscM7KeFFt/mwkQpxeIeve2Lx3hMOZ1VN8GCaZAD0j86hsIKp9BNE
         +zkpbMHtRDuGTeCL3xUkBss+/nBkDE+i01bNoVn2KWEgmo/5ehd9L3FQ+2UpMtBJivvr
         MWDCuEV7F3Y3Jx4txV3RlKvrgqZsi5O29IRHoJzIla0HsIN4Pj/+Ty2kpC6KGSVrjh44
         y2vA==
X-Forwarded-Encrypted: i=1; AHgh+Rq05Bz4OBJbqhwEfZvN//AlfOgROjQUJF45H8dgkb004SHR9p5+9uFexiqIiFxal5TH4/EA866hf//Y@vger.kernel.org
X-Gm-Message-State: AFuF++lVxL0n23kFMleFj7Vy+QUAYtT+lO1fCeRPFLBa48+jYEGVpIIT
	k8Nn8WNV6/KNLDY9U/DFN7zccXW5/8KdPNJOuxLdVY5O3PwFanU/X6N/
X-Gm-Gg: AR+sD113ujE6hOTNOXdd66IPQGOopzErHwqwvHUPuPwRMfyMk9OlhPeFVaUJSBpf9Gp
	g7DbK49OwozvjiMXPekJNen43sRfABxTHory+l0rOfPzpEv9FucIjEbKOcj1xJFD9GHN2dOuqOU
	r9E4lHK+9cOnrBxAfvJ8idMQrcmXN4QHNJm3BiDC6MWBFtu85KV2p5R1VRSZ0dDLNIrMP1Rb+Ug
	vqUHDysD842WeX725K+blU2mpa2F0bF1KTMywoFT34dSyj+Q8Gm0qg/gQY51FXpjP4olxlBHskJ
	HzdTbHg2LFFearCBMOPO9Ieb+3SZb4tgPW0K4/1gR5kBq4osGrZmGLV8fTToqfhgY60HbS/C93x
	EUuQu05Qaur25afrH/sYjKZztOXXyoeBUwQUMglJOwEArVPCmxBg0TX1CC8FjSY/OTciJFE623f
	urxLM7am0eT2l/T9c4hRbc1rSajHwZQ1yXLWuYTbtZcF++KBAg9ysHxsn7hmnjZS8tc7f04ji0Y
	UrswVE7BeX6a3YIn0ST/W1qrpcYNaVkHaiZBRXY0xHF2SZhvN76+mnN46JZZzBZ1tsKO7Pt3l0X
	vYtlfL7HIuK26RNmVwd3
X-Received: by 2002:a17:902:ce0b:b0:2cf:ca89:499d with SMTP id d9443c01a7336-2d64add8343mr416105945ad.7.1787502912795;
        Sun, 23 Aug 2026 09:35:12 -0700 (PDT)
Received: from Mac.net (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f923615asm17514358eec.29.2026.08.23.09.35.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 23 Aug 2026 09:35:12 -0700 (PDT)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nam Tran <trannamatk@gmail.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ahmad Byagowi <ahmadexp@gmail.com>
Subject: [PATCH v7 1/2] dt-bindings: leds: Add IS32FL3207 controller
Date: Sun, 23 Aug 2026 09:35:08 -0700
Message-ID: <28f5f4a212c8110ce4fbaa97c3c5b7e98ca30157.1787502624.git.ahmadexp@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1787502624.git.ahmadexp@gmail.com>
References: <cover.1787502624.git.ahmadexp@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IS32FL3207 is an 18-channel constant-current LED controller with
per-output PWM and current scaling.

Describe I2C addressing, power and shutdown controls, RISET, and
individual or multicolor output groupings. Require board current limits
for each output and document their relationship to the RISET-derived full
scale.

Allow dash-suffixed multicolor group names when a group begins at channel
16 or 17, which cannot be represented by the common schema unit-address
form.

Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 .../bindings/leds/issi,is32fl3207.yaml        | 285 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 291 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml

diff --git a/Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml b/Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml
new file mode 100644
index 000000000000..4d42a62fd467
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml
@@ -0,0 +1,285 @@
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
+  constant-current outputs. Each output has 8-bit current scaling. PWM
+  brightness control uses the controller's default 8-bit, 62 kHz mode.
+  Outputs may be exposed as individual LEDs or grouped as multicolor LEDs.
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
+      full-scale output current according to IOUT(MAX) = 76.5 / RISET amperes.
+      Each LED's led-max-microamp value selects a board-safe peak current no
+      greater than this full scale, using the per-output scaling register.
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
+        description: |
+          Zero-based LED output number. Values 0 through 17 correspond to
+          OUT1 through OUT18.
+
+      led-max-microamp:
+        minimum: 1
+        maximum: 38250
+        description: |
+          Board-safe peak current for this output. The value must not exceed
+          the full-scale current derived from issi,riset-ohms and must be high
+          enough to produce a nonzero per-output current-scaling value for the
+          configured RISET resistance.
+
+      color:
+        oneOf:
+          - minimum: 0
+            maximum: 7
+          - minimum: 10
+            maximum: 14
+
+      max-brightness:
+        minimum: 1
+        maximum: 255
+
+      default-state:
+        description:
+          The driver performs a software reset and clears the PWM state during
+          initialization, so an existing state cannot be preserved.
+        enum: ["on", "off"]
+
+      default-brightness:
+        maximum: 255
+        description: |
+          Brightness used when default-state is "on". This value must not
+          exceed max-brightness when max-brightness is specified.
+
+    anyOf:
+      - required:
+          - function
+      - required:
+          - color
+
+    required:
+      - reg
+      - led-max-microamp
+
+  "^multi-led(@[0-9a-f]|-[0-9]+)?$":
+    type: object
+    $ref: leds-class-multicolor.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        minimum: 0
+        maximum: 15
+        description: |
+          Optional zero-based lowest-numbered output used by a group named
+          multi-led@N. Values 0 through 15 correspond to OUT1 through OUT16.
+          For a multi-led-N group without reg, the driver derives the lowest
+          output from its component nodes. This form permits groups beginning
+          at channels 16 or 17 while following the common multicolor node-name
+          schema.
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
+        description:
+          The driver performs a software reset and clears the PWM state during
+          initialization, so an existing state cannot be preserved.
+        enum: ["on", "off"]
+
+      default-brightness:
+        maximum: 255
+        description: |
+          Brightness used when default-state is "on". This value must not
+          exceed max-brightness when max-brightness is specified.
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
+            description: |
+              Zero-based LED output number. Values 0 through 17 correspond to
+              OUT1 through OUT18.
+
+          led-max-microamp:
+            minimum: 1
+            maximum: 38250
+            description: |
+              Board-safe peak current for this output. The value must not
+              exceed the full-scale current derived from issi,riset-ohms and
+              must be high enough to produce a nonzero per-output
+              current-scaling value for the configured RISET resistance.
+
+          color:
+            oneOf:
+              - minimum: 0
+                maximum: 7
+              - minimum: 10
+                maximum: 14
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
+    anyOf:
+      - required: [led@0]
+      - required: [led@1]
+      - required: [led@2]
+      - required: [led@3]
+      - required: [led@4]
+      - required: [led@5]
+      - required: [led@6]
+      - required: [led@7]
+      - required: [led@8]
+      - required: [led@9]
+      - required: [led@a]
+      - required: [led@b]
+      - required: [led@c]
+      - required: [led@d]
+      - required: [led@e]
+      - required: [led@f]
+      - required: [led@10]
+      - required: [led@11]
+
+    required:
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
+            enable-gpios = <&gpio0 4 GPIO_ACTIVE_HIGH>;
+            #size-cells = <0>;
+            vcc-supply = <&led_3v3>;
+            issi,riset-ohms = <4700>;
+
+            multi-led@0 {
+                reg = <0>;
+                #address-cells = <1>;
+                color = <LED_COLOR_ID_RGB>;
+                function = LED_FUNCTION_STATUS;
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
+
+            multi-led-1 {
+                #address-cells = <1>;
+                color = <LED_COLOR_ID_MULTI>;
+                function = LED_FUNCTION_INDICATOR;
+                #size-cells = <0>;
+
+                led@10 {
+                    reg = <16>;
+                    color = <LED_COLOR_ID_AMBER>;
+                    led-max-microamp = <8100>;
+                };
+
+                led@11 {
+                    reg = <17>;
+                    color = <LED_COLOR_ID_WHITE>;
+                    led-max-microamp = <8100>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 747ef98f21e8..dbb2fc536c06 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13817,6 +13817,12 @@ S:	Maintained
 F:	Documentation/filesystems/isofs.rst
 F:	fs/isofs/
 
+ISSI IS32FL3207 LED DRIVER
+M:	Ahmad Byagowi <ahmadexp@gmail.com>
+L:	linux-leds@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml
+
 IT87 HARDWARE MONITORING DRIVER
 M:	Jean Delvare <jdelvare@suse.com>
 L:	linux-hwmon@vger.kernel.org
-- 
2.50.1 (Apple Git-155)

