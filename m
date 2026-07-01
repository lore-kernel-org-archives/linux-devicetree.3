Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC2A4DBD7D;
	Wed,  1 Jul 2026 12:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908514; cv=none; b=qcFSFKwWpMs4Hr8OYCR2m7n5xXiCly8M9uSfkV25+fvN7syAnaZaEH7+F/pU9/Oa7f8A5fHDi1fgxhyxQ44d50YdYuuxC016guWKl2HJR6udKZ/ui+WmpwbkHkf7JU8KfqlzX0McbAG9hJHsAt2D645UMXSYL9+0HkqgR/Fmslk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908514; c=relaxed/simple;
	bh=Zmkb7/q13Yiofy5/9xpXsRmD7t96YcQsiiTWzOsvAgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gJixyai/ldgxkt0/qcWsikgco3NaC0rXe9id5cFmoYDhyGiLLSz1dSsmTijlWuuw1/vAyvfnaJ7PwYk5mDTe5Oo5fmH7KiBp4PUgwfIfJNZxtRA+GrDCT2it6fO+2M1GvpO10nyx0L3YZaOV+NjOKRT4w/wiLAkTmfkwRsL1f0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=m70Jp9Wq; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="m70Jp9Wq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908511;
	bh=Zmkb7/q13Yiofy5/9xpXsRmD7t96YcQsiiTWzOsvAgU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m70Jp9WqQr34BYgAzbXPwDGjMlOn63K/ScDGIjQENlaHDlj21yW2CCcaOERJT7AIl
	 0ZyRlniD1Wyg+E6LbNoGlOwh59rSaprvYbgZI5h6GL+abYgub+VRR9Wu/Y/Wvsk+AN
	 0yVz/8z0zfkJ6sB0Wohh8RD3L3Lspurh9C3TT1L53ALZWmrd3Gfc3TDuvifZb3kOR0
	 MF9873GkSfHmhqmTuA3IQiw1LmsQD9jdJHlroG+b7x04NGBFO2QAIGbg8Ta9THPjHP
	 V9u4f7/MaVmPHyldKGRSwcLJqIL3cI0b8JANPpZ6zdcMIQ9utisVbQqo6ZT4/w//Oa
	 NDaKQcWOFqP6w==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EAF3717E0FB0;
	Wed,  1 Jul 2026 14:21:50 +0200 (CEST)
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
Subject: [PATCH 36/42] drm/mediatek: Support registering disp controller device subnodes
Date: Wed,  1 Jul 2026 14:20:51 +0200
Message-ID: <20260701122057.19648-37-angelogioacchino.delregno@collabora.com>
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
index 482d05071125..50b4f79295b3 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -1237,6 +1237,107 @@ static int mtk_drm_of_ddp_path_build(struct device *dev, struct device_node *nod
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
@@ -1298,107 +1399,29 @@ static int mtk_drm_probe(struct platform_device *pdev)
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
@@ -1425,7 +1448,8 @@ static int mtk_drm_probe(struct platform_device *pdev)
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

