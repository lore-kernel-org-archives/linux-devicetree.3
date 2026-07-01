Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F8D492181;
	Wed,  1 Jul 2026 12:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908515; cv=none; b=WJaJ7xP4KQjam7Qs35CKdntMpCqL9j09Uj0R6qaO/JoMkfemthPNlYEv1IKBA2MjvWOkcNF/spGRyOdD2wK2apUzcyEdpti13q+lhVlCTmYCJCCmmqNMOU5X9O2rvbE/8DyC3hrIsIXHXJvzENU36JTr152mec703jB2ZnPOT/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908515; c=relaxed/simple;
	bh=9/mUB0vnFsvDNN+7EoIzQsUVVkwoA8QkJ5WFtUr02kw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NNeIaST51sxun4E4ET+OuW05KRwyqof52L6X5PSuTDk+mZByvps7c196LSTKF64NggpqMnViJFkzXoLHlj5g3yliPrGkrOZ6prIF4aFT7MeF/SUHBB2Vh9Cpl+7yOU9Q4AGLQBjZB7HDq/9+qJV5tFzFRIqe8w/8fYMCBFvTZfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=bBngWdgN; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="bBngWdgN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908512;
	bh=9/mUB0vnFsvDNN+7EoIzQsUVVkwoA8QkJ5WFtUr02kw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bBngWdgNBR/UjRSovDEcuzCMNWoc73r7xE44OwU9vZW6q0DJ9D3s7qCoUxJzaB2gK
	 B/0JQf1XkLysSkrwEQsx2DGyxyB1rFx6Jcb3HyWeqVsVE373ekKGFRIBuT0ag3mlMJ
	 oCb0wx7BKJVqv7NxchKgqXilAGzt/fJ74O6UMLUTrf9C+Wfp5qa8Joa1vbtOKt3VdK
	 S/T5wW9yvDztL0sDWP56QbfD3z92QGmAnD+pQr9eJauNT3R8U6oNfTXtm6CJ8FAMHl
	 U+U2aMGFjXvFr5jPlpBAXl5YUojXfwbvEIDMd2IBlzcKNZc6MV1fghl71mo2/X2rjw
	 FaX6TdHZgC12Q==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1FDA717E0857;
	Wed,  1 Jul 2026 14:21:52 +0200 (CEST)
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
Subject: [PATCH 37/42] soc: mediatek: mtk-mmsys: Populate multimedia subsystem subdevices
Date: Wed,  1 Jul 2026 14:20:52 +0200
Message-ID: <20260701122057.19648-38-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
References: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The multimedia hardware subsystem contains all of the multimedia
related sub-devices, and that really is by hardware design, not
anything software related.

In order to allow specifying a correct description of the hardware
in devicetrees, add support for probing subdevices of multimedia
controllers, specified as subnodes.

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-mmsys.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 24296ebcbae3..37f7c888e7e2 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -498,6 +498,13 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 		return PTR_ERR(clks);
 	mmsys->clks_pdev = clks;
 
+	ret = devm_of_platform_populate(dev);
+	if (ret) {
+		dev_err(dev, "Failed to populate child devices: %d\n", ret);
+		platform_device_unregister(clks);
+		return ret;
+	}
+
 	if (mmsys->data->is_vppsys)
 		goto out_probe_done;
 
@@ -543,6 +550,11 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
 	{ .compatible = "mediatek,mt8195-vdosys1", .data = &mt8195_vdosys1_driver_data },
 	{ .compatible = "mediatek,mt8195-vppsys0", .data = &mt8195_vppsys0_driver_data },
 	{ .compatible = "mediatek,mt8195-vppsys1", .data = &mt8195_vppsys1_driver_data },
+	{ .compatible = "mediatek,mt8196-dispsys0", .data = &mt8196_dispsys0_driver_data },
+	{ .compatible = "mediatek,mt8196-dispsys1", .data = &mt8196_dispsys1_driver_data },
+	{ .compatible = "mediatek,mt8196-ovlsys0", .data = &mt8196_ovlsys0_driver_data },
+	{ .compatible = "mediatek,mt8196-ovlsys1", .data = &mt8196_ovlsys1_driver_data },
+	{ .compatible = "mediatek,mt8196-vdisp-ao", .data = &mt8196_vdisp_ao_driver_data },
 	{ .compatible = "mediatek,mt8365-mmsys", .data = &mt8365_mmsys_driver_data },
 	{ /* sentinel */ }
 };
-- 
2.54.0

