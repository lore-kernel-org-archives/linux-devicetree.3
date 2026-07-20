Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2937B30C172;
	Mon, 20 Jul 2026 15:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784561226; cv=none; b=Tj4EvhJOtj4FWW5TN4kvvMKzl6hQdYZVOZcPMv4TGEXhjvCSnfISqwMzSYjqOLfHU93Vc1f5hRCdoNU1GOQufloafmg3cu24D6e5Q7Hk7sJih5y79TdwhRVkhNkkeZlgcmzdodOCHhivHeHMhXZKc8GfdbnKsTIkrV56ff2fEsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784561226; c=relaxed/simple;
	bh=uy3S2EsDCUPQWDiWwzrUuwHOIhNHKPZerlwUBZHGjR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SwDobudDZjvUc8SSHPuCUF6AUPRvw6QOQiMXHRf8oIVIrNTGnWMrhI33yIlbKkCqgQzebuECJICB/CzMcOTjXuSciAuG4eLXUOlOrpPCWF4eRnI0SnIUvqcw2vcZwe0pq7DerkMiGUjsRNm5JTb5EZ+QNvXULMP5IMJNsaZ3UPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=M4i2zlsd; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="M4i2zlsd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784561223;
	bh=uy3S2EsDCUPQWDiWwzrUuwHOIhNHKPZerlwUBZHGjR8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M4i2zlsdC56x4F8hCYmWZNqunkS5Gf+VwjAGr2Y2gJG3BG/Uoz9Ajutk3kgO1JY3S
	 p287+xDY1Pnz4MLOOg3HzrE9hSt5HXBeuTL7X5RJfxXTORDEmUl/HtYGCVVzyjlzHz
	 OHlE9QoJngr+TQOgXv2x0oS6oskQXMBaBK3wA2qCyJkiUEJKX/1qATdocnf7KAIVBN
	 Spzu4yIDVdpUkzQHDAowelCxRVsDA3FzyZ8d3NtU1Pwbm1A7HLlGvF3VLxvoM6TVfN
	 lfKucTTxf2NugTWtvbHFH2+l/D1usi0fAysyxJOYA1FyZVrHmt/gC/etK0VBvR1wOE
	 ctFkU5lwS0K8w==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EC66E17E071A;
	Mon, 20 Jul 2026 17:27:02 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunfeng.yun@mediatek.com
Cc: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v3 1/2] dt-bindings: phy: Document MT8196 MediaTek PCI-Express Gen4 S-PHY
Date: Mon, 20 Jul 2026 17:26:53 +0200
Message-ID: <20260720152654.92216-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260720152654.92216-1-angelogioacchino.delregno@collabora.com>
References: <20260720152654.92216-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds bindings for the PCI-Express Gen4 S-PHY found in newer
MediaTek SoCs, such as MT8196 and its variants.

In the current "revision 3", depending on the specific port, this
S-PHY supports up to two lanes of PCI-Express Gen 4 and both EP
and RC modes.
It is not clear whether revisions/versions earlier than 3 have
ever been shipped in any other MediaTek SoC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../phy/mediatek,mt8196-pcie-sphy.yaml        | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mt8196-pcie-sphy.yaml

diff --git a/Documentation/devicetree/bindings/phy/mediatek,mt8196-pcie-sphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,mt8196-pcie-sphy.yaml
new file mode 100644
index 000000000000..3fd1bfbc3822
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/mediatek,mt8196-pcie-sphy.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/mediatek,mt8196-pcie-sphy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek PCI-Express Gen4 S-PHY
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The MediaTek PCI-Express Gen4 S-PHY is capable of data serialization
+  and de-serialization with 8, 10, 128 or 130 bits (16GT/s) encoding
+  and decoding, has analog buffers, elastic buffers and mechanisms for
+  receiver detection.
+  This PHY supports link rates of 2.5, 5.0, 8.0 and 16.0 GT/s per-lane
+  in both Root Complex (RC) and End Point (EP) modes, depending on the
+  chosen port.
+  The Digital PHY (PHYD) part adheres to the Intel PIPE (PHY Interface
+  for the PCIe) specification.
+
+properties:
+  compatible:
+    const: mediatek,mt8196-pcie-sphy
+
+  reg:
+    items:
+      - description: System Interface (SIF) registers
+      - description: Clock Management (CKM) registers
+
+  reg-names:
+    items:
+      - const: sif
+      - const: ckm
+
+  "#phy-cells":
+    const: 0
+
+  nvmem-cells:
+    items:
+      - description: Internal resistor selection of TX Bias Current
+      - description: XTP Bias V2V voltage calibration
+      - description: S-PLL CKTX Impedance Selection (P-MOSFET side)
+      - description: S-PLL CKTX Impedance Selection (N-MOSFET side)
+      - description: S-PLL CKTX Intermediate Transition Impedance
+      - description: RX Front-End Return Loss Continuous Time Linear EQ
+      - description: RX Front-End Return Loss Variable Gain Amplifier
+      - description: RX Front-End Return Loss Decision Feedback EQ
+      - description: RX Impedance Selection
+      - description: TX Impedance Selection (P-MOSFET side)
+      - description: TX Impedance Selection (N-MOSFET side)
+      - description: TX Lane 0 Switch Resistance (RSWn)
+      - description: TX Lane 1 Switch Resistance (RSWn)
+      - description: eFuse calibration table version
+
+  nvmem-cell-names:
+    items:
+      - const: int-r
+      - const: xtp-vtrim
+      - const: cktx-pmos
+      - const: cktx-nmos
+      - const: cktx-r-mid
+      - const: rxfe-lanes-rl-ctle
+      - const: rxfe-lanes-rl-vga
+      - const: rxfe-lanes-rl-dfe
+      - const: rx-lanes-imp
+      - const: tx-lanes-pmos
+      - const: tx-lanes-nmos
+      - const: tx-ln0-rswn
+      - const: tx-ln1-rswn
+      - const: cal-version
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@16900000 {
+        compatible = "mediatek,mt8196-pcie-sphy";
+        reg = <0x16900000 0x10000>, <0x16920000 0x10000>;
+        reg-names = "sif", "ckm";
+        power-domains = <&spm 10>;
+        #phy-cells = <0>;
+    };
-- 
2.55.0

