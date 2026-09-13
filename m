Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C0336A377
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 04:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789272311; cv=none; b=Jc5MCAW3oT7GgGksNZvLMXpCmtM6ioMmYiLb26xJrTomc7621kglwanl00lJF3Uuem82xxXsVPFFhBXs5zd2pboQDo+mxoHUAk1TOdE99JrKmTMPe300sluZQ+MhqO+0llUR4T7zLVY/D6pgLAFCTkIJuFetDwIrlumYfOPOCVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789272311; c=relaxed/simple;
	bh=Lpu8BYiYZNteYXFlDSxlBr4C2CnU/Gx0SiTFgcn6nP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kB+xKqVDOI2PsGX6jwmgZRAg8dZndv5pMf54Py5CD4DvvmP2y9yafnVA8752T5LzFiuQkfHzNCIZA5I1Gk81/x0z/kAy5MvJvcR0iu+yg1LyiPeYKIIgkbREZMkp3Q1fqRm+KOAeS2zvBy0dUWkPYONWbU2hc03Bl/MEU/B54hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JVA9kFf4; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JVA9kFf4"
Received: by mail-oo2-f43.google.com with SMTP id 006d021491bc7-6b1ae7166edso533778eaf.3
        for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 21:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272309; x=1789877109; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EsI+dpw6vMR742jYDR1gddCVyVHs7LTF48bPd8UEx9g=;
        b=JVA9kFf4U6G9eQBDRF1dMDwojUBtxmSAbOxiQAI/9Vn6az0en11BUeP2JXB0SGTz3c
         EFWXkK6jkzymQfz1ro0r0tALG2fvn2Xv8FXB4s7KsAbBoEJ+wx2zvvo0ckVH+BYLlPKm
         Qc1xKJe32AvF7+0QY7ByA2wyn8N6ErbkBhd42K/xJtQ+WufNppRu7ZL0x0/AeFAIwv0D
         uytNSDHCqK4V7DzQL7O4twTJ7duTlnDUTW6DkOiuQHSDaXztH90rMDt6RYtPepNAzESR
         YUdcRGkryJojFEixNrQ8P1/c4njP+vo7s7VME5Yvnoahk3zJYYuf9kxtdl2APm7aNziR
         gNkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272309; x=1789877109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EsI+dpw6vMR742jYDR1gddCVyVHs7LTF48bPd8UEx9g=;
        b=VmeWxeIaZ5q/i67As/OVvWwRmjSFan49KmlEkK5ic9LhXia/fmo4N5UPnhLYGn6RNv
         xr6YFfpYZq67y6qos5nyasuO70H7oSUJVAsl1tgEoio3qB7aWWjCLtQmQMFx5945VTvP
         hIaPlneoqb+s8XlqrGGkAqoVM025hrI4ilDpmFhrUrO+2E4eJTesWq0MewAnA7GPObfc
         9JCexv+PnaVo2lYzwBDesTEDk3qtex117nmDzsgMau7vKAaBDYmBJNy3NfAboPJODENv
         F+JPshbmKmuOXY/7tnEY7oR9yWlxOtwmd1TYrDH/QEAvl7t0HyTLtciPmOTXyc151Ee2
         /wDg==
X-Forwarded-Encrypted: i=1; AKwUvBxHFdi7xe7OQItK956JdP5LojXsoAp0zljof0OJYHaVJVfG+wLFgYHD0Jrs0mqMNBOQIdgi14+ZLXVi@vger.kernel.org
X-Gm-Message-State: AFuF++lw8LX1wAertsSu/imFfPxqeVMQYXXXlD3y7nhfVILcZQQ46gWS
	vVc2S2M7kvlBfqXNHyS6aV+DnIurB1qmT7RwkWaHNQvn1YYwKLZ/5mOZ
X-Gm-Gg: AYBFou33UILuYes0fcWJwfDm0UL/840D3yfMKQ/6cc6DUvK3+awGv95ByOSOL701fSa
	1fBUI7BHt1j+xG7g9gkIa423Sf4DpJ6Usw36mZpzLk6qyLV+NJkpNWZYWYlVWy6m37xNU+rWqQh
	uIGJ7luOtkjA3lD36U4SYW032CZuTHgIGltjxTcYmt07Hwkl8q3t/0gve1zzAesOJaoAnAzP1se
	jBMPsUD50b1J3PmS2CsSZzPidGyPHliFjqCFwF4hl2Ay7egskROD7KuHI84cqY21djDAS3l4ylZ
	1wSbEYQWfh1PWHo0NxldDzxDmJecyJImukupin/uLeCHB2MkJyssEVUXrpCjeQbIItotYN1PTMd
	LJO2C3apNcWoEuZkOv4EjjWqap07Wt/XuuZC0Js9jvNfUlAadC3oOnROQbjd2GwyNOT1SH1erkk
	58AkHs1UAX3+BYMw5/9eA7G594L7HIGJ0YFpb94sxDxWvXDVR9r4KBKWY657EIxUpRA8RLATHnt
	0KSCGegKtM/3zg1mZLvuNW3gkeFUrs+ClTE42bRwSJ59Kjqc1bmw6Z0x8Bl+DwpQLoDTd12Jhaw
	ZSIyF0vL58/48C4pwPkHeIW/CPxhYAkoiRaHX8lBBx5fjiDt5nAddGQvk2Ah/sAkv7YcF6t6/kj
	wd2ywh/a73VuiGzIhvPdlKcOBx6/kuQ==
X-Received: by 2002:a4a:e90a:0:b0:6be:8d11:a077 with SMTP id 006d021491bc7-6c24f2660eemr2474010eaf.67.1789272308682;
        Sat, 12 Sep 2026 21:05:08 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:04:52 -0600
Subject: [PATCH v4 01/17] mtd: rawnand: sunxi: drain interrupts before
 reusing the completion
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-1-4a64bed94229@gmail.com>
References: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
In-Reply-To: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2

A timed-out wait can return while the interrupt handler is still using
the previous operation's interrupt status and enable mask. Starting the
next wait calls init_completion() on the same object, which can reset its
waitqueue lock while the old handler calls complete(). The old handler
can also complete the new wait or restore an obsolete interrupt mask.

Initialize the completion once in probe and use reinit_completion() for
each interrupt-driven wait. On timeout, disable and synchronize the IRQ
before masking controller interrupts and acknowledging the waited-for
events. Draining the handler first also prevents a partial-event handler
from rewriting the enable mask after it has been cleared. Flush these
register writes before re-enabling the IRQ line, leaving the controller's
interrupt sources masked.

For successful waits, move complete() after the handler's register updates
so that the next operation cannot race with those updates. Keep polling
unchanged and leave controller and DMA abort handling to the existing
callers.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index f41feebe4257..e50cf5b6a730 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -374,6 +374,7 @@ struct sunxi_nfc_caps {
  * @chips: a list containing all the NAND chips attached to this NAND
  *	   controller
  * @complete: a completion object used to wait for NAND controller events
+ * @irq: NAND controller interrupt
  * @dmac: the DMA channel attached to the NAND controller
  * @use_mdma: use an internal MBUS DMA backend
  * @mdma_desc: H6-style MBUS DMA descriptor
@@ -393,6 +394,7 @@ struct sunxi_nfc {
 	unsigned long clk_rate;
 	struct list_head chips;
 	struct completion complete;
+	int irq;
 	struct dma_chan *dmac;
 	bool use_mdma;
 	struct sunxi_nfc_mdma_desc *mdma_desc;
@@ -414,12 +416,13 @@ static irqreturn_t sunxi_nfc_interrupt(int irq, void *dev_id)
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
 
@@ -435,16 +438,19 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
 		timeout_ms = NFC_DEFAULT_TIMEOUT_MS;
 
 	if (!use_polling) {
-		init_completion(&nfc->complete);
+		reinit_completion(&nfc->complete);
 
 		writel(events, nfc->regs + NFC_REG_INT);
 
 		ret = wait_for_completion_timeout(&nfc->complete,
 						msecs_to_jiffies(timeout_ms));
-		if (!ret)
+		if (!ret) {
+			/* Drain the handler before it can restore an old IRQ mask. */
+			disable_irq(nfc->irq);
 			ret = -ETIMEDOUT;
-		else
+		} else {
 			ret = 0;
+		}
 
 		writel(0, nfc->regs + NFC_REG_INT);
 	} else {
@@ -457,6 +463,12 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
 
 	writel(events & NFC_INT_MASK, nfc->regs + NFC_REG_ST);
 
+	if (!use_polling && ret) {
+		/* Flush the mask and acknowledgment before re-enabling the IRQ. */
+		readl(nfc->regs + NFC_REG_INT);
+		enable_irq(nfc->irq);
+	}
+
 	if (ret)
 		dev_err(nfc->dev, "wait interrupt timedout\n");
 
@@ -2617,6 +2629,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	nfc->dev = dev;
 	nand_controller_init(&nfc->controller);
 	INIT_LIST_HEAD(&nfc->chips);
+	init_completion(&nfc->complete);
 
 	nfc->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &r);
 	if (IS_ERR(nfc->regs))
@@ -2625,6 +2638,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
+	nfc->irq = irq;
 
 	nfc->caps = of_device_get_match_data(dev);
 	if (!nfc->caps)

-- 
2.53.0

