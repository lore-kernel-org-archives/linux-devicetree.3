Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B4E38D3F2;
	Tue, 14 Jul 2026 11:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784029490; cv=none; b=akQLfG1x+9gAnTcGvH5078uNyaQBJTEJV4zdX19BkxzuS9zA1/xDCJHsjTQF4XWfVmJq+tIKSRFU1hbO2vMwYBklstuFdVSMGCvq3O209VtPDsHNeg/gBlrkCVxcoatEaqfUerUX48+MbFEeSkHXUFlFfbVGCm3qiGm7LQ9qODY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784029490; c=relaxed/simple;
	bh=sd+JYVRU6OpcEMXuSkYvEWh3qcS31gGWMQijSMj+rNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=la/39zKJMnClkv8Da8Pn3w2Yd1BWX1a9lH0G36RnWThbZtaDZq2zVvXABjdCNFXGoDOuLjYHLid9tNrlMFQ956+KxC6Fgbjr0i7o9/VKoeghm/gVRXsTzQ1lyj1qYheT4iUAP49435MSb2XVLYyewiu0B8n9SAdDY2Zof7lYUiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=eoXmSbyH; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="eoXmSbyH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784029480;
	bh=sd+JYVRU6OpcEMXuSkYvEWh3qcS31gGWMQijSMj+rNI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eoXmSbyHcj6RJB/bQXWbtn9HZG8CaQ7pk1BYZNcV64AcSmPAsVC4Cz7g0TOH2ApMR
	 Gurg0GNiFYKLDdTJpvebxGdwURew2RPYoB4dzutRBd8Uup4FamJtIt617NsOcvRVcD
	 5RAsJ9L/gZ59kdWinBI1hmtnR9yW1mRPzvB64MczyNDaKB2f+rABfHLx+asQIumloQ
	 dwnl6zg2B5fEZlkCvOUhyxcHByNu803XULafqEhlChBK81O0QCWdASO2/hX29ZOKv/
	 SZcvs+snIWlIlZe9K+30x4d7ptgHeifpLRJttUzaiT2pnr9HY7PWycdIoXUDZVOzQx
	 Qi2CKE2hRMF5Q==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3E4E917E0857;
	Tue, 14 Jul 2026 13:44:39 +0200 (CEST)
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
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	kernel@collabora.com
Subject: [PATCH v2 09/46] drm/mediatek: De-duplicate internal component checks
Date: Tue, 14 Jul 2026 13:43:37 +0200
Message-ID: <20260714114414.184512-10-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both mtk_ddp_comp and mtk_drm_drv are performing similar checks
to distinguish components that have an external driver from ones
that don't - with the exception of mtk_ddp_comp also checking if
the component is related to a backlight driver.

Create helper functions in the main component management driver
mtk_ddp_comp, one to check if the currently checked component is
internal/simple, and one (static, internal to mtk_ddp_comp only)
to check if it is a backlight related one.

Since the amount of internal/simple components is lower than the
amount of ones having a specific driver, and since it is expected
that most of (if not all) of any new hardware support will need a
specific driver as well, the helpers are doing an inverted check
compared to what the code was doing before, as both mtk_ddp_comp
and mtk_drm_drv were checking for external component explicitly,
while now they're doing the same, but checking if NOT internal.

Also, while at it, for the OVL_ADAPTOR components case, instead
of checking for MTK_DISP_OVL_ADAPTOR, call the already provided
mtk_ovl_adaptor_is_comp_present() function to check for this type
of component.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c | 46 ++++++++++++++-----------
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h |  1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c  | 16 ++-------
 3 files changed, 29 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index 2ba2123238b3..a9c3e29fb340 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -629,6 +629,26 @@ static void mtk_ddp_comp_clk_put(void *_clk)
 	clk_put(clk);
 }
 
+static bool mtk_ddp_comp_is_backlight_comp(enum mtk_ddp_comp_type type)
+{
+	return type == MTK_DISP_BLS || type == MTK_DISP_PWM;
+}
+
+bool mtk_ddp_comp_is_internal_comp(enum mtk_ddp_comp_type type)
+{
+	switch (type) {
+	case MTK_DISP_DITHER:
+	case MTK_DISP_OD:
+	case MTK_DISP_POSTMASK:
+	case MTK_DISP_UFOE:
+		return true;
+	default:
+		break;
+	};
+
+	return false;
+}
+
 static int mtk_ddp_comp_init_internal_comp(struct device *dev, struct device *comp_dev)
 {
 	struct device_node *comp_node = comp_dev->of_node;
@@ -700,26 +720,12 @@ int mtk_ddp_comp_init(struct device *dev, struct device_node *node,
 	if (ret)
 		return ret;
 
-	if (type == MTK_DISP_AAL ||
-	    type == MTK_DISP_BLS ||
-	    type == MTK_DISP_CCORR ||
-	    type == MTK_DISP_COLOR ||
-	    type == MTK_DISP_DSC ||
-	    type == MTK_DISP_GAMMA ||
-	    type == MTK_DISP_MERGE ||
-	    type == MTK_DISP_OVL ||
-	    type == MTK_DISP_OVL_2L ||
-	    type == MTK_DISP_PWM ||
-	    type == MTK_DISP_RDMA ||
-	    type == MTK_DISP_WDMA ||
-	    type == MTK_DISP_DPI ||
-	    type == MTK_DISP_DP_INTF ||
-	    type == MTK_DISP_DSI)
-		goto end;
-
-	ret = mtk_ddp_comp_init_internal_comp(dev, comp->dev);
-	if (ret)
-		return ret;
+	/* If there's no external driver for this component, allocate and init now */
+	if (mtk_ddp_comp_is_internal_comp(type) || mtk_ddp_comp_is_backlight_comp(type)) {
+		ret = mtk_ddp_comp_init_internal_comp(dev, comp->dev);
+		if (ret)
+			return ret;
+	}
 end:
 	hash_add(hlist->ddp_list, &comp->lnode, comp->id);
 
diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
index 4203eecb2a7b..58a06add1368 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
@@ -351,6 +351,7 @@ static inline struct mtk_ddp_comp
 	return NULL;
 }
 
+bool mtk_ddp_comp_is_internal_comp(enum mtk_ddp_comp_type type);
 int mtk_ddp_comp_get_id(struct device_node *node,
 			enum mtk_ddp_comp_type comp_type);
 int mtk_find_possible_crtcs(struct drm_device *drm, struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index e956e1966b86..18683aee61ff 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -1166,20 +1166,8 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		 * blocks have separate component platform drivers and initialize their own
 		 * DDP component structure. The others are initialized here.
 		 */
-		if (comp_type == MTK_DISP_AAL ||
-		    comp_type == MTK_DISP_CCORR ||
-		    comp_type == MTK_DISP_COLOR ||
-		    comp_type == MTK_DISP_DSC ||
-		    comp_type == MTK_DISP_GAMMA ||
-		    comp_type == MTK_DISP_MERGE ||
-		    comp_type == MTK_DISP_OVL ||
-		    comp_type == MTK_DISP_OVL_2L ||
-		    comp_type == MTK_DISP_OVL_ADAPTOR ||
-		    comp_type == MTK_DISP_RDMA ||
-		    comp_type == MTK_DISP_WDMA ||
-		    comp_type == MTK_DISP_DP_INTF ||
-		    comp_type == MTK_DISP_DPI ||
-		    comp_type == MTK_DISP_DSI) {
+		if (!mtk_ddp_comp_is_internal_comp(comp_type) &&
+		    !mtk_ovl_adaptor_is_comp_present(node)) {
 			dev_info(dev, "Adding component match for %pOF\n",
 				 node);
 			drm_of_component_match_add(dev, &match, component_compare_of,
-- 
2.54.0

