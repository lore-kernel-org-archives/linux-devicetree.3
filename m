Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94EC47ACE9
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 09:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934598; cv=none; b=kUojCzKSYAUSKIe+T6eeE/ELRND6GaT/EWj/nzWzvZSV5VDwrBpX7QuChKjfHVVRfZJP5B1o6jwSVkUIz09cDoXUJ9X8ZO1Y5iyeMeQu4qNZxQm8Hg7tAZMM3/9prUqzypaqlj5BqUOKt6J9pRGO5ODsaDZ2UMMeTBiljmt0nS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934598; c=relaxed/simple;
	bh=Nv8VQkbUiPG1aZzPVXB79Tte0iN24CS3tAzHXZLKcRQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UEQo9uUDvNOTz02UZO9gHTfLUFEq69hdXJs1GuLZ3nLwURYYJp6kf9k2Gl37U5Xf2WBI8Qxng3kSwPPOTtN6KBu9km+1iDC6lkUC/o6e1QTh6TBEoE17P4USa9Yw+5sKhYOInw+h5FXDVWSzzQBogsbbmz+HqOA2ZfJCNKcfdcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=rgvTibfr; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="rgvTibfr"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so41104835e9.1
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 02:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790934587; x=1791539387; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x+lEaq8UIfWxZ/tIjV0SG6p5OStGVbQ7BX4PDBI90Lg=;
        b=rgvTibfrt5n34qHdZWsWd4UAw7AJ80LPg/AA2Zwuce3p7b4525Z3vB3o4oQAM1aXuT
         y1ScqnORIXcjjAiLl7gceJ62OaGNTGiIYJyGZ8OA6eSEjEHJBGXxDNteae6dP88oNgLz
         uKSBzRSemLzcnVyDhW1zjgoPIV76Jpxl11KDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934587; x=1791539387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x+lEaq8UIfWxZ/tIjV0SG6p5OStGVbQ7BX4PDBI90Lg=;
        b=W1TW+tvkFDSJjUwFBMWqI0ZU04k8tfdqVX+8WxM/yUTAy4nORg1RgN15qWfw5POt8Y
         eEYgqk9rsm+H+4/vGQAQermr0fmPioLBNqUjeCcNuKUZTcLwPBvfBxQ054sAaBeqZbrb
         J5WBld44PwFlFWJSkmrDwcNkq8466DGJUf6TKBZRHNVj1u00XHl8dPVQlPJB+YGvbMAE
         BLqE88PWnaaF0EWODT/IUyKBQiu9uH8UKqVWv3fmBDSjQf+NbvzF8ty6SaGBmFK71w/L
         NJNAK4CLNlw0UJgPmDnDiwkqjQHFQR25lmKbv0rwrLn9pa+Kf/72uQoyFvk72TDtheDW
         Z6Dg==
X-Forwarded-Encrypted: i=1; AKwUvByLifmDN5GrooVrP3dIO/8H0DWcWBZFAp+ggOv79tcJ80iHoxzo9mPkIBcr3y8+ezo+oUstE2RNwtne@vger.kernel.org
X-Gm-Message-State: AFuF++lT8Vbq4vbiQBG95iQ62TqxTvPbNnzz7UoGkwIZT2vX1RHRdxT7
	eyxH0WLy7QxLDNAJmVRvgAc3gMGrY7CK0k3ODWcTFVPrgIlqfFTVIM2GlgT4+JC6JFcNTZMnfwN
	4cb0IYgvgpw==
X-Gm-Gg: AYBFou381XpowlX2Ks0eAE1QOZMrn2l03hek2iCLq0Oxv1QPL9k1y5XxUe1jOn2zNoB
	klXwiupWp+qDddovnrpyOOsl54dnIHZ1nOLKIcm/o7vSgrp439AV2hE0EcISRo8GezBP2jkfsAE
	ApuuX7pUy8h+ajmbP+siJGJ/ET3T87iXdHSBo4fBGmy0YCsxkWTzQQJvsbGKZECKiYrTS2M5evi
	zf+OONbAxFlGjXQ0xMeKksjLKyXY4Zu0LHQ6XAoA8ZK51j0BDLUPbS6BXZbHnMTVsP++ey6LIKL
	imU/Rm7D3FFCWOEedTHAkkaow/nZLcqxzDe9m+OIbWWQARYYqixCXxSAii02H+kKt9Zq1NMvsnZ
	vRsaTAkWpwhh3/WOw3aYPgtYBGbLrb6TJcqgvLIoniDy1pDcaz6cKVbRQW1yRGEin2nkgyZVYml
	oO3yDrM8LkTrL7SfnD/8CXCpI3aDcoRU83+FKKyNzVSSxJnu/0YA+RjRs1RyYwAwzR8Y6ibpblr
	Ck=
X-Received: by 2002:a05:600c:1d09:b0:4a0:37d:9e21 with SMTP id 5b1f17b1804b1-4a0276ed19amr37928025e9.29.1790934587622;
        Fri, 02 Oct 2026 02:49:47 -0700 (PDT)
Received: from localhost ([93.90.163.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a039505568sm52146605e9.3.2026.10.02.02.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:49:47 -0700 (PDT)
From: =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
Date: Fri, 02 Oct 2026 11:49:31 +0200
Subject: [PATCH 2/5] ASoC: pcm179x: Refactor regmap value lookup
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261002-work-v1-2-f0e53bc7331f@amarulasolutions.com>
References: <20261002-work-v1-0-f0e53bc7331f@amarulasolutions.com>
In-Reply-To: <20261002-work-v1-0-f0e53bc7331f@amarulasolutions.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Peter Rosin <peda@lysator.liu.se>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Sen Wang <sen@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 asahi@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>, 
 linux-amarula@amarulasolutions.com
X-Mailer: b4 0.15.2

Use a table lookup to find values for fmt register instead of switch
statements to prepare for additional codec variants of the same family.

Signed-off-by: Roman Smrž <roman@amarulasolutions.com>
---
 sound/soc/codecs/pcm179x.c | 60 +++++++++++++++++++++++-----------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/sound/soc/codecs/pcm179x.c b/sound/soc/codecs/pcm179x.c
index cb70927872aa..61b87dab3266 100644
--- a/sound/soc/codecs/pcm179x.c
+++ b/sound/soc/codecs/pcm179x.c
@@ -65,6 +65,31 @@ struct pcm179x_private {
 	unsigned int rate;
 };
 
+struct pcm179x_fmt_table {
+	unsigned int fmt;	/* SND_SOC_DAIFMT_* */
+	unsigned int width;	/* sample width in bits */
+	unsigned int value;	/* FMT[2:0] */
+};
+
+static const struct pcm179x_fmt_table pcm1792a_fmt[] = {
+	{ SND_SOC_DAIFMT_RIGHT_J, 16, 0 },
+	{ SND_SOC_DAIFMT_RIGHT_J, 24, 2 },
+	{ SND_SOC_DAIFMT_RIGHT_J, 32, 2 },
+	{ SND_SOC_DAIFMT_I2S,     16, 4 },
+	{ SND_SOC_DAIFMT_I2S,     24, 5 },
+	{ SND_SOC_DAIFMT_I2S,     32, 5 },
+};
+
+static int pcm179x_fmt_value(struct pcm179x_private *priv, unsigned int fmt,
+			     unsigned int width)
+{
+	for (unsigned int i = 0; i < ARRAY_SIZE(pcm1792a_fmt); i++)
+		if (pcm1792a_fmt[i].fmt == fmt && pcm1792a_fmt[i].width == width)
+			return pcm1792a_fmt[i].value;
+
+	return -EINVAL;
+}
+
 static int pcm179x_set_dai_fmt(struct snd_soc_dai *codec_dai,
                              unsigned int format)
 {
@@ -96,40 +121,15 @@ static int pcm179x_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *component = dai->component;
 	struct pcm179x_private *priv = snd_soc_component_get_drvdata(component);
-	int val = 0, ret;
+	int val, ret;
 
 	priv->rate = params_rate(params);
 
-	switch (priv->format & SND_SOC_DAIFMT_FORMAT_MASK) {
-	case SND_SOC_DAIFMT_RIGHT_J:
-		switch (params_width(params)) {
-		case 24:
-		case 32:
-			val = 2;
-			break;
-		case 16:
-			val = 0;
-			break;
-		default:
-			return -EINVAL;
-		}
-		break;
-	case SND_SOC_DAIFMT_I2S:
-		switch (params_width(params)) {
-		case 24:
-		case 32:
-			val = 5;
-			break;
-		case 16:
-			val = 4;
-			break;
-		default:
-			return -EINVAL;
-		}
-		break;
-	default:
+	val = pcm179x_fmt_value(priv, priv->format & SND_SOC_DAIFMT_FORMAT_MASK,
+				params_width(params));
+	if (val < 0) {
 		dev_err(component->dev, "Invalid DAI format\n");
-		return -EINVAL;
+		return val;
 	}
 
 	val = val << PCM179X_FMT_SHIFT | PCM179X_ATLD_ENABLE;

-- 
2.55.0

