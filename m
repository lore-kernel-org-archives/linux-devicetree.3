Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAF82BE035;
	Thu, 16 Apr 2026 03:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776309190; cv=none; b=AB79QU+sCPkUeRfeNwhgvayez3yfjRqun3ypok3UK/fwtQuVtCMrVek5kco9cnpGajlAJyyfe3YEtIs7dAVO58mnraeCQILIRsL8fUh7GslHH45gp5jLHUlH7Qghs+OG4hmI8Hm58Ly6MYUk0EKgqV02rp50SVoVssmHLRtaPVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776309190; c=relaxed/simple;
	bh=wRlgGDoQH4ATmostgEt71PgObOuV3jJsZpYhTP/7rhs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uRuIp/nQaDYvstl1NB25a3wdBFRzzin0pOidMEIPjgr1qSSr0U8xeOAqzCxix/42H/lJRodN9cWAY454ivQJzSDi8hk2TYPP4Uyr6FxfUitgQm/7Nn330p0np25U91ICXqpHJyEIOxnhntEDiO21NRjjZgPHzhlMlG/euwIG3xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=p3Pmn51d; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="p3Pmn51d"
X-UUID: 2ebb9e68394211f1ae70033691e9ac7d-20260416
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=B68aimr3MW+DGfkU890XtByEsPIhj3U3IP740Hbae8M=;
	b=p3Pmn51dGRUQJQuYYTRyO6g1BaNMvG1VJbqKGD4oivDga+vr/TNePNHN0alQuIXKoarYmFV9ZGr0sx8Xhr5+OSMnzQNFrauSS5l4USCVmcj0c0zjrzPHcdC3XAD9EbGaGj51EjnDnIVoRZQ263O7iQPZNYG8TYCiIe+HE2py5Zw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:a88cd79c-6cb3-4d32-90a0-ff40e1fb7dda,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:3996eb24-cb5c-4236-a89a-9a7fb20c9bc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2ebb9e68394211f1ae70033691e9ac7d-20260416
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <xiaoshun.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 741846319; Thu, 16 Apr 2026 11:13:03 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 16 Apr 2026 11:13:02 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 16 Apr 2026 11:13:02 +0800
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
Subject: [PATCH v3 5/6] soc: mediatek: mtk-devapc: Add support for MT8196 DEVAPC
Date: Thu, 16 Apr 2026 11:12:08 +0800
Message-ID: <20260416031231.2932493-6-xiaoshun.xu@mediatek.com>
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

Add support for MT8196 DEVAPC, MT8196 DEVAPC debug registers are
version 3 and add compatible for MT8196

Signed-off-by: Xiaoshun Xu <xiaoshun.xu@mediatek.com>
---
 drivers/soc/mediatek/mtk-devapc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-devapc.c
index 824b49613c5a..0f828028bdb4 100644
--- a/drivers/soc/mediatek/mtk-devapc.c
+++ b/drivers/soc/mediatek/mtk-devapc.c
@@ -324,6 +324,11 @@ static const struct mtk_devapc_data devapc_mt8189 = {
 	.regs_ofs = &devapc_regs_ofs_ver3,
 };
 
+static const struct mtk_devapc_data devapc_mt8196 = {
+	.version = 3,
+	.regs_ofs = &devapc_regs_ofs_ver3,
+};
+
 static const struct of_device_id mtk_devapc_dt_match[] = {
 	{
 		.compatible = "mediatek,mt6779-devapc",
@@ -334,6 +339,9 @@ static const struct of_device_id mtk_devapc_dt_match[] = {
 	}, {
 		.compatible = "mediatek,mt8189-devapc",
 		.data = &devapc_mt8189,
+	}, {
+		.compatible = "mediatek,mt8196-devapc",
+		.data = &devapc_mt8196,
 	}, {
 	},
 };
-- 
2.45.2

