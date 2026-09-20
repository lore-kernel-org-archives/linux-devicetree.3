Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DCE3CF1FC
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 04:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880230; cv=none; b=RQzKkJaKoErOyAfY/FHwZQnBrMiC/2beeHsFt1tpLagHJRA1W78XjM25ibdmq6OOuZNhN9z0G9vAiXgbxzaenZx0D3o5baxlHsoVBiAvb0ZfWqEe5YSDAUM5nJJTm3e9OG2NQr3IhxazaG0ZVuXi5Idd1OPGfoLJPTqaMDxEQR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880230; c=relaxed/simple;
	bh=zDu5vJd6sfeXYn8zauBK//VBQImq8vA1wPLHgVDUDsA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f8mhgZpu+kNNlB9IBPaAHNtj33LPnbLg0CnJflT/ueMSRjoNpknlLysLw+p8QW9SHApIgJLFFucTmp1AcfFckH/NvICE99zTnEO827o8XcNxQDUchsWSwNBC8FZfhb+2yWuSs8Qovu5HA7c9/C5f86+1bkxOf48NlwgRWaqjKXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MU6ysIVy; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MU6ysIVy"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f066d8so6964015ad.1
        for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 21:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880228; x=1790485028; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Em5RHq8kurLglT2Y/3vN8YPxgrqKKepZuisLHT8U5Q=;
        b=MU6ysIVyzkpcx83zVOelibKJ9YkpZfJk1Lc3//btlSzrhnH267nrs1W6N3tbRHznrW
         1br5IJVL/iTxyB3f5l3g0WEhQ7BrzcDCnjAcOO5Y4JjOMTk2S2dXCKkrX4EiFgf1X8uD
         z8zkqhKi4bWyQkaLKc0qpjslOjkKjzyYpktBdHQcX55a9h00YteB5GjdMrdQWeDiuG88
         tUL2OFdirSbQJEvLlNIZmpSm2MA9kfc/NFpSrdpeWHaXp+oQyZYAUk1wbfi/b1R2ntqD
         Xr/xuflN99QCynIrXIIbNrQjBQNul7FFX9UsIRD9RUZFz11RaAaylEsxpOovwJ/g1dO3
         vDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880228; x=1790485028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Em5RHq8kurLglT2Y/3vN8YPxgrqKKepZuisLHT8U5Q=;
        b=g09eCd7GKBNqLSZQuN3e3pcuqy7cI4iqJzsPV4VRDd8V+yIRWdMmk3AhY/z1R8ZMLj
         ofxDagIbt7ksgaFZfcFiEl7rbD9csxw705MuO5TGxLSkjsP7Lr6MsYSDWAfUtZ2qsCWH
         8lnQ0asK42U4P78xdZGzflED1A4xAMy0AFTmpqUhoEZ17jfnRL5YMTdCETwvDIAZ+fzI
         BWDArwTEV3EPIbTxT/QpTZJGkze/55aazbNCq6ASFOTSCNuTIzGBWFBUUdNc4mVUExVW
         w19C5w1q6MIYK53r3tqv091AdUsrG2UOu5rE1Smde0HW+720kA+InwaexENiH5IpieS8
         5LkQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQT6ub6a980U9tCVh1XtjzKwxVJLpkhq9zs9y4D6HydGDAOICMiIk5EL7Fw1Olk1+6LRr+Zt8QfgyR@vger.kernel.org
X-Gm-Message-State: AFuF++noUU7+SoWSguubNH2lpnOMmLVa/9XygvZ7UgES7CeB8wIvXbDy
	V+KKuUYzEHxA7BFiMlEpDlMWarpzrMtdN+EV1gP4Rdr7/mE06hLWPQK+
X-Gm-Gg: AYBFou3KYpgJiM4ku5KtqpcBm9sOd1T37GQNz7YAORwksKMDuAAzheVdNXhiB+k9fmu
	VM4wi+4TGwQvpuRH7x4XTTPelDfPX56iCR8UEF61fnOmN9FcZFlFb4kLBRAvyLg1u3VpufCZxk4
	NRtbVblCL75/EP+wgw0rJ5ED9V7IACumMPISxkQNjsDOTFNiQqKNklwpcaA7iXnUreaNHI2t1Lm
	30t6eEKN7i0HPgLmaZXF4Sr9gh6MJ6bIeEot5MyDFL6AuZsSEPAxexlZ2vzVEDoZaPf6Afq1TRO
	Dn/NWl9yPBvG9YD/p3V1lMCDNfpyq3E7yc3WXmn+HpUrWN+ucKmTGQfIpVT7sBKjiws2ZM9dZKm
	JCtSXsVteFYv3xxHz90pLWZz0clvOl24VBa2xCTUjgVmrtHEqgI4wDz2cKnoPCd5nE00tWLqgdA
	KJKWM+icB0bAqJayg8S1dgjUD+50Qri2GkbunTMV8NQHJ10TGdF+1Kk7nUy3cmiGc/CKS+MCWop
	hKDaiyy1pp3+tnhV+44+zrSyjt8aX4ooFkG6P65//mMlCGs0t5PTXiVL1G0TSdtgLFft9AdHHpN
	A4Xajb2c8JgurzAIC6jJGngcAtlmPS9KCbuo5l2zZKWHU6k=
X-Received: by 2002:a17:903:1786:b0:2dd:c053:b9c6 with SMTP id d9443c01a7336-2ddc053ba3amr47265835ad.23.1789880227909;
        Sat, 19 Sep 2026 21:57:07 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:57:07 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:52 +1000
Subject: [PATCH 13/28] ASoC: card: Let 'fixup_controls' return errors
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260920-macaudio-v1-13-741cc20a74e5@gmail.com>
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
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3700;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=2WG4d/8EDKjA/Ac+P1A9R66HR3H99W3M7nFvRZ5lYJI=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0xXbV/kqyabeldw5w2j/zMmctyr9Nt7e4LXyl2qa2
 mN+iVsSHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKnWTGb4H9DXG5xQ1eBqtVFoYY2L8Brh1RZyjQeO3XsbkSDNPeXYd4Z/iu2mXVX
 qp19ZtQiuXdPgxaSWP+vVtKRV37rcbndO7dvPBAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

Let the 'fixup_controls' card method return error values which will roll
back the half-done binding of the card.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc-card.h                 |  2 +-
 include/sound/soc.h                      |  2 +-
 .../soc/mediatek/mt8188/mt8188-mt6359.c  |  4 +++-
 sound/soc/soc-card.c                     | 12 +++++++++---
 sound/soc/soc-core.c                     |  5 ++++-
 5 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/include/sound/soc-card.h b/include/sound/soc-card.h
index 1f1e7d45f553..c392e6c4844b 100644
--- a/include/sound/soc-card.h
+++ b/include/sound/soc-card.h
@@ -44,7 +44,7 @@ int snd_soc_card_resume_post(struct snd_soc_card *card);
 
 int snd_soc_card_probe(struct snd_soc_card *card);
 int snd_soc_card_late_probe(struct snd_soc_card *card);
-void snd_soc_card_fixup_controls(struct snd_soc_card *card);
+int snd_soc_card_fixup_controls(struct snd_soc_card *card);
 int snd_soc_card_remove(struct snd_soc_card *card);
 
 void snd_soc_card_set_topology_name(struct snd_soc_card *card, const char *preifx);
diff --git a/include/sound/soc.h b/include/sound/soc.h
index f356b553227d..d638fc69925c 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1005,7 +1005,7 @@ struct snd_soc_card {
 
 	int (*probe)(struct snd_soc_card *card);
 	int (*late_probe)(struct snd_soc_card *card);
-	void (*fixup_controls)(struct snd_soc_card *card);
+	int (*fixup_controls)(struct snd_soc_card *card);
 	int (*remove)(struct snd_soc_card *card);
 
 	/* the pre and post PM functions are used to do any PM work before and
diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index 75c90d1d165f..14890af97706 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -1280,7 +1280,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 	},
 };
 
-static void mt8188_fixup_controls(struct snd_soc_card *card)
+static int mt8188_fixup_controls(struct snd_soc_card *card)
 {
 	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(card);
 	struct mtk_platform_card_data *card_data = soc_card_data->card_data;
@@ -1302,6 +1302,8 @@ static void mt8188_fixup_controls(struct snd_soc_card *card)
 		else
 			dev_warn(card->dev, "Cannot find ctl : Headphone Switch\n");
 	}
+
+	return 0;
 }
 
 static struct snd_soc_card mt8188_mt6359_soc_card = {
diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
index 282d666dae9e..e4d81329cde3 100644
--- a/sound/soc/soc-card.c
+++ b/sound/soc/soc-card.c
@@ -184,10 +184,16 @@ int snd_soc_card_late_probe(struct snd_soc_card *card)
 	return 0;
 }
 
-void snd_soc_card_fixup_controls(struct snd_soc_card *card)
+int snd_soc_card_fixup_controls(struct snd_soc_card *card)
 {
-	if (card->fixup_controls)
-		card->fixup_controls(card);
+	if (card->fixup_controls) {
+		int ret = card->fixup_controls(card);
+
+		if (ret < 0)
+			return soc_card_ret(card, ret);
+	}
+
+	return 0;
 }
 
 int snd_soc_card_remove(struct snd_soc_card *card)
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 06167a198591..2092373698db 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2109,7 +2109,10 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 		if (ret < 0)
 			goto probe_end;
 	}
-	snd_soc_card_fixup_controls(card);
+
+	ret = snd_soc_card_fixup_controls(card);
+	if (ret < 0)
+		goto probe_end;
 
 	ret = snd_card_register(card->snd_card);
 	if (ret < 0) {

-- 
2.55.0

