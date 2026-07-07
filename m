Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECD31E492D
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 18:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783450045; cv=none; b=PfNQ00yiVxgQKHem55iin9NjyFeL2F0X44Dz9EsPXrjK2I9s43nvwcUNksVXIbuycDCXQ5wzkxUn5j3ikAr4zeoJ/5ulZmr+FY/hAMRZTXSY4iSaQRgqI8nwNlSn0dfryZIuw3U2YTdGQ2UosfItaQ2zc8fdA7X342r2YyaWzTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783450045; c=relaxed/simple;
	bh=BA/fghVmq2tfFUvLItu4KduZ/+X/2tYFWOuW/Mblvic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PxtaBBsYz1MjPSBRpV/IL+x8KN+bPwfKoDiXDKz7uGXewhz2PCwF3MchidxRa2a1d9qFQhlTw3+UtfkW5YaBjQ6PBpH3LdTZQQJvwdZ8GHgVNSfKWl3KeBN4LWfZqLHpMSDihCXQx7rQMAziR60hYeCRZtKXnIt5ewNGuKN25zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dXPfZrVO; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dXPfZrVO"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cc80b585bfso23774955ad.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 11:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783450043; x=1784054843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O6UH9Aze3YH0zmdyRaXrvdeWnQAlPkh9QAc9PSlvO20=;
        b=dXPfZrVO9LFRiA8OqOn5HupEz+4y3CpVqkpeEtimXtNNT/UxhdFFEA5+/lPJwcI4Pp
         kJDu6S+lGi0SW5HIw/Zha6LxTftYVjQPIr7R+zAOUQJNxqDEvJ34KaPiF1LqimnVOJDW
         88soaxKjM0n5JpmthUQ9S3OcTqyibEtwE453r35aSoYo6kGZNtwr4VIEBzXywf1w8h/k
         3Ls4ubrU4ifElk7/RnG0g0nlMaICeI17WkQT2AmPNJ7hmqYAiq6zgLo1R3/WK+CcsrH1
         fAUViTBbmONsh/m97154jtufpbJNDG2vzpwA/bx0bvyHxNnEGUVybLO1F0Igbszc8MAD
         ZCsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783450043; x=1784054843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O6UH9Aze3YH0zmdyRaXrvdeWnQAlPkh9QAc9PSlvO20=;
        b=PsNXI7E/PyP7Iv18kpxyAg7fgOaX+Ff55jRF5cW4KNDTTtlWxeGwdXDOOWMEsphGpi
         R1AWsElwx2H8lbVazf4Vs9MWSoOdMuPu9hfXMqKfmT1sbloJdtrUUZSHMQGVLYHdsZrH
         CCVNqVaLaCSauO9Jl8HpsVYRdfKJw+okprUR8RnWhAl+ibeO+M2EWLKvrcHzsahyb+ei
         i3CMBrkghdP+Wpn/rVMG0c+7WK00iI/OL9Bfav5vgbRlnwv3fsu2CUwj6v230ZkKqQUv
         ukz1RylNPalDu3dM3OR/Hn6a+Uhr1/F9VIcoU2o+UjkroX87oSwUaFMPyhmYpSBVtfKK
         nRyA==
X-Forwarded-Encrypted: i=1; AHgh+Rrq6uQnVW6kqMPHsCSd7NvQvXu2dJ5X0M3jVJeet6+ztQ5dY6R1YA6yKnCGgDbrmEtpI24Dk2+1HKVi@vger.kernel.org
X-Gm-Message-State: AOJu0YxKy15fMO6Ls3dUHAAC+V2fAOlqkr9tPW9Kb1Pgmp4LG+Q5TU/l
	nGxqmsCLkP+OBdrBWwLNYAU3JhBAsDPPnRFsiFxhWE5XnAyVrG9G9bpr5y7tU5bX
X-Gm-Gg: AfdE7cn0gppeUGgUdTSmo6iygDdYUOQSLxAiToSjbLPtRD+dIStyK/Crq6Qk1Ic74GP
	M1spRYp8rgwi66VC40QJRvD7373yY/WBYjxZGLqzHHHp5nxxAjHJ3zHXflTCqTZXaaiewQ47/JG
	SVFEv53nScLHlo4RkBIh4Cjr1Xjz/sKLKR1ebGF7+tAdCbO/Y30t0klnW89KQkWXAS4cbICztPe
	ewiGjTcP1N1T8DA68mQNNXaC6sSNxc7VvJCeUxJVHZ/9CJVvcuylBfSdNjCwmc6eVk9qIUPbn+S
	4phGVg/Ouv4zd/v0/sGaION8cQMvDBHOZZtF49vVYrfUeIKN1coTLPaU0T8vQjwds9Rbok2bJKm
	SFZnwsCAEXCsvaay+kR8VhZqLbUDMfDJb06pPDgD7LvR/n4r7x5IzVrlO59QM/zskkUOqQ82AY2
	8Q9OqH0OEh/K+ne8kmojdnPSqWvSEAoM3LcnASoNNPgUS31gtT2n4ZHGhJZ11q6MbqPEhV
X-Received: by 2002:a05:6a21:71c5:b0:3c0:b3f7:e5c9 with SMTP id adf61e73a8af0-3c0b3f821a9mr167859637.36.1783450043279;
        Tue, 07 Jul 2026 11:47:23 -0700 (PDT)
Received: from fedora ([202.179.95.46])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6593c4ddsm12364507c88.1.2026.07.07.11.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 11:47:22 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	noltari@gmail.com
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH v3] dt-bindings: leds: bcm6358: Convert to DT schema
Date: Wed,  8 Jul 2026 00:14:28 +0530
Message-ID: <20260707184437.500278-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Convert the brcm,bcm6358 to DT schema.

Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
Changes in v3:
- Revert to unevaluatedProperties: false and drop explicitly listed
standard LED properties.
- Simplify regex by removing redundant 0| condition.

Changes in v2:
- Modify the maintainers list.
- Add maxItems: 1 and removed minimum and maximum in reg property.
- Explicitly list the properties: label, default-state, linux,default-trigger
and active-low
- Change unevaluatedProperties: false to additionalProperties: false

 .../bindings/leds/brcm,bcm6358-leds.yaml      |  96 ++++++++++++
 .../devicetree/bindings/leds/leds-bcm6358.txt | 143 ------------------
 2 files changed, 96 insertions(+), 143 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/brcm,bcm6358-leds.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-bcm6358.txt

diff --git a/Documentation/devicetree/bindings/leds/brcm,bcm6358-leds.yaml b/Documentation/devicetree/bindings/leds/brcm,bcm6358-leds.yaml
new file mode 100644
index 000000000000..95fa311fddb5
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/brcm,bcm6358-leds.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/brcm,bcm6358-leds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LEDs connected to Broadcom BCM6358 controller
+
+description: |
+  This controller is present on BCM6358 and BCM6368.
+  In these SoCs there are Serial LEDs (LEDs connected to a 74x164 controller),
+  which can either be controlled by software (exporting the 74x164 as spi-gpio.
+  See Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml), or
+  by hardware using this driver.
+
+maintainers:
+  - Álvaro Fernández Rojas <noltari@gmail.com>
+
+properties:
+  compatible:
+    const: brcm,bcm6358-leds
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
+  brcm,clk-div:
+    description: SCK signal divider.
+    default: 1
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 4, 8]
+
+  brcm,clk-dat-low:
+    description: Makes clock and data signals active low.
+    type: boolean
+
+patternProperties:
+  "^led@1?[0-9a-f]$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+    description: Each LED is represented as a sub-node of
+      this device.
+
+    properties:
+      reg:
+        description: LED pin number (0 to 31).
+        maxItems: 1
+
+    required:
+      - reg
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
+    led-controller@fffe00d0 {
+        compatible = "brcm,bcm6358-leds";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        reg = <0xfffe00d0 0x8>;
+
+        led@0 {
+            reg = <0>;
+            active-low;
+            label = "white:alarm";
+        };
+        led@2 {
+            reg = <2>;
+            active-low;
+            label = "white:tv";
+        };
+        led@3 {
+            reg = <3>;
+            active-low;
+            label = "white:tel";
+        };
+        led@4 {
+            reg = <4>;
+            active-low;
+            label = "white:adsl";
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/leds/leds-bcm6358.txt b/Documentation/devicetree/bindings/leds/leds-bcm6358.txt
deleted file mode 100644
index 211ffc3c4a20..000000000000
--- a/Documentation/devicetree/bindings/leds/leds-bcm6358.txt
+++ /dev/null
@@ -1,143 +0,0 @@
-LEDs connected to Broadcom BCM6358 controller
-
-This controller is present on BCM6358 and BCM6368.
-In these SoCs there are Serial LEDs (LEDs connected to a 74x164 controller),
-which can either be controlled by software (exporting the 74x164 as spi-gpio.
-See Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml), or
-by hardware using this driver.
-
-Required properties:
-  - compatible : should be "brcm,bcm6358-leds".
-  - #address-cells : must be 1.
-  - #size-cells : must be 0.
-  - reg : BCM6358 LED controller address and size.
-
-Optional properties:
-  - brcm,clk-div : SCK signal divider. Possible values are 1, 2, 4 and 8.
-    Default : 1
-  - brcm,clk-dat-low : Boolean, makes clock and data signals active low.
-    Default : false
-
-Each LED is represented as a sub-node of the brcm,bcm6358-leds device.
-
-LED sub-node required properties:
-  - reg : LED pin number (only LEDs 0 to 31 are valid).
-
-LED sub-node optional properties:
-  - label : see Documentation/devicetree/bindings/leds/common.txt
-  - default-state : see
-    Documentation/devicetree/bindings/leds/common.txt
-  - linux,default-trigger : see
-    Documentation/devicetree/bindings/leds/common.txt
-
-Examples:
-Scenario 1 : BCM6358
-	leds0: led-controller@fffe00d0 {
-		compatible = "brcm,bcm6358-leds";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0xfffe00d0 0x8>;
-
-		alarm_white {
-			reg = <0>;
-			active-low;
-			label = "white:alarm";
-		};
-		tv_white {
-			reg = <2>;
-			active-low;
-			label = "white:tv";
-		};
-		tel_white {
-			reg = <3>;
-			active-low;
-			label = "white:tel";
-		};
-		adsl_white {
-			reg = <4>;
-			active-low;
-			label = "white:adsl";
-		};
-	};
-
-Scenario 2 : BCM6368
-	leds0: led-controller@100000d0 {
-		compatible = "brcm,bcm6358-leds";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x100000d0 0x8>;
-		brcm,pol-low;
-		brcm,clk-div = <4>;
-
-		power_red {
-			reg = <0>;
-			active-low;
-			label = "red:power";
-		};
-		power_green {
-			reg = <1>;
-			active-low;
-			label = "green:power";
-			default-state = "on";
-		};
-		power_blue {
-			reg = <2>;
-			label = "blue:power";
-		};
-		broadband_red {
-			reg = <3>;
-			active-low;
-			label = "red:broadband";
-		};
-		broadband_green {
-			reg = <4>;
-			label = "green:broadband";
-		};
-		broadband_blue {
-			reg = <5>;
-			active-low;
-			label = "blue:broadband";
-		};
-		wireless_red {
-			reg = <6>;
-			active-low;
-			label = "red:wireless";
-		};
-		wireless_green {
-			reg = <7>;
-			active-low;
-			label = "green:wireless";
-		};
-		wireless_blue {
-			reg = <8>;
-			label = "blue:wireless";
-		};
-		phone_red {
-			reg = <9>;
-			active-low;
-			label = "red:phone";
-		};
-		phone_green {
-			reg = <10>;
-			active-low;
-			label = "green:phone";
-		};
-		phone_blue {
-			reg = <11>;
-			label = "blue:phone";
-		};
-		upgrading_red {
-			reg = <12>;
-			active-low;
-			label = "red:upgrading";
-		};
-		upgrading_green {
-			reg = <13>;
-			active-low;
-			label = "green:upgrading";
-		};
-		upgrading_blue {
-			reg = <14>;
-			label = "blue:upgrading";
-		};
-	};
-- 
2.54.0

