Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCDF25A2BB;
	Mon, 20 Jul 2026 15:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784561226; cv=none; b=bUeWZHV0AThvvvpIYLdSOu5oofRUf/TY7xjBLBbGAnBoOI1sLDeMObOl78EnkdDHSLBP+XZun1Rj841dX3i6gdOCaeddUEg6AjceN+69TgLdlFXxNhrwSDcZgDNbniRj7v0jffoqqIyuYF6VPbouV+mmA/dRWaZ5FoPW1awiBnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784561226; c=relaxed/simple;
	bh=35hr4J+NFCA7cxufBdyme31SBq+J2RcVLJka4TWE6y4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m9p0At67z5HaGN0nTbkg49O/YvHrujjilhzlEb2TI/AcYaGMimd2uGYitChRs9y7oemCygKnMsfY2/FRNIrt3Nhlycj2W4EUdbTiBSF4m8CGoJxmhaqgi40wbihfqETvnDL77SEAsjbd/uyjPdAVdUi2KbgMatIdXC3YBh2lRyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ofhvFz2t; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ofhvFz2t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784561222;
	bh=35hr4J+NFCA7cxufBdyme31SBq+J2RcVLJka4TWE6y4=;
	h=From:To:Cc:Subject:Date:From;
	b=ofhvFz2t3jNVkEVqw7jhIzJT4Q9+WkzFu1MR4/aqsPr7uqn1siAcQk62xR7mOLy5T
	 wB1qbn2zMaF/0dZIZROnEHXgz18Xqe9ljrAufahL7Lmox3d1PriierAeCYBnb34PY5
	 7fbGXISlGnt50HKCigiYHwEvBcbPEkxuMUqLAg7IA92mkt6/1UxBohiF9eUaPon5Er
	 k6gdolc+LeGMbbJWljdh9xK9b733zwXmUhbikWM4d/c6Jd/V+fO6h+tbQx/xBFcNRd
	 O2OsdZ/hnOfvAhZFKY0mLNFeR8zpf/F6tZrWHQfK8xHpijp0ZmtpHlU0/oAcvDD2rV
	 8Jn3hMg1TrnOg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 42BF717E003B;
	Mon, 20 Jul 2026 17:27:02 +0200 (CEST)
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
Subject: [PATCH v3 0/2] PHY: Add MediaTek PCI-Express Gen4 S-PHY Driver
Date: Mon, 20 Jul 2026 17:26:52 +0200
Message-ID: <20260720152654.92216-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v3:
 - Allowed value 0 in calibration fields (as it's a legal value)
 - Fixed duplicated LN_TX_IMPSEL_{P,N}MOS writes
 - Allowed -ENOENT for nvmem_cell_read_u{8,16}() calls, as the
   calibration data is effectively optional
 - Removed two development stage leftover unused definitions
 - Moved num_lanes check in mtk_pcie_sphy_get_calibration_data()
   to reduce indent in probe function.

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
 drivers/phy/mediatek/phy-mtk-pcie-sphy.c      | 556 ++++++++++++++++++
 4 files changed, 659 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mt8196-pcie-sphy.yaml
 create mode 100644 drivers/phy/mediatek/phy-mtk-pcie-sphy.c

-- 
2.55.0

