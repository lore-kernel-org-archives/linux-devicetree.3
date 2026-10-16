Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E58E4749D1
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 10:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146861; cv=none; b=TktG77VeONhono7KjWMQkRLMipWK6Djhg+6bcjBjEJNLFgFnpwLhILtzhsfkwM6FBDOA7tJahlmUS8sVihjmowehWPQi2ixp66q2uAtRyVh2LPTh66beFrFpPhFgtePda4w6SKnsnkpv9RgZWr746lHegS0mLYaNzbvS/xeTz/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146861; c=relaxed/simple;
	bh=Nv8VQkbUiPG1aZzPVXB79Tte0iN24CS3tAzHXZLKcRQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WRzJ3LJeytqyLgPnAa2N4hmkzl2vieSRda4f9xEqvuaNF8TFhO4iIAV5AOOyaN1gU+tcvsDnPs7Hvrxp8gp69p8QyzuCxTqbPNyTCDawS7qaaB80G93X2Lcby6fbQFE1uZ6Zpp+9IVYjS65tmtL4vL3KAd8zIhOUKhpPuyKk1sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=iSA9ftEE; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="iSA9ftEE"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48df54150dfso1029594f8f.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1792146857; x=1792751657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x+lEaq8UIfWxZ/tIjV0SG6p5OStGVbQ7BX4PDBI90Lg=;
        b=iSA9ftEEQ8FdEMAlr4xr2hn58OzlzVzrjXXbaI7l0sSL4u9yroyiz+BjsyFTlwOusB
         jqEmY4YD4HgpXZbmnglOYNYanlWmP3Ry2n6CTE8tvCAwFcRMsKr1tQv7fJF1LqPCp/NH
         /MA2StCJ3x0LqaGhmQz+889q492f10a52TW8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146857; x=1792751657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x+lEaq8UIfWxZ/tIjV0SG6p5OStGVbQ7BX4PDBI90Lg=;
        b=g4pGWt5kZ9yOx0BB8mmVTpzwkjzNWg/ZPMlqmNaeLT53e8VRutYHWH3HIdFacm6cmf
         HH54JnSSdtl3nQ6CGI0FkJirYpI5RxmaV0PtFhStq4VfyBsiXO9vmm73OWrnauBKpdm+
         TmsF7gS/PT9kvztfNEZuTjgavg8WHeUFz3uVU23sSWb4dFnHI/8XwZCAjRQBP3HEwfuF
         uC0L1Bj6i1v5gHQW+14lByqjV31ouy4mlCk5UIsUZ0aD1vizdU/RtqywoogavdGaFQ2W
         zTtntPXFoNkkodXEyg8yJUG/xQCSPnWFjH/xPpONkC+bzYJDZWT0evWr5lfalNVBokCl
         gJFg==
X-Forwarded-Encrypted: i=1; AKwUvByIc7/bKPD4w+OZoAH7+mbW7+WK83HTUPOmD1d15doxtHjn2XIobooWo3Gt8qT3aevTF4KkK5qq31oo@vger.kernel.org
X-Gm-Message-State: AFq9FYIvW9ZM+SlAT9hzt87tZR3acIRuNc7Q5qpjFTAJLXj1QaLFWay9
	QOxuU6ptBhBcgiyMnnwNseJ0LxraPRRSdCutaH5jGlUdABix1BGMi0qItlaV1NLXjkA=
X-Gm-Gg: AYBFou2HSMCG4uzZGsJIo0BLCuMikJNbvhIgI1soJgi3RujS2hT5mufl2q2RZu3jZvG
	DGZbEwwJ+/BR2O+JyqbEXUwICbDPoNU//mJGrUJu236Kk8zT8VukKrws95rVkGm3OyBrKwd6CY3
	WM9Jd90p/NVKfWi1SRo74gEhXbuzYdfG2kbzvbwiZeLzasJRO+HzPIkI5ORQuNUUVA6nqxYRmjE
	RFNyrnwICC8FBdNud+S8JcPsXM+xveBQADI4MM7BRenggmNgZZWcUkWFoWYFjEMg2A9bufZHIXJ
	syhHFLdgjru57MdncIN0UBYsWWDCkEqtiTzKhuuIH29NBsy+vGjXKFfTJyq7k9qbQWfnBdtv+Ns
	fvqKJ45pFU6tdoKaE911Jv0fliqyMbnfsOIz9xk7CBPJ9/Mqt0hCNZ5M6EUbzSq+7LwQFHwE+yp
	tpyprSPG5+Refprw6wnxseZCIa4unP6TAd7YXL6Tr+tSUHlhKxqBbY+EfsifFrLeP1StROTNkEL
	dXQuZU+l2PE3ybJe9xhl5u+RkYkSMIozx3ruOgFu0+DkGFS95pAZ8Y=
X-Received: by 2002:a05:6000:2905:b0:48c:6d9d:9f90 with SMTP id ffacd0b85a97d-48dba9d0b47mr43566956f8f.26.1792146856850;
        Fri, 16 Oct 2026 03:34:16 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-8382-0206-0000-0000-0000-0bc0.ipv6.o2.cz. [2a00:1028:8382:206::bc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503862sm4154979f8f.46.2026.10.16.03.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:34:16 -0700 (PDT)
From: =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
Date: Fri, 16 Oct 2026 12:33:55 +0200
Subject: [PATCH v2 2/5] ASoC: pcm179x: Refactor regmap value lookup
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261016-work-v2-2-9340b9555fbb@amarulasolutions.com>
References: <20261016-work-v2-0-9340b9555fbb@amarulasolutions.com>
In-Reply-To: <20261016-work-v2-0-9340b9555fbb@amarulasolutions.com>
To: Peter Rosin <peda@lysator.liu.se>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Sen Wang <sen@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
 =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
X-Mailer: b4 0.16.0

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

