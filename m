Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781940;
	b=1fXu/8lQRHe3lCfqN+ira+PORbJ+4KfkjHmfIJqCwjGpKLrqcSiZu+gUZbAcIyZU3fUv
	 9/Xe0hRlJfzF2n2RDZ1Qch5Hxup0sptVWkRvnDKFOHy4pRvRkRMUvinuP3r5uWNOaWaDI
	 emA+OZgde7XSrfVAyNR8XJdvM0iCA33xshtG6wYHUvGixilQTERI3djmHfPejXqA53k1o
	 nTYvs1rLh+ZxSKx9IXJVnYbLdPXWHgrYpY2AB3APQYJChiQbyKvG7Sbsqn9f29+/Vcmfx
	 8zzyF3F/+msQaiFka8/NSZ4PJlCsoDB//vqgn2WpMJMelJTBqJsvAuBHCyh+wqbd3vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Mm85sjHJqArC7LWLKyY5r/gaSqHpUQcpDUwxBHHWLZY=;
	b=bxONrwfRthPsRI5InJneK7DNgdQq00ROsKGxsOpCOqycWC9swYAnyCytIndOeJQcVxAP
	 xBOhLEjHcyXQIT5J2FXr/iKbwU4nkktI10eCw5ltR+h3f4qqEDL79r04NSr4NIMviwpGP
	 K1r3vXYhu8Al/qYAnwfoJsPAYGMoc7cLCopMQZcUmrjp9I0gGQNKyECmGZdQw0lvkb4vH
	 5GDTzj9e5PoLF0oNbdlPUE9afV2A0UUo36qMxPErPwiGqBn9a3Utj+y/qjp/7The4j64/
	 rSQVOZivYoUmAMBSdT12CAJjy0IdRA8Oz4PZbJn4A78nT+ft2ZbryjStGpXKLNCl8QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Adj0JvaQ;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639CC60A381F
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 639CC60A381F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Adj0JvaQ
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4b467581b98so77465835e9.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781938; x=1796386738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mm85sjHJqArC7LWLKyY5r/gaSqHpUQcpDUwxBHHWLZY=;
        b=Adj0JvaQlOLaAR/UbmBa7KcVeM1TW4E6jTunwU1pw1rsdzrzIhG2ddl4/C6zmIGF9F
         B1Dmv5dNPBKVbCmOvPMDreAmBWlqlRM9m/lMWq6N+/YnF/xfrE1+bGA+Yh1B73XRmDXs
         gRqinrv60k3P48m2hLyvIwCOvCnsQOl8GDWOsocUFlAFSNFsYfYE0bMWFF+7aeqqyY9z
         kHxap6ZRYLRumyeBtEZyP2QYZiUN1AhvpKaxFD5ZW8KOQ7pbj1E/ZPaHxQO7e3N77EF8
         tkRfeMxz2FBVOHIWm+R+B9z2Sf0QINv3Tz4pLTbI6xraApggh0lmYLQXIQDQ6VMEXjpG
         Wm8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781938; x=1796386738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mm85sjHJqArC7LWLKyY5r/gaSqHpUQcpDUwxBHHWLZY=;
        b=bM0kPplrfuCoHedO5zkPTzzlqzHNSGVU0Ppl4VXnIkuHUrsnM4Cv3m+rZAuleuFW3L
         iuKG0HQyfFKwGUETZroHbRF+1bP+ujQo8tnUFDL4fF4bfLZdl8D3Fgabzv9zoHUEUWVK
         KlxUGBp8E2xu8HpFwvD2lLXCBwvKDOviZV2E0UQHMS31BVrmJXgi9fXifXdG3jApkmhN
         jVodKPCwH996tusuSJWy07RilOvyiQW4iTX1HSqOoXjhLz/AkAYLdQpcWZ0BXUlIuPqy
         7GEEoeaMoJMRNkAq0/rKWd+EnHbkHPebFLkpXXLfOQcfMlzx/+97/QfV7jWQNKLadR0+
         o2tw==
X-Forwarded-Encrypted: i=1; AL+hErHUVE4EoURsIAAlUqDzoLa8z1HfLnOD5dSdJID5+IiRD7/IQw05mIOf2xBJY2G8YN68AZP4pGQZGHDY@vger.kernel.org
X-Gm-Message-State: APuU4Z95F6uPQFdqgXgmbnIX387HiIeSErTvGmr/Nh/me9hVWV7bAZuN
	GZyejWiJ7yOIVERsijIfIxsv88tCJo44JlUWdf0ktHjZJJFZ918oZ0hdoFc/XT/YiTM=
X-Gm-Gg: AZFdTZeILsIJSdXeb1uZnHbUfJyMOJslSZ4GE9W2TrnY3xekkWYXxuPO/Z5WcRJV16Q
	J8Kop+8TMjQZXK5LvN+t9lhu7xcUL7pSz8yf1UfkgZJ5uTR36HrwjNUwhZnPBI+Xqb845m0FzA2
	HRoxwWijXXd26Rd5/kUpoucMyOYJo4LFJUfFEFmCO3GkQLvy8oJXbY/c18q/x2WlFKMgJwr7rDJ
	aoauLDrdkw/8dzdOkWtGjff8M6CFvgJ2P9UNp8vYeo8zkxbrteEWlKPjrgOcxPBWueVvwy8kqhS
	h3N+YaIr40tGCCTVhrkzRba/ZlSpnOCDNnw34XGDUEfGcPKWVtG4pzR9n8vAw4wD6g8UGKFL9fK
	tzB/e4Sjow80vkB1LM9kbah8lob7g7l6DfzBDC0O+oOfgooMtPMrnob8KMSYJfD5yUscecXhfSM
	pIXxw/nkixbMRA65C3vgjzjzYzShbvoqJYqNobq2cMKHVIv26TwAQgORVjm0X1kSCiNAwy3fjTr
	y2S1hJ/ZGWXeBFzjsciADCs0JnwdED/AyCy03Y5c9RseB4G7QzQkm6s4wJxwDsGV6ixOYu11OKE
	IzsE+E9HQGzqyVX7b8HtfctzgEvv
X-Received: by 2002:a05:600c:6708:b0:4ba:7e6:53d6 with SMTP id 5b1f17b1804b1-4bb88940848mr434618965e9.33.1795781937757;
        Fri, 27 Nov 2026 04:18:57 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm566215005e9.0.2026.11.27.04.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:18:57 -0800 (PST)
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
Subject: [PATCH v4 12/28] dmaengine: bcm2835: pass dma_chan to generic functions
Date: Fri, 27 Nov 2026 13:22:02 +0100
Message-ID: <20261127122236.4976-13-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127122236.4976-1-andrea.porta@suse.com>
References: <20261127122236.4976-1-andrea.porta@suse.com>
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
index 416d9882aeb2..42a7e6eaff9f 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -305,13 +305,14 @@ static void bcm2835_dma_desc_free(struct virt_dma_desc *vd)
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
@@ -421,7 +422,7 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 		/* set up length in control_block if requested */
 		if (buf_len) {
 			/* calculate length honoring period_length */
-			if (bcm2835_dma_create_cb_set_length(c, control_block,
+			if (bcm2835_dma_create_cb_set_length(chan, control_block,
 							     len, period_len,
 							     &total_len)) {
 				/* add extrainfo bits in info */
@@ -489,8 +490,9 @@ static void bcm2835_dma_fill_cb_chain_with_sg(
 	}
 }
 
-static void bcm2835_dma_abort(struct bcm2835_chan *c)
+static void bcm2835_dma_abort(struct dma_chan *chan)
 {
+	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	void __iomem *chan_base = c->chan_base;
 	long timeout = 10000;
 
@@ -517,8 +519,9 @@ static void bcm2835_dma_abort(struct bcm2835_chan *c)
 	writel(BCM2835_DMA_RESET, chan_base + BCM2835_DMA_CS);
 }
 
-static void bcm2835_dma_start_desc(struct bcm2835_chan *c)
+static void bcm2835_dma_start_desc(struct dma_chan *chan)
 {
+	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct virt_dma_desc *vd = vchan_next_desc(&c->vc);
 
 	if (!vd) {
@@ -537,7 +540,8 @@ static void bcm2835_dma_start_desc(struct bcm2835_chan *c)
 
 static irqreturn_t bcm2835_dma_callback(int irq, void *data)
 {
-	struct bcm2835_chan *c = data;
+	struct dma_chan *chan = data;
+	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	unsigned long flags;
 
@@ -571,7 +575,7 @@ static irqreturn_t bcm2835_dma_callback(int irq, void *data)
 			vchan_cyclic_callback(&d->vd);
 		} else if (!readl(c->chan_base + BCM2835_DMA_ADDR)) {
 			vchan_cookie_complete(&c->desc->vd);
-			bcm2835_dma_start_desc(c);
+			bcm2835_dma_start_desc(chan);
 		}
 	}
 
@@ -599,7 +603,7 @@ static int bcm2835_dma_alloc_chan_resources(struct dma_chan *chan)
 	}
 
 	return request_irq(c->irq_number, bcm2835_dma_callback,
-			   c->irq_flags, "DMA IRQ", c);
+			   c->irq_flags, "DMA IRQ", chan);
 }
 
 static void bcm2835_dma_free_chan_resources(struct dma_chan *chan)
@@ -607,7 +611,7 @@ static void bcm2835_dma_free_chan_resources(struct dma_chan *chan)
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 
 	vchan_free_chan_resources(&c->vc);
-	free_irq(c->irq_number, c);
+	free_irq(c->irq_number, chan);
 	dma_pool_destroy(c->cb_pool);
 
 	/* do not leak the flags of a DT client to the next user */
@@ -691,7 +695,7 @@ static void bcm2835_dma_issue_pending(struct dma_chan *chan)
 
 	spin_lock_irqsave(&c->vc.lock, flags);
 	if (vchan_issue_pending(&c->vc) && !c->desc)
-		bcm2835_dma_start_desc(c);
+		bcm2835_dma_start_desc(chan);
 
 	spin_unlock_irqrestore(&c->vc.lock, flags);
 }
@@ -855,7 +859,7 @@ static int bcm2835_dma_terminate_all(struct dma_chan *chan)
 	if (c->desc) {
 		vchan_terminate_vdesc(&c->desc->vd);
 		c->desc = NULL;
-		bcm2835_dma_abort(c);
+		bcm2835_dma_abort(chan);
 	}
 
 	vchan_get_all_descriptors(&c->vc, &head);
-- 
2.51.0

