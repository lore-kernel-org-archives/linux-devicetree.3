Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C7D3B1BD
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 03:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779680011; cv=none; b=Bc1IPayCv7ziDkjOONZJBhgk3L9roFf9qWLB4cSSeXyJaV38x2TO3Kik5iYPjG/mNlvdsXtg89nt5qHyNzLxk+agxNYZ9EEAF0g1v2W6tbBUImBrDrGx/7IQ2hFiD2ZYjjViDVVCRvZbsPFSBfymHjtDbtjgBJ95gC40apTfHzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779680011; c=relaxed/simple;
	bh=WAyuds5HBkMBWh/IWc9YR1stn53VnWwH2uOyt5L8jIY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NWBSyHSYOtfllEvZ3zlXc4tSN+ImyLfrNtafNn9Z0bVhijbTBPSgfvgS2HZ0D4h+fvMUGwwaHD3swK8eZm5luBBcLdg4RHaoUNbDm5n3oZSFhEW5giQOZMIYaCiPpqi9AjwqjxldiSVGWlCycLqQqjVrbfNSIHvjskKU3Bg/SdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nx7OuZ3J; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nx7OuZ3J"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2b4650d5f5cso37593105ad.0
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 20:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779680009; x=1780284809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9yiHvPwp6eaDY83CzuvonglxPr7tqfRwJOe2dfHrjDs=;
        b=nx7OuZ3J35vHQZlBy3yvsZYfloaLKUPqGzeyBrSrCTAw6RXcbKPtn8B6bvgZgifZz4
         axuRfbzDiChwn/vwtQhuZBPpolayEnVowXUfGk5gocszoVM6fEbCsxu9cceaure/aWZQ
         oYSAV1Sp0u495Q10EuDx1fV7BNuKxLKaVJvGZmHg0exL5viJEiHOumlswbeeUZLIrrni
         CkO5vRTrET++V9Or/H8w3BBw/9ID7tXLvAvz/51Xh3OFHn4fEelf09yeJGHqHlOjFTjW
         dFsIqkBd1YaKU7gSdRpUG46NqRM1scZmP79CYtEadI+aoD0RKbBeeEIugy3dKZqyoRZB
         0KSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779680009; x=1780284809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9yiHvPwp6eaDY83CzuvonglxPr7tqfRwJOe2dfHrjDs=;
        b=rjlLwJik0eJvxSGTrcCRHibpS1B8RdIGaQ3fqW6url4EDAEfS1BO/muc3KNz/WSA3N
         a+QsI8mUxtK7pKkLIBsu77/VU8sGKNA2EMPU/nUW6/31gAoGN+vrtHzu8DGFFawDKOrw
         2XhENhORA1bimSEBSVIYbASyCNjnpmDG3o0Vu2leI9EmShz105HCJ/4L+DqZIQUFHjS6
         8p5HK1LqyjtZhywNftIYUI3yygB89QIOOqivJkTWH56jN72WaMTSO3LGnZwMDYGNKhPD
         2yKnnoWHau7zQKO83ueJjPY0sAlkYw7pNmcX5BUMJgJlwV8/grv/1HF+Npf2p9PjZj85
         5rJA==
X-Forwarded-Encrypted: i=1; AFNElJ81eFU7DW1lanHwpdONS6KzTom7st6rh3XiKCh8U31eA3xNl3L9CTQqQlWTgZ44h5BexmsRpsXpsI3Q@vger.kernel.org
X-Gm-Message-State: AOJu0YxUx4ifxlgqoKxRwFUULWckjuBfkSkqMvXaHiXQw3DwuMMT99wx
	g1zWTD0+5e27HpcSlK6oCIg6ZfXPyRf6LGEoe8Kg7wAIc32zsRibGVnQ
X-Gm-Gg: Acq92OE9o3bdAPFJCXSwI3s3A8ayGtwFU+xg4p5X2GttDjsOvlKCGgIGk1NK6valRCT
	WpE7gs+F2iGfrr/NLXqrfI/6IKbWbxqpFTaNfIigWJkQY0Rp5cWsyXeXvOrEVAMoBK+ScILVkSK
	ylUfl6pq08qcRsYQKqREftMoFqg6Ilt+LVf17/lT3Pzfvr5YIsVO4Z5Z/QlaVP0wDsfVF9tz94i
	Fv3AWFjTSgA+rxeKmeQDlVWEe9A/X91bacfnIq4jORUMVVR/XiN9PR6n4SidjGWUK+n8eiCOnrd
	3ZP6pESidQTSCw0+togZYK9YzkbK8z4uLHirAmn9ATkM6dpXYD+JOq4H69bX707iGx9hHpJbwu+
	9LO9dft5n1yGNifuJUY+G6gIdqUpkHecwC2EdnveEg3a/m/MpmtV/6TDJXN4P23RiJ6Pf7P3Qjj
	zmpc+wgO9PEAlUI9dv8VPB0Q6nn/r2qgdXCQYFhutlzj6Rt4F+AKvzA6H0Xl3zLnWKDE6iRdN7g
	3KDpks=
X-Received: by 2002:a17:903:19e7:b0:2b2:67ca:5ff9 with SMTP id d9443c01a7336-2beb026f4c4mr137314845ad.0.1779680009159;
        Sun, 24 May 2026 20:33:29 -0700 (PDT)
Received: from fedora ([103.181.54.98])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58d9fe9sm77391815ad.65.2026.05.24.20.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 20:33:28 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jonas.gorski@gmail.com
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH] dt-bindings: leds: bcm6358: Convert to DT schema
Date: Mon, 25 May 2026 09:02:58 +0530
Message-ID: <20260525033258.144291-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the brcm,bcm6358 to DT schema.

Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---

Referred to this thread:
https://lore.kernel.org/all/20250930-brcm6358-to-dt-v1-1-ba833ceb1575@thegoodpenguin.co.uk/
and added the fixes suggested.

 .../bindings/leds/brcm,bcm6358-leds.yaml      |  98 ++++++++++++
 .../devicetree/bindings/leds/leds-bcm6358.txt | 143 ------------------
 2 files changed, 98 insertions(+), 143 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/brcm,bcm6358-leds.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-bcm6358.txt

diff --git a/Documentation/devicetree/bindings/leds/brcm,bcm6358-leds.yaml b/Documentation/devicetree/bindings/leds/brcm,bcm6358-leds.yaml
new file mode 100644
index 000000000000..a61417e5690b
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/brcm,bcm6358-leds.yaml
@@ -0,0 +1,98 @@
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
+  - Jonas Gorski <jonas.gorski@gmail.com>
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
+  "^led@(0|1?[0-9a-f])$":
+    type: object
+    $ref: common.yaml#
+    description: Each LED is represented as a sub-node of
+      this device.
+
+    properties:
+      reg:
+        description: LED pin number.
+        minimum: 0
+        maximum: 31
+
+    required:
+      - reg
+
+    unevaluatedProperties: false
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

