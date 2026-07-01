Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FBE4ADDBA;
	Wed,  1 Jul 2026 12:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908449; cv=none; b=P115m7Eil4LYUaai9uuXQ9R/VuwAZtq6xT+xT2gLc8If19ae/3pO9aYUYvXAY0XaPYrdQTRyVfDWJRTy1ZTPdylfu+BibliToJszyYfEDT8RbK0Rg2mDRvGEGA/r2KBop1sflIeRh3iRohFdA8d6pJHka7iz/HLi4pReJuviD0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908449; c=relaxed/simple;
	bh=m6sJ153mTEtGqqARntkJHomU856d72WMcKy3EMNBfdA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EVnPHh8AwlAWtcLUVh6Z60BDBYqs2R4Q1knMxjwvb8Whmbo8Fe4AzlIX8FpCXMfrgmx6eAfu5D2VhFTx/tic0JAqG2sVozlbJJrJPyQG1mfBkpRMIab4ZRb1jwhPh0k/yGr5pytbF+7T65rGtNGa14oIpovK7AS/1FGe/1NAbT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=UdHzJ3oK; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="UdHzJ3oK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908446;
	bh=m6sJ153mTEtGqqARntkJHomU856d72WMcKy3EMNBfdA=;
	h=From:To:Cc:Subject:Date:From;
	b=UdHzJ3oKReCUM8CMjgYobeK2cYD0xqTaw9zVy9oOW3jjlQ8dli3+zy7x6/FrKbNIC
	 F6DKQVvkx8hl8FMqpY7/7MNEpwFaEVOu+XvIFD13MRWW9hGQ30sRRZf2faShcOZNTP
	 6uZdv4d2uYiO0PKtTI7QQF58ZuT1hIK1MGl9uqbAPr4h2mFz6FwBjzLtbycO+Xh1Qe
	 zI2xEsMa1XUDENfAEOWl3tUuFbQr6sczfbOixO6NQ1lJqRZFQcjZNe2TugkBhQw0h3
	 SEHLwpCkJBG8XMMDbCar3ZE7CT/31SzfVT9rVc9fvOIMmdw6wq2rnVwLvy46dWmMxZ
	 NoBlTHgqlhLhA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BC1D817E0857;
	Wed,  1 Jul 2026 14:20:45 +0200 (CEST)
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
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	andi.shyti@kernel.org,
	djakov@kernel.org,
	broonie@kernel.org,
	jitao.shi@mediatek.com,
	ck.hu@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	kernel@collabora.com
Subject: [PATCH 0/6] MediaTek MMSYS/Mute-X new-style part 1
Date: Wed,  1 Jul 2026 14:20:37 +0200
Message-ID: <20260701122043.19612-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series part 1 of a huge restructuring of the entire multimedia
part of MediaTek SoCs, especially mediatek-drm, and contains only a
set of changes that don't require any simultaneous updates in the
mediatek-drm driver.

This adds support for correctly advertising the MediaTek Mute-X IP
as a source of trigger signals (because that's what it is), hence
for adding #trigger-source-cells in the Mute-X devicetree node and
for specifying a Mute-X trigger-source in all of the MTK Display
Controller components supporting or requiring one, as previously
it was kind of hacked up as a static array in the Mute-X driver,
for both MDP and DISP components, which is, well, depending on the
point of view, actually wrong.

Moreover, this goes on with the first part for a rework of MediaTek
MMSYS, which is a requirement for the upcoming huge restructuring
of the mediatek-drm driver; this starts adding boilerplate required
for setting up MMSYS entries with decoupling of "component type" to
"component instance number".

As of now, all of the components in MediaTek DRM, hence also in the
MMSYS driver, are thrown in a catch-all enumeration that does not
make any distinction between Type-Instance relationship, and it is
like so (mock-up names ahead):

DISPLAY_DITHER0
DISPLAY_DITHER1
DISPLAY_DSI0
DISPLAY_DSI1

... and so on.

Since the number of components is now becoming uncontrollably large,
the catch-all enumeration poses a big issue as the mediatek-drm driver
is allocating a huge array that will be only half full (optimistically,
because usually it's way less than half full) and with repeated ops
assignment for each and every instance of the very same Sub-IP,
effectively treating every instance of a Sub-IP like it is completely
different from one another (for example, like DSI0 and DSI1 are as
different as DITHER0 and DSI1).

This has to change. It had to change months ago, but now it has become
not only a maintenance burden, but also a... (sorry) big mess.

And well, that... especially looking forward to add support for newer
SoCs, using even more components in one pipeline, and using different
and newer components (of new types...), making the catch-all enum to
grow of another ~20 entries or more.

So, this is PART 1 of this huge restructuring, which will impact many
drivers, including soc/mediatek's mutex and mmsys, most of drm/mediatek
and, in the future, also media/mediatek/mtk-mdp3 (and eventually its
firmwareless implementation which, for components handling, will be
as complicated as mediatek-drm and, without this restructuring, would
be yet another boulder).

AngeloGioacchino Del Regno (6):
  dt-bindings: soc: mediatek: mutex: Improve title and description
  dt-bindings: soc: mediatek: mutex: Allow #trigger-source-cells
  dt-bindings: display: mediatek: Allow trigger-sources on relevant HW
  soc: mediatek: mtk-mutex: Add new functions to add/remove triggers
  soc: mediatek: mtk-mmsys: Rework routes to specify component ID
  soc: mediatek: mtk-mmsys: Use MMSYS_ROUTE() in default routing table

 .../display/mediatek/mediatek,aal.yaml        |   3 +
 .../display/mediatek/mediatek,ccorr.yaml      |   3 +
 .../display/mediatek/mediatek,color.yaml      |   3 +
 .../display/mediatek/mediatek,dither.yaml     |   3 +
 .../display/mediatek/mediatek,dp.yaml         |   3 +
 .../display/mediatek/mediatek,dpi.yaml        |   3 +
 .../display/mediatek/mediatek,dsc.yaml        |   3 +
 .../display/mediatek/mediatek,dsi.yaml        |   3 +
 .../display/mediatek/mediatek,ethdr.yaml      |   3 +
 .../display/mediatek/mediatek,gamma.yaml      |   3 +
 .../display/mediatek/mediatek,merge.yaml      |   3 +
 .../display/mediatek/mediatek,od.yaml         |   3 +
 .../display/mediatek/mediatek,ovl-2l.yaml     |   3 +
 .../display/mediatek/mediatek,ovl.yaml        |   3 +
 .../display/mediatek/mediatek,padding.yaml    |   3 +
 .../display/mediatek/mediatek,postmask.yaml   |   3 +
 .../display/mediatek/mediatek,rdma.yaml       |   3 +
 .../display/mediatek/mediatek,split.yaml      |   3 +
 .../display/mediatek/mediatek,ufoe.yaml       |   3 +
 .../display/mediatek/mediatek,wdma.yaml       |   3 +
 .../bindings/soc/mediatek/mediatek,mutex.yaml |  21 +-
 drivers/soc/mediatek/mt6893-mmsys.h           |  34 +-
 drivers/soc/mediatek/mt8167-mmsys.h           |  21 +-
 drivers/soc/mediatek/mt8173-mmsys.h           |  28 +-
 drivers/soc/mediatek/mt8183-mmsys.h           |  14 +-
 drivers/soc/mediatek/mt8186-mmsys.h           |  22 +-
 drivers/soc/mediatek/mt8188-mmsys.h           |  78 ++---
 drivers/soc/mediatek/mt8192-mmsys.h           |  20 +-
 drivers/soc/mediatek/mt8195-mmsys.h           | 181 +++++------
 drivers/soc/mediatek/mt8365-mmsys.h           |  20 +-
 drivers/soc/mediatek/mtk-mmsys.h              | 299 ++++++++----------
 drivers/soc/mediatek/mtk-mutex.c              |  60 ++++
 include/linux/soc/mediatek/mtk-mutex.h        |   6 +
 33 files changed, 474 insertions(+), 390 deletions(-)

-- 
2.54.0

