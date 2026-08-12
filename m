Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9676D446058
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 12:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786537339; cv=none; b=q6W/dR6kVvvzjxJqKQMHgb6SLaLqFsGp1SgMtFRY0OnLTGrCyLxR+jC/zZmqJ7FYCrTvS3BJS/LZRsC3wMGwHHqqdS19vh6LKc+ilakcoqfaKiMGK+y+/n7CiCTD9NjMvyPDNla1MhywdlVfBhUUKSZpal90zwmQzMmDVJC+I4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786537339; c=relaxed/simple;
	bh=BNiW/jpFvJ40RNtlBR7+miN3FLqqapLkJ6oWzi+1zYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dVech1x1raBh4PfdaLy2f4fK8P37SlNZI5KJ2CqcN82irKIxsvZBPj1woUuuHBKKZ7OTA6uRd+vuInsIUwk6njQzpTlBlSZ8to3efS/6dGF+/0EWVvgYC1+nD7ueBeSoS19EXHiob0B6Zwr8NNwNHg/zyj4jBpUwUxSag49exyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=Ech3QpG9; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Ech3QpG9"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso15706075e9.0
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 05:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1786537336; x=1787142136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5DUOnFgT4BM2v4pDSlAoo93/0oVmKBpbPEKyoUyGdXE=;
        b=Ech3QpG9v1YTEnHmVEFAxeVny08bFNm3DbE+VZFGmsSXK3w1ASVt67ZIUpnP5Tf9ci
         f/zoC6OT4ocD+LUwY77FjL33a/63UifoqS43N0FpRCSFbJOrxmfFAAzevdjhIHIOeSmQ
         hfQ6ws86tZk8Gw0zq9AnbFGQ5EqPC0Kl0ta7WsMINrER1wDoRirSGeXHENU7xS56SQCm
         HT96A5dYo48IcRyPHTQk//ESz3RgWQxyITJTR9agzX1I7BnYAA20SI2gilAEVttqnVWh
         glwZnNDg/y1Zr/cMvuTBt+qFmrYnR/CqSMid/fpXV7+zMhFCdkbBH3BwuFouyst2AVIu
         Q3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786537336; x=1787142136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5DUOnFgT4BM2v4pDSlAoo93/0oVmKBpbPEKyoUyGdXE=;
        b=OYlvtMxoaABjrqKX0DVLpl0M3a5WUWHuAAtqE3t8ESWbddBh0SEd/lV/EaWIQvzVDz
         lDyIu5gd6oCE0sHdwRrfe0aFngfWWiyB5pHkqQfdW8R/rH136/Q3aCCrLjE6bysXoQIE
         vM+W0UA4HnZYS+vnifzP584PPYSza5l2nAHhTaosLZAl60kPV1f3Pw14x25LwrysIxMc
         lxKYLPiEpZzmzBFKO2PDd63m5jhn4nvkkyEdL7eREU3CbHuOrNCJGrzWHnWJCP+ZJabt
         p6U2EvKEF6ahQ84S7k3s4I+q+eaL0MCYMzsfDb6oH62PNP9t40bnxajopClw9Tn5docJ
         9y2w==
X-Gm-Message-State: AOJu0YytJWugMnsS4W6/cEPBngI+j3bY320qCnvI0FoNGXAycTnio3IP
	yI3Kk2NGwyoCRZRc9GPJKTwuvRemmkkHs6wOp8OHmzdj+RONhVI0A7S2f+uxFu6XblTiMjNghKb
	3lyaoKjAQDDU81ABkgj/8xFWS8pXAgeYywR1yhzG3i9UVsH3RiA50mYH/ePNIJ/biopehkyWM1n
	ntTA87KKf2hjtvf7KwwZk+FDLMQWEcusIGXJah2J9Xh8/qNkqxWs4ZWLs=
X-Gm-Gg: AR+sD12ltSrnxTh/ZfRypljqKa6/oyt2pvNoCxaev78AGxK4LI1uE0Pvd1cnb1+2upQ
	lJWELhRLUoxigYaMph7BLJTl18/rdX43WndSsu+p7htaz7LIBxLGnZ5FNdti4Redl4QrB2psEF+
	JaLaOjyTM0bTIyw9HXpno+BSm6jll2/FltDJOhuGMvjAS93HrYtoRGRfk37K1+00BdfcWkiQ0iB
	eE3RFtk9nCDAMSFOKkq5F7MGHu8H+VehWcvCKCBJR+UiSXT8T08+8vlawPSaPELUYfFe2C58SHm
	BHvCYn133EFwaeZnVMKBdym5R8zdRNmY2A2Ea/qp670LZVUCzey8HO/9Zz0CzKje5MzpwM3pkOC
	oEI7cWdBgyKEkpSizLPFNLmmh11N97942AFEFYiBkHkZCYAD1TvIJFk4VkK0+hS4GfzZe0LCbyr
	/sQDtYVEcY/tL7RiQnXZbb3IPRqmInGej4LuHS/2itAnQmiLHDFY1EBvvibIUtDl+316iU1joOF
	S8Ak9NtLacw
X-Received: by 2002:a05:600c:3544:b0:499:5f80:83ac with SMTP id 5b1f17b1804b1-4997c51d13cmr52410645e9.7.1786537335594;
        Wed, 12 Aug 2026 05:22:15 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997aaa5d04sm65858905e9.2.2026.08.12.05.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 05:22:14 -0700 (PDT)
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
Subject: [RFC PATCH v3 3/3] dt-bindings: access-controllers: Add SiFive WorldGuard Checker
Date: Wed, 12 Aug 2026 20:21:31 +0800
Message-ID: <20260812122131.1534906-4-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20260812122131.1534906-1-peter.lin@sifive.com>
References: <20260812122131.1534906-1-peter.lin@sifive.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding for the SiFive wgChecker, a programmable access controller
integrated in the interconnect fabric of RISC-V Worlds-capable SoCs.

At this initial stage, the binding is designed for M-mode firmware
to configure wgChecker partitions during platform initialization.
Linux typically runs as an untrusted World and does not require a
wgChecker driver; instead, it operates within the constraints enforced
by firmware-configured partitions.

wgChecker acts as an access-controllers provider, with consumers
(protected devices) referencing it via the standard access-controllers
phandle to declare their access requirements.

Link: https://github.com/riscvarchive/security/blob/main/papers/worldguard%20proposal.pdf
Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
Changes v2->v3:
- Drop sifive,trustedwid property
- Reposition YAML file to bindings/access-controllers (Krzysztof)
- Fix compatible string (Krzysztof and Conor)
- Drop unneed description from stardard property (Krzysztof)
- Use consistent quotes (Krzysztof)
- Keep access controller provider node only (Krzysztof)
- Fix node name (Conor)
- Rename sifive,protected-region to sifive,wg-region
---
 .../access-controllers/sifive,wgchecker2.yaml | 178 ++++++++++++++++++
 1 file changed, 178 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/access-controllers/sifive,wgchecker2.yaml

diff --git a/Documentation/devicetree/bindings/access-controllers/sifive,wgchecker2.yaml b/Documentation/devicetree/bindings/access-controllers/sifive,wgchecker2.yaml
new file mode 100644
index 000000000000..23ff7d6ef08e
--- /dev/null
+++ b/Documentation/devicetree/bindings/access-controllers/sifive,wgchecker2.yaml
@@ -0,0 +1,178 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2026 SiFive, Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/access-controllers/sifive,wgchecker2.yaml#
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
+  System integrators assign WIDs to execution contexts such as privilege
+  modes, trusted execution environments, or other isolation boundaries.
+
+  The SiFive WorldGuard Checker is a hardware firewall positioned in the
+  system interconnect fabric. It supports up to 32 WIDs and inspects every
+  transaction, evaluating the WID against access control policies encoded
+  in checker slots for each protected resource. Transactions from
+  unauthorized WIDs are blocked and reported as bus errors, interrupts, or
+  both.
+
+  This enables spatial partitioning of memory regions and memory-mapped
+  devices across execution contexts. Different address ranges can enforce
+  distinct policies, allowing isolated workloads to coexist with
+  hardware-enforced protection.
+
+  The wgChecker acts as an access-controller provider as defined in the
+  access-controllers framework. Protected devices are consumers that
+  declare their access policy via the access-controllers property.
+
+allOf:
+  - $ref: /schemas/access-controllers/access-controllers.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qemu,wgchecker2
+      - const: sifive,wgchecker2
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+    description:
+      Interrupt line asserted when a WID access violation is detected and
+      interrupt reporting is enabled in the slot configuration (IR or IW
+      bits set).
+
+  "#access-controller-cells":
+    const: 1
+    description: |
+      Specifies the partition identifier to reference a partition child
+      node that defines the access control region, WID permissions, and
+      access failure configuration. The special ID 0xFFFFFFFF indicates
+      unprotected mode, granting unrestricted access to the device.
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
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
+      sifive,wg-region:
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
+      - sifive,wg-region
+      - sifive,slot-permissions
+      - sifive,slot-config
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+  - "#access-controller-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    // Example 1: Peripheral device protection
+
+    access-controller@c1000 {
+        compatible = "qemu,wgchecker2", "sifive,wgchecker2";
+        reg = <0xc1000 0x1000>;
+        #access-controller-cells = <1>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        interrupts = <80 4>;
+
+        partition@0 {
+            reg = <0>;
+            sifive,wg-region = <0x0 0x000c0000 0x0 0x00001000>;
+            sifive,slot-permissions = <0x0 0x000000c3>;
+            sifive,slot-config = <0x0f>;
+        };
+    };
+
+  - |
+    // Example 2: DRAM partitioning with multiple regions
+
+    access-controller@40000000 {
+        compatible = "qemu,wgchecker2", "sifive,wgchecker2";
+        reg = <0x40000000 0x1000>;
+        #access-controller-cells = <1>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        interrupts = <82 4>;
+
+        partition@0 {
+            reg = <0>;
+            sifive,wg-region = <0x0 0x80000000 0x0 0x40000000>;
+            sifive,slot-permissions = <0x0 0x000000cf>;
+            sifive,slot-config = <0x0f>;
+        };
+
+        partition@1 {
+            reg = <1>;
+            sifive,wg-region = <0x0 0xc0000000 0x0 0x01000000>;
+            sifive,slot-permissions = <0x0 0x000000cc>;
+            sifive,slot-config = <0x0f>;
+        };
+
+        partition@2 {
+            reg = <2>;
+            sifive,wg-region = <0x0 0xc1000000 0x0 0x3f000000>;
+            sifive,slot-permissions = <0x0 0x000000cf>;
+            sifive,slot-config = <0x0f>;
+        };
+    };
-- 
2.43.7

