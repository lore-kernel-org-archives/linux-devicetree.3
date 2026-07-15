Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D25D47F2D0;
	Wed, 15 Jul 2026 14:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784125847; cv=none; b=Z55e1CZaXlV/yOHipAgvChK50c+YjimrRxfLykSioGKzQzNZKLdaeTyuzdWtuD0fL+MdKMVFmgOjVpXwmiAjLLezPvu8D0gCg4HDIUZ4KM8q+bTp8Ci4NiiCLGFEJCC5VmHJORoaARsOtEcFlD4nenBbLTYQ4J8si7YwDpz2UDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784125847; c=relaxed/simple;
	bh=905IDA0YMzXhZN4E+47hUBbtGfN47rhzH1EhjtfaPZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IhjE6wB953ACXr061sG7ee8+2Zt25Ib2z233BDWcjzAzlD5BDrNVrHrOyrTOrIVZLuP1sR74ksakaex5PZnO6sw8XyHQDP0vTpZb8prdM5k7Sz6YOD/UWeggbjtBwHP04OVNmUPr30iRfaxetgWekQmYisRSxHRwSoUTwe2dyFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OBTNrHkD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OBTNrHkD"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA841C2BCFC;
	Wed, 15 Jul 2026 14:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784125846;
	bh=905IDA0YMzXhZN4E+47hUBbtGfN47rhzH1EhjtfaPZI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OBTNrHkD9V51TKay+Q7zydChZK9s4fMPOfJUE/aTdy0Tv4y3oH7PSyXjuxD3SsrJF
	 705x1I8sYVQ920uvIZE79yqMBFVCrAkRIXWgWL0/F6SPAOwoHvYAK4L+jksEG7ba1X
	 2u1SzHRXa7E8yirGxlzPiClDMVO+VBGU2+wPCrvSLVJeh6qxbLWGl3UIro6cwoD2e5
	 QFaAXAd5iy0IcXvLe9+87KGcmCLucuM/EJaRWndoxsN/VRTCVr11JLSzmUIfG1Bh02
	 DFHNPmTPzUEKiP/4vYqVWGJi4G85pGUDUk/JAkvcr7vywtD6rDCZEGwlLrFg70V4dO
	 oV+KP8o7dpm4w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB994C44511;
	Wed, 15 Jul 2026 14:30:46 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Wed, 15 Jul 2026 17:27:48 +0300
Subject: [PATCH 3/3] nvmem: mtk-efuse: add mt6572 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-6572-nvmem-v1-3-9c13be99d077@protonmail.com>
References: <20260715-6572-nvmem-v1-0-9c13be99d077@protonmail.com>
In-Reply-To: <20260715-6572-nvmem-v1-0-9c13be99d077@protonmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Lala Lin <lala.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784125843; l=1187;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=FHvo895/2FPuZq+qD2vgmsX3RenuQcHLq4BuNinwtv8=;
 b=ug9EXlb5+2AwzkqOXkoBNoySJTZMEjOi14vsB4Wl2af78J3+yyByGSfoDYLxO+RZHEmdHTF/E
 9uW6+UpkSmFD+ueOoj6wSLf26Kwv6o0Rl50Iyd8skIZpbcS71DyboeO
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Reply-To: rva333@protonmail.com

From: Roman Vivchar <rva333@protonmail.com>

Add a platform data struct for the efuse controller.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/nvmem/mtk-efuse.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
index 1462f2760818..a79434608465 100644
--- a/drivers/nvmem/mtk-efuse.c
+++ b/drivers/nvmem/mtk-efuse.c
@@ -124,6 +124,11 @@ static int mtk_efuse_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct mtk_efuse_pdata mtk_mt6572_efuse_pdata = {
+	.uses_post_processing = false,
+	.needs_aligned_read = true,
+};
+
 static const struct mtk_efuse_pdata mtk_mt8186_efuse_pdata = {
 	.uses_post_processing = true,
 	.needs_aligned_read = false,
@@ -135,6 +140,7 @@ static const struct mtk_efuse_pdata mtk_efuse_pdata = {
 };
 
 static const struct of_device_id mtk_efuse_of_match[] = {
+	{ .compatible = "mediatek,mt6572-efuse", .data = &mtk_mt6572_efuse_pdata },
 	{ .compatible = "mediatek,mt8173-efuse", .data = &mtk_efuse_pdata },
 	{ .compatible = "mediatek,mt8186-efuse", .data = &mtk_mt8186_efuse_pdata },
 	{ .compatible = "mediatek,efuse", .data = &mtk_efuse_pdata },

-- 
2.54.0


