Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703800;
	b=0zy3KvJ7Qi3urZyATAtPhqa+xXbpLxtlZaEGHAgsRyqudecPjZT7VjksfevZ3bf5oenl
	 biu8A/jvbKIQ0gtSeUNRpnDHD5L+/aAjXgjdfriVIWd23fMHvwHDI93V5jXmTSxmKZNKS
	 POS33jvQ6dTsxftSbwzGzF/0YM5kEVCUYAeX4KvZx5VjlOzfyLEhKc4tvCJ5V3MDgYz1e
	 Y09qsienY+ydqfhJBD8dvZ+SibiMloNfSAeaH8H96I0lBJtJg3t7NNWRDDs9so0Q/3hZX
	 v5bu9aGizuE019Z4xIdHlpzSqiLw+zoL18S7xT9XY6BV3LqrNqKZXiv6zjF5ZVg7ycQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=SrVpOL/vsmOkgEFx/8WAFupqNXkkubNUnl9sC+8oIJ0=;
	b=K9RUOsW45L5qGAnHpXJ3n44peY2PEguA9slvhKMh22BJ+PQNbBXYitYSgB+NAjjz5gWR
	 0v2Cg/HxS3rAjXEvSP0QqVpNlQh0+Mq3XOg6zfx2KXT0NNjgzWZxLY9JPK8zJOeyqdjTS
	 5xUAbS9XArye4RrU0mIybxCWFxnZyS52mYjJFSL2YzTbNzIITkW2XY4gTIIuzBKGyz8eM
	 dt6JXWo05nWqmX7HbIeBuO0HdT/J6KvoJubSTl1onRpxvdLXDbrWgYBdzDlL7PYf4zYM7
	 y6hWerwPcKRvrfcIOhLNiCBjEr3UeehiHKHWXSCm196PuY9ymBspiv695DGRwuG2lOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Ll2ieohY;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B32606A336
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41B32606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Ll2ieohY
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso4431601f8f.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795703798; x=1796308598; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SrVpOL/vsmOkgEFx/8WAFupqNXkkubNUnl9sC+8oIJ0=;
        b=Ll2ieohYwEjw7jYZgh40Vz+Dj2ApGO1hxH6w3r/29uiXkJYbBTcAIsBesXHIn7ePkq
         xbuUjZCJ/CdRZRURtPdlnoCCArqL9rbtybBnuXrGZ1nG7yDkkwebZ3moyLYzL72AS7/K
         8X/G32FRmLn0nTFc+qJrt8PdEh5Y6fDSavg3DIV7yVRtjOJnwUeTeZlapDDM7Bfu6N1m
         NCwIAjod+GRMVQhgQa979MbaL8LE27wT6xjmJpzF/5I5tAUR9enFlDEAiJHCJtyn05Tr
         H1+10eQJ4RwwdNCfB3QOwEL8AM/B49mBU1CleRPeohoyoYwlTcIv6d2sp02q6o+N8deI
         niNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703798; x=1796308598;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SrVpOL/vsmOkgEFx/8WAFupqNXkkubNUnl9sC+8oIJ0=;
        b=WykAkgEdl7aRAj/qwGXDG1BSUOvquvwL8/eZ7HcSAkAMWPopBd31CPtwOl5e/ojIqY
         MjhFhzRqsqrxgTln+n22EFbB5qr9upK+UFOVYlSJuWSXQ1XH9BrrVgnkyiuYGcvJkmM7
         35XA7nki3dEa+Azuz5/qUCgGkO1B8xZlxLovxwpVhK+QcmfX3Uchto/NAgMxY5pk6706
         i5+igwyB5MRKTy8qNI1HCnpQbNuvsKTYGiSIn+2z7iWV3JhNTCyU2SN1fQTDzUvtYRHe
         clQQcRR5ejJ7ds4hexM7ELqAKcAo+rSNCLIgV9d3OUREmLXrXIWvLNW91UjURi+jtaAR
         xh9g==
X-Forwarded-Encrypted: i=1; AL+hErHLZrDsLaZY60OOEqk/cH44KgnZ8yqCzV4qqVFN/nbEazrgg85jMQ5JUpB6jlWm908lTNveltRXDKaQ@vger.kernel.org
X-Gm-Message-State: APuU4Z+zOU9zlkB3TGDWussZ4nMtqJSRFSj/U4AjSLsvrOZ1kkyfMFWH
	ZeV93MDXw3piXImKOeAVbQoIjm7o4XCXcBNTTDKmkHBTg+jqPsX/ezldNQkLEAOBVVQ=
X-Gm-Gg: AZFdTZeeNIyOEbWhOUKwjkY44ivrP9mMiv0x1Yn0rMav7MKZLuO0WQiDkayXIB8rwAU
	YLbLRT0vssMCAXkp2+j1CotdTzWuhsnTkdZ7c1QWjciTsg+hELy48rQZ+9ojRxNZ/dFxNG8Axlx
	52gmZRKzHP0dh9I1yVn3nTH2qvXdD8EixFBbOEUtAeSLW9IwHpBSZbHGpyrSvEx31Hi/fPBbFp9
	oLeGBsG4Dr2L9txZBfOMwgoFopP/4Hrds+n7Z8T0EvbBxEfCz9n9qX9OuIhfHGpzVlMLkBAr1TC
	hsuCrDSH+4KMwyH2eC9IH4NVtbFa7PzqHmAbClWT1a2HfkTcOIB4/K/8RSK8UJ0482j2IrDCNmM
	V6H5caWWDJQa1IY0tvE69ZDECYHF+0CUEsZDVAKm6fXvDh5d0z80eUnNFusSC6XyryMn7rHul6o
	QK7dtTnHf2O+BjSHQrPpkNU8DChvyrEgv7P/CoExVApxO0WXUiZmdcDOI5YqkiUJKTmuUkoSRHy
	eOeIyWpt72Ts3r6bRndQ8jocKVNolZJ40FrLg4GiP1gTJCu1hFR+NGcVDTTVnBJEmp20Ne/Y8P6
	X3ZSJM6kQG2UuaR/M/L2w3TWawjf
X-Received: by 2002:a05:600c:1548:b0:4bb:7347:d5df with SMTP id 5b1f17b1804b1-4bb88814405mr445502155e9.13.1795703798534;
        Thu, 26 Nov 2026 06:36:38 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm340799515e9.0.2026.11.26.06.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:36:38 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 26 Nov 2026 15:40:37 +0100
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
Subject: Re: [PATCH v3 05/28] dmaengine: bcm2835: Fixes for dma_abort
Message-ID: <awhE5UEnOtrXWX5l@apocalypse>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-6-andrea.porta@suse.com>
 <awXmrhJ4HToyCxOD@lizhi-Precision-Tower-5810>
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
In-Reply-To: <awXmrhJ4HToyCxOD@lizhi-Precision-Tower-5810>

Hi Frank,

On 14:34 Tue 24 Nov     , Frank Li wrote:
> On Mon, Nov 23, 2026 at 03:56:43PM +0100, Andrea della Porta wrote:
> > From: Dom Cobley <popcornmix@gmail.com>
> >
> > There is a problem with the current abort scheme
> > when dma is blocked on a DREQ which prevents halting.
> >
> > This is triggered by SPI driver which aborts dma
> > in this state and so leads to a halt timeout.
> >
> > We attempt to abort the channel, which will work
> > if there is no blocked DREQ.
> 
> use imperative mood descript the problem
> 
> >
> > It it times out, we can assume there is no AXI
> > transfer in progress and reset anyway.
> >
> > The length of the timeout is observed at ~20us.
> 
> wrap at 75 char
> 
> >
> > Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  drivers/dma/bcm2835-dma.c | 32 +++++++++++++++++++++++---------
> >  1 file changed, 23 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> > index 063e1b2aabe3..51e3a40dbaec 100644
> > --- a/drivers/dma/bcm2835-dma.c
> > +++ b/drivers/dma/bcm2835-dma.c
> > @@ -419,7 +419,7 @@ static void bcm2835_dma_fill_cb_chain_with_sg(
> >  static void bcm2835_dma_abort(struct bcm2835_chan *c)
> >  {
> >  	void __iomem *chan_base = c->chan_base;
> > -	long timeout = 10000;
> > +	long timeout = 100;
> >
> >  	/*
> >  	 * A zero control block address means the channel is idle.
> > @@ -428,19 +428,33 @@ static void bcm2835_dma_abort(struct bcm2835_chan *c)
> >  	if (!readl(chan_base + BCM2835_DMA_ADDR))
> >  		return;
> >
> > -	/* Write 0 to the active bit - Pause the DMA */
> > -	writel(0, chan_base + BCM2835_DMA_CS);
> > +	/* We need to clear the next DMA block pending */
> > +	writel(0, chan_base + BCM2835_DMA_NEXTCB);
> > +
> > +	/* Abort the DMA, which needs to be enabled to complete */
> > +	writel(readl(chan_base + BCM2835_DMA_CS) | BCM2835_DMA_ABORT | BCM2835_DMA_ACTIVE,
> > +	       chan_base + BCM2835_DMA_CS);
> >
> > -	/* Wait for any current AXI transfer to complete */
> > -	while ((readl(chan_base + BCM2835_DMA_CS) &
> > -		BCM2835_DMA_WAITING_FOR_WRITES) && --timeout)
> > +	/* wait for DMA to be aborted */
> > +	while ((readl(chan_base + BCM2835_DMA_CS) & BCM2835_DMA_ABORT) && --timeout)
> >  		cpu_relax();
> 
> use read_poll_timeout()
> 
> Frank
> >
> > -	/* Peripheral might be stuck and fail to signal AXI write responses */
> > -	if (!timeout)
> > +	/* Write 0 to the active bit - Pause the DMA */
> > +	writel(readl(chan_base + BCM2835_DMA_CS) & ~BCM2835_DMA_ACTIVE,
> > +	       chan_base + BCM2835_DMA_CS);
> > +
> > +	/*
> > +	 * Peripheral might be stuck and fail to complete
> > +	 * This is expected when dreqs are enabled but not asserted
> > +	 * so only report error in non dreq case
> > +	 */
> > +	if (!timeout && !(readl(chan_base + BCM2835_DMA_TI) &
> > +	   (BCM2835_DMA_S_DREQ | BCM2835_DMA_D_DREQ)))
> >  		dev_err(c->vc.chan.device->dev,
> > -			"failed to complete outstanding writes\n");
> > +			"failed to complete pause on dma %d (CS:%08x)\n", c->ch,
> > +			readl(chan_base + BCM2835_DMA_CS));
> >
> > +	/* Set CS back to default state and reset the DMA */
> >  	writel(BCM2835_DMA_RESET, chan_base + BCM2835_DMA_CS);
> >  }
> >

I'll drop this patch in v4. As sashiko pointed out, it brings back the
NEXTCONBK/ABORT sequence that commit 9e528c799d17 ("dmaengine: bcm2835:
Fix abort of transactions") replaced after finding experimentally that
it does not abort the control block.
It is also not needed for the 40-bit channels, which have their own abort
sequence.

Regards,
Andrea

> > --
> > 2.51.0
> >
