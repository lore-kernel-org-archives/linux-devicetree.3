Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795697144;
	b=ZMUn7hzepnjcUBevWu18u+mPhlEJ7C7wUAQJloQog10cF4dqEe+U0td0josV3nq87CEQ
	 bhseC0IHCaUTYcICxPjJ+0rG1EMsvlnGAamUtGSdlC6rXiw6q4JPteqIuxi2OY5QkNz6b
	 CJQ1F6BigKB29Bj/FWRJBxjMF3e0joIifMFm8HHqgxe4mJQika658nrR6uoQaon0exvXi
	 QqomqN1TIbSpz0VFK7cPg+UtwMOm4iYAVlJz44FB8/l8qLCTAA9GGHHz4gmRHX7a7/qvb
	 7PaME54HKfcQWeuEz5JGpgN8tkAy4w/NDRdipui/XudoYEdWfxs+lBjLEFipS5N04SQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697144;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=jNPW/Pg0JpLswGfcRTLclR+xYs8LeJ8SC8w+XDaMugA=;
	b=xF4FWnFYMzLmDWuSCFg1VZcp/J/R8Lltc+3+c3h1zTj7bzIpDrDRYyYhPKYcThI6GrgU
	 ZiSQUL0kvsrEHiZV9Pkb8bwtoiHEJqs8lwg+9CegPG3uIvJHUGLV5QeMbmpQTPeG6Ycgf
	 iF8OtJiro44UaCRgx7j5MPh5WsRvIYJHQt3MkRP17NuOnVZlXnI0LuXh9KzFuRGamUqXx
	 Tx6NF9vGuYEhsMLIv5869sUdhXq792GOunVl+PhhjErmbJ1U40xWJNp/8TYun8GbGCs8j
	 ceU5jmlbjH1sdCUAt/IUAc9jpzaWABj5y8lO3Glz3NcOQXpiCjnfEixlQyGg7nhOoSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fAyAtLym;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AD0606A327;
	Thu, 26 Nov 2026 12:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fAyAtLym
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795697144;
	b=P0Sg6LSbajJIR3WKQ6i7HEyesqh9Nbm3+BHU4LqrV1UVg25tcDGISZxoaMKgpGNbWuot
	 +h0DvS2t4WLkiIU3dH7dn7aBEiQO2p8dRnSmXAPrxGgLsm3uFzCR9CFSRjqu3LfXSEGqm
	 WiLwi1lBgOkaRh+bG/rCNtUmHDjX0R3iliM2xsgraeuqWbiLU0/csFPG19QDb5f8m3anl
	 JKcbbL3PcaVbjzk5eecgD+QahCzo5HSLhcBJAzfQXpoIRz5nlKTr+bWNnYbyitKUNl9HS
	 pXiuyjISIS8o+M/PJs91cNzS2MGthrTwuXjlAdHB9MmGAiN78J1BXN64ZmP0QbNuvkQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795697144;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=jNPW/Pg0JpLswGfcRTLclR+xYs8LeJ8SC8w+XDaMugA=;
	b=R/l5gmLQ2hL0Z6aoUJxwlSl2/GfxiNzU2hhDylKTDwTuzHsQPRsmbHkCgW/fhHInCv9p
	 G0SOhVRUBstWhJSsgzXBwZuAAwcqRfcdThN80tctYbVRYxzFkRuuQmz1pxLgpBnqstpPa
	 lZHDV10q7Tw8kr1ABETARRnmBTGvnrGZyrLaUg2jIVap9aXOysNof7qi4iG6gLl6OKU4r
	 efGybyXGSy18OAssNPkZmw7I0wieRq+xQx20eGF0qRRIIrkcOtcZn9DXKXC0yjySpTkTf
	 mqC2tUIAw1IGgb5JzPW026muZZsxr+2hCIXZ0o8Wda/vWSowJjUEJA0KfZJmBFGWv+A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 68A8B1F000CF;
	Thu, 26 Nov 2026 12:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795697144;
	bh=jNPW/Pg0JpLswGfcRTLclR+xYs8LeJ8SC8w+XDaMugA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=fAyAtLympCZdZ2gtQL8PIilffuKrGOtDuMAkL2TmymSzNoEvuPTARkn0H0noZQJHQ
	 u2ApStLtKoMdWM+fcKuRs1VdDntj7gIqry6hMRnoJB1KwU/E4L5bOeZTQcXrXGY4II
	 K0uZWvAGrxqrHqFEE1/vloLExjAa6GUtzKzSKSmbRs61oWeAGeSOU1Qj6T3HPbgkbl
	 GkF/AXw+j/ck2nGr6sjNGTFzGl3NVaqtz9/BYGx8t//DDLwFt4alvnWq0F4yjIWZRQ
	 qgHYu43hJgL7n+TZozM03UFICrreqdxuMUxA5+2e47IvKKobJ/Oay/2VOc6yFgC5ch
	 mchaMNxTBoqOA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7EC014D50A;
	Thu, 26 Nov 2026 12:45:33 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 15:45:31 +0300
Subject: [PATCH net-next v3 1/3] dt-bindings: net: Add Cortina CS7542
 network engine
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
Message-Id: <20261126-b4-cs7542-ethernet-v3-1-5db5d372e1bd@gmail.com>
References: <20261126-b4-cs7542-ethernet-v3-0-5db5d372e1bd@gmail.com>
In-Reply-To: <20261126-b4-cs7542-ethernet-v3-0-5db5d372e1bd@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795697132; l=5895;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=gW8wVv5EV4Zs86pnqMUV410Pvkh5hZkkf0TYPGZzyKQ=;
 b=k3XvSJ7GuhEEjrXXkxR+U0jWmnfJV1toVfJrUM4LtgrMKLnYbaoRI8THvHXBVDwQWneharEB8
 1+25JD8YHCbA5fcsuO8K663bUjMAjtNoS8R5yHQF1wB9may7BUOlWVJ
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com
Content-Transfer-Encoding: 7bit

From: Fil Dunsky <filipp.dunsky@gmail.com>

Describe the CS7542 network engine register windows, interrupts, GMACs
and reserved queue-manager memory. Require exclusive ownership of the
seven NI/FE/TM/SCH/QM/DMA/NI-XRAM reset controls from the global provider.
The shared DMA line includes both LSO and SSP. Use rgmii-id for the
example switch peer which inserts RX and TX clock delays.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 .../bindings/net/cortina,cs7542-ethernet.yaml      | 162 +++++++++++++++++++++
 1 file changed, 162 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/cortina,cs7542-ethernet.yaml b/Documentation/devicetree/bindings/net/cortina,cs7542-ethernet.yaml
new file mode 100644
index 000000000..c5ba9b30e
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/cortina,cs7542-ethernet.yaml
@@ -0,0 +1,162 @@
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
+  The three GMAC station addresses share their first five bytes in NI
+  registers; only the last byte is independent for each port.
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
+    items:
+      - description: Network interface reset.
+      - description: Forwarding engine reset.
+      - description: Traffic manager reset.
+      - description: Scheduler reset.
+      - description: Queue manager reset.
+      - description: Shared DMA-LSO/SSP reset, exclusively owned by this consumer.
+      - description: Network interface XRAM reset.
+
+  reset-names:
+    items:
+      - const: ni
+      - const: fe
+      - const: tm
+      - const: sch
+      - const: qm
+      - const: dma
+      - const: xram
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
+    #include <dt-bindings/reset/cortina,cs7542-reset.h>
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
+        resets = <&global CS7542_RESET_NI>,
+                 <&global CS7542_RESET_FE>,
+                 <&global CS7542_RESET_TM>,
+                 <&global CS7542_RESET_SCH>,
+                 <&global CS7542_RESET_QM>,
+                 <&global CS7542_RESET_DMA>,
+                 <&global CS7542_RESET_NI_XRAM>;
+        reset-names = "ni", "fe", "tm", "sch", "qm", "dma", "xram";
+        memory-region = <&qm_reserved>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-port@1 {
+            reg = <1>;
+            /* Fixed MAC-to-switch link; peer inserts RX/TX clock delays. */
+            phy-mode = "rgmii-id";
+            fixed-link {
+                speed = <1000>;
+                full-duplex;
+            };
+        };
+    };

-- 
2.53.0


