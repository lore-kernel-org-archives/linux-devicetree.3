Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E6930E84B
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 12:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776257263; cv=none; b=dgs3ErK8uF2BjB9aP6LlRS+O3365ZmT8AIWhmDLtrZmWSqDXlVYFKdLGY5KiaiENiJcD0IcX4gJqWo0H2UlVBLGqDTsz3Ym65tTuMqy+O0UMqrsYPes9YMCyoiKw/HZ/ZfKA9CdZDwtJNac1bpmFErTu8D5x8D9UZZwmeoFQPo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776257263; c=relaxed/simple;
	bh=ckJt9CA3Ip+Nr/sG9pWs92MvFhFGs423bXz1O9uCz18=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rtT+x7oKJk9sCcoKuqjajoYtvGNAphLAuWJ6+s2B33R+dzy3XZ3dgYMDRbuiMRvtz/Jv0yayj3IKSOfEPWuAuCLp0rY8YXVHbM6Cai0QhPdXTcHrtK0Eb3bp2XRVKp3BDzn1X+h5xRLT/v7qsUe3xK8+sh+ycHkAuB0GLrx3P3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=muAF0qxk; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="muAF0qxk"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43cfce3a195so4200321f8f.2
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 05:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776257259; x=1776862059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=muF5Fgr3euVIwq3LckXBbYSe5tnWfPAvxpBr8ofKVq4=;
        b=muAF0qxkA5czICOMHz7qfe87hOQoGaIINqtNghNCFp9JaDLMvI8IEDb88+fQMFScf/
         s6KyGcaCUZvap/Qkx1yP6IMsMmbEL3pRdJRWmWpmKGukw2oJbYRpEOhHKjZz9BW/blWL
         bz/rF5/cfov4qx/RhFJJzBgr1/4jO/8wfI5ZBWmqthjlK6HjAXSLMiHwmlgmZNqgw3Js
         e8a+vY7RhHrYc50FnN9dIDhLHUkREWL0Aaca1Ns4+/E+eIoxFsjQbBD88hz5HDXtJxg3
         uIXS/kK/9dSdKTP7f6nbZQfjH0OkocjzJnTUfIGu7Ry576U6aYjM/epqJRVD+a2n8wNa
         AF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776257259; x=1776862059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=muF5Fgr3euVIwq3LckXBbYSe5tnWfPAvxpBr8ofKVq4=;
        b=Lz/9+gB82BdkoHW6ZsjPehiBJ4GFFC8RNrZvWgUPDh51w0JiNLsTgIZPH4NI1jYZnz
         4T9KQNowowYiOx2/jpYXII7tsZdMO43BXm6NDiAjz2ZE/U7keZ13AmIsOzFx8XspH+zJ
         jZOHzN+NtqrOrb/zu9oQi/ePhXMKzZJHnpfLx7sT6GGivm+chlwc4Hr01of1kJshUmT3
         cIkdatniXijkJqbLZm2TKnHEpAXABMLKXaYxTJVxeniWoogTbdvp38hdRuN5cZI02jpv
         DEQKmmREvwVfZMiodL9oAGQvX74DvVR5a+WeeyfYy3+DI8n9LtOFH89KxMPGquTqkfln
         cljg==
X-Forwarded-Encrypted: i=1; AFNElJ9ctHBjPey5DXUedgFnPxLVAc7SFVqynbqO0O2YxvM1AenTEya5xctRGXDNVL3Wt/XyxSCMunrvKgaB@vger.kernel.org
X-Gm-Message-State: AOJu0Yw45xjldSO25Gs8y9ZBS9JXy7NQ8H6gUROvS//7B/9tD1V3SrB6
	bumKGwRIMpuXbvbY4ULn0wxY+kQyaQ9dvn+FdxD+euEE118GqfgPu+UP
X-Gm-Gg: AeBDieuWCg57pSaNy9t+k0ewfhU3OYXB/rWzRhMG9y2ptOpxjDwSfZLANYS+KsnMP7l
	3sfV/sGvYMC++xEtJT3O1C62/CK6izHsPJX0ixZD8v3nLssJyVZiKl5S0ELJ3GWZ6a6qHDqCqhI
	LyWhw4h6GQwPgbtQVTyfRA2yLsUMLbZIfffSjm4+9ny+/fkkhLM3bYF/a7qlIbsTQ9QXl3/HH6z
	BG9YTPGBy7BPp2KADr6t5+JAzFDE2qItXvlPmv5ybru+hZpExW/gie2w7Xqx4wxG/H9Q41bmF27
	IVvofJBwkkY0DP4H4pFM9D1nAc7bpav+CB3C0wGRo2ZcQP7To0etNKpmFIcgrn1w3CNTZdmgDya
	DJ/eGZbkp/8TK2Vu1l2yq5EOXr7jKh5dMxIpytwk5sr317H02YlSmodgeCpQVH4tGKbA0l+gbq9
	uh+iV5C4/G2uGA84U4bqjsmd5DzYf/3yDq5XUcfQ==
X-Received: by 2002:a05:6000:4201:b0:43d:7403:4b63 with SMTP id ffacd0b85a97d-43d74034bd6mr20491386f8f.44.1776257258456;
        Wed, 15 Apr 2026 05:47:38 -0700 (PDT)
Received: from localhost.localdomain ([2001:41d0:406:c100::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead356616sm5123319f8f.13.2026.04.15.05.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 05:47:37 -0700 (PDT)
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
Subject: [PATCH v5 03/14] ASoC: rsnd: Add reset controller support to rsnd_mod
Date: Wed, 15 Apr 2026 12:47:20 +0000
Message-Id: <20260415124731.3684773-4-john.madieu.xa@bp.renesas.com>
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

The RZ/G3E SoC requires per-module reset control for the audio subsystem.
Add reset controller support to struct rsnd_mod and update rsnd_mod_init()
to accept and handle a reset_control parameter and mirror it in
rsnd_mod_quit().

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v5: No changes

v4:
 - Add reset_control_assert() in rsnd_mod_quit() for symmetry with
   deassert in rsnd_mod_init()
v3: No changes
v2: No changes

 sound/soc/renesas/rcar/adg.c  |  2 +-
 sound/soc/renesas/rcar/cmd.c  |  2 +-
 sound/soc/renesas/rcar/core.c | 16 +++++++++++++++-
 sound/soc/renesas/rcar/ctu.c  |  2 +-
 sound/soc/renesas/rcar/dma.c  |  4 ++--
 sound/soc/renesas/rcar/dvc.c  |  2 +-
 sound/soc/renesas/rcar/mix.c  |  2 +-
 sound/soc/renesas/rcar/rsnd.h |  3 +++
 sound/soc/renesas/rcar/src.c  |  2 +-
 sound/soc/renesas/rcar/ssi.c  |  2 +-
 sound/soc/renesas/rcar/ssiu.c |  2 +-
 11 files changed, 28 insertions(+), 11 deletions(-)

diff --git a/sound/soc/renesas/rcar/adg.c b/sound/soc/renesas/rcar/adg.c
index 8641b73d1f77..0105c60a144e 100644
--- a/sound/soc/renesas/rcar/adg.c
+++ b/sound/soc/renesas/rcar/adg.c
@@ -780,7 +780,7 @@ int rsnd_adg_probe(struct rsnd_priv *priv)
 		return -ENOMEM;
 
 	ret = rsnd_mod_init(priv, &adg->mod, &adg_ops,
-		      NULL, 0, 0);
+		      NULL, NULL, 0, 0);
 	if (ret)
 		return ret;
 
diff --git a/sound/soc/renesas/rcar/cmd.c b/sound/soc/renesas/rcar/cmd.c
index 8d9a1e345a22..13beef389797 100644
--- a/sound/soc/renesas/rcar/cmd.c
+++ b/sound/soc/renesas/rcar/cmd.c
@@ -171,7 +171,7 @@ int rsnd_cmd_probe(struct rsnd_priv *priv)
 
 	for_each_rsnd_cmd(cmd, priv, i) {
 		int ret = rsnd_mod_init(priv, rsnd_mod_get(cmd),
-					&rsnd_cmd_ops, NULL,
+					&rsnd_cmd_ops, NULL, NULL,
 					RSND_MOD_CMD, i);
 		if (ret)
 			return ret;
diff --git a/sound/soc/renesas/rcar/core.c b/sound/soc/renesas/rcar/core.c
index 69fb19964a71..28467e45acab 100644
--- a/sound/soc/renesas/rcar/core.c
+++ b/sound/soc/renesas/rcar/core.c
@@ -90,6 +90,7 @@
  *
  */
 
+#include <linux/delay.h>
 #include <linux/pm_runtime.h>
 #include <linux/of_graph.h>
 #include "rsnd.h"
@@ -196,18 +197,29 @@ int rsnd_mod_init(struct rsnd_priv *priv,
 		  struct rsnd_mod *mod,
 		  struct rsnd_mod_ops *ops,
 		  struct clk *clk,
+		  struct reset_control *rstc,
 		  enum rsnd_mod_type type,
 		  int id)
 {
-	int ret = clk_prepare(clk);
+	int ret;
 
+	ret = clk_prepare_enable(clk);
 	if (ret)
 		return ret;
 
+	ret = reset_control_deassert(rstc);
+	if (ret) {
+		clk_disable_unprepare(clk);
+		return ret;
+	}
+
+	clk_disable(clk);
+
 	mod->id		= id;
 	mod->ops	= ops;
 	mod->type	= type;
 	mod->clk	= clk;
+	mod->rstc	= rstc;
 	mod->priv	= priv;
 
 	return 0;
@@ -217,6 +229,8 @@ void rsnd_mod_quit(struct rsnd_mod *mod)
 {
 	clk_unprepare(mod->clk);
 	mod->clk = NULL;
+	reset_control_assert(mod->rstc);
+	mod->rstc = NULL;
 }
 
 void rsnd_mod_interrupt(struct rsnd_mod *mod,
diff --git a/sound/soc/renesas/rcar/ctu.c b/sound/soc/renesas/rcar/ctu.c
index bd4c61f9fb3c..81bba6a1af6e 100644
--- a/sound/soc/renesas/rcar/ctu.c
+++ b/sound/soc/renesas/rcar/ctu.c
@@ -360,7 +360,7 @@ int rsnd_ctu_probe(struct rsnd_priv *priv)
 		}
 
 		ret = rsnd_mod_init(priv, rsnd_mod_get(ctu), &rsnd_ctu_ops,
-				    clk, RSND_MOD_CTU, i);
+				    clk, NULL, RSND_MOD_CTU, i);
 		if (ret)
 			goto rsnd_ctu_probe_done;
 
diff --git a/sound/soc/renesas/rcar/dma.c b/sound/soc/renesas/rcar/dma.c
index 2035ce06fe4c..68c859897e68 100644
--- a/sound/soc/renesas/rcar/dma.c
+++ b/sound/soc/renesas/rcar/dma.c
@@ -803,7 +803,7 @@ static int rsnd_dma_alloc(struct rsnd_dai_stream *io, struct rsnd_mod *mod,
 
 	*dma_mod = rsnd_mod_get(dma);
 
-	ret = rsnd_mod_init(priv, *dma_mod, ops, NULL,
+	ret = rsnd_mod_init(priv, *dma_mod, ops, NULL, NULL,
 			    type, dma_id);
 	if (ret < 0)
 		return ret;
@@ -879,5 +879,5 @@ int rsnd_dma_probe(struct rsnd_priv *priv)
 	priv->dma = dmac;
 
 	/* dummy mem mod for debug */
-	return rsnd_mod_init(NULL, &mem, &mem_ops, NULL, 0, 0);
+	return rsnd_mod_init(NULL, &mem, &mem_ops, NULL, NULL, 0, 0);
 }
diff --git a/sound/soc/renesas/rcar/dvc.c b/sound/soc/renesas/rcar/dvc.c
index 988cbddbc611..bf7146ceb5f6 100644
--- a/sound/soc/renesas/rcar/dvc.c
+++ b/sound/soc/renesas/rcar/dvc.c
@@ -364,7 +364,7 @@ int rsnd_dvc_probe(struct rsnd_priv *priv)
 		}
 
 		ret = rsnd_mod_init(priv, rsnd_mod_get(dvc), &rsnd_dvc_ops,
-				    clk, RSND_MOD_DVC, i);
+				    clk, NULL, RSND_MOD_DVC, i);
 		if (ret)
 			goto rsnd_dvc_probe_done;
 
diff --git a/sound/soc/renesas/rcar/mix.c b/sound/soc/renesas/rcar/mix.c
index aea74e703305..566e9b2a488c 100644
--- a/sound/soc/renesas/rcar/mix.c
+++ b/sound/soc/renesas/rcar/mix.c
@@ -328,7 +328,7 @@ int rsnd_mix_probe(struct rsnd_priv *priv)
 		}
 
 		ret = rsnd_mod_init(priv, rsnd_mod_get(mix), &rsnd_mix_ops,
-				    clk, RSND_MOD_MIX, i);
+				    clk, NULL, RSND_MOD_MIX, i);
 		if (ret)
 			goto rsnd_mix_probe_done;
 
diff --git a/sound/soc/renesas/rcar/rsnd.h b/sound/soc/renesas/rcar/rsnd.h
index 3e666125959b..3d419b31cf40 100644
--- a/sound/soc/renesas/rcar/rsnd.h
+++ b/sound/soc/renesas/rcar/rsnd.h
@@ -15,6 +15,7 @@
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/reset.h>
 #include <linux/sh_dma.h>
 #include <linux/workqueue.h>
 #include <sound/soc.h>
@@ -353,6 +354,7 @@ struct rsnd_mod {
 	struct rsnd_mod_ops *ops;
 	struct rsnd_priv *priv;
 	struct clk *clk;
+	struct reset_control *rstc;
 	u32 status;
 };
 /*
@@ -420,6 +422,7 @@ int rsnd_mod_init(struct rsnd_priv *priv,
 		  struct rsnd_mod *mod,
 		  struct rsnd_mod_ops *ops,
 		  struct clk *clk,
+		  struct reset_control *rstc,
 		  enum rsnd_mod_type type,
 		  int id);
 void rsnd_mod_quit(struct rsnd_mod *mod);
diff --git a/sound/soc/renesas/rcar/src.c b/sound/soc/renesas/rcar/src.c
index 6a3dbc84f474..8b58cc20e7a8 100644
--- a/sound/soc/renesas/rcar/src.c
+++ b/sound/soc/renesas/rcar/src.c
@@ -766,7 +766,7 @@ int rsnd_src_probe(struct rsnd_priv *priv)
 		}
 
 		ret = rsnd_mod_init(priv, rsnd_mod_get(src),
-				    &rsnd_src_ops, clk, RSND_MOD_SRC, i);
+				    &rsnd_src_ops, clk, NULL, RSND_MOD_SRC, i);
 		if (ret)
 			goto rsnd_src_probe_done;
 
diff --git a/sound/soc/renesas/rcar/ssi.c b/sound/soc/renesas/rcar/ssi.c
index 0420041e282c..c06cebb36170 100644
--- a/sound/soc/renesas/rcar/ssi.c
+++ b/sound/soc/renesas/rcar/ssi.c
@@ -1225,7 +1225,7 @@ int rsnd_ssi_probe(struct rsnd_priv *priv)
 			ops = &rsnd_ssi_dma_ops;
 
 		ret = rsnd_mod_init(priv, rsnd_mod_get(ssi), ops, clk,
-				    RSND_MOD_SSI, i);
+				    NULL, RSND_MOD_SSI, i);
 		if (ret)
 			goto rsnd_ssi_probe_done;
 
diff --git a/sound/soc/renesas/rcar/ssiu.c b/sound/soc/renesas/rcar/ssiu.c
index 244fb833292a..0cfa84fe5ea8 100644
--- a/sound/soc/renesas/rcar/ssiu.c
+++ b/sound/soc/renesas/rcar/ssiu.c
@@ -586,7 +586,7 @@ int rsnd_ssiu_probe(struct rsnd_priv *priv)
 		}
 
 		ret = rsnd_mod_init(priv, rsnd_mod_get(ssiu),
-				    ops, NULL, RSND_MOD_SSIU, i);
+				    ops, NULL, NULL, RSND_MOD_SSIU, i);
 		if (ret)
 			return ret;
 	}
-- 
2.25.1

