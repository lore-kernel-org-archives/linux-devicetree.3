Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F87B48BD54;
	Wed,  1 Jul 2026 12:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908397; cv=none; b=WqAaTycaWUYf458I5MZWam9BNW8KAmOAfJHJQ5FQvTBrqG5cDrn8o8tUWdsk8EALE/7HjwoST36n4UOYRcNg+RQRag8tzkpG2vmhBYtCThCNZRS+hijRhwVQhPeH/IqHBRy44u4GB2CFSdJRqxolvik7Sla0eh2TSz7EwA0evqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908397; c=relaxed/simple;
	bh=tpdx3d9lVe+qNRkoeJfOrvoQbcLTXbuez+FunS1tz9A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E1aLZnEZcS4XwEkaYUWVcVzwVrE4oOSrddO7jequ+DbHhFWfotnE2M3p3aDbDu14FpbAWPuZwAZHXBjc6REdlsgON5Lq+AGAHmDUiGhTbvKHEHQDzC5FEz6fccGBmi/29Mf/J0P5vr+FmuJwflumPisTlncAq2ScfC4ppxs+gIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=LmECkaI8; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LmECkaI8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908392;
	bh=tpdx3d9lVe+qNRkoeJfOrvoQbcLTXbuez+FunS1tz9A=;
	h=From:To:Cc:Subject:Date:From;
	b=LmECkaI8QO7YDdjP24JLe9N3YTdNVQl9YlgzjKTDXg/Di6Wj59My/CffJdvZaCLAm
	 Sj3bz+xjXDw5ZrKFxqmc+xuvuq/vxiiyOfutITZdkSUs8LHUjNwwiaCoKgGxYx9Fjk
	 Q6g0rGpq+Jpb0hhaqx3+DLwp9UXO8vn4i4HrRBd4lm61VfxgGB3cKov7Om9SEpSONf
	 a395OFB/p+pHQk/sma1bAFcNFyd/wup+s36RMxgws00xkXSh09ujecJ/oq3Q0ul3sC
	 hoFrNMnpr4KlW5G+JwwiMp9JF/OGXmdZd0MnFp09kI8iQX0b416aNojz6/uNqOMUP3
	 vbmG4Yufn638A==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AD9CE17E0909;
	Wed,  1 Jul 2026 14:19:51 +0200 (CEST)
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
Subject: [PATCH 00/10] drm/mediatek: Add DSC, WDMA, MT8189/96 DSI support
Date: Wed,  1 Jul 2026 14:19:40 +0200
Message-ID: <20260701121950.19454-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for:
 - Display Stream Compression (DSC) for DSI and DisplayPort for both
   legacy (8188/92/95 and others) and for Kompanio Ultra MT8196 SoCs
 - Write DMA (WDMA) Engine (for legacy only at this time) as a step
   to enable Writeback support (coming later with a restructuring of
   the entire mediatek-drm driver)
 - Newer MIPI DSI IP revisions, found in MT8189 and MT8196 SoCs

AngeloGioacchino Del Regno (10):
  dt-bindings: display: mediatek: dsc: Add MT8196 compatible
  drm/mediatek: Implement Display Stream Compression support
  dt-bindings: display: mediatek: dsi: Document MT8189 and MT8196
  drm/mediatek: mtk_dsi: Enable interrupt at component bind time
  drm/mediatek: mtk_dsi: Transfer register offsets to per-SoC const
  drm/mediatek: mtk_dsi: Add support for MT8189
  drm/mediatek: mtk_dsi: Add support for MT8196
  drm/mediatek: mtk_dsi: Enable PM Runtime on probe
  dt-bindings: display: mediatek: wdma: Add compatibles for more SoCs
  drm/mediatek: Add Write DMA (WDMA) Engine for Writeback support

 .../display/mediatek/mediatek,dsc.yaml        |   4 +-
 .../display/mediatek/mediatek,dsi.yaml        |   2 +
 .../display/mediatek/mediatek,wdma.yaml       |   5 +
 drivers/gpu/drm/mediatek/Makefile             |   2 +
 drivers/gpu/drm/mediatek/mtk_crtc.c           |  21 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c       |  64 +-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h       |   9 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  29 +
 drivers/gpu/drm/mediatek/mtk_disp_dsc.c       | 435 +++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_wdma.c      | 611 +++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |   8 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   2 +
 drivers/gpu/drm/mediatek/mtk_dsi.c            | 733 ++++++++++++++----
 13 files changed, 1741 insertions(+), 184 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_dsc.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_wdma.c

-- 
2.54.0

