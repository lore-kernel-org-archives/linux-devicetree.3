Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD3F35BDDC;
	Wed,  8 Apr 2026 19:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775677658; cv=none; b=YJWyB34O9/tix684Rp3RmnXsSgrtFX/YeCVgNjz6TuCz8yWy8Kq9tAP+5x7qRywXsH6HtjvoMJu26HgrwOBaLn2YTpRr0650Y6CBSxSdR6l9d9OonJzu+O5jhspmGuUhbywai52rZYRiyWGZAb6IzBT+unda+0n88qhgh7LNQF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775677658; c=relaxed/simple;
	bh=aadz94YUAkg+GVp5yrl2+S8JQSuUcN8SOKVUPCI0PkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cnrDsSf16cPTBT6KbIz0lyHplYyY5ypabsw+sJv6INgXuA7QBWbFVTCC66jlXysGZfIw7y6BLFUuDnmgZ18cIU8Aw97kmNVRY6j8/EargKivwW9tPGB7pBQ2f87YlQAIbd16t+GU+dYQXQ7V5X44dfoiVhgKG1Ly9pmkgcAHz0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=N7kHVNFa; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=t7EhtX1q; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="N7kHVNFa";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="t7EhtX1q"
Date: Wed, 8 Apr 2026 21:47:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1775677655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZSIqNt78FUyhC37DXJa7yUeoFFc4wo74rhgzzgW7k8E=;
	b=N7kHVNFaV28BJ5i39dTeovDJmXEOGGoicy63cPw6sIMPJrT3MIRJU1OoauMeqGYBh2C/ru
	IYmtbgdnjNit3k6yIfjADqd11vLONopQXh9MVr/wIqvId2uE5rsNbwjbDth/U8dZav60JO
	qt/yyJ+dTx1morKTk1+dxQZIBntOErCZYOoxd2OSjc+VpWSPKGaIlwQoY5bU/84s5Y8D8S
	QzL/tobLmfLXS3649j2AtV1MVCw+oZ+Km+tnM5z2NT/EBWjtnmz04pYEuFaffrNpR0BIA1
	XzLmuZfxuaewSRz0iv6KF+e8QvYSybCweJV+vQgO8jpmgQUsqR8YT5h/EISQkw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1775677655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZSIqNt78FUyhC37DXJa7yUeoFFc4wo74rhgzzgW7k8E=;
	b=t7EhtX1qiE9FyleDtAjgbxeI91gmSauXY8LkwXq0tpfCxMXlsR1dCNBAirwzpx6aGHCx/B
	Cs+AX+iRbaLtnIBQ==
From: Gregor Herburger <gregor.herburger@linutronix.de>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Srinivas Kandagatla <srini@kernel.org>, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] nvmem: Add the Raspberry Pi OTP driver
Message-ID: <adaw1rr3WlDjvyQp@gregor-framework>
References: <20260408-rpi-otp-driver-v1-0-e02d1dbe6008@linutronix.de>
 <20260408-rpi-otp-driver-v1-2-e02d1dbe6008@linutronix.de>
 <251100fe-db96-4d83-899a-cd764582d698@gmx.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <251100fe-db96-4d83-899a-cd764582d698@gmx.net>

Hi Stefan,

thanks for the review.

> > +config NVMEM_RASPBERRYPI_OTP
> > +	tristate "Raspberry Pi OTP support"
> > +	# Make sure not 'y' when RASPBERRYPI_FIRMWARE is 'm'. This can only
> > +	# happen when COMPILE_TEST=y, hence the added !RASPBERRYPI_FIRMWARE.
> I don't think these comments are necessary, because this applies to other
> firmware drivers, too.

I have seen this in all the other drivers that depend on RASPBERRYPI_FIRMWARE
so I added it here as well. I can remove it.
> > +	depends on RASPBERRYPI_FIRMWARE || (COMPILE_TEST && !RASPBERRYPI_FIRMWARE)
> > +	help
> > +	  This driver provides access to the Raspberry Pi OTP memory via the
> > +	  nvmem subsystem. The driver supports the customer otp as well as the
> > +	  device specific private key OTP.
> > +
> > +	  This driver can also be built as a module. If so, the module
> > +	  will be called raspberrypi-otp.
> >   endif
> > diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
> > index 7252b8ec88d4..8ca2095e068f 100644

> Is there any reason, why we cannot register this driver in
> rpi_firmware_probe() like hwmon and clk driver?
> 
> I like to avoid the complete dt-binding from patch 1.

The private OTP registers are not available on all Raspberries. Afaik
only on 4 and 5. So I think these registers must be described through
the device tree. Therefore the bindings are needed.

> > +module_platform_driver(raspberry_otp_driver);
> > +
> > +MODULE_AUTHOR("Gregor Herburger <gregor.herburger@linutronix.de>");
> > +MODULE_DESCRIPTION("Raspberry OTP driver");
> Raspberry Pi OTP driver ?

Yes. I will update in the next version.
