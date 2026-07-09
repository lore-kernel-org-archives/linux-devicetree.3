Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5023FAE10;
	Thu,  9 Jul 2026 10:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783593277; cv=none; b=o1F1TubHpiv7z1JUjH3wuljFPeIzpCdj669bYHhnpt4qMB2xCEc00wtIdSa9h/Mui2UZRo7/RpLYvFbZ73i4eImfyWGOZb9CRjwZ5uCsrfgBReqg5rrElOudfZqOkLEpBHimIMzLY4x4G52rYY6y/U7XxTOSzyDmUJQrMe0NygA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783593277; c=relaxed/simple;
	bh=xdblEZglUMoWep3mRmiiUKTRUQm2e7ULSXrWeOuRUQg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P2HUMD5WHr0hL3Zvd6+X4fv7Fm0UFG242/Fe8vvsrdxgixbWPQ0RgdKS+DCTp7qIkEBYCdaNE6kPyAGf6+gIh51RlSzA0lC3g4eLqFPFbK+MWCrkevaPRIknFLUrcRpPuGA/sRomF4WIoJIb8sMgwyIHomk3RzcnNbXWc8jXUzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KoOeG0nM; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KoOeG0nM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783593274;
	bh=xdblEZglUMoWep3mRmiiUKTRUQm2e7ULSXrWeOuRUQg=;
	h=From:To:Cc:Subject:Date:From;
	b=KoOeG0nMNvE832GuNOHetr6OjMna8yA3K5QI5MI5yqZw4ORNtEK6hRoXQZSgSzqsx
	 00BNUGF3xX1zg6MCsW3uUL2TizavcXYI1thnqXikm9WstXsdn/czllpY4gmrNTpeuz
	 IBycn21Sobpb/v4aWJsrNa/0XViWLinFDhaJjwO+/rnnB49p8ankkq7isoV4YkC77L
	 cGI0s1TBWMfFuUhJotQ66RLXeywQxVGTeA+Pu6pPDqHLl7xy+KqahL6m+LMf4Zo+Br
	 eSw9Rcwdp+ZtPX6bPS38Pr4GS7P5cbG1Nr1hulPWAvK8+ViMeavtDogCvy954f0SOz
	 x/mqRzXkxHKSw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C8E8017E0886;
	Thu, 09 Jul 2026 12:34:33 +0200 (CEST)
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
Subject: [PATCH v3 00/11] drm: MediaTek DisplayPort cleanups and MT8196 eDP
Date: Thu,  9 Jul 2026 12:34:20 +0200
Message-ID: <20260709103431.46616-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v3:
 - Fix bad fixup squashing from v2... oops.

Changes in v2:
 - Fixed all audio_pdev unregister issues (wrong pointer and double
   free in case of error)
 - Fixed double free of phy_dev in case of devm_add_action_or_reset()
   error in legacy probe path
 - Fixed legacy phy registers erroneously offset by legacy_regoff
 - Added abstraction of AUX interrupts to legacy transmitter ones
   for hotplug detection
 - Fixed forgotten addition of SDP_DP13_EN_DP_ENC1_P0 in mask
 - Fixed new register mask for interrupt debounce threshold time

This series performs some very much needed cleanups to the MediaTek
DisplayPort driver, including a fix for the audio codec and PHY driver
unregistration, a refactor to finally correctly use the PHY (!) and
introduces support for the Embedded DisplayPort (eDP) IP in MT8196.

Note that this deprecates the nvmem related properties in this driver
because those are NOT related to the DisplayPort IP, but rather to the
DisplayPort PHY, and were therefore transferred there instead (code in
a different series, updating the PHY driver).

On legacy devices, this driver was carefully tested with both NEW and
OLD devicetrees, so both with the new, proper PHY usage, and with the
old platform device registration strategy and eFuse retrieval from DP
instead of PHY driver.

This was also successfully (manually) tested in a kernel that misses
the PHY driver updates on devices using old devicetrees (mt8195/88)
and no regressions were experienced.

AngeloGioacchino Del Regno (11):
  dt-bindings: display: mediatek: dp: Deprecate nvmem efuse data
  dt-bindings: display: mediatek: dp: Add compatible for MT8196 eDP
  drm/mediatek: mtk_dp: Fix hdmi codec and phy driver unregistration
  drm/mediatek: mtk_dp: Clarify SMC eDP/DP video unmute commands
  drm/mediatek: mtk_dp: Rework register offsets for proper PHY usage
  drm/mediatek: mtk_dp: Use PHY API for PHY power sequences
  drm/mediatek: mtk_dp: Add support for PHY from devicetree
  drm/mediatek: mtk_dp: Move max link rate to SoC specific data
  drm/mediatek: mtk_dp: Add support for HotPlug Detection in DP AUX
  drm/mediatek: mtk_dp: Add support for eDP1.5 IPs and MT8196 SoC
  drm/mediatek: mtk_dp: Clarify XTAL freq and Debounce registers

 .../display/mediatek/mediatek,dp.yaml         |   5 +-
 drivers/gpu/drm/mediatek/mtk_dp.c             | 623 +++++++++++++++---
 drivers/gpu/drm/mediatek/mtk_dp_reg.h         | 328 +++++----
 3 files changed, 713 insertions(+), 243 deletions(-)

-- 
2.54.0

