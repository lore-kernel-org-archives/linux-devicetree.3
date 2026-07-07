Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CD93F39ED;
	Tue,  7 Jul 2026 14:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783433984; cv=none; b=ZGuGD4pqWUHVaK7vgFkKiWpdVi6w6E2Pc3cLROYojGqKKgW50ccSW+7sWt0kSXL7TrlKGrUQc1GL6gFCM/IpTiV1JICQDIm8FqcntbyoO+yKw/uF6WrFfFd8ZxcqfF+YxtRSnLKHNtdYZFt915kwB2pvg+sAGugD3lwRuFhx7ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783433984; c=relaxed/simple;
	bh=X99KKDPKDM77EUe/K6IwQ6N3jw1s5gDXs0w54CvjxZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IbsDEaBvAF9gQ/b9x9pYanIUH6V0RA3OKw9DTe8fhNEH0Bf9i2vGyVAHBmdntN+gbdlkyN1Ooz1bPtMAt63CHw/zgiUXsJGsl645CoCZ+fbjENe31LQFrEEXUtqZGvLVnOlESlLnPNOdeEWZtFBcW5UGcgizoKkVAwNDoR71P1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=IpN4sGTR; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="IpN4sGTR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783433981;
	bh=X99KKDPKDM77EUe/K6IwQ6N3jw1s5gDXs0w54CvjxZ4=;
	h=From:To:Cc:Subject:Date:From;
	b=IpN4sGTRbigL3LEZNRe+mqGHxT8wFbKvRLsqh0ZAz/EyFvhA1cCX/D8gB17qhdB0f
	 l/Iht+L5Y7/EJ81L5B1FTSB6z2CKWtBEBPFa+bZrO9RArYmAmZej7ehEGnRa7dg8kQ
	 ukBwj66jefpWIt30+R9pLxYPW97g1qPKXZqQiDjcS54II2ODPyywBH2fE09XN6oYYJ
	 FejvJSgL5mtEDipmqlie7U3UvCm/t5PgNmGOTdW2HWw2/nuNyAyQueGhI4fYCN4qTd
	 wvoK9IqJYlu4YAh1VSwFc4SFKBon/nWQW3Yd+ZtScB1HXp399HSYfYnpx2otIaTW/+
	 IySYs4MvxWyEA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 270A417E003B;
	Tue, 07 Jul 2026 16:19:41 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunfeng.yun@mediatek.com
Cc: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	justin.yeh@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH v2 00/12] PHY: MediaTek DP PHY refactor and MT8196 eDP
Date: Tue,  7 Jul 2026 16:19:19 +0200
Message-ID: <20260707141931.191172-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v2:
 - Fixed register offsets for ANA phy in MT8196
 - Set/clear FORCE_VOLT_SWING_EN bit when configuring and resetting
   the voltage swing registers
 - Fixed endianness issue in call to nvmem_read_u16 (Sashiko)
 - Added early exit during lanes disablement if none are enabled to
   avoid out-of-bounds bitwise shift (Sashiko)
 - Removed useless call to pm_runtime_get_sync() in probe(), which
   also fixes issues pointed out by Sashiko
 - Fixed wrong dig vs ana register array usage in power_on/off (Sashiko)


This series performs major refactoring on the MediaTek DisplayPort PHY
driver, makes it probe with devicetree instead of getting registered
by the mtk_dp DRM driver, adds power_on/off() callbacks, and honors
the phy configure opts' set_lanes and set_voltages for, respectively,
varying the number of lanes and setting the voltage pre-emphasis and
swing on the PHY, for each lane.

This driver now also properly gets the PHY (EYE) Calibration Data from
NVMEM (eFuse array) if provided, instead of getting it (improperly)
injected by the mtk_dp driver.

Additionally, all of the driving parameters calculations and most of
the other register definitions were refactored to greatly enhance the
human readability of this code.

As a last step, this also transfers the register offsets for both the
digital and analog phy registers in arrays assigned to soc specific
data, in an effort to both introduce support for new minor revisions
of the MediaTek DisplayPort PHY and to have a clearer view of the
register related differences between those (for example, it is easily
understandable that the analog part remained exactly the same between
MT8195 and MT8196, but the digital part gets a slight update).

Speaking of which, as a last step, this also adds support for the
MT8196 SoC (and its derivatives), which uses this PHY only for its
Embedded DisplayPort (eDP) IP (spoiler: the DP one seems to be way
too different and requiring an entirely new PHY driver).

In this state, this driver can also easily support the MT8189 SoC
with a few lines of code: even though I do have clean code to add
support for this one, I was not (*yet*) able to test it on upstream
based kernels, and for this reason I decided to leave that one out
for now (but it's coming later for sure).

NOTE!
Despite all the apparently breaking changes in the refactoring, full
compatibility with older MTK_DP driver and with old devicetrees was
retained and carefully tested on multiple platforms!

P.S.: I am aware of the BUILD_DRIVING_PARAM_0( 0, 2, 4, 7) checkpatch
warning and I didn't fix it in bigger favor of human readability.

AngeloGioacchino Del Regno (12):
  dt-bindings: phy: Document MT8195 and MT8196 DisplayPort PHYs
  phy: phy-mtk-dp: Rename regs to regmap in struct mtk_dp_phy
  phy: phy-mtk-dp: Allow probing with devicetree match
  phy: phy-mtk-dp: Migrate register offsets to SoC specific pdata
  phy: phy-mtk-dp: Implement power_on and power_off PHY callbacks
  phy: phy-mtk-dp: Support set_lanes in configure and properly cleanup
  phy: phy-mtk-dp: Support setting volt swing and preemphasis values
  phy: phy-mtk-dp: Add support for digital and analog calibration
  phy: phy-mtk-dp: Rewrite and document default driving param macros
  phy: phy-mtk-dp: Add bitrate register val definitions to SoC data
  phy: phy-mtk-dp: Add PHYD Lane EN register mask to SoC data
  phy: phy-mtk-dp: Add support for MT8196 eDP PHY

 .../bindings/phy/mediatek,mt8195-dp-phy.yaml  |  77 ++
 drivers/phy/mediatek/phy-mtk-dp.c             | 863 ++++++++++++++++--
 2 files changed, 843 insertions(+), 97 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mt8195-dp-phy.yaml

-- 
2.54.0

