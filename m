Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1C72949E0;
	Mon, 27 Apr 2026 07:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777273528; cv=none; b=p+x3Uy4TtbMTPSWi0c0iwT7McarAe12oyrT7VDUNYP/3WJDz867LmtL9zJjzF0ng6zRqZs4zSpn25tNNHUNZzoRiy1O5m5WTk3gf79WXMW+G+Ap4vYAIGJJ96KMaVYuLmC4Ks9KeuTC57thCToQ8f25E9ksA8Un/EWoV5KVBsNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777273528; c=relaxed/simple;
	bh=bbtz755NrT5fNJhbUWQPauq/Rx+n99Zj/gF9NgEajUU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fWYWnFmBxlt8G5rADuX4PadQG8zawaGwchFpJLlSjE0eQ/3O8utcjJ4iYAEbtESAu5ZLioLP7t/BIKXyl+/mFk8jmBFxf/dV0G+dzyfvsNkIWTNhYGwV1aE1nMOs2xPPfJgdn50xk9JVJjeJFUk+SSz9eP4FdDsdBvKkYEfc6ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=ay9dd/bd; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ay9dd/bd"
X-UUID: 73ffcda0420711f19a16598d5ca7f8ec-20260427
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=BY/CeKw/Cj7EVqerAhBT/2EnODNIlNfrNdkGy5aGuvs=;
	b=ay9dd/bd6CzZrqLPp8YvbPwEIUNWqWX/gS45lHfFhrggmL/Cbjad/vHfvQdPe09s/5fgwCOqfCMydN2PKNMuqINzZN460bHLdPqZ7iizRb1kQ20MOFXje0nFMGlH0E/ca1ZSWWCkCl9alcNYPJxpa3qym2G0S+zUTZDem2VTDAg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:6fa11e13-5781-4d61-bfba-e8b236b70d08,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:8f187fbe-65a8-4b41-ac18-3671578a914d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 73ffcda0420711f19a16598d5ca7f8ec-20260427
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <zhengnan.chen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1982675891; Mon, 27 Apr 2026 15:05:20 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 27 Apr 2026 15:05:18 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 27 Apr 2026 15:05:18 +0800
From: mtk20898 <zhengnan.chen@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Zhengnan Chen
	<zhengnan.chen@mediatek.com>
Subject: [RESEND,v2 2/2] memory: mtk-smi: Add mt8189 support
Date: Mon, 27 Apr 2026 15:04:29 +0800
Message-ID: <20260427070444.20247-3-zhengnan.chen@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260427070444.20247-1-zhengnan.chen@mediatek.com>
References: <20260427070444.20247-1-zhengnan.chen@mediatek.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Zhengnan Chen <zhengnan.chen@mediatek.com>

Add the necessary platform data and ostdl setting to enable support
for mt8189 smi.

Signed-off-by: Zhengnan Chen <zhengnan.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/memory/mtk-smi.c | 44 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index aaeba8ab211e..f2d5462af681 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -401,6 +401,30 @@ static const u8 mtk_smi_larb_mt8188_ostd[][SMI_LARB_PORT_NR_MAX] = {
 	[25] = {0x01},
 };
 
+static const u8 mtk_smi_larb_mt8189_ostd[][SMI_LARB_PORT_NR_MAX] = {
+	[0] = {0x8, 0x20, 0x20, 0x20, 0x20, 0x20, 0x10, 0x0,},
+	[1] = {0x8, 0x20, 0x20, 0x20, 0x20, 0x20, 0x10, 0x0,},
+	[2] = {0x7, 0x7, 0x4, 0x4, 0x0, 0x0, 0x2, 0x2, 0x7, 0x7, 0x0,},
+	[4] = {0x2F, 0x1E, 0x9, 0x1, 0x1, 0x1, 0x1, 0x2, 0x2, 0x5, 0x1, 0x17,},
+	[7] = {0x20, 0x2, 0x1, 0x1, 0x1, 0x4, 0x2, 0x1, 0x1, 0x2, 0x3, 0x2,
+	       0xA, 0xF, 0x4, 0x6, 0x5, 0x1,},
+	[9] = {0x6, 0x3, 0xC, 0x6, 0x1, 0x4, 0x3, 0x1, 0x2, 0x4, 0x5, 0x2,
+	       0x4, 0x2, 0x3, 0xB, 0x1, 0x4, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1,
+	       0x1, 0x1,},
+	[11] = {0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1,
+		0x1, 0x1, 0x1, 0xB, 0x1, 0x4, 0x6, 0x5, 0x6, 0x1, 0x5, 0x2,
+		0x9, 0x5,},
+	[13] = {0x2, 0x8, 0x8, 0x8, 0x4, 0x4, 0x4, 0x4, 0x4, 0xE, 0x4, 0x1,
+		0x6, 0x6, 0x2,},
+	[14] = {0x1, 0x1, 0x1, 0x20, 0xE, 0x4, 0x8, 0x8, 0x6, 0x4,},
+	[16] = {0x1E, 0xC, 0x2, 0x8, 0xE, 0x2, 0x1E, 0x10, 0x4, 0x2, 0x2, 0x2,
+		0x2, 0x2, 0x4, 0x2, 0x4,},
+	[17] = {0x1E, 0xC, 0x2, 0x8, 0xE, 0x2, 0x1E, 0x10, 0x4, 0x2, 0x2, 0x2,
+		0x2, 0x2, 0x4, 0x2, 0x4,},
+	[19] = {0x2, 0x1, 0x3, 0x1,},
+	[20] = {0x7, 0x7, 0x3, 0x3, 0x1, 0x1,},
+};
+
 static const u8 mtk_smi_larb_mt8192_ostd[][SMI_LARB_PORT_NR_MAX] = {
 	[0] = {0x2, 0x2, 0x28, 0xa, 0xc, 0x28,},
 	[1] = {0x2, 0x2, 0x18, 0x18, 0x18, 0xa, 0xc, 0x28,},
@@ -533,6 +557,13 @@ static const struct mtk_smi_larb_gen mtk_smi_larb_mt8188 = {
 	.ostd		            = mtk_smi_larb_mt8188_ostd,
 };
 
+static const struct mtk_smi_larb_gen mtk_smi_larb_mt8189 = {
+	.config_port                = mtk_smi_larb_config_port_gen2_general,
+	.flags_general	            = MTK_SMI_FLAG_THRT_UPDATE | MTK_SMI_FLAG_SW_FLAG |
+				      MTK_SMI_FLAG_SLEEP_CTL | MTK_SMI_FLAG_CFG_PORT_SEC_CTL,
+	.ostd		            = mtk_smi_larb_mt8189_ostd,
+};
+
 static const struct mtk_smi_larb_gen mtk_smi_larb_mt8192 = {
 	.config_port                = mtk_smi_larb_config_port_gen2_general,
 	.ostd			    = mtk_smi_larb_mt8192_ostd,
@@ -556,6 +587,7 @@ static const struct of_device_id mtk_smi_larb_of_ids[] = {
 	{.compatible = "mediatek,mt8183-smi-larb", .data = &mtk_smi_larb_mt8183},
 	{.compatible = "mediatek,mt8186-smi-larb", .data = &mtk_smi_larb_mt8186},
 	{.compatible = "mediatek,mt8188-smi-larb", .data = &mtk_smi_larb_mt8188},
+	{.compatible = "mediatek,mt8189-smi-larb", .data = &mtk_smi_larb_mt8189},
 	{.compatible = "mediatek,mt8192-smi-larb", .data = &mtk_smi_larb_mt8192},
 	{.compatible = "mediatek,mt8195-smi-larb", .data = &mtk_smi_larb_mt8195},
 	{}
@@ -808,6 +840,16 @@ static const struct mtk_smi_common_plat mtk_smi_common_mt8188_vpp = {
 	.init     = mtk_smi_common_mt8195_init,
 };
 
+static const struct mtk_smi_common_plat mtk_smi_common_mt8189 = {
+	.type     = MTK_SMI_GEN2,
+	.bus_sel  = F_MMU1_LARB(1) | F_MMU1_LARB(3) | F_MMU1_LARB(5) |
+		    F_MMU1_LARB(7),
+};
+
+static const struct mtk_smi_common_plat mtk_smi_sub_common_mt8189 = {
+	.type     = MTK_SMI_GEN2_SUB_COMM,
+};
+
 static const struct mtk_smi_common_plat mtk_smi_common_mt8192 = {
 	.type     = MTK_SMI_GEN2,
 	.has_gals = true,
@@ -852,6 +894,8 @@ static const struct of_device_id mtk_smi_common_of_ids[] = {
 	{.compatible = "mediatek,mt8186-smi-common", .data = &mtk_smi_common_mt8186},
 	{.compatible = "mediatek,mt8188-smi-common-vdo", .data = &mtk_smi_common_mt8188_vdo},
 	{.compatible = "mediatek,mt8188-smi-common-vpp", .data = &mtk_smi_common_mt8188_vpp},
+	{.compatible = "mediatek,mt8189-smi-common", .data = &mtk_smi_common_mt8189},
+	{.compatible = "mediatek,mt8189-smi-sub-common", .data = &mtk_smi_sub_common_mt8189},
 	{.compatible = "mediatek,mt8192-smi-common", .data = &mtk_smi_common_mt8192},
 	{.compatible = "mediatek,mt8195-smi-common-vdo", .data = &mtk_smi_common_mt8195_vdo},
 	{.compatible = "mediatek,mt8195-smi-common-vpp", .data = &mtk_smi_common_mt8195_vpp},
-- 
2.46.0

