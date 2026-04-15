Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DCC35C1BD
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 12:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776257270; cv=none; b=BOpozAVfLSCZorV3DoaRw/l0mVSZBGelcinrlOd2Yt9ITl1ElXlGUdoB6VSl0jhprqMouDYt23z3KLBA44Lq7trBiGx57f7VLRYWohqpBBoTmWyfIrwCvN8YkPni2LcOSmVgbHz69FBWDvxdbt4Y0d7T2jQn71QV/ptz60OYs0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776257270; c=relaxed/simple;
	bh=jEQUdAtH8yE5mBvf4ytaTJJnGJ58WWs9SMxtTW7gBUg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W7IodxB3wqD1vvaPxtyFXoHjoqKXzl8DbdSiV51Rux2PZ8esJLkJyl9ky21FXGY0JXDffBnfqTku5LGI/uJWeXzncqOwFHDtdFLZs1BVuajEMicwNiyFcQRZWNHGmyHl1TNsvag/sSAgaDbJ6B2Us0AuY0Poh+ZRI38lnNQT4FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pOT800eY; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pOT800eY"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d72875729so2427750f8f.3
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 05:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776257267; x=1776862067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bzcOCyQLNmU8cBIifwv6HJp2UvPykwfLFilqam8mArk=;
        b=pOT800eYk1HANo1s6Jv49cU/Aj3dWRzvCsbG099gjq75vYWtjkC5uzR2/FYYqb5yiI
         sXWGfI0HMaQ4CtP7Ah06ftVkap+YvMDq2TuEpN8riwTPE0l3joQJwUl0uJF9XQl1eiyJ
         b0DhiN6O5zrmZVk0NqyxJHuk+O6UJ4bgS+nCa76bmUHjUTju4Sv3wrmDtpRuRb6xC/HP
         y3B+XtANE1MFDyT5NYEljd49rLst9rNUaTk1mZSJ2VkvPAVXDViakJmqQzU6+bW7u9Nr
         WogIEhstTcN/OTZidJ28nRiQGLffEd7P1LJbAFwHFbb5eBCtFvStP6/Zq/kSbo6jcSoF
         qaAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776257267; x=1776862067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bzcOCyQLNmU8cBIifwv6HJp2UvPykwfLFilqam8mArk=;
        b=CYzfA8uUyxvQEd/4tWzw597ljwpVBKUg7uUFq6G8qOzqvprLcyZ72/W1ItTNr5T2bG
         q+LfyIsq3H4WsaprP3VXtGQYgmBo3D4iLmQwva1+iRK3d54f5HNV0H8Bsqh8fuvqkeec
         9/BJM5c1UjvJjZwt4+Fw+//I1CB9VphcWL7w98THHQw8Et3oxaK2uIw7kCS8uXp+odlS
         MQ8sP+SbGYAEGNw/H+tzn5mRXIxTZkMoX8NtMrYRV5P3FmDhLNLDhsf69ujRyRfvqvWw
         5gVYmDJO60MD9wg50dKdQb2hvXa3luJ8dOCv4UWLW9/SOyq0GY2A7wQ4/nkvnJpdMku7
         QS9A==
X-Forwarded-Encrypted: i=1; AFNElJ9Z3BHEMxxOZJWZQ+l6maz+2LRHk5rEYWXmkN8JIob9BXK7DgfBQ5grrVD/HVcajk54okdLJE/mzuOp@vger.kernel.org
X-Gm-Message-State: AOJu0YyO1RaiwiPOo/MdzDo2jqzUA4XMQZ6y+MtiQwUCMCanti5EdKGr
	UFsllL5Y2bfSBJQSjyhdDnv9GXzYCK6rkq7j+p4ULSjC6s5K+RdDo7H9
X-Gm-Gg: AeBDieuDrY5qyvO9aqWzRDUxrWg8fP+q39dh4fBECL3/M3dRTCze6vaX+RS/cg+VehM
	PyeTb8blvcWMbtS6Ld0VmmRSFmue8KmN8kE08rICxXvvIhjKzcydfn5gQJKIuZrnW6bbTmDKpxi
	mMXuXWJWb2gBMsHbHuwDLF9tQxEymeeXHT9sfhpwFiAEG97QMs/E1i9Ca7p8DVfp5wbF1I/jTKC
	8qGJcgIydZoWSckt/B/O2ompzfWhXj2y8ED0uD4zo4ZsZWREpOyBRIvMs8z8MNPSFPf+3Gi30Dg
	cTkX37K4p+wwJUax3E45O9GslyyEN9UKba/FruNe1J6E48h8xJ9dHdAJiAWvauu4bh2UUc4T4w6
	8w71Y/lZmTFkmKzMFutYOP5Qmx7N+np0JK8QFHoNZsu0o6QPA6mZt9KYZOLxIWdKAN4EAkB0769
	xYl4v6AkXpdUGHE4Icf7+3TBCp5fioJr2RCmYcMg==
X-Received: by 2002:a05:6000:2081:b0:43d:6ff5:3a2d with SMTP id ffacd0b85a97d-43d6ff53ad1mr19853081f8f.10.1776257266466;
        Wed, 15 Apr 2026 05:47:46 -0700 (PDT)
Received: from localhost.localdomain ([2001:41d0:406:c100::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead356616sm5123319f8f.13.2026.04.15.05.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 05:47:46 -0700 (PDT)
From: John Madieu <john.madieu@gmail.com>
X-Google-Original-From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	john.madieu@gmail.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v5 10/14] ASoC: rsnd: Add ADG reset support for RZ/G3E
Date: Wed, 15 Apr 2026 12:47:27 +0000
Message-Id: <20260415124731.3684773-11-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260415124731.3684773-1-john.madieu.xa@bp.renesas.com>
References: <20260415124731.3684773-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RZ/G3E requires the ADG reset line to be deasserted for the audio
subsystem to operate. The ADG module clock is already managed via
rsnd_adg_clk_enable/disable() through adg->adg, so no additional
clock handling is needed.

Add support for the optional "adg" reset control on Renesas RZ/G3E SoC.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v5: No changes

v4:
 - Collapse dev_err_probe() and rsnd_mod_init() calls to single lines

v3: No changes
v2: No changes

 sound/soc/renesas/rcar/adg.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/renesas/rcar/adg.c b/sound/soc/renesas/rcar/adg.c
index 0105c60a144e..813ad5eabba6 100644
--- a/sound/soc/renesas/rcar/adg.c
+++ b/sound/soc/renesas/rcar/adg.c
@@ -771,6 +771,7 @@ void rsnd_adg_clk_dbg_info(struct rsnd_priv *priv, struct seq_file *m)
 
 int rsnd_adg_probe(struct rsnd_priv *priv)
 {
+	struct reset_control *rstc;
 	struct rsnd_adg *adg;
 	struct device *dev = rsnd_priv_to_dev(priv);
 	int ret;
@@ -779,8 +780,11 @@ int rsnd_adg_probe(struct rsnd_priv *priv)
 	if (!adg)
 		return -ENOMEM;
 
-	ret = rsnd_mod_init(priv, &adg->mod, &adg_ops,
-		      NULL, NULL, 0, 0);
+	rstc = devm_reset_control_get_optional_exclusive(dev, "adg");
+	if (IS_ERR(rstc))
+		return dev_err_probe(dev, PTR_ERR(rstc), "failed to get adg reset\n");
+
+	ret = rsnd_mod_init(priv, &adg->mod, &adg_ops, NULL, rstc, 0, 0);
 	if (ret)
 		return ret;
 
-- 
2.25.1

