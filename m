Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32AE3B19AA
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 11:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777376385; cv=none; b=oNOz3yDlKICRJwVYzummzgyDjqdblktsvwjYLhvoa1u5M5lgwMIgbgpFWlI9FTBAwpVxsyua9NZvTrwoPhyebAY2/xFicqAhGVyzfFKZYCg3AJfjEEbFWdaHt9gJHSIC9YfqUJzZV0nwem1FslupCGM4pBp3s9ejetxTV2NCxbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777376385; c=relaxed/simple;
	bh=6Ox/1lZRBtvaCEzjGqWKJlNoXRziKdYDiJOJBsJZJxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RhxWAnhoBLEUYSdkmC9Ma0laExokVNIscm2dErIrpweayq3StSbzEIkXXlRN0mxT8/uktxbCbSqDS90QgxTwtJEcgzeY6M5FqvDNO6qDGZWYBa8JBAQ9A/GWpBNGPR8rutwmDAAtIDMRQx6PRLX08UVhQQFjS3JI18KXITJgN5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QAWiuHLD; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QAWiuHLD"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso119491185e9.2
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 04:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777376382; x=1777981182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MKbUTvcePe+bc+QWEqhr7xtWGXq9HDSMNZMknnD7nyk=;
        b=QAWiuHLD82rTdJGXC2jYo2mbtrfqx3eQK27QENKAM0X01s/T57hXq89ehvsWOxkOBO
         f4qaYupINUvAPAJeUdppKTF2GM12PDfVKD9pDlS+zlzmRRgbOE5zwV45NDZecrTtDXe2
         yH9rKN9cRN3W+w+jLoTKc3EhPSilBuGYWeMFRz5eU/Hn7DwrhOPoeI4CkpnkzMU7TPzZ
         eSsulDSRuPmRRwmY3m4s0LR2NQMB2ns8LFDm7BlpXik5SKGNEcBzZg9d0OG8ZgnKdOzh
         LUdQrF2K8dSJJvjaFy+W+Jm+VLHDB4XY7N4P7m0pteUzc+p13qXai/1vnxfKYYfqAF6l
         HQfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777376382; x=1777981182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MKbUTvcePe+bc+QWEqhr7xtWGXq9HDSMNZMknnD7nyk=;
        b=K96UQ5kWaKTdT4YCoy3CA236pGd2eJbl10TkkpescHDR4nK5WO+6QydFw7+YmE5+K+
         DgYxgk8Zledn4R1ASem+XRLV5a66mBdebUVmbXX/1OqlTMYZucYQKCTF9hXKn5uvifiG
         NVy25R/C7RkFEbhaXYasg3EagI94nGTd5Op2Dbzca6q609/ade6FfLshAha6u6NM7uCX
         fZHp0wBLI+ZLdulL+2RnQQOkA70DyRCl8M7jZWem+6YhdQfdeLBJC9a9a6tu+4Bu6huZ
         eTJRpUHlMGX8nVuf9HOsHqIO61nMQc43lGpWeFpITk0L+8E8SsZ/BwkINs/OLg6Tpu1w
         IH2g==
X-Forwarded-Encrypted: i=1; AFNElJ9KMgdgO1htxc/EFe5dxhnLwAlj5pLl22TmReNuSf52eT6AXScqd9wfH+yas6Djm38A2mj5BRMsOjdp@vger.kernel.org
X-Gm-Message-State: AOJu0YwrE3xwM93CZXDDkobN6EdSmt1yj5Ms2JPSDgnDWVr11+ww4nhd
	894TgUxCs82aQl6ysIDD41af967bPQ39TkNTLXJkVJAJ9y3mAanTgNtF
X-Gm-Gg: AeBDietTV6mH4DAikrq5Ifq3cmZq8Lyxq6ip9mNGWXWas8HLrhR0NsIV+eMqcd1xaTJ
	QHEwJDhEtfBBFaB0ZDESxLaI3Twk9rpteXXZIX2UY99oB15k76W7aTWOrcJazibadbx8T6NZrCq
	BuR4qjtJTwBJittDqADr13C3qKk5wbYtm9H12Lqtv4ZdRjyDCFvbopHgc1fPcI+y0kb6VJ2XX7y
	6tT/LAjVT5kKdzCEFx/3hTUHkVAevCv9YvfuXyiIcj+WKDBCM6HoBgOyQYEUKV6OcCijoZL0Iy7
	W851nbdGqhpYQv+x8dQyVA7aYh3EY0q5fp/+x/RyJFXhkRhplz4JOrHlX/AW9eHlROvKwgF17gX
	0q3kfPaemKNEajL+nq8nzRJrwuGK6MXERZPvnya8Y/dtHVVni78p7L/EYcZSDCWCh3HAhcs2IQ8
	vGsrhoNJAj12ubUjSgbClo51s=
X-Received: by 2002:a05:600c:8b54:b0:48a:5339:ef0e with SMTP id 5b1f17b1804b1-48a77ae5405mr46236345e9.3.1777376382166;
        Tue, 28 Apr 2026 04:39:42 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a77aeb223sm43541125e9.3.2026.04.28.04.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:39:41 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v4 1/5] dt-bindings: leds: Document TI LM3560 Synchronous Boost Flash Driver
Date: Tue, 28 Apr 2026 14:39:18 +0300
Message-ID: <20260428113923.112920-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260428113923.112920-1-clamor95@gmail.com>
References: <20260428113923.112920-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document TI LM3560 Synchronous Boost Flash Driver used for camera flash
LEDs.

The TI LM3559 documented in this schema requires a separate compatible, as
it utilizes a different programming model — specifically regarding the
handling of voltage ranges.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/leds/ti,lm3560.yaml   | 133 ++++++++++++++++++
 1 file changed, 133 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3560.yaml

diff --git a/Documentation/devicetree/bindings/leds/ti,lm3560.yaml b/Documentation/devicetree/bindings/leds/ti,lm3560.yaml
new file mode 100644
index 000000000000..27bbc45bfc85
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/ti,lm3560.yaml
@@ -0,0 +1,133 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/ti,lm3560.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI LM3560 Synchronous Boost Flash Driver
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description:
+  The LM3560 is a 2-MHz fixed frequency synchronous boost converter with two
+  1000-mA constant current drivers for high-current white LEDs. The dual high-
+  side current sources allow for grounded cathode LED operation and can be
+  tied together for providing flash currents at up to 2 A through a single LED.
+  An adaptive regulation method ensures the current for each LED remains in
+  regulation and maximizes efficiency.
+
+allOf:
+  - $ref: /schemas/leds/common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - ti,lm3559
+      - ti,lm3560
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  enable-gpios:
+    description: GPIO connected to the HWEN pin.
+    maxItems: 1
+
+  vin-supply:
+    description: Supply connected to the IN line.
+
+  flash-max-timeout-us:
+    minimum: 32000
+    maximum: 1024000
+    default: 32000
+
+  ti,peak-current-microamp:
+    description:
+      The LM3560 features 4 selectable current limits 1.6A, 2.3A, 3A, and 3.6A.
+      When the current limit is reached, the LM3560 stops switching for the
+      remainder of the switching cycle.
+    enum: [1600000, 2300000, 3000000, 3600000]
+    default: 1600000
+
+patternProperties:
+  '^led@[01]$':
+    type: object
+    $ref: /schemas/leds/common.yaml#
+    description: LED control bank nodes.
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        description: Control bank selection (0 = bank A, 1 = bank B).
+        maximum: 1
+
+      flash-max-microamp:
+        minimum: 62500
+        maximum: 1000000
+
+      led-max-microamp:
+        minimum: 31250
+        maximum: 250000
+
+    required:
+      - reg
+      - flash-max-microamp
+      - led-max-microamp
+
+required:
+  - compatible
+  - reg
+  - '#address-cells'
+  - '#size-cells'
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
+        led-controller@53 {
+            compatible = "ti,lm3560";
+            reg = <0x53>;
+
+            enable-gpios = <&gpio 28 GPIO_ACTIVE_HIGH>;
+            vin-supply = <&vdd_3v3_sys>;
+
+            flash-max-timeout-us = <1024000>;
+            ti,peak-current-microamp = <1600000>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            led@0 {
+                reg = <0>;
+
+                function = LED_FUNCTION_FLASH;
+                color = <LED_COLOR_ID_WHITE>;
+
+                flash-max-microamp = <562500>;
+                led-max-microamp = <156250>;
+            };
+
+            led@1 {
+                reg = <1>;
+
+                function = LED_FUNCTION_FLASH;
+                color = <LED_COLOR_ID_YELLOW>;
+
+                flash-max-microamp = <562500>;
+                led-max-microamp = <156250>;
+            };
+        };
+    };
-- 
2.51.0

