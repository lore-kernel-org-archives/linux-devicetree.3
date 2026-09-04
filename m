Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D974A1DF9
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 13:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529782; cv=none; b=HHPGAhQO3hE0hrfscclG1g82HPHWMfz97oblrOfytNFZd6cdxJvHW3XBTiMYSk72dzi2eB9QXdm242AihbPAa99+7mhTwJojO+jw7q+vYHTBfmKS+WRvCj2L5rZSFzNJ2N2RQAjt/TL1eS5lDFxtxtd5vYo32nPBF5+qZ/b/tLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529782; c=relaxed/simple;
	bh=aosYpUbqKZOBqzNixgi27z8JCDcxlJLDNLiZEDNN040=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qYalu0Ga7KZYDooh4myBBSVE4T/aDOqVNBksnkII3C1log25cxashitBkiJs9IcdXJx8J/CIINPMh9orGVcBA5rFu7fLaO2r1A0UFBxK9ObklDtID/RJ34eqmsbm+sODJZiI/ed6L/vpDwVeL+BkB8Y6JUBlWjS3/sc8j4RaivI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=S2mfNR75; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="S2mfNR75"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4843e397f74so1259281f8f.1
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 06:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788529778; x=1789134578; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wP3l+1LPFkAU6/L5AN9IB6fzLBnDEDQsr0kTH2ur/CI=;
        b=S2mfNR75pHkfdw4C7CbtU/CB/eDuWU48LL608oSTm6lAHEDBwSRGyFxKXt6xDsQlFR
         LRACJuv6zDXkvCPOfDgf+bj9RJnr8FDi7geUIZpZKt2JVBt//sWhCzktpSPRvYIKcTkZ
         BE2WCKQJNId5y7Haj/oUeMdJtlAT0JRiFCL1a3dec9tjntIcLuYqR5TjrEVbilFdBoBU
         zab/Gbbz5hdbjQ5S4MpyYxFgGevaKZQO9gArbJ9TWKSwfh0wmjBfGzJa9XkgTouX/lAs
         b7HPjhTesQlEqw71HgWpvql/ppDPvVwu8F6uvBUM4OQn9CMqRJNaeFZrfeI4LK2QfHXb
         cJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788529778; x=1789134578;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wP3l+1LPFkAU6/L5AN9IB6fzLBnDEDQsr0kTH2ur/CI=;
        b=BuOW0S3I/O8U9PlIcTaaitL/jXnAZmHyzU8HLj13sbX/7iPEkXZ2Wxa+aVhfj32D5u
         D1kH29JmlBE5q7N4i543fN1ZFFh9aD5BJtpdCiWcgVLxQZ5ZOXUs2v4lTPH4BBbRCSn8
         5fnUHS9QiYmjd7Dlc1QAdGP0vjUVzk43r4AXeWoJm7sQ/fVYDn6h9JzlkJj1VCczVC0T
         KVrnfB8vYev9ANaJInZ10oSUPoEe+bav0AnWyltMiXnH+YDvr4W4VJ4bf5foejR/2X6y
         0A3xXN0fsnhicpSh5ievQUh5DQf5/u34x8ECxvyTMMmXKRtLOz6jCZTSHXiruAAyoEaS
         bS/A==
X-Forwarded-Encrypted: i=1; AKwUvBxeYNfYtJIbMTVnNBbcouIp3jT6MUHjv5p27i9DYnex1fzAJtnC+gATZ8ehu6wuUAtdIhxVZB4wl9GS@vger.kernel.org
X-Gm-Message-State: AFuF++mKzYcvIiJZrz0ZHC23qJHuFrTBPjqsyc7bog5k+2dsbujPGUDW
	5nf6/SIMFwBMaEjx9OZs6lwmW71OkvdPvXlzeXJRNauE9G4US5InYLRVAaAc8DDoCTs=
X-Gm-Gg: AYBFou1coNKtVnTbCgHLAVQpk0Y+xTmXeNsASxCNJ4IQb/lBpY7E8fUeAgdt7nLuDXk
	Zeo3nmMSTe4gi7WvzcR4q3YaIGmvVGLOW2Dk9IAI8aGF0knjREiim552ceioPLCP4tHdU8qraJm
	7/ahzOBv4+VEgjCpT8rFr74/ODf2/ctQ9a4JRcasTvvLdQ4HJm/qznS0sxMOr2s+tbSAwLflASF
	oNRLebJMNRQn0jaLni1w/bHcsxeiOdVzZtiUqdh+e9kX9z/TX4iVh8RegBpm3W4we7OPPhkVdqN
	Nwg20+IkZ1oNkHiBe6Q8N0WSZGZrx7FBAITQqcCDjph6t42aqcO69MAZnQvLaVlvsrh7ZI2X4TC
	qp+jC6mfQlIAU8+z934yTIQbEYpjMwbVu7K0voY079GtWWzZ1e0rAoiz4sjqq2OmjFdIJUhsjRh
	Fp3U69VmSSlhxN3erPXeai2jwmzLqw1DhQ3kcwCtarvQg=
X-Received: by 2002:a05:6000:2613:b0:485:8224:1a41 with SMTP id ffacd0b85a97d-48589228c23mr5316855f8f.18.1788529778351;
        Fri, 04 Sep 2026 06:49:38 -0700 (PDT)
Received: from localhost ([82.145.119.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883a9b49sm5656179f8f.17.2026.09.04.06.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 06:49:37 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 4 Sep 2026 15:53:16 +0200
To: Gary Guo <gary@garyguo.net>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org,
	conor+dt@kernel.org, robh@kernel.org, ukleinek@kernel.org
Subject: Re: [PATCH v7 2/3] pwm: rp1: Add RP1 PWM controller driver
Message-ID: <aprNTF0278NuH55k@apocalypse>
References: <cover.1784539788.git.andrea.porta@suse.com>
 <a83d65b2d91865eb722337c547c94dce175e6086.1784539788.git.andrea.porta@suse.com>
 <20260720100212.BEF1D1F000E9@smtp.kernel.org>
 <amN-5B5POX3rNb29@apocalypse>
 <DKY8USKYJJVM.17HQ78YIYZMFV@garyguo.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DKY8USKYJJVM.17HQ78YIYZMFV@garyguo.net>

Hi Gary,

On 19:42 Tue 25 Aug     , Gary Guo wrote:
> On Fri Jul 24, 2026 at 4:04 PM BST, Andrea della Porta wrote:
> > Hi,
> >
> > On 10:02 Mon 20 Jul     , sashiko-bot@kernel.org wrote:
> >> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> >> - [High] Missing `.remove` callback leads to Use-After-Free in the PWM and Syscon cores and leaks clock resources on driver unbind.
> >> - [High] Register context loss on suspend/resume silently breaks PWM output.
> >> - [High] Unclamped hardware duty ticks lead to integer underflow in the PWM core for normal polarity.
> >> --
> >> 
> >> --- Patch [2]: [PATCH v7 2/3] pwm: rp1: Add RP1 PWM controller driver ---
> >> commit 0c98703d857577902e57d25b42a3d46dfbde5795
> >> Author: Naushir Patuck <naush@raspberrypi.com>
> >> 
> >> pwm: rp1: Add RP1 PWM controller driver
> >> 
> >> The Raspberry Pi RP1 southbridge features an embedded PWM controller with
> >> 4 output channels, alongside an RPM interface to read the fan speed on the
> >> Raspberry Pi 5. Add the supporting driver.
> > 
> >> > +static struct platform_driver rp1_pwm_driver = {
> >> > +	.probe = rp1_pwm_probe,
> >> > +	/*
> >> > +	 * .remove is not needed because this driver cannot be removed/unbound
> >> > +	 * cause it relies on syscon which cannot be removed
> >> > +	 */
> >> > +	.driver = {
> >> > +		.name = "rp1-pwm",
> >> 
> >> [Severity: High]
> >> Is it safe to omit the remove callback here?
> >> 
> >> Even with suppress_bind_attrs set on the driver, if the parent RP1 PCIe
> >> device is removed, reset, or unbound via sysfs, it will forcibly unbind all
> >> child devices.
> >> 
> >> Without a remove callback to run cleanup, pwmchip_remove() is never called
> >> and the clock is left enabled. Because the backing memory is devm-managed,
> >> the devres subsystem will eventually free the pwm_chip and regmap memory.
> >> This can leave dangling pointers in the core pwm_chips IDR and the global
> >> syscon_list, which could result in a use-after-free.
> >
> > This is true. Uwe, I guess I should reintroduce the .remove callback,
> > what do you think?
> >
> 
> How is remove going to work with syscon? The previous version seems to just
> ignore it completely.

True, unfortunately we have not much choice with syscon because it does not
contemplate a corresponding remove function. The best well-behaved code could
just deal with clocks and resources that can be released, while syscon is
unfortunately not among them.

On the other hand, I'd like to emphasize the following:

- the driver could not be unbinded nor unloaded (directly) by the user, and...
- ...PWM driver removal as a consequence of the pci bus device being forcibly
  removed will almost surely leave the system unusable.

As a matter of fact, even though it's not impossible for the remove callback
to be called, it seems highly unlikely. So maybe it's not that big deal.

> 
> Also, do you actually need syscon here? Given that the pwm fan device is going
> to depend on the PWM fan device anyway, you could just EXPORT_SYMBOL_NS an API
> from the rp1 driver that returns the tachometer reading when supplied with a rp1
> pwm device pointer?

I'm not devoted to syscon so if everyone agrees on the EXPORT_SYMBOL_NS solution
I'm perfectly fine. It seems to be used throughout several drivers and as long as
it's not considered to couple the consumer and the PWM producer too much, I think
it's an easy alternative. Uwe, are you fine with that?

Many thanks,
Andrea

> 
> Best,
> Gary
> 
