Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D761141B373;
	Thu,  9 Jul 2026 11:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783596727; cv=none; b=C3IDjm0KTUbM/Rt3D3v1b49QiSAgfpY8QlLbfvU/Isq6CGK5ze6OPHp/ioTzb3Pc0T31lNFj5jjn8Dc2Cqsmu45olwNNbfJOl1v286OoWycAGsF4ZKWAuCFrOoCYmvP6LuCZkNHRVnqLX4f3noMGpayQxBWc+RaXrEQY9unhwUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783596727; c=relaxed/simple;
	bh=lCVbct4kaC8t7MrovGDbl9jG9P7XK591Eo0CF2LC704=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b7Kd7cU0tUsyAdms8qTVN5MRwHU2zX7wc7Sx1glqf5RVIfmdiKfFwfzFO9tPKP6jF255W38MJRi3AYJi31rbt2nUkocCQRwVkOPRQJStH1Jd8VNujniqyeIiE9X2S9kE5zLe2KB174+s6MI4+RpqYe2H+RzdCp+vWew2Bi9VM3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZkB8rEkd; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZkB8rEkd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783596724;
	bh=lCVbct4kaC8t7MrovGDbl9jG9P7XK591Eo0CF2LC704=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZkB8rEkdzD5pJqaS0OO/+um5tUUi0qKJrlXeSwHuWX870RKuONOl0M0RxdYzE+UqF
	 4WQkp1TIoYcsT16UKqzP267oeS2LhegIO3Hyv7mimKtdVFCqQlFaodzv2TJ5RY0bd8
	 Lt9CdBcyhU0EWieu6KXfw0NmTFCcsKUfbar196fVw/Rj6oPxixFrm9eiHc3lp1UWma
	 PXNC9S//0rOk9RF9GnGfIQftZg86vW9P5wV+lZuIGjevZ6bT1alfXnGk4OTNaJPAyy
	 ++HgfLhDwzKkRe4e2MUKzcVu0Ru77zNFquEFx+uiRQJK7BP6jJanNk2awmg2Nr5hsn
	 d2ZRa1A3o8R+g==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6A8F017E0D56;
	Thu, 09 Jul 2026 13:32:03 +0200 (CEST)
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
Subject: [PATCH v4 09/12] drm/mediatek: mtk_dp: Move max link rate to SoC specific data
Date: Thu,  9 Jul 2026 13:31:45 +0200
Message-ID: <20260709113148.49090-10-angelogioacchino.delregno@collabora.com>
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

In preparation for adding support for the eDP IP found in the
MT8196 SoC, having a higher supported maximum link rate, move
this parameter to SoC data instead of statically assigning it
to the training info during initialization.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index e2a6001fc0cc..ea970a9bfe93 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -167,6 +167,7 @@ struct mtk_dp_data {
 	bool audio_supported;
 	bool audio_pkt_in_hblank_area;
 	u16 audio_m_div2_bit;
+	u8 hw_max_link_rate;
 };
 
 static const struct mtk_dp_efuse_fmt mt8188_dp_efuse_fmt[MTK_DP_CAL_MAX] = {
@@ -1469,7 +1470,7 @@ static void mtk_dp_initialize_priv_data(struct mtk_dp *mtk_dp)
 {
 	bool plugged_in = (mtk_dp->bridge.type == DRM_MODE_CONNECTOR_eDP);
 
-	mtk_dp->train_info.link_rate = DP_LINK_BW_5_4;
+	mtk_dp->train_info.link_rate = mtk_dp->data->hw_max_link_rate;
 	mtk_dp->train_info.lane_count = mtk_dp->max_lanes;
 	mtk_dp->train_info.cable_plugged_in = plugged_in;
 
@@ -2996,6 +2997,7 @@ static const struct mtk_dp_data mt8188_dp_data = {
 	.audio_supported = true,
 	.audio_pkt_in_hblank_area = true,
 	.audio_m_div2_bit = MT8188_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
+	.hw_max_link_rate = DP_LINK_BW_5_4,
 };
 
 static const struct mtk_dp_data mt8195_edp_data = {
@@ -3004,6 +3006,7 @@ static const struct mtk_dp_data mt8195_edp_data = {
 	.efuse_fmt = mt8195_edp_efuse_fmt,
 	.audio_supported = false,
 	.audio_m_div2_bit = MT8195_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
+	.hw_max_link_rate = DP_LINK_BW_5_4,
 };
 
 static const struct mtk_dp_data mt8195_dp_data = {
@@ -3012,6 +3015,7 @@ static const struct mtk_dp_data mt8195_dp_data = {
 	.efuse_fmt = mt8195_dp_efuse_fmt,
 	.audio_supported = true,
 	.audio_m_div2_bit = MT8195_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
+	.hw_max_link_rate = DP_LINK_BW_5_4,
 };
 
 static const struct of_device_id mtk_dp_of_match[] = {
-- 
2.54.0

