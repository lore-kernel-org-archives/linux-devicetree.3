Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B9740DFDA
	for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 08:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777190555; cv=none; b=N+W0ysckE9dX2QcicvKy3hvg71w9IJx7wYjli44cYnihs+7yIR8UHsAzapicHLVL/84xMnmCBAX8AkvtyLPrYRuxRC3VjYqT83SG0JISeMq02pjcTpBCYv0zRDlVolIKo8MbXHMLw9sNS1XYCQHCJfpfidC2S34pbQMjyYVL7cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777190555; c=relaxed/simple;
	bh=XsaRMfhCO0nZB4jMrQV6CzGmjKsoR/dI8GgJRwqoZ/k=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u0pcQmZ2JEogVe0s8aNZDzdSMTKaWvfr9R89adIWv0pBk2ll58nVgaJKaJdPaoegWEGOeNKxiuJYhGqcRE4hxp/Oh5nE/FCKjWFX3AgnaaGiiXj45qOZ7OyOB2F8VjW7/QSGPk3qEdxWZhu5B4jgteBWNGyV4rsitWxkzGMVjpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hO0dCqvh; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hO0dCqvh"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488ba840146so82546175e9.1
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 01:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777190553; x=1777795353; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3fGYomxVnuRzyBPEOqDgFLPn+GSFKuRtiOgJCbOKeHI=;
        b=hO0dCqvhnA+Fv3dLndByFr/KMWYZ9yqxLad0h97HIxAewYku10HU5VxrPdAQAMlbjz
         MZY/YmEYbb0XlJFE4zNNn6hgPJ13v55c8iEgzcX0pQEpdN3n3NBU9OJ47ZEIkGaMOB/O
         0Qzbp4NS2KMO5W/HyDIpbm6maShSaYzGT1qvM0EIINLJ7j+z5kfF8O9Jg4GUdW3opN29
         PgfMtbrSEBsjF5QqLWO0HFD4hblMvf4GhuM4f5oGPcjw20MjajmQQTd1ZTbhnEVSNBMZ
         01OtezbCJzV1R3cVeYiCy4aQpTBukto7tg2wkJ92PstQn4tYJ9L36YfgpoM4vfBOCpAR
         kJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777190553; x=1777795353;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3fGYomxVnuRzyBPEOqDgFLPn+GSFKuRtiOgJCbOKeHI=;
        b=CU73mS5vyDbL28wu+lmbXjTEFypUaWt6jUh6xDiw92S2mhBV+/Ggp4Co2biEAQ2iKf
         ue3PHTP0rFvwPRykT/hBekPzsXCdo3K4J6oAEprLEm0CrJf12J8EaJ0vcVF0nnaKeglw
         sD69n1O2eiGCCSkWaLtn27igOBwd86IRdD3RHC4kbgn7DAryIez0iyzEA/MWCd0XQPWh
         G7nxozXIFtYwgYKAtrIJIhhhgLW8KCVmhcXmBYpUKYV+IFxp+IFQAHRUtMa6ZCTjzdFO
         O4EZq4Q+g05lN7hkwqDEOZfpE4pr0SRL/t33pvTARx26zuWikIr7lV3usRVp+qHjtaC3
         ToeQ==
X-Forwarded-Encrypted: i=1; AFNElJ96O+U/2QXm9B9VrFh08Ol6zZta8RAwyBvV+P9gm+drZN7gog3gqXbpErQqAw2Wz8O49kG5g1zuu2cZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzgUOSqrJQJOmTtj0Oj+Rca9gKZ0AkF1GqZ8nyJdU7+58/MXoJm
	/P2s+DjN80twL93p7N9HMGrbTtosEXz51ztPAwHJ96l22epCK3oY48P2
X-Gm-Gg: AeBDieu1yhekz1gmlWxw+AXTxWlzvvsA8P4T3pA8JUhpg9juv4O0/SV3gaFVMKqAgJg
	/FfgUDvbvMFDWcJ6EBnDF8zen0BRT6gYe5Kt/8PjMizEW+3NTAb033AFaTHj8YJgR70HxJ374eD
	0jc2VWL97Gh2/F41KUiJhauVCK9h2Qbabdx5LoCqBPEFWnbuYTxA1tv6Kdgg/L1Wm5bxBF9n9px
	49YC212XHksh6ckEMUIOnjT5b2UnTys58JG9CpiZ02ONPXg2GBqouG962+8cANU4KEjhFJq8cHt
	V93//QP7DMXw6CyOGUbnHAOOoCwaPZsoYjYzPQJztB9j802iyR2hJR8ScqmhUWr7SFy+tBQW+d7
	eCnioQjQFkcXboMXCpeeu+5UZAfj49UPTNyTh4B39LTzsNKYhJBi2IblHka/ScDEaPe6C9mG5Mv
	TcwH17lEPwSj9uYdyX5xwRP3i1II3qxJOesLByDWZfKA5c679pdx9YI+rnx6e6LZyd6giEyt2+I
	VewgLgEuR2VTJShvF5JdUfITvFzJYxi+Pq9ubXqLtCZ2mfWqjur/5MLuFbB
X-Received: by 2002:a05:600c:c085:b0:488:c530:48a0 with SMTP id 5b1f17b1804b1-488fb784843mr432614835e9.24.1777190552498;
        Sun, 26 Apr 2026 01:02:32 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a5549f582sm127037955e9.33.2026.04.26.01.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 01:02:31 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Sun, 26 Apr 2026 09:02:26 +0100
To: David Laight <david.laight.linux@gmail.com>, 
	Jonathan Cameron <jic23@kernel.org>
Cc: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>, 
	Rodrigo Alencar <rodrigo.alencar@analog.com>, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, 
	Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v10 02/11] lib: kstrtox: add kstrtoudec64() and
 kstrtodec64()
Message-ID: <o5m4mp6qrt6pzhns4q5vyxc3fwlat7675a46wpr2phjbveosw3@rwmdqelfnkix>
References: <20260415-adf41513-iio-driver-v10-0-df61046d5457@analog.com>
 <20260415-adf41513-iio-driver-v10-2-df61046d5457@analog.com>
 <mhfgedq2t5lqtu6535ahdmpbvib2xzp2hmyt7ezflnf52r56jh@ze6tee7vpij3>
 <20260425164006.17b75faf@jic23-huawei>
 <20260425233316.0a2e2abd@pumpkin>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260425233316.0a2e2abd@pumpkin>

On 26/04/25 11:33PM, David Laight wrote:
> On Sat, 25 Apr 2026 16:40:06 +0100
> Jonathan Cameron <jic23@kernel.org> wrote:
> 
> > On Fri, 17 Apr 2026 09:36:20 +0100
> > Rodrigo Alencar <455.rodrigo.alencar@gmail.com> wrote:
> > 
> > > On 26/04/15 10:51AM, Rodrigo Alencar wrote:  
> > > > Add helpers that parses decimal numbers into 64-bit number, i.e., decimal
> > > > point numbers with pre-defined scale are parsed into a 64-bit value (fixed
> > > > precision). After the decimal point, digits beyond the specified scale
> > > > are ignored.    

...

> > > I have an alternative (slightly more complex) implementation of this function
> > > that handles E notation. I find this particularly handy when writting big
> > > values like 25 GHz when the ABI is defined in Hz, so instead of writing
> > > 25000000000, one can just use 25e9, or 2.5e10. I found that my python code
> > > was printing big floating point values or really small ones using E notation
> > > and that was giving me -EINVAL, so I had to adjust formatting when generating
> > > the string input to the file. No big deal, and we would not need this here,
> > > but if maintainers find this useful I could add it into a v11 of this series.
> > >   
> > 
> > I'd rather we didn't slow this one down. However I'm waiting on some tags
> > on this patch from folk who are more familiar with these parsers than
> > I am.  Given discussion, Andy or David Laight perhaps?
> > +CC David - please make sure to include folk who have been active
> > in discussion of earlier versions to decrease chance they miss the new
> > one.

From Andy's message "We still have several weeks time", I thought we would have
time to discuss this e-notation thing, but that's just a nice-to-have indeed.
It fits well in the decimal context, as it is widely used and works in powers of 10!

> 
> I can't help feeling this code would be smaller if it didn't try to use
> the existing conversion functions.
> Something like:
> 	u64 r = 0;
> 	unsigned int n = ~0;
> 	while (*s == ' ' || *s == '\n')
> 		s++;
> 	for (;;) {
> 		unsigned int dig = *s++ - '0';
> 		if (dig <= 9) {
> 			if (!n)
> 				continue;
> 			n--;
> 			r = r * 10 + dig;
> 			continue;
> 		}
> 		switch (s[-1]) {
> 		case '.':
> 			if (n <= scale)
> 				return -EINVAL;
> 			n = scale;
> 			continue;
> 		case '\n':
> 			if (*s)
> 				return -EINVAL;
> 			break;
> 		case 0:
> 			break;
> 		default:
> 			return -EIVAL;
> 		}
> 		break;
> 	}
> 	if (n > scale)
> 		n = scale;
> 	while (n--)
> 		r *= 10;
> 	*res = r;
> 	return 0;
> }
> 
> That is missing the overflow detect for the multiply and add.
> While check_add_overflow() hopefully looks at the carry flag (on non-mips
> style cpu), I don't know how the 'mul' variant works - it might be horrid.
> A bound check against ~0ull/10 might generate better code.

It may be a compact parsing but aside from bugs or typos, there is a readability
tradeoff. For the context, yes, it would be better to accumulate interger and
fractional parts to the same variable, rather than separate ones.
_parse_integer_limit() would have to allow for a custom init value, so we could
just skip the decimal point and resume. The proposed implementation reuses tested
infrastructure and follows kstrto* conventions. I suppose the most important thing
to review here is the new interface with its function prototypes.

> But I really prefer functions that return the terminating character to
> the caller - they are more useful for parsing compound parameters.

I agree, I tried something like this with the kstrntoull() approach.

> > Maybe start a discussion about whether adding e notation as a separate
> > thread after this has merged?

Agreed.

-- 
Kind regards,

Rodrigo Alencar
