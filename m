Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C35372ECF
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 08:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781164833; cv=none; b=JL2MLMe6KL5mIoMFQj5Azt/3daIuoM3BznADNIZBytBAEm8BgxkpVg0BkDqQPEfKAowOj6XCaV2jtAgEdd0GqwOsPkOVYiFGdER1nRRfanssD/NqXLVGRsD5a6HP0VgCCJ81Sy0iDTOkVZ+KduX/LyXPoarvns/RXDiP3oUqiAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781164833; c=relaxed/simple;
	bh=5T5GPhbjbV6TAuwWoc/EO0fQlz1+1MUif1+99Yn3u/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eEGMC80PEZpkYplf/5QMNfcEdTfIqdRYV0gExyqgc441fkStHMBzKEVLGdO6aykjr1XR/hOgWqgT0nKmSesBbMIjbJwQppYdF8s3gNnndpyZV6V21EseeQyLSpaacvYpSuOjP3RXgB7UOl8fXVHc35xMussUcg1ALrX4kw3JVjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q6g52pnP; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q6g52pnP"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c0c2e8d381so14180905ad.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 01:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781164832; x=1781769632; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7TVjBPtkRQto1Hvuai/39HXD7EMOmQdrCbAoz9POuZM=;
        b=Q6g52pnPLqEbiXZU7MP/BgATWsHhQQ4kb2ypCEVTiIVWK7WbFhloPoolP6ifCrhK+b
         uAFeh0+ua0Zi6fcWPUvCvKxmjWQ5o6L/BRZYNen4ANp50DYThLh8mTOuhlwMLeaQwi+F
         /qbC+IFqFFnBCQ7vyzgL592YJkt5NEK+nyMAfpbj52sKlG1CAwRF4vjEOb1x363PhYbJ
         5rzeZlAqLHgV/Fn6w6yhSn+/gbiKft6ncPpb+Dlf51SNm4cFRTbMY4z8tuhooiKySkXN
         4zrHOp+fTp9OgPlKIPEKobKv99f2+3Qd6LMK8EGepzxie/SvsE/stKs6cMsRixqpL2el
         wY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781164832; x=1781769632;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7TVjBPtkRQto1Hvuai/39HXD7EMOmQdrCbAoz9POuZM=;
        b=irmo0vSYSnGwPC88wrPrgqZ6KFuvCA1uzchlHMvCQho+HIW9zfijdruxwNQpYx0W8w
         4ORu04RoLweJjz5nLl+3j/DEsaN1/Ye+KQXmBUikbZFiUgFD+YcqknDqAgbB2cGfbEsU
         b/+oX4yz9JXWek4jSVzwafqDGqtqvt6WxNn5RMQPaYqHOujNVe8pWRcynuyvKQlJlHRL
         bEcR6En0sMsC+WBZz3jQrWP5/LPLeeXMi/OaCAQihjgqYjG4UST+TLrN+8zmcT3MmjyQ
         k5AiVJzJtx05y20jSM0JllXL3pkHP4W8RatsSOFtQCkxDGdLrAFqx53ww/HTIPIgtMB4
         iBPg==
X-Gm-Message-State: AOJu0YxXdWS8yuFx/6hz4sgyjfXFj7Frk5yDSR5Lx9qrR7BC42fTqeye
	GXGzkvAwxzLL2WHbclnhbjhNy67cJN3REAbA3q552EmtDoZXAuVqImTK
X-Gm-Gg: Acq92OFDHy4XgaIny33rC6IDFPasEqJmU0Jk0AdOr5iWCNGFvIA/r7qcJXbuwQikNyC
	7loBoKUbBq/UPvgtS+3JfILWRPJTQqjhVnUK6QqLBONHKup+oxWIvnG8pwTR/ICRhTlwWja1+Us
	sfV1Whkm47q3WRBDM1faO8LCPbmwl9pfbGF5aqntkqbVbCppQCG3fY9WaVpcHdkYTOMdPZPdB+N
	/XD6IaDzOTgDc8qKlPZCor3uTms75GLfx+Z6KcOMa4ler7kHx2Ij0Cb3XqQKeC30WktXaKFiuPZ
	8ExUh7nKWI9spdZwFoM7o1wTRLSxLuZC0rL5q12+YmWUzqYEUbVcaQ4zoA8B79xwOZ0XRc1erQf
	rXPiEja4AaEOenwJwBKlw8ZjNglEHz/EPi4Grza40s5ktRtgM7yFFfN4IsvgJ94ZKkWff/kFMVF
	HG8hhgMetryYUiGlJyNSH04yEVTAEwnFRUTeTIYwusgLY=
X-Received: by 2002:a17:903:1a2d:b0:2c0:af09:f3c3 with SMTP id d9443c01a7336-2c2f636bcefmr11336005ad.8.1781164830275;
        Thu, 11 Jun 2026 01:00:30 -0700 (PDT)
Received: from [192.168.1.3] ([2401:4900:881c:31ad:7fa5:d959:91e7:2240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16629d40asm259089285ad.64.2026.06.11.01.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 01:00:29 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Thu, 11 Jun 2026 13:30:14 +0530
Subject: [PATCH v2] dt-bindings: interrupt-controller: ti,irq-crossbar:
 Convert to DT schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-crossbar-v2-1-231d4f88298e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/0WNQQ6CMBBFr0JmbU3bQBFX3sOwaMsAY4SaDhIN4
 e4WWJhZveT9NwswRkKGa7ZAxJmYwphAnzLwvR07FNQkBi21kYW+CB8Ds7NRaFdZk6tGq9xA0l8
 RW/rsqXt9ML/dA/207TejJ55C/O6/ZrV5RzbdPzsrIUVryrb0rkIs5K0bLD3PPgxQr+v6A4F3F
 32yAAAA
X-Change-ID: 20260528-crossbar-2b9a641d2146
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Sricharan R <r.sricharan@ti.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781164825; l=6816;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=5T5GPhbjbV6TAuwWoc/EO0fQlz1+1MUif1+99Yn3u/E=;
 b=zF+5OreIarstm5mck6ZXkSO9kTSqOYNKWkQwSrqXfxk5ncx6y0AxB2sMnrKXeDub7IQWZ6/DH
 6OqN0L+CK8zAEtJcPSM16NOj79xeE6cpzr0HbaRMxPhn6JooWtctzhz
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
index 000000000000..ec9a33511aae
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
+      Similar to "ti,crossbar-irqs-reserved", but these are for SOC-specific
+      hard-wiring of those irqs which unexpectedly bypasses the crossbar. These
+      irqs have a crossbar register, but still cannot be used.
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

