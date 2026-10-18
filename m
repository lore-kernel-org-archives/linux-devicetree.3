Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DDE41A794
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 05:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792302932; cv=none; b=hnu6CW2lFKTnWF5onJMIj+Yu48VWg6I5jqn7FBNOmiBOfXoLbfA3fjWGJPzlQl3mmP3g4iZHRi4yv7fHdWsvFF8CLxPzqKyYIipQu5FHigh7dPyaSVSYAfoe4gwRUD3axXHI1Bfxi1rzTFW+z2Cr+wdsvWZLs8HE5AG1oac3N6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792302932; c=relaxed/simple;
	bh=L/QlyuMnLBDV61JQRkgIlDc1IxU9ojp/9m+G2x+efgk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YyCTvWy3rGz2l9QiQAiYNxWKaxHOm+p8ug3r3Sx1PVrv0K5I8IVPIPrDSuEs7QS8f8LJgTEwyZpFneMR/fYXZvlLOT0ZCnI9T+NWfr8w9QdJ6OF8LkDkmxEeF3LghIa2oqPlBWmWIHtn3rnJmEktwELeLRrE1Cav6CR0hki56Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qKXYh/ra; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qKXYh/ra"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3a4b9732d5aso1021041a91.3
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 22:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302931; x=1792907731; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A8gbur1ARV/hJRgldNVfFQEJ716Dcvui6UIUaLYcvaI=;
        b=qKXYh/ray7yeTDuMXlAX/WufraxAYrj+Dx+cYsa5GgXXtAUVUjvL/UzKE4gdQ3PQiO
         nwsgpw8QF4bbWIhp8lYmXj1U2nUg4E3FPi/RP1wsn1lRwjimw41N0lmW1uirtz4iWSkw
         SP61FMvxASAEGRpPmEAMQP7kDJT0TFc5Eqr1DSISDws0bj5gyLqjhUD6EaSA/828tuPm
         IPsMv/dXh2pHBrjFjRV2n56y7vYV7POhXVOPyIy7TSjbgd/ADCNvSCgzyKQf21oEXmYQ
         H36LDNaL2S+yuEJJtlLYY/MJafHntgKPArtSeRea9R3S8TjCwfYSGQVMVCVxMFf5BpIq
         Y1HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302931; x=1792907731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A8gbur1ARV/hJRgldNVfFQEJ716Dcvui6UIUaLYcvaI=;
        b=j+XtXPSDTZMvlnR73ruja7Uh2J/vrZsqcCb9j5RBB9BaTgovQkpGt5Gt24G6re1vuM
         oa9CnAouEGDxuIuWSFc07jErcL7Z0yak4Xy3kuwzGCmrnRPyiRxEwmi3WdeqcoC0DZDB
         MBe52zy9kQvv3NmuXzYDgdVtKyENc+c5JuEAQXVr9hKC3Yk9JYsbr53qJLPBqvyFEvPz
         D/0zikbXKpvZ+97W9p4IvB/rlDtgH/blN6Rv5meRcfOLPKavlBxNUGb5Q9UYu/dmTexf
         ALnDIP+5XKXUfetYAqfo7AEp7N+Iur6RCB2A5pGQyuM3MVtHIUqoCLMa38jhUjF+9j9P
         ghxg==
X-Forwarded-Encrypted: i=1; AKwUvBxvl0457hp0puobz9iwmXd3QElSF8v84JJln5STW47+SJaVTu9KmyeagTAZutX8CqqYv/6A04sxxbpd@vger.kernel.org
X-Gm-Message-State: AFq9FYJ47L0ZhGkErmxU8eC+zDzLQrXRkazBJ1/MxSTTEn+T1xbg1tH+
	+otieyR9Eqm5qo+P7EQ8HIAF4FxJpk44wdH2QeO4xf9QiANRhtIqj847
X-Gm-Gg: AYBFou2DWQLoOUnHphnocGhSs1liKpAiHKmc+8xmtIxFFr60l9gcDDjeSFAddUFEKlK
	2zhBeYXMaVcUUFdBqsGqiJKFPYTsin5nE2vcQaKbrc+Tohil0E1jMdXQF0eRRAIdpM6cc43ixxL
	qr/0vSMyJeMYy2USQDU3woAMkS/j+B81P5erpytjQDAuG/ROLMi/P2EfgzyGGvlySCo3CP2LYbn
	6HneyUkW60q/GUChder/42r9pdJ4fXk6nccR21wev8PnvrCY2zEYPsMskGJZ6YCURH3fNDPCobF
	CWf98KqALTUEVZsgYN9hAftlsgtUYs2XHEJw9zILmpYrP94WZI9jVhn6+FwoNIXE9+JI0VBKVqC
	Nv9/dFQXp2QJcm4a5qKLcKYcqnwPY1EUYxeOhZGT3VNkjQixHnuqKafpxu8VSPVfn+JodYgTkkb
	BN/azHkyTgn3COrqSvcAdRe0WkaHezcozR0eoJxSYMSb2K/j5gdVdND5w/TIn3yvjf+5HRracHl
	SQjCjS9eCUy1PNLj0Ne3jlDzS78VRPz6PDO3EhuRl2wGBL5NXGGiaI5dbVFZYVeEKZjdjAhsieO
	vLjZby0yALteWKlDHt+ctpw5HJMew8yBHOzXNTglg3wsVw==
X-Received: by 2002:a17:90b:388c:b0:3ab:be66:ddbe with SMTP id 98e67ed59e1d1-3acef17b443mr4199337a91.28.1792302931040;
        Sat, 17 Oct 2026 22:55:31 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:55:29 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:00 +1000
Subject: [PATCH v3 06/21] ASoC: card: Let 'fixup_controls' return errors
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261018-macaudio-v3-6-abdff7741dea@gmail.com>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
In-Reply-To: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3700;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=WKyXFBYrRnpsdpBs7slDgKqmeLl5GkYhostLo7OTo0E=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4nl87T3eH52yiC/OL4kx8RDDVXlZQf9lU9a6vbxw9
 +IPh/hjHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKne8ZGRYX/F3ut5WcfvqE5O/rHN8cD3KUEB56UknrrOjWb/crB7ricjw2Vm9hK
 RRfx77sqoHRCY9KBn30OXzQzajz/9dbPNujk9jgUA
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
index dcfd706a73ad..a3b9d2610514 100644
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
2.56.0

