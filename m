Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAA8370D44
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 15:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780758351; cv=none; b=tOSYT8+SR+nqb5Sk+vrA22jJVu5zxcn3nYBRaeDyp3H/IQ+o6QPKRz8NhieU5FdHgnOz9FAn8H5ZpvQAYMn8WRADbJvKzbCFciJruJ/9pq47fr2CzR6S86+ReT9xmcynf6uJlpY4Pxde2pwnblb13z/4uVH7dY+gvX18oKNfkMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780758351; c=relaxed/simple;
	bh=B/E42DH9L0OsbjnEU8trNPtTAk1YF5VphsZ/yuA524s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IiiyOIM0Wyhbey5/j7BnFOnR0s8y5AAMXbBRaDj9OQrR0zhzTPOyPB/5x5m/nT97nVFIZa9pg4d4Aw+IyHq20gm49oJRQ3pzuZDpIZ2K5hlFpNH8S5zEjzhBpPX06iAVNdtKktwi3k4fYTVyRzfTgMl2kZLyAHjh5hX48YDdJwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z0MO7IhL; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z0MO7IhL"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1370417c01cso3998838c88.1
        for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 08:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780758350; x=1781363150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mfLlaOvP8Xr5tMlVdxU7GEA4dRW3fNbCN8mq/+hgMc=;
        b=Z0MO7IhLKpBya3udjny2xbfnbZHptm3NNpISUacoXcUc2q6EnpR320TEIWLljASZP3
         B56xwSd4jArhpV1nfQW/9dQlGKHjh5v0EFn65MYD5PrRPHzu+UYXmyRtN6ckrjyUYHdP
         T1SmiNW00XMvBm854/zqkcfSBuQZHiivDF+8XpEkAZyTBhBbOpwyTbq3b5iY6b8n9z3p
         10p86Dv2tQB4fdcsLu34d8asWioJ9iG8icVgnodrNaVzwluJR91MZV2ceD5256pWiOVI
         d/5LfN+w11firD+MDgEy7mQc2It5LX9vlD3Mf/UtUPhN0reDs13TgXEw7jBHhsw5+ttP
         K0lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780758350; x=1781363150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7mfLlaOvP8Xr5tMlVdxU7GEA4dRW3fNbCN8mq/+hgMc=;
        b=aMEKq6k2yqUrJ+UCKXsF7zhv6nplOgz8i9OVww8SDr6mFllAxHbOdozoIy7PmiziYo
         aqpDFGRPmgyQvijEi7IyMIiW+k74CR+dnTKTivGLpKUb3pureKK+Tv4cw8Obr4nBmGlP
         XKlQsDcJJDfeKEH5wt8TWXigcJHfn38qTUtAXNuOB/DJkcFSe9rCHS4aaKRM1+28tLKm
         HdP1pwSmYo3z/3oiwtpQ9W6wP3Ctl/8FjZFuOaAbz+CmCJP65v/DwqCaQqMD7wmBj5s0
         T0NeamUvRnjToWALq0wiPBIDFE6kJbWC3s3m5wtEEKvQj9bTvjp+8+LkTvypl4VD7nYw
         7Yvg==
X-Forwarded-Encrypted: i=1; AFNElJ9UNxhCQ6Pz0M7HbfIlC3WxgiF8++RXxj1h8Pssr28+DRfQx9VnLj7wuLSPPJjp+NEaXm/JLHfkXWeY@vger.kernel.org
X-Gm-Message-State: AOJu0YzGZONRF2Tm0/dkoCqLIArPrHpDdJ65ltGodk4xAaB/bZi06XU9
	AFZg2W8aSFjdG5r4YtxTNQ7uWIDcSLrMWBVSVauyJF/tbaWasZDZ1RwS
X-Gm-Gg: Acq92OEdSUb1hMtBap+ym74Y0AKFJ5ATZ3ecgOe/mkNCw4BJClSwR0ox3qC1QclBf3B
	HHjBVSJxhpFVXDpdCN5ZqAug5i40eD7u7lgI23yhCUMl0hD3SYZCVEcK8RN1ms0xz3e+kBHpXgH
	WTZ45ym133BdIZfdDnM88SxkXWPyYYRdd3jf+hFxo/R36rc3BeVNUDbcBaTwUIG1K56ih96DbBu
	YQJHulzAmbQQoL6W+AJrXMF59Me6XrCrVbtgVJfGeyJEU9+fVV73+q/PCJ3na+75JFchzXUI4Vd
	j+YXV5+PBdGm91OiQrE0fRg+7IjLCTEzjYS0kRdIl2CtWBC4ICuV8SeADcxbXKk2yiD5bQeEhxY
	68dROI1COQo5AWekJhtkp6eNowf90EutNg0vj4cxlvZksWh6aF9gJnxUmC5mzcQBKz+b/Hs2jH0
	nyigAP+vHtiJv3vot+lgeet24lu5DeOGsxk2w16xsk1wSilLg27XXBqYg0zhQu
X-Received: by 2002:a05:7022:603:b0:137:eceb:6f44 with SMTP id a92af1059eb24-138066dff52mr4328792c88.22.1780758349745;
        Sat, 06 Jun 2026 08:05:49 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a54:e741:3a5a:3245:d3dc:4b5d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f5539035sm8415607c88.11.2026.06.06.08.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 08:05:49 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] dt-bindings: input: microchip,cap11xx: Cleanup and refine LED constraints
Date: Sat,  6 Jun 2026 23:03:56 +0800
Message-ID: <20260606150458.250606-4-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260606150458.250606-1-jerrysteve1101@gmail.com>
References: <20260606150458.250606-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add detailed datasheet links for all supported CAP11xx devices.

Unify LED node pattern to support all chip variants in preparation
for CAP1114 support.

Remove redundant LED properties inherited from common.yaml

Apply per-chip LED channel limits:
- CAP1126: max 2 channels (0-1)
- CAP1188: max 8 channels (0-7)
- CAP1106, CAP12xx: no LED support

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 .../bindings/input/microchip,cap11xx.yaml     | 51 ++++++++++++++-----
 1 file changed, 37 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml b/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
index 7ade03f1b32b..99d00f572a2d 100644
--- a/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
+++ b/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
@@ -10,6 +10,15 @@ description: |
   The Microchip CAP1xxx Family of RightTouchTM multiple-channel capacitive
   touch controllers and LED drivers. The device communication via I2C only.
 
+  For more product information please see the links below:
+    CAP1106: https://ww1.microchip.com/downloads/en/DeviceDoc/00001624B.pdf
+    CAP1126: https://ww1.microchip.com/downloads/en/DeviceDoc/00001623B.pdf
+    CAP1188: https://ww1.microchip.com/downloads/en/DeviceDoc/00001620C.pdf
+    CAP1203: https://ww1.microchip.com/downloads/en/DeviceDoc/00001572B.pdf
+    CAP1206: https://ww1.microchip.com/downloads/en/DeviceDoc/00001567B.pdf
+    CAP1293: https://ww1.microchip.com/downloads/en/DeviceDoc/00001566B.pdf
+    CAP1298: https://ww1.microchip.com/downloads/en/DeviceDoc/00001571B.pdf
+
 maintainers:
   - Rob Herring <robh@kernel.org>
 
@@ -124,25 +133,21 @@ properties:
       The number of entries must correspond to the number of channels.
 
 patternProperties:
-  "^led@[0-7]$":
+  "^led@[0-9a-f]$":
     type: object
     description: CAP11xx LEDs
     $ref: /schemas/leds/common.yaml#
 
     properties:
       reg:
-        enum: [0, 1, 2, 3, 4, 5, 6, 7]
-
-      label: true
-
-      linux,default-trigger: true
-
-      default-state: true
+        description: LED channel number
+        minimum: 0
+        maximum: 7
 
     required:
       - reg
 
-    additionalProperties: false
+    unevaluatedProperties: false
 
 allOf:
   - $ref: input.yaml
@@ -158,7 +163,20 @@ allOf:
               - microchip,cap1298
     then:
       patternProperties:
-        "^led@[0-7]$": false
+        "^led@": false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - microchip,cap1126
+    then:
+      patternProperties:
+        "^led@":
+          properties:
+            reg:
+              maximum: 1
 
   - if:
       properties:
@@ -183,6 +201,9 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/leds/common.h>
+
     i2c {
       #address-cells = <1>;
       #size-cells = <0>;
@@ -208,19 +229,21 @@ examples:
         #size-cells = <0>;
 
         led@0 {
-                label = "cap11xx:green:usr0";
                 reg = <0>;
+                function = LED_FUNCTION_INDICATOR;
+                color = <LED_COLOR_ID_GREEN>;
         };
 
         led@1 {
-                label = "cap11xx:green:usr1";
                 reg = <1>;
+                function = LED_FUNCTION_INDICATOR;
+                color = <LED_COLOR_ID_GREEN>;
         };
 
         led@2 {
-                label = "cap11xx:green:alive";
                 reg = <2>;
-                linux,default-trigger = "heartbeat";
+                function = LED_FUNCTION_INDICATOR;
+                color = <LED_COLOR_ID_GREEN>;
         };
       };
     };
-- 
2.54.0

