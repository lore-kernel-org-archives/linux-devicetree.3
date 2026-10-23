Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792743299;
	b=mGi9DSD1P1y9Zv4xKNjUGW0xV/IY6HM7dV+UFcjTItRzIkLTfLYaZqbCE4PeAk2BKSOP
	 d9a4g7M2wQWYxezZHVQLenvPgQrteeYQnhqITsO/38RlGFgq4HrZ9+Dk8frAbhD+SOjZz
	 RxXvS53A+dsmbS8V+NO7El+943QF+E54hZBLYEY7FgPDymQJOIwPVAfXackvPfbLhWGZ+
	 3FsyURjqxz4aF95ZsXH7BAA257NRl1iUoI8buqquPed2oRqHnVm+w/gJsiBJ+eVErvA92
	 DLtBYcZOfeVgfbCCbZUgMAQC4eNhlkdIN0VsOulYZ/uyTX+FsVSu0phRpttn6ICy0Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792743299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=l1+EOpJTkMZjnurWRH+JMB8ND5CTfD6dguAYJAO8wsE=;
	b=RsPYq/uepx5DHQiO2Pfdss6JCDrRxLvrXhGqUy49d+vDmT3S2z4wymEhg6/NAknGDdPD
	 ZlfPidQ08x6g9GMt1eHoh2Pucb2ibUVZLv6F1Xhzmnlc9us/XgWQqO9yapW94TUd6hc7+
	 MKVPc9mh+RM1dFdAOI4XSi/5NHkkrmFx1ozo6LfZDQGOCFwpAwGY0r2oWqGv86u/sV2LM
	 PoXaqTbcXQv2y+/C7FLU6ZndWVi1X5txb+p08tNVlkDYT7MtIjmPxKgt88y1XH1ZwTEie
	 UY7nrvG1SVBq9RgnxKZFIdYSChMGMIu8qRLOChvSxqeTDkSCQFKlOKu0o8E5dCvjSkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Sa7EGb1p;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1DA606A33D
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 08:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E1DA606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Sa7EGb1p
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so339405e9.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 01:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792743297; x=1793348097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l1+EOpJTkMZjnurWRH+JMB8ND5CTfD6dguAYJAO8wsE=;
        b=Sa7EGb1pNiHfHqcUKuJTdymG1efUzKow1AO3R8ySQ2fj+Q6s3C6Ibu4dV6ltyikpBW
         Cf3tHJJHzRNGA6t1sf0hLQYuBwBZF61gp4LDm4rwS0hM4zGxfvugShDYtAXMtctnOJjB
         /gYV6YNB7dgYWLz0g63mBhQPONRcm/cXyMROd3DSSM4zzODbJ/I/KZGxRJCy9MTzVeqB
         lZnpLwSIU1yU/YZxzcuJ6NGjAg/zUQW4W6ECEpFj3X49Vf6829QDLB+1K7OaO9f46U2q
         yTyUZa9vlmxj73Eii55mWNO3u/qH4MV7Be0N2qRrbb7YHCP5/kKjJcFOJKVV9/LNjJuj
         HIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792743297; x=1793348097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l1+EOpJTkMZjnurWRH+JMB8ND5CTfD6dguAYJAO8wsE=;
        b=htwQ+2vK1SHtJt206ElNZGtEYgAhAiiKuNxPNnGaWHw/8XUQQYOOO/w2JT+hMvvVAq
         6uk33V90AaU6izGBo74ZQzWS0UrPTVLVFb975s1QEpLN+RXNh7Zkkv01jOOkCRYd5m54
         XjN+j2et0kiiHQZGL3BTfp/nPD8qCJJoji6C9kZB1wFz3cjXtdR7R7Zy8a6E/ipxZ/F0
         DXoSBiC2/uqni9Z0r14pnpjTvGMOjnvWfiy8e8C2LKb4IA52jDrYYo/C/PbHJ5fAKirx
         UNwfLiEuMDyPswnLIHs/GGG6APVOzt9OTmlfD8qNt7L6XyRGhAuJ235J6N1NlFKN9nfj
         wKzw==
X-Forwarded-Encrypted: i=1; AKwUvBxEksFn7bquaK+U/Kp/i8GYBU8c9bSeEkk5h3RXzVpGepdxQ54TOjzuuCLidzOKO3bg+eH9WBShm8x8@vger.kernel.org
X-Gm-Message-State: AFq9FYJw+lY9kc4pRTOmRGP9Vrql9LyE2cwQaA3qw7+wWf/D39Xps8oq
	fOUEEI1c82NGlIN/N824FPX9ruAGfjjpwksJf5Zw4iTUioN390Bq9psezZCnD8X8liU=
X-Gm-Gg: AYBFou0tS9+SKM91E4adrMKAScQrDv475JPth3LrMLoi5sFSjUxyzPAch9YXhYtZcbJ
	yOVM+pbEn003g5aTw1wkbrwEWUXseKQuug0BtrQC6htnxOIC6HroCWPXyO69TAAtjCXL59FRRQz
	KimdAKlCb0V7p90Bgd3d8YxY92Zsobl79ZgGQlWwyhRqtvKiqkiKVcFvtQBBT07QDgLD6zaDSED
	demH+7TsmOY2UanWobB4uNnSYV9exEioa8vPCNMM5lmleum2kEk6u9z/5miqCWS6v3cNeSYlP+K
	6O2pCiuSGtnaDr6ME9SJeoxd/QuISzXhM+kEMFVC+8coEWv0YzCadYS37lcowKvuhP7HPFCn4ta
	njPwSwSnLTr1T8qgE2e+iNdt4Il82RNiKON0WsCanP1WkEpI1X7aeKxBQaxor5rqwAFVS33Zsc3
	GiqHIi3G+gU7Jgec/mkEgtbzoud6ywyKh6OGZoh2UWd8RDw0SGEQEgYjz4NprEbEM0xhPVCp8P9
	cHgq3TyZr4V3zy0pLAJwXAyphvBDBYEE49IV3yoNUlMO2rAVA0oznAGFV3TLCpMpr8vX6RoqMOm
	dLz4J1tJYaKD
X-Received: by 2002:a05:600c:81c8:b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4a211f0a72emr20850425e9.16.1792743296932;
        Fri, 23 Oct 2026 01:14:56 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:6877:44a0:5297:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21047b2absm55750745e9.13.2026.10.23.01.14.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 01:14:56 -0700 (PDT)
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
Subject: [PATCH 2/2] ASoC: jz4740-i2s: Add support for the X1600
Date: Fri, 23 Oct 2026 10:14:54 +0200
Message-ID: <20261023081454.44350-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023081454.44350-1-olivier@mgcrea.io>
References: <20261023081454.44350-1-olivier@mgcrea.io>
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

The X1600's AIC is the X1000's, but its I2SDIV register holds the bit
clock divider itself, not the divider minus one, and drops the lowest
bit of what is written. The driver writes div - 1 and, from a 22.5792
MHz clock, asks for 44.1 kHz with 7: the register keeps 6, and the
stream plays at 58.8 kHz (measured on a HiBy R1 from the PCM hardware
pointer: 44,100 expected, 58,700 observed).

Add an X1600 entry that picks even dividers and writes them as they are.

Tested on a HiBy R1 (Ingenic X1600) with a CS43131 DAC, on v7.3: 44.1
and 48 kHz now run at the right rate.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 sound/soc/jz4740/jz4740-i2s.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index d36bbc820618..097b5be1e22f 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -71,6 +71,11 @@ struct i2s_soc_info {
 	struct reg_field field_i2sdiv_playback;
 
 	bool shared_fifo_flush;
+	/*
+	 * I2SDIV holds the bit clock divider itself rather than the divider
+	 * minus one, and only keeps even values (X1600).
+	 */
+	bool i2sdiv_even;
 };
 
 struct jz4740_i2s {
@@ -218,16 +223,17 @@ static int jz4740_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
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
@@ -241,8 +247,8 @@ static int jz4740_i2s_get_i2sdiv(unsigned long mclk, unsigned long rate,
 	 */
 	if (div <= i2sdiv_max && err1 <= err2 && err1 < rate/20)
 		return div;
-	if (div < i2sdiv_max && err2 < rate/20)
-		return div + 1;
+	if (div + step <= i2sdiv_max && err2 < rate / 20)
+		return div + step;
 
 	return -EINVAL;
 }
@@ -305,13 +311,14 @@ static int jz4740_i2s_hw_params(struct snd_pcm_substream *substream,
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
@@ -382,6 +389,15 @@ static const struct i2s_soc_info x1000_i2s_soc_info = {
 	.field_i2sdiv_playback	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 8),
 };
 
+static const struct i2s_soc_info x1600_i2s_soc_info = {
+	.dai = &jz4740_i2s_dai,
+	.field_rx_fifo_thresh	= REG_FIELD(JZ_REG_AIC_CONF, 24, 27),
+	.field_tx_fifo_thresh	= REG_FIELD(JZ_REG_AIC_CONF, 16, 20),
+	.field_i2sdiv_capture	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 8),
+	.field_i2sdiv_playback	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 8),
+	.i2sdiv_even = true,
+};
+
 static struct snd_soc_dai_driver jz4770_i2s_dai = {
 	.playback = {
 		.channels_min = 1,
@@ -493,6 +509,7 @@ static const struct of_device_id jz4740_of_matches[] = {
 	{ .compatible = "ingenic,jz4770-i2s", .data = &jz4770_i2s_soc_info },
 	{ .compatible = "ingenic,jz4780-i2s", .data = &jz4780_i2s_soc_info },
 	{ .compatible = "ingenic,x1000-i2s", .data = &x1000_i2s_soc_info },
+	{ .compatible = "ingenic,x1600-i2s", .data = &x1600_i2s_soc_info },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, jz4740_of_matches);
-- 
2.39.5

