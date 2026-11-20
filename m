Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795195483;
	b=chuy2FG0TAQ+Rq2zuP4z2FO+K2doUU5OOgpFCvY8imGAzbD4W+rmJltT9+nliL8bNRWJ
	 mZ/+wOxAQbxRzJUV8Fx6en8oD5JxKZPSFZ3AdZUMKolvTgKpCMrgzG0njhdV6QrqhtZZM
	 jSsE/scHn2J8ANeDPrq2uuMZMATt4p6sMfHdFolOkwJGWsn8fCZiPN+DIaDqEJubRXl/A
	 SKXlqiLQ3cny4+QsHKG3WPHWuX9K0svo2tHE78KCa7/w88AUsgQUN4hOZdJwClWRotAaT
	 Pzx36YwnL0FGMmSCnO4bcbldij34yLbrdOqaNE5e5NwRShR0sGVeISZvmlNGme1HW3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195483;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=7PGWvy46LTnU0expiNZafmv9HXl2dz3Bu7LWfRKGOEc=;
	b=DFoEp8zz9h0PmVuOZAM5kSyNHc80/840jfBasBgZLQQoFgzhCXHvnQVHLX+22K+0sAjP
	 zN62pZ3h3h8yvpy4uMnu93FQQ+Nehsz0JME+79CxvJh4ZwIxvUhvy4zYBHKzu3W9rLMOs
	 g0rCvO1kFtKJesSMLCX/N8loyUen+F2+F0R1Bus2v96Il7m/AKABvcoX54YkvP80TDLBF
	 YasuCeR2oM0yjTdQThJrxhctvY91URc4suJXvkS3ol8+p2MxAP9a9aIjB/HObmlPa2W7k
	 16Rmqt8mtlUqAh2FU1KSsQXWlgOy6FvhSz64i/2tO8bB805uViZYqCaLBE2VEncrjcA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OTmKAU1B;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959F960A2604;
	Fri, 20 Nov 2026 17:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OTmKAU1B
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795195482;
	b=CjguaMpTTVulb32Pi98IoJ4xwcbM1ZnQb3lfN3H7T4WEANyqpgkq9k2QdmH2uDtzemWE
	 R0OgO3pGDZWePq8RMHH5VF0n4OxpzN0/f2lVyngbRiKr3Bd3+gi+19XoyDV2l35Ko33Eq
	 r/mZiTqiBL4I/HTfM3CkJLByrU5/LCjB+FlNkd4xHTIILz/EKr79RGbcJmycySfUL2QiV
	 3GJ5aeDOaowakEZwOV/bxz/mIWpTbHeblaeID3KLTnvs0zEEUBs0qO8+OwTHVyeCgY2ej
	 Oz5wlPr7Wgqj0haVNG1tCmzX8hLomtrUA/pj56Rw5akAorbgrqa/UeLkCYlil8oe/MA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795195482;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=7PGWvy46LTnU0expiNZafmv9HXl2dz3Bu7LWfRKGOEc=;
	b=aa9iGSUcFPBaRDdv4q91rV2yiPj7qGo2FCfuV5qvh8o6sX//IIOj4nGDbr+qgaK3OBja
	 KtBGt3l4B1sbi0CDhHAM5MPyMypj2zft5saOTb4Nh1VDclzDm/r/SGC7rIZu3wxOy6gD2
	 jgy0k/hBnUMBa15XlTz5/KFTheDt4RUxCn8Yls59GGVKkiYgf8j00lrqLMbyzgO5Hb3Ta
	 MCYH+didXuGVU7og21FtrT0Ex7aU82kwBlFu6UyuQE/qE3Has/bbzjsVvf0Untu7oXbys
	 WjyTxz2N2R8ZgSs+pOIQvu4MJa7gNfBSjBxu8ohFwCN3Up5ck+hogzYPX/N4w1bddbA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5CD721F000E0;
	Fri, 20 Nov 2026 17:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795195482;
	bh=7PGWvy46LTnU0expiNZafmv9HXl2dz3Bu7LWfRKGOEc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=OTmKAU1BI7wzZ95GTBr27OPyA2XgzdfIYxaB36Te689SJjRn3UvYFy9ljPG+gcADA
	 NYJ5COftaVd6u/UMwkIvAroCmOVJTN3L2R9Ag+09pcUfbccFjSg0aF6m+7GduZPAOa
	 NoXjcNHQJrCkWJnVkYWxT8fDyz+SHcu/RSuyncwgFrwKw4shTnMYBu9NBxKUxPrL0u
	 D99Piu0a28tETXAeIsgT0nFoc9JryLuVM+W/ctJm3aM3ySeU/bsoUrZYUuLd4dCWvJ
	 UPyXC0BpBMu4L746xt7zp01HdImkUd67DGcVH3A48TOxYyMeohF9CFlLzhnLMcBjxE
	 nrAtJPgXwSvFA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DD1234B881;
	Fri, 20 Nov 2026 17:24:31 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Fri, 20 Nov 2026 20:24:14 +0300
Subject: [PATCH v5 1/2] dt-bindings: interrupt-controller: Add Cortina
 Systems CS7542 peripheral interrupt controller
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
Message-Id: <20261120-cs75xx-intc-v5-1-f2be75c5e97c@gmail.com>
References: <20261120-cs75xx-intc-v5-0-f2be75c5e97c@gmail.com>
In-Reply-To: <20261120-cs75xx-intc-v5-0-f2be75c5e97c@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795195470; l=2389;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=m01hcJJ8xuXAEtFmd0R1Lw/ptpQwdip1II1Pbh1M174=;
 b=q2PNWwUm9hZ0MsD9D7uVLNyiL+lq2NeyuR2bPDGQkKTvg0yRHOpuC0JCJxx1qf94e2ewC5tK/
 f01gczcj3+wC8fTs95gBwiX9GVpyPk7T/wmZRVHl5bLRFp8zRJQP1QI
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com
Content-Transfer-Encoding: 7bit

From: Fil Dunsky <filipp.dunsky@gmail.com>

The low speed peripherals of the Cortina Systems CS75xx SoCs share one
GIC interrupt. A small controller in the peripheral register block
reports which of its 15 sources are asserted and allows masking them.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 .../interrupt-controller/cortina,cs7542-intc.yaml  | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/cortina,cs7542-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/cortina,cs7542-intc.yaml
new file mode 100644
index 000000000..2963acaf7
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/cortina,cs7542-intc.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/cortina,cs7542-intc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cortina Systems CS7542 peripheral interrupt controller
+
+maintainers:
+  - Fil Dunsky <filipp.dunsky@gmail.com>
+
+description:
+  The low speed peripherals of the Cortina Systems CS75xx (Goldengate G2)
+  SoCs (two software interrupts, two timers, the AXI bridge, SPI, the five
+  GPIO banks, I2C, MDIO, SSP and the random number generator) share one GIC
+  interrupt. This controller has a status register showing the level of the
+  15 sources and an enable register to mask them. The sources are cleared in
+  the peripherals themselves.
+
+properties:
+  compatible:
+    const: cortina,cs7542-intc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 1
+    description:
+      The number of the source, 0 to 14. All sources are active high level
+      interrupts.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - "#interrupt-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    interrupt-controller@f0070004 {
+        compatible = "cortina,cs7542-intc";
+        reg = <0xf0070004 0x8>;
+        interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+    };

-- 
2.53.0


