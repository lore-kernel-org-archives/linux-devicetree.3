Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793543441;
	b=yx3XOkFtsW14ll30stzubZuvohwAmZIgKTQsYVEjVZvRiuDGJumXH/zY00GE+pTn6NHJ
	 QTceOLHsrU57kc5GCeFIWiUVzQc3HgQACz8SPfUrgmfROpTAYMYgudUsAclrd/okGvMsL
	 AkmROb4jfxiQRZULe1XJWpYUfTAyU5bMa+exre/WLaTwLYtGAJ3/lQVUk2X92RCDH8CSG
	 bAfpARcL8vlLEWkOJWYAbE55jriVJ9i2afMynOydxvzpH8V7DaYQohbCSLnDXrsG/Xk9L
	 5DUAAWI7vN4cr6yY+hpoWMteF6M8xWlfV7eFNZr8hC3kn4tkRyXMjmiYPY1Y7FhKKnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793543441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tmzM1He6Zcm6h21veWQ/ul9U4i6SIDSSoe6SFpMsROk=;
	b=JCexJZTm+JhuZldm9OPABHwdtqfAlJRWfC/q04jJcGpPanT0eZonHpR9mDyOl6jIzmzI
	 yiQ1Oe8+ek3twvxFv6AnW42074fjRvxImcVESO/VD5MqMsH4/QlE99zgHIDWd+pe1aiiI
	 ks31i1+EckkgSKNz7spIIDO2IuRJT+jBjq9z8dDF/g/bQ6JNXBVGIMcj9RSn4FUORBjRb
	 UtzxgEAngUyAUONPCaone4v3nhy30xqw9ioUfnaMUy01pZH9+z97GAB2izaLLjC7GEdqu
	 CjTBPDtTXakVTktx+HYURCRIUWrH8+RsrIoJp4/NTbHUOWGAw4+6Hbt7t1b4s9B9Fvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A+M1Wa+n;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C97606A33B
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 14:30:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20C97606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A+M1Wa+n
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so22372885e9.2
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 06:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793543438; x=1794148238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tmzM1He6Zcm6h21veWQ/ul9U4i6SIDSSoe6SFpMsROk=;
        b=A+M1Wa+n9o6Ai1aDy5wIuMQ1Qwkbm9uj6N1YCs0axvyRq7zp/S7yNcm1HxCpeoriTL
         zUnYBMuGWUzpBFYEOgmnCb2zGtGGMm4c3BdODeDl8X5kDIkr8cVgmGz4ByekK/bl8pVN
         jlsUoSoWe6slMLaDpSMbNHI8j5mIKBjQ6BkqKzfBSLey/wSh7FU9UI9b95ZHUH1etdy/
         gmxHgT2czUkR0YvQiOTmKJeGoE0uOyNvbRzDjQEeUVphq/ar6VwmK3kJMVb70OaOpU32
         mybNpWC2JN/pg42L6iPUBn0HyZFEBy/p5s49JO7MKlLwA5sMzpr+XG6ZOdTC42GQg0h7
         iYmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793543438; x=1794148238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tmzM1He6Zcm6h21veWQ/ul9U4i6SIDSSoe6SFpMsROk=;
        b=C5z/DfeYdi3v52MFesj8IYop9BOzDuwFUuJC+gPY5Q72UKN88TH6OXWIsUJGNfTBOi
         t1dHBTl1XvDtINyHVuOec9ZOH4jTbX9oyZcGiEvBr5N5UWUFsFrKOpKXveq21hGAtYbs
         VnscXUPVs6jKa3qv9bSwqqYQ/R3HRx8z0NqJIAC4nIkgaXgwS5A7dKut3JQDJK/dFX0Y
         x394Jr9sPnlhrp//FCgkc9w5kvZ+KGqav//nxF+7UR9HnNDIK5vAe6TnQiWFIaanUVtB
         OQP16aM4QMd7PxqwXCcCUFJu2qAKh+qHTXDNMhDVObew4TO5d30UtBMWpDcp6sxP5gRN
         lDEQ==
X-Forwarded-Encrypted: i=1; AKwUvBydpabrUC7Rro8DE0rOVCj2nUeoy5sB4bTDoBHESscTpwMxmuVBi1Hh2X34BiQnw4KywyaY1+zuTNL0@vger.kernel.org
X-Gm-Message-State: AFq9FYJVIJHe0ywA1qddbiMG8H+9O+0NWaIHU07CqLWWcoAN5ICNe54y
	vSchKJJHqKbZB98ieN5IVpO5tJPMtvs6pcwT2IxUXCMf7kdA53lNfswU
X-Gm-Gg: AYBFou3wZ6bW81qsnNcqL1L4ao0iNKs48E6hX20H5IFh9vGvQZaswdqCmHGrovMmAMV
	ugz4/vMCGPyZBoUvOy8GJTNAkP1F8KDJ239n31s2DgwNoQUSk8wG0tFvimwTHXbneL7+m1J1m8w
	kEXy6hlLLaGwoaH/GtkymgRYoDGCmd9PXOUsaigFy81dKmmQISnpmWljHlHidx6zITfrUsmOZLm
	G5FmKsV79MqfLzyosIThY27ARnP5mxlNFPvKjX+M2+ELyJTNEC/tfraGejunGGbHUp0X04+domP
	3CUDl9z3sXol45xjuCskWWClrhY3zyMcMyPZXzE0/V3rV24HkpDAKigHCgFPgXXP06bpyKnFp0i
	cQmekXazMDKdv1p7n0JC9UF9LgpmOe4th0RHWM6kttrtvibPgK9ldAinLq+j4rwq+oDy5OR2CIt
	63jI+EltRHOjrUfoy6fy8f75sgIwOBfl6avWhzhQkzcHgoxlOx9nu0QkajKfk7fjXyUg7eQO6xM
	FJa4j3I3wFBKhfbiQnYj+A/SJeCddQJ0KbYYO3EXo7murH7fuyFFQ4CEj1cqfB6An9my7N9guJ+
	EzA0yUSbtxcHLgRpKY6Fw3rYwDwP1ra7E0qGf+nt0SYNC95eFfkl1859sunAjgsBawZHi8zNdR0
	vy3Nh+So3ru/cr61plo2J+uWrXf3+UAI+GWV3hqLwrqaT6g==
X-Received: by 2002:a05:600c:4752:b0:4a1:9661:14b5 with SMTP id 5b1f17b1804b1-4ac18e5d4d0mr184744515e9.29.1793543438534;
        Sun, 01 Nov 2026 06:30:38 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:849f:a468:4121:a85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe7706516sm138430595e9.0.2026.11.01.06.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 06:30:38 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Oder Chiou <oder_chiou@realtek.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Animesh Agarwal <animeshagarwal28@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH v2 2/2] ASoC: codecs: rt5631: Enable the optional MCLK
Date: Sun,  1 Nov 2026 15:30:35 +0100
Message-ID: <20261101143035.880469-3-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101143035.880469-1-romain.tisserand@gmail.com>
References: <20261101143035.880469-1-romain.tisserand@gmail.com>
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

Get an optional "mclk" clock in the I2C probe and enable it while the
codec is active, from the PREPARE bias level, as rt5616 does. The rate
is left to the CPU DAI.

On the GPD XD (RK3288) MCLK is i2s0_clkout, a mux between the I2S clock
and a 12 MHz oscillator. Handed to simple-audio-card instead, it is set
to the stream rate before the CPU DAI sets the I2S clock, so for
12.288 MHz the mux picks the oscillator and audio plays at the wrong
pitch. Held by the codec, it follows the I2S clock.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 sound/soc/codecs/rt5631.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5631.c b/sound/soc/codecs/rt5631.c
index f97fd24e42..d523d6d3a2 100644
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
@@ -1726,6 +1737,11 @@ static int rt5631_i2c_probe(struct i2c_client *i2c)
 	if (IS_ERR(rt5631->regmap))
 		return PTR_ERR(rt5631->regmap);
 
+	rt5631->mclk = devm_clk_get_optional(&i2c->dev, "mclk");
+	if (IS_ERR(rt5631->mclk))
+		return dev_err_probe(&i2c->dev, PTR_ERR(rt5631->mclk),
+				     "failed to get the mclk clock\n");
+
 	ret = devm_snd_soc_register_component(&i2c->dev,
 			&soc_component_dev_rt5631,
 			rt5631_dai, ARRAY_SIZE(rt5631_dai));
-- 
2.43.0

