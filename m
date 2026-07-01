Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C1B4BCACB;
	Wed,  1 Jul 2026 12:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908459; cv=none; b=mSdEWK/vYlvB2KZSj2sNCxCe+sOknsG6MJ+gUkJtiHUO/q76MgV2omr+nwGSw2NPYu9PvCLzjeKwzq2o5cpkcu1BS3vK6B/C/3H9VnoCI7S/0a5p57durTqJ7yGpSqy2GElW7rZO+AUUcWtfy3P+tiS6la5zHb9c+1KCYWx+9Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908459; c=relaxed/simple;
	bh=MH9rZNYjTexT9/FSQg9LOO/88ptllu4jdjcPjbmJHTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GQTpIMQNTsbEA7uckjlDek20zF3U58OOlK0fyreGfg5fU9QEui7DlXsg7kB+3dWVIWwy7xlXFdbPOJNEJ1dg6NRkJiNGJsQDIusvqPu2sLqHJX9xe4FPrWdQKhIF8RrJjJY7ge+sWkZScm2HQaiMPOLDcePH3xYaGrX8yQhb4lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FDRdcObX; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FDRdcObX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908456;
	bh=MH9rZNYjTexT9/FSQg9LOO/88ptllu4jdjcPjbmJHTI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FDRdcObXoQGxpSBq5tszZW0ObJHRVfa1cpxLK2fqJaguAl4arNEC8PkiDPWOxEPS2
	 kPT3nTIPZucvglyTd4QyXT7CRzScrN9bA1pPwRu/SCln3UkIs17qth1mlxI7f/u21h
	 Yrk2sLk8MfrIVWu5oFcok/amzu4dcbU2IPjodTIyR2FlR6PU+GknNRjvMYgP/nUU+X
	 M0N97n2pUUBEH+NN4WT+vqAP9vcFBa81t6EvqPShuYnhPLEW9w4qnWiY3UcO6OIDzz
	 KvAH3judd6aJtkXr0hCd7cc219UNmYi4OhUcJED2BjR85rMn4oKCFnooEAA4544XIe
	 HRb9uvJB5S/5Q==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0BBC317E116D;
	Wed,  1 Jul 2026 14:20:55 +0200 (CEST)
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
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	andi.shyti@kernel.org,
	djakov@kernel.org,
	broonie@kernel.org,
	jitao.shi@mediatek.com,
	ck.hu@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	kernel@collabora.com
Subject: [PATCH 6/6] soc: mediatek: mtk-mmsys: Use MMSYS_ROUTE() in default routing table
Date: Wed,  1 Jul 2026 14:20:43 +0200
Message-ID: <20260701122043.19612-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701122043.19612-1-angelogioacchino.delregno@collabora.com>
References: <20260701122043.19612-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All of the mtk_mmsys_routes tables for all SoCs were converted to
use the MMSYS_ROUTE() macro but the default one used for MT2701,
MT2712 and SoCs from that generation was not: convert this one as
well.

This brings no functional change.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-mmsys.h | 279 +++++++++++++------------------
 1 file changed, 114 insertions(+), 165 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
index b37d859b6c14..d534d43aad6f 100644
--- a/drivers/soc/mediatek/mtk-mmsys.h
+++ b/drivers/soc/mediatek/mtk-mmsys.h
@@ -157,171 +157,120 @@ struct mtk_mmsys_driver_data {
  * to an independent table.
  */
 static const struct mtk_mmsys_routes mmsys_default_routing_table[] = {
-	{
-		DDP_COMPONENT_BLS, DDP_COMPONENT_DSI0,
-		DISP_REG_CONFIG_OUT_SEL, BLS_RDMA1_DSI_DPI_MASK,
-		BLS_TO_DSI_RDMA1_TO_DPI1
-	}, {
-		DDP_COMPONENT_BLS, DDP_COMPONENT_DSI0,
-		DISP_REG_CONFIG_DSI_SEL, DSI_SEL_IN_MASK,
-		DSI_SEL_IN_BLS
-	}, {
-		DDP_COMPONENT_BLS, DDP_COMPONENT_DPI0,
-		DISP_REG_CONFIG_OUT_SEL, BLS_RDMA1_DSI_DPI_MASK,
-		BLS_TO_DPI_RDMA1_TO_DSI
-	}, {
-		DDP_COMPONENT_BLS, DDP_COMPONENT_DPI0,
-		DISP_REG_CONFIG_DSI_SEL, DSI_SEL_IN_MASK,
-		DSI_SEL_IN_RDMA
-	}, {
-		DDP_COMPONENT_BLS, DDP_COMPONENT_DPI0,
-		DISP_REG_CONFIG_DPI_SEL, DPI_SEL_IN_MASK,
-		DPI_SEL_IN_BLS
-	}, {
-		DDP_COMPONENT_GAMMA, DDP_COMPONENT_RDMA1,
-		DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN, GAMMA_MOUT_EN_RDMA1,
-		GAMMA_MOUT_EN_RDMA1
-	}, {
-		DDP_COMPONENT_OD0, DDP_COMPONENT_RDMA0,
-		DISP_REG_CONFIG_DISP_OD_MOUT_EN, OD_MOUT_EN_RDMA0,
-		OD_MOUT_EN_RDMA0
-	}, {
-		DDP_COMPONENT_OD1, DDP_COMPONENT_RDMA1,
-		DISP_REG_CONFIG_DISP_OD_MOUT_EN, OD1_MOUT_EN_RDMA1,
-		OD1_MOUT_EN_RDMA1
-	}, {
-		DDP_COMPONENT_OVL0, DDP_COMPONENT_COLOR0,
-		DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, OVL0_MOUT_EN_COLOR0,
-		OVL0_MOUT_EN_COLOR0
-	}, {
-		DDP_COMPONENT_OVL0, DDP_COMPONENT_COLOR0,
-		DISP_REG_CONFIG_DISP_COLOR0_SEL_IN, COLOR0_SEL_IN_OVL0,
-		COLOR0_SEL_IN_OVL0
-	}, {
-		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
-		DISP_REG_CONFIG_DISP_OVL_MOUT_EN, OVL_MOUT_EN_RDMA,
-		OVL_MOUT_EN_RDMA
-	}, {
-		DDP_COMPONENT_OVL1, DDP_COMPONENT_COLOR1,
-		DISP_REG_CONFIG_DISP_OVL1_MOUT_EN, OVL1_MOUT_EN_COLOR1,
-		OVL1_MOUT_EN_COLOR1
-	}, {
-		DDP_COMPONENT_OVL1, DDP_COMPONENT_COLOR1,
-		DISP_REG_CONFIG_DISP_COLOR1_SEL_IN, COLOR1_SEL_IN_OVL1,
-		COLOR1_SEL_IN_OVL1
-	}, {
-		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DPI0,
-		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_MASK,
-		RDMA0_SOUT_DPI0
-	}, {
-		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DPI1,
-		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_MASK,
-		RDMA0_SOUT_DPI1
-	}, {
-		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DSI1,
-		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_MASK,
-		RDMA0_SOUT_DSI1
-	}, {
-		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DSI2,
-		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_MASK,
-		RDMA0_SOUT_DSI2
-	}, {
-		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DSI3,
-		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_MASK,
-		RDMA0_SOUT_DSI3
-	}, {
-		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
-		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_MASK,
-		RDMA1_SOUT_DPI0
-	}, {
-		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
-		DISP_REG_CONFIG_DPI_SEL_IN, DPI0_SEL_IN_MASK,
-		DPI0_SEL_IN_RDMA1
-	}, {
-		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI1,
-		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_MASK,
-		RDMA1_SOUT_DPI1
-	}, {
-		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI1,
-		DISP_REG_CONFIG_DPI_SEL_IN, DPI1_SEL_IN_MASK,
-		DPI1_SEL_IN_RDMA1
-	}, {
-		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI0,
-		DISP_REG_CONFIG_DSIE_SEL_IN, DSI0_SEL_IN_MASK,
-		DSI0_SEL_IN_RDMA1
-	}, {
-		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI1,
-		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_MASK,
-		RDMA1_SOUT_DSI1
-	}, {
-		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI1,
-		DISP_REG_CONFIG_DSIO_SEL_IN, DSI1_SEL_IN_MASK,
-		DSI1_SEL_IN_RDMA1
-	}, {
-		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI2,
-		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_MASK,
-		RDMA1_SOUT_DSI2
-	}, {
-		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI2,
-		DISP_REG_CONFIG_DSIE_SEL_IN, DSI2_SEL_IN_MASK,
-		DSI2_SEL_IN_RDMA1
-	}, {
-		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI3,
-		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_MASK,
-		RDMA1_SOUT_DSI3
-	}, {
-		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI3,
-		DISP_REG_CONFIG_DSIO_SEL_IN, DSI3_SEL_IN_MASK,
-		DSI3_SEL_IN_RDMA1
-	}, {
-		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DPI0,
-		DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_MASK,
-		RDMA2_SOUT_DPI0
-	}, {
-		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DPI0,
-		DISP_REG_CONFIG_DPI_SEL_IN, DPI0_SEL_IN_MASK,
-		DPI0_SEL_IN_RDMA2
-	}, {
-		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DPI1,
-		DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_MASK,
-		RDMA2_SOUT_DPI1
-	}, {
-		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DPI1,
-		DISP_REG_CONFIG_DPI_SEL_IN, DPI1_SEL_IN_MASK,
-		DPI1_SEL_IN_RDMA2
-	}, {
-		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI0,
-		DISP_REG_CONFIG_DSIE_SEL_IN, DSI0_SEL_IN_MASK,
-		DSI0_SEL_IN_RDMA2
-	}, {
-		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI1,
-		DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_MASK,
-		RDMA2_SOUT_DSI1
-	}, {
-		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI1,
-		DISP_REG_CONFIG_DSIO_SEL_IN, DSI1_SEL_IN_MASK,
-		DSI1_SEL_IN_RDMA2
-	}, {
-		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI2,
-		DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_MASK,
-		RDMA2_SOUT_DSI2
-	}, {
-		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI2,
-		DISP_REG_CONFIG_DSIE_SEL_IN, DSI2_SEL_IN_MASK,
-		DSI2_SEL_IN_RDMA2
-	}, {
-		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI3,
-		DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_MASK,
-		RDMA2_SOUT_DSI3
-	}, {
-		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI3,
-		DISP_REG_CONFIG_DSIO_SEL_IN, DSI3_SEL_IN_MASK,
-		DSI3_SEL_IN_RDMA2
-	}, {
-		DDP_COMPONENT_UFOE, DDP_COMPONENT_DSI0,
-		DISP_REG_CONFIG_DISP_UFOE_MOUT_EN, UFOE_MOUT_EN_DSI0,
-		UFOE_MOUT_EN_DSI0
-	}
+	MMSYS_ROUTE(BLS, 0, DSI, 0,
+		    DISP_REG_CONFIG_OUT_SEL, BLS_RDMA1_DSI_DPI_MASK,
+		    BLS_TO_DSI_RDMA1_TO_DPI1),
+	MMSYS_ROUTE(BLS, 0, DSI, 0,
+		    DISP_REG_CONFIG_DSI_SEL, DSI_SEL_IN_MASK,
+		    DSI_SEL_IN_BLS),
+	MMSYS_ROUTE(BLS, 0, DPI, 0,
+		    DISP_REG_CONFIG_OUT_SEL, BLS_RDMA1_DSI_DPI_MASK,
+		    BLS_TO_DPI_RDMA1_TO_DSI),
+	MMSYS_ROUTE(BLS, 0, DPI, 0,
+		    DISP_REG_CONFIG_DSI_SEL, DSI_SEL_IN_MASK,
+		    DSI_SEL_IN_RDMA),
+	MMSYS_ROUTE(BLS, 0, DPI, 0,
+		    DISP_REG_CONFIG_DPI_SEL, DPI_SEL_IN_MASK,
+		    DPI_SEL_IN_BLS),
+	MMSYS_ROUTE(GAMMA, 0, RDMA, 1,
+		    DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN, GAMMA_MOUT_EN_RDMA1,
+		    GAMMA_MOUT_EN_RDMA1),
+	MMSYS_ROUTE(OD, 0, RDMA, 0,
+		    DISP_REG_CONFIG_DISP_OD_MOUT_EN, OD_MOUT_EN_RDMA0,
+		    OD_MOUT_EN_RDMA0),
+	MMSYS_ROUTE(OD, 1, RDMA, 1,
+		    DISP_REG_CONFIG_DISP_OD_MOUT_EN, OD1_MOUT_EN_RDMA1,
+		    OD1_MOUT_EN_RDMA1),
+	MMSYS_ROUTE(OVL, 0, COLOR, 0,
+		    DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, OVL0_MOUT_EN_COLOR0,
+		    OVL0_MOUT_EN_COLOR0),
+	MMSYS_ROUTE(OVL, 0, COLOR, 0,
+		    DISP_REG_CONFIG_DISP_COLOR0_SEL_IN, COLOR0_SEL_IN_OVL0,
+		    COLOR0_SEL_IN_OVL0),
+	MMSYS_ROUTE(OVL, 0, RDMA, 0,
+		    DISP_REG_CONFIG_DISP_OVL_MOUT_EN, OVL_MOUT_EN_RDMA,
+		    OVL_MOUT_EN_RDMA),
+	MMSYS_ROUTE(OVL, 1, COLOR, 1,
+		    DISP_REG_CONFIG_DISP_OVL1_MOUT_EN, OVL1_MOUT_EN_COLOR1,
+		    OVL1_MOUT_EN_COLOR1),
+	MMSYS_ROUTE(OVL, 1, COLOR, 1,
+		    DISP_REG_CONFIG_DISP_COLOR1_SEL_IN, COLOR1_SEL_IN_OVL1,
+		    COLOR1_SEL_IN_OVL1),
+	MMSYS_ROUTE(RDMA, 0, DPI, 0,
+		    DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_MASK,
+		    RDMA0_SOUT_DPI0),
+	MMSYS_ROUTE(RDMA, 0, DPI, 1,
+		    DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_MASK,
+		    RDMA0_SOUT_DPI1),
+	MMSYS_ROUTE(RDMA, 0, DSI, 1,
+		    DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_MASK,
+		    RDMA0_SOUT_DSI1),
+	MMSYS_ROUTE(RDMA, 0, DSI, 2,
+		    DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_MASK,
+		    RDMA0_SOUT_DSI2),
+	MMSYS_ROUTE(RDMA, 0, DSI, 3,
+		    DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_MASK,
+		    RDMA0_SOUT_DSI3),
+	MMSYS_ROUTE(RDMA, 1, DPI, 0,
+		    DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_MASK,
+		    RDMA1_SOUT_DPI0),
+	MMSYS_ROUTE(RDMA, 1, DPI, 0,
+		    DISP_REG_CONFIG_DPI_SEL_IN, DPI0_SEL_IN_MASK,
+		    DPI0_SEL_IN_RDMA1),
+	MMSYS_ROUTE(RDMA, 1, DPI, 1,
+		    DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_MASK,
+		    RDMA1_SOUT_DPI1),
+	MMSYS_ROUTE(RDMA, 1, DPI, 1,
+		    DISP_REG_CONFIG_DPI_SEL_IN, DPI1_SEL_IN_MASK,
+		    DPI1_SEL_IN_RDMA1),
+	MMSYS_ROUTE(RDMA, 1, DSI, 0,
+		    DISP_REG_CONFIG_DSIE_SEL_IN, DSI0_SEL_IN_MASK,
+		    DSI0_SEL_IN_RDMA1),
+	MMSYS_ROUTE(RDMA, 1, DSI, 1,
+		    DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_MASK,
+		    RDMA1_SOUT_DSI1),
+	MMSYS_ROUTE(RDMA, 1, DSI, 1,
+		    DISP_REG_CONFIG_DSIO_SEL_IN, DSI1_SEL_IN_MASK,
+		    DSI1_SEL_IN_RDMA1),
+	MMSYS_ROUTE(RDMA, 1, DSI, 2,
+		    DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_MASK,
+		    RDMA1_SOUT_DSI2),
+	MMSYS_ROUTE(RDMA, 1, DSI, 2,
+		    DISP_REG_CONFIG_DSIE_SEL_IN, DSI2_SEL_IN_MASK,
+		    DSI2_SEL_IN_RDMA1),
+	MMSYS_ROUTE(RDMA, 1, DSI, 3,
+		    DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_MASK,
+		    RDMA1_SOUT_DSI3),
+	MMSYS_ROUTE(RDMA, 1, DSI, 3,
+		    DISP_REG_CONFIG_DSIO_SEL_IN, DSI3_SEL_IN_MASK,
+		    DSI3_SEL_IN_RDMA1),
+	MMSYS_ROUTE(RDMA, 2, DPI, 0,
+		    DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_MASK,
+		    RDMA2_SOUT_DPI0),
+	MMSYS_ROUTE(RDMA, 2, DPI, 0,
+		    DISP_REG_CONFIG_DPI_SEL_IN, DPI0_SEL_IN_MASK,
+		    DPI0_SEL_IN_RDMA2),
+	MMSYS_ROUTE(RDMA, 2, DPI, 1,
+		    DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_MASK,
+		    RDMA2_SOUT_DPI1),
+	MMSYS_ROUTE(RDMA, 2, DPI, 1,
+		    DISP_REG_CONFIG_DPI_SEL_IN, DPI1_SEL_IN_MASK,
+		    DPI1_SEL_IN_RDMA2),
+	MMSYS_ROUTE(RDMA, 2, DSI, 0,
+		    DISP_REG_CONFIG_DSIE_SEL_IN, DSI0_SEL_IN_MASK,
+		    DSI0_SEL_IN_RDMA2),
+	MMSYS_ROUTE(RDMA, 2, DSI, 1,
+		    DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_MASK,
+		    RDMA2_SOUT_DSI1),
+	MMSYS_ROUTE(RDMA, 2, DSI, 1,
+		    DISP_REG_CONFIG_DSIO_SEL_IN, DSI1_SEL_IN_MASK,
+		    DSI1_SEL_IN_RDMA2),
+	MMSYS_ROUTE(RDMA, 2, DSI, 2,
+		    DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_MASK,
+		    RDMA2_SOUT_DSI2),
+	MMSYS_ROUTE(RDMA, 2, DSI, 2,
+		    DISP_REG_CONFIG_DSIE_SEL_IN, DSI2_SEL_IN_MASK,
+		    DSI2_SEL_IN_RDMA2),
 };
 
 #endif /* __SOC_MEDIATEK_MTK_MMSYS_H */
-- 
2.54.0

