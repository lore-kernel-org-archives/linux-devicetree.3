Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B33240803B;
	Thu,  9 Jul 2026 10:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783591586; cv=none; b=OVmXyYxTF/EpxE+4dNNoYS5c8lgLg7kXozz7U9gU+53nxM0bmx0PazJ69AWssJ8GrZfWYuGiCgzhma0PGj9e1Mw/jEDR3Coe2J8K9PCmGFXwzyx62Mq3VA4iWiaj2QgjXNgcoc3qsHQTYIMbA/BtjX5sofJ5Hkm0IMVdLNIL4cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783591586; c=relaxed/simple;
	bh=kHVv2nCdsp0f/QR38D6tcCGOazDnOTOs2KSvBo2SWnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BEUqtHsQ2SlVVo9zoIDTIh1tf0Ztd1jgG2sLCHYi6QYfn8eGTbp5sc7BdYYKW4nZh3JllDt/fe/3vQcHuQD1iSjxyhM8TOGg6CBLXQXGj33N9FTrNXOjkHwgBflioZrlMvf8OR9Ryew5XukNYiXTSwJ3gWL4zLaaf9cNYcxnWJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=BZMgz7gS; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BZMgz7gS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783591584;
	bh=kHVv2nCdsp0f/QR38D6tcCGOazDnOTOs2KSvBo2SWnI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BZMgz7gSQL13MyjadStvm3AWiozi59NfL+LA23wPfe0XW8t0cI6BBW19ioiZYjAkh
	 JVo6zdT+Eif1fpW0uzLJGhY6ZUHQhDYxx5LdhOTxaIE5nqg9WTEANY90/7WERYCXL1
	 dnvjN2AwM4N1FnZ3m7AU+iPc3juO8ebwnFw6M9Efxpl1qIjA9fpH0UxchnoTIT5RZL
	 XTjYTQqY8iZfPipraP00x/FWLQViALOzyQIZS09Ooi26Ml7A06OSwaC7q70ecRTHV6
	 fF//IjIhnBvKLBsFOA2f6S0KCwiSPbvfqF9Hm7hXRGAcinIEetyfmxz2bYR4oFpobM
	 ycB4x4KbL1W0w==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1072617E0CDE;
	Thu, 09 Jul 2026 12:06:23 +0200 (CEST)
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
	jitao.shi@mediatek.com,
	granquet@baylibre.com,
	rex-bc.chen@mediatek.com,
	dmitry.osipenko@collabora.com,
	ck.hu@mediatek.com,
	amergnat@baylibre.com,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 02/11] dt-bindings: display: mediatek: dp: Add compatible for MT8196 eDP
Date: Thu,  9 Jul 2026 12:06:08 +0200
Message-ID: <20260709100617.42583-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709100617.42583-1-angelogioacchino.delregno@collabora.com>
References: <20260709100617.42583-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new compatible for the Embedded DisplayPort IP found in the
MT8196 SoC.

This IP is compatible with the previous ones, but not fully.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dp.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
index 980f76667ada..3a752a99949a 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
@@ -25,6 +25,7 @@ properties:
       - mediatek,mt8188-edp-tx
       - mediatek,mt8195-dp-tx
       - mediatek,mt8195-edp-tx
+      - mediatek,mt8196-edp-tx
 
   reg:
     maxItems: 1
-- 
2.54.0

