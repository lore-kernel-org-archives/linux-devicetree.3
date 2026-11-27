Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781938;
	b=UnmPAPbjaekIa4SuG3/LKiAOXLJ4IT33W5eRAQk0gj0c91kn7DInnS9FxJVYA5RjqHdU
	 MD6hQyGRIyECZAKqaNgad12+hCoHCBtjDnk9wwR4GCRTGMVJqPcFGhDgZOhnd+A/+pxXr
	 jwioqRxH4SrMFJ4RbahCKZ3j7kTskrFYRQRp1E2IGIqD+79HCYUU8REkDccQpw+UF9qNq
	 5HG35gdduJ7zPk+4NC4VhG6nFlsZbAg/8omoxG6c2gJIdhaOqUwF2yQVnFY4d/aUhCml9
	 U1/gT7bJRSq3mLXD6PeXk7fRsOtB3Z9zOwIoVs0Y4NchJu0eEoqj7tUMrJDAUViDbLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+tBgaZ/ue9EThyXCcpZYMbPnOM1Uj3AWIbOUVJpasCM=;
	b=nCC/CiMYSZsA9zPwWopnXoFYdPBMtG0NDaLmBtP+6vBPVebTsoTmajNmqwFb0xI3wDwk
	 OeYahkL0JxrI9BjyXucHDzR6vaHcpWRyjXhQLDdi9RgjXMezLakED3tGphdYT6QPI6egI
	 xuZWPYG5OcqE8i9FIRixpPRVLq397a2wcvmSDNgBmoJKHzik5YCG9bKsVXbEG9Hvhupq1
	 /Bofa2A1AIf9UTFRBUjouqdWKXqCAfMj41OujXtJs0fwL8Pu2RkIr34MSAPDY5ihcxrIA
	 ssF1dEpXPezSVJxwKv1ZKXoSyjV+qYTzZjgZC80UXnjfjbAWd9jAKkZ0cJpudE2czjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="e9OH/mCa";
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADF560A263F
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ADF560A263F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=e9OH/mCa
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so49795175e9.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781936; x=1796386736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+tBgaZ/ue9EThyXCcpZYMbPnOM1Uj3AWIbOUVJpasCM=;
        b=e9OH/mCaAho/x8KvS6T1l0p0CC7tjmkNPTGo+7++ffGuFjPfiFWphfzZ8UOzRxirFD
         rxi7td+/SiYUr+Zczn6dCcgsqtpkrJYkmWuHydS7QevR4BoqMrfm1pgI24/NvNrhz82k
         WB+8/+CdsDWhMFtT0LG9l9LLomDW6Cd3erEIQv+pJq3aZ4Tg0J3fT5iberXiQxSnhOKI
         izdfAZ+ILSv3gnJYRRn6opqb+UjB3mt2KRTWtvidMZnHbJwUX0SAU/JSEFVGbPYD20dt
         jcZ5n8hZQPgd9yEYaYjhjPnF0BrsttQPDT7AQ2V604h3Wrd3TERKtMkgnvGB4p4ybiqg
         ND3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781936; x=1796386736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+tBgaZ/ue9EThyXCcpZYMbPnOM1Uj3AWIbOUVJpasCM=;
        b=n5Q+2DOkhdLu7T57ozgM39QjPB1LG6G74P9LUSw7hvemCBB7YORsuTSGWjh4jliyVL
         LdrcT/EffEX/AybhPoXsL0oMUCSzIlX4vL2HoXUmmCQahamDzslL8wZO6fByoNSXGksh
         KAnQgU+VJX2y+ITk1z+kzVac9IXsbm8jCQDJ8QRDilK8rhLJykC7uUvnEQSW9wVdk022
         eSM/PHIxZPieFYcjGh7SOnYGnwjrHpUnc9g8QX2z3r9PKsB+zXyt2yiQKVqPsnu+GyuQ
         DcYbdIUVY2LmsEtI6aA/NwGQ1XWZoWT8A8GspxKAjWGjA6bcOwm7Zc/8erPnCtss7ILr
         i3UQ==
X-Forwarded-Encrypted: i=1; AL+hErHq5AOMp4m5powfW1YJMBY7bfji06KjNkyaaEQNd272DCPA0Pp2X4oaWpYBtUNNajHc0A/rVEXzDoBx@vger.kernel.org
X-Gm-Message-State: APuU4Z/jTGBC5mIs6LCNT1fMvBBuX86m74Tik3XYU3uaGCdWN3iVlWys
	Zy67mSeKlUqoE7dSZZqa5gYFZ15o5+OBd02nneTq2HJmil4ELUSffBzH8kI/EEpNFq8=
X-Gm-Gg: AZFdTZeU3tx4zkbD9xbEehuXle5zSe6uRuFhmiDYXOZMtnJ+5wcX/fg3z8IZRtU+y93
	HDqtuP1OYupxg8KuWcO1vH2Ra9jQfYP6Ij2YovyQnxj3HVGZ46cvM66xTARMCuR17KlNBgay/Fx
	ofl/SRqEik/uJUOdfF9JgPMaLEDwpwpQmyBRHMklyVHFrVZW0f+aA1NsicIBUIuZ894+GbvjAWF
	OjyN5Y5l+xtDSNS/kQEAhszocahT/sNA/izhkF7mfW0a8zXJ0tA1hMM1C1wAUepkDqNzEBYfvo9
	CDS/e+ud2y9OY6MlqjHJ4WxuxM7nBpc+uSAk2kDjCfp8N2ONMGCAHcwHHKzghUEwiSrMqfeBGGw
	xB5OEkgeX7J6UaBRZ59xYsF48mA1eSX74dEzqQFBWYJ7ISTWmP8m0qXS/0TIupHuphzRosSB9rY
	FVSHTOCqc5EsMJXl9GAmYimnOtwL6hv67eHXQ9Bw0kVTwt1kEQlQWIRQq3RQYiT0d5SlG/aI2Rc
	KfrEKrnW7DL4m8IEi5zBEtDmqrfi9h8gWpuoCcr4SUdUGMoJtrtT6K67VU0qlFLGYBgTAyKKhQr
	yMhhB+kqP7ry8+9BALPuUTs85rL+
X-Received: by 2002:a05:600c:4504:b0:4b4:a551:681a with SMTP id 5b1f17b1804b1-4bb887fc396mr496613695e9.3.1795781936454;
        Fri, 27 Nov 2026 04:18:56 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm767331835e9.10.2026.11.27.04.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:18:56 -0800 (PST)
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
Subject: [PATCH v4 11/28] dmaengine: bcm2835: drop info parameters
Date: Fri, 27 Nov 2026 13:22:01 +0100
Message-ID: <20261127122236.4976-12-andrea.porta@suse.com>
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

The parameters info and finalextrainfo are platform specific. So drop
them by generating them within bcm2835_dma_create_cb_chain().

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 81 +++++++++++++++++++--------------------
 1 file changed, 39 insertions(+), 42 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 1fa7cbfe3c2d..416d9882aeb2 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -305,12 +305,11 @@ static void bcm2835_dma_desc_free(struct virt_dma_desc *vd)
 	bcm2835_dma_free_cb_chain(container_of(vd, struct bcm2835_desc, vd));
 }
 
-static void bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
+static bool bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
 					     struct bcm2835_dma_cb *control_block,
 					     size_t len,
 					     size_t period_len,
-					     size_t *total_len,
-					     u32 finalextrainfo)
+					     size_t *total_len)
 {
 	size_t max_len = bcm2835_dma_max_frame_length(chan);
 
@@ -319,7 +318,7 @@ static void bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
 
 	/* finished if we have no period_length */
 	if (!period_len)
-		return;
+		return false;
 
 	/*
 	 * period_len means: that we need to generate
@@ -333,7 +332,7 @@ static void bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
 	if (*total_len + control_block->length < period_len) {
 		/* update number of bytes in this period so far */
 		*total_len += control_block->length;
-		return;
+		return false;
 	}
 
 	/* calculate the length that remains to reach period_length */
@@ -342,8 +341,7 @@ static void bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
 	/* reset total_length for next period */
 	*total_len = 0;
 
-	/* add extrainfo bits in info */
-	control_block->info |= finalextrainfo;
+	return true;
 }
 
 /**
@@ -352,7 +350,6 @@ static void bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
  * @chan:           the @dma_chan for which we run this
  * @direction:      the direction in which we transfer
  * @cyclic:         it is a cyclic transfer
- * @info:           the default info bits to apply per controlblock
  * @frames:         number of controlblocks to allocate
  * @src:            the src address to assign
  * @dst:            the dst address to assign
@@ -360,25 +357,27 @@ static void bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
  * @period_len:     the period length when to apply @finalextrainfo
  *                  in addition to the last transfer
  *                  this will also break some control-blocks early
- * @finalextrainfo: additional bits in last controlblock
- *                  (or when period_len is reached in case of cyclic)
  * @gfp:            the GFP flag to use for allocation
+ * @flags:          the dmaengine prep flags (DMA_PREP_*) of the transfer
  */
 static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 					struct dma_chan *chan,
 					enum dma_transfer_direction direction,
-					bool cyclic, u32 info,
-					u32 finalextrainfo,
-					size_t frames, dma_addr_t src,
-					dma_addr_t dst, size_t buf_len,
-					size_t period_len, gfp_t gfp)
+					bool cyclic, size_t frames,
+					dma_addr_t src,	dma_addr_t dst,
+					size_t buf_len, size_t period_len,
+					gfp_t gfp, unsigned long flags)
 {
+	struct bcm2835_dmadev *od = to_bcm2835_dma_dev(chan->device);
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	size_t len = buf_len, total_len;
 	size_t frame;
 	struct bcm2835_desc *d;
 	struct bcm2835_cb_entry *cb_entry;
 	struct bcm2835_dma_cb *control_block;
+	u32 extrainfo = bcm2835_dma_prepare_cb_extra(c, direction, cyclic,
+						     false, flags);
+	bool zero_page = false;
 
 	if (!frames)
 		return NULL;
@@ -392,6 +391,14 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 	d->dir = direction;
 	d->cyclic = cyclic;
 
+	switch (direction) {
+	case DMA_MEM_TO_MEM:
+	case DMA_DEV_TO_MEM:
+		break;
+	default:
+		zero_page = src == od->zero_page;
+	}
+
 	/*
 	 * Iterate over all frames, create a control block
 	 * for each frame and link them together.
@@ -405,7 +412,8 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 
 		/* fill in the control block */
 		control_block = cb_entry->cb;
-		control_block->info = info;
+		control_block->info = bcm2835_dma_prepare_cb_info(c, direction,
+								  zero_page);
 		control_block->src = src;
 		control_block->dst = dst;
 		control_block->stride = 0;
@@ -413,10 +421,12 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 		/* set up length in control_block if requested */
 		if (buf_len) {
 			/* calculate length honoring period_length */
-			bcm2835_dma_create_cb_set_length(c, control_block,
-							 len, period_len,
-							 &total_len,
-							 cyclic ? finalextrainfo : 0);
+			if (bcm2835_dma_create_cb_set_length(c, control_block,
+							     len, period_len,
+							     &total_len)) {
+				/* add extrainfo bits in info */
+				control_block->info |= extrainfo;
+			}
 
 			/* calculate new remaining length */
 			len -= control_block->length;
@@ -437,7 +447,9 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 	}
 
 	/* the last frame requires extra flags */
-	d->cb_list[d->frames - 1].cb->info |= finalextrainfo;
+	extrainfo = bcm2835_dma_prepare_cb_extra(c, direction, cyclic, true,
+						 flags);
+	d->cb_list[d->frames - 1].cb->info |= extrainfo;
 
 	/* detect a size mismatch */
 	if (buf_len && d->size != buf_len)
@@ -690,9 +702,6 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
 {
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
-	u32 info = bcm2835_dma_prepare_cb_info(c, DMA_MEM_TO_MEM, false);
-	u32 extra = bcm2835_dma_prepare_cb_extra(c, DMA_MEM_TO_MEM, false,
-						 true, 0);
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
 
@@ -704,9 +713,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
 	frames = bcm2835_dma_frames_for_length(len, max_len);
 
 	/* allocate the CB chain - this also fills in the pointers */
-	d = bcm2835_dma_create_cb_chain(chan, DMA_MEM_TO_MEM, false,
-					info, extra, frames,
-					src, dst, len, 0, GFP_KERNEL);
+	d = bcm2835_dma_create_cb_chain(chan, DMA_MEM_TO_MEM, false, frames,
+					src, dst, len, 0, GFP_KERNEL, 0);
 	if (!d)
 		return NULL;
 
@@ -722,8 +730,6 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	dma_addr_t src = 0, dst = 0;
-	u32 info = bcm2835_dma_prepare_cb_info(c, direction, false);
-	u32 extra = bcm2835_dma_prepare_cb_extra(c, direction, false, true, 0);
 	size_t frames;
 
 	if (!is_slave_direction(direction)) {
@@ -746,10 +752,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 	frames = sg_nents_for_dma(sgl, sg_len, bcm2835_dma_max_frame_length(c));
 
 	/* allocate the CB chain */
-	d = bcm2835_dma_create_cb_chain(chan, direction, false,
-					info, extra,
-					frames, src, dst, 0, 0,
-					GFP_NOWAIT);
+	d = bcm2835_dma_create_cb_chain(chan, direction, false, frames, src,
+					dst, 0, 0, GFP_NOWAIT, 0);
 	if (!d)
 		return NULL;
 
@@ -765,14 +769,9 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 	size_t period_len, enum dma_transfer_direction direction,
 	unsigned long flags)
 {
-	struct bcm2835_dmadev *od = to_bcm2835_dma_dev(chan->device);
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	dma_addr_t src, dst;
-	u32 info = bcm2835_dma_prepare_cb_info(c, direction,
-					       buf_addr == od->zero_page);
-	u32 extra = bcm2835_dma_prepare_cb_extra(c, direction, true, true,
-						 flags);
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
 
@@ -823,10 +822,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 	 * note that we need to use GFP_NOWAIT, as the ALSA i2s dmaengine
 	 * implementation calls prep_dma_cyclic with interrupts disabled.
 	 */
-	d = bcm2835_dma_create_cb_chain(chan, direction, true,
-					info, extra,
-					frames, src, dst, buf_len,
-					period_len, GFP_NOWAIT);
+	d = bcm2835_dma_create_cb_chain(chan, direction, true, frames, src, dst,
+					buf_len, period_len, GFP_NOWAIT, flags);
 	if (!d)
 		return NULL;
 
-- 
2.51.0

