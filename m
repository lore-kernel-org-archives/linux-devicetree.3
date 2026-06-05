Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E443C871E
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 20:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780692990; cv=none; b=U6b8NQd1/tZHdxcKI9l4vmf4ih0k2h9OFMaL9kyZMKkTDonOlqHMrCA7b7D7Uw0u3mV9jCfKEw1yJikjrsaohWS0yu4cIvZp+PrRubFT/64uHlVcScRvFcXMceoYtWJcaF6DJgqdiJhE+TNZfxEzgvXVtib+4Xq5lnK3LIBZORo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780692990; c=relaxed/simple;
	bh=65ILo2+sWblozJ+nGvK5FhHOAhxeUGueknxcV9j0Cbk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C5VDrL/b+2P+kfTA17j70Ena2HbSUVv0KP83I4dLjwBzk+1PBBAF7/2PjWN0y24WvvnTlFeMSWRYhqFn8tRJ6pAKFhq09UVsnW9w3MZvvzx7EfujRMtChEIZBs/b0IhPC34XXqJKfGCxwD/X21pZFTVBMAI8ZaRt5cE/ZyOvuZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5Go9D1E; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5Go9D1E"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36bb6d54a56so353573a91.2
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 13:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780692987; x=1781297787; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eBgvYLDlEQcdbbu58Ns2XAryfMezzIlQKp5vzjn9zPY=;
        b=S5Go9D1EUfg+wiwpkvKmJ+Um5J/rCAcRlLBejFi56PQXVd0ELEul4MFL2hPt4aQLcI
         FkLhTn/zN/Lbyap/z1x67rv3DfZiE5IQQyqqGv18xjKo0rDJ0cqtuH3E32TxFO9hyiVe
         K84I606c+C/ekyEmlw4aygU0NNmzGmG8sk4Z/bNb22UgRntLSP/YuZKWfLNyohrKDhYo
         ZsPgBc+z0x5INiD00fGEJyTBRBky3q8fn/pG9Od1Sz0kaTorUclT1yp1z+o4m8xyEWBM
         1TYSTibvekxD/yCA0TU9ciPuyCXOXfvfQS9zOdhav6+pqJIBZ04CPnslIMV+uUZuzBML
         LEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780692987; x=1781297787;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eBgvYLDlEQcdbbu58Ns2XAryfMezzIlQKp5vzjn9zPY=;
        b=GcEU3Vmrnn2K10v2qUcM0M2pxTGb484KLQNPoqERDLXnjvRnJ1GDTes3FtmJIc8REW
         jzJ1cYzarCSCViw2K5Qx0ZO0xVSRHXXDfZKiQ1reUBWyhtcXutAy8RWBjyG1VDsBeVVj
         abS8NK+JlRW0putCkIzwMz6aT2SxyJifXUesOu9kQl+Fi+HZnKzOvUrR+jHB/97JZZAM
         PaQyQWYS9T/52SEJ+GJvSfn4PUmSzc/UYV04eSoZO3tteeey1IXjnQzUp9SB0UAAxwwI
         VmdXb6zY1qd8hWSSsDkpgBOd26BM0Y1lrsMQiFiias0DOT4Qqb+iMIMfiKXlTG2R6CFF
         WXAQ==
X-Gm-Message-State: AOJu0Yzl7PfK+QH10LEfzonUXvL5a/7IXQi86SQZrtDq7rRMtTCS+fwO
	YjeNRYIr98ogAE8cE7gCgoujZN3ouzCTUyHEdSJR8adcqCtT5fV9ULwn
X-Gm-Gg: Acq92OGiuw74kI3gDi/Akxs8nXAht0B14yVQbKjElGCHTSOObdZiKWmyoaso1SBGHPp
	bQoAh6ihgY1aqBRIRSK75daXyE+Ze4Q0ymgSGfQs/1UTUrk/kOntnn4h/ZD/XaZnd2tX7NDxbI/
	aCdfrMwNtSu+u+4kckPu2cycIVChTrVUvLakqSyZ06ULxO5L+NVje2EkagC2SZ2xiX7R/lUw9lU
	QdmsndyxkrG9rUVjebfRLcloJH4QSgs+0Bqdk/1ePQOFd1fCOk6lLDWmskAPTtK4kKKEugToqeY
	5L3IMdR/d9tzEOsOObWL7mmpt5lzMWqDrOLr0omB1ZaHpHJZlDDo7N5K7iiq2f3BFy6XTh3sGoH
	rIV3S2uA8p3zK4KdM/hFdXa3jbGhKawNzNlI7qF47kJXjtzCqG2eVqg8vKI9zVYEc14jcerIB35
	rHxe0Jg1JdOvHKaomsw50TEUdr0kY5f+KBwAXct2O+H/aooeAcLbNc
X-Received: by 2002:a17:90b:3512:b0:365:d912:a4ad with SMTP id 98e67ed59e1d1-370ec0f4371mr2669333a91.0.1780692987477;
        Fri, 05 Jun 2026 13:56:27 -0700 (PDT)
Received: from [192.168.1.3] ([2401:4900:881c:baba:b3d5:d6d:608b:987f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3712fcb2607sm2197036a91.0.2026.06.05.13.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 13:56:27 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sat, 06 Jun 2026 02:26:10 +0530
Subject: [PATCH 1/3] dt-bindings: interrupt-controller: ti,irq-crossbar:
 Convert to DT schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260606-crossbar-v1-1-f67f7cb9ee50@gmail.com>
References: <20260606-crossbar-v1-0-f67f7cb9ee50@gmail.com>
In-Reply-To: <20260606-crossbar-v1-0-f67f7cb9ee50@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Sricharan R <r.sricharan@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-omap@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780692975; l=6926;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=65ILo2+sWblozJ+nGvK5FhHOAhxeUGueknxcV9j0Cbk=;
 b=eeKxLpPKNpHMBI/bRnCYUS9QnwrIEkc566aoS6b2pgrPEEuK6+w1uwcUOWHBScoUGFeqnX+7Y
 RL3F/y4U3DGARfRQx2lwcPT7fehnheK8+jIw7oO/kXL/Vkt+0T8D2sk
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert TI irq-crossbar binding from text format to DT schema.

As part of conversion following changes are made:
 - Add '#interrupt-cells' as a required property which was missing in
   text binding
 - As irq-crossbar is interrupt-controller. Move binding from
   bindings/arm/omap to bindings/interrupt-controller
 - property ti,irqs-reserved is defined and used as a array but other
   binding ti,pruss-intc.yaml uses same property name as a unit8 bitmask
   which causes erros in dt_binding_check. Update ti,irqs-reserved
   property name to ti,crossbar-irqs-reserved to resolve duplicate naming.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/arm/omap/crossbar.txt      | 55 ------------
 .../interrupt-controller/ti,irq-crossbar.yaml      | 98 ++++++++++++++++++++++
 2 files changed, 98 insertions(+), 55 deletions(-)

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
index 000000000000..b31e147c2672
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/ti,irq-crossbar.yaml
@@ -0,0 +1,98 @@
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
+  ti,crossbar-irqs-reserved:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      List of the reserved irq lines that are not muxed using crossbar. These
+      interrupt lines are reserved in the soc, so crossbar bar driver should not
+      consider them as free lines.
+
+  ti,irqs-skip:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      Similar to "ti,crossbar-irqs-reserved", but these are for SOC-specific hard-wiring
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
+  - ti,crossbar-irqs-reserved
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    crossbar_mpu: crossbar@4a002a48 {
+        compatible = "ti,irq-crossbar";
+        reg = <0x4a002a48 0x130>;
+        interrupt-controller;
+        #interrupt-cells = <3>;
+        ti,max-irqs = <160>;
+        ti,max-crossbar-sources = <400>;
+        ti,reg-size = <2>;
+        ti,crossbar-irqs-reserved = <0 1 2 3 5 6 131 132>;
+        ti,irqs-skip = <10 133 139 140>;
+    };

-- 
2.54.0

