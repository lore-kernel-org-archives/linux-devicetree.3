Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CAB355F54
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 12:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776257270; cv=none; b=WWhPpfwe3CZ7ybNoINKJppgW4+dIhvoG1J598QY8bZs1N7671v5G8FrlA6fKMc0VO5yqGrJZ36gGeEgRUy036tPKVIwESW0psgzvff6LWokrDC0R7VqivKhP6+4gkulMEutdaPygpcqn5Pw9IF5zbE25/lkFpBkGFdLJ+ASpMAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776257270; c=relaxed/simple;
	bh=+pFXbL5AUesXszbyYGLL+MT4o6mCBIo3EDz/8Nk1tsc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oDcvLyRA6XcIcguRpn/6Tjj8SfdVQznjS6p1cX7gsO5VFzB0ZetbrNhtd1aA3rblS5ZdaYi4tIesf6X+cApQY42xxu8PQXT41Iu/DtY0kZX/nFF+UhXJitsNrMTzqJFm1uNGX97a+UWsGio5d8polqZVxQqWlbi9eaAc1gKQy7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bkRo6ALi; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bkRo6ALi"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43cf8fe9c2aso4235046f8f.2
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 05:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776257266; x=1776862066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jk3PxfqcVUsp/jCD7Gx4pQpsBhAEOkB0+K5c3K014GE=;
        b=bkRo6ALi6W1W93K6is9Ju3AxZjJsSpwcqoBB7avtdHweihydmokzLL4Zc/82BWzhLQ
         PWveHscKFnBFOBi4GYuDwmNZ6cLvyz2vMIh0U1oJgHFX8VVHAGa+NB0JQ26LiTRgVBlL
         12CgOFOrlPjm22bwzjGAfWiKwnQTXNZumlXC+zbkZ0QAJySBcBLNdcUXjKx4eTO+X55w
         HpagweuAS+aKINBcn3Pk7YXrfClavdnsEJlBLghuBjhOD5fUqG9RzWoWZ7xCBeKge+Iu
         94Q3i4ZnGtK6ZIgWEVwy28CwPEa3fusy3jncp87lARxqwKgivg+z+0MG+5Ipgal53EUB
         BjLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776257266; x=1776862066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jk3PxfqcVUsp/jCD7Gx4pQpsBhAEOkB0+K5c3K014GE=;
        b=gOKGpZSAcXjZpBHBsnI+M7H0jldcu3DkiiwRv1xJg6UvzIqKQv6mw2Fm4UoKqr0U6Y
         p0N+WaeoGa/2hL4sVg/D8zDUw+rCNvn6IPw4//PhPq8kyOpWFOcquXPNSgvW2ruN3K82
         R+Zp2jgqpKHOhwomvwzeATaVuil7Cl5kUkRdUhKD1zAKoRiBmmsz9QmLfhfteFMLaHVn
         ZJGF7wXqHoxBx18xtISCHHinwE1pX1A+NUf5cgFWJ0+FTNvNlE6zY5Y+BXgMRRvaI4HU
         /9tudu97+P64L07lSQTmKzX37q31we8nEwy4iL/qS0RGHJHuC78ARIK4U8Qo8vZ5XYez
         suOw==
X-Forwarded-Encrypted: i=1; AFNElJ9ES/jGO9HRVku5yU/uOUHx3Iim7g8jzLuktToKrkzl3/RUIzSlUBZkKHYm2+woXLyU/0qu1R6gtc8Z@vger.kernel.org
X-Gm-Message-State: AOJu0YwMbTK1ur2tq3wA6Srk7R54r6ZgwOulxBbTldT2jFG0TBmFiakM
	YaQwhssMZNT/GDY78syHwUHM26ZNRpMxXk53QjlTgaOcMq3eZDUua5kr
X-Gm-Gg: AeBDievph+lhp+NmkItsDQZQBFFKuPT+pAH+paRl1Ke2he7tUbLLZrI83v6g/1fNqM1
	Zf/d0l/LCMrVrimHOP67xTAcV8dQX70pmAWcOJtkVhDus2wBEXwI5c5BE+Rr5PKCabq8o0JpJlQ
	F2wsgPZIZCWmWXXVokpSpH+hhpvNMa+fHiir6fi6SSJcSe8+6HTLVq09ncvcejnbZZA464X+3On
	3cSWb8KZgQx7ia6HYurEt7HCI8S5eMzgYqv3ktVPx7NFhf7hot1LBOP8pncA+Q+X1ojbgMD9chV
	TKfaI/zMhFNc8f7tkxLI/MTm5hVbAOE3jwlYp2TLk5vX3o9LR1frevMmXb4AhKRjqGfQqlqXjYq
	TLagBXI+n39PX7v0kDnEp9xqcWhz860VYOFMokSJsVUZ+XP0j6ZmqU18mzOX8IikhHyBhRFw/vR
	O5UDXmTk6WsHDvjXWfv67wTSZFXixU2OItuVsAsQ==
X-Received: by 2002:a5d:5d83:0:b0:43b:40ef:5d1a with SMTP id ffacd0b85a97d-43d642552e7mr31331940f8f.5.1776257265506;
        Wed, 15 Apr 2026 05:47:45 -0700 (PDT)
Received: from localhost.localdomain ([2001:41d0:406:c100::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead356616sm5123319f8f.13.2026.04.15.05.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 05:47:44 -0700 (PDT)
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
Subject: [PATCH v5 09/14] ASoC: rsnd: Add SSI reset support for RZ/G3E platforms
Date: Wed, 15 Apr 2026 12:47:26 +0000
Message-Id: <20260415124731.3684773-10-john.madieu.xa@bp.renesas.com>
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

Add SSI reset support for the Renesas RZ/G3E SoC, which differs from
earlier generations in several ways:

 - The SSI block always operates in BUSIF mode; RZ/G3E does not implement
   the SSITDR/SSIRDR registers used by R-Car Gen2/Gen3/Gen4 for direct SSI
   DMA. Consequently, for the RZ/G3E, all audio data must pass through
   BUSIF. PIO mode remains available for R-Car Gen2/Gen3/Gen4 platforms.
 - Each SSI instance has its own reset line, exposed using per-SSI names
   such as "ssi0", "ssi1", etc., rather than a single shared reset.

To support these differences, rsnd_ssi_use_busif() always return 1 on
RZ/G3E, ensuring that the driver consistently selects the BUSIF DMA path.
While at it, update the reset acquisition logic to request the appropriate
per-SSI reset controller based on the SSI instance name.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v5: No changes

v4:
 - Clarify in commit message that PIO mode remains available on R-Car
   Gen2/Gen3/Gen4 platforms

v3: No changes
v2: No changes

 sound/soc/renesas/rcar/ssi.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rcar/ssi.c b/sound/soc/renesas/rcar/ssi.c
index c06cebb36170..c65435551283 100644
--- a/sound/soc/renesas/rcar/ssi.c
+++ b/sound/soc/renesas/rcar/ssi.c
@@ -1158,6 +1158,7 @@ int __rsnd_ssi_is_pin_sharing(struct rsnd_mod *mod)
 
 int rsnd_ssi_probe(struct rsnd_priv *priv)
 {
+	struct reset_control *rstc;
 	struct device_node *node;
 	struct device *dev = rsnd_priv_to_dev(priv);
 	struct rsnd_mod_ops *ops;
@@ -1207,6 +1208,16 @@ int rsnd_ssi_probe(struct rsnd_priv *priv)
 			goto rsnd_ssi_probe_done;
 		}
 
+		/*
+		 * RZ/G3E uses per-SSI reset controllers.
+		 * R-Car platforms typically don't have SSI reset controls.
+		 */
+		rstc = devm_reset_control_get_optional(dev, name);
+		if (IS_ERR(rstc)) {
+			ret = PTR_ERR(rstc);
+			goto rsnd_ssi_probe_done;
+		}
+
 		if (of_property_read_bool(np, "shared-pin"))
 			rsnd_flags_set(ssi, RSND_SSI_CLK_PIN_SHARE);
 
@@ -1225,7 +1236,7 @@ int rsnd_ssi_probe(struct rsnd_priv *priv)
 			ops = &rsnd_ssi_dma_ops;
 
 		ret = rsnd_mod_init(priv, rsnd_mod_get(ssi), ops, clk,
-				    NULL, RSND_MOD_SSI, i);
+				    rstc, RSND_MOD_SSI, i);
 		if (ret)
 			goto rsnd_ssi_probe_done;
 
-- 
2.25.1

