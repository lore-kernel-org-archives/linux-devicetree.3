Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EE6498935
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 11:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791633372; cv=none; b=nbzJ8zTwn7Oljsf2hWOfRQ2NjT1DmlqIwP4AEfKtMpeL6EDY97Y9bJIfqoTVeSUE0JQSpTEoTw+NOr/8QDn6Zf9hnkrapx7BS5/FN6K7hb/QBSMmnZSPDvFz3qziCfKe3S3550exBARWFaB6jWNxGhqXYifXspWyloL+skkyeco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791633372; c=relaxed/simple;
	bh=IVqzU4OEifD0uEUZ2igkwS3l+zxokgSiBujrja3hoAo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VFOddPd1iiP/+psFD+nIIISY1r4MUPjzdvjyxUl0Qp6l7qaj3sudLQt+kbIHkBdsVgxlhz1CiXNyc63XOahp4fuphSmgZgYN950UCgsHtyKMKPo6ex3KrEh4LpJf6XsJQaEykB1ctOjKLqvCbt1wayMqy0A9jKeXipuB/z0tESI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AwuHhiWI; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AwuHhiWI"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a168355946so1582855e9.0
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 04:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791633369; x=1792238169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7cQlWEs7vG4qRpaZiwY4RuZzcs0XsJM2mV6rRYet5I8=;
        b=AwuHhiWIkc4L6UaWtUpwJcW3bLEUBy6f1BcuXWzgGVRSFBIDVpv92IxBUdRQuf2Bon
         d9DYRaTS5haYzcG/UyiIfiYdKNyskk0d+ID2hxneuxaHjYc+bUoBezs/3OAERYpVULpi
         lczhhogKVvc6dUBL68pbIULiaEL6Ju38Bg3rBoYp7gb7InXPGw1atqvsKFDeOKtqPTQi
         BKuqL0x2lvhnNvR2t6lW03/9djCh1owbgIRCQAUm0+5g7SUiiGFJfp/U2OlQqJ/OXr+q
         ncJjD5napTr53xhvsaCUY2CvO/e409PjF5kfGTrw2ZlKyctgf4+6jR04iuZwqh2JbyDS
         szqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791633369; x=1792238169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7cQlWEs7vG4qRpaZiwY4RuZzcs0XsJM2mV6rRYet5I8=;
        b=XbAIjyNEqPFYTVVyIzpUkI1a/sLcfECFPW134IiHZuMkE1P9McWpOtl45txJhwfzYb
         /ZmQpsvDfbFDGQS+OEzvwi+bOCvVA/da0gqeqS+RngGIDsqFM2floakh9iwk023KLXdt
         3RRdefkfaiUL69ACdPenJLztMsh570cC6438sWrH4pG97wQNENd+Oal9xas8zoZoYOwu
         o5uK9gDqfJv6s8gfgY8N6kl6kQRKL2fBtj2BCHAyhBIfkkdsIRakpz0qQtMWpxpjYAQQ
         EP+WtykKnClDox3LfAVBKtFmHxQJFJrq4gzQkyamVQQ++96J6eLpVpdulTrWxod7IzMY
         Tinw==
X-Forwarded-Encrypted: i=1; AKwUvBzBmtwEetE6tJ2iQi6S57IoXmB91iR5xiBXV3CdfNdT2FwYEA4GVScWTRUCmzVTrT4tokVcypV9ip64@vger.kernel.org
X-Gm-Message-State: AFq9FYL5rI80hmKqsCSoWdCBcEL+NR5JqcwM7DEsMldNFGaz0U2N1tQc
	oDpf67E2GVAXYHmKaEpS2uHxXaIeN4jOKRv3gitGO5sWyB1BvnXab/pl
X-Gm-Gg: AYBFou3q3wg8q8u4WNeh6rYvG2nL1KnlKpf7SyY5J8ivvsf6kWumj5ewLU4w/BVCYdV
	cBlThYCO47x2v3khhHXrCYia8egh6XwIkMGKBzs3EUMI5FlT82FY2Erup5v4wLl0rUYR3uvSu0d
	8JFeoFXWt5bwBeyWGH3dFBey00yYffAYUBC35oXpfUbIUpAU0GmUtNITjf5YvzuPqR8AAhU8+35
	HWEbds0+GjYe/CCpJh1NXNt2RybAAL+UpKFucx/Olep3yQT4aSzFTxTIYuXOgLNIro9MMOR4HWG
	riyS/vRzEIKdaX4DXYcHuSuBhAsVWtoZrDqDb0jumQYtvxt4Zga7Wvh9C3Fz9ymULDuSubDW5XW
	TraHjIu2hRvPR/fE92jdpT4IfoOZOa5sFTcpkV5X5WmVAX99tHu2E7/Ti8tldo4KdivXT0bnE0i
	GGkoE/ZJMbzcRXL91wTz0GJqs5F+5aYMxlp65LWaDaLVTkV5ALRankKbyunBRI7pV23w==
X-Received: by 2002:a5d:5d09:0:b0:48c:6a6b:69b2 with SMTP id ffacd0b85a97d-48dbaae7028mr6208118f8f.27.1791633369101;
        Sat, 10 Oct 2026 04:56:09 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aca657sm8746340f8f.43.2026.10.10.04.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 04:56:08 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Fabien Parent <fparent@baylibre.com>,
	CK Hu <ck.hu@mediatek.com>,
	chunhui dai <chunhui.dai@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 5/7] drm/mediatek: mtk_hdmi: Set tz_disabled for mt8167
Date: Sat, 10 Oct 2026 13:54:05 +0200
Message-ID: <20261010115539.9237-6-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261010115539.9237-1-l.scorcia@gmail.com>
References: <20261010115539.9237-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Just like mt2701, MediaTek mt8167 does not require an ARM supervisor mode
call to toggle HDMI output.

Fixes: 511cf7d12331 ("drm/mediatek: hdmi: Add MT8167 configuration")
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 738090a47176..9896eaf81e7e 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1214,6 +1214,7 @@ static const struct mtk_hdmi_conf mtk_hdmi_conf_mt2701 = {
 };
 
 static const struct mtk_hdmi_conf mtk_hdmi_conf_mt8167 = {
+	.tz_disabled = true,
 	.cea_modes_only = true,
 	.max_mode_clock = 148500,
 	.ver_conf = &mtk_hdmi_v1_ver_conf
-- 
2.43.0

