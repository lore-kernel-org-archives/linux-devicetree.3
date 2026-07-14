Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F8C38A718;
	Tue, 14 Jul 2026 11:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784029477; cv=none; b=uciKzCz6TmPNGr5P1IQrpzw1R8rWxTiPtSCqh6JKq858VUqaZx9pASjzIa7SsbHG7xSsDMI7CZW63nPiMsgow6t4WeaDG9OcOGdH1StD8DKtWKsbARijMnAT09MWQv0f2GMdNrSozIe6pZda6t51YaOfE80oUDVTro36rqR8ywI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784029477; c=relaxed/simple;
	bh=Ip0z0Dqm9bUaaMp/etGb29cMeapZRLGllSD+m34VwVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MhxKPv0vMssuFec0Ep8hM/PRz/l+SIcOaF81+U9vxGcOoEEiZL8moBAR4s3fM1QcNplz4GotfXIt6iOwCeBdM/x1elTccalB8uTK1wBQopJCxxOCTE+ynnETmTKUrkmzmYZuWdX8hXmHdW3/q4t71C6uy+LbbdxLwiZ4WJ0rkzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=j16Uz93h; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="j16Uz93h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784029474;
	bh=Ip0z0Dqm9bUaaMp/etGb29cMeapZRLGllSD+m34VwVA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j16Uz93hCM00fKmLqkfKyUHd+O3FtxoL9CNdPoleCVNsfb5em7W+NNiIxnt/KmX8i
	 0KRQozPXAnTxiMkZbEnryV0X79Ulqgw71OhzZObmUpsHDGTHebWzQhJzie0s9cBM5l
	 HO7391y4q3uIo7xqtB8q/WbzBYUF4A4U8/wn1ZR2o+RyXC8hLd/3VoMp3ub8vW5OBv
	 DavFbTLvSjtv9LmMFyZm2VNaFR1/Agy6PynLQaEAQtFH2MJKH1Eviuqe5hHKN6ZMj9
	 GvlZm7wcwmlQPYz4DJ7GAx91lWnHdGrnLjDVof4kqQtLQIANdx4irbEjNt9/A7HG4R
	 s1bM3pLnpfIrg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E777517E0DE9;
	Tue, 14 Jul 2026 13:44:33 +0200 (CEST)
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
Subject: [PATCH v2 04/46] drm/mediatek: Move mtk_ddp_comp_type enumeration to mtk-mmsys.h
Date: Tue, 14 Jul 2026 13:43:32 +0200
Message-ID: <20260714114414.184512-5-angelogioacchino.delregno@collabora.com>
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

In preparation for a major refactoring of MMSYS, MUTEX and of
mediatek-drm, move the mtk_ddp_comp_type enumeration to the
mtk-mmsys.h header, as this will be shared between multiple
MediaTek multimedia related drivers.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h | 25 ---------------------
 include/linux/soc/mediatek/mtk-mmsys.h  | 29 +++++++++++++++++++++++++
 2 files changed, 29 insertions(+), 25 deletions(-)

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
index 4885b065b849..fb88202d100a 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -84,6 +84,35 @@ enum mtk_ddp_comp_id {
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
+	MTK_DISP_GAMMA,
+	MTK_DISP_MERGE,
+	MTK_DISP_MUTEX,
+	MTK_DISP_OD,
+	MTK_DISP_OVL,
+	MTK_DISP_OVL_2L,
+	MTK_DISP_OVL_ADAPTOR,
+	MTK_DISP_POSTMASK,
+	MTK_DISP_PWM,
+	MTK_DISP_RDMA,
+	MTK_DISP_UFOE,
+	MTK_DISP_WDMA,
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

