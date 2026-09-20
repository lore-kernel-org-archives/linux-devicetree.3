Received: from mail-pj2-f34.google.com (mail-pj2-f34.google.com [74.125.227.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14563CD8B8
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 04:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880167; cv=none; b=QMUxO2LpIIlmUB4zk0doHwDiPfXAMcP4Wp0ZfC9FI2hdKBlVmmm40VdZEWxiCBx101Cmz7E5VtRdlHhzypq6O3RkABI/pFZ0z1hJCLsl60EY8rRHn8ZfM9U2I05GzhGvCCx3Fxm4CCeZ3DH7ZNFz1Sw5fPLc+YKS1vBJl25BZIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880167; c=relaxed/simple;
	bh=o6Mmzyd7BRwU9H5C74qoe+G2Tq+aI/IRIDM1u7th/B4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PBpbvfLCu0WdoObof+h2+9L41F+36q6Y9reYXMuQZYga+XtuLyH3hP4uUDx6ndsoxKCnc6nhYqxYmZXoEbRkZsWw2G6glimPgC42bQ4e37Re4NkLYhZQP95fC8HabBTveFSDScJwymWGHhcjg9FjBDk4Q301VfcqrvWt35Yfzds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hpw+OhY/; arc=none smtp.client-ip=74.125.227.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hpw+OhY/"
Received: by mail-pj2-f34.google.com with SMTP id d9443c01a7336-2d747eb79f7so13408685ad.1
        for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 21:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880165; x=1790484965; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2MoZTcxnKczPWM7o1mzqY2ipongGCpZ7IBnK4RjYvUM=;
        b=Hpw+OhY/r9qvfCb/v6ZNx2vv7z/yuQFjsE2BS4T1tHtgfPZvUs14GJb+sdbYRrSRnT
         RrlcgQBZNSYqMuVZvSZMin1wDbW1vS9Kg/WHL8SmBXbXPSbBKNuCN26cX3r7R0besBB9
         +cSqmZ0XOswAcUPuyU889PYF/GGNi1//waRVmmxOBnHqEaAC89oCIvpsvn/UzYdInEJK
         Q8ZILiMZKRFgx1OeGeddk2RYiVoTVoJ4V6iZ7veXo9xISPii8pbyr0CACWhJ3RZL0T0P
         wwOI/tYJ7vR/jnT8E23DAvSQZ6+dyE0CMKwCjg/GVcJJOwxIKVpO4OgsMtmCtGbAOfAX
         +fcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880165; x=1790484965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2MoZTcxnKczPWM7o1mzqY2ipongGCpZ7IBnK4RjYvUM=;
        b=L9X+b7qNQI/+aNrVfILj3NN3ZH3MvqwUdETRZ8Cw3ZXAJi/zyapPorHfR+XYxMnb4Q
         f2TyNxA2aQi73EaCFIJeN3/NNhd40ud+kaxm3tW6F6JwaeNZC8t/HPWoxezhKOrvK/it
         UmcOV9EIB339YSB7IAcecN7meoNYY+S6iYX6ZFx37kiLuwP8VdB1k2q8JGspYqrDV0qW
         YDnu7R0avnkAItFP7mGEVgWRvXmy0ovHCTabaOGANhC9sYNwkiNeB24Et5FxQsyyLX1B
         /X6JILgywkgFsxcmbdSH4m8lKzIOCiM0sCppshsRzRcuARfMOhKHTYk6EkXTNz+jgb55
         AwNg==
X-Forwarded-Encrypted: i=1; AKwUvBwHtW8MpZlnh3xKEkHDGqgtU0m2fNsinKrY0gtiTY0OB+MlNcZ58V8wnDAQ9Fh86XQSXZTbn5ON3/3+@vger.kernel.org
X-Gm-Message-State: AFuF++nvixxBgG3L0z7ebWxT2z1lxrYhOIUWuVZxpdQ+AC/M9d53pXDU
	xL6uCwxZjVmLQqDovjQiYz9RakkDGVCJxZE3PS9L0ew7nwuUkuuhIhbx
X-Gm-Gg: AYBFou2UgRHq0szUMrc1Avb32wrBk8Y2jUQwKr+LVUn9J4+ZTWiDfYkWdqxdfTNySPV
	9CaasOSgLh4za/+f8xMVTkAYeOQoCSahPrYUH1tAhdUskGiZ6r9H7XbpifmzifHn3pXXNgMvqDL
	BqfTzrnJWiQZ608SS2MLlrN3K/9goFL7IDZxpaY7JkkRhEt7Lz2Tx+FNX9ks6lTJv8fAJM4HdZ+
	biDP5NiIWo5qaaXwFuPmRd+dJ+dGsBx5q/NED6g8BXm2GuUqPdgW0g4XbHtvD6D6bYBYNXVyb1t
	1cRtQyKGbJDX0L3SlgANroPJdu9Bgf56gqU1wSKruBQ0NbbJSa57xxZo118baSVhFVZujOUiQwL
	r8oDt+RZ6KQDbaQkpvZh9KDZn4dJDzZ9M8fXFtiInLMos/I71z4T5ztnl6foaGU1zNkuF8sjbLZ
	r1166O1FAlMx5kjVIziKW37YCpCe+YQ7pG37SLb2qqC7F2/rnKmNbAFaLRTgd2WmTxiXsgyUTqq
	lw19cBBJS5uSc1DV12wjiAx9Hh0ZTpXFzUCZ3bCYrNZ2J0jJ30Rrs6LdHNcmc7Ccbbv+QfLn95e
	kHv+ajnq5st78R/H2/haSuq10SYd0bwxnoLQfIuRpOASBYM=
X-Received: by 2002:a17:903:fa5:b0:2dd:c053:82f1 with SMTP id d9443c01a7336-2ddc053841bmr56459515ad.40.1789880164957;
        Sat, 19 Sep 2026 21:56:04 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:56:04 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:45 +1000
Subject: [PATCH 06/28] ALSA: dmaengine: Always terminate DMA when a PCM is
 closed
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-6-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
In-Reply-To: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1367;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=zGb+++j8iUZe/cn0Z0nFJK8T6VZ7UceNkKMJL+0HzLM=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0+UNCs+tnF8jm/Fr9rnD+qaz/5/MlJvafvnEpdXpu
 SeWZM6J65jIwiDGxWAppsiyoUnIY7YR281+kcq9MHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEz1kxJGhmuLz9eF5142Xp283+/t0Rc/gw80iqvZZe94zfXn23/Xh9UM/2yWb2j
 yPuE6S9JqBqt0gZDlkrU7xeS3e7Hc+lrDvndKKxsA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

When a PCM is suspended, we pause the DMA. If the PCM is then closed
while in this state, it does not receive the STOP trigger (as it is not
running). In this case, we fail to properly terminate the DMA, calling
dmaengine_synchronize() nonetheless, which is undefined behavior.

Make sure we always call dmaengine_terminate_async() on PCM close,
regardless of whether it has been called previously or not in the
trigger callbacks.

Fixes: bc0e7345168c ("ALSA: pcm_dmaengine: Properly synchronize DMA on shutdown")
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/core/pcm_dmaengine.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
index 1306b04be171..e59b561b849d 100644
--- a/sound/core/pcm_dmaengine.c
+++ b/sound/core/pcm_dmaengine.c
@@ -355,6 +355,11 @@ static void __snd_dmaengine_pcm_close(struct snd_pcm_substream *substream,
 	if (status == DMA_PAUSED)
 		dmaengine_terminate_async(prtd->dma_chan);
 
+	/*
+	 * The PCM might have been closed while suspended, which would
+	 * skip the STOP trigger. Make sure we terminate.
+	 */
+	dmaengine_terminate_async(prtd->dma_chan);
 	dmaengine_synchronize(prtd->dma_chan);
 	if (release_channel)
 		dma_release_channel(prtd->dma_chan);

-- 
2.55.0

