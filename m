Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C28D3C061C;
	Tue, 14 Jul 2026 11:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784029513; cv=none; b=JHP9JjsA6PSJhVTDkGIhQof+otR6z5le+/xQYJvboZs7LMZVz3BGl3F2o1BPzOne+SXdJrtRxDr2dviMQlIFiUP+7ZT0/IZTMlEhcngZcIUHUFxxv87K5TWECyUfoZ7xNCSeR+EJJcUD0yvxBETXpL0oi083ZZke1po/hu+z0As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784029513; c=relaxed/simple;
	bh=I7fJQlOlTfXkIng8aBbijbBG0zVVgjgbwIFT77vxeyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aYVyypPJJkHk99BItcGJDVPAvUf7MT0jGze5GdPfAoGM09pVzM7rxTgTiyqDNJBS0xNPs//Ez5NkHAWCkH70joT+Gkt1f20iGzFA/jCl+YF/d9hM4J7DDoVdh6WoGdfLNiiMKVB9UDQQ/C9oiaWzj1Xt/dVj23UosMezTRYAhvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ozOIVltt; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ozOIVltt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784029510;
	bh=I7fJQlOlTfXkIng8aBbijbBG0zVVgjgbwIFT77vxeyQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ozOIVlttp38W+s8YqB15p60UHE692CTt/vPblTu0Q86O2W4MQeJhATo3rEPpBJshP
	 Y6tQAH24iPI+4Z+oaQURshLoXryJluMDIR2T8DLUdWkW1fctMSGGbS3n66JnvpMnnL
	 wBs55AXXAbypXeeLDBRtVMA6IZyk+95NggdyrN0/KM8kYiKGQW2sn3iqFJTr1+AYuu
	 xHXHjMx1kMZAoRxHsXCeRzHQZ4ReQkwhyLEsR/FKxNtYVC/qE5s4wpZUndNNi/Van6
	 U+MvgBKgNVIG2/+Hfpo/9mxlmftGkDMQfobMjtYpkTrbniMItm/wdH0o/CDEtkydZa
	 LOSTuvZe1FyPw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9A94617E0956;
	Tue, 14 Jul 2026 13:45:09 +0200 (CEST)
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
Subject: [PATCH v2 30/46] dt-bindings: display: mediatek: Introduce MT8196 Layer Blender
Date: Tue, 14 Jul 2026 13:43:58 +0200
Message-ID: <20260714114414.184512-31-angelogioacchino.delregno@collabora.com>
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

Add documentation for the Overlay Layer Blender IP found in the
newer generation SoCs like MT8196, MT8894, MT6991, and their
variants.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../mediatek/mediatek,mt8196-blender.yaml     | 97 +++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-blender.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-blender.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-blender.yaml
new file mode 100644
index 000000000000..402eccb5fd70
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-blender.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8196-blender.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Display Overlay Layer Blender
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The MediaTek Display Overlay Layer Blender hardware is responsible
+  for performing the alpha blending operation for overlapping layers
+  from various sources.
+
+properties:
+  compatible:
+    const: mediatek,mt8196-disp-blender
+
+  reg:
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
+    blender@328e0000 {
+        compatible = "mediatek,mt8196-disp-blender";
+        reg = <0x328e0000 0x1000>;
+        clocks = <&ovlsys0 CLK_OVL_BLENDER1>;
+        power-domains = <&hpm_hwv MT8196_POWER_DOMAIN_OVL0_DORMANT>;
+        trigger-sources = <&ovl0_mutex 11>;
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
+                    remote-endpoint = <&exdma0_2_out>;
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
+                    remote-endpoint = <&exdma0_3_in>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.54.0

