Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE173B2FF8
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 10:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780483507; cv=none; b=jbsTs35z23/MQUb7o9os4vd8IqRaUjVa5h6Jp4/z5iw6Hqr6gSTFJNeq/svAoE3tTLY9cesGhU276qSA5a6eV409s66cHqttW+GKGSJD2QxqX2iNmnYl1DR6dEQKQINPAVCF8lBYT7oTHaL5mhC/HHlueubUy78xwXHGjLlsIvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780483507; c=relaxed/simple;
	bh=m2iuCXAbLy+zZsi1XTpwT94AoT4yG6Hsm2KkBLsLDIg=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nIht18k8ILIUfQ40HdAAJC/khvjRRFMa+Eh23F2LJ9D5NmrLhtnbERLsIlwrH4UDnQoCYXoCwNK1Hi/uvNzk/IWzwhV8pcjr7wUIiKjPzlT9OQa65JqAcydLqxHlFHlwK3i6dM1OgVSKLx3jMxVMFL/HhYeNvnt7xdn6hGPaPCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BxJJDOhB; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BxJJDOhB"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-68c3421b009so860156a12.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 03:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780483504; x=1781088304; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uF6sxHTQksZQh/sifc1ca5X6iC08FJoq4YcfQBKz3ao=;
        b=BxJJDOhBoSa5uqEeGaNIG1CcZn0GYBKnCH8YigOHolg5ALD8qjKMclxbOAXbucCOKO
         QC1xWO5nG93e43oYb9KeJLO3zE0SIoGm0ju4PB5LjeUfxaw9KpWGvrAIL30qfixeuWWd
         gcLiDxyJqYo3waE7uHqJpey8Kg9EdvuofpwIbI/DrbrCZBOKilhw1sO2yp1U/Hza7rDv
         Tg+gHqXCBETgUwXCJiqUqO+XsnJuNonU684cbhtNGpu6IeOQ2LehtVGBHg4ISQY1ABxu
         CqrszOClS/jTJQW561KkA9xHCTQV3/fCr+ixamdVUrTRfEQHgOZhFslRM6jkKZOAi6k8
         /M1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780483504; x=1781088304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uF6sxHTQksZQh/sifc1ca5X6iC08FJoq4YcfQBKz3ao=;
        b=JzbWLuQtPn6CUwVtlAW0M/9QXD0bq8zGPbBO7sJzxApAKlI5dpPwmyEwX1QNJs/b3r
         DznoAuJho5BXDXn5jEW5Ag5V4WuNMHcNJRqzmFOIPRzf9qtSfHQZgP6S10OueEqxadDS
         K/V3b72HB/Zvb8xXCpIWJGTa6qceLl2IvpkeRmcep9thlOQZ/rCWoAHqmIu3wYBX/2/x
         A8/1NDQBWsl3nq0N8aqJY5EbveHQ8cPfkAqEovOXKD7LvqAq2pP08h/+pmzzlJwT2zGT
         WeAfxbP9dF/y5JxGSKZNqcxt/aq+lIN0nOfjtN3sNjJnxDjaEgrL44QYT5m/CjlSKBrC
         k3Rg==
X-Forwarded-Encrypted: i=1; AFNElJ+qd9mknY2TcZTHQ4P1chCaIOmxy4MFbxvOdXlRFoUW4tJ7AKB1A+NgPA3UdB/zfeyjzFC5s8iWomrB@vger.kernel.org
X-Gm-Message-State: AOJu0YzZF8GxVT7MVYkGVK1H2xquTzzsTM9A4HPi5/QPZi/YjZKJUzj6
	Wn4RGR9XTyV5/w+zeI6h6kTqXyi1VDG9y9UCLVvjDKsvm3H8K7X67Zu9
X-Gm-Gg: Acq92OFb7o6P1gjKyYGuz+hcds9nu4JIn19FNAAYZEtrZKJaqlEHuBxB+jMXaQ2bAV2
	3V/Hyo//RGsOcnFysRvoeljW3/Al3TMDen6zEe+nXJKFdrNTYJTbThWBGKtjKxKASqBd3/HeciV
	2pm3JMkSwJubrEdWZP0ja4S1kjDUK9Fn0g3xHmpWq1C7yTWVyzWix/vOS6P93qt8/CB1/1GyV0Q
	7VyEdnO3U3rrON0gO47KgpbQ/Fl7ysUuE6ZjdkjO9N9dr4KsYrFDNZ5caXWT1UnIIo10fOQl3XP
	TiC8npedDOnbVk9FSf96I55Y45KuRVI85qy4g1jwA9PlTY15gXODANYetkTdm31f8xth8EeNfpi
	kJYhyaG+elA8bzOQUli1DSKxAqpH7L0/PeWqBfzT81c9XpCVo8uVJyPrIbHH1if2IRDAyQZagB/
	wDl57Dt2k0SDd+OoEI+LwFTwAlDF4hvLF2lnLcbpZeMCFGxQr8PJetLldJXx6rMHUBlbCHuLQWK
	i45lMcfbCyyNVmvZKEukYNGge2LnN9SVoyo+UMrwKFzxxKA0Q==
X-Received: by 2002:a17:907:2dac:b0:be1:4955:a0c9 with SMTP id a640c23a62f3a-bf09ea65889mr115670566b.21.1780483504201;
        Wed, 03 Jun 2026 03:45:04 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.131.netskope-rdns.com. [24.206.116.131])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65867e7dsm968600a12.20.2026.06.03.03.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 03:45:03 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Wed, 3 Jun 2026 11:45:01 +0100
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, 
	Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v15 02/12] lib: kstrtox: add local
 _parse_integer_limit_init() helper
Message-ID: <rb6mrxl7nquyg6ewfzvhsdij2ov5mrm5owulhuwfgmyd6a4a4g@7simkr4ovkxr>
References: <20260531-adf41513-iio-driver-v15-0-da09adf1c0dd@analog.com>
 <20260531-adf41513-iio-driver-v15-2-da09adf1c0dd@analog.com>
 <ah8yR3Os8NDNll27@ashevche-desk.local>
 <r54csg73lsafo6rff7gew2eardfag3zmwjbm4jl54pjbqf6w7y@axnfog5wpney>
 <aiAEmS7aa5p1Fi7g@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiAEmS7aa5p1Fi7g@ashevche-desk.local>

On 26/06/03 01:40PM, Andy Shevchenko wrote:
> On Wed, Jun 03, 2026 at 11:27:11AM +0100, Rodrigo Alencar wrote:
> > On 26/06/02 10:43PM, Andy Shevchenko wrote:
> > > On Sun, May 31, 2026 at 09:30:45AM +0100, Rodrigo Alencar via B4 Relay wrote:
> 
> ...
> 
> > > > +static unsigned int _parse_integer_limit_init(const char *s, unsigned int base,
> > > > +					      unsigned long long init,
> > > 
> > > Why not name it res...
> > 
> > "res" is short for result and this is an init value. I suppose the compiler
> > can optmize towards that kinda of efficiency. I thought of "p" itself to
> > carry the init value, and the function would just accumulate, but that would
> > change expectations on the function behavior.
> 
> > > > +					      unsigned long long *p,
> > > > +					      size_t max_chars)
> 
> In any case I hope you saw my mini-series:
> 20260602203706.103449-1-andriy.shevchenko@linux.intel.com

I did. It looks good and it fits well here. Although I suppose that would delay
this one bit more.
 
-- 
Kind regards,

Rodrigo Alencar
