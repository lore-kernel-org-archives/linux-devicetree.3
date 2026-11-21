Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223501;
	b=KAQTsyEDCd7eu2jSvtSc5/d4gWSxaa9aPNRIbOPL7DG5i8rPUvmTGCkXbbPZ+Amh2TD4
	 ZuZp3R+XlgB+kLBOOm2udxrwsdRcvVtzdzPjfFbi4pDZ8hTC4k2KUEH7pxWQZOERU9Xo0
	 6P5X/2gEm9RqvEOPylahb8kB25Y/fTIKt9GLhYEq/2t0w+tT+0TSfrJ1ViSsqOAxrizEZ
	 0J1TGIp/60dVg9GGZmuLmknc4Tb0E9ZrJNz1swJfnrQbhTpNBACUGCiq+lCU90DKb/fGw
	 m2UxvbCCrjhOiHnjM+Br675+HDecaN9JEMWoec3MdHS1y7/f67uh0d7WXlz5MMgdk3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223501;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=0eYZ3HbDY5x5zovptu6rAgNNSCJghwXhmaa/sCZVI9o=;
	b=qYvlj18/pnvsFRf4G8USDX5ZJXcA3Vpg4yMOVKNcGe5j6HJHnLbFmAL7bkTH1Iq+z7bZ
	 BaCNnUi8Q2eL/tP5CbtxwVcYa2SlVEvMjFIXWwzvSg1MPzOd2BSBOaiEFd7CYtD1yqQfw
	 jFK5XIyVlNWkerHIphcYNlYZD8QrMHkfdlmWEg21vy3VlVWgE07ScMBZV2e5qG/rnL2SZ
	 tqUB8QA6JKotFF3NrXetSChM7DByq4nvHgYKTRCDekMfN22iH4U54eYYRBEciE7g+opcf
	 BeqqB4eRfC/BYgk2Mz+PlVk2ZZWIBToiSj24AzksrZqDXoB7j+nG+AHzZqNeyRICKKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YNIJWlNY;
	arc=none smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AE1606AA3E
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 01:11:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74AE1606AA3E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YNIJWlNY
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-571eb508edaso714264b6e.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 17:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223489; x=1795828289; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0eYZ3HbDY5x5zovptu6rAgNNSCJghwXhmaa/sCZVI9o=;
        b=YNIJWlNYrZWMgThgHVAkvnAx6pGKGCaMz6jSW4hSVycXtY7uP1wmnPN5QamROLVjWu
         NgHLGAm+KwdKOACZLrS4GUmNA5gQUEfTqFiL/aYjCaZjM8cMmW0Hgz3Q3EuGG378OS3b
         bV8Zww7ReJBmEIJagsUBjEtLBIN9RMgTY9tZ/heVnql3yoOKG1ge11Ix3NOEScWqksIY
         r0e0bI0ml70ibaCMVyU2J7NUV0QWUzXBUeFnHoppaWU4HCdYM4GDBOeItAXsULltrvIS
         mBfbTYAw9MevtRfFgb1kyyNXuiEjb3XTDE4k1k/LrUJ0KVb7leQcBafjZdYeoPdKyyKh
         jGsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223489; x=1795828289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0eYZ3HbDY5x5zovptu6rAgNNSCJghwXhmaa/sCZVI9o=;
        b=HoUPloqcdPQYV2eMDyMdRZJc1pws1geoHolGdzV3HuIv0yvRhgK3btTHTYVErW+ZE0
         LDgiUEWqg+qQ2qgYSPy6vi6g2Lm/MRqnzFYpWc62O8AmR5SAgwKkdTKVXpR95PnTksac
         acW+Os7dNulwGiAlcP3omjRQHGneklq/a+KUHnoklZimI5vsZL5gcz7wGJNNUqZror3U
         DEeGmtjiLzZ0LG0GGbKHB1BnW2nPIX43X801pRhEMOqUecc7YiFBHq4maOEi6MOiKCOJ
         O1qjXNuv6W+lgyCQC1tHJFxGcMF6N7l0lb7wzqOR08PUF+x13wmw/L2yPUolpCOPpShS
         EWdA==
X-Forwarded-Encrypted: i=1; AL+hErHaKCQ5eZPUpXbWKcIQWxf30zWDBOC31yV2svo5S+dpwGhbGAP/2KjJ4WmkqULn9jPgxX8WqQ48zqqs@vger.kernel.org
X-Gm-Message-State: APuU4Z/jAHNWKIlnZBxf4GJfBDf+jUoHh9+GMJDsmPySvszQhT9Q16aY
	GRdjUOOFG4KUS+eEXE+8xYsryuPtGXoY75WT7q9NZxVGjQMU7tQDnjQ4
X-Gm-Gg: AYBFou1N/lwYDr3liY+ZXFLKELarmdEvlHJecnipSjAN7Mss8guZIFbdSiFTccnxxnT
	h3/DmNVNSO8SsCbmKchWDr6v4CZXp/ha2vZ7qdBAX8sA0B6JWdzjZaiEdW2LoUFG9V4HpaUfAvN
	YDvfS2t7Ku4KL6kMzbunWtL7MnXPsugUb0F/BD4G+2RsigmEeVTdCARbS2r9rppvHhgrgLMxT4l
	6RYcDkwEC0r1NLXq6L+cV5BwNCvN9oTbTnCbeqdoCfG+bnJ7TxaBz6vgJZmPr9HDBVzqML1af59
	qo4ZgQnlNYy5ciTQKlQgu5yLYIcMXajQFX47sD889Bfri53VeS5w0d1JwK+q8pmKZZST1ko/xgH
	VsMbVGxaGd580lKjC9C7VZAJS9oypClg7otLbY4tg6rJ5nzPNXsgJ3rk4kbBAaNL5XVV3XMnvNz
	S+qP1DQQUvVFY7xvpftFMFMkDqIZugcXoV8sr7nOOtD70cCPBjGNNc1wQfqkgXT1i0TsmCoZQZs
	GArQeDdmwCGcF1dKkViaK6khl3OqclyPAzZ1o1ZGKu+5BuqJxrYQsURMXxqc3yUKknFg8Ibl8ka
	Ys/wVrkiYf1OHy4tHS9e47JHznytCU89bS4Mi8yea1ljxfu1eDjqRLuZ/mvKpju7uDibR7CLDVd
	vzmJv+d6Y4wX3IdRH7CeaDUYP9YFRIu7GEMArQfWFqDP0XMNLCtFGwKxNTikZKadeAPgXDBNS6R
	uNEJzquA0m9KnY/PM65pYvN3pP06uST+nnoY0+/ZLI46aO8JpD6+m3
X-Received: by 2002:a05:6808:4f1f:b0:4bc:fbd4:2a43 with SMTP id 5614622812f47-57a0bb6eea6mr5839190b6e.41.1795223489248;
        Fri, 20 Nov 2026 17:11:29 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:28 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:47 -0700
Subject: [PATCH v11 24/26] mtd: rawnand: sunxi: reset the H616 data path
 after DMA aborts
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-24-9721b1905ef4@gmail.com>
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

Resetting an active H616 MDMA read with NFC_CTL.RESET can leave the first
1 KiB of the next read displaced. Both raw and ECC reads are affected,
including reads for which ECC reports success. Reissuing the NAND read
command and restoring the visible controller configuration do not correct
the internal data-path state. The DMA read error path can therefore return
incorrect data when it retries through PIO.

Pulse the controller's exclusive AHB reset after stopping an H616 DMA
operation. Drain interrupts before resetting the registers and clear the
pending events before accepting another command. The next operation
selects its chip and restores the page layout and timings; reads retry
from a fresh whole-page setup, while interrupted writes return an error.

Require the AHB reset at probe and exercise it before accepting
transfers. An H616 device tree that omits the named reset will no longer
probe, including for PIO reads and writes. Perform the AHB reset before
releasing the DMA mapping. This relies on the H616 CCU reset callback,
which asserts and deasserts the reset through register updates and
returns success. The reset handle pins the provider module, and the CCU
driver suppresses sysfs unbinding.

If recovery fails, return the reset error without retrying the read in
PIO. Leave the IRQ disabled and reject subsequent NAND commands before
accessing the registers. Error propagation is not a substitute for
stopping DMA if the supported reset provider contract is violated.

Select the stronger recovery through H616 capability data, leaving older
controllers' abort sequences unchanged.

Fixes: 5ee37db34637 ("mtd: rawnand: sunxi: add H616 MBUS DMA support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 98 ++++++++++++++++++++++++++++++++-------
 1 file changed, 81 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index abea2ab0cc42..a722636f2e15 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -318,6 +318,7 @@ struct sunxi_nfc_user_data_layout {
  * @has_ecc_block_512:	If the ECC can handle 512B or only 1024B chunks
  * @has_ecc_clk:	If the controller needs an ECC clock.
  * @has_mbus_clk:	If the controller needs a mbus clock.
+ * @needs_bus_reset:	Aborted DMA needs an AHB reset to restore data ordering
  * @layout: protected user-data layout for the controller
  * @reg_io_data:	I/O data register
  * @reg_ecc_err_cnt:	ECC error counter register
@@ -346,6 +347,7 @@ struct sunxi_nfc_caps {
 	bool has_ecc_block_512;
 	bool has_ecc_clk;
 	bool has_mbus_clk;
+	bool needs_bus_reset;
 	const struct sunxi_nfc_user_data_layout *layout;
 	unsigned int reg_io_data;
 	unsigned int reg_ecc_err_cnt;
@@ -389,6 +391,7 @@ struct sunxi_nfc_caps {
  * @use_mdma: use an internal MBUS DMA backend
  * @mdma_desc: H6-style MBUS DMA descriptor
  * @mdma_desc_dma: DMA address of @mdma_desc
+ * @recovery_failed: reject further operations after unsuccessful recovery
  * @caps: NAND Controller capabilities
  */
 struct sunxi_nfc {
@@ -409,6 +412,7 @@ struct sunxi_nfc {
 	bool use_mdma;
 	struct sunxi_nfc_mdma_desc *mdma_desc;
 	dma_addr_t mdma_desc_dma;
+	bool recovery_failed;
 	const struct sunxi_nfc_caps *caps;
 };
 
@@ -621,16 +625,50 @@ static void sunxi_nfc_dma_op_cleanup(struct sunxi_nfc *nfc,
 				     struct scatterlist *sg)
 {
 	dma_unmap_sg(nfc->dev, sg, 1, ddir);
+	/* Do not access controller registers after failed recovery. */
+	if (nfc->recovery_failed)
+		return;
+
 	writel(readl(nfc->regs + NFC_REG_CTL) & ~NFC_RAM_METHOD,
 	       nfc->regs + NFC_REG_CTL);
 }
 
-static void sunxi_nfc_dma_op_abort(struct sunxi_nfc *nfc)
+static int sunxi_nfc_dma_op_abort(struct sunxi_nfc *nfc)
 {
-	if (nfc->use_mdma)
-		sunxi_nfc_rst(nfc);
-	else
-		dmaengine_terminate_all(nfc->dmac);
+	int ret;
+
+	if (!nfc->caps->needs_bus_reset) {
+		if (nfc->use_mdma)
+			sunxi_nfc_rst(nfc);
+		else
+			dmaengine_terminate_all(nfc->dmac);
+		return 0;
+	}
+
+	/* Drain the handler before resetting its registers. */
+	disable_irq(nfc->irq);
+	writel(0, nfc->regs + NFC_REG_INT);
+	readl(nfc->regs + NFC_REG_INT);
+
+	/* A soft reset alone can leave the first subsequent read displaced. */
+	sunxi_nfc_rst(nfc);
+	ret = reset_control_reset(nfc->reset);
+	if (ret)
+		goto failed;
+
+	writel(0, nfc->regs + NFC_REG_INT);
+	writel(NFC_INT_MASK, nfc->regs + NFC_REG_ST);
+	readl(nfc->regs + NFC_REG_INT);
+	enable_irq(nfc->irq);
+
+	/* The next operation selects the chip and restores its timing and layout. */
+	return 0;
+
+failed:
+	/* Keep the IRQ disabled and reject commands after failed recovery. */
+	nfc->recovery_failed = true;
+	dev_err(nfc->dev, "NAND controller recovery failed: %d\n", ret);
+	return ret;
 }
 
 static int sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
@@ -642,6 +680,9 @@ static int sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 	u32 ctl;
 	int ret;
 
+	if (nfc->recovery_failed)
+		return -EIO;
+
 	if (cs >= sunxi_nand->nsels)
 		return -EINVAL;
 
@@ -1464,8 +1505,14 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
 	       nfc->regs + NFC_REG_CMD);
 
 	ret = sunxi_nfc_wait_events(nfc, wait, false, 0);
-	if (ret)
-		sunxi_nfc_dma_op_abort(nfc);
+	if (ret) {
+		int abort_ret = sunxi_nfc_dma_op_abort(nfc);
+
+		if (abort_ret) {
+			sunxi_nfc_dma_op_cleanup(nfc, DMA_FROM_DEVICE, &sg);
+			return abort_ret;
+		}
+	}
 
 	sunxi_nfc_randomizer_disable(nand);
 	sunxi_nfc_hw_ecc_disable(nand);
@@ -1514,7 +1561,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 	return ret;
 
 err_stats:
-	/* The caller retries the whole read in PIO mode. */
+	/* A PIO retry must not count completed DMA batches twice. */
 	mtd->ecc_stats.corrected = corrected;
 	mtd->ecc_stats.failed = failed;
 	return ret;
@@ -1648,6 +1695,7 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, u8 *buf,
 static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 					  int oob_required, int page)
 {
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	int ret;
 
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
@@ -1656,7 +1704,7 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, oob_required, page, 0,
 					       nand->ecc.steps);
-	if (ret >= 0)
+	if (ret >= 0 || nfc->recovery_failed)
 		return ret;
 
 	/* Fallback to PIO mode */
@@ -1677,6 +1725,7 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 					     u32 data_offs, u32 readlen,
 					     u8 *buf, int page)
 {
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	int first_step = data_offs / nand->ecc.size;
 	int end_step = DIV_ROUND_UP(data_offs + readlen, nand->ecc.size);
 	int ret;
@@ -1686,7 +1735,7 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 		return ret;
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, false, page, first_step, end_step);
-	if (ret >= 0)
+	if (ret >= 0 || nfc->recovery_failed)
 		return ret;
 
 	/* Fallback to PIO mode */
@@ -1828,9 +1877,10 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 		else
 			ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 		if (ret) {
-			sunxi_nfc_dma_op_abort(nfc);
+			int abort_ret = sunxi_nfc_dma_op_abort(nfc);
+
 			sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg);
-			return ret;
+			return abort_ret ?: ret;
 		}
 
 		/* exec_op() restores the page's spare base during column changes. */
@@ -1856,8 +1906,14 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 		       nfc->regs + NFC_REG_CMD);
 
 		ret = sunxi_nfc_wait_events(nfc, wait, false, 0);
-		if (ret)
-			sunxi_nfc_dma_op_abort(nfc);
+		if (ret) {
+			int abort_ret = sunxi_nfc_dma_op_abort(nfc);
+
+			if (abort_ret) {
+				sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg);
+				return abort_ret;
+			}
+		}
 
 		sunxi_nfc_randomizer_disable(nand);
 		sunxi_nfc_hw_ecc_disable(nand);
@@ -2794,11 +2850,18 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 		}
 	}
 
-	nfc->reset = devm_reset_control_get_optional_exclusive(dev, "ahb");
+	if (nfc->caps->needs_bus_reset)
+		nfc->reset = devm_reset_control_get_exclusive(dev, "ahb");
+	else
+		nfc->reset = devm_reset_control_get_optional_exclusive(dev, "ahb");
 	if (IS_ERR(nfc->reset))
-		return PTR_ERR(nfc->reset);
+		return dev_err_probe(dev, PTR_ERR(nfc->reset), "failed to get AHB reset\n");
 
-	ret = reset_control_deassert(nfc->reset);
+	/* Exercise the recovery reset operation before accepting DMA transfers. */
+	if (nfc->caps->needs_bus_reset)
+		ret = reset_control_reset(nfc->reset);
+	else
+		ret = reset_control_deassert(nfc->reset);
 	if (ret) {
 		dev_err(dev, "reset err %d\n", ret);
 		return ret;
@@ -2908,6 +2971,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_h616_caps = {
 	.has_mdma_desc = true,
 	.has_ecc_clk = true,
 	.has_mbus_clk = true,
+	.needs_bus_reset = true,
 	.reg_io_data = NFC_REG_A23_IO_DATA,
 	.reg_ecc_err_cnt = NFC_REG_H6_ECC_ERR_CNT,
 	.reg_user_data = NFC_REG_H6_USER_DATA,

-- 
2.53.0

