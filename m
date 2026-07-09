Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29FE40960F;
	Thu,  9 Jul 2026 10:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783591589; cv=none; b=PuNcJKp1x+NctF5d1aNMwFcd+3JsIrsuB9l2a6fFhSZLlIJpT//idmaPN298oEorP5JmljES2pnbmUfGTOBxRn6hWb0D6JdqY3Bs1evQHK/5aq4CPY5XRsu4zWW/p/7yFy6W+T/1P3qA/fwHC/qZj/c9PNtDD0wSJd2UlznUnc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783591589; c=relaxed/simple;
	bh=CkYqfV3Z8+Hsqh9DjysAZsxWDq7JbUXYo6REfRoh9BA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CBPofDBkc8V0J6vqbZ8+EWT5AwXQUwZmbPzlSKdxPqlTg8cIZEkuJL6qhi+wBXE9pS+DA+LJ62ulLKPyt4oTFQTrdOYHFoAHqLo9tiMFbz/kZYHpJHIk45ELV3wT2rfl0HcjbZXGI0CbiStDYiFId8yxZZhd4kXX30kOgjLDPds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=hDHMnaBR; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="hDHMnaBR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783591586;
	bh=CkYqfV3Z8+Hsqh9DjysAZsxWDq7JbUXYo6REfRoh9BA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hDHMnaBREX6TonYVXJu+CXze57EBvAWsbGKAsspDNMW3UbUY2mqqwFZSA07uv2RW0
	 Nq/qmkNBghiW5Bjm7sjbE5g4Jw7tZQElV/o2Uuqt0Be6GZEHkTmF1gIVfH0YZBqpiI
	 0R60sZjgxzfaWea8O1kKJIVZ3IwYs0iB9eRltAcjN6L22J3TG2vZJg/wrLrz3E12NV
	 KYjx8/Qs946xR+aVeXyUSYuHsCGKQwkDpxBsfBEklVJYr2QuFVQT2l2ZGbtgm4PaCV
	 6Oq4LLPOU4wxQVNvIQxvhO1pnoLmcPuAuilBW6W6bwKFoWTsYE2jz4P/OrLDMS/0Y/
	 FRG157DXJ9tyw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3462D17E0D56;
	Thu, 09 Jul 2026 12:06:25 +0200 (CEST)
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
Subject: [PATCH v2 04/11] drm/mediatek: mtk_dp: Clarify SMC eDP/DP video unmute commands
Date: Thu,  9 Jul 2026 12:06:10 +0200
Message-ID: <20260709100617.42583-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709100617.42583-1-angelogioacchino.delregno@collabora.com>
References: <20260709100617.42583-1-angelogioacchino.delregno@collabora.com>
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
index 1abe3c83772a..df5dcef91666 100644
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

