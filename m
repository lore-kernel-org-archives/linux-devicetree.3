Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795774481;
	b=CT+b6dBLJhq6AO8l4izgN0e1e08Wl3xZKYWLPyqnmrT4Vvif2zxMmetxntjiC9fZOWHz
	 jNy7nKkgHpS4b/hCZ6IxMCRgaJ3aVYlBZQU9w0/sgmTMv/j4g1hXH4SwSDkdKf3C3U5AJ
	 WQaGbAzz+QiSmMD4CgYCKZFYZQbFQU5LIj/A3gzAcTOIc3+L2EAJtu1GS0ziMY+h8ciBv
	 qIHXr1Wp/4J7s4lTlSZ5W+w/WP0I2YdKtqbG4wOtbn9tW4X/obi9sX+N4bBfPULe2ftd2
	 e4ztiEqmch1r9iyA/4qVNDramfOZd5kwGOWF48O++pdQlS2ceo9MbnQBmApZCiQQbdw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774481;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=zcZDk7/7aN/gswhrI+D9nRZWAJbxsCKiuXyCYjgw9A4=;
	b=eKPFOsrLih0UrZOHKV2LHW5IyitcbZNNcYJ7Rfvs0+yonl44L5DH2TnpXIu40M9viiIc
	 YXfMwyAJPKbyZlZnDyUDJncehj1Vvcv8y/k3Rfmf4QYrXwEWYK6jG9t4arnei5ThR+2Rb
	 3Fz6NeXERVHhUcIJvgpO7s7psqExutnNLRL52WTOxgW6Hlrx8/6kdcJddF8zQSth2nR2p
	 hWjeLXJULPaQU2MkXtk4mAzzkHtb4oo9g/pXLjoKhQci3Tdm6mESeqUx6mwaSqERQmEMd
	 vZTO3kd43kjo1LQaB7sy/SGriBSvr2tDdJ2pHLlTfqeI8vukIckN5Fq6VUxQ18KEReA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=elPshzcZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624C3606A6BA;
	Fri, 27 Nov 2026 10:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=elPshzcZ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795774480;
	b=AyjGUMBM1WZk/T5UfWjq7XKd4gGABw2PRvYLo9u3bjmUWYKX9uiRrL9BdVydC+6aMist
	 imw1nzIHbPzpJWYjF1MItLYSce9qEdp2S5H253WS2yMxC/SSLK4hERpuNlnjq3t7Zs7Z6
	 +vcFgO17s+v3VMuLizPNWEs2RaBijH4Si0JLU1m6Tu/FD3a6REoWZl2Kr4m8dNVOYy5ap
	 pMyslXljRylvvdOGCZ6vjfNvcv1KklM6/vttTx3A6swuoQGFwXA0qvxA0rLaKVHMlo6o2
	 oGvtNWSM3ibki7jDYPRafDUpEhntIc0Vmd0WePhDTC8eIXC5gbdu7zzjFd/mt+11IPw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795774480;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=zcZDk7/7aN/gswhrI+D9nRZWAJbxsCKiuXyCYjgw9A4=;
	b=qS3As+IBaKl7sds3CBIsfK8HfmYG0RNseqwXBxXtg2VcgWwNTLkYcrN57mdUuRbt5aLD
	 ZU9zED0phCr+xSEmXhWCacSiPbEzh0Qf+CA80cE85kJwlyaLad8qWZPE3wIOw95WMzOmF
	 obEa/6hU5kWR0ymZu0pcugDHLXhNX1MkWGhqIwxR5Q9CTZaBKqEDGG1EtscxGZRNiKeyd
	 lgvhVjTTOSqVJhQI8wwmqfCzdMggBS/ZaYwtJ0vz6h+xPtcmc0tqCFlBnVqLC7XIYLbBT
	 avUxHSFTaVLebWh+ZVyfJGDePYcD1MnKI3l/7hNE3o7dW5ESb5fPaWawXD2bZV+NY1g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D7ED21F00A17;
	Fri, 27 Nov 2026 10:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795774480;
	bh=zcZDk7/7aN/gswhrI+D9nRZWAJbxsCKiuXyCYjgw9A4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=elPshzcZhcZO+NGV81ojoNCEyEzKH9BAhLlQXYfeqlidsoc35MQcKGrpmz5McnRF5
	 df2tjfJISGVzKamcDj8L+/cb/DbFFSiFjq2z8xfAcACAvhOC8nZ3qw2RH7aWBgyKJ3
	 PzlEJUYrdNMsfWpr6IKcMgKKU0ubBXviQb23sNCFt9o82m0gpLkZE5F+5parFqjQ8k
	 LAn8A0fn6iexGHn4Z9GNPyKMn88t3r2bfYggwgAkEXTHPMO9KcjidevaJtJUflTKIi
	 8W48YhqIAgqlXdjFfc/M5juDm7af3EDaAbuhwMP/j9GzP6j5PP+q037T4X3Wxs1Rpy
	 zdiNOwu8fN29A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6B9284B6FF;
	Fri, 27 Nov 2026 10:14:22 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Fri, 27 Nov 2026 13:14:22 +0300
Subject: [PATCH net-next v4 1/3] dt-bindings: net: Add Cortina CS7542 MDIO
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
Message-Id: <20261127-b4-cs7542-mdio-v4-1-0e37fc0c47d5@gmail.com>
References: <20261127-b4-cs7542-mdio-v4-0-0e37fc0c47d5@gmail.com>
In-Reply-To: <20261127-b4-cs7542-mdio-v4-0-0e37fc0c47d5@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795774461; l=1644;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=EoXlxNX1iAJoWLeZjd6QvDar/Xp3T5I8RYbd+jCV5yE=;
 b=zpBlOBrrcZpYaVDoWlZcHOBJe8cwtjN3Q2ZJRNIu3S24spyBuydkLZ6RMMdnxZPv5QBiqmnKt
 GontL4tNyJUCd+O8vxoKlVyp/Smpk6kdv7rqRInZ4j1FYWj3nM9LRpU
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


