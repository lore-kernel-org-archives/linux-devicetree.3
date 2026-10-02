Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B863E51D4
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 18:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790967567; cv=none; b=ppig7pAa0Mbv9z1xJf1YXgzM4YASWprhE+EOM5i5ElscFg5fJQpPwXBEJwrW8tMDnUQbUQgpByuvm88kuclIK4thdASRd/ISz6t2qDzbYdwActY+XoHOjMc7PkkEQq5pb4A1zLbx11c+1vM4AV5TAbRBeZ8ORQGaXmuuERN420k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790967567; c=relaxed/simple;
	bh=WBDPScDo4+RNDk/RRkpVRacm/yzNLhSod/42Y3PXVXo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fsWL4h4jo4byQj3KtMjyemaIxNV2L+PFpKr96pR/zp69FvOnVK5F2uTzwLIaVAYA8MuPgYGjUl0iNv3ERt07IJGFqAYiwxWlPfUh8aAnyCvs6FNOzc3qwFHw16e3W9mt6A1ZO/svd6QQF+ZXWZcn+z0WQw2v6fxc8cfgjcAc1cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O/ZbVNWk; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O/ZbVNWk"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e4e75342aso647689eec.1
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 11:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790967564; x=1791572364; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Qqh3sFD4R9XPIqgyNgj/hFYYBYMoRi0+BfMPD24LCdQ=;
        b=O/ZbVNWkC32jSVyp42twvNNbkrary3OgnXCTAXlSAqOiuO/sTmvLFUunYpk9T1AA/h
         TK3Qj5AF4d0+uh+kp6puyUqH2lGYgn2K66nPelVQRSKYYUrWBFGyFNtwZxcyJdNazCyZ
         1FHqYj9paKFDm7sJ6+KEz3IdeeaOA7MLvyKeGorciXcJiVrDU1uKevUl8ZpxTK47XVz1
         L4MhFVos/fq3A48ecWuDgVQX0e4hGUZEIb7JGTne58wwfx3D2sA4e7WkywvQVVm32Bw6
         wrgHSK89xT8EXBxxPGOotmeWD6gNRy92dHIrU/wly8/idFfro7HfZu53NAlCIk/1rRgp
         5dPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790967564; x=1791572364;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Qqh3sFD4R9XPIqgyNgj/hFYYBYMoRi0+BfMPD24LCdQ=;
        b=b9wYpISKhS3iu/wzJ2eCxG0XJq91RmwKE3wWAwzFYusqa8fEpBgqnzQIiB6Wc6DhS5
         11FJPRYcfkQLAssRn7/89ovOCdoOhyB1BqSsR4VhCtG0dkLE4ffKQgot4CRLsCw3IQ4W
         4g6kqDzJP0appGcZdd8f6UiLeRoztkF0kc2Uu7Ie/sGrav2E9Qs7yUbKYDGXQG86zthr
         89LakQSKqGEZnLhv6AqDgqPnJ3xYO2ARCz53Fhj5ZavDnUvOmB5SKHcaDMomE1e7o21O
         2BbnIJVQH8bfZMEVtux/e4Hn9SwAzCnHwInC6U6haLK+Eig6fE9pCC1mN8MnK/XSvXyU
         vUDg==
X-Gm-Message-State: AFuF++mAVRbvzt5hOUmLsooVrgwOQFLUiCOPAOZWbTWbzT6vF0t6u0nn
	OU7tI7o655Vnruen+OTfr0V3E8U0VGqMArOUWrxKs+4E0QxyPlCyZJV+
X-Gm-Gg: AYBFou0lGDbQeJQu+gqCpHVVOp9SJP4r+SOKhjWLv/9d3TdSBq3vhx72fzJhlX+UKc3
	E+DYGCWDGVcAcRFfnQCtDe5N9ESELX9t2mtSYsPNaEG2ieGKxP5TkGFBHQfmuVSWXb3oxqvXSLG
	RNXjnQ+PaMcV0HTZMWrqgRRqxJEHjLV2X7gmWrusUanRmnmpijzARHgq+FFugUd76hASkufynUr
	jPg/UwlUpia6dFAbKAhQQfdFNVVOPvymnP/U5XHHadCXKvc98VXU98fZPMIGEwOm3m52RL7kwtl
	J8Cab6HRnZWA5MfVQuqm/3tSSf3CLKnTIeVeA0oIx4uQeTXTNuJWBGu3FGLKCAx+lOXzfV7zFdQ
	U/DIZOM/RkStp/KY2x8Xd/N++wv6j5K/WAiHXv021HK7RRFDqE6CN6oifwFnscasHQC9N+Tpe8Y
	EKWXFXOnx6IIjyX+ymIoe7FplBS0zZZZ0az0xme3DNLpCVfef5oL6/tmXclNfGo1r2lACOXfSzu
	uJJAoJSCA==
X-Received: by 2002:a05:7022:b047:20b0:14b:edb2:c3bc with SMTP id a92af1059eb24-14f5625d203mr6419236c88.0.1790967564155;
        Fri, 02 Oct 2026 11:59:24 -0700 (PDT)
Received: from [10.211.86.252] ([2409:40c2:505a:e8d2:3478:3f80:375e:1a75])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f45fedd43sm14694892c88.4.2026.10.02.11.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 11:59:23 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sat, 03 Oct 2026 00:28:32 +0530
Subject: [PATCH] dt-bindings: arm: omap-l3-noc: Convert to DT schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-ti-l3-noc-v1-1-9bd18cac33e9@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAwMj3ZJM3Rxj3bz8ZF0ji5S05EQLw7SUZFMloPqCotS0zAqwWdGxEH5
 xaVJWanIJyACl2loA//dD920AAAA=
X-Change-ID: 20261002-ti-l3-noc-28dfca81fdc5
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Santosh Shilimkar <santosh.shilimkar@ti.com>, 
 Sricharan R <r.sricharan@ti.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790967554; l=5574;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=WBDPScDo4+RNDk/RRkpVRacm/yzNLhSod/42Y3PXVXo=;
 b=VVurPjBfSSKglna/F0fvrr7HCvE8ydkleoSEqxxQpGyDJzXtw8nUEAlGmJmodbIidhbd9juF1
 ovkbZLnr5h4Bv+oyl6K0Zr8BRiuEik8RcDA/1ngXudumSkyqNsvPxjJ
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert TI L3 NoC binding from text to DT schema format. Older OMAP3
uses the SMX variant which also acts as a bus parent with simple-bus
compatible so child nodes are allowed using patternproperties. Mark
ti,hwmods deprecated as it is no longer needed and only used by older
omap3-l3-smx.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/arm/omap/l3-noc.txt        |  23 ----
 .../bindings/arm/omap/ti,omap-l3-noc.yaml          | 149 +++++++++++++++++++++
 2 files changed, 149 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/omap/l3-noc.txt b/Documentation/devicetree/bindings/arm/omap/l3-noc.txt
deleted file mode 100644
index 161448da959d2..0000000000000
--- a/Documentation/devicetree/bindings/arm/omap/l3-noc.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-* TI - L3 Network On Chip (NoC)
-
-This version is an implementation of the generic NoC IP
-provided by Arteris.
-
-Required properties:
-- compatible : Should be "ti,omap3-l3-smx" for OMAP3 family
-               Should be "ti,omap4-l3-noc" for OMAP4 family
-               Should be "ti,omap5-l3-noc" for OMAP5 family
-	       Should be "ti,dra7-l3-noc" for DRA7 family
-               Should be "ti,am4372-l3-noc" for AM43 family
-- reg:	Contains L3 register address range for each noc domain.
-- ti,hwmods: "l3_main_1", ... One hwmod for each noc domain.
-
-Examples:
-
-ocp {
-	compatible = "ti,omap4-l3-noc", "simple-bus";
-	#address-cells = <1>;
-	#size-cells = <1>;
-	ranges;
-	ti,hwmods = "l3_main_1", "l3_main_2", "l3_main_3";
-};
diff --git a/Documentation/devicetree/bindings/arm/omap/ti,omap-l3-noc.yaml b/Documentation/devicetree/bindings/arm/omap/ti,omap-l3-noc.yaml
new file mode 100644
index 0000000000000..a72a0f4e64332
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/omap/ti,omap-l3-noc.yaml
@@ -0,0 +1,149 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/omap/ti,omap-l3-noc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI OMAP L3 Network On Chip (NoC) Interconnect
+
+maintainers:
+  - Santosh Shilimkar <santosh.shilimkar@ti.com>
+  - Sricharan R <r.sricharan@ti.com>
+
+description:
+  The L3 interconnect is an implementation of the generic NoC IP provided by
+  Arteris. OMAP3 uses the SMX variant while OMAP4/5, DRA7, and AM4372 use the
+  NoC variant.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: ti,omap3-l3-smx
+          - const: simple-bus
+      - enum:
+          - ti,omap4-l3-noc
+          - ti,omap5-l3-noc
+          - ti,dra7-l3-noc
+          - ti,am4372-l3-noc
+
+  reg:
+    minItems: 1
+    maxItems: 3
+
+  interrupts:
+    minItems: 2
+    maxItems: 2
+
+  ti,hwmods:
+    description: hwmod names for each NoC domain.
+    $ref: /schemas/types.yaml#/definitions/string-array
+    deprecated: true
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+patternProperties:
+  "^(.*@[0-9a-fA-F]+|regulator-abb-mpu)$":
+    type: object
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,omap3-l3-smx
+    then:
+      properties:
+        reg:
+          maxItems: 1
+        ti,hwmods:
+          maxItems: 1
+      required:
+        - "#address-cells"
+        - "#size-cells"
+        - ranges
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - ti,omap4-l3-noc
+              - ti,omap5-l3-noc
+    then:
+      properties:
+        reg:
+          minItems: 3
+        "#address-cells": false
+        "#size-cells": false
+        ranges: false
+      patternProperties:
+        "^(.*@[0-9a-fA-F]+|regulator-abb-mpu)$": false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,dra7-l3-noc
+    then:
+      properties:
+        reg:
+          minItems: 2
+          maxItems: 3
+        "#address-cells": false
+        "#size-cells": false
+        ranges: false
+      patternProperties:
+        "^(.*@[0-9a-fA-F]+|regulator-abb-mpu)$": false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,am4372-l3-noc
+    then:
+      properties:
+        reg:
+          minItems: 2
+          maxItems: 2
+        "#address-cells": false
+        "#size-cells": false
+        ranges: false
+      patternProperties:
+        "^(.*@[0-9a-fA-F]+|regulator-abb-mpu)$": false
+
+additionalProperties: false
+
+examples:
+  - |
+    l3-noc@68000000 {
+        compatible = "ti,omap3-l3-smx", "simple-bus";
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+        reg = <0x68000000 0x10000>;
+        interrupts = <9>, <10>;
+        ti,hwmods = "l3_main";
+    };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    l3-noc@44000000 {
+        compatible = "ti,omap4-l3-noc";
+        reg = <0x44000000 0x1000>,
+              <0x44800000 0x2000>,
+              <0x45000000 0x1000>;
+        interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+    };

---
base-commit: 5e0f8396d4805a3e7f753fa58c8c55f1f3cc2160
change-id: 20261002-ti-l3-noc-28dfca81fdc5

Best regards,
-- 
Bhargav

