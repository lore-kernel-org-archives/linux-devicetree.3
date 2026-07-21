Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B186846F4A4
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 19:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784662173; cv=none; b=GKMSypFODmj+cHGSkgqX51uomf2X9EEd64BPSMOkvW1dAIwzPgkN/su/nMr2WVMC5QOvHv8UAHP/Uo6PtrseY/fj3JSjkhPTTa9qdTtg/wLVWpma/RQguhs2m1ntzotx5MwqEU3yevOM1wAZ2csvlTpV4ffNNgb+3TGE8r3u904=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784662173; c=relaxed/simple;
	bh=5uHrJY3HeWlIs8TynVILl3KyFkLfOhYuUo74OAadzzM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZsUnfdY/C17eK21Den27vR54wcL/9pZIYPdO6dou9aHogZ61lZ30k3H9MKVmYHbH1sfm6j7gn0X1xapoiwfq31cJ/GZ2+7bSC4385J3IKOtSJaNeyTf5Nks2JWkyJ7IPpVA3x3Lq3IfWMCTRCoQXmAxIXz1YDnQ2tqEfVeVyoJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZBen4NA; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZBen4NA"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cea3004256so134056445ad.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 12:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784662170; x=1785266970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=748lzqKN3J88b3BEuBiWg6WchFFUdy2hlfv06NfZifk=;
        b=ZZBen4NAc6oARBow/vHmuiQ1kEhttkgQfiS+3/GBzFzXV7ihRdaWwDefeefXgQi6mY
         w4Wc0E5vzTXRa6GXb0XhUUyVi5Mh6viHSt0Pg8CgOJWKVqM/pVynHKg2r+r55+728ob5
         LgGs8acZNmpFu3f2+AMen/glx8gGtwkTTQy3q9RzPexjyyND+vTI8oZNfae8dvMnpWPG
         O4t8QMSCKePsUKn82t+RZu3jxSr7Ki/A/hYR0gEmK8+CUvzlUtbl3aiPaIm79umPmyOE
         C592ZQNn/6C+T9pQND/NVGH6C/kPX3UqDBamjTzoCVUEn7JlQ0Z/zzq69KTSNlHeNxAG
         Ku+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784662170; x=1785266970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=748lzqKN3J88b3BEuBiWg6WchFFUdy2hlfv06NfZifk=;
        b=MAPamJqddQmS122oQWjYZDpKFNTMBl67WK9238MULJ+7YKQIU7q5JgywIPcwgkAyKF
         fbJ603w2u46fkSpjF2f8iJALlHHHQEVvOmY5SPXYcmbg+yfQj6Tdh4rSxrjJ39PrL7mQ
         jw5iuUqU8PHLVFx0tHgjObcyFQxSICMYvBK5JhVIMt50kOm2W3417r3wVARLF4Us78iu
         Csqpju+RvycD6UkGjJnO3sVaE62XkKA61WJ/6RbyBRyKJAPmPDX1nWsSC6pG2pfpuvLO
         pzJ9rG48fkWnS+eArwq9hQtrA4FwatC2lIzlEUjp2+Tlh3/qsDBws/4BUiTHS8e5Yo5f
         aaRQ==
X-Forwarded-Encrypted: i=1; AHgh+RrH4j2nyt/52dsGo0vkjX0L9pslnJqUAAVCCZwN3yXTGxm28rDp3/jlJ+Acz1l3MS4oHe629HGk8mLG@vger.kernel.org
X-Gm-Message-State: AOJu0YwfxVATKL/J92MKDNhuVfoY6PD6WImZIq09w9yJDiZmggNJf9F8
	GtLhnDy8MBwOulH1WOKOnxTCiSbKx7PMWmwiUTMDLzP6CdcAjag5r2NG
X-Gm-Gg: AR+sD134ATdjPC5871pm5wUS+U+TWIg0S/iH8RiUly9y8+I2PaFZ3J/cFUWtNegFnQu
	4Y7wUfILVDvcb3hJmvIBIqBiqYkMYOh98QbndDL82FzItoQpmXhzcZzMMX2jXpCCn8I75bTxJ+U
	78I0mJNqbC1uiW/wNRFEMKbritB9Pym91CBzZT0OY15n8kq8v7xD3B2K2nlSj8WDnK+ylpwFF8W
	K7AionS39DcmC0Z/T5kxppaxC6zQ6Gey7WhWo6v9CpLEq6BgUTMX/vENybuH6CLl4uFS69FT1X6
	06vBqGwvQiYYnvyRFkdH5Gf2G8TJqoWpmjEuIDQsjsX6aRq9ruYO933c+jnTMf0lrxBTyO5c6uI
	dGEp7peOIlicRu7NcM6sUFK/v1y5dUZkbTKmQEBlt6JOa/0ORiUMfBlEYxbd57e9EkZ4yS9hmGv
	gzjsqNbos3s9Pg5TnatkpnxbN5zXWRLRkkY3O1tmRZd7O860APefATKij6Vw4dgzhkgP2zra5Fu
	bOcKyiTXKfEQGv+pNUZhrbeDa7PPluKVfRAHnaRMzPnnPvRlxty
X-Received: by 2002:a17:902:d4cc:b0:2c9:e9db:8167 with SMTP id d9443c01a7336-2cf348193f5mr215886905ad.7.1784662169923;
        Tue, 21 Jul 2026 12:29:29 -0700 (PDT)
Received: from localhost.localdomain ([202.179.95.46])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e07000fsm3063164eec.21.2026.07.21.12.29.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 21 Jul 2026 12:29:29 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	simon.guinot@sequanux.org
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH v2] dt-bindings: leds: lacie,ns2-leds: Convert to DT schema
Date: Wed, 22 Jul 2026 00:57:54 +0530
Message-ID: <20260721192754.46344-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.55.0
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
Changes in v2: 
- Change maintainers from the subsystem maintainers to Simon Guinot. 
- Drop "|" from the description field and update the description. 
- Remove patternProperties field and instead use additionalProperties.

 .../bindings/leds/lacie,ns2-leds.yaml         | 80 +++++++++++++++++++
 .../devicetree/bindings/leds/leds-ns2.txt     | 35 --------
 2 files changed, 80 insertions(+), 35 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-ns2.txt

diff --git a/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml b/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
new file mode 100644
index 000000000000..1976669d2218
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/lacie,ns2-leds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dual-GPIO LEDs found on Network Space v2 (and parents)
+
+maintainers:
+  - Simon Guinot <simon.guinot@sequanux.org>
+
+description:
+  The Network Space v2 dual-GPIO LED is wired to a CPLD. Three different LED
+  modes are available, off, on and SATA activity blinking. The LED modes are
+  controlled through two GPIOs (command and slow), each combination of values
+  for the command/slow GPIOs corresponds to a LED mode.
+
+properties:
+  compatible:
+    const: lacie,ns2-leds
+
+additionalProperties:
+  type: object
+  $ref: common.yaml#
+  unevaluatedProperties: false
+
+  description: Each child node represents a single LED
+
+  properties:
+    cmd-gpio:
+      maxItems: 1
+      description: GPIO connected to the command LED output
+
+    slow-gpio:
+      maxItems: 1
+      description: GPIO connected to the slow LED output
+
+    modes-map:
+      $ref: /schemas/types.yaml#/definitions/uint32-matrix
+      description:
+        A mapping between LED modes (off, on or SATA activity blinking) and
+        the corresponding cmd-gpio/slow-gpio values. All the GPIO values
+        combinations should be given in order to avoid having an unknown
+        mode at driver probe time.
+
+      items:
+        items:
+          - description: LED mode
+            enum: [0, 1, 2]
+          - description: Command GPIO level
+            enum: [0, 1]
+          - description: Slow GPIO level
+            enum: [0, 1]
+
+  required:
+    - cmd-gpio
+    - slow-gpio
+    - modes-map
+
+required:
+  - compatible
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
2.55.0

