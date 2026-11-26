Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703957;
	b=spbCgD6o8de+yDuwju7f/aDYyOLz1EYExJHj2QMun1YI6HHfhlGbRG/SXOXMICGgrxk5
	 PhiVXuyF+tqZoCNfIKPQjf7P+Rdpdki6pdI3Y9TeN7hYBj90ExbZLmktYIVxN3XN7Pfo/
	 6y6bmAw7Qsy96NjWfkUqnO8Gv2SB8GntgR8ameGvgZ91b2xq5dS2tdjE6V9ApoNBEOmnb
	 zORtxyU8FLGV1sC7Bdymy6y9D5YB56MY1msFPe5IBFfApKjAXsH1RiCutIa2lh0sArACv
	 pwt2/ivv/ZzlvUKE7j+CZ+kwmlTymEnYZIX0xxwMfGENpyuIHS4KLNugpUDuOrjpOgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=NpCp8gTUV7b7urT+XT+vwa1wDWyVOE1SIMBZubybyy8=;
	b=ExAWB8j02M1n8dMKB9h7pVzvqe6MaCWv9IHuUOPAU8Gd6WQWk/NaJhetd45HPa+9GFeD
	 f9VI4Uaqy3flvXEy9vTQekDQxpLct+FYg8RbWQzTLHDDBcpYq6o5d+OAFbw5i0E44rU6V
	 qEKavqGqj2CWiagUKr0pbwDbbbUUi2El/O9LDtPiwYrau2wTZS8mbsPM5g+eHLJdkW8Za
	 KBM22zUBSmwp1qXI00hXfEWVbRjCrFDh62o97t9o391/pWXrFVs5K5x0nxW25HyhpHdU+
	 KaJb0Hb1iTYISqPmd1LixQwz6uBcDAz7np8+RW45dwV/IwJRx88BbuZXzJaHt37oT+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="DxDZK/jy";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528F2606A332
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 528F2606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DxDZK/jy
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso70719535e9.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795703955; x=1796308755; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NpCp8gTUV7b7urT+XT+vwa1wDWyVOE1SIMBZubybyy8=;
        b=DxDZK/jyi9VtiHb0cvgE58g9Zl0do5MkmhZxfg9HKejt3c1xlfARiOTzb7plD1PB4N
         amkbczFI1s1d78cXWITqNkqIm5d8kK0LSLher2MRfjuYpCSUQ0hZRsAOfLh+6XJJrPdS
         RVHW2e6bPkr0P4HwLVdE5v/bmwylFwFMy0mvSggD6kGWaD6jtQf3LbVdfZA/kzMv9r/y
         pBRm1NvnFydhwmd8MZowSVVqGse/OwP9R2OOg9GE2TH/N5UZnlG9w0inDe6z5y73XXWz
         tTU6LbmXcWw6yR8h4ER69y3B9fvsoWBoY8XnMrRAicRb+c7BPiwcl+5RbjYsj54NVRQn
         JH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703955; x=1796308755;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NpCp8gTUV7b7urT+XT+vwa1wDWyVOE1SIMBZubybyy8=;
        b=qHazbTICcLqXis70S1iCGrla6+vetHuytI0qrlHTji4N0XaHtdiJr2KB2EjbHi3S0p
         F7GIDbMQQ/psw5R33d69j93ptwMUmSvEezw2k6MdTR3x75pFq2A1K9RVevNmho/ICi4l
         ptZia3BTARYHYp8K98x8hK5iBrC6MMXkYU8kEH4ewbpsVaMY4NpU4/aaavIAnqf0ynAz
         h2NvKYQvDRU6rAcHuihyPBg/whodUJn6mm1XAiqVOl1z7b2RupErIJksnIkBrcfKf3lO
         a/hblM+vHs3QVAbom6UbFlmig/sx29M928AI+cgrudmLiwEdh6TEm+QEV4HRZp093lxB
         tDKQ==
X-Forwarded-Encrypted: i=1; AL+hErHKgeFg5VrCgNmbJxvq/FLwAnQPqkSbj14xGUlPAgGru51SnDIVcZdcPnHkQm0S+EhopX8Jpoj/8yc1@vger.kernel.org
X-Gm-Message-State: APuU4Z92hAo5m3NAOv+ASzF4qIqAtNArZdUP1Qjc5NSZYNihqctqWfin
	5H4WwqeL7dTcKmdjYSRwAGmXY2orudaiG56aJiDKIFcGaqFPCqJh9Cju2k4Zj8VSBCo=
X-Gm-Gg: AZFdTZcOmjtDHe0uzKMxpLnpXEK7+BHn0a17OKAP1+iA6CyBYNCmonYZc4Ff7SOOZIR
	3HC2gL+OstQ3B0Z09v8Ote4TXAReLGFWEGhk1eE/1umg4TtVBbUPY4RPRqCyKOglDU5P0irqb/P
	vbgaiPpoO6JoQe27wwi2bt6t0+la12nYgG01cCCSgf2gBC3/3AcLFrn4k9R5TUB3swDtQOv6WCC
	XnhLQc2O42ArDtVJl9Kq5K31E5lxFyX2i4SyvOQ1V/xIpywa8+rtbMIZaGJ8z7WXW3Iq3/GuoGg
	0EDF5pc5Fuyao80G9mom9FhpV85SiGplmZ7YgQlE1RdDr8eVg/RhvlRbOMSDY4qNE91Y6CbyrXQ
	5+BWtcA27BfiFI9okGFGEcvUFmQ/k3WkE3cO5CZsLJMsehUbVRSwNi8g9womPsxTstCnIrFqRH8
	6snkI64yF7YTE61LN4HY7LIYe49fTpKttAOfgd07ytFwebnsMbq0WbJAWLiv/Ark0RMEE8uSXCY
	v7KGusCajB6pUf5T8dF2uD62Kpl0dWUryukmjAXc2vb8WTT3OExMNNxNwSs8ng56ZDiJuNHKT02
	kNWmZzvEfFSNz1ihRXAJjH5Z3GLo
X-Received: by 2002:a05:600c:154c:b0:4bb:6a78:7c42 with SMTP id 5b1f17b1804b1-4bb887c3428mr428700785e9.1.1795703954785;
        Thu, 26 Nov 2026 06:39:14 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm712460975e9.11.2026.11.26.06.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:39:14 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 26 Nov 2026 15:43:14 +0100
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
Subject: Re: [PATCH v3 07/28] dmaengine: bcm2835: Support common
 dma-channel-mask
Message-ID: <awhFghuBMy8IzMSs@apocalypse>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-8-andrea.porta@suse.com>
 <awXoAqQhSWa95FH9@lizhi-Precision-Tower-5810>
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
In-Reply-To: <awXoAqQhSWa95FH9@lizhi-Precision-Tower-5810>

Hi Frank,

On 14:39 Tue 24 Nov     , Frank Li wrote:
> On Mon, Nov 23, 2026 at 03:56:45PM +0100, Andrea della Porta wrote:
> > Nowadays there is a generic property for dma-channel-mask in the DMA
> > controller binding. So prefer this one instead of the old vendor specific
> > one. Print a warning in case the old one is used. Btw use the result of
> > of_property_read_u32() as return code in error case.
> >
> > Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  drivers/dma/bcm2835-dma.c | 19 +++++++++++++------
> >  1 file changed, 13 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> > index 51e3a40dbaec..1087157fb242 100644
> > --- a/drivers/dma/bcm2835-dma.c
> > +++ b/drivers/dma/bcm2835-dma.c
> > @@ -991,12 +991,19 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
> >  	}
> >
> >  	/* Request DMA channel mask from device tree */
> > -	if (of_property_read_u32(pdev->dev.of_node,
> > -				 "brcm,dma-channel-mask",
> > -				 &chans_available)) {
> > -		dev_err(&pdev->dev, "Failed to get channel mask\n");
> > -		rc = -EINVAL;
> > -		goto err_no_dma;
> > +	rc = of_property_read_u32(pdev->dev.of_node, "dma-channel-mask",
> > +				  &chans_available);
> > +
> > +	if (rc) {
> > +		/* Try deprecated property */
> > +		if (of_property_read_u32(pdev->dev.of_node,
> > +					 "brcm,dma-channel-mask",
> > +					 &chans_available)) {
> > +			dev_err(&pdev->dev, "Failed to get channel mask\n");
> > +			goto err_no_dma;
> > +		}
> > +
> > +		dev_warn(&pdev->dev, "Please update DT blob\n");
> 
> "Please update DT by replace brcm,dma-channel-mask with dma-channel-mask\n"

Ack.

Cheers,
Andrea

> 
> Frank
> >  	}
> >
> >  	/* get irqs for each channel that we support */
> > --
> > 2.51.0
> >
