Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703380;
	b=H2x3eOTHk3rWdPXtsxainY4zVvpvUY4y9RXp+PDCKboJJhxdNFZfebyKXESAiASiLXw5
	 SytmpaUq4BZ+ZtPqSsuqgZ9U4N76rx+2Wxh/Ul4ZOq5+o61Hcg/ZawGnEhTJezwj71fCJ
	 9wP0hCMSuu0kS7LPxVYMFDM3DbPC6O9tuufsHatQ9JGAQzjNTmoBxYiMcktd5XUdfX+M3
	 bw1dZ4+6qLHwblxHLGqo1ph08kc/8XAL7F20TP1SMNrM5E0zZm7RN2yZfgvFsLzpFnXln
	 6pk572ei1a3Kqr5yKJUEOJ0z3SJgIzJAvEz7CpCrCn+p7ueH73BFxbm6e6Hc3dM0qHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Go0TMbxFIn6Uh64J5GWsZj276nuCgaJAlCWObxr0QGU=;
	b=DADJQfnV4Orgt3TdJwAftyVrNDD/qSwZkFdReR7hkihTs4dERQCcAz9qIdh09EyHMkSn
	 PtVBN/7l/XH0vrD5lEFNZQAocLFtIR0I4spwZoUyEopjckFKII3UhkSsepzprnrz2WcLj
	 XWljX7Xp3nAWMWxCqvAyk4PfMSuRAopnZVBBBAjocUMrPzDIf7bzhI/FewF2/vOuuMwE1
	 sqJovEYdOvZeV8MrpkVkzUf66hpiMUNn8ONOEjoU1AWkd1XHv/OFxv6N6aVomjG7T9n4i
	 w+oEsxnGEkHK3wPSnhyihawZjffRH6j4iz9509uaJG1r7R6fSL9GY2XoIGj4qQPOmwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Pxj5aToy;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7F0606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F7F0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Pxj5aToy
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so59366145e9.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795703377; x=1796308177; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Go0TMbxFIn6Uh64J5GWsZj276nuCgaJAlCWObxr0QGU=;
        b=Pxj5aToyp5zuyslVpU32TLw31Yz1JmqJCNehyB9UtgFts7ql+nnycG9J6q0lsbhSsP
         clym1pTOgpVt8qUXmCVR5mi0IgHAs6C4YnDr0rlCZ8mnJFDMLP8hFrrJbrBNJrGYjOam
         EcKk7wFteJmcNzTI/HaIoQrJq8adsEJ8RdcezFqcfmrIAUTsP8Doao4AwcMhHY7WxHqJ
         rVhbakdJjBHok1eivCk3Ie85UoiolkddoINOJ4OUnfkpFXd1trx4E6ZEFEfAdv1vKGpI
         mG0CWOS6vxI5b23AaXLHFEix2fJ2Ja07mMn85uigHbVDfOq++0Gfoj+FbG3R6Y09gxNK
         9w3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703378; x=1796308178;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Go0TMbxFIn6Uh64J5GWsZj276nuCgaJAlCWObxr0QGU=;
        b=aRhFckefskI7my+F06yuwNwGUAzoj7FtTg16KhP5MsETIE9XvpuCcwpcezeFAZKRLz
         B8YC94/DtvPM29vekvK6oDbFqRuhLzKcIvSIpZyyEfN2Eq/5eEnmzyCR3OMBuudClVyV
         8AVx/pJ0H9KYt+f3Qzst40lUtoz2PW8GBjyUUhsT5xv6PovBLRmziJJ7TZMllIxCQT4Z
         9onHf0w8xeq/HnuITC397fuJ8hOSr+CgixLEJqmI3JcqEe52go7aSRcA/o70aYdY3Gri
         AC+I8rbL/w76jM4bPNWD35xsS1zn/ClLUTE9mE1s1trisDDCIwaLm63PKckBdYBOMRV1
         cWeg==
X-Forwarded-Encrypted: i=1; AL+hErHVklUKTRGmRF7SstfeCKdG+1ubNck0vMLKk4huZ0o4rATCiT7nbuP96AiNIsZAwkazXtUPhQKWgv27@vger.kernel.org
X-Gm-Message-State: APuU4Z8ThZyn9ODaYx0u6YIcSwUf0c1VB04+jxPklarILyjCtsnh2H6q
	Rq2H/j0AHQs0Yzi/tMn4i0nzy0unCgo8YCkLk5ARYiXrLPkIhii/KpcGK3MsSj/DCac=
X-Gm-Gg: AZFdTZeCVwaa7gzTko27Q+BH9wroDr3BJjJV1Oeb1afsNyuyG2G268o2nAekCBfzoth
	THczLODHe7Ya7locHoRF+WGLp5N75gZspcswO/cZ8IyswIrmvvvWR1vPFWpjiHNaGfrRRHsDdI0
	c5Ix8BUsPEDELD0h1hQTNYpWyxr0lGEYJYCfggNsRsCI4AF7KLR5j+WZgIEVn4FR6rneeiWVQTw
	x0iw5B+qSXOuXLmpzC67oSjST9wgEPOCFEmXb/r8434N73lT3O+mr30aaM6CqjNZooghU6SELBP
	QRFgNp1Tnk6X+qtXzeWkKwFISIhDFEOursETmzwW6YKBa8pFRkUSksuh6qeo2IsFH29okcglJzf
	z0AO7WRasDguh4KyMYCZwHzKnx9p/fgj9Ft/x+weNnsWsI9j9N4V4QWob6E+hTkEgzHdAtWxTfW
	B1jCgS36Zu/KpS9XU0Km/JXHJLBE/04wAiLRA19vBgBP+VImo0ga1CZjTDfLfC69a4OYT/+0z4P
	o+twwOFGlxGO2QaFkRSIOH7m+cTK5NQdNot2NOwjeNKtqowcDNnZSykeHxmlFbJkRPNpfAgELjJ
	LMihkyv4HZz9sTuigrNgz56JEFmr
X-Received: by 2002:a05:600c:a085:b0:4a5:26b8:4507 with SMTP id 5b1f17b1804b1-4bb8881e6c6mr419119205e9.21.1795703377520;
        Thu, 26 Nov 2026 06:29:37 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906e4ce6sm365232415e9.4.2026.11.26.06.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:29:37 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 26 Nov 2026 15:33:37 +0100
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
Subject: Re: [PATCH v3 03/28] dmaengine: bcm2835: Add NO_WAIT_RESP,
 DMA_WIDE_SOURCE and DMA_WIDE_DEST flag
Message-ID: <awhDQbBKe0vLWbdr@apocalypse>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-4-andrea.porta@suse.com>
 <awXlR5RAVl8XMVxA@lizhi-Precision-Tower-5810>
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
In-Reply-To: <awXlR5RAVl8XMVxA@lizhi-Precision-Tower-5810>

Hi Frank,

On 14:28 Tue 24 Nov     , Frank Li wrote:
> On Mon, Nov 23, 2026 at 03:56:41PM +0100, Andrea della Porta wrote:
> > From: Phil Elwell <phil@raspberrypi.com>
> >
> > Use bit 27 of the dreq value (the second cell of the DT DMA descriptor)
> > to request that the WAIT_RESP bit is not set.
> >
> > Use (reserved) bits 24 and 25 of the dreq value
> > (the second cell of the DT DMA descriptor) to request
> > that wide source reads or wide dest writes are required
> >
> > Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> > Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> > Co-developed-by: Andrea della Porta <andrea.porta@suse.com>
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  drivers/dma/bcm2835-dma.c | 25 +++++++++++++++++++++----
> >  1 file changed, 21 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> > index 690f5ba1c439..118ba2f71dc8 100644
> > --- a/drivers/dma/bcm2835-dma.c
> > +++ b/drivers/dma/bcm2835-dma.c
> > @@ -145,6 +145,21 @@ struct bcm2835_desc {
> >  #define BCM2835_DMA_WAIT(x)	(((x) & 31) << 21) /* add DMA-wait cycles */
> >  #define BCM2835_DMA_NO_WIDE_BURSTS BIT(26) /* no 2 beat write bursts */
> >
> > +/* A fake bit to request that the driver doesn't set the WAIT_RESP bit. */
> > +#define BCM2835_DMA_NO_WAIT_RESP BIT(27)
> > +#define WAIT_RESP(x) (((x) & BCM2835_DMA_NO_WAIT_RESP) ? \
> > +		      0 : BCM2835_DMA_WAIT_RESP)
> > +
> 
> why need recorder these information at in hardware control block if it
> is reserved by hardware?

These bits are never written to the control block: they live in the upper bits of
the DREQ cell of the DT specifier and the driver translates them into the S_WIDTH/
D_WIDTH/WAIT_RESP bits of TI. *_PER_MAP() masks the DREQ to 5 bits, so nothing leaks
into the hardware.
v4 will move the definitions to a dt-bindings header and adds a comment to make
this clear.

Regards,
Andrea

> 
> Frank
> 
> > +/* A fake bit to request that the driver requires wide reads */
> > +#define BCM2835_DMA_WIDE_SOURCE BIT(24)
> > +#define WIDE_SOURCE(x) (((x) & BCM2835_DMA_WIDE_SOURCE) ? \
> > +		      BCM2835_DMA_S_WIDTH : 0)
> > +
> > +/* A fake bit to request that the driver requires wide writes */
> > +#define BCM2835_DMA_WIDE_DEST BIT(25)
> > +#define WIDE_DEST(x) (((x) & BCM2835_DMA_WIDE_DEST) ? \
> > +		      BCM2835_DMA_D_WIDTH : 0)
> > +
> >  /* debug register bits */
> >  #define BCM2835_DMA_DEBUG_LAST_NOT_SET_ERR	BIT(0)
> >  #define BCM2835_DMA_DEBUG_FIFO_ERR		BIT(1)
> > @@ -605,8 +620,9 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
> >  {
> >  	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
> >  	struct bcm2835_desc *d;
> > -	u32 info = BCM2835_DMA_D_INC | BCM2835_DMA_S_INC;
> > -	u32 extra = BCM2835_DMA_INT_EN | BCM2835_DMA_WAIT_RESP;
> > +	u32 info = BCM2835_DMA_D_INC | BCM2835_DMA_S_INC |
> > +		   WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) | WIDE_DEST(c->dreq);
> > +	u32 extra = BCM2835_DMA_INT_EN;
> >  	size_t max_len = bcm2835_dma_max_frame_length(c);
> >  	size_t frames;
> >
> > @@ -636,7 +652,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
> >  	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
> >  	struct bcm2835_desc *d;
> >  	dma_addr_t src = 0, dst = 0;
> > -	u32 info = BCM2835_DMA_WAIT_RESP;
> > +	u32 info = WAIT_RESP(c->dreq) |
> > +		   WIDE_SOURCE(c->dreq) | WIDE_DEST(c->dreq);
> >  	u32 extra = BCM2835_DMA_INT_EN;
> >  	size_t frames;
> >
> > @@ -688,7 +705,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
> >  	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
> >  	struct bcm2835_desc *d;
> >  	dma_addr_t src, dst;
> > -	u32 info = BCM2835_DMA_WAIT_RESP;
> > +	u32 info = WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) | WIDE_DEST(c->dreq);
> >  	u32 extra = 0;
> >  	size_t max_len = bcm2835_dma_max_frame_length(c);
> >  	size_t frames;
> > --
> > 2.51.0
> >
