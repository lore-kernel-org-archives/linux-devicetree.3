Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9A4330678
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 12:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776257271; cv=none; b=rwJVfyNdfI3U+MaCvva19JghY6sEYCTTpe1EG1WAEP/F50XHCyh9pDRw5qWfaEdlQvf2yAzztocsRkNilhMOo6FxOjfTOW9LQyia/meXqBsfwraAKLiCnYo7mUrVon/FsKTOKDsqSPm6xXfCjw2Lohth28C924JboyBxVUwDdrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776257271; c=relaxed/simple;
	bh=cHIp6KuufZJKj+9QDEYAC41FG9t4fNq15lb/6RK1zSE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i4YHC1sZ5lliK0MEVsc+hFQ87SGL5MOoEJvSmQbzcN4HggHM77Eyj529s77wiQ+49fU1OACUpyeD3g+/BvAXNxEOudm6HJju0SEKtp7oBPii7G0rRuM/ALAuwV873zdLs3IAEPoOWYirltAfHsBw11Nx/6yMpuZ/6Kxi8TTzpJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kGosha4A; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kGosha4A"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43d7badbd7dso1650689f8f.2
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 05:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776257268; x=1776862068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UBHWbtUtlzPl+OxM8QOAujP59U80OqIWeXAKTEjo1lo=;
        b=kGosha4A2ROn4iFWCGDtiYyyRFAprmG2r7M8vq09yHHyY4e051cs54O+qcLnvApfwq
         R+dPnohsjojcxXEnBEulwSyjU1je8xcwRImqVj4il25xRA0te4TKv4YyF5h6C7GtJzEh
         /8UJSmIt1HmabOFV/FWIs/tP9AisNA3dG2096ed95UwOdgAVnC95zXlp28Nh92Oiqa+R
         jGFZ2pPWKhx4lQozbOtJ/zCdPZTQomGASrcD+ylKkcvArfSEjEcFIjSEOnCT+wLb8BkG
         wD+2UnwntTWQvH0lRWhARz+GBbcW4+YB9Izd4FgUlJpSpDqYiDYuZFW/CRQkQNc6LEp5
         X7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776257268; x=1776862068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UBHWbtUtlzPl+OxM8QOAujP59U80OqIWeXAKTEjo1lo=;
        b=rUUODl6Wo5L4/a2yBuqpgOL3g8bqOXlcbLJjG96VOsPcoV+Ioipq4gTxwiuTzys07G
         BpUPFC1SD6G/mtwYbG2C8vAVNHJ9fcrkYar66ZrGvpEbuPMEW5ybVFxKebOabQ0bBFxj
         9svpQ1dPyW+Q4dZya8W57BLhFwHzBXjAvnKnxUED/eGyVzXGTWUBNWe+C8jpIIZBNqIH
         qFEi85nEbDYvWleYaSkIjWivE86vGQCGfA2YCLKxI+vcMg1YZqL5LPoHbJTACwjHnpEi
         hZN4Gb7X82Putsz8yibrJBNmG81Ma9yKevogMLhcDKHN5jr7CN2TLLTaeZNgyehHgQXi
         mO8Q==
X-Forwarded-Encrypted: i=1; AFNElJ9ONsV9yjgBIZptwAPn2+vclvSwN5OREEafPRzrsmc7JN+OFSIMIzl21w2w3/7hYM92t+iUaXLCZZ1f@vger.kernel.org
X-Gm-Message-State: AOJu0YyzjQqu3pCDIS4g8qRkJj1s0gRUWZjQGW/zqkiih20UxsQ8Jthn
	OJWfQmBY/ioxgE1qUhSLFgAElk1TSqu4Mnjviep0Y7VMeNhGgmJn9YZl
X-Gm-Gg: AeBDievejtLYhH9T1GS4qiPSGrHhHaEv4Ig1rs9ZboT9TDqE3m+fe+RII/BEoHInO1b
	4wzCP0u0i1au213kFO7tx7lGm1WhXRQVI6m/l+xlpqsbnWxe8mIBAZELHA8yhs7tRhD51cd2ekt
	GPMg4eNL1iPrI2/QKJfENTV3kdjdjHAIEz26SSYcVTBuyYKwIuSK4KlmPS9Ug94XkSY9sO5ngWS
	YNASuhISbz8eRZeKJAPbemaff5c/TQdSpCD8LIFKbBtcn9tMSq/TgUywag2gw39aWEV34ujC4a4
	D4HLYwGsF+H+l8r1CcMCebmNqJkE1NuRBZBn8HnrjXs8fLTa8SMXhDp23H3qidrc86JFiSIRM7V
	FqG4n/1jjF3JFZE2LcVk8765ubTN7OVRpPMi2h77gUKitlu4MGZToqLpqKF2gzIulELuM4CeQUR
	3OTaq87qDmEAJyjTOV4rPqbyB+g8xQXw5NhGFpow==
X-Received: by 2002:a05:6000:4010:b0:43b:5095:d101 with SMTP id ffacd0b85a97d-43d642b8e12mr33503201f8f.27.1776257267636;
        Wed, 15 Apr 2026 05:47:47 -0700 (PDT)
Received: from localhost.localdomain ([2001:41d0:406:c100::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead356616sm5123319f8f.13.2026.04.15.05.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 05:47:47 -0700 (PDT)
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
Subject: [PATCH v5 11/14] ASoC: rsnd: adg: Add per-SSI ADG and SSIF supply clock management
Date: Wed, 15 Apr 2026 12:47:28 +0000
Message-Id: <20260415124731.3684773-12-john.madieu.xa@bp.renesas.com>
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

RZ/G3E's ADG module requires explicit clock management for SSI audio
interfaces that differs from R-Car Gen2/Gen3/Gen4:

 - Per-SSI ADG clocks (adg.ssi.N) for each SSI module
 - A shared SSIF supply clock for the SSI subsystem

These clocks are acquired using optional APIs, making them transparent
to platforms that do not require them.

Clock prepare/unprepare is handled in rsnd_adg_clk_control(), which
is called from probe, remove, suspend and resume (all sleepable
contexts). The trigger path (atomic context) only calls
clk_enable/clk_disable, which is atomic-safe and requires no
additional splitting.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:
 
v5: No changes

v4:
 - Move clk_prepare/unprepare for per-SSI ADG and SSIF supply clocks
   into rsnd_adg_clk_control() instead of separate prepare/unprepare
   functions, centralizing clock lifecycle management
 - Return proper errors on clk_enable() failure instead of dev_warn()
 - Eliminates hw_params prepare leak concern since prepare now happens
   once at probe/resume

v3: No changes
v2:
 - Split clock handling into prepare/enable phases for atomic context
   safety

 sound/soc/renesas/rcar/adg.c | 91 +++++++++++++++++++++++++++++++++++-
 1 file changed, 89 insertions(+), 2 deletions(-)

diff --git a/sound/soc/renesas/rcar/adg.c b/sound/soc/renesas/rcar/adg.c
index 813ad5eabba6..9cae3bbefa55 100644
--- a/sound/soc/renesas/rcar/adg.c
+++ b/sound/soc/renesas/rcar/adg.c
@@ -19,6 +19,9 @@
 #define CLKOUT3	3
 #define CLKOUTMAX 4
 
+/* Maximum SSI count for per-SSI clocks */
+#define ADG_SSI_MAX	10
+
 #define BRGCKR_31	(1 << 31)
 #define BRRx_MASK(x) (0x3FF & x)
 
@@ -34,6 +37,9 @@ struct rsnd_adg {
 	struct clk *adg;
 	struct clk *clkin[CLKINMAX];
 	struct clk *clkout[CLKOUTMAX];
+	/* RZ/G3E: per-SSI ADG clocks (adg.ssi.0 through adg.ssi.9) */
+	struct clk *clk_adg_ssi[ADG_SSI_MAX];
+	struct clk *clk_ssif_supply;
 	struct clk *null_clk;
 	struct clk_onecell_data onecell;
 	struct rsnd_mod mod;
@@ -343,8 +349,16 @@ int rsnd_adg_clk_query(struct rsnd_priv *priv, unsigned int rate)
 
 int rsnd_adg_ssi_clk_stop(struct rsnd_mod *ssi_mod)
 {
+	struct rsnd_priv *priv = rsnd_mod_to_priv(ssi_mod);
+	struct rsnd_adg *adg = rsnd_priv_to_adg(priv);
+	int id = rsnd_mod_id(ssi_mod);
+
 	rsnd_adg_set_ssi_clk(ssi_mod, 0);
 
+	/* RZ/G3E: only disable here, unprepare is done in hw_free */
+	clk_disable(adg->clk_adg_ssi[id]);
+	clk_disable(adg->clk_ssif_supply);
+
 	return 0;
 }
 
@@ -354,7 +368,8 @@ int rsnd_adg_ssi_clk_try_start(struct rsnd_mod *ssi_mod, unsigned int rate)
 	struct rsnd_adg *adg = rsnd_priv_to_adg(priv);
 	struct device *dev = rsnd_priv_to_dev(priv);
 	struct rsnd_mod *adg_mod = rsnd_mod_get(adg);
-	int data;
+	int id = rsnd_mod_id(ssi_mod);
+	int ret, data;
 	u32 ckr = 0;
 
 	data = rsnd_adg_clk_query(priv, rate);
@@ -376,6 +391,22 @@ int rsnd_adg_ssi_clk_try_start(struct rsnd_mod *ssi_mod, unsigned int rate)
 		(ckr) ?	adg->brg_rate[ADG_HZ_48] :
 			adg->brg_rate[ADG_HZ_441]);
 
+	/*
+	 * RZ/G3E: enable per-SSI and supply clocks
+	 */
+	ret = clk_enable(adg->clk_adg_ssi[id]);
+	if (ret) {
+		dev_err(dev, "Cannot enable adg.ssi.%d ADG clock\n", id);
+		return ret;
+	}
+
+	ret = clk_enable(adg->clk_ssif_supply);
+	if (ret) {
+		dev_err(dev, "Cannot enable SSIF supply clock\n");
+		clk_disable(adg->clk_adg_ssi[id]);
+		return ret;
+	}
+
 	return 0;
 }
 
@@ -424,9 +455,35 @@ int rsnd_adg_clk_control(struct rsnd_priv *priv, int enable)
 	if (ret < 0)
 		rsnd_adg_clk_disable(priv);
 
+	/* RZ/G3E: per-SSI ADG and SSIF supply clocks */
+	if (enable) {
+		for (i = 0; i < ADG_SSI_MAX; i++) {
+			ret = clk_prepare(adg->clk_adg_ssi[i]);
+			if (ret < 0) {
+				while (--i >= 0)
+					clk_unprepare(adg->clk_adg_ssi[i]);
+				rsnd_adg_clk_disable(priv);
+				return ret;
+			}
+		}
+		ret = clk_prepare(adg->clk_ssif_supply);
+		if (ret < 0) {
+			for (i = 0; i < ADG_SSI_MAX; i++)
+				clk_unprepare(adg->clk_adg_ssi[i]);
+			rsnd_adg_clk_disable(priv);
+			return ret;
+		}
+	}
+
 	/* disable adg */
-	if (!enable)
+	if (!enable) {
+		/* RZ/G3E: unprepare per-SSI and supply clocks */
+		clk_unprepare(adg->clk_ssif_supply);
+		for (i = 0; i < ADG_SSI_MAX; i++)
+			clk_unprepare(adg->clk_adg_ssi[i]);
+
 		clk_disable_unprepare(adg->adg);
+	}
 
 	return ret;
 }
@@ -769,6 +826,31 @@ void rsnd_adg_clk_dbg_info(struct rsnd_priv *priv, struct seq_file *m)
 #define rsnd_adg_clk_dbg_info(priv, m)
 #endif
 
+static int rsnd_adg_get_ssi_clks(struct rsnd_priv *priv)
+{
+	struct rsnd_adg *adg = rsnd_priv_to_adg(priv);
+	struct device *dev = rsnd_priv_to_dev(priv);
+	char name[16];
+	int i;
+
+	/* SSIF supply clock */
+	adg->clk_ssif_supply = devm_clk_get_optional(dev, "ssif_supply");
+	if (IS_ERR(adg->clk_ssif_supply))
+		return dev_err_probe(dev, PTR_ERR(adg->clk_ssif_supply),
+				     "failed to get ssif_supply clock\n");
+
+	/* Per-SSI ADG clocks */
+	for (i = 0; i < ADG_SSI_MAX; i++) {
+		snprintf(name, sizeof(name), "adg.ssi.%d", i);
+		adg->clk_adg_ssi[i] = devm_clk_get_optional(dev, name);
+		if (IS_ERR(adg->clk_adg_ssi[i]))
+			return dev_err_probe(dev, PTR_ERR(adg->clk_adg_ssi[i]),
+					     "failed to get %s clock\n", name);
+	}
+
+	return 0;
+}
+
 int rsnd_adg_probe(struct rsnd_priv *priv)
 {
 	struct reset_control *rstc;
@@ -798,6 +880,11 @@ int rsnd_adg_probe(struct rsnd_priv *priv)
 	if (ret)
 		return ret;
 
+	/* RZ/G3E-specific: per-SSI ADG and SSIF supply clocks */
+	ret = rsnd_adg_get_ssi_clks(priv);
+	if (ret)
+		return ret;
+
 	ret = rsnd_adg_clk_enable(priv);
 	if (ret)
 		return ret;
-- 
2.25.1

