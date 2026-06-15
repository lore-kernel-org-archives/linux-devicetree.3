Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8CE3E4C6C
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 11:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781522793; cv=none; b=CKyo/wb+DcnEiCyS6ZiNWe8wS1VZerK1JuUd9ADL1HiOYUwhWDm6lBjAxKA2XyXYTSFTXBBMFgGXoUEI1UZm2hjRqxKsUnTxk/vPuovvL7YjSBCduGBa22JcTHVXxeQ3kNBB99UWgJljRfmJXTn9866xpCMroPDTxJU2edCp/Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781522793; c=relaxed/simple;
	bh=hP+2XiLIB+gTL9i+OgmpZuIqU6+CJhVBzpLc1SYZMYA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tR6B0B/LSmAXcwg8iXXBgRN7HFFqqX+0RUEft04Ia45O7tcSbnMsN8o7oBLxbsYLSIIRApk527aYnpwbw0o0tqNuxg6vLfXLVgUYPXhUo7xd9d1Yuj5m5UqkJhqOxSilMeYSXiSmLkLeQEdh86NaAl3cGL+5Ymj7DY6YjI1pMMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BOZU25KI; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BOZU25KI"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso28591695ad.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 04:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781522791; x=1782127591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bj+KG3OVUhBoWkPimYDUROHV3nvGOOs1vbpk2ZeW3hA=;
        b=BOZU25KI/1sPmtMWQrhMC2dOEOSL6Bn9FCRFizQ9Kaggs6S7kO9j9Ug0i8ox1/mKJk
         BP0FhaS8SwPalhT1e6YLLROa0zmJhEkFPfwTE8LYkjVZKLhVXCgeHzV7/Bv/Rr2wONFo
         5NIvGetO1ZaMW5G+VWd662pe3Oq/S73Rv6n6Hzi7OIcrKytd6TkHHv3EvZ6jcyKDnUPb
         9eeqoTexuLRXzSXwxawjhV0Wv5oiIgD3tL4pDwZimzuCqVOcVTnWBpyHSwZj9kXqNLq5
         /261YACyUDBcwrVHUiqmk+0dCqr+nl9T9llU9j9i4duVAsy0GzgxiYcOWp5bLf6hdiHx
         J68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781522791; x=1782127591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bj+KG3OVUhBoWkPimYDUROHV3nvGOOs1vbpk2ZeW3hA=;
        b=f4MXYnVWTMTfeg8+janGUqwiCdwUEPHExSUoWReEU9MeDMsMdo/LpigSqbRMK/bkks
         WXhnV2esur4VBV9+iE0BXV3I2p9iF9zVi5bpuVf1LzPlUEwIdDD1JAsUe735garyS1+4
         QgxKl6DFTAdSFLhNFsX+HKNFivYd3AEy3+VTZfisK9uLxgm7d/d4XDRchxRVFT5weSgI
         mOw44EZzRUi3ocWiPZ06tWE8q1Qrc/JDHK9a9uGFds9pmNDp0xx3iUjGEsOsbD9gsCVm
         YTbs5shVDeEbugeA48PLtuDYtYvzuTE0lsto4upoErTV9eHli5+0c1yizxzpfnUIBid5
         Tc5w==
X-Gm-Message-State: AOJu0Yw7plV3ERCRr8nGlfcWFc9ilnpcsP5nxlRnVdkGZk/7wKdpZJpI
	qbLMe5Qf4f4Bleroiw+wMJy2pEpsLQrQcTfiJUenv+xkdCf7KooGxsiY9DD80XIF
X-Gm-Gg: Acq92OEudi/kZVEAGugyOz7llM10xQPLXQbS7zq9uFVuhmRLWfr3XAPi3e3kFSUw6wk
	GRpF2DVC01aEm0Mz5s3FHoZf9sVB7jprAgb//o/WMS4ovoPiiqjFsf9kTkI7d15dxon+chjDvqn
	MULBZncCj/Y1ZdQHiGksJ+f5hViourFpDWcoLdOomBBWtX8aSwFAiBNOhHtuQtX5Bd8oAcwwcRo
	CndIc8Zql0fHcO1V+uo/duVv9lhNrwSzNn58aEb+BFpWzelhV8Nri0I/+Iy+2YSNtXUmUfGFVTo
	F916Ob7naIwv1CsF6dt558y3tFpSwDWrN2vJ4ozzmPd2YxoxubGIpZC+9HlInYTtTAJqoZCArd5
	XTaD9U7/6t2RWe7xtxqRiK/UJ/2Y5QWl6bM4BXyPGXpaZJTAl28gFXRzclixOJ7KfkefGI1o4Mw
	tmx1t0RyW+mxJu6oxlyusK4ZP3fhdarb2Tk+iK
X-Received: by 2002:a17:903:46c6:b0:2b0:6a22:5165 with SMTP id d9443c01a7336-2c41050a155mr156412165ad.7.1781522791374;
        Mon, 15 Jun 2026 04:26:31 -0700 (PDT)
Received: from vbox ([117.215.39.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c43326b085sm95644305ad.70.2026.06.15.04.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 04:26:31 -0700 (PDT)
From: Tejas <tejasmutalikdesai@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	sstabellini@kernel.org,
	Tejas <tejasmutalikdesai@gmail.com>
Subject: [PATCH] dt-bindings: arm: xen: Convert xen.txt to YAML schema
Date: Mon, 15 Jun 2026 16:56:25 +0530
Message-ID: <20260615112625.7892-1-tejasmutalikdesai@gmail.com>
X-Mailer: git-send-email 2.54.0
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
 Documentation/devicetree/bindings/arm/xen.txt |  62 ----------
 .../devicetree/bindings/arm/xen.yaml          | 113 ++++++++++++++++++
 2 files changed, 113 insertions(+), 62 deletions(-)
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
index 000000000000..3117f6d3828c
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/xen.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: GPL-2.0
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
+      resources should be mapped to, using an HYPERVISOR_memory_op hypercall.
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

