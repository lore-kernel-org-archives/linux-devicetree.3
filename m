Received: from mail-pj2-f15.google.com (mail-pj2-f15.google.com [74.125.227.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F183C4B6F
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 04:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.143
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880131; cv=none; b=CwGJSru+0G61rf59G7Yeox231mqNkHWhqAbi4HLMeYgn7phkT+lBOx0CA8z6Ky6So/g166Ss6bPCctypsWNzu/E0Tnom/MVtSQHwJNaz9U/jqlknh1i0qR8SQwPwDeYKm+xj2s2DCl1XwXJ+P+UA4lhjhrMNMAAWiXKIc6xzZcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880131; c=relaxed/simple;
	bh=pv2gkAEIZ5zw2KW9xVGxwYIrZhPA6WLMHSM1zupGGAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=la6vLE6tZmPs07UjWm/6U+6JB7xHmlsV7Qj0FuuK96XqXkIlKA3I57vp5AQa9y7YphDrbk2i7T4vOW2JjBb64OEYsKMaKtR+8TLccom2WoPLYjuqj4lH8NceIks5H1u+E0LA+A0M53h66SQ4LJncT2Lssyk7/2qjtIWirs0RnIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KbTojVNN; arc=none smtp.client-ip=74.125.227.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KbTojVNN"
Received: by mail-pj2-f15.google.com with SMTP id d9443c01a7336-2d747f01363so16730185ad.2
        for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 21:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880128; x=1790484928; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6GkASic1hpzs9f+gvFBpKnk1ih+SNPRQduHprBjjh18=;
        b=KbTojVNNZE/32Iw95SaFTeRqi2OGv0TOdAZf1sqN3OcIPpz02uM2dskTokK7we47w+
         F59m2gNBUuV3NwLvLAdViqFfuGYvtzOXcu01TQVIEmLbMi3aaKWObgUwPdFJd9/6aBb6
         aoDRD5RMoyWf5q7pvWzIXQcKQbSeo86YzLWt9AWouRVkKg7D0T1L50znJVTLWSEw1rYm
         1VX9xtU1m9bUffY/Y/aI26duSpa6jSEcJkT8MuzoDsXVz7Xo8C3M0extUuWA0DEQp3ON
         PdBj1wmV66wn/Rznx5mu3foeKQVhsYaAuam21vYr/OI21gR63mMSmt+NUiYdY+gOOIoQ
         RUNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880128; x=1790484928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6GkASic1hpzs9f+gvFBpKnk1ih+SNPRQduHprBjjh18=;
        b=LsrnAhcw9UUE9rwVRmWjT197oaaZgYQcSYpLD2skb1oBDB0Vf6osdLwiCDiTAdhwAl
         ujPd2YonJjTuDTVbiNF/cF7++5Ox/q5J1GrzY3DodJZ49qVCI0Rkstfb8ZUnWhDhvwkr
         keKxik40OWZF7kxUVdcvlnWiUT6xSoQXEIpMffabn3un6dVip9pwcSf8+M+DOjILr+Id
         NmTcs4pG25Wc5TdLVIgmzgpYNf5rP+dXS+hKRsZPvs9jH6GhuZlR6gaow3s/PsiH4BCh
         x2aXv19HW71pKHwxWAlNqApGOiPGKhQ7RNfQz58XLdECG4i6aJGArGKrjCkU0z84mB8o
         cnxw==
X-Forwarded-Encrypted: i=1; AKwUvBwSZWs5+M6tfiAvCIA2hc4A7vPITWCIny4K910RFhJapGyXI2Z8i73TiIxGOrVfs90XTGk4cqaNk7fN@vger.kernel.org
X-Gm-Message-State: AFuF++nPUbn6ypFc6haG3VPaLo2Xn5hNMtE0l/8ioCbIQcR1NIWvq1cF
	rT0xobddk+560eQfrK/4b1Aub9cHPHF8H8SCj2SPMrUmP1ZCVV4slgz+
X-Gm-Gg: AYBFou2F5TnZd1hARpVV7xTXj8MYQwhblNjZ+mZUiv6WcZh940wC7KpTrTQSw8bf+RB
	RTIHDrj7diQYTwV0bDTZ8DMvsINmGiyx4ZCLcynwaio9RuCmeFMVAAqV3wtln8t6ZMLtJoVaG/K
	bufOUf/EViTrsKlU3C0icsKs3PzjHDxvOdIdyFU1HN+fI3X5y65Q8TjNGlcPEYzxtUxtOnNPFFi
	D1KnYwB/Jh0mZqAPVk/q5/lW5tZCvxnkRnWLYpi8gAXWhKW7wdiPx5X6/uci31cSct+ABB6SRq4
	J7oRgOEj89F2VLK46YNTd+XMfJHvvOqEMhx2S2j5XTm+g2oCop0VFjr1cAyFMjioCkVk/ioj52B
	VyV44XV9ruswIAqI+q7XIty1RZJRa6wTcTkmXgPuzvrHKlwv+MTn0kPN1Ru3gykjl56eDm2ehBT
	iRFDOuL+zlL3A05T08gTVHz6nL81Ibq1DtMRICDdU0QGNF+31Jr9VOjZO0H/cDnbfsv1iiNyn0G
	Pgk+ywBrDC9/a+puhYk0y3NS1kWYNMQyjb4ijhOUkrPnfEglpswNptc/m8iLUdP/o5j78NTR+xU
	CmNtR5X/M9TBZn7um8n/dH436aHFTeD1ZDaxfUg46oCCcXl+I/R0awES2Q==
X-Received: by 2002:a17:903:1246:b0:2dd:ad74:ac81 with SMTP id d9443c01a7336-2ddb1bbfe2dmr111629155ad.28.1789880127792;
        Sat, 19 Sep 2026 21:55:27 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:55:27 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:41 +1000
Subject: [PATCH 02/28] ASoC: cs42l42: Fix typo
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260920-macaudio-v1-2-741cc20a74e5@gmail.com>
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
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=847;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=RKZhvpz4A2rORIqdl27bjjryHeuUXe6kyHBpGORO8M0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0+U3+zQnhu+zaJQKbtE55GvuMdeJjUP0Xn+D6iO1s
 kfcag4dE1kYxLgYLMUUWTY0CXnMNmK72S9SuRdmDisTyBBpkQYGIGBh4MtNzCs10jHSM9U21DM0
 0jHWMWLg4hSAqRZxZvjv09Fj/vVMx40H1RefGF4ryvsty2485Ub2Gn7jwwt+e7WcZmR4oruqv/L
 X3j3Zqp6fA2dZMNX5TDt+qnrCrGgbgfol+he5AA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik@protonmail.com>

Fixes: 2c394ca79604 ("ASoC: Add support for CS42L42 codec")
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/cs42l42.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 9e40c03ada4e..b5d69d5516a6 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -1682,7 +1682,7 @@ irqreturn_t cs42l42_irq_thread(int irq, void *data)
 	if (cs42l42->suspended || !cs42l42->init_done)
 		return IRQ_NONE;
 
-	/* Read sticky registers to clear interurpt */
+	/* Read sticky registers to clear interrupt */
 	for (i = 0; i < ARRAY_SIZE(stickies); i++) {
 		regmap_read(cs42l42->regmap, irq_params_table[i].status_addr,
 				&(stickies[i]));

-- 
2.55.0

