Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634846;
	b=iN7MvUXGJ3m1k7UMp1ImjCpYGCX7Kz3Dt8EQBRo8tKBdmfU7ISw94HWBFHt6yHrTzFsd
	 Sk8jyLq9XKzA1NVFRFiPLVs/PhD3JSKFpfZ0MoycsM/eFB4FZnuKX84r8KUUjlcA+nwk7
	 N9ktg8vD0a2Nb2ICeeNzxtUVOxkC0nWPJxXRugTgGwEEeCMzrh/jNUrWQXRyiPmuGGS+A
	 VKJWgxEU+ApbElf6YUYAhv5qkfoGP6p/C+ugx39v0NHlso02NbXrbDXRHlAN1F++NioA3
	 3bx7fgN+sMe6kDOCjp+Upd5RjRRWUYdliPG01JUAJnaUNZ7xtn2M8qvaaZ1I4qUikvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634846;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=uL8zUdscsuzLSxH3TIBRtn5i906XKgs83xavzgt4D5c=;
	b=Kl52C5AblGToXv5lSrat5a1QJM3UXq+V8X+P6LipYXXsTKzZcMwiMoJyc56qfsQfEbxV
	 po7HksUZt3X295uVCA7yBDRjZx727sQYtypZnFWnWjy7Y1Lfs8yWv6tDRi/sidKPBFhyD
	 jE8g46LceDE8L9r/5+hfZ0G8F1PEJYalPEHIOt3uWdFNWgPomY0CtszgrFkWTQy060/i+
	 L7Ufi/Bz5L26ka7M6Nm+N9PUxivybbwU7U7WrZYJqkumZYtSjDMPUE4Nd1lbUr040Rj+u
	 ZgOXqsa5vYyNxQr0gGHBKtVXf5RHgyLmhzMph30maKQCQE1exCJL4N5ECWOA3o8SKPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=mq5r377i;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB5F606A334;
	Wed, 25 Nov 2026 19:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BB5F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=mq5r377i
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C0386C69149;
	Wed, 25 Nov 2026 19:27:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C4A3D60480;
	Wed, 25 Nov 2026 19:27:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 99F3511E6B11A;
	Wed, 25 Nov 2026 20:27:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795634839; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uL8zUdscsuzLSxH3TIBRtn5i906XKgs83xavzgt4D5c=;
	b=mq5r377ix8iKcNyKfjsapSwVTUK3MzrYxrNjABt0cELH0uOeZ9sBklGvHQE2U6pD7oeLXf
	ecnBXL+SyDrAsDQT/xq69+GXxuy7ViGRvl04y4v7V9an1u+WRBJzY3cHbNGiAr7ud9U2HA
	bGsGHwULzSLuFIvAjbmYq4EF7KuEiMFq+6czU5sfzKwpBGqxnX+pemOEINPe28HRl5T1kE
	fw9/oMG9cm0LEM9NJ7zC55uw2yWKb4d3QMgg5ihAPLIpPy46cAUZn7W/r9H0rJHhRGiUam
	hUEY+oFjyQj3A0snQlzqoHUVARtK8qkSM5mdclRhwaOyjHxkS/Y38Wfjtfej9g==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Wed, 25 Nov 2026 20:27:08 +0100
Subject: [PATCH v5 1/5] dt-bindings: interrupt-controller: add Mobileye
 EyeQ5 PCIe MSI controller
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-eyeq5_msi-v5-1-72346cd10736@bootlin.com>
References: <20261125-eyeq5_msi-v5-0-72346cd10736@bootlin.com>
In-Reply-To: <20261125-eyeq5_msi-v5-0-72346cd10736@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Add binding for the Mobileye EyeQ5 PCIe MSI controller.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 .../interrupt-controller/mobileye,eyeq5-msi.yaml   | 76 ++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mobileye,eyeq5-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/mobileye,eyeq5-msi.yaml
new file mode 100644
index 0000000000000..e41a92aec3b8e
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/mobileye,eyeq5-msi.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/mobileye,eyeq5-msi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mobileye EyeQ5 PCIe MSI controller
+
+maintainers:
+  - Gregory CLEMENT <gregory.clement@bootlin.com>
+
+description: |
+  The Mobileye EyeQ5 PCIe MSI controller snoops the MSI write TLPs of a
+  PCIe port. The controller signals the parent interrupt controller when a
+  vector is pending. The memory-region property gives the base address of
+  the doorbell window. A port supports a maximum of 4 MSI vectors.
+
+  This node is an MSI parent for the PCIe port. The driver chains the
+  controller interrupt to the parent interrupt controller.
+
+allOf:
+  - $ref: /schemas/interrupt-controller/msi-controller.yaml#
+
+properties:
+  compatible:
+    const: mobileye,eyeq5-msi
+
+  reg:
+    items:
+      - description: GCSR block of the PCIe port
+      - description: MSI vector control block
+
+  interrupts:
+    maxItems: 1
+
+  msi-controller: true
+
+  '#msi-cells':
+    const: 0
+
+  memory-region:
+    maxItems: 1
+    description:
+      Reserved-memory region. The hardware uses its base address as the MSI
+      doorbell window.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - msi-controller
+  - '#msi-cells'
+  - memory-region
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/mips-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        msi-controller@5840000 {
+            compatible = "mobileye,eyeq5-msi";
+            reg = <0x0 0x05840000 0x0 0x10>,
+                  <0x0 0x05840040 0x0 0x20>;
+            interrupt-parent = <&gic>;
+            interrupts = <GIC_SHARED 7 IRQ_TYPE_LEVEL_HIGH>;
+            msi-controller;
+            #msi-cells = <0>;
+            memory-region = <&pci0_msi_reserved>;
+        };
+    };

-- 
2.53.0

