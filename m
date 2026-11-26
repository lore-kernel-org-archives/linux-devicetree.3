Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795685265;
	b=WSkKyKB0p9GvzTXeAep0pPXmt1bnYR3rxOJHppF3XFZFmnJo4gRR2Vl9pPdoCoC1cjSQ
	 eL99aYA3M/X5/kfK3zB1657AKIfVtMnOlQGw/xmrh+JsdohbN+z0VkB1yQLSzIv+M+b5f
	 Jyw/jAfxkklYnvGUomC/yWiiJj5+qnmNiE/prg/JpnbcyazDFVHN9NhMCX9labg6WSrpk
	 Hl1mCoMFg7Zk4ajw9nReOLUN9SWIHyyK4pyytd4cXc15vmOWeQ8OLas3bD1te4TXyQXxk
	 kUeHVvaYKE4vkIgpPyO8zG/RL5gDTqV09Q2ZYfAeevbcNKqaofIRNCi4RY3sqt8gNrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685265;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=zcZDk7/7aN/gswhrI+D9nRZWAJbxsCKiuXyCYjgw9A4=;
	b=FyLCCYs51qjUdv4w2rEcDTJ3SRV+FIk0EzowNN/XuVq1lnK2O1vWERCMz5OiDGzAFpYm
	 EO/V3u6QnjciatDBgbXf70Lt5UQZDgUMJLdx+JAoDlCT5iDCaWZhz5bJH9cChwmhZZw9q
	 Wbv8oH7BiXMjjqqOsz6Fa78i/y35D7EVqlHW4B2PJTcDmHQQqFkTLUWwT+E57gMrHi0s0
	 mkmCufiNVosc9SS62HA3kPJ3S+wNdtIYRC35F89qTNthHhTYiXWUONlSICVnb4YyrrJlo
	 PoekhPxSKmi0JB7LBXHTmiWQae6tyZiUpo9iBU5eCao0KNdtPwDxrzVz13vx0nNx+1w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CMA3FJPf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD49B606A32D;
	Thu, 26 Nov 2026 09:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CMA3FJPf
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795685264;
	b=IFTd7V1pcWb3DoV0nsQyh+m/5hOXOtnWVJC9+a5DpVwkaFyLm1FfH/ZqjNlawxQmmrfa
	 xPC91zJpo3Gg6AQrJOJA1GqAaAwFZw1V3fR9GixM/2lgHZrKjAzySZlpetYRxxcJlizpO
	 IQ42qYc5CFRE0KUUquok86W+qErzB8l7TQqA6mm0tJ0V5wNeHxN2v/tWnujDLBLp3qTaF
	 tTHuQaEPht6tp3kbESqefnxrzoIsR5eTKnuBsKBLq9bFqWARugerRwrFS9m32yX+HtJE6
	 bPYQ80dlwJqWm4O5r36e0AWV9d/SsAxZ+c9muGoHzC3E67sGkaPesSIJvL33nrmcEuA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795685264;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=zcZDk7/7aN/gswhrI+D9nRZWAJbxsCKiuXyCYjgw9A4=;
	b=038yr8T7I1HQXnM8c9mU2vIpA0meFUctnGCxQsvw+3zzUkPZqDukxcNMHuc+imB75hVv
	 T0gm+jdiIQoPdq0kBQtPlzXQnfRM4u/YrhWu02yB6YD/ICWch1ezWZjPLGCxkuxX5Q9H/
	 yPKL1o2htvG2sBoVDD2p19tX68kZ0TPDIfj8iWZ0bgGfi59byHccp2/M766GRLEuO7x5z
	 0vrNV8rkoJDQ3014w9cQHFfV+nTqLdoqf+GYV/JnNSXyhN2pJ9HCy7WQmV3DjYw9c96HT
	 DtLcYORgqnjjmxJ+V8Exa6xBNRYzA6nXGpkeB9aeUT9PkgONM3MRj/hWB+LxGJhNMkg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 790411F000D0;
	Thu, 26 Nov 2026 09:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795685264;
	bh=zcZDk7/7aN/gswhrI+D9nRZWAJbxsCKiuXyCYjgw9A4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=CMA3FJPf01KpDtYNcG6usUYAS078FzQ1C8MbDQfQGFc8R9jREN+Essz2YUK2znwsN
	 AAVaK2SnBL9PnRoC0Testhoe5tVgy/RWDh1cJ3jMXeqEjHjs+blNJXjG3XiqDU2bsi
	 sdMrQ29JxhumKMUonfRdvk81Wqc2w0NSb0iBsxuW0u3B5cAk9IZq7IzbW7WMu14+9u
	 6npGcsfPCU54+2ytAt/dQt6DbxMTsVqDUy+JDLoEbq+Kc9asBpSDAGuT7mWtxoT56B
	 Qclep8j83ApT+abzCZfhGypz3ICimV9MEs2PgOvnZ5qRm+Bao56OXABLh4rRg78pkH
	 kyKzi/EoQ/0yg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 08E6A4D365;
	Thu, 26 Nov 2026 09:27:35 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 12:27:33 +0300
Subject: [PATCH net-next v3 1/3] dt-bindings: net: Add Cortina CS7542 MDIO
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
Message-Id: <20261126-b4-cs7542-mdio-v3-1-35739a0f3225@gmail.com>
References: <20261126-b4-cs7542-mdio-v3-0-35739a0f3225@gmail.com>
In-Reply-To: <20261126-b4-cs7542-mdio-v3-0-35739a0f3225@gmail.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew+netdev@lunn.ch>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795685252; l=1644;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=EoXlxNX1iAJoWLeZjd6QvDar/Xp3T5I8RYbd+jCV5yE=;
 b=DwzDydADC9Fhf1svmIl6olWyyUHQGEfHbcXVXhOsxKwCftdbtEgR0ocHLrRMZBAQAFJZlS2x+
 RKN0og3nU/xBRk8H3TyRcFGtu2Nm+DlMoFI7lsADGmVvQortCVYnxqL
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com
Content-Transfer-Encoding: 7bit

From: Fil Dunsky <filipp.dunsky@gmail.com>

Describe the Clause 22 controller, its MDC prescaler and the devices
on its management bus.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 .../bindings/net/cortina,cs7542-mdio.yaml          | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/cortina,cs7542-mdio.yaml b/Documentation/devicetree/bindings/net/cortina,cs7542-mdio.yaml
new file mode 100644
index 000000000..66b5199c7
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/cortina,cs7542-mdio.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/cortina,cs7542-mdio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cortina Systems CS7542 MDIO controller
+
+maintainers:
+  - Fil Dunsky <filipp.dunsky@gmail.com>
+
+description:
+  Clause 22 MDIO controller with a programmable 16-bit MDC prescaler.
+
+allOf:
+  - $ref: mdio.yaml#
+
+properties:
+  compatible:
+    const: cortina,cs7542-mdio
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: APB input clock
+
+  suppress-preamble: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#address-cells"
+  - "#size-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mdio@f00700a0 {
+        compatible = "cortina,cs7542-mdio";
+        reg = <0xf00700a0 0x14>;
+        clocks = <&apb_clk>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy@0 {
+            reg = <0>;
+        };
+    };

-- 
2.53.0


