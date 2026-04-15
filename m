Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA34529D273;
	Wed, 15 Apr 2026 13:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776259500; cv=none; b=BjmfupEJYeZZC7JDXhuZOw2NYUVtj4GMsXbBamdKBC+A1auWx8IVmqxTRX+xbJcN++snTfclZ+ffuPYazXZ3K/gmyYQ8Q8UUKU8KjgHya+5T9KtrQSEsnEY/7PaB/Dyssp6N2l+RCSjcG7d7uX7P8ug89SdRKhwtgSQ1Ib7X7F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776259500; c=relaxed/simple;
	bh=p3Q8OPxWBRNozsKniiDQNpOAQssvD2IzUq7fPlRHVDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z2W+cNKUAixXhfRN/yXG7qIRceRGUtB19VloP2A6XEdCsspP3/4kazS0lJ9O8446l5I5x/7Tjx/hsyx2v+TF1M4SsG58WaHHG5yW0MTcojQLwTbBlVp5n+lOYFuF0mp4ArG4e6UnO7l1ytHG56QMaIU45MMEDW77J0vGSD+zbq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=WpLooBIP; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="WpLooBIP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=w8pdPkFA73XTg2PtoUkvQ2osaCILVqY0fxMWCh0K1ZM=; b=WpLooBIPa/vGr/k+RWTDU1hEr3
	zKjQk2sXhPPEe581UYB+SvwOlDSMQxcDCa7ZzmPLh3Lv7yr33oVKotaNevQw8aBtwTJH2k7R6ahu4
	T9tpcERVcVGcTV+kgHA4Ze0yQWC/9SCi1H+NzWgMHOCKe+TKoEzbMcLBgvcIS6sRQqKk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wD0EQ-00GAkw-Pm; Wed, 15 Apr 2026 15:24:38 +0200
Date: Wed, 15 Apr 2026 15:24:38 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "P.K. Lee" <pkleequanta@gmail.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Jason-Hsu@quantatw.com, p.k.lee@quantatw.com
Subject: Re: [PATCH v12 2/2] arm: dts: aspeed: ventura: add Meta Ventura BMC
Message-ID: <621a477e-4fae-4824-a59a-bc2d65198b65@lunn.ch>
References: <20260226055521.1655243-1-pkleequanta@gmail.com>
 <20260226055521.1655243-3-pkleequanta@gmail.com>
 <258747f4-9da5-44da-8eb9-24f8a8cbff3a@lunn.ch>
 <CAK8yEODCyYxkggU+7=xzWFcXP6RMTpNbHyYRHZhahX7=b6reqA@mail.gmail.com>
 <435616b8-8d4c-4814-8f21-d667755473f1@lunn.ch>
 <CAK8yEOAYC0iApNHBApt+xu1Fz=+N1wX0XrLGOPzmeRq=OjWnhg@mail.gmail.com>
 <e7a1588d-b4d4-4aa7-ba94-da3e2591d49c@lunn.ch>
 <CAK8yEOAOhY25R5qt82LUkGifg_9HLia24-E=WxoEwCdbft1eMg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8yEOAOhY25R5qt82LUkGifg_9HLia24-E=WxoEwCdbft1eMg@mail.gmail.com>

On Wed, Apr 15, 2026 at 06:05:32PM +0800, P.K. Lee wrote:
> > > > > > If there are no devices on the bus, why enable it?
> > > > >
> > > > > We intentionally enable it so user-space tools can access the switch
> > > > > registers. I have added a comment in v13 to clarify this.
> > > >
> > > > Why would user space want to access the switch registers for an
> > > > unmanaged switch? It sounds like you are using Marvells SDK in
> > > > userspace to manage the switch, rather than using DSA.
> > > >
> > >
> > > We do have a custom user-space daemon that configures the switch
> > > registers for our specific use case. Should I remove the &mdio0 node
> > > if it is only enabled and has no other configuration in the upstream
> > > device tree?
> >
> > Please just be truthful that you have a user space driver, so need the
> > bus enabled.
> >
> > I also guess you have some other kernel code that allows you to
> > actually use the bus from user space? The typical ethernet IOCTL
> > handler does not work for you, since you don't have an ethernet device
> > using this bus. Such code is unlikely to be accepted into mainline. We
> > don't like user space drivers when there is a perfectly good kernel
> > driver for this switch.
> 
> Since the kernel driver for mv88e6xxx in kernel 6.6 used by this
> project does not support LED control, and this feature is only
> available starting from kernel 6.13, I had to initialize the LEDs of
> the 88E6393X from user space.
> 
> In this case, should I remove the &mdio0 node?

I would keep it, and add a comment why it is there. And upgrade the
kernel to 6.18, or backport the LED code.

     Andrew
