Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795630543;
	b=ooqAZ/JlEtf+bVaKx6C10qQX8ULJQuTRGtOTQflxZritOr9oasXbx+w+n9tQpQVOsB3U
	 xU6TSqrGgzgjdjG+wT4UR5Se5nwPVmQIim4d4vbQmVWJV9PTURY+DnWPyqY04m3k+0j72
	 yJiThgs1jalMIKB1tibmJQMyzHjPw7CXBeqTspo8zvM44epD3med2CRxCNDtBC4UZwsK4
	 W4Wb+7Ixmev6rxzbYMfl6R6Qb7h56MFaZf9zTUUeiDYoJ9NsuHQokCjNJQTaER/ZXHvfV
	 NVwDNWFXcejaugkh32Wk0kyHZkfAQKhiJuN1q/td3aHZu9mb3aLtF6/uZ4dycxT3sGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630543;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dTY9H4MEUXebkJIxacnGx6ldxYXsTr4Zi+O0m4hM0TQ=;
	b=Cg+CUEbc98GyYad2fOHVyZrsJzDx/3ynilQ9V4BQ9U4CmznKoWfdUKqydh0Pl7Ev8LNg
	 OaOD0TrNDJQQjhyBenkZqdDNIsC3ab6Njm3npG4o6BUiMeSaepKV2Kf8NBQH8KIlFpsDo
	 RYV6EbRClp/RBCHGoCk346hP+BVgPHNk7/NqxZmsOEAc1NQ9y4cLWCracZ35TlhYayWo0
	 FQvZw2I50dv5ZjOidGqM79PDqjHd1yr6vBTxAPQBdvRSiSfcywBcFYxiTpV6VhPbXVneH
	 y6Dns4yASgphE/uIXAdan1chmleVmYLkJdldF9iETKH7afGn0OzGJ1Tgaa5qu9pnt/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SfyMLdI6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EB2606A691;
	Wed, 25 Nov 2026 18:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SfyMLdI6
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795630543;
	b=v6Qz1HIoxwyylabjm8/l+Dud3NI8HUVAu/++dipUt0boNnkVvhnVDGL1I/wJvnXk7AeY
	 FtuFMOzytyCLUMcs0ojVCHpjBEXpOi9Y7XgVRKzpVLyiW4/pIJ3Vk2cwnwFVerH9IlH2d
	 QYyLir9eIDqeYUzJz/IyiwzMM/CcqD3vJqIrostCdVTxOZ5fbuaHCjbZH1bkPXbmv16Be
	 +Bg2mRzNvHRcUgMIsRvXOZYf+/2hKgCvZ4m2CGASvfGt+PNjs6Ts06MVNJvqB7AHDcXhX
	 Hck4d0ktpp9XG++ducBVLXZXpsCTa47YDhm0JBG3W3viTu6FXWfHoeFhnn7to4z9dig==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795630543;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dTY9H4MEUXebkJIxacnGx6ldxYXsTr4Zi+O0m4hM0TQ=;
	b=sjQ1Y6wYRrwH9DYQY7RwigkRTVaE1xi0QEqPDjtfyZUlyjFLVeWJLupQD3Z6JV4VQOp8
	 fmdg847oxFqBtyZ3L2H4xamxMxCmp1uUErdqndC/5LqKtbvA5R6uD2hbakbXI4EULfoGU
	 INp7YZQZJlXbh/rabvRqvBHPX9IGStgwmMQ5Nh5OXfgmzEVMqnqY2kWOppt/P1JAMXuqv
	 0hWCrfGoI/8i7ZVRnP3BzuFhDMkfUj6bVxuK5zZCyOi5o6skNUZH6oCPalZ0JzOG362lr
	 0xLgILuSjBKCxXHCIQdeSx9hgnfUNxCXoo2WHz4PAWz2wsz56DHRqwujQB5KLzzUSzA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 290CF1F000CF;
	Wed, 25 Nov 2026 18:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795630543;
	bh=dTY9H4MEUXebkJIxacnGx6ldxYXsTr4Zi+O0m4hM0TQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=SfyMLdI6oGsCf28eyFjxJjk1U6XGiYaVpsZup7vMe+YVs25bGVVBP8u6WeSDFZMdU
	 rUYIjGU/fGim5rMWkTZeYLGNnhd1Qn34tVqrF6q1hqTMIcG6WNfwG0H6QI1kumEgzV
	 L67ACUtwQt88uBKILgtzPZTWyVscVePKQ2kFajC8u3GwJpitOYhLDp91TE3coOY4lg
	 iHZrYNrLtgukNv7EC9U1GLOyjzQt0A5qKuPk+zW3LXk6a9kgD2oM8/kE4BNFYIe57u
	 7NJh9dBG5EAYIebWzfTfYGUJo2+7Ic699j++np5eYx/nzBxjlKBz8LMv2l9LR6yUuF
	 wNsC7zenYZYvg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A898F4CFCB;
	Wed, 25 Nov 2026 18:15:29 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Wed, 25 Nov 2026 21:15:28 +0300
Subject: [PATCH v3 1/3] dt-bindings: mtd: Add Cortina CS7542 NAND
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
Message-Id: <20261125-b4-cs7542-nand-v3-1-0b6d141c102e@gmail.com>
References: <20261125-b4-cs7542-nand-v3-0-0b6d141c102e@gmail.com>
In-Reply-To: <20261125-b4-cs7542-nand-v3-0-0b6d141c102e@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795630527; l=2237;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=R4f5+AZ20ZvVDHkrykvH4nwddcpdeFmF1zCSrzBHxh8=;
 b=kBPQv2qs1xIe41CCcmMZJwzugQyj5G+y5kuvv560SRTEqgGFe9Zq+PuxF7jkNRs1j/TXQ/UYT
 Pc7zemY/AWgDjWclueBcvDcIZ9I0oKvY5sMyc78bdh4Efte9a/fI8W8
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


