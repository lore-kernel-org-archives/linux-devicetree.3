Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0E6287254;
	Thu, 16 Apr 2026 03:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776309187; cv=none; b=Vz2jHPCj8qU7zSHU29SQC66Otf/yjsZ+apHNInOFVvloUq7mQOy8sQO07/GDPZ6S1ljKL26LBKSjyJjNf/005lKMLIP0+veFLIAEk1rByXCRER1lTUgcM1hAbFJZKVaddQooRF8WcPwSvfKdb/nDaPlkzY0AXMEz37w2LLF3tuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776309187; c=relaxed/simple;
	bh=NEyyAjmQwAYq5Vb7crtqYMbhTIlVRROQUfhYYQLL3HU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YYpSI72SmQxsy9QFDHdxCz10jlVcy5MMMfk60Q4u7Sc+1Abq/UOLV7KH3OeiN0MDG3RLeN4MNA7X2aRpz57+FIuV8lzk2b48/0a/I6KDLF3j4UKlr1Sq3MgSsL/vSN3o1iU5XqA+mQ/DLQXYLJmgGkIV7o1vbiRfg61QhBvZj2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=ZcFbJkxs; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZcFbJkxs"
X-UUID: 2bb13fde394211f19a16598d5ca7f8ec-20260416
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=g28kMD5efYgCFJ9Q0gAXGXxFV/Ye3vRJmUQmK6/TYiA=;
	b=ZcFbJkxs4+60gZiFA5ZQO1DSP7HNlzEMWJsqrXlLj9L0K12P386DG7pU/ZXMpBR6LR9vwqY1fnweyjwT+E4axmsxy9XLowXKDEe2fK0U6Nw7lvN2hX/RE4zqmfiEZs0496k/kGdvZOb40guiR9dFrEol9NfAWy2jZF3dmj+G8Sg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:08f88262-d0d9-49bc-b81c-451c40f407ef,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:7808fe94-f8ef-4ca8-bea0-143568f9ca1d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2bb13fde394211f19a16598d5ca7f8ec-20260416
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <xiaoshun.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 971040277; Thu, 16 Apr 2026 11:12:58 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 16 Apr 2026 11:12:57 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 16 Apr 2026 11:12:57 +0800
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
Subject: [PATCH v3 2/6] soc: mediatek: mtk-devapc: refine DEVAPC clock control
Date: Thu, 16 Apr 2026 11:12:05 +0800
Message-ID: <20260416031231.2932493-3-xiaoshun.xu@mediatek.com>
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

Because the new DEVAPC design, DEVAPC clock is controlled by
HW power domains, the control flow of DEVAPC clock is not
necessary, but to maintain compatibility with legacy ICs,
keep this part of code.

Signed-off-by: Xiaoshun Xu <xiaoshun.xu@mediatek.com>
---
 drivers/soc/mediatek/mtk-devapc.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-devapc.c
index c9e1401315ad..f54e310791e5 100644
--- a/drivers/soc/mediatek/mtk-devapc.c
+++ b/drivers/soc/mediatek/mtk-devapc.c
@@ -284,16 +284,28 @@ static int mtk_devapc_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	ctx->infra_clk = devm_clk_get_enabled(&pdev->dev, "devapc-infra-clock");
+	/*
+	 * The new design of DAPC clock is controlled by HW power domains,
+	 * making it unnecessary to provide the clock control driver.
+	 */
+	ctx->infra_clk = devm_clk_get_optional(&pdev->dev, "devapc-infra-clock");
 	if (IS_ERR(ctx->infra_clk)) {
-		ret = -EINVAL;
-		goto err;
+		dev_err(ctx->dev, "Cannot get devapc clock from CCF\n");
+		ctx->infra_clk = NULL;
+	} else {
+		if (clk_prepare_enable(ctx->infra_clk)) {
+			ret = -EINVAL;
+			goto err;
+		}
 	}
 
 	ret = devm_request_irq(&pdev->dev, devapc_irq, devapc_violation_irq,
-			       IRQF_TRIGGER_NONE, "devapc", ctx);
-	if (ret)
+			       IRQF_TRIGGER_NONE | IRQF_SHARED, "devapc", ctx);
+	if (ret) {
+		if (ctx->infra_clk)
+			clk_disable_unprepare(ctx->infra_clk);
 		goto err;
+	}
 
 	platform_set_drvdata(pdev, ctx);
 
@@ -311,6 +323,9 @@ static void mtk_devapc_remove(struct platform_device *pdev)
 	struct mtk_devapc_context *ctx = platform_get_drvdata(pdev);
 
 	stop_devapc(ctx);
+
+	clk_disable_unprepare(ctx->infra_clk);
+
 	iounmap(ctx->infra_base);
 }
 
-- 
2.45.2

