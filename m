Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4405A279DC8
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 10:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775816672; cv=none; b=WJ5pd71kzMrdAOJXNCvQ4vVTNr7vXQM1zGC6LkXzt/snZsjBpSZtwUHNAqM2SBNvQEuULnCjBBfQ/z8jsCA1QJzOJp8E2TfemH6ZMTjm8lcI0yMK+OEExMfxq3217U7Qf200lhJkvfcLiK8gDyFwExX4thH1BKKUDnigH49Yga4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775816672; c=relaxed/simple;
	bh=xe5BlvWEmvuJ0r8jiIZC9Qt6O5+U0xuQTEj7QAoXSxA=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kHxRh7BY0yhqTcHO/2a9erSsEhmL/D4FfAnUYZw9k1fENUcwLlEwW8N/C7RSxjzqtBp4aZR6BAwHcwXtUEgEhbDOLnF45WQN02/9cEJwrvk5FlJ5r+UbbSjwHEV5b5fMkmetRMLevmZ5OlpvqnZN8H2bbc62Uuaq8UsFoFYuppk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=N22ioBIM; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="N22ioBIM"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43b8e8e7432so1641313f8f.1
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 03:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775816670; x=1776421470; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZKnPag+J1FK879lrPixqSysMm2rbphTSL3HqF/0DRQk=;
        b=N22ioBIMsFLNgTbEmrA5vN8oKPwMYWkVy1y8v7my5f3kB6ez+n2+0pS6ccJMv37w/+
         biEJg/KuGgcnMXbnQYiYnDU5DKLGsTekqm022Tmz9RvMTDLcr277RpgC8vq6FcYxcBJl
         shxJ7LBr5hDtPN9mm/2Ofn0p4ZW+lDw5aufanq1Z7bL6TfzqVtBADIHcnNvPgPuqq/wq
         dNKIR2hhUlJk8uyQMNpOcsB5fIYijnctWCnwlAM7gZTZ/6ijtc11rgsCJ/9dkZiVHD0x
         4NFaWhfsd2sHSVunW3DGZd30Lq2sxkh7s0Wd433et7af55cgj6glpiwEMP/Y6u1SMHQV
         FCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775816670; x=1776421470;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKnPag+J1FK879lrPixqSysMm2rbphTSL3HqF/0DRQk=;
        b=gjAP8Y64xzqjP7iwWWmMf7Fcn320DoZtexi0KuOA8ANd69ANuyzmhHnU4ywI8d9W7u
         N7tngeQvT7vSH74vm1/zU2F+5x7RWVt4xVai0ToayPqmpV7vYnnm9VK3xbMkkXtPKMbc
         W56Mv3hTo0u8W2fhEHTg90o5SrPKTg14/9sb57aD1Lihd2/2VIqkdjKLsk/tBjuJWURj
         f9tBuKrDzL2gBOvOqcJnK+0Zp91wcNvUfYL8jxqo2wnX5cT9tqUdxkdugsjTMznmNkTs
         qQIMm3rFIomTtWqscPEHt9qZaAywW/tFlHjmnZzSLJkz1CNDDzSWAgT1mTTJD5UjLLG+
         FELA==
X-Forwarded-Encrypted: i=1; AJvYcCWTnC6kqNLJ5fikJPZaIb8oM4tfBTO+c6SvR66ApL4Y4U80Uc4mhcypsEMd6vkw+j1ipEXwQv2XaLJv@vger.kernel.org
X-Gm-Message-State: AOJu0YycIdeo9DwkfF3p2TDwGkeAZ3FIW/uJkXD+1o15JpdKv2gtzKlJ
	OzJRDIhjugBjBJheuuBA8k0fL3Xnsu4O5yt4EVKGv8bnj+gid4jsiJk9r8YsWbC7xTw=
X-Gm-Gg: AeBDiesiSNXM3ZjspYufBCUbqWRrGCkWn/W8G0FgDVtYuYNWBn1u9HHhoMz6TvRKyyB
	ej4S2i0Cgm5txQuUGm1UQJaN12N1D5gibFI5yWvUeGEbMV2pmYzl4zBY4sYa+NLxOkmisE6bVOI
	xxEXIjjcKok75kdY5QSyM/pdMeP94pnjz1q/gil4nZrg0Qg9E50QHZ+BFinuUcd5QkC8KKu6Kgc
	68Zq3Oi/kSZVx0aN4FwnKxgLlna4kpQ9ZrbXuDKrzgz61RFpC6OLu+h5O85LsAbDufwred9aGcB
	roigV56fJDCuJnRwz6H0kgXhkHyAJ/rdjKV4huG+eCimB17Bn3AEIJl7Bwrvo6P1Pod1VmgGRwR
	UkMq/jkyIzdcqHIsEgFHhG3nXH2A/BKJObJRR5x7hoKb98njV84E0Lz7Abk4VtmEVlrWlUPsxYm
	qevpvElid6Cj4HOA2adV+IHbQCHvsEGvRBw9uNFb2uJOG+SRPqRg==
X-Received: by 2002:a05:6000:402a:b0:43b:8f23:a87b with SMTP id ffacd0b85a97d-43d642d9d59mr3841629f8f.44.1775816669353;
        Fri, 10 Apr 2026 03:24:29 -0700 (PDT)
Received: from localhost (93-41-3-120.ip79.fastwebnet.it. [93.41.3.120])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm6454744f8f.33.2026.04.10.03.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 03:24:29 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 10 Apr 2026 12:27:35 +0200
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>, linux-pwm@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>
Subject: Re: [PATCH 2/3] pwm: rp1: Add RP1 PWM controller driver
Message-ID: <adjQl37-6a--_y3Y@apocalypse>
References: <cover.1775223441.git.andrea.porta@suse.com>
 <28e29fbfc20c0b8a115d006233c2759d8f49e639.1775223441.git.andrea.porta@suse.com>
 <adLTwOTbkJ0VQXy6@monoceros>
 <adfQ6Tvst3Vd1Mxe@apocalypse>
 <adiW1tBC8Imd14LD@monoceros>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <adiW1tBC8Imd14LD@monoceros>

Hi Uwe,

On 08:27 Fri 10 Apr     , Uwe Kleine-König wrote:
> Hello Andrea,
> 
> On Thu, Apr 09, 2026 at 06:16:41PM +0200, Andrea della Porta wrote:
> > On 23:45 Sun 05 Apr     , Uwe Kleine-König wrote:
> > > On Fri, Apr 03, 2026 at 04:31:55PM +0200, Andrea della Porta wrote:
> > > > +static void rp1_pwm_free(struct pwm_chip *chip, struct pwm_device *pwm)
> > > > +{
> > > > +	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
> > > > +	u32 value;
> > > > +
> > > > +	value = readl(rp1->base + PWM_CHANNEL_CTRL(pwm->hwpwm));
> > > > +	value &= ~PWM_MODE_MASK;
> > > > +	writel(value, rp1->base + PWM_CHANNEL_CTRL(pwm->hwpwm));
> > > > +
> > > > +	rp1_pwm_apply_config(chip, pwm);
> > > 
> > > What is the purpose of this call?
> > 
> > To update the configuration on the next PWM strobe in order to avoid
> > glitches. I'll add a short comment in the code.
> 
> .pwm_free() should not touch the hardware configuration. Changing the
> pinmuxing (which I guess is the purpose of clearing PWM_MODE_MASK) is
> somewhat a grey area. If that saves energy, that's okish. Otherwise
> not interfering with the operation of the PWM (e.g. to keep a display on
> during kexec or so) is preferred.

Sorry I should've been more clear on this. The pinmux/conf is not changed
at all by this mask, only the PWM output mode is. The controller can output
several type of waveforms and clearing PWM_MODE_MASK is just setting the
controller to output a 0, which is the reset default i.e. the same value
as just before exporting the channel.
I guess this is the expected behaviour in case of a fan, it should stop
spinning in case you unexport the pwm channel, but I see it could be
different with displays.
Honestly I don't have a strong opinion about that, please just let me
know if I should drop that pwm_free entirely.

> 
> > > > +static int rp1_pwm_resume(struct device *dev)
> > > > +{
> > > > +	struct rp1_pwm *rp1 = dev_get_drvdata(dev);
> > > > +
> > > > +	return clk_prepare_enable(rp1->clk);
> > > 
> > > Hmm, if this fails and then the driver is unbound, the clk operations
> > > are not balanced.
> > 
> > I'll add some flags to check if the clock is really enabled or not.
> 
> To be honest, I guess that is a problem of several drivers, not only in
> drivers/pwm. If this complicates the driver, I guess addressing this
> isn't very critical.

I'll come up with something, we can always drop this check if deemed
too 'noisy'. 

Many thanks,
Andrea

> 
> Best regards
> Uwe


