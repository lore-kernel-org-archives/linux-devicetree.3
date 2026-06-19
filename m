Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023B9378D64
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 10:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781866285; cv=none; b=sMsOKnodEg5WXhgEgCbRxnAxYgnAJsnhTxgHG0Zss8SfcZ6B0W9/Bm4juZrPf0FNTFBSSdgutrHD7zeUO7HLfbo1K5IHi8aazYWSI22MkZ40m93Enwsu88ioODOhp++/0e3LzwstGa2py4V83IDjUQujwH6ke6RBWK5FaR/Bf2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781866285; c=relaxed/simple;
	bh=c3QBvR9etjfUYqIwhRhYKVh0Kjf5tlBELO2oNV54xdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tm3Gewqg4raiHMA8Oh+yYN0retpWOLOXduCDo6SPS5cqdtPhxFQ73fuSv2fB7hspDASrGt+uKTR2jyuxk+3tOY3LAx/RTVD4RX8TKWgoz5nV6DP/wm5L++2tnYgRlBYMlOkUM8vgL8Yi2CGf14j2bSMqkK2btO50DDmeXXYmpQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=XBTpA4Z7; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="XBTpA4Z7"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-842848fd613so1799412b3a.3
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 03:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1781866282; x=1782471082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iyCAlXy5U92yJRNxpudE8QDW5HtKMoI60RBC7r6sEOQ=;
        b=XBTpA4Z7gW4PBnA7royWh082YVCr41zt7Cy+fkUJ45VvyX/T/MmAed1xNP2fVkXPuP
         qoagpWhv2yArHkiOzZi0RtJ1qXwbCgr4kSbYiEdzyiEQpJqNEctZFyUvvDBmmxugVrmm
         yaN/crbbD1PGHrgR5rW8ugrV2TwWbOxnx76Oampy+orYgTy1joGGIOX/Ov+JullAifYl
         DEgeJId+JrEymdNl5znl0mMcsvP0cmtDW1hgRDl8IDKKs1NBEnsbwBWK/QJjIZ9MdPLi
         g4YY1zEbipmDZiEvjDfdTba0DUTpTLkDuLbMiTsZOcy28eh6OrDx1EA2kbBShNWQa0lt
         6nFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781866282; x=1782471082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iyCAlXy5U92yJRNxpudE8QDW5HtKMoI60RBC7r6sEOQ=;
        b=Q7+JSyalufTyAJEBafcBKTCVYYbPYnnePiF4V5w3BAyCJzBeoqeR1Xn+9kq5M1zw6S
         XL6SG5ed5xXAW/3rrLEHrdszk2vbOA9eYrzrbDACVEFzCSc3u8HT8hcGKAXQKJMt+/gj
         GLJqs2MKWb7NKp+577ML0Q5noUOB+6Zq7ph8YIEORLglsZAZaLQQY7U//hhniyJNWMyl
         TkqTMlbEICfY8QII1RvASSgIAJmY0+tmYCbadV9vjW8DE709TURJDpr6MPncdUw5mWvG
         Vs+JFKRsIU5YceYJZlxVuKUsaKAraxU29zBqNzhLoGTfTkm63VlMnCSSDpI0Bp1vgo0t
         jePw==
X-Gm-Message-State: AOJu0YyoOcUo3aWlt/OxoxeYaJ87XXRBb5bfY5W/rGF0w5LiouypJug3
	9cNrcudW5YNhRkfEaz6vIJDM2MrHm+0f2CpeqvTsSk01vp/XX6561Ga/EgZavh8yCVhPaOaSaoJ
	SEh/dMXeQrgynx1UzrogqFuSYFEzp91f9++8yG15mNrjO2+Cu+4HzSLEZJm0ISbMcc95YI0y5uO
	zc3c1obK4Xx9yn8niFtPagToazGDP64ybkX1rJcLjfFA9TxyvH6e/C
X-Gm-Gg: AfdE7ckrKx7zfJ8ijwLJkS5SzkCjusOtigQ75xMW0cuLEkVOLvyoWGEAn9GWn5ZommP
	bU+395tX81Acos34yDO1CySNKViD7HJSno2mis1ityIiu1BhMPpFxLCygbcvNSm8DXHAo/4dPpU
	2c3Wa6VEXB/AXwG+V5P2MoECsz47p3VicZEdN25MGUbBqhz/Uq+oFQSPZRD43IdVSHhZmtc6rGA
	Q5qGfbEboxjWNarKjhp9zX/XvTsDWMvnLCjpVrWl9uTXEkXNIvdIlCBPhwfOG7AAqBkpXasHG9F
	vCuG6J/qEfBboRmf6yc4vZGqF80ZPvbfIdlt+a61XIhGFpxIoBwqAzFqNyGi+sJUkcKq/fvw6Xe
	dAMIt+CK9UW7TE4VI6jDzovmwC7mvqL5Gkn8ylWR0fRL+vjq/u+gaKu2w/bGyQManwJorqgk8h8
	xpRcuihQi8TSVbN9rpZ/cesLZCu3pikxX51D/j
X-Received: by 2002:a05:6a21:468a:b0:3b9:5efb:cb2a with SMTP id adf61e73a8af0-3bb31adb348mr3976874637.3.1781866282139;
        Fri, 19 Jun 2026 03:51:22 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8a84c6eb1bsm1993583a12.2.2026.06.19.03.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 03:51:21 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com,
	dlan@kernel.org,
	guodong@riscstar.com,
	dfustini@oss.tenstorrent.com,
	michal.simek@amd.com,
	junhui.liu@pigmoral.tech,
	darshan.prajapati@einfochips.com,
	akpm@linux-foundation.org,
	zhangchunyan@iscas.ac.cn,
	luxu.kernel@bytedance.com,
	pincheng.plct@isrc.iscas.ac.cn,
	nick.hu@sifive.com,
	jim.shu@sifive.com,
	zong.li@sifive.com,
	greentime.hu@sifive.com,
	robin.randhawa@sifive.com,
	scott@riscstar.com,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [RFC PATCH 3/3] dt-bindings: sifive: Add WorldGuard Checker
Date: Fri, 19 Jun 2026 18:58:34 +0800
Message-ID: <20260619105834.1277302-4-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20260619105834.1277302-1-peter.lin@sifive.com>
References: <20260619105834.1277302-1-peter.lin@sifive.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT binding for SiFive wgChecker2, a hardware firewall enforcing
WID-based access control in RISC-V Worlds. Provides checker slots to
program per-WID permissions for downstream resources, with optional
sub-range partitioning.

Link: https://github.com/riscvarchive/security/blob/main/papers/worldguard%20proposal.pdf
Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
---
 .../devicetree/bindings/riscv/worlds.yaml     |   9 +
 .../bindings/sifive/sifive,wgchecker2.yaml    | 237 ++++++++++++++++++
 2 files changed, 246 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sifive/sifive,wgchecker2.yaml

diff --git a/Documentation/devicetree/bindings/riscv/worlds.yaml b/Documentation/devicetree/bindings/riscv/worlds.yaml
index cc8b3747591e..c39a06c2dd8d 100644
--- a/Documentation/devicetree/bindings/riscv/worlds.yaml
+++ b/Documentation/devicetree/bindings/riscv/worlds.yaml
@@ -34,6 +34,14 @@ properties:
     minimum: 2
     maximum: 64
 
+  sifive,trustedwid:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 31
+    description: |
+      The World ID (WID) designated as the trusted WID for this platform.
+      Transactions tagged with this WID are authorized to access and configure
+      WorldGuard blocks, including wgCheckers and wgMarkers.
+
 additionalProperties: true
 
 examples:
@@ -44,6 +52,7 @@ examples:
         #size-cells = <0>;
         timebase-frequency = <1000000>;
         riscv,nworlds = <4>;
+        sifive,trustedwid = <3>;
 
         cpu@0 {
             device_type = "cpu";
diff --git a/Documentation/devicetree/bindings/sifive/sifive,wgchecker2.yaml b/Documentation/devicetree/bindings/sifive/sifive,wgchecker2.yaml
new file mode 100644
index 000000000000..043c748385ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/sifive/sifive,wgchecker2.yaml
@@ -0,0 +1,237 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2026 SiFive, Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sifive/sifive,wgchecker2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SiFive WorldGuard Checker
+
+maintainers:
+  - Yu-Chien Peter Lin <peter.lin@sifive.com>
+
+description: |
+  The RISC-V Worlds ISA extension defines World IDs (WIDs) as architectural
+  identifiers that tag each system transaction with its originating context.
+  System integrators assign WIDs to execution contexts such as privilege modes,
+  trusted execution environments, or other isolation boundaries.
+
+  The SiFive WorldGuard Checker is a hardware firewall positioned in the
+  system interconnect fabric. It inspects every transaction, evaluating the
+  WID against access control policies encoded in checker slots for each
+  protected resource. Transactions from unauthorized WIDs are blocked and
+  reported as bus errors, interrupts, or both.
+
+  This enables spatial partitioning of memory regions and memory-mapped devices
+  across execution contexts. Different address ranges can enforce distinct
+  policies, allowing isolated workloads to coexist with hardware-enforced
+  protection.
+
+  The wgChecker acts as an access-controller provider as defined in the
+  access-controllers framework. Protected devices are consumers that declare
+  their access policy via the access-controllers property. The hardware
+  supports up to 32 World IDs.
+
+  The World ID authorized to configure WorldGuard blocks is specified by the
+  sifive,trustedwid property in the /cpus node.
+
+allOf:
+  - $ref: /schemas/access-controllers/access-controllers.yaml#
+
+properties:
+  compatible:
+    const: sifive,wgchecker2
+
+  reg:
+    maxItems: 1
+    description:
+      Base address and size of the wgChecker memory-mapped I/O registers.
+
+  interrupts:
+    maxItems: 1
+    description:
+      Interrupt line asserted when a WID access violation is detected and
+      interrupt reporting is enabled in the slot configuration (IR or IW
+      bits set).
+
+  '#access-controller-cells':
+    const: 7
+    description: |
+      Specifier for one access-control rule, encoded as seven u32 cells:
+        <addr-hi addr-lo size-hi size-lo perm-hi perm-lo config>
+
+      where:
+        - addr-hi, addr-lo: 64-bit base address of the protected region.
+        - size-hi, size-lo: 64-bit size of the protected region in bytes.
+        - perm-hi: Permission bitmap for WIDs 16..31. Two bits per WID:
+                     bit 2*(WID-16)   = Read  permission
+                     bit 2*(WID-16)+1 = Write permission
+                   Set bits grant access. Use 0x0 for systems with
+                   riscv,nworlds <= 16.
+        - perm-lo: Permission bitmap for WIDs 0..15. Two bits per WID:
+                     bit 2*WID   = Read  permission
+                     bit 2*WID+1 = Write permission
+                   Set bits grant access.
+        - config:  Slot configuration bits:
+                     Bit 0 (ER): Report read  violations as bus errors
+                     Bit 1 (EW): Report write violations as bus errors
+                     Bit 2 (IR): Report read  violations via interrupt
+                     Bit 3 (IW): Report write violations via interrupt
+                     Bit 4 (L):  Lock bit - prevents further modification
+                   Bits 5..31 are reserved and must be zero.
+
+      Multiple entries may be listed to apply different policies to
+      different address ranges, including sub-ranges within a single
+      physical resource.
+
+required:
+  - compatible
+  - reg
+  - '#access-controller-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    // Example 1: Single device protection
+    // WID 0 and WID 3 have RW access to UART; errors and IRQs reported.
+
+    cpus {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        timebase-frequency = <1000000>;
+        riscv,nworlds = <4>;
+        sifive,trustedwid = <3>;
+
+        cpu@0 {
+            device_type = "cpu";
+            reg = <0>;
+            compatible = "riscv";
+            riscv,isa = "rv64imac";
+        };
+    };
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        uart: uart@1c1000 {
+            compatible = "ns16550a";
+            reg = <0x0 0x001c1000 0x0 0x1000>;
+            reg-names = "control";
+            interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
+            // WID 0,3 RW; report errors+IRQs
+            access-controllers = <&wgchecker0
+                                  0x0 0x001c1000 0x0 0x00001000
+                                  0x0 0x000000c3 0x0f>;
+        };
+
+        wgchecker0: wgchecker@1c2000 {
+            compatible = "sifive,wgchecker2";
+            reg = <0x0 0x001c2000 0x0 0x1000>;
+            #access-controller-cells = <7>;
+            interrupts = <80 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-parent = <&aplic_m>;
+        };
+    };
+
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    // Example 2: Multi-reg device with separate per-range rules
+    // m_mode: WID 3 only; s_mode: WID 0,3 RW.
+
+    cpus {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        timebase-frequency = <1000000>;
+        riscv,nworlds = <16>;
+        sifive,trustedwid = <3>;
+
+        cpu@0 {
+            device_type = "cpu";
+            reg = <0>;
+            compatible = "riscv";
+            riscv,isa = "rv64imac";
+        };
+    };
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        device: device@10000 {
+            compatible = "vendor,soc1-ip";
+            reg = <0x0 0x00010000 0x0 0x8000>,
+                  <0x0 0x00a00000 0x0 0x4000>;
+            reg-names = "m_mode", "s_mode";
+            // m_mode: WID 3 only; s_mode: WID 0,3 RW
+            access-controllers = <&wgchecker1
+                                  0x0 0x00010000 0x0 0x00008000
+                                  0x0 0x000000c0 0x0f>,
+                                 <&wgchecker1
+                                  0x0 0x00a00000 0x0 0x00004000
+                                  0x0 0x000000c3 0x0f>;
+        };
+
+        wgchecker1: wgchecker@35000 {
+            compatible = "sifive,wgchecker2";
+            reg = <0x0 0x00035000 0x0 0x1000>;
+            #access-controller-cells = <7>;
+            interrupts = <81 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-parent = <&aplic_m>;
+        };
+    };
+
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    // Example 3: DRAM partitioning with secure enclave
+    // Sub-range 1 [0x80000000, 0xC0000000): WID 0,1,3 RW
+    // Sub-range 2 [0xC0000000, 0xC1000000): WID 1,3 only (secure enclave)
+    // Sub-range 3 [0xC1000000, 0x100000000): WID 0,1,3 RW
+
+    cpus {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        timebase-frequency = <1000000>;
+        riscv,nworlds = <4>;
+        sifive,trustedwid = <3>;
+
+        cpu@0 {
+            device_type = "cpu";
+            reg = <0>;
+            compatible = "riscv";
+            riscv,isa = "rv64imac";
+        };
+    };
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        ddr: memory@80000000 {
+            device_type = "memory";
+            reg = <0x0 0x80000000 0x0 0x80000000>;
+            access-controllers =
+                <&wgchecker2
+                 0x0 0x80000000 0x0 0x40000000
+                 0x0 0x000000cf 0x0f>,
+                <&wgchecker2
+                 0x0 0xc0000000 0x0 0x01000000
+                 0x0 0x000000cc 0x0f>,
+                <&wgchecker2
+                 0x0 0xc1000000 0x0 0x3f000000
+                 0x0 0x000000cf 0x0f>;
+        };
+
+        wgchecker2: wgchecker@40000000 {
+            compatible = "sifive,wgchecker2";
+            reg = <0x0 0x40000000 0x0 0x1000>;
+            #access-controller-cells = <7>;
+            interrupts = <82 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-parent = <&aplic_m>;
+        };
+    };
-- 
2.43.7

