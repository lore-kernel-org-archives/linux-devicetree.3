Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9DB3F2116
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 19:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787339471; cv=none; b=UQABz/fQmNkKI291oVbmlLkI0L6RqdI18wTiwcbMZyQQ1Wq9NrSiTXbS0AO8BZxNDrnMp9mov+N5qDdmYLxbTSBB7P/0mGp/b3C/jZBXXFl9mVcxovhHRRevSBZhoXK6Dq8kz3mLXou8F0uKdj7Z2KCZmPyDxwfpqpVbvTRt+ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787339471; c=relaxed/simple;
	bh=Wj2/FCxfgoN9pTIag9V5UOlHB5Ai0AHI8O/OfyqIkVk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RdX/JQc4JBGC44TQjRIaFVYZdUOQXVYumgeoIgH9y/1ZaVACCemjeYblmIfzc9e0L0teqx5BEm3F8f46rP1aMIYAGUvAbsy/Y75RwVAgKbrLAhhXdcjn9CbPiFktMcQxeN6qTu4BSHRID0SR0S8mWAJ1T0uFmJ/B70SOprxyOTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LaFOU5hY; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LaFOU5hY"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ccdce28edeso1828455ad.0
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 12:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787339450; x=1787944250; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rJfJ7UlhWP7ka12xQkmsBubht7Qjul5r1SRrCmaHXwc=;
        b=LaFOU5hY71ftCaTmhiwB5bj9n2Nak00wdycDKR/d+OqgsELglDK1RhXX4j7upKdDro
         CkGjGo0XeA1lxHXrJjSVJxU0ofiakUD5Q5R9gVej5h3TeoP7nBd4mVUdYv19JvJp6b9Z
         e+HoJbQJy+6O91wzmSj+5mH8+B38H2qd9LQnjsER+DoFJb996vqmamc1uKTJ+3zQCB23
         su4dimfz6Jnsql8HAZoG+pKY3YBL3cz1RGbMcAeRgFOJ8ihjZhVfjTo3p6gJqQLa2mYk
         QX/o1iLD4a7ZQ2L8hc9dbqJoyoyF/Iz1glAPgQboVh4/gvDANcPP59XS13/KeWO5fJPM
         mTWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787339450; x=1787944250;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rJfJ7UlhWP7ka12xQkmsBubht7Qjul5r1SRrCmaHXwc=;
        b=TLWwpQiHMMkg2zyWGJ0LLPwVwJ9MNeDPO0JzeG0DoJ0RCoNUbtjNsCa1L6r4aS2NP8
         nKVBkSAyG2SEYfGKyj2vwsl5YsvD3xWbwPI1qX37mxbA8jCixsxaYZLgaQN51SCxSGoK
         t8SCTn2kE4Kw0xjSEbUssiHYDH7cYSS/DlTQMAwEngtDmQIpdDyQklW/bVK7Dk5zrwNC
         jSSjjphhq9IELPI5YS3WuvpgwhTk4qOUKqh0MqvQPJrnFD9Z2Auvp/NtcHR8tCYoFmNH
         5Cte3V/7E9eaJsfyizSp3L3iSK56AkA9dnhdu8gn/FoxtqiA1QSuHuDFGqP/OdLNo+HP
         50TA==
X-Forwarded-Encrypted: i=1; AHgh+RpZzMKH/D5oG8TKfaMJDp/HNIEO4hoQFyJJywK+2vUq/2grWiLY1b++qCR9q1tgBunasIh7PmVCxLoc@vger.kernel.org
X-Gm-Message-State: AFuF++kJLAiOzqLjY9CcVqjgdm/bOBca4WgQLfXhfqvGrg+RnQ7ADbRn
	ihqThD5tVf/p88f1iG9gXkVKJo5jReBCm84JRevdNGr/C4BfUvF+e4EVFWJUxQ==
X-Gm-Gg: AR+sD11NIRNeeqNaIr598EDqG5zxvR9OBa4gVZIDuZQSt6RJyq2x+CqH4ixSp3jks7E
	T7Jhn32DfjEy7jtAJAzn5MAGtNg7D8+jvIYOBOXgt+eHVsUrcehJZ2UYx6TYoxfzdWU0zwfg48a
	0u5a3p6qh8rUrRWIXw/EK9GL038DxbX/kCijXKEIaSMYrJUsyaebiHcPwAUVuRm8PlOpSPEOZst
	9X6IyIgPXVLeWEB+0RT0NImFK836V3h8wQQH8Zxxs3bJUspPN0ORPaT3fgvd5cCizn6HXfdXKxu
	yGPVl1XuWR8b8TWv2yr6pnMepLeLsb+X9cPVyGLv16e8LkX1MB9ouLPbWLThiSPXiBmv6TwzRjS
	NUeU4dQUSadlgJbeUc5cfeGdkYxR5NdtRgyIO3tksJGpdrIAISRNHljLf7CLW/aMqBrHuZoTT7S
	IY9fiZNpbt0mypjsW8qc0VS+WTkoVhwvb+sWNlJ+w4jqwFWIYC/FOJpEqhXVVN33W7Rb+GtG5w
X-Received: by 2002:a17:902:e945:b0:2d5:cbd3:8eb1 with SMTP id d9443c01a7336-2d64b162c6dmr77580525ad.3.1787339450357;
        Fri, 21 Aug 2026 12:10:50 -0700 (PDT)
Received: from [10.90.163.252] ([2409:40c2:5400:571e:d71e:3d6b:f245:8387])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141860c6989sm278844c88.2.2026.08.21.12.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 12:10:49 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sat, 22 Aug 2026 00:40:28 +0530
Subject: [PATCH] regulator: dt-bindings: ti,tps6586x: Convert to DT schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260822-ti-tps6586x-v1-1-93cb46b32b27@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrDUxDfVzFbGgBmOBdEok4u6K5
 bd47wIhxyRQRRc4Olh4XQIwjsBO7TKS4j4YdKJNUmhUnpXfxGSFOVWXpZQjYom5hVBsjgY+v1v
 d/Ja9m8n6dwH3/QBJsbcHbwAAAA==
X-Change-ID: 20260821-ti-tps6586x-b54e7111917c
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@avionic-design.de>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787339440; l=11466;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=Wj2/FCxfgoN9pTIag9V5UOlHB5Ai0AHI8O/OfyqIkVk=;
 b=N2LNcGI5VzNqmsmYpop1swipglduY2GzaPvKsKVXz67oNvfQxA0Gx9n3QEQkXBl5nrZTiVAw2
 00dG2XK53LjDSI2acOPeZ5eNYiGs9gIyRQM3QEjNvLIliZjCfXQsg5q
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert Texas Instruments tps6586x regulator binding from text to DT
schema. Add child regulator node properties nvidia,tegra-cpu-regulator,
nvidia,tegra-core-regulator, and nvidia,tegra-rtc-regulator that were
missing in text binding but used in existing DTS.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/regulator/ti,tps6586x.yaml | 224 +++++++++++++++++++++
 .../devicetree/bindings/regulator/tps6586x.txt     | 135 -------------
 2 files changed, 224 insertions(+), 135 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/ti,tps6586x.yaml b/Documentation/devicetree/bindings/regulator/ti,tps6586x.yaml
new file mode 100644
index 000000000000..82c3a3c81120
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/ti,tps6586x.yaml
@@ -0,0 +1,224 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/ti,tps6586x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI TPS6586x family of regulators
+
+maintainers:
+  - Thierry Reding <thierry.reding@avionic-design.de>
+
+properties:
+  compatible:
+    const: ti,tps6586x
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
+
+  sys-supply:
+    description: The input supply for SYS.
+
+  ti,system-power-controller:
+    type: boolean
+    description:
+      Whether or not this PMIC is controlling the system power.
+
+  regulators:
+    type: object
+    additionalProperties: false
+    description:
+      list of regulators provided by this controller, LDO5 and LDO_RTC is
+      supplied by SYS regulator internally and driver take care of making
+      proper parent child relationship.
+
+    properties:
+      sys:
+        type: object
+        $ref: regulator.yaml#
+        unevaluatedProperties: false
+
+    patternProperties:
+      "^ldo([0-9]|_rtc)$":
+        type: object
+        $ref: regulator.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          nvidia,tegra-cpu-regulator:
+            type: boolean
+            description:
+              designates regulator as the "CPU domain" voltage regulator.
+
+          nvidia,tegra-core-regulator:
+            type: boolean
+            description:
+              designates regulator as the "Core domain" voltage regulator.
+
+          nvidia,tegra-rtc-regulator:
+            type: boolean
+            description:
+              designates regulator as the "RTC domain" voltage regulator.
+
+      "^sm[0-2]$":
+        type: object
+        $ref: regulator.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          nvidia,tegra-cpu-regulator:
+            type: boolean
+            description:
+              designates regulator as the "CPU domain" voltage regulator.
+
+          nvidia,tegra-core-regulator:
+            type: boolean
+            description:
+              designates regulator as the "Core domain" voltage regulator.
+
+          nvidia,tegra-rtc-regulator:
+            type: boolean
+            description:
+              designates regulator as the "RTC domain" voltage regulator.
+
+patternProperties:
+  "^vin-sm[0-2]-supply$":
+    description: The input supply for the corresponding SM (SM0, SM1, or SM2).
+
+  "^vinldo(01|23|4|678|9)-supply$":
+    description: The input supply for the corresponding LDO or group of LDOs.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - regulators
+  - "#gpio-cells"
+  - gpio-controller
+  - sys-supply
+  - vin-sm0-supply
+  - vin-sm1-supply
+  - vin-sm2-supply
+  - vinldo01-supply
+  - vinldo23-supply
+  - vinldo4-supply
+  - vinldo678-supply
+  - vinldo9-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      pmic@34 {
+          compatible = "ti,tps6586x";
+          reg = <0x34>;
+          interrupts = <0 88 0x4>;
+
+          #gpio-cells = <2>;
+          gpio-controller;
+
+          ti,system-power-controller;
+
+          sys-supply = <&vdd_5v0_sys>;
+          vin-sm0-supply = <&sys_reg>;
+          vin-sm1-supply = <&sys_reg>;
+          vin-sm2-supply = <&sys_reg>;
+          vinldo01-supply = <&sm2_reg>;
+          vinldo23-supply = <&sm2_reg>;
+          vinldo4-supply = <&sm2_reg>;
+          vinldo678-supply = <&sm2_reg>;
+          vinldo9-supply = <&sm2_reg>;
+
+          regulators {
+              sys {
+                  regulator-name = "vdd_sys";
+                  regulator-boot-on;
+                  regulator-always-on;
+              };
+
+              sm0 {
+                  regulator-min-microvolt = < 725000>;
+                  regulator-max-microvolt = <1500000>;
+                  regulator-boot-on;
+                  regulator-always-on;
+              };
+
+              sm1 {
+                  regulator-min-microvolt = < 725000>;
+                  regulator-max-microvolt = <1500000>;
+                  regulator-boot-on;
+                  regulator-always-on;
+              };
+
+              sm2 {
+                  regulator-min-microvolt = <3000000>;
+                  regulator-max-microvolt = <4550000>;
+                  regulator-boot-on;
+                  regulator-always-on;
+              };
+
+              ldo0 {
+                  regulator-name = "PCIE CLK";
+                  regulator-min-microvolt = <3300000>;
+                  regulator-max-microvolt = <3300000>;
+              };
+
+              ldo1 {
+                  regulator-min-microvolt = < 725000>;
+                  regulator-max-microvolt = <1500000>;
+              };
+
+              ldo2 {
+                  regulator-min-microvolt = < 725000>;
+                  regulator-max-microvolt = <1500000>;
+              };
+
+              ldo3 {
+                  regulator-min-microvolt = <1250000>;
+                  regulator-max-microvolt = <3300000>;
+              };
+
+              ldo4 {
+                  regulator-min-microvolt = <1700000>;
+                  regulator-max-microvolt = <2475000>;
+              };
+
+              ldo5 {
+                  regulator-min-microvolt = <1250000>;
+                  regulator-max-microvolt = <3300000>;
+              };
+
+              ldo6 {
+                  regulator-min-microvolt = <1250000>;
+                  regulator-max-microvolt = <3300000>;
+              };
+
+              ldo7 {
+                  regulator-min-microvolt = <1250000>;
+                  regulator-max-microvolt = <3300000>;
+              };
+
+              ldo8 {
+                  regulator-min-microvolt = <1250000>;
+                  regulator-max-microvolt = <3300000>;
+              };
+
+              ldo9 {
+                  regulator-min-microvolt = <1250000>;
+                  regulator-max-microvolt = <3300000>;
+              };
+          };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/regulator/tps6586x.txt b/Documentation/devicetree/bindings/regulator/tps6586x.txt
deleted file mode 100644
index 8b40cac24d93..000000000000
--- a/Documentation/devicetree/bindings/regulator/tps6586x.txt
+++ /dev/null
@@ -1,135 +0,0 @@
-TPS6586x family of regulators
-
-Required properties:
-- compatible: "ti,tps6586x"
-- reg: I2C slave address
-- interrupts: the interrupt outputs of the controller
-- #gpio-cells: number of cells to describe a GPIO
-- gpio-controller: mark the device as a GPIO controller
-- regulators: A node that houses a sub-node for each regulator within the
-  device. Each sub-node is identified using the node's name (or the deprecated
-  regulator-compatible property if present), with valid values listed below.
-  The content of each sub-node is defined by the standard binding for
-  regulators; see regulator.txt.
-  sys, sm[0-2], ldo[0-9] and ldo_rtc
-- sys-supply: The input supply for SYS.
-- vin-sm0-supply: The input supply for the SM0.
-- vin-sm1-supply: The input supply for the SM1.
-- vin-sm2-supply: The input supply for the SM2.
-- vinldo01-supply: The input supply for the LDO1 and LDO2
-- vinldo23-supply: The input supply for the LDO2 and LDO3
-- vinldo4-supply: The input supply for the LDO4
-- vinldo678-supply: The input supply for the LDO6, LDO7 and LDO8
-- vinldo9-supply: The input supply for the LDO9
-
-Optional properties:
-- ti,system-power-controller: Telling whether or not this pmic is controlling
-  the system power.
-
-Each regulator is defined using the standard binding for regulators.
-
-Note: LDO5 and LDO_RTC is supplied by SYS regulator internally and driver
-      take care of making proper parent child relationship.
-
-Example:
-
-	pmu: tps6586x@34 {
-		compatible = "ti,tps6586x";
-		reg = <0x34>;
-		interrupts = <0 88 0x4>;
-
-		#gpio-cells = <2>;
-		gpio-controller;
-
-		ti,system-power-controller;
-
-		sys-supply = <&some_reg>;
-		vin-sm0-supply = <&some_reg>;
-		vin-sm1-supply = <&some_reg>;
-		vin-sm2-supply = <&some_reg>;
-		vinldo01-supply = <...>;
-		vinldo23-supply = <...>;
-		vinldo4-supply = <...>;
-		vinldo678-supply = <...>;
-		vinldo9-supply = <...>;
-
-		regulators {
-			sys_reg: sys {
-				regulator-name = "vdd_sys";
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			sm0_reg: sm0 {
-				regulator-min-microvolt = < 725000>;
-				regulator-max-microvolt = <1500000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			sm1_reg: sm1 {
-				regulator-min-microvolt = < 725000>;
-				regulator-max-microvolt = <1500000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			sm2_reg: sm2 {
-				regulator-min-microvolt = <3000000>;
-				regulator-max-microvolt = <4550000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			ldo0_reg: ldo0 {
-				regulator-name = "PCIE CLK";
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3300000>;
-			};
-
-			ldo1_reg: ldo1 {
-				regulator-min-microvolt = < 725000>;
-				regulator-max-microvolt = <1500000>;
-			};
-
-			ldo2_reg: ldo2 {
-				regulator-min-microvolt = < 725000>;
-				regulator-max-microvolt = <1500000>;
-			};
-
-			ldo3_reg: ldo3 {
-				regulator-min-microvolt = <1250000>;
-				regulator-max-microvolt = <3300000>;
-			};
-
-			ldo4_reg: ldo4 {
-				regulator-min-microvolt = <1700000>;
-				regulator-max-microvolt = <2475000>;
-			};
-
-			ldo5_reg: ldo5 {
-				regulator-min-microvolt = <1250000>;
-				regulator-max-microvolt = <3300000>;
-			};
-
-			ldo6_reg: ldo6 {
-				regulator-min-microvolt = <1250000>;
-				regulator-max-microvolt = <3300000>;
-			};
-
-			ldo7_reg: ldo7 {
-				regulator-min-microvolt = <1250000>;
-				regulator-max-microvolt = <3300000>;
-			};
-
-			ldo8_reg: ldo8 {
-				regulator-min-microvolt = <1250000>;
-				regulator-max-microvolt = <3300000>;
-			};
-
-			ldo9_reg: ldo9 {
-				regulator-min-microvolt = <1250000>;
-				regulator-max-microvolt = <3300000>;
-			};
-		};
-	};

---
base-commit: 818bebeb63dd6bf5f4e07e145f6cdbace520a34c
change-id: 20260821-ti-tps6586x-b54e7111917c

Best regards,
-- 
Bhargav

