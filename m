Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33400396B6F
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792122336; cv=none; b=F9nLPYZD+rBSYPIThowT9Mhq9pUxmROsLr0CPw5eYUJbyfY5rXuU4IkYZEtuIxTafNoZASy5QSlT2rC/8VyaYGFUMKhVYTgxe7P1diOFWBD/1ZOF83FCEoZR0ixr6y1r64r6BS6yAyIMbIjJGP6aRHYOvht0sVb1uqIsVckaM+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792122336; c=relaxed/simple;
	bh=rEuLYDr43bv01Uvpdc+7lvdWEzGSSi8n2u7CVCX1ggM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cMa6ba74z10UGA2mpiUDPeVt1IHrG6Y2agni+NOe3N2kgirLZhul9UXiXPP6r+CudnfGh8FF29bUhXRjN2OFqpR1io8bDdD/K9MBqyMFegukGZex6TyMHuoKFiGeWN/XJD1arrGcMztk/XtkgbPAzXsYE5ovTT20GXh2K9FLL00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kKte1yh4; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kKte1yh4"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-821b5c73292so4239663a34.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 20:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792122333; x=1792727133; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=piZMAcnvcZQBNALlEjasAqt9FGU3IFC9Bc/Ax/PGx1o=;
        b=kKte1yh4p9J45FmdHQyohz4N1TQ2UOWdaPGNCO8F56nXmkawMl31tnEF7B7rR7gO4P
         iDoQ6GVTPisLtM+HZgwzwBxREAyZvF0P9g0sQ/JpS3YEhFJhUpWWErI20ACDroI0VBe1
         mmTgnt1Rw7LxwZYLOdRLv1V3tPFahnBvLsCeP602OLATOl8lDqoGxeUA1pYyvDDPhIrd
         hqIOhIiINmoA0BlhlrPbFi3vaLqQd8DJGHjMJrzs8z6Yf+JkXxmNlMfY5+tBz1pHmgsz
         yWFuyLg4ESatmm+v2SL7OW6uQHPXXVC8/dkUps0o6/jqRXRonRvRDRc/TSsSkgyEpa3T
         DSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122333; x=1792727133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=piZMAcnvcZQBNALlEjasAqt9FGU3IFC9Bc/Ax/PGx1o=;
        b=UiibV4IrlNeggFivJeXL5qPIMYx6U28fckCFPE9lYfb0n7cdRBLj4Q2nSq4ej89K5p
         iFAceGm3CjyTCOad0muR2BaabBHRQjFmT4WWAiWseLPiJ/LkOgRuNt8hUE+pEaJ/sovH
         hVQVsHAYEkF4Uw1cviE/P9KHPttwZBu6p6xGCXfAo0nJOhntYYzkVWHwMpnsZdwgbjdT
         FQ3dZVASjEBtl0LlQV7Z1no74ZnkYYFwKu0RFALvmJC4wxh9zJvmizbsxiHDzYcY6FUz
         f6fImZud+0ESyjfQ861/YT8MutYv9Kge8kKtiELt+du9KMov+lfTNRGFPOpCd+yGw0gl
         j1sw==
X-Forwarded-Encrypted: i=1; AKwUvByPHyJ3mQMEp2bvUCX7SbSfJcPRr4AjGrEB+F64G1/Y2OX9N+iNaIKfYla9YbFt7Un8lXmt0axk59vt@vger.kernel.org
X-Gm-Message-State: AFq9FYKas5fc+Fqz0Dw9pnN+rZe7f2m78PAp6E4VZzHjiAQQFpQ/Uldm
	5MNBLjsESxnwt0yzT3wsLSdu1rUh7I/s4xz/ET3gcWK+/o/zDf/KRk+F
X-Gm-Gg: AYBFou3ZEvkuF2EjCRWzRsIvY5LcpKLqjEyL1ISYBGOy2F8AiTHU/rFW2RU9pAJ3T4v
	gZSCSZHjYNkjAtDHuC/I7VWKLNsZ+mIghAZ9R1AHfIpSLLlOASr62VPWrQ6X2oJovDFakS710x7
	okmaao8z5CVOjwTU+wqaunz23f93D/mH5gL2NPwgnAeoI8+TBIFLf8Hq62IwPw8JEFEx/SUrWxv
	OEJHDJgOcQwphO1kGxkHueWsmD+zgMW0sfEJCzigtiVGMTp6hUPANpDOLFeNPJE9B5LEWRsPvdv
	8nIRWsCFvlryky2WPfvs4XXIrJogLHox2ly16qmliodyu6Wq/lO7vgONJzGSK8zNHagHbVHB7ry
	NrF7XVNzqZ2YhyFMx5CPwM7QIUGWxNlfTLfiU2W639TTshAjTzt8/f+SeCspOZCdVGkKkeF6qb5
	OUC3akCK2LPWEOykLmMH5OoVTPuGFhifjmxzH148SCXVe2aJ/M8irWBkVfbJGlZW6MpqlUGoXwf
	JqDapsuF73GWEpLl9J/zBGjR0H4HI4fhJc5cca5Oj5RXanSu9lC1FerWVRXMEUqb9LQinu5k5ah
	vwyJhtGrY+0kXAvb/Qfh3eV2HM1gurBPV+ZEOr51a0iG1XLP0pfkcBHS57r1Dys4epPpNBNcFKP
	JY7LhMS9Xs7hgbVN7itLGyZtacs9zAQAo
X-Received: by 2002:a05:6830:270d:b0:80c:d34f:5f63 with SMTP id 46e09a7af769-8309814be28mr19957456a34.28.1792122332994;
        Thu, 15 Oct 2026 20:45:32 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm834402a34.0.2026.10.15.20.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:45:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 21:45:19 -0600
Subject: [PATCH v8 04/17] mtd: rawnand: sunxi: drain interrupts before
 reusing the completion
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-4-8ba4881fbee8@gmail.com>
References: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
In-Reply-To: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
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
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 35 ++++++++++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 6c0d3e2d2be2..f7ddd4116bf4 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -393,6 +393,7 @@ struct sunxi_nfc_caps {
  * @chips: a list containing all the NAND chips attached to this NAND
  *	   controller
  * @complete: a completion object used to wait for NAND controller events
+ * @irq: NAND controller interrupt
  * @dmac: the DMA channel attached to the NAND controller
  * @use_mdma: use an internal MBUS DMA backend
  * @mdma_desc: H6-style MBUS DMA descriptor
@@ -412,6 +413,7 @@ struct sunxi_nfc {
 	unsigned long clk_rate;
 	struct list_head chips;
 	struct completion complete;
+	int irq;
 	struct dma_chan *dmac;
 	bool use_mdma;
 	struct sunxi_nfc_mdma_desc *mdma_desc;
@@ -433,18 +435,20 @@ static irqreturn_t sunxi_nfc_interrupt(int irq, void *dev_id)
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
@@ -454,16 +458,25 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
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
+			/* The handler removes acknowledged events from the mask. */
+			pending = readl(nfc->regs + NFC_REG_INT) & events;
+			status = readl(nfc->regs + NFC_REG_ST);
+			ret = (status & pending) == pending ? 0 : -ETIMEDOUT;
+		} else {
 			ret = 0;
+		}
 
 		writel(0, nfc->regs + NFC_REG_INT);
 	} else {
@@ -476,6 +489,12 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
 
 	writel(events & NFC_INT_MASK, nfc->regs + NFC_REG_ST);
 
+	if (irq_disabled) {
+		/* Flush the mask and acknowledgment before re-enabling the IRQ. */
+		readl(nfc->regs + NFC_REG_INT);
+		enable_irq(nfc->irq);
+	}
+
 	if (ret)
 		dev_err(nfc->dev, "wait interrupt timedout\n");
 
@@ -2650,6 +2669,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	nfc->dev = dev;
 	nand_controller_init(&nfc->controller);
 	INIT_LIST_HEAD(&nfc->chips);
+	init_completion(&nfc->complete);
 
 	nfc->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &r);
 	if (IS_ERR(nfc->regs))
@@ -2658,6 +2678,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
+	nfc->irq = irq;
 
 	nfc->caps = of_device_get_match_data(dev);
 	if (!nfc->caps)

-- 
2.53.0

