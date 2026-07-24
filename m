Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C043B95FA;
	Fri, 24 Jul 2026 11:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784892591; cv=none; b=dgg1wut/utdBq4Xxw0kxmkRGISEPnJ+pszNPRpZ5T3UEsFAk1Hse223pVOVl8G1ydIP0gYoafp1/uqhGXUr1ELc4O7z+CdlMvjY4Tuq+JzLlPknCj+738zJXFCuij1ZO4wldvG0U3+UDRbZd5Fi8m9rh9pzkbdM3xYFCXZJT8+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784892591; c=relaxed/simple;
	bh=sLUm6phXL6/UN6hHVSZAI3vFakeEUucBJVxBRFM0FRs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Duf8lMTHsKZY7rmemMTZl3c7wGuS5yKsYNNBpR+J/5/Fn1qB4Y+8sq7O0snRBidUSd/BlpT63egLl/HQgKqhrMYZUo6CRDa7+PL99HEYNcEDIb2xH9SSzKZ8AGqYRoU438rA5k7+BuhZBdTzgWzpQspmwbYpAFobo4/vL+yY0a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kq6cNYrZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kq6cNYrZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1CCA9C2BCFC;
	Fri, 24 Jul 2026 11:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784892591;
	bh=sLUm6phXL6/UN6hHVSZAI3vFakeEUucBJVxBRFM0FRs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Kq6cNYrZXLDdgj4cQVUVVXvSGvKz6s0oupShUkrT+n20G1MWau2aKGgoF08H+VUg6
	 8wESZ8bKhIfTT7OWxB6WDwg2Jf76vPQPeNupd2NNnnbdvDDlnEAmXdnJ/mqzUH+wn6
	 hStZkl9Gg8jgcmjXIZ2IpTBBbi6LSnIDSu5XkEZddXwDnrrkCh1cgpbwC4ZUoztIV3
	 aEj0zxySeSStf7fm1FHWIc4sd0jk9u0e3lc+yeYK2z+DD8hr0/mvJ95ZRSwfGol5It
	 o6STaWaciVB7i0ZgQXDJ7s7tpmFlHANB1snDZ6NViSUM/84eWRNto9bxxKRxv7WIJh
	 zx4uEeYMMtVnA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F29B9C53209;
	Fri, 24 Jul 2026 11:29:50 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Fri, 24 Jul 2026 14:07:08 +0300
Subject: [PATCH v2 3/3] nvmem: mtk-efuse: add mt6572 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-6572-nvmem-v2-3-e58d16a29621@protonmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784892588; l=1270;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=RglpQMmDi1q9EkMmicGwenzoewTZeLQT6m7DchqK7Ko=;
 b=OG+XBny8CdCiVuq4629ceAWRfePgmdbdoWS9+9n5klQ1t9JF/yCDZvd60HdotyH/DS5WUwYPO
 wqPLyIAERdUCjZby1u73qvyf+KlLlX03yWanQDmO2yvcQxLMvbJZZRE
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Reply-To: rva333@protonmail.com

From: Roman Vivchar <rva333@protonmail.com>

Add a platform data struct for the efuse controller.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/nvmem/mtk-efuse.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
index 178b9d85f813..99d061eef6e3 100644
--- a/drivers/nvmem/mtk-efuse.c
+++ b/drivers/nvmem/mtk-efuse.c
@@ -132,6 +132,11 @@ static int mtk_efuse_probe(struct platform_device *pdev)
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
@@ -143,6 +148,7 @@ static const struct mtk_efuse_pdata mtk_efuse_pdata = {
 };
 
 static const struct of_device_id mtk_efuse_of_match[] = {
+	{ .compatible = "mediatek,mt6572-efuse", .data = &mtk_mt6572_efuse_pdata },
 	{ .compatible = "mediatek,mt8173-efuse", .data = &mtk_efuse_pdata },
 	{ .compatible = "mediatek,mt8186-efuse", .data = &mtk_mt8186_efuse_pdata },
 	{ .compatible = "mediatek,efuse", .data = &mtk_efuse_pdata },

-- 
2.54.0


