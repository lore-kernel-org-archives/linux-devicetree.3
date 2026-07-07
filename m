Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8954F3F2117;
	Tue,  7 Jul 2026 15:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783438973; cv=none; b=J87wuZJmKPCcSskpzWv3SbZ34paNVhDWP3ZOupTHhDaadxbVsmEygPwDLsLZjBuUD+yFmcyre2qroo1C5tTKYYCDozhUCTVQoP7U7TxFrJR07ESxldVfXOY19Vyq+e1qIBtOVFpQDpy7dVB1sfSPHF1xYVPu+KPwl/2VxYl6rfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783438973; c=relaxed/simple;
	bh=k6XT5BUrmi2vRyrWLuPBG3qTAMzWO1VAIKtW7zlEmrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kwf4BfwjgT4qWHtSdtU743GyQFGEUnH4mCdajijUkHkIxjnnsa3V8gDUOteLegSwrdT67AZMZ9yzAZSYVd4csUieW+nQKazHpHO76Xp3u8rLqUcNZAPVuEB47LQQkXdhH3UmFK/gak4RPtEG2shfJ3wP8iZENrFsr1AQ8sNYF8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=EHHy5OTt; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="EHHy5OTt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783438970;
	bh=k6XT5BUrmi2vRyrWLuPBG3qTAMzWO1VAIKtW7zlEmrI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EHHy5OTtHNelaqxSIaQVp6dfjeVEvxQQb7yU/7NFwAsQ3ECwbxb5p/pva35JmVxuP
	 zIN6ZhTQW6JI7zBDzcTJrDwdf5zUZ/KiMvSFAHZevgEpPKbG3wgiKa5s86XE1FO7mD
	 4qYMiTCSTqQARcdm1VvbzK4CYsmF5H7fSSzkieX2L6r48E0wh6HPcjvZgKC38hHye+
	 aDtU8EIPtcMAxe8G04H9V3kZn9oTxrsGh3ybx8BdeDjMmPHyRAM4H4+gYNQKemzwpT
	 8G90JvkTwGH3QKC3OUcY/LjQHCjPKYu7iJRcoy0J3hqd+rajTlg0lPfbbUJwmiKlvD
	 u8niHYRIZR0TA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 52B1C17E0CDE;
	Tue, 07 Jul 2026 17:42:49 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunfeng.yun@mediatek.com
Cc: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	justin.yeh@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH v3 01/12] dt-bindings: phy: Document MT8195 and MT8196 DisplayPort PHYs
Date: Tue,  7 Jul 2026 17:42:34 +0200
Message-ID: <20260707154245.198361-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707154245.198361-1-angelogioacchino.delregno@collabora.com>
References: <20260707154245.198361-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds bindings for the DisplayPort and Embedded DisplayPort
PHYs found in the MediaTek MT8195 SoC (and variants of) and for
the Embedded DisplayPort found in the MT8196 SoC (and variants).

This PHY supports varying impedance calibrations for the various
signals to reach an optimal EYE signal pattern for any specific
board(s), especially useful for very high bitrates such as HBR3
and higher, depending on board design.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/phy/mediatek,mt8195-dp-phy.yaml  | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mt8195-dp-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/mediatek,mt8195-dp-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,mt8195-dp-phy.yaml
new file mode 100644
index 000000000000..1c2dc4f03cd6
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/mediatek,mt8195-dp-phy.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/mediatek,mt8195-dp-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek SoC DisplayPort Transmitter PHY
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8195-dp-phy
+      - mediatek,mt8196-edp-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  nvmem-cells:
+    description: PHY calibrations from eFuse for optimal EYE signal pattern
+    items:
+      - description: PHY-Global Reference Bias trim
+      - description: PHY-Global AUX Transmitter clock impedance adjustment
+      - description: Lane 0 Transmitter impedance selection (P-MOSFET)
+      - description: Lane 0 Transmitter impedance selection (N-MOSFET)
+      - description: Lane 1 Transmitter impedance selection (P-MOSFET)
+      - description: Lane 1 Transmitter impedance selection (N-MOSFET)
+      - description: Lane 2 Transmitter impedance selection (P-MOSFET)
+      - description: Lane 2 Transmitter impedance selection (N-MOSFET)
+      - description: Lane 3 Transmitter impedance selection (P-MOSFET)
+      - description: Lane 3 Transmitter impedance selection (N-MOSFET)
+
+  nvmem-cell-names:
+    items:
+      - const: rbias-trim
+      - const: impedance-txclk
+      - const: impedance-lane0p
+      - const: impedance-lane0n
+      - const: impedance-lane1p
+      - const: impedance-lane1n
+      - const: impedance-lane2p
+      - const: impedance-lane2n
+      - const: impedance-lane3p
+      - const: impedance-lane3n
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@1c500000 {
+        compatible = "mediatek,mt8195-dp-phy";
+        reg = <0x1c500000 0x2000>;
+        #phy-cells = <0>;
+        nvmem-cells = <&edp_glb_bias_trim>, <&edp_clktx_impsel>,
+                      <&edp_imp_ln0_pmos>, <&edp_imp_ln0_nmos>,
+                      <&edp_imp_ln1_pmos>, <&edp_imp_ln1_nmos>,
+                      <&edp_imp_ln2_pmos>, <&edp_imp_ln2_nmos>,
+                      <&edp_imp_ln3_pmos>, <&edp_imp_ln3_nmos>;
+        nvmem-cell-names = "rbias-trim", "impedance-txclk",
+                           "impedance-lane0p", "impedance-lane0n",
+                           "impedance-lane1p", "impedance-lane1n",
+                           "impedance-lane2p", "impedance-lane2n",
+                           "impedance-lane3p", "impedance-lane3n";
+    };
-- 
2.54.0

