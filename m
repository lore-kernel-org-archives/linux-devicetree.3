Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED1136E48C
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785480228; cv=none; b=Rp+VLIu7rl1jOlr4TrNNBoA0YCQNI+kNAtCQY8P1tdWbI9u3OuCtnf7JD0L/JnrOTrX7si6VmFgUL8G2CseqAEwLVGSjz6V2tGe168rvHoIuIzDnu2dDXz8ngXdFrKqY6cOJzJ2wJNaxXMb6j7REYIVeb+PCkQwnPzY/6yhEaoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785480228; c=relaxed/simple;
	bh=8rbg7XEDRe3Fi8PbDWy9idBygflmV+gM2SBEm4X0/Rs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JYlSkN1Vwrj1GgL8IZwTkFcbOu7t4S3e5VagNpbnhnvvmhQWQdTYLnL5NDO4mSU/NTkISXJ1ng549SC3SOVCl1crAULtJZcLWG0FnDlK0bjrWbJJhlWwRuJpjOVc+0ZmNO0mqf3n8CV5ZyzsZaILvY3I0sRBr1fdD18OiDVIj2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TphNqI7b; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TphNqI7b"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47f7872abb6so376000f8f.3
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785480225; x=1786085025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Yn5SGXWGzU7jg3uvtllcPlKx+PMxc5UfNcEyZfO4D+0=;
        b=TphNqI7bMB8dKN/6VEmNIoR/FVV8B7liSE90RgADsA/oDwY3XGs0WxJ6t38dCTNxcP
         XXk5t0O5I4G6thHW3cLiTTfIgUq+iLiHt9x8Hd02S5gUsUiW5NTZ6ulJ4yt2YiZyU579
         apt3qbCEH4JWUrWAkD0BsGCuAUmSdJKKWVuEXvw3Zf64D4BaJAeOghXCeoEyuVFz+CM1
         7cnTgPEy33luHJiuktvUpUOpEnx/imbwk6IefDf7Er8R7BPGDBxtT+i2gLdIm3U8gQB1
         6eWti7hhiJIA74WZ8fFBumeaQ3kpr3nKkCctf0fmfUQBbVqeoAhmV+SrYGAXehP/SKbs
         +giQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785480225; x=1786085025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Yn5SGXWGzU7jg3uvtllcPlKx+PMxc5UfNcEyZfO4D+0=;
        b=BK7htCBiLVXXlLAVGtU6+ZLP3AL0JbYP2bgbaHkIY7q3h+8aHsyUzYDRXKGxbL8r6R
         Fobst56S8lG9ZeX0UOWSJQyY7jHtbDrGt/b1d8y/obrx9YdfgmTeNP8QEeZ1+WIyCrun
         vb6aDqrMleHu/RmqhUFyuEXZpc+WuuwizNoGIr161j7Dpwjj1DLxDNmkmwxvjj7lIg79
         CyBayS74GVj5R7DOoidOkpVULYtGTuhk/mtDkmOKoqbByr1J2PbvwitPRx5iG2CDYDKh
         +kHKerJu+J8rGEFJrLE/EE3H3C+JGmknXKruzyJulY25jS7cCuGOg9DjfOfpeB96JiSr
         IbWQ==
X-Forwarded-Encrypted: i=1; AHgh+RpnSNGxpr74T1uc55tiYZ5mxYxfdilHC3Q6r3iCJGh3XnKwTxO1a/Ja/TpUHpEkTV2hl1PzIod7iS3E@vger.kernel.org
X-Gm-Message-State: AOJu0YxMyRRX/X3/VMQ8hh902YKItG/HRE/k6EV1Q8dB8aaaQO1oa2yH
	hcmEmWBoqvJ0+bAKMlXvkLCnnyL/H3wL84oKXiCjJSOikSrk8G21lDkd
X-Gm-Gg: AR+sD13A6MZ4QYXQznJR6/bo4luE4wQwmeHLOY+s3kIFjEaNf2OuQon5EqyRmTk/jWM
	qNtS2qYvdQ7k3cNR6RCdxb91me1KdlI6YAJHF+2YyPPzx8/61ZhbAUGizngumXYjTIbD4M+HZT3
	Mg9S9FLZDPGH8un/c9i0ObI8+cO/3mULCmulA5eBwkq3+twf8HnPfoLery3dOgzZZ4LfRDVQwuS
	t8mJfsRRfkwOMSWNmoj2k3gAE0+4xM9RTkjN2fbtL9jEiSTRnjm9GgaYpSwQm1LsweSAv1L/N1A
	NsFVf9gIqkPlN6/rUi6zKF4OdyJxgywgOwyby2JCV9VcQ3klxkgofWJz/c0GkbXtOFTl5OVXezk
	lXgG59ugINEWK20mYzXChMwTik+3VUhQMQvgd6j+dL8EbP0CK47ez8YImKPpAGfJMVP5BEeIji2
	f2L1PaLnZOwYSLtRYuyMcYRHLAD2WrhrNUiMpH2YokQ0neCrcUlFNxqxIg6JIoRGtmod9SNil0f
	cY5gnG4Jx9L4yEAuiwuXHcqsVNmObOYZuCjx2arFL3Jnty4VwN/1g==
X-Received: by 2002:a05:6000:2504:b0:47f:7c50:2222 with SMTP id ffacd0b85a97d-47fd2adcf89mr1876494f8f.24.1785480225025;
        Thu, 30 Jul 2026 23:43:45 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-11-254-126.retail.telecomitalia.it. [87.11.254.126])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47fd41cfdc6sm1372488f8f.8.2026.07.30.23.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 23:43:44 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Rosen Penev <rosenp@gmail.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 3/4] ASoC: mediatek: common: permit to provide dedicated regmap for irq
Date: Fri, 31 Jul 2026 08:43:23 +0200
Message-ID: <20260731064326.2284228-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731064326.2284228-1-ansuelsmth@gmail.com>
References: <20260731064326.2284228-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some SoC might require dedicated regmap to configure some specific IRQ
register.

Add an extra entry in the base_afe_irq struct and use the specific regmap if
defined.

If not defined then the global AFE regmap is used instead.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 sound/soc/mediatek/common/mtk-afe-fe-dai.c | 14 +++++++++-----
 sound/soc/mediatek/common/mtk-base-afe.h   |  2 ++
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
index 2a20fa5dba49..948f606cbaf2 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.c
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
@@ -204,11 +204,15 @@ int mtk_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 	struct mtk_base_afe_irq *irqs = &afe->irqs[memif->irq_usage];
 	const struct mtk_base_irq_data *irq_data = irqs->irq_data;
 	unsigned int counter = runtime->period_size;
+	struct regmap *regmap = afe->regmap;
 	int fs;
 	int ret;
 
 	dev_dbg(afe->dev, "%s %s cmd=%d\n", __func__, memif->data->name, cmd);
 
+	if (irqs->regmap)
+		regmap = irqs->regmap;
+
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
@@ -220,7 +224,7 @@ int mtk_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 		}
 
 		/* set irq counter */
-		mtk_regmap_update_bits(afe->regmap, irq_data->irq_cnt_reg,
+		mtk_regmap_update_bits(regmap, irq_data->irq_cnt_reg,
 				       irq_data->irq_cnt_maskbit, counter,
 				       irq_data->irq_cnt_shift);
 
@@ -230,12 +234,12 @@ int mtk_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 		if (fs < 0)
 			return -EINVAL;
 
-		mtk_regmap_update_bits(afe->regmap, irq_data->irq_fs_reg,
+		mtk_regmap_update_bits(regmap, irq_data->irq_fs_reg,
 				       irq_data->irq_fs_maskbit, fs,
 				       irq_data->irq_fs_shift);
 
 		/* enable interrupt */
-		mtk_regmap_update_bits(afe->regmap, irq_data->irq_en_reg,
+		mtk_regmap_update_bits(regmap, irq_data->irq_en_reg,
 				       1, 1, irq_data->irq_en_shift);
 
 		return 0;
@@ -248,10 +252,10 @@ int mtk_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 		}
 
 		/* disable interrupt */
-		mtk_regmap_update_bits(afe->regmap, irq_data->irq_en_reg,
+		mtk_regmap_update_bits(regmap, irq_data->irq_en_reg,
 				       1, 0, irq_data->irq_en_shift);
 		/* and clear pending IRQ */
-		mtk_regmap_write(afe->regmap, irq_data->irq_clr_reg,
+		mtk_regmap_write(regmap, irq_data->irq_clr_reg,
 				 1 << irq_data->irq_clr_shift);
 		return ret;
 	default:
diff --git a/sound/soc/mediatek/common/mtk-base-afe.h b/sound/soc/mediatek/common/mtk-base-afe.h
index a406f2e3e7a8..b5300c9ed415 100644
--- a/sound/soc/mediatek/common/mtk-base-afe.h
+++ b/sound/soc/mediatek/common/mtk-base-afe.h
@@ -153,6 +153,8 @@ struct mtk_base_afe_memif {
 struct mtk_base_afe_irq {
 	const struct mtk_base_irq_data *irq_data;
 	int irq_occupyed;
+
+	struct regmap *regmap;
 };
 
 struct mtk_base_afe_dai {
-- 
2.53.0

