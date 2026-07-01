Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794C44ADD90;
	Wed,  1 Jul 2026 12:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908440; cv=none; b=o/bQzubK+8C32yGdYkWqVPPwYdVZijyX4rzn5jPD6DcZUezCFGCA/iIYVx/5xobE4ANcmGSdm4KVK1XzKlFYyoQWQCFCj1/gM9KTCBjqSPVimZrYxS7R7N2WzaKC8S421C0xubkffpyBLHFA4If6N5xPQNRorupN3QiGW4/FEhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908440; c=relaxed/simple;
	bh=2D0aTJgmzWJqvGnR/9KkzM/quY9ZK6V/tZuS6gdte3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qrWqIBp5bE0l6foXZvfzcA0XT3zjud+W2RyIIN4IAbn3x6AeRW+K1N5uLIjxezlQUgR375DOI/nx5WkRSDjeq1VqMIbszGTk881NiDgKGrblx8xK9NJm/J9sNiRsiEHgPOmjJyy32sGwNPNxD46LLXrdhuK7aUxxgxfE0X6CJm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=d+Brl2jG; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="d+Brl2jG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908437;
	bh=2D0aTJgmzWJqvGnR/9KkzM/quY9ZK6V/tZuS6gdte3E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d+Brl2jGq9m9uvwYzGjjGmzwnHum+t7VA/Vb9i7FFITIItXbSwuRob/SPoJCBN8nM
	 WFe6PHLe6uF2940W/1M1hvXT4XTAt3UPYobG42CG6sYglxOYL6+lbiVXwmctoBu80f
	 lb7MdbBoCovorE0fZw6PBo2mH/QLWJDA0VYMUa3Z7Y7eEGdlDmDhE/hB46V8wwKgzT
	 DkOqvmST6/4Yro2o3JhTXo0kpVE4EAaRtAwuIALZuxWKa980ZTXKcWrrs0mAUhrJiy
	 9WA7l9mbxhoQgPtVv/ukciTPavMEapmeuF5HAouHWcmBtUi/P/7SEgPc83ciymGrPy
	 TLC/hc7x3pkvQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2C89E17E15A5;
	Wed,  1 Jul 2026 14:20:36 +0200 (CEST)
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
Subject: [PATCH 08/11] drm/mediatek: mtk_dp: Move max link rate to SoC specific data
Date: Wed,  1 Jul 2026 14:20:21 +0200
Message-ID: <20260701122024.19557-9-angelogioacchino.delregno@collabora.com>
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

In preparation for adding support for the eDP IP found in the
MT8196 SoC, having a higher supported maximum link rate, move
this parameter to SoC data instead of statically assigning it
to the training info during initialization.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index bf3a4b15f3ec..5272e717bfda 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -167,6 +167,7 @@ struct mtk_dp_data {
 	bool audio_supported;
 	bool audio_pkt_in_hblank_area;
 	u16 audio_m_div2_bit;
+	u8 hw_max_link_rate;
 };
 
 static const struct mtk_dp_efuse_fmt mt8188_dp_efuse_fmt[MTK_DP_CAL_MAX] = {
@@ -1481,7 +1482,7 @@ static void mtk_dp_initialize_priv_data(struct mtk_dp *mtk_dp)
 {
 	bool plugged_in = (mtk_dp->bridge.type == DRM_MODE_CONNECTOR_eDP);
 
-	mtk_dp->train_info.link_rate = DP_LINK_BW_5_4;
+	mtk_dp->train_info.link_rate = mtk_dp->data->hw_max_link_rate;
 	mtk_dp->train_info.lane_count = mtk_dp->max_lanes;
 	mtk_dp->train_info.cable_plugged_in = plugged_in;
 
@@ -3013,6 +3014,7 @@ static const struct mtk_dp_data mt8188_dp_data = {
 	.audio_supported = true,
 	.audio_pkt_in_hblank_area = true,
 	.audio_m_div2_bit = MT8188_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
+	.hw_max_link_rate = DP_LINK_BW_5_4,
 };
 
 static const struct mtk_dp_data mt8195_edp_data = {
@@ -3021,6 +3023,7 @@ static const struct mtk_dp_data mt8195_edp_data = {
 	.efuse_fmt = mt8195_edp_efuse_fmt,
 	.audio_supported = false,
 	.audio_m_div2_bit = MT8195_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
+	.hw_max_link_rate = DP_LINK_BW_5_4,
 };
 
 static const struct mtk_dp_data mt8195_dp_data = {
@@ -3029,6 +3032,7 @@ static const struct mtk_dp_data mt8195_dp_data = {
 	.efuse_fmt = mt8195_dp_efuse_fmt,
 	.audio_supported = true,
 	.audio_m_div2_bit = MT8195_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
+	.hw_max_link_rate = DP_LINK_BW_5_4,
 };
 
 static const struct of_device_id mtk_dp_of_match[] = {
-- 
2.54.0

