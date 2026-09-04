Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A57A3C9EFC
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 16:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788539937; cv=none; b=QF9Egw7SNWYJmePBLcPRJwo+BGii9WFQoMjgtMlvACdFbVabyk0pMlyZVu25RREBW14TbH/ldNHGOwPu2OgqL3j5lwQWulQftyaLieUB3+f7QgBRUYuzcRQGoLAoP2drAOP7LGveQdR1K7QpkJpy4uX9Tjg4eghSGgGtplLNq3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788539937; c=relaxed/simple;
	bh=l5p0foO0joFsdooF4jDHYxnUobNi9JE+S8To9zyPeI0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eTq1Qcl6XD/HSc8TuvrMBWYHsD/Z9GzrSvIkiQ7AgRs2/UiZ2tcPjjtUGjpGsZDgF/D1ncwNBNCoPMV4bhKd+L2MXZF6NXf8pY0+PhdvHPyQSLZ/kyyj4aO4795uNYknmjwZ0GIULL6qYLYpjQBjDvwoXP57tRDJ88p38RWkx5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=K/mLZ9gF; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="K/mLZ9gF"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso11343995e9.1
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 09:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788539933; x=1789144733; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+KFYUAqa0PvanI3jMMnXFbsfpe1VgmcYuOXHAvwEfXk=;
        b=K/mLZ9gF+RsRD1fF1Vu7Uu/bjSWVT7sCa51C/eGJRQhNCc6OeXBmKpClfC4LH9xFs/
         jokSZTEuyoIEzdT4BKURLi9mISO892qBR8AFWxMVvB4rIzAmcLZBUJL7D5cb95Fk7l5d
         sCZaWD1hteUhDp3gOSmI0TpQ4jjcwaVvySy1WhzKc6pdBhY7VCZwIy+eoLwPvQJfSc3i
         aWTSy8WsN1nk0aIZGcrkSx43ya5dQIvgoEJO3YfY2rSaJysw4Gc4qdcfOEPEjE69vkQX
         CArzDalgQsgzFmhzsXfKMuxlwUYOYUULSA7wLZGiIvt7ovsNOFcdQ2daH9kCJoiflJ+j
         a9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788539933; x=1789144733;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+KFYUAqa0PvanI3jMMnXFbsfpe1VgmcYuOXHAvwEfXk=;
        b=HK3ap8vlQpAsvVqntSit4WrDkQW98PpRc1i+hc+7FmJMqTnAhRl7fy/LXP3YHHTl48
         oVf69Cpj2owaWguddsojvTEghWaY5ykmKWyr7m3uAimIlzw6hca85Gs7vvdB9zExM3oi
         Cjvk4c2yOsEWk9qHPs2ZFDtr/Z78/6UPs60lR/xaf/1dnCiTnqisTv93/cf1ZF1qx62c
         H0jcZ6aXA7q1QvFusEgJQ09j80AzhmOKBCWZno/CBDDGCHLjxiqtxXIFSzsP1i9IljU8
         pDmMVP5Kz2Rhx/VdUEJHuaAviM0UH4fPGbD02vr4QEbfp6ImnvE9cdgNxxt61l92FJSL
         dZjw==
X-Forwarded-Encrypted: i=1; AKwUvBxQr2C97rgvpPtkJKLrmk075w5S2frEJk20RnToORTDvpjRr4zJDvYJ0pV9WbHtmKNVoA1P6N9j81YE@vger.kernel.org
X-Gm-Message-State: AFuF++mOrnCxyo8gA3aPYx647ukp0oDNCgawgChYitkySi5XKnrWwk0G
	/RXJBgJ0scEg4J4L/Z2LLl4eRWhLG/NI99GgyUuZNYLKv6tUOTmI4gpklXD/BLeUtoo=
X-Gm-Gg: AYBFou0BHa2owVKJk9TSltP2eKCgyVneVxwsgBX06kcbHqiF4M5EPiljSt6wQKgfg+F
	5gtdyMF5g2io5HzGx2Xg2FDxDruVi0ixlo53Jsi46Dum1bYFsWKqwUXknOwHMANpnC6xfVGCkPb
	lzrliuuZjOUGjzJwu2dmOmqyej2iGu1f13gL5nh+cPjRVAzGeeqj48KXowTGdg2EM31FahA6mz7
	ywcu4Y7IMG9hES5QbaTd9V9EoTZwgbKOViDGIGkS+3VSUd6SHEa+9WwabrJCn+5KKv2/lYtA9He
	z3kvBrg4gZ14h9Vj7vwdnLf7XWXfinGCe/S5e9ukQJly6y5wGDKBZXvflCXBK7wGrEUyzuEj5aq
	3XfJ3ERip8t8MXejcGy7STMEDBdRpGJQA3xr69ORT0/rIcYVhcZeNhzW3ucHKXZ8DrKWBHulx+0
	bVgbgduq7rjUUvvK29aBUkrNLVUHH9zJTKRdXLxhuVIL4xbO73pE46fR9szQ==
X-Received: by 2002:a05:600d:6451:10b0:49c:fa21:1c8c with SMTP id 5b1f17b1804b1-49cfa211d1amr40178055e9.33.1788539933403;
        Fri, 04 Sep 2026 09:38:53 -0700 (PDT)
Received: from localhost ([82.145.119.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cff8195ffsm21499955e9.14.2026.09.04.09.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 09:38:52 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 4 Sep 2026 18:42:32 +0200
To: Gary Guo <gary@garyguo.net>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org,
	conor+dt@kernel.org, robh@kernel.org, ukleinek@kernel.org
Subject: Re: [PATCH v7 2/3] pwm: rp1: Add RP1 PWM controller driver
Message-ID: <apr0-PHk2S2ny988@apocalypse>
References: <cover.1784539788.git.andrea.porta@suse.com>
 <a83d65b2d91865eb722337c547c94dce175e6086.1784539788.git.andrea.porta@suse.com>
 <20260720100212.BEF1D1F000E9@smtp.kernel.org>
 <amN-5B5POX3rNb29@apocalypse>
 <DKY8USKYJJVM.17HQ78YIYZMFV@garyguo.net>
 <aprNTF0278NuH55k@apocalypse>
 <DL6L8B6QAU01.1VCZAOPAUH4LP@garyguo.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DL6L8B6QAU01.1VCZAOPAUH4LP@garyguo.net>

Hi Gary,

On 15:05 Fri 04 Sep     , Gary Guo wrote:
> On Fri Sep 4, 2026 at 2:53 PM BST, Andrea della Porta wrote:
> > Hi Gary,
> >
> > On 19:42 Tue 25 Aug     , Gary Guo wrote:
> >> On Fri Jul 24, 2026 at 4:04 PM BST, Andrea della Porta wrote:
> >> > Hi,
> >> >
> >> > On 10:02 Mon 20 Jul     , sashiko-bot@kernel.org wrote:
> >> >> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> >> >> - [High] Missing `.remove` callback leads to Use-After-Free in the PWM and Syscon cores and leaks clock resources on driver unbind.
> >> >> - [High] Register context loss on suspend/resume silently breaks PWM output.
> >> >> - [High] Unclamped hardware duty ticks lead to integer underflow in the PWM core for normal polarity.
> >> >> --
> >> >> 
> >> >> --- Patch [2]: [PATCH v7 2/3] pwm: rp1: Add RP1 PWM controller driver ---
> >> >> commit 0c98703d857577902e57d25b42a3d46dfbde5795
> >> >> Author: Naushir Patuck <naush@raspberrypi.com>
> >> >> 
> >> >> pwm: rp1: Add RP1 PWM controller driver
> >> >> 
> >> >> The Raspberry Pi RP1 southbridge features an embedded PWM controller with
> >> >> 4 output channels, alongside an RPM interface to read the fan speed on the
> >> >> Raspberry Pi 5. Add the supporting driver.
> >> > 
> >> >> > +static struct platform_driver rp1_pwm_driver = {
> >> >> > +	.probe = rp1_pwm_probe,
> >> >> > +	/*
> >> >> > +	 * .remove is not needed because this driver cannot be removed/unbound
> >> >> > +	 * cause it relies on syscon which cannot be removed
> >> >> > +	 */
> >> >> > +	.driver = {
> >> >> > +		.name = "rp1-pwm",
> >> >> 
> >> >> [Severity: High]
> >> >> Is it safe to omit the remove callback here?
> >> >> 
> >> >> Even with suppress_bind_attrs set on the driver, if the parent RP1 PCIe
> >> >> device is removed, reset, or unbound via sysfs, it will forcibly unbind all
> >> >> child devices.
> >> >> 
> >> >> Without a remove callback to run cleanup, pwmchip_remove() is never called
> >> >> and the clock is left enabled. Because the backing memory is devm-managed,
> >> >> the devres subsystem will eventually free the pwm_chip and regmap memory.
> >> >> This can leave dangling pointers in the core pwm_chips IDR and the global
> >> >> syscon_list, which could result in a use-after-free.
> >> >
> >> > This is true. Uwe, I guess I should reintroduce the .remove callback,
> >> > what do you think?
> >> >
> >> 
> >> How is remove going to work with syscon? The previous version seems to just
> >> ignore it completely.
> >
> > True, unfortunately we have not much choice with syscon because it does not
> > contemplate a corresponding remove function. The best well-behaved code could
> > just deal with clocks and resources that can be released, while syscon is
> > unfortunately not among them.
> >
> > On the other hand, I'd like to emphasize the following:
> >
> > - the driver could not be unbinded nor unloaded (directly) by the user, and...
> > - ...PWM driver removal as a consequence of the pci bus device being forcibly
> >   removed will almost surely leave the system unusable.
> >
> > As a matter of fact, even though it's not impossible for the remove callback
> > to be called, it seems highly unlikely. So maybe it's not that big deal.
> >
> >> 
> >> Also, do you actually need syscon here? Given that the pwm fan device is going
> >> to depend on the PWM fan device anyway,
> 
> Oops, it should have been "PWM fan device depend on PWM device". But you got it.
> 
> >> you could just EXPORT_SYMBOL_NS an API
> >> from the rp1 driver that returns the tachometer reading when supplied with a rp1
> >> pwm device pointer?
> >
> > I'm not devoted to syscon so if everyone agrees on the EXPORT_SYMBOL_NS solution
> > I'm perfectly fine. It seems to be used throughout several drivers and as long as
> > it's not considered to couple the consumer and the PWM producer too much, I think
> > it's an easy alternative. Uwe, are you fine with that?
> 
> I think that's pretty typical for platform devices, provided that the consumer
> and the producer are closely related.
> 
> I checked the RPi vendor kernel code and it looks like they're modifying the PWM
> fan driver code directly -- in which case the coupling would definitely be
> problematic. But I think that modification is problematic itself and not
> upstreamable. I suppose you'll add a separate, dedicated RP1 fan driver?

You nailed it. I've changed downstream driver approach because it was too invasive
to the pwm-fan driver and, as you mentioned, not upstreamable.
A separate RP1-custom fan driver was in plan from teh beginning.

> 
> In which case I don't see the coupling being an issue.

Perfect!

Many thanks,
Andrea

> 
> Best,
> Gary
> 
> >
> > Many thanks,
> > Andrea
> >
> >> 
> >> Best,
> >> Gary
> >> 
> 
> 
