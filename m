Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2AA331EAB
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 13:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781272107; cv=none; b=rA1kWgzpiSA311SjXlcq/a7/q8+Wp+2/AMw28FqgtsIye7jtnn9OtIaqA4nkkEonFThDTG5EpthHXl0Y5ki/Zs5eH7GtWVFmAVkDbA5CtaE6QITKg/Nlqpyxo7piCLzYjP4oDMLoR3h0FOtoTLy4Em+4LFxIBN+d50lAKrSexZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781272107; c=relaxed/simple;
	bh=Nm/CFb+Dox2Afi7pYSuOi5ckPQL3p9sapoD96313IHI=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iInBkmlNhPuEzXnrgCB5ODY0YCG6+xsr5PTk0HbiDFvZPL2hgJl+cKVBx9f99OOlIZEF+cTFk+1RDSmK0CR1AK9yddQf3kAkfGrEdfBjaEYklZejvy84WCGqJItJyrByAlJahdO9Qf9o5OGXqyjSErXLwglnmEEsaMSBI0/TCoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ErY4PUEd; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ErY4PUEd"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490afc47455so4417815e9.2
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 06:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781272104; x=1781876904; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mipHo0l7RBc0zEMhF8Fz8QvRJ7oAxrgIKC4nNESKUfg=;
        b=ErY4PUEdqNZ/35649bKLE7SJKD4ZSucvJLnEIfCWqyNnpZ6bTMaP5cqd0g7nIFdaOq
         sQuem0TA3QWJrlF/oWAa2mlRhTujgwTJlYjA9wWYYt6TXC8+4Ddl3zoZGMJajhSRDp8c
         VNVFGRAd9x1F1PjJCjffGiqSDR0fxgYfO5r/uBAOXWoYHNuRexwHSDGyL/BpruYtaMys
         KgBqmwIztjhXLKjbJ5w/9AVZWy13oca/o3BPbbL1D6tATSL0qaRxzCj5AdfZVe1axASx
         sTbIIGWgGUTBipISFI/OpzZU8i6uNgPM6xwmyeARuN3vOtdIvPOaYr9X1D6sohgwYPKV
         DFSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781272104; x=1781876904;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mipHo0l7RBc0zEMhF8Fz8QvRJ7oAxrgIKC4nNESKUfg=;
        b=LT86BVPbnPQoqzHJQuB+R0svgbNW/nmn0NWlHH7y6klyC7X04lvp7G3vCNmJBPoRnZ
         uf/F7c9F7GkorGOupPUzsjKj1E0w5f6eoj8I8YhdKrJ3y/MjKv4BFXntwLxgX1sczls1
         5BQlzaDJKr12gvnRdsLYm2hG7peTwwXr+uBvTTP5TmbA86JKMhc4Hz2z2kNIBNI0HGjG
         tiK21gP2/danJLT91i5lXhUftr+CB7JgY7FyAmkXq1b4e4DfEat6QVvE5TJTW46iBSRV
         GTOha1/+j1OBt3p75jbyNrZ4vZ0W8Y2Z125Dg8Z7hGSEuhlQTxM9zHmlJEXJQcjnaZ+E
         NdGg==
X-Forwarded-Encrypted: i=1; AFNElJ8dlU+3SFkXZaPJmF6F+g0RtY76qDoy8xCQoaFuYkCi80RoONhicSLqXmE+q26fz55yC9WUA2B3fj/K@vger.kernel.org
X-Gm-Message-State: AOJu0YyJQgc00pr+sNwVvOXPIlefUnHgYVkHgPQX8f86cYpyL2fpd7wA
	STG9Z/GGaV+wFISdmzzrD/CsAGSyDSwnH/ILwiPhG85RZ97BtPb3vy9jFWtGGYY5Wq4=
X-Gm-Gg: Acq92OFO8sJvjLlbqPluprMiDcc59+t6X4iKknNac0KkodQkmsAewkJswK7GM1nfKWl
	95F8MkK7eUEjJiRcQ4keNCry7ACVGmurnOHeZz4h84NMX5rFsC8Zjgdj2pZnaq5uL3CtkV/xa5U
	Nw43FmSG2zdf9DC2AM0Wu7fZTTGfM8vBMXa7E/OK6Qq7YgzzbHVrbS8DgLZvB6wUFjOgqg+wgBM
	fQZys9olALhc+cpaTDkX43Ouh3Udmr/OMpczoMb5y+KK9rrYq3r2xOyiq4HVSiU5IbkSjN0Kxjv
	0xfDm0PbjvYNBl6tQy6nwxaZZhOkYi7aE1ZxrHuZ8FNK2OYVCqlv9TrLzSh9Wg6v+nbO8b0VXot
	dzckeiCuF4Q7Odm1Ddu+/IONzDHtT8C966HuU9fYFCQyoZ4VoJjNxAMYVCYBC5njgIkswNzHjUc
	/ABSLqGrEeNq43NbCJaSeh
X-Received: by 2002:a05:600c:3b15:b0:490:b189:212d with SMTP id 5b1f17b1804b1-490ec522d44mr40387895e9.33.1781272103620;
        Fri, 12 Jun 2026 06:48:23 -0700 (PDT)
Received: from localhost ([195.94.146.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea843cbbsm76137075e9.13.2026.06.12.06.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:48:22 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 12 Jun 2026 15:51:44 +0200
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	sashiko-reviews@lists.linux.dev, conor+dt@kernel.org,
	devicetree@vger.kernel.org, robh@kernel.org,
	Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v4 2/3] pwm: rp1: Add RP1 PWM controller driver
Message-ID: <aiwO8Ac6btqSes8x@apocalypse>
References: <8eef956a5eb473f051bbda89ec4c9991c1b47de2.1780498640.git.andrea.porta@suse.com>
 <20260603154716.1B5C41F00893@smtp.kernel.org>
 <aiGAINsTG8VZLn28@apocalypse>
 <aiHn5-gQMbjttrR6@monoceros>
 <aiL-DWqU5bnIPL8B@apocalypse>
 <aiM0VlVXAWs54v-G@monoceros>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aiM0VlVXAWs54v-G@monoceros>

Hi Uwe,

On 22:51 Fri 05 Jun     , Uwe Kleine-König wrote:
> Hello Andrea,
> 
> On Fri, Jun 05, 2026 at 06:49:17PM +0200, Andrea della Porta wrote:
> > On 23:28 Thu 04 Jun     , Uwe Kleine-König wrote:
> > > Thinking again, the tohw() callback could be a bit more clever and also
> > > use period_ticks = 0xffffffff, as this fine if duty_ticks is less than
> > > this value and if duty_ticks = period_ticks = 0xffffffff you can still
> > > configure the hardware using period_ticks = 0xfffffffe to achieve the
> > > 100% relative dutycycle. (But keeping the current behaviour is fine for
> > > me, too.)
> > 
> > I think this is what it's currently doing in this patch iteration. I stand
> > corrected here when I said that period_ticks should be at max U32_MAX-1: logically
> > it can be U32_MAX but it's getting 'translated' into U32_MAX-1 as the value which 
> > is fed to the register. So the period is still U32_MAX, accounting for the extra
> > tick at the end. So I guess we're on the same page.
> 
> Not sure you got what I wrote. You can use the maximal value possible in
> hardware, because for all but 100% relative duty cycle it works as
> expected. You only need to map 100% relative duty cycle with that
> maximal period to a different 100% relative duty cycle setting. I think
> PWM_DEBUG even doesn't yell at you for that. (And if it does, that needs
> fixing.)

I see. Since you said that teh current behaviour is also fine, I'd prefer
to stick with it to avoid complicating the code.

> 
> > > > I'm not sure whether an inverted polarity pin shoudl stay low when disabled.
> > > > After all, the inactive state for a reversed pin is high.
> > > 
> > > Sashiko's concern is correctly stated, if you go from
> > > 
> > > 	polarity = inversed, enabled
> > > 
> > > to
> > > 
> > > 	polarity = normal, disabled
> > > 
> > > the output stays high, which is active for polarity = normal.
> > 
> > Ack. I'll set the polarity first so there will be no uncovered corner
> > case.
> 
> You can, but as I wrote below, being lazy is also fine.

Already done :)

>  
> > > However the behaviour of a disabled PWM isn't specified, so any
> > > behaviour is fine, the only objective is to save power. And if the
> > > consumer relies on a constant inactive output, it's supposed to not
> > > disable it.
> > > 
> > > For me both behaviours are fine. Making the hardware emit the inactive
> > > level might prevent a surprise if the consumer isn't aware of the
> > > missing guarantee, but being lazy and so surprise the consumer is also
> > > fine as this might uncover that wrong assumption and allow the consumer
> > > to be fixed.
> > > 
> > > (And not all PWM implementations allow to configure the output level, so
> > > a guarantee cannot be given. Some go to 0 irrespective of the configured
> > > polarity, some go to High-Z.)
> > 
> > I was just curious about sashiko saying it's violating the pwm framework
> > expectations, while according to your words it seems there's no constraints.
> 
> In doubt trust me :-)

Sure!

> 
> > BTW, I've tried to install sashiko and use it on my patches but it's obvious
> > that some custom settings are in order, since all I can get is some error
> > aborting the review after 3 attempts. Any chance you can share your Settings.toml
> > or any customization so I can test it in advance before submitting the new patchset
> > or do you recommend just throwing the new V5 at your script?
> 
> Note that sashiko is not "my script", it was setup by Google engineers
> and I have nothing to do with it (apart from benefitting from its review
> feedback). Kevin (added to Cc) tried to setup a local instance with his
> Claude plan, but (IIUC) it quickly ate his day's amount of tokens before
> completing review of a series of only 4 patches.
> 
> So without knowing the size of Kevin's or your AI plan, probably it's
> easier to just rely on the public instance. (And IMHO that's nothing to
> be afraid of, just handle it like a human reviewer. For these you also
> don't know what they will reply for your next revision.)

Ack.

Regards,
Andrea

> 
> Best regards
> Uwe


