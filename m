Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A03A42D757;
	Thu, 16 Jul 2026 15:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784214822; cv=none; b=S245qTsmwSmtS+x3GJIY4RBHQ/oTWm6r46AaioQlSP+tAK0zcJBvK+iG0z3T5NZro880P3ybWhwNF/PvgQA4R1qzCYwlk7MWsj7nsfcLz0J2UY9mG50Usf1otyukyTB/su2auSgh6rZcbN6yF1tqSTwQzlBOoQYQ5EH9gilMdm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784214822; c=relaxed/simple;
	bh=WCsEdz3e/tDXo5idZqflDrn9zYtlEy5a7rslTNiT7aQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B5N9wGEkhyNLA3zs7GxbbWi58d0BtFwM9IrZQAsaPmQG75O9Noeijt0wA38EHWfHXZ2nuvpAZ+RuUyVJZVuH7zTfW3SEhLI2HquJ6ElS75Q0fIdC3QDNsP5Yj7hkqAiMhIK810Dyp+L4flD/2l9dG89JtO1Olnb+i3K8IR+3W7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QR/UOqfE; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QR/UOqfE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784214816;
	bh=WCsEdz3e/tDXo5idZqflDrn9zYtlEy5a7rslTNiT7aQ=;
	h=From:To:Cc:Subject:Date:From;
	b=QR/UOqfEaPJqDP1UJPvVWwBnnFFGKG+kkqtMpnj2El9OXIdqrdcT/wVAKtTaVL2pb
	 0ygekyKOqalX8HszyBp9AXNI+gI1M0xOaRK0bMUKK3TW7V1x43FZwcWLfRxHvXjMas
	 b7+UVWK3D8JV/RhNY5pzkceN3tS8mX8e7jEl9U6YBvMuNUedznJwMBHqDpnqUuEh1p
	 PtwK0bDf8O0BDT3tvFS9FalwsyYu5nzde6tBy2+9izb1FDIz1eQF7Uw0/sXNi5cEvo
	 OF3eS2pU4Xd4CCym8YSIgRoVF9cNVY3Ac9dUuBvuu2ZvkXp4soU+XxV6WQoshDGDzL
	 +N+Cb+0tpHN0Q==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1259B17E0E08;
	Thu, 16 Jul 2026 17:13:36 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunfeng.yun@mediatek.com
Cc: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 0/2] PHY: Add MediaTek PCI-Express Gen4 S-PHY Driver
Date: Thu, 16 Jul 2026 17:13:31 +0200
Message-ID: <20260716151333.77254-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds a driver for the PCI-Express Gen4 "S-PHY" found in the
Genio MT8894, Kompanio MT8196, Dimensity MT6991 SoCs (which are
all variants of the same chip).

This was successfully tested on MT8894 and MT8196.

AngeloGioacchino Del Regno (2):
  dt-bindings: phy: Document MT8196 MediaTek PCI-Express Gen4 S-PHY
  phy: mediatek: Add support for PCI-Express Gen4 S-PHY

 .../phy/mediatek,mt8196-pcie-sphy.yaml        |  91 +++
 drivers/phy/mediatek/Kconfig                  |   9 +
 drivers/phy/mediatek/Makefile                 |   1 +
 drivers/phy/mediatek/phy-mtk-pcie-sphy.c      | 560 ++++++++++++++++++
 4 files changed, 661 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mt8196-pcie-sphy.yaml
 create mode 100644 drivers/phy/mediatek/phy-mtk-pcie-sphy.c

-- 
2.54.0

