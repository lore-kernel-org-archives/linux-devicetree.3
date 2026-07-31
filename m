Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6339D3E3DAF
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 11:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785497443; cv=none; b=F9r0mTNzuEX50teCUCyGws1p077iUJUICi5jJLExBPcmYFY7LxHBypQqNLKgP78lx7rSEikKkbBbyQQxcxjis+A2XS85KXXGOyC59pNvXqQRf9rBkU9Px5bWaTQO+rSxppgng9mZc5Q0m0naqbRqxOxQsJ3jOOMWN/Vx8CMBsOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785497443; c=relaxed/simple;
	bh=4hhsAxAJjA9CnHKxIGE5+DUar4FrPizlIRDXYPMfD4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VvURIYGyWe3oHAekpQnHu/Kxa6BNa0otOWXMjeSQH9KZJedBA3l3OOmVWK7z1wtdMKn5nvkZJSMYR0xForItlhVKYlFGAxcRXDylUFV+OM2QSaSYJaQ7utVFEMk8MDU6r5R3vT9zta80FaZkrQ0NbA6THbiinBSwWVksuRIojlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJwI8Vhm; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJwI8Vhm"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so1076192f8f.1
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 04:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785497434; x=1786102234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ge4jOwru2gdBik+03SVRNyiDvso3mpjCVgnlsYEIFrM=;
        b=eJwI8VhmB8kgbnrQL/JvPfkJykn3pUGgk0NIyUN2PVYAMA0sB9z0QjbxYkkn03WAu/
         m8i4V0FdKNDyp4IxBvzHfdTQR9h9ICpZfxSFxAaSYOtlxDXRcOb+QlyvYzdrus+NBqTQ
         3z+VZ4r9Ly7DbwtDDi20EHSMZskStBHuhYdCnJIUF1V8/cLiElzjGdh1RApB0+zkiQMd
         HOW4FYMV4npwTaIHxdJCxOWDZSoUWdm5t5cFiMSoc36NBhu3wnpSGGN/Gs+HMneMOQ3L
         citJLv2bWF8gYK/z+Zvha9ffmCyPikYGRhlqpWoa4zDPiqbxdi/PBTF8ksSOd2ntbH3+
         wz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785497434; x=1786102234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ge4jOwru2gdBik+03SVRNyiDvso3mpjCVgnlsYEIFrM=;
        b=PkndHvaeQCpr/+C+7IMASZvwfgkjiISRD8eIi/R65tw5rzmsctPYOxPRGBgf85Hrgi
         n/gq8YmxyrpKKy3cEDAfk3W7+mCuWNdvwYqHDpAQgQ4Dv6gVdVCe5fN6cy9xxN7Q/P1X
         kbR1jU6FKbY6c/FoBtO3A9H8KQSaPvbBBEFKuIIJLXT5aC8OiK0vyjDSLBeMI/QVY+lp
         E1hJZUw1CTudL4TTBXsur9K96Eg2CFPOqewJUqwQg+XNPuhrzgRNYoOc9uwSilcfPjyp
         RRNfwBuhO6CwKoYv+kgHHVDOkgPVAg8PPmer7JiJMQcy/F3XQ/fmnIPLFjNSd/xcO4MV
         RZFw==
X-Forwarded-Encrypted: i=1; AHgh+Rr5dYvQylroUVWQBIv2GZ7Um3Ditqw04PwvQFEqJveVBDLJ7vKXjub/vUPdqwrptfGH+AmxOLyO7EuR@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1WrULRhJyuqoicBx9USSAsFXJB/VfwJG7OdXjMmYSg3QYbA2A
	0/SeAKj+Xu0Mv8H9Ah3SjWSdWUnHWPn8MosXIXSqVB5L7C1lSEZxngyg
X-Gm-Gg: AR+sD11lM8JXHC8j1ZilN4aKPS8zYXz6jqGDkGoWVxxvLfFE40aneUvPGc6swnSg5TQ
	48F6ZjmEDa4yEnIIcC9dKNbEoNFR8VRV3WRWbuRvUvIGis0YlusJtlPYYe0raYv2hZ0YSw8XB9Q
	1qLClA5DRbX6DBhVgbft8/V1Zr91WcWi86vR5RzwNMeq9gFY7Z/CKEkQEuJYOJBwx89uldOIHUX
	YO6M+oa0tKU0rxx7Tv+B3+UO/5KDmZtJ73/4MBatmUKZpSWvfGnlBRUmgOiA4sNYUH4K499ZqdV
	SITIAaNBGfYuBpl+s2pjyG4zkeCy8nPM5OL5Ru6qryQEE5u+MzZQFPDV5c013rlVO3fDOMGTn28
	9g+PVd0Mqkd26EXZ7YjZQjT24+Spd84mew9OOtZ2pyVWcxkTOJ+CftF/jvNwLWwUU0ZfYTI0MY/
	o5uc990hCRx4JNv3rA9dl1aco8ejIGYl5fd3vZnhyL+q1cdG6KRo0E5/9yuJd4b1V1f/nmKG92D
	nB8eliP1g==
X-Received: by 2002:a05:6000:2308:b0:47f:8b75:2520 with SMTP id ffacd0b85a97d-47fd2b4dbfemr3609854f8f.42.1785497433804;
        Fri, 31 Jul 2026 04:30:33 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6besm3823656f8f.22.2026.07.31.04.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:30:32 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] dt-bindings: hwmon: Document SMSC EMC1402/1403/1404/1428
Date: Fri, 31 Jul 2026 14:30:05 +0300
Message-ID: <20260731113007.145322-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731113007.145322-1-clamor95@gmail.com>
References: <20260731113007.145322-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the basic hardware layout of SMSC (now Microchip)
EMC1402/1403/1404/1428 thermal sensors.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/hwmon/smsc,emc1403.yaml          | 203 ++++++++++++++++++
 1 file changed, 203 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/smsc,emc1403.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/smsc,emc1403.yaml b/Documentation/devicetree/bindings/hwmon/smsc,emc1403.yaml
new file mode 100644
index 0000000000000..d7873a37c3295
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/smsc,emc1403.yaml
@@ -0,0 +1,203 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/smsc,emc1403.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SMSC EMC1402/1403/1404/1428 thermal sensors
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - smsc,emc1402
+          - smsc,emc1403
+          - smsc,emc1404
+          - smsc,emc1428
+
+      - items:
+          - enum:
+              - smsc,emc1412
+              - smsc,emc1422
+              - smsc,emc1442
+          - const: smsc,emc1402
+
+      - items:
+          - enum:
+              - smsc,emc1413
+              - smsc,emc1423
+          - const: smsc,emc1403
+
+      - items:
+          - enum:
+              - smsc,emc1414
+              - smsc,emc1424
+          - const: smsc,emc1404
+
+      - items:
+          - enum:
+              - smsc,emc1438
+          - const: smsc,emc1428
+
+  interrupts:
+    items:
+      - description: Sensors "ALERT" pin output.
+
+  reg:
+    maxItems: 1
+
+  "#thermal-sensor-cells":
+    const: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  vdd-supply: true
+
+required:
+  - compatible
+  - reg
+
+patternProperties:
+  "^channel@([0-7])$":
+    type: object
+    description: Represents channels of the device and their specific configuration.
+
+    properties:
+      reg:
+        description: The channel number. 0 is local channel, 1-7 are remote channels.
+        items:
+          minimum: 0
+          maximum: 7
+
+      label:
+        description: A descriptive name for this channel, like "ambient" or "psu".
+
+    required:
+      - reg
+
+    additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - smsc,emc1402
+    then:
+      patternProperties:
+        "^channel@([0-7])$":
+          properties:
+            reg:
+              items:
+                maximum: 1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - smsc,emc1403
+    then:
+      patternProperties:
+        "^channel@([0-7])$":
+          properties:
+            reg:
+              items:
+                maximum: 2
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - smsc,emc1404
+    then:
+      patternProperties:
+        "^channel@([0-7])$":
+          properties:
+            reg:
+              items:
+                maximum: 3
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sensor@4c {
+            compatible = "smsc,emc1412", "smsc,emc1402";
+            reg = <0x4c>;
+
+            interrupt-parent = <&gpio>;
+            interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
+
+            vdd-supply = <&vdd_3v3_sys>;
+            #thermal-sensor-cells = <1>;
+        };
+    };
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sensor@29 {
+            compatible = "smsc,emc1428";
+            reg = <0x29>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            channel@0 {
+                reg = <0x0>;
+                label = "local";
+            };
+
+            channel@1 {
+                reg = <0x1>;
+                label = "chan1";
+            };
+
+            channel@2 {
+                reg = <0x2>;
+                label = "chan2";
+            };
+
+            channel@3 {
+                reg = <0x3>;
+                label = "chan3";
+            };
+
+            channel@4 {
+                reg = <0x4>;
+                label = "chan4";
+            };
+
+            channel@5 {
+                reg = <0x5>;
+                label = "chan5";
+            };
+
+            channel@6 {
+                reg = <0x6>;
+                label = "chan6";
+            };
+
+            channel@7 {
+                reg = <0x7>;
+                label = "chan7";
+            };
+        };
+    };
-- 
2.53.0

