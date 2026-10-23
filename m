Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768816;
	b=HhPT2f0T2715V+cdWFdZCEhZF8nsoJB9vsfajAn0WHhohKnDWzN4fbW0R/PvnvPgCena
	 fpD06yFzinjY4R2pv9chAAH2ohqAyXrTKa10pioBNimMYigYUYTo1lHRYDfDfajPZRWay
	 YxPatffmMSSMsdbS0jCxGuXW0MvI2tywalPe/JT4RYnfnPNrm10XvyKyol+ZRTbg0aww8
	 l0XxmQs7iyAJ1q0wk1b2PYp9H/26anJ5p3uFwMVDAq7gUw7+J1pT6XeokFS9OTG/+mvNQ
	 h0ueILnGm6+wf6LHoETykmIUeh816cLiOlCdU0oiOSaFf4i8gcukqybuPy8SUckYpew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=47E23RRn1IGlLUPJGucX0ruY7TugyQuZlKKLhnfTxX4=;
	b=g/SsGHnJ8fJesI5awfEDn+T/T+/B/xYNJapgAEAeyGRrhYheXNU0osIT8UH/mc48GLCe
	 oEZUUgH8JlZYqX2083gdkEztoIZygSFE2FndhVRSfCPUMi0D1BmIiF0o6/hcyHPzWklNr
	 Df4h9WYq/0SzyhzQB40ut4mmTIq1Iaia36vG1VZ9rUrMALiFn09lRYUgCxmx0fi7FGuru
	 DheykHJWldE5JkIB2AjfxKVjcOsPuxON2lj9b+TbZSa272YXyePziL4gsZqhW9eRUfYB9
	 rDaxwJoP4axC7O2ZuZ5vXa132A5X5cWsztrVYgGBVdvIHA+K0RQxfwkjI56CT7XS70g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=r6+ihWkU;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E0A606A323
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 15:20:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45E0A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=r6+ihWkU
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e3b22e971so371086f8f.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 08:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792768815; x=1793373615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=47E23RRn1IGlLUPJGucX0ruY7TugyQuZlKKLhnfTxX4=;
        b=r6+ihWkU1itlUw7klTH+2cDv5mn98ZkucpqKSssZ8bTaixwa6b1yCQ4WNTasA6JE+J
         flYWgXLvdGJLAW7EsN0XImhSFD6v/cdjpUlKkv7ocWh5//6zcSvUQQwwqNW1tLoP3xUU
         HwKmKY+Kp6dMocMBKH3n0a64r0ijiTUCGGCazkifLq0gD0oUEDMApxFwZTZnoRcAdy++
         QoX0Jj7fjfhewdk/s22z+XIXdJiJPy1ndmifxv9owvf9pwre1Ba068sQgILOFSroRsai
         JXc3F+TPgOOhMvUNHBtnFFf5kf0KRGxX4oggL36/BFH+z16WgJBvWS+gBZbLidtvYh92
         3MaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768815; x=1793373615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=47E23RRn1IGlLUPJGucX0ruY7TugyQuZlKKLhnfTxX4=;
        b=1Uo+LtQWeS44UJ7GsckzboRHsoMKRT3S2rSgpX1Fy/KKDTgHN0G9JLmcuXM34AD69U
         LKVG3xEgAwqTz/DFR1lnnaFVgK+Nt0DqwAbReXuk1pqw2LcWZwC3oVhLeMJVzD9Qjl+H
         cleI2SRZO4ADqFvnBv/+iKH5dhGyr1UTxEY6QzsyhukQ6NlltxYCwGw9VcjuopvRxxrt
         3hJX4WMNnunZ0s2vBux0SUTp7mFnRTSML6t3A9D3XAI7NsSIKRSRyCc10L8YS2Nt3csd
         qNtJDGRL6Xn7uGGsZSZzuZvGnOGpX1jlQcqZMnGLz7Qwe/dcMAF/VymfMapoBzhZsYqG
         m0vA==
X-Forwarded-Encrypted: i=1; AKwUvBzP7guw9E7XYoYUGTT9vdKyg40ypAoLnICLMemuSgvDjAJFzbvRG+eSpOhYwVxzYAq+qNXepMkd/2Hi@vger.kernel.org
X-Gm-Message-State: AFq9FYLAWX9wyBl34IRyzzhNA/BGnLyea/W9vUKDNQUw3DtKAjr3tp3x
	JLRpm4g8mioaUfIWkiZH5TmUfqspMm0m0yLJmsIbPRYoEwdxGUiNNU1xey/yEu4yIzU=
X-Gm-Gg: AYBFou2cGN6dFR96icIR3yZ0J+gLcc84lwETnFSd4MAsjCV0RyEMyzrFiAG4C/31K3e
	dd48gKuLhHJxWoCQy5Par0vj+KU/DFUgjY5g3539W6kG173X+kHoJq23M2t9GGejkVgpmyW+mJB
	WH/Rv0voZkQnJabtYqwFn1SL1/1CWzWga08LNLTWtpeNkUH5BqQbjoN12d4ESanr4iEupE78Idb
	BDpSnc00bKwFws53iGPxavbCCb+HbBOBDUhoG3P0NNzhqZwwP2Ie7syyVMw7tPWeT/FMpQNxpXp
	CKZcHscClYbx5aasyRuw3i9TaVWkrFeozx7PFkfjMVUUOQc6DuUdFJdqk+GbK0EF6Ns74QNwPdd
	byhk4kr62s/FfeHvxJaC+f7a7EIYEAvhFVF+rdC7Oi0dMPgGRZgo2luE226FoWwf0+kFdDU0Q88
	vrApodr2TGbi36apVhJ66kskP+SDJISl5kMK5MzgNCo5hg+wKSPgde2IEFs7dHWsYe0dYyqdGAq
	VLGXIxEZA62XVDiBa2NXeTtw+W5sSkTLPgvtiwUHHEgxW976Ylga9MI/bu0lMAGCVRe+Q9gvdq9
	g6ohce8WdaY=
X-Received: by 2002:a05:600c:512:b0:4a2:1a:a120 with SMTP id 5b1f17b1804b1-4a211edef31mr30819615e9.6.1792768814071;
        Fri, 23 Oct 2026 08:20:14 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:89bb:701c:1852:56c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2a9062d50sm11683025e9.2.2026.10.23.08.20.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 08:20:13 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v2 2/2] ASoC: jz4740-i2s: Add support for the X1600
Date: Fri, 23 Oct 2026 17:20:11 +0200
Message-ID: <20261023152011.85407-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023152011.85407-1-olivier@mgcrea.io>
References: <20261023152011.85407-1-olivier@mgcrea.io>
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

The X1600's AIC is the X1000's, with two differences.

Its I2SDIV register holds the bit clock divider itself, not the divider
minus one, and drops the lowest bit of what is written. The driver writes
div - 1 and, from a 22.5792 MHz clock, asks for 44.1 kHz with 7: the
register keeps 6, and the stream plays at 58.8 kHz (measured on a HiBy R1
from the PCM hardware pointer: 44,100 expected, 58,700 observed).

Its AICCR has a channel count in bits 27:24 that the driver never wrote.
It held 1 (two channels) in every stream I saw, and with it a mono
stream is taken two samples per frame, as left and right, so it plays an
octave high and ends in half the time even with MONO_TO_STEREO set.
Write the number of channels minus one, as for stereo, and mono plays at
the right speed (a 6 s mono stream took 3 s before, and 8 s took 7 s
once the field was cleared after one second).

Add an X1600 entry that picks even dividers, writes them as they are and
sets the channel field.

Tested on a HiBy R1 (Ingenic X1600) with a CS43131 DAC, on v7.3: 44.1
and 48 kHz run at the right rate.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
Changes in v2:
 - Also write the number of channels, minus one, into AICCR bits 27:24
   (X1600 only). I found after v1 that the driver never wrote that field:
   it held 1 in every stream I saw, and with it a mono stream is taken two
   samples per frame, so it plays an octave high and finishes in half the
   time. Measured on the R1 with silence: 6 s of mono took 3 s before and
   6 s with this, at 44.1 and 48 kHz; mono and stereo now have the same
   pitch by ear. That the field is a channel count is my inference from
   this, there is no datasheet here: if one of you knows the register,
   please say so.

 sound/soc/jz4740/jz4740-i2s.c | 44 +++++++++++++++++++++++++++++------
 1 file changed, 37 insertions(+), 7 deletions(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index d36bbc820618..5153fedc5978 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -38,6 +38,7 @@
 #define JZ_AIC_CONF_SYNC_CLK_MASTER	BIT(1)
 #define JZ_AIC_CONF_ENABLE		BIT(0)
 
+#define JZ_AIC_CTRL_CHANNEL		GENMASK(27, 24)
 #define JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE	GENMASK(21, 19)
 #define JZ_AIC_CTRL_INPUT_SAMPLE_SIZE	GENMASK(18, 16)
 #define JZ_AIC_CTRL_ENABLE_RX_DMA	BIT(15)
@@ -71,6 +72,16 @@ struct i2s_soc_info {
 	struct reg_field field_i2sdiv_playback;
 
 	bool shared_fifo_flush;
+	/*
+	 * I2SDIV holds the bit clock divider itself rather than the divider
+	 * minus one, and only keeps even values (X1600).
+	 */
+	bool i2sdiv_even;
+	/*
+	 * AICCR has the number of channels, minus one, in bits 27:24, which
+	 * the AIC uses to size a frame in the FIFO (X1600).
+	 */
+	bool channel_field;
 };
 
 struct jz4740_i2s {
@@ -218,16 +229,17 @@ static int jz4740_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 }
 
 static int jz4740_i2s_get_i2sdiv(unsigned long mclk, unsigned long rate,
-				 unsigned long i2sdiv_max)
+				 unsigned long i2sdiv_max, unsigned int step)
 {
 	unsigned long div, rate1, rate2, err1, err2;
 
 	div = mclk / (64 * rate);
+	div -= div % step;
 	if (div == 0)
-		div = 1;
+		div = step;
 
 	rate1 = mclk / (64 * div);
-	rate2 = mclk / (64 * (div + 1));
+	rate2 = mclk / (64 * (div + step));
 
 	err1 = abs(rate1 - rate);
 	err2 = abs(rate2 - rate);
@@ -241,8 +253,8 @@ static int jz4740_i2s_get_i2sdiv(unsigned long mclk, unsigned long rate,
 	 */
 	if (div <= i2sdiv_max && err1 <= err2 && err1 < rate/20)
 		return div;
-	if (div < i2sdiv_max && err2 < rate/20)
-		return div + 1;
+	if (div + step <= i2sdiv_max && err2 < rate / 20)
+		return div + step;
 
 	return -EINVAL;
 }
@@ -281,6 +293,12 @@ static int jz4740_i2s_hw_params(struct snd_pcm_substream *substream,
 		ctrl &= ~JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE;
 		ctrl |= FIELD_PREP(JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE, sample_size);
 
+		if (i2s->soc_info->channel_field) {
+			ctrl &= ~JZ_AIC_CTRL_CHANNEL;
+			ctrl |= FIELD_PREP(JZ_AIC_CTRL_CHANNEL,
+					   params_channels(params) - 1);
+		}
+
 		if (params_channels(params) == 1)
 			ctrl |= JZ_AIC_CTRL_MONO_TO_STEREO;
 		else
@@ -305,13 +323,14 @@ static int jz4740_i2s_hw_params(struct snd_pcm_substream *substream,
 	 */
 	if (conf & (JZ_AIC_CONF_BIT_CLK_MASTER | JZ_AIC_CONF_SYNC_CLK_MASTER)) {
 		div = jz4740_i2s_get_i2sdiv(clk_get_rate(i2s->clk_i2s),
-					    params_rate(params), i2sdiv_max);
+					    params_rate(params), i2sdiv_max,
+					    i2s->soc_info->i2sdiv_even ? 2 : 1);
 		if (div < 0)
 			return div;
 	}
 
 	regmap_write(i2s->regmap, JZ_REG_AIC_CTRL, ctrl);
-	regmap_field_write(div_field, div - 1);
+	regmap_field_write(div_field, i2s->soc_info->i2sdiv_even ? div : div - 1);
 
 	return 0;
 }
@@ -382,6 +401,16 @@ static const struct i2s_soc_info x1000_i2s_soc_info = {
 	.field_i2sdiv_playback	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 8),
 };
 
+static const struct i2s_soc_info x1600_i2s_soc_info = {
+	.dai = &jz4740_i2s_dai,
+	.field_rx_fifo_thresh	= REG_FIELD(JZ_REG_AIC_CONF, 24, 27),
+	.field_tx_fifo_thresh	= REG_FIELD(JZ_REG_AIC_CONF, 16, 20),
+	.field_i2sdiv_capture	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 8),
+	.field_i2sdiv_playback	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 8),
+	.i2sdiv_even = true,
+	.channel_field = true,
+};
+
 static struct snd_soc_dai_driver jz4770_i2s_dai = {
 	.playback = {
 		.channels_min = 1,
@@ -493,6 +522,7 @@ static const struct of_device_id jz4740_of_matches[] = {
 	{ .compatible = "ingenic,jz4770-i2s", .data = &jz4770_i2s_soc_info },
 	{ .compatible = "ingenic,jz4780-i2s", .data = &jz4780_i2s_soc_info },
 	{ .compatible = "ingenic,x1000-i2s", .data = &x1000_i2s_soc_info },
+	{ .compatible = "ingenic,x1600-i2s", .data = &x1600_i2s_soc_info },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, jz4740_of_matches);
-- 
2.39.5

