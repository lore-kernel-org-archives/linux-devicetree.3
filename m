Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601654D90A8;
	Wed,  1 Jul 2026 12:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908501; cv=none; b=W2a/epKpc53tl4+asEuudQe+lI/MMS3iBL0am13iTbCCMGbXppsniBvbLHECYX7TfMOcQ7Il8hRNQPpmfbXs5YlvkSlBTjiisOZZsDyPXx33VnCF8hcTtxIzyOIsttuXkdHxgF78lxyzi+tyj4nYHybCiF4C47iubh3vWHP+5mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908501; c=relaxed/simple;
	bh=lLMPa9ysKvRX2d4gATrFB2GtA/AijOeRfim9jjyCoEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RYngLOUDqEP3UYjmYiXNQ+RFJ/rfo1HHeBCov6yfqV2kpOYQK5MMPkTfukEAXXHF/yifzdF+BdJIVTUQGnMst0VqBrKzn4AN8M7H6UtibAN3clEFopoFp+EY9wa83cXNXTTkKhLLUlUBm1fhSc+lg7sG+Qxcn+8/Ozu3arh3+4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=S0dvlERM; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="S0dvlERM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908498;
	bh=lLMPa9ysKvRX2d4gATrFB2GtA/AijOeRfim9jjyCoEU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S0dvlERMF3QSovsgYTMRycpFM/Hi2jccGcZCMc6+qvdZMk1gQ1m/0skp3i16kIM85
	 WdPu900gENCqlgOPfmCW70ggExy7Eb0aAZzgqnmSm+M7xNr5b0uRXL3dSZ3B0EAp9q
	 8VbiqWY8EgCxGSWT6fP0T2U21VUz+tCsYjtw/XS+j3wNcB/zQ/XxQlouBaOZ25IId4
	 9EG466XSuDOFjyR0Y03GTwxdOGPcktsgkzoLd1iv98K1J5Bd9fcfRWAiikiiIvC0Ms
	 A7cJSxvlNdIAJ4t6dQot1AqJ+ll821rSRTBdgl+GgoRUHFX54wiy38bBZEfRUNwWo6
	 VStSAeUusnq/g==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 451EC17E0F44;
	Wed,  1 Jul 2026 14:21:37 +0200 (CEST)
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
Subject: [PATCH 26/42] dt-bindings: display: mediatek: Introduce MT8196 Layer Blender
Date: Wed,  1 Jul 2026 14:20:41 +0200
Message-ID: <20260701122057.19648-27-angelogioacchino.delregno@collabora.com>
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
index 000000000000..d907a51c495e
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
+    - const: mediatek,mt8196-disp-blender
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

