Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF043413221;
	Thu,  9 Jul 2026 11:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783596718; cv=none; b=m++JIg0ACscGceQp5d5wwOIrT6FhTQRpUa7Mgu+CkrHOUg4coPgbDSGrpKLv0UhSL3jHB0DafGSYSYRA/FD8z0W//gszduTgouRD6C9sDWiVEjpgCCzdHLEQ9F+xCWb938oZQcCrNrCwW838/hKrHWP5hr6lQv7iuTeblCdHit4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783596718; c=relaxed/simple;
	bh=o0Yw5UvJ7mIldIg8Qe+QDn/C3b8GslyK/JoVs7xCZ6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OBwZCBISGBHndlQlJcQMaqiXPsHKXIMCYpazE0NsZwWu11TA0ssaToFKFZt7XwU26uVz5zWCnhQeaVEZCKiz9kWKVF35ubQ3gJKAAU3RhsR9FJ+9bt79bab2QJ8z8UmOAEGg8zwrd4cXnOn8eFPVRwSvidTTZ1zk4+4DtMBlpVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=R8K1V34c; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="R8K1V34c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783596714;
	bh=o0Yw5UvJ7mIldIg8Qe+QDn/C3b8GslyK/JoVs7xCZ6Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R8K1V34chS82KJjppgWFa8BPuYns1vHB8CqeXRcKlmnaNK0/jFr0E8fREIW36yM6P
	 zRm7OBrqaccPk5dWu2kwKq/GnNNE7OztsDyZFU/H8zK05dtDBPf6gPCJ6X9QwqmOtM
	 gMkmCAlAoHRsUkgMPtnwns10smd5MexvfyqawOmnVNo8mFcH4Jf6kT20vXdIKQLAa1
	 hzIi8wpqpqkzAwZN9NXv9+3OeIxr022zztaGua20vp5MPtOiVletXRauZNHKNO233e
	 plW6WIrxb56RZVVIexOMhyWzEC8LrAQOLhCcDvlewUW7J8dOTB8yF+7TmYobZgVnx/
	 9uZ2irJxJgI1A==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E9B7717E0564;
	Thu, 09 Jul 2026 13:31:53 +0200 (CEST)
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
Subject: [PATCH v4 01/12] dt-bindings: display: mediatek: dp: Deprecate nvmem efuse data
Date: Thu,  9 Jul 2026 13:31:37 +0200
Message-ID: <20260709113148.49090-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709113148.49090-1-angelogioacchino.delregno@collabora.com>
References: <20260709113148.49090-1-angelogioacchino.delregno@collabora.com>
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

