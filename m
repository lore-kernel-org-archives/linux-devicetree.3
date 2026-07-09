Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC15422547;
	Thu,  9 Jul 2026 11:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783596732; cv=none; b=dSBSG3DQu74trrrmEcLQmxKemhSHdx4o/tBDqz7cNTgs8g2T5uDDHhvZQeGCib2cDCIzpuHBv6FsKE+SLQg67T8nbnxb4Rv/U6ZUTQcOfpxKtrhDIDM0boGIVWZ/jCA/HF/QeN2Gis6IzSrVt3X1EivHtOzJkyPcleAnx+a/uO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783596732; c=relaxed/simple;
	bh=4XLYv7T2L+SM8kKgMEtFGRjdw2nSDoUWLK4WhKL1BXo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RU6zNxdRwDvKMH8BAUkhg69Kv9bp5zz6De6ukH2cD17e9kL//n74gBmUm9hsJKaO+OoazGF7EWjczqcsukatB+mMYf23Rb+5+3Zp6GkOpc0mOofpLTQeeGKKjysFb1HPM8vzqPXOJUfWmCwfagxmc8mRrCPd7kvQ9f4md8yTXRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=OsmtxpXp; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="OsmtxpXp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783596729;
	bh=4XLYv7T2L+SM8kKgMEtFGRjdw2nSDoUWLK4WhKL1BXo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OsmtxpXpwWRyeFWalmJClaUR3KNubPVaS1ZvKJjXOTxMLOzb7/xLqp1DqxSoc0QdK
	 QXZO1jRV71kald2hjDaG0V6XE15M5KjpLQwMINisE0orJ8YxYTfNWHa32/00Zr7biP
	 K1vLCDPNYI3d79UKFeDNeuxzucgtgl944J+HP3KNfoH+Y4tlXtDP/3N6HSO7ZMgopU
	 NX01NmEEUh9giOouY8YyaWdo6Z7uCg/TNdO4LXihZLDXpQ9tmvBkDzvT6Lc3SJnrbg
	 mkwUt4OylOEA0aauPi3iujM+H+5GZ+LGVLxw1KR9KvqdRpgQMoHRGvWNEoiovhXD82
	 kVyvqbJxvLbCQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CD07617E019E;
	Thu, 09 Jul 2026 13:32:07 +0200 (CEST)
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
Subject: [PATCH v4 12/12] drm/mediatek: mtk_dp: Clarify XTAL freq and Debounce registers
Date: Thu,  9 Jul 2026 13:31:48 +0200
Message-ID: <20260709113148.49090-13-angelogioacchino.delregno@collabora.com>
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

Clarify the meaning of the sub-fields in the crystal frequency and
transmitter interrupt debounce registers, with the only purpose of
increasing human readability.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c     | 35 ++++++++++++++++-----------
 drivers/gpu/drm/mediatek/mtk_dp_reg.h |  6 +++--
 2 files changed, 25 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index fe7e05e27f6f..1183738ab903 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1216,9 +1216,15 @@ static void mtk_dp_initialize_settings_v2p1(struct mtk_dp *mtk_dp)
 
 static void mtk_dp_initialize_settings(struct mtk_dp *mtk_dp)
 {
+	/*
+	 * Set DP XTAL freq to 26MHz and accumulator to 1.
+	 * Valid values for XTAL freq are 12 and 26.
+	 */
 	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_342C,
-			   XTAL_FREQ_DP_TRANS_P0_DEFAULT,
-			   XTAL_FREQ_DP_TRANS_P0_MASK);
+			   FIELD_PREP_CONST(XTAL_FREQ_DP_ACCUM_NUM_MASK, 1) |
+			   FIELD_PREP_CONST(XTAL_FREQ_DP_CLOCK_MHZ_MASK, 26),
+			   XTAL_FREQ_DP_ACCUM_NUM_MASK | XTAL_FREQ_DP_CLOCK_MHZ_MASK);
+
 	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3540,
 			   FEC_CLOCK_EN_MODE_DP_TRANS_P0,
 			   FEC_CLOCK_EN_MODE_DP_TRANS_P0);
@@ -1260,28 +1266,29 @@ static void mtk_dp_initialize_aux_hpd_detect_settings(struct mtk_dp *mtk_dp)
 
 static void mtk_dp_initialize_hpd_detect_settings(struct mtk_dp *mtk_dp)
 {
-	u32 val;
-
 	/* Mask AUX TOP interrupt, as this uses transmitter for HPD */
 	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_IRQ_MASK,
 			   AUX_TOP_IRQ_MSK, AUX_TOP_IRQ_MSK);
 
-	/* Debounce threshold */
+	/* Set Hotplug debounce threshold time: xtal_period * deb_thd */
 	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3410,
 			   8, HPD_DEB_THD_DP_TRANS_P0_MASK);
 
-	val = (HPD_INT_THD_DP_TRANS_P0_LOWER_500US |
-	       HPD_INT_THD_DP_TRANS_P0_UPPER_1100US) << 4;
-	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3410,
-			   val, HPD_INT_THD_DP_TRANS_P0_MASK);
-
 	/*
-	 * Connect threshold 1.5ms + 5 x 0.1ms = 2ms
-	 * Disconnect threshold 1.5ms + 5 x 0.1ms = 2ms
+	 * Set interrupt debounce threshold time
+	 * VAL  |  0     1     2     3  INT_THD
+	 * Low  | 100   300   500   700 uS
+	 * High | 700   900  1100  1300 uS
 	 */
-	val = (5 << 8) | (5 << 12);
 	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3410,
-			   val,
+			   FIELD_PREP_CONST(HPD_INT_LOW_THD_DP_TRANS_P0_MASK, 2) |
+			   FIELD_PREP_CONST(HPD_INT_HIGH_THD_DP_TRANS_P0_MASK, 2),
+			   HPD_INT_THD_DP_TRANS_P0_MASK);
+
+	/* Connection and Disconnection thresholds: 1.5ms + (5 x 0.1) ms = 2ms */
+	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3410,
+			   FIELD_PREP_CONST(HPD_DISC_THD_DP_TRANS_P0_MASK, 5) |
+			   FIELD_PREP_CONST(HPD_CONN_THD_DP_TRANS_P0_MASK, 5),
 			   HPD_DISC_THD_DP_TRANS_P0_MASK |
 			   HPD_CONN_THD_DP_TRANS_P0_MASK);
 	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3430,
diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
index 9caf743f4fe6..ce47b99dddc4 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
+++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
@@ -253,6 +253,8 @@
 #define MTK_DP_TRANS_P0_3410				0x1410
 #define HPD_DEB_THD_DP_TRANS_P0_MASK				GENMASK(3, 0)
 #define HPD_INT_THD_DP_TRANS_P0_MASK				GENMASK(7, 4)
+#define HPD_INT_HIGH_THD_DP_TRANS_P0_MASK			GENMASK(7, 6)
+#define HPD_INT_LOW_THD_DP_TRANS_P0_MASK			GENMASK(5, 4)
 #define HPD_INT_THD_DP_TRANS_P0_LOWER_500US			(2 << 4)
 #define HPD_INT_THD_DP_TRANS_P0_UPPER_1100US			(2 << 6)
 #define HPD_DISC_THD_DP_TRANS_P0_MASK				GENMASK(11, 8)
@@ -267,8 +269,8 @@
 #define IRQ_MASK_DP_TRANS_P0_INT_IRQ				(BIT(3) << 4)
 #define IRQ_STATUS_DP_TRANS_P0_MASK				GENMASK(15, 12)
 #define MTK_DP_TRANS_P0_342C				0x142c
-#define XTAL_FREQ_DP_TRANS_P0_DEFAULT				(BIT(0) | BIT(3) | BIT(5) | BIT(6))
-#define XTAL_FREQ_DP_TRANS_P0_MASK				GENMASK(7, 0)
+#define XTAL_FREQ_DP_ACCUM_NUM_MASK				GENMASK(1, 0)
+#define XTAL_FREQ_DP_CLOCK_MHZ_MASK				GENMASK(7, 2)
 #define MTK_DP_TRANS_P0_3430				0x1430
 #define HPD_INT_THD_ECO_DP_TRANS_P0_MASK			GENMASK(1, 0)
 #define HPD_INT_THD_ECO_DP_TRANS_P0_HIGH_BOUND_EXT		BIT(1)
-- 
2.54.0

