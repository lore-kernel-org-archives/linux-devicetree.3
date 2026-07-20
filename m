Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1EF42586C;
	Mon, 20 Jul 2026 13:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784555659; cv=none; b=R3yRmCklNaJxe1bPd+qVXoiUhfOhTB3SKsMOdOSk4KB2GhFPk28gZMjdXGVXmLsoyWHUYYd4O2ZzOPJcm787BQc34VyTP0yYbsy5gnCCeyoYrqHAjM5yE8IuTWMlRc8PPP+tOb5mWLPHxjWp6knnBlqECNl56wrAZ8rR8ybeJwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784555659; c=relaxed/simple;
	bh=ib28vJDYiKmHcDyK/UpURzcfp8BRW36RPjln12pow78=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T/Q6xVoDRzP75UEe/XUbfB+OsxmCNhffAFHv/xzPsASbaKEJujS2Nkl8D5qBqwEd3sAlSOq0rsRlX4wSB77TMF++BPWLak4Cypi58HFqvyPtoHX3zHpJuw7R0kcnFdR+6SdcyZUiI0MCTqT9h7e50R+zjGQAmyiogRjGA6FU7mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=J/Em3Klb; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="J/Em3Klb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784555656;
	bh=ib28vJDYiKmHcDyK/UpURzcfp8BRW36RPjln12pow78=;
	h=From:To:Cc:Subject:Date:From;
	b=J/Em3Klb1iVFK4yuQPbJePEhaSge583cobLXXAxfGmeoq4x26911sIgTnVLecHUy8
	 6y2Iu1cMOsp3qyanETBz3oyBw0+DH9YUpmCycAidxJnyxzJ+DKAM/XW0ozaWnf+2mI
	 ZxgFJfpjIYZqPCpwNkHis8/I/kJylvE0ljCbg/ZmeC8JNFIsbFAWdUpi7bev2YwoCy
	 BU3yCpBqJsHelJtEFGaGhf/GEGKIo0ggnGvRsoBxHlOOh0sphuMIAvRYsClig6P2W4
	 nR3Tdj87qLYPfyyhuNkdTNRh4CG7oQ4w1fli9KLE0Fzx8L2noxbOpAW4yIaI1bwNam
	 cvOn2wEJzhCaQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9A82417E0910;
	Mon, 20 Jul 2026 15:54:15 +0200 (CEST)
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
Subject: [PATCH v2 0/2] PHY: Add MediaTek PCI-Express Gen4 S-PHY Driver
Date: Mon, 20 Jul 2026 15:53:42 +0200
Message-ID: <20260720135344.84183-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v2:
 - Added items/description to reg in binding
 - Added missing pm_runtime.h inclusion
 - Moved pm_runtime_enable call to before registering PHY
 - Fixed pmos/nmos variable size for 5 bits calibration values
 - Fixed calibration for single-lane PCIe, as in, the ln1 rswn
   calibration nvmem value is ignored in code if it's single
   lane and will not return an error; this is due to the fact
   that, effectively, single-lane may have a zero calibration
   in tx-ln1-rswn which is fine, as that'd be anyway unused
 - Changed calibration data errors to dev_err_probe and changed
   the "no calibration for ..." message to dev_info instead

This adds a driver for the PCI-Express Gen4 "S-PHY" found in the
Genio MT8894, Kompanio MT8196, Dimensity MT6991 SoCs (which are
all variants of the same chip).

This was successfully tested on MT8894 and MT8196.

AngeloGioacchino Del Regno (2):
  dt-bindings: phy: Document MT8196 MediaTek PCI-Express Gen4 S-PHY
  phy: mediatek: Add support for PCI-Express Gen4 S-PHY

 .../phy/mediatek,mt8196-pcie-sphy.yaml        |  93 +++
 drivers/phy/mediatek/Kconfig                  |   9 +
 drivers/phy/mediatek/Makefile                 |   1 +
 drivers/phy/mediatek/phy-mtk-pcie-sphy.c      | 561 ++++++++++++++++++
 4 files changed, 664 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mt8196-pcie-sphy.yaml
 create mode 100644 drivers/phy/mediatek/phy-mtk-pcie-sphy.c

-- 
2.55.0

