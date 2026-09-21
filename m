Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957E64908D8
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 11:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789990773; cv=none; b=lSLPJJGbVwiq4ZzpoXP+sVyDwZWpJWcsnn9wVA0y4/eKfadeHWftxk0UK8cwl2eJAQwQ6kZYWnatPtuBZVqAB6tA/OOqnzvxT7NZvGAYdSvPMu1unjYG3SWtenqlC0ZvQDRaZIZGaNmewpe8eQk00IwthPjpHEsoObuCpGDo+Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789990773; c=relaxed/simple;
	bh=pcYeXOACuDvjp/whLmtLCzRumWLWdbpfn16C8Q/wwPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qvzMzzeE4J9M15s6z0nLrISuWW9kNiFxnh2hUXNjmFceNYzDOXb5OHHHD92N9p8uEn/uE3BtXgSyhvDBHtjm+nN1C9Uv5t9X9JlJ0N0BGQfzMw9Ekg9UCAk35rgk665u9g0446MY5JydwNaOhjaZUTDqlU+sU+SThLiIuEqI95I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SEuSSbfM; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SEuSSbfM"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso24779595e9.3
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 04:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789990769; x=1790595569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h4/riDOncgRUhzR5epGdXHOZl5OnvQAmiqOQ7MptE7w=;
        b=SEuSSbfM40+DYvEQ52U+HchQD6kc3yrVUA2o1VoUtYxG99vfr4LS/Pmf0nE6aXmfsb
         NU44qyoxaYGyZczzQsOLn7eZ46zf3m7/TWc6/ZoubB6xpmLAU7gzY+LQmF6sGh0Xxxrn
         6/SrzQCKRlqboAgSAhL6p5x+PHevyTDM09z017seNKi0VGSRdniO8aAmM3oo4O2udgEL
         6f0TzI0jWixuVOs4t4T7hyk77oKwBebtiWoeyepwrZScsuAefMXMN8s2bYAyxzWKiq4t
         4bYsKVrSX6ns68TDussTWjWTlCHnPQyzXOgKpMlIEMJLZH02V0IbMaxXmP1ZuZQKUW0C
         fKSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789990769; x=1790595569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h4/riDOncgRUhzR5epGdXHOZl5OnvQAmiqOQ7MptE7w=;
        b=uBVwzCFRhzKp3eiHD5vlLtzZ0EzZ3WnU6s+rkGiz6kCWXK5aGzU8isnET0YBmufMLP
         WClRMdulgyVg+gwQprbToVsSQgqiFkqSu/QFc6lFnXehZWT2ViG3DB7kGXGXFCeOmbOd
         6jeZRImHkUZKfB//FZQJ17PxydSVx/YBJ8rsBkRPDg41FnDW38oJ9sYVI9h7B9tYzPMJ
         b4OVo06P5e7ALCKOfG4N5HMMiu8bmkfZsJGx6aisG0q6D+E+qAqBjpuF3CFNs9DyclUn
         fwYv+Hz6m3sQpAkbH0CzrVcX85criTbw7+tDk2MEQ1PROS1HU7dtBAXy6VabIKjto9Zu
         6Ujg==
X-Forwarded-Encrypted: i=1; AKwUvByseyTfr0irsa7j6rqYqhwmumSFq/ssknUqXcIc7BqlZqo/UQJAF1IBPEVDab/iSMjnL07NzG8eS7mC@vger.kernel.org
X-Gm-Message-State: AFuF++lE+1RkaruXGdK+WKCQTw5T65y3YNShDs7UoJ9Bqtzy2xxNfr9f
	yCv/DX/Uqz3k1iaKKwgMHwUlZDa4FqNGyvugstonQbXOXWT883fguev+
X-Gm-Gg: AYBFou3MzmCmW64ZzginrFHl7MNZVicc+z+KlUzqkbGg7L9AMIbTvUMw0XXh/WBrj0Z
	aVrkEvd4rIJKclQ0iWktN93XIUEO255Bj6f7AN50Z3q81jq5A9yfLJbjiOg9tYZ9MezQ7M3dPle
	2QtJPFgoPSBOzH/AQfbHwsLfdFHWdqadTc8KBkaJaGSS9UtYcB+vO+UrU2Gjrz5Gw0E5Nh3x4Jh
	yeA1aTeRk+RF3FbSUxICCH2Z2ce1TBpeCc2sNajWZTPbhxoxMpil8k1QYFeI/N8ANafDlCxy3/Q
	YEp7+hTGkFw1F+ixQY7MvqmtSK0g+98/Wr9KxGnYEUuN/a6ounqDDs4AzGJ+tBb2IszToGPEkE/
	ZRatpiCgmGDGJvZRIQDoccJVNj4XTC36Izl2Rab+uJ4gNpD4pr9b5P0oulO8lGiPimZssgh2m9Q
	2jY6lAyJHTYK3OKcQvLnv1sfmlQVzJnKBVvmrpzpwgeHfuDFNBqqZ8uJtWGi+k5EIYxlQ=
X-Received: by 2002:a05:600c:46cf:b0:49c:de80:b833 with SMTP id 5b1f17b1804b1-49fc5687b6cmr156358075e9.2.1789990769221;
        Mon, 21 Sep 2026 04:39:29 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc57547easm244273865e9.3.2026.09.21.04.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:39:28 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	CK Hu <ck.hu@mediatek.com>,
	Jitao shi <jitao.shi@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/4] drm/mediatek: Add support for mt8167 Digital Parallel Interface
Date: Mon, 21 Sep 2026 13:38:56 +0200
Message-ID: <20260921113914.779393-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921113914.779393-1-l.scorcia@gmail.com>
References: <20260921113914.779393-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the two DPI blocks found in the mt8167 SoCs. One of them
can be routed to a DPI connector and another is directly connected to the
HDMI IP.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c     | 23 +++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 0e4f430de983..9012adeb63d0 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -1114,6 +1114,10 @@ static const struct mtk_dpi_factor dpi_factor_mt2701[] = {
 	{ 64000, 4 }, { 128000, 2 }, { U32_MAX, 1 }
 };
 
+static const struct mtk_dpi_factor dpi_factor_mt8167[] = {
+	{ 64000, 16 }, { 74250, 8 }, { 160000, 4 }, { U32_MAX, 2 }
+};
+
 static const struct mtk_dpi_factor dpi_factor_mt8173[] = {
 	{ 27000, 48 }, { 84000, 24 }, { 167000, 12 }, { U32_MAX, 6 }
 };
@@ -1163,6 +1167,24 @@ static const struct mtk_dpi_conf mt2701_conf = {
 	.csc_enable_bit = CSC_ENABLE,
 };
 
+static const struct mtk_dpi_conf mt8167_conf = {
+	.dpi_factor = dpi_factor_mt8167,
+	.num_dpi_factor = ARRAY_SIZE(dpi_factor_mt8167),
+	.reg_h_fre_con = 0xe0,
+	.max_clock_khz = 150000,
+	.output_fmts = mt8173_output_fmts,
+	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
+	.pixels_per_iter = 1,
+	.is_ck_de_pol = true,
+	.swap_input_support = true,
+	.support_direct_pin = true,
+	.dimension_mask = HPW_MASK,
+	.hvsize_mask = HSIZE_MASK,
+	.channel_swap_shift = CH_SWAP,
+	.yuv422_en_bit = YUV422_EN,
+	.csc_enable_bit = CSC_ENABLE,
+};
+
 static const struct mtk_dpi_conf mt8183_conf = {
 	.dpi_factor = dpi_factor_mt8183,
 	.num_dpi_factor = ARRAY_SIZE(dpi_factor_mt8183),
@@ -1342,6 +1364,7 @@ static void mtk_dpi_remove(struct platform_device *pdev)
 
 static const struct of_device_id mtk_dpi_of_ids[] = {
 	{ .compatible = "mediatek,mt2701-dpi", .data = &mt2701_conf },
+	{ .compatible = "mediatek,mt8167-dpi", .data = &mt8167_conf },
 	{ .compatible = "mediatek,mt8173-dpi", .data = &mt8173_conf },
 	{ .compatible = "mediatek,mt8183-dpi", .data = &mt8183_conf },
 	{ .compatible = "mediatek,mt8186-dpi", .data = &mt8186_conf },
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index c86a3f54f35b..64c87221d931 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -802,6 +802,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DPI },
 	{ .compatible = "mediatek,mt8167-dsi",
 	  .data = (void *)MTK_DSI },
+	{ .compatible = "mediatek,mt8167-dpi",
+	  .data = (void *)MTK_DPI },
 	{ .compatible = "mediatek,mt8173-dpi",
 	  .data = (void *)MTK_DPI },
 	{ .compatible = "mediatek,mt8183-dpi",
-- 
2.43.0

