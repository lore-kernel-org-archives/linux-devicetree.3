Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F24403E89
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 11:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005182; cv=none; b=bHZMgDX0oKb2telpkw2knj16NNPzGWg21kQ6vaRa00P6cFqsLxcs+ujoGGZFAXORiSb63lDk1cRChglt2rL8ytDzo8E18F+jLylBDLId6+NfXC1O7kKRtoU1oedR46L4vCg0vFL4KEhkLauBVOGmsU1BJH2FC3lqjv9YLO4KSVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005182; c=relaxed/simple;
	bh=NsITPzSpAz4fGBrSp75LeBpjl4N8sxVfHka61HOq9sg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ttGpWJmdUi13YjNb8ecTwGM+ihoiltEsDiBfdChxRO9W1KhItH2FMiET5AVrK9E7d9pFsVAKLYh8TzM611eZNaLsOUKTjXVAz6XUNwbjUATZl8SGiCM14/hlDhdfD/Z0C7o0RI3hM5KCBMMzndOsQnajBHXRMil4Eb7OxisZvpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UjGsV7dr; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UjGsV7dr"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2bf2247e38eso55941795ad.3
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 04:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781005181; x=1781609981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tQHxCJIc5wdA2xrHT5QQXhiIMFBTsuYRD5YZQNGHjTk=;
        b=UjGsV7drSGXOx5fYVSKxBKqZkEKy/bc0NZseIKCO0Dss2Tt2ar2t8sHKuhoZzpLceA
         1wrNDMVTyEGmKbnj/Zf57UQlRRnvidP4zMJso2Ku865gKuJ5I+yvZ96Wnu0YzvrzMyZz
         8km4Zt0aBswdV5jshQMsn/G7jkk+eO8lewHu7BV5s+nndd/jT/yN9BsYN50oWbOgU0o9
         Jp/EIdYsvEWHH6mT2XAPGPO0U7ltHdgsaidUwgiRagOs5cKEHZ5KdLnjlgObboCXRYAv
         0jpXdsL2/73ccr4iP9km//7KfcaZeRrVJ/0wFTf/IxscLwKLifUuqgbcpKGp7fHms2ot
         gUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781005181; x=1781609981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tQHxCJIc5wdA2xrHT5QQXhiIMFBTsuYRD5YZQNGHjTk=;
        b=NwcrCA0Vu8PhYlPgI2069VM6mivJf59CwbCXpkkZua3euKjnP6PBHhsoWICEpzeY7a
         1wjC97KM2UUrZASL9PJEAvkjGQCqT86Pn2MC4r6kMc8aVWJ9Di+ZFoz7rjRWVZKSbWUX
         4lSC9P/2Pu1X+ULhjyFVACTiVtdjwhDvOCe5/XnE+ZCXcfEcRm642j9iusAh1kpLb3wh
         iZGlexOut74vTlADo8+z+WYlOtUp+95ke3mUYrggGF4PRgXk4DjE37bnPdSUXYI8jKjW
         Xm9FOrC59SMCiQhRtPuroQvgMbCOVSPsm3IihSqKqv6AgYZH48WmPEbzK//QOCQuBLbv
         gUJg==
X-Forwarded-Encrypted: i=1; AFNElJ8dDA9/g3DztNTyqbSi6i6Qfc7wE68+JiBrk5U+LFf5vt2bAf8rLk7YT326peVu5FChjBt4imt6YGKo@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg7zaJmHymVQI9zXK+UXxSh0dtABaVArmthoxhNZo8+xG6aQdK
	tbwKNji8J1JbCqRIWhOkmIe8WNCl7iouflyfGOhpVJm/LvK3elmWceMy
X-Gm-Gg: Acq92OETkWuHksXQezN2L74njW/xHGy8p6GXP+63502a5ToTx+mO9eAKYM1648IEdmd
	XfqIzwxtqqg/sWgYNUir3v5CXuMjBkCi5JujcjKl/nEVSws/Yjh54ToWuxOcFSqQwBZKxhDDtXz
	+hIODygO+PFtbsSL7AhLi3Cx30/ze+5tUchRXFGUvpEfNr4feUadYC058DNjfmn3hNPGCkgVCwb
	Z2yY0JLXILAUJqdM2Bog+YecFUHBvyJw70jTIYVugYKZoMZ3f/aPgUUdoboG92Gl9ojgoa7YMBg
	WcqZvy11QTWEv3+R+wq7954mSBxHEPnm8lnnXzExAjlQ42DxrokfOXk/lwvLm/R7tUyal8QT6bg
	VMtO6gMObtlqH8d+k3HyZYX2JN/XSN8N0RXXPQFizcYWIFooeTjnhv6BFlZIZbgQhdy2qjBZxBa
	gWEDQb8TKNR1clncQRYrNV+3oRGSgRiBts2l/cLDeoqjhVUNZa3ZSF6XHgYkWOiDtgMNVq
X-Received: by 2002:a17:902:da8e:b0:2be:bcae:f6b0 with SMTP id d9443c01a7336-2c1e8495230mr248457445ad.22.1781005180791;
        Tue, 09 Jun 2026 04:39:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f70660sm210755635ad.11.2026.06.09.04.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:39:40 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v6 09/11] ASoC: renesas: fsi: Add SPU clock support
Date: Tue,  9 Jun 2026 18:38:34 +0700
Message-ID: <20260609113836.45079-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609113836.45079-1-phucduc.bui@gmail.com>
References: <20260609113836.45079-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

FSI register accesses on the r8a7740 require the SPU bus clock to be
enabled. Add support for acquiring and managing the SPU clock via the
device tree to ensure proper register access.

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v6:
 - Add Acked-by tag from Kuninori Morimoto.

 sound/soc/renesas/fsi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 43bc77ebcca3..716ecf0401fe 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -292,6 +292,7 @@ struct fsi_master {
 	void __iomem *base;
 	struct fsi_priv fsia;
 	struct fsi_priv fsib;
+	struct clk *clk_spu;
 	const struct fsi_core *core;
 	spinlock_t lock;
 };
@@ -983,6 +984,7 @@ static int fsi_clk_set_rate_cpg(struct device *dev,
 static int fsi_clk_init(struct device *dev, struct fsi_priv *fsi)
 {
 	struct fsi_clk *clock = &fsi->clock;
+	struct fsi_master *master = fsi->master;
 	int is_porta = fsi_is_port_a(fsi);
 	int xck, ick, div;
 
@@ -1004,6 +1006,13 @@ static int fsi_clk_init(struct device *dev, struct fsi_priv *fsi)
 	if (IS_ERR(clock->own))
 		return dev_err_probe(dev, PTR_ERR(clock->own), "Can't get fck clock\n");
 
+	if (!master->clk_spu) {
+		master->clk_spu = devm_clk_get_optional(dev, "spu");
+		if (IS_ERR(master->clk_spu))
+			return dev_err_probe(dev, PTR_ERR(master->clk_spu),
+					"Can't get spu clock\n");
+	}
+
 	/* external clock */
 	if (xck) {
 		clock->xck = devm_clk_get_optional(dev, is_porta ? "xcka" : "xckb");
-- 
2.43.0

