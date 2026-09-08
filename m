Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6877B51FCD1
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 09:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858305; cv=none; b=jBCpKhR2J/4+NRts4hJbt7ZGuJWHSg50GNNuwOfufRaAqVeYdii+VwxBsijrE9+q3tujzelLxM/k6/qF9KQOfLGVj1LcKq59E4j2NqEYQRy8uSygGKkx39uksWEuzZB51OqYDXr8RE00rcR7FeFvAeXR0E1U1aFdR9q7GCCzjrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858305; c=relaxed/simple;
	bh=ovG3KD9SWw2WSAD+Z+FkwTd4OAPzI25cyyOlO4Nkoro=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FB6JYgHP3ehybVju3QfK362StWzOixgxyxLwq7Est1o5U6OZwXCK7vE9QZbJzoHsY8klul+hvrmDdeqbjDq5TuOd+iOMcxJJhaXXP9tWHxMzIJZeTEvzTJ4fnOZaBIWBCdDhZMYdNI9uPUXIu+MS7HUiq0YQ6gN6oW1LR6yHTRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kCGEdsoa; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kCGEdsoa"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so4999024f8f.1
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 02:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788858301; x=1789463101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U4zFNvqb3TCUq9G6zwsXaSter1qm2jsnjI9BXrVsaKk=;
        b=kCGEdsoaW5lzBo5X8NdlroTvWDvWNEZHjAdd83ElO6lW8HQahPfSxR95R6xmn4D4oT
         TqfR+5ZcP1VD4rW+dU5mXTxMsrKy0+SCq+Kr527iOWKgpqXPHqCvcm6NlWIA3r3Ida8v
         bmofGJO1ECNR2LQu505oZiOX5th4Dd2Wplo57wRREnPzpYb900zVCr+GKwUWkP/fejxo
         xZm+khMLGCaloEC48yEgy8l5FZO5zYZZRcsraKhoz+0ryKM8uNbnOqgWdOcQ0LG1EMug
         AgMG29EWhqhX11rfHDljcHAGxHhwQOfZ3MmymL0BGm5IGk5OL7Knwxlmbl3/Z+bT2tjh
         w2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858301; x=1789463101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=U4zFNvqb3TCUq9G6zwsXaSter1qm2jsnjI9BXrVsaKk=;
        b=neC1CYDCxmO8WB6Sq1g4sU/bdUlIpkx+Qb/LPqCtO4hMwHQWz03tFyruSogcE6R9Rr
         J6i50yewHKd1cYBS4nqWe5iRIisqjvPAK+xJhJbVB3sdyAXumEyrkduRo/opWnIZuNKw
         8QYvpIjy6JhVZOqn6+mIGgrLx9ePVrYYsfxsZS+l2baatrDHCMAC+FCWsCr4G6c9rOkS
         0hbd5vbo8JqXfvPxeOqVUem3BMrVHxmWz9lQ2k5yjgmFMtp4eotoMcOkoG9oqbHgZQN4
         Ac17Rcdk4XJne4K79luZX2wh5GswdH12xO9/bntlriyaOuNiTSh+yuQV7r8edcRskd5R
         kOBA==
X-Forwarded-Encrypted: i=1; AKwUvBxTixn7mkRuhHNLAKEFiN94DQa6vW4bzVofF3EoBsjIgUPcPLL+qy6gK+yx8IiVVNLitWuuGlo9nBSy@vger.kernel.org
X-Gm-Message-State: AFuF++lpp5lzINehNY8seb5K6qY6cApm9GTUtyX62LR+7qy3QbbqB62M
	HedAO9V4JNn0xfANes0Jvrli+OvMJbuF5NYtR8IoJkmh1KM7mh8l1sLX
X-Gm-Gg: AYBFou3FZRSj2a+KHQkjQH09lL85uK03DYsiaUZmdH9b97RhltttPw8P4SaH6GAqOG3
	GCBabCLRpYOHdwUgOxa8gvaoe6EQ/Ds/9S3XRi61Tf/q7IErl3dZ3B4GazSq9T+l+ZCEZs0E4Us
	+g6clTvSLLbRNWioa2vseDST1xRsdsO83+MhKoZQcBAi7+i4WjhcWiect8I1IWuN8qf/JIoB6ft
	kpI6h+VYLcRXf0v2uyhuofWMT1SLSHWmU/q83tJV7B+wsIbdiwVlLlM0hU7cQTTTkFCOlDkrQXo
	AJ4D03ySe4MK342FbFkU5mAQIEAG5HJM2T8+YkfYh56YNjdVMXVDygSAlTO54rxQjBEZjr7rLy1
	R4+zbZU5KfVb16Flx15MWR94vuDaY4kxm+P5Lgo43orHRwtmAIIP1Lu4T03YKAHAY+M2vxO7mpM
	BppcsXDJHVHkNM9RZIsRtKVCKeAVXDeqp9cqcnPORjFbiSUxPMkK7AaV+U9MGmT+uzjX/IT4IPR
	tsCgjNztpK1XDtXJB5uCigbCypQT73u703GPliSKtxyLpPckC9a
X-Received: by 2002:a05:6000:26d3:b0:484:4146:1422 with SMTP id ffacd0b85a97d-485870934f4mr28074029f8f.21.1788858301380;
        Tue, 08 Sep 2026 02:05:01 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-485881353e8sm34767945f8f.1.2026.09.08.02.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:05:00 -0700 (PDT)
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
	Rosen Penev <rosenp@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	bui duc phuc <phucduc.bui@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v6 3/5] ASoC: mediatek: common: permit to provide dedicated regmap for irq
Date: Tue,  8 Sep 2026 11:04:45 +0200
Message-ID: <20260908090448.3332-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908090448.3332-1-ansuelsmth@gmail.com>
References: <20260908090448.3332-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some SoC might require dedicated regmap to configure some specific IRQ
register.

Add an extra entry in the base_afe_irq struct and use the specific
regmap if defined.

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

