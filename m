Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904945;
	b=fRY9eHPwN+uhbNiKrP/Ir6Rd5RXxF7akeQj4aVgDwKrf5tTiIZdrw3wf+l3rgUZKCzhD
	 LlVC55eBLkTSm22p73rI0mMoRi/dMW0mo7VClNikpSlVL4Cc4MD5SQcuyqypLTAGPv+NO
	 9IHN26tCXMWhsrPc78/rMg/mTa2t2WdnFGB42vpaB1z+zl9J3+y8nBJKpSsp2StZfZQ8O
	 x3pWJXCr1lU3D+vZvS/MSCrkXXVrQROkOAg03LTbJ7GwPptw3WH/TVOjxZ4Yd26A7JA+0
	 mKRcu5RoeA2fnOAVM+3k/8vok+MyqNq7d+piYrzcEYikJDt6SdenTRB+KbO/aUTCqyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=nG4n6RbhRtbsAmKm5luV95OTsd5m2vOsTQEC1Oq46ng=;
	b=STZ5S53brerxl4JzGvlTBvSHtYZo1qRe68WoEP3PGjnvgcPsJROrsIyfgzUkRm6PfFMA
	 kIt02+kCh7qTOL1GUlNcNgX9D1WL9Q8FkHSRAFe0o18eQkRbCOkVtwyaltWLWFFPqIuBi
	 DOjaWCs989swkTmiBUMt0CaWXV47rtsBGXKrV2bQS0F62GicYmJZv1xIBjdBPH0gnJBkW
	 berHC52HdV53PCvHd7UzZbF0Gpn5FDPQ88R4Rmg+r8h69PBU85OT3Xrvqzt706Wp5NXT9
	 ib7zomD9cytftmml5YCLcuTwo6eEuCfU5+6K5qyGhQIPNbQz3655im1sYHGZ/nwTD9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dg1er8r7;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E06606A33B
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 18:55:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10E06606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dg1er8r7
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6de1fd5f572so1017545eaf.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 10:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904944; x=1794509744; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nG4n6RbhRtbsAmKm5luV95OTsd5m2vOsTQEC1Oq46ng=;
        b=dg1er8r7N2ztSQE5zHQF5T+hSZg888y0y0Icn50SABwYdEO0z4Qij/TekP5w4C1wzA
         aiVzLhWdmScW9iDKRRAEX+qUsafr48Od5GxjP7QH22p1xDwSR31Nltwm54uS0m/901ib
         iDd4efD2esOOH+Kq4qt9ymWNkQPnvFPNmD2hSDvqKs8e4CK60Ho9KexL1WKmUKy5Kq8f
         KGOJJ3ae2EGGfXAdGXnELSBFqZO+wC6dsOsEAM4i1KxEBK9sKN4w32kNfkgzTptBpyrj
         8WkgKhHjS2d0PJ8E98KnBajFeYGhHB+wCJcWVrlN+GvwQhatb+M2pCGbhd9CJl57V7jW
         NPNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904944; x=1794509744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nG4n6RbhRtbsAmKm5luV95OTsd5m2vOsTQEC1Oq46ng=;
        b=FpfE5I8Pkcn3TDd85ufwxAes3ivH7vXdpn0GZywXVxp1G/UYSyhrlERWWBP/amUrJc
         ZCCt96Xc8DmjY38VnSzR2GtS6/AgzpDXBPknAOHX2tutXPuFWLEKewTvqOkTBtzrxQOL
         hYUYw6ZepTcFFchyO02zfKUeRhtuWuMxEHtBGId9szYaV+PJKgSeIWlokXhu5MgLG/qr
         Helfx1frJ/oMEr+O2V+x2mnnaWIHBN24uA9hbHv31Ej2PojODrtpbQDc9QbnPVy1vchA
         V0lRXH4lmWJFXbS7TXn8Bd9zSbjWOV8u97Wu3DAC+0Uh4PUQGW3wnJ4+qQYnBnDTgtF6
         Vr0w==
X-Forwarded-Encrypted: i=1; AKwUvBw/xboJBeYEAejLABt6N62gJ3Kbja1fmCUTPW6Con+WF+om4JfnZ8JLqh0ZJT/sKyRTS1HCRZV0FAMH@vger.kernel.org
X-Gm-Message-State: APuU4Z+MlXMViXlRMquyxbG4dpbhS0k+RYCqkVE+rUI3H1RJK8cq1nkc
	bhKROQVkig/IoLuQQd+mnZ5fH/dVrV5+mHxDrrHC0ap129e8Z3FwNqVA
X-Gm-Gg: AYBFou16Au3NgFBwBw3t+2sb6U2Z3yLjBruEWpxHkvMqEAlT9EWKUJUVwO7wCf3rH0O
	//QrgADIyqlX4CnSYXTbSVnNNscXXv8NOXOdtovsyRc6iuGzNTDYccd6pwXvAEzPiYVlXHPlx3r
	JPWX096ksulaW5kYLZZPanamWuPnN+GG0eqY+P3olrrCsE+I3smg6EmeS2e6WvKz/dqEOusCUdD
	AouGNg2GTTvebLCffrQ/aVOVumd8b1E0yMJwo+Ru+uX2qndNCNmRWYZC+mHU+ClqHwpsJqhSIHX
	1lnVlB+nGhaALMBS6hI0RHzdf26G/D5RRkkPJkbptnZOvl3CSsOgIP1UagQHoB6ihIy+8HIP7fO
	b12T88CxTizElUudzDtrLNpTl/VbLG41MnF5TE5/45JC+8lseBVQ8I2z5CQ+XXbSg6e0MHBrh4f
	BmGC8erlHpSBc1IQ7UTOrxkeCx9qsZGK34mNKUsPtNHF7rdnL2FsP76NXZhgQ0vmWRU74CmboRM
	7vD1KhC8L02QJIN09R21p5+qb2Uw4vTFgO4KbDqv6+YyBkX/VODoEockNIVTmsIhgVTHjiZCmhW
	ZtlI45scwuJGyyc0AlFsVm35qXijjSqSdGcnce/cDeM1lQegxz+sbHN6iLlEZzVE0HbkHjuVYYk
	vS3KZfngQXV6IbF4DCzjAp0jFYmY4VV9Gue1O93qUBA5T6oFRn4UtR0lsOMI0PDXwCepKti6pXJ
	6mEoMKqee2pXeLUijNzGOMnVmyZe272Uo77nGsxYP0mLWMJbwrwop6
X-Received: by 2002:a05:6820:1c8b:b0:712:c751:22eb with SMTP id 006d021491bc7-716e73dea8fmr352195eaf.11.1793904943944;
        Thu, 05 Nov 2026 10:55:43 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:23 -0700
Subject: [PATCH v10 07/26] mtd: rawnand: sunxi: drain interrupts before
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
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-7-dca1f6ed29a8@gmail.com>
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
 devicetree@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

The controller uses one completion for successive interrupt-driven
waits. Some transfers wait for both command completion and DMA
completion. The handler acknowledges each event and masks it, leaving
any outstanding event enabled; it calls complete() when all requested
events have arrived.

sunxi_nfc_interrupt() currently calls complete() before updating those
registers. A successful waiter can wake on another CPU and start the
next operation before the old handler acknowledges status or rewrites
the mask. Move complete() after those updates so waking the waiter
cannot precede the handler's last controller access.

A timeout also needs to exclude an unfinished handler. With PREEMPT_RT,
the flags-zero IRQ request is forced threaded. Near the timeout
boundary, that thread can be preempted after reading status and enable
bits while the waiter times out, clears the device mask and rearms the
next wait. The saved snapshot can then restore an obsolete
remaining-event mask or, if it satisfies the old wait, complete the new
wait. Masking the device does not invalidate the running handler's local
values. Repeating init_completion() can also reset its waitqueue lock
during complete(). This lifetime problem was identified by code
inspection during review.

Initialize the completion once in probe and use reinit_completion() for
each wait. On timeout, call disable_irq() before clearing controller
state so existing handling finishes and no new handler can enter during
cleanup.

The hardware may have finished before the delayed handler runs, or the
handler may complete the wait while disable_irq() drains it. Recheck
status against the remaining enabled events before clearing either
register. Events already acknowledged by the handler no longer appear
in that mask; if none remain, the wait has completed. This also handles
command and DMA events arriving separately without requiring an
already acknowledged status bit to be set again.

Then mask and acknowledge the events, read back the mask to flush those
writes, and re-enable the IRQ line even if the recheck changed the
timeout to success. Keep partial-event handling in the IRQ handler and
leave polling and controller/DMA abort handling unchanged.

This keeps additional synchronization on the timeout path, without a
driver lock in every interrupt and wait. The caller can sleep, this IRQ
is not registered as shared, and the handler does not acquire the
controller mutex held by the caller. The tradeoff is unbounded cleanup
latency and no priority inheritance: a starved IRQ thread can prevent
timeout cleanup from returning and block other operations on the
controller. This is a handler-lifetime boundary, not an RT
recovery-latency guarantee.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260909085434.C8F201F00A3A@smtp.kernel.org
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 38 +++++++++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 9a7b365e998e..111094b1c64c 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -401,6 +401,7 @@ struct sunxi_nfc_caps {
  * @chips: a list containing all the NAND chips attached to this NAND
  *	   controller
  * @complete: a completion object used to wait for NAND controller events
+ * @irq: NAND controller interrupt
  * @dmac: the DMA channel attached to the NAND controller
  * @use_mdma: use an internal MBUS DMA backend
  * @mdma_desc: H6-style MBUS DMA descriptor
@@ -420,6 +421,7 @@ struct sunxi_nfc {
 	unsigned long clk_rate;
 	struct list_head chips;
 	struct completion complete;
+	int irq;
 	struct dma_chan *dmac;
 	bool use_mdma;
 	struct sunxi_nfc_mdma_desc *mdma_desc;
@@ -441,18 +443,20 @@ static irqreturn_t sunxi_nfc_interrupt(int irq, void *dev_id)
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
@@ -462,16 +466,28 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
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
@@ -484,6 +500,12 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
 
 	writel(events & NFC_INT_MASK, nfc->regs + NFC_REG_ST);
 
+	if (irq_disabled) {
+		/* Flush the mask and acknowledgment before re-enabling the IRQ. */
+		readl(nfc->regs + NFC_REG_INT);
+		enable_irq(nfc->irq);
+	}
+
 	if (ret)
 		dev_err(nfc->dev, "wait interrupt timedout\n");
 
@@ -2657,6 +2679,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	nfc->dev = dev;
 	nand_controller_init(&nfc->controller);
 	INIT_LIST_HEAD(&nfc->chips);
+	init_completion(&nfc->complete);
 
 	nfc->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &r);
 	if (IS_ERR(nfc->regs))
@@ -2665,6 +2688,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
+	nfc->irq = irq;
 
 	nfc->caps = of_device_get_match_data(dev);
 	if (!nfc->caps)

-- 
2.53.0

