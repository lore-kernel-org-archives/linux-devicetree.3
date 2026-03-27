Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D839639E17D
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774606326; cv=none; b=RieBVfyN7vXIpGeUmYDSHu7ZD3W6b6YAHn8trPmmTudBRIIuYDdGvLHZDQcfNIONSD/FyBNWpu1bPJrsdZ5s3Yu9akjqDX+hoVwDtPMgnTfgipQeux947lFLSrXzGEoZwIMQ3m51RRXnHz1J1YliqusnsuhZn1Xe4w0wmN85QjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774606326; c=relaxed/simple;
	bh=emZndTB0StSeiKPV9wKo4qME2pfL/NkV8yDQkFW/He0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SwEVFlybR8deTpAGFKjAt3kDReYWHouYGcMSd3qyrEmLDCnFZufF3xjLk2CY9H0eDsBXXzh/N1OMJ0SVs9yDX3cPXq7GH1dDWrzehB70RixTG2drpI7XhUUIMvpp/B/wMqsKfalROh3/91n6xPhh77RRsWczhNtwHCuBg8JQ7pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FfDd8+E7; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FfDd8+E7"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439fe4985efso1457081f8f.3
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 03:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774606323; x=1775211123; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4ebKOUFGrIuktoxI72r0hHEVIqHTRxRm4Xw0zTvSKkQ=;
        b=FfDd8+E73w01cSEaWXKEpHhExjQm1JDvKrpUnim+J8GFpkkfbtTw4eGSrtBXwkbqpp
         RFADnvHLoCjCg1eE8puvNINDkKMCsxLJY3LB3l9GQZuv+ZCNzgppp9Nzgvm/DW9BS0Bw
         DN6JEx78/jEQxWLquJqQS8xJd8Xg0i31qWdh2Jrm80jEOrOKMNkAvM6qkRVvNaXHENAP
         i0NAfCfDBtclqMsmjxhS+bOpTwKVD846d3GYhhGYrHZF4sWLEbgSvVsVtJ+3ANGF6xwQ
         opyROm0hW4eBB2T4atx7oBYXKGTXzkE8s0fuI2gK5HXtFb47ktqsrC1MdDh4cj2L+6na
         zmew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774606323; x=1775211123;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ebKOUFGrIuktoxI72r0hHEVIqHTRxRm4Xw0zTvSKkQ=;
        b=FwO+gfCr9j0n3e5Ngnt37NQSlQegPxQMq/F4H86gF5zPOldDqjJANIfzTsS2Oqw2S6
         jeXVEvsZ4uA1lwVD5AApUANO1tM3DSXLLLACyY9qjfxT6sroVqgz7uzxdqO49nDdQRCk
         SkPFlfNrX9e6WEZLkM0+aPXhhmdIAtFvbtQMvAsEkTOHEysktf0E6+EfOwqU9V2X7D34
         5e26hQUCgRFDQ7/5vsXu3bOZ4rGeppkCyY6pXva/av/ZOci1gOibM2qmFBAeODcMmXxZ
         XvswRWgxorIr+uXUiWocGHLP9B73AvcffXKQ/ga4NsQ1GvHZvb6ocWhjEnqydnzFacRw
         qRDQ==
X-Forwarded-Encrypted: i=1; AJvYcCURUPdT+Q+P5PEXZWoTMJEt3EX6pPMEDvNlOXLerwYzHDyTj+M5JAR0f9mswgvFvHIhvZYA49SvgYUQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwO2fJHWySCFVk86DGUmvwwJT+3DCJhsz2MLY2Ssce1/st8qxEJ
	ro2B25XdX8S3B3QBxBMXG3eazR/ez8FN7TVlI9LpMiMs7p3rHNhDrOZW
X-Gm-Gg: ATEYQzw/9d12YxUJgWHGPQAtUXOlV2Dw0EIGG656/ZMMJUnks0k2b768l/1KI3lnPyM
	XqAZysTokyNeY6M6HYNt5Gjfdh0ASKGI4Vxr+0v7Llj/uxebgwODKc7Yw89WPkLm/ZCH1yJqGcP
	jNZB6mq2qq8M52QjCHQ7ouVFyY9/MRiEOCP2u+fe8BeIDijhJlBQH89mW7d7ccfaSHFcHgju9gB
	AzRZfMjPpvf2s6sl0NvKWz0pm9XvUJ28MQlIavdtLYQqmtNgqGrrPEZZtIFoTEuSCWbTazVSJ/3
	8GjLdNNsUfX8yA36HCLmukKoZwQ/Kc0cpHPW/o4/kIT9FAwHYqjY6eJAvqNrdGRBX2tCIyF6gDH
	ZIW00g3csaZAISLAVB/Kt8q2SUWjGZudPKfQX6z3D/ZWP1f7APa4MjoVDx4UGjMZDgVSeu8E3d8
	pAAO9I6r+dLDT8WKVndugBe2ooAWZrxjXAwTlBWWJyto7wR9JKdVNdrZUz6KGLHWdvLMDe7sMFg
	AsFBU5bNrV2/7R4RZZN3RrURTWVmjn0N7Q34VuHgla48TbXcsQ=
X-Received: by 2002:a05:6000:26c1:b0:43b:3a65:8c9d with SMTP id ffacd0b85a97d-43b9e9e90b8mr2968134f8f.19.1774606322974;
        Fri, 27 Mar 2026 03:12:02 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.131.netskope-rdns.com. [24.206.116.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e35esm12777550f8f.6.2026.03.27.03.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 03:12:02 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Fri, 27 Mar 2026 10:11:56 +0000
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Petr Mladek <pmladek@suse.com>
Cc: rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v9 2/9] lib: vsprintf: export simple_strntoull() in a
 safe prototype
Message-ID: <4uijfg4efzaapu3esobez55hfwqzszwagpeb4lxej2ybmifu76@s3c57fmnsme6>
References: <20260320-adf41513-iio-driver-v9-0-132f0d076374@analog.com>
 <20260320-adf41513-iio-driver-v9-2-132f0d076374@analog.com>
 <acZDneLrIPOmU5ci@pathway.suse.cz>
 <acZLHAT5qJyjKTsp@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acZLHAT5qJyjKTsp@ashevche-desk.local>

On 26/03/27 11:17AM, Andy Shevchenko wrote:
> On Fri, Mar 27, 2026 at 09:45:17AM +0100, Petr Mladek wrote:
> > On Fri 2026-03-20 16:27:27, Rodrigo Alencar via B4 Relay wrote:
> 
> ...
> 
> > > +extern ssize_t __must_check simple_strntoull(const char *startp, const char **endp,
> > > +					     unsigned int base, size_t max_chars,
> > > +					     unsigned long long *res);
> > 
> > Sigh, naming is hard. I personally find it a bit confusing that the
> > name is too similar to the unsafe API.
> > 
> > IMHO, the semantic of the new API is closer to kstrtoull().
> > It just limits the size, so I would call it kstrntoull().
> 
> It's not. kstrto*() quite strict about the input, this one is actually relaxed
> variant, so I wouldn't mix these two groups.
> 
> > Also I would use int as the return parameter, see below.
> 
> ...
> 
> TBH, I am skeptical about this approach. My main objection is max_chars
> parameter. If we want to limit the input strictly to the given number of
> characters, we have to copy the string and then just use kstrto*() in a normal
> way. The whole idea of that parameter is to be able to parse the fractional
> part of the float number as 'iiiii.fffff', where 'i' is for integer part, and
> 'f' for the fractional. Since we have *endp, we may simply check that.

A max_chars would not be only useful for that. It can prevent out-of-bounds
reads when the input isn't NUL-terminated (like buffers, file chunks,
network packets, memory-mapped data, ....). Even if there is a NUL later in
memory, a regular strtoull() function may consume characters that are outside
the field one intends to parse.
 
> In case if we want to parse only, say, 6 digits and input is longer there are
> a few options (in my personal preferences, the first is the better):
> - consider the input invalid
> - parse it as is up to the maximum and then do ceil() or floor() on top of that
> - copy only necessary amount of the (sub)string and parse that.

Yes, my use case is the fixed point parsing, but I suppose we are implementing
things here for reuse. Also, the default behavior of the previous fixed point
parsing in IIO is flooring the result, which leads to the same result as
ignoring further digits.

> The problem with precision is that we need to also consider floor() or ceil()
> and I don't think this should be burden of the library as it's individual
> preference of each of the callers (users). At least for the starter, we will
> see if it's only one approach is used, we may incorporate it into the library
> code.
> 
> The easiest way out is to just consider the input invalid if it overflows the
> given type (s32 or s64).
> 
> But we need to have an agreement what will be the representation of the
> fixed-width float numbers in the kernel? Currently IIO uses
> 	struct float // name is crafted for simplicity
> 	{
> 		int integer;
> 		int fraction;
> 	}

Yes, but to represent things like that, an assumption is made to the precision that
"fraction" carries.

> 
> This parser wants AFAIU to have at the end of the day something like
> 
> 	struct float
> 	{
> 		s64 integer;
> 		s64 fraction;
> 	}
> 
> but also wants to have the fraction part be limited in some cases to s32
> or so:
> 
> 	struct float
> 	{
> 		s64 integer;
> 		s32 fraction; // precision may be lost if input is longer
> 	}
> 
> Maybe we want to have kstrtof32() and kstrtof64() for these two cases?
> 
> With that we will always consider the fraction part as 32- or 64-bit,
> imply floor() on the fraction for the sake of simplicity and require
> it to be NUL-terminated with possible trailing '\n'.

I think this is a good idea, but calling it float or fixed point itself
is a bit confusing as float often refers to the IEEE 754 standard and
fixed point types is often expressed in Q-format.

-- 
Kind regards,

Rodrigo Alencar
