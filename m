Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D242AF1D;
	Mon, 30 Mar 2026 07:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774854234; cv=none; b=F70Tl3NlaP6FOFAb9kZm9QbGCIFNfCbEcAR0pa2wsOg4UnuMa5LiDLUkeTyv0ORZPaPvwUaO87UTDUjvEgNC6xkaPUNH+uIsxkKCfOFBrfLxwTS+vdf6yUvd/s0/fXrdKec8J/iT3QsA2h0Ts+8/KQRQAIed/vICta3RufIbFFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774854234; c=relaxed/simple;
	bh=j5G7KFL+OfgOav/zrR6D0r6RgS/ZvxB//tT9mRIKmQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BHiYG0/jYk8/4IxJqT6b954U281gF3WLFpfTyDe7HeWmtMJIz5OsJKnGDXnu6SSJHGS/NL2WVzOuzUiWpbhVf0t1BzD1IFLCFthxj6H5ABgU59AK822OxWvE3n2lSDPTTUyMWssQZ731JqcM4PLLAvToGEPv7CRoh2wuSF5wINM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Y/ekhXRr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Y/ekhXRr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D948AC4CEF7;
	Mon, 30 Mar 2026 07:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774854234;
	bh=j5G7KFL+OfgOav/zrR6D0r6RgS/ZvxB//tT9mRIKmQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y/ekhXRrsgRgFFORT7Jo++GwWGhg8T5KXpXFfM0EaxdcquZLN9ffa9fMlEEykvl1H
	 1fCw+gZulfPD0RCZm+nuKN1Bds7Fxmx3XjhNQv+sPjrlzO3Lzi22BeHqEQI737/Cp/
	 m2PGovvWNEp3UKXlU5pX655pz6nj2vY1s5Afiq60=
Date: Mon, 30 Mar 2026 09:03:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: rahul sharma <r-sharma3@ti.com>
Cc: peda@axentia.se, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, vigneshr@ti.com,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC uL PATCH 2/2] mux-controller: ti: add driver for event mux
 router
Message-ID: <2026033026-shuffling-kisser-ac6c@gregkh>
References: <20260313060437.3704592-1-r-sharma3@ti.com>
 <20260313060437.3704592-3-r-sharma3@ti.com>
 <5ba0d92e-7f2f-423a-8d1c-561c350c1db3@ti.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ba0d92e-7f2f-423a-8d1c-561c350c1db3@ti.com>

On Mon, Mar 30, 2026 at 11:02:11AM +0530, rahul sharma wrote:
> CC: Greg Kroah-Hartman
> 
> Hi Greg,
> 
> Could you please review this patch(2nd one in the series). It seems Peter is
> not online for almost a month.

But I am not the mux maintainer, so I am probably not the best one to
review it :(

One instant comment though:

> On 13/03/26 11:34, Rahul Sharma wrote:
> > The driver supports event muxing routers like gpio mux router and timesync
> > router. This driver is adaptation of original reg-mux driver, along with
> > changes specific to support TI's mux router.
> > 
> > The idle states this driver supports are only 2 which active(represented
> > by 1 in dt-node) and in-active(represented by 0 in dt-node).
> > 
> > Signed-off-by: Rahul Sharma <r-sharma3@ti.com>
> > ---
> >   drivers/mux/Kconfig           |  15 +++
> >   drivers/mux/Makefile          |   2 +
> >   drivers/mux/ti-k3-event-mux.c | 235 ++++++++++++++++++++++++++++++++++
> >   3 files changed, 252 insertions(+)
> >   create mode 100644 drivers/mux/ti-k3-event-mux.c
> > 
> > diff --git a/drivers/mux/Kconfig b/drivers/mux/Kconfig
> > index c68132e38138..ad3af2724d28 100644
> > --- a/drivers/mux/Kconfig
> > +++ b/drivers/mux/Kconfig
> > @@ -59,4 +59,19 @@ config MUX_MMIO
> >   	  To compile the driver as a module, choose M here: the module will
> >   	  be called mux-mmio.
> > +config MUX_TI_K3_EVENT_ROUTER
> > +	tristate "TI Event Mux Router using MMIO registers"
> > +	depends on OF && (REGMAP_MMIO || COMPILE_TEST)
> > +	help
> > +	  This is extension of MMIO mux for  timesync router and gpiomux
> > +	  routers on TI K3 SoCs. This driver supports the 3-field format for
> > +	  mux control: <register-offset mask value>.
> > +
> > +	  The driver allows configuration of hardware mux routers using
> > +	  memory-mapped registers. It's based on the mmio-mux driver but
> > +	  supports the extended 3-field format for more precise control.
> > +
> > +	  To compile the driver as a module, choose M here: the module will
> > +	  be called mux-ti-k3-event.
> > +

Don't you need a blank line before your new config option?

thanks,

greg k-h
