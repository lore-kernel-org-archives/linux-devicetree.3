Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223486;
	b=IaRRn+0I0hEfmop2pBHO6/ecrTlQUELKZstX0wji9CjP/iJ+ncSaA5RyS8e5JOwYAB3N
	 OGfRiksesxNiRIa8ElQ19i3WWLo9EDsbiHz5cMvlfafrZNfr/GJVokDlX56qwuwD5DeS8
	 oETMN19xGhM3uyxrpPrtq0MDrAwz+h0LVDtk/kYjoTGJ0nO6lvw7n2Cd+UagMwzmcQKD0
	 llHYdzYxMH+ZH5WvzKHm6FqI2/4BbHxfND2Z1pUb/fYOzp61p74tQ0ckWidWn+dtRvig4
	 Yz21OVCshi3koBZyaizwQ5vW4PfwxKw5wwgvAXStqigSnh8nPYBPSGqhha9p9tUzodA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9R93eLtRuVCsdbuGEdtd6/wt6t26wDnU5PW4NiI4F68=;
	b=afhetQtnsRU7f7Pl4+VslXTwGHqJVTQ7jCUwCysldHJHjjE72uHBH4mfMys0AjIpJX/T
	 Sjqyqc8lA59Ou7+iggsb4L3PBdiYR4McTg2m9Dfg0s0Mch6kQnuJudq4H1VgutPfLP6RH
	 Xl5ow+E8hSrWiJeWmThHsZ6Rd4llGoX3qyca+U6JA/9iOSSnCnTlkrq7LUyhiK2uvHjQ8
	 sOMgXLkr8nV+QoAePHZF6pH3p14jWEofI9Qaaek2uKKz8/DapI1gA/KOSw+GMjtKV0tnJ
	 Mnh+pyM/jT4v0nQbD88esp5UsG3WxrR2pZdvlD9prEx8LduAn0DQHAtlY3HktY1BiSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e5TgMMm7;
	arc=none smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB4F60A6F6D
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 01:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BB4F60A6F6D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e5TgMMm7
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-571eb508e44so785336b6e.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 17:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223482; x=1795828282; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9R93eLtRuVCsdbuGEdtd6/wt6t26wDnU5PW4NiI4F68=;
        b=e5TgMMm7+jQ8ffDKlXHHAXuEjTo4RJVZHVunPTHGE1LYtShLGSVfkURaaAAypnmbrG
         kaYDSwM1oi604+FYpctk6iFbjlIcD7n6VjdWpc4r1da1atEf1orbHyQzK1HXr/Y8wHAU
         TStIula0ruCnYI39A++ThrwUdZogQjXU21dKrLR4nY4hhvQE6hPddg3eV9YuOCgZp/VK
         vuj1qM6QH1h8P5cVDLgxoKkg73iL3oX8l8MUeVgbdqXH61KKt3coCtLtfW3b4lCcIiR5
         r9Kjt3Ii8zPONhALXGhmIxA5hUls9+Dp9YgnSjWXQMQd8C/q7ZgCQ+3Ua30zoHWuGbCT
         1aeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223482; x=1795828282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9R93eLtRuVCsdbuGEdtd6/wt6t26wDnU5PW4NiI4F68=;
        b=FuzU8oy4NeT91XEvulsK3TEWPqRzDWSW+g6EH3CBdZAxWaTlMIp1X2iF5yYht0gYZN
         lOTXTD2equxNTStEU2WWzDf9c1AtLaCwN4vX0Su9+AtBVcVNWgezMVsoJvZNwE4k0tfe
         4vYmQcC8luO2cw0Zv5cGXBm7uGGVxCmKXNEJUBgh5iarpdJZdEmNWMNmwoaaSjGutpxV
         MHIlyCesoe/eYxn6w3zZTKGgsmEu59uBEVsAGLsz+VqTgynK7dDsVLKDFPgUxGVXvyQz
         lCuR4UHuglSYS0/sDs/bU57QEDGbEcytYo7Q4W0Y+m6haA46WpZYg69ACCQEq4aNTZ5S
         WRBA==
X-Forwarded-Encrypted: i=1; AL+hErEjeCIwsUNgDOX1bximwu2vlU1lAxbjv3m+NrtBIur2BNhfm0GfU9Szg3OyJ5cE7byyRWvSd6CbJ2kJ@vger.kernel.org
X-Gm-Message-State: APuU4Z9/LwYqPCOtiiN7uZzvk/Ebb07gpuunQiecwvnuPVgOSNJND8l2
	VxWjZ0JVyGmOE6COrSy+9jMgB/8xMW4XiC9IpiPXxIyKVBCp7cfsGPxC
X-Gm-Gg: AYBFou05rQeXM0BSTe4W2CrW4Tnh4ntoOTYlojfGnjQlcKJrmbowC8KeFs3zIGzyPZp
	DzcU+g05kBm9RGF/0O7evBob4irDtAuLS7wYPjXTv0uIK9qI/i3q+R4cqkfTIGVFELgyWx613S8
	85o6/LVCXq5D3OEyc9/0wUyh+P7wyX5KPMWM/4lgbhDOuYsu1NF1P3wozqplLjRVH6gIs3KEqxJ
	lW44ho924c/4oJ01iZItqyuORZY/io3BhL8Dqm2GKL62Pct7oe/tnYO8rigs2L2HLhM3U7yP8YU
	13+FUUljFeaJO+lY2ihXeb7JtyCZyjRV27xftr1QlK2SB4SCWy5PbG105d8ASIBMlUAR34NT9Cp
	WsyaNm1OzQc8f4TAYnQ+iRKtMPqC3xILNaitrdPo+2I71VCqh/LwoW0PE4zW8tzXNhDMdyCm2XM
	FiJPgNvMwtaQ5jm3IbESeLBLx58YYu5nBp19E4BgoHwy/xeD0sfNXslxLrP1n4Pgya2ZJbHBxaP
	wsmtUQJ3c/3HP+rNojtSYSRbjDNJ7kl9PoHKQ/jjlgbur7e63EZP4QK3dw+NUUmugOHtC0No0hJ
	aooIgpSVas7K9FvNT9qSkmf++1pmq82vBtdKFJl+738LxYd8bhk5z7tCWJ2G/80V1IJCYdH127T
	lXdnX8D4JOtO3NmaxG2kiKqGItlNI1erc2TCzgco7BIvqbqFaXcoXPvC4u5jlxtR/t5sdDnuHh3
	F3DJ13q1Wk5+2CZLQl2Ig9uJk0ahlzs8932xJRhEV90LKcthnOwOwK
X-Received: by 2002:a05:6808:13c5:b0:573:52b1:bb00 with SMTP id 5614622812f47-57a09910c41mr6373784b6e.39.1795223482353;
        Fri, 20 Nov 2026 17:11:22 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:42 -0700
Subject: [PATCH v11 19/26] mtd: rawnand: sunxi: propagate chip clock setup
 errors
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-19-9721b1905ef4@gmail.com>
References: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
In-Reply-To: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.17-dev

If clk_set_rate() fails during chip selection, the next NAND command
can run with timings calculated for a clock rate that was never set.
The driver also caches the requested rate, so selecting the chip again
does not retry the change.

Return the clock error before programming the timings or updating the
cache. Propagate it through exec_op() and the DMA page writer so
neither starts a command at the wrong rate.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index ee68ef9bba33..37cc023db74e 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -628,16 +628,25 @@ static void sunxi_nfc_dma_op_abort(struct sunxi_nfc *nfc)
 		dmaengine_terminate_all(nfc->dmac);
 }
 
-static void sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
+static int sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(sunxi_nand->nand.controller);
 	struct sunxi_nand_chip_sel *sel;
 	u32 ctl;
+	int ret;
 
 	if (cs >= sunxi_nand->nsels)
-		return;
+		return -EINVAL;
+
+	if (nfc->clk_rate != sunxi_nand->clk_rate) {
+		ret = clk_set_rate(nfc->mod_clk, sunxi_nand->clk_rate);
+		if (ret)
+			return ret;
+
+		nfc->clk_rate = sunxi_nand->clk_rate;
+	}
 
 	ctl = readl(nfc->regs + NFC_REG_CTL) &
 	      ~(NFC_PAGE_SHIFT_MSK | NFC_CE_SEL_MSK | NFC_RB_SEL_MSK | NFC_EN);
@@ -649,14 +658,11 @@ static void sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 
 	writel(mtd->writesize, nfc->regs + NFC_REG_SPARE_AREA(nfc));
 
-	if (nfc->clk_rate != sunxi_nand->clk_rate) {
-		clk_set_rate(nfc->mod_clk, sunxi_nand->clk_rate);
-		nfc->clk_rate = sunxi_nand->clk_rate;
-	}
-
 	writel(sunxi_nand->timing_ctl, nfc->regs + NFC_REG_TIMING_CTL);
 	writel(sunxi_nand->timing_cfg, nfc->regs + NFC_REG_TIMING_CFG);
 	writel(ctl, nfc->regs + NFC_REG_CTL);
+
+	return 0;
 }
 
 static int sunxi_nfc_buf_chunk_size(struct sunxi_nfc *nfc, int len)
@@ -1778,7 +1784,9 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 	u32 wait;
 	int first_step, batch_steps, ret, i;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
+	ret = sunxi_nfc_select_chip(nand, nand->cur_cs);
+	if (ret)
+		return ret;
 
 	for (first_step = 0; first_step < ecc->steps; first_step += batch_steps) {
 		unsigned int reg_index = 0;
@@ -2519,9 +2527,13 @@ static int sunxi_nfc_exec_op(struct nand_chip *nand,
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	const struct nand_op_parser *parser;
+	int ret;
 
-	if (!check_only)
-		sunxi_nfc_select_chip(nand, op->cs);
+	if (!check_only) {
+		ret = sunxi_nfc_select_chip(nand, op->cs);
+		if (ret)
+			return ret;
+	}
 
 	if (sunxi_nand->sels[op->cs].rb >= 0)
 		parser = &sunxi_nfc_op_parser;

-- 
2.53.0

