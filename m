Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E462047D955
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 16:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783529547; cv=none; b=A/1DeRiSdfKKQheUQ2NM7gx1GmzUwo5+rhy4mLj/sONRAWEikZq065Ws1MIk6+jqTcMgGmmlod6H989IvxhPvu6Whkvv2n2UTAPLpmjHN16gRbRjqZdUimpZ3Sn1gOBH340H9mSsQ00LU3K9Rn9uOEABbbSqgMbdjx8KaYn6BEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783529547; c=relaxed/simple;
	bh=1Wl+9r0+s0TDUjhnfcyyKaDZxB4Fsr0gGq2PjdolWCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hEcO7imMatopIBHvI8iF0uyeHr3clDJxTfVH6dQEJZ1tzC+HMtr+h1q1eb3GgVMFeMld0Ai8GAbp+r2DIETMRjtIR8m05vkSqHZi8LZZSOSZ48blFhyD3gl6BG3TkaBqaZDq9YpTw0eDz/+h+R/oioan8MAx7TntIhx+q7H8ukc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E90Lz14+; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E90Lz14+"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c96d7933910so66044a12.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 09:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783529535; x=1784134335; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U//PbZPS0wgDigTHSbhziRKqlRUyA7Fn8Fac9dDowRc=;
        b=E90Lz14+1YgTEpbmNeJELtOLuivs6htblOwEKIACSx1T20MCEJlyzKaoKCsa2g/IZj
         cg4KbrWC3ikRJvr4CnImXIXeiBw+WIS4DvchFbWfUQ4if02vo49MHntfbcXy6rF0tdqL
         m03NncSEU4lGaAvXA8v0ijiLcDoOe7/nAyFR5BwLMMa3IAaEH5Bg0prrhhRQFspduUCS
         Ufm+XSd6jjMv3U0EOMIx7HiLkXK31jmtw8jRo4mBFFHgCQfH9oavcpVH3FfsEUCnHsKR
         h3sqd2yD5nyb91qos+RmloZAPjT77T9OSb8MzdSvuMev+F79O6v+4l3cUkuHGphlyK7Y
         rEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783529535; x=1784134335;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=U//PbZPS0wgDigTHSbhziRKqlRUyA7Fn8Fac9dDowRc=;
        b=pC001Dc3kCcwhkdd6vJo14wS6Cbuov+lfIyVrU58VoCwxogbyUn8jmwpIyh2jqJ4Nb
         8Fyb71oA7pJcOhC1rIwNgakFk0QD/9xJfAb07G5RU10QVU71Zdx8nhGVIgF+NtfD3/r2
         X/O23vCWIfQtY+MQ30PC7Km9Xd3eZNRzXlc4DNY7Eg856LwZGcAgoo7PwWaBkSxXp9OB
         Kf78MvYs6QGYBZgdf258ilgZkszkeaFBU+G+OBmoMmPfvlvrvVaZ7nef0geRFyqS1fVc
         eXD9WTbqsdy+hEcpBQpjhxoUUb90WCxhgwRY8Xhqal4DWVYzQHaXrXwwEg+3FOC7tHHg
         5QVQ==
X-Forwarded-Encrypted: i=1; AHgh+RrtDoKX/yPrCuxs9k6rXoursrrgWHQSUc82lgjiG1I+wLO4naq9Sx1vHBOyFIY6ywj9rPGYWTFnlF98@vger.kernel.org
X-Gm-Message-State: AOJu0YxcqekbJVSKZ26b8bV8A/zEuo2A46IXTQhFLz5KrnF09duVeSu/
	FkijhTLB4l3kR0Bi+2C4MlP7wxACdFaZA4kMHYCAveaQToSNCUALyfl+
X-Gm-Gg: AfdE7cmrcXqxh3E2GYzYJTXZ+ASewNAl1av1oQSdAA8v3Cn2v266YqZa4lcCRG0xp3j
	aU1BwqYwF3krkM6wLvwLmkpmK+b3P6nY39AcqbHPv3Ev+2I/wfZO4aH7FRQpptSN1lx50fvsGgX
	y2JB1Ps+dwrPaMD6R3C2fpZjG/y6qL4cY1UtU2B0QAF7QySUfLvwmtO0r9sH1l1u6xl5Uu/aJcV
	qM1SYdFDpQMMmCFU9KEE50Ytnq2O9dbW2Qdbao0S6dojpM9iELzldz75E7KnR+RjAIQILAAPf15
	n5AVbDAn1A8+L660aRn2cceYXs5en0WG1BPie/7PaE5qfGCxUmsGFXvwJ+JOcP8V8JdIvpFsPo2
	ewmxtxymC0uBXpZ0HOdszkZ6NnlUklra5u0G3HwrqdMKfBuoAwxd04dA6wDwrk3WNF24RPB2FJK
	QV1ZDI2D+FW9Z+5kbJ0SxkvA==
X-Received: by 2002:a17:90b:4c0e:b0:381:1ffc:7d35 with SMTP id 98e67ed59e1d1-38a2122c84amr257831a91.6.1783529535194;
        Wed, 08 Jul 2026 09:52:15 -0700 (PDT)
Received: from [192.168.1.2] ([2401:4900:881c:f765:f05c:d31e:8ae0:b06d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311935fd091sm7136661eec.24.2026.07.08.09.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 09:52:14 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 08 Jul 2026 22:21:43 +0530
Subject: [PATCH v2] dt-bindings: iommu: ti,omap-iommu: Convert to DT schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-ti-omap-iommu-v2-1-612d4a6644ba@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CMBBFr0Jm7RgoCMSV9zAshjqFMZaSthAN4
 e4Crl2+5P33FwjshQNckwU8zxLEDRuoUwK6p6FjlMfGoFJVplVaYxR0lkYUZ+2EOStlqtzolhR
 sm9GzkffRuzc/DlP7ZB33yG70EqLzn+NwznbvX3vOMMOi1kZfciIqyltnSV5n7Sw067p+Ae2co
 lO8AAAA
X-Change-ID: 20260708-ti-omap-iommu-3e22f73fcba2
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: iommu@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783529530; l=6812;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=1Wl+9r0+s0TDUjhnfcyyKaDZxB4Fsr0gGq2PjdolWCg=;
 b=lFU8uyDQABCOFUqV6yGWemDCgw90I2sdy3M0wBvWUKs6x3ud5O5vkGIWo9zbTdMZJFL+pZkgU
 CSg/0AYIcAeArks8DjXtY8ClaZrrSbbANMU+VYqk/zDzTTwx7RzBfjn
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert Texas Instruments OMAP2+ IOMMU from text to DT schema. Make the
'ti,hwmods' property optional and mark it deprecated as it is no longer
used, it is kept to support legacy dtbs.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v2:
- Added maxItems:1 to ti,syscon-mmuconfig as property expects only one
  pair of phandle-args
- Added deafult value 32 for ti,#tlb-entries
- Link to v1: https://lore.kernel.org/r/20260708-ti-omap-iommu-v1-1-48cfc53aaa46@gmail.com
---
 .../devicetree/bindings/iommu/ti,omap-iommu.txt    |  59 -----------
 .../devicetree/bindings/iommu/ti,omap-iommu.yaml   | 114 +++++++++++++++++++++
 2 files changed, 114 insertions(+), 59 deletions(-)

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
index 000000000000..9588eb60376e
--- /dev/null
+++ b/Documentation/devicetree/bindings/iommu/ti,omap-iommu.yaml
@@ -0,0 +1,114 @@
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
+    default: 32
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
+    maxItems: 1
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

