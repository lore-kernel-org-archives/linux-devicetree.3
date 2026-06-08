Received: from smtp153-177.sina.com.cn (smtp153-177.sina.com.cn [61.135.153.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE693B0AF3
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 08:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780907798; cv=none; b=j2+jOdN/in0ASHsom2j0JqWoWXHvnu51aA98ruX9u7CZN/8oANhDN2OnJzyY3cIb47HEZ/LBmiNDkOajuN/plz+3C8jsdlPkwjwbPZi7EsrgKnYBbNkpTgF9RycOBmeR2xooO/P0aT7gl+em/XfnZnPhTU5+gg46AsIVM5mbP/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780907798; c=relaxed/simple;
	bh=Gvf2FB/62al6MAXAH/yyj8tJrfqQJwKPUfaveLcQGb4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=I8xUYwYARnBZxd6cH5FjgMlugG+obJwXou3z8M5KWeYcW94xLEA4aye5l+dL8nUatZtXY9uTMy+twAHI5b7CliFBCka1X2eO/DIH+T/KxBLXV5vw5Utwr0L+rRn90NmoNLdB69g+42LPM1H8cmrDoORzQbTmuxNkZ9OjtE/RrTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=61.135.153.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.38) with ESMTP
	id 6A267EDF00000BB8; Mon, 8 Jun 2026 16:35:49 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 107109EA907043CA9C1FDC3B15178E21
X-SMAIL-UIID: 107109EA907043CA9C1FDC3B15178E21-20260608-163549
From: Michael Zhang <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	devicetree@vger.kernel.org
Cc: tiwai@suse.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v0 5/7] ASoC: codecs: ES8389: Add private members related to HPF
Date: Mon,  8 Jun 2026 16:35:38 +0800
Message-Id: <20260608083540.12581-6-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260608083540.12581-1-zhangyi@everest-semi.com>
References: <20260608083540.12581-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

From: Zhang Yi <zhangyi@everest-semi.com>

Add private members related to HPF.
And defines ES8389_HPF_DEFAULT

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8389.c | 18 ++++++++++++++++--
 sound/soc/codecs/es8389.h |  1 +
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
index ad016c255c77..743cfca2a6ab 100644
--- a/sound/soc/codecs/es8389.c
+++ b/sound/soc/codecs/es8389.c
@@ -36,6 +36,8 @@ struct	es8389_private {
 	unsigned int sysclk;
 	int mastermode;
 
+	u8 hpfl;
+	u8 hpfr;
 	u8 mclk_src;
 	u8 vddd;
 	int version;
@@ -742,8 +744,8 @@ static int es8389_mute(struct snd_soc_dai *dai, int mute, int direction)
 			regmap_update_bits(es8389->regmap, ES8389_DAC_FORMAT_MUTE,
 						0x03, 0x00);
 		} else {
-			regmap_update_bits(es8389->regmap, ES8389_ADC_HPF1, 0x0f, 0x0a);
-			regmap_update_bits(es8389->regmap, ES8389_ADC_HPF2, 0x0f, 0x0a);
+			regmap_update_bits(es8389->regmap, ES8389_ADC_HPF1, 0x0f, es8389->hpfl);
+			regmap_update_bits(es8389->regmap, ES8389_ADC_HPF2, 0x0f, es8389->hpfr);
 			regmap_update_bits(es8389->regmap, ES8389_ADC_FORMAT_MUTE,
 						0x03, 0x00);
 		}
@@ -905,6 +907,18 @@ static int es8389_probe(struct snd_soc_component *component)
 		es8389->mclk_src = ES8389_MCLK_SOURCE;
 	}
 
+	ret = device_property_read_u8(component->dev, "everest,hpfl", &es8389->hpfl);
+	if (ret != 0) {
+		dev_dbg(component->dev, "hpfl return %d", ret);
+		es8389->hpfl = ES8389_HPF_DEFAULT;
+	}
+
+	ret = device_property_read_u8(component->dev, "everest,hpfr", &es8389->hpfr);
+	if (ret != 0) {
+		dev_dbg(component->dev, "hpfr return %d", ret);
+		es8389->hpfr = ES8389_HPF_DEFAULT;
+	}
+
 	for (i = 0; i < ARRAY_SIZE(es8389_core_supplies); i++)
 		es8389->core_supply[i].supply = es8389_core_supplies[i];
 	ret = devm_regulator_bulk_get(component->dev, ARRAY_SIZE(es8389_core_supplies), es8389->core_supply);
diff --git a/sound/soc/codecs/es8389.h b/sound/soc/codecs/es8389.h
index 13ce241774dc..197e6f7b27e9 100644
--- a/sound/soc/codecs/es8389.h
+++ b/sound/soc/codecs/es8389.h
@@ -105,6 +105,7 @@
 
 #define ES8389_MIC_SEL_MASK           (7 << 4)
 #define ES8389_MIC_DEFAULT            (1 << 4)
+#define ES8389_HPF_DEFAULT            (0x0A << 0)
 
 #define ES8389_MASTER_MODE_EN         (1 << 0)
 
-- 
2.54.0.windows.1

