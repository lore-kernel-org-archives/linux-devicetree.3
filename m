Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC90E42B72B
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 20:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786133393; cv=none; b=A4VkBCixL0mDxun1xx4ukeaAbGbNPKHotSqlzhkykAhtHwen+s5xWyYVL0ButU9yKyPJruJREkNc6lxsnYrKSq/IJbKEXW5AaHFaaGp2Jg5oMGd8n8OUvLBKIdlGVYeIWZnpYdYK+YriGDRTuT28/bC7nQB/Dmzozp/bxUUWLUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786133393; c=relaxed/simple;
	bh=ovG3KD9SWw2WSAD+Z+FkwTd4OAPzI25cyyOlO4Nkoro=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ORMyALlFnky++dWgJuBgRS7Tup1us9RUbfIsfcyuJq2/7/FEueaTy4SsVhJw32fgdOWUj2HsFx6iyPIBUk31N93+UYn7c64wgwSHkVArWsR8ilcre3btw2H/lb98toiJcpHHS61CPkhMdxd3pucR2EgigMeSQi70u2Ec6EbwmzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yr3l5LI8; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yr3l5LI8"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so37858175e9.2
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 13:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786133390; x=1786738190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U4zFNvqb3TCUq9G6zwsXaSter1qm2jsnjI9BXrVsaKk=;
        b=Yr3l5LI8aFxoy6Vagxn/4Gdmot976y4ilI7f4wSzh3WrJoV+U6Bb9epuUMS8/1pcXV
         GSLTEb2NE6gZ5wOtLCd4xYG1ovDdVDet2xZavjfSb4lyWitB6EyMiLsppXlneSMOO6K/
         QWSjoiUTliEn15xU4+zlXQ12V9dN1UfS240ybzoJ5uXdDaGni4LBBeCKAucl1Q0NmTvB
         CDlhziO3HsNrrquatfWcEvB5ze1crXsdZNMhP8H7iOtDsNTkFZMXp/uGWUGfYBbGG2Zl
         1KdkEDXu1emQlDYAqIxzoGF49gTwUFaY9IdcQfQnNNTXuKgiMgqxBUlUsqiPK3fIh6ZD
         kg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786133390; x=1786738190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=U4zFNvqb3TCUq9G6zwsXaSter1qm2jsnjI9BXrVsaKk=;
        b=XdK+SthZOMRF+AW/lfcyFGycHKqNRPrC3ISexL3cMq0xsVSEflW2FjbtumZJeY3OKb
         Z9NGcJroHcONrS90DmrFe04viXcPs/LabAeGzhA0ZndfSbuYykZjf2ThoolgjmtimZ26
         JomcUw8uZXfw6ToeUL0MY2/Ty4KD30ZYjG4jYtMWK8MJ82cxkoRJ6vye6ceE7lMz+UNs
         X3ZPU2/q/pNgT2D/+ww+pncxQWqgOpf2cmvD8GyyRJt1Gsl6DhvR1tN6LiHxjwGDPegg
         oEwJFChBlHumNLlFZa5GX/GgbkTZTRohaW6GTrzdRpBg0oXhZjyDApW7vpwQgSgbpwkH
         umjg==
X-Forwarded-Encrypted: i=1; AHgh+Rp81fFkMuJcDs3ogKxfhFhwmNvuc2uakLnsr8rqHaMkHql77ZpRKFkr4q6reyeba2YWI5s3T4TYZcbN@vger.kernel.org
X-Gm-Message-State: AOJu0YyvJB7zsaC5ziayjp8ljIswOkz+orN3BlIZVxqAa7ubi8ZL0WCI
	RhsfCaEC1e+ZptBD23pva7AmJ/ziW88fhAKhdZg5lCyWQ10cnKqv3Ci0
X-Gm-Gg: AR+sD10Ofw0H5HpaI16wBfu0itb4eFB01GBUXKisuzVrCt9s1R9OfaFlZFa1UuIexua
	VHm1CIoR4F21cyOeSXZTU9DuL9PqPnGqHSx39LN2GJBbQ/d2fYE5TCnR/luF09Q2VpHl0+vnrX5
	kRSumU9Po75/jet80IG97S49v8AjNyrnHyPanH5sACkNVGsaE0fxe8J9QCKMn2U6XIGVzO+XR43
	fPBbTyiTfmcNMC58d2jJyGHn9GV6DqPme35BazSuzn9vE4wF0ON9fOC7sJkbP0w2AQRZf7jCoV2
	jYPq6XwVgBtVvbUSYUMUKlOTkx4kAmbuQOgfZUUPxZt6Ng+Ug8P9rPqdTPw8RWlZX5loLOta3XT
	kly1Dgl1BpJqwJmkq8iMDZ0hJL5pF0SOVd+eSA4GhEyNgbc/xL6amimlheK7XMlO8x6cPjNt9C9
	Nz845LK7/vX4tV++HlYannjgB2nUcipJCNMGPRku9wMPCv0MV67QmjdXBXxiKn9oPrVN0ISdjre
	7yG4DYryrCUy3Iz4AVJE0LbCMsFjyFK1HcEWNw2iE+kOSZURe5aHvs2nRpMWcrg+Q==
X-Received: by 2002:a05:600c:4f82:b0:499:518d:ebd6 with SMTP id 5b1f17b1804b1-49959e3c714mr148437735e9.17.1786133389992;
        Fri, 07 Aug 2026 13:09:49 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-19-255-168.retail.telecomitalia.it. [87.19.255.168])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995919df87sm124815635e9.6.2026.08.07.13.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 13:09:49 -0700 (PDT)
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
Subject: [PATCH v5 3/4] ASoC: mediatek: common: permit to provide dedicated regmap for irq
Date: Fri,  7 Aug 2026 22:09:33 +0200
Message-ID: <20260807200936.201827-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807200936.201827-1-ansuelsmth@gmail.com>
References: <20260807200936.201827-1-ansuelsmth@gmail.com>
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

