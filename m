Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8413C10AD;
	Tue, 14 Jul 2026 11:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784029516; cv=none; b=TohjWN4pYnC1zwlkKXN7z+69P6AdhXFEzk6BwWm/o0FxVc9uvDnzMkxvjQAys5SyW/+96OF/EnGuZNrvOdGf/Zb5GmbB2ldsQcL4x5K5fFgdwicCSQ2EsihOztL5H7wDGEU1evShtAzCyLAKax7FYS3BiXcXScjifHbUpizBFm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784029516; c=relaxed/simple;
	bh=jnjb7bbDatkp6uQNXKXGwV1y5BumXKMOkUY3tqjagkc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aT5s4UiLCqLySSYOU/ba0XZLGZjUe9N5O6WAcs/4ajTz8Qmh4KgWe2g5fZVVWb4JCVytav0kiX5rlfb3vmQ9lBvJo5maBU2sYbpX6s99fU16ofBtHe+lFnir0Xi7PnurvdknMAm103jW7qI78fg5QDBkrt0G9ksZw2IE6kTfQcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Q1Y/xXKL; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Q1Y/xXKL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784029512;
	bh=jnjb7bbDatkp6uQNXKXGwV1y5BumXKMOkUY3tqjagkc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q1Y/xXKLqg/IU6n2kGO5lrH73oThhlyiKWjQv0fhZEQfla63I/OMkKtdRYIwiNMbk
	 0RVHXEzfLmkb96Iav7Bg7bsX8TJZltvYYNNYEsI5LYtwUByWseIWYMKnT/5pjoBV7J
	 QrOmNlyrKOCnhAPCcv6NQ38HeIpCMqRc4BALWscODOaQcPsbXWfk6HRFOgAvA2bU04
	 LD0rH1uKI2UVxMu2AcJjw+f5A22D3MwsFWrxOQ7T5wfktn2rk0+uOVElf5A5Thg2Pi
	 66fnabOlrkdZePBojfu96+QybhHpXcuNB6QlGkMLTK2GdJ5ZUIeh3w0qZH5Vupuej1
	 fk1PFCtPZuUyQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 01DAE17E0F76;
	Tue, 14 Jul 2026 13:45:11 +0200 (CEST)
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
Subject: [PATCH v2 32/46] dt-bindings: display: mediatek: Introduce MT8196 extended DMA Engine
Date: Tue, 14 Jul 2026 13:44:00 +0200
Message-ID: <20260714114414.184512-33-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
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
index 000000000000..d56bcd2f2b2e
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
+    const: mediatek,mt8196-disp-exdma
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

