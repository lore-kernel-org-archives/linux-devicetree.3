Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAFF3B47C2
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 11:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776426173; cv=none; b=ouJrrO9kuer8fgh44NV1zPMNlMJEAEbRDYiNymQA/6g9Hb5Z2R/W1HXIh+hfcH+0R98zfG8Xg/oRZJI9pDXq0R90S+R8O74kos0wxdoR9rNRMSxDGMXXBGKbmP8PCnuhDZ3LZjRz2IgzCQ5YxdvkxCfM2ICOgep2Ud1r6PgE1Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776426173; c=relaxed/simple;
	bh=MCepgpMAhExukEmT5X29jn6zLNNcYRcxCnOQNum1NMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XIfazunnEolUcXKF6k+engMkacZ/pp0tJ/oPgzuD6M5UMZYt1KJNKoCNVJ+2ZiMe1hWeC9kRbqaM6rpW/2gLw817zZmmZpHEJhaaG8QQ+NZ0XqPxhVYtMnvYOCUlYIjR965jmckj/9qv4c1ZUjbz6MZf9m8PVhQAB7SG7J+a7u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kIV9QktI; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kIV9QktI"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a40d02b58bso515981e87.3
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 04:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776426170; x=1777030970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYCK/+hjnviLjF2LQlcAfHWbh1kfWS18YZTqZGyrqQ8=;
        b=kIV9QktIMGOGBpBcLF3XkM4Kdcp7uizraT/9PZ7rRvp8h074lt9dJJOzPTtVfeq8Rs
         coxCJGuhvnhQx3TWM4fTsyI2dRH7wtRroyxI93xk9xH+XxpmXLuceBtgSL8CNiA+Re1Q
         Lhp3IuIIQwk6H7VLQo4IIPG9pWtLSbE2ui998W9PFlYE8byBAE4a1B+xCgsv2xFKRZ67
         /4iKxTz6nnTZ6E47E//H5D6rNY+afYqb3L58E3c3hycMKNLVdDa3lTssVHWlxSb8Nh4e
         TRhDCcKCq7AKEMq1XDz24UsoljmJToGDJPIYalR65zcfh9EYCcimiVYtj11b7DCV1KI7
         9eRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776426170; x=1777030970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qYCK/+hjnviLjF2LQlcAfHWbh1kfWS18YZTqZGyrqQ8=;
        b=pN/J6qOAoIHfuyP/lTOn4jvFolupYTVtDgFTMcHUuh+SZuYAWYg5bvbXMe1bBljVek
         9pxIX2KqW9KjsuRy9W6WeAd1v8pW1gMezvhqmnE1N5kVJ/HLNrakFolqz4VeFo3o3udK
         UFMgipmkK5kNe2tIhQ4hCk1JArw+5WNAlBPHZGxwh6uWws7kZ5utILaQJbZ3AzzXpU8T
         ZlDBhTGzEsesDHj/EC00WHSTMrVnP0fjUK85LWp8r1XmfaGWpk6IKe0ltLkioRadeEPZ
         c0dkIXG+VWb8PVvKmJ0DoTl6XZYBpWohItZGCjgrTmg0iyU2Z6LdCv5H4ge5/LG4IGc/
         bDDQ==
X-Forwarded-Encrypted: i=1; AFNElJ81u642XyvFsjFoIwZqlGOUi4gQ3U5wIMUTJ+aeZc4L7GE5T/08qgt7phmeu7dPPpAyF0x7fzUsj8mw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1wkQfbltkIhX++S1sMH6HeSgCMIVKar/Gc3X2aCyY5kX5fEIw
	bsQPOxc1SjAVs/1hewIf6jVV3Bcu8z3XySrbWJa8iKT83qZJGxo48bbt
X-Gm-Gg: AeBDieuMgPtRNoBLudwEpAvDGlB5fruGZKrEHsRCEFd5rA5m6lA7KAr7BwtZQlo28RG
	J07BHLsRXtssZeRCdHvZbLr/NdOdLMu3OelmwyVG2lF0zLMkRzZ1mHhYVrkPFA79q6kUcCRmTQ5
	DKcHyLLsJCgOVkjSBVPFzU8sqCPb6KPRhrks07Vmk/YoYGO055ca+WOpm5QDGgtT6HfbLd/D7DC
	3Rkr5TciEE5QUJhmcjP77uxtHcVcW1UdwtjSXMTPfKXfjT6q6oqu7prvk4xHSoKbJ4wtprNIS5U
	sqduD/bz+2tISfTvs7jfirPG3nZS2D3pjiM9MlzUx5Q291Brhz7jEIC0ZhSpfrWgIfRSLBOFDrI
	ONrWctfRp0MPQPS3zmiDQjyv+VKYXpjTdFFbQxNMht/Ep/C9BgwRGHI20V3jg2kZlqtITRfnlMt
	MbQyDfT9lYSZZh3qDXJpuweDE=
X-Received: by 2002:a05:6512:114c:b0:5a1:3bfd:b87b with SMTP id 2adb3069b0e04-5a4172dd85emr780824e87.30.1776426170136;
        Fri, 17 Apr 2026 04:42:50 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc672sm338636e87.34.2026.04.17.04.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 04:42:49 -0700 (PDT)
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
Subject: [PATCH v1 5/5] dt-bindings: leds: Document TI LM3560 Synchronous Boost Flash Driver
Date: Fri, 17 Apr 2026 14:42:26 +0300
Message-ID: <20260417114226.100033-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260417114226.100033-1-clamor95@gmail.com>
References: <20260417114226.100033-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document TI LM3560 Synchronous Boost Flash Driver used for camera flash
LEDs.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/leds/ti,lm3560.yaml   | 134 ++++++++++++++++++
 1 file changed, 134 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3560.yaml

diff --git a/Documentation/devicetree/bindings/leds/ti,lm3560.yaml b/Documentation/devicetree/bindings/leds/ti,lm3560.yaml
new file mode 100644
index 000000000000..460ea1fbc1e5
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/ti,lm3560.yaml
@@ -0,0 +1,134 @@
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
+  ti,peak-current-microamp:
+    description:
+      The LM3560 features 4 selectable current limits 1.6A, 2.3A, 3A, and 3.6A.
+      When the current limit is reached, the LM3560 stops switching for the
+      remainder of the switching cycle.
+    enum: [16000000, 23000000, 30000000, 36000000]
+    default: 36000000
+
+  ti,max-flash-timeout-ms:
+    description:
+      Maximum flash timeout in ms with step 32ms.
+    minimum: 32
+    maximum: 1024
+    default: 1024
+
+patternProperties:
+  '^led@[01]$':
+    description: LED control bank nodes.
+    $ref: /schemas/leds/common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        description: Control bank selection (0 = bank A, 1 = bank B).
+        maximum: 1
+
+      ti,max-flash-current-microamp:
+        description:
+          Maximum flash current in uA with step 62500uA.
+        minimum: 62500
+        maximum: 1000000
+        default: 1000000
+
+      ti,max-torch-current-microamp:
+        description:
+          Maximum flash current in uA with step 31250uA.
+        minimum: 31250
+        maximum: 250000
+        default: 250000
+
+    required:
+      - reg
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
+            ti,peak-current-microamp = <16000000>;
+            ti,max-flash-timeout-ms = <1024>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            led@0 {
+                reg = <0>;
+
+                label = "white::flash";
+                linux,default-trigger = "flash";
+
+                ti,max-flash-current-microamp = <562500>;
+                ti,max-torch-current-microamp = <156250>;
+            };
+
+            led@1 {
+                reg = <1>;
+
+                label = "yellow::flash";
+                linux,default-trigger = "flash";
+
+                ti,max-flash-current-microamp = <562500>;
+                ti,max-torch-current-microamp = <156250>;
+            };
+        };
+    };
-- 
2.51.0

