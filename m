Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988733A545F
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 10:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777891370; cv=none; b=JnodbPPmEbOjryo2zon+aORvvbw5rHhsQ6W31Y7+PueoPom0bOXbFm1hU7GVmF9/lj0f9HlNm9gZEDyvjWlnSQueGHW7P8FvygVnijWJCbMprYneRRrSgNCYzQ65ZidMYCKC8i1jNcMnPNmB5n3bNoh9TL0Z5FXHLF+6R0v1FIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777891370; c=relaxed/simple;
	bh=O+TCmQ94hvpfpTfj1UNiv4DI2N+SEeVnVz0y/FMSn4U=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iUXYNxnq7ZTAV1c4r4NIMy/yDH6t/Ur1+kNFiDRM+/VJwD2s5rW+7LB4PUdVdKJjh0XQ6n0ccyyaM2bvNqFF9rFknTH5POajZasHBXQfg9QnvhyQZU6f9bvsLjMukqnvfm/k5kKCBG/3VbygbauF/jBxk7ewwPk+Zl1Ef9aSAd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bBhTaJiB; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bBhTaJiB"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-444826c16ffso3825817f8f.1
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 03:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777891367; x=1778496167; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=glBEbPzQqS5RuxVbjECm23lF7bGWaZdBFdJ4PJmnbu0=;
        b=bBhTaJiBtOF9PvxWRhwEvp+jWWYyQjfRq1ATLJJHVGDrPDbtFk5jcGeGofeN8HuJ7m
         b2KQpo+NdOQf//jTah/eq/Dgicyvs8/3c4gm5Y6FhaplYgh0HRuXjzz+/sfO9B9CDX7M
         Kiu3DqUgYu1HLyOHMnCNPwdP78XwVoS3TefJtemt5P46mDqIGI0KwLlKf2XJbIXCBAtB
         9EYL19u+pVFwZbuX7tKxWm8ns7Pyh/MRkDfZ61q9QxLFx6hoavcuylGn/6BjC3jOfiZl
         epI4vsZU2p92DlA0tnDyyY/+wdUrNMhwYtjRky2Tf0x616kbVu5jLMYfwBBHBJgVCc5S
         nK1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777891367; x=1778496167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=glBEbPzQqS5RuxVbjECm23lF7bGWaZdBFdJ4PJmnbu0=;
        b=pm7tsZTODAMqvGfyBzZbBINg4y7vC80GljQ5feb4QF4P5N9GyBxIFcv/BmPjURCcEy
         i9qzgpBkF6BHQ6M97E0FvKH+RfkhJsWiON0q7lIWf1KPvgR2o3lNT3FxAm52SytlRhVh
         5zGiogDJmCrSYirVsZkIXDoLzXaY6oUamo3+diIqYmi82RUQRxV9Cj287UzMXBl87cO2
         Bezxzu/eJoLRpanjFbw7JW/TumqzYgmI69Vfq14nXv1QUgSNpefSawKQ9uabEB2YD6/E
         xe86cV6xZnZRjh9hPx9JCo+60HZAtE31CrfLhseFp8TqBuskM6Rw29WPNLmrGYPBb+22
         1uhQ==
X-Forwarded-Encrypted: i=1; AFNElJ+F7lsaM/Z83icZbow0WhsOHw46GRku2f/MXrjrGvAo7UKIG6T7pnK+OGBKGVA502a3bAmJVaN0FRon@vger.kernel.org
X-Gm-Message-State: AOJu0YzCFhFloJotr0iFb5jqyTV1XCQqovULKyzadTnq4rmCHeqbLSPx
	5xOXpS+hDaS7IafPE2fsGN9Z7JmoNa8ujLIwcZryiQfDjsbq8DlKO+f0
X-Gm-Gg: AeBDievTrfzNQ7eN5eAXu9XYf3tLqtjcTYsZsNpI89SX6lFnmFqeGfpNvqSRz+QYd8j
	JLeVW0hKVRgZQaNvGKnFuydQeSangODxkcNnGoHQp4fKfD8/lWvhF7x2R9VpritQuu0M2ur40z0
	GW7badL6INEwNLlBpAOxx1kcYJSofLrfK9fQ84xZCPq+dAkRh+b5DZkKPUg5CtVTWtNaOSkI6hn
	p+MQBrMw1yvwNrKvDV/qs2/QfWR+ie7TI0/G4q2H02OgPVJNy8ckzTxTQF/p45KbAzWRUFAHUgL
	kT/eozLMRjqj6sx955kn+JbEgQ/O0Gcu2ybwKFAiv9/nRoRHX76mLJCT+XOIeOzGS0pXFLr3hWK
	iT/pA/kA8LFS44eOqONObsF/Yl5y+X7ecwUov+d7P92TB2bJeIVU5xDnaCPbe52IhmykF6C2M8G
	XH4QOv6/3HgySc1hnTkLrhFvMSyX8UmAfCKoOZBmyTh4j8ApS2nUhgdUZMvPF/4LRdSL67lWNRi
	NnkptHxwJk/JtRunJgW7iBE1bHEpZhwLzrkKIAF4Y1UHR4RjJOk8YCqS3FWow==
X-Received: by 2002:a05:6000:25c7:b0:43c:f66e:f24 with SMTP id ffacd0b85a97d-44bb6d96a1emr15514078f8f.35.1777891366752;
        Mon, 04 May 2026 03:42:46 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a9879ef89sm28731094f8f.30.2026.05.04.03.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:42:46 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Mon, 4 May 2026 11:42:38 +0100
To: Rodrigo Alencar <rodrigo.alencar@analog.com>, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v10 05/11] iio: core: add decimal value formatting into
 64-bit value
Message-ID: <keeskqikjulxcgc36zpzzvqw2osvm437hlchgcuovh5gkvmdr3@ishisbiujrrn>
References: <20260415-adf41513-iio-driver-v10-0-df61046d5457@analog.com>
 <20260415-adf41513-iio-driver-v10-5-df61046d5457@analog.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415-adf41513-iio-driver-v10-5-df61046d5457@analog.com>

On 26/04/15 10:51AM, Rodrigo Alencar wrote:
> Create new format types for iio values (IIO_VAL_DECIMAL64_*), which
> defines the representation of fixed decimal point values into a single
> 64-bit number. This new format increases the range of represented values,
> allowing for integer parts greater than 2^32, as bits are not "wasted"
> in the fractional part, which can be seen in IIO_VAL_INT_PLUS_MICRO and
> IIO_VAL_INT_PLUS_NANO. Helper macros are created to compose and decompose
> 64-bit decimals into integer values used in IIO formatting interfaces,
> which creates consistency and avoid error-prone manual assignments when
> using wordpart macros. When doing the parsing, kstrtodec64() is used with
> the scale defined by the specific decimal format type.
> 
> Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>

...

> --- a/include/linux/iio/types.h
> +++ b/include/linux/iio/types.h
> @@ -7,6 +7,7 @@
>  #ifndef _IIO_TYPES_H_
>  #define _IIO_TYPES_H_
>  
> +#include <linux/wordpart.h>
>  #include <uapi/linux/iio/types.h>
>  
>  enum iio_event_info {
> @@ -34,6 +35,38 @@ enum iio_event_info {
>  #define IIO_VAL_FRACTIONAL_LOG2 11
>  #define IIO_VAL_CHAR 12
>  
> +#define IIO_VAL_DECIMAL64_BASE		100
> +#define IIO_VAL_DECIMAL64_MILLI		(IIO_VAL_DECIMAL64_BASE + 3)
> +#define IIO_VAL_DECIMAL64_MICRO		(IIO_VAL_DECIMAL64_BASE + 6)
> +#define IIO_VAL_DECIMAL64_NANO		(IIO_VAL_DECIMAL64_BASE + 9)
> +#define IIO_VAL_DECIMAL64_PICO		(IIO_VAL_DECIMAL64_BASE + 12)
> +
> +#define iio_val_s64_compose(_val0, _val1)				\
> +	({ (s64)((((u64)(_val1)) << 32) | (u32)(_val0)); })
> +
> +#define iio_val_s64_from_array(_vals)					\
> +	({								\
> +		const int *_arr = (const int *)(_vals);			\
> +		s64 _dec64 = iio_val_s64_compose(_arr[0], _arr[1]);	\
> +									\
> +		_dec64;							\
> +	})
> +
> +#define iio_val_s64_decompose(_dec64, _val0, _val1)			\
> +	do {								\
> +		s64 _tmp64 = (s64)(_dec64);				\
> +									\
> +		*(_val0) = lower_32_bits(_tmp64);			\
> +		*(_val1) = upper_32_bits(_tmp64);			\
> +	} while (0)
> +
> +#define iio_val_s64_array_populate(_dec64, _vals)			\
> +	do {								\
> +		int *_arr = (int *)(_vals);				\
> +									\
> +		iio_val_s64_decompose((_dec64), &_arr[0], &_arr[1]);	\
> +	} while (0)

Hi Jonathan,

Are those macros ok? in terms of where they are declared or whether they
should be static inline functions? any preferences?

> +
>  enum iio_available_type {
>  	IIO_AVAIL_LIST,
>  	IIO_AVAIL_RANGE,
> 
> -- 
> 2.43.0
> 

-- 
Kind regards,

Rodrigo Alencar
