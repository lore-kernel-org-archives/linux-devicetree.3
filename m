Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906453E121D
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 17:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779990542; cv=none; b=AKPv6wmCLsOETQM6wC9JK+Gi01oZaQkoXpad/WSYBj2HgzegLnwftPDyxqmTLI/y3ZtCAOiMPMfNahgMQ/KPNTwIM2ptKUMydaA3X2Iljia9nCoTLZr71EOIUBFBwxDLP9emuhaYxBPMf85chB+fEY+SC3eW8veEtuM/AbDv4Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779990542; c=relaxed/simple;
	bh=SC2mZnDsiwRhE1VAHS/s0aXYO5xOgQW8rsM0NY9nRGA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VwAHnXCI00xrOcQM/rNKaLOCyw2rMEm0UGaRH5R/zckrzskBxjDbcaaSl12CCp3Dw+cx5j5N4ptQi3NhrJr3k9smeVtSDz/jBYR5OMf3vuLidpj+I4bprfZt4s7dTRzr0rakgB/xMUDbjNuTq0/6iyG9zcu7graGnPOprNQTE/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YKuSWQ0C; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YKuSWQ0C"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso63766895e9.2
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 10:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779990536; x=1780595336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=90iZe+Vt3FO3EhRu8PaahonsZT35J6uAqMQ+RMLFCOI=;
        b=YKuSWQ0C1BYy7HCgg5kG+4kVUkMubSRbCn1J7j/3cUX76dncZwqekcO8Ts6fTx4Hi5
         D8Ih3B4xJYsLRAv8bcUobhaJtlcryFjoR+PZdJxEcVpqHrG3L0tp3iHdQt4ipv9dJLzG
         uF6UEoduy5vJcccBQgBEIU37TzdQDFJproJcQkkptzOwwwh6Nf3svqRHkB3Hv9q400Cq
         VMA1hfj6hlJQoNOa9ExBMo7AW+yVD5spxJxijuhNvkBJ0pKcSiZttsAfin5oqEAD9PGR
         kqafDukLineJ11zDMzyRGrRu09MOpGc9NHaaHmNk+oUzhukwLwnNsF01qIgVKkiq51Mh
         pGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779990536; x=1780595336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=90iZe+Vt3FO3EhRu8PaahonsZT35J6uAqMQ+RMLFCOI=;
        b=KMBW1BAqmNgwzhMDhqhRKgES81TAEe/90LQ1apMeKIgs7uySLz8iIFRECuiCSj6CXO
         BWRU7X5TX150fIN6ZLWVHJLmXjO3Gx+yjyk8ElvW2R9/2lNcQxv2S7BbAwfVG/leWhuA
         cJi+CmylNjveLGov3MZO/05b/XdiXlHfrEauzCXN0z1jbblgcB9MJ50Pl6ZEm3TC7mn+
         bAMia+WZDOALlXfnvb2aj+rhqAjeIJHnUee2BCkE+Mb1wEZhRXl9Vwcj6MSYH08uA34d
         5PVfr5sI78Fj6gS3pozZWK1IPhvHx2SMg50Pn6MEXy1BznTybZYq3yRJsRtRv6s2FCdN
         GZBg==
X-Forwarded-Encrypted: i=1; AFNElJ/KT8ohsUyV10vDmTLro670txrhdX/x7FKfWpvEg3F6nn/GZQfnm3JMfWyT5fPChu5byhWkI5n3L3+D@vger.kernel.org
X-Gm-Message-State: AOJu0YzUOmKnKgr2e1Z9ppAQO8h0AlsLD5Jyxd2s6c3ttU8fV/vDbpoH
	kNzfYarxT3MLGmbfB/iq3eQvDy6EaOFInfN6d5x0FcH87pSXs6pbaPgU
X-Gm-Gg: Acq92OFbN6ID3noYZ/Wp3zAv4kyxN8MNli7L1+/lG9XNaKHUdAfhZNj2yEVpv5ZujmX
	Fi9V0lEGq8XC2+ebeVZfqsI701NAR94o2ax+8qSQNl7hE2BsdCITR73LsO9IhYUKn/XZtySOv0s
	itgLaA8cz9/MLAa/TgKmxKCf/cz7I4xNetZb4gMK+uZ6+e9eptoHEpxpV0wSR1fWTiuAkFnZqvm
	XrJvqXJoYHlbXCewWSOLhXnURqtgqgOG8p4w+viRLK37JXA+zavhBjSOILh/N/4fiDnXIVdYuhn
	h/XswQwYdGJkOoEnXqEUmku7GHQ23guA2lOi+B6CmTBHkNPev5ii/eT8utMvXCdeTchs2JMk/uV
	FNo3nx6MnZ+7rahHdWUmVyemHWkqYNDwW++2ESAz9NC0YykiS1XfaX22jOUWtWGcPDNdAUghf+3
	hqSsEPjlIgTUA+KLUBm8m9/EMU8J9WHGy3znfw3t2J+d/J6LUdMMY+p2qXXoDqG04qOIfTuDlqi
	Vi20EA=
X-Received: by 2002:a05:600c:8692:b0:490:3fa2:1b93 with SMTP id 5b1f17b1804b1-490424b0e35mr303367145e9.13.1779990535640;
        Thu, 28 May 2026 10:48:55 -0700 (PDT)
Received: from Ansuel-XPS24 (host-79-42-252-49.retail.telecomitalia.it. [79.42.252.49])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4909235d4e5sm75342625e9.2.2026.05.28.10.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 10:48:55 -0700 (PDT)
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
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 3/4] ASoC: mediatek: common: permit to provide dedicated regmap for irq
Date: Thu, 28 May 2026 19:48:31 +0200
Message-ID: <20260528174840.28644-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260528174840.28644-1-ansuelsmth@gmail.com>
References: <20260528174840.28644-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some SoC might require dedicated regmap to configure some specific IRQ
register.

Add an extra entry in the irq_data struct and use the specific regmap if
defined.

If not defined then the global AFE regmap is used instead.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 sound/soc/mediatek/common/mtk-afe-fe-dai.c | 14 +++++++++-----
 sound/soc/mediatek/common/mtk-base-afe.h   |  2 ++
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
index 3809068f5620..a8f4e70c8213 100644
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
 
+	if (irq_data->regmap)
+		regmap = irq_data->regmap;
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
index a406f2e3e7a8..76d010f853f4 100644
--- a/sound/soc/mediatek/common/mtk-base-afe.h
+++ b/sound/soc/mediatek/common/mtk-base-afe.h
@@ -87,6 +87,8 @@ struct mtk_base_irq_data {
 	int irq_clr_reg;
 	int irq_clr_shift;
 	int irq_status_shift;
+
+	struct regmap *regmap;
 };
 
 struct device;
-- 
2.53.0

