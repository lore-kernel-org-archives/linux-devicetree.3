Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FF230EF8F
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 13:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781877418; cv=none; b=Ga3JGCCbja/vNBuLVGA+e/Zp+SCMCdIk7I+BMb496xDfpgzyNSi9eIZyQu6ywA1lLLJevut6UgpeW0GyUOI32+c5LIlILMgI9RZKZknwTGUpa5zrXhbWdba6NEPiLLESrVXXGjRpfKMXW+qVgHLz9qXu8axP2Zv1P4+KIAvLTsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781877418; c=relaxed/simple;
	bh=Dq6TI8YSnjK4mhlS1koPWrY34aRB57Gm9MvuCf/uXZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DURJVxuPXm7l7BTSSknYBgIRLkFM1Uq5Cd2zBPaHx2CLuI1KSO4cnR2YIy8eEubEnSLPBKy7PPmJmy/UaxK92LmEpdawahEzqUEw3ou1ek5kjE/pMcz0NhE40qM8hlEafj8mkm0/Vh2shTnU4LXVmxX3hlykZnqPPhMhBiZP5As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wx+h5WRa; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wx+h5WRa"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-91574384cc2so246634085a.2
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 06:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781877415; x=1782482215; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iw3X4PKFr5GriGrArjFKfUuzUNJUeelMwfVvciorDKw=;
        b=Wx+h5WRaRXJG2OtlQ6y0HDPSCXYcNk+WvyKAs0anjOtwAe+LQymmhqF+ZIgxcWSFPJ
         br4b1RACaGjv8KEawU63tYknKH9/tiDIdvCAKiMLCwYxfMEz4g/2kQTLeRVZkTYf9X7m
         D3Mc9mDqPy6JXNk/h1aFhIjMA5a+yksoMcH2uPx0QTgCwQH4n8MNcG+WKUolkaKLgVfC
         SB4Ag41CmHO7G6QMKnZlGU237ua4VY4vArSlPdLICMvuJtkiGYqi7NCUp64u1C9Kxv2o
         WHcXBFJ6HtdIPZcQrxWZrfi6ANL5QfFobd7dHqWBH2IbE9Vu3vWz3+MuG6nEO0pcg4Ff
         b2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781877415; x=1782482215;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iw3X4PKFr5GriGrArjFKfUuzUNJUeelMwfVvciorDKw=;
        b=obztj+h1zQsR9HWU1altoujMLsW4GOiEHs9IPoK1nXko+WE/jHLQ9yAwl/BsDSErci
         NCUH9KXoPmlHArXfuke3I9bmyYhXyHTmDarMFRR0ZW+3+2saIXy+gCPx4rTKlMjMFw2Z
         K1Y0znsUlVRACJKQGyR4UJe98sKpMuSgtaTd9v9v80r6ErqIabQibjND1SNMcjWIpEV6
         NvLqrCBMBMxIGOkyWYqSIjttmK4Zhy24k9pwTmeKxyNB0TbhanCtMKNZu59Wy1RjK8G+
         TwtMplyd2eMrarf4M7uBOgEvi5+9xF0dE9S/NoXw6FJm9HW9ILLVrgE39Z6BpaxjXunb
         IErQ==
X-Forwarded-Encrypted: i=1; AFNElJ9uF3J4axoXBEJC3oJZol8UkhK+Q5nZHTxBRRjdocDcvMxlM8T81VNEmWhLGtVnIasVu++vo2Dijbk1@vger.kernel.org
X-Gm-Message-State: AOJu0YzUEheDsbcU7w0c+9j9V2v0QjtEib+suosqHiZ+bqq8PLenJ0gg
	cgaIEe9cy8Tx/EeVYF+/I09u5lcZFPI4lvlmwVFD5mlf7PCu/GbUQRJZ
X-Gm-Gg: AfdE7cnu4u3QvAHdBokmKcqzV8EQ2B/ErJ5Uf5xUgCd+dZLsNfaWGoo4w9K6qtB0G95
	2GKcgYOUauhigoR2GNBfLrKWDa8Wf3aFOh2pCa8K1oX+2F8QDN1tsLlfv4OeYRUewwixqgzT7CO
	5p+OdZ/zl251tQyGSlvqVeiHyHQ2oXimsP+NYz5JM9JEGIn5WF6gNmVszJsx5fjTBro309HmeaC
	vOxUFMw3wpQSRJUuwkMnJw7/wAji+Kz1diJIOWpwMxh9L16SuhzFWTDxmUEvUGxOooXF6druuNE
	U7FdXNLBx6s+fEOvEu2g9pQfVmwN/O/ak1F2Pknld7qVPfqZ6bm9SPX7sMA4sgCvA7Ko/rYRoKa
	wuQJ72YjInZbZT0m5Aubwo4o+KqJaGkE7iJ+rzdw4gG3Y6V0ydC+4f5Ys6GFT3PcWTFCJmaKjIV
	x4t6BH1O6ZCZ+q1vNb3exifQ==
X-Received: by 2002:a05:620a:3944:b0:915:2aef:428b with SMTP id af79cd13be357-920910a4d42mr535836785a.39.1781877414541;
        Fri, 19 Jun 2026 06:56:54 -0700 (PDT)
Received: from localhost ([2804:30c:1f0a:b600:e457:1a16:4082:3e0a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-920a4c5d74esm243751785a.38.2026.06.19.06.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 06:56:53 -0700 (PDT)
Date: Fri, 19 Jun 2026 10:57:32 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>,
	Marcelo Schmitt <marcelo.schmitt@analog.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, jic23@kernel.org, nuno.sa@analog.com,
	Michael.Hennerich@analog.com, andy@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, pop.ioan-daniel@analog.com
Subject: Re: [RFC PATCH v3 3/5] iio: buffer: Extend DMAengine buffer
 interfaces to take extra sysfs attributes
Message-ID: <ajVKzNgGzoueI1lW@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1781661028.git.marcelo.schmitt@analog.com>
 <a09f2cac2d26fe385f1f7790b0db64b7d9953ac6.1781661028.git.marcelo.schmitt@analog.com>
 <3b96ec10-b022-4135-9ade-6fd9eb6e78a6@baylibre.com>
 <ajPJdoTgpw7Ndczh@nsa>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ajPJdoTgpw7Ndczh@nsa>

On 06/18, Nuno Sá wrote:
> On Wed, Jun 17, 2026 at 04:43:18PM -0500, David Lechner wrote:
> > On 6/16/26 9:03 PM, Marcelo Schmitt wrote:
> > > Some devices using DMAengine buffers are connected to extra hardware that
> > > allows setting how fast data is transferred to/from the buffer. However,
> > > those extra pieces of harwdware are external to the sensor chip such that
> > > supporting the transfer speed as a sensor property is a bit of an
> > > inaccuracy. Expand IIO DMAengine buffer interfaces to take arguments for
> > > extra sysfs attributes, enabling the transfer speed to be configured
> > > through the buffer interface.
> > 
> > This message is a bit confusing. It sounds like it is attempting to
> > control something about the DMA controller itself. But based on the
> > later patches, it looks like this is just so we can add arbitrary
> > sysfs attributes to the bufferX directory. And in this specific case,
> > a sampling_frequency attribute.
> 
> Agreed. Seems like rate control comes from the buffer.

For this series, that was the actual result. Since we already have extra
sysfs attributes for kfifo and for triggered buffers, I thought of trying it
wish DMAengine buffers as well. The intent is to decouple the sampling frequency
sysfs attributes (which depend on SPI offload and PWM availability) from the ADC
IIO device. And the reason for that is to avoid making the device driver
directly select SPI_OFFLOAD and/or depend on PWM because these devices can be
used without offloading.

> 
> > 
> > > 
> > > Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> > > ---
> > > New patch.
> > > 
> > > Now that I've come to this buffer "solution", I have pretty much convinced
> > > myself it would be better to instead have some sort of IIO trigger to control
> > > the signal source connected to SPI offloading trigger module.
> > > 
> > In the other chips with SPI offload we've done already, we just used
> > IIO_CHAN_INFO_SAMP_FREQ to control the SPI offload trigger rate.
> > Any reason why we can't do that here? In the original SPI offload
> > discussions, IIRC the general consensus was that adding a trigger
> > just to control that was overkill when I suggested the same.
> > 
> 
> I tend to agree with David. Even if we come to a conclusion that we
> can't use IIO_CHAN_INFO_SAMP_FREQ to control the trigger rate, I'm not
> really convinced sysfs interfaces on the buffer itself are the place for
> this.

I understand it might be odd and confusing to have the sampling freq attributes
in the buffer. Using IIO_CHAN_INFO_SAMP_FREQ shall also work for this device
so I'll probably switch to that. Though, an interesting point Jonathan made on
v2 was that some devices have sampling frequency controls natively (e.g. ad7173).
I wonder if having a trigger device would help with the SPI offload dependency
separation. We might avoid attribute name clashing for some devices as bonus.

Thanks,
Marcelo
