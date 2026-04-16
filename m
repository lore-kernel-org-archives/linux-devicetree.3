Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F26F27E1D7;
	Thu, 16 Apr 2026 03:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776309185; cv=none; b=jABGOPlPPYyY+J/mJS+VbRG0uD0kN0OoW2XvD79rR+PLABh8QXBOwaAHuzYPTN7q+zoXeSyhUVES6QjZzSyhw27zxSlQVgT1buz1noYsTeFLuNQ7cJg7KoAJLb85ML8CAFZRjXT6kdlSZDEESD0cAghIPTWd+zPmYO7dtiSCGuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776309185; c=relaxed/simple;
	bh=dr2PkjnvohJN7JebZZozKlootPhgCZ9xhAWH6aZfnTI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uL4TIPBMLUBFLNs9IdSvgBDrcyPCg/GfJK2SDtM/YTmUxtAliG96Swt0Al18P4dWNFOK0Fa7zjNL3wLfFeiUKGCDRY2fpHZHHv1hyPol1YzsprFzvYSwBKQ3ahZM4S+xgPKyJ3Db7/O91UuLFcQGzQtSFUvUapfgd6IbGACd27k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Hul3MvFe; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Hul3MvFe"
X-UUID: 2c76044a394211f19a16598d5ca7f8ec-20260416
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=vnQpuz4ObajpZtEzxwHOEg+2V5RBVAL3Ci5i/ZktHq4=;
	b=Hul3MvFegcHVlQji76GcwYsMjk3DBlBJkdM54rstdkx7vL4MfuzRKsug0x99ZhVr1wnvgedPxyBp5+ngjVHsTVxR7d73NYItbIreid5uXAGSc4/sholeiwruroaUUHa8ic9vpXtk6Y4R56s3ujEO/5YLEkNlVUBhhaJA+zO7WzY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:0b86a085-aed2-4c12-a02e-814b7809b6c6,IP:0,U
	RL:0,TC:0,Content:0,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-20
X-CID-META: VersionHash:e7bac3a,CLOUDID:4fb2ead5-060f-4ecc-9ee0-121eeeb4a682,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:1,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2c76044a394211f19a16598d5ca7f8ec-20260416
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <xiaoshun.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1483897454; Thu, 16 Apr 2026 11:13:00 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 16 Apr 2026 11:12:58 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 16 Apr 2026 11:12:58 +0800
From: Xiaoshun Xu <xiaoshun.xu@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Xiaoshun Xu
	<xiaoshun.xu@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Sirius Wang <sirius.wang@mediatek.com>, Vince-wl Liu
	<vince-wl.liu@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 3/6] soc: mediatek: mtk-devapc: Add support for MT8189 DEVAPC
Date: Thu, 16 Apr 2026 11:12:06 +0800
Message-ID: <20260416031231.2932493-4-xiaoshun.xu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260416031231.2932493-1-xiaoshun.xu@mediatek.com>
References: <20260416031231.2932493-1-xiaoshun.xu@mediatek.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add support for MT8189 DEVAPC, DEVAPC debug registers have new version,
so refine the structure of devapc_regs_ofs_xxxx to devapc_regs_ofs_verX,
and rename the infra_base to base in mtk_devapc_context because devapc
not only access the infra_base to dump debug information when violation
happens

Signed-off-by: Xiaoshun Xu <xiaoshun.xu@mediatek.com>
---
 drivers/soc/mediatek/mtk-devapc.c | 171 +++++++++++++++++++++++-------
 1 file changed, 134 insertions(+), 37 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-devapc.c
index f54e310791e5..824b49613c5a 100644
--- a/drivers/soc/mediatek/mtk-devapc.c
+++ b/drivers/soc/mediatek/mtk-devapc.c
@@ -27,9 +27,19 @@ struct mtk_devapc_vio_dbgs {
 			u32 addr_h:4;
 			u32 resv:4;
 		} dbg0_bits;
+
+		struct {
+			u32 dmnid:6;
+			u32 vio_w:1;
+			u32 vio_r:1;
+			u32 addr_h:4;
+			u32 resv:20;
+		} dbg0_bits_ver2;
 	};
 
 	u32 vio_dbg1;
+	u32 vio_dbg2;
+	u32 vio_dbg3;
 };
 
 struct mtk_devapc_regs_ofs {
@@ -38,6 +48,8 @@ struct mtk_devapc_regs_ofs {
 	u32 vio_sta_offset;
 	u32 vio_dbg0_offset;
 	u32 vio_dbg1_offset;
+	u32 vio_dbg2_offset;
+	u32 vio_dbg3_offset;
 	u32 apc_con_offset;
 	u32 vio_shift_sta_offset;
 	u32 vio_shift_sel_offset;
@@ -45,16 +57,20 @@ struct mtk_devapc_regs_ofs {
 };
 
 struct mtk_devapc_data {
-	/* numbers of violation index */
-	u32 vio_idx_num;
+	u32 version;
+	/* Default numbers of violation index */
+	u32 default_vio_idx_num;
 	const struct mtk_devapc_regs_ofs *regs_ofs;
 };
 
 struct mtk_devapc_context {
 	struct device *dev;
-	void __iomem *infra_base;
+	void __iomem *base;
 	struct clk *infra_clk;
 	const struct mtk_devapc_data *data;
+
+	/* numbers of violation index */
+	u32 vio_idx_num;
 };
 
 static void clear_vio_status(struct mtk_devapc_context *ctx)
@@ -62,12 +78,12 @@ static void clear_vio_status(struct mtk_devapc_context *ctx)
 	void __iomem *reg;
 	int i;
 
-	reg = ctx->infra_base + ctx->data->regs_ofs->vio_sta_offset;
+	reg = ctx->base + ctx->data->regs_ofs->vio_sta_offset;
 
-	for (i = 0; i < VIO_MOD_TO_REG_IND(ctx->data->vio_idx_num) - 1; i++)
+	for (i = 0; i < VIO_MOD_TO_REG_IND(ctx->vio_idx_num - 1); i++)
 		writel(GENMASK(31, 0), reg + 4 * i);
 
-	writel(GENMASK(VIO_MOD_TO_REG_OFF(ctx->data->vio_idx_num) - 1, 0),
+	writel(GENMASK(VIO_MOD_TO_REG_OFF(ctx->vio_idx_num - 1), 0),
 	       reg + 4 * i);
 }
 
@@ -77,22 +93,22 @@ static void mask_module_irq(struct mtk_devapc_context *ctx, bool mask)
 	u32 val;
 	int i;
 
-	reg = ctx->infra_base + ctx->data->regs_ofs->vio_mask_offset;
+	reg = ctx->base + ctx->data->regs_ofs->vio_mask_offset;
 
 	if (mask)
 		val = GENMASK(31, 0);
 	else
 		val = 0;
 
-	for (i = 0; i < VIO_MOD_TO_REG_IND(ctx->data->vio_idx_num) - 1; i++)
+	for (i = 0; i < VIO_MOD_TO_REG_IND(ctx->vio_idx_num - 1); i++)
 		writel(val, reg + 4 * i);
 
 	val = readl(reg + 4 * i);
 	if (mask)
-		val |= GENMASK(VIO_MOD_TO_REG_OFF(ctx->data->vio_idx_num) - 1,
+		val |= GENMASK(VIO_MOD_TO_REG_OFF(ctx->vio_idx_num - 1),
 			       0);
 	else
-		val &= ~GENMASK(VIO_MOD_TO_REG_OFF(ctx->data->vio_idx_num) - 1,
+		val &= ~GENMASK(VIO_MOD_TO_REG_OFF(ctx->vio_idx_num - 1),
 				0);
 
 	writel(val, reg + 4 * i);
@@ -119,11 +135,11 @@ static int devapc_sync_vio_dbg(struct mtk_devapc_context *ctx)
 	int ret;
 	u32 val;
 
-	pd_vio_shift_sta_reg = ctx->infra_base +
+	pd_vio_shift_sta_reg = ctx->base +
 			       ctx->data->regs_ofs->vio_shift_sta_offset;
-	pd_vio_shift_sel_reg = ctx->infra_base +
+	pd_vio_shift_sel_reg = ctx->base +
 			       ctx->data->regs_ofs->vio_shift_sel_offset;
-	pd_vio_shift_con_reg = ctx->infra_base +
+	pd_vio_shift_con_reg = ctx->base +
 			       ctx->data->regs_ofs->vio_shift_con_offset;
 
 	/* Find the minimum shift group which has violation */
@@ -134,7 +150,7 @@ static int devapc_sync_vio_dbg(struct mtk_devapc_context *ctx)
 	min_shift_group = __ffs(val);
 
 	/* Assign the group to sync */
-	writel(0x1 << min_shift_group, pd_vio_shift_sel_reg);
+	writel(BIT(min_shift_group), pd_vio_shift_sel_reg);
 
 	/* Start syncing */
 	writel(0x1, pd_vio_shift_con_reg);
@@ -150,7 +166,7 @@ static int devapc_sync_vio_dbg(struct mtk_devapc_context *ctx)
 	writel(0x0, pd_vio_shift_con_reg);
 
 	/* Write clear */
-	writel(0x1 << min_shift_group, pd_vio_shift_sta_reg);
+	writel(BIT(min_shift_group), pd_vio_shift_sta_reg);
 
 	return true;
 }
@@ -164,22 +180,52 @@ static void devapc_extract_vio_dbg(struct mtk_devapc_context *ctx)
 	struct mtk_devapc_vio_dbgs vio_dbgs;
 	void __iomem *vio_dbg0_reg;
 	void __iomem *vio_dbg1_reg;
+	void __iomem *vio_dbg2_reg;
+	void __iomem *vio_dbg3_reg;
+	u32 vio_addr_l, vio_addr_h, bus_id, domain_id;
+	u32 vio_w, vio_r;
+	u64 vio_addr;
 
-	vio_dbg0_reg = ctx->infra_base + ctx->data->regs_ofs->vio_dbg0_offset;
-	vio_dbg1_reg = ctx->infra_base + ctx->data->regs_ofs->vio_dbg1_offset;
+	vio_dbg0_reg = ctx->base + ctx->data->regs_ofs->vio_dbg0_offset;
+	vio_dbg1_reg = ctx->base + ctx->data->regs_ofs->vio_dbg1_offset;
+	vio_dbg2_reg = ctx->base + ctx->data->regs_ofs->vio_dbg2_offset;
+	vio_dbg3_reg = ctx->base + ctx->data->regs_ofs->vio_dbg3_offset;
 
 	vio_dbgs.vio_dbg0 = readl(vio_dbg0_reg);
 	vio_dbgs.vio_dbg1 = readl(vio_dbg1_reg);
+	if (ctx->data->version >= 2U)
+		vio_dbgs.vio_dbg2 = readl(vio_dbg2_reg);
+	if (ctx->data->version == 3U)
+		vio_dbgs.vio_dbg3 = readl(vio_dbg3_reg);
+
+	if (ctx->data->version == 1U) {
+		/* arch version 1 */
+		bus_id = vio_dbgs.dbg0_bits.mstid;
+		vio_addr = vio_dbgs.vio_dbg1;
+		domain_id = vio_dbgs.dbg0_bits.dmnid;
+		vio_w = vio_dbgs.dbg0_bits.vio_w;
+		vio_r = vio_dbgs.dbg0_bits.vio_r;
+	} else {
+		/* arch version 2 & 3 */
+		bus_id = vio_dbgs.vio_dbg1;
+
+		vio_addr_l = vio_dbgs.vio_dbg2;
+		vio_addr_h = ctx->data->version == 2U ? vio_dbgs.dbg0_bits_ver2.addr_h :
+							vio_dbgs.vio_dbg3;
+		vio_addr = ((u64)vio_addr_h << 32) + vio_addr_l;
+		domain_id = vio_dbgs.dbg0_bits_ver2.dmnid;
+		vio_w = vio_dbgs.dbg0_bits_ver2.vio_w;
+		vio_r = vio_dbgs.dbg0_bits_ver2.vio_r;
+	}
 
 	/* Print violation information */
-	if (vio_dbgs.dbg0_bits.vio_w)
+	if (vio_w)
 		dev_info(ctx->dev, "Write Violation\n");
-	else if (vio_dbgs.dbg0_bits.vio_r)
+	else if (vio_r)
 		dev_info(ctx->dev, "Read Violation\n");
 
-	dev_info(ctx->dev, "Bus ID:0x%x, Dom ID:0x%x, Vio Addr:0x%x\n",
-		 vio_dbgs.dbg0_bits.mstid, vio_dbgs.dbg0_bits.dmnid,
-		 vio_dbgs.vio_dbg1);
+	dev_info(ctx->dev, "Bus ID:0x%x, Dom ID:0x%x, Vio Addr:0x%llx\n",
+		 bus_id, domain_id, vio_addr);
 }
 
 /*
@@ -209,7 +255,8 @@ static irqreturn_t devapc_violation_irq(int irq_number, void *data)
  */
 static void start_devapc(struct mtk_devapc_context *ctx)
 {
-	writel(BIT(31), ctx->infra_base + ctx->data->regs_ofs->apc_con_offset);
+
+	writel(BIT(31), ctx->base + ctx->data->regs_ofs->apc_con_offset);
 
 	mask_module_irq(ctx, false);
 }
@@ -221,28 +268,60 @@ static void stop_devapc(struct mtk_devapc_context *ctx)
 {
 	mask_module_irq(ctx, true);
 
-	writel(BIT(2), ctx->infra_base + ctx->data->regs_ofs->apc_con_offset);
+	writel(BIT(2), ctx->base + ctx->data->regs_ofs->apc_con_offset);
 }
 
-static const struct mtk_devapc_regs_ofs devapc_regs_ofs_mt6779 = {
+static const struct mtk_devapc_regs_ofs devapc_regs_ofs_ver1 = {
+	.vio_mask_offset = 0x0,
+	.vio_sta_offset = 0x400,
+	.vio_dbg0_offset = 0x900,
+	.vio_dbg1_offset = 0x904,
+	.apc_con_offset = 0xf00,
+	.vio_shift_sta_offset = 0xf10,
+	.vio_shift_sel_offset = 0xf14,
+	.vio_shift_con_offset = 0xf20,
+};
+
+static const struct mtk_devapc_regs_ofs devapc_regs_ofs_ver2 = {
 	.vio_mask_offset = 0x0,
 	.vio_sta_offset = 0x400,
 	.vio_dbg0_offset = 0x900,
 	.vio_dbg1_offset = 0x904,
-	.apc_con_offset = 0xF00,
-	.vio_shift_sta_offset = 0xF10,
-	.vio_shift_sel_offset = 0xF14,
-	.vio_shift_con_offset = 0xF20,
+	.vio_dbg2_offset = 0x908,
+	.apc_con_offset = 0xf00,
+	.vio_shift_sta_offset = 0xf20,
+	.vio_shift_sel_offset = 0xf30,
+	.vio_shift_con_offset = 0xf10,
+};
+
+static const struct mtk_devapc_regs_ofs devapc_regs_ofs_ver3 = {
+	.vio_mask_offset = 0x0,
+	.vio_sta_offset = 0x400,
+	.vio_dbg0_offset = 0x900,
+	.vio_dbg1_offset = 0x904,
+	.vio_dbg2_offset = 0x908,
+	.vio_dbg3_offset = 0x90c,
+	.apc_con_offset = 0xf00,
+	.vio_shift_sta_offset = 0xf20,
+	.vio_shift_sel_offset = 0xf30,
+	.vio_shift_con_offset = 0xf10,
 };
 
 static const struct mtk_devapc_data devapc_mt6779 = {
-	.vio_idx_num = 511,
-	.regs_ofs = &devapc_regs_ofs_mt6779,
+	.version = 1,
+	.default_vio_idx_num = 511,
+	.regs_ofs = &devapc_regs_ofs_ver1,
 };
 
 static const struct mtk_devapc_data devapc_mt8186 = {
-	.vio_idx_num = 519,
-	.regs_ofs = &devapc_regs_ofs_mt6779,
+	.version = 1,
+	.default_vio_idx_num = 519,
+	.regs_ofs = &devapc_regs_ofs_ver1,
+};
+
+static const struct mtk_devapc_data devapc_mt8189 = {
+	.version = 3,
+	.regs_ofs = &devapc_regs_ofs_ver3,
 };
 
 static const struct of_device_id mtk_devapc_dt_match[] = {
@@ -252,6 +331,9 @@ static const struct of_device_id mtk_devapc_dt_match[] = {
 	}, {
 		.compatible = "mediatek,mt8186-devapc",
 		.data = &devapc_mt8186,
+	}, {
+		.compatible = "mediatek,mt8189-devapc",
+		.data = &devapc_mt8189,
 	}, {
 	},
 };
@@ -274,9 +356,24 @@ static int mtk_devapc_probe(struct platform_device *pdev)
 	ctx->data = of_device_get_match_data(&pdev->dev);
 	ctx->dev = &pdev->dev;
 
-	ctx->infra_base = of_iomap(node, 0);
-	if (!ctx->infra_base)
+	ctx->base = of_iomap(node, 0);
+	if (!ctx->base) {
+		dev_err(ctx->dev, "Failed to map devapc registers\n");
 		return -EINVAL;
+	}
+
+	/*
+	 * Set effective vio_idx_num from default value.
+	 * If vio_idx_num is 0, get the info from DT.
+	 */
+	ctx->vio_idx_num = ctx->data->default_vio_idx_num;
+	if (ctx->vio_idx_num == 0)
+		if (of_property_read_u32(node,
+					 "vio-idx-num",
+					 &ctx->vio_idx_num)) {
+			ret = -EINVAL;
+			goto err;
+		}
 
 	devapc_irq = irq_of_parse_and_map(node, 0);
 	if (!devapc_irq) {
@@ -314,7 +411,7 @@ static int mtk_devapc_probe(struct platform_device *pdev)
 	return 0;
 
 err:
-	iounmap(ctx->infra_base);
+	iounmap(ctx->base);
 	return ret;
 }
 
@@ -326,7 +423,7 @@ static void mtk_devapc_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(ctx->infra_clk);
 
-	iounmap(ctx->infra_base);
+	iounmap(ctx->base);
 }
 
 static struct platform_driver mtk_devapc_driver = {
-- 
2.45.2

