Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BDE4D90A6
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 16:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785343207; cv=none; b=NSzhRdJKsocCGs3u/3P6/aGD1I1hG+cNeL4EopcQsHrKRWx1zxyu9mIFXIpZXXqHBnQUAwMmmQaPD40/MxzMF6PzupIPPJTB+2+iXSm9EtEYj4RPkVknc3PNG5La2exG2AXlcPb8KjtpsXk3eAiWf5xz0bGD+Iq9mmtUi0ZI3JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785343207; c=relaxed/simple;
	bh=0hnBmoGCaCvZIjr7oixDe3dWaD++sw2q2fHq8gQi4+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T1b9A6NfS+HuUOvJOIXx804Y6s791sfFf17xNxTj8wAMEyVSuwyddyebfZbUvmJCmTpUHat8egtUVvKu/naYY1HhLJ+g4qX74pGPcfnJly5HY4xNtjsAuJqUYyepv/8NGHarfPtIp9HRfiMNHEcUuIF/Cvx2dgaarOc6PCB871g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=LMCSX+6u; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="LMCSX+6u"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4954afac04bso13309085e9.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 09:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1785343193; x=1785947993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cS5bnPBGMkIbEsasH3IiqlepISBkwGNxs11plFYtxYU=;
        b=LMCSX+6uxf42Sl+Z0QtFxoDM7Frg13TieBgkBQe1ynpt/j1U0KaMgzYhzVbKpn9OmC
         J9/wQep1lHEWQSh3WeTz+GbcqclbjCwD3JMKFy80hLr23QjmMVeZCbVQpUqv4gAUUwqh
         Zq74vqpdeIeVVyGLcO6TNdrfkUb+8IegiXv1bLRFbB+cRrjbUd1aDlOK2lQ4XwbixleJ
         Lig72OCAbG08eKRHx0oXWcYRiQie4xTWO8fATDTimQIV3957q8hag8pr0QaQ6Ku8KYs/
         gDoCY8e/ItKQ/tPjV6aQV7bejOQCDIqbAUFzKUKbYMdZfwWIKB94mAHgToQVadrjh85r
         Fg4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785343193; x=1785947993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cS5bnPBGMkIbEsasH3IiqlepISBkwGNxs11plFYtxYU=;
        b=CFVHg3MuXfkvMxNKsZLHqW4PrSkttwt4RInayHDt4ufTZu1q6iK+lN47nppaRIh9UR
         xhrhl63yM9OWhT0q3UEKqX02I2lZjuvvRVxzEiNQ5GXZF1JuIBHk24/ILVc5X5JQ39r9
         +K6qFy95uylRnwYQVNazMayra/9IqVC7B6aeeP8kOoQ64VXUXKAK6Vw2zggSuP+ppUlu
         nxFAT3DktEK669gUJ2Eh8hwLCHTW2J8pN9yU8aoemjkrB8/ZGj0mLj8VUsfoC0s5/6fY
         FEzvjpyOoJZgV7/yyeKPvTkk9n8DS8rIFD1OcDFRpr+SgblDaw37STHpYs0R3scya5bZ
         z8Nw==
X-Gm-Message-State: AOJu0YxBv0KGqX4TmFv6MZFlhSGeNFKSqTOH9WdNcQPixzL5DkZqKrK3
	2l5OhvWE0+o9FYJPbrYXrsfHR06Cqssfo+OV7jEfT5yNfO88myp5oQwufbT+K9P64L7YjyYu8G2
	5pwtcd3Qh+Jlfv9dlnsPNz/7yR4oZQVl701v2t9PBswccO4YvNbU9YV2soQJwjTGlo9OreR4o5a
	eV/T8r8neB+NCkLIbB4unjmcOSBFHOQJkPaIdg7y7co+h1gNnFL9cP
X-Gm-Gg: AR+sD12A4X41FGP8Aa/lF0C1An9gH7B19VolRg0rrENbeuVAP+dKj0QUXIvEiNjcMr+
	FcM/IYdFqJtcCjz175xxDKKqwHS2M4lyFsgLtwVMjY5/8AtTD+cqPYjfehcBBEuo5gk0jPGtYg1
	R2mjKEvcRueGp1bEOsMaXN1xiBpO1dCe+qKuMzJ7brR4HGEtaOtTHqq4gl+1oVjYj7l8kisxiqn
	/PFI8d7NuIRL6PzOAsE5txw6iJ7sZfvMsDywMuNVrfAmMDUZqAJTeXbl1IZlJ5IzgZnGHHlfIxM
	l0As8B5hOrocUSfPWazwpO57Wi1RE5RQQjq4qskqz+jEXeZ0BTEzOPOV7pzvGataTR1pX3Kv+ij
	vlWCHwnfoStghAbdVaa8y3idyW2NpsePCh3dp4ogkf6QjZh+Nn7yk2AQffPeIw6PjyeN7JGk4SQ
	KH2+Nk0E9M41LX5GATnkujqIuS4X7wDpfyPKxL7mi3shRktQQy2FRtQyxr2oKcoODDkrOq6hP6H
	7Ah73lCPScbsWgEhaFHN+iV
X-Received: by 2002:a05:600c:1907:b0:495:4df2:7412 with SMTP id 5b1f17b1804b1-496c65b10edmr93741055e9.32.1785343193016;
        Wed, 29 Jul 2026 09:39:53 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45b0535sm164242145e9.4.2026.07.29.09.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 09:39:52 -0700 (PDT)
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
	anup@brainfault.org,
	pawandeep.oza@oss.qualcomm.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v2 3/3] dt-bindings: sifive: Add WorldGuard Checker
Date: Thu, 30 Jul 2026 00:39:08 +0800
Message-ID: <20260729163908.249838-4-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20260729163908.249838-1-peter.lin@sifive.com>
References: <20260729163908.249838-1-peter.lin@sifive.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add YAML binding schema for the SiFive wgChecker, a programmable
access controller integrated in the interconnect fabric of RISC-V
Worlds-capable SoCs.

wgChecker enforces World ID (WID) based access control on downstream
bus transactions. Each checker slot encodes a 2-bit permission field
per WID (read/write), enabling fine-grained memory partitioning and
device isolation between execution contexts. Violations are reported
via bus errors, interrupts, or both, selectable and lockable per slot.

The binding registers wgChecker as an access-controllers provider.
Consumers (i.e. its protected device) reference it via the standard
access-controllers phandle to declare their access requirements.

Also document the sifive,trustedwid property for the /cpus node,
identifying the privileged WID authorized to configure all checkers
on the platform.

Link: https://github.com/riscvarchive/security/blob/main/papers/worldguard%20proposal.pdf
Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
---
 .../devicetree/bindings/riscv/worlds.yaml     |   9 +
 .../bindings/sifive/sifive,wgchecker2.yaml    | 356 ++++++++++++++++++
 2 files changed, 365 insertions(+)
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
index 000000000000..c025a4765cb3
--- /dev/null
+++ b/Documentation/devicetree/bindings/sifive/sifive,wgchecker2.yaml
@@ -0,0 +1,356 @@
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
+    oneOf:
+      - items:
+          - const: qemu,wgchecker2
+          - const: sifive,wgchecker2
+      - const: sifive,wgchecker2
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
+    const: 1
+    description: |
+      Specifies the partition identifier to reference a partition child
+      node that defines the access control region, WID permissions, and
+      access failure configuration. The special ID 0xFFFFFFFF indicates
+      unprotected mode, granting unrestricted access to the device.
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  "^partition@[0-9a-f]+$":
+    type: object
+    additionalProperties: false
+
+    properties:
+      reg:
+        maximum: 0xFFFFFFFE
+        description:
+          Partition identifier. Must be unique within the wgChecker node.
+          The value 0xFFFFFFFF is reserved for unprotected mode and must
+          not be used.
+
+      sifive,protected-region:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description:
+          Protected memory region encoded as a base address and size.
+        items:
+          - description: Upper 32 bits of the base address
+          - description: Lower 32 bits of the base address
+          - description: Upper 32 bits of the region size
+          - description: Lower 32 bits of the region size
+
+      sifive,slot-permissions:
+        $ref: /schemas/types.yaml#/definitions/uint64
+        description: |
+          64-bit WID permission bitmap. Each WID N uses two consecutive bits:
+            - bit[2*N]  : Read  permission for WID N
+            - bit[2*N+1]: Write permission for WID N
+          Set bits grant access.
+
+      sifive,slot-config:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        maximum: 0x1F
+        description: |
+          Access failure configuration flags for this slot:
+            bit[0] (ER): report read  violations as bus errors
+            bit[1] (EW): report write violations as bus errors
+            bit[2] (IR): report read  violations via interrupt
+            bit[3] (IW): report write violations via interrupt
+            bit[4] (L) : lock this slot against further modification
+          Bits[5:31] are reserved and must be zero.
+
+    required:
+      - reg
+      - sifive,protected-region
+      - sifive,slot-permissions
+      - sifive,slot-config
+
+required:
+  - compatible
+  - reg
+  - '#address-cells'
+  - '#size-cells'
+  - '#access-controller-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    // Example 1: Peripheral device protection
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
+            riscv,isa-base = "rv64i";
+            riscv,isa-extensions = "i", "m", "a", "c", "smlwid";
+            riscv,pmwid = <3>;
+
+            cpu_intc0: interrupt-controller {
+                #interrupt-cells = <1>;
+                compatible = "riscv,cpu-intc";
+                interrupt-controller;
+            };
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
+            access-controllers = <&wgchecker0 0>;
+        };
+
+        wgchecker0: access-controller@1c2000 {
+            compatible = "qemu,wgchecker2", "sifive,wgchecker2";
+            reg = <0x0 0x001c2000 0x0 0x1000>;
+            #access-controller-cells = <1>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            interrupts = <80 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-parent = <&aplic0_m>;
+
+            partition@0 {
+                    reg = <0>;
+                    sifive,protected-region = <0x0 0x001c1000 0x0 0x00001000>;
+                    sifive,slot-permissions = <0x0 0x000000c3>;
+                    sifive,slot-config = <0x0f>;
+            };
+        };
+
+        aplic0_m: interrupt-controller@c000000 {
+            compatible = "qemu,aplic", "riscv,aplic";
+            reg = <0x0 0xc000000 0x0 0x4000>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            riscv,num-sources = <96>;
+            interrupts-extended = <&cpu_intc0 11>;
+        };
+    };
+
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    // Example 2: Device with multiple address regions and per-region access rules
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
+            riscv,isa-base = "rv64i";
+            riscv,isa-extensions = "i", "m", "a", "c", "smlwid";
+            riscv,pmwid = <3>;
+
+            cpu_intc1: interrupt-controller {
+                #interrupt-cells = <1>;
+                compatible = "riscv,cpu-intc";
+                interrupt-controller;
+            };
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
+            access-controllers = <&wgchecker1 0>,
+                                 <&wgchecker1 1>;
+        };
+
+        wgchecker1: access-controller@35000 {
+            compatible = "qemu,wgchecker2", "sifive,wgchecker2";
+            reg = <0x0 0x00035000 0x0 0x1000>;
+            #access-controller-cells = <1>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            interrupts = <81 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-parent = <&aplic1_m>;
+
+            partition@0 {
+                    reg = <0>;
+                    sifive,protected-region = <0x0 0x00010000 0x0 0x00008000>;
+                    sifive,slot-permissions = <0x0 0x000000c0>;
+                    sifive,slot-config = <0x0f>;
+            };
+
+            partition@1 {
+                    reg = <1>;
+                    sifive,protected-region = <0x0 0x00a00000 0x0 0x00004000>;
+                    sifive,slot-permissions = <0x0 0x000000c3>;
+                    sifive,slot-config = <0x0f>;
+            };
+        };
+
+        aplic1_m: interrupt-controller@c000000 {
+            compatible = "qemu,aplic", "riscv,aplic";
+            reg = <0x0 0xc000000 0x0 0x4000>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            riscv,num-sources = <96>;
+            interrupts-extended = <&cpu_intc1 11>;
+        };
+    };
+
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    // Example 3: DRAM partitioning with a secure enclave
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
+            riscv,isa-base = "rv64i";
+            riscv,isa-extensions = "i", "m", "a", "c", "smlwid", "smwiddeleg", "sswid";
+            riscv,pmwid = <3>;
+
+            cpu_intc2: interrupt-controller {
+                #interrupt-cells = <1>;
+                compatible = "riscv,cpu-intc";
+                interrupt-controller;
+            };
+        };
+    };
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        memory@80000000 {
+            device_type = "memory";
+            reg = <0x0 0x80000000 0x0 0x80000000>;
+            access-controllers = <&wgchecker2 0>,
+                                 <&wgchecker2 1>,
+                                 <&wgchecker2 2>;
+        };
+
+        wgchecker2: access-controller@40000000 {
+            compatible = "qemu,wgchecker2", "sifive,wgchecker2";
+            reg = <0x0 0x40000000 0x0 0x1000>;
+            #access-controller-cells = <1>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            interrupts = <82 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-parent = <&aplic2_m>;
+
+            partition@0 {
+                    reg = <0>;
+                    sifive,protected-region = <0x0 0x80000000 0x0 0x40000000>;
+                    sifive,slot-permissions = <0x0 0x000000cf>;
+                    sifive,slot-config = <0x0f>;
+            };
+
+            partition@1 {
+                    reg = <1>;
+                    sifive,protected-region = <0x0 0xc0000000 0x0 0x01000000>;
+                    sifive,slot-permissions = <0x0 0x000000cc>;
+                    sifive,slot-config = <0x0f>;
+            };
+
+            partition@2 {
+                    reg = <2>;
+                    sifive,protected-region = <0x0 0xc1000000 0x0 0x3f000000>;
+                    sifive,slot-permissions = <0x0 0x000000cf>;
+                    sifive,slot-config = <0x0f>;
+            };
+        };
+
+        aplic2_m: interrupt-controller@c000000 {
+            compatible = "qemu,aplic", "riscv,aplic";
+            reg = <0x0 0xc000000 0x0 0x4000>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            riscv,num-sources = <96>;
+            interrupts-extended = <&cpu_intc2 11>;
+        };
+    };
-- 
2.43.7

