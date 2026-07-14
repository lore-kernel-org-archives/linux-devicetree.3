Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56D23932FC;
	Tue, 14 Jul 2026 11:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784029534; cv=none; b=lSHr7Ir8x7ckX2YTYCBGF3p4A9jw0r/DTuYNgVojhTDKunn8K/wWtDrK59FHicTpgHdua5qjNvF61yv07e5ZPpojZcHIbYATfZHPpaUSohraKF4P2HjdakzDQpJwEmN4m5vkWXr/YLq7trLP+UA8yROxxY3ei8lHlw1UV6lCah8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784029534; c=relaxed/simple;
	bh=xVf5evvB8FvUTkLLMIdH5J561qbfcKhWFLWfJ3S1bPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oy3lNNEm/+OGFc1BykQul75dby3qpQGcxThKwpIrl1QT6rjQZkTpRjfudg3LfCTBlJnblDnZ0+hKlzE539WX4g4XXxLjZ8/TeMl5W2Mg+2H4aoUIqGiqjr/pBuNDtlntv74ysKSNQkN+jFvKtCwejeVI2y/HCHwVILETsJzTA10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Kpxd7Lxf; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Kpxd7Lxf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784029530;
	bh=xVf5evvB8FvUTkLLMIdH5J561qbfcKhWFLWfJ3S1bPI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kpxd7Lxfm1d+n3Zqc5Cp5QDwyzhBw2qRRrDJHAx38FDPIN2Kpt5QP1I4/zoWo3FEU
	 5d6cXAlXo0JBWf8KJwRDC93xyRliRrLZoR3o5Q1ccjTfP9Ncn7UPhykRozQsbrWO74
	 C09PmdgjlidhA5D1IVCf9b2hhKpgXPm1j8T9QwZUhIJ6BEHQ9jKSQAmLjYXilvf/0U
	 oy0pFYYLCRdU1U3wPmbxHBiIkdV/C/ICSXafaVpTHBf/E9/tky8eUpICuqGzusnmxr
	 QO5RPjSWltpQ48LjwziKr8/KDzH3Z1y95IHu1KqQx+lt94dO3aAwpBwyS6lLT9NRf8
	 CJz0fixDM5y9g==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 80E2B17E0956;
	Tue, 14 Jul 2026 13:45:29 +0200 (CEST)
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
Subject: [PATCH v2 46/46] drm/mediatek: mtk_drm_drv: Fail init only if all paths are invalid
Date: Tue, 14 Jul 2026 13:44:14 +0200
Message-ID: <20260714114414.184512-47-angelogioacchino.delregno@collabora.com>
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

Up until now, if not all display controller paths were valid, the
driver would fail probing and refuse to bind components: while
that was a good idea before, now that mediatek-drm gained much
more flexibility, it is finally possible to gracefully handle
this situation and register only the valid paths while leaving
the invalid ones unregistered, without any crash.

Count how many output paths are found, and then count how many
have failed probing: if there is at least one valid path, avoid
erroring out, so that at least some outputs will just work.

Of course, any path failing is not a clean situation and must be
resolved: in this case, function mtk_crtc_create() still prints
error messages so, even though some output works, that will not
go unnoticed, as a quick check in kmsg will show the errors that
made a certain path not to register.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 82d844b6abf7..7c9cb50909c8 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -394,6 +394,8 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 	struct mtk_drm_private *priv_n;
 	struct device *dma_dev = NULL;
 	struct drm_crtc *crtc;
+	int num_failed = 0;
+	int num_paths = 0;
 	int ret, i, j;
 
 	if (drm_firmware_drivers_only())
@@ -460,15 +462,29 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 			if (!priv_n->data->output_paths[i].len)
 				continue;
 
+			num_paths++;
+
+			dev_vdbg(drm->dev,
+				 "[CTRL%d-CRTC%d] Path Len:%d, Controller Order:%u\n",
+				 j, i, priv_n->data->output_paths[i].len,
+				 priv_n->data->output_paths[i].order);
+
 			ret = mtk_crtc_create(drm, i, j,
 					      priv_n->data->conn_routes,
 					      priv_n->data->num_conn_routes);
+			if (ret == 0)
+				break;
 
-			if (ret)
-				goto err_component_unbind;
+			num_failed++;
 		}
 	}
 
+	if (num_failed == num_paths) {
+		dev_err(drm->dev, "No valid Display Controller path! Going out.\n");
+		ret = -ENODEV;
+		goto err_component_unbind;
+	}
+
 	/* IGT will check if the cursor size is configured */
 	drm->mode_config.cursor_width = 512;
 	drm->mode_config.cursor_height = 512;
-- 
2.54.0

