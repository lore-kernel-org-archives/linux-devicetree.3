Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904965;
	b=KwKwRvivCCtptsed1arjrwL88E2kUOsk2hKmouBmXVhXBH9q4OlWCA2yWtNDoD/YwJsO
	 kAICtutFJvi6oJFV8FVPg1VRhxj3IUqMNz+VcQHU5KhqOYKuhOiC/nmQYWOe6zm7J58Na
	 87vJZGLP9N1TxA+/EzOOpMKB/1IyQoHVlqWBgZOTRMTSv5a5rjMzE0Uxei6mFesEQuVXq
	 EzczTN69qdzmFg11ThY4Jokd581ddixe4Gq9wrE4/Uvb5vH47QkjMEAs4oX6Dfw2gE3QZ
	 +JCyCvwlfm1bJNCkhdhZ2Lue04N4CnqacUtzVPCqSAjyXK2nymOMqzd0RVexgvTK8DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=4VfFDNUuLZDxL4knEKt4xHIe8trG1WlypP2b2NwnIZI=;
	b=ZAnnv/S7hQEv80NStAJ1OtfvwUL27Pl02uJU/vyeOX71Rqc8KyfYXNS+jFOxSeGG6sjK
	 0cbByTWqrTadxb9k02lekO90oFxOxlJ2r3jkz0GRz177tqPhFwQ5oUOi+GMc0POj7MY2k
	 MYD98/bvPgjpRTDT1kHvxrPGWvLG18/oLTFgMNPR+kP/dj1BI9uIy9ptS4ZrXKPleNV0Y
	 tHuw72zEcVYfF5wEiCcrFNoi30abUuLx6Ldmf7blAL0FTn5f2KTz1CMa4Wd2kJMelBwf3
	 wLVDvuvRLRe44KTHRIy5jcBRl4t4MX4rpznzs1gPGR969E7//p9/d9OqLS0hk08Bwkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Vigkmr+/";
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF75A606EE95
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 18:56:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF75A606EE95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vigkmr+/
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6b19e291cc6so1958752eaf.2
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 10:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904964; x=1794509764; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4VfFDNUuLZDxL4knEKt4xHIe8trG1WlypP2b2NwnIZI=;
        b=Vigkmr+/yNk91vqZtUuuEYdWVP/Y02F+0KdjYTTtrnsMJ4fh8xhK3cXFw1xd/PZayf
         JmLG4T5wTnsevdMU3vwFnpBN6NJ9y91436Jh14nkmvF2KkT5cYB7FDv1YCVzJWt2nszm
         ymC4carefW+yzcZpU1zV0SKrN97Sd9vBqwQRO6yuIj2aG7H+kNRqgiVfs+JaIcbmTN+S
         fXpiT+3varpGVtUrn4CRwj0Pk0I/FixurgWqJ6Wyv5TWizfnONRFvogNbshgDY+Db40c
         OFbAZ2LQ96++V+xYusK8mnFn7mKCvYEr8cK9HWW1YHhJMNFLGvfIj5qWogKvdLb8ikCP
         QqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904964; x=1794509764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4VfFDNUuLZDxL4knEKt4xHIe8trG1WlypP2b2NwnIZI=;
        b=1JEnfF9Wp3hfFzvJVcuQS5E1bW/1besrIHYI8hekxxEKu9C0PfZrf/XJMa7/N7ajqb
         0ZuHNz1kAGkhSPiVRJVKin65vpdK3HbM3yxh2/ZW4l21DNwULxd3d3+kMgeqdbggvZQ/
         5Id5zPABINDC+QioyAhMZ+iVWydFjerxXpzXuAbQ40A1J74rgHbRoh0rqMV1QPGEgLgN
         QiCVIHUJ/ko72cKVCyD6Q/fwaP5LWu70oRFPcgaN2I9yBLAUBE3EUFdUqpLvhNUPaUpU
         QhO+asiESdfjZ5Ym4E3aV2UCjW/c5atLCGU3no9Ep1Kx8fOQUyBXRBtS9AR/Li/k4gsu
         IIrQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+QT5j/DJOCs8Bf9fpgJ65xves1ElVP0q4KUMG9JBakiOkKnkYvXPRE/5/bjUIpiSnvEuyYE3t86Ak@vger.kernel.org
X-Gm-Message-State: APuU4Z/Po0iXlHse9AkEoVO5+EKv437Ye6t5SmuvYjr+XAksTuj2JwIV
	XsZ5j+RGBS7hsmHvIF9/MJG5ZAJ0foCm24Vlr4uWgcjIfBCw4ukPMgr2
X-Gm-Gg: AYBFou2N2I4ahr94uwupcxMmuLobTwMAbvLF6A/hZm1FKbYMb/p9CPLzpz11xcC/UnB
	5ofQE4uiSX0KJ1Z7DVwtm3LMAHldZ9xDGU/SaUqCh+ZRrQ+i6DTkhAl2x31GkVntfKt55xp+f/x
	hP5JKq9cbv5ZnELxz+CXsyX1F71pYGmgbvvz2+YlBJkOG3iQgao8bhqc1FZJGZsbcLk68sf0RXz
	h52QibOctcYSAYqDppchlJNB+Fd3sSKmH+g5F7Qwajw9eVXyiXgVxuTNT9xSZn87ZKo14jfnwFm
	6w3O9FiN8WPSwco9iWRYw5gevazgSpDf48eTByD8dQvRo5hK0jXVFPz4JJapep6gtDapXoZ+FKq
	YqvVrbA7RFxZPn7qgjdQmQww0O0K5dFM4qnlrb9a/9i9gTbdz7I7n0vMYrKoYBJug2Vyw0Lcehh
	0el1NcHw65wY2Ziu8aokZNT2BIJ/3KCSGibsK3nw5SR6alF8NQTe/YpyDliWad82aehdOekNZIa
	c5G7GndAQ2MP2W9+y7+5tYuwvkxQMhr0xJv5WW96LVcLvCyMbj0HWIXOpBWqsFK1V10i75NXDEH
	3AjDjbVRJyVbmuGDEIlxF8TVI3ygRboPGJNSE3b4QsWlvTIoXugGB37c+35p7+erJMgOqCThkwn
	owd/V2BPwyXCxuwm/uNv/NI8MRLxSWuzXTZZI8h49KiTV+tc7oSuevKgWz976rlvXKBW/gbTphZ
	8WjAYPq11NsBCdaAXtjtIRIOP3Zuhw4bdOo2w9fcZvtGODHBxZu2bi
X-Received: by 2002:a05:6820:4481:b0:703:10f3:89e4 with SMTP id 006d021491bc7-716e78a0258mr317119eaf.42.1793904963622;
        Thu, 05 Nov 2026 10:56:03 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:56:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:37 -0700
Subject: [PATCH v10 21/26] mtd: rawnand: sunxi: reset the H616 data path
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
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-21-dca1f6ed29a8@gmail.com>
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
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
X-Mailer: b4 0.15.2

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

Require the AHB reset at probe and exercise the same reset operation before
accepting transfers. Perform the AHB reset before releasing the DMA
mapping. This relies on the H616 CCU reset callback, which asserts
and deasserts the reset through register updates and returns success. The
reset handle pins the provider module, and the CCU driver suppresses sysfs
unbinding.

Propagate unexpected reset errors, leave the IRQ disabled and reject
subsequent commands. Avoid register access after failed recovery. Error
propagation is not a substitute for stopping DMA if the supported reset
provider contract is violated.

Select the stronger recovery through H616 capability data, leaving older
controllers' abort sequences unchanged.

Fixes: 5ee37db34637 ("mtd: rawnand: sunxi: add H616 MBUS DMA support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 90 +++++++++++++++++++++++++++++++++------
 1 file changed, 76 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index e1306d14ab3a..e8286dc360ac 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -335,6 +335,7 @@ struct sunxi_nfc_mdma_desc {
  * @has_ecc_block_512:	If the ECC can handle 512B or only 1024B chunks
  * @has_ecc_clk:	If the controller needs an ECC clock.
  * @has_mbus_clk:	If the controller needs a mbus clock.
+ * @needs_bus_reset:	Aborted DMA needs an AHB reset to restore data ordering
  * @legacy_max_strength:If the maximize strength function was off by 2 bytes
  *			NB: this should not be used in new controllers
  * @reg_io_data:	I/O data register
@@ -368,6 +369,7 @@ struct sunxi_nfc_caps {
 	bool has_ecc_block_512;
 	bool has_ecc_clk;
 	bool has_mbus_clk;
+	bool needs_bus_reset;
 	bool legacy_max_strength;
 	unsigned int reg_io_data;
 	unsigned int reg_ecc_err_cnt;
@@ -412,6 +414,7 @@ struct sunxi_nfc_caps {
  * @use_mdma: use an internal MBUS DMA backend
  * @mdma_desc: H6-style MBUS DMA descriptor
  * @mdma_desc_dma: DMA address of @mdma_desc
+ * @recovery_failed: reject further operations after unsuccessful recovery
  * @caps: NAND Controller capabilities
  */
 struct sunxi_nfc {
@@ -432,6 +435,7 @@ struct sunxi_nfc {
 	bool use_mdma;
 	struct sunxi_nfc_mdma_desc *mdma_desc;
 	dma_addr_t mdma_desc_dma;
+	bool recovery_failed;
 	const struct sunxi_nfc_caps *caps;
 };
 
@@ -644,16 +648,50 @@ static void sunxi_nfc_dma_op_cleanup(struct sunxi_nfc *nfc,
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
@@ -665,6 +703,9 @@ static int sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 	u32 ctl;
 	int ret;
 
+	if (nfc->recovery_failed)
+		return -EIO;
+
 	if (cs >= sunxi_nand->nsels)
 		return -EINVAL;
 
@@ -1496,8 +1537,14 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
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
@@ -1874,9 +1921,10 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
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
@@ -1902,8 +1950,14 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
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
@@ -2904,11 +2958,18 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
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
@@ -3021,6 +3082,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_h616_caps = {
 	.has_mdma_desc = true,
 	.has_ecc_clk = true,
 	.has_mbus_clk = true,
+	.needs_bus_reset = true,
 	.reg_io_data = NFC_REG_A23_IO_DATA,
 	.reg_ecc_err_cnt = NFC_REG_H6_ECC_ERR_CNT,
 	.reg_user_data = NFC_REG_H6_USER_DATA,

-- 
2.53.0

