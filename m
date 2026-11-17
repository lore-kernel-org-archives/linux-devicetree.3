Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794947365;
	b=PQSzw7kmINiXPeODKFNQ2Nuixgi2bKBc7uWgg4twgulxgNtibokd2X+7OeNT2iQbztPy
	 MiM7A48OWEnNCxV4gtxcxPwRAGpE3yzJGSvgTVpns5DzsJ/MP81X7wqd9l0mA0IDxiLSi
	 A15wUM3OMiBZ8wQ1O7Py8l8wyVafwu6d5sZTIEPJFpPfnuYLGCKzka3fC6yzjQeaE3vGq
	 KmgtSZM9U1UP2n8OSWsNS20AIGI10OND1MIdowV+nP8Cy5Uzq6dgilOsJsZNCD3WnB9Cy
	 jsGSazksMIDxBGv/hKriVhqO7mqhE3kr2RpNQPLlURQ6plBue9WC/TXYP3ZqhOUUjJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794947365;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=7PGWvy46LTnU0expiNZafmv9HXl2dz3Bu7LWfRKGOEc=;
	b=Ovo/frwDN1g5xeUTEIwKeAPZTPH1Sq76I6QoKsJ/fd0m1Wa1fywZlJG7KHnkQydjQMHZ
	 +zcJopTAUnfQDfz8Aq4vbCkdvsIZ+f1jIZeuRJBpmG9dEwqtqdLpBOnyKrVtbJBm0mfSQ
	 31MkJZRBwhjyCrKmSGD16uEAwIn9vO7joFcCQH/IRVu2Erqu2tegcbp+VjyiHHixciB20
	 wFLRxtCUedUdcrfOV9FSljVdZAscjNoPveaw5Qx2g3aEQHj6L+p++UXYdlYsZhaxlxLPr
	 lCoDSYgJlD+UH2K0ZoEcH2SC1oLk2xoqsHm1CZPflf460SBdT5n5bsNPGzly/5oWXRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P7XmZhhX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CB8606A330;
	Tue, 17 Nov 2026 20:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P7XmZhhX
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794947364;
	b=QCtTJahE9g5BsuJ4cX+WIf+jghVeLwp9OIuZmIOZzE+enaeTtRkNlTqliNiQdwes3nIz
	 jeUOyLqDhLMZns+Ug9JHhHkq6QbMpht64n76fPTBlwOvBWH6TqNAth2kjgFRcrQXLrzKm
	 qkXEmb5/nbfWdvdsSRDcrsYk62w3SJfSbKOAK/ArandlcvxmQ2SVdFdy2R6ZiUeE7XX7a
	 j295IhTPmNUfI9Q22y0sIgTp9uTLggH2uSUlJ34CUhyBY4I4pd/pF3oDG872bRQ/d5BWY
	 O4b9+MKMRVtO491z83QMU6QV5Red55Hpsndi/ubUAT0Uvot7MP3zHL+j0id/CADnMig==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794947364;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=7PGWvy46LTnU0expiNZafmv9HXl2dz3Bu7LWfRKGOEc=;
	b=vd9hZMDgfkHl35yhkAXa7gxbVQsSX+GmAlpnN21ubTg+n78tSfWpWmNBuoTwrwdhpDBi
	 rNoI7b0Qa9ukmRSraDrgxnIP0X4tPMfGSH+MMO8qHxUMofRqdld/1IP43BxQnxQf5puki
	 X4tPzPTM5ipO/s9k48LRBV/WaqVj8rQljfi9XmhcSTUY9moeXcVal2s1GFa3xRVmCHQvi
	 /1tFvXK86ueI552WM95l+Xqp1aQdhpkpDRbfgB8T3GAeSRf8fPt5ZvHb2JHU+BnPtv+Hu
	 d5iWLAnZm97/In86woMiU1U4rn6BCNS3076cQ87hB3sWyN6lcuoqxk81854XVU/aAgw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4E4491F000C5;
	Tue, 17 Nov 2026 20:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794947364;
	bh=7PGWvy46LTnU0expiNZafmv9HXl2dz3Bu7LWfRKGOEc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=P7XmZhhXYyeyYR6lnUwwJo8FypOzreG/btRJQfi5EV+FHyymsOTtpeOuX6TLjX70F
	 0EeKw4swMVuv0f+k02o42QPIyKVL1dFIqh5nJuHHtMYhhbWiNXVMjRYFoSnM6gU0fu
	 s3YlBdu+3hRaFQlgOQZ5xFoWwUewBOA/BkwGOY1qNduFFfZGkPjHweJkPCowMvLFaR
	 AFx/atljc7SXvp5i+1jtjxWjG4GEc6sy70PvNxizQRWVzwGp/eGyUNnew7GZ6fuvcD
	 S3xurpJxodGnZ9m9xc6jD66WiQBTIB+yZJiKzi8XvyidEoLTlIH62hz2mPdBo3IZUj
	 pMNVOxSFo50pw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C0E514AAD4;
	Tue, 17 Nov 2026 20:29:23 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Tue, 17 Nov 2026 23:29:23 +0300
Subject: [PATCH v4 1/2] dt-bindings: interrupt-controller: Add Cortina
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
Message-Id: <20261117-cs75xx-intc-v4-1-0a678f35e5f3@gmail.com>
References: <20261117-cs75xx-intc-v4-0-0a678f35e5f3@gmail.com>
In-Reply-To: <20261117-cs75xx-intc-v4-0-0a678f35e5f3@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794947362; l=2389;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=m01hcJJ8xuXAEtFmd0R1Lw/ptpQwdip1II1Pbh1M174=;
 b=a08qu7Da3/pmTatk0TPaP2A+BvY8F15Gznd80NAfJMa45L2Mk6+ka5FIYIOj3kqn7jTlPElov
 gNuO2M2J1bCDD9hrbr2fpkVL3IB5MrOrq17a5YaQhPs0E0cXX6TkrFM
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


