Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223477;
	b=ZT85RJdrmI3uzDdA6Jde2+62QNGmziNggcGVuvGJ935TS6jf7sWFGRvMNsOu3pe74YWh
	 o0qFdl/fEU4JrvPHOl5WS3GCwU2q1XWWARm2fdx2I/rtDpru4h4OUHRasxjF1HqFUdB1P
	 cVG2E7bT+waWDRlm5CHZLudYWIr/emrw8EjC6FIPnUgHdjM9Qt7AZ1iP1xjaf4wdSla9T
	 Ivesi9sCJK5bpMB1todC5fXxhAjCEbhCzpyObi24xb0bE3FO1sPHawPao0F9aCbgcavyQ
	 A6uffGSRrEGWnvOKzTtjx8Ov6UNy1ZDOf6jlCyYFtoSo13SYdHp7HOvQRuDS6IAicbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ykELsWqv0rr01vGMcfJTxNz9WxlFG0XTipq7Ly2y7EA=;
	b=XL3bG5llqvneEvuMTU7PZoyUWBuL2y6rNGAwjwac6eZ35qvLzuRt7BzWnkXFpq7qBqDL
	 uVbaWtvqisco28nh0Okkp/oLwe7QRw77uggL7E+CqRlCbBLrQeoWb991t/Uq5LuyMGQwG
	 eGO/i0409rn46xqTssLQ8i0I6vvBChQ694pipXBLZNnt0PWXz/kFmQrAAUzUpyE/aEFt5
	 RAUDDF9WOevcso3lAYLCQkHRqPHZlfdwuQKJ4f+QOpOg8TyHjbcMOGy60SFmxpVyz+/II
	 eqoz33V03Wgtyc3Ztl/mHSdurBPaG3Jn+NqkZvYM1kLAIN2t4qJugf1xl3u2kNSRpyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b0cpWJu8;
	arc=none smtp.remote-ip=209.85.167.175
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFC7606A69D
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 01:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBFC7606A69D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b0cpWJu8
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-53dbe9b8d6eso1163562b6e.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 17:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223467; x=1795828267; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ykELsWqv0rr01vGMcfJTxNz9WxlFG0XTipq7Ly2y7EA=;
        b=b0cpWJu8oKq/eQxIY9Z4OLn040voVe5kncYAI5VgPjj3msw8MExiRl8qojO1bzAM8O
         WHqkC7x+rqv5t0LAEqN+fv3A7pEG/JSON0sBvY85uQT5tFsgKpvDWut14HnY+eqxBRI8
         SJHGtPvCmyk9+ak5lB7k4yiFV/1DEqAPsjMcMSmNgJ9hCmqGGFJskT8Qwi14MocX1m1d
         KEnMkBwGSUOv8gqZSBPmGs4Hx0qMtA9u5biU1ICakLskTzdf9jgxT2+RBNDt7DLLYA+i
         eAMsMjHF7gPvzFPejvewNgScLDwNdCkqdeZbf9j5hc1NJCMphXw8cworRFbH1vdqxDji
         D1Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223467; x=1795828267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ykELsWqv0rr01vGMcfJTxNz9WxlFG0XTipq7Ly2y7EA=;
        b=ipaQQvc8xyXKNcl5G+nSKtcMbaT8xX8N3X7MpkH8tkplUs8Eo1anWHCIhdMQTITgAC
         2AQdwTlK4PQRyX292yzsilndP3XddJsvIMScEdZKrkWEAm+WxItinhCbw2He1VahTBEi
         WbzEjB4zAzWKE1NAUR9Fsgmr/oAdxbnCxha8ekXV2tCzfaYb/feOgQDo639icuEaDaxh
         0w6+C69qXoEw1iXashDmqT9e8T/PsZKS1xfETdKiAR8SS9HtQXpKBT8SCW7wh5JcyeVs
         ARUjhUEPa7dAKWt/Gr3r2BlYIG/e6c73g0FiJ6KE5jX1LIB1+49nBU760MgeSZ9JVBbg
         e6fQ==
X-Forwarded-Encrypted: i=1; AL+hErHWaKBw+ZrHgzqP08VaD6VMKtZ4al14RO1GQpcyM+bCl4mMyt0JWlCIAGuJH4PS5GvFzwRmRJqFm/cL@vger.kernel.org
X-Gm-Message-State: APuU4Z9Z+VczUqYlj4ZjKw8pDGhB3cGyBexO63BAYj8tH3D4cDyA9X4h
	2P8JjmCeqAYa3gZTzXzCUEIqEaFvvJy3v5XtT9sSfIR+ShHl0A6JyvL8
X-Gm-Gg: AYBFou0TySVnJWhN5FHdvySSFrC3TRy5HbEGQFgAup4unstaMfeMzG2DW9hMlB5D1RX
	mwvjW7e8TLuNp/AjVElnRGfqu4StE0L1dqCLdPuCTbkkvqYVwC1f8g2mRhVZa2yY13+At4nmqHP
	OLiwn0w0t+8D278c4aFhc5vv2VngKWvwPBoYhsfpmQnSpIU6sNBRwIraDpDmPA5AXR1B56/WXTm
	nA0ChO6jkWUgIIn6VXqRDP+DKDhsP38FTS83dFgt7npX0iLpGUOGL8Xh6AZL5+UIQ0298RfWHX7
	yuoUaksoOr64oJfDKk0kgXRW0AEg5vO0mTHn4P+z3MBjYGTx+9GE3le91xAEPKlshD38ZTgXvI7
	/uNh+NiE65aeVqEXMUdXH6zDJ5jBqpHE96zz3cKFkcxlHwEzILW7YEur+vvCTebGV8MglWQQRJp
	lpLt7uulSDiOauIt9sPXoZnNeCUYZPC5DYlrKZalLHgLQ3/p7Pp5F15rQ8HHYUjJCvt9h4aMXkk
	5o6QI2pCne4gUhkN5nW4KcqOpT+OaAHeDQc6AX59fCwOcnPoZ13imlvvIzPmFX0uBYvEMK7UGLa
	d4pCb+NQnbzvRSpsbOnq3B8+sLxW5+MMidYdPEOvGcNwKEh/2CDHj7qG/M2Ky8nydV8ZlS9GBz4
	/cqXdee1qfj/cVv7pnA8p3HupAf0sSAm2G2nPLIt3nptQBuaV8cdtRkjRy9YRHBoyYkkAoRNzi4
	JZhgmkE6evUr9zm788Dr3SsNw4xKsnMIgaIhXu//aOdlNDpQi8Vlic
X-Received: by 2002:a05:6808:3a19:b0:4f1:a3ac:a637 with SMTP id 5614622812f47-57a0b6533e2mr3933225b6e.27.1795223467204;
        Fri, 20 Nov 2026 17:11:07 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:06 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:31 -0700
Subject: [PATCH v11 08/26] mtd: rawnand: sunxi: drain interrupts before
 reusing the completion
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-8-9721b1905ef4@gmail.com>
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
 devicetree@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.17-dev

Back-to-back NAND transfers can time out or appear to complete early if
the previous IRQ handler changes the interrupt mask or signals the
controller's completion after the next transfer starts.

On success, acknowledge the events and update the mask before calling
complete(). On timeout, masking the device alone is not enough: on
PREEMPT_RT the IRQ thread can be preempted after reading the old status
and mask, then resume after the next wait is armed. Initialize the
completion once at probe and use reinit_completion() for each wait.
On timeout, drain the handler with disable_irq() before clearing state.

Recheck status against the events still enabled after the handler has
drained. Command and DMA completion can arrive separately; the handler
has already acknowledged and masked any events it handled. An empty
remaining mask therefore means the transfer completed. Flush the mask
and acknowledgment before re-enabling the IRQ.

Normal NAND I/O waits in process context. The IRQ is not shared, and
the handler needs no lock held by the waiter. Only timeout cleanup
needs to drain the handler. Its latency is not bounded on PREEMPT_RT:
there is no priority inheritance if the IRQ thread is starved.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260909085434.C8F201F00A3A@smtp.kernel.org
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 38 +++++++++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index c5e429318de2..6d7384aac917 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -378,6 +378,7 @@ struct sunxi_nfc_caps {
  * @chips: a list containing all the NAND chips attached to this NAND
  *	   controller
  * @complete: a completion object used to wait for NAND controller events
+ * @irq: NAND controller interrupt
  * @dmac: the DMA channel attached to the NAND controller
  * @use_mdma: use an internal MBUS DMA backend
  * @mdma_desc: H6-style MBUS DMA descriptor
@@ -397,6 +398,7 @@ struct sunxi_nfc {
 	unsigned long clk_rate;
 	struct list_head chips;
 	struct completion complete;
+	int irq;
 	struct dma_chan *dmac;
 	bool use_mdma;
 	struct sunxi_nfc_mdma_desc *mdma_desc;
@@ -418,18 +420,20 @@ static irqreturn_t sunxi_nfc_interrupt(int irq, void *dev_id)
 	if (!(ien & st))
 		return IRQ_NONE;
 
-	if ((ien & st) == ien)
-		complete(&nfc->complete);
-
+	/* Finish updating the interrupt state before waking the next operation. */
 	writel(st & NFC_INT_MASK, nfc->regs + NFC_REG_ST);
 	writel(~st & ien & NFC_INT_MASK, nfc->regs + NFC_REG_INT);
 
+	if ((ien & st) == ien)
+		complete(&nfc->complete);
+
 	return IRQ_HANDLED;
 }
 
 static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
 				 bool use_polling, unsigned int timeout_ms)
 {
+	bool irq_disabled = false;
 	int ret;
 
 	if (events & ~NFC_INT_MASK)
@@ -439,16 +443,28 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
 		timeout_ms = NFC_DEFAULT_TIMEOUT_MS;
 
 	if (!use_polling) {
-		init_completion(&nfc->complete);
+		reinit_completion(&nfc->complete);
 
 		writel(events, nfc->regs + NFC_REG_INT);
 
 		ret = wait_for_completion_timeout(&nfc->complete,
 						msecs_to_jiffies(timeout_ms));
-		if (!ret)
-			ret = -ETIMEDOUT;
-		else
+		if (!ret) {
+			u32 pending, status;
+
+			/* Drain the handler before it can restore an old IRQ mask. */
+			disable_irq(nfc->irq);
+			irq_disabled = true;
+			/*
+			 * The handler removes acknowledged events from the mask.
+			 * An empty mask means all requested events were acknowledged.
+			 */
+			pending = readl(nfc->regs + NFC_REG_INT) & events;
+			status = readl(nfc->regs + NFC_REG_ST);
+			ret = (status & pending) == pending ? 0 : -ETIMEDOUT;
+		} else {
 			ret = 0;
+		}
 
 		writel(0, nfc->regs + NFC_REG_INT);
 	} else {
@@ -461,6 +477,12 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
 
 	writel(events & NFC_INT_MASK, nfc->regs + NFC_REG_ST);
 
+	if (irq_disabled) {
+		/* Flush the mask and acknowledgment before re-enabling the IRQ. */
+		readl(nfc->regs + NFC_REG_INT);
+		enable_irq(nfc->irq);
+	}
+
 	if (ret)
 		dev_err(nfc->dev, "wait interrupt timedout\n");
 
@@ -2559,6 +2581,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	nfc->dev = dev;
 	nand_controller_init(&nfc->controller);
 	INIT_LIST_HEAD(&nfc->chips);
+	init_completion(&nfc->complete);
 
 	nfc->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &r);
 	if (IS_ERR(nfc->regs))
@@ -2567,6 +2590,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
+	nfc->irq = irq;
 
 	nfc->caps = of_device_get_match_data(dev);
 	if (!nfc->caps)

-- 
2.53.0

