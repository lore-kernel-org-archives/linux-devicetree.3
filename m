Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9251FCF41
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 15:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774624635; cv=none; b=cG5NOS1L7v6F0EuOtxIpbkKAUQE1gVascOVC3UA0FcTQ6rVx4mZXWaGvJAwEq4Ylt+r7jHzk5T+zD2IE7m9FQc6bL1DvbvVfI1gmXkOse2qlybj3+dEmdL4Dcv7ahHISnyPovUwB0n1bBRdDd5XmR9aAitTAmoXWON9AUwaKUS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774624635; c=relaxed/simple;
	bh=YhMY8m8lhMloOdkQJ/lFVmybXo6krCBolUEHpLOX6vo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YJpu36ov8VpbaZ19d7c9f2Z88TDjHbmiNeXnpTWhkVpKbDlmDgPOxGWQ0u0lqWaHRvSKJKayadixUumXzybdBbcON1DMehF/m8tvwCIzpf+00+SjO9aKVl62Q8HsvCIVCzZC9lebj2swAjC49dzEoQce6zNGDSwK1zH36Et1Dew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MuRefvmF; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MuRefvmF"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b9841aecf72so258997566b.2
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 08:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774624632; x=1775229432; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gUuubS1+3njuAPGTqHH6+3IW1O4jcFu6Ae6+Wh76UDs=;
        b=MuRefvmFC6lNyhIodxUchXClrn0ez7PkcDlif1BIOAfrYLV/eHpg9yLMaWtKEoVJHE
         ed1KhaDxJlQ99qqLcmccZYgLEIcetf67o4wUc/7rQXFK5RhKdjyG95DjhbxUAYZQaqaQ
         DgcDCaHOZ+90dntL42/U4TiMlQF0XT3/LeHFrYBLErOu0T3n8LsSBjJlQARSA+dcVNQF
         1vtTjJYJ4DIIeEh7lZQ2Ie0LE9nrJwu4omDzLY4Rpy5NHBzmtMGvuXgeYLxuOyp73okp
         34qpzljvLv3ajr+sd9/4yyJFl4mjE5AigmnMJmApbs5wYLMeWbrLjDREkrQK4885wZUF
         FizA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774624632; x=1775229432;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gUuubS1+3njuAPGTqHH6+3IW1O4jcFu6Ae6+Wh76UDs=;
        b=KD3ALjVRpjHdjqrsVcr2pDRHDBoA3W2cW99nQvZ9QtWQWoQLBydpMRoGe8WjIwq9WO
         XmCZShifg/i3Dtp0IfuMA/PFY1lh0c/ZMN9txPAOvPVLWjR0eWcMBJ+bC8MyzPrpxWZS
         ubTTIm8kaCy67P4Ab/rEzOOQclYskFrAX/i0xeM5ZH8Gwq/7LQjhXpFa1NRHH1O+6jOL
         T35ZXlsbB8gUPB0J2/WoxiG1p8vcDIGFKwpA9KFC4wAp0LjMEQDdhLHo/jCSBgWx5cyi
         SHFXIAWVtBIfOAP70EXQnYY+PjYat0kBS7tqG38ZGoCOpEGRsS9hYVvb74x5oVvlkEG/
         gnAA==
X-Forwarded-Encrypted: i=1; AJvYcCWUgOxIB8TZYdCk7dKV064YZYHQ6rdY/LKv+rIWt/Dy4vU+cBdm3+D8bNczo1qm1h0FpprWwUU5CqK+@vger.kernel.org
X-Gm-Message-State: AOJu0YzVdMD+lBQa1/HCd6qkJHMjjJOJUylmKPVIbrkWmpmfoMP8tvRd
	GstZSnx0K78zdUNg+2uWUTyi745NWy3H/b/258EM0drD/x30Ty1mjUii
X-Gm-Gg: ATEYQzyWXT3OtTLWR7V5N9ZhIbbY4qWWFkmfc+7r9jfDim1dCNbYpFEyWAFk8x4/a1o
	8rHJOLXL/5TVP5yymWJbV7FF2f37X+VBfJHILe47FubJTkKSnToVQ+SWemsiSIHY82Fn13+UI/d
	cPJ4Mz3PD7cI4+T4bpAWGWYTSLv7APe7ieaN4oo4ZSGGGiU+cu2qZ4z6XKPoAF/7BULDejSO+hK
	o0Nv21RhUCfdwJcVCq78crCbf/HSRjcl1E0+hlq345HKOCwP0xnbS1gBf/CwfbMMGvi/MGlHPsC
	PN56BgaAsCXZ5vNaGyAvjPG5RfS8VuEw1n8qVSE27eIi2PzGctIh6XxKibD2v13CzQxmUFLc2tn
	curdsN71W8K6vtX6KKfDKUTs6gPmfF5af2Vb5BIvPeqCK+bJaZR/MT9S+pj3ERhkGocZQ1zlLcy
	vMQZtwksXYIA8sR4JiXnHMR4yXgVgphc4csh2t0MlRZwNa3hDBfH3UNei1aJbpMAnq0/iGVCgo/
	RT4/l3rGtvjFkMYTzkoU/INJy6qj71NCDKfiqCpIRHyc9ubTQI=
X-Received: by 2002:a17:907:944c:b0:b98:45fc:241d with SMTP id a640c23a62f3a-b9b507b0b37mr184899266b.37.1774624631951;
        Fri, 27 Mar 2026 08:17:11 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.131.netskope-rdns.com. [24.206.116.131])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20219193sm265402866b.9.2026.03.27.08.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 08:17:11 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Fri, 27 Mar 2026 15:17:05 +0000
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: Petr Mladek <pmladek@suse.com>, rodrigo.alencar@analog.com, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v9 2/9] lib: vsprintf: export simple_strntoull() in a
 safe prototype
Message-ID: <x34d7jz7be4ommjh6efx5mcq5pbpellykwuyrqayr4ske3lywf@wh46mu3anmcz>
References: <20260320-adf41513-iio-driver-v9-0-132f0d076374@analog.com>
 <20260320-adf41513-iio-driver-v9-2-132f0d076374@analog.com>
 <acZDneLrIPOmU5ci@pathway.suse.cz>
 <acZLHAT5qJyjKTsp@ashevche-desk.local>
 <4uijfg4efzaapu3esobez55hfwqzszwagpeb4lxej2ybmifu76@s3c57fmnsme6>
 <acZaGUV0MwuHNDru@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acZaGUV0MwuHNDru@ashevche-desk.local>

On 26/03/27 12:21PM, Andy Shevchenko wrote:
> On Fri, Mar 27, 2026 at 10:11:56AM +0000, Rodrigo Alencar wrote:
> > On 26/03/27 11:17AM, Andy Shevchenko wrote:
> > > On Fri, Mar 27, 2026 at 09:45:17AM +0100, Petr Mladek wrote:
> > > > On Fri 2026-03-20 16:27:27, Rodrigo Alencar via B4 Relay wrote:
> 
> ...
> 
> > > > > +extern ssize_t __must_check simple_strntoull(const char *startp, const char **endp,
> > > > > +					     unsigned int base, size_t max_chars,
> > > > > +					     unsigned long long *res);
> > > > 
> > > > Sigh, naming is hard. I personally find it a bit confusing that the
> > > > name is too similar to the unsafe API.
> > > > 
> > > > IMHO, the semantic of the new API is closer to kstrtoull().
> > > > It just limits the size, so I would call it kstrntoull().
> > > 
> > > It's not. kstrto*() quite strict about the input, this one is actually relaxed
> > > variant, so I wouldn't mix these two groups.
> > > 
> > > > Also I would use int as the return parameter, see below.
> 
> ...
> 
> > > TBH, I am skeptical about this approach. My main objection is max_chars
> > > parameter. If we want to limit the input strictly to the given number of
> > > characters, we have to copy the string and then just use kstrto*() in a normal
> > > way. The whole idea of that parameter is to be able to parse the fractional
> > > part of the float number as 'iiiii.fffff', where 'i' is for integer part, and
> > > 'f' for the fractional. Since we have *endp, we may simply check that.
> > 
> > A max_chars would not be only useful for that. It can prevent out-of-bounds
> > reads when the input isn't NUL-terminated (like buffers, file chunks,
> > network packets, memory-mapped data, ....). Even if there is a NUL later in
> > memory, a regular strtoull() function may consume characters that are outside
> > the field one intends to parse.
> 
> Okay, but is it the current case or just an attempt to solve the problem that
> doesn't exist (yet)?

The current case can be seen as such. Copying the string and use regular ksrto*()
requires an unecessary scan of string from the user side, which is something that
_parse_integer_limit() already does, mostly because it checks for digits and stops
at any non-digit character. In the IIO case, we also want control over the consumed
characters because there are weird terminations like "dB", so having an implementation
like this ends up with a cleaner sequence of steps. 

> > > In case if we want to parse only, say, 6 digits and input is longer there are
> > > a few options (in my personal preferences, the first is the better):
> > > - consider the input invalid
> > > - parse it as is up to the maximum and then do ceil() or floor() on top of that
> > > - copy only necessary amount of the (sub)string and parse that.
> > 
> > Yes, my use case is the fixed point parsing, but I suppose we are implementing
> > things here for reuse.
> 
> Yes, I'm full for reuse, but I want to have it balanced between complexity,
> existing use cases and possible reuse in the future.

Not seeing complexity here as in this case I am just exposing something
that already exists! No need for a completely different implementation.
I just want to get an agreement on the naming and interface prototype.

Bringing back the discussion again just because I suppose Petr havent even
seen the v8 of this patch series. If kstrtox.h is the right place for this,
kstrntoull() sounds like ideal. Specially because simple_strto*() is already
labeled as unsafe and kstrnto*() != kstrto*().

> > Also, the default behavior of the previous fixed point
> > parsing in IIO is flooring the result, which leads to the same result as
> > ignoring further digits.
> 
> Correct, I also lean to implying floor() (as you can read below).
> 
> > > The problem with precision is that we need to also consider floor() or ceil()
> > > and I don't think this should be burden of the library as it's individual
> > > preference of each of the callers (users). At least for the starter, we will
> > > see if it's only one approach is used, we may incorporate it into the library
> > > code.
> > > 
> > > The easiest way out is to just consider the input invalid if it overflows the
> > > given type (s32 or s64).
> > > 
> > > But we need to have an agreement what will be the representation of the
> > > fixed-width float numbers in the kernel? Currently IIO uses
> > > 	struct float // name is crafted for simplicity
> > > 	{
> > > 		int integer;
> > > 		int fraction;
> > > 	}
> > 
> > Yes, but to represent things like that, an assumption is made to the precision that
> > "fraction" carries.
> 
> Correct.
> 
> > > This parser wants AFAIU to have at the end of the day something like
> > > 
> > > 	struct float
> > > 	{
> > > 		s64 integer;
> > > 		s64 fraction;
> > > 	}
> > > 
> > > but also wants to have the fraction part be limited in some cases to s32
> > > or so:
> > > 
> > > 	struct float
> > > 	{
> > > 		s64 integer;
> > > 		s32 fraction; // precision may be lost if input is longer
> > > 	}
> > > 
> > > Maybe we want to have kstrtof32() and kstrtof64() for these two cases?
> > > 
> > > With that we will always consider the fraction part as 32- or 64-bit,
> > > imply floor() on the fraction for the sake of simplicity and require
> > > it to be NUL-terminated with possible trailing '\n'.
> > 
> > I think this is a good idea, but calling it float or fixed point itself
> > is a bit confusing as float often refers to the IEEE 754 standard and
> > fixed point types is often expressed in Q-format.
> 
> Yeah... I am lack of better naming.

decimals is the name, but they are often represented as:

	DECIMAL = INT * 10^X + FRAC

in a single 64-bit number, which would be fine for my end use case.
However IIO decimal fixed point parsing is out there for quite some time a
lot of drivers use that. The interface often relies on breaking parsed values
into an integer array (for standard attributes int val and int val2 are expected).

-- 
Kind regards,

Rodrigo Alencar
