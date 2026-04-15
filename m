Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BE0345751
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 12:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776257267; cv=none; b=fmEwiuHA651APl/kH+EV+xxZkjwjh1xT2EDSho6kSrAcAXoP8Auit2lxBon7kW2YbNTrX4qZ8chzq7OsnkteWrNG840M/gsagBKQ4qFXKAY0pYBXK0zFAoAnVUQMpi6VTb5cnF2fizV/2t2P3e+IGz5L6HT5eCpIVqeVmZhdDRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776257267; c=relaxed/simple;
	bh=ykOx6nmdO7N46uYg7E6z76pv7h/Zr3uqqafyG6jh9qs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BXxug43k/+vT3zepT5Wl5wFcef02r3GG2diaqgrPbv6GymbGsIdlztElwMC0C3pSwMdE5YT6yVC5Ir5zAgKoVT5pgyNuMxLbtMzwgnr3+8e3ZOOBk9mWl9wvAdJLc0qLyV0RHO0JOaL6j1RKTCwRhVMgJuhYIThooamPDalkzFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tw6BbXUZ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tw6BbXUZ"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d01d6b50cso6845079f8f.1
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 05:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776257263; x=1776862063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+16q0XMj0UzMs2F4JTG9M8USrbjAiD8yBYbSUTaTrTw=;
        b=Tw6BbXUZHNZQ6r+QEY24VWasrdIBrHpKEzoncg57rtdD6kNndOMTmJzwwQ5RnJprQq
         aDnTwlGk3ckWCQ22g3kwxFgJcWAxTwiOTBhUzyQLJ2jpiJN8nfsFag5cnjTfMBumHj/9
         Gt2J288SiXUY90jAGulwJg8Vk4MGO/DnHeWZVsWWPxWHT9XxjSXdScqYvwLqX1iBbqdt
         aJkJuyNu38RBpfrMUpjwMQyA1/kmlsrPuU9mwFLYxuOfnAM3xI27CNg7rOr7Qr+RP0RK
         0sq7rrOEQaNWwHCxAnZZbANljiDnT36U1GHHoUwxOEkOZtvLuYwjRUzFHyJsecwB/jHP
         BPlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776257263; x=1776862063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+16q0XMj0UzMs2F4JTG9M8USrbjAiD8yBYbSUTaTrTw=;
        b=KTdVAM1Pk6KJ7vZgf1Emqv+/jp5bX/7zyyPujC4BqtNieZ9WKDU3LnMrPZU1AHHnvb
         UzdFtNUK6Qjt7lLE0USF4APtffPPOS3NSnlk8sARzqPDrvNIgZ+80vUPjn4ZomcS1GA3
         6XaiSH/CjX4ran4oluJFtvrbBarSAHLlYSZWy/Z6qbOFWGnIkrpIvdElEHXjJCGM2VS9
         NHLIY0lrRBfyfXS7XSD7yG+Lf0QBsAxotJ4f0oNcHRftXbqlxKKA99KzgBHjzva9QQgb
         SJlDvowxx2SiB2/rs0t6j3TZPh7CuHuJGSKNVrEzLnRyf4EF30hReXuK1KU2OaPQ1YmB
         PJFg==
X-Forwarded-Encrypted: i=1; AFNElJ9h8XrYTfKHVcSeazbnDq4KaxaSeYS8FeHj9QyRgxCn33SksNqvasRreBLH+ZQLDvg6aHsuNTS9dQUu@vger.kernel.org
X-Gm-Message-State: AOJu0YwTXDk7a+R6pZMVe4bbQu64uBfNTu1PTSbDvdbKeC8LWPyY2n/v
	yzeTsWw33chkltSVmCb7ICLYxVCYdwX4KLn8IzbzgcD4JohYavWnLxG7
X-Gm-Gg: AeBDievIIWklmCWehhpRyTZs6bh3hB3U6URSG/bQQK5YT3rxSl/5td6A7cH69CqFvPV
	E1Ent/fISq/oUQvXPLCBKE9Iqitv0mx/0YgDknClTyV5R+ti6IKJ1zVLoFj9kNd4OJ7vk2+IYHH
	wLqQkps/yJAl7KtilaLL5ZzU5D6aILvM7rfI3GAdTi7ZUZcOX320jft11mQShH93pfYHMLHmSzM
	4hYrxgfX6arXbgymi+uB4jzyJ2CtE0sNyGgMXAl7XqVY6lNYIHWmNzdBMKmaC2b3rhxMAuxiEIi
	HC9GLrUopJqPDJlyRbmP32sXvyWXj+nXbjWJxup58SSeOIq3yPdBxTYRQPF7IahEYYpjGNd0Uj/
	Pox7geN/hDt1R6jIBMErGd0elQpTAnb+5RrSaj1XGmgY2nyt+WALXdOxrRJrvytiDWfPzzeBNY6
	66U0emxymvBaMNTtFgJCSKQ9tsvlveDfSfVTh+FyzyCwQNKV/l
X-Received: by 2002:a05:6000:2403:b0:43d:4e65:303d with SMTP id ffacd0b85a97d-43d642d3582mr31936727f8f.37.1776257263091;
        Wed, 15 Apr 2026 05:47:43 -0700 (PDT)
Received: from localhost.localdomain ([2001:41d0:406:c100::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead356616sm5123319f8f.13.2026.04.15.05.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 05:47:42 -0700 (PDT)
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
Subject: [PATCH v5 07/14] ASoC: rsnd: Add RZ/G3E DMA address calculation support
Date: Wed, 15 Apr 2026 12:47:24 +0000
Message-Id: <20260415124731.3684773-8-john.madieu.xa@bp.renesas.com>
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

RZ/G3E has different DMA register base addresses and offset
calculations compared to R-Car platforms.

Add dedicated rsnd_rzg3e_dma_addr() function with dispatch from
rsnd_dma_addr(), following the existing per-generation pattern.
The function reuses rsnd_dma_addr_lookup() and rsnd_dma_addr_map.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v5:
 - Split from v4 patch 06/12 per Kuninori's request
 - Move G3E DMA address comment block into rsnd_rzg3e_dma_addr() per
   Kuninori's request

v4:
 - Replace raw [3][2][3] DMA address array with named structs
   rsnd_dma_addr_dir and rsnd_dma_addr_map. Use designated initializers
   in both rsnd_gen2_dma_addr() and rsnd_rzg3e_dma_addr()

v3: No changes
v2: No changes

 sound/soc/renesas/rcar/dma.c | 81 ++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/sound/soc/renesas/rcar/dma.c b/sound/soc/renesas/rcar/dma.c
index bd50f18fac26..71dfa23018a5 100644
--- a/sound/soc/renesas/rcar/dma.c
+++ b/sound/soc/renesas/rcar/dma.c
@@ -644,6 +644,85 @@ rsnd_gen2_dma_addr(struct rsnd_dai_stream *io,
 	return rsnd_dma_addr_lookup(io, mod, priv, &map, is_play, is_from);
 }
 
+/*
+ *	ex) G3E case
+ *	      mod        / DMAC in    / DMAC out   / DMAC PP in / DMAC pp out
+ *	SSI : 0x13C31000 / 0x13C40000 / 0x13C40000
+ *	SSIU: 0x13C31000 / 0x13C40000 / 0x13C40000 / 0xEC400000 / 0xEC400000
+ *	SCU : 0x13C00000 / 0x13C10000 / 0x13C14000 / 0xEC300000 / 0xEC304000
+ *	CMD : 0x13C00000 /            / 0x13C18000                0xEC308000
+ */
+
+/* RZ/G3E DMA address macros */
+#define RDMA_SSI_I_N_G3E(addr, i)	(addr ##_reg + 0x0000F000 + (0x1000 * i))
+#define RDMA_SSI_O_N_G3E(addr, i)	(addr ##_reg + 0x0000F000 + (0x1000 * i))
+
+#define RDMA_SSIU_I_N_G3E(addr, i, j)	(addr ##_reg + 0x0000F000 + (0x1000 * (i)) + (((j) / 4) * 0xA000) + (((j) % 4) * 0x400) - (0x4000 * ((i) / 9) * ((j) / 4)))
+#define RDMA_SSIU_O_N_G3E(addr, i, j)	RDMA_SSIU_I_N_G3E(addr, i, j)
+
+#define RDMA_SSIU_I_P_G3E(addr, i, j)	(addr ##_reg + 0xD87CF000 + (0x1000 * (i)) + (((j) / 4) * 0xA000) + (((j) % 4) * 0x400) - (0x4000 * ((i) / 9) * ((j) / 4)))
+#define RDMA_SSIU_O_P_G3E(addr, i, j)	RDMA_SSIU_I_P_G3E(addr, i, j)
+
+#define RDMA_SRC_I_N_G3E(addr, i)	(addr ##_reg + 0x00010000 + (0x400 * i))
+#define RDMA_SRC_O_N_G3E(addr, i)	(addr ##_reg + 0x00014000 + (0x400 * i))
+
+#define RDMA_SRC_I_P_G3E(addr, i)	(addr ##_reg + 0xD8700000 + (0x400 * i))
+#define RDMA_SRC_O_P_G3E(addr, i)	(addr ##_reg + 0xD8704000 + (0x400 * i))
+
+#define RDMA_CMD_O_N_G3E(addr, i)	(addr ##_reg + 0x00018000 + (0x400 * i))
+#define RDMA_CMD_O_P_G3E(addr, i)	(addr ##_reg + 0xD8708000 + (0x400 * i))
+
+static dma_addr_t
+rsnd_rzg3e_dma_addr(struct rsnd_dai_stream *io,
+		    struct rsnd_mod *mod, int is_play, int is_from)
+{
+	struct rsnd_priv *priv = rsnd_io_to_priv(io);
+	phys_addr_t ssi_reg = rsnd_gen_get_phy_addr(priv, RSND_BASE_SSI);
+	phys_addr_t src_reg = rsnd_gen_get_phy_addr(priv, RSND_BASE_SCU);
+	int id    = rsnd_mod_id(mod);
+	int busif = rsnd_mod_id_sub(rsnd_io_to_mod_ssiu(io));
+	const struct rsnd_dma_addr_map map = {
+		.src = {
+			.capture = {
+				{ 0,					0 },
+				{ RDMA_SRC_O_N_G3E(src, id),		RDMA_SRC_I_P_G3E(src, id) },
+				{ RDMA_CMD_O_N_G3E(src, id),		RDMA_SRC_I_P_G3E(src, id) },
+			},
+			.playback = {
+				{ 0,					0 },
+				{ RDMA_SRC_O_P_G3E(src, id),		RDMA_SRC_I_N_G3E(src, id) },
+				{ RDMA_CMD_O_P_G3E(src, id),		RDMA_SRC_I_N_G3E(src, id) },
+			},
+		},
+		.ssi = {
+			.capture = {
+				{ RDMA_SSI_O_N_G3E(ssi, id),		0 },
+				{ RDMA_SSIU_O_P_G3E(ssi, id, busif),	0 },
+				{ RDMA_SSIU_O_P_G3E(ssi, id, busif),	0 },
+			},
+			.playback = {
+				{ 0,		RDMA_SSI_I_N_G3E(ssi, id) },
+				{ 0,		RDMA_SSIU_I_P_G3E(ssi, id, busif) },
+				{ 0,		RDMA_SSIU_I_P_G3E(ssi, id, busif) },
+			},
+		},
+		.ssiu = {
+			.capture = {
+				{ RDMA_SSIU_O_N_G3E(ssi, id, busif),	0 },
+				{ RDMA_SSIU_O_P_G3E(ssi, id, busif),	0 },
+				{ RDMA_SSIU_O_P_G3E(ssi, id, busif),	0 },
+			},
+			.playback = {
+				{ 0,		RDMA_SSIU_I_N_G3E(ssi, id, busif) },
+				{ 0,		RDMA_SSIU_I_P_G3E(ssi, id, busif) },
+				{ 0,		RDMA_SSIU_I_P_G3E(ssi, id, busif) },
+			},
+		},
+	};
+
+	return rsnd_dma_addr_lookup(io, mod, priv, &map, is_play, is_from);
+}
+
 /*
  *	Gen4 DMA read/write register offset
  *
@@ -690,6 +769,8 @@ static dma_addr_t rsnd_dma_addr(struct rsnd_dai_stream *io,
 		return 0;
 	else if (rsnd_is_gen4(priv))
 		return rsnd_gen4_dma_addr(io, mod, is_play, is_from);
+	else if (rsnd_is_rzg3e(priv))
+		return rsnd_rzg3e_dma_addr(io, mod, is_play, is_from);
 	else
 		return rsnd_gen2_dma_addr(io, mod, is_play, is_from);
 }
-- 
2.25.1

