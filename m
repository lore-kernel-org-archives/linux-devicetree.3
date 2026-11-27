Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781937;
	b=Cw1+om4MGiN0wV94YkyDhP/gBVhADN1533/zbOOxLVwc5MhzktToj+zGmXkufjoUOU4L
	 wIQhpCjbGmP2gsZXOP0TvJfI1xYz7pSduQ/6wOb/YhfokNNkdXpfxIdRO6Z3hG0Sx0HK0
	 +0W8H5bFQNJyPqrCjRmVEjZbEztSOchV21ii5NxiYXqtIQ1mruVRkHMhx4spqisrlcjpN
	 phTRwYWW63E69MJbgtpnw9VzUEPROFRwIV6sE7gPzn50d9/lofQ5g7pL51sRrsOBN6Cdl
	 F04p0J1iMMySu8SDSPXvLG/7+EamJlL8qVFJLJf++EZZOTeBkBHXKf0LVDJ09cAtEEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781937;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JDEDLRxX+y+hxeESjxpnyx7awbIDm3QHkdvwKR0hu5A=;
	b=NBp12r7/IIH3aRZ8Pxm6/aeEZ1PxSRc4lh0pNmv5r1dCcA1b6ikrLmNTTw8y43OBj21v
	 ozZ7hwt/7NtrbvXfgL04Cch0vPjC7QCHNNkI2WlfTy1w1M/zx8B6+IHDZJajCfQl13UBJ
	 YPRIh0dPCIq1pONZzhHmaAhyXgiYkGuG0NAsARP8f8BX/nQ7HmMqyz2nxul7Az3FP9aLP
	 9o2/fVe6QkA6iOUR5bN0ciro0ahe77/xdWxPRDxWAMf1z1UvCUZpaac+48GcNCrGtGbEk
	 MoB+NwHF3q00tTX1IUmBZ3ZH/WbMsv+EvMREP2RQeMcb78MYqxbG697R8xRs+F+nEMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=OViBpshf;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A37A60A380A
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:18:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A37A60A380A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=OViBpshf
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so6256842f8f.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781935; x=1796386735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JDEDLRxX+y+hxeESjxpnyx7awbIDm3QHkdvwKR0hu5A=;
        b=OViBpshfT85AxZZqZTN0b48tevPt8loTi11LDqc5kLHvzkSCAztepAs6jdUo36QXao
         2t5LrbcSnH2rJcQ2+MOtl9eT1ky3V0BoOOBw9eEHBmWMBlew2AlnGbGsHuv5CisZ4aux
         7VHhr4PBtvrz/NaNXmDRoa6Ia2AJtfSL1cWtzvyP2sxKPwEVxhRSaNgESAagLcntWhXl
         FXFz8fh5hBb8/JH9jHIYrvpPtR6FHq7Yq869RF2MvxhbzD/7zGBYQCO4yGGPZnHK/g/0
         Lfc5B8zp939HylCryZTKKG0rSD1EMCRxdsj99ciwio9JlkzZv4ruIxoja+zKeYsmJ5Q8
         rW0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781935; x=1796386735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JDEDLRxX+y+hxeESjxpnyx7awbIDm3QHkdvwKR0hu5A=;
        b=suAOKNYRD6YLzDvxOoIljZ4ieOn8S2TmOwmmb5E63cIYbqVIRzjTK2Hi5HCnvjG6HK
         ge8XxfJbYT4cHn4jpu//AC7x7gO0eE7+/ybE3POleVkR8m9K+7quTLa32RJJh0phjSWf
         vGj8XeWqmUFdNBZohAwxFYe/vzF3/xvaBafyUh10/OtUElTMPdNkPGElXXRQ1mXZtMLt
         GjmCXHXmb70iPK+UzW6aoWmsy17WWhcoaC8y4UX/rfV4uCv4zYZmL/7r8ojgruu1Uc47
         +uAbcokv04QEHZ3ysz76lTdvrgDgUwNY2Rx3irH7E2AHSX0DsoWem3fV3XXwrdQNeH9I
         PJpw==
X-Forwarded-Encrypted: i=1; AL+hErFoAZ8ksk3LsivQ1g2XLok/OtIQkzpWrVS0i+mlp3mErWLrzLBK5kbFxtD9Q4NlDnciElEnPv7OB9VM@vger.kernel.org
X-Gm-Message-State: APuU4Z/fHq1RG1MfhNHfP9K8c1cLu3uKEAhFUP6/GDyVaYp6an1KsRmZ
	6pwnsFl0UDDrqypL83bvIq0VtRNx0v76W05OBLxZtjVXTyyh/KLB7Nk4y8A+1DmX1Kk=
X-Gm-Gg: AZFdTZcT18v8fSUOgTMyMwJY2JVTidcs/Esj75bfoPudJvPPPjZfS4fZGmTYJTRDqaO
	BC4xctG8aF+9iBc5tZwPjJF+7A18ZbhknU59nEX1+G3fnTl4UCVpxaWUL8hKWfz4A6QiJWyjfot
	1ujsxBGQAJrsBsCDD/lIuQ/S/w6jE8Tt+KjghuDJLxtTaiWRGq19e+w8hYFNYa6K8nj0sMgjMrZ
	F4lGLSVeWtZoL9EvaR1Lv9ln9f6UT7PrKHbX+7YWAGJwsyIwKXZLLd5WKZtpXh4UOZLYcxWrOju
	oUtRJ5HcZxpO7xPSwREtDSC5u6GIychnZaE6dGMAtYIdi+L3fx/D4AuQSTiHEji6mFcScCaeBuu
	ZpnixSsTgj+Sq0nde8xu18I6hCvs98WNoyYE9wzidNOVCbPgIkbfGCuifeAexVI3wBCh7QQDAzt
	cNz7WYPoAc0mK4cyeX5YASpsxYccrAs+0FJwUm7+U5wgaecoK3bNxlU2mHsvvaMueHxUL6Ne7JB
	plx8NddYiC+8r+mH/QzM1rIW8sXvK7zbyZVTxbCsrntZ7g/vLtECQWxT68Z6WAZBCk5XTdEAFjR
	jp4VDSx64Rzvpc4hxBhYecoRFQ8J
X-Received: by 2002:a05:6000:288c:b0:4b4:2ce4:6dc1 with SMTP id ffacd0b85a97d-4b42ce46e7cmr29398834f8f.44.1795781935043;
        Fri, 27 Nov 2026 04:18:55 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c4353d6sm45163333f8f.56.2026.11.27.04.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:18:54 -0800 (PST)
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
Subject: [PATCH v4 10/28] dmaengine: bcm2835: make address increment platform independent
Date: Fri, 27 Nov 2026 13:22:00 +0100
Message-ID: <20261127122236.4976-11-andrea.porta@suse.com>
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

Actually the criteria to increment source & destination address isn't
based on platform specific bits. It's just the DMA transfer direction which
is translated into the info bits. So introduce two new helper functions
and get the rid of these platform specifics.

Only the memory side of a transfer is incremented, as the peripherals are
accessed through a single FIFO register. DMA_DEV_TO_DEV is not supported
by the driver, so the helpers only consider the advertised directions.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 0ba23ec6b6fd..1fa7cbfe3c2d 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -275,6 +275,20 @@ static u32 bcm2835_dma_prepare_cb_extra(struct bcm2835_chan *c,
 	return result;
 }
 
+/*
+ * Only the memory side of a transfer gets incremented: the peripherals are
+ * accessed through a single FIFO register. DMA_DEV_TO_DEV is not supported.
+ */
+static inline bool need_src_incr(enum dma_transfer_direction direction)
+{
+	return direction == DMA_MEM_TO_MEM || direction == DMA_MEM_TO_DEV;
+}
+
+static inline bool need_dst_incr(enum dma_transfer_direction direction)
+{
+	return direction == DMA_MEM_TO_MEM || direction == DMA_DEV_TO_MEM;
+}
+
 static void bcm2835_dma_free_cb_chain(struct bcm2835_desc *desc)
 {
 	size_t i;
@@ -340,10 +354,8 @@ static void bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
  * @cyclic:         it is a cyclic transfer
  * @info:           the default info bits to apply per controlblock
  * @frames:         number of controlblocks to allocate
- * @src:            the src address to assign (if the S_INC bit is set
- *                  in @info, then it gets incremented)
- * @dst:            the dst address to assign (if the D_INC bit is set
- *                  in @info, then it gets incremented)
+ * @src:            the src address to assign
+ * @dst:            the dst address to assign
  * @buf_len:        the full buffer length (may also be 0)
  * @period_len:     the period length when to apply @finalextrainfo
  *                  in addition to the last transfer
@@ -415,9 +427,9 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 			d->cb_list[frame - 1].cb->next = cb_entry->paddr;
 
 		/* update src and dst and length */
-		if (src && (info & BCM2835_DMA_S_INC))
+		if (src && need_src_incr(direction))
 			src += control_block->length;
-		if (dst && (info & BCM2835_DMA_D_INC))
+		if (dst && need_dst_incr(direction))
 			dst += control_block->length;
 
 		/* Length of total transfer */
-- 
2.51.0

