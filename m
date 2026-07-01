Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F174C6EF7;
	Wed,  1 Jul 2026 12:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908472; cv=none; b=np8BQ6ql92C5ReUqKY/iXNmk0eLu8/qx7Pvv36hiM2PDW8/B68J3kZ9v8aDDOASxH16PHQu35OcGTbIkqcBeRCYQYqXtoDCQMxTFeDX2urL5Hm5AhznfuOLbClvDPDOKUYAR7Jq3yeBRSXzbWgL4alh3IvtD2AStaYdWXNB8Cvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908472; c=relaxed/simple;
	bh=qGaUZZGDMdPi15E0uv7JzAyEsx2eZTqS7P8cmGb9ccw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=paq+JIXk1dbOGD0Amh4nAuu6WwaVv/t7ZknEMvSueToAb2G2XCTbuz9HRVS6e6ca4w6zStMyXmyQmZc+dB+6IZbfsD6SxF+u5I97tNoiFtZS/jYaOoXaIuUXblFR9j0LI/E1cnrjTtMJ3JCREseQcV1cqBUlPFCM3EiujwwiPmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FuI23H95; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FuI23H95"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908469;
	bh=qGaUZZGDMdPi15E0uv7JzAyEsx2eZTqS7P8cmGb9ccw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FuI23H95iqLw/2dnWfP/lE2fIJhvK0fh+crKKYR/vqvmjMImyjsPiowe/ifuuY5mV
	 uMCMh/JXcZcCXrWwP9UlaZINhFkLpWDcYYEj8lMlP91cDlEf8KKlr+zM/gShxW0CEt
	 wrFvJGxZaqgGI9h+eDPu5KMvAm25kcDBTsbF6TJcDgLHCrgc7RjZ1ZcRjweT+vcLi6
	 adJKZniEmaE9atdrA6O5XeS1x1RtuJD/UYoVhjL6pz7Kv39M5W5nnHR/7BnKJf6YtX
	 w18eNSCeY06ZuBZf2DWZj+W+k67oVJhSwRRshLrafduAMiy5Su+yF3ftE2weYr2xra
	 Nx/z4j+nu25RQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 39F0A17E35C9;
	Wed,  1 Jul 2026 14:21:08 +0200 (CEST)
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
Subject: [PATCH 07/42] drm/mediatek: ddp_comp: Move internal component register in function
Date: Wed,  1 Jul 2026 14:20:22 +0200
Message-ID: <20260701122057.19648-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
References: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for adding an helper serving the purpose of finally
removing duplicated code to check for internal/simple components,
and for improving human readability in the up coming refactoring,
move the internal/simple component registration logic to its own
mtk_ddp_comp_init_internal_comp() function.

This brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c | 55 +++++++++++++++----------
 1 file changed, 33 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index d716fd9f8a70..2ba2123238b3 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -629,6 +629,38 @@ static void mtk_ddp_comp_clk_put(void *_clk)
 	clk_put(clk);
 }
 
+static int mtk_ddp_comp_init_internal_comp(struct device *dev, struct device *comp_dev)
+{
+	struct device_node *comp_node = comp_dev->of_node;
+	struct mtk_ddp_comp_dev *priv;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->regs = devm_of_iomap(dev, comp_node, 0, NULL);
+	if (IS_ERR(priv->regs))
+		return PTR_ERR(priv->regs);
+
+	priv->clk = of_clk_get(comp_node, 0);
+	if (IS_ERR(priv->clk))
+		return PTR_ERR(priv->clk);
+
+	ret = devm_add_action_or_reset(dev, mtk_ddp_comp_clk_put, priv->clk);
+	if (ret)
+		return ret;
+
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	ret = cmdq_dev_get_client_reg(comp_dev, &priv->cmdq_reg, 0);
+	if (ret)
+		dev_dbg(comp_dev, "get mediatek,gce-client-reg fail!\n");
+#endif
+	dev_set_drvdata(comp_dev, priv);
+
+	return 0;
+};
+
 int mtk_ddp_comp_init(struct device *dev, struct device_node *node,
 		      struct mtk_drm_comp_list *hlist,
 		      unsigned int comp_id)
@@ -636,7 +668,6 @@ int mtk_ddp_comp_init(struct device *dev, struct device_node *node,
 	struct platform_device *comp_pdev;
 	struct mtk_ddp_comp *comp;
 	enum mtk_ddp_comp_type type;
-	struct mtk_ddp_comp_dev *priv;
 	int ret;
 
 	if (comp_id >= DDP_COMPONENT_DRM_ID_MAX)
@@ -686,29 +717,9 @@ int mtk_ddp_comp_init(struct device *dev, struct device_node *node,
 	    type == MTK_DISP_DSI)
 		goto end;
 
-	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
-	priv->regs = devm_of_iomap(dev, node, 0, NULL);
-	if (IS_ERR(priv->regs))
-		return PTR_ERR(priv->regs);
-
-	priv->clk = of_clk_get(node, 0);
-	if (IS_ERR(priv->clk))
-		return PTR_ERR(priv->clk);
-
-	ret = devm_add_action_or_reset(dev, mtk_ddp_comp_clk_put, priv->clk);
+	ret = mtk_ddp_comp_init_internal_comp(dev, comp->dev);
 	if (ret)
 		return ret;
-
-#if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	ret = cmdq_dev_get_client_reg(comp->dev, &priv->cmdq_reg, 0);
-	if (ret)
-		dev_dbg(comp->dev, "get mediatek,gce-client-reg fail!\n");
-#endif
-
-	platform_set_drvdata(comp_pdev, priv);
 end:
 	hash_add(hlist->ddp_list, &comp->lnode, comp->id);
 
-- 
2.54.0

