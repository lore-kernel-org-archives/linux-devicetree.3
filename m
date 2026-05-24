Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5F01D61B7
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 12:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779625807; cv=none; b=COrFSQHQ7Gg5p3MyXYN7f7Qq1Lz2DI4skdXEH8kVC/xUnCR6Njw+qNeBpBPZLxWUNwgeSh7NLJ/Kmd7mPCWIks7hWIDUsnTfkttD1V7tC4n7VUIUKblvzSxKwkl5xvbsHhIIsZj6VqGjnitA+qGIWmfR37TrLEMFVKoOdPDT53U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779625807; c=relaxed/simple;
	bh=ERoTsAxoECnJLoZkCdSBrxZOe8Upzt4O9Uj+YfgixCw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EWVCniRdFr7swBYd3wnrVcjoKhed8GPIbO4jBkzKvGPqcr3rSHhLYGYPRltFstD8YdAN5aNS/9bLP33uSP/Pb0hJoERbB9DQeINTCpjldMXKLE/nD4wTWPVnQKkjJq6CmxpRGfDqdTjIjdAeA/+b0vm3xfDj6Ql6IWSLlLLRcGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fNjesyUx; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fNjesyUx"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso111539295e9.1
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 05:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779625803; x=1780230603; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T1o+DvC19PR6GkTpTccEfjTify4jzFt0w17PhEVHA98=;
        b=fNjesyUxCwzSP6/O1jV8L47nm3Lc8Rb3gKfxQztn+6mSVAn7FXb8Rz7msnnsH07K0M
         GIr6IkNtzF+VPW4hCYyLy77k5+C0YiS4Qcj/G4Dtv0dLevVnaUz4laIPGVh2uek3p963
         b2PDIRvK+Z4WLlJH88vrrRFJsmXj7wsImj9wP+eLi16vtmHg0uiy3GCEeSPC5UxtSsnL
         EaqldWS6jq4Q4D8pgj5v/LWSrAnzlsJ0KHU/DOxC0fmxcIgroo49EAFiAAm+7ouKBUnC
         qfBBFdo5mdOdpEG4DJwJVweteUneN9sAlEa25HKkLOZqidGjFGj33EPTBJlWcGjyBF2x
         Fj0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779625803; x=1780230603;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T1o+DvC19PR6GkTpTccEfjTify4jzFt0w17PhEVHA98=;
        b=nlwFaTOELbBpKb2kyvGJystk9V6bHiG5XnkA8iwXJ+OrQjny3MD30ZBRtM6SzzjaRn
         56JFZxWzsGTHJcyokXB87LRQQU47mi9b4/BmfVBUaQp//t3QxNDobdIwm7q1NSM8yWyb
         9soIEKmhkNTuj/+DmGvWk6bi6N3XQCZcQT3gOFJyyePa6BVhVp6I6SUyCt6vPbsanK72
         5T+3OgiO1zsv2juz/VoLVwD/M3KCA25pIpAASQKUcQTK4rJx55Nn2m2O4Nd34CMkpNcr
         khlQZ1ZvIsW/sMT2moEmTTLY586tiDwjFbcnwJHaZGXxekDx3BMMrJKGujHDa6SNK0j3
         g8Cg==
X-Forwarded-Encrypted: i=1; AFNElJ9gsDVnNpDqIX/PqxU6Kug2/b8OjaxsbOG2O6+3YSQE/3MAQL4llOs8alV77+iloHV43SR0tXDtcoN4@vger.kernel.org
X-Gm-Message-State: AOJu0YwnQDuZNABSGNb/jNyeLIEL0eqWcDXPIbr1l4leWcZDtiNb7SWE
	XvKXTzifAb6fMJa/61is7bFR8OAeMbhhy73Mt5TsjjgOkk7JGOeNa159
X-Gm-Gg: Acq92OFSsj1RaYM9tk+9FSzKn9gmp9OvHG11HhYgwkq20nwsSnGYBqPS3quwSzbIqgn
	jo2BJoropi0SgjWDwUhaEgr5XWiG2BOwEddrTZ3vhfV/ICG6o2cdUpYBe6lrOo11SPR5OMnwwgZ
	QLZpV1ABfo1ZssLPmVupNUGA/W6ntOI//02I68mTCUNtz4jUaadC42NdVSNyp6hyd1EOfneByWQ
	G554CsHWO3zpNyPg+yb3jB54f1udBbojggccHWwiWjOsGdE0tToMcbVAax3/JvTbrc90fwOYwWL
	5Ikt95GOmWyTf4K/phI2AJASA76TcMQllssq85PNl+T97apZKbgcAkGsY4omuXuejGFG41/KOeS
	OPjRi0eyL475EohASk7MZoU7YI0YrxrFc3Wqu5UvlHB5VzOUnwdTQJgDYOsd8EY57ojdDbckIyB
	FCRaYsSqzu4jrJ/VJnRqM9TfO/LvVoweJgZTymc8NngjEVBm3DX9s7lYXbkdSz0+vCfsA1pBq0J
	n6LMPXVyMJY5Xg6byO5tuiWuFx83XHRFersS07Wxqqo9X0aRk2muxfeOMtU
X-Received: by 2002:a05:600c:3547:b0:48f:e6b9:c740 with SMTP id 5b1f17b1804b1-490428f30bcmr180656565e9.30.1779625803084;
        Sun, 24 May 2026 05:30:03 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490424aa561sm84023815e9.5.2026.05.24.05.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 05:30:01 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Sun, 24 May 2026 13:29:59 +0100
To: rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v14 10/12] iio: frequency: adf41513: features on
 frequency change
Message-ID: <ivren25tav5pgaynyrsujqo5zqfp4l52wu7jtlk5cotc62vbjs@nop6xcq6gjyj>
References: <20260524-adf41513-iio-driver-v14-0-06824d9c15f4@analog.com>
 <20260524-adf41513-iio-driver-v14-10-06824d9c15f4@analog.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260524-adf41513-iio-driver-v14-10-06824d9c15f4@analog.com>

On 26/05/24 11:15AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Bleed current is not computed or updated when switching from Integer-N to Fractional-N mode if the PFD frequency remains unchanged.
> --
> 
> commit 299bd27511dd5b2a2354c749631d53bcff158e2b
> Author: Rodrigo Alencar <rodrigo.alencar@analog.com>
> 
> iio: frequency: adf41513: features on frequency change
> 
> This commit adds bleed current configuration, lock detector window adjustments,
> and phase resync support to the ADF41513 driver when changing the PFD
> frequency.
> 
> > diff --git a/drivers/iio/frequency/adf41513.c b/drivers/iio/frequency/adf41513.c
> > --- a/drivers/iio/frequency/adf41513.c
> > +++ b/drivers/iio/frequency/adf41513.c
> 
> [ ... ]
> 
> > +static void adf41513_set_bleed_val(struct adf41513_state *st)
> > +{
> > +	u32 bleed_value, cp_index;
> > +
> > +	if (!(st->regs[ADF41513_REG6] & ADF41513_REG6_BLEED_ENABLE_MSK))
> > +		return;
> 
> [ ... ]
> 
> > @@ -630,6 +725,14 @@ static int adf41513_set_frequency(struct adf41513_state *st, u64 freq_uhz, u16 s
> >  		st->regs[ADF41513_REG6] |= ADF41513_REG6_BLEED_ENABLE_MSK;
> >  	}
> >  
> > +	if (pfd_change) {
> > +		adf41513_set_bleed_val(st);
> 
> [Severity: High]
> Will the bleed current be properly configured if the device switches
> from Integer-N to Fractional-N mode without changing the PFD frequency?
> 
> In adf41513_set_bleed_val(), if the device is previously in Integer-N mode,
> ADF41513_REG6_BLEED_ENABLE_MSK is cleared. If the PFD frequency changes
> while in Integer-N mode, adf41513_set_bleed_val() returns early without
> updating the register.
> 
> If a subsequent frequency change switches the PLL to Fractional-N mode but
> maintains the exact same PFD frequency, pfd_change will be false. Since
> adf41513_set_bleed_val() is only called when pfd_change is true, the bleed
> value configuration gets skipped entirely.
> 
> Could this leave the bleed circuit enabled with a stale or uninitialized
> current value, potentially preventing the PLL from locking?

This make sense. After adding the suggested guard for bleed enabled I should
have move adf41513_set_bleed_val() to be called bellow...

> > +		adf41513_set_phase_resync(st);
> > +	}
> > +
> > +	if (pfd_change || mode_change)
here..
> > +		adf41513_set_ld_window(st);
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260524-adf41513-iio-driver-v14-0-06824d9c15f4@analog.com?part=10

At least, that would be a quick one. We can have another round of reviews on
the decimal parse function... worst case, we can have another week.

-- 
Kind regards,

Rodrigo Alencar
