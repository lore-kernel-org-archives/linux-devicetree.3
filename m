Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9773CCA15;
	Tue, 14 Jul 2026 11:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784029530; cv=none; b=KN2f5PmZa4DoQ3CkQmV9k5UYmnY83cELFq29MtGYFiafjQUcJ8mMblJhFObVDpTLy5D8RmiB8q0Nk9K1VuIby1Nox/2nYhEW/2b+s0ajEFZyGmCyzBtB5o54cWiBmXtmeOSrbiFQO5xUtiXK5yAweJzsrChx/I6Otqvjaw0fV7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784029530; c=relaxed/simple;
	bh=OxOb0JKMyxrT84QMeUNz8vqDSuZGP3qA19Lm+2k3CE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O2KCDdt5tIf0/WEDI+xwszWXF2lqmZ2VODkwri4FPnFNFosaHHgXFENdN+hUGHaE33NuTxRp8qk8J90zIhX/E31YjQXZvSNE/kfAqhjiaO2YVhJMAN3QnSNGJ22eW1YDZ9YTnI03dhIVelqje0UIcABCJHiJhmG8pqDH6m4lNdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=LM8UtgIp; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LM8UtgIp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784029524;
	bh=OxOb0JKMyxrT84QMeUNz8vqDSuZGP3qA19Lm+2k3CE0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LM8UtgIpyXud4ISL5VBeY5+8SqiEE32azSDWqqvCJKtk8D3LSnVilYl6YzIn67oOp
	 mKFyvC3CJFRZCguUbwsq3l2tXuguJ/YQYVGA90dgsEp8ykDot0E614aRJiHPImgBzW
	 L8qFIngaYEUp4bJ1w1zoSOy7Srd9CFdIIJ3j/1duYQZyVDbQo5N5luRhwmkR9y3kbh
	 IKvgdc5Pp3As5CLlpmt6QRSxbU2mVqBKlAqTIHWO61xnEC/Dk78JP1+sddSe4Hz1rK
	 +VEgDiACeC9D8v9XgB62lzECNLlxxUuEJKfniX/fRMLOdKUa0AAKJJE/xj5HOqAjbU
	 Wkv4SmTje1wkQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AB56C17E0076;
	Tue, 14 Jul 2026 13:45:23 +0200 (CEST)
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
Subject: [PATCH v2 40/46] drm/mediatek: Support registering disp controller device subnodes
Date: Tue, 14 Jul 2026 13:44:08 +0200
Message-ID: <20260714114414.184512-41-angelogioacchino.delregno@collabora.com>
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

In order to have a correct description of the hardware in the SoC
devicetree, look for Display Controller Subsystem sub-components
declared as subnodes of the display controller itself; to retain
compatibility with the older devicetrees, also keep looking for
sub-components in the main /soc node like before.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 218 ++++++++++++++-----------
 1 file changed, 121 insertions(+), 97 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 4f39df23c51e..d1086c86cb77 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -1247,6 +1247,107 @@ static int mtk_drm_of_ddp_path_build(struct device *dev, struct device_node *nod
 	return 0;
 }
 
+static int mtk_drm_register_sibling(struct device *dev, struct mtk_drm_private *private,
+				    struct device_node *node, struct component_match **match)
+{
+	enum mtk_ddp_comp_type comp_type;
+	int comp_inst_id;
+	bool comp_found;
+	int ret;
+
+	ret = mtk_drm_of_get_ddp_comp_type(node, &comp_type);
+	if (ret)
+		return -EAGAIN;
+
+	ret = of_device_is_available(node);
+	if (!ret) {
+		dev_dbg(dev, "Skipping disabled component %pOF\n", node);
+		return -EAGAIN;
+	}
+
+	if (comp_type == MTK_DISP_MUTEX) {
+		int id;
+
+		id = of_alias_get_id(node, "mutex");
+		if (id < 0 || id == private->data->mmsys_id) {
+			private->mutex_node = of_node_get(node);
+			dev_dbg(dev, "get mutex for mmsys %d", private->data->mmsys_id);
+		}
+		return 0;
+	}
+
+	comp_inst_id = mtk_ddp_comp_get_id(node, NULL, comp_type);
+	if (comp_inst_id < 0) {
+		dev_info(dev, "Skipping unknown component %pOF\n", node);
+		return 0;
+	}
+
+	if (comp_type == MTK_DISP_DIRECT_LINK)
+		comp_found = mtk_drm_find_directlink_comp(private);
+	else
+		comp_found = mtk_drm_find_mmsys_comp(private,
+						     comp_type, comp_inst_id);
+
+	if (!comp_found)
+		return -EAGAIN;
+
+	/*
+	 * Currently only the AAL, CCORR, COLOR, GAMMA, MERGE, OVL, RDMA, DSI, and DPI
+	 * blocks have separate component platform drivers and initialize their own
+	 * DDP component structure. The others are initialized here.
+	 */
+	if (!mtk_ddp_comp_is_internal_comp(comp_type) &&
+	    !mtk_ovl_adaptor_is_comp_present(node)) {
+		dev_info(dev, "Adding component match for %pOF\n",
+			 node);
+		drm_of_component_match_add(dev, match, component_compare_of,
+					   node);
+	}
+
+	if (comp_type == MTK_DISP_DIRECT_LINK) {
+		for_each_of_graph_port(node, port) {
+			u32 port_id;
+
+			of_property_read_u32(port, "reg", &port_id);
+			if (port_id > 1)
+				continue;
+
+			/* Even ports are inputs, odd ports are outputs */
+			if (port_id % 2)
+				comp_type = MTK_DISP_DIRECT_LINK_OUT;
+
+			for_each_of_graph_port_endpoint(port, ep) {
+				struct of_endpoint of_ep;
+
+				ret = of_graph_parse_endpoint(ep, &of_ep);
+				if (ret)
+					break;
+
+				ret = mtk_ddp_comp_init(dev, node, &private->hlist,
+							private->data->mmsys_id,
+							comp_type, of_ep.id);
+				if (ret)
+					break;
+			}
+
+			if (ret) {
+				of_node_put(node);
+				return ret;
+			}
+		}
+	} else {
+		ret = mtk_ddp_comp_init(dev, node, &private->hlist,
+					private->data->mmsys_id,
+					comp_type, comp_inst_id);
+		if (ret) {
+			of_node_put(node);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 static int mtk_drm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1308,107 +1409,29 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	/* Iterate over sibling DISP function blocks */
-	for_each_child_of_node(phandle->parent, node) {
-		enum mtk_ddp_comp_type comp_type;
-		u8 comp_inst_id;
-		bool comp_found;
-
-		ret = mtk_drm_of_get_ddp_comp_type(node, &comp_type);
-		if (ret)
-			continue;
-
-		if (!of_device_is_available(node)) {
-			dev_dbg(dev, "Skipping disabled component %pOF\n",
-				node);
-			continue;
-		}
-
-		if (comp_type == MTK_DISP_MUTEX) {
-			int id;
-
-			id = of_alias_get_id(node, "mutex");
-			if (id < 0 || id == private->data->mmsys_id) {
-				private->mutex_node = of_node_get(node);
-				dev_dbg(dev, "get mutex for mmsys %d", private->data->mmsys_id);
-			}
-			continue;
-		}
-
-		comp_inst_id = mtk_ddp_comp_get_id(node, NULL, comp_type);
-		if (comp_inst_id < 0) {
-			dev_warn(dev, "Skipping unknown component %pOF\n",
-				 node);
-			continue;
-		}
-
-		if (comp_type == MTK_DISP_DIRECT_LINK)
-			comp_found = mtk_drm_find_directlink_comp(private);
-		else
-			comp_found = mtk_drm_find_mmsys_comp(private,
-							     comp_type, comp_inst_id);
-
-		if (!comp_found)
-			continue;
-
-		/*
-		 * Currently only the AAL, CCORR, COLOR, GAMMA, MERGE, OVL, RDMA, DSI, and DPI
-		 * blocks have separate component platform drivers and initialize their own
-		 * DDP component structure. The others are initialized here.
-		 */
-		if (!mtk_ddp_comp_is_internal_comp(comp_type) &&
-		    !mtk_ovl_adaptor_is_comp_present(node)) {
-			dev_info(dev, "Adding component match for %pOF\n",
-				 node);
-			drm_of_component_match_add(dev, &match, component_compare_of,
-						   node);
-		}
-
-		if (comp_type == MTK_DISP_DIRECT_LINK) {
-			for_each_of_graph_port(node, port) {
-				u32 port_id;
-
-				of_property_read_u32(port, "reg", &port_id);
-				if (port_id > 1)
-					continue;
-
-				/* Even ports are inputs, odd ports are outputs */
-				if (port_id % 2)
-					comp_type = MTK_DISP_DIRECT_LINK_OUT;
-
-				for_each_of_graph_port_endpoint(port, ep) {
-					struct of_endpoint of_ep;
-
-					ret = of_graph_parse_endpoint(ep, &of_ep);
-					if (ret)
-						break;
-
-					ret = mtk_ddp_comp_init(dev, node, &private->hlist,
-								private->data->mmsys_id,
-								comp_type, of_ep.id);
-					if (ret)
-						break;
-				}
+	for_each_child_of_node(phandle, node) {
+		ret = mtk_drm_register_sibling(dev, private, node, &match);
+		if (ret && ret != -EAGAIN)
+			goto err_node;
+	}
 
-				if (ret) {
-					of_node_put(node);
-					goto err_node;
-				}
-			}
-		} else {
-			ret = mtk_ddp_comp_init(dev, node, &private->hlist,
-						private->data->mmsys_id,
-						comp_type, comp_inst_id);
-			if (ret) {
-				of_node_put(node);
-				goto err_node;
-			}
-		}
+	/*
+	 * After the previous loop, it is expected to have all of the display
+	 * controller sibling function blocks registered and added to the list.
+	 *
+	 * If nothing got registered this is a legacy devicetree with DISP
+	 * siblings located under the /soc node instead of being children of
+	 * the main Display Controller node.
+	 */
+	for_each_child_of_node(phandle->parent, node) {
+		ret = mtk_drm_register_sibling(dev, private, node, &match);
+		if (ret && ret != -EAGAIN)
+			goto err_node;
 	}
 
 	if (!private->mutex_node) {
 		dev_err(dev, "Failed to find disp-mutex node\n");
-		ret = -ENODEV;
-		goto err_node;
+		return -ENODEV;
 	}
 
 	/* If mtk-mutex is not a trigger source, this is an old devicetree */
@@ -1435,7 +1458,8 @@ static int mtk_drm_probe(struct platform_device *pdev)
 err_pm:
 	pm_runtime_disable(dev);
 err_node:
-	of_node_put(private->mutex_node);
+	if (private->mutex_node)
+		of_node_put(private->mutex_node);
 	return ret;
 }
 
-- 
2.54.0

