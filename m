Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E41381E98
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 19:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791745849; cv=none; b=gyVb4w02kcXRXif/fplvtRpbuSNpIpq9648MjWMwP+oIrEDlhFNXeyioiRTOJzypGnpQJsWj9N87abE+qdgXvVUHNlxQ0Eg1jS4nHgsAZ20IWa73HIED6wNfo1qplghJGitYy33ewzosfBAZvUpT0Hyh9xBH9JJCUxGfkPTN+8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791745849; c=relaxed/simple;
	bh=wVwtf3VBmI07awCkCM8Q0hmm9lshfUUpGDDa7XJpyRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ldmbIuX603FdtwgRi+jNsUZZ6OomFTQ/9yxe8tJLC4fNHmERdA7aWnofldAtPrQrqM4Q6z2z5wWtIQoP0vVTyxJcpm490HM1UfQztMVCUAcPs8yV+EffHLKuUUdqaPmVBMjLtercpkHL+x33e1tJnm8f6TbEWm1UzNFRC3fnyhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ksjhg+Bw; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ksjhg+Bw"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48c45111bebso634090f8f.0
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 12:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791745845; x=1792350645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fTeW0dCMannfUqmrWOxDyxXAwJxDr0EkxzUlrfb9Tgs=;
        b=Ksjhg+Bw5UCnBvJbkjQBwNfm4RZXZjT26jboELZrU8NbRXzPjvHybyitKNzKdfaq9E
         xKZ7YBiiXX4l6bm5U34dIxODeoAzcRlHuolMZaZD7vYyy3QTqSuVSY0TipV0xKtmYnE3
         ce8Cjr+ca/gXO9v8SZFWdEEhzQ2Rm+MePZzG81WYBcWEGdFkzpmorbt8CKJ5pYTwttMr
         WGvPLRHqr86UEvmXUHzsIEcbCu6FBZYwq85pFBWLqmpT/wqL02ExXw78BISQiDvI0THu
         tT9kLzzqO/l4d2GRz/rHxU2YIV9NSN2DEyfB+aPtqL4d4ZPfjt6dkrzS9a+qHWmeBb3S
         bFHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791745845; x=1792350645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fTeW0dCMannfUqmrWOxDyxXAwJxDr0EkxzUlrfb9Tgs=;
        b=U/qvAz9RmVKJJ2RFlA9YhzMEbYVnEp2b7WLRjxEY34/xl1M0KXhpmyE77dABI5hMXm
         Z1q5ZHQCuue6PWDzyaASNtXujuEbCKxvIN9bJKBRcsSXmlEAeM0iz5RfliPI27Wp/0Tq
         viwqHgOapwgEYBL0RP73Cm1ian+ttAQlLxOreAWWAZhubah3vev7NpXunUYM6bqOhdM0
         CWVN7QLMp7baXgwnojjwwTC3dX/upGoPoVu9bNEnBKi7kFh/ub6E1YE+V2dtibZ6hJHE
         uM9vopoh3Knr8U6WIpKBbc6d27tVoSMN3hIgLwGjiWQxsQpFWpEECxIEY0+TVGgsd0oH
         RV0g==
X-Forwarded-Encrypted: i=1; AKwUvBwZoha91tsqrDbhfhVvhG56t+HVCu0Hl0mVuMPlLn7q7wYs39zZlEatkY/trEygCc+mKDfIXnjUCCD0@vger.kernel.org
X-Gm-Message-State: AFq9FYJLYUSogwuKnyf4hGbKueO+Nj5JQKoFlgV7emBgQWHBbXVuD0zb
	NE3UJ9nOb38ar37uNYdnvqVYae3YQaHFDSTjDnyFyOZCn1qVvCXNQd1AD07EzqJE
X-Gm-Gg: AYBFou1iYLwtCCmLFAV7kbVx5skE2jIy0S40NsIDuYseE5wutskIbq8iZDwtKl7h7CC
	4Sx0cl7DWvTwEvJ47eYWE2R9RPqp5WkxXuKE1JxlRPr7sg1hY68EXMdTnbDT/fRZ9wfaoYZsElu
	+exCsim+kh8TIr2leNE+PIqMsePaYdxo2YhX7rFTwsATw/KdsJ10cVDzbzAOsS8Nb2pcOv3oJnM
	sw5hfcapeEG/3w1KeruMtGfQ2F7ezlGRk6zDv9v3xAxla6qtLbwCXgzjRcdN0DrWM1ANJxeZhxq
	o738K05zwM0kQ6SCVTChviBAUVa6bV+AZgfgxwWmjj29vfXUoQ1MULSdNa8xn2tMfXc8ke2GFNz
	R/jqkGhs9Y8hoP6rVXd6GMBMXrC4GYjLmrdGFItRA30Cbhjb8qtQ3CC5rBc2PmsDZXd2If/QA/m
	txVUv1ZFKx7us46iID/XoaGTEXxtamlUTWtK7vA5XPV0aBE3jztK8q3f+hJ63HdKHg2fmzEzAYd
	+WyA9KqGu621hcYSXbAkf/n0pMhrwWmUIk=
X-Received: by 2002:a05:600c:e557:20b0:49f:dd9f:6038 with SMTP id 5b1f17b1804b1-4a18e4bff94mr88482415e9.25.1791745845163;
        Sun, 11 Oct 2026 12:10:45 -0700 (PDT)
Received: from rillian-arch ([90.244.147.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf15691sm225209795e9.6.2026.10.11.12.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 12:10:44 -0700 (PDT)
From: Rillian Grant <rillian.grant@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ruslan Koreev <koreev.r@gmail.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rillian Grant <rillian.grant@gmail.com>
Subject: [PATCH v3 1/4] dt-bindings: leds: Document TI LM3643 dual LED flash driver
Date: Sun, 11 Oct 2026 20:09:43 +0100
Message-ID: <20261011191026.149338-2-rillian.grant@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261011191026.149338-1-rillian.grant@gmail.com>
References: <20261011191026.149338-1-rillian.grant@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Texas Instruments LM3643 dual LED flash driver devicetree
bindings.

Signed-off-by: Rillian Grant <rillian.grant@gmail.com>
---
 .../devicetree/bindings/leds/ti,lm3643.yaml   | 143 ++++++++++++++++++
 1 file changed, 143 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3643.yaml

diff --git a/Documentation/devicetree/bindings/leds/ti,lm3643.yaml b/Documentation/devicetree/bindings/leds/ti,lm3643.yaml
new file mode 100644
index 000000000000..63c5f09f3bd5
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/ti,lm3643.yaml
@@ -0,0 +1,143 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/ti,lm3643.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments LM3643 1500mA dual LED Flash Driver
+
+maintainers:
+  - Rillian Grant <rillian.grant@gmail.com>
+
+description: |
+  The LM3643 is a dual LED flash driver utilizing a synchronous boost converter
+  to provide power to two current sources.
+
+  The dual high-side current sources can be tied together to provide flash
+  currents up to 1.5A through a single LED.
+
+  Datasheet: https://www.ti.com/lit/ds/symlink/lm3643.pdf
+
+properties:
+  compatible:
+    enum:
+      - ti,lm3643
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
+  enable-gpios:
+    description: GPIO connected to the HWEN pin.
+    maxItems: 1
+
+  flash-gpios:
+    description: GPIO connected to the STROBE pin.
+    maxItems: 1
+
+  vin-supply:
+    description: Supply connected to the IN line.
+
+patternProperties:
+  "^led@[0-1]$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        description: Index of the LED.
+        maximum: 1
+
+      led-sources:
+        minItems: 1
+        maxItems: 2
+        items:
+          maximum: 1
+
+      flash-max-microamp:
+        description: |
+          Maximum flash current through this LED. Each high-side current source
+          can provide up to 1.5A. The maximum current the boost can deliver is
+          1.5A across both sources.
+
+          Valid values for an LED connected to one source:
+            10900 - 1500000, step by 11725 (rounded down)
+          Valid values for an LED connected to both sources:
+            21800 - 1500000, step by 23450 (rounded down)
+        minimum: 10900
+        maximum: 1500000
+
+      led-max-microamp:
+        description: |
+          Maximum torch current through this LED. In torch mode each high-side
+          current source can provide up to 179mA.
+
+          Valid values for an LED connected to one source:
+            977 - 179000, step by 1400 (rounded down)
+          Valid values for an LED connected to both sources:
+            1954 - 358000, step by 2800 (rounded down)
+        minimum: 977
+        maximum: 358000
+
+      flash-max-timeout-us:
+        description:
+          The chip supports timeouts from 10ms to 100ms in increments of 10ms
+          and from 100ms to 400ms in increments of 50ms. The provided value
+          will be rounded down to a supported value.
+        minimum: 10000
+        maximum: 400000
+
+    required:
+      - reg
+      - led-sources
+      - flash-max-microamp
+      - led-max-microamp
+      - flash-max-timeout-us
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
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/leds/common.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@63 {
+            compatible = "ti,lm3643";
+            reg = <0x63>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            enable-gpios = <&gpio 42 GPIO_ACTIVE_HIGH>;
+            flash-gpios = <&gpio 43 GPIO_ACTIVE_HIGH>;
+            vin-supply = <&vreg_flash>;
+
+            led@0 {
+                reg = <0>;
+                led-sources = <0>, <1>;
+
+                function = LED_FUNCTION_FLASH;
+                color = <LED_COLOR_ID_IR>;
+
+                flash-max-microamp = <750000>;
+                led-max-microamp = <180000>;
+                flash-max-timeout-us = <150000>;
+            };
+        };
+    };
-- 
2.56.0

