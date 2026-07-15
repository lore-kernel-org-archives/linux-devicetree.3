Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB24449EC3;
	Wed, 15 Jul 2026 11:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784116184; cv=none; b=DQ1klRfKu8NqaLYnOru3bRiJbSj0+mz8+VbfMbbtJDXoiNERCsiRSXiuAMMo3vkr2XuD21Io5DhWKcJNTsOl5ZMDrpC6IUUHTRsk9DF40hIlJsiQtYXptpPoonpk+6Na3jIV1cBZ40P8rV8tTr8Tfbn6wcJROAklpDLqI0oKDJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784116184; c=relaxed/simple;
	bh=kjlUr3Ch3S1Nnn/sGM3fVDh9wRA8DvKZBv88ET/VBcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O18v0aey75jsbazchyieuDnYiT1ZdwhpvZyYhZqFyWwLtMUQoWQEu6wfeQKNwIQB3UNbPmOiXpRq2bvLj7/Af8mj7En6Zp46N0ZSBp00LPW2bww86h44AAPfKkDRJgU8oLZZLo7+guZ55rCs66MsqYYwbd2YGx4p3Ny90DDVg7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oON+N/cw; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oON+N/cw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784116177;
	bh=kjlUr3Ch3S1Nnn/sGM3fVDh9wRA8DvKZBv88ET/VBcU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oON+N/cwvh+e+YldM+4etj71PnZWn5Fl6h6F79DMcAYUQ/krQQcyuUWC84WaP1gGu
	 P+6AwuW5SNZzLaDgZGbDF8smohqMtx8v4vYX/eHsA8xAAucy+l0FuR9jgmJtP+k7SA
	 TUbSUtmSUfR2ZgckUoT5k4UBhszWD8bBeNujMVFxBkYfXc31/q37uf07tE4UrRigst
	 iMOvhMSCmmUp9EreuSeYBURz0XoQHrBOchqanjNMcCcEFirTsuKOC7LK6PpmXZ6mTa
	 8GMvynE102bUHmzlhDdnheqlxnEjRKedVL0v+euSE2wZzceLlsP9RX7spwP9tHGhPH
	 ZjxEfJdFLPiBQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9697717E07AA;
	Wed, 15 Jul 2026 13:49:36 +0200 (CEST)
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
Subject: [PATCH v5 09/11] drm/mediatek: mtk_dsi: Enable PM Runtime on probe
Date: Wed, 15 Jul 2026 13:49:14 +0200
Message-ID: <20260715114916.19690-10-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715114916.19690-1-angelogioacchino.delregno@collabora.com>
References: <20260715114916.19690-1-angelogioacchino.delregno@collabora.com>
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

