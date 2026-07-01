Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3139049250B;
	Wed,  1 Jul 2026 12:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908407; cv=none; b=OyImO8CjbNB8p6l7m17Xi7jSgg2fwHufaog2wLUdrveio8CdLfqgt9o7VfzXbE6334/SHw4EDX9j37IJAusnRyrjCMhAb77YN6gSGWzMtA1sMekXEfLsgcvVGxW3gDXBnIMqv/iW5gHc9NIUZPXJ9RWK12+qHU5i79PfO9nwcoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908407; c=relaxed/simple;
	bh=0gPe20SEhbSKRx8YMF1loMW2r5BMkP9zKr6qfZ5JseA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dmG9xGLW03R/vUN8NwNJAJqNcQJ5en3JmgRTSzi02EW+NN9hJlGBTGZhF2BioFnT+N4eHL5AghS13fRhrSa+WnLptWOG6GtJAtFmYIfKRk1qn/FZwMXZk7K18+L1KaZ3Ch2c1RxQq9nuKu3xFVRHtruMAQvBl288z4diEWW92Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JZ9kR++y; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JZ9kR++y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908403;
	bh=0gPe20SEhbSKRx8YMF1loMW2r5BMkP9zKr6qfZ5JseA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JZ9kR++ycUB2t7OH5iCE0tSPapmmQzeR/2khfPzlVnpVGDOLcl+Pfi2G33hc6pJ1H
	 nJ2KVjmXNuQjfqkt77i+Ne6iaD669x4ngJEP/byQs0z4gQltjNlYGM4yyHRb1TyzvT
	 Le/cDnhJqWXw4wrmbtZxqiuFEE9gYpIRYSoBViBnwkPy4kAt0NyYdkVgq/oLcwgKJE
	 XH/sl4CJF3g798vj3ZeXPrWZi92S05rz6OepVgupCWzoeGnCw9L2tm0oZ4R9yRY9hM
	 Y3wn5+rbEgc6qrxTm9+fmicnVwNKscS3KNxlEGbOmLyadlk0RQ+brB24dvaERkCeub
	 9iE20jWQepTkA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E15CD17E0F44;
	Wed,  1 Jul 2026 14:20:02 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jitao.shi@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com
Subject: [PATCH 09/10] dt-bindings: display: mediatek: wdma: Add compatibles for more SoCs
Date: Wed,  1 Jul 2026 14:19:49 +0200
Message-ID: <20260701121950.19454-10-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701121950.19454-1-angelogioacchino.delregno@collabora.com>
References: <20260701121950.19454-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Multiple MediaTek SoCs have the Write DMA hardware in their Display
Controller: add the missing compatibles for Dimensity 1200 (MT6893)
and for Kompanio 500/520/820/1200 (MT8183/MT8186/MT8192/MT8195).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,wdma.yaml  | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
index 97d052b0fb61..c3ed867d058d 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
@@ -22,11 +22,16 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - mediatek,mt6893-disp-wdma
           - mediatek,mt8173-disp-wdma
       - items:
           - enum:
               - mediatek,mt6795-disp-wdma
               - mediatek,mt8167-disp-wdma
+              - mediatek,mt8183-disp-wdma
+              - mediatek,mt8186-disp-wdma
+              - mediatek,mt8192-disp-wdma
+              - mediatek,mt8195-disp-wdma
           - const: mediatek,mt8173-disp-wdma
 
   reg:
-- 
2.54.0

