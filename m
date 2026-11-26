Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703079;
	b=mLXgmoe3sutXVoc/CHfmXIX+0kxKKS1g3w2DBAwTR5YSv4X4HHs8lz+Tp/HRN3k+HIJi
	 em3JR0UsW0fDuxQtZTsRC3SxPmjRIwxdVg2nQcN7ZN8alkh2LdaLcAqod+nHfiKer6ukN
	 CNkugJVvovrTIc5dqFvRIYsQHl/OdyRdyLRI0Mz3KVZ9FnENBZLNZGLYRox7j5Rkj+TOF
	 E3x1tjihbCGeXHcsNB1oHMvhM9mIT6EK35OLEdKdI5yS9Mc5OTrt6tf1F5VwRUoF0FBcf
	 0DdbzdcgxDtmZF8JIVyuHF6QMTQqfRxzHiZESMAODuQHN6qVr9koYeSE21kb91Aobng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703079;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=OHrC46cIWChCBmJPkyR2Sr/R2tdqnLfv5l1cfknsL0s=;
	b=WplDrNT5xLMzhRlsJDFoGBX0KGEE9oXc0sq43WeONkjiKYLQPpl8olwpckmM6yV9iXlK
	 kvS1k6rbbZP343Z2kRpgV+f8qZFT2wspRqlaOxqZFs3swRJ60+fCBSOzwmN01AMKMWX3T
	 mBQcMU6j3ncwyAE+GifQpesHytcHlig2o8lRcjnYbOzoSTl5Bucrg34Tkr3WHMUKw7WXu
	 T/pcTUvFZWm3I0GsLNgxkKDiVmJpbqqAaHWqSQq4FLlb9wNIOmUgT6ca55xgWhBQULHQO
	 x8ONGXMcbMfABooduLtb7VvZY8nRwu7kCDugVrrCaoiXuy4fqtAgjDdhnSvbA+3l30A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Y9IePDbQ;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDBB606A321
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CDBB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Y9IePDbQ
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-498f5fa5103so4217190f8f.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795703077; x=1796307877; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OHrC46cIWChCBmJPkyR2Sr/R2tdqnLfv5l1cfknsL0s=;
        b=Y9IePDbQYBGAkTYC0UHzY0Ah22gBklCybCgN+2CP0TmoVzaQZEcUDck8ROwN3qZW10
         BUyKC9hPyddCf8J9QcIBzdHVTNC0f238CW2OjgElb5lwGbF0hbmWyJ0Lglc+rP8oVaoY
         SqyBBY3RudJZHO+opBNWuKse+7RQofX7isIY+R5+ASa0f3e/7kzGa6bUA6KVe7CBx8PA
         XFE0CYFbb75jRu2VS2xEKwS96T9FRb79/jmeTXxkijja6HeWozniJBaMTKsCNOtExekd
         l4mKGaLzKTHI3hSiGKA11FxzTRI60c/1bU6CsrmubRPXRnOg37jW1uA/rnQITqlULocA
         CNQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703077; x=1796307877;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OHrC46cIWChCBmJPkyR2Sr/R2tdqnLfv5l1cfknsL0s=;
        b=dtUEmHsaZpXJTto3TDa0bF8ukqsOIT5iZnfANeXPO8Jedy1h4ogANZEEo6GbWjUHmJ
         MH62n3pJqapbkBHCiMKqZInCTh60wJEFAApjvRcHVmPFSMELjnVmyqgcYhocL7io6ntc
         klemgqIF4hZcJunbklKYxeu4bqGYi625Fr66l4M7zW4reHyJPHUC3D3fhiQPfFP/jSJE
         M8maHluVpfqpCc/zr7OV9Sqx2AqMrqhaRd5zl0fxTjJ5Vr/tNl3jBo5cGo9g8Cu/4jQ3
         6CeY0kLUuyByIUXaKlyWjlUYyKz2W+PRJ2PloxcPtgRt80ptjc+V8L4bTOWmqIpgN5yn
         gPzw==
X-Forwarded-Encrypted: i=1; AL+hErHtqrhVPd0QEK5nCZSWrXampJVyBDoJ++995tDu45dgZRpoapeNfh8KFrMBqTO3dE6hMhlrcUyPEEGK@vger.kernel.org
X-Gm-Message-State: APuU4Z/w7/Vp23rfaZwElYm7YJSno4ZeoNM3xuJiWAtlSf60czNwn8tb
	v3rU7lVTMGKnQuT5D7bHAmGhcOXzIpGmWw1QjlPdQPjab8nh6JSuwWeQEDfXNoLadTU=
X-Gm-Gg: AZFdTZfykhyPA6TwP8HuTQUIY2GjY2kNNsSrBrXMjzQegJc/yTPpBCP1eSrPOjzEVDN
	6FddhD/RX7Ux5Y5UunA4h//KDEX9og15O353ZFyWYloj4chYd7tUTtKqyssfqt9ppvJMnFmnTq8
	162OC5Blo6dIxVn2NxKjCFIPIEfIXnrvyuznHBe7Ct+UmvDxImLaExn0dpTgrWIyi7aAsyGDOYa
	MOufPFV8aXnAtjce84AlaOdd24+iX7nPpTyyWj21i7rpVL/oAkNCXugo+65MUZCo/2oF5VpaZyh
	FoGeGu3h0XV6hJuRlU54cF8zc7Xo3mF46uYwLxa9lQAVoy3dnxNcjB946CglII8EJnGVljQWO2s
	20UkC8ZQ1m5r+zQ8oz6PgEYFbiCoqUfldy6j9UaVg61ZyBU2rUcpsmyt5OU5IuAFaqlS3VJoR0/
	4uEeydmvX+fqUcp/zgoGwIE+NOK7Zb3p0kWXvYqOHoYmSpwsYSF/IGlEwcXD4llcope05fDX8Jn
	cTwlY2ML28cNmXuRJOYWZup88qaqtRyMzVkdh/GSAsCUc0X5Mu0yrQAIXsvsljP0zNcY813BmCR
	LAe5X+fWKnouN+3rPVOOyXRKoeaJou1xEn/sSWhADt7w4c/ouA==
X-Received: by 2002:a05:6000:4008:b0:4b6:8c1:bc3d with SMTP id ffacd0b85a97d-4b608c1bc69mr17794667f8f.57.1795703077525;
        Thu, 26 Nov 2026 06:24:37 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm41189410f8f.41.2026.11.26.06.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:24:37 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 26 Nov 2026 15:28:36 +0100
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 02/28] dmaengine: bcm2835: Add support for per-channel
 flags
Message-ID: <awhCFGZ8f6f4h5Ku@apocalypse>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-3-andrea.porta@suse.com>
 <awXjgCtgR5wtadnb@lizhi-Precision-Tower-5810>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awXjgCtgR5wtadnb@lizhi-Precision-Tower-5810>

Hi Frank,

On 14:20 Tue 24 Nov     , Frank Li wrote:
> On Mon, Nov 23, 2026 at 03:56:40PM +0100, Andrea della Porta wrote:
> > From: Phil Elwell <phil@raspberrypi.org>
> >
> > Add the ability to interpret the high bits of the dreq specifier as
> > flags to be included in the DMA_CS register. The motivation for this
> > change is the ability to set the DISDEBUG flag for SD card transfers
> > to avoid corruption when using the VPU debugger.
> >
> > Signed-off-by: Phil Elwell <phil@raspberrypi.org>
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  drivers/dma/bcm2835-dma.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> > index b19182c6e3df..690f5ba1c439 100644
> > --- a/drivers/dma/bcm2835-dma.c
> > +++ b/drivers/dma/bcm2835-dma.c
> > @@ -137,6 +137,10 @@ struct bcm2835_desc {
> >  #define BCM2835_DMA_S_DREQ	BIT(10) /* enable SREQ for source */
> >  #define BCM2835_DMA_S_IGNORE	BIT(11) /* ignore source reads - read 0 */
> >  #define BCM2835_DMA_BURST_LENGTH(x) (((x) & 15) << 12)
> > +#define BCM2835_DMA_CS_FLAGS(x) ((x) & (BCM2835_DMA_PRIORITY(15) | \
> > +				      BCM2835_DMA_PANIC_PRIORITY(15) | \
> > +				      BCM2835_DMA_WAIT_FOR_WRITES | \
> 
> Your commit message said "ability to set the DISDEBUG flag", why need
> other flags here?
>

Right, the commit message was incomplete. Besides DISDEBUG, the flags carry
the AXI priority and panic priority, used by the BCM2712 HDMI audio channels
in patch 28 to keep the FIFO fed, and the wait for outstanding writes.
They have the same layout as the CS register fields, so they only need masking.
I've reworded the commit message in v4.

Thanks,
Andrea
 
> Frank
> 
> > +				      BCM2835_DMA_DIS_DEBUG))
> >  #define BCM2835_DMA_PER_MAP(x)	(((x) & 31) << 16) /* REQ source */
> >  #define BCM2835_DMA_WAIT(x)	(((x) & 31) << 21) /* add DMA-wait cycles */
> >  #define BCM2835_DMA_NO_WIDE_BURSTS BIT(26) /* no 2 beat write bursts */
> > @@ -433,7 +437,8 @@ static void bcm2835_dma_start_desc(struct bcm2835_chan *c)
> >  	c->desc = to_bcm2835_dma_desc(&vd->tx);
> >
> >  	writel(c->desc->cb_list[0].paddr, c->chan_base + BCM2835_DMA_ADDR);
> > -	writel(BCM2835_DMA_ACTIVE, c->chan_base + BCM2835_DMA_CS);
> > +	writel(BCM2835_DMA_ACTIVE | BCM2835_DMA_CS_FLAGS(c->dreq),
> > +	       c->chan_base + BCM2835_DMA_CS);
> >  }
> >
> >  static irqreturn_t bcm2835_dma_callback(int irq, void *data)
> > @@ -460,7 +465,8 @@ static irqreturn_t bcm2835_dma_callback(int irq, void *data)
> >  	 * if this IRQ handler is threaded.) If the channel is finished, it
> >  	 * will remain idle despite the ACTIVE flag being set.
> >  	 */
> > -	writel(BCM2835_DMA_INT | BCM2835_DMA_ACTIVE,
> > +	writel(BCM2835_DMA_INT | BCM2835_DMA_ACTIVE |
> > +	       BCM2835_DMA_CS_FLAGS(c->dreq),
> >  	       c->chan_base + BCM2835_DMA_CS);
> >
> >  	d = c->desc;
> > --
> > 2.51.0
> >
