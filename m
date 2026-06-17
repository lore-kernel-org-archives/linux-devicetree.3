Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20CF37C906
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 18:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781722526; cv=none; b=dG36UOvaIFgKt1B0te1gUo254t0HnR0tuJNJWuMHog5ZkRKONi2hqU0lfz7ksAUv1Ho1kxIsW6ERZOBnGPpEmte/BnNCrB5xPWFFxj+1SMPrSt7bBIe8/Ys4A6VLh82UAsA7mFBHI4C3ijKFtNsb+5IxPfbuISRWV7GVp1hhtuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781722526; c=relaxed/simple;
	bh=ycp+LHvhxzd/3E4rT6FefYd74WiBGM3U8cYvZQ8q+Yw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s/7vCCMmbfTNGBUSVBS0EQMjxwGs0kE2nMi61vosC8T/UD9GayNyeKGRzo/B5G1E8zr+pGCg9rVIcIDJ5syvurXWTDyk53oRxcHmWDtSsF0vCcdZrepTG29HMaWx8dj37itBS05IpmbaiPIYhIR9I9EL9e1NMQbWAZE3nQYQ0Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MCEnRK3G; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MCEnRK3G"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso1670755ad.0
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 11:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781722524; x=1782327324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fq9SNz4n1kQOwY4svk2lUoUairxDKD7HIfCXlLnlepc=;
        b=MCEnRK3G0h3SbY7glMkKkAzD8Ss6jmucLOb2o1fZkCRZ20FAEXbK8hcVGzkrEuMHRb
         i3LiGQon1CMgw5LTHrbaQCszxXa3cqMnvYV0QRxhh7bikot8Kikrz/tqs3k/ECCaJOAf
         FOMbq8AmbvIDBrcxVbGmK1mxI5AjnM06SCu2M63B2pEJ5Ya5S19qWlzkPCz+3MrQhO71
         dBgalNJ0/M0PAfXCjRDpaqT4mgl38/qjNHVptbVutlMhuGPwh1AbM6ZXrVIfULnIzXXH
         2vnuF4Zz76QsoFV2mPp43V6nwXhCgFxFEDnm+Jonf9IwsT9gcE906Qurj4Rrvm5T+MXu
         7BPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781722524; x=1782327324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fq9SNz4n1kQOwY4svk2lUoUairxDKD7HIfCXlLnlepc=;
        b=TzBKh6XShWj/5ySaZ0/QN0ZjLbFiYGRr1vNdP0ZU7iJjyu9rlzfX1D1LvFD/TwsgoI
         RS9G1AwY0sCJD0nFZj6+h1EgbHYdBJ4EfTfe5jJtXhV6ymXmCPa8H+7CaFFB3ZyQ07X6
         BawQwklh68ojSAp9IXFxiarrn9PfTLWJ/TNmib4ycM3/mAih9CNBZ1m/A7RuHx+Mi04D
         4iSirHa8RykB2DSggC8IKWjafoQLcdNYwL9Lb5O2Mjv9YeXy67nqkXEJ4pj8UA2cHuEs
         JRqNUVxX0idfHMMeEEHhAH29WxCEEcIUltrzurHxvppbhVuyz49ZuFOY/bf1NzuWBPNF
         LpRA==
X-Gm-Message-State: AOJu0YxuC0VGrAbOUdp3WfDSi4p1KMMwwwVVSVzOTJVVjsMnnqbc017V
	kCWRDTCToP3HxqRRyXtfBlaS1sE6XmH9L5yncQP3FVX3BLkk+0nht8uojGVJbHjq
X-Gm-Gg: AfdE7cl3T5AKox+EajbUMnHbeHCJ7mby2Jk67DfxZFFS2OeFtFjiaR6s+cvahNSxrSX
	EeY9kyOBDiFwyEDN8yoUwONu0QwlEQl3Qy9lmWw/vXyJpuLE6ecdrN9YLspjlJ+BRUyA2eT3fgA
	QFbHU43im5elCw0skEltFYhVozP3zOiuJ7aejG7A9nqQwq3tKc04cGLzfJ1FtwFWBWkHz3E/SpT
	mvNBLSXTrnwKr+ROIzh6Lj+jIvghKwIXA0zt3BHT9Dt/6pFsReJhho9BAAaXjAXyDbpIUJXlbgf
	FSZSnB8mfnyh1ey2ouMATN+bUt8HEo+9i653RQKGCldhGPPVLYuKDie8hU7piGis50joHqXjc4B
	bqXo3N7g47dGabA2s1ukeaYcvkgXZjmPtgejT3aVad0YkFErUieATwQS1Mksg7FI7I+I0NV7Eyr
	sgQ4y7zZ3KIvpyezQacoHJ6pusXQA=
X-Received: by 2002:a17:903:32d1:b0:2c6:bbc8:3a73 with SMTP id d9443c01a7336-2c6bc0bcd3emr53141155ad.15.1781722524002;
        Wed, 17 Jun 2026 11:55:24 -0700 (PDT)
Received: from vbox ([117.215.38.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5369sm177164505ad.9.2026.06.17.11.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 11:55:23 -0700 (PDT)
From: Tejas Mutalikdesai <tejasmutalikdesai@gmail.com>
To: devicetree@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	sstabellini@kernel.org,
	Tejas Mutalikdesai <tejasmutalikdesai@gmail.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: xen: Convert to DT schema
Date: Thu, 18 Jun 2026 00:25:17 +0530
Message-ID: <20260617185518.43500-1-tejasmutalikdesai@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Xen ARM device tree binding documentation from the legacy
plain-text format (Documentation/devicetree/bindings/arm/xen.txt) to
the DT schema format, as required by the modern DT binding process.

Signed-off-by: Tejas Mutalikdesai <tejasmutalikdesai@gmail.com>
---
Changes since v3:
- Split enlighten.c comment fix into a separate patch (2/2)

Changes since v2:
- Replace 'YAML schema' with 'DT schema' in the commit description
- Drop unnecessary '|' block scalars from description fields that do
  not need to preserve literal formatting
- Fix unit_address_vs_reg warning: replace $nodename const with a
  pattern requiring a unit address; update example to hypervisor@b0000000
  and drop the root node, GIC, and interrupt-parent

 Documentation/devicetree/bindings/arm/xen.txt |  62 ----------
 .../devicetree/bindings/arm/xen.yaml          | 109 ++++++++++++++++++
 2 files changed, 109 insertions(+), 62 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/xen.txt
 create mode 100644 Documentation/devicetree/bindings/arm/xen.yaml

diff --git a/Documentation/devicetree/bindings/arm/xen.txt b/Documentation/devicetree/bindings/arm/xen.txt
deleted file mode 100644
index f925290d4641..000000000000
--- a/Documentation/devicetree/bindings/arm/xen.txt
+++ /dev/null
@@ -1,62 +0,0 @@
-* Xen hypervisor device tree bindings
-
-Xen ARM virtual platforms shall have a top-level "hypervisor" node with
-the following properties:
-
-- compatible:
-	compatible = "xen,xen-<version>", "xen,xen";
-  where <version> is the version of the Xen ABI of the platform.
-
-- reg: specifies the base physical address and size of the regions in memory
-  where the special resources should be mapped to, using an HYPERVISOR_memory_op
-  hypercall.
-  Region 0 is reserved for mapping grant table, it must be always present.
-  The memory region is large enough to map the whole grant table (it is larger
-  or equal to gnttab_max_grant_frames()).
-  Regions 1...N are extended regions (unused address space) for mapping foreign
-  GFNs and grants, they might be absent if there is nothing to expose.
-
-- interrupts: the interrupt used by Xen to inject event notifications.
-  A GIC node is also required.
-
-To support UEFI on Xen ARM virtual platforms, Xen populates the FDT "uefi" node
-under /hypervisor with following parameters:
-
-________________________________________________________________________________
-Name                      | Size   | Description
-================================================================================
-xen,uefi-system-table     | 64-bit | Guest physical address of the UEFI System
-			  |	   | Table.
---------------------------------------------------------------------------------
-xen,uefi-mmap-start       | 64-bit | Guest physical address of the UEFI memory
-			  |	   | map.
---------------------------------------------------------------------------------
-xen,uefi-mmap-size        | 32-bit | Size in bytes of the UEFI memory map
-                          |        | pointed to in previous entry.
---------------------------------------------------------------------------------
-xen,uefi-mmap-desc-size   | 32-bit | Size in bytes of each entry in the UEFI
-                          |        | memory map.
---------------------------------------------------------------------------------
-xen,uefi-mmap-desc-ver    | 32-bit | Version of the mmap descriptor format.
---------------------------------------------------------------------------------
-
-Example (assuming #address-cells = <2> and #size-cells = <2>):
-
-hypervisor {
-	compatible = "xen,xen-4.3", "xen,xen";
-	reg = <0 0xb0000000 0 0x20000>;
-	interrupts = <1 15 0xf08>;
-	uefi {
-		xen,uefi-system-table = <0xXXXXXXXX>;
-		xen,uefi-mmap-start = <0xXXXXXXXX>;
-		xen,uefi-mmap-size = <0xXXXXXXXX>;
-		xen,uefi-mmap-desc-size = <0xXXXXXXXX>;
-		xen,uefi-mmap-desc-ver = <0xXXXXXXXX>;
-        };
-};
-
-The format and meaning of the "xen,uefi-*" parameters are similar to those in
-Documentation/arch/arm/uefi.rst, which are provided by the regular UEFI stub. However
-they differ because they are provided by the Xen hypervisor, together with a set
-of UEFI runtime services implemented via hypercalls, see
-http://xenbits.xen.org/docs/unstable/hypercall/x86_64/include,public,platform.h.html.
diff --git a/Documentation/devicetree/bindings/arm/xen.yaml b/Documentation/devicetree/bindings/arm/xen.yaml
new file mode 100644
index 000000000000..a22e950566c2
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/xen.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/xen.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xen hypervisor
+
+maintainers:
+  - Stefano Stabellini <sstabellini@kernel.org>
+
+description:
+  Xen ARM virtual platforms shall have a top-level "hypervisor" node with
+  the properties defined below.
+
+properties:
+  $nodename:
+    pattern: "^hypervisor@[0-9a-f]+$"
+
+  compatible:
+    description:
+      Specifies the Xen hypervisor. The version of the Xen ABI is encoded
+      in the first item as "xen,xen-<version>", followed by the generic
+      "xen,xen" string.
+    items:
+      - pattern: "^xen,xen-[0-9]+\\.[0-9]+$"
+      - const: xen,xen
+
+  reg:
+    description: |
+      Base physical address and size of the regions in memory where special
+      resources should be mapped to, using a HYPERVISOR_memory_op hypercall.
+
+      Region 0 is reserved for mapping the grant table and must always be
+      present. The memory region must be large enough to map the whole grant
+      table (it is larger or equal to gnttab_max_grant_frames()).
+
+      Regions 1...N are extended regions (unused address space) for mapping
+      foreign GFNs and grants. They might be absent if there is nothing to
+      expose.
+    minItems: 1
+
+  interrupts:
+    description:
+      The interrupt used by Xen to inject event notifications.
+      A GIC node is also required.
+    maxItems: 1
+
+  uefi:
+    type: object
+    description:
+      Node populated by Xen to support UEFI on Xen ARM virtual platforms.
+      The format and meaning of the "xen,uefi-*" parameters are similar to
+      those in Documentation/arch/arm/uefi.rst, but are provided by the Xen
+      hypervisor together with a set of UEFI runtime services implemented via
+      hypercalls.
+    properties:
+      xen,uefi-system-table:
+        description: Guest physical address of the UEFI System Table.
+        $ref: /schemas/types.yaml#/definitions/uint64
+
+      xen,uefi-mmap-start:
+        description: Guest physical address of the UEFI memory map.
+        $ref: /schemas/types.yaml#/definitions/uint64
+
+      xen,uefi-mmap-size:
+        description: Size in bytes of the UEFI memory map pointed to by xen,uefi-mmap-start.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      xen,uefi-mmap-desc-size:
+        description: Size in bytes of each entry in the UEFI memory map.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      xen,uefi-mmap-desc-ver:
+        description: Version of the mmap descriptor format.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+    required:
+      - xen,uefi-system-table
+      - xen,uefi-mmap-start
+      - xen,uefi-mmap-size
+      - xen,uefi-mmap-desc-size
+      - xen,uefi-mmap-desc-ver
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    hypervisor@b0000000 {
+        compatible = "xen,xen-4.3", "xen,xen";
+        reg = <0xb0000000 0x20000>;
+        interrupts = <1 15 0xf08>;
+
+        uefi {
+            xen,uefi-system-table = /bits/ 64 <0x1301415>;
+            xen,uefi-mmap-start = /bits/ 64 <0x7591400>;
+            xen,uefi-mmap-size = <0x1800>;
+            xen,uefi-mmap-desc-size = <0x30>;
+            xen,uefi-mmap-desc-ver = <1>;
+        };
+    };
+...
-- 
2.54.0

