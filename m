Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792940038;
	b=V3WgGCDz1ZnSheHiFImCv6kyg+FxFqwqWQHdfybbIEL6Bh0FWODUwypsCoKeF+DZzxFn
	 tiLqEL+blWlusbwlQZWI+Mbv5ea+HK6hCBOR6SZ/fKklbd9azwfG+sVridW2NdRAI1w4L
	 QbooAWnO2H6mGtxrUTQo6aY7LJxJrVzb9LtRg+UM96e0AUWbn1WZp0fYiG2ym5y8pDnm4
	 +byrB5kmhsMtoKuG+TgFYk9EdTqx+UAZX+iJnziNrYFYnCWb/oa3b3xmcDFoCqtG/dlvL
	 j95K0yY+JvsziDA919CKQz/2QHuuUCfcEZ8Pgd42ID+hvvzO1Lf3bdldgpUJWs0px6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792940038;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6Mom18zR7SoPUqXE9gnzIAbV9IHm5NPCzb9VJVi+Is8=;
	b=EOwalNz3z0jzcrATtkckOCcV8E2ShfkrGnJAA3r/nX/gEB56wf2wCuNPiLBe+h41xy+Z
	 uNVCZoJaEmB/tgZLAwprX78dRejrj4s7ElyZ5l/9u9F1bzJuODFFm4+ORf8t33GB6ThdT
	 UWlZ50M2yVNHJcQde6QjubgmU2aIN45hAZ3XVMpfevJA0H3sjXyN4grhANtYPlcLGorvg
	 3tHOEkvevfK5DvFjirb4mAd2JiMSpmRa3Wp2MC/1w4oZcdup5roZ9w1HwJghy1eVyoIEH
	 7bs28RU/UuWXtZTNLTqcgdOJngoJMmWNAb1kzqXTVvwrI+PDEwI3glCohcRZjEW1lAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KOgjbhA6;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2AE606A332
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 14:53:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E2AE606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KOgjbhA6
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso1188502f8f.3
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 07:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792940037; x=1793544837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Mom18zR7SoPUqXE9gnzIAbV9IHm5NPCzb9VJVi+Is8=;
        b=KOgjbhA6K/o5voVjgsil0QuJV98aIIrN1blNN1fB95Ej5DhKLlAy64XOHuJDD3L7gX
         pkeOUO00OX3pa1eeiPSeIwsCE+QKO61LdkkY4RlAhw8gJgZ7eliGhdWNK/HHcgjTObAL
         m7O11Vv7oh8FjiCGmUN5ikyV0fLbCjTYLpwIkKBXSkwt4bkLSZR9wcWaYJBrbWkfjfLk
         Z1GtHHRSdxQD1EafHWsGqVmMqtSM3r8P4lMr5IFMB65QwI04jLsX7+vF19Pd9q/zOqAG
         SZ8QUqYRW7nc85FNUGw9OMLHQZUQll0PB5DnEVPiEBdddKbvsiZ1V5jjtcYjoYW571qw
         5XQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792940037; x=1793544837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Mom18zR7SoPUqXE9gnzIAbV9IHm5NPCzb9VJVi+Is8=;
        b=QGwLlhyiXW8HdHMctnivCmgP6Jr9+lAuR10uKdsCg+e5dbnTtopNpimJWgyPKjBQJp
         hxw2fpVi7HbhqGm3IkeC3uCakoYFXakKc5HCoFYtA+RDWMtWgzUaq2/ad0Gw1ZXgzm3r
         SNbR3fTtrGMV3mC/gOg0/BdWxOHWP7JHf+MEkcyH1Rirj5Biv1kzVU4VqwMAfwWlJ2oO
         ayasaokoCTEQmAq9ueJ0v0y8eyDjZnsflxb0I/IocJ5TPI21BYmn8/VrDO8TQaLgq2m5
         6aDSais47gD4OUFVf0bqGcUYKviy1nrvQeUpmZ+46CdRZN42siJLhmn4slD+UaNd6pl7
         +FLw==
X-Forwarded-Encrypted: i=1; AKwUvBxlp1WgUAd0ajNCnzpaMOiopp06myaXPZjahJ4qyVGMuq4ZQ49s4FAcXaCfksi5y3ENFukMvAmZFTfE@vger.kernel.org
X-Gm-Message-State: AFq9FYK1ZNCtU8u7Kg6manDS2fd8MVEkg4wM48eFLQAAFruO5bUMnM/R
	vu35q5MhvXR4mBUgBwrLXBWslFe8ed11zefAyVXYcG3AH0+67dZLiboOLwsTsMpe
X-Gm-Gg: AYBFou3ODn27Y/mwRx8RuME5paTqhcVYcPkoLdY7zgXP0Vtk4x+/pXL5Fok1xwRaG5d
	js+KytJ5jis1W3zZnKH4qOtdNL50z00ntcSgb98BXKQU1mdMshsS/ycsjXvYpSkb/m9Me1PxAVD
	w1TijXEZAMwIoHFKJgb+Hh3sTCF8fsrymMesOxsijG6MBYZhGPn/um7+IWS1ic6x6+d0/kwbWGh
	AkLPQKHY830jSDa92Ey0nNd5vLn+IvwquFSfSzhCM+eZyTbkHxjhG7aWESe+UI2OzlqMTfKhixM
	2Jb8xyPcaOtAQ3YynkzwK1gPwyaSa1xWWb4I9fVfiTpICfXscH086co+NlXlHUtMe5/nyE7A7DH
	EwkmYFoEkedFvnY8XdaIo9rIO0iYOPflr6CfeUGsLPy4A/hEni9lXoHc+J2ISpy1kmZQBkXBW73
	Ssl9DyihtDDfnVVfng23yHx2oGMUt4DUEeHxXijpLpKy3X7gChWqeGNC//YaeK56mhpPuJPP9xX
	10jXhhKFGTGiqaPbFuf3SR14wMl1YOG7Y99iHhsZ4Ndn1kwj321CLSoi0+d2m3CchB01+MZsuZ9
	avzEi3vTzcjUVq7Au2iYCEToJpnBlaJMaI09m03HBgIoAdxDMJQvSbDj7FQF1L7JaPmUHxE=
X-Received: by 2002:a05:6000:615:b0:48d:f855:d1e0 with SMTP id ffacd0b85a97d-48e3eba976cmr8372603f8f.57.1792940036702;
        Sun, 25 Oct 2026 07:53:56 -0700 (PDT)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:4c3:3a00:d533:9d50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb9cesm10986471f8f.27.2026.10.25.07.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 07:53:56 -0700 (PDT)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Animesh Agarwal <animeshagarwal28@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: codecs: rt5631: Enable the optional MCLK
Date: Sun, 25 Oct 2026 15:53:54 +0100
Message-ID: <20261025145354.3476371-3-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261025145354.3476371-1-romain.tisserand@gmail.com>
References: <20261025145354.3476371-1-romain.tisserand@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the RT5631 master clock comes from a SoC clock output, nothing in
the codec driver keeps it running, and the clock framework turns it off
at boot as an unused clock.

Get an optional "mclk" clock and enable it while the codec is active,
from the PREPARE bias level, as rt5616 does. The rate is left to the
CPU DAI.

On the GPD XD (RK3288) MCLK is i2s0_clkout, a mux between the I2S clock
and a 12 MHz oscillator. Handed to simple-audio-card instead, it is set
to the stream rate before the CPU DAI sets the I2S clock, so for
12.288 MHz the mux picks the oscillator and audio plays at the wrong
pitch. Held by the codec, it follows the I2S clock.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 sound/soc/codecs/rt5631.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5631.c b/sound/soc/codecs/rt5631.c
index f97fd24e42..82d5e8b9c8 100644
--- a/sound/soc/codecs/rt5631.c
+++ b/sound/soc/codecs/rt5631.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
+#include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/pm.h>
 #include <linux/i2c.h>
@@ -27,6 +28,7 @@
 
 struct rt5631_priv {
 	struct regmap *regmap;
+	struct clk *mclk;
 	int codec_version;
 	int master;
 	int sysclk;
@@ -1536,10 +1538,19 @@ static int rt5631_set_bias_level(struct snd_soc_component *component,
 {
 	struct rt5631_priv *rt5631 = snd_soc_component_get_drvdata(component);
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
+	int ret;
 
 	switch (level) {
-	case SND_SOC_BIAS_ON:
 	case SND_SOC_BIAS_PREPARE:
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_ON) {
+			clk_disable_unprepare(rt5631->mclk);
+		} else {
+			ret = clk_prepare_enable(rt5631->mclk);
+			if (ret)
+				return ret;
+		}
+		fallthrough;
+	case SND_SOC_BIAS_ON:
 		snd_soc_component_update_bits(component, RT5631_PWR_MANAG_ADD2,
 			RT5631_PWR_MICBIAS1_VOL | RT5631_PWR_MICBIAS2_VOL,
 			RT5631_PWR_MICBIAS1_VOL | RT5631_PWR_MICBIAS2_VOL);
@@ -1579,6 +1590,10 @@ static int rt5631_probe(struct snd_soc_component *component)
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	unsigned int val;
 
+	rt5631->mclk = devm_clk_get_optional(component->dev, "mclk");
+	if (IS_ERR(rt5631->mclk))
+		return PTR_ERR(rt5631->mclk);
+
 	val = rt5631_read_index(component, RT5631_ADDA_MIXER_INTL_REG3);
 	if (val & 0x0002)
 		rt5631->codec_version = 1;
-- 
2.43.0

