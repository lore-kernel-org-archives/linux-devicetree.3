Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795466443;
	b=YvheqIspjH4X7N8xft/vBl4l5zj2H1lQhs9lKNErPHq20z+/fJp43nUhtPSib+quzTx1
	 tVZb1bV+qieEQAeTiCo2hlboEPYpEVo7ctQxsj019InqQw6OEPWaBzsoud64o+WhnfBxJ
	 0nF4KQIsEl5+burmkK40L3HO4/SVuzUHg7lejqYoM4a2krwY1+28pVz1td/47xmJEyDo8
	 8WFGC7WALnYTpghVhnODCbArcji2pTrek965OSEzFMljGF588iNQoXoR1XZGwodB+GdFe
	 x+rFXifMPyRO8yaEQ/9MCSDU2yZOvr24x/M7wNbVqsSwoQncd7tKoL0/FfBgArQIS7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466443;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ZoWcuFn13Z7HG21dAdgpMWm0Rmxy6JtdAHIg3Z0BlU8=;
	b=cpVRokeUd8Bovi7Hs8f3RTXKycs9tJXJqMF3+YgvlRrZmWkBuXRdBWWX/mVBiUj66j1j
	 HbAznk4+Nee+K0myWZ2FQK30A8GZqSswMbryOYBbOkcRHC6iOVBFaMzUiBeGeov659g6S
	 rKa8Hoaylfp0axuwQMbYa373H9K5Ded5XHWwxgFH0E5L00M7iW4rQ3NI7NmJZ3D3ZFOe+
	 8xnXRROa97xUiSJjOpVoqAaQTUJulbVkiMbnjc02LJmBcNPravjjepFdWfeJ1RVKP9uDx
	 YXTWELO3RCUdJ8FbyNCDjXDF0sBlfyZwoHsd0lhkNKWgZCOC/yzo/Ym1WrjU4T6CCPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XN5bom+a;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FAF606A326;
	Mon, 23 Nov 2026 20:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XN5bom+a
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795466442;
	b=BVvpb+fOzN4zecp1OYt41AhfX2DUOZEDzW+Sx4gQ/ucTTq6rqzkVLcj5bC4ea6MQLE+B
	 NkPD14GV2i+Uh1bo2Bkq5/7GhbJJkq/2IC2lnBHL0b7fR01ia2IC+X1Ouc8yI2uxMVD20
	 K+13DlvwIn0fcVuKKkhfMzcFnm2EIanBKmW92L54hiWzIP1Lp9YHHjOwsjmZnsgMoDaPx
	 7sBnghr6KDlQ7YP0tAWMYJpocFXXn+9pgw3ZrcQEbuNbTDDyBIZ43lf4KIhoSM1m6Z1uX
	 uzKdICoAqmKg1DXEsAxnxFFsAxfChaOME7+38yvU8O7rjwZKcmvyIPVIgWDmlIeBxhA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795466442;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ZoWcuFn13Z7HG21dAdgpMWm0Rmxy6JtdAHIg3Z0BlU8=;
	b=oKIjRV1Q47Ard1k/6T/Qt0eItNp7AyBzlrlfBnJqB4ueqWkZzGe2OOGq5V6LyqzueEls
	 m5Axpmk+5E784qG1kn2sYrzRqHFcNYqdF5UoZHt9BEc09zTkkLePZgrhr1+sMfRVRR8GH
	 66QsKjOjQBFULkXphcLzymHf0eDUFxV1Wy6PeJkr8KSV7YlnSBREE25wIX+heAW2taNlr
	 RTOXfDq+JNZ3uyVTJ6nudQdap2wngB8DR+ANTw73dY61hh+57X+Vg3KFzK1zWjCKJjADm
	 LuCKDHDQ81W6oGCyBjG9HCVXDCHOKtwAgiIjH/GZAync1X+mi7NrEhti3KMvH+U624A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E2CB41F000CA;
	Mon, 23 Nov 2026 20:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795466442;
	bh=ZoWcuFn13Z7HG21dAdgpMWm0Rmxy6JtdAHIg3Z0BlU8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=XN5bom+auQOgMO3uh7btByhTMzeQO3LfFhk5p711OB3lBUv9yaxboN4+jEAnWJvEK
	 E+VqmuJUKyIpqicSqvx1y6A61aLyD1cSDScvN6p0eOG5ST4Yjfdf2o1dV9GWe3G/d9
	 wV41sTPsaqJVK2m+nqpYPdzYScUTB0weoTB4o14TAGztH6+TpUvgiGLizfEEh3n1gH
	 F9xRUmBtnzzum40Mrm2G25MpNrQ3s5bB9d99Ch4rjhfjicFjGYfA598oFdhgNxpm4p
	 pzrhpUm+l9wunyPDZcIxUyckKC4Aj3urM/LPN3MSZzaTlKNQnxj6bPJmEkio2uhTuQ
	 NI+CKivBa1s1A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 67D074C722;
	Mon, 23 Nov 2026 20:40:39 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 23:40:38 +0300
Subject: [PATCH net-next v2 1/3] dt-bindings: net: Add Cortina CS7542 MDIO
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
Message-Id: <20261123-b4-cs7542-mdio-v2-1-30465e831853@gmail.com>
References: <20261123-b4-cs7542-mdio-v2-0-30465e831853@gmail.com>
In-Reply-To: <20261123-b4-cs7542-mdio-v2-0-30465e831853@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795466438; l=1747;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=wvzbW6/ViVc3D6Bi4MMZRceIJxjSfYxZh+iECcbGyQg=;
 b=vrKtd70aD4Gmbw1gSPlgcRvaDhYu62wZZSGdq/45x8bU+PbjhaJOpDNI8vkde5RGbKoi6dANS
 wh+aJ9kQkq0CqKfrtjR0XIWYrQLmpHYLSqmBdWXMI8uGqlHTMh6dfu5
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


