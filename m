Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9800737D11A
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 10:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780482436; cv=none; b=FnpdNV3Vfp2X4l+yBGV2jfxOs368R+RLdoCZ5/0ERakFI62nQlBY9YO2GZbGIt8tnRztfBe1r4krQJZR0l2sdoRgIT6QSIRfuWlTGwS9FwXYTD/BHWpeAZ72oVlqvgqlNeAt9quZ3q0v6UumfzwrxMe0VU+OLYO7EkdYrd+eroA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780482436; c=relaxed/simple;
	bh=Ark9em2HE+VudWaYABBUGSqA5V6yzvpN+95Dp7fRXKA=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S82HN7h/u9Yose9eq5mo7IYH6r9KLGszIOwzp3c+GhVmWdBigI++ziBeZqJrTdHPlGz+CtvH8s91JWhAsamoSfnNQw8++6WGk8GQRMoqwj9ii6GPikRVUJBez0MGg7BvHZGaE3lEJ4xhehBIbR4AuaHzt+hKpCGKsPmGRZST4M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CHA6gZNN; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CHA6gZNN"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-68719234fd8so7073917a12.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 03:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780482434; x=1781087234; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H+8/3rc9t6wT4lr8p2D3TwP0o4yczLstnY4MzI08CwE=;
        b=CHA6gZNN8ODXOaN2r642vRk7BH81kSPVTL1m0AWIn2AeYvT0cIXJooZ3HF+BdFIzOP
         nimFmTxoHG7q5b4+pIaJ1u2JNmlmRUP0tIeg+KOjnSSkc/LTy9NL5DlUEUa+tm5j7Srj
         +cuavPNRl4mbw/SSA+uDRWM/oa8rArc2zP8f5/iimugTA3aAE1hAEOW/JMzNzu97T5ud
         0lkC3KZ9I7ri/o5Uztl3kZS92WSUOqHSKfvNx/LAIf/+tvdG+hFf3Sbt/MReIjk/d7YR
         AxD5IdPfTEdcuR5Cn720jnxrFASk4BqaOHcklSgFBSCfnf99an7WnnSJtg0EF7BYbBtn
         j+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780482434; x=1781087234;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H+8/3rc9t6wT4lr8p2D3TwP0o4yczLstnY4MzI08CwE=;
        b=UI+pYh2xD838+FzCRs6g6m2BI6LkidojIImgJa4e0ozvAJ9Dde4xODBLtgObRw+MNW
         Tas6Ejc9ozwm/lOPcvWNkUMnFKsvSur7GPlUqe00TlZbYp5hq6eA4sNmZaGZHYXkMbJP
         WOvn+CKKTFfKUzvcEygDj7GO8JfSztiJXNb0Nmpgo7Jin/Bb3u0N2R6FudagH/UvuVAq
         /MHb/GIcny/Ro28+ANdr/TwaZJGT9CJx7at+8UvfzwErKYtiAtAgLIZVyTv9XThGaifb
         +qgMYdmdrFeM03tXPGDbCOu4yZT4VYSpY/pAkNaCfF4BNgiONi/f2t8qw/Vts4rGI9LM
         qqDQ==
X-Forwarded-Encrypted: i=1; AFNElJ827lwR3vr8/Th0qVQEBG7Ym2YTwQICiOXvEQlldAUioXKInEejC9zWqAsNLkLQOHtx0X2yvLdJarcK@vger.kernel.org
X-Gm-Message-State: AOJu0YxvOouozoklwTuAVG+4yTVTaV83y/dBNHCwokeGnS67Uwu0GNdb
	FiXVYv5IVnHYmsjfajULkfIXj9ky7Q7eNv/OhvXBd5rdJ+kym4DoD4uh
X-Gm-Gg: Acq92OE5gkAfniG9eR1gZQvfY53j56CYMmPfCD0gzX/uSadJ3cETmUlkNsAu1klTuxT
	L7K5fKwuRulQvh3a4grUh57TE93NUj+/ihfnrKqlcmNBfJJV0bflCDRlPM+UdTgXQFZomqi5XL+
	UpRVHWa4TKA9E+O51WH7AMNbFc0p5F2DDLGUaM2eKhidOHhzDNdN+bEmN2855ysJcJVxUXC2b4m
	9G5hhbyD4ek/yWU6Ld8SvJuvc5AcVY0qxTlxT3q96rWlneeNwmRuUMuoz+zaMc4WU+/H5Uw5CgS
	9iGZTfJ/Dti2v5Cz/Cx6ovs1onIqYWe4brMDMztL/wVVVgakRg+tyrJpl/OJFE7qpcIbpnN8Bgi
	ffWsIKQ1qgFVkQ5HudvJw4GzO8rKuAvEMbQRRyuSIIPHQREDHwYh6e2cRF+2wIR+bQfEyTr2do9
	R7SEdVrUingwV+aWi/9rj5atkTRspZzo9bjckEsxVI3prrRfQpkSPcFadShv3PRH5kq+5NGcOUg
	5Yhuui7oJ8u4Yoye4nktQSfF9ocRl2VdBK3cyS6Xz71K132KA==
X-Received: by 2002:a17:907:3890:b0:bd8:f7f6:92a6 with SMTP id a640c23a62f3a-bf0b32b8a7bmr154755466b.23.1780482433765;
        Wed, 03 Jun 2026 03:27:13 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.131.netskope-rdns.com. [24.206.116.131])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0559f1464sm130550366b.55.2026.06.03.03.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 03:27:13 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Wed, 3 Jun 2026 11:27:11 +0100
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	rodrigo.alencar@analog.com
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v15 02/12] lib: kstrtox: add local
 _parse_integer_limit_init() helper
Message-ID: <r54csg73lsafo6rff7gew2eardfag3zmwjbm4jl54pjbqf6w7y@axnfog5wpney>
References: <20260531-adf41513-iio-driver-v15-0-da09adf1c0dd@analog.com>
 <20260531-adf41513-iio-driver-v15-2-da09adf1c0dd@analog.com>
 <ah8yR3Os8NDNll27@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah8yR3Os8NDNll27@ashevche-desk.local>

On 26/06/02 10:43PM, Andy Shevchenko wrote:
> On Sun, May 31, 2026 at 09:30:45AM +0100, Rodrigo Alencar via B4 Relay wrote:
> 
> > Add parsing helper that accepts an initial value for the accumulated
> > result when parsing an 64-bit integer. It reuses current implementation
> > for _parse_integer_limit(), which now consumes the new function with
> > init = 0. The diff algorithm would have the documentation header and
> > prototype of _parse_integer_limit() moved around so it is adjusted
> > according to guidelines.
> 
> ...
> 
> > +static unsigned int _parse_integer_limit_init(const char *s, unsigned int base,
> > +					      unsigned long long init,
> 
> Why not name it res...

"res" is short for result and this is an init value. I suppose the compiler
can optmize towards that kinda of efficiency. I thought of "p" itself to
carry the init value, and the function would just accumulate, but that would
change expectations on the function behavior.
 
> > +					      unsigned long long *p,
> > +					      size_t max_chars)
> >  {
> >  	unsigned long long res;
> 
> ...and drop this one...
> 
> >  	unsigned int rv;
> >  
> > -	res = 0;
> > +	res = init;
> 
> ...and this one?
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

-- 
Kind regards,

Rodrigo Alencar
