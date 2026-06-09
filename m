Received: from r3-55.sinamail.sina.com.cn (r3-55.sinamail.sina.com.cn [202.108.3.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403D1353EF3
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 02:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780973786; cv=none; b=jf1jyDpVaCDASvfjFCFK+nSXOy7aQZ430c2/0MpamU3tDhRI90NLK5DHGAd/vkWHV+LncGCguAVqunbG2m5qIfJBUdx9PPciCezUKQxkpsotTxLpwU2yznDBvUmN109M5oROMNy7uYHKZQybZ1PlAjlxKfn5nUgOe17VFX1jzsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780973786; c=relaxed/simple;
	bh=V6nhHrlX3yTMFsSDYUDqxBfDxCFxonnZudsMzTO1fSc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=DN1QlaiX/KbdWot7W5YeJ1WchSCUU1Dt3gUF8xHRBqnzb5Pu63FxyNCPjI7dhkNCyVvNQA1e7E8lsS0ShzWj/Ig5HAeYFV9swebg99solLdvFFrAvaUdrDdaOVXbZhmbmtljbVwbk+UovGMtzjnbTYdHUco3HtmPfH0Ee3CBhMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.38) with ESMTP
	id 6A2780C700004488; Tue, 9 Jun 2026 10:56:12 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: CCC1E96D6FCB4C539FCE0F21E1F68B06
X-SMAIL-UIID: CCC1E96D6FCB4C539FCE0F21E1F68B06-20260609-105612
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	devicetree@vger.kernel.org
Cc: tiwai@suse.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH 4/7] ASoC: codecs: ES8389: Modify the initial configuration
Date: Tue,  9 Jun 2026 10:56:02 +0800
Message-Id: <20260609025605.16945-5-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260609025605.16945-1-zhangyi@everest-semi.com>
References: <20260609025605.16945-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Modify the initial configuration

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8389.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
index 6ad0b5800..8e47b4e32 100644
--- a/sound/soc/codecs/es8389.c
+++ b/sound/soc/codecs/es8389.c
@@ -792,7 +792,7 @@ static void es8389_init(struct snd_soc_component *component)
 
 	regmap_read(es8389->regmap, ES8389_MAX_REGISTER, &reg);
 	es8389->version = reg;
-	regmap_write(es8389->regmap, ES8389_ISO_CTL, 0x00);
+	regmap_write(es8389->regmap, ES8389_ISO_CTL, 0x56);
 	regmap_write(es8389->regmap, ES8389_RESET, 0x7E);
 	regmap_write(es8389->regmap, ES8389_ISO_CTL, 0x38);
 	regmap_write(es8389->regmap, ES8389_ADC_HPF1, 0x64);
@@ -844,7 +844,7 @@ static void es8389_init(struct snd_soc_component *component)
 	regmap_write(es8389->regmap, ES8389_SCLK_DIV, 0x04);
 	regmap_write(es8389->regmap, ES8389_LRCK_DIV1, 0x01);
 	regmap_write(es8389->regmap, ES8389_LRCK_DIV2, 0x00);
-	regmap_write(es8389->regmap, ES8389_OSC_CLK, 0x00);
+	regmap_write(es8389->regmap, ES8389_OSC_CLK, 0x10);
 	regmap_write(es8389->regmap, ES8389_ADC_OSR, 0x1F);
 	regmap_write(es8389->regmap, ES8389_ADC_DSP, 0x7F);
 	regmap_write(es8389->regmap, ES8389_ADC_MUTE, 0xC0);
-- 
2.17.1

