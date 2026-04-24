Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E610935DA77
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 08:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777021130; cv=none; b=QfpRKR8hbNU1E+sDyJl2RQ/VW3A6I56Rfa/0DQqMKAXdi1i1YupMrC5pJFn2ZehhZXODclpVSTj73dLzlzsIz/HSgfIy+tMEKO6E+mdhpmLNxh6XVJBzltAervIRSm3OaVFOlsNZCMyaqVP/iUG2b4r3G91IltZFAWk3JC+/88E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777021130; c=relaxed/simple;
	bh=sZYJR4j7YT/ilJC6eLQiVd2XnfG0DbLHqN8CF7NpW3A=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hCmL4k62JgnCvRDAnhC8LbTVtAG6/lF7+PEpGNiML/R/D7sS4WcKGwCLuI4bPv+6GXiMmqlphd1yLA48ucLzRu5Lj6epV7CMQ8CmrEYsRnjU9BZeyISmTZd6GBc9aNXiqY1HdcNjOAXsdbQsyyUZvFGBzSg7eh7OKkJ+ggjjNhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yeea2HXe; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yeea2HXe"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43d70c30767so4929197f8f.0
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 01:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777021126; x=1777625926; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mHTpcysjvEEWS5SCY/OAqYlcWcxfCpMildoVnj/KeDo=;
        b=Yeea2HXegP/UjlYEAIZvXEpnx3WoMOoc6jJsGgClCRQD5HhoxQJnt84oCUONeQ0wj6
         e5g9EJTN7xfcjRZpaYToZbDyegjUVHs5yg04v2olEP1/Fs6Ztw2VkO5UfsBbwoiHNWHC
         AhPLxYLLN8AUudr1M9GTUU/h63fVABWhakuaHgEXeFK5pTzyUPbETcgiK1I1HKgEpTdR
         J+iNuiF8XTBrU5DXS2JfiIKaBRYJYa3SiJfqr0MvDqsmFKvSgaXWdB8CkA1M5F3L+NpW
         YehDWWMgJ1euPcU3pQVhWariDEi5fcYpxtGo+CSfQ/Uo5bA5rMIYaOX21Y2nT7IPtBFE
         3zKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777021126; x=1777625926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mHTpcysjvEEWS5SCY/OAqYlcWcxfCpMildoVnj/KeDo=;
        b=Eehxg9zQmRqXXfvvHUXvduRjyQQUb5zhgWWJYLRqvRCFqWYS/J0EUDBd4poBNdsi3m
         nzgUo+ihPPrBDFBusgkZJwDv08Z6/Wnw993QCowScL7Yz71WKgkcXKWQGmOGfwJ0gOkO
         Kg4ExMgJFmaXfkpIpIrnwozKAq7SdxWtwxeT0sun2icYgJ8+zwWto3NxDSNAaPzTicH5
         NCRCKulQpAplukP2z1jg6+NhEkCe9fZH9eIz50vmB+P7Kwf3H4PExVCHac52iSKWLcGj
         RqZ+e/ZuH6JCnOFG8Ek6B1f9jZHoE6AlIxwQ3RzAoExpACsYho00ZC0CVydz+djvMhvt
         IDHA==
X-Forwarded-Encrypted: i=1; AFNElJ/o0efVKMTAbWtFLv4nfTqWfa83CSYiv+/eSE87HmlUuoRh7iGQKoMCw0CMZJmMcC1TwhHhWG2H1/Zh@vger.kernel.org
X-Gm-Message-State: AOJu0Yz58E/WxuzOQdo3OBANffs6NbkvtRrTLLz6YlSintNPxyF7GNoS
	5SWtclhCMs64E5T8Zl4PPu9YH2cdn5lhduFi8Dsvi1EDWwx4ooHiWMFi
X-Gm-Gg: AeBDietdb0Ok8Dy35yiIN41JdYyZM8tHcUPRsMZp8porlQFGnN6PL0bwAAcDWn55n5a
	BGpp2FNnIWoOCvv+xba2MzCzSdg1CGIS3l6CTY3+4YnmVkHqNFXVTf0Q0XAY8w0Cz8t4r6jSIZe
	PvVciVn7ZKu6QQmfYkm6Q2ZtEs9WA+vZO7nRdXbd0slUmsoDrBB2v+xCvq37CWBxnh081q8qtBy
	QEZynTM/r8B0RbGlRHICQVIK1VI7v0u8do1aXYgRRfiqaOxYViJC+6/XnkikEGJ3cMAvR/SecaO
	qLwp7VqHmNOQmWzhXzS8K+Z+AH7s8YeTHjfNC9oGrHXXZ0sFqekPESFRTgLmEWd2W8FK+kopxX1
	Se9S0RD3CkQz1aM90di7RqavLSYT6efRStAmg5UdeEUduyqjHJkmzmIoHgg5Novgz6Tw+MyqBs6
	Ty+0tBTZnTG6SqVUsdrma4/lx+/aSUCy9ToAkZxvixv4d0AwaiaNsmXZVFlZYMvDlpop66oGWDO
	/O8jP+hvtCFjJmHdmyiIh+nggKwAm+RNpURaMqPNf7NDUo8yuEpDpTr1tYIiA==
X-Received: by 2002:a05:600c:b96:b0:48a:5339:a46 with SMTP id 5b1f17b1804b1-48a53390f6cmr232014255e9.9.1777021126073;
        Fri, 24 Apr 2026 01:58:46 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1c773fsm655407835e9.12.2026.04.24.01.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 01:58:45 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Fri, 24 Apr 2026 09:58:39 +0100
To: Jonathan Cameron <jic23@kernel.org>, 
	Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: rodrigo.alencar@analog.com, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Michael Auchter <michael.auchter@ni.com>, linux-hardening@vger.kernel.org, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 20/22] iio: dac: ad5686: implement new sync() op for the
 spi bus
Message-ID: <umhebqm7nwcg6h5y77egrh7nirtpjpin5t42oxifo5em4jmsyj@gavxnwsadyuh>
References: <20260422-ad5313r-iio-support-v1-0-ed7dca001d1b@analog.com>
 <20260422-ad5313r-iio-support-v1-20-ed7dca001d1b@analog.com>
 <20260423191833.0de9fb8c@jic23-huawei>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423191833.0de9fb8c@jic23-huawei>

On 26/04/23 07:18PM, Jonathan Cameron wrote:
> On Wed, 22 Apr 2026 15:45:54 +0100
> Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:
> 
> > From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > 
> > Use of local SPI bus data to manage a collection of SPI transfers and
> > flush them to the SPI platform driver with the sync() operation. This
> > allows for faster handling of multiple channel DAC writes, avoiding kernel
> > overhead per spi_sync() call, which will be helpful when enabling
> > triggered buffer support.
> > 
> > Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
> Interesting approach to potentially optimise for SPI.  Do you have
> perf numbers or similar to support it being worth the effort?

Short answer is no, I can try to produce some benchmarks, but I am not sure it
is needed. The implementation here prepares the ground for triggered buffer support,
which adds the capability of implementing a control loop in userspace that updates
all the enabled channels at once. That will happen in a trigger handler, then we want
that to be as fast as possible, so it can be prepared for the next trigger event.
It is not really about calling a function once rather than multiple times, but the
problem happens when the device is sharing the spi bus with other devices and how busy the
system is in general, so there may be context switches in the spi platform driver with
one or two mutex acquire/release operations, which may add bigger delays between
transfers, which depends on what the other devices are doing. I suppose that devices with
high channel count like 8 or 16 can benefit with this.

> Otherwise a few minor comments inline.

...

> > @@ -84,8 +107,18 @@ static int ad5686_spi_read(struct ad5686_state *st, u8 addr)
> >  				      AD5686_ADDR(addr));
> >  	st->data[1].d32 = cpu_to_be32(AD5686_CMD(AD5686_CMD_NOOP));
> >  
> > -	ret = spi_sync_transfer(spi, t, ARRAY_SIZE(t));
> > -	if (ret < 0)
> > +	xfer[0].tx_buf = &st->data[0].d8[1];
> > +	xfer[0].len = 3;
> > +	xfer[0].cs_change = 1;
> > +	xfer[1].tx_buf = &st->data[1].d8[1];
> > +	xfer[1].rx_buf = &st->data[2].d8[1];
> > +	xfer[1].len = 3;
> > +	xfer[1].cs_change = 0;
> > +
> > +	spi_message_init_with_transfers(&bus_data->msg, xfer, 2);
> 
> Why not carry on using spi_sync_transfer() here?
> We'll end up with an spi message the stack but I suspect that's
> not a significant performance cost.

True, it would be around 200 extra bytes in the stack, and read operations
would not happen concurrently with writes, so why not reuse resources
(message and transfer structs) that is now available in the bus data?
To me, it allows for consistency in this implementation. 

> > +
> > +	ret = spi_sync(spi, &bus_data->msg);
> > +	if (ret)
> >  		return ret;
> >  
> >  	return be32_to_cpu(st->data[2].d32);

-- 
Kind regards,

Rodrigo Alencar
