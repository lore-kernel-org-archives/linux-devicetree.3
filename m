Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E4137205D;
	Wed, 15 Jul 2026 13:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784123840; cv=none; b=ILX0MNoh1IH+q3FuP0WwsD5lHxLtxM1Tc2lvW3a+XSj3gk3YzN2p6xGwxHV9NOLgmT9oIznme2eeaFZedVoGsOj/Bcm69FuKf983zUoQ8vsB5e9xx/LyzLCn9Us2JJtWqGm+q+bDZg3C+PH1VIOCs8+4z5R0+s+5+gEzepFlph8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784123840; c=relaxed/simple;
	bh=kjlUr3Ch3S1Nnn/sGM3fVDh9wRA8DvKZBv88ET/VBcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X9eK85COwRvHDlLoJwKYmktJsW1wqX+E4DaEj23T0RV4kWMnT3y1MrEsVWS/NLe8NELGIgmWUlBIIJa2CsNRlSTGjLysyy0BjIGC8V0FWYs16q2cdKnFQETU/BF+pmNh+w+PlpAuCuf9Txavn+cWfT7pN8XhpXW8DK3FxOXaOBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=g+MTMQ0O; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="g+MTMQ0O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784123837;
	bh=kjlUr3Ch3S1Nnn/sGM3fVDh9wRA8DvKZBv88ET/VBcU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g+MTMQ0OZ/dPI6CpU0VZBLLHj8DQBXuE+Nhls+f5hmFVu4G7OVpS/Q8Lgdzggc8FV
	 mlBPK/Wc4fD7YFVU1NcA1C8IdCBG5inD0HPq6/xihDwyupt7NL0KwLTG0tvJiMMIgJ
	 4ZyW7GdM9Yb1kCvb8AsHS6O8AfJag1hmQ9IQO50TqmukeegMblJmbkaSw5FPn48QXb
	 cyWqjEeA95yiiiq5wwJBowZbzi4X5neFyJUpLS78iSjES0cLFmBhAQd/Qk/YAXwkGl
	 rbULbbBGO7ZzQtSDWVz1cWJ7P9cZ9hjPQPDuLA2R2p5FIMTO6bI27b4U5PvW0P6T7w
	 CTIQDR6xMt8aw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C24A517E0DFB;
	Wed, 15 Jul 2026 15:57:16 +0200 (CEST)
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
Subject: [PATCH v6 09/11] drm/mediatek: mtk_dsi: Enable PM Runtime on probe
Date: Wed, 15 Jul 2026 15:57:01 +0200
Message-ID: <20260715135703.46540-10-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715135703.46540-1-angelogioacchino.delregno@collabora.com>
References: <20260715135703.46540-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable PM Runtime at the end of mtk_dsi_probe() so that the
mediatek-drm mtk_ddp_comp_power_on() function is able to do
pm_runtime_resume_and_get() and, analogously, the function
mtk_ddp_comp_power_off() to pm_runtime_put() for the DSI
device.

This makes sure that the power domains for the DSI IP are
turned on and off when necessary.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 4d8a02cbee38..dc0c4e867179 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1733,6 +1733,10 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "Failed to request DSI irq\n");
 
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
 	ret = mipi_dsi_host_register(&dsi->host);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "Failed to register DSI host\n");
-- 
2.54.0

