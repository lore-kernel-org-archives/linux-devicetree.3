Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795459324;
	b=EhOk8p4GlGPdO3p29dNNaQ2lnAUlco02UMGIbBK68VuD6TbZylVQ3b0zhuLAS8Bzy5tL
	 6bmNC0fuHfz355yJqN1nHvIvDFsinLe9jNcE1Yt53wtxHRTjnpKatOn4lQ0FOryfbTsF8
	 QybLRBlvHc7tna04QR63pjt7Qc2MuaPJDKd1FwnSbQBl0mnmwRggLPsZ/0QMxa7bmVjzT
	 kAte8hZOdvy8Iq91xYCQ/i/PjlVwqDf+/YodzCLiKIa2BC4dV3HzO1uTxK25pK4E641ox
	 t+R1SrDJuN5J6s6cmH7BT+X/+jypXIRiJDyhM0cjnMk2x/4FG0xVi8jnKIvW7B6kz1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459324;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dTY9H4MEUXebkJIxacnGx6ldxYXsTr4Zi+O0m4hM0TQ=;
	b=1QRFmlbcV8hOy3DV2vEIslOIKmTQ2WVHTeedjeoBpfJK5RnuAxgdyR0ZoYIroHY574TP
	 J3RzP2zc1aMYoUC2GE/n1mijXEIQbS5ZVBUQGzUR6DiPFWLpkzZwo2oPz5Fz9Jh7TK0Q1
	 aaSlsdntrTp6cnNPw16qgn+fOgFaJMCW5ampg1qxlhRNgnxZMZz3MxcL8+ym6XXKpCebr
	 8R7Aox0eTnIS4WtaW0Xv9l7iAoYr32AxlFut7v0WMhWV5qeSQbiH0F+4eySvhBxMYQBPC
	 QJbnWynQva7gcfACwkb1T5tBwvEJY3RclgNQzZO/uzsen6yIOLVQPp0+2Q4gfBKpNXg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SWOaP3ks;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F73606A327;
	Mon, 23 Nov 2026 18:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SWOaP3ks
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795459324;
	b=fJrmK2GeN2yuulwho1kfru2eoZ4BLCCb//sltEZsO0Ul7cMh3P1J9gniBXOyTOFma/PX
	 Vze8o7c74yCE0SdASnGIXa40S4Cqjf4JOxm1FXw9Upx644NrVl+PzHauHhx0+OvU4iEHe
	 4l5hOFAkG3bRK+DurHbB+XixEhML5Y5yC9MJIE3Pt05//rBDO9UwnifXaA4zI0zS069Vl
	 /cc6WzUHgfl4Jn89Q4Z7CX6TGS40q3RXzkmMg87rnxbWxSxlwTFDX7t4h/5r8v4GZ+TYW
	 7NAwYH2LqAdHEWqOMq2aVALocg5bZaiapqj+FQEz+eRuU5Yy+iEbQcPFwqYQZnLXr3A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795459324;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dTY9H4MEUXebkJIxacnGx6ldxYXsTr4Zi+O0m4hM0TQ=;
	b=0cl4RSoqJ1ZU/m04JL9SYT2KGIEBipjsGpqTLO7LnjhaUDL/Ji6fZUYWJYaJ7HXvpQ7R
	 T5G9ChhzRJ/9agecBq1OC5O/VR+WpHO3IUC9u9lVQ+9cYnj6YQqAyFim5cukuK7S/flzb
	 IZxk+uwwG7ju6ptN5b6o3q1KOz7UWLXxPBJYnAfu0WYbCg+SmpAZvEBNK/WWggzWzgQ7f
	 aiU/gvG2GS6xaMB621EgG3qKZJuamNMWUiPMywA+jHG5Ub/jIbEATH3wkJjM/gGWMEECz
	 LubO6tdMRMKC9NbSjjKczmNB4571mRWXL6Ne47ckd8m8zAq8hbUgAfU5e/g8mxkm29Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DE1B01F00ADE;
	Mon, 23 Nov 2026 18:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459324;
	bh=dTY9H4MEUXebkJIxacnGx6ldxYXsTr4Zi+O0m4hM0TQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=SWOaP3kso5TwUQnd0EHBj0HxYvBuJQVjiXNBjP6zQCWg0V9d/BECBt0sxO34p+8xB
	 U1ltQxiVyE1o+SXMQBfJDTZyMmimhJOOm02ME8FPc81eQ7uecxlrxVsNW6MGqFTdLs
	 63fn5XeziLZLMaiZtR4FvtQvS5njJnuC47wIvqZmRzXMFywFA15y/txG3+RH3JfQAZ
	 /I5H8Qsl93KTG/jjsXhQ5KzMbiSURvPFRL8DHL5HjbTthiPOgZpJETXRQcKoR01ySe
	 wLxusjdWwHKyzWbv7traI1qVYa6holBvsnjAAV7+QTVpgBxQVb6OP3Tr8W1QJrLebv
	 o9MT1J2JorAMw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BBAF94C5E1;
	Mon, 23 Nov 2026 18:41:39 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 21:41:38 +0300
Subject: [PATCH 1/3] dt-bindings: mtd: Add Cortina CS7542 NAND controller
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
Message-Id: <20261123-b4-cs7542-nand-v1-1-7ce179c011e2@gmail.com>
References: <20261123-b4-cs7542-nand-v1-0-7ce179c011e2@gmail.com>
In-Reply-To: <20261123-b4-cs7542-nand-v1-0-7ce179c011e2@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795459297; l=2237;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=R4f5+AZ20ZvVDHkrykvH4nwddcpdeFmF1zCSrzBHxh8=;
 b=bfHq8In5jdLo/dunT0UnO+Berlv962onqZZJnPFXMiVqyAFPk+hEUZm0R+b7I2/4SP/E82iWM
 kwSK+k2RImTANU86YaMZ/NEGC2VMQezGEuSDrVfrnttey2FTzaCx63W
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


