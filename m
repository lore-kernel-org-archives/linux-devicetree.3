Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4DD3E6DE0;
	Mon, 13 Jul 2026 09:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783936735; cv=none; b=nmHgOT3zCK4TyzKErzFGhghkB9cbQOAY5tjgfwdxfbTPESaYHizENIocz75bytzTs0fKTwuCZymxXUBVDzRgnhW2QH1OMFn/5X22IFxHOytjvKJDQXrPF2b9FLy35hJZCk+EI6juv1dCfXvquJS2DgJ3VDkvy/3MbWv1qHriVkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783936735; c=relaxed/simple;
	bh=lBC85Rd9BC6ugXDjn9J4d8Xr/Qr84ol/yqPbsJPTRdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kaWfsBLmq09EkWaxbMN7lj0KsRL0Zk/ba34Tbya06CmlQltfwFD54vXs6+yV0To0eA+HBR6WNcoDj1Oya1kwXYgPRkcLAqQz/VNM5Lo2rTNTXQBfsuC9ZMDlAIeRKtj+Tygi/ZweSlzF3kAuBF1+ZQRsllkt+cend73CWY1ix2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=iDi6UykJ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="iDi6UykJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783936732;
	bh=lBC85Rd9BC6ugXDjn9J4d8Xr/Qr84ol/yqPbsJPTRdc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iDi6UykJssBQbcCEh7ipEcaJlU50B0KLbnGLIObBKmaJJHT0uuo9J3v+zyeFrfzjS
	 HfVAtOFIoekMDqvbFFI2GlhZiQEdshHr6144mIuuHPx+YyOZHwMihX0RqxX0pKz3W2
	 4rvVg+Q3X8CVjI8NcWb6Dc2wUQ/9qGOg4SxUGxY+lg62LahrC9riGjcgOArMLP/TWj
	 UiTaXqbcQD31KAaEnKBzCxiNX+kZ+8Yo4ApThWIwEnI/TGdJEq0bKmQn8/SA26xJJo
	 dKUA0nu5gswoEz8QC6IL7pwTySkT2ZxeUIliExEzAGCONUwEETjoJ2pE/P4XOjuqta
	 ulFFci1tl/1Mw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CC37517E01AC;
	Mon, 13 Jul 2026 11:58:51 +0200 (CEST)
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
Subject: [PATCH v2 08/10] drm/mediatek: mtk_dsi: Enable PM Runtime on probe
Date: Mon, 13 Jul 2026 11:58:35 +0200
Message-ID: <20260713095837.16590-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260713095837.16590-1-angelogioacchino.delregno@collabora.com>
References: <20260713095837.16590-1-angelogioacchino.delregno@collabora.com>
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
index 5af44c13bd5a..5fbaa7d580d3 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1684,6 +1684,10 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	dsi->bridge.of_node = dev->of_node;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
-- 
2.54.0

