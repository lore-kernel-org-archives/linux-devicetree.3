Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2FC19CD03;
	Thu, 16 Apr 2026 03:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776309184; cv=none; b=kj/nRLBZ+7VyHD3yHv2F4TLveAFiAGJly/7095UNHKYsxNrDf9whXTKBoBedj3fyVrLhbvXPt9v46SCuGNi1WkQYwarudF5Y3Zh0KY/VEb8jOecPPctsSfGJ8EiIejiEa1TTZnIkQ2QiGFaPCL0oRYR9EIbu6WuJnHJRaNL+BX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776309184; c=relaxed/simple;
	bh=JWhB/mUsitTZ+rEusPMKJr4sDRE9SYuurfB+xzE3YOQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jYk0LVEQCQGP+AEn7bth+y9aA0wX7N9O8holZFn8zyiHVgJjyFFIanc0z2oiEf9jGlTjnJXZTzkqr4pse2F4PHKw6GnMcrRHdRj/r8vGxjs275oKQbcwIxwu+Q34GvvIgNXCQMz0c6CO89Y7ez6ZUF45CHCdoo99hiRbWSxTL6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=iZDTkBws; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="iZDTkBws"
X-UUID: 2b29e3b8394211f1ae70033691e9ac7d-20260416
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=TxCeoHdWzESDHn8WGwcrtcx5Txqt/2sN3lNUQ8ms0l0=;
	b=iZDTkBwsZ8M1Pf3pM9Eb3kfNcLOLPHt0ijNa+to94J5hy7LpLcF/YcbBxuIwQ0i1uJPxxknVK6e/hgSe0rEWbsYJ7M4eE9Yf+fWRmWJFA+GQBNF1rKwlh5VVSPhTUQOh1wOKPfTU30RScPLdYMhY2bs9OhFw0tG60mBKNmxsBhE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:9c02df0c-6dae-49fe-8aba-7746a0160133,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:ef95eb24-cb5c-4236-a89a-9a7fb20c9bc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2b29e3b8394211f1ae70033691e9ac7d-20260416
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <xiaoshun.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 322830716; Thu, 16 Apr 2026 11:12:57 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 16 Apr 2026 11:12:55 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 16 Apr 2026 11:12:55 +0800
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
Subject: [PATCH v3 1/6] soc: mediatek: mtk-devapc: refine devapc interrupt handler
Date: Thu, 16 Apr 2026 11:12:04 +0800
Message-ID: <20260416031231.2932493-2-xiaoshun.xu@mediatek.com>
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

Because the violation IRQ uses a while loop, it might cause the
system to remain in the interrupt handler indefinitely. We are
currently optimizing this part of the process to handle only 20
violations for debug violation issues, and then exit the loop

Signed-off-by: Xiaoshun Xu <xiaoshun.xu@mediatek.com>
---
 drivers/soc/mediatek/mtk-devapc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-devapc.c
index f54c966138b5..c9e1401315ad 100644
--- a/drivers/soc/mediatek/mtk-devapc.c
+++ b/drivers/soc/mediatek/mtk-devapc.c
@@ -12,6 +12,7 @@
 #include <linux/of_irq.h>
 #include <linux/of_address.h>
 
+#define MAX_VIO_NUM 20
 #define VIO_MOD_TO_REG_IND(m)	((m) / 32)
 #define VIO_MOD_TO_REG_OFF(m)	((m) % 32)
 
@@ -188,13 +189,18 @@ static void devapc_extract_vio_dbg(struct mtk_devapc_context *ctx)
  */
 static irqreturn_t devapc_violation_irq(int irq_number, void *data)
 {
+	u32 vio_num = 0;
 	struct mtk_devapc_context *ctx = data;
 
-	while (devapc_sync_vio_dbg(ctx))
+	mask_module_irq(ctx, true);
+
+	for (vio_num = 0; (vio_num < MAX_VIO_NUM) && (devapc_sync_vio_dbg(ctx)); ++vio_num)
 		devapc_extract_vio_dbg(ctx);
 
 	clear_vio_status(ctx);
 
+	mask_module_irq(ctx, false);
+
 	return IRQ_HANDLED;
 }
 
-- 
2.45.2

