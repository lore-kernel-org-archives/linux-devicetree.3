Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795465642;
	b=ofQyoJ4e6AJu890F0PhdS/X+5yoOsqaSSwTdMc80ZS965AJEHwjRL6z1oYypCgKbT+d0
	 zMD154G39pMmPwunE36CG94PRHWPw6cJgeBKk1uakviyiodUP/uDv+rCsDjlDg2ijAqP4
	 D3GlwHQWoSl6kBf5KDfF8OVW5df37DOInrwnGHXKakihY9o2dyuIzRfqtylIhySjrxHM5
	 bIqX4Jl1YSIw9Xtvc5+oyQVXny5Pnc+RAgDhI8Ft5t2/1zlk8nogQmeVNg/QqdIPPSsP+
	 /tWBbvWDzRgMuFOsarlCf2ufcqH/kzrVC8sWcDTDw1wu7kTIj0RMCVTzBO7xs4MHgaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795465642;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dTY9H4MEUXebkJIxacnGx6ldxYXsTr4Zi+O0m4hM0TQ=;
	b=4QMw+R4NI1sndmELdxAh12pepgLHAuKsAQnoUc7SAkHLYyofJqHSJQkpiNBjqiblEHdW
	 HXybmNAtpdjaQpl6sspIAqw3gUI+A1+6In15FCXMt7lAD6J7GU4TtaRRIgSn4LJqdF/fT
	 JgW+QPW5AZSDX4QDgg7GnesanvqYdSQSjLaoCcYDu4ydtW52DqjboLUmk8SMQkuxy/PR4
	 hC0//QOtVNyEGQt1p2yyyno+5BRnvcm3jUu/mH1jlXNO6FQu4MICDzSYpMYU6WyKU2UAt
	 YXWiqoMbc2QMgu/3MT5nAe2UWk2VN7jNVU4y7f7TSJrDKlRzDIoA2VjUpgpgOKcwXxg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XaAy7uUz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E069B60A2619;
	Mon, 23 Nov 2026 20:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XaAy7uUz
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795465641;
	b=N/WtJ3+jDFmPL2Xv1Ymw+MX6C3BZrsXCt9hIeqRky6U89EUDxful2lKq0SbIPex1cvKx
	 oI7wP3JaRDFUoYq6hsk70IWkpgboozx9uG1meEXWS3aJ86oov6gg0defb4oD+87qzym8p
	 /O286wH+sr/PLmSWlsiePWURJCkHBdd7BCyFxInSh/kQI6cS1u3KFj8sq6bARkw/kGCxA
	 hQDmAn8l2pnNKYhLeDxy4/FZuQqFk2nFTECW/XwbpxpfNurAzjaP/BmFUYO/JfbKl8w31
	 tCplirmLT5vv8m4SpSW85Fk4TVC5WVQX51PRZOUZplKzlZ52lZ/L3vHJnS10l6eldDg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795465641;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dTY9H4MEUXebkJIxacnGx6ldxYXsTr4Zi+O0m4hM0TQ=;
	b=o+tQ6H3ZtBJcv9fbFqMLzNCFXUpIbUmmaPR8TCmHcZ8o7/UJrqPEiy1LXFcH0QzKYlJ0
	 gKyLk0z6H3c8UoFWfQFAYisO0q7tZI0Ze9DrggoNok7k29wwh4QQic90/pqmP+AAXgUvO
	 nbIGeiAAfvSma+H0wYQok7pDKoAmXIGTVEjldFV/JGC8vdkXifK6SAz/iTYREudWH7HeY
	 y5TBU2wu7AyeUL5Xm0XYnWTd2jCCJ5j/wEyNwLbuwcrWVYx3tgrvAS5OLH+4Y7M2gOdpG
	 6mPY3NCQWA714gKe7HWwPJmDzkjU2IMKLTJkVqDcRjOvry1m0mn0B1gLdsgvsRlvQVw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6BD3C1F000ED;
	Mon, 23 Nov 2026 20:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795465641;
	bh=dTY9H4MEUXebkJIxacnGx6ldxYXsTr4Zi+O0m4hM0TQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=XaAy7uUzzbpI4ikki7YzvhX8QdRN8Bi9LFrhlJ6QdApIRX9VbDp5VPJM3pPn9Kpl0
	 XLpdyi1HDGdgxLb3e/ZATwmL52uSNvDXu9BJ1DNVID9YA3qpXzmZXweg4geHqUrFJ9
	 lddUSI7eFlEycGDZ5fW+Ux55euOkGFOFGZm7vSOys/mXGCJ9lFGgocccGmB7Rw96Yu
	 6skO+p6IOxuTBMZ1wyUyBd9gmarRgmn1MkNCtE7Gw8GqD2nkKP5lYk/87HoHgnSqp/
	 B8FAmh70BSE2+7TfvkNx3Mh3jNP3KPBxHLMkYohhbyTWJ7fJsK7D/SjPCrEivywnVo
	 jBtQMiiZwgaHg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E39374C6F5;
	Mon, 23 Nov 2026 20:27:07 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 23:27:06 +0300
Subject: [PATCH v2 1/3] dt-bindings: mtd: Add Cortina CS7542 NAND
 controller
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
Message-Id: <20261123-b4-cs7542-nand-v2-1-9d9f08608534@gmail.com>
References: <20261123-b4-cs7542-nand-v2-0-9d9f08608534@gmail.com>
In-Reply-To: <20261123-b4-cs7542-nand-v2-0-9d9f08608534@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795465626; l=2237;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=R4f5+AZ20ZvVDHkrykvH4nwddcpdeFmF1zCSrzBHxh8=;
 b=MWl0A5yPlRfJlo0LUvDGO9aPOnfNyBCmcWGU5JpKVwh5n2EPCrej9vGdQpKT7w4BPtswBp3dD
 s5AvSlY4NLzCEzRiluFT2MOrUC1rrA0Sb01w0fbAGvxqsuUaAwTYLKD
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com
Content-Transfer-Encoding: 7bit

From: Fil Dunsky <filipp.dunsky@gmail.com>

Describe the flash register bank and the single 8-bit NAND target used
on CS7542. Specify the ROM-compatible Hamming ECC configuration and
allow standard NAND partition descriptions. Firmware supplies the bus
timing.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 .../bindings/mtd/cortina,cs7542-nand.yaml          | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/cortina,cs7542-nand.yaml b/Documentation/devicetree/bindings/mtd/cortina,cs7542-nand.yaml
new file mode 100644
index 000000000..c9ab9d4d9
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/cortina,cs7542-nand.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/cortina,cs7542-nand.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cortina Systems CS7542 NAND controller
+
+maintainers:
+  - Fil Dunsky <filipp.dunsky@gmail.com>
+
+description:
+  The flash controller supports programmed I/O transfers and a hardware
+  Hamming ECC engine. Firmware initializes the NAND bus timing.
+
+allOf:
+  - $ref: nand-controller.yaml#
+
+properties:
+  compatible:
+    const: cortina,cs7542-nand
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  "^nand@[0-9a-f]$":
+    type: object
+    $ref: raw-nand-chip.yaml#
+    properties:
+      reg:
+        const: 0
+      nand-bus-width:
+        const: 8
+      nand-ecc-mode:
+        const: hw
+      nand-ecc-algo:
+        const: hamming
+      nand-ecc-step-size:
+        const: 256
+      nand-ecc-strength:
+        const: 1
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    nand-controller@f0050000 {
+        compatible = "cortina,cs7542-nand";
+        reg = <0xf0050000 0x300>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        nand@0 {
+            reg = <0>;
+            nand-ecc-mode = "hw";
+            nand-ecc-algo = "hamming";
+            nand-ecc-step-size = <256>;
+            nand-ecc-strength = <1>;
+        };
+    };

-- 
2.53.0


