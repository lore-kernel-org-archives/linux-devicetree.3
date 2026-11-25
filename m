Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795603003;
	b=lmBEbixgabDI6K2AaBii4w99tOTe424VBcwNGNRA/E2hW6XFP+rxySTeZ8nquNPs388l
	 ska51YptuS6mCzGvB4+IWuu+CoQE6FnNRry3GKkzsgsM+0pjEEs0/3nUcP0r/ALh/dnCC
	 sjNEsnF49NGvMpmX88zdnWtB4i16z1T0iBLpVDOmMOZg6dlvZAUYvtNGc/uMYo5aC5ppu
	 oPz/aXyMbKvZfY8r2uKCzVaskMSH6ipuoJMqId6F/ozUt58EKlBNHslBNvMYL2bU1puYe
	 0ILDQYAj/Gm/sghIy1CwEdX+0gSj7tAbEzFbujSzPJyUC9LhNxqr3hG861ba8NWlV/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603003;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=sXBw54Kjb3iVGS97C7eFziKZMXKzGDqtvwoKQmzG3bw=;
	b=g7ueVrUosX3ejyRrE3h423B2CFpuh3l1x3g3INrC0hKeQyAZQgU66ZUkrNIQ4CGRSwdn
	 hnvRpzceOF+h5MFozYp/5cYnLhZp40aHuSswh9ND+4F1eWUMI2VDW4n1SI163V6iFMKto
	 uJpOskHM4WlwS158hD5IqO/SWOrkhOqV11+nyURGUxBeRCu9RjAz49DFHPuLhbkXUV3xO
	 QG/Vh1ThySwU1oY+nAWtOOkYnkMT86zkwF288L+pHuBfm49181qoSln7beEoSi2O6DlY6
	 FTJ9hNQxiUbBS6bTQHs/u0rCOULlqxFi+zB4ulHadnTayIT3A3nWmLOfQF0Hx3tsZxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="e/ezU+wP";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0D2606A323;
	Wed, 25 Nov 2026 10:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e/ezU+wP
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795603003;
	b=PwR7kyLg6gYwGG6FWyRRmQsaDizQZh12qaozusrmwOlyDqnnb8Pdd3ABg6NxJyLqU+vg
	 SHtpnxeGC/nUf2uE9iB+20RNNL0soViArPy1TnPQv4Cbux9hbW88p4CQ+oD5qNRk0YBYz
	 1aQqjOQbdQPMq8+BGrwztkv0t6mfC8UaXq9KRePHzrB2NaH7w+M9VhojQzzcJxZB7trpx
	 GafrCxRfHel+UTnOEsw7hCAdNU4Y5VfxvxliURSbTBNi8750HyvBXw23ouDLfLD7AlAbo
	 SJiTlS+mpPbkym/5U+/H7IKYggSyobPllGXsnWNQ446pALKWUwIqJrP+zle5GOIpaWA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795603003;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=sXBw54Kjb3iVGS97C7eFziKZMXKzGDqtvwoKQmzG3bw=;
	b=BiFv+dVfC71HyecFYA2Gl5SZYmY0PyzssAIwjBo5xHJSElFfIhpiHNSsyLdzMQOAnbia
	 K/lwbItNbgRpZQGyEWbpg9hSteb6shtQ1jUgshbUgA3NY72+L+sAJtSumwP7TpUOWGEiu
	 EzBy5Mc/FVEeGHVRBTXhHr+KSXsL65IHY1zh+aCRpnPklhoLoYqzj7NAV7VymJQkawA1y
	 U0z6kzox2sE47VteOugjupRfAolRdOSoyYq5qplHnb8IDnOblLh8Ko0GH8sDkzruUoKLL
	 Qpmv6Yb+q1lQJP+x4LWGSA9KhCP4u1RKqQ/QjFkzbDcmLgUpJDa9I3fbddu8ko2MqeQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C583C1F000D4;
	Wed, 25 Nov 2026 10:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795603003;
	bh=sXBw54Kjb3iVGS97C7eFziKZMXKzGDqtvwoKQmzG3bw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=e/ezU+wPKOGI5Pt/sECRER3CsHSCoiyDcOqFm3ElIz9QsMh+hokE4u/jbV1B69qdM
	 scysqLFOcHvpzFGa+YKcDm29RU7VswTD3SyJpyG2eT8V3CaOhE2n6fav8uN9CBKSOH
	 UDAwtd6r0XZW09/Ok3NNuaIW1n2v019Z+ooeTa0yArdJEY/xNYscjU8iMCBjSn/c8s
	 Sg6blLOnsnHZ5ZEP/nG/8oobd/axNw651BlKtdk5WMUGq5xFEXwQmUgLMqQ2FR2Pz0
	 +sqmlpVDi9BddjkjKSpOXlNpDSqgoNwFU+wnJ+xJt/Cfr5T+vmhDkTyQph90zYSkcJ
	 B3hsOyHZdVmBQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 470184CE60;
	Wed, 25 Nov 2026 10:36:32 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Wed, 25 Nov 2026 13:36:31 +0300
Subject: [PATCH net-next v2 1/3] dt-bindings: net: Add Cortina CS7542
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
Message-Id: <20261125-b4-cs7542-ethernet-v2-1-d0ea3c6eb375@gmail.com>
References: <20261125-b4-cs7542-ethernet-v2-0-d0ea3c6eb375@gmail.com>
In-Reply-To: <20261125-b4-cs7542-ethernet-v2-0-d0ea3c6eb375@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795602990; l=5759;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=CMO5Zti0H74MnpSU4XCBQK25yIyMobW0c/Gsz3HxZ2Q=;
 b=L431VWvuVaGA09v6V5MVQibpqE2H9HA8Ned+8mLNZIEx9KkFiHqIfhjxOkQ8EHxkGKaiq6xvU
 4vfYElPLvYFBtCQ0eqP7lp0ySr0byaZ1bxG8jGTwgQH5L/uqiEt+hWe
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
 .../bindings/net/cortina,cs7542-ethernet.yaml      | 160 +++++++++++++++++++++
 1 file changed, 160 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/cortina,cs7542-ethernet.yaml b/Documentation/devicetree/bindings/net/cortina,cs7542-ethernet.yaml
new file mode 100644
index 000000000..79e7d268c
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/cortina,cs7542-ethernet.yaml
@@ -0,0 +1,160 @@
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


