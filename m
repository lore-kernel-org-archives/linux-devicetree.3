Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6641A433BCD;
	Tue,  7 Jul 2026 14:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783433993; cv=none; b=JFqslnBb+IcOXWZ6XB71iIFPkpwravyPicigi/SinOb3wALVMlkUgNjPvC23bujJ3x+xlVvOAgBvbvj0k6Z+Us1lphydk55cNv/isaN/b/6FqbTn/eLtU4QdSeMA0/NLhUmO1+nWgCdQbohIAFlkUEk1OArCJiBlUWLo/I7tfVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783433993; c=relaxed/simple;
	bh=TqL4eWaaA0oBsoWcRTHb3KyJlw6H0KWveV++ZhZWwEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GWf9yJsi8pnJX4wIxIVbJRYBJzp6vfVBX83PjaXS07MsPch6hkYqRNceExbD7xHDjnZGaJ3wFbJ4Ul5Pr/ThoZ81y5hfPvt0QJ7uOr3A/PCLIWNwdtP/ljhxHFpIUE0sRKZreqYmxYa/nOoDPAV5oNAR/uWzx25Lja9a7UH40kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=XufPc1Gx; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="XufPc1Gx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783433990;
	bh=TqL4eWaaA0oBsoWcRTHb3KyJlw6H0KWveV++ZhZWwEk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XufPc1GxuFTH6dTwOeh91VGAIm6UKaHUqzEFgIKksq6LCFz/si9vSw8FeMlUoDffc
	 dXiwV1XnHVV07960LDcxoBdt7Q4sLTSEprKoEF42IuwX8srM5nhd+4S1vDpkxzBS2O
	 Lh6fiXdB6h/d66uq5J2S/4/6NxRTspmT4Kc8NL+rhvr0IEjlrVhUzmlBFijqr+eInb
	 3xTb4tpHrLAmJ/ahJA9DHXTUsyhdZQbTZBa6iyUVUnyWmGPcP1gKrZT+riHw2NT/uz
	 1z//CZYaIzbIZxVnErNwew6FSF8vO2RdBgrZhgAS+TuHi2hq5VjqJjHJ6FgsgVVyc4
	 CSTcUpK8D2Y7w==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2E41717E0FAC;
	Tue, 07 Jul 2026 16:19:50 +0200 (CEST)
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
Subject: [PATCH v2 11/12] phy: phy-mtk-dp: Add PHYD Lane EN register mask to SoC data
Date: Tue,  7 Jul 2026 16:19:30 +0200
Message-ID: <20260707141931.191172-12-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707141931.191172-1-angelogioacchino.delregno@collabora.com>
References: <20260707141931.191172-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for adding support for the eDP PHY found in newer
SoCs, transfer the register mask for PHYD_TX_LN_EN to SoC specific
data.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/phy/mediatek/phy-mtk-dp.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
index 8ac086360138..64bdfda5394f 100644
--- a/drivers/phy/mediatek/phy-mtk-dp.c
+++ b/drivers/phy/mediatek/phy-mtk-dp.c
@@ -214,6 +214,7 @@ struct mtk_dp_phya_imp_sel {
  * @regs_ana_lane:  Register (layout) offsets for ana_lan
  * @regs_dig_glb:   Register (layout) offsets for dig_glb
  * @regs_dig_lane:  Register (layout) offsets for dig_lan
+ * @mask_dig_tx_ln: Register mask for PHYD_TX_LN_EN field
  * @val_dig_bitrate:IP Version specific register values for Bit Rate setting
  * @ana_bias_r:     Internal resistance "R" Selection Settings (global)
  * @ana_cktx_imp:   TX Clock Impedance Selection Settings (global)
@@ -233,6 +234,9 @@ struct mtk_dp_phy_pdata {
 	const u8 *regs_dig_glb;
 	const u8 *regs_dig_lane;
 
+	/* Register masks */
+	u32 mask_dig_tx_ln;
+
 	/* IP-Version specific register value arrays */
 	const u8 *val_dig_bitrate;
 
@@ -371,10 +375,10 @@ static int mtk_dp_phy_configure(struct phy *phy, union phy_configure_opts *opts)
 
 		val = 0;
 		for (i = 0; i < opts->dp.lanes; i++)
-			val |= FIELD_PREP(PHYD_TX_LN_EN, BIT(i));
+			val |= field_prep(pdata->mask_dig_tx_ln, BIT(i));
 
 		regmap_update_bits(dp_phy->regmap, pdata->off_dig_glb + reg_dig_tx_ctl,
-				   PHYD_TX_LN_EN, val);
+				   pdata->mask_dig_tx_ln, val);
 	}
 
 	if (opts->dp.set_voltages) {
@@ -450,7 +454,7 @@ static int mtk_dp_phy_disable_all_lanes(struct mtk_dp_phy *dp_phy)
 		return ret;
 
 	/* Get mask of currently enabled lane */
-	val = FIELD_GET(PHYD_TX_LN_EN, val);
+	val = field_get(pdata->mask_dig_tx_ln, val);
 	if (val == 0)
 		return 0;
 
@@ -461,7 +465,7 @@ static int mtk_dp_phy_disable_all_lanes(struct mtk_dp_phy *dp_phy)
 
 		ret = regmap_clear_bits(dp_phy->regmap,
 					pdata->off_dig_glb + regs[DP_PHYD_TX_CTL_0],
-					FIELD_PREP(PHYD_TX_LN_EN, BIT(lane_num)));
+					field_prep(pdata->mask_dig_tx_ln, BIT(lane_num)));
 		if (ret)
 			return ret;
 	} while (val);
@@ -761,6 +765,7 @@ static const struct mtk_dp_phy_pdata mt8195_dp_phy_data = {
 	.regs_ana_lane = mt8195_phy_ana_lane_regs,
 	.regs_dig_glb = mt8195_phy_dig_glb_regs,
 	.regs_dig_lane = mt8195_phy_dig_lane_regs,
+	.mask_dig_tx_ln = PHYD_TX_LN_EN,
 	.val_dig_bitrate = mt8195_phy_dig_bitrate_val,
 	.ana_bias_r = 15,
 	.ana_cktx_imp = 8,
-- 
2.54.0

