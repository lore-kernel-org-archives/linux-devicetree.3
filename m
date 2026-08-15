Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03B8345CCA
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 08:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786782594; cv=none; b=WhtQ4SXnp2r4ROsflKZeCc5B3AOmbZOWouAgqBOLJZvJusCug9cAJDIkLywnJ1uK/AevMmp8BpD7/x6FpJKHM///paEWYYjb/wDJrZ+nN0Cbpl8R/sRU5OMfvHCcnTWh3UvScgoiY6GO1dz/ZxkIOOAlUKEE7z0FLKJKRgyrS6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786782594; c=relaxed/simple;
	bh=0L7Ptkn6DjCvng8KPpxxipwT6NrUhFbrYnlc/sh3PXw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=smTJtGZ2xEws75K9oCvDpOibQsdz4VSWdgTep/0bocG+O/IGfWKTlYcUjPNaqC69u6gqeuhKkMg8yXBeY/kFiWAJr20goXwYzjc0n+/R1jePSX/QwrbpBXBf5Kg9kJPqOyKOGvHikN6qVwCkYKCxgfFa50e3lTo6YoVfBiu3qjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ee+S7BRO; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ee+S7BRO"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49545ba3d4eso8332225e9.3
        for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 01:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786782591; x=1787387391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KLjD1b9ODszXcIuBQvXK2FX3mAT/O94vXUE00JK2RDs=;
        b=Ee+S7BROiXeilDQcH6hAmTi/fqGignX0BHw82G2Vsl9ReY7J9rgj9qP0hGeD6Y8/pO
         ghXQ9PRsvHi4lu9iq+EoCn1I+ADWoFo9+bnHajml9VTYBlIfbwfJOKcVgIi/JgE78WzC
         5I+MTtONdfZTC/Th3pTag8yNxyDQv8M2G1gX3jDW6zcHgL0g6kM/7GpcjnemFdIat3k0
         C0rZcD5Cs1bw45+DV0NXRxFDqWWuOBgDuRKee+MQgL1oPnouTj41vg/V0oQbszQN73LF
         FU/B3H0s97HL/1DnAnneyw0UG2bbRyQDVeCQw/dKbh5iGusqsDzCpqxJSlMtHNYrOyZm
         /g2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786782591; x=1787387391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KLjD1b9ODszXcIuBQvXK2FX3mAT/O94vXUE00JK2RDs=;
        b=C109t6L1HFFF9GPQJD8RYFafjV9lwYXtbkBrI5g5B2mM/dP1EEXlne3IE1Q9tQJfZ8
         pVmYPTkf/2PBhfIXv5WHlve+4uY55BiP4UC1x/o1Md6S35vJEBRs8MA4UzTZAutGqJdR
         UGDIQnfYOVrz52CuEWrQXje+xpfWoMZoLJw215wr2tDKab9j3+G1m2ORqdIskf3odKsG
         Q5HnyKv8KjhLNwiswFB2XPr4YPkYH/WzjsGYByBI46xadsoxwmgpw8k5i9nH01GyRR1Q
         eRob3lPWg1d4+A3xCSUnxagM087WBWaXMshPBhkUy8qTC7btq5GCjlUg7at9r/S4ymPe
         3IyA==
X-Forwarded-Encrypted: i=1; AHgh+Rp8OZfs2j2fXkHFKLrvOxw6EnfuDIHKAekAsoA3ZU8wRcbg+t8cmX93QXmFtb0sIQk7NRia7vHYf7V6@vger.kernel.org
X-Gm-Message-State: AOJu0YyQYg2M9pXAWx+DhGfO81FlKC6fiv4zSiGww4tR64hkDJrCZi8z
	w6JSOTAUan+eJMX9oiuWf1SlYM2LjPBfo380918Es1pZbO2OkXLX06bq
X-Gm-Gg: AR+sD13xU+bQUupTC0MZfDFhKhRB+5gdvAQZpOj2EYUId+E790tBoN3GcChyt/IsPsT
	a+xhGBp2lalT9OHW4SrbhyIMHz5elrtWAk953/F+R81x9jte8Xve0K7AUE48LCsDZkZiywZyU/z
	UoNqc61nwtodycXNiaiJubTub9Xv7EkA2UMvLN9fsyghb4XBjuppKI0bmm3rQxs0dEFv53fit2H
	uhnIpk3DtNSz3Q+3RDQ4nGip5GfcOpGr+aWHnyixSmo1X2Mnzm9WBMZark0F1S2cL7R+eaKw6jH
	tb/9QsLOQgTXk/2k20RIr2fMVpA+YugD4g9D3IragR0RxbwQuVgg8+WOIMR15FJp9eNYYY7zfW9
	+tjMn4ivAAw6Ll4RQjRBMD6Pb2C/U4FkAMT/Sp0paI1tfUZ7dlhHgmyjJuvlwXv37o4Sss033Hq
	pdcE2MbNjzXyaJux8RKxNYYKemLOsEDRXwfJOrYfrEDpNjEOGLJcLZ5WpNXF4K0cCzOngHLmzIu
	mD9KpT6+uf23KP2MU7CeQFX54H4hAA=
X-Received: by 2002:a05:600c:3788:b0:493:e365:7630 with SMTP id 5b1f17b1804b1-4998798b5afmr114011975e9.14.1786782590880;
        Sat, 15 Aug 2026 01:29:50 -0700 (PDT)
Received: from localhost.localdomain ([82.137.32.242])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-499899c138dsm99617695e9.8.2026.08.15.01.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 01:29:50 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Eduard Bostina <egbostina@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	goledhruva@gmail.com,
	m-chawdhry@ti.com
Subject: [PATCH] dt-bindings: regulator: Convert TPS65023 to DT schema
Date: Sat, 15 Aug 2026 08:29:13 +0000
Message-ID: <20260815082913.2144978-1-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Texas Instruments TPS65023 family of PMICs bindings
to DT schema.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
 .../bindings/regulator/ti,tps65023.yaml       | 90 +++++++++++++++++++
 .../bindings/regulator/tps65023.txt           | 60 -------------
 2 files changed, 90 insertions(+), 60 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/ti,tps65023.yaml
 delete mode 100644 Documentation/devicetree/bindings/regulator/tps65023.txt

diff --git a/Documentation/devicetree/bindings/regulator/ti,tps65023.yaml b/Documentation/devicetree/bindings/regulator/ti,tps65023.yaml
new file mode 100644
index 000000000000..928698595f52
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/ti,tps65023.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/ti,tps65023.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments TPS65023 Regulator
+
+maintainers:
+  - Eduard Bostina <egbostina@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - ti,tps65020
+      - ti,tps65021
+      - ti,tps65023
+
+  reg:
+    maxItems: 1
+
+  regulators:
+    type: object
+    description: >
+      List of child nodes that specify the regulator initialization data.
+      Must be named after their hardware counterparts: VDCDC[1-3] and LDO[1-2].
+
+    patternProperties:
+      "^(VDCDC[1-3]|LDO[1-2])$":
+        type: object
+        $ref: regulator.yaml#
+        unevaluatedProperties: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - regulators
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        tps65023@48 {
+            compatible = "ti,tps65023";
+            reg = <0x48>;
+
+            regulators {
+                VDCDC1 {
+                    regulator-name = "vdd_mpu";
+                    regulator-always-on;
+                    regulator-min-microvolt = <1200000>;
+                    regulator-max-microvolt = <1200000>;
+                };
+
+                VDCDC2 {
+                    regulator-name = "vdd_core";
+                    regulator-always-on;
+                    regulator-min-microvolt = <3300000>;
+                    regulator-max-microvolt = <3300000>;
+                };
+
+                VDCDC3 {
+                    regulator-name = "vdd_io";
+                    regulator-always-on;
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+                };
+
+                LDO1 {
+                    regulator-name = "vdd_usb18";
+                    regulator-always-on;
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+                };
+
+                LDO2 {
+                    regulator-name = "vdd_usb33";
+                    regulator-always-on;
+                    regulator-min-microvolt = <3300000>;
+                    regulator-max-microvolt = <3300000>;
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/regulator/tps65023.txt b/Documentation/devicetree/bindings/regulator/tps65023.txt
deleted file mode 100644
index a4714e4da370..000000000000
--- a/Documentation/devicetree/bindings/regulator/tps65023.txt
+++ /dev/null
@@ -1,60 +0,0 @@
-TPS65023 family of regulators
-
-Required properties:
-- compatible: Must be one of the following.
-	"ti,tps65020",
-	"ti,tps65021",
-	"ti,tps65023",
-- reg: I2C slave address
-- regulators: list of regulators provided by this controller, must be named
-  after their hardware counterparts: VDCDC[1-3] and LDO[1-2]
-- regulators: This is the list of child nodes that specify the regulator
-  initialization data for defined regulators. The definition for each of
-  these nodes is defined using the standard binding for regulators found at
-  Documentation/devicetree/bindings/regulator/regulator.txt.
-
-Each regulator is defined using the standard binding for regulators.
-
-Example:
-
-	tps65023@48 {
-		compatible = "ti,tps65023";
-		reg = <0x48>;
-
-		regulators {
-			VDCDC1 {
-				regulator-name = "vdd_mpu";
-				regulator-always-on;
-				regulator-min-microvolt = <1200000>;
-				regulator-max-microvolt = <1200000>;
-			};
-
-			VDCDC2 {
-				regulator-name = "vdd_core";
-				regulator-always-on;
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3300000>;
-			};
-
-			VDCDC3 {
-				regulator-name = "vdd_io";
-				regulator-always-on;
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-			};
-
-			LDO1 {
-				regulator-name = "vdd_usb18";
-				regulator-always-on;
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-			};
-
-			LDO2 {
-				regulator-name = "vdd_usb33";
-				regulator-always-on;
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3300000>;
-			};
-		};
-	};
-- 
2.43.0

