Received: from smtp153-176.sina.com.cn (smtp153-176.sina.com.cn [61.135.153.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9835B35E94E
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 02:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780973793; cv=none; b=u2rnZyJEjjuiFMnUymsbRatzu6D0xdKyafrVJ43q7pbYy5xJHu8Vtu3RIXe0gvCq96heorPMeYdey2a/8nTNcMKRHxvqYnqI+uximTMjqJWm4RDj0oABuTNWjl3WRkdp2cEEao0PiDOwL+tFslT6xrqx9odse5hS9SUEnTmWHes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780973793; c=relaxed/simple;
	bh=+kC23fJfWIEtRyY0mFE6HKJ7pCVaiysAEoG86s4/l0s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=Gi0ZlW9AMo62wAHOb7OKEaMDMRT29GLDZdHA9qu3goSY9cstXX4ZEyoNX3cUUplS88DWOqoDMKZB+T4jBGm8anZ5XujQ0BElusHYELRvGh3vzOhrzqgo4jMaVeY6ZWad9KK1/fk21rhibn6sC98ob+TcPIsLNutM6Uwr6EPtLIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=61.135.153.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.38) with ESMTP
	id 6A2780C700004488; Tue, 9 Jun 2026 10:56:13 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: A614B344AE824332BCBBFAF0D76F71A6
X-SMAIL-UIID: A614B344AE824332BCBBFAF0D76F71A6-20260609-105613
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	devicetree@vger.kernel.org
Cc: tiwai@suse.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH 5/7] ASoC: codecs: ES8389: Add private members related to HPF
Date: Tue,  9 Jun 2026 10:56:03 +0800
Message-Id: <20260609025605.16945-6-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260609025605.16945-1-zhangyi@everest-semi.com>
References: <20260609025605.16945-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Add private members related to HPF.
And defines ES8389_HPF_DEFAULT

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8389.c | 18 ++++++++++++++++--
 sound/soc/codecs/es8389.h |  1 +
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
index 8e47b4e32..d1bcbbfcd 100644
--- a/sound/soc/codecs/es8389.c
+++ b/sound/soc/codecs/es8389.c
@@ -36,6 +36,8 @@ struct	es8389_private {
 	unsigned int sysclk;
 	int mastermode;
 
+	u8 hpfl;
+	u8 hpfr;
 	u8 vddd;
 	bool mclk_src;
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
@@ -901,6 +903,18 @@ static int es8389_probe(struct snd_soc_component *component)
 
 	es8389->mclk_src = device_property_read_bool(component->dev, "everest,mclk-from-sclk");
 
+	ret = device_property_read_u8(component->dev, "everest,hpfl", &es8389->hpfl);
+	if (ret != 0) {
+		dev_dbg(component->dev, "hpfl return %d\n", ret);
+		es8389->hpfl = ES8389_HPF_DEFAULT;
+	}
+
+	ret = device_property_read_u8(component->dev, "everest,hpfr", &es8389->hpfr);
+	if (ret != 0) {
+		dev_dbg(component->dev, "hpfr return %d\n", ret);
+		es8389->hpfr = ES8389_HPF_DEFAULT;
+	}
+
 	for (i = 0; i < ARRAY_SIZE(es8389_core_supplies); i++)
 		es8389->core_supply[i].supply = es8389_core_supplies[i];
 	ret = devm_regulator_bulk_get(component->dev, ARRAY_SIZE(es8389_core_supplies), es8389->core_supply);
diff --git a/sound/soc/codecs/es8389.h b/sound/soc/codecs/es8389.h
index 7f1212219..81353dcec 100644
--- a/sound/soc/codecs/es8389.h
+++ b/sound/soc/codecs/es8389.h
@@ -105,6 +105,7 @@
 
 #define ES8389_MIC_SEL_MASK           (7 << 4)
 #define ES8389_MIC_DEFAULT            (1 << 4)
+#define ES8389_HPF_DEFAULT            (0x0A << 0)
 
 #define ES8389_MASTER_MODE_EN         (1 << 0)
 
-- 
2.17.1

