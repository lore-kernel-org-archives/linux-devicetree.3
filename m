Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3ADB48C8A8;
	Wed,  1 Jul 2026 12:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908503; cv=none; b=lSl5gCSPofltOwHNp5MAWGQrb6/YFRk0J8XJYuIYGMi0kbwgx1QAYG0eyqQihrKIb69PB3mYeYdclhLGUndpqX9SFJJip+7Y42a7TfVQ5Ccl6Odqyj1uuLhdYudqs7uvqvpX//X/djg4clKVW0EYsiH8OcxSoU7PUx1hRl0l3a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908503; c=relaxed/simple;
	bh=H3clBmnDsizAuTiR83U1RoMtEhzAcO6FscZjR4Byb+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lMDUxIoDT8CINiOY+uIQj3Gf8PLu8I2k24gC7NlUXtG/i5BOKNWf64qiA6itcygRHZGINjsbXaj6ThELfw0r3aGb+fXr2USSgvEFlkp9IOMIDw8feWW1iMyvm45JJr/DgjwRPQJqzFWNWfzdjioyXpVcXif6JvdgIitxPNuApUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dO9Ok4OR; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dO9Ok4OR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908500;
	bh=H3clBmnDsizAuTiR83U1RoMtEhzAcO6FscZjR4Byb+8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dO9Ok4ORkxb5r6ItAybjV5kMGboC3A58xTg1OzrnKGFZZsM+oAwriUqb+mrPToq5f
	 xW2xlJ0vXERP6rWqX336KNJeXodsKdV8DktTXgIR8KStUddxIFpw11qZLHWoPyv+Oq
	 lFDkLVG/2E9h+ypIii5UM8YZq2L9QZg9U7qkEzMbBQds17EvZtPXAL215+kmLjJSJS
	 7tKVkEzKWtcmwfdlR2BYrDFOJ+KNlPknsOJ1M1Kzmbk1B1mrHwq91VjbfEmmF7YVf4
	 LEAjeGPMMQR0OvW9wje6jZDTsLewjdYCndumr1tBFWmpeBi0pTLj7CuA+9RGBSYAVf
	 vWPLeK72Ro+QQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 76BC717E1553;
	Wed,  1 Jul 2026 14:21:39 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	kernel@collabora.com
Subject: [PATCH 28/42] dt-bindings: display: mediatek: Introduce MT8196 extended DMA Engine
Date: Wed,  1 Jul 2026 14:20:43 +0200
Message-ID: <20260701122057.19648-29-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
References: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for the extended DMA Engine (exDMA) IP found in
the newer generation SoCs like MT8196, MT8894, MT6991, and their
variants.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../mediatek/mediatek,mt8196-exdma.yaml       | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-exdma.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-exdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-exdma.yaml
new file mode 100644
index 000000000000..ca08a74ef7ad
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-exdma.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8196-exdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Display Overlay extended DMA (exDMA) Engine
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The MediaTek Display Overlay extended DMA (exDMA) Engine hardware is used
+  to configure the Display Controller to read the data from DRAM to perform
+  layer overlaying.
+  This hardware also includes color conversion functions to output pixels
+  processed into a consistent color domain.
+
+properties:
+  compatible:
+    - const: mediatek,mt8196-disp-exdma
+
+  reg:
+    maxItems: 1
+
+  "#dma-cells":
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+
+    required:
+      - port@0
+      - port@1
+
+  trigger-sources:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - "#dma-cells"
+  - clocks
+  - clock-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mediatek,mt8196-clock.h>
+    #include <dt-bindings/power/mediatek,mt8196-power.h>
+
+    dma-controller@32850000 {
+        compatible = "mediatek,mt8196-disp-exdma";
+        reg = <0x32850000 0x1000>;
+        #dma-cells = <1>;
+        clocks = <&ovlsys0 CLK_OVL_EXDMA2>;
+        power-domains = <&hpm_hwv MT8196_POWER_DOMAIN_OVL0_DORMANT>;
+        trigger-sources = <&ovl0_mutex 2>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <0>;
+
+                endpoint@0 {
+                    reg = <0>;
+                    remote-endpoint = <&ovl0_resizer0_out>;
+                };
+            };
+
+            port@1 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <1>;
+
+                endpoint@0 {
+                    reg = <0>;
+                    remote-endpoint = <&blender0_1_in>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.54.0

