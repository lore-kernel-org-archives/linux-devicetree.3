Received: from r3-175.sinamail.sina.com.cn (r3-175.sinamail.sina.com.cn [202.108.3.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969A332B11A
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 02:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780973780; cv=none; b=TTBmE/O+y8SmlgiAnu9I6BeVCtkVY0kPVYaE0GfyVZz/LQ3eugCb8zmnANKCweXUNnhNkkCINaCBnKqGN8T4uYNmbHNyBi1c6xGtfPmI0mESn86jxc2vivNEBXrybfAOvsOfPjYhWNuOPX3ChdCNE+4JAmhLdb7uhZZk/uqK5CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780973780; c=relaxed/simple;
	bh=ISZ8nJfvDhXac2Hegcw7uLqndxcBGKRll03oM0neP5U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=b/oLVJb+m+fDrJr1F5e3EVGw05/w4NFfULr70W3ZTCHRGup3gLmTw/9z+OGo5HZVmIKUl7qra55BUOn/MeqzrXzUB4R3ZfVRTnnwVuEegZgxzTO1+uQho0yTgaVdfvfenhQi3fpry+gprqr0Du9n3XDyE5zbta+YR8zThxSvBDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.38) with ESMTP
	id 6A2780C700004488; Tue, 9 Jun 2026 10:56:10 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 4336C287E3AA48578C91BD82B24240EC
X-SMAIL-UIID: 4336C287E3AA48578C91BD82B24240EC-20260609-105610
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	devicetree@vger.kernel.org
Cc: tiwai@suse.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH 2/7] ASoC: codecs: ES8389: Fix the issue about mclk_src
Date: Tue,  9 Jun 2026 10:56:00 +0800
Message-Id: <20260609025605.16945-3-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260609025605.16945-1-zhangyi@everest-semi.com>
References: <20260609025605.16945-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Fix the issue with incorrect modifications to mclk_src

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8389.c | 12 ++++--------
 sound/soc/codecs/es8389.h |  5 ++---
 2 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
index 9c8164916..7a9d5d42a 100644
--- a/sound/soc/codecs/es8389.c
+++ b/sound/soc/codecs/es8389.c
@@ -36,8 +36,8 @@ struct	es8389_private {
 	unsigned int sysclk;
 	int mastermode;
 
-	u8 mclk_src;
 	u8 vddd;
+	bool mclk_src;
 	int version;
 	enum snd_soc_bias_level bias_level;
 };
@@ -607,9 +607,9 @@ static int es8389_pcm_hw_params(struct snd_pcm_substream *substream,
 	regmap_update_bits(es8389->regmap, ES8389_ADC_FORMAT_MUTE, ES8389_DATA_LEN_MASK, state);
 	regmap_update_bits(es8389->regmap, ES8389_DAC_FORMAT_MUTE, ES8389_DATA_LEN_MASK, state);
 
-	if (es8389->mclk_src == ES8389_SCLK_PIN) {
+	if (es8389->mclk_src) {
 		regmap_update_bits(es8389->regmap, ES8389_MASTER_CLK,
-					ES8389_MCLK_SOURCE, es8389->mclk_src);
+					ES8389_MCLK_MASK, ES8389_MCLK_FROM_SCLK);
 		es8389->sysclk = params_channels(params) * params_width(params) * params_rate(params);
 	}
 
@@ -897,11 +897,7 @@ static int es8389_probe(struct snd_soc_component *component)
 	int ret, i;
 	struct es8389_private *es8389 = snd_soc_component_get_drvdata(component);
 
-	ret = device_property_read_u8(component->dev, "everest,mclk-src", &es8389->mclk_src);
-	if (ret != 0) {
-		dev_dbg(component->dev, "mclk-src return %d", ret);
-		es8389->mclk_src = ES8389_MCLK_SOURCE;
-	}
+	es8389->mclk_src = device_property_read_bool(component->dev, "everest,mclk-from-sclk");
 
 	for (i = 0; i < ARRAY_SIZE(es8389_core_supplies); i++)
 		es8389->core_supply[i].supply = es8389_core_supplies[i];
diff --git a/sound/soc/codecs/es8389.h b/sound/soc/codecs/es8389.h
index d21e72f87..7f1212219 100644
--- a/sound/soc/codecs/es8389.h
+++ b/sound/soc/codecs/es8389.h
@@ -116,9 +116,8 @@
 #define ES8389_TDM_SLOT               (0x70 << 0)
 #define ES8389_TDM_SHIFT              4
 
-#define ES8389_MCLK_SOURCE            (1 << 6)
-#define ES8389_MCLK_PIN               (1 << 6)
-#define ES8389_SCLK_PIN               (0 << 6)
+#define ES8389_MCLK_MASK              (3 << 6)
+#define ES8389_MCLK_FROM_SCLK         (1 << 6)
 
 /* ES8389_FMT */
 #define ES8389_S24_LE                 (0 << 5)
-- 
2.17.1

