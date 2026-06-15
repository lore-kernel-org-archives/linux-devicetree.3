Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BD1353EC0
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 13:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781529022; cv=none; b=ZJwJ1RSO/SnQtFDr7d+d9mHqI4vz8ZCEYrQiMtE0NWPsbtBV/7rPtxhalzsK4K8w62aNXQxw24GdFqga+8zVO0nw++8FBr8hTC3z+AP7utR/HliiKqMNNQ8qLlcCKQZOkDy+iWILOzEvBCHs6iT+CevoVmE28ojz5CnDvnf3vw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781529022; c=relaxed/simple;
	bh=QOWOdY8haztcUEOjAJvz7ocQMY4HCgDGgy6By7Z0R/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XX+5xlc+VM/nqvaS8rdhyfW1n5Gn/tbnA+SHc4WFHHizK9TARFDB55TRnCsbY5DI5VaTureVSL277R0jEzWtvERUwPDieDeWThUCQj4lJWHJD6y/nA8mOYEtVpGp523YVwll1cP6QvO/QbM9Xus4VoG03NuqiTqvlwWHeE43WEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rQ3Ph5PI; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rQ3Ph5PI"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c0b9328c4aso24448595ad.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 06:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781529020; x=1782133820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1E7ZDQ/vRPEudqAPFJK7mtuQy39jG13Z3a1aVpAYpy4=;
        b=rQ3Ph5PILMgsJlWUOpyibCiwxlCOdPbSyhfhKWBshEX+Ekvuv1sok7S9m10qpY7Aeb
         hMZYRg6HUTi1r5XtwJUAr7M87DIhkGFvSfHM4vWETVAioJG6gylmFCaFfPuW8eyHhJpX
         keSngZOmiy/1cdkA4u4QJREG+bB4cOGphWiuXtHV523YPyLSl5DtG2ZiX+J6Y5MkfVNI
         eaDC9efBoSo6xwfxKkOkd3MpZw+czyy7sReHFX05TA3REo2P2PonkLkn0rUMbDaEeWT/
         bJoOcF4VSpLQhO08fHHSAm0yZGjL7zM8HRx2c5w/RPQLAtq6gMqnBjShY9ffE+62J/7R
         weaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781529020; x=1782133820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1E7ZDQ/vRPEudqAPFJK7mtuQy39jG13Z3a1aVpAYpy4=;
        b=FnJgRl/tjPSJNjKY9QA6ckn8yIYktsO1uqujGFtWV9IirpG01JH208Y7TPGZzaaXD/
         e0uhnTqlWWKIQnUzrIDj2Ql/Dt3QrLWIuTif9V0UhqmceHwxcSFqByFX0wfTomOzRmLZ
         x3XVFFqE040gSUb2rn615BKs7/wCZlyeUI2BZODhD/jKI0IA+tA2krwRqwNnQhcIbcdf
         HWC1wl5ZnEQ3ynEk6C3UNrMbo/vras4yGW6hDrbQvMyBrX1pnCX43PBaD2KjHSHvt+o0
         ktGXfybB06NtSyNBtSKMd8os5R40k8QH1T7af2ZadF6n+CpVQWHg3kbtEBBiKgjLyUT2
         qFgA==
X-Gm-Message-State: AOJu0YyRS9iZZ8ZpKcnBUExWiacgRoBR8sZZzKJfytcVfOk1lc+g9igR
	SmqqHAcAkg4hYLadUMNUFV0438lnsy4znY8DyebjJRLRQyYTA/IFx4zFj1aFt/J5
X-Gm-Gg: Acq92OF7mlQnHrJEcWddPjqv9EVHJAnrUiIw6aDtL3qkP7o4gal0oKwnVLrBkOIKcXd
	40xC/p7v/eM7Hb/WX6D+NgRoA2/g6HoCNGHIoM8ySRdJg1akScjFncEgojaHj5/V9kzwr9BI+Uo
	I8dKccO+mUh6Pr5s05ePFLp0DiNf80SnPomBSi5O+TFOOcrv24TTvpVoowfEoQXVSMSPfc9qC1t
	Wypj7JFd1/4GFpMJwJgMkyzj8CV2HP3vTAyI3LNxqcL8p6E2kfmSVBjPmm+Py/wEcgfNoYraa5P
	AUMfL61dZbbqdEpNarCeuaFSWdp5WI+3WuA10kikoLoWXMlBzgUuvWBlSLhP6q+zsOywkVmeb8J
	NBaZAJDb1G+RCLyto+M3ntnmNX+lVG9DyRPJxPTJ4GBdkXpCc9dwf8OvgWA1fLoZztuMiaxl1Nh
	97NLMYEf6xUrvkteMg+95+BlYG5b47RYe3O6rM
X-Received: by 2002:a17:902:da8b:b0:2c1:e9f8:758d with SMTP id d9443c01a7336-2c411c799e5mr173766525ad.22.1781529020401;
        Mon, 15 Jun 2026 06:10:20 -0700 (PDT)
Received: from vbox ([117.215.39.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c432c8c1f9sm105247775ad.59.2026.06.15.06.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 06:10:20 -0700 (PDT)
From: Tejas <tejasmutalikdesai@gmail.com>
To: devicetree@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	sstabellini@kernel.org,
	Tejas <tejasmutalikdesai@gmail.com>
Subject: [PATCH v2] dt-bindings: arm: xen: Convert to DT schema
Date: Mon, 15 Jun 2026 18:39:28 +0530
Message-ID: <20260615130928.10198-1-tejasmutalikdesai@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615112625.7892-1-tejasmutalikdesai@gmail.com>
References: <20260615112625.7892-1-tejasmutalikdesai@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Convert the Xen ARM device tree binding documentation from the legacy
plain-text format (Documentation/devicetree/bindings/arm/xen.txt) to
the YAML schema format, as required by the modern DT binding process.
The old xen.txt is removed as the YAML schema is now the authoritative
source.

The YAML schema:
  - Uses the preferred dual license (GPL-2.0-only OR BSD-2-Clause)
  - Validates compatible string format as "xen,xen-<major>.<minor>"
    followed by the generic "xen,xen" string
  - Documents reg as accepting 1..N regions (region 0 mandatory for
    grant table mapping; regions 1..N optional extended regions)
  - Documents the uefi subnode with correct types:
      * xen,uefi-system-table:   uint64 (guest PA of UEFI System Table)
      * xen,uefi-mmap-start:     uint64 (guest PA of UEFI memory map)
      * xen,uefi-mmap-size:      uint32 (size of UEFI memory map)
      * xen,uefi-mmap-desc-size: uint32 (size of each mmap entry)
      * xen,uefi-mmap-desc-ver:  uint32 (mmap descriptor format version)
  - Marks all five xen,uefi-* properties as required within the uefi
    subnode; the source table lists all of them as unconditionally
    populated by Xen when UEFI is supported
  - 64-bit properties use /bits/ 64 <value> in the example, consistent
    with other bindings carrying uint64 properties (e.g. opp-v2.yaml,
    arm/mali-bifrost.yaml)

The uefi subnode was originally introduced through a multi-version review
series (v2..v7); the mistakes caught during those reviews (typos,
duplicated UEFI spec content, insufficient description of Xen-specific
hypercall semantics) are avoided with deliberate caution here.

Note: the example emits a dtc warning (unit_address_vs_reg) for the
/hypervisor node. Both the normative text in xen.txt ("Xen ARM virtual
platforms shall have a top-level 'hypervisor' node") and the example
in xen.txt mandate this exact node name — the $nodename: const:
hypervisor in the schema is a direct encoding of that pre-existing
requirement. A unit address is therefore impossible despite the presence
of reg. This warning is pre-existing and not introduced by this
conversion.

Signed-off-by: Tejas Mutalikdesai <tejasmutalikdesai@gmail.com>
---
Changes since v1:
  - Switch to dual license (GPL-2.0-only OR BSD-2-Clause) as required by
    submitting-patches.rst §3
  - Add required: for all five xen,uefi-* properties within the uefi subnode;
    the source table lists them as unconditionally populated by Xen
  - Fix grammar: "an HYPERVISOR_memory_op" -> "a HYPERVISOR_memory_op"
  - Fix subject: s/YAML schema/DT schema/ per submitting-patches.rst

 Documentation/devicetree/bindings/arm/xen.txt |  62 ---------
 .../devicetree/bindings/arm/xen.yaml          | 120 ++++++++++++++++++
 2 files changed, 120 insertions(+), 62 deletions(-)
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
index 000000000000..f4ba3aea2483
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/xen.yaml
@@ -0,0 +1,120 @@
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
+description: |
+  Xen ARM virtual platforms shall have a top-level "hypervisor" node with
+  the properties defined below.
+
+properties:
+  $nodename:
+    const: hypervisor
+
+  compatible:
+    description: |
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
+    description: |
+      The interrupt used by Xen to inject event notifications.
+      A GIC node is also required.
+    maxItems: 1
+
+  uefi:
+    type: object
+    description: |
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
+    / {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        gic: interrupt-controller {
+            #interrupt-cells = <3>;
+            interrupt-controller;
+        };
+
+        hypervisor {
+            compatible = "xen,xen-4.3", "xen,xen";
+            reg = <0 0xb0000000 0 0x20000>;
+            interrupt-parent = <&gic>;
+            interrupts = <1 15 0xf08>;
+
+            uefi {
+                xen,uefi-system-table = /bits/ 64 <0x1301415>;
+                xen,uefi-mmap-start = /bits/ 64 <0x7591400>;
+                xen,uefi-mmap-size = <0x1800>;
+                xen,uefi-mmap-desc-size = <0x30>;
+                xen,uefi-mmap-desc-ver = <1>;
+            };
+        };
+    };
+...
-- 
2.54.0

