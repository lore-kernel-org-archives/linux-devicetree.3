Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9648141F7FA;
	Thu,  9 Jul 2026 11:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783596725; cv=none; b=Q9Yl0lg8DHLSYOu/qYQ9pLpC9H9HmhQT/3wHQbYf/haQPqoYv/CKHLYVvUtVVrPkoXT4O4a2c/APEkbRouYO39KgkVr8Bk7VB/rXNsPi4vNTO3yamzKwVytWScKRKS2BTbjsFFCUb+ZLif5+u4sjOKs0y+4KVSjpK0CJ3HdLENM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783596725; c=relaxed/simple;
	bh=xcO6JLAwgxj+VrBwIR8J+AjYmrELhwm8s3Hw/kr17Po=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DNto2FFMdU5jMpYQsmFPPYsjt7amk87wnHW3AO40wMj2AixxmTfPDLLkLZgzfYYuAwwvyPzpuCmCmK67vzXX39ctmn2E6Q6svyNBRFaacFpQjm9YjfNuzRtJWpnr38pfIHZOYJSPeSM1jpQprR1/slhtRxoUvjE2ptylStNTPt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=I6zWZURL; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="I6zWZURL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783596722;
	bh=xcO6JLAwgxj+VrBwIR8J+AjYmrELhwm8s3Hw/kr17Po=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I6zWZURLp4iYY6r4IM3crXEXHM5SenjXLZNxFhBqIFQovXNw7UilPdHcXYMqk3F+q
	 GNs1L+606e97j6yMbDVQbIFDnILPW6mx46qjb659M+8avsDsP1qjnvC1zuwLf47XKF
	 XjXyFWNfQ1iactyGJvYVBmo1qxLhRrAANWWv6LcAlHzEU9t/UymjuXKBg8Q/9YjyAn
	 09AcZvk+rbQoXI0G7e6FQpxY35YRBwHLNmnhxsN6Ec/KWH3TC4gn2M0JSd8xAaIva4
	 yVztxDBiqlVCG2O6FwxxhWw4Ryl6/MtNm4pM3CL/nMCAEI57Fn180vf7lUQJs41CDq
	 Trmjbo09atR3g==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2524817E019E;
	Thu, 09 Jul 2026 13:32:01 +0200 (CEST)
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
Subject: [PATCH v4 07/12] drm/mediatek: mtk_dp: Use PHY API for PHY power sequences
Date: Thu,  9 Jul 2026 13:31:43 +0200
Message-ID: <20260709113148.49090-8-angelogioacchino.delregno@collabora.com>
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

The PHY driver has gained support for .power_on() and .power_off()
callbacks: use the API provided phy_power_on(), phy_power_off()
functions instead of writing into PHY registers from this driver.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index b2e5fa0914bc..383c8e66b527 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1404,6 +1404,8 @@ static void mtk_dp_aux_panel_poweron(struct mtk_dp *mtk_dp, bool pwron)
 
 static void mtk_dp_power_enable(struct mtk_dp *mtk_dp)
 {
+	int ret;
+
 	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_RESET_AND_PROBE,
 			   0, SW_RST_B_PHYD);
 
@@ -1414,20 +1416,35 @@ static void mtk_dp_power_enable(struct mtk_dp *mtk_dp)
 			   SW_RST_B_PHYD, SW_RST_B_PHYD);
 	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
 			   DP_PWR_STATE_BANDGAP_TPLL, DP_PWR_STATE_MASK);
-	regmap_write(mtk_dp->regs, DP_PHY_AUX_RX_CTL,
-		     RG_DPAUX_RX_VALID_DEGLITCH_EN | RG_XTP_GLB_CKDET_EN |
-		     RG_DPAUX_RX_EN);
-	regmap_clear_bits(mtk_dp->regs, MTK_DP_0034, DA_CKM_CKTX0_EN_FORCE_EN);
+
+	if (mtk_dp->phy_dev) {
+		regmap_write(mtk_dp->regs, DP_PHY_AUX_RX_CTL,
+			     RG_DPAUX_RX_VALID_DEGLITCH_EN | RG_XTP_GLB_CKDET_EN |
+			     RG_DPAUX_RX_EN);
+		regmap_clear_bits(mtk_dp->regs, MTK_DP_0034, DA_CKM_CKTX0_EN_FORCE_EN);
+	} else {
+		ret = phy_power_on(mtk_dp->phy);
+		if (ret)
+			dev_warn(mtk_dp->dev, "Could not power on PHY!\n");
+	}
 }
 
 static void mtk_dp_power_disable(struct mtk_dp *mtk_dp)
 {
+	int ret;
+
 	mtk_dp_write(mtk_dp, MTK_DP_TOP_PWR_STATE, 0);
 
-	regmap_set_bits(mtk_dp->regs, MTK_DP_0034, DA_CKM_CKTX0_EN_FORCE_EN);
+	if (unlikely(mtk_dp->phy_dev)) {
+		regmap_set_bits(mtk_dp->regs, MTK_DP_0034, DA_CKM_CKTX0_EN_FORCE_EN);
 
-	/* Disable RX */
-	regmap_write(mtk_dp->regs, DP_PHY_AUX_RX_CTL, 0);
+		/* Disable RX */
+		regmap_write(mtk_dp->regs, DP_PHY_AUX_RX_CTL, 0);
+	} else {
+		ret = phy_power_off(mtk_dp->phy);
+		if (ret)
+			dev_warn(mtk_dp->dev, "Could not power off PHY!\n");
+	}
 
 	mtk_dp_write(mtk_dp, MTK_DP_TOP_MEM_PD,
 		     0x550 | FUSE_SEL | MEM_ISO_EN);
-- 
2.54.0

