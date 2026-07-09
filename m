Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F9641CB3D;
	Thu,  9 Jul 2026 11:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783596721; cv=none; b=AkfBYk5Bi6X7Q8Oyl3ATPBKcJIi7IPWNm7kCf3nqNQPQTE4aebW5CxA29e15MqPxaepz4gOV+imWxn6Y2UrNf1ZKSpTqSGGFOO5Jxs67jNhwlHkEr7dA/mrRCowZlUI7mDnHYjZbcq9pfb0rYgZj3KTb+JL3V1c68/8JatjRuhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783596721; c=relaxed/simple;
	bh=+4IxEI1iwggfoTrsvZ7tlp4NbQe+d8nHT1G1ctZjbs8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IDsjhahY4YEOAdz7YdTO1mkt9FeaKfgRTauYNah9+651xXuLOHg9jVTtGlZ8c6WEPyQoRNQ3x0exqxgFgjdsT3pIXnMcbZGZWfxi2uMLsaUlbnF/41PHavdl4y4uP6ESp4rIW8IyzPmdYZRQ2TUypOwNQOGzNJA9L6+YRJOiMOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YzwRWpwx; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YzwRWpwx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783596719;
	bh=+4IxEI1iwggfoTrsvZ7tlp4NbQe+d8nHT1G1ctZjbs8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YzwRWpwxiLgAsdqpQa6L5OnLYFvCpGYwUGvUJ8bwbMfXlmVVjE0QVknqu3ecceOYE
	 6v0JVleXa2OJrWjfVXFvY8bIDkNcOiJ3haTneB6pC8xF3LkdOm0RUI3KAGzDl+j6ll
	 g+F6+G8uvt9oLWp3R/h/0J6gSZALFclvWyzTFEZG4qu9jxtdqJz3EmyH0yHdLA1GOu
	 DzLGr+55xxu13VVMwMx6cVUwZf7PcUuYB2PJv8012uZbDZHeIMLrpE6iorFzUM5G6/
	 uie20jdQAt/5IMB/cnfAjPJUqVNcsjYC7QkiZRL0kLfsF5VXpityCxYT4yL8Xpyoc5
	 r0UXKLGM1Dy7Q==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4174417E0DFB;
	Thu, 09 Jul 2026 13:31:58 +0200 (CEST)
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
Subject: [PATCH v4 05/12] drm/mediatek: mtk_dp: Clarify SMC eDP/DP video unmute commands
Date: Thu,  9 Jul 2026 13:31:41 +0200
Message-ID: <20260709113148.49090-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709113148.49090-1-angelogioacchino.delregno@collabora.com>
References: <20260709113148.49090-1-angelogioacchino.delregno@collabora.com>
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
index 8399a6b41168..b50264ca1f31 100644
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

