Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7203E5EC0;
	Mon, 13 Jul 2026 10:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783938209; cv=none; b=Uhx5/yNx2ml27Aw3ZpKePtEZ+XWac5mewAydaHHxA74cke8b8GjsguYsHvM8jKdrnUa4o6srh4zCQkx0QTBItT2NkhsX7PLzmBjyhkzi1ytVzk3z37jR7ZV1LnvJWmBe3Tg8b7omWTSa73Ngtdt7dqw3EEIV1twXbDJH3B2xkGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783938209; c=relaxed/simple;
	bh=j5lGbsuNrMuX2/MBNskiphqCbXX2IsyCVQqLudRvkx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZNHXaeV+lqYqz3uYEyzyCZYreRK+ZRRrETlaJaoHQhJ+GwTQ0woC0q/cHHMJG/GzwL6EnSXvVf6SPAUzX4YHqAo7IfhRc5JtCC5ibd0S0rBoDr+EUBqF6RqpUQYaomMqjmNZmxtybJ1BOGCG/KApqTTvOHZ0Vc9ffpWRKV7wQsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QlvaLdaZ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QlvaLdaZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783938206;
	bh=j5lGbsuNrMuX2/MBNskiphqCbXX2IsyCVQqLudRvkx8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QlvaLdaZEBeRW7dwrdcnWrTa9DPXwR5AhBRQcRE+r6kaqY9PKHkBKy5ZVDzERn7UA
	 RgeMOltIU+N086KXrviYIf77ibrv211knZ8wIuyi18C5eux+4DlaED27eqop6KpoB6
	 9+/8Dyma80EYvByIW2Cwnf8eahRWnl8Dg49A5Kyjq05au4elofqcxldjO2lI+P3AyG
	 Yc8MGmotVJ9VWitbfs4OMVfmPUpnvpr7fjCvgGPrc2j0VNaRKtdKqy6Ysa4bkEGnOS
	 FiTZTDsGsT10BJdWoWpu1ZGn52iAzHQMrvmp2TpZmAcV85BQqgX31vwCkBz2u0oLIF
	 EGCQz7IYChvuw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D108517E01AC;
	Mon, 13 Jul 2026 12:23:25 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunfeng.yun@mediatek.com
Cc: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	justin.yeh@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	kernel@collabora.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/2] dt-bindings: phy: mediatek,dsi-phy: Add support for MT8196
Date: Mon, 13 Jul 2026 12:23:21 +0200
Message-ID: <20260713102322.21782-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260713102322.21782-1-angelogioacchino.delregno@collabora.com>
References: <20260713102322.21782-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the MediaTek Kompanio Ultra (MT8196) SoC: this
chip features a DSI PHY that is similar to the one found in the
MT8183 SoC, but is a new (incremental) revision with a different
register layout.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
index c6d0bbdbe0e2..9df1dbe1253b 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
@@ -39,6 +39,7 @@ properties:
       - const: mediatek,mt2701-mipi-tx
       - const: mediatek,mt8173-mipi-tx
       - const: mediatek,mt8183-mipi-tx
+      - const: mediatek,mt8196-mipi-tx
 
   reg:
     maxItems: 1
-- 
2.54.0

