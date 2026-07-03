Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA77C375F69
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 14:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783090134; cv=none; b=OoZzOYP/UzhtNXdGLJGy/Jhcclu9QtEsyt+uj9S1tRn0F9MxcvUfV9qAfBfRSD5TU/nXRNos/Q+3/iklSXn7lWoJAqTACbOxUUHCnVMQty2ZFHg7CO/RsBkgWFERRZiurwxmREmCfHdmwKS/noGp/Y4H008NY9EVBcjO5ynfgBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783090134; c=relaxed/simple;
	bh=HqK0apG2WBVp9keeHQN4EfAdivjOtfyBmEcKP8064hw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=riRQIpcselYotoLBdJr7x1aHKzADeDkZvljjPEuRGuEKB9irJ/CtHpsaDMTPBsaL63zFn0+28om6Qv2/xJCwZD8cm/sAFnxFlPh4Xkdb3tJU9EeTKb1I0/6h8icWS4603wnnCtHuwLG2Y8Kty5ZB6DW5I5hs/tzzpLePhVcr018=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=e+7lz/PP; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="e+7lz/PP"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so5798275e9.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 07:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783090131; x=1783694931; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RtbeAb4anjju2Gg5Hr2svmQH8LAj1CgUb05x/8fx3ZI=;
        b=e+7lz/PPnTzecXOAHSvZyU3R8gflwVZHQobEZRvjqS0VJt1OD2OxEdy7uypE1VSXhW
         Wo2KlJRzSCCadbsZ3g6xor/zF/CAXgJy6mmpT3K1jfMsg8F79YWpFcfLzyeZzCUsqyAv
         Z38B0wbs9LazAhImGpTwxhyrRbFe+rB6YqhnWSPxRIwvZ6bxF6qt9zg6794DgkVcD8GA
         2QwPxfSpHgUdlj55ugttafXDrD1xYpkTFOjhBZqJZtQDe+jOxlrDvErQrG0kxvvBIxxJ
         L7A0zCVWI1NwbNMbs4zpW+/VO1jsEH50fgePG27cYspi5SJLTDHDEESLHvoSWn3LNgj3
         +ruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783090131; x=1783694931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RtbeAb4anjju2Gg5Hr2svmQH8LAj1CgUb05x/8fx3ZI=;
        b=qnZBrPJPoQTL11eeSXogx3cyt9ly/Mvtsm8Ma0ZYckSEb7z9RWKEhAUzD4v+U1xlpu
         38PiB++PFHZD0ZnVzhlhRdZdrWuojAkDw97HxXfhSJtSACVyH6hzD3ipQOW+/HzllxoX
         ESUrMwx2FSs+g6u3o5wwtJOnJ7V9UOYi8gOppuvboM54PVog/vuIfsSiBi96vJdry5PF
         76nxtpeNeKp4zVfMR4TLxH77frQEUcn1VyQbfPhfcSG7u2yxIVqYIAU+WK9/11ZAHDwN
         glZK/1zmB0R3PhxCgYezLcpzCho+NNPjpSbw+9TczVzlfGU1s1GiAyoXWJZkMToPZxwN
         wy3w==
X-Forwarded-Encrypted: i=1; AFNElJ+lBlhJrEyku9QrMlGy6zqXvzV0xHxPRArtwP/WKSQ7kLBxGubsvMfTVqTa18lTb7uG3ROI9kj7x+rH@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4lBxEeptTWnCi7SBvfTprmxThsGhKw5IWXmztoaHouany4xlN
	YAdcnGl1hpglBK4DBvKLOyUk3Qauqd2uyglTPGmLIhdTPdgbE9WQxGU9Z4vcat7BXxs=
X-Gm-Gg: AfdE7ck2FqyqreoyOHvyLY+hele6RG8eXRxdAO2LSJK+24HyR/42vlt/DtnqXFtqUCM
	v6tgeMVWkLm0PQn1apr/CpyGHgJ9l3fhgx3j5FZ3TC2HNp2GMtpR5N8BnJBVyR48u0X1rTjZbbH
	V/kELHzFax6H10uRTYjviJTq5K/6xYvXx3Uc+p3f9A47FaBW7n2N3SKNXairHp7sj1R08e6ngr3
	wHBrUkqT1oyCPc4mOq51srB2iQ+tn4kYYrQ38RKKUJhoXJ9pfJQM7sWpmDP6Dm1sMPZi0mIHA3M
	q6Vy80qU0gwlnf8SvB/P0rHIs14CkmVM5tz3QGpdcUeJwRnoqxWm54Z5qf3m2bWbeqUjDkqimDO
	bIDUOhwWG5wyuuuXftaQoBtooKZCV0oudqq9TCT2ZPOCUSjQriZzMEq5s14JxvPRwW6ZAIW5aBc
	Z5YqsgHzxJEzQ=
X-Received: by 2002:a05:600c:34c5:b0:493:bc4a:e7d3 with SMTP id 5b1f17b1804b1-493d0f4efa6mr1735385e9.39.1783090131280;
        Fri, 03 Jul 2026 07:48:51 -0700 (PDT)
Received: from localhost ([195.94.145.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637568dsm149767675e9.4.2026.07.03.07.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 07:48:50 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 3 Jul 2026 16:52:17 +0200
To: Sean Young <sean@mess.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>, mbrugger@suse.com
Subject: Re: [PATCH v5 2/3] pwm: rp1: Add RP1 PWM controller driver
Message-ID: <akfMoQfzmEEiH9VC@apocalypse>
References: <cover.1780670224.git.andrea.porta@suse.com>
 <f8dd46a553351adaf9d29fbba9f98e803b672fe7.1780670224.git.andrea.porta@suse.com>
 <aiwX2YWVJnDNTNiu@extorris.mess.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiwX2YWVJnDNTNiu@extorris.mess.org>

Hi Sean,

On 15:29 Fri 12 Jun     , Sean Young wrote:
> On Fri, Jun 12, 2026 at 04:01:27PM +0200, Andrea della Porta wrote:
> > From: Naushir Patuck <naush@raspberrypi.com>
> > 
> > The Raspberry Pi RP1 southbridge features an embedded PWM
> > controller with 4 output channels, alongside an RPM interface
> > to read the fan speed on the Raspberry Pi 5.
> > 
> > Add the supporting driver.
> > 

<...snip...>
> 
> I don't understand the point of the clk_enabled field. If the probe
> function succeeds, then clk_enabled = true. It is set to false during
> suspend, but after suspend the only thing which can follow is resume,
> I think. In resume, we set it in to true again unconditionally. So
> it is always true, no?

It's true unless enabling the clock again in rp1_pwm_resume() will fail.
That will trap the unbalanced condition mentioned by Uwe in:
https://lore.kernel.org/all/adiW1tBC8Imd14LD@monoceros/

> 
> > +};
> > +
> > +struct rp1_pwm_waveform {
> > +	u32 period_ticks;
> > +	u32 duty_ticks;
> > +	bool enabled;
> > +	bool inverted_polarity;
> > +};
> > +

<...snip...>

> > +
> > +	/*
> > +	 * The period is limited to U32_MAX, and it will be decremented by one later
> > +	 * to allow 100% duty cycle.
> > +	 */
> > +	if (period_ticks > U32_MAX) {
> > +		period_ticks = U32_MAX;
> > +	} else if (period_ticks < 2) {
> > +		period_ticks = 2;
> > +		ret = 1;
> > +	}
> 
> period_ticks = clamp(period_ticks, 2, U32_MAX);
> 
> Although that misses out the `ret = 1;` which I am not sure about anyway.

But we need that ret = 1 to announce that values have been rounded.

> 
> > +
> > +	duty_ticks = mul_u64_u64_div_u64(wf->duty_length_ns, clk_rate, NSEC_PER_SEC);
> > +	duty_ticks = min(duty_ticks, period_ticks);
> > +	offset_ticks = mul_u64_u64_div_u64(wf->duty_offset_ns, clk_rate, NSEC_PER_SEC);
> > +	if (offset_ticks >= period_ticks)
> > +		offset_ticks %= period_ticks;
> > +	if (duty_ticks && offset_ticks &&
> > +		ret = dev_err_probe(dev, -EINVAL, "Clock rate > 1 GHz is not supported\n");

<...snip...>

> > +		goto err_disable_clk;
> > +	}
> > +	rp1->clk_rate = clk_rate;
> > +
> > +	chip->ops = &rp1_pwm_ops;
> 
> Can we add the following please:
> 
> 	 chip->atomic = true; 
> 
> This means that the pwm can be controlled from atomic context (not process
> context) using pwm_apply_atomic(). This is very helpful for the pwm-ir-tx
> driver, which produces a much more faithful IR signal in atomic context.
> 
> Using pwm for infrared tx is much nicer than using gpio which bit bangs
> the IR signal and holds the CPU with interrupts disabled for upto one second.
> 
> As far as I can see there is no sleeping code in these code paths, so we
> should be fine.

Sure, added.

Many thanks,
Andrea

> 
> Thanks,
> 
> Sean
>

<...snip...>
