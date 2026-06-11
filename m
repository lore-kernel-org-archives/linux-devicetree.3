Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBD028C869
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 21:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781212370; cv=none; b=cFRXkn365N35N2jjbBSbF7prMA/y/He5XpR/aF8kkMazJtmTrZDw2RhRH9nfhA6GboR32196nzpgw2JQGl0erUHJvZJ2QPxmnR5McyDGCdGkfkk6MwSKgSol/sUjGuliD8DhnKjyLIW1XnwRgJgpTmHTGbFcg+kNbAxV2mS1iG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781212370; c=relaxed/simple;
	bh=sYeo+A3SSY3pvXBtschc7zbWX8FHUL4YU7BzU04QnOs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aJd22CYT+YRW43lqy9EtOnQ79PoqMTZtkFM370YOB4rjD/QGuOLI9JktIbbNWQ+S/mmmJY2QMLkn4t5AVkGzN5lVAoY6UrwxACmw4P7DrwC2S5A8GTPfG/cZAxEQzgAoQ4ZtnI1ObUrmB/rI+ZYPR4SMs3XF1arl0gIQZAMPhlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=icYZRJuF; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="icYZRJuF"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8422a816c89so39013b3a.3
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 14:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781212368; x=1781817168; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9j2IwgW3Jzkk4SQ8A6GHkJn6r7B3WoXNWnbYWl95Ne4=;
        b=icYZRJuFWc/zTVUVVhqCmpNcP5iCzWcRs57edu6t62iUZ4MfQ2/c2PK3T8IF6hkklF
         OOcIID1hxGpaeOWNQCz7Nc2f42Qynh4Hs+vF8H2ys+s8/+i5KC7W3+apSASiHWVqIiNU
         uPCOedpqZ73rXT/5Ayf4j5uJsHlP7QGm9zuQM+I7oNqRI+RFVireaV8Ph0vuLf1Z8m9r
         bilS8T+/ttsp68+LO0vQqg9thBx/0NHL4401h9ZtcBkcMwslozX7c5Ld3zuW1sNadgnm
         vmg58QMsjPgECNeVRRXGMNBnOFKSQ6likZd5iJFrV+o6zs75rQuhEH3ijGCZZzUINcFj
         q0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781212368; x=1781817168;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9j2IwgW3Jzkk4SQ8A6GHkJn6r7B3WoXNWnbYWl95Ne4=;
        b=jJfX+bqqydRc+283yPYb/kJa+1Ipfr75wq5Gb9pHyse6iMJnb8NtKdTMR2Ia5ooV3x
         GdCxIy2VE6SSW5E3H3dYS8RJFN4Qh0ZUAmcJ+uo1IHmUj3reOf6oQkhtw8Cd/oMD1+Km
         /3udO7cr71UWo0YEVUQvbOor0ZNvswC1u5Ay51evDNOT3vB/qo0n8/xM+ux12Xw6hTSU
         CVATNkW3yxVgpbQkdfDjjHpVU9dRy/cZg14aDTwTezrZ6cqxSz373e+hMEymjQNn2XLr
         MUo88fQy9sXw2Lrv2vXeaiDZ9HTG1iNH157anjkHKGF0ErP2Rp4zq6ZNHXsrgoNTVug2
         OdSg==
X-Gm-Message-State: AOJu0Ywid3v4UXWyYL22ROL5MI3cvicgZXC7srUL4xUsoiBWatB5FVme
	unXhlHhycKYTTW4FwFEKXb2pIQKpSQaKvd+JrKsPqzbvYyWlP0frTBVv
X-Gm-Gg: Acq92OF3s4cdpG7YU1Wf7CnJnvp/pcsIu+6qDM3WuD2rlsvKM+vrEKCpCcWkIDsDHQk
	MFEdXErs8TleXXFd6HuL/xA4wFls4gF0HR/9Mn5p+YU9wUS5Yjt6JBZJ3O9S5mzw0e+1hyBXNOb
	Wd6Bp80tjqs3XdktpzwInlMuw04+NfrHXL9g4Gr2glohSD8MX/XK6FoPzktsYchV8iggAU18ag3
	7hxuL00qQpYTHQw6m8uRp+5gAurAWzeOY7l6gJNcuGFSAPTh1xEatw+969IXu3GpK/iJ4r0RLLB
	iol/VU3R+K41fNZgEdbW9FO9D7IroOdjriqEogAK9enLQwDnF6rls5Lph9GycVKcimNVMuZuczY
	Kuo5SUp1YuS/41QeRix2vNjBdq9bT2sVNfavG1KSZXjfB9lpqmL4TNX6VlGVPAkgAiymK0NBou0
	idh2+/nqCgDb/QKBvCeFJOtltVm8S4L0c=
X-Received: by 2002:a05:6a00:22c6:b0:842:2efa:5fc3 with SMTP id d2e1a72fcca58-84336df679fmr2387916b3a.7.1781212368474;
        Thu, 11 Jun 2026 14:12:48 -0700 (PDT)
Received: from [192.168.1.3] ([2401:4900:881d:daf6:1a73:750:53ec:66c1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afc8a5bsm21994b3a.33.2026.06.11.14.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 14:12:47 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Fri, 12 Jun 2026 02:42:29 +0530
Subject: [PATCH v3] dt-bindings: interrupt-controller: ti,irq-crossbar:
 Convert to DT schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-crossbar-v3-1-266747bc2e86@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02NQQ6CMBBFr0K6toYZoBRX3sO4KGUKNUJNi0RDu
 LsUFpJZveS/NzML5C0Fdklm5mmywbphheyUMN2poSVum5UZpijSAiXX3oVQK8+xrpTIoUHIBVv
 nL0/GfrbU7b5zeNcP0mP046KzYXT+u/2aIO727Hr/7AQ85UaUptR1RVSk17ZX9nnWrmcxO+FBB
 DiIyIFjBk1upMRK0lFcluUHoElJ+esAAAA=
X-Change-ID: 20260528-crossbar-2b9a641d2146
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Sricharan R <r.sricharan@ti.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781212364; l=6950;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=sYeo+A3SSY3pvXBtschc7zbWX8FHUL4YU7BzU04QnOs=;
 b=nma2Koew07k7D/EZNPspg+eM8Oz4HDkGnCmyw2Mx+Kj5zkoBAqtsAjctFewIKYoPzwzpazVy1
 Hhm5nPDyD3gCh70jbEwnzvP7C4Bd1dzvCzuJuYKoQM5JOdsCzlKTJZN
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert TI irq-crossbar binding from text format to DT schema.

As part of conversion following changes are made:
 - Add '#interrupt-cells' as a required property which was missing in
   text binding
 - As irq-crossbar is interrupt-controller. Move binding from
   bindings/arm/omap to bindings/interrupt-controller

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v3:
- Fixed typo in property description
- Link to v2: https://lore.kernel.org/r/20260611-crossbar-v2-1-231d4f88298e@gmail.com

Changes in v2:
- Dropped property name change and driver updates. 
- Link to v1: https://lore.kernel.org/r/20260606-crossbar-v1-0-f67f7cb9ee50@gmail.com
---
 .../devicetree/bindings/arm/omap/crossbar.txt      | 55 -------------
 .../interrupt-controller/ti,irq-crossbar.yaml      | 96 ++++++++++++++++++++++
 2 files changed, 96 insertions(+), 55 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/omap/crossbar.txt b/Documentation/devicetree/bindings/arm/omap/crossbar.txt
deleted file mode 100644
index a43e4c7aba3d..000000000000
--- a/Documentation/devicetree/bindings/arm/omap/crossbar.txt
+++ /dev/null
@@ -1,55 +0,0 @@
-Some socs have a large number of interrupts requests to service
-the needs of its many peripherals and subsystems. All of the
-interrupt lines from the subsystems are not needed at the same
-time, so they have to be muxed to the irq-controller appropriately.
-In such places a interrupt controllers are preceded by an CROSSBAR
-that provides flexibility in muxing the device requests to the controller
-inputs.
-
-Required properties:
-- compatible : Should be "ti,irq-crossbar"
-- reg: Base address and the size of the crossbar registers.
-- interrupt-controller: indicates that this block is an interrupt controller.
-- ti,max-irqs: Total number of irqs available at the parent interrupt controller.
-- ti,max-crossbar-sources: Maximum number of crossbar sources that can be routed.
-- ti,reg-size: Size of a individual register in bytes. Every individual
-	    register is assumed to be of same size. Valid sizes are 1, 2, 4.
-- ti,irqs-reserved: List of the reserved irq lines that are not muxed using
-		 crossbar. These interrupt lines are reserved in the soc,
-		 so crossbar bar driver should not consider them as free
-		 lines.
-
-Optional properties:
-- ti,irqs-skip: This is similar to "ti,irqs-reserved", but these are for
-  SOC-specific hard-wiring of those irqs which unexpectedly bypasses the
-  crossbar. These irqs have a crossbar register, but still cannot be used.
-
-- ti,irqs-safe-map: integer which maps to a safe configuration to use
-  when the interrupt controller irq is unused (when not provided, default is 0)
-
-Examples:
-		crossbar_mpu: crossbar@4a002a48 {
-			compatible = "ti,irq-crossbar";
-			reg = <0x4a002a48 0x130>;
-			ti,max-irqs = <160>;
-			ti,max-crossbar-sources = <400>;
-			ti,reg-size = <2>;
-			ti,irqs-reserved = <0 1 2 3 5 6 131 132>;
-			ti,irqs-skip = <10 133 139 140>;
-		};
-
-Consumer:
-========
-See Documentation/devicetree/bindings/interrupt-controller/interrupts.txt and
-Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml for
-further details.
-
-An interrupt consumer on an SoC using crossbar will use:
-	interrupts = <GIC_SPI request_number interrupt_level>
-
-Example:
-	device_x@4a023000 {
-		/* Crossbar 8 used */
-		interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
-		...
-	};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,irq-crossbar.yaml b/Documentation/devicetree/bindings/interrupt-controller/ti,irq-crossbar.yaml
new file mode 100644
index 000000000000..a919db1d0645
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/ti,irq-crossbar.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/ti,irq-crossbar.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments IRQ Crossbar
+
+maintainers:
+  - Sricharan R <r.sricharan@ti.com>
+
+description:
+  Some socs have a large number of interrupts requests to service the needs of
+  its many peripherals and subsystems. All of the interrupt lines from the
+  subsystems are not needed at the same time, so they have to be muxed to the
+  irq-controller appropriately. In such places a interrupt controllers are
+  preceded by an CROSSBAR that provides flexibility in muxing the device
+  requests to the controller inputs.
+
+properties:
+  compatible:
+    const: ti,irq-crossbar
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 3
+
+  ti,max-irqs:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Total number of irqs available at the parent interrupt controller.
+    minimum: 1
+
+  ti,max-crossbar-sources:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Maximum number of crossbar sources that can be routed.
+    minimum: 1
+
+  ti,reg-size:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Size of a individual register in bytes. Every individual
+      register is assumed to be of same size.
+    enum: [1, 2, 4]
+
+  ti,irqs-reserved:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      List of the reserved irq lines that are not muxed using crossbar. These
+      interrupt lines are reserved in the soc, so crossbar bar driver should not
+      consider them as free lines.
+
+  ti,irqs-skip:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      Similar to "ti,irqs-reserved", but these are for SOC-specific hard-wiring
+      of those irqs which unexpectedly bypasses the crossbar. These irqs have a
+      crossbar register, but still cannot be used.
+
+  ti,irqs-safe-map:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      integer which maps to a safe configuration to use when the interrupt
+      controller irq is unused.
+    default: 0
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - '#interrupt-cells'
+  - ti,max-irqs
+  - ti,max-crossbar-sources
+  - ti,reg-size
+  - ti,irqs-reserved
+
+additionalProperties: false
+
+examples:
+  - |
+    crossbar@4a002a48 {
+        compatible = "ti,irq-crossbar";
+        reg = <0x4a002a48 0x130>;
+        interrupt-controller;
+        #interrupt-cells = <3>;
+        ti,max-irqs = <160>;
+        ti,max-crossbar-sources = <400>;
+        ti,reg-size = <2>;
+        ti,irqs-reserved = <0 1 2 3 5 6 131 132>;
+        ti,irqs-skip = <10 133 139 140>;
+    };

---
base-commit: eb3f4b7426cfd2b79d65b7d37155480b32259a11
change-id: 20260528-crossbar-2b9a641d2146

Best regards,
-- 
Bhargav

