Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F3E47DD77
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 17:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787247667; cv=none; b=Z+m41zdXGowMvztHi6h7Y0VOPlNlXaBWLQE5ZxueF6nmhvoC8Q5F5hKXTx3o+/nCKTpLWzlKizZe1j/U7z5xq3Y14hkkru8e+Mg4QeMw7UFo2tqheD00+0Lw/XperhwIQzekgm8oc04YfNE3U0MyNYw8bETK8ZwDAWv9b1vYiXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787247667; c=relaxed/simple;
	bh=nE3NS9m0CGtP104BfOww3rTKbBoYEfrERuovGGxTh3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aYKVph72ifFGQ2N5C5XFMPQp0xHTLM94SQyaHqsG0eUW4icWOxhJmADzEE4j1+z2za0MluVjKyyQUSFma6kiJYk/sTYRxRzTMOwVm/dn6Y7IlKxl5Pogf/yzt1TNRXY0v8LSvkO7WgCxYErg/Ctki+ZpWQcaApwaXTbPMelEB3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L4ElOrVH; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L4ElOrVH"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so57633a91.0
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787247664; x=1787852464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PmBDasJo8Mg6jDZjwD3LIPPknh/bD11cU0IMuSkPPsI=;
        b=L4ElOrVHyR7nZZ9RmLZ16hmhKasEbKVkZlEQkTMHpwA0AhtMhhlWpDpTSPKDG288MS
         xrzi6ryzSyspCS4hZgNjWKTuX4cTe+f3u2nb3XSZ+TDfMCfYYba07hnE922aHHh5+fOO
         UnOva+5pazGWBkmE3wOAwax4hu1FUTcfi/YvP11KRyaU0loIEZIcm4YkRNcyKFBi+Yii
         32VwAJRzVN5eiq+IvEmawyzvBs0M4Evtdy4TWP+ZdFbLvG9FE6NJ4CBYvkfaexYehehi
         5XzY1j3+PKNIddN6+0RlHGZ3UDr+AIAtdDsqOXw1AxdqIQCvhlOjPD8aMR6QDq5jF8+N
         Zhvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787247664; x=1787852464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PmBDasJo8Mg6jDZjwD3LIPPknh/bD11cU0IMuSkPPsI=;
        b=XvvQjl4wRCrJ5+cN9C64DfrlY90ukluAUM+EoZal9qfqyVVBioMSG+riqIvCQqbopZ
         os8/gkdH1FclEqTQp2QuMNZGvuuvoihY3/4cWClXJ71z2zr7ap3n8nv0L5KXHKtSEW1b
         ikZKbV3CcBj6Lun1hdhhy0UC4QvANF5xV83f3mXvOWIh/rhTzm3ZnHNJrKaZ/u3Zo8rP
         Yl4IEsSHuibjhtA1WcDfyWSKTKwBTQ04sftVxoLHuY5zQcisEIddKrl7sIN5pRcu14k6
         OJbilfwXSPp8fS0z+1DnwCeBDTvsGQDtNFP7FlD3UYdWZf4/Ot4fjycaKirbdReaxQCU
         arJQ==
X-Forwarded-Encrypted: i=1; AHgh+RoV7t/MzR2mcomnSpaQLF6nEptgLAT5S02gw7UzXcxDFERdUuZYcIvFwHT6w4sHVLE9LTJnh6Qq/NAU@vger.kernel.org
X-Gm-Message-State: AFuF++l9gYcv68j+ciPxE1zSlf0jkWFLtA26KUKnqqn/qWrYGaHXhFm5
	zad6IEn4wxZ8ZdRjUWkdQyvousCTRwD/EBPb93dZDVyTuNH12SgPm2YN
X-Gm-Gg: AR+sD12bHycTd2UlC083OZfoGmE++/tBufY8ciDIShv7Up0Y+tN30lptvNYfbHfzbqo
	ALBWXsrX3LFsjJq6JOCRlCMkzxjHbDqrOIN7FsRIANTe6VkTitNkfhnUbHlhfl9ztEUuG3yS2rn
	eOlGlYcYQ6MDQU5ZRd2uon0ngXERUUeWcWsFUskjmLOBBCJMh/9Xx2ALUlVOQRmFiB4SJFAkD0Y
	t0TCg3Ers+XiveLLK7u8/XFYqAi4jYk6zEVLgJvf9kGBKF6KE9qb9h4gj1KGxLymFqDupw7O5F2
	x+ZDvloFlEzNuOUlyVA1xFajPeSaemLLIPVQdOR2jvVjrxXqZZKDkhOjTZPCHUTBQwXuSurfF4j
	Fb2vdHpuao9MrOdi4hosM8ZacImLP0RdnelQOdx4Uic3fLXZaj5TGjObkabhBfakEse6kMKW0HF
	1RxFYkLco5n8B/9Fcrit6PeTaK0bzjwNSD62q7S9fqjvPpsGE5E/H2EOIJ45S2TVuA2D3fwn3cD
	hWyX4yUJ+7mSodd+3jHQEf7ryWyIiaWyQefE8N7kMeZYek21In0
X-Received: by 2002:a17:90b:5303:b0:38e:5ac1:9517 with SMTP id 98e67ed59e1d1-395c354cbffmr334291a91.3.1787247663512;
        Thu, 20 Aug 2026 10:41:03 -0700 (PDT)
Received: from Mac.net ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416aea2429sm17340401c88.15.2026.08.20.10.41.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 20 Aug 2026 10:41:02 -0700 (PDT)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nam Tran <trannamatk@gmail.com>,
	Kees Cook <kees@kernel.org>,
	gustavoars@kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/2] dt-bindings: leds: Add IS32FL3207 controller
Date: Thu, 20 Aug 2026 10:40:56 -0700
Message-ID: <22d13eb34c85e2c2be8c0ba1b7f3360e7cf9da71.1787247467.git.ahmadexp@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1787247467.git.ahmadexp@gmail.com>
References: <cover.1787247467.git.ahmadexp@gmail.com>
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
index 0000000000000..32eaf14ca7cf3
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
+        minimum: 149
+        maximum: 38250
+        description: |
+          Board-safe peak current for this output. The value must not exceed
+          the full-scale current derived from issi,riset-ohms. The minimum is
+          the smallest nonzero current representable at the maximum permitted
+          full-scale current.
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
+            minimum: 149
+            maximum: 38250
+            description: |
+              Board-safe peak current for this output. The value must not
+              exceed the full-scale current derived from issi,riset-ohms. The
+              minimum is the smallest nonzero current representable at the
+              maximum permitted full-scale current.
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
index 747ef98f21e85..dbb2fc536c065 100644
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

