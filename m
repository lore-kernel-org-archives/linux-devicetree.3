Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CD83BB669;
	Fri, 24 Jul 2026 11:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784892591; cv=none; b=KR/VKWvqZTr4kmWBToVeRiRyGDwAyx3HBfjIdaPnf9DssovVLdG0I2i1cnMkoOIFFneXT/OjFmz8V0zghviI+HrGyAwnWz5SLsAorU1MaCReqX9/HWFNCewGlkV39iCprzSqRWm/6YrgmkKPDKN5PclU2EGF2Q2fm3YubPMpgzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784892591; c=relaxed/simple;
	bh=C8aXXQaFeWZmsrlMRRyh9TAsW3FMnEEDkAdARgX7WzM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nC/g45AZEm/J6jGZGUojNKqGYk4X/XFL6fBXEx3IDplzEUm8YL82uN2OEzORMXQ4xXk82RSCazWmgfNvATsr/lLGaZcuw9tzYNCRqwLFDdP+luGvWq0TAuhL1HMMiyagJ4DX6n1Z021vYoNAtBVcnY37U4gpHLagB2hgZXQ59Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IywIaAWd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IywIaAWd"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0FA91C2BCF7;
	Fri, 24 Jul 2026 11:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784892591;
	bh=C8aXXQaFeWZmsrlMRRyh9TAsW3FMnEEDkAdARgX7WzM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IywIaAWdoc1GT6Us92RjWj9sQkc8PT7ppzysHqy8dqPiomNqe7PfyX1ZvYBVqbuQ7
	 SglkxSJqYGMZrpSSakSxg8vMjoDDbc7FMjCC7KegwzecLWxWoczYyqrNlj/3zRo9ai
	 40xNOBM/Jpcts0jQMLeYrsai0ZG4gI8WIe7eyzv1xGf44+bGS5DX6CxayVbQgoNocm
	 jxfHMdAyDpPJf/UlbkIyM3pq4zWFeAN4/Mc4meFmt4dEnrDSyqXVzbE0FVw/7Wl/It
	 Jfe95a4Ru7DThWtryqdhItSWvd/RBGZcl6ws0Hr68xE6ONxv46XSeBdiNly6NwComR
	 BSA5mJNm1e0Mg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFF25C531FC;
	Fri, 24 Jul 2026 11:29:50 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Fri, 24 Jul 2026 14:07:07 +0300
Subject: [PATCH v2 2/3] nvmem: mtk-efuse: add support for 32-bit aligned
 reads
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-6572-nvmem-v2-2-e58d16a29621@protonmail.com>
References: <20260724-6572-nvmem-v2-0-e58d16a29621@protonmail.com>
In-Reply-To: <20260724-6572-nvmem-v2-0-e58d16a29621@protonmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784892588; l=2506;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=ylH/IgEJCVkseD04fa7EwlxtvDcFp1eXUc9OswjHzzs=;
 b=/8VB81TrG8SjFb9w55sRRen2VjLM+hfW97QRD/CaBKXKSzGpXGhXDnsueEA8V3wSIRvkPK73X
 S1jMcqsdLFLAhCz05D9HEVfK5BBKrQv7ApW0EVDtZgNR1mivuqBywOe
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Reply-To: rva333@protonmail.com

From: Roman Vivchar <rva333@protonmail.com>

Some MediaTek SoCs, such as mt6572, don't support 8-bit reads, leading
to zeroes or garbage data. 32-bit aligned reads must be used instead.

Introduce a 'mtk_reg_read_aligned' helper to enforce 32-bit aligned
register access. All reads will be performed by reading 4-byte words
and masking them.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/nvmem/mtk-efuse.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
index af953e1d9230..178b9d85f813 100644
--- a/drivers/nvmem/mtk-efuse.c
+++ b/drivers/nvmem/mtk-efuse.c
@@ -4,6 +4,7 @@
  * Author: Andrew-CT Chen <andrew-ct.chen@mediatek.com>
  */
 
+#include <linux/align.h>
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
@@ -14,12 +15,37 @@
 
 struct mtk_efuse_pdata {
 	bool uses_post_processing;
+	bool needs_aligned_read;
 };
 
 struct mtk_efuse_priv {
 	void __iomem *base;
 };
 
+static int mtk_reg_read_aligned(void *context,
+				unsigned int reg, void *_val, size_t bytes)
+{
+	struct mtk_efuse_priv *priv = context;
+	u8 *val = _val;
+	u32 i, pos, shift, val32;
+
+	for (i = 0; i < bytes; i++, val++) {
+		pos = reg + i;
+
+		/*
+		 * Read on 32-bit word boundary or if it's the first
+		 * iteration
+		 */
+		if (i == 0 || IS_ALIGNED(pos, 4))
+			val32 = readl(priv->base + (pos & ~3));
+
+		shift = (pos & 3) * 8;
+		*val = (val32 >> shift) & 0xff;
+	}
+
+	return 0;
+}
+
 static int mtk_reg_read(void *context,
 			unsigned int reg, void *_val, size_t bytes)
 {
@@ -82,7 +108,12 @@ static int mtk_efuse_probe(struct platform_device *pdev)
 	econfig.add_legacy_fixed_of_cells = true;
 	econfig.stride = 1;
 	econfig.word_size = 1;
-	econfig.reg_read = mtk_reg_read;
+
+	if (pdata->needs_aligned_read)
+		econfig.reg_read = mtk_reg_read_aligned;
+	else
+		econfig.reg_read = mtk_reg_read;
+
 	econfig.size = resource_size(res);
 	econfig.priv = priv;
 	econfig.dev = dev;
@@ -103,10 +134,12 @@ static int mtk_efuse_probe(struct platform_device *pdev)
 
 static const struct mtk_efuse_pdata mtk_mt8186_efuse_pdata = {
 	.uses_post_processing = true,
+	.needs_aligned_read = false,
 };
 
 static const struct mtk_efuse_pdata mtk_efuse_pdata = {
 	.uses_post_processing = false,
+	.needs_aligned_read = false,
 };
 
 static const struct of_device_id mtk_efuse_of_match[] = {

-- 
2.54.0


