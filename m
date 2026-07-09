Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AC0405C3F;
	Thu,  9 Jul 2026 10:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783593279; cv=none; b=hgt5nn07D/Bn3O/OtmnXKd1De5qR02Gh7Kk67jnC40ZXZdncAaTEIutrX40ZFZO8laZ+/2Pi+TQ+6E9CGQd+yQhnRZpxfqaYbBwt5IkqW/qIgz7YU9wVQ/Ljmud0vURI3UOhFmnW6KTsDGg7F5l6uV02r2ySc+71CBRe4ATQ+fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783593279; c=relaxed/simple;
	bh=kHVv2nCdsp0f/QR38D6tcCGOazDnOTOs2KSvBo2SWnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c5RCA/n8h7xuDZBbN7L38bElJXhoLRrWxPhMiRUPcH7Q8cJzjStdGMeTBM6RiK6VC1lgw/nuMK7YFlDZD3yY9yo/dEvpZRr7nPogssgbIIHPt3vCqeWeK+lHmzToo/Rbzs5gXzlVoS4jv0RfmqPHQNuYYjSBrgGW7JWx89OaOoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NAOsadfR; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NAOsadfR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783593276;
	bh=kHVv2nCdsp0f/QR38D6tcCGOazDnOTOs2KSvBo2SWnI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NAOsadfR5/GhS5a6Blg4iy/kPKN7ErRwXBYIo5WUe3EZeG71lK2RGnJJmVjjZBJ2c
	 i7P2rvaq2581vvojbBUmuM6gHoztnJVuZ31rnEomZAZdN0EnCW5Jk/V6leXU45Xt7P
	 NGuCpQFo8Q5HT3k24XZXa8G8ohADojDZCabd7EgyIqyTI8YBuPynSFjrvu2PliwaeH
	 s+0zm8IWvrNo5q6LSgL494UHJr5E9lmIclcCSQZ64yODy28BySZYIELR34CUPq5rHL
	 vyPjH9reCFExcfIXvbPuxiBEhkQj9LVxRetVFc5K9eLvGq4pcYqd3N6ZFdpbyveJqn
	 4uVyEK6r3yaTw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F419417E0D53;
	Thu, 09 Jul 2026 12:34:35 +0200 (CEST)
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
Subject: [PATCH v3 02/11] dt-bindings: display: mediatek: dp: Add compatible for MT8196 eDP
Date: Thu,  9 Jul 2026 12:34:22 +0200
Message-ID: <20260709103431.46616-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709103431.46616-1-angelogioacchino.delregno@collabora.com>
References: <20260709103431.46616-1-angelogioacchino.delregno@collabora.com>
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

