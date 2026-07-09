Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7799E407599;
	Thu,  9 Jul 2026 10:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783593281; cv=none; b=lCAlPTAracgxwCQwzCur7dA3fVU2NJcBs6JTwqjD1Q8ipgi2uL0qnGeYzDYNzlzoEG7PpPDZ0xlC/6cZKGMdZnVfF6jzyxqxpvhJ/OxJeruk8hLahERLFDo/if+yYzB4T8AD6g3URk0Q5KJMfMK8jiqb/OXlJTADjJAkZVKD9Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783593281; c=relaxed/simple;
	bh=LanupiCg2f0Mc+jU8/x36dleWHDhxvHv3x48lFYqnio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X37GputLxrL1LbNJWINOLL56NuaW+IpM1IVgZC//OAEJf6dTqmFDcLK4s40/zbHgDIQJ/jYf46vBvl95T/fWkSYltVKjws3EgyNn/KGCLw+wsvjBPrE/eu509wKsD8eAIRIrOqCqTMxeURPG46gU2EoQegAip+KATu3Mw1DzBOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZkWHBWFb; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZkWHBWFb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783593279;
	bh=LanupiCg2f0Mc+jU8/x36dleWHDhxvHv3x48lFYqnio=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZkWHBWFbJCAlJ2EDuETJT3uu8TV8neR2pkMoPptVIkKuvmFqaGHzuIRShpBOT4vu6
	 RvOBNNUlenKfDHESxtWY6DmrZn7IhXrUw0SgmCKIqdwk6Y5PVv6mNA9KhHvBLBurMN
	 /N/gE9RQUw4jshOnpGAZuPhj/Ea+B/GOxe6fas3sS9YSu/8akaaBlcot2CHOp61qhP
	 qMFbmQjULMD9WNKH7tVGa/e0Un0Jqt86n98Y3tOHbMtPPfrhzMdhQf4Sxp76HjJ9lO
	 BsB+Ho0hb5SjZhEjZrtZJ33aNbjX9R3VPwL8C7St360pWBEczk8SMbvmVMsf43J8vG
	 w/ETZKYDl0rsw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 26E6417E0D33;
	Thu, 09 Jul 2026 12:34:38 +0200 (CEST)
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
Subject: [PATCH v3 04/11] drm/mediatek: mtk_dp: Clarify SMC eDP/DP video unmute commands
Date: Thu,  9 Jul 2026 12:34:24 +0200
Message-ID: <20260709103431.46616-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709103431.46616-1-angelogioacchino.delregno@collabora.com>
References: <20260709103431.46616-1-angelogioacchino.delregno@collabora.com>
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
index 12400383fbb2..a1a258ac997c 100644
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

