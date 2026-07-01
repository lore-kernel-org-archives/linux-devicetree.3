Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB88A481229;
	Wed,  1 Jul 2026 12:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908431; cv=none; b=lQK+e2tLeWA5af3vmGLXLRM/2EhILWX1mZYgUhBq02qAYwa+kiPMA0N2kM5bYmS27SGx5V0343AKzj2r400CV8Aw/lwho4S7/3zpVyMM8jbyeCvP7okqFFAjPopZzilaPXi5noQoeQiBlvQzx6pQdF+gIFWmRFMQ1Arqj/ZVmBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908431; c=relaxed/simple;
	bh=o0Yw5UvJ7mIldIg8Qe+QDn/C3b8GslyK/JoVs7xCZ6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HXJjgoASpgQAuuh89pZgyav95tGqRWo6W83Hq3f8a7ZYPi33al92fCD2kW1kGNFggLgpBmM0udlRcyPl2g5BPnTGWnjMd8GGOccDFANIRtIFCnyNPiiRUrbq4xQCHO/A/tlmAJMUp3UKxSPsAhC9f5/nxX9O9Ewg0mKDenOsg9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VxBnyC2H; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VxBnyC2H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908428;
	bh=o0Yw5UvJ7mIldIg8Qe+QDn/C3b8GslyK/JoVs7xCZ6Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VxBnyC2HEyx+nHWBRJscwbqLoyygFubY/jhQ5hqDRVaIp3SDMyN2UR7PIUp6bGC71
	 FfUwkJigzaTHZgJLm7fKRwRAfWQ+pXuCrqZpU+ZsryUbAAmn0ki7U5/P5jt+CvndLd
	 BB+P3M7Lb1q0ixrx4rZv/ur7iwozXSNUbm3BcsqmkJGM/3XGXo50v8yuan+kMdF5RZ
	 pM0pGVr9hY6gZYYJSVT8HeDu1I+VKdCOZkWl3Oz2LJWhMPVzFBLSUa5KQ+Bjgt3csf
	 EMLU/RosiQNj+Ox7+8/fTOeepKyqKGlE5Xe/mFffYJNQ7tIhM6kVPMEQ6aJmC02NTU
	 s2fBg1aGTM8Wg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 75E0917E116D;
	Wed,  1 Jul 2026 14:20:27 +0200 (CEST)
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
Subject: [PATCH 01/11] dt-bindings: display: mediatek: dp: Deprecate nvmem efuse data
Date: Wed,  1 Jul 2026 14:20:14 +0200
Message-ID: <20260701122024.19557-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701122024.19557-1-angelogioacchino.delregno@collabora.com>
References: <20260701122024.19557-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Deprecate nvmem-cells and nvmem-cell-names and clarify their
purpose, as those are for PHY calibration data, not for the DP
IP itself, and that data shall go in the PHY binding instead.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dp.yaml     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
index 8f4bd9fb560b..980f76667ada 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
@@ -30,10 +30,12 @@ properties:
     maxItems: 1
 
   nvmem-cells:
+    deprecated: true
     maxItems: 1
-    description: efuse data for display port calibration
+    description: efuse data for display port phy calibration
 
   nvmem-cell-names:
+    deprecated: true
     const: dp_calibration_data
 
   power-domains:
-- 
2.54.0

