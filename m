Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00995416122;
	Thu,  9 Jul 2026 11:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783596717; cv=none; b=qOG0t77H5LxLwCRlr6l7R1erELdY9dP0n01q/7sS3A0Y3RLvfPTRaBWv4oGzt3P5Kkrp+kWYLHEkZDCLamWAWInrHq+xuEAIzca0Tbp1liWbwL/RAFLRoCEGRLS/X98wg5BDS/9/PaeO+EovchTTJj5+tM3uYHosFCPgB4aGv8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783596717; c=relaxed/simple;
	bh=/6X5aTA1WAp5weAzuuMhHcf+iDvCUATBixi7faNN+KA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=crGs+OOpsawBbhPqx2v0k3mBZXsXeOhkKzHbUcFslwndVCDEWIZt1tq0J/4tNpEmmR8oaf0Wmd4Y2bGyf0RiuYV5JL+gKomFGlioPhC7dXFBYccodNNbCn/utpVe7RyJ7K24uDpNw+We/yt4JEhpOghAVLqiCI64+gIpoHJKnNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=c/ivEYIT; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="c/ivEYIT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783596713;
	bh=/6X5aTA1WAp5weAzuuMhHcf+iDvCUATBixi7faNN+KA=;
	h=From:To:Cc:Subject:Date:From;
	b=c/ivEYITm2ZR03YZNvysCZHn4GoegXdUWV1qGl5x5qa+7Di3uIrKLZXvtI1eCPGmZ
	 K/MH3Gq5B6J8NjM6+IJdnxPlDtau8cKcIOAJbumiCEW0qm5vzDh/NP+c8cN92CCJes
	 CUNTdO0GciGvMdkfkQez02OlPBpVqn4MGEWyOylds6735FY2DD6bNBc1UXLuN+8Hj2
	 vCtmQk2/uhHmt21zj+OM7tr22BMMEDKPF8bjlEN4uZn5ZLjutiNGBGjaxDI1LKLaXl
	 2e92K+InZ7EmKzieQdpRpQd1tqGICo5qFTXp+CDJP/lf+c6VqFkteLfeZRX+dyQRu2
	 Oe1/0FkaZLp6g==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D1E4F17E019E;
	Thu, 09 Jul 2026 13:31:52 +0200 (CEST)
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
Subject: [PATCH v4 00/12] drm: MediaTek DisplayPort cleanups and MT8196 eDP
Date: Thu,  9 Jul 2026 13:31:36 +0200
Message-ID: <20260709113148.49090-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v4:
 - Added sanitization commit to ensure pm_runtime_put() finishes
   execution in module unload path
 - Added some comments in code clarifying that BIAS shall stay
   powered on at atomic_disable() time for eDP1.5 IP
 - Fixed some comments in code to clarify that the transmitter
   hotplug detection register is ignored on SoCs that have the
   AUX one fully functional
 - Fixed one more double-free for legacy phy_dev

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

AngeloGioacchino Del Regno (12):
  dt-bindings: display: mediatek: dp: Deprecate nvmem efuse data
  dt-bindings: display: mediatek: dp: Add compatible for MT8196 eDP
  drm/mediatek: mtk_dp: Call pm_runtime_put_sync() in removal path
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
 drivers/gpu/drm/mediatek/mtk_dp.c             | 630 +++++++++++++++---
 drivers/gpu/drm/mediatek/mtk_dp_reg.h         | 328 +++++----
 3 files changed, 716 insertions(+), 247 deletions(-)

-- 
2.54.0

