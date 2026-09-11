Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E1B4BEE38
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 22:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789164919; cv=none; b=lh4Fop0n8U/sMhCtfmSmQ/WTZvs3lda+wJx54EK2oqsEuENeZVHWZEmqQt1lomvXChRsqcCFECFCHt2e/HEoUhAsiH9Ls1h1iLhUvjVXKwxtbvclPVA/WbfAfLYslVTMfSPRJsXjH6rIGkYOisJODg353BdOmr5W2CEccNkOO5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789164919; c=relaxed/simple;
	bh=Uvy6WjK33Ql5QDc+7YeTX2qUEcUUi+n12SinkXVNwt4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sq0EHwk3IFQh/Tr0JJlpA6YEnWsmdyjxZTJmrmv0XJtNJhIfOTTfvUoNG+Zj0Ov5u3Ap9qurF5WJenyBVdQ5GbRnkXNhX0d7MnKP/7WTCOucFMWObWCnKhk+QZ0HEin8/Y8QVv8lsyh8E5cztxph61jFRMsckPk6RYUgkpQl4PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=f8qvnWnb; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="f8qvnWnb"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49b965570d7so17464425e9.0
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789164915; x=1789769715; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0a21Y1nKSOFECTC5sqA3T0CqQ+Krc+hIIInAv6Qgnz4=;
        b=f8qvnWnbGPu+ZO/N5/3Sys3Mm1bkdPxoXCKxBvkfdVMF1+zIgl2esq+fpygVA145Ji
         zsJGlIeIMkLgc8KmoW/c7QPEbpB/L1rpOHLjlAGCDBcsc/u8oIZLa9ZgBS/8cXD2IHxj
         EBJJXZ+FK3lGp35yWNZKe+fYXbjxjjKdNLGrv5wxbcItH0be11Ow5E7FemiLtSpZYMkQ
         qsLPbbWU77JrRwzH6pBC2SqTfSGI9qIEZ6ndPcF0GO3S9iOa/c3fsxdtuW+eJwq4wGiZ
         /CWYD/LBxJPLanUDFnpb1/h1FbDAQmud2/JtN1YH2Ov08Zge6nOuAV0LYGZz2ayxBBMR
         r7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164915; x=1789769715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0a21Y1nKSOFECTC5sqA3T0CqQ+Krc+hIIInAv6Qgnz4=;
        b=l3b2bTuFwIcp8CHNQPeVgImXZYmj5RbekBpM48Ggrrniaz5dm1Bw/LSlNotekLa6eJ
         WcLAjBDwLEzNogoBNorkf8HONShMzVkMPxS5ZRExuxjw56uDkxIuwJRBifgAFVKq7sOt
         d3/0/oB8Verk1FRCFDKIYcL7CIXKLvF6GDz/pMx/fgDUZ4Mlr0+kTym1IwNVwoq3/lFY
         gMOJR6tYKHMTgLZ3vnfTVdeT4AebBIs75OvrfdYBHbvU2Fip8weQDWuvtVBBj5PXLUH5
         QAjzibrXxtU3tHvXOO+VLdiKtiG+l0R+WR6IG6sDt3dPI4eWHL30Gti99b+OgFO09UNJ
         zjYg==
X-Forwarded-Encrypted: i=1; AKwUvByCn2FRzKxYkjY284tztck8eHJiN0P/N+/A2yuiZWH0Jb++/ysCsZ7O+poCHQUfhEDRfNmHYFePoLpq@vger.kernel.org
X-Gm-Message-State: AFuF++kvy7rnew9TQgI+YIzxNqva4B/ALvNFkHLglQ1aBlZixLre2myM
	3izdlZKrbi7spEM9c11hEE01T4ETxX8+Y0/90KTuwGdFaoDytalryBDBTcIygVALXt0=
X-Gm-Gg: AYBFou17OgBeh2q7GOwVejFwVjFWgAOXK6O4la/b2ZT/WOTB+WuGzYCKXpHGoKHyGpE
	89o7mvH/xKCqqGAvnbvlaVu3+ZWT6F8CC0wRdjItZWgmtL4W7EsKgdXL4R9uQhu2YqXFVnuB8FB
	aJBGxpw6IKeySPL0F8c4OyMKE/PmMzdQ0E2KcK/iGgVtVDfKt2bZb4sS2CvulW5bJxhRbVUdYpA
	pA85o0z/4cngHrtGbv+wqJ5Xtm4Iy+S20K+oCEPxQ7lL1+zif4psrDJ+b+WBmpVwzVm2uQFaaZY
	JbEpLxALr3b5xcwSFPofqcRd2xtAFpvflWt1ubWUEN3VW+3xunLaiAHaJLa2ZOE/p1/PusU5j60
	/S7N4tTpeB++9CRfaXhmozgAlhg7haiEB54u/Gnz3Lpo0jmC0tZOEIX24WpjfNiriL+Gn+Vkymi
	gzlMxPWv42QEaIaThiqveBCPQMwrqyofRT6tKipmL5L9kPJut0PqhEJt4/H8kZ+up7kQ==
X-Received: by 2002:a05:600c:3484:b0:49d:433:c3b6 with SMTP id 5b1f17b1804b1-49e619d1eb8mr73755815e9.27.1789164915060;
        Fri, 11 Sep 2026 15:15:15 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c2a419sm202882745e9.7.2026.09.11.15.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:15:14 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sat, 12 Sep 2026 00:14:34 +0200
Subject: [PATCH 4/6] ASoC: meson: aiu: add I2S Capture DAI
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-audin-v1-4-7fbefe928711@baylibre.com>
References: <20260912-audin-v1-0-7fbefe928711@baylibre.com>
In-Reply-To: <20260912-audin-v1-0-7fbefe928711@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1725; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=Uvy6WjK33Ql5QDc+7YeTX2qUEcUUi+n12SinkXVNwt4=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlLanPN62R2qhj3RZtv5n7/dkGxo+2X1bUTYtJ8z4T+/
 b708KljHaUsDGJcDLJiiiws0+/9LihVe2iccLIAZg4rE8gQBi5OAZiIpQ/D/3iO1Y+uhQl6r8y0
 vMEWZraRteTfueBJYvK/nk9Ky7q69zwjw5V01nCFvvMVs85emf4ja2+hp4tZqPejMzzTP2ifKA2
 MZwUA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

Add capture stream to CPU_I2S_ENCODER making it able to handle both
playback and capture streams. Captured data is formatted from
"audin-formatter-i2s" widget, buffered from "audin-fifo" into an internal
FIFO and then bulk transmitted into RAM when the FIFO is full.

As for the naming of the stream "I2S Encoder" is kept as base following
the same pattern used for the playback stream and with the goal to minimize
changes.

Supported format for capture is currently limited to S16_LE because it's
the only one that has been tested. According to the manual also S24_LE
should be supported, but this is kept as follow-up.

This capture support also takes advantage of the following commits that
has recently been merged:

commit df3c987ab3d7 ("ASoC: meson: aiu-encoder-i2s: reflect bs quirk in hw constraints")
commit e82159384a50 ("ASoC: meson: aiu-encoder-i2s: use the core symmetric_rate handling")

They ensure bs_quirk and rate symmetry across playback and capture streams.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/aiu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index 535fbf7c1639..14d0e20a4bd6 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -153,6 +153,13 @@ static struct snd_soc_dai_driver aiu_cpu_dai_drv[] = {
 			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = AIU_FORMATS,
 		},
+		.capture = {
+			.stream_name = "I2S Encoder Capture",
+			.channels_min = 2,
+			.channels_max = 2,
+			.rates = SNDRV_PCM_RATE_8000_192000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+		},
 		.ops = &aiu_encoder_i2s_dai_ops,
 		.symmetric_rate = 1,
 	},

-- 
2.47.3

