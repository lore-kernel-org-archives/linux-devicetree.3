Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177414A33E6;
	Wed,  1 Jul 2026 12:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908434; cv=none; b=JIloSR3lOnlkXtcZtBWWPLFaBopSwzUN64v17Wl5zGvSDWoyDGcTL1z0I7+YyuTHarCVcdfGFZUDilsGLOw3K5u0rJyfnm1ypT1m+FNuWKdngdEuhqgSIb0zSSn37mG+Z1rbJ7QjluHLSZcXfkAKv8xRZImCW9hVw8jbDR+PWzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908434; c=relaxed/simple;
	bh=EOZmf0bYgCSlqzHe+EFqmI+WhvQMCCQ8OXvvWzbVQeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hIOBFr/qNkfBQ5nEPp8j+Tyx8NxcbrRR52f1wkcE+Q0qmH+MA7K+rm6JiVUCP+vZ3ew0lprRcwZOoyJ/pinlMHFtWAD/QSbHjScDAkPgZkhuBpdMXpwBs1lTpKuRAo9TTobfm7PrUc/saIUnMCzKnPTK0lkyIzcGFKnqO33X//s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=IkhCODZ8; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="IkhCODZ8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908431;
	bh=EOZmf0bYgCSlqzHe+EFqmI+WhvQMCCQ8OXvvWzbVQeQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IkhCODZ84HN6Iom/0BtQCukA8GGIDkvu0Zb9ql/SQKi/3JqBj/v5JLoh9vShpqJYV
	 F/njEKMNP5fwo+yLN+GhOzcWnZYsBX2uQulR/VQMYwdZz26mkOCC83RoxqsYaaQ4Xw
	 CN0OCWhewkt4MTl5e7xnOZL1tl8Ad5GVjOPCQqnSkYVhcqVlTCtzr0dPv3p0Cnm1ko
	 QRGHrK5eq3MnOQy+L2gveEKZORXHpq994GmHctZprHi8z+Zmsof4nK7kf7c0NKDHYq
	 O7mJlL+wz1oj1C8pIKQUYwPadUDbIsb+2JPeRvUc/dooqRF0+//g08S/MtuNj2lsIj
	 9mJmEQ4FkuDjA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C6EF817E1411;
	Wed,  1 Jul 2026 14:20:30 +0200 (CEST)
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
Subject: [PATCH 04/11] drm/mediatek: mtk_dp: Clarify SMC eDP/DP video unmute commands
Date: Wed,  1 Jul 2026 14:20:17 +0200
Message-ID: <20260701122024.19557-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701122024.19557-1-angelogioacchino.delregno@collabora.com>
References: <20260701122024.19557-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The eDP/DP video unmute commands are not expressed as bits:
instead, in the firmware, those are defined as incremental
unsigned integer numbers: use the correct representation of
those to improve readability.

This commit brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 2c738c16dafa..f551c4543f4e 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -36,8 +36,8 @@
 #include "mtk_dp_reg.h"
 
 #define MTK_DP_SIP_CONTROL_AARCH32	MTK_SIP_SMC_CMD(0x523)
-#define MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE	(BIT(0) | BIT(5))
-#define MTK_DP_SIP_ATF_VIDEO_UNMUTE	BIT(5)
+#define MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE	33
+#define MTK_DP_SIP_ATF_VIDEO_UNMUTE	32
 
 #define MTK_DP_THREAD_CABLE_STATE_CHG	BIT(0)
 #define MTK_DP_THREAD_HPD_EVENT		BIT(1)
-- 
2.54.0

