Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313DA37CD47
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 12:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776257274; cv=none; b=rOZpVe+7ZgiswCPDpRpf1P/znt2WsXXxpUH6Kkm4s0nhzb0WoJmoWeaXF21l/mVTR6QPJDsUzMXSsuHJJMHZXCSYgODK3ZP5KFJMzZtN02IGRWHjStYSgdofHdMu/Tu6sfSuCfcoGXpX+lv9Tx0DRZf6iq34eFkKZl5DuniXn/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776257274; c=relaxed/simple;
	bh=VrxoqvGX10M5GqXKNwdjsk+j6NY1VCHWKELaVq71FgE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m2oYFrZ/52eUEKbUwvO4S30BNvxQ3bd9/cjhr9Htc7RDkFOewPbaKdxfmccxmjp3S6PVSggvmw0CoaeggXPtBXqSjkne1rR0+YXAIV+Kp3fnEgD4+f+r2AZFOwXeBafnVn1wlTpQPHl5YNKdZpQvaef9azpeW0JIxXfm+KBfON0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H8JP4Crh; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H8JP4Crh"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488b0046078so66486825e9.1
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 05:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776257270; x=1776862070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GUAknHQ/4HWX3+aWhalXddRaQ+nerMHWsE1Hn2z0ZCs=;
        b=H8JP4Crh47kdWEkINTS/yTfgV5lj5sPjiXjeSr+rkONi0JD+zLtbadPDNDM1clbwIs
         f8x2/Wjgc0IlTh+cc7xUtmS3Or+3Ev1acfz76WbLLLw3SQtL5aX7OCCe04gfVvqYEEQ3
         5tdkzuI6OwE5Go9jmgUm95x/gY2ouizoIS621h65amcIw1NMmHEOlli9weTpBns82JLf
         oZ5g4hUpiYsQP0kyliUor9Y9MxWPkgfb1zQFRyv6hjpWZWfjInndEdOLPiK0jKhMOoyU
         o1UFR5s8drFQU5EtyQnsTlOHc3z+d0Z2PPDrkuxi3y93q2bOLtaadhqpy02ia+Q3pm2D
         G1Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776257270; x=1776862070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GUAknHQ/4HWX3+aWhalXddRaQ+nerMHWsE1Hn2z0ZCs=;
        b=q6lN00OLZUWjLqRIKtCqnhZ2Kxv0mObIhjbtzRk4fHw6p1efGicfV0HMcHW/M7Q+QA
         5pW8Hz5d0wxkwOsiQ/WNiZAFvZJm8ylhCmXUb0u7O9osY2JvQWs70d3fC79GWiFgCWbd
         UsqAoE7NbLsH6w4xekIY5avYkyIT8WXM75k0Kpf5SyAImdR5gWZiQ4NCH+2afMj/qmUx
         qVoCUiJ2O8jxwLcrqghhS5YOE+P6QFG0s3aXSS5Brc6F0SMJU5TaMxThe0c/+rZG42FC
         6Kq9lLHOPF3NcbPCsC1uQ5O/toqMPx42hmic2F8oOzhPaBkdSuv++ykwhp+9Cza+uGr2
         U4HQ==
X-Forwarded-Encrypted: i=1; AFNElJ8uA6dsuNbdhMwQNcumU+0I1rDc0rRPObQny0DySBSr+FTGmuqGIVWBIDPt+I9sGHxHKuOlf1VFGzFi@vger.kernel.org
X-Gm-Message-State: AOJu0YwDT0LKHxy99Qef6z8u9++ZaRKgjXIK02qU8Ut2xv0q8UIwvv1o
	bJu4go9rG6Z4T5/VyUwJFZzAi6inD4tItKgN3lcshQGAFTsP7xlIvg37FcOzNzNuKGVrvQ==
X-Gm-Gg: AeBDiet1Dy5W3POKurSZvTrlib3MUkBCUAbd6wtKuwvPm3I99I1l9DVE/hzfnoDO4oV
	PwTE9zajHJma11qTzpN0t2VNSokFWsN2+K5u4irL+kpQp91vSW/Aql3cGOlq7dGdPr1sDqZ8CfT
	nhuoKKUWlpGIgruxQPRWFqM1D8qXHS8pT9vZp4nqf31aXMwP77qY3le8hHSX09lERuk8eY4ZF7q
	ca56iaAidM268P8qYVcx5kcgvoLOXmgByBIWRCFhrdpdFQOD2eKr4ixdOJ1K59BlOX8ykFddDAB
	hLrV1pxHqulT5VdtJR+mWCkgz9tHU0NVqm+OqpXdKbvIXa0CsxW0FRJMD10jxCJPzFAvFFV5iNV
	3PW1CZ5qEo28FyUiK4aGCphPLuzQukl8B26fSCpp7ZV8TpC8tq3KYLXkM0MqCjt52/JvrMRBfV7
	48/Mvj/0+Z8Mm2VX/FFbiK810LvHmy4qNKisnwtA==
X-Received: by 2002:a05:600c:5303:b0:488:b196:d249 with SMTP id 5b1f17b1804b1-488d67bf74fmr291654215e9.5.1776257269879;
        Wed, 15 Apr 2026 05:47:49 -0700 (PDT)
Received: from localhost.localdomain ([2001:41d0:406:c100::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead356616sm5123319f8f.13.2026.04.15.05.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 05:47:49 -0700 (PDT)
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
Subject: [PATCH v5 13/14] ASoC: rsnd: Support unprefixed DT node names for RZ/G3E
Date: Wed, 15 Apr 2026 12:47:30 +0000
Message-Id: <20260415124731.3684773-14-john.madieu.xa@bp.renesas.com>
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

The RZ/G3E device tree binding uses standard unprefixed node names
('ssi', 'ssiu', 'src', 'dvc', 'mix', 'ctu', 'dai') instead of the
legacy 'rcar_sound,' prefixed names used by R-Car bindings.

Convert rsnd_parse_of_node() from a macro into a function that tries
the legacy prefixed name first, then falls back to the unprefixed
name by stripping the "rcar_sound," prefix. This makes the driver
work transparently with both old and new bindings.

While at it, update the of_node_name_eq() calls in core.c which compare
against RSND_NODE_DAI directly (bypassing rsnd_parse_of_node()),
and fix the related comments in ssiu.c, ssi.c, and dma.c that
reference hardcoded "rcar_sound,ssiu" / "rcar_sound,ssi" names.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v5: New patch.

 sound/soc/renesas/rcar/core.c | 27 +++++++++++++++++++++++++--
 sound/soc/renesas/rcar/dma.c  |  8 ++++----
 sound/soc/renesas/rcar/rsnd.h |  4 ++--
 sound/soc/renesas/rcar/ssi.c  |  8 ++++----
 sound/soc/renesas/rcar/ssiu.c |  8 ++++----
 5 files changed, 39 insertions(+), 16 deletions(-)

diff --git a/sound/soc/renesas/rcar/core.c b/sound/soc/renesas/rcar/core.c
index cb31af8a34d4..93cacac1c98a 100644
--- a/sound/soc/renesas/rcar/core.c
+++ b/sound/soc/renesas/rcar/core.c
@@ -1235,6 +1235,27 @@ int rsnd_node_count(struct rsnd_priv *priv, struct device_node *node, char *name
 	return i;
 }
 
+struct device_node *rsnd_parse_of_node(struct rsnd_priv *priv, const char *name)
+{
+	struct device_node *np = rsnd_priv_to_dev(priv)->of_node;
+	struct device_node *node;
+	const char *unprefixed;
+
+	node = of_get_child_by_name(np, name);
+	if (node)
+		return node;
+
+	/*
+	 * RZ/G3E binding uses unprefixed node names (e.g. "ssi" instead
+	 * of "rcar_sound,ssi"). Try stripping the "rcar_sound," prefix.
+	 */
+	unprefixed = strchr(name, ',');
+	if (unprefixed)
+		node = of_get_child_by_name(np, unprefixed + 1);
+
+	return node;
+}
+
 static struct device_node*
 	rsnd_pick_endpoint_node_for_ports(struct device_node *e_ports,
 					  struct device_node *e_port)
@@ -1273,7 +1294,8 @@ static int rsnd_dai_of_node(struct rsnd_priv *priv, int *is_graph)
 	of_node_put(node);
 
 	for_each_child_of_node_scoped(np, node) {
-		if (!of_node_name_eq(node, RSND_NODE_DAI))
+		if (!of_node_name_eq(node, RSND_NODE_DAI) &&
+		    !of_node_name_eq(node, "dai"))
 			continue;
 
 		priv->component_dais[i] = of_get_child_count(node);
@@ -1525,7 +1547,8 @@ static int rsnd_dai_probe(struct rsnd_priv *priv)
 		}
 	} else {
 		for_each_child_of_node_scoped(np, node) {
-			if (!of_node_name_eq(node, RSND_NODE_DAI))
+			if (!of_node_name_eq(node, RSND_NODE_DAI) &&
+			    !of_node_name_eq(node, "dai"))
 				continue;
 
 			for_each_child_of_node_scoped(node, dai_np) {
diff --git a/sound/soc/renesas/rcar/dma.c b/sound/soc/renesas/rcar/dma.c
index 71dfa23018a5..39f43e935cde 100644
--- a/sound/soc/renesas/rcar/dma.c
+++ b/sound/soc/renesas/rcar/dma.c
@@ -794,11 +794,11 @@ static void rsnd_dma_of_path(struct rsnd_mod *this,
 	int nr, i, idx;
 
 	/*
-	 * It should use "rcar_sound,ssiu" on DT.
-	 * But, we need to keep compatibility for old version.
+	 * It should use "rcar_sound,ssiu" (R-Car) or "ssiu" (RZ/G3E) on DT.
+	 * We need to keep compatibility for old version.
 	 *
-	 * If it has "rcar_sound.ssiu", it will be used.
-	 * If not, "rcar_sound.ssi" will be used.
+	 * If it has "rcar_sound.ssiu" or "ssiu", it will be used.
+	 * If not, "rcar_sound.ssi" or "ssi" will be used.
 	 * see
 	 *	rsnd_ssiu_dma_req()
 	 *	rsnd_ssi_dma_req()
diff --git a/sound/soc/renesas/rcar/rsnd.h b/sound/soc/renesas/rcar/rsnd.h
index 70e395d3c6ef..0d2436beb718 100644
--- a/sound/soc/renesas/rcar/rsnd.h
+++ b/sound/soc/renesas/rcar/rsnd.h
@@ -482,8 +482,8 @@ int rsnd_runtime_is_tdm_split(struct rsnd_dai_stream *io);
 /*
  * DT
  */
-#define rsnd_parse_of_node(priv, node)					\
-	of_get_child_by_name(rsnd_priv_to_dev(priv)->of_node, node)
+struct device_node *rsnd_parse_of_node(struct rsnd_priv *priv, const char *name);
+
 #define RSND_NODE_DAI	"rcar_sound,dai"
 #define RSND_NODE_SSI	"rcar_sound,ssi"
 #define RSND_NODE_SSIU	"rcar_sound,ssiu"
diff --git a/sound/soc/renesas/rcar/ssi.c b/sound/soc/renesas/rcar/ssi.c
index c65435551283..c00c6f9f5c9d 100644
--- a/sound/soc/renesas/rcar/ssi.c
+++ b/sound/soc/renesas/rcar/ssi.c
@@ -1010,11 +1010,11 @@ static struct dma_chan *rsnd_ssi_dma_req(struct rsnd_dai_stream *io,
 	char *name;
 
 	/*
-	 * It should use "rcar_sound,ssiu" on DT.
-	 * But, we need to keep compatibility for old version.
+	 * It should use "rcar_sound,ssiu" (R-Car) or "ssiu" (RZ/G3E) on DT.
+	 * We need to keep compatibility for old version.
 	 *
-	 * If it has "rcar_sound.ssiu", it will be used.
-	 * If not, "rcar_sound.ssi" will be used.
+	 * If it has "rcar_sound.ssiu" or "ssiu", it will be used.
+	 * If not, "rcar_sound.ssi" or "ssi" will be used.
 	 * see
 	 *	rsnd_ssiu_dma_req()
 	 *	rsnd_dma_of_path()
diff --git a/sound/soc/renesas/rcar/ssiu.c b/sound/soc/renesas/rcar/ssiu.c
index f483389868d2..8fb0ec5dc791 100644
--- a/sound/soc/renesas/rcar/ssiu.c
+++ b/sound/soc/renesas/rcar/ssiu.c
@@ -401,11 +401,11 @@ static struct dma_chan *rsnd_ssiu_dma_req(struct rsnd_dai_stream *io,
 	char *name;
 
 	/*
-	 * It should use "rcar_sound,ssiu" on DT.
-	 * But, we need to keep compatibility for old version.
+	 * It should use "rcar_sound,ssiu" (R-Car) or "ssiu" (RZ/G3E) on DT.
+	 * We need to keep compatibility for old versions.
 	 *
-	 * If it has "rcar_sound.ssiu", it will be used.
-	 * If not, "rcar_sound.ssi" will be used.
+	 * If it has "rcar_sound.ssiu" or "ssiu", it will be used.
+	 * If not, "rcar_sound.ssi" or "ssi" will be used.
 	 * see
 	 *	rsnd_ssi_dma_req()
 	 *	rsnd_dma_of_path()
-- 
2.25.1

