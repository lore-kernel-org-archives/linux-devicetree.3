Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9E719F137
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 15:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781795542; cv=none; b=MbebZ9jl1pkWFZ9Yj9WUCsh/Hono1/MhFWRKCDJ8VacWAKU5d5yBoG3ti3HVsnTMqCn4Y2qMaNlJwl5HBHgNN0Aij9yhQ6I+YMwM9F39/s1IQJqSVQaL+sB4Hz5rHvXNLmUmwcTE+aIaREy7SrTLTgUm0dPPL1B9bTK9arN9MUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781795542; c=relaxed/simple;
	bh=xao/PM+dLebBf9eocHSK34bKkz22pMdg8MgULXlTBpk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aUM1O+hpVjK2IQsPU7qVt7ZX7pgMF58VWHK6fiV2c18cuN35BqmgM8Zpx1pyNKKzeeO8VgImVVsoUmZvN3us0+tFJQIzFpySkyTy+QRWqFrWbIL9jExP12t4fbrVPW3BQpxFIp84Q/c/a7hWWPvKT8/mgM4MhrzgxeQzyiDiAms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=In/kzqJW; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="In/kzqJW"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso11045095ad.0
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 08:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781795540; x=1782400340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RJJdoVxmLVIvm3uOxyz7DAX29AU538dCpjlpNEjNa20=;
        b=In/kzqJWRGLp0kqrXTGsBqQGMQ4XQnwYu7AKMgCCnsJsAOO+C0PDLYK1olgAUum9oh
         69brFVkak9OfOYX7TrVOTqkwiwZxBXGAVxGLqNv4x5iS7CigPxxXXhBXBjqwBXiUT9QN
         vn7UKlsO6JS+uT6H7EtvSDqMTQ8jagWDMWUzYzWkHBxfS+bZZRpSRCM6hTj8ZONl75ph
         XJu/4bq79uZZs6+ZJex1tpmtJj7MmVCcX/2ToYZ7rsfedkYKrd625RxJTCPH5CViU8vl
         EWiS1pzj0bgW1LKw8hIWz7Rk3O026McSoIpFpt3+kNARCz09J9Yu1DB18mMSa3s6j9Gf
         QpRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781795540; x=1782400340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJJdoVxmLVIvm3uOxyz7DAX29AU538dCpjlpNEjNa20=;
        b=GiHqJY7Tglmi+QufSN0dIeCgKnXmIEJRzKdHkxsDOCp/hsYspOyrLv3b5W7UalJsjO
         5aS0kM1LMlRm7oG2DB9MBr07lIH7jYq46l824wN0JpfDvv6qtSMWDpE9SjTx03aKFeoy
         QzU97N1EN+uI/C7igis3YRuSCgKhItr0xsOhwEI985R2QGM5JLfY2+BClsnjImmG2tdb
         1tMz9xtsDZBAhCss3qholumsTl9Tz2ngbCVAC0m2WUrZbKWDnk05h16mzZagqVBOnDrd
         yFnlT9AxN86L9jfIfPAuvgjsmf0mX+vFtoWTJtrvp9o5fDY4i688qTDCrEXGk6vg3dfV
         XzIQ==
X-Gm-Message-State: AOJu0YzZuJ8TpqjAa9TjvIfao+GT8hFzNzPXZTuyQwubli3coEfm/yva
	svD5dAdKY5YzI0gI6S/xyD5GtVzaerObc2otYC1vgIE+gjsl4w4Lk+i7Kc75edkj
X-Gm-Gg: AfdE7cnQHIBm5sSpA0gKFR/+14docI3CTaM2r5ijAvil48cXPUHujyUvKWF3tTm5UiW
	/pZ+SRPtflb/cA4SaEV3zKwktVMFn4hOyI2fA+LBRzqIuzziddYK6u6yyjlYNs9TbMMinF9XKX1
	2KAg9dbQpX5g/wuo3Dsa5ylTueg3uMD3UZSEpnTw4bwbBey6pNCmzuELxsVc5wOfu28WYlaFi+H
	13odAf1fKXq35HMDpV88qXnSP6pol9uWJcZVYN9bE8GbG4Us5zehg3PAFdAW0qIXFtaY3uPV4p3
	pM02RQTU09M9OY6cffSX1JH8p7sDP2TFx+qNn79qVH/T6fvXGmMohiA0xJdv9UKUUFyZ2rBNvJC
	Tpv3bE6M35kwtmkQPRSEIBnwAe+/XrV+qo88VXr1qILSbjEtDcuV6NfEswotf63cEyrSE/LG0np
	vwLzHPrKR7i+7YmQgwyqKxCPAZx0c=
X-Received: by 2002:a17:902:f548:b0:2c0:d4a8:85d0 with SMTP id d9443c01a7336-2c6bc24236amr97026625ad.32.1781795539673;
        Thu, 18 Jun 2026 08:12:19 -0700 (PDT)
Received: from vbox ([117.251.163.66])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6a403b242sm82450325ad.31.2026.06.18.08.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 08:12:19 -0700 (PDT)
From: Tejas Mutalikdesai <tejasmutalikdesai@gmail.com>
To: devicetree@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	sstabellini@kernel.org,
	Tejas Mutalikdesai <tejasmutalikdesai@gmail.com>
Subject: [PATCH v5 1/2] dt-bindings: arm: xen: Convert to DT schema
Date: Thu, 18 Jun 2026 20:41:46 +0530
Message-ID: <20260618151147.9438-1-tejasmutalikdesai@gmail.com>
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

The "hypervisor" node is named without a unit-address. The name is part
of the Xen ABI and is matched verbatim by the kernel using strcmp() in
arch/arm/xen/enlighten.c and arch/arm64/kernel/acpi.c, so $nodename uses
'const: hypervisor'. The node has a reg but no unit-address, so dtc emits
a non-fatal unit_address_vs_reg warning on the example; this is inherent
to the existing binding and is not introduced by the conversion.

Signed-off-by: Tejas Mutalikdesai <tejasmutalikdesai@gmail.com>
---
The bare node name "hypervisor" (no unit-address) is deliberate:

1. The legacy binding (xen.txt, commit c43cdfbc4ceb, authored by the Xen
   ARM maintainer in 2012) documents the node and its example as a bare
   "hypervisor".

2. The kernel locates the node by exact name, not by unit-address:
     arch/arm/xen/enlighten.c:   strcmp(uname, "hypervisor")
     arch/arm64/kernel/acpi.c:   strcmp(name,  "hypervisor")
   fdt_get_name() returns the full name including any "@unit", so a
   "hypervisor@..." node would fail these comparisons and Xen init would
   silently not find the node.

3. The in-tree template arch/arm/boot/dts/xen/xenvm-4.2.dts uses a bare
   "hypervisor" node and has done so since it was added.

4. The dtc unit_address_vs_reg warning is pre-existing: compiling
   xenvm-4.2.dts today already emits it. Mandating a unit-address in the
   schema would instead regress dtbs_check for that in-tree DTB and
   describe a node form the kernel cannot consume.

Per the DT spec a unit-address is grammatically permitted (node-name is
the part before '@'), but making it mandatory is not viable until the
kernel matchers and the Xen-generated FDT are updated in lockstep, which
is out of scope for this binding conversion.

Changes since v4:
- Revert the v4 $nodename unit-address requirement to 'const: hypervisor'
  (see rationale above).

Changes since v2:
- s/YAML schema/DT schema/ in the commit text
- Drop unnecessary '|' block scalars from descriptions
- Split the arch/arm/xen/enlighten.c doc-reference update into patch 2/2

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
index 000000000000..4eeadb8ae106
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
+    const: hypervisor
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
+    hypervisor {
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

