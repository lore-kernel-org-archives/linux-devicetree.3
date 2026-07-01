Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1453B481672;
	Wed,  1 Jul 2026 12:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908388; cv=none; b=PrfW+Ni+Ozmo01DSEWJHAp2y7B33pHWQJuJOf36dbfqion0Mlrxe2y+lcbgp5yg9tyQ4ZVbhccAS7FM0oDuzjPFAuLDtJb8yTZUUoOQBp738/Vzs9/A+OVmnsMbDIatQThuOzTffY4LzVNeXIc80CoTe1NVQ9IcOpAQkZ5SbWpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908388; c=relaxed/simple;
	bh=WHNLQXstaSvjQdtLEGq0x2xw4W1yDu+40Hx7BUf5Ka0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ncc7+CiDvj/p9ma1MyT2wJhjVwEyKijEtQZ6ZGCK2I606VGk02vrQOuYPbpgd3614lcwM8meK3SaUEcB72jSQG9EUU+uZsQSV1bQUKCgPKVrIkh9L0E3VgISgqjbhgHCAtXxISStOqyKrbfLiF+bhazoI2cSxCA/C6aWTIcDJ6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=a5Nb6P7H; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="a5Nb6P7H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908385;
	bh=WHNLQXstaSvjQdtLEGq0x2xw4W1yDu+40Hx7BUf5Ka0=;
	h=From:To:Cc:Subject:Date:From;
	b=a5Nb6P7HAMAR8J+o5SeNHedbaW/J1cflADtkC3n7wABnLDuZpvWJhV7h5lRvZFXfH
	 RGISveZDwvbLMJS7W/BMQCqKxFFgYiLxvYGpujZp/jRcpg44a/k9xxYho+kHBhYzPP
	 8Wab1UoVZRKZ5Iz0uI1896OFIgv6yyHrJH4JXHp9dG2pAqOHFEe8UYg6MY3lzmYISj
	 N2mzEHmYjiSucS9CcEg1U7lIWsIPpRlg2wFrWbht1RoXYVBxOPv86zXF+40odX8js1
	 2T/nW65OucG5yIvRC1FZcvs09DUrxKdp7mxf37HjHuNEgcZxfViw2x7alXC0ehJQPl
	 GtA6D3P5nvjVQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C840E17E0909;
	Wed,  1 Jul 2026 14:19:44 +0200 (CEST)
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
	kernel@collabora.com
Subject: [PATCH 0/2] PHY: Add support for MT8196 DSI PHY
Date: Wed,  1 Jul 2026 14:19:41 +0200
Message-ID: <20260701121943.19430-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the DSI PHY found in the newer MediaTek
Dimensity 9400 (MT6991), Genio Pro 5100 (MT8894) and Kompanio Ultra
(MT8196) SoCs.

AngeloGioacchino Del Regno (2):
  dt-bindings: phy: mediatek,dsi-phy: Add support for MT8196
  phy: mediatek: Add support for MT8196 MIPI DSI PHY

 .../bindings/phy/mediatek,dsi-phy.yaml        |   1 +
 drivers/phy/mediatek/Makefile                 |   1 +
 .../phy/mediatek/phy-mtk-mipi-dsi-mt8196.c    | 196 ++++++++++++++++++
 drivers/phy/mediatek/phy-mtk-mipi-dsi.c       |   1 +
 drivers/phy/mediatek/phy-mtk-mipi-dsi.h       |   2 +-
 5 files changed, 200 insertions(+), 1 deletion(-)
 create mode 100644 drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8196.c

-- 
2.54.0

