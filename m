Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424A83E44EC;
	Mon, 13 Jul 2026 10:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783938208; cv=none; b=RX6eYdMqJOr/hkrOd2cKTp7DBE6G9pzMtAdkGnkoHXFB6wQiHmBk7MaRlC4j2pzTKXlCyA/fa89KMHwBkveDE6rRxo0Cq8NfqeHnC8+yGkAYKdrpAyLpPMzw0d7R94byrLEvCQDIQc6bu2sQfoGOGG97uU2XkA66ygt30j33vuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783938208; c=relaxed/simple;
	bh=pDB4tIY6cikfoUnxZqLxi35idMy2BXFdDsk3DDVWEFA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rv4Dly71oBKmrLhY5i6Pk3Zb18/hPnc4IH96hu++Rx/4dfyH3qEKUqxhYHUmCDTptGF23XW5MEceGOgfYplz2ZK7TJ6YeYruShPxHsVnsmml9HzZQLhxJOyEhFo/2kNKowQHTM9Ydmlna/sr2znqkerriKiyuYuN5hDMyc2JxpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=HwTOMOvF; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HwTOMOvF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783938205;
	bh=pDB4tIY6cikfoUnxZqLxi35idMy2BXFdDsk3DDVWEFA=;
	h=From:To:Cc:Subject:Date:From;
	b=HwTOMOvFU/+iSsbdg5+K9Tx/pjZ3EIONv9GUzjfFCRIBJG4G8RM5JJOPZg/cLg4cg
	 JhRC5Zbzt56Zn73ugcVYcf/E7AA+EOey74+bg05tvotVbs70X3hhvVT2oPQQaNgxGM
	 BCCDeg9Zm7DCPDPHUxo+3qQVfRxEpyNoXtsVE5SfRV6KocBq2PAjrxzTRIHaPLBPR0
	 RVM9BMShK/QWarTpMPV4FgwqKK/4HUzm5HpdL9Br+fApYOWS3XAeXCJzlO55PQgXZr
	 nYVWXVfLEkyduFNPCvmcgo/k691+F3SDKI5L1EzKp79T/KzIOgS3bE7WNyJcvuXu4z
	 rH6nKeJdk1hvQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0755E17E013E;
	Mon, 13 Jul 2026 12:23:24 +0200 (CEST)
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
Subject: [PATCH v2 0/2] PHY: Add support for MT8196 DSI PHY
Date: Mon, 13 Jul 2026 12:23:20 +0200
Message-ID: <20260713102322.21782-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v2:
 - Added a few comments and fix scheduling while atomic issue in clk
   enable ops by waiting with udelay() instead
 - Removed one unnecessary delay after clk/pwr isolation disablement

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

