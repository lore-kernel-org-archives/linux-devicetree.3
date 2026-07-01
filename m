Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411A848BD21;
	Wed,  1 Jul 2026 12:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908398; cv=none; b=YN1qhjDYc9bMuluD4pxpcRwrhXzvyJMUkbyw2m7XK4ymI2hJeYaEV3EOwNxoiXj1Hi9hkf50gnw2NpADzpenELSSbXweMke9kdF7Sb3rL2rwNLsctTGfYAH5kKuAYpf789s9qxwXAjDmItqOJzH78Rp1CsbPcbhDrPI+AQ1Bxtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908398; c=relaxed/simple;
	bh=1Xktl+tViKcSMcXwqlJWLud9f63zaG5zSnYbWqZ1CJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q+IZRM8E1k91FBJg9KPsd4ERp2vmuh27PKSv5e3hkSn732IFHZKI9xpZkg3/H+AqjdXHEsx/xgFzge2lCpOkFqJVWH5JvieATK+jVO3WDikmUpTAk57E5JkYqhp2MODeqzN2II3VhohCrh7dU+GFc+ron4zxNH92cJTsHH6yZF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dSy+ldQ+; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dSy+ldQ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908393;
	bh=1Xktl+tViKcSMcXwqlJWLud9f63zaG5zSnYbWqZ1CJY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dSy+ldQ+EXnqS5mp18wZ7I7kwDNBDfOKP2wrwZsIiwjFfih8IoDAARrSloZjX13TW
	 wenuw6saMxvap6p3+L5r5PlpD7kbaCxS+zCSb2ty5YZl4ODQBS2X0Ku/w7Q2dfSyTr
	 FCyCsXCHpfqkjMUhZ1+V4uSQTArlMknJ8yri4tL1lpjB0Novnv4GhOD23F2ZNwwPmo
	 NjLb0cWQLgfo19cgK7AgZXbqOE79dhyIRjG1f5ZjoB5Jf4b27rZ7N4tRCOJ42tEiFZ
	 v/u2TPqvlvLFqc49G7LsIjY22IGA7RauFTe3DmqkysnpcZQJw+86lK2IDNHzPVtX+M
	 V8vrL9TokLlyQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9EAA217E0CA2;
	Wed,  1 Jul 2026 14:19:52 +0200 (CEST)
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
Subject: [PATCH 01/10] dt-bindings: display: mediatek: dsc: Add MT8196 compatible
Date: Wed,  1 Jul 2026 14:19:41 +0200
Message-ID: <20260701121950.19454-2-angelogioacchino.delregno@collabora.com>
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

Add compatible for the Display Stream Compression (DSC) IP found
in the display controller of the MT8196 SoC.

This IP is compatible with the one found in MT8195.

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

