Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0372348C3F8;
	Wed,  1 Jul 2026 12:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908400; cv=none; b=eQn+Etxk+vvSIT3Y0Z2A17WCmLIuPqYK0F7+ej9CqMk0Fm1FTmhMsKWbbzE0mkkqmp/x7m9GMBweHNJmy/1j5guYtELvtX1zX56x2ck/MLYX3Hr72udRtiUMX187RJG3wHky8Wmk4c6k/dj4ovMVsib7HunH5oJ1xAmK9ujCxoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908400; c=relaxed/simple;
	bh=QNH1iHvpfMsQ+pWPD1R8m5fZdLcwcye2yv1zfGln2d8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ddn67JHr6iMLZNL3E221K9vSLtM1iTtEOVLaGJlSUXZ+MCknTSaojjFN4Dl6Rg6wifVRjOlnH301/reigXsSuoBYN0V1FJEzrErfpzN3W6sqAQddhBkNyD8KF/WVH3eF5cthdMXazvaToibNyyHRphDYIYX/kOnAqgh5c9FEETE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=V/ClS8iv; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="V/ClS8iv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908396;
	bh=QNH1iHvpfMsQ+pWPD1R8m5fZdLcwcye2yv1zfGln2d8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V/ClS8ivY1drh/w9FmbWjnaaetdBufT0lQbWm06DnxGLb3C0wXbzFgC6R9iLUjJcD
	 /eqVd7uIQ9EeHfxF0Y01XMmfXYZqLnJSxsBvIMakMz0V5+ZLEbv0vcNcTDv2svtsWt
	 UEtMRLCbKMGVYTUxQ97bnIWztxTAOJnbu3cBW45Ezh48dJVIC78OCCW2YXwYyupLDQ
	 XfPnt7gcMZxzaBzaN3XbaP7ccMRfuZpZauuZzKsIXKALgQcPmAB4w9gA9A6Y0yikYD
	 Fo2tmzllDGc8ITHWXpC/55gVV/OwJBTb8K4EhRxVCyndlldwcseusFoL+CKx6T5ZQc
	 hefF2r8crZ0GQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 94D7617E0CD4;
	Wed,  1 Jul 2026 14:19:55 +0200 (CEST)
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
Subject: [PATCH 03/10] dt-bindings: display: mediatek: dsi: Document MT8189 and MT8196
Date: Wed,  1 Jul 2026 14:19:43 +0200
Message-ID: <20260701121950.19454-4-angelogioacchino.delregno@collabora.com>
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

Add compatible strings for MT8189 and MT8196 SoCs.
These are compatible with the DSI IPs found in the MT8188/95 and
others, but with differences making them not fully compatible.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dsi.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
index 27ffbccc2a08..b5cdfe0eaca4 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
@@ -30,6 +30,8 @@ properties:
           - mediatek,mt8183-dsi
           - mediatek,mt8186-dsi
           - mediatek,mt8188-dsi
+          - mediatek,mt8189-dsi
+          - mediatek,mt8196-dsi
       - items:
           - enum:
               - mediatek,mt6795-dsi
-- 
2.54.0

