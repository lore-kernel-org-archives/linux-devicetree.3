Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5534C0426;
	Wed,  1 Jul 2026 12:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908470; cv=none; b=vBIvO7OYF4MgDhtrMPqFPBxolmrNs2TiUmqnXMIks9fyGajuGkI7dTAOO6atG1L+TCt0rntFNHctg6a+9n/DKwDNQMXEMpcJx6lm1uaRhmEVlqnACb0DxHPgzYWin+Xb8mIWHyKdoxi7O2F+gODJkaCDs4H4BIEyo3SnV0XTq+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908470; c=relaxed/simple;
	bh=Dy+SzR29alcYD0tjn94WwKFgkpZ6fJbjcTNqeKHItxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gQj+0ImY0R6CYZVle3d6HQML8UN98PfmYByFrpQC4xq5wBJroZ+GY4QAI7u2EtXmgPuioZHCHANChYi8EMd5esucXGMOzkgKkxp9/N4nv9S4OotTJtDgkGT4C4IlYhgEirTCyk6aSU+L6lYC6FKu8awwQDrd4TGXp6Z0z/kaOig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DN+xBgy2; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DN+xBgy2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908465;
	bh=Dy+SzR29alcYD0tjn94WwKFgkpZ6fJbjcTNqeKHItxg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DN+xBgy2JNjCzbNJER4/ZI9EBpz9DDQHZurgO2WIxsPwVNr+tLUCH8Moej5Yarnnf
	 sjS0n052W1zI4Tkir99GukEp1BbOK+ZEXL4gscxglHyKVIDnqkXpxF7vRXBUohLl8m
	 i1ops6bKlUj5m0NRSQoH69R8/nvJjFE7+54vQoMY7XrfPtO0ItsvPTLBqn0df6OckO
	 L6R+H7BSQmwkvE0EzV9h6VrEPZNX2WN6n7cfsNKli//dr6+3e2vr5KltGIELi3jCqg
	 PafySA6esN0hL4Os35/V59Fvxr2/nwwugHQ01Z1oO+8/qFCGwNUeVgbOsIAxVHI8Cw
	 uHGTlt532GfNw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0DBB717E0CA2;
	Wed,  1 Jul 2026 14:21:05 +0200 (CEST)
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
Subject: [PATCH 04/42] drm/mediatek: Move mtk_ddp_comp_type enumeration to mtk-mmsys.h
Date: Wed,  1 Jul 2026 14:20:19 +0200
Message-ID: <20260701122057.19648-5-angelogioacchino.delregno@collabora.com>
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

In preparation for a major refactoring of MMSYS, MUTEX and of
mediatek-drm, move the mtk_ddp_comp_type enumeration to the
mtk-mmsys.h header, as this will be shared between multiple
MediaTek multimedia related drivers.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h | 25 ------------------
 include/linux/soc/mediatek/mtk-mmsys.h  | 34 +++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
index 99bf1e1015da..bbc66072fe6b 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
@@ -22,31 +22,6 @@ struct mtk_plane_state;
 struct drm_crtc_state;
 struct drm_dsc_config;
 
-enum mtk_ddp_comp_type {
-	MTK_DISP_AAL,
-	MTK_DISP_BLS,
-	MTK_DISP_CCORR,
-	MTK_DISP_COLOR,
-	MTK_DISP_DITHER,
-	MTK_DISP_DSC,
-	MTK_DISP_GAMMA,
-	MTK_DISP_MERGE,
-	MTK_DISP_MUTEX,
-	MTK_DISP_OD,
-	MTK_DISP_OVL,
-	MTK_DISP_OVL_2L,
-	MTK_DISP_OVL_ADAPTOR,
-	MTK_DISP_POSTMASK,
-	MTK_DISP_PWM,
-	MTK_DISP_RDMA,
-	MTK_DISP_UFOE,
-	MTK_DISP_WDMA,
-	MTK_DPI,
-	MTK_DP_INTF,
-	MTK_DSI,
-	MTK_DDP_COMP_TYPE_MAX,
-};
-
 struct mtk_ddp_comp;
 struct cmdq_pkt;
 struct mtk_ddp_comp_funcs {
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index 4885b065b849..3ddfdeac658d 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -84,6 +84,40 @@ enum mtk_ddp_comp_id {
 	DDP_COMPONENT_ID_MAX,
 };
 
+enum mtk_ddp_comp_type {
+	/* DISP Components */
+	MTK_DISP_AAL,
+	MTK_DISP_BLS,
+	MTK_DISP_CCORR,
+	MTK_DISP_COLOR,
+	MTK_DISP_DITHER,
+	MTK_DISP_DSC,
+	MTK_DISP_ETHDR_MIXER,
+	MTK_DISP_GAMMA,
+	MTK_DISP_MERGE,
+	MTK_DISP_MUTEX,
+	MTK_DISP_OD,
+	MTK_DISP_OVL,
+	MTK_DISP_OVL_2L,
+	MTK_DISP_OVL_ADAPTOR,
+	MTK_DISP_PADDING,
+	MTK_DISP_POSTMASK,
+	MTK_DISP_PWM,
+	MTK_DISP_RDMA,
+	MTK_DISP_UFOE,
+	MTK_DISP_WDMA,
+
+	/* MDP Components */
+	MTK_DISP_MDP_RDMA,
+
+	/* Keep Display outputs at the end for readability */
+	MTK_DPI,
+	MTK_DP_INTF,
+	MTK_DSI,
+
+	MTK_DDP_COMP_TYPE_MAX
+};
+
 void mtk_mmsys_ddp_connect(struct device *dev,
 			   enum mtk_ddp_comp_id cur,
 			   enum mtk_ddp_comp_id next);
-- 
2.54.0

