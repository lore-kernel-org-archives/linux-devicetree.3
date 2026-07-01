Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC5F4BCAC0
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 17:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782928468; cv=none; b=AAhImWqd43HAySmC5htffm9dogesav0VaqHVzRpr1GX0/f1ONFIeBcY9ukLRUt3EwOhIaFC4VEcBZlHCPM8DZQbOSC0zjtXv8ssLP/iRVkkIoVADUBiVuDdH27Qgv/XJBQFWNsBt6Zdld8/1cpw5NFRdFLN6LG6A3Kcts9gzjtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782928468; c=relaxed/simple;
	bh=6E8k5VxwI2VkFCTXdhxoRdw/vQRq40ak4JPvNoCQIsA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fII480+EJRTWnecCVIkqY42paoS0dGzPyQKy+ao6MWcBOBJM0SeqvGRL02O6k0qN5/cGRfO54otMqYoGifi95lyblvsmp7VqPwjf9Pppww3+9K9jD3Go0d/zs9XahY+zf/fn/p5O2hu8cHRIn7QLutzuBXIHitHi3/jjoM/nGQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l5EPRrBA; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5EPRrBA"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c9aaa90a791so401507a12.3
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 10:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782928466; x=1783533266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ktY7hjlneyiYSm17AS79Wobub2byOifu7tLzvn5nKtQ=;
        b=l5EPRrBADM2k23sL04kQ/Kvhvye6nUBeTWbqShS6yQHnNOpgyy9WJEbRsbGYoodAW2
         exnY2k2VvAgzIMQlsRGi7qST3vUZT5SFOqWF7ty94rm1ussqUdLtGCPnxCyCRrobw5MJ
         u1j8fafxMH3XHu2SdUxLWTnJyzm5aOow0Tb1Bts/yarw+piGzfvTEHLzNMttZ6F0BUmI
         7hZpJ6pPDOkaymF0c9bJ4+miyjA0SfSoc9eow4lzIvKKunaexfCZwigPMh23HvXelyLx
         FzpoQ/4bohAEdUxi7Fdk5CIE+EgP1fapo7j9aIrzrMr2dK37j2OgPFJcb+aZCo2Zwi8n
         3jDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782928466; x=1783533266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ktY7hjlneyiYSm17AS79Wobub2byOifu7tLzvn5nKtQ=;
        b=lNekPffqYVLCBckSTlDMr/ZpskroRrf0nfi31nmxhrHYBZYZTERPjyyA1iXwKQKclY
         RhOwwYXfFOAAJd7E8QZeTq8swxKlOiaIm+in/RVz373J5DkJQnusvOSeTqhb0TtWTsZn
         /aV8kG95ssOTKLlMX2Y40WjrJwbxQC65Cm26PCun7cPh7SV1LiikTSCB46nuDkLXBuxx
         f+2fLCFzoMXh9jL2PMEdSBjPXzDZxBpe+MjzJHGXhS1IgR3mq1iyb/e/RUKtkX5go+xu
         CHxKIEuaqLkBZ6PW7QoeqRFbLaAO0T0ZZLzkCr9nblzAiDVqN2BdOM+G0h0rnpydR/sL
         vHZQ==
X-Forwarded-Encrypted: i=1; AFNElJ/FqzfUSRYV+87W+/TxgEDaZOEdpminhg0t3/1PZaO4mD/euTEck43oriboIxMjCgthQPDDNjVHS6nx@vger.kernel.org
X-Gm-Message-State: AOJu0YykVpq3K0qwFkPJDNQHQ3B69ugRuvYMBS9Fk+c+g9/8T4XjM4rN
	SgMlzFz/rVSfUqbgsaK+IN0Vn/YJzrGYRL1oFLQJr9Sbb6FrV81jjDVG
X-Gm-Gg: AfdE7cl3BI1m0dx7x7+uqA/H+baO+LkLz/Ykatr26RA2LpOgdmua02zHF2zIuZZbp9E
	D7/BzJ8FugbCzFmU1OvjbL5z0EVkpkqyP/T+N7HkXrEehNOqa8B/5GA/tiHTrb5R+OhsFf76/S5
	t96A/wW4jzv3zcHm+Ly9kVEgEP/tqLjcbN3qIzaOamyqEGzfwAl8ubRr0J1XZ9zlJRwo+ggATBm
	6Lq1kNepH4/7RUYG5+l4dMN03/Mt9fySXGqZwO5xp7cudyDjREGvLK1Tnx44gzF/VlCrNH9PvIO
	H+WPnvst16XBMB+2+QScOROaWD89s92Ilcj9F6meJfWpQCRuO67TtFiWD29N3pMBzO73A/AZoua
	nPWVliqLSsFm1zMQY1mv4BH7WLni3FUhoJF56cp+QUSCmjKEEeGztoXXyPMUUNkcw3Z8olsZAAq
	oLw4uK0SDH9nCppaBDTKOnPX89X2ypomUtjgybDppka51XCXf+4oU5yzWBySdGDN+I163a
X-Received: by 2002:a05:6a20:431c:b0:3b4:8cc7:c6fa with SMTP id adf61e73a8af0-3bfed1bfa15mr2855302637.10.1782928465900;
        Wed, 01 Jul 2026 10:54:25 -0700 (PDT)
Received: from fedora ([103.181.54.98])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bb80f5csm82300eec.15.2026.07.01.10.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 10:54:23 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH] dt-bindings: leds: lacie,ns2-leds: Convert to DT schema
Date: Wed,  1 Jul 2026 23:23:30 +0530
Message-ID: <20260701175330.1645927-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert lacie,ns2-leds to DT schema.

Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
 .../bindings/leds/lacie,ns2-leds.yaml         | 87 +++++++++++++++++++
 .../devicetree/bindings/leds/leds-ns2.txt     | 35 --------
 2 files changed, 87 insertions(+), 35 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-ns2.txt

diff --git a/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml b/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
new file mode 100644
index 000000000000..679a618906d8
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/lacie,ns2-leds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dual-GPIO LEDs found on Network Space v2 (and parents)
+
+maintainers:
+  - Lee Jones <lee@kernel.org>
+  - Pavel Machek <pavel@kernel.org>
+
+description: |
+  The Network Space v2 dual-GPIO LED is wired to a CPLD. Three different LED
+  modes are available: off, on and SATA activity blinking. The LED modes are
+  controlled through two GPIOs (command and slow): each combination of values
+  for the command/slow GPIOs corresponds to a LED mode.
+
+properties:
+  compatible:
+    const: lacie,ns2-leds
+
+patternProperties:
+  "^led(-[0-9a-z]+)?$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    description:
+      Each child node represents a single LED
+
+    properties:
+      cmd-gpio:
+        maxItems: 1
+        description:
+          GPIO connected to the command LED output
+
+      slow-gpio:
+        maxItems: 1
+        description:
+          GPIO connected to the slow LED output
+
+      modes-map:
+        $ref: /schemas/types.yaml#/definitions/uint32-matrix
+        description:
+          A mapping between LED modes (off, on or SATA activity blinking) and
+          the corresponding cmd-gpio/slow-gpio values. All the GPIO values
+          combinations should be given in order to avoid having an unknown
+          mode at driver probe time.
+
+        items:
+          items:
+            - description: LED mode
+              enum: [0, 1, 2]
+            - description: Command GPIO level
+              enum: [0, 1]
+            - description: Slow GPIO level
+              enum: [0, 1]
+
+    required:
+      - cmd-gpio
+      - slow-gpio
+      - modes-map
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/leds-ns2.h>
+
+    led-controller {
+        compatible = "lacie,ns2-leds";
+
+        led-0 {
+            label = "ns2:blue:sata";
+            slow-gpio = <&gpio0 29 0>;
+            cmd-gpio = <&gpio0 30 0>;
+            modes-map = <NS_V2_LED_OFF  0 1
+                         NS_V2_LED_ON   1 0
+                         NS_V2_LED_ON   0 0
+                         NS_V2_LED_SATA 1 1>;
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/leds/leds-ns2.txt b/Documentation/devicetree/bindings/leds/leds-ns2.txt
deleted file mode 100644
index 9f81258a5b6e..000000000000
--- a/Documentation/devicetree/bindings/leds/leds-ns2.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-Binding for dual-GPIO LED found on Network Space v2 (and parents).
-
-Required properties:
-- compatible: "lacie,ns2-leds".
-
-Each LED is represented as a sub-node of the ns2-leds device.
-
-Required sub-node properties:
-- cmd-gpio: Command LED GPIO. See OF device-tree GPIO specification.
-- slow-gpio: Slow LED GPIO. See OF device-tree GPIO specification.
-- modes-map: A mapping between LED modes (off, on or SATA activity blinking) and
-  the corresponding cmd-gpio/slow-gpio values. All the GPIO values combinations
-  should be given in order to avoid having an unknown mode at driver probe time.
-
-Optional sub-node properties:
-- label: Name for this LED. If omitted, the label is taken from the node name.
-- linux,default-trigger: Trigger assigned to the LED.
-
-Example:
-
-#include <dt-bindings/leds/leds-ns2.h>
-
-ns2-leds {
-	compatible = "lacie,ns2-leds";
-
-	blue-sata {
-		label = "ns2:blue:sata";
-		slow-gpio = <&gpio0 29 0>;
-		cmd-gpio = <&gpio0 30 0>;
-		modes-map = <NS_V2_LED_OFF  0 1
-			     NS_V2_LED_ON   1 0
-			     NS_V2_LED_ON   0 0
-			     NS_V2_LED_SATA 1 1>;
-	};
-};
-- 
2.54.0

