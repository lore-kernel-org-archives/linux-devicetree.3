Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73043603DA
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 12:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779020388; cv=none; b=YtHEllbLDhhVYZDnWgBSvKn5VGrgifxMgPutKJj/qeQHpoDcpV9zaAT8yAuGFUaE90ocCuz+x6YKL00SLapbldOgtk9cs+EGrJBd5PuBRpsK8U5oJRiVgrmdcXMQ7P4kuQaVvotcs1Cqk0fHw//3o3wvc5PM+JrtB+/GtvgOVPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779020388; c=relaxed/simple;
	bh=4ORFF+hqy++5JiE4nhagBY/ZLP3fzcu7areLbccw1mE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jXrTnNgN86UbV4BdDSmW8OnCcfCQUohnzX578Et5858NxdxwupqwH2CogkUH5Lyx8zrqEGQjJ+NAtGvbtl0nlFJxnVcZpndqkYrN0nAc8aPSgh98YFkZkBpl3qOUPqhLw1MtYGj+mSzdC/AaHAoliy6j+7ruWZLSUm3LLBua08w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CzU00kr1; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CzU00kr1"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-44a14580111so930146f8f.0
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 05:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779020385; x=1779625185; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h1PMPeBjbxQbz6gz4zIfXl+IxRIZnCvMJpkmx9O6DI4=;
        b=CzU00kr192XRukF0XOn//ebLoA822sba79VWZX/ZgKEI9BM5lrOsl/kPNDAcEQg2qG
         jHrxUkSY3k1wD6yf49ki7EhuKnb4q2WETSvmBuyH1hZucWB/bscfOS0k4TFEJlqGHfB8
         HbKu4MCYtJNogH8iRs1FNzVgAtWEp5z9dLGVt0YioFZEAS6a4MlIj39oVWBc7igR1Ers
         4CnyEs+5vctuaFL2ima+ks/tahmyi6MJRA+RqefjW2ix8HKrAaEIyIpZY/d00HbzzERn
         xJHYhYHEM8IkMaCZFXG5iKGVbizlPJ11na4mZLfwEfBjxYND4SeOn//vGJjGGATPUytC
         0+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779020385; x=1779625185;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h1PMPeBjbxQbz6gz4zIfXl+IxRIZnCvMJpkmx9O6DI4=;
        b=Pvv3ES2cwU52dc77gx/y/DoMIOeX8BxbQmcSlaMLHQrIo6gahMH42vDRgmoP6M7lpR
         sFIvBBETBzS1cNvWX7pnI+a7Q5meqmt7lJMBLXPiyBmqUMHE4idgsWLsq0wXLmp/2WXz
         IQeuqSyWqgnEK5KQgtyf++6s991iOgBTHZDuf0nR9nhl4eKAJXXU7HEjqliMDfXtxe8W
         4Vl3Pi00tV1n6LKVGdzC60w6vZn3ysAqTktJvnZB+t74asDftGGwgwsswTVmsNcEv2wI
         n1jAKmPAD/X1a1Wlbmw8AvSu+pW/0U0hJyDDFyu5gv443fOm/eU9kfJM5+h4YIS9iEXH
         leJg==
X-Forwarded-Encrypted: i=1; AFNElJ+Tgr9DewXaq8k/9TgSUlmu6d9xafJvJFNiYfd1N3rpZZJZ1gUSJpK2bqRPGJ1kamcylUmGuVGGEZD6@vger.kernel.org
X-Gm-Message-State: AOJu0YyHvN5GqYDLCR8z3eGw1XuKAXkv4CwjgE48vVaCqnmLBfmljZbk
	k6lopL8RvPxIeJiPJN42bgOQsccjn+8YhBfoKc04Zp9a1HO/G54qQyLk
X-Gm-Gg: Acq92OGxDCgpIAxYEy3zM+MWBVqRa71Y5K7WLIc0KrkAPX9cb9NX3fn7p6QztVf1s2/
	skgDWMqKTMrFh1XIk74R+xiNwLy4n/FewvPCf3O/1K19/RRedcjNTYS2Oj4GwK862syaWH5GTxu
	yyf97N1shypSxTaD0eC2aoqd7WdxN/C6lm4y2tJmKUNivVH4HF4SUvxxD9j5ys+BDGyCkChJHDT
	KErMWG/5lq0+yT2YSa3oPdBoxXOuMY+yZUNXXbrQVFsTfEJep1Q7D1b0VFxuUWgSEHBHtw1AGR3
	os+zcMWlf4+YIRKR5WPORkwkeRRzOlX/PEyhszusPdwnhTbIgTL4X3/311MZissXgK3OsIVGf4H
	61YTIQuF7c6IQOhrtGJMe+OAU0hMEFPqeCG3wUR+ku3piMPTQh7gS2MKc+Xzs2diTM7SSG4CtTP
	dvUjxkzt0xqKa8Xf1FKkk7LUkg10Pgd3D5NfOi6ZlHinLu6bYo9IgAzct17boSTI6Vk9bS6t5am
	T1qiSg2pyyCVzk0HU5SmP5ZPSqePyRZXLa3WiSmH0OeoIwlig==
X-Received: by 2002:a05:6000:2c07:b0:45e:75c5:1a6a with SMTP id ffacd0b85a97d-45e75c51b5emr2297637f8f.33.1779020384879;
        Sun, 17 May 2026 05:19:44 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm30436836f8f.23.2026.05.17.05.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 05:19:44 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Sun, 17 May 2026 13:19:38 +0100
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
Subject: Re: [PATCH v13 02/12] iio: kstrtox: add local
 _parse_integer_limit_init() helper
Message-ID: <u6uqytictupj7kgaxadxmvuayc66cpfw2g4k4ebvdmtgpjqdfz@zlnl3arq73xn>
References: <20260517-adf41513-iio-driver-v13-0-bb6e134a360f@analog.com>
 <20260517-adf41513-iio-driver-v13-2-bb6e134a360f@analog.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517-adf41513-iio-driver-v13-2-bb6e134a360f@analog.com>

On 26/05/17 10:13AM, Rodrigo Alencar via B4 Relay wrote:
> From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> 
> Add parsing helper that accepts an initial value for the accumulated
> result when parsing an 64-bit integer. It reuses current implementation
> for _parse_integer_limit(), which now consumes the new function with
> init = 0. The diff algorithm would have the documentation header and
> prototype of _parse_integer_limit() moved around so it is adjusted
> according to guidelines.

Sashiko's feedback at:
https://sashiko.dev/#/patchset/20260517-adf41513-iio-driver-v13-0-bb6e134a360f%40analog.com?part=2

...

> -/*
> - * Convert non-negative integer string representation in explicitly given radix
> - * to an integer. A maximum of max_chars characters will be converted.
> - *
> - * Return number of characters consumed maybe or-ed with overflow bit.
> - * If overflow occurs, result integer (incorrect) is still returned.
> - *
> - * Don't you dare use this function.
> - */
> -noinline
> -unsigned int _parse_integer_limit(const char *s, unsigned int base, unsigned long long *p,
> -				  size_t max_chars)

...

> +/**
> + * _parse_integer_limit() - Convert integer string representation to an integer
> + *			    limiting the number of characters parsed.
> + * @s: The start of the string.
> + * @base: The number base to use.
> + * @p: Where to write the result of the conversion.
> + * @max_chars: Maximum amount of characters to consume.
> + *
> + * Convert non-negative integer string representation in explicitly given radix
> + * to an integer. A maximum of max_chars characters will be converted.
> + *
> + * Return: Number of characters consumed maybe or-ed with overflow bit.
> + *	   If overflow occurs, result integer (incorrect) is still returned.
> + */
> +noinline
> +unsigned int _parse_integer_limit(const char *s, unsigned int base,
> +				  unsigned long long *p, size_t max_chars)

	Is it safe to remove the "Don't you dare use this function." warning?
	Since this function returns the number of consumed characters bitwise-ORed with
	the KSTRTOX_OVERFLOW flag, turning the comment into standard kernel-doc format
	makes it look like an inviting API.
	If a developer uses this and directly advances a pointer by the return value
	without masking the overflow bit, could an integer overflow during parsing cause
	the pointer to jump out-of-bounds?

That return value merged with the overflow indication is a bit weird in the first
place. I wonder if we need a precursor patch cleaning _parse_integer_limit() and
removing this KSTRTOX_OVERFLOW completely... turning it into:

	ssize_t _parse_integer_limit(const char *s,
				     const char **endp,
				     unsigned int base,
				     unsigned long long *res,
				     size_t max_chars);

so ssize_t returns the amount of converted characters, or -ERANGE if overflow occurs.
Also endp would point to the end of the conversion, so current usage (in _kstrtoull())

	rv = _parse_integer(s, base, &_res);
	if (rv & KSTRTOX_OVERFLOW)
		return -ERANGE;
	if (rv == 0)
		return -EINVAL;
	s += rv;

would become:

	ret = _parse_integer(s, &s, base, &_res);
	if (ret < 0)
		return ret;
	if (!ret)
		return -EINVAL;

which seems more aligned to the code we see out there.

-- 
Kind regards,

Rodrigo Alencar
