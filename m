Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795459466;
	b=KcNtYCC2bCqPyBiO8pPG8MLWrCIYxvywTEELHR1/QIUReQB21fh9oMSEXW7pcgk8tlKN
	 XO6/ukOVcw1IxC5aLU52tPGf2D+jSBYkUxy+iDnqBNIg5Je526x6kC/kxXPAg1Wf7Rvxp
	 8lDjCmt/NhmRvqqKrSot9qt/OZ7v84j39XcbLJzo+OSptXhYHdlgw5RfJ7dkqvDAWFeVb
	 hWBrKnor7/pcr+WKkmJ6wHVpFGt4JXJnWfl0rvKiuGNaEh0ky5sdy0J6NvyEenbrdXjr7
	 AozDjdWxXJn5L68Rz2nrJzuQWg0iObaQA3JVOptUBCOoRp73CNSLniOk+LBJEi7Gd6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459466;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=36qSemX3tCfGbY/Pf4EbmcYnRfbMVF2BhDaAK816hh0=;
	b=hbJcbvWZKtfLrjr20lSpM+r3bjrIbcDg34cfyMCahNC+nL4tpD/+qVZ8C/GxucUDMuxh
	 KA0IjsSTjOxvlVFEJOeUj4GHVfQK8bU9vtE8M705BqMo+zbq8CKeQ6UcwJpST2qWqhSeu
	 Tyb9aUWf6q+kqW+bHgQ+AdqPkJTj5d5qH9cM08Jhh8zEtrBsi/eJaobE0JcClTJiJDiKf
	 yq0XAOEXzKDgS85hkLj4sSXOJQ2XHsGOqo3IMvDSyj7XeAm55GA503by23VwFbGKhb9Eg
	 5Yj0piZj0SDysT9G6BtZlQiPhaeXH9AiGhxhzruSTuoo8TPNFLVozuhzTLI9hGroZeA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=keIzUa9q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D361C606A691;
	Mon, 23 Nov 2026 18:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=keIzUa9q
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795459466;
	b=vwTtz1kNpKVzyYYBLuebdcLLP3WXAjmgB7nXcyIJHpF283sw4x5MXQDgxhuVk8i8n6dD
	 5HGR4iCDAn6VQTWYdhcgNOkRv7LoxQjFmMtj8BRwyWxeIO+Jr+68lkdp8BV0uFC2QoFd0
	 FtSJ1j0nT0ubbtE4LCmBg7CCL2FAxo3/SgPbiHtYoK52Bfvi++NO48FR5PJY0BjUs9l3P
	 oEvp+3YApQ7z/Vb8lQCjVmLG8ZhK3uFx9ehouF6tsdcUaSl0wJL/xg3SryU4AsgKBoGzG
	 IK2lscGYLD+2RRUhc9ihHOiMfmDQljGvO1t2VMU5sSgjhZD/CKhMnjxnQhv3HvSsdSw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795459466;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=36qSemX3tCfGbY/Pf4EbmcYnRfbMVF2BhDaAK816hh0=;
	b=fljTMjFH8xiYUWNhQ2hfTk/DpFxh/xMTozKJ8OlIWPkTmPJaTaTiR/ey+XVYNldsyCfF
	 pQ7lO3LxgHQR18UQUy/GpJGiW+VfYop+8l1pgiX47qd3HAo47pcNdGqcRsnuV/AjmUtcq
	 CeG3KVOgeLIwK4RLNq7R+KbtjVTpCl1lbPbDnGglWaxbDUhW+NUDNLsUK0GNo2m1bPa/d
	 2kCgAed0GS0NX7c2o/ihkJ1Kx1O/Qw8imIBmJGJ+VP6hk//Q8vSkrQkzZqar1SE1g4Mnm
	 7gZMbzgNjcep3OMxUyVznhYx/z7jwwDNCnxcVhmaPjeqKkRoKwr+0fZAqchkM0et9Lg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EF0491F000EB;
	Mon, 23 Nov 2026 18:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459466;
	bh=36qSemX3tCfGbY/Pf4EbmcYnRfbMVF2BhDaAK816hh0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=keIzUa9qHC2Ahq1T8V4PpyPCOeDH79G69JVIvo6mb9UrbwVGreaFPC2ztwTKAacHb
	 LL35u8bgICVhYsCyP/AHoEHEhi3WCZv8VAuZEBzg1Lug7VycfUFzwkRh8InU5v5EhN
	 Pvpjv4nUFBdNZeF0OgxF42l9hjWTb7lCzCGNwqQSq2BMt0Tv2jp7fRmDmwbbqUKS6S
	 K66R/WOtkQ1LRqCpeSFzwbbauO+IIaUeH1v4TpO+CKMOKMoN0EfY2HZVA6ieVzyhz7
	 hZU7bsgVNVSKUaIvw0heuty+Q9dITlv5IyJqkpnReqeSc0UtfBKtUluBSuCXI7MAGx
	 DK9SiLA2f5jjg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6E84A4C61E;
	Mon, 23 Nov 2026 18:44:13 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 21:44:12 +0300
Subject: [PATCH net-next 3/5] dt-bindings: net: Add Cortina CS7542 network
 engine
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
Message-Id: <20261123-b4-cs7542-ethernet-v1-3-fdb5e8c2d508@gmail.com>
References: <20261123-b4-cs7542-ethernet-v1-0-fdb5e8c2d508@gmail.com>
In-Reply-To: <20261123-b4-cs7542-ethernet-v1-0-fdb5e8c2d508@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Linus Walleij <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795459449; l=4831;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=VOUhMB0Rj9fA7lJi6AFflGQnBL7hZTNQBAAAIIyJdgU=;
 b=uJYK60NJOhRvpdRbJCsqc4QFb9+8vTO+QVkRApxCTEV92jaaJX0faCN6Dz28HgZxEpNUf0k39
 gYYdiCw88RHAJDoBFZse/R5FySzud9OSNc322DmlNGop4rE7m1d5ji1
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com
Content-Transfer-Encoding: 7bit

From: Fil Dunsky <filipp.dunsky@gmail.com>

Describe the GMAC ports, network-engine register banks, complete
exclusively owned LSO/SSP DMA resources and engine reset. Require an
explicit no-map queue-manager DDR reservation for the verified 512 MiB
memory layout. A separate SSP DMA consumer cannot coexist; NAND PIO does
not use that block.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 .../bindings/net/cortina,cs7542-ethernet.yaml      | 139 +++++++++++++++++++++
 1 file changed, 139 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/cortina,cs7542-ethernet.yaml b/Documentation/devicetree/bindings/net/cortina,cs7542-ethernet.yaml
new file mode 100644
index 000000000..94bda9e0b
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/cortina,cs7542-ethernet.yaml
@@ -0,0 +1,139 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/cortina,cs7542-ethernet.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cortina Systems CS7542 network engine
+
+maintainers:
+  - Fil Dunsky <filipp.dunsky@gmail.com>
+
+description: |
+  The CS7542 network engine contains three GMACs, the network interface (NI),
+  forwarding engine (FE), queue manager (QM), traffic manager (TM), scheduler,
+  CPU XRAM interface and packet DMA. The CPU datapath uses the DMA-LSO TX
+  queue and QM-managed RX buffers. The complete DMA-LSO/SSP register block
+  and the combined reset domain must be exclusively owned by this device;
+  a separate SSP DMA consumer cannot operate concurrently. A NAND controller
+  using PIO does not consume that DMA block.
+
+properties:
+  compatible:
+    const: cortina,cs7542-ethernet
+
+  reg:
+    items:
+      - description: NI registers
+      - description: Complete DMA-LSO and DMA-SSP registers
+      - description: FE registers and indirect table interfaces
+      - description: QM registers
+      - description: TM registers
+      - description: Scheduler registers
+      - description: CPU XRAM
+
+  reg-names:
+    items:
+      - const: ni
+      - const: dma
+      - const: fe
+      - const: qm
+      - const: tm
+      - const: sch
+      - const: xram
+
+  interrupts:
+    items:
+      - description: GMAC0 CPU receive queue interrupt
+      - description: GMAC1 CPU receive queue interrupt
+      - description: GMAC2 CPU receive queue interrupt
+
+  interrupt-names:
+    items:
+      - const: eth0
+      - const: eth1
+      - const: eth2
+
+  cortina,global-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Global control syscon for network drive strength and status.
+
+  resets:
+    maxItems: 1
+    description: Exclusive atomic reset of the complete NE and DMA-LSO/SSP domain.
+
+  reset-names:
+    const: engine
+
+  memory-region:
+    maxItems: 1
+    description: |
+      Reserved no-map DDR region used by the packet queue manager. Initial
+      support uses the upper 64 MiB of the 512 MiB DDR layout at 0x1c000000.
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^ethernet-port@[0-2]$":
+    type: object
+    $ref: ethernet-controller.yaml#
+    unevaluatedProperties: false
+    properties:
+      reg:
+        maxItems: 1
+      phy-mode:
+        enum: [rgmii, rgmii-id, rgmii-rxid, rgmii-txid]
+    required:
+      - reg
+      - phy-mode
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - cortina,global-syscon
+  - resets
+  - reset-names
+  - memory-region
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    ethernet@f0010000 {
+        compatible = "cortina,cs7542-ethernet";
+        reg = <0xf0010000 0x500>, <0xf0090000 0x800>,
+              <0xf0020000 0x4000>, <0xf0030000 0x400>,
+              <0xf0040000 0x800>, <0xf0060000 0x100>,
+              <0xf0400000 0x100000>;
+        reg-names = "ni", "dma", "fe", "qm", "tm", "sch", "xram";
+        interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "eth0", "eth1", "eth2";
+        cortina,global-syscon = <&global>;
+        resets = <&ne_reset>;
+        reset-names = "engine";
+        memory-region = <&qm_reserved>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-port@1 {
+            reg = <1>;
+            phy-mode = "rgmii";
+            fixed-link {
+                speed = <1000>;
+                full-duplex;
+            };
+        };
+    };

-- 
2.53.0


