Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795459331;
	b=5nbzmT/S/Ep7RCI/FP2tqUS/p2rM4zRzCZCr0j2lenVpeizOdb9Vf3IWzqzqVY78zhHA
	 CuuXWX4BuT4qYi1IYPXsPPSUt5sCxWUeWg5r5bdBeDQ3rnIfiLje5q3ca97NdoMUOmS/W
	 r0IXxxHFw3UzGfoNVx3i+Bw2gH7TIS8Qeqae6xiNRB4V4VqCOrrCSKcBYLB3af2dd8rbV
	 4ulzhLECtfn4B3DyE8NauNCmwrTngAekVKaFl9iwgp79eNiHiGvMEBTn2rrIiHlsbrv2u
	 e6gfSGLPYA6rEBQU1Eem/bg+JMQHKjBrIB8Yc0pydDN9WqRPEXOyaBFi+Q1IM9DFEtw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459331;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ZoWcuFn13Z7HG21dAdgpMWm0Rmxy6JtdAHIg3Z0BlU8=;
	b=gJsM8QjBTvCyYjHUAoGwZQiifPVmkG0fo69sgslCVzPtN7WSQ4//q2E6pxUDZztZOedx
	 HN8bWP794e9bCFCeP7okhT3R1yoTeSf7rJ+y4f6F2KSQ74NUnL8sKS3qR5DyITDSV3wFV
	 hLkwD3vWqAyHG51v/s9/pzBnxpHccol19zSkxh7+qYTXnFUyb2c+ccvTzkbdgAH1KBaWN
	 nvXUm+AYGLLd9KQmqIBv33DSqApGDYTnyInHH6Rkkwg/55+x9OjMreol4+ZqTrgkTIB2p
	 A9qg1UqhkdaWFvHum4wZvKdANf5NE+XitUWgY/UGFgac2B5W8OAfW4UCfWFANpeIHMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="WrakwJ/v";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC86560A2635;
	Mon, 23 Nov 2026 18:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WrakwJ/v
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795459331;
	b=FpsEv8/fjqUcT3xv2O35SnZqPUQtJtRRNnUQgjLWC2hkIDQXkGDBXKH6O6SZIH5JE4Ut
	 rtfGTHURZjIhinpjs8xRodG0KbA3BOJ8aPYiAEVv9WiqhH+MDMkJ6UMZs5aTsxeHHfAGR
	 A498VRDpuWAQnUjQq9JFWC4j5vrVUNGrzmpCBfdjGr9J1PHjtbNq/tt2yasI4jmrJfn1i
	 5h1Wiras7YqHNRcc7t4V6vxIk/Dg4puMp7cDrx++1/dIbqt6SfSwOav9swGv3wMQOAYS3
	 6Benxj0/GMyixmXUUoZ4ipxq/nHc0FkJCk7ABn7AUct6OBTpE5YCI6g0jr2NPWI2SKA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795459331;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ZoWcuFn13Z7HG21dAdgpMWm0Rmxy6JtdAHIg3Z0BlU8=;
	b=ghvuZzBtN6FFN8vmXJDpejWnVhvP2QJ2C7qLaihv8o3vrf6+PM5u8iFdPr4Pjrz1DoW3
	 ahOLzAL/qIVTFkpmdkVP5xJUUfpgucgw5rSW6zFf3NT850XcuXB6BzJLjxEjLLSp18lmU
	 4gvORZB7SV+cQwmzfkrHBmmkivJW2Ktc3JmmtgMpz/CGXt+gNnDyQ9YqInqCcDfx05Kct
	 o1IaEiCqR0AdQYVS0HLkc1uR5V+0EhnBNSJ8/zu/14MmszolZOFvRA3HVX1FzH3QYOfM1
	 UdWpMPsq6Tr2eSounBBEOeo76DfW7LpVEsu2yd1yBWNvZbQZIlYAfkV3T9hfd57nQFA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C2A531F000D8;
	Mon, 23 Nov 2026 18:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459331;
	bh=ZoWcuFn13Z7HG21dAdgpMWm0Rmxy6JtdAHIg3Z0BlU8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=WrakwJ/vDv5HNKNtFhHEIzhc3sgJTNkPXkdxilhUC93M/LKjR4RJ2gfyX7QTW50sq
	 JgzgG/dpiKA5kybLymQR391WBrTH7IRzk37TvcVZ84nSoISIxN4spjDwg8ZVVNy/5S
	 yE2oxcx863bOexIi+Ak7JHc5nc+ybbpGvZVbC6xaw+A1X3zlKDtGkqqKmUToIodrvF
	 olHaDffJg+EpY3VQWxjNpdpdnteVwT3FPAEqXL1MlHEYMKnTme88W0bbVge3nvTdoV
	 6iDdzIxttvJ9QrLQhafKU6ahsW5b83Z/OeGRjN1qhFm8V2Ik6ZG5bDDaEc7kjigubT
	 zxdFmu7lYg8Uw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D074A4C5F1;
	Mon, 23 Nov 2026 18:41:42 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 21:41:42 +0300
Subject: [PATCH net-next 1/3] dt-bindings: net: Add Cortina CS7542 MDIO
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
Message-Id: <20261123-b4-cs7542-mdio-v1-1-626d0a0e3b4d@gmail.com>
References: <20261123-b4-cs7542-mdio-v1-0-626d0a0e3b4d@gmail.com>
In-Reply-To: <20261123-b4-cs7542-mdio-v1-0-626d0a0e3b4d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795459301; l=1747;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=wvzbW6/ViVc3D6Bi4MMZRceIJxjSfYxZh+iECcbGyQg=;
 b=KRgxNys71JdSYKfJpeuhdJw1d6ARDtsAA/DekI9MicChVy0DTe6c410XSsU5Ts1iR/5w16oxK
 SPmY8TC3+3JBMnp71WVmqDsAeLkUwA96r0rCByje5fQDylqvoQa3LwT
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com
Content-Transfer-Encoding: 7bit

From: Fil Dunsky <filipp.dunsky@gmail.com>

Describe the CS7542 Clause 22 MDIO register bank and devices on its bus.
The firmware initializes the MDC prescaler, which this interface
preserves; clock-frequency and preamble suppression are not supported.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 .../bindings/net/cortina,cs7542-mdio.yaml          | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/cortina,cs7542-mdio.yaml b/Documentation/devicetree/bindings/net/cortina,cs7542-mdio.yaml
new file mode 100644
index 000000000..77b5e2f09
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/cortina,cs7542-mdio.yaml
@@ -0,0 +1,48 @@
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
+  Clause 22 MDIO controller. Firmware configures the MDC prescaler before
+  the operating system starts; the driver retains this setting.
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
+  clock-frequency: false
+  suppress-preamble: false
+
+required:
+  - compatible
+  - reg
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
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy@0 {
+            reg = <0>;
+        };
+    };

-- 
2.53.0


