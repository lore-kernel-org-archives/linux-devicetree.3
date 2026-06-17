Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84E847DFB3
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 15:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781710199; cv=none; b=E9AiNawWO0ihKmtXzBw1Ryvkv5D1yK9yTI3ZkBcjoLs7ULn55oBhKqmHlNgr5MPMysyg4ns+d4er5b80VEv624hxF33hZRC5Ja02THkvmAWwkCHiWwZZ5/QCJDDPBKUjAX6Vqs7NyWdhxzMKh2v81llUsaxL4Xk64e7J5ZyDvek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781710199; c=relaxed/simple;
	bh=0cjHTkDEf6h6LbRCweZdAbvNoN3gjnBVU5vCNl3E9To=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V+4i9oMXhsWsZCCJqgoKaNTohquT8WBg4Rki3Jvg0f6TaX/p9tOL+vaWHN8eT+xJ+XhTBLNf/9gtr53hpE/a9olqw8QTcKaYnY/emx5hP7xsE+i8gYKbPT6dzev+Uat1Ierm3xXDdXqBQczM1gbg0jhoSpdWTPLm7GcdoJmgZIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NXrOJvx/; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NXrOJvx/"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8422871b42dso3746804b3a.3
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 08:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781710191; x=1782314991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T67q/8pDuLgsLM/EtWC++0s2y9IRennHDzBfWjmX57o=;
        b=NXrOJvx/z8cpXGl4pjLwZS03kRim9gJlw0mfIolUO1UhYlGVYWAh3q+umMqdJWMNXU
         JEkkZ2j7OA0WxJiHS0GnAA4sj7a04Ore67vD+kfbAipBb9R54N0uyXcc3MaDAnqCJemw
         s0QzDlb6e1A32bxk95yEMh1ktauuUwnMSScLNmDIp+dXzYRz4C+5orQ4zWfunQElHfbU
         lnE3G1dxfCgH1Y/bXE3ALG3mXSR48l0SG3VjdxPonucniMgb5ugBX30Y5ufhllkTpg8A
         w1vzjvhmv3+QFtmKDVo8CaH/7ZXc+IcWAIPh0tBPBjsM8nN0u5Di3Qk5Y9yhTW2mG6S5
         oBTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781710191; x=1782314991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T67q/8pDuLgsLM/EtWC++0s2y9IRennHDzBfWjmX57o=;
        b=fG8TDUVb5UiRSkUsEbqw2gXNCJ3p0dYl/PmPQHbk2eteONM3l6LhqODrbkzsBpK7Uc
         PqlXF0SL4MB2mvjNVhXGCWpRAdnw+anqkutJ0gf5sRnlt3O5THsri4DHA9vXBGDXXhbk
         0rsJYKvsjFNfCuwFwdhgZB/jnZ3QPvctXD5IAs8jvz9xBZHJRbLI7UARoRGuONC6lOC5
         XqYLn2ftdcbSvhIm8VyYtASDVlLmtieDV4+Zpdwx8qr2fAWl9HCm6zFLQ+ozCo0C9PXk
         ssio9AdPvBwcU7d1YYRF/kOtn57PYHo1cWTFNi1Rvhbs6ZnRc5zCci+LVtCeVtwO8MtA
         M01w==
X-Gm-Message-State: AOJu0Yy14RMd69bUvb74NCpXlL69Luraz1rHBbM+4MxDqRGXVMGkeLYZ
	iUyBk9w5yaiKX9qmuG7Kj44/ao+MSdXflM3xDHBIReikJAwY0K2F7CA/qik/6kfT
X-Gm-Gg: AfdE7cnBeF5CWP3kghexRQn7RB6b6JrEITbNruJ6sLfUW+nlE7s6qC0A76LZ0B3JHvV
	BPdoKhvI2SPFvDpS+BqQwnrQLzJlXg8Fq+jLPWkgvTo4+aXigWd2VMzStSqZcFc5jAkyoDNwPL+
	0crLOL3EaulXeWFWMVg+xEJTbSAz885kPaSTGWpCG5SMAEQFDbZ4iYVS4ZmqsnLLJ2z+ELn9hIz
	w2RBLkTwz+3w9z9Ob4rqinBacNZsnvA/7dvFGZ5j9x3Y0pw1b8N+/9x+Syvlp0/ZzWU9ZxgZTsp
	93mJZZd8zVnpfetZEc6qRBCDyA+gac7SUaxDAj0HVjNdeMFJZyMERbiw8Ck9dT+vpZGJ41pK0eN
	565lS3sACMjQ19zgkFIUjjgzfHCkrvMWByqqMiGcjz3f+tRWfCh+ZmP8mQSTUXzlsInK8Trdrac
	j0FZAfFtA87gOe7TTZ+i/w+3NQscI=
X-Received: by 2002:a05:6a00:400b:b0:842:4982:81c with SMTP id d2e1a72fcca58-84524495b3fmr4358799b3a.20.1781710190624;
        Wed, 17 Jun 2026 08:29:50 -0700 (PDT)
Received: from vbox ([117.215.38.226])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b040718sm17088708b3a.51.2026.06.17.08.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:29:50 -0700 (PDT)
From: Tejas Mutalikdesai <tejasmutalikdesai@gmail.com>
To: devicetree@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	sstabellini@kernel.org,
	Tejas <tejasmutalikdesai@gmail.com>
Subject: [PATCH v3] dt-bindings: arm: xen: Convert to DT schema
Date: Wed, 17 Jun 2026 20:58:30 +0530
Message-ID: <20260617152830.51382-1-tejasmutalikdesai@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tejas <tejasmutalikdesai@gmail.com>

Convert the Xen ARM device tree binding documentation from the legacy
plain-text format (Documentation/devicetree/bindings/arm/xen.txt) to
the DT schema format, as required by the modern DT binding process.

Signed-off-by: Tejas Mutalikdesai <tejasmutalikdesai@gmail.com>
---
Changes since v2:
- Replace 'YAML schema' with 'DT schema' in the commit description
- Drop unnecessary '|' block scalars from description fields that do
  not need to preserve literal formatting
- Fix unit_address_vs_reg warning: replace $nodename const with a
  pattern requiring a unit address; update example to hypervisor@b0000000
  and drop the root node, GIC, and interrupt-parent
- Update Documentation reference in arch/arm/xen/enlighten.c from
  xen.txt to xen.yaml

 Documentation/devicetree/bindings/arm/xen.txt |  62 ----------
 .../devicetree/bindings/arm/xen.yaml          | 109 ++++++++++++++++++
 arch/arm/xen/enlighten.c                      |   2 +-
 3 files changed, 110 insertions(+), 63 deletions(-)
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
diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
index 25a0ce3b4584..0b7b7e3417e3 100644
--- a/arch/arm/xen/enlighten.c
+++ b/arch/arm/xen/enlighten.c
@@ -251,7 +251,7 @@ static int __init fdt_find_hyper_node(unsigned long node, const char *uname,
 }
 
 /*
- * see Documentation/devicetree/bindings/arm/xen.txt for the
+ * see Documentation/devicetree/bindings/arm/xen.yaml for the
  * documentation of the Xen Device Tree format.
  */
 void __init xen_early_init(void)
-- 
2.54.0

