Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F7A433E8E;
	Mon, 13 Jul 2026 14:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783952880; cv=none; b=AQVW3FHP5DtIOCM06gEBsDfkcbvRABJRW4F7osWppLT+mg+PPsTAaZB+ZFCHoQO+T5stO5qe8m4QoKPEUAaRx3rG3jQCJtnF7VtNRlKhKnM+ErHDkrcodE63ozn0SqlErCx0xYmq9eVwf8kVsUI9IIT8pxWulEpoGbCDmab6cJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783952880; c=relaxed/simple;
	bh=KNbVNlFY+uLNDUXEXu75BAUx1ez1smVG3i7wUViK7BM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MDF97cdsliqMcK9973BYhh4D/HiY7L+dmDIdCCm5r40RhuPXhTF3c4AXrtaiqQgBure+6D1fzWuvT4nVu+hzaFPqdD54fCKGFzq+DfbZtBIZCCBmZ5lbZyXBrlaJdxl6aSx+xYibOSZy6j1AIF+R3a6meI2fiwC2VwzOs69EgcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=L4f14ewj; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="L4f14ewj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783952877;
	bh=KNbVNlFY+uLNDUXEXu75BAUx1ez1smVG3i7wUViK7BM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L4f14ewju4LTblCAt0KdF/pgs7TvX0AfpQs2+1vkuGpjGGA39QYFe3h+/ZH1GGBfz
	 au33MnONA0TzpKvRaL41GPy5JignS4ZnQvVWc7SbH8ML9b/XEMGF6JY/bpjyDdGvAQ
	 ShNQ6yRI2EP0J9+nd9NA9LheRipAwJ+jE40SRSnvGiYLWG83z1CfvYrSLVDcwkfbun
	 AB4Kg4g50CrGFY7RTllMBKq8F14dwNKDQ6Ux/YSPaK3rTIoEzA5TZggUr1cfIRr3Tl
	 5XpWAeLH0XgRCLyTVejxR8m6kB9IfoEQknJyVeKIPpDJix5fxOLblCsdAro8ZmKcEb
	 dUzE4RjuQ5VdQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BC6D717E0DE6;
	Mon, 13 Jul 2026 16:27:56 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jitao.shi@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com
Subject: [PATCH v4 04/10] drm/mediatek: mtk_dsi: Enable interrupt at component bind time
Date: Mon, 13 Jul 2026 16:27:40 +0200
Message-ID: <20260713142746.40259-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260713142746.40259-1-angelogioacchino.delregno@collabora.com>
References: <20260713142746.40259-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Having the DSI interrupt enabled before actually binding the DSI
component to the display controller driver is both useless and
dangerous: the main purpose of this interrupt is to signal CMD
done, LP RX data ready, or VideoMode done, or to reset the HW
engine if this doesn't come.

Should this interrupt come too late (during probe), the HW will
be reset only at the next occurrence of a timeout, which slows
down boot and may render artifacts to the DSI display.

Moreover, clearing the DSI interrupt while the display controller
is not ready yet, may result in an interrupt storm.

In order to prevent this from happening, request the interrupt
with IRQF_NO_AUTOEN, and enable it only when binding DSI to its
display controller component master.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 8ab5c3431dbb..e24e7b91a361 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -225,6 +225,7 @@ struct mtk_dsi {
 	int refcount;
 	bool enabled;
 	bool lanes_ready;
+	int irq;
 	u32 irq_data;
 	wait_queue_head_t irq_wait_queue;
 	const struct mtk_dsi_driver_data *driver_data;
@@ -1090,7 +1091,13 @@ static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	return device_reset_optional(dev);
+	ret = device_reset_optional(dev);
+	if (ret)
+		return ret;
+
+	enable_irq(dsi->irq);
+
+	return 0;
 }
 
 static void mtk_dsi_unbind(struct device *dev, struct device *master,
@@ -1098,6 +1105,8 @@ static void mtk_dsi_unbind(struct device *dev, struct device *master,
 {
 	struct mtk_dsi *dsi = dev_get_drvdata(dev);
 
+	disable_irq(dsi->irq);
+
 	drm_encoder_cleanup(&dsi->encoder);
 }
 
@@ -1331,7 +1340,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 {
 	struct mtk_dsi *dsi;
 	struct device *dev = &pdev->dev;
-	int irq_num;
 	int ret;
 
 	dsi = devm_drm_bridge_alloc(dev, struct mtk_dsi, bridge,
@@ -1364,9 +1372,9 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->phy))
 		return dev_err_probe(dev, PTR_ERR(dsi->phy), "Failed to get MIPI-DPHY\n");
 
-	irq_num = platform_get_irq(pdev, 0);
-	if (irq_num < 0)
-		return irq_num;
+	dsi->irq = platform_get_irq(pdev, 0);
+	if (dsi->irq < 0)
+		return dsi->irq;
 
 	dsi->host.ops = &mtk_dsi_ops;
 	dsi->host.dev = dev;
@@ -1375,17 +1383,15 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, dsi);
 
+	ret = devm_request_irq(&pdev->dev, dsi->irq, mtk_dsi_irq,
+			       IRQF_NO_AUTOEN, dev_name(&pdev->dev), dsi);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed to request DSI irq\n");
+
 	ret = mipi_dsi_host_register(&dsi->host);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "Failed to register DSI host\n");
 
-	ret = devm_request_irq(&pdev->dev, irq_num, mtk_dsi_irq,
-			       IRQF_TRIGGER_NONE, dev_name(&pdev->dev), dsi);
-	if (ret) {
-		mipi_dsi_host_unregister(&dsi->host);
-		return dev_err_probe(&pdev->dev, ret, "Failed to request DSI irq\n");
-	}
-
 	dsi->bridge.of_node = dev->of_node;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
-- 
2.54.0

