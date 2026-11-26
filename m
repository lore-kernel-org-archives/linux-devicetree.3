Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702920;
	b=T8f4Q0a1NPNic8HumsGO6S7clXpmkTEp+MSFdEDBHjporHV8CfIMVBD2J4QxGU0GeY2l
	 TayUFTEDs3atYsCmsl9owHfi/j8e+Ns5yym0s65elYhEFFyL0/s9B6Fj+UtSJPhNduNx6
	 foks5ZBc8xCCasUmgYIZDxrqdmWVo/OIsWwy6nHddds+bbuEEAzIENVFcxDs8Ss0CDIYs
	 DERCFs1mFAGpUprWqqwZXrTFKwkaOXsaqgN/GTtJGpmFkSPa0WOp0ntCWaRLZewqOnU1A
	 pjRgunOcfgu8YQFPWjwdD/LwCGo/4VC65Kvglzw0WvccEKHss9AHMFF4b+qJiOBGOFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=3qO+cKDCyoLTk5ZwPdAZ2/NZCnSWYAmAoadmXtEy00E=;
	b=cSsgH0CPvxbEvkziRbn/nNXnNRYkIbB9y1PdGq9R+599XojrZY5c1f7hlxGWVCjtokPn
	 1KhxkGmbO8lzb8fu8AJLGxQG+YozvjLwROT+8Al8n0xDLRLUFRyoQqMNXOt33hYPPCjiU
	 xnlSD114zw8qvIHpRhS0BUxe+Xs1NmQsAA+FXni/rB1D86n8GL2Ooi6R2QeKpGc7RKnCu
	 unDug0b4ze9glKCD9p+2xCM4whAtQiT77rf1hNnrkTlzFyg7WGmB4hsrOPMI/bErw0i7J
	 S1nGgBBfsbfDwSjGLGbI/MvN0dqW9+HqGV6glwLq3C0AQqBwMcS5jN2vGt77SzY9/qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PbsRhuus;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0DD606A336
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:21:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C0DD606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PbsRhuus
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4b467581b98so68817605e9.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795702918; x=1796307718; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3qO+cKDCyoLTk5ZwPdAZ2/NZCnSWYAmAoadmXtEy00E=;
        b=PbsRhuussMyQu1C9Z87U0zbKtI5UnEuDaxErAUa7VDsBHDhsXOGybk0MseNYgdS0WG
         3mp9KsvAeOdmhlcSsViIJgXJKbQB3ng+oNlNAGniIZcJmQMLwT2Pz3Brzw9BwMwInfSH
         1y4zlblZhDKwtkNoqvX0eFpvBJehVvQtpFK84rpdkG85M8YXQRzpnc66czzHFMN7eUWx
         /8yPAzE9EgmntLslEXnXJryayLZGqTOwnPL+BDXjTvUDgk5/y6h48xMO0FMYOAlmClxT
         hFmII7Gavou1Aaa9OnAnucLeaCSoGPc65bYTx41ZC2EB9wQ6IReFIy4vkWncwgl1ztL8
         Mltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702918; x=1796307718;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3qO+cKDCyoLTk5ZwPdAZ2/NZCnSWYAmAoadmXtEy00E=;
        b=gjYa8h3fvXtfs7eveF8+mzblVhgYzvFi4Q2bgxQKUJ2R8koRNd2Zy4yxZHHD/9L8Uw
         vzF7HMtd5KtTgo/U9xhIM8DyY75xtqVp3WwNyv5YON8+nfotDuAKvZJWy8VvX9jUbgGj
         ZTXDDuRDq22Qdyzyv0cZ6eMFNdbiLwULr2LiyC+iW7W4J94qzsB3Fy2WvFeszaXpb0cy
         Jnsl8k+tFoxpmd0e6RkcDUFKN/wNfYTArwffwFCytjg6/+VFL25bzhwlao0PQFZJjiLN
         hRgxPaoVI7oyNnks5fgVgKd73F+NTViET8b/U9jK7uGyWka9xneoh1m1dtlD2u3sBgEw
         Eadg==
X-Forwarded-Encrypted: i=1; AL+hErHA/rMC+zxxMdY1Vw28kCj7mHV6fndi/IIhY+21uLY5F5XNhMh43s25iG+Z6Z+z3b9rDT0sfUtOVKEg@vger.kernel.org
X-Gm-Message-State: APuU4Z9nd74LPhxftfbueRZb1rAMRB5UPtqOgBTApI6gj9XC5zUdPQKy
	2J3a/SdBw4pOnzEJiexCRamIvAayWf7mTrQzjXl5SlqgK4m0COgB8Lb/71yqnrIIF/U=
X-Gm-Gg: AZFdTZdKSS/pHNs++Lcz/ONOQb+DTMXxmRaYafMN7/iTvxBjAn/4yh29TmviCp8B9na
	qLXx7RHzqoWcuQboWVk/e7rr8ZF44IF95iz73SZHV0lSIkgdcV8/P9qTX6DibqSPm+NLYxusqnA
	mUnMyunIb30ORA1wy+G6ClYX2XhpQ6hwY6ZxXRQ9yhSazTRDBH5II5OsGK2s2MB88OocS1JWtNX
	fN90TMETnqmGZh6qRT4LF28Mz9DVpElXddyJZ3KKhYTBHGFyKw9yhZXDgbjO61dS6A+GPK8lzlU
	h5h8JHNCpY/ozmSgAzgBB78iU/s7UbUwFDrPurOu/EAedNWYJZezy2YxLeo0La/h62zuLWGXSG8
	h7bO1H1pEsotK9DwMtZ08ol8Lmkf4UEfr3e5pbrtCRxWunDNxjlscGgBIQKxSCDZJ2LPBir2Shz
	mywzd+nDbvJqrx56H+QL9mOqTiXJ7wGx6t+c21yEGy0j3oJ2PZJrXxTLPZ8HFwkT+2MLfrCNFMM
	2E2cnq3h+8ys24emKarmLXrMsoPX9BI4qZ+RMvkGAeQjBNcGtPN/LE3s8d4BAyAiaH7QQbHwUTe
	hTFpEFfMiY1lHQYG4wwXrMUE8ZLj
X-Received: by 2002:a05:600c:a08b:b0:4bb:6651:9eda with SMTP id 5b1f17b1804b1-4bb88922ca4mr401901655e9.14.1795702917688;
        Thu, 26 Nov 2026 06:21:57 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm831228715e9.13.2026.11.26.06.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:21:57 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 26 Nov 2026 15:25:56 +0100
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
Subject: Re: [PATCH v3 01/28] dmaengine: bcm2835: Fix coding style issues and
 a typo
Message-ID: <awhBdHDVnmxNhQOM@apocalypse>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-2-andrea.porta@suse.com>
 <awXhjjB_9-N7RRBi@lizhi-Precision-Tower-5810>
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
In-Reply-To: <awXhjjB_9-N7RRBi@lizhi-Precision-Tower-5810>

Hi Frank,

On 14:12 Tue 24 Nov     , Frank Li wrote:
> On Mon, Nov 23, 2026 at 03:56:39PM +0100, Andrea della Porta wrote:
> > Fix the coding style issues reported by checkpatch: use u32 instead of
> > uint32_t, add the missing parentheses around macro arguments, which
> > could lead to operator precedence issues, drop superfluous parentheses
> > and long int, and align the function arguments. Also fix a typo in a
> > comment ('missmatch').
> >
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  drivers/dma/bcm2835-dma.c | 83 ++++++++++++++++++++-------------------
> >  1 file changed, 42 insertions(+), 41 deletions(-)
> >
> > diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> > index 06d830d36882..b19182c6e3df 100644
> > --- a/drivers/dma/bcm2835-dma.c
> > +++ b/drivers/dma/bcm2835-dma.c
> > @@ -51,13 +51,13 @@ struct bcm2835_dmadev {
> >  };
> >
> >  struct bcm2835_dma_cb {
> > -	uint32_t info;
> > -	uint32_t src;
> > -	uint32_t dst;
> > -	uint32_t length;
> > -	uint32_t stride;
> > -	uint32_t next;
> > -	uint32_t pad[2];
> > +	u32 info;
> > +	u32 src;
> > +	u32 dst;
> > +	u32 length;
> > +	u32 stride;
> > +	u32 next;
> > +	u32 pad[2];
> >  };
> >
> >  struct bcm2835_cb_entry {
> > @@ -116,8 +116,8 @@ struct bcm2835_desc {
> >  					       * AXI-write to ack
> >  					       */
> >  #define BCM2835_DMA_ERR		BIT(8)
> > -#define BCM2835_DMA_PRIORITY(x) ((x & 15) << 16) /* AXI priority */
> > -#define BCM2835_DMA_PANIC_PRIORITY(x) ((x & 15) << 20) /* panic priority */
> > +#define BCM2835_DMA_PRIORITY(x) (((x) & 15) << 16) /* AXI priority */
> > +#define BCM2835_DMA_PANIC_PRIORITY(x) (((x) & 15) << 20) /* panic priority */
> >  /* current value of TI.BCM2835_DMA_WAIT_RESP */
> >  #define BCM2835_DMA_WAIT_FOR_WRITES BIT(28)
> >  #define BCM2835_DMA_DIS_DEBUG	BIT(29) /* disable debug pause signal */
> > @@ -136,9 +136,9 @@ struct bcm2835_desc {
> >  #define BCM2835_DMA_S_WIDTH	BIT(9) /* 128bit writes if set */
> >  #define BCM2835_DMA_S_DREQ	BIT(10) /* enable SREQ for source */
> >  #define BCM2835_DMA_S_IGNORE	BIT(11) /* ignore source reads - read 0 */
> > -#define BCM2835_DMA_BURST_LENGTH(x) ((x & 15) << 12)
> > -#define BCM2835_DMA_PER_MAP(x)	((x & 31) << 16) /* REQ source */
> > -#define BCM2835_DMA_WAIT(x)	((x & 31) << 21) /* add DMA-wait cycles */
> > +#define BCM2835_DMA_BURST_LENGTH(x) (((x) & 15) << 12)
> > +#define BCM2835_DMA_PER_MAP(x)	(((x) & 31) << 16) /* REQ source */
> > +#define BCM2835_DMA_WAIT(x)	(((x) & 31) << 21) /* add DMA-wait cycles */
> 
> You touch these code, can you shift to use FIELD_PREP() macro ?

Done in v4: the register field macros now use FIELD_PREP.

Many thanks,
Andrea

> 
> Frank
