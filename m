Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD99546AF17
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 18:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785264153; cv=none; b=ZARPC2UeNV3oJfASz3FQmc1FJFEBdqkbWdZzD0jwPejHJ+t8Gu32w8he6soy2darvFBEAYqP5uRHwe8Lu9Yuol/dtRfPhFjMX4viu6S9rgzQsRT0KHIgUDtHNubW34qASfjjNXSIox7YpkQ+sP5HsBwi62GsC1eYvS/EzBMpSqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785264153; c=relaxed/simple;
	bh=rlWX8zSo109/lXQYg1Tk/kRqGUrbbsuhaVsjDuKwf4k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UydynJDpZURgCuoklP4aW4q9XtvquOIUcCwDGa8qHj34a51J8JsWYwMbYdwNY98f+rMUBXdhya4itouDuryTBBgFPEZQV6gId8AYb3ZlBpPSA9UDEpYG9LwCM6QJ12eeChHgKRseXk4UXHMHAcxkMSF8jT3VBhIwKLngHfS9nxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hczTpfcG; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hczTpfcG"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so183027a91.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 11:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785264150; x=1785868950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=98KjwxSHL1rPAUCBymY6MMY6MwyG7kbviDNwGZEI2xU=;
        b=hczTpfcGmc+WBJ16N5CYW0rKQmiuXSULOLsqoOf6wYH1+R8Rj/Zk6CmVrPT5sIv+pg
         Xt+VzJdRDUAeBFp/CgjjzWS1ddr5LSTnLn1vahe/geYSdEEj9YoTh0PcraFY4xUnCw9p
         bQjnex7HjnJxyUh90Dk7ZOMbWN5lTv+6BqTP3a76OMqHl5fRKRSeCAyam9Q606MBijkd
         +KsTzRXzfYttvCXfugu/YoYDDU87JcfPYYhty9VG2gl+xRBp3SFEKyRdykoxpeNUOMC8
         EZYUtS38T5j5DSynDSN/yr4R0GWIojusYCASgTDP10qCV+9aK8K/wquESOVianBehrti
         bN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785264150; x=1785868950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98KjwxSHL1rPAUCBymY6MMY6MwyG7kbviDNwGZEI2xU=;
        b=HLX2hfov75as3nafnz1czX2ivqhygqeAw1mAxXQdvvsVRtaw2AmsZcZCXzagqjtSd4
         eVr29WRe6vYRg2BkPgg5m98KGHkc54oFwH+hh4lKswlF+5yBwqVAvvdas6CswGDPEkCu
         YHBhniWBu02/eh2iMB3VRvdb9ZVpu8U+kszFhJuffz5QQJsecnRMlbZuL5Zc5EFpmoUK
         nHvIy4KZtg4u16pkWolDo3Yuh45Hdrk6Hv7JUDARsS41attc4QK2hj9a5GJt9w4xqYM5
         fH1IaxFlmBBtNsn6kwuKswNOplvRmXtJ3F/YKboYPGxKMzoa4pBorJJ73vj4ghqDGWln
         Gn2Q==
X-Forwarded-Encrypted: i=1; AHgh+RoO96QXgqpzVEYfg346lVP5j9ws+rcoLe9lviJqhLM6msYeKfA6krdRAII9xHge8ouL3RDNlITgBWRu@vger.kernel.org
X-Gm-Message-State: AOJu0YysZKV5/TIdXaZVYoYA7zhtWszXnVBMRcnQYEiVJ8QmP3JzZR/s
	7vnd19Dkr9K8niD8ez7TeOTF8f5vgpBl6lYTkWwZSlOoVlJ335Tl8P72
X-Gm-Gg: AR+sD12+sGKPuqP+y+lxqeRltEhn10Y4CW+T8NoWUpQH9/2rJv6zZhSyfxVp8n+PigN
	JrVoJibmWAz/hhJ1WpoHvwYO3Ry49gD1E9/MvXKBr1v1qPt5BWpSBiIOUbLvnAaVl0sQ5pzt1EW
	rW9eZcEX55XQXHldxdEatRtjoCVBN58ZPEOAYjvbD1WhY0LkaHg6J9vuOD8XCnnPkEHJ7OZdBqm
	DOPJ7gqANZ9i7t249MoZnTk9m5UEIdoseVwNbIaQnVX30bP2m+sKJbviYI0srL7o16pbUMqxmm7
	mGxRmNQo5CLHWPlyn6dvWcaAM33KxSCo2dk9LDN0v6XZrKhsdPH8xYnqsC8WuLR697gZGgG/rhm
	qe2KubT8JMYq5xnrw/pa0joJjDQG2XisgKKlgi1V6lNAR2QRbvRWen2t+GysweqiY05QUt9ulzf
	BUUaaonhb8ZrM8fvqDmhNP7NYZbiyi2O8H+2mlB7flvXvPoNcMO4FRPDooKFxGK+LU3oWzvhyFT
	k4cuCMjNCNUMYqvJw==
X-Received: by 2002:a17:90b:55c5:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-38f6a336613mr3943439a91.13.1785264150174;
        Tue, 28 Jul 2026 11:42:30 -0700 (PDT)
Received: from fedora ([202.179.95.46])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504cc63f3sm1013576eec.16.2026.07.28.11.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 11:42:29 -0700 (PDT)
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
	Ninad Naik <ninadnaik07@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4] dt-bindings: leds: lacie,ns2-leds: Convert to DT schema
Date: Wed, 29 Jul 2026 00:09:45 +0530
Message-ID: <20260728183945.12008-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert lacie,ns2-leds to DT schema.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
Changes in v4:
- Drop incorrect Reported-by and Closes tags.
- Add complete changelog.

Changes in v3:
- Add optional property num-modes to the schema.

Changes in v2:
- Change maintainers from the subsystem maintainers to Simon Guinot. 
- Drop "|" from the description field and update the description. 
- Remove patternProperties field and instead use additionalProperties.

 .../bindings/leds/lacie,ns2-leds.yaml         | 85 +++++++++++++++++++
 .../devicetree/bindings/leds/leds-ns2.txt     | 35 --------
 2 files changed, 85 insertions(+), 35 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-ns2.txt

diff --git a/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml b/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
new file mode 100644
index 000000000000..2138c75c0413
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
@@ -0,0 +1,85 @@
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
+    num-modes:
+      $ref: /schemas/types.yaml#/definitions/uint32
+      description:
+        Number of entries in modes-map.
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

