Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637624DC551;
	Wed,  1 Jul 2026 12:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908519; cv=none; b=GospAqRX95Kej4eGil1BhTXLqnvLx64lcwKzDT+JThVgW+JKfi16IvlmKEX9uJAP56K1N+6E4CM1Xj3QBep5XhgVlaEd4nL/D5ePpm9Opaqg3g50ZaQNAfsoOQGzzDtCzPI2ZHCDmt6D5aT8x2PGRa+YuaTZt8w29lL+adOhpZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908519; c=relaxed/simple;
	bh=LYnNlffTqEaIo/8joGv6zwqndt8MqlFVMfRv+2/fnUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VwxRl+uEUEaltPISFoBZnmNHB9RTPRC3wWuxPI6pqXDyWciQBX5qKl5SnCSey4mRDLzM1a0VmKC9Ae4kfEMEUzYubOAukeio1zAG9u10LSmMP4/+3geksfZCZPdc6YIpCVsJZxO+c/BqOKWtBfs88gB+jp0CDbMmdffKTjBfdtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WSY8WfVS; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WSY8WfVS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908516;
	bh=LYnNlffTqEaIo/8joGv6zwqndt8MqlFVMfRv+2/fnUY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WSY8WfVSau0awvdveY+JisdZ818dXAED/9hJ0+3olKdpD1FwN2YqcuUZFUq4v7An7
	 wZN1dIJPMYV2ExLwK4UNztEbVAwBl4rTzoka9cBt6EAuulgwFTnaJYiPENcG2AqNOH
	 qdXIy5qr3Hk2u69TtvHsYupgkvAQvnGVJKnZ/jzuOjOYPR8RCdimXcVsCXjTZXTk/y
	 s5bPoHd1WPf44wfXiBMdOjufF4rkYCdlA4O0NooKsTYrVcr9tv4XaoFKkyiqdRE9EQ
	 yHS6oEetn1tKMn5V04oAH1KM8LlkzXKea7CIBRLhcScHN0SoIT2g11HE2WsqZZwhZz
	 eOB9DTECt9TQA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2D95817E35F5;
	Wed,  1 Jul 2026 14:21:55 +0200 (CEST)
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
Subject: [PATCH 40/42] dt-bindings: display: mediatek: Introduce MT8196 Image Resizer
Date: Wed,  1 Jul 2026 14:20:55 +0200
Message-ID: <20260701122057.19648-41-angelogioacchino.delregno@collabora.com>
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

Add documentation for the Image Resizer "RSZ" Scaler block found
in the MT8196 SoC and its variants.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../display/mediatek/mediatek,mt8196-rsz.yaml | 97 +++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-rsz.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-rsz.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-rsz.yaml
new file mode 100644
index 000000000000..cf6b0ed08bfb
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
+    - const: mediatek,mt8196-disp-rsz
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

