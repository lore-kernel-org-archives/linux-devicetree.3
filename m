Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2039F3F1AB2
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 20:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783457037; cv=none; b=MWafa2VGGegi8P6IPum4PGE1in71f0TLMusV3phcDX1G5dfE0dYA8sncoldDDPdtJE/TeHiIwslfoqnY4hNnAv1JireR02ILwBhM/1biiaHXnDxGXASPQYY3h85vIV3pf52L5Di6Oa4suAUy/k1ViBpl+bkd7j0dHW91gwUqbzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783457037; c=relaxed/simple;
	bh=qS0KUDgarP8PkHQj+bjZKVtl2KEWMwQxPutHaWKPGmU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gPjjTWAEnxIOF71yLmak/bom8znOTJ9MUxz04tXhsC0Mh6O+oRMaPM2j9XPK67ZwQ6D9eeUi4mYY0A0epSgPPLJdKkX7lGnMxXbP6po6LJ1i3IFmBMArnfXCs5x3TiPXrsfBW3GPhV5ybbwQrPh3IQA1g+gA+38Cs2s77LCpePM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=syxjFXzQ; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="syxjFXzQ"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-381f03d7be0so286523a91.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 13:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783457035; x=1784061835; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9Sc1ScYcrcYXTFBfBdaZMPgXyG9Uw3ZDjAvPJZPUKLA=;
        b=syxjFXzQY8G1FpwZnlfY6z4IyX1jPGSIsidTA0xn7JolTWChLrAncCOxMOPZblFYsk
         2E9dgkbfgejqxdG/dRRYzcJRviq47kA7j3I7tDSHWuYCvR1bpNBbi4s+Qr9k5+WGTbXG
         1XLXQggfcypVUilkd89hclA6vftYcslqoCHykxrienX4Cqci9ilLmT6A6grIt9IBKBq/
         0QNTzpXU0BDyajl6OiOSr5llATKvKjgQdqXYmVtYg5+m0p+NfKpLFPlKgnZ3DXxy1sER
         USNDsuOU793nyIm98+QM95lzqoXTly0BmPrJ3YvW+iTfQlSa+/Xrt4Ztl+ADlaK64eJr
         2+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783457035; x=1784061835;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9Sc1ScYcrcYXTFBfBdaZMPgXyG9Uw3ZDjAvPJZPUKLA=;
        b=eMDUTPvXLTvHCNc5b2IogzBgZwUSMXRrFc9/+UcJOf1r/QZbgB0fFLWzEGLnL7vPCe
         izNJR69ktATBwx0jcGYE9K3ZuNNOZwJ7IZIWKiYhmVFYt/pS5EhYkGKMNp22B63U0kv7
         Fys06fPGkoWYoPT75FBsyvdZKfj3Nzxa/qBUtWAVz6PQSaO969/E+SCrnEF7OqKbf82J
         CSFsr94wC8WVw/Rb+aY5jO2AsJtnwethYGBqvxh0E8HWNg0yWwXmT31/KTUYv/6TMxJQ
         V/JLZ73Et1xnZMQbiMzfJeX2mW4C9GQHWwkcGHvvqJfwf+bz9Syfl0yeHuLJrTb/c3o2
         X0iw==
X-Forwarded-Encrypted: i=1; AHgh+RoHXLgdKAilU4kTeNj/Jm7hwE51OXwN/WXfbQ73Sa4IWY8Kjb8mxX2B4J6qWRQd8qwa9xYEBlflwjAB@vger.kernel.org
X-Gm-Message-State: AOJu0YwjYPK9zKaja/+sVeicQwKiA0dniAc8LYkaRf/Xxk81Lar+JjDW
	wJy3Pl8Eqe5uqTo/3Xh4zsUsnTAmZu92b/uUQMDz2bnppQazTjjbvc/n
X-Gm-Gg: AfdE7cmLaIlUFxW1TlS76iqmwNJp4bkaaEsb6NuCG3XI3RlSEGG+8QbGleYud5zE6A9
	R84EycxY3sjBcO31O8ZoLA99THz7/AY9SNVXCzkTK4EpoeLEcnGxddxKHcNaBB1y4WHaolrTDe3
	igWuicc/XQyIpug+TmIVarN1pLBLweXFvuiA431tx2tSPvY2JJ+9Q92qO0smkjZTvy4NJ6oqmSh
	i76+Aqaenr7daguCzQ1tFezkBf43uBiKag1tP40XhuB+8KEZQmrc0V22JPmzkO6KccaIfOW/lWi
	Lataz2hoJMORT7P5FqF5ZRbT2RH2EZXaAVPkOzUOmxQbpx9KQ0tEszDikQL7qLM0N22jWkRf7fi
	/8Qt73oBKtO6KqTAm77GSk4jW9HnNP3M0WbiTqjJ1npaWOWIxONLvXhikXVgbydMrdY7GvmLNMo
	zfmYqUe0tq3J2RhDAzpXbmmA==
X-Received: by 2002:a05:6a21:4cc1:b0:3bf:8ea5:b3a0 with SMTP id adf61e73a8af0-3c03c60d626mr10503808637.4.1783457035230;
        Tue, 07 Jul 2026 13:43:55 -0700 (PDT)
Received: from [192.168.1.2] ([2401:4900:881c:7ad8:e5f1:b20c:5138:fdef])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ae6cd9sm12405117eec.31.2026.07.07.13.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 13:43:54 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 08 Jul 2026 02:13:45 +0530
Subject: [PATCH] dt-bindings: iommu: ti,omap-iommu: Convert to DT schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-ti-omap-iommu-v1-1-48cfc53aaa46@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrDuQjqDFq0gXMU7qFGJCEkUI3
 t3YLt/i/wKJo3CCoSkQeZckfq14Phowi14/jDJXAynqVK9emAW90wHFO7dhy0S2b62ZNEFtQmQ
 rx+83vv9O2/Rlk+8JnOcF2bhBpHEAAAA=
X-Change-ID: 20260708-ti-omap-iommu-3e22f73fcba2
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: iommu@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783457030; l=6521;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=qS0KUDgarP8PkHQj+bjZKVtl2KEWMwQxPutHaWKPGmU=;
 b=qQuMPAe+/8FtgRxJoa0wpJacMAU0xOV+ouP9K8qIenEmsfJrmnYvGWkpQaOI5uar1wVsd3efw
 IvGtQRkepKQCfGYcYQdsn3omZSqpJlwy3jFYcP5tKQ2MGashLTZu2PU
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert Texas Instruments OMAP2+ IOMMU from text to DT schema. Make the
'ti,hwmods' property optional and mark it deprecated as it is no longer
used, it is kept to support legacy dtbs.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/iommu/ti,omap-iommu.txt    |  59 -----------
 .../devicetree/bindings/iommu/ti,omap-iommu.yaml   | 112 +++++++++++++++++++++
 2 files changed, 112 insertions(+), 59 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/ti,omap-iommu.txt b/Documentation/devicetree/bindings/iommu/ti,omap-iommu.txt
deleted file mode 100644
index 4bd10dd881b8..000000000000
--- a/Documentation/devicetree/bindings/iommu/ti,omap-iommu.txt
+++ /dev/null
@@ -1,59 +0,0 @@
-OMAP2+ IOMMU
-
-Required properties:
-- compatible : Should be one of,
-		"ti,omap2-iommu" for OMAP2/OMAP3 IOMMU instances
-		"ti,omap4-iommu" for OMAP4/OMAP5 IOMMU instances
-		"ti,dra7-dsp-iommu" for DRA7xx DSP IOMMU instances
-		"ti,dra7-iommu" for DRA7xx IOMMU instances
-- ti,hwmods  : Name of the hwmod associated with the IOMMU instance
-- reg        : Address space for the configuration registers
-- interrupts : Interrupt specifier for the IOMMU instance
-- #iommu-cells : Should be 0. OMAP IOMMUs are all "single-master" devices,
-                 and needs no additional data in the pargs specifier. Please
-                 also refer to the generic bindings document for more info
-                 on this property,
-                     Documentation/devicetree/bindings/iommu/iommu.txt
-
-Optional properties:
-- ti,#tlb-entries : Number of entries in the translation look-aside buffer.
-                    Should be either 8 or 32 (default: 32)
-- ti,iommu-bus-err-back : Indicates the IOMMU instance supports throwing
-		          back a bus error response on MMU faults.
-- ti,syscon-mmuconfig : Should be a pair of the phandle to the DSP_SYSTEM
-                        syscon node that contains the additional control
-                        register for enabling the MMU, and the MMU instance
-                        number (0-indexed) within the sub-system. This property
-                        is required for DSP IOMMU instances on DRA7xx SoCs. The
-                        instance number should be 0 for DSP MDMA MMUs and 1 for
-                        DSP EDMA MMUs.
-
-Example:
-	/* OMAP3 ISP MMU */
-	mmu_isp: mmu@480bd400 {
-		#iommu-cells = <0>;
-		compatible = "ti,omap2-iommu";
-		reg = <0x480bd400 0x80>;
-		interrupts = <24>;
-		ti,hwmods = "mmu_isp";
-		ti,#tlb-entries = <8>;
-	};
-
-	/* DRA74x DSP2 MMUs */
-	mmu0_dsp2: mmu@41501000 {
-		compatible = "ti,dra7-dsp-iommu";
-		reg = <0x41501000 0x100>;
-		interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
-		ti,hwmods = "mmu0_dsp2";
-		#iommu-cells = <0>;
-		ti,syscon-mmuconfig = <&dsp2_system 0x0>;
-	};
-
-	mmu1_dsp2: mmu@41502000 {
-		compatible = "ti,dra7-dsp-iommu";
-		reg = <0x41502000 0x100>;
-		interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
-		ti,hwmods = "mmu1_dsp2";
-		#iommu-cells = <0>;
-		ti,syscon-mmuconfig = <&dsp2_system 0x1>;
-	};
diff --git a/Documentation/devicetree/bindings/iommu/ti,omap-iommu.yaml b/Documentation/devicetree/bindings/iommu/ti,omap-iommu.yaml
new file mode 100644
index 000000000000..c23156b9b312
--- /dev/null
+++ b/Documentation/devicetree/bindings/iommu/ti,omap-iommu.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iommu/ti,omap-iommu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OMAP2+ IOMMU
+
+maintainers:
+  - Bhargav Joshi <j.bhargav.u@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - ti,omap2-iommu
+      - ti,omap4-iommu
+      - ti,dra7-dsp-iommu
+      - ti,dra7-iommu
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  '#iommu-cells':
+    const: 0
+
+  ti,#tlb-entries:
+    description: Number of entries in the translation look-aside buffer.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [8, 32]
+
+  ti,iommu-bus-err-back:
+    description:
+      Indicates the IOMMU instance supports throwing back a bus error response
+      on MMU faults.
+    type: boolean
+
+  ti,syscon-mmuconfig:
+    description:
+      Pair of the phandle to the DSP_SYSTEM syscon node that
+      contains the additional control register for enabling the MMU, and the
+      MMU instance number (0-indexed) within the sub-system. The instance number
+      should be 0 for DSP MDMA MMUs and 1 for DSP EDMA MMUs.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      items:
+        - description: phandle to the DSP_SYSTEM syscon node
+        - description: MMU instance number
+          enum: [0, 1]
+
+  ti,hwmods:
+    description: Name of the hwmod associated with the IOMMU instance
+    $ref: /schemas/types.yaml#/definitions/string
+    deprecated: true
+
+required:
+  - compatible
+  - reg
+  - '#iommu-cells'
+  - interrupts
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,dra7-dsp-iommu
+    then:
+      required:
+        - ti,syscon-mmuconfig
+    else:
+      properties:
+        ti,syscon-mmuconfig: false
+
+additionalProperties: false
+
+examples:
+  - |
+    mmu@480bd400 {
+        #iommu-cells = <0>;
+        compatible = "ti,omap2-iommu";
+        reg = <0x480bd400 0x80>;
+        interrupts = <24>;
+        ti,hwmods = "mmu_isp";
+        ti,#tlb-entries = <8>;
+    };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mmu@41501000 {
+        compatible = "ti,dra7-dsp-iommu";
+        reg = <0x41501000 0x100>;
+        interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
+        ti,hwmods = "mmu0_dsp2";
+        #iommu-cells = <0>;
+        ti,syscon-mmuconfig = <&dsp2_system 0x0>;
+    };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mmu@41502000 {
+        compatible = "ti,dra7-dsp-iommu";
+        reg = <0x41502000 0x100>;
+        interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+        ti,hwmods = "mmu1_dsp2";
+        #iommu-cells = <0>;
+        ti,syscon-mmuconfig = <&dsp2_system 0x1>;
+    };

---
base-commit: 0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
change-id: 20260708-ti-omap-iommu-3e22f73fcba2

Best regards,
-- 
Bhargav

