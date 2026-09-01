Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A0D42049F
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 17:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788282282; cv=none; b=e2U8+ImvHPk6P5amp1yLPJrRjfXKm9F3spgXvkBgLjLCMrpaO3pR7q6JIT0XeU/8SCRMnGA9lzkqFjt2aY72qHw33pQX3IToRyrZJQ2vA8/PsFc2D/ksBR+owuwqR/g5FKmoQYnbCHzk5mlBY6zi0/9wsyM8FFV9VP1cJCY01k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788282282; c=relaxed/simple;
	bh=1X/qnV8vzg9tJPFlS6BMkOFMp3DyOY/TrtNCEvo4TAE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=n/+QavepJVKMAK+e3FCVIXO0wunYI8GCaWBwA/F+477/Mf4QLnQ5IY9nmTywTZxi6QBXkpepkaih9UWYfpMX0g7xgsuyyb021wenIdAnttwL1ZQpNWFUb/fo0qeRxDrfpqQAxFVNMKnG6FwEFMw6yO2lXKsigLnphmY8rvVfrWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o7oUPXAF; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o7oUPXAF"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d6fe26ef1cso53238635ad.2
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 10:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788282280; x=1788887080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uWnlK88LsKs7/tUdroGlxm7SknJObd+rEmQrujEmjq0=;
        b=o7oUPXAFV8WedSg5bR9Tp4xVp4I+77ykHBqL+q8Kw0oL8/S7QEC+J29Hi8fEsMN7GY
         EmSJTQ0qFiY9kTcV+Ju4JE6IYjPj393C4AiDfgOtHFZOdRPhi2t2nh0a+3vZNSsfT5bz
         0LBThDSydiITC0Ltkk73MlYO5QzOpQraSYrDlWTBDDx3zvcf6bDbIEmNM6dhXlHnXXIb
         ZLhXtvCKuk/ykCQCgx3tDN9DsJ1fmA9KWtFGXPSmxy0EHvhIXvHaAJMwgXcLfn9WSoxF
         HCMHOMznTt/TUB0qTQK+pAWV5bUW4kUmnQRnEuXLimUe2BKxwY+YqzDjo/99Zz04e2xf
         pLtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788282280; x=1788887080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uWnlK88LsKs7/tUdroGlxm7SknJObd+rEmQrujEmjq0=;
        b=kZN3K0+mhL+igq3qR4xflsOghfhX/ueBs9V0NQ9H9VXlaIZFDE6JhhHhufXKf5SHlK
         ajySl6DAYv+X1lVtu1szYHZJWO8IMRK9P+X6ZuHnrbLvJlGnQKCM1CAjTRt8D1LQlLaC
         FVtJlPoXnG73QRlzIHAU2RJZH+AXuPLxYBtVjOdpFKFpZameMQVK4HMCCiNnXQZaQcLF
         CsWnRtUznx44rafAfswIH7f0b687a03+Hw/r0ELoz8vZXJnkzD8tDGmBPJxmtHXH6o5v
         WZVjGU9FamlVnN996+LOMPZMjO+06uf0zDDj7fWRb5/bjmJTjC30Hu4Dia23gPjAkKNn
         x1sw==
X-Forwarded-Encrypted: i=1; AKwUvByu9+dkAkBfs0n62PXrQncgRUyikNXILhe5/0jQjvg1M2h2ED8vVCSHrWaIEiuyAYFt2FgLVRv36igG@vger.kernel.org
X-Gm-Message-State: AFuF++nvzp8aD1rNTRaxJQrtZJXIJVu95vyXeYTn34rkjkCryyf2qv/X
	0QfRk3ieuKI7jBdORXGa6FxdN7FB36MTnff5RGSlx1+EpiVVwQaR0oMg
X-Gm-Gg: AYBFou15kB0tsftZdwsoIdC/Uss+o3HdoZ+Qxlj/B7AHTuAueyIryTkqqDm3bTyQBcj
	fgUMJ8V2MpykyiQxBuYON+Tt0OHtnajN8krp61VSkVTQHv0716ZrFv6q1ctVPXQMDExy36v2P+n
	1pgoL8RqQJfobLneDtuUw1LYGZ4I4mr3DnxEZ+Gw6OK4wrulQXD59KRcZMltAzU1xe955NGZGLl
	pCTKAPR0KvmiQz3SlKMrcY/7WSSOaW3e72xwII4RAEDvsrF6fWF5GhpNgoX//PASyFy9LKSTzD2
	D0GYFSLy6ex08N9oIi1HXxDDRMQwzHGoqmjIaxKechXK2mm+IQP+Yw/Pn6go7+ZfjBhEsH5vuUp
	hysWPYESOZMVwCXqgl47idGT1iPiReJbvLcSnYinL56ltfYz5cJ1TaA9C99keSaK7rcasiDwgcT
	UP9hcQjc4OU1bTFUYnP6kvaGSvJgB9iTMxy6FgcTWJO/4qrpfvOw0H83eybi7NFhdrP7BKJxD8n
	CT1SXY=
X-Received: by 2002:a17:902:e54e:b0:2d9:2ff6:2497 with SMTP id d9443c01a7336-2d92ff6258fmr185049165ad.13.1788282279845;
        Tue, 01 Sep 2026 10:04:39 -0700 (PDT)
Received: from inhnjlux1020.ls.ege.ds ([2406:b400:53:5146:59ac:3f4b:833e:8027])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b26fd7edbsm29492199eec.5.2026.09.01.10.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 10:04:38 -0700 (PDT)
From: Udaya Kiran Challa <challauday369@gmail.com>
To: lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Udaya Kiran Challa <challauday369@gmail.com>
Subject: [PATCH v3] dt-bindings: leds: lacie,netxbig-leds: Convert to DT schema
Date: Tue,  1 Sep 2026 22:33:58 +0530
Message-Id: <20260901170358.176103-1-challauday369@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert lacie,netxbig-leds devicetree binding from legacy
text format to DT schema.

Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
Changelog:
Changes since v2:
- Add reference to led common.yaml
- Drop type for all common properties

Link to v2:https://lore.kernel.org/all/20260821123723.198286-1-challauday369@gmail.com/

Changes since v1:
- Use pattenProperties for LED child nodes instead of additionalProperties
- Explicitly list the two optional properties supported by the binding
- Place the top-level required block after child-node definition

Link to v1:https://lore.kernel.org/all/20260820150223.108374-1-challauday369@gmail.com/
---
 .../bindings/leds/lacie,netxbig-leds.yaml     | 139 ++++++++++++++++++
 .../devicetree/bindings/leds/leds-netxbig.txt |  92 ------------
 2 files changed, 139 insertions(+), 92 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-netxbig.txt

diff --git a/Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml b/Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml
new file mode 100644
index 000000000000..5cb2eaf74d1a
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml
@@ -0,0 +1,139 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/lacie,netxbig-leds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LaCie/Seagate netxbig CPLD LEDs
+
+maintainers:
+  - Simon Guinot <simon.guinot@sequanux.org>
+
+description: |
+  Binding for the CPLD LEDs (GPIO extension bus) found on some LaCie/Seagate
+  boards (Example: 2Big/5Big Network v2, 2Big NAS).
+
+properties:
+  compatible:
+    const: lacie,netxbig-leds
+
+  gpio-ext:
+    description: Phandle for the gpio-ext bus.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  timers:
+    description: |
+      Timer array. Each timer entry is represented by three integers:
+      Mode (gpio-ext bus), delay_on and delay_off.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+patternProperties:
+  "^(?!gpio-ext$|pinctrl-[0-9]+$)[a-z][a-z0-9]*(-[a-z0-9]+)+$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      label: true
+      linux,default-trigger: true
+
+      mode-addr:
+        description: Mode register address on gpio-ext bus.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      mode-val:
+        description: |
+          Mode to value mapping. Each entry is represented by two integers:
+          a mode and the corresponding value on the gpio-ext bus.
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+
+      bright-addr:
+        description: Brightness register address on gpio-ext bus.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      max-brightness:
+        description: Maximum brightness value.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+    required:
+      - mode-addr
+      - mode-val
+      - bright-addr
+      - max-brightness
+
+required:
+  - compatible
+  - gpio-ext
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/leds-netxbig.h>
+
+    netxbig-leds {
+        compatible = "lacie,netxbig-leds";
+
+        gpio-ext = <&netxbig_gpio_ext>;
+
+        timers = <NETXBIG_LED_TIMER1 500 500
+                  NETXBIG_LED_TIMER2 500 1000>;
+
+        blue-power {
+            label = "netxbig:blue:power";
+            mode-addr = <0>;
+            mode-val = <NETXBIG_LED_OFF 0
+                        NETXBIG_LED_ON 1
+                        NETXBIG_LED_TIMER1 3
+                        NETXBIG_LED_TIMER2 7>;
+            bright-addr = <1>;
+            max-brightness = <7>;
+        };
+        red-power {
+            label = "netxbig:red:power";
+            mode-addr = <0>;
+            mode-val = <NETXBIG_LED_OFF 0
+                        NETXBIG_LED_ON 2
+                        NETXBIG_LED_TIMER1 4>;
+            bright-addr = <1>;
+            max-brightness = <7>;
+        };
+        blue-sata0 {
+            label = "netxbig:blue:sata0";
+            mode-addr = <3>;
+            mode-val = <NETXBIG_LED_OFF 0
+                        NETXBIG_LED_ON 7
+                        NETXBIG_LED_SATA 1
+                        NETXBIG_LED_TIMER1 3>;
+            bright-addr = <2>;
+            max-brightness = <7>;
+        };
+        red-sata0 {
+            label = "netxbig:red:sata0";
+            mode-addr = <3>;
+            mode-val = <NETXBIG_LED_OFF 0
+                        NETXBIG_LED_ON 2
+                        NETXBIG_LED_TIMER1 4>;
+            bright-addr = <2>;
+            max-brightness = <7>;
+        };
+        blue-sata1 {
+            label = "netxbig:blue:sata1";
+            mode-addr = <4>;
+            mode-val = <NETXBIG_LED_OFF 0
+                        NETXBIG_LED_ON 7
+                        NETXBIG_LED_SATA 1
+                        NETXBIG_LED_TIMER1 3>;
+            bright-addr = <2>;
+            max-brightness = <7>;
+        };
+        red-sata1 {
+            label = "netxbig:red:sata1";
+            mode-addr = <4>;
+            mode-val = <NETXBIG_LED_OFF 0
+                        NETXBIG_LED_ON 2
+                        NETXBIG_LED_TIMER1 4>;
+            bright-addr = <2>;
+            max-brightness = <7>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/leds/leds-netxbig.txt b/Documentation/devicetree/bindings/leds/leds-netxbig.txt
deleted file mode 100644
index 5ef92a26d768..000000000000
--- a/Documentation/devicetree/bindings/leds/leds-netxbig.txt
+++ /dev/null
@@ -1,92 +0,0 @@
-Binding for the CPLD LEDs (GPIO extension bus) found on some LaCie/Seagate
-boards (Example: 2Big/5Big Network v2, 2Big NAS).
-
-Required properties:
-- compatible: "lacie,netxbig-leds".
-- gpio-ext: Phandle for the gpio-ext bus.
-
-Optional properties:
-- timers: Timer array. Each timer entry is represented by three integers:
-  Mode (gpio-ext bus), delay_on and delay_off.
-
-Each LED is represented as a sub-node of the netxbig-leds device.
-
-Required sub-node properties:
-- mode-addr: Mode register address on gpio-ext bus.
-- mode-val: Mode to value mapping. Each entry is represented by two integers:
-  A mode and the corresponding value on the gpio-ext bus.
-- bright-addr: Brightness register address on gpio-ext bus.
-- max-brightness: Maximum brightness value.
-
-Optional sub-node properties:
-- label: Name for this LED. If omitted, the label is taken from the node name.
-- linux,default-trigger: Trigger assigned to the LED.
-
-Example:
-
-netxbig-leds {
-	compatible = "lacie,netxbig-leds";
-
-	gpio-ext = &gpio_ext;
-
-	timers = <NETXBIG_LED_TIMER1 500 500
-		  NETXBIG_LED_TIMER2 500 1000>;
-
-	blue-power {
-		label = "netxbig:blue:power";
-		mode-addr = <0>;
-		mode-val = <NETXBIG_LED_OFF 0
-			    NETXBIG_LED_ON 1
-			    NETXBIG_LED_TIMER1 3
-			    NETXBIG_LED_TIMER2 7>;
-		bright-addr = <1>;
-		max-brightness = <7>;
-	};
-	red-power {
-		label = "netxbig:red:power";
-		mode-addr = <0>;
-		mode-val = <NETXBIG_LED_OFF 0
-			    NETXBIG_LED_ON 2
-			    NETXBIG_LED_TIMER1 4>;
-		bright-addr = <1>;
-		max-brightness = <7>;
-	};
-	blue-sata0 {
-		label = "netxbig:blue:sata0";
-		mode-addr = <3>;
-		mode-val = <NETXBIG_LED_OFF 0
-			    NETXBIG_LED_ON 7
-			    NETXBIG_LED_SATA 1
-			    NETXBIG_LED_TIMER1 3>;
-		bright-addr = <2>;
-		max-brightness = <7>;
-	};
-	red-sata0 {
-		label = "netxbig:red:sata0";
-		mode-addr = <3>;
-		mode-val = <NETXBIG_LED_OFF 0
-			    NETXBIG_LED_ON 2
-			    NETXBIG_LED_TIMER1 4>;
-		bright-addr = <2>;
-		max-brightness = <7>;
-	};
-	blue-sata1 {
-		label = "netxbig:blue:sata1";
-		mode-addr = <4>;
-		mode-val = <NETXBIG_LED_OFF 0
-			    NETXBIG_LED_ON 7
-			    NETXBIG_LED_SATA 1
-			    NETXBIG_LED_TIMER1 3>;
-		bright-addr = <2>;
-		max-brightness = <7>;
-	};
-	red-sata1 {
-		label = "netxbig:red:sata1";
-		mode-addr = <4>;
-		mode-val = <NETXBIG_LED_OFF 0
-			    NETXBIG_LED_ON 2
-			    NETXBIG_LED_TIMER1 4>;
-		bright-addr = <2>;
-		max-brightness = <7>;
-	};
-};
-- 
2.34.1

