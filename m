Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984933D9044
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 08:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774601124; cv=none; b=PRUGTq+SsXmm/t0wRiWex2zSrncEtG42hiijk2BMB+moyM4OJBt2zJL2u3Cka2yj7BuXH6Esghhhl8L8Wq4SmWo+29dst1b2fgHQoxDiK/eG+/HbVVuTreWD6kSeQF7BfKAu0v6BKj+FHrku/r8Y0FfbDw2yxB4zW+iB1cC5NZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774601124; c=relaxed/simple;
	bh=VT5vONTAqXfveP+7n1Y8mynBHHypWw9Psl6PRU3IHMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CtxH8/P+b4sKqvikgTuBlI6sds+hKRf1VR3QXBVzJjNaY+YDFUOIrTuaSz221VfQwBAFdcXgYmVDRQmXY6AmIrJtDyorxd7In7UfXrEYKsJIv1GSMkBa3+htxKNUemmtMW4w7cWZ7ETOAOdbrMFJRLXnaMKQVuyBRtd4u/KFl8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=btA7hp/m; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="btA7hp/m"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-486ff3a0fc1so18097595e9.2
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 01:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774601121; x=1775205921; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zirj6VF39WLLrUARx3OP13uKy+Totnoyb4r1iN1GWX0=;
        b=btA7hp/mENuZh3BaxfL54LVKy5O9j5p2O6idUVLXQRBzPEhykrhYdDaCo0jf8uleXb
         9cQBygFJQ/WyaeJWxtGqQhdihrOhJcPCk8LCEAND+OlXr23p6FF56oxQ7EHBu+6uXdcS
         cWNLND+L8MD/LyhjTPqaLM9DfAEIWmnLlThgzfm6Pyrk3uTkeUUP1MkApG+GGyyZM/Ky
         hSXFfKFFbuzdSllbrMJQdzNzpQ+5fxFKFY0pAcqPSfIw5EVQU/oGq7RddHyzuS1KtZp6
         FiUCa7VGMbIuAhbeR1jX9GXywUWytvCiud1tQJer2FC5e0cITX/64NWPQbh0A3dMaWHn
         rdHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774601121; x=1775205921;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zirj6VF39WLLrUARx3OP13uKy+Totnoyb4r1iN1GWX0=;
        b=LmMKOtWAl+8lDstl+uG85oYENkPcGjxDTolZpgmsB9j+B+PvRrRCuf2xBkwgcW1xiv
         LqV6kON9bqpjeynrESyOzuCophiGLlROzjM322ZVzxuaOjBsJhk+BEJU3OHmumGfg4F/
         hjh3XoPPRZgnbe9Scx2MBP1cxZzihdfmGYiEVr+D1HSgIWzjZ2ctV5MjgGnWjlprtQA5
         nm3vBnW924ozQEzcJN5W2f6is0NnDLUqNDDpHsmyVRdkU8DrAY8Uvr6HfJ+YvuywmdRV
         Xuv2kqCoxVX/pEldGDSRXxckluuSiS+tKIildweTSNZm69UzIFP6btLiVr1n6/q8jqEg
         YS4A==
X-Forwarded-Encrypted: i=1; AJvYcCX/XaKIXRM/W61gt3J7fXjZQnWQnbRvYLmMsBt8iRDOxYco4Bof/trOhyuL5tfnkdbAdtY3Nc1MlwDW@vger.kernel.org
X-Gm-Message-State: AOJu0YzTXBvXfQdEq+DZBt6L0WmhMGkluZKMVFCBffi1r8oBDGS9nOQT
	mZBRUDIGk0n1RJJnDkuphu9or4WnNs9aT7ykEUmnF/mY18LbFC1/QU/vBzLtdBXLFKY=
X-Gm-Gg: ATEYQzwdfjEptCNhdLFwL1L4ZKmVdtguIm1yvZwE5+2OtJe+GHE7dbQ4TeZPDZ6ACxE
	YjwzqCSvh8xlM9suMu6cfNX+iIRKH8iPNv0FreAdGH6y3gMfCkHKCijVHEnSbfT+wgWjf02HhAu
	I3rAo0OXtK3N/jFuv6verSba61bC6CeFaQba4RvkQEeZpyfNfdV8iZ2mn7S4x7YZQUSll4iyuOG
	pcDf0cIsdtU0LYEVjhyyZfe6joJXh6WlO6qiUQCZ9d16MGbA9M6sGZe38FIMTatFXOGvLMNN25t
	XH6C6KtdGfUZU5sua2Z9LsnsBZdlOubT5jBleR6qVJn5Ju++xKnLGD1J4UP2NmbfiX3Vt4IWG7o
	knq7bOuN1Sv7FGAeALNTJYPdzTuJFQugshTStPofOpW4tK4Ztl9lg6XPFMrx+EgwqgNufeC5Mu9
	mJEHSoYA0l4rdtdEUyH4LFUyr5Aw==
X-Received: by 2002:a05:600c:4f53:b0:485:3692:e8f7 with SMTP id 5b1f17b1804b1-48727ede47amr23215565e9.25.1774601120896;
        Fri, 27 Mar 2026 01:45:20 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872717c3dcsm11415075e9.28.2026.03.27.01.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 01:45:20 -0700 (PDT)
Date: Fri, 27 Mar 2026 09:45:17 +0100
From: Petr Mladek <pmladek@suse.com>
To: rodrigo.alencar@analog.com
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v9 2/9] lib: vsprintf: export simple_strntoull() in a
 safe prototype
Message-ID: <acZDneLrIPOmU5ci@pathway.suse.cz>
References: <20260320-adf41513-iio-driver-v9-0-132f0d076374@analog.com>
 <20260320-adf41513-iio-driver-v9-2-132f0d076374@analog.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-adf41513-iio-driver-v9-2-132f0d076374@analog.com>

On Fri 2026-03-20 16:27:27, Rodrigo Alencar via B4 Relay wrote:
> From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> 
> Expose simple_strntoull(), by addressing its FIXME, i.e. its prototype is
> slightly changed so that -ERANGE or -EINVAL can be evaluated by the user.
> Flow of the function is not changed and error value is returned in the
> end. Unsafe internal wrapper is created to reduce amount of changes.
> 
> --- a/include/linux/kstrtox.h
> +++ b/include/linux/kstrtox.h
> @@ -148,4 +148,8 @@ extern long simple_strtol(const char *,char **,unsigned int);
>  extern unsigned long long simple_strtoull(const char *,char **,unsigned int);
>  extern long long simple_strtoll(const char *,char **,unsigned int);
>  
> +extern ssize_t __must_check simple_strntoull(const char *startp, const char **endp,
> +					     unsigned int base, size_t max_chars,
> +					     unsigned long long *res);

Sigh, naming is hard. I personally find it a bit confusing that the
name is too similar to the unsafe API.

IMHO, the semantic of the new API is closer to kstrtoull().
It just limits the size, so I would call it kstrntoull().

Also I would use int as the return parameter, see below.


>  #endif	/* _LINUX_KSTRTOX_H */
> diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> index 800b8ac49f53..6fb880f4013b 100644
> --- a/lib/vsprintf.c
> +++ b/lib/vsprintf.c
> @@ -75,25 +75,66 @@ enum hash_pointers_policy {
>  };
>  static enum hash_pointers_policy hash_pointers_mode __initdata;
>  
> +/**
> + * simple_strntoull - convert a string to an unsigned long long with a character limit
> + *
> + * @startp: The start of the string
> + * @endp: A pointer to the end of the parsed string will be placed here

I would write:

  * @endp: A pointer to the end of the parsed string (output)

> + * @base: The number base to use
> + * @max_chars: The maximum number of characters to parse
> + * @res: Where to write the result of the conversion on success

Nit: I would omit "on success" *res value is set to 0 on failure.
     Instead, I would write:

  * @res: Result of the conversion (output)

> + *
> + * Returns amount of processed characters on success, -ERANGE on overflow and
> + * -EINVAL on parsing error.
> + */
>  noinline
> -static unsigned long long simple_strntoull(const char *startp, char **endp, unsigned int base, size_t max_chars)
> +ssize_t simple_strntoull(const char *startp, const char **endp,
> +			 unsigned int base, size_t max_chars,
> +			 unsigned long long *res)

It might be enoungh to use "int" for the return value. The number
of proceed characters is pretty limited by definition. And it
would be similar to vsnprintf(), kstrtoull(), ...

I guess that you wanted to match the "size_t max_chars" parameter.
It makes some sense as well.

Please, use "int" especially if we agreed to call the new API
kstrntoull().

>  {
>  	const char *cp;
> -	unsigned long long result = 0ULL;
>  	size_t prefix_chars;
>  	unsigned int rv;
> +	ssize_t ret;
>  
>  	cp = _parse_integer_fixup_radix(startp, &base);
>  	prefix_chars = cp - startp;
>  	if (prefix_chars < max_chars) {
> -		rv = _parse_integer_limit(cp, base, &result, max_chars - prefix_chars);
> -		/* FIXME */
> +		rv = _parse_integer_limit(cp, base, res, max_chars - prefix_chars);
> +		if (rv & KSTRTOX_OVERFLOW)
> +			ret = -ERANGE;
> +		else if (rv == 0)
> +			ret = -EINVAL;
> +		else
> +			ret = rv + prefix_chars;
>  		cp += (rv & ~KSTRTOX_OVERFLOW);
>  	} else {
>  		/* Field too short for prefix + digit, skip over without converting */
>  		cp = startp + max_chars;
> +		ret = -EINVAL;
> +		*res = 0ULL;
>  	}
>  
> +	if (endp)
> +		*endp = cp;
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(simple_strntoull);
> +
> +/* unsafe_strntoull ignores simple_strntoull() return value and endp const qualifier */
> +inline
> +static unsigned long long unsafe_strntoull(const char *startp, char **endp,
> +					   unsigned int base, size_t max_chars)
> +{
> +	unsigned long long result;
> +	const char *cp;
> +
> +#pragma GCC diagnostic push
> +#pragma GCC diagnostic ignored "-Wunused-result"
> +	simple_strntoull(startp, &cp, base, max_chars, &result);
> +#pragma GCC diagnostic pop
> +
>  	if (endp)
>  		*endp = (char *)cp;

IMHO, we do not need local "cp". We could simply pass the endp
to the new simple_strntoull. Or do I miss anything?

Best Regards,
Petr
