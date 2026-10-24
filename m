Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792878283;
	b=EUFToAHxBfpak7/70CYwqM8y1Z1WK2K0F7emPklan3E7G4yE2sXTHjd8thUHdozloDgo
	 BQHFhEOcfwOJJ+DGuKjW+7PveXxYqh2ydaav5ENz9jBq7r/0pBYfKXKtFzXd9754l1cQg
	 T75jHy9bQ3ftDQ+kMNgdyBeZmqP+hqv/WqE0b+cf9LmmAmvbV7VjEnsoGq+ycP/raehC9
	 2SpYVCmOyDkFe9M/m01O9tFJuLz7gYgxkEZr/KnRYzJqk4+iFsVXBAQiPJ6cSq9npIJme
	 9L9mlIvZUkogw4ApUSz3CRnmV4X1GhLeUedZ4Sb8Mwaa7NdG+iJhZEXHjftI3NgJQBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792878283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Zx+hih5F56dpG51YJGSw46v6qh0REIz4AjhAVPIFR+s=;
	b=RC6VIgfbg8Rd8NlLBe9zZR2IY5F1CXir77CCsVermNlL0kMUWt9iWDv8zXLVTClDnwgu
	 GpjemsZRGvqaFi1ZWuTbVGaQdExwdvM5QQnje25SXY/jGApnlblsgJwJaEc72k9bqTET7
	 d0MKC9z8TB8ci0tXN49rj+AwQXalTOnQTNaHu4cpeRSoHCvxM/yeXd4tCxnscS0s16A+M
	 kJEGve6e9a+EspFRnZ2TllpJCPhjRcgJht2m022LdkDFhhoBFo98kfGB7tTHg3SSg6HkZ
	 VVFBnmgqsWUcEDyzxYzd7u+3yieaX0Kz1icDP2rRzJMwNiMUhwXlCLY9llqtgIRes2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=bsZIJBlY;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397BD606A32C
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 21:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 397BD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=bsZIJBlY
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso12020375e9.1
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 14:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792878281; x=1793483081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zx+hih5F56dpG51YJGSw46v6qh0REIz4AjhAVPIFR+s=;
        b=bsZIJBlYS70/otUucItCxIE9RTvoGMTjDQ501yy7RQAVRoaT+Tj2ymqOdZgPkEnTPO
         +5fx9uERCkt7/b3ma9lqrwYAqScdjLkWt/Hx4+TtV3e+e5N0cIcZ+E5guf4if+8p+MPf
         557Lc2fF1KMMqj9w3+r5KCYRNTfN0qlgnSgKmDmx2h1PklbiXw6qLfmw0nC096x7/RwP
         OFWYm2CuB7SbaqSBRC6GQgWUfz+zPEmMDoTtQCtBvCih6uJkeEeW9c9P8Hd44BlBwQqf
         0C4XkCoJ3lqLcBVO8XNcNTS91oC0Z60nTGPnxyELLlRudU/YThzrrLGlCxjzDMqIQdJb
         zPqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792878281; x=1793483081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zx+hih5F56dpG51YJGSw46v6qh0REIz4AjhAVPIFR+s=;
        b=PI2dcUSo94dgWiHDVuIJlCeG3ffK9TtJfuT33n4a8LNlBGqClVIKsuqagmyNwd5fyK
         D78XglqnEG6tdY9GfS+JVHQO1LqVnuYAi+zZ4PhjdpWJmSneVn1/whGUV3TMvsvvQiUz
         qLEB5397nFy98JAEvw/zX5V6D9c/lh8N7evrgBBIqXyzhh0CZzo8xIUT1wKZ9I9gTK3/
         9ifTFQOtjPan1qSOjlDjQHBYMZSTmA5bWXilZvXSoyafPu68cGLCAcdSamUPQReeJIqO
         TLyXUAFcH/o7R/GXv+wZlnwghVboyGr9ULY7bXhQ17c5V5PtT6kwsQjzoExv4th/e/pw
         85JQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0/iDLcidKMbyPcaLmKIaihZlKYl8SQQiAbrxbT/V40kWwBxgMz8N7hIAhqgulR2azo4b4NOj5vcuP@vger.kernel.org
X-Gm-Message-State: AFq9FYImhBE3CuOH5Vb7NT8xm33YvVIq+p4AZCQQrScniojRUOTNa10v
	3EnApp6SwqWD15tj0FGkHnV+BPNS8oOjbMFpS8dIkv/gn6WFQR0uiPV0FU6wAPEQVDY=
X-Gm-Gg: AYBFou1E5mrJX3MOE1oSYgOR8dXIxQtQLHUCW6pGAjhNdFfaDlqYrpIWMVZPDVsqdJ+
	xHYK2QDY3RsA+UXfgXdO/xfjVCgtVC9Uia41Em4W3iAdAYGxcAGMwV6pR4DvREmb67A7IwaDKRm
	mUDDvDZawCvAYFJF/xBMhKD47L0VIXcA9hN+G/yMyFukTtFbDRLJvq/MigR+BXcCKA12jiEDuhZ
	HxromlkqmlGjvAcOUidm5sm8Gt4O0my5t3ARfXIsNa58xMAEdiKd7f5cjg0R8P5oVPrRPAm/dsT
	DtPDirlczXVFS/5T5qNY0PNtO53kXB0u7g+nR382EbSKVmK0xYTkqJVfZudSXUNqEIil4nWsTYB
	l8xh301yR0lgjn1WA8lGgblc/rOLpOzRCc6fkOBksB5orE6COhpSpIULWuo8lNSMd/OEv1rUiu+
	f/IAjHUcv3odqm60dvqXw27+uxH+frqFMRMTcKiF5l2kS0uri1FTBFjaBLCeimNIzbZ/3hfB8FG
	LzsOk/Ul3L5oCO187s2ex9F0EQPcQbFbG2oQ6EAXXWz2fMgL8DskBcKAGryP0LdwtXXmD9VHBf5
	h93Re7CjhjX82rNPN13RZspxKOkmwNfIb/jxo6nKTh6C4xtWepu++z2oaZLnmPlSmVjBaPjLtw=
	=
X-Received: by 2002:a05:600c:4583:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4a35acc2773mr51697115e9.32.1792878281612;
        Sat, 24 Oct 2026 14:44:41 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2ed5a2sm80447905e9.15.2026.10.24.14.44.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Oct 2026 14:44:41 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v3 2/2] ASoC: jz4740-i2s: Add support for the X1600
Date: Sat, 24 Oct 2026 23:44:38 +0200
Message-ID: <20261024214438.33342-3-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261024214438.33342-1-olivier@mgcrea.io>
References: <20261024214438.33342-1-olivier@mgcrea.io>
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
minus one, and keeps only even values ("The ODD-number value will be
floor to EVEN-number value", X1600 programming manual, 9.7.2.6). The
driver writes div - 1 and, from a 22.5792 MHz clock, asks for 44.1 kHz
with 7: the register keeps 6, and the stream plays at 58.8 kHz (measured
on a HiBy R1 from the PCM hardware pointer: 44,100 expected, 58,700
observed).

It has no MONO_TO_STEREO: AICCR bit 11 is reserved. What makes a stream
mono is the channel count in AICCR bits 26:24 (0 for mono, 1 for
stereo), which the driver never writes. Left at 1, the AIC takes a mono
stream two samples per frame, as left and right, so it plays an octave
high and ends in half the time. The X1000 manual has the same field next
to its MONO_TO_STEREO bit; the X1000 is left as it is.

Add an X1600 entry that picks even dividers, writes them as they are and
sets the channel field instead of MONO_TO_STEREO.

Tested on a HiBy R1 (Ingenic X1600) with a CS43131 DAC, on v7.3: 44.1
and 48 kHz run at the right rate, and a 6 s mono stream takes 6 s and is
heard on both channels, the same with bit 11 set or clear.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 sound/soc/jz4740/jz4740-i2s.c | 48 ++++++++++++++++++++++++++++-------
 1 file changed, 39 insertions(+), 9 deletions(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index 7a1589cb775a..5f2a26e3c933 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -38,6 +38,7 @@
 #define JZ_AIC_CONF_SYNC_CLK_MASTER	BIT(1)
 #define JZ_AIC_CONF_ENABLE		BIT(0)
 
+#define JZ_AIC_CTRL_CHANNEL		GENMASK(26, 24)
 #define JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE	GENMASK(21, 19)
 #define JZ_AIC_CTRL_INPUT_SAMPLE_SIZE	GENMASK(18, 16)
 #define JZ_AIC_CTRL_ENABLE_RX_DMA	BIT(15)
@@ -71,6 +72,17 @@ struct i2s_soc_info {
 	struct reg_field field_i2sdiv_playback;
 
 	bool shared_fifo_flush;
+	/*
+	 * I2SDIV holds the bit clock divider itself rather than the divider
+	 * minus one, and only keeps even values (X1600).
+	 */
+	bool i2sdiv_even;
+	/*
+	 * AICCR has the number of channels, minus one, in bits 26:24, which
+	 * the AIC uses to size a frame in the FIFO, and no MONO_TO_STEREO
+	 * (bit 11 is reserved) (X1600).
+	 */
+	bool channel_field;
 };
 
 struct jz4740_i2s {
@@ -218,16 +230,17 @@ static int jz4740_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
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
@@ -241,8 +254,8 @@ static int jz4740_i2s_get_i2sdiv(unsigned long mclk, unsigned long rate,
 	 */
 	if (div <= i2sdiv_max && err1 <= err2 && err1 < rate/20)
 		return div;
-	if (div < i2sdiv_max && err2 < rate/20)
-		return div + 1;
+	if (div + step <= i2sdiv_max && err2 < rate / 20)
+		return div + step;
 
 	return -EINVAL;
 }
@@ -281,10 +294,15 @@ static int jz4740_i2s_hw_params(struct snd_pcm_substream *substream,
 		ctrl &= ~JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE;
 		ctrl |= FIELD_PREP(JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE, sample_size);
 
-		if (params_channels(params) == 1)
+		if (i2s->soc_info->channel_field) {
+			ctrl &= ~(JZ_AIC_CTRL_CHANNEL | JZ_AIC_CTRL_MONO_TO_STEREO);
+			ctrl |= FIELD_PREP(JZ_AIC_CTRL_CHANNEL,
+					   params_channels(params) - 1);
+		} else if (params_channels(params) == 1) {
 			ctrl |= JZ_AIC_CTRL_MONO_TO_STEREO;
-		else
+		} else {
 			ctrl &= ~JZ_AIC_CTRL_MONO_TO_STEREO;
+		}
 
 		div_field = i2s->field_i2sdiv_playback;
 		i2sdiv_max = GENMASK(i2s->soc_info->field_i2sdiv_playback.msb,
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
@@ -389,6 +408,16 @@ static const struct i2s_soc_info x1000_i2s_soc_info = {
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
@@ -500,6 +529,7 @@ static const struct of_device_id jz4740_of_matches[] = {
 	{ .compatible = "ingenic,jz4770-i2s", .data = &jz4770_i2s_soc_info },
 	{ .compatible = "ingenic,jz4780-i2s", .data = &jz4780_i2s_soc_info },
 	{ .compatible = "ingenic,x1000-i2s", .data = &x1000_i2s_soc_info },
+	{ .compatible = "ingenic,x1600-i2s", .data = &x1600_i2s_soc_info },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, jz4740_of_matches);
-- 
2.39.5

