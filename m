Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBDD3C4B72;
	Tue, 14 Jul 2026 11:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784029533; cv=none; b=G3XLFSXO2ERe0Grs4laBTUpdMHZlONowwq+GZYZBP4DHyJCbBsz0/K/vNj7UkhemXrGU3ththKXxXf0mM9NOaExTBWc/PnCcJE1gBRj9tng5fQGKGCKMekA2v4KXOhPYpj8rA8E1Q/l3Rx+Gj/YzXlDyQ7vG6CZhGMI5LtjUo88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784029533; c=relaxed/simple;
	bh=Bt3Z+R6avnXJe1+Tvcvop1bipZ5CD/TOZ2eDkq2oaBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lf9S9aCKdnggHTWV0ziuclBkG055G8v2T2Qtf75t43z1dUleCrpxqUqgh+5eSmkhhXdJ/xPlxqKX5u4FAQEnaWawNmd0MqkwOhxc9YnneNoRN0f5vZvC8n58/9o/vd0ipQ95Eyfiy1fvxT+Ocgpo4IzZvJ8ycoS9UVcMFIECRII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pTl16uwC; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pTl16uwC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784029528;
	bh=Bt3Z+R6avnXJe1+Tvcvop1bipZ5CD/TOZ2eDkq2oaBs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pTl16uwCfDmdRugGzJI2eaZ5hiwCA9HEyYyQAEbK2MCvNNc8Kss22ZpDdslAB0ifi
	 uNi/r48C6FBuo60JXBZ7dTRGuId/Rmuxcdz7Nj44TvVSI+ALZugeaREM0xX2G//XQb
	 iIVBN115j/A5Z4QbguAeYxewg8zGzkyyd3f+/T398ujQ0HP4RRshUOA2epUPKkeHWH
	 tp7lKYB3upuV3E0eqwFVi6+HMGZTFgQCmdxYM/6bWDMWJklD2ScwgygArt2Jr0zbYn
	 D6zSQ9MTrcrbJyE7NpkLvgJ6Ogms3egM4MDYplWaFwH3ZuFsxjUnX4CgS0q6lZm6dj
	 VOBEMWvLg5Blw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B78F517E0FD0;
	Tue, 14 Jul 2026 13:45:27 +0200 (CEST)
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
Subject: [PATCH v2 44/46] dt-bindings: display: mediatek: Introduce MT8196 Image Resizer
Date: Tue, 14 Jul 2026 13:44:12 +0200
Message-ID: <20260714114414.184512-45-angelogioacchino.delregno@collabora.com>
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

Add documentation for the Image Resizer "RSZ" Scaler block found
in the MT8196 SoC and its variants.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../display/mediatek/mediatek,mt8196-rsz.yaml | 97 +++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-rsz.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-rsz.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-rsz.yaml
new file mode 100644
index 000000000000..a3484671db33
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-rsz.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8196-rsz.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Display Image Resizer (RSZ)
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The MediaTek Display Image Resizer (RSZ) is a high fidelity scaler block,
+  with filters and signal enhancers, responsible for performing downscaling
+  or upscaling of a frame.
+
+properties:
+  compatible:
+    const: mediatek,mt8196-disp-rsz
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
+    scaler@329d0000 {
+        compatible = "mediatek,mt8196-disp-rsz";
+        reg = <0x329d0000 0x1000>;
+        clocks = <&ovlsys0 CLK_OVL_MDP_RSZ0>;
+        power-domains = <&hpm_hwv MT8196_POWER_DOMAIN_OVL0_DORMANT>;
+        trigger-sources = <&ovl0_mutex 26>;
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
+                    remote-endpoint = <&ep_main_out>;
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
+                    remote-endpoint = <&exdma0_2_in>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.54.0

