Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C6E42EED6;
	Mon, 13 Jul 2026 14:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783952876; cv=none; b=js0/tO392OKnBXQkhyI7k1QOEqDvxJ5dZ07v4+DVF+bCVH6C9/El2kd8MfF9P1HAtXV/nNtgcY0SDmm+xXKZjVU4MDmaHXrt2yW9P2/mEFpsR8nE9WCu9pFa1PnkmsAklzYw1ZZ46RWYmwJsEXJLJ/R7jyXbH7wbAWQZimcU2Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783952876; c=relaxed/simple;
	bh=CRTgzEIiCGF3Q0P2KDt3LTOIuTWsDk2Q75L0QVm3KT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FYHOvBmMP8gZMc6qMxU9jpHZgr1ghYqZg45GvTG/jMEdHzKabMJq/CWyo8E+EgKx6FWDVCAksBwHG9Ir2YP1vjq9Hz4YzdW8LYpzRK4WYVX2Sl7rt8XId3S1GE9dUreVizzqFMKNTNVExD4IM4RPFM+rMg2gVcbr+LNCrZG333c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=hW69CgJ0; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="hW69CgJ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783952873;
	bh=CRTgzEIiCGF3Q0P2KDt3LTOIuTWsDk2Q75L0QVm3KT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hW69CgJ0E2xqiwgTM0Mz+jn5CE9OICeKQEJopihKmeGK7OZQhFavADhQT6EidGfkB
	 YHVMehqU6qPu0cY8VQupg7NsOeBYQvM2NfZNjflb6ozc65JPgJodlITbIjRynJxGZM
	 8KJVfoHD+ZBjnTmSeIU6nY0hacfMpXXK09wv2Il7o3OlqW+gYuv5pVkrF9/mwoVwg4
	 YcCGaxh3ASiOw24holHD6cJR0j3TZ2E+o9wTcmKv2OChzfz7YmPxDSZ5+igi4r1EPA
	 6Fu+k3SqW0WLAYF+dCCl1hOOaVxHysrLT15Z4Vu+7s5Rtolaqut7LZEbvv48abWCa5
	 ZuNQ+vedBF7pg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D024117E07A2;
	Mon, 13 Jul 2026 16:27:52 +0200 (CEST)
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
Subject: [PATCH v4 01/10] dt-bindings: display: mediatek: dsc: Add MT8196 compatible
Date: Mon, 13 Jul 2026 16:27:37 +0200
Message-ID: <20260713142746.40259-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260713142746.40259-1-angelogioacchino.delregno@collabora.com>
References: <20260713142746.40259-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible for the Display Stream Compression (DSC) IP found
in the display controller of the MT8196 SoC.

This IP is compatible with the one found in MT8195.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dsc.yaml    | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
index a5b88eb97e3b..c8b3e86943e4 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
@@ -23,7 +23,9 @@ properties:
       - enum:
           - mediatek,mt8195-disp-dsc
       - items:
-          - const: mediatek,mt8188-disp-dsc
+          - enum:
+              - mediatek,mt8188-disp-dsc
+              - mediatek,mt8196-disp-dsc
           - const: mediatek,mt8195-disp-dsc
 
   reg:
-- 
2.54.0

