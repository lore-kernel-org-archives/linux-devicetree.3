Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F15838E11C;
	Tue, 14 Jul 2026 11:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784029492; cv=none; b=txhP+La/p+DR56MRYxJVE5ez7ssvfEi7cH8HEx3hV3O1va64GubzQ7ZMp2qNQUFy7+Ysh8KDrnJbZ2I2c6s5072e8UjToDn70rkREdyF3KQELxVcmQvjX2JzWY5xcWPSI4rh2fLkDjQ3YOkYFdrrnTHzcrTFCMKUOlD4olvYsZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784029492; c=relaxed/simple;
	bh=njLxOOznKc5yQL0JX7H38LNUKds5ZGY/et86Ey7DB10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TGufYVL402buDC8iVt0xWAZ89BKcyF9A3qs5ZxQarDT46gkRxyQmqCwyMb5/x+eFmvg0PI/Fvp/yC9FrEF9lUKW5Jd7q3Waanq51XFTQGgUFIJ+eNqe2PJNJRTJIM21xyq87TQqkexSISixuu4czm0yJWVuNIkbZgD6AKGXthNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KzZzZuon; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KzZzZuon"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784029486;
	bh=njLxOOznKc5yQL0JX7H38LNUKds5ZGY/et86Ey7DB10=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KzZzZuonqPHRU9Ta+a050YiquhVzTijJnQM/OJyhyQgINt6CTrn3ra5Zp1IEhsGyo
	 ofE7AMFvhS8w8br/45hWmhyRq6grtRlCMiq3UxLHkYv6olQ7noiqt/0u0Gb/tOuEsa
	 7AnrPMFSBRHHEN7jBXwCyOqPexoSkNZiYmHw+46vXsi4Me2r4z1in2ueV6FfSmol4g
	 Ddd4+4xb3Ui9y8z5qcY0TL7SWGziGPAnlQIiQflTZn4C4mWJcumlnFcuUV/GASDCup
	 I6tFYbXnPp/gCgXTb/n61Zzt/u4C/wDCx2kTnnTtHPZpHcEU03nsd+7r5bJa3YbvCt
	 IvWhFz/nGT22Q==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F13A117E0DE9;
	Tue, 14 Jul 2026 13:44:44 +0200 (CEST)
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
	kernel@collabora.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 13/46] dt-bindings: display: mediatek: Allow trigger-sources on relevant HW
Date: Tue, 14 Jul 2026 13:43:41 +0200
Message-ID: <20260714114414.184512-14-angelogioacchino.delregno@collabora.com>
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

Most of the MediaTek Display Controller hardware sub-IPs need a
specific (and reserved to them) MuteX trigger.

Since now MuteX is a trigger source, allow specifying trigger
sources in all of the display IPs that support one.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,aal.yaml     | 3 +++
 .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml   | 3 +++
 .../devicetree/bindings/display/mediatek/mediatek,color.yaml   | 3 +++
 .../devicetree/bindings/display/mediatek/mediatek,dither.yaml  | 3 +++
 .../devicetree/bindings/display/mediatek/mediatek,dp.yaml      | 3 +++
 .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml     | 3 +++
 .../devicetree/bindings/display/mediatek/mediatek,dsc.yaml     | 3 +++
 .../devicetree/bindings/display/mediatek/mediatek,dsi.yaml     | 3 +++
 .../devicetree/bindings/display/mediatek/mediatek,ethdr.yaml   | 3 +++
 .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml   | 3 +++
 .../devicetree/bindings/display/mediatek/mediatek,merge.yaml   | 3 +++
 .../devicetree/bindings/display/mediatek/mediatek,od.yaml      | 3 +++
 .../devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml  | 3 +++
 .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml     | 3 +++
 .../devicetree/bindings/display/mediatek/mediatek,padding.yaml | 3 +++
 .../bindings/display/mediatek/mediatek,postmask.yaml           | 3 +++
 .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml    | 3 +++
 .../devicetree/bindings/display/mediatek/mediatek,split.yaml   | 3 +++
 .../devicetree/bindings/display/mediatek/mediatek,ufoe.yaml    | 3 +++
 .../devicetree/bindings/display/mediatek/mediatek,wdma.yaml    | 3 +++
 20 files changed, 60 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
index 4bbea72b292a..41d60a3d8007 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
@@ -55,6 +55,9 @@ properties:
       the power controller specified by phandle. See
       Documentation/devicetree/bindings/power/power-domain.yaml for details.
 
+  trigger-sources:
+    maxItems: 1
+
   clocks:
     items:
       - description: AAL Clock
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
index 5c5068128d0c..e148aa57b1b9 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
@@ -47,6 +47,9 @@ properties:
       the power controller specified by phandle. See
       Documentation/devicetree/bindings/power/power-domain.yaml for details.
 
+  trigger-sources:
+    maxItems: 1
+
   clocks:
     items:
       - description: CCORR Clock
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
index 5564f4063317..7c0985d0f9ea 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
@@ -57,6 +57,9 @@ properties:
       the power controller specified by phandle. See
       Documentation/devicetree/bindings/power/power-domain.yaml for details.
 
+  trigger-sources:
+    maxItems: 1
+
   clocks:
     items:
       - description: COLOR Clock
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
index 891c95be15b9..85a1746965b9 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
@@ -45,6 +45,9 @@ properties:
       the power controller specified by phandle. See
       Documentation/devicetree/bindings/power/power-domain.yaml for details.
 
+  trigger-sources:
+    maxItems: 1
+
   clocks:
     items:
       - description: DITHER Clock
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
index 8f4bd9fb560b..0bb808874839 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
@@ -39,6 +39,9 @@ properties:
   power-domains:
     maxItems: 1
 
+  trigger-sources:
+    maxItems: 1
+
   interrupts:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index eb4f276e8dc4..f5be6c1e4b0e 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -109,6 +109,9 @@ properties:
     items:
       - const: dpi
 
+  trigger-sources:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
index c8b3e86943e4..4863db6aba6e 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
@@ -43,6 +43,9 @@ properties:
       the power controller specified by phandle. See
       Documentation/devicetree/bindings/power/power-domain.yaml for details.
 
+  trigger-sources:
+    maxItems: 1
+
   mediatek,gce-client-reg:
     description:
       The register of client driver can be configured by gce with 4 arguments
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
index b5cdfe0eaca4..a9793b274070 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
@@ -73,6 +73,9 @@ properties:
     items:
       - const: dphy
 
+  trigger-sources:
+    maxItems: 1
+
   port:
     $ref: /schemas/graph.yaml#/properties/port
     description:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
index 98db47894eeb..89370690ee71 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
@@ -100,6 +100,9 @@ properties:
       - const: gfx_fe1_async
       - const: vdo_be_async
 
+  trigger-sources:
+    maxItems: 1
+
   mediatek,gce-client-reg:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     minItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
index ec1054bb06d4..4d06085e6014 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
@@ -54,6 +54,9 @@ properties:
       the power controller specified by phandle. See
       Documentation/devicetree/bindings/power/power-domain.yaml for details.
 
+  trigger-sources:
+    maxItems: 1
+
   clocks:
     items:
       - description: GAMMA Clock
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
index 3798a25402d3..656df51335b5 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
@@ -47,6 +47,9 @@ properties:
       the power controller specified by phandle. See
       Documentation/devicetree/bindings/power/power-domain.yaml for details.
 
+  trigger-sources:
+    maxItems: 1
+
   clocks:
     minItems: 1
     maxItems: 2
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
index 930c088a722a..c912ae2493c3 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
@@ -60,6 +60,9 @@ properties:
       - port@0
       - port@1
 
+  trigger-sources:
+    maxItems: 1
+
   mediatek,gce-client-reg:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description: describes how to locate the GCE client register
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
index ac0d924a451b..326223b36112 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
@@ -40,6 +40,9 @@ properties:
       the power controller specified by phandle. See
       Documentation/devicetree/bindings/power/power-domain.yaml for details.
 
+  trigger-sources:
+    maxItems: 1
+
   clocks:
     items:
       - description: OVL-2L Clock
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index 4df5c7b410c6..dc200068d617 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -61,6 +61,9 @@ properties:
       the power controller specified by phandle. See
       Documentation/devicetree/bindings/power/power-domain.yaml for details.
 
+  trigger-sources:
+    maxItems: 1
+
   clocks:
     items:
       - description: OVL Clock
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml
index 86787866ced0..9dac0319dd60 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml
@@ -34,6 +34,9 @@ properties:
   power-domains:
     maxItems: 1
 
+  trigger-sources:
+    maxItems: 1
+
   clocks:
     items:
       - description: Padding's clocks
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
index fb6fe4742624..caef5194371f 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
@@ -40,6 +40,9 @@ properties:
       the power controller specified by phandle. See
       Documentation/devicetree/bindings/power/power-domain.yaml for details.
 
+  trigger-sources:
+    maxItems: 1
+
   clocks:
     items:
       - description: POSTMASK Clock
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
index d914c06640df..13deb7c87ee6 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
@@ -60,6 +60,9 @@ properties:
       the power controller specified by phandle. See
       Documentation/devicetree/bindings/power/power-domain.yaml for details.
 
+  trigger-sources:
+    maxItems: 1
+
   clocks:
     items:
       - description: RDMA Clock
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
index 4b6ff546757e..7307a50fa30f 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
@@ -40,6 +40,9 @@ properties:
       Documentation/devicetree/bindings/power/power-domain.yaml for details.
     maxItems: 1
 
+  trigger-sources:
+    maxItems: 1
+
   mediatek,gce-client-reg:
     description:
       The register of display function block to be set by gce. There are 4 arguments,
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
index 036a66ed42e7..31e0863dd815 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
@@ -39,6 +39,9 @@ properties:
       the power controller specified by phandle. See
       Documentation/devicetree/bindings/power/power-domain.yaml for details.
 
+  trigger-sources:
+    maxItems: 1
+
   clocks:
     items:
       - description: UFOe Clock
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
index c3ed867d058d..3e6b346baa11 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
@@ -45,6 +45,9 @@ properties:
       the power controller specified by phandle. See
       Documentation/devicetree/bindings/power/power-domain.yaml for details.
 
+  trigger-sources:
+    maxItems: 1
+
   clocks:
     items:
       - description: WDMA Clock
-- 
2.54.0

