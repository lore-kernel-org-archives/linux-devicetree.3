Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A3121883E
	for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 16:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787414860; cv=none; b=GgQHf9CYGbBulh7kYfoAoDWuf/0LfAFDxMORj60ckuOAcKKnF4O7VNrxagQRCCkdU1Ix3RYoehz09NQlcxyCMQfnnRdrhcU6OeSH/E4piJ+o1677xJYYkjY/0DH7MCsjOKuMxBOaTMiYOo2nFZbY5JPSkta2EJIaF5Dco35tSE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787414860; c=relaxed/simple;
	bh=s6O2x/eC+NOZqyHL+Xd7ROqDWLPHvBoGinkXru35GAc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dlBgna0xzwRbp11p1n1yPBzYugXXwaFs0LmPnUuVMFsQW7dVXTL0J9qU2qXOsIBM7mRJ3I0ePzPLSch5cHXq4wPViJCdE8Rr6Wp2MB5Nz/Q5k1kemTVNhtCrxj0M6GheMBIK6u9p8n5RGGHAPmCgCEMxM5+0bKEFP03GMgDci6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HhgNDwsQ; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HhgNDwsQ"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cf49dc28ccso3137575ad.0
        for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 09:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787414858; x=1788019658; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nyImAQCmyteLy202B7A85k+wjImpdbzuGy2w8QqPHx4=;
        b=HhgNDwsQ9JyF8UwyYT9799LJnGDG1/IThkPMFy6sQl5bhFEfaKvVcca+SAz4yffPed
         F5WwRRCV8u7tT6kGVs1SxV4pwETEJbC3I9jz3LR02c/tjxwYXsAYq8SYBZySoigM2lXO
         Ow4VWUjZJrr5vIr0PjJtOFQQ5Avtkvwcczzs/4sTsnNEtamTPs9ifAzEKNxj0KKuGajB
         t27dlXZWQyvtqyWZSJXV6F1ngQfh74YrLDLRCtR4Rcsj4gt2yIphoR+/qhjciFmDYBq9
         GLRvxypc61xPpvULw9o2Mbe2cdTFDaU+tFSJYJRsv+BlbfRlhALv5Wf5Sh1Ga0mY4Hlo
         pB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787414858; x=1788019658;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nyImAQCmyteLy202B7A85k+wjImpdbzuGy2w8QqPHx4=;
        b=DnwoKIA44HSmg125svFozJhw3n1sxD9duMDJQHVlHyCZI/Cd592cORLpLtPRGQCSvG
         /lpsvvdhjAsSadGzUUKPeQdtXFukrI6nebZVXHqwEv1WH9HCsGqmaHRT4k38RX3LI4gZ
         q9OkeABMqf5+pEdRQbXXF+GIneOfYhpsDYLc7mkoZi1E1Dynsfeo9GLyieB9b2w97Uxj
         tROxGGuZue0AiMrlikGlFzqz8sfcUizXKwjrnvYNNhE4G75YH+XzaZOieED5Sz4Rc6I4
         R/aIFtGFMtfYL0Yp0s9rguso6iZo955nhUZ0l4mhJblXWfImsELClAkPV0l2Kizu2yaB
         5LZQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqbe7PosZPZVKjskaECXSi6OQe56J8hFVoc/xU+iI8fskrcja4Imze9QDeV13cla0cJC9a9S0B2hq4G@vger.kernel.org
X-Gm-Message-State: AFuF++m+xDJ135pmtDYU7YzJbm9goUZvaPJ5WQ3Z4d68/nq2N0aGPjyS
	Gu3qx/4tmTSs029aTPCf91uEB0XzbNcb7yYLh3n5hWrKZRYILJsZmPwK
X-Gm-Gg: AR+sD136mLfg7KoNBEDiPNCxkGhqDc+NIYkoJfc4753542lxcWB3bLdmexG/GUFe0kW
	8V5NvTB0+Hsb+McRW2xoo+JZ6ORghfDCRV9ZXt91hRdYeg0Z47+8mzujxzvG80tvEDLIlc26xQL
	DdQkXiE47AIASpiYfW7hG39wAB+60QESufM4aDz+Px26v1ZfnmFv7ydL1yLh9XTOv2LehxQhKPT
	RnmDmaPYEzrmGls7XZViTlMa8HcP1PLP/G8hJX4EaYyL2Z7ajRtV3+iK4v5s1u2dcv7a1FPwHzx
	lOATRIBw5np8MoC7c0kTCyc0ZeiqHvwFLrSJ1DcH6yfrnsvNRsHaB8GqBx8Bo4VqFa5faLWZ7/p
	+v5hxHB5bc8fYsDkXOdwOxnSJyj7wW/5exr+fo256KaCcEcOLtHw+mw2Hz5xDpROVK/0JS+MeU9
	E95fVHt7DZqYemN1bFhvT6+D7xQy6yFAVcU5Yi9E7+4i1YRXTsXitKjgZSirBe1O4simn617jrU
	VeuczfDlfM=
X-Received: by 2002:a17:90b:1b03:b0:38f:aa76:88b with SMTP id 98e67ed59e1d1-395c35d68demr11157102a91.4.1787414858091;
        Sat, 22 Aug 2026 09:07:38 -0700 (PDT)
Received: from [10.66.141.252] ([2409:40c2:5436:fa17:e408:579e:d06b:ea4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1418617378bsm8358266c88.11.2026.08.22.09.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 09:07:36 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sat, 22 Aug 2026 21:37:24 +0530
Subject: [PATCH] regulator: dt-bindings: ti,lp872x: Convert to DT schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260822-ti-lp872x-v1-1-0ae11357eafc@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCyMj3ZJM3ZwCC3OjCt1ECwuTpNTEFMskgxQloPqCotS0zAqwWdGxtbU
 ApSjDvFsAAAA=
X-Change-ID: 20260822-ti-lp872x-a884bead9b0d
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Milo Kim <milo.kim@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787414849; l=11219;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=s6O2x/eC+NOZqyHL+Xd7ROqDWLPHvBoGinkXru35GAc=;
 b=47ir0pscUFqUgmWFQAosjbkBV9AKnuZbothRRpGkllQp81mNMYT+WOwBMGtdmQ6AenH0FK3jR
 TEIY5Y/9ImDBoInL5XafBa1mAYPKsYbagSU3ooXSaMhxxRkx/jbJMH6
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the TI/National Semiconductor LP8720/LP8725 PMIC text binding
to standard DT schema. No functional changes.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/regulator/lp872x.txt       | 161 ------------------
 .../devicetree/bindings/regulator/ti,lp872x.yaml   | 186 +++++++++++++++++++++
 2 files changed, 186 insertions(+), 161 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/lp872x.txt b/Documentation/devicetree/bindings/regulator/lp872x.txt
deleted file mode 100644
index ab895cd1cac1..000000000000
--- a/Documentation/devicetree/bindings/regulator/lp872x.txt
+++ /dev/null
@@ -1,161 +0,0 @@
-Binding for TI/National Semiconductor LP872x Driver
-
-Required properties:
-  - compatible: "ti,lp8720" or "ti,lp8725"
-  - reg: I2C slave address. 0x7d = LP8720, 0x7a = LP8725
-
-Optional properties:
-  - ti,general-config: the value of LP872X_GENERAL_CFG register (u8)
-    (LP8720)
-    bit[2]: BUCK output voltage control by external DVS pin or register
-            1 = external pin, 0 = bit7 of register 08h
-    bit[1]: sleep control by external DVS pin or register
-            1 = external pin, 0 = bit6 of register 08h
-    bit[0]: time step unit(usec). 1 = 25, 0 = 50
-
-    (LP8725)
-    bit[7:6]: time step unit(usec). 00 = 32, 01 = 64, 10 = 128, 11 = 256
-    bit[4]:   BUCK2 enable control. 1 = enable, 0 = disable
-    bit[3]:   BUCK2 output voltage register address. 1 = 0Ah, 0 = 0Bh
-    bit[2]:   BUCK1 output voltage control by external DVS pin or register
-              1 = register 08h, 0 = DVS
-    bit[1]:   LDO sleep control. 1 = sleep mode, 0 = normal
-    bit[0]:   BUCK1 enable control, 1 = enable, 0 = disable
-
-    For more details, please see the datasheet.
-
-  - ti,update-config: define it when LP872X_GENERAL_CFG register should be set
-  - ti,dvs-gpio: GPIO specifier for external DVS pin control of LP872x devices.
-  - ti,dvs-vsel: DVS selector. 0 = SEL_V1, 1 = SEL_V2.
-  - ti,dvs-state: initial DVS pin state. 0 = DVS_LOW, 1 = DVS_HIGH.
-  - enable-gpios: GPIO specifier for EN pin control of LP872x devices.
-
-  Sub nodes for regulator_init_data
-    LP8720 has maximum 6 nodes. (child name: ldo1 ~ 5 and buck)
-    LP8725 has maximum 9 nodes. (child name: ldo1 ~ 5, lilo1,2 and buck1,2)
-    For more details, please see the following binding document.
-    (Documentation/devicetree/bindings/regulator/regulator.txt)
-
-Datasheet
-  - LP8720: https://www.ti.com/lit/ds/symlink/lp8720.pdf
-  - LP8725: https://www.ti.com/lit/ds/symlink/lp8725.pdf
-
-Example 1) LP8720
-
-lp8720@7d {
-	compatible = "ti,lp8720";
-	reg = <0x7d>;
-
-	/* external DVS pin used, timestep is 25usec */
-	ti,general-config = /bits/ 8 <0x03>;
-	ti,update-config;
-
-	/*
-	 * The dvs-gpio depends on the processor environment.
-	 * For example, following GPIO specifier means GPIO134 in OMAP4.
-	 */
-	ti,dvs-gpio = <&gpio5 6 0>;
-	ti,dvs-vsel = /bits/ 8 <1>;		/* SEL_V2 */
-	ti,dvs-state = /bits/ 8 <1>;		/* DVS_HIGH */
-
-	vaf: ldo1 {
-		regulator-min-microvolt = <1200000>;
-		regulator-max-microvolt = <3300000>;
-	};
-
-	vmmc: ldo2 {
-		regulator-min-microvolt = <1200000>;
-		regulator-max-microvolt = <3300000>;
-	};
-
-	vcam_io: ldo3 {
-		regulator-min-microvolt = <1200000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-boot-on;
-	};
-
-	vcam_core: ldo4 {
-		regulator-min-microvolt = <800000>;
-		regulator-max-microvolt = <2850000>;
-		regulator-boot-on;
-	};
-
-	vcam: ldo5 {
-		regulator-min-microvolt = <1200000>;
-		regulator-max-microvolt = <3300000>;
-	};
-
-	vcc: buck {
-		regulator-name = "VBUCK";
-		regulator-min-microvolt = <800000>;
-		regulator-max-microvolt = <2300000>;
-	};
-};
-
-Example 2) LP8725
-
-lp8725@7a {
-	compatible = "ti,lp8725";
-	reg = <0x7a>;
-
-	/* Enable BUCK1,2, no DVS, normal LDO mode, timestep is 256usec */
-	ti,general-config = /bits/ 8 <0xdd>;
-	ti,update-config;
-
-	vcam_io: ldo1 {
-		regulator-min-microvolt = <1200000>;
-		regulator-max-microvolt = <3300000>;
-	};
-
-	vcam_core: ldo2 {
-		regulator-min-microvolt = <1200000>;
-		regulator-max-microvolt = <3300000>;
-	};
-
-	vcam: ldo3 {
-		regulator-min-microvolt = <1200000>;
-		regulator-max-microvolt = <3300000>;
-	};
-
-	vcmmb_io: ldo4 {
-		regulator-min-microvolt = <1200000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-boot-on;
-	};
-
-	vcmmb_core: ldo5 {
-		regulator-min-microvolt = <1200000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-boot-on;
-	};
-
-	vaux1: lilo1 {
-		regulator-name = "VAUX1";
-		regulator-min-microvolt = <800000>;
-		regulator-max-microvolt = <3300000>;
-	};
-
-	vaux2: lilo2 {
-		regulator-name = "VAUX2";
-		regulator-min-microvolt = <800000>;
-		regulator-max-microvolt = <3300000>;
-	};
-
-	vcc1: buck1 {
-		regulator-name = "VBUCK1";
-		regulator-min-microvolt = <800000>;
-		regulator-max-microvolt = <3000000>;
-		regulator-min-microamp  = <460000>;
-		regulator-max-microamp  = <1370000>;
-		regulator-boot-on;
-	};
-
-	vcc2: buck2 {
-		regulator-name = "VBUCK2";
-		regulator-min-microvolt = <800000>;
-		regulator-max-microvolt = <3000000>;
-		regulator-min-microamp  = <460000>;
-		regulator-max-microamp  = <1370000>;
-		regulator-boot-on;
-	};
-};
diff --git a/Documentation/devicetree/bindings/regulator/ti,lp872x.yaml b/Documentation/devicetree/bindings/regulator/ti,lp872x.yaml
new file mode 100644
index 000000000000..8e74dbb3ae30
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/ti,lp872x.yaml
@@ -0,0 +1,186 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/ti,lp872x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI/National Semiconductor LP872x
+
+maintainers:
+  - Milo Kim <milo.kim@ti.com>
+
+description:
+  See Datasheet
+  LP8720 https://www.ti.com/lit/ds/symlink/lp8720.pdf
+  LP8725 https://www.ti.com/lit/ds/symlink/lp8725.pdf
+
+properties:
+  compatible:
+    enum:
+      - ti,lp8720
+      - ti,lp8725
+
+  reg:
+    enum: [0x7a, 0x7d]
+
+  ti,general-config:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description: |
+      the value of LP872X_GENERAL_CFG register (u8)
+      (LP8720)
+      bit[2]: BUCK output voltage control by external DVS pin or register
+              1 = external pin, 0 = bit7 of register 08h
+      bit[1]: sleep control by external DVS pin or register
+              1 = external pin, 0 = bit6 of register 08h
+      bit[0]: time step unit(usec). 1 = 25, 0 = 50
+
+      (LP8725)
+      bit[7:6]: time step unit(usec). 00 = 32, 01 = 64, 10 = 128, 11 = 256
+      bit[4]:   BUCK2 enable control. 1 = enable, 0 = disable
+      bit[3]:   BUCK2 output voltage register address. 1 = 0Ah, 0 = 0Bh
+      bit[2]:   BUCK1 output voltage control by external DVS pin or register
+                1 = register 08h, 0 = DVS
+      bit[1]:   LDO sleep control. 1 = sleep mode, 0 = normal
+      bit[0]:   BUCK1 enable control, 1 = enable, 0 = disable
+
+      For more details, please see the datasheet.
+
+  ti,update-config:
+    type: boolean
+    description: define it when LP872X_GENERAL_CFG register should be set
+
+  ti,dvs-gpio:
+    maxItems: 1
+    description: GPIO specifier for external DVS pin control of LP872x devices.
+
+  ti,dvs-vsel:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    enum: [0, 1]
+    description: DVS selector. 0 = SEL_V1, 1 = SEL_V2.
+
+  ti,dvs-state:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    enum: [0, 1]
+    description: initial DVS pin state. 0 = DVS_LOW, 1 = DVS_HIGH.
+
+  enable-gpios:
+    maxItems: 1
+    description: GPIO specifier for EN pin control of LP872x devices.
+
+  buck:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Single BUCK regulator for LP8720.
+
+patternProperties:
+  "^(buck[1-2]?|ldo[1-5]|lilo[1-2])$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,lp8720
+    then:
+      properties:
+        reg:
+          const: 0x7d
+      patternProperties:
+        "^(buck[1-2]|lilo[1-2])$": false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,lp8725
+    then:
+      properties:
+        reg:
+          const: 0x7a
+        buck: false
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
+        pmic@7a {
+            compatible = "ti,lp8725";
+            reg = <0x7a>;
+
+            /* Enable BUCK1,2, no DVS, normal LDO mode, timestep is 256usec */
+            ti,general-config = /bits/ 8 <0xdd>;
+            ti,update-config;
+
+            ldo1 {
+                regulator-min-microvolt = <1200000>;
+                regulator-max-microvolt = <3300000>;
+            };
+
+            ldo2 {
+                regulator-min-microvolt = <1200000>;
+                regulator-max-microvolt = <3300000>;
+            };
+
+            ldo3 {
+                regulator-min-microvolt = <1200000>;
+                regulator-max-microvolt = <3300000>;
+            };
+
+            ldo4 {
+                regulator-min-microvolt = <1200000>;
+                regulator-max-microvolt = <3300000>;
+                regulator-boot-on;
+            };
+
+            ldo5 {
+                regulator-min-microvolt = <1200000>;
+                regulator-max-microvolt = <3300000>;
+                regulator-boot-on;
+            };
+
+            lilo1 {
+                regulator-name = "VAUX1";
+                regulator-min-microvolt = <800000>;
+                regulator-max-microvolt = <3300000>;
+            };
+
+            lilo2 {
+                regulator-name = "VAUX2";
+                regulator-min-microvolt = <800000>;
+                regulator-max-microvolt = <3300000>;
+            };
+
+            buck1 {
+                regulator-name = "VBUCK1";
+                regulator-min-microvolt = <800000>;
+                regulator-max-microvolt = <3000000>;
+                regulator-min-microamp  = <460000>;
+                regulator-max-microamp  = <1370000>;
+                regulator-boot-on;
+            };
+
+            buck2 {
+                regulator-name = "VBUCK2";
+                regulator-min-microvolt = <800000>;
+                regulator-max-microvolt = <3000000>;
+                regulator-min-microamp  = <460000>;
+                regulator-max-microamp  = <1370000>;
+                regulator-boot-on;
+            };
+        };
+    };

---
base-commit: 818bebeb63dd6bf5f4e07e145f6cdbace520a34c
change-id: 20260822-ti-lp872x-a884bead9b0d

Best regards,
--  
Bhargav

