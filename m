Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7ED47FB18
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 18:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787076003; cv=none; b=tJrgcS2vJb8ZtNoyQggv2sYFobc4e/i3/9OR7Dz9LwqR9NikQW8aB1g1fxi88fP9bvVtHDLSL7CU88c/cRhhKljq8wqzj+saoM6hmeEMzaEN0y83gz97uj/2QnfszmxLqAPqPf5wO/YEj2Mj8jvVoUcXiHAGBZEH6FiCkLvM2hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787076003; c=relaxed/simple;
	bh=XeGxqg1KAnPvmIFhlK5QldIE5Ykscd6BBFWDmaQWQPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FAi0A8Dymhw7oSNMmFxfFp7EJ/GPgmmm+b94Jkm9JqtejNO6O1CJph+wUump82j3HkBsug60v4iQ3gePvQyhD+2KbvVNTb94fUoYr1eKwP31F+5LeQfPvjo4gZ1sk1m8NgGPP7u9Yb1dnYAZThGsYcT68Eo5/4x+A/mlHI0KcaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IaQ6fZn/; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IaQ6fZn/"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c8612812170so9956a12.2
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 11:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787076002; x=1787680802; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v0/exJ+Q7VwMMtXoTnUV/4sCWGdOZUz6V55TWxRe1Q0=;
        b=IaQ6fZn/IFCfGGt/oEnm4lPpgzwYQATTxt0iOokWCnCjyPxgBAeXzC2oEKRCXW1d2h
         qAACPpui7ZbbKJ7O1zMnNgEhvbVrpDylD8hnyROghRv3Bsf30y6FbanD8nkEGx9gRp00
         1b9nZKz32wUWRwsMXu7egVheXzZ5HVNAZWxbvDoO1umsrujOYOtWCmKVl+JYtNcs7pWJ
         fxPQ4miI3VYrh7N9eCDMUlR03wEOqxyH97epO1akLQpMRBOwNkCkWh6jgkwSRWZH/wrO
         6NH7aEJwgJyMtr6yDPyL82qJTCtJhHWJbpk1QoFKxPyKDXyMvO141HMkUMXaY569qxFD
         V/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787076002; x=1787680802;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=v0/exJ+Q7VwMMtXoTnUV/4sCWGdOZUz6V55TWxRe1Q0=;
        b=YKBKoLM+BJZ0zolDGgox6VkcsXX1u7iQpUd61VIN9T/rdgwVRsceiaXX59TgDTmlq2
         T1YHtJZxEBvYr2OeMhOCzLFVnZbPk12MLP1CSsFicYFBIC+l/HUx48La+K6HL9x6vG+T
         appZoSASIJEVa+nL3GBMMi2DB0RQWtS/s5vOgqktZXBqT0FJmajcJD2myHe4ckIR4dNm
         eYm/hnyX98NGYR6+cAOwNod+RUdPPMzoWGDVHEsmSE8NAwbG9d572TbWMHxTirEP2R6C
         wNtTm0AnZW+1D1a6dcLu6bHyO5T+m6n623JBfV/P0wGc1U64EHQ6mWeiAHra3BrtTube
         SYbA==
X-Gm-Message-State: AOJu0YzqKCpJvjc/alO4OJWAKEr9A9pyZCbxSw4fSr5NxYu8BQXcutf9
	aV96vAfZizbzCLtO15FDFdFAxIdutquCceZc4YaEz6ErYP0aRohpczxWQebsXw==
X-Gm-Gg: AR+sD12y373WZTf6BR2P0T1QIQn6pGAjiorXFJYguMqAM/YRFy+sJP9VvKgXWdYqLr9
	p6xFRtYD8cPQgR0KNElCx1WwP351g7XJSATOoWupa4tCLBiniesvbF/vzJ5RiOMs4IBeGESwBXp
	4tPjA5pE7skqnp7TUJbPNYOdjbnpzzt1JyW2N6uuyNG/dSNOl3C2gBKvhnuhlqTWyjXGEX3e5PL
	lJ9RVtoohjYj93tHVR5qgoG19HSeMUgHwRgPN/fke9Ts8DREi2Of/1jSsOqwzYGwqZ7dfeI1eOa
	gK5WYUlElZzJEnQjoyZpwEWvASXK5ljceTgWXiNlA81g1qu1N0r24ro8blaa8YY6pUqUsXbeZ6K
	x074tnkOGK+tv4AEc0/00J+qEyzP3PYdLbcjFZoHm22ntJb6tazlWqG0R9pqWSRcpU+dork2FHX
	DjePEVrIH3+I4/7E24NP9fTWisGMbWdMpR8ZRyDQYkUvGst247F8Gc/qF1kNeJqcIqp3qvvwYTK
	3KA7RlTo7I=
X-Received: by 2002:a17:90b:35c4:b0:38e:91a8:fb85 with SMTP id 98e67ed59e1d1-3933b8c4c87mr26516529a91.3.1787076001569;
        Tue, 18 Aug 2026 11:00:01 -0700 (PDT)
Received: from [10.90.163.252] ([2409:40c2:5018:73b0:1ca9:66ac:f2de:44bc])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14152ea340csm17817135c88.0.2026.08.18.10.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 11:00:00 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 18 Aug 2026 23:29:51 +0530
Subject: [PATCH] dt-bindings: arm: ti,omap-mpu: Convert to DT schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-ti-mpu-v1-1-5b1c71a34669@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QpAMBTG8VfRubaykxivIhdsB0cZbUgt7264/
 NX/+wJ4ckwe6iSAo5M9rzZCpgnoqbMjCTbRgBkWmZJK7CyW7RCIKCszGCpzhBhvjga+vqOm/e2
 Pfia9v2u47we+t2l/agAAAA==
X-Change-ID: 20260818-ti-mpu-22219dfde742
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Benoit Cousson <b-cousson@ti.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787075995; l=4094;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=XeGxqg1KAnPvmIFhlK5QldIE5Ykscd6BBFWDmaQWQPc=;
 b=pK62g2fpBm3Hm6UuEU50s0mV8IelXT1tguuTCjsbX7XtGF7aRVF+Eyzfn7JqZOlojVa3PvIDk
 513nxpxDId/C0hObWWduEaNZ8ROGTHAUPoylwsgrCffI1pgVtW63wgi
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert TI OMAP Main Processor Unit MPU text to DT schema.

Changes from the original text binding during conversion:
- Mark ti,hwmods as deprecated, as it is longer needed.
- The pm-sram property name is kept as-is without a vendor prefix
  ti,pm-sram to maintain backward compatibility with older device trees
  and the existing pm33xx driver.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 Documentation/devicetree/bindings/arm/omap/mpu.txt | 54 --------------------
 .../devicetree/bindings/arm/ti/ti,omap-mpu.yaml    | 58 ++++++++++++++++++++++
 2 files changed, 58 insertions(+), 54 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/omap/mpu.txt b/Documentation/devicetree/bindings/arm/omap/mpu.txt
deleted file mode 100644
index e41490e6979c..000000000000
--- a/Documentation/devicetree/bindings/arm/omap/mpu.txt
+++ /dev/null
@@ -1,54 +0,0 @@
-* TI - MPU (Main Processor Unit) subsystem
-
-The MPU subsystem contain one or several ARM cores
-depending of the version.
-The MPU contain CPUs, GIC, L2 cache and a local PRCM.
-
-Required properties:
-- compatible : Should be "ti,omap3-mpu" for OMAP3
-               Should be "ti,omap4-mpu" for OMAP4
-	       Should be "ti,omap5-mpu" for OMAP5
-- ti,hwmods: "mpu"
-
-Optional properties:
-- sram:	Phandle to the ocmcram node
-
-am335x and am437x only:
-- pm-sram: Phandles to ocmcram nodes to be used for power management.
-	   First should be type 'protect-exec' for the driver to use to copy
-	   and run PM functions, second should be regular pool to be used for
-	   data region for code. See Documentation/devicetree/bindings/sram/sram.yaml
-	   for more details.
-
-Examples:
-
-- For an OMAP5 SMP system:
-
-mpu {
-    compatible = "ti,omap5-mpu";
-    ti,hwmods = "mpu"
-};
-
-- For an OMAP4 SMP system:
-
-mpu {
-    compatible = "ti,omap4-mpu";
-    ti,hwmods = "mpu";
-};
-
-
-- For an OMAP3 monocore system:
-
-mpu {
-    compatible = "ti,omap3-mpu";
-    ti,hwmods = "mpu";
-};
-
-- For an AM335x system:
-
-mpu {
-	compatible = "ti,omap3-mpu";
-	ti,hwmods = "mpu";
-	pm-sram = <&pm_sram_code
-		   &pm_sram_data>;
-};
diff --git a/Documentation/devicetree/bindings/arm/ti/ti,omap-mpu.yaml b/Documentation/devicetree/bindings/arm/ti/ti,omap-mpu.yaml
new file mode 100644
index 000000000000..abd8c64e8e9f
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/ti/ti,omap-mpu.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/ti/ti,omap-mpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI MPU (Main Processor Unit) subsystem
+
+maintainers:
+  - Benoit Cousson <b-cousson@ti.com>
+
+description:
+  The MPU subsystem contains one or several ARM cores depending on the version.
+  The MPU contains CPUs, GIC, L2 cache and a local PRCM.
+
+properties:
+  compatible:
+    enum:
+      - ti,omap3-mpu
+      - ti,omap4-mpu
+      - ti,omap5-mpu
+
+  ti,hwmods:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Name of the hwmod associated with the MPU
+    const: mpu
+    deprecated: true
+
+  sram:
+    description: ocmcram node
+
+  pm-sram:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: ocmcram nodes for power management. For am335x and am437x.
+    items:
+      - items:
+          - description: ocmcram node of type protect-exec for PM functions
+      - items:
+          - description: ocmcram node of regular pool to be used for data region
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    mpu {
+        compatible = "ti,omap5-mpu";
+        ti,hwmods = "mpu";
+    };
+
+  - |
+    mpu {
+        compatible = "ti,omap3-mpu";
+        ti,hwmods = "mpu";
+        pm-sram = <&pm_sram_code &pm_sram_data>;
+    };

---
base-commit: 0f23d56f17fdfc7db69d51f64c8b91bbab947aa9
change-id: 20260818-ti-mpu-22219dfde742

Best regards,
-- 
Bhargav

