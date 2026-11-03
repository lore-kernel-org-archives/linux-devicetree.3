Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691680;
	b=tFSrX4rTWEP/gKfF5Zc/NmBCJsVDRg7GrrIj8jTQBa2zU/hvLIYpfjXT0pRgN1b68dBg
	 LBsbD3ohuMpwJppl5CFyyDoqKuDMxxUiq4hfb+7cVwZu5pIDikqvSrXhnI4RRWFczU5fB
	 euDlL+vw6A2LKaG9M6BcFlGH4YQ4UdNCDVWah6VvFVnHNAJZ/jLThaYxvdARcpbk1Wqh/
	 Y0UqQNCoBsgun2ZS0cQRHuvAKrSYFw2yXvrcoIJwqcNjU9cAjCmZSfAlS9etHYYG4XlyJ
	 P3LvLi9WNoTQb1L7hubkujF7NMvq3q4+ySmy8PeFEjwHbdJThWctcn8WUhcT+d0Fx0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=DkVqZCyEHTkw0fLy5AgelSQiyen6kTUwAZLAvdHj+5g=;
	b=DOPRgyjTeVmvbQEKGiP1cFKYm+A/Uq5FRLcCILjoD0qL5Hd7JQbRhAaSv5Jzg68EESq5
	 bVQXQ8sJ8N8aH6Qyon0fFtYDedj9swZzblRhNP9ZkiwRLBCyIW7Sd8VF4cv/Gro4Pj5wC
	 0N99P/VQf6OYUUCKyBBvxwV27XhW8ebM05zO0N4U0X13MjEWW79F92HcxjW1XCI3sEJLj
	 eEhkaJnDgdB8jCtf7jBNCMXPz3hFMqwDEGXEov5TzAFXKYfX96MvXI2+CHq2USgc6sdgY
	 sDUUp+iEGUV5Y063jG4t7O24wbgbAB9iUSyfABBCOxPeIIF50u0ef85itxaNX6R47Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bliOVFYw;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27598606D813
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 07:41:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27598606D813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bliOVFYw
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso1866949a91.2
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 23:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691679; x=1794296479; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DkVqZCyEHTkw0fLy5AgelSQiyen6kTUwAZLAvdHj+5g=;
        b=bliOVFYwq+YgawJHDEA/XjkMNFWU8so5SsslWlXx1+oU/NNmf+023ioIxb7NS9eCcn
         XZe3GGzLESi/TXSDcEUmvCECqWyDeZYzJKvC2tDcqs8rb7ZBx5/4kmtD/tyv5l6Tme7N
         mMq+vjxLLP8iRWGpBDpyGvIkD3wxFGsT3jXo7jV8a09brSudb6vzy1Uj44oqAmSzWR/1
         o1dwAjLkNeYsOvHD7fYqc12lnjcceDCwOjgCpVX8IU6NB/5ucfKSkIraSk7pXZVXJJM3
         trJwvyr5hgPR6FH3O3glK8xidNtKEmBScpGsp48Fg/BcZRQOQlXtYeg+CaXtzr7k3UpZ
         TEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691679; x=1794296479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DkVqZCyEHTkw0fLy5AgelSQiyen6kTUwAZLAvdHj+5g=;
        b=I3L0RrDVuAkfwYi5SybeS2rJaKFblHjPWrlOZuBCTmH21RmgV4Bg5/deDLGUlx0IHA
         DYOAjWlGT3ciQhY7yZYXF6ptHgleSc8CvmdOaDnKQUmoNadB5oZoQ9oBxggGOlNfILnq
         TpenoPtTyaaEnaREl+rlfSEq1KVqADajAU0nhxSX0TXwM6nQeujK23wUSlUlBr1EXhdI
         R3EeQ2XQeTdjS8XgsaRbCMMa+HCq0YlNN4VFDMNz4/Lsm5t1IKnW/2oHtc6RVYmZSs+a
         9zOnMBWTr84/oIJheB8PFVhI1Z/Re9uUFxzvbhDS69gGM0axG+mS/3zH9AQr1dRmBWvD
         nb4w==
X-Forwarded-Encrypted: i=1; AKwUvBw3IPH7IBzdjLj6y3pqKSfV/kvD1Fg0zPwg1EvKFqdp7JFepjvg+7RS2BR0E/TyXmplLzI0jZlZ6s55@vger.kernel.org
X-Gm-Message-State: APuU4Z8AfxRJyIce4KfgTz2rin3ChO9R+ZWOj2T21kYLLBUqwCjJ1oEr
	vTZioP0zEEkVLYwXG5zRbjkYvKRh5D04YecFYfe2szsMOBEJX58LN6sZ
X-Gm-Gg: AYBFou3/Ia19IwznDJBnY1LqKECHn6pPOuvloA2i3Y9fzEIkddYivDvFLgU899fn51n
	CHY+Q6kDdDcRbMOkQCDRsHltc9yKgEFHhbDryx1TJelTiIUxokNU+6/LKAwJkp550rQ5yGSydgY
	6HazxChw3hcjyRRyP/zJXgyTpUGhEh0zYTlMK592WCJdlsHxpv2t90AG9V1cXcmN8owpHYVlq//
	2nGJuXUvmvEBRq/M4aCwhRxz7MFCLTMzYvNItuwekfK98rdJURcV2DKgghM1lqdmJ6qg13bb7ks
	yVU7od+EoHRG0Wh4zICc3F1ntggjgdIriOLWcKpdSu6SEcEWtfOcHfGlR4XRQCOEKY43/0v9us2
	mhFKUm+duvDl9iOetSrs1Tm+F4b4X0MUcEIUVNILtLyQwhSv86BWd8IJZpQwSEXPkvFaUmSoGn8
	ZeYG2JwZLUUiwFf+etDrWRuTA/9Eas5vM5RNSRNgwoo5G/3h+ltKWXkEHTWhSp5PDYR0SrsJ8aS
	rqBGFFC1O31p3VpnAtEtbNShjZcpwLqyYA9ZYr6OCblZOPB7LhwILdVDFdHhJ5NM2KP5em03vfB
	06jk/Zq88mHLIgCti5lU7K9dAGTj86V0cnm+n8IcEw5AUPucHMBUEColR9RvIyLUeKhsJaMcw64
	ZFYb1ESdmNiFO7NfcO2b8tvy8wUPdVR5/WLIEIcIeqFPAr4m2Q6kpTFyM4mEgGXCy7VvtpUZC9k
	MX9rQ=
X-Received: by 2002:a17:90b:1d0a:b0:3ac:d39d:ee4f with SMTP id 98e67ed59e1d1-3ae897f6e87mr9311929a91.44.1793691679407;
        Mon, 02 Nov 2026 23:41:19 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:41:19 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:56 +1000
Subject: [PATCH v4 08/22] ASoC: tas2770: Add compatible for TAS5770L
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-macaudio-v4-8-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=758;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=69WolvDz8NBwzZIcSNN8FfeWXOxg6F1Zc88rX6gr6IA=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8/JT/yQMm+dq82UlFMPTp/2dY06tJip9pvC6e8Tp
 nCaxhnc75jIwiDGxWAppsiyoUnIY7YR281+kcq9MHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEy1TQbDf5dT0nnf72fPOLBj079/H7k1rpdmX7u6dl1j6XIjR4djR6oYGXqmvg1
 +8eCK2cYJOaER62doThWo8+3ycjEK+na7YN3RfVwA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

TAS5770L is an Apple-specific variant of TAS2770 found in a number
of first-generation Apple Silicon Macs. Add a compatible for it.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 67ff2dd949be..57de75115450 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -987,6 +987,7 @@ MODULE_DEVICE_TABLE(i2c, tas2770_i2c_id);
 #if defined(CONFIG_OF)
 static const struct of_device_id tas2770_of_match[] = {
 	{ .compatible = "ti,tas2770" },
+	{ .compatible = "ti,tas5770l" }, /* Apple variant */
 	{},
 };
 MODULE_DEVICE_TABLE(of, tas2770_of_match);

-- 
2.56.0

