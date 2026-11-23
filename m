Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445631;
	b=g5lgmoJyhA00nUJQBZx7ikgeQZ3WV0Du6B1TjCDgIsgHUvVIxOgZyha329q33yqMKQ8O
	 CaMP8amjj24NtNSTG1kXs7gA07iMV2uFSQVuP78WXjf97Qt1ZXYMsH/YWsIbyghfGRafF
	 FKhEw3PKvPXsiLjNkCDXH+DAcRohHcDEnowOJaUoYTBXKCspFKkpjmZ/N0AMqiwnsWaOe
	 6U/v4NKXs9tRmwiLZ/M2KQJuIfDWJByrmpzTNQQAxugchuBEDR9K5/Un71iWL+eH3y/ta
	 lztp87JoOzqzB//5spLtMzXTo/kvJkCHZKfHurE0GN86Y7bAexmYZeQDF107w9LeiGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445631;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Zvqnrlc7MSEtVSmfRRlydngWRQ+r+L5CkYiMb5jwDlo=;
	b=Xn7kY4XJkDu+Y8cJLOQ/qyIGQInMF4c4XpIuDjf0Wbrrir3GPHdT5ZBs7X3VEN5v87Gp
	 pOt4J5rNsV1tdA/s70YpknSsLLbkQ6+QX5iFMG1mtunkvAOhFpbLtuG+igckru71SBgVg
	 b5AiqFd24D8b0Rvjg6ZSThlPkhKLx5og+m1XgseirKvdeLDmlmd92ML5zy6AEDiVsB8Rx
	 dw3L8Rbssf+xiS3VS8+H4D4g/PgFUXdZ0zo20pkzeK1y/nGlPYT9eVhDAAadbWnDvQevd
	 6nweoQqOYlGQQXVSphEK1ZLassOXWUtcdpLCc32OimGWYHnd2HBlZ3wwM1O9x4QiMzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=doml4OEl;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AC360A3828
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 14:53:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95AC360A3828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=doml4OEl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-492f0a1b685so2358832f8f.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445630; x=1796050430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zvqnrlc7MSEtVSmfRRlydngWRQ+r+L5CkYiMb5jwDlo=;
        b=doml4OElPORpXc2qIfAu85R+07zrXEfqpUSHMRiYnf+iTX1cMLpEuriwYq+Q2H68X7
         PC2QOCMsIkSU/dHqfVHpja2SkEdCsftBfz2xwWKXvqrWdVajli3t+7LpNualMFke2s+D
         uHNHN0MRxhLeFM3eAbm9P8TYx3O1sLEdaLws0xmLC00nUK1nv6Yl6ccXJqLPVGyhBL+z
         c/it0xyi8VkKFJPuEmdtO0vq0qvsR5pFlszibB/STIDQdopXznbHkybgBlbUC/TRHnUy
         3n6FEqR61hVkv7W3h1sxmJXxKAWwx94tf+FO6JUrGt4dg8l+RWyNXfjGftan+rJNrGte
         xYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445630; x=1796050430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zvqnrlc7MSEtVSmfRRlydngWRQ+r+L5CkYiMb5jwDlo=;
        b=NIL1VEejnl4UBYxzYV9CoZU5ouZu/5Cjpc9eeY1fUqdnSa4Pgs5830dWFmLSIu74dy
         oNxnVRoqmnp7leqIkvbeeChwTf4wYpQVDdu4hH9gWBlbHizLM9ERvRMx8T4qq5yqPmca
         AN5smos7lz9lTwrzLVcgmhvV0NR5nnc7RtRicMsGnWMLncGdiJSizvUmwjcPyDjo1vN/
         OVxoH6bK/AlexjR2BwkW4jdBW1qWqOM6oJkr+p3Ew1saMu6qcjQ7H3WcMroLoh6NVFwt
         mMLjvdEYKDVnOQ4H+RRV/83nJA5dj5esiW67bS9ioinEGZ+JkpiYAkyMRwMbaiYP2El2
         xPtw==
X-Forwarded-Encrypted: i=1; AL+hErERmjEiNT6tfLQAtFegLpIOgrzkogAVZ6IBqV0TZN29+Cvi7fBfv9KLy3WG1Xaw+E2RQUE3FGtP9QOv@vger.kernel.org
X-Gm-Message-State: APuU4Z/2x41UVoDZO0glNeqQBdqhrHeT9Aeful2fx3snhun8Erz//TMw
	NYAztBLHV8skv907WTFxERUvMUekCJ8mYzK17hYyT0QMtvl9SMNV8v5mJ7FJ3+fzNMw=
X-Gm-Gg: AZFdTZeNhtTUQkJIRNNnh4oBq5LzUWH5F6e2pBq254Wv88O4G/cIHX3nbB7Pbq+ssKP
	r8zALRKYWMB0VIBHtucIt+qcWdGJupPP6LyTllOVEBPU2xWK7aF94X8vA3x5h/kFvIwkw2py0Pj
	Hg51K5yYjJb4Gpl1UU3PF5JyFwd4HM5OY1lvPShpFrhUfN4nGoOtdegzFV6h8zm45Y9CVnkxO/d
	nOZ6JQn5PIGz9bGe4rYg/W+8cgpkrOGmO+km4waTIxDqqeYN3C8h7n5ZMH+AJetrYSAEQqjXINg
	tjaHQFNOs5JhYmGi0ZlYl7APukT66JBMEU8viKOtFkB1BZ25H2EyC7BDF1EODeIC6mFhJnRmNpv
	/wHKhEiqlhlNMJwYBP8oGa7xlettCmYSxeiMZOCHbKPtZEM3hU7FzspFCnynguPSJf4rHGx/vvb
	l5TCMRP45nMJRzWQ+b1MdpJejTXwsk10mME27y5R/2ByQwOkROhW2ySpqVyD0v60pzkfGJ38lXn
	QBvnWFjv3VJ+q7i8D6OPdrSAffLpcvXm20JEt50eFgc/PM7mdHD2Wf8dLlY7D0lwWPRtk4M4JtQ
	++MAdpSpPh23uONFe3du0+jT02c=
X-Received: by 2002:a05:6000:2313:b0:490:50c1:f359 with SMTP id ffacd0b85a97d-4abb4d70071mr25023593f8f.39.1795445629731;
        Mon, 23 Nov 2026 06:53:49 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dd55sm22090607f8f.30.2026.11.23.06.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:49 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v3 12/28] dmaengine: bcm2835: pass dma_chan to generic functions
Date: Mon, 23 Nov 2026 15:56:50 +0100
Message-ID: <20261123145728.29082-13-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation to support more platforms pass the dma_chan to the
generic functions. This provides access to the DMA device and possible
platform specific data.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 1d322cad4ca3..d048cb00ce5d 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -307,13 +307,14 @@ static void bcm2835_dma_desc_free(struct virt_dma_desc *vd)
 	bcm2835_dma_free_cb_chain(container_of(vd, struct bcm2835_desc, vd));
 }
 
-static bool bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
+static bool bcm2835_dma_create_cb_set_length(struct dma_chan *chan,
 					     struct bcm2835_dma_cb *control_block,
 					     size_t len,
 					     size_t period_len,
 					     size_t *total_len)
 {
-	size_t max_len = bcm2835_dma_max_frame_length(chan);
+	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
+	size_t max_len = bcm2835_dma_max_frame_length(c);
 
 	/* set the length taking lite-channel limitations into account */
 	control_block->length = min_t(u32, len, max_len);
@@ -423,7 +424,7 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 		/* set up length in control_block if requested */
 		if (buf_len) {
 			/* calculate length honoring period_length */
-			if (bcm2835_dma_create_cb_set_length(c, control_block,
+			if (bcm2835_dma_create_cb_set_length(chan, control_block,
 							     len, period_len,
 							     &total_len)) {
 				/* add extrainfo bits in info */
@@ -491,8 +492,9 @@ static void bcm2835_dma_fill_cb_chain_with_sg(
 	}
 }
 
-static void bcm2835_dma_abort(struct bcm2835_chan *c)
+static void bcm2835_dma_abort(struct dma_chan *chan)
 {
+	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	void __iomem *chan_base = c->chan_base;
 	long timeout = 100;
 
@@ -533,8 +535,9 @@ static void bcm2835_dma_abort(struct bcm2835_chan *c)
 	writel(BCM2835_DMA_RESET, chan_base + BCM2835_DMA_CS);
 }
 
-static void bcm2835_dma_start_desc(struct bcm2835_chan *c)
+static void bcm2835_dma_start_desc(struct dma_chan *chan)
 {
+	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct virt_dma_desc *vd = vchan_next_desc(&c->vc);
 
 	if (!vd) {
@@ -553,7 +556,8 @@ static void bcm2835_dma_start_desc(struct bcm2835_chan *c)
 
 static irqreturn_t bcm2835_dma_callback(int irq, void *data)
 {
-	struct bcm2835_chan *c = data;
+	struct dma_chan *chan = data;
+	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	unsigned long flags;
 
@@ -587,7 +591,7 @@ static irqreturn_t bcm2835_dma_callback(int irq, void *data)
 			vchan_cyclic_callback(&d->vd);
 		} else if (!readl(c->chan_base + BCM2835_DMA_ADDR)) {
 			vchan_cookie_complete(&c->desc->vd);
-			bcm2835_dma_start_desc(c);
+			bcm2835_dma_start_desc(chan);
 		}
 	}
 
@@ -615,7 +619,7 @@ static int bcm2835_dma_alloc_chan_resources(struct dma_chan *chan)
 	}
 
 	return request_irq(c->irq_number, bcm2835_dma_callback,
-			   c->irq_flags, "DMA IRQ", c);
+			   c->irq_flags, "DMA IRQ", chan);
 }
 
 static void bcm2835_dma_free_chan_resources(struct dma_chan *chan)
@@ -623,7 +627,7 @@ static void bcm2835_dma_free_chan_resources(struct dma_chan *chan)
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 
 	vchan_free_chan_resources(&c->vc);
-	free_irq(c->irq_number, c);
+	free_irq(c->irq_number, chan);
 	dma_pool_destroy(c->cb_pool);
 
 	dev_dbg(c->vc.chan.device->dev, "Freeing DMA channel %u\n", c->ch);
@@ -704,7 +708,7 @@ static void bcm2835_dma_issue_pending(struct dma_chan *chan)
 
 	spin_lock_irqsave(&c->vc.lock, flags);
 	if (vchan_issue_pending(&c->vc) && !c->desc)
-		bcm2835_dma_start_desc(c);
+		bcm2835_dma_start_desc(chan);
 
 	spin_unlock_irqrestore(&c->vc.lock, flags);
 }
@@ -868,7 +872,7 @@ static int bcm2835_dma_terminate_all(struct dma_chan *chan)
 	if (c->desc) {
 		vchan_terminate_vdesc(&c->desc->vd);
 		c->desc = NULL;
-		bcm2835_dma_abort(c);
+		bcm2835_dma_abort(chan);
 	}
 
 	vchan_get_all_descriptors(&c->vc, &head);
-- 
2.51.0

