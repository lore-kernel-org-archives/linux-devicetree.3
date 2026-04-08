Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653512580CF;
	Wed,  8 Apr 2026 12:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775651695; cv=none; b=J6PWvZDZHWXcNDDHT/YnlZ0Tig6pKfbjNTq5P0cZR0QxtvDnxlZZat7yDE6XS1WdkDlk52csR4E1UwpUThuvWmwxuYK/ang4M6DQ3rUBSK+p7qYaDfez1cd8VtSpsHUN2Yjzm0U/qQtYp3+ISbvGgLwYeEZm5PDUj1DOReiJD7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775651695; c=relaxed/simple;
	bh=Kyc5NxVH0WeLVVmUX89Z30zpKeom45j8buLxrk+JudA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X8Jr1J62eBq8/vzAlKhfLy2iQltjtyRTp1sv1p57TvQprHf+rk+XRZzSZ75Nyf3CEC0NbMrHinmZ2YR2oQjBIxUIZr1QHXSMIFlLX6A0WUDuNTp9XonPmYtk40oCI9tRyteK/4CmXD5/skG3a9tamSP0+/dZ18vhNw7GCj3c71U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=lUcQs91s; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="lUcQs91s"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=UZm0OMiCYQ+7g0KMOOJaEeMtCB1NoXIae3H5HwDH82U=; b=lUcQs91sIVusfR1u89Stz05ODI
	AMhxret+/edGus9rBRyTcLUGXHf1+j7vips6AbSB6HSPe9HBw1p0HiJ6vLRsEXaM20P3nzGqQFLn7
	Efio5MaldMKsoTnJqx0IzS6klKtDGHTB874frDoDMPk7FfEAj85BYwcWdzltEDxPDzEM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wAS7A-00FHkV-QP; Wed, 08 Apr 2026 14:34:36 +0200
Date: Wed, 8 Apr 2026 14:34:36 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "P.K. Lee" <pkleequanta@gmail.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Jason-Hsu@quantatw.com, p.k.lee@quantatw.com
Subject: Re: [PATCH v12 2/2] arm: dts: aspeed: ventura: add Meta Ventura BMC
Message-ID: <e7a1588d-b4d4-4aa7-ba94-da3e2591d49c@lunn.ch>
References: <20260226055521.1655243-1-pkleequanta@gmail.com>
 <20260226055521.1655243-3-pkleequanta@gmail.com>
 <258747f4-9da5-44da-8eb9-24f8a8cbff3a@lunn.ch>
 <CAK8yEODCyYxkggU+7=xzWFcXP6RMTpNbHyYRHZhahX7=b6reqA@mail.gmail.com>
 <435616b8-8d4c-4814-8f21-d667755473f1@lunn.ch>
 <CAK8yEOAYC0iApNHBApt+xu1Fz=+N1wX0XrLGOPzmeRq=OjWnhg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8yEOAYC0iApNHBApt+xu1Fz=+N1wX0XrLGOPzmeRq=OjWnhg@mail.gmail.com>

> > > > If there are no devices on the bus, why enable it?
> > >
> > > We intentionally enable it so user-space tools can access the switch
> > > registers. I have added a comment in v13 to clarify this.
> >
> > Why would user space want to access the switch registers for an
> > unmanaged switch? It sounds like you are using Marvells SDK in
> > userspace to manage the switch, rather than using DSA.
> >
> 
> We do have a custom user-space daemon that configures the switch
> registers for our specific use case. Should I remove the &mdio0 node
> if it is only enabled and has no other configuration in the upstream
> device tree?

Please just be truthful that you have a user space driver, so need the
bus enabled.

I also guess you have some other kernel code that allows you to
actually use the bus from user space? The typical ethernet IOCTL
handler does not work for you, since you don't have an ethernet device
using this bus. Such code is unlikely to be accepted into mainline. We
don't like user space drivers when there is a perfectly good kernel
driver for this switch.

	Andrew
