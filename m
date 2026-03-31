Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7283E3D94
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 13:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774962075; cv=none; b=dJfEhEFobR2Nm6EgG25MQQjGg5+mEfocyspwekqk9p5s6VGT6WQ75H3tW8xl8BSWQo6BRSzXhRL9z3mjwV7WZdhKiG+Utl5r8qxDMnPZ/zbBnZBU6lCYt4UbhGhR83cX8bnIIDuU+azxskUr0v1qcxKde+RJTYXj14e0qyv4imI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774962075; c=relaxed/simple;
	bh=NWy6jF7tG5rVJozMzWzReQbDo/jcHM0/Ev1INEDWe+0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wds9J1zc5YUWHPq/XFY14zcFBLcgk8lC8qDp2gehMZqjwsJiU4MawUoZh5SEJ/q9n/hcWTV1cDVsp1b0xGMbe2zl3kZJYBzEZZlyVAMfNgiNi92bU5kVt7/ul86pCwD8yPekU2L960FRGmX49X2boDNJqYYIuKJBDJiwFggio4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lUkSYTEf; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lUkSYTEf"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-66b8110361fso5802197a12.0
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 06:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774962072; x=1775566872; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eGzN6mgCDgiU/jVdvBBBVzTIEeR9WyAbTd7AEaibUjU=;
        b=lUkSYTEf6lWf55VPjKrGk2W9FnEV5GPGD5zdpiWo14Ir4y4/+D95q2wlx5Zgn4AZuA
         v3DSGNqTb4nicn+wxRC0ntsiDmWBCtONTpy9bWcSoOE8FxmG3PAwCb7AjEO7ultm8RZG
         jN+rdgHvoGDmOnCqERaUuaQ91YrIkZ4P2clsBpD8sZaT0bMKYZH6w4ehv300RbhMJf8y
         7U0OQp/QDGJLlNf9YhZ7ZRIm8PEfNj9WCyoGNtGGY3lHUPK+RNos8Na/OuJ1JBy1DlMq
         U7il1iCkg4eG1hFOMoFX0ddnnvKjbAX0Jw5BE1DyAERkrD27UWmhYBtTHmB7dAif3DrB
         f6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774962072; x=1775566872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eGzN6mgCDgiU/jVdvBBBVzTIEeR9WyAbTd7AEaibUjU=;
        b=RGHVjzMYtut2U7QpRAuBU8DzmvMpETX11yrOa5JH2Kmx3xTtPnTHiIdzWoJOeRJeEE
         B+FDcrI1eXUBum4FIL6JoBSV67pUdkc3S3PeIzyX0TFJSDxnExmgd+KpK4FydAbvWMCA
         1TCk+NXAlfZZeI4ggp1jzMQZRjtdkoYPEIDYwWhQ9zho1Tw+Jpx9C/h0hQCDuNBQn9R2
         MIxuz1UH4ugXM99Mu5rHPPfxS6twWx8HeW7a3vcPmAgeKV4a6d2Jaqj/wINsdegFD4j5
         Sm+sMzvH2wPEyKp7SC3HVn6kjD95RlhuRMErtDkaoNYqdK//Baob3R4jPfHS5ajcy3nT
         Wrbg==
X-Forwarded-Encrypted: i=1; AJvYcCVerEEqFnYiT6jN01ujaBFfNNMbyxPJWg2PN7wGYr7Ieb+wYaFd8sdbV+ZbKE7MQVtuX0pevjdlT3vl@vger.kernel.org
X-Gm-Message-State: AOJu0YzG+rPhxPBSpZwmJAIY1pKgOHOj03kjoWa+76HlnR99soPbHuLh
	LJ/Kl3WXIBm/2BzqblwSpanc2ry35Tnc61RALslf5Hp/EsSLIeDcTNcN1hRlS/ak
X-Gm-Gg: ATEYQzzo4YJ8YCchpd8NRuEO1fs9j6EgqO886w2tZ9MH3X12WYKxBo0Ej8YqGoO45/l
	cIZ8e0lU8+PHLK9Fq05whsa5AxllaPEP2ZOWFigBxsVJ98Cq6z9xjHAakWHdRNjScmyw7sZxZeh
	TAttt5NE2e+ObiDnLX6z7dcTUv8QnoUPawiJRqv5wECTAk8ZDWr0eQvyc6kDRF57dSRiu68vjna
	/iXV+h4wEsYrVExzzpnFL1GNqzhS+f68cIyFOut62KFYuFBWWt2r6Txn1TLq+PCz+h2/AwpvVej
	naRejAPiUsXxYykqffBXx6tKqUNqlhq389lsSmBu3kJ7LZqb/YmdTps6E2hY+guUHRqKMiQSvCK
	tA4KHMkHpCyA2K+CUYSii2HUXoOKWpyPQ1tibzO8j/UsQoScSyzUJiOFCumldttk/0gixGg0XWx
	bSr2slVir4pMqVeQS71l/9ZaoHg8cm/pAU0xugE5+JYHBG7QseHHGfVxm1T9caexPk5IYYO7qjQ
	lebg/q9uUNX43mHjGnpWP1BCvaVfN05WLtV6EF1rSm6qiK3mfE=
X-Received: by 2002:a17:906:6a29:b0:b9b:fa57:d5bb with SMTP id a640c23a62f3a-b9bfa57d970mr128126466b.46.1774962070994;
        Tue, 31 Mar 2026 06:01:10 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.131.netskope-rdns.com. [24.206.116.131])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1a5dddsm411266366b.35.2026.03.31.06.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 06:01:10 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Tue, 31 Mar 2026 14:01:04 +0100
To: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Message-ID: <mnz7d2zd27x6h2qa24rajgrbhkhsypybadkqz2fi43rg7bvjvj@oufys7xs25t4>
References: <20260320-adf41513-iio-driver-v9-0-132f0d076374@analog.com>
 <20260320-adf41513-iio-driver-v9-2-132f0d076374@analog.com>
 <acZDneLrIPOmU5ci@pathway.suse.cz>
 <acZLHAT5qJyjKTsp@ashevche-desk.local>
 <4uijfg4efzaapu3esobez55hfwqzszwagpeb4lxej2ybmifu76@s3c57fmnsme6>
 <acZaGUV0MwuHNDru@ashevche-desk.local>
 <x34d7jz7be4ommjh6efx5mcq5pbpellykwuyrqayr4ske3lywf@wh46mu3anmcz>
 <qnb3ozrhrq5n4zkh2luitkpwr5oj4omgcuo5vnvy2gatdfdqlg@cgsgux7etcql>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <qnb3ozrhrq5n4zkh2luitkpwr5oj4omgcuo5vnvy2gatdfdqlg@cgsgux7etcql>

On 26/03/30 01:49PM, Rodrigo Alencar wrote:
> On 26/03/27 03:17PM, Rodrigo Alencar wrote:
> > On 26/03/27 12:21PM, Andy Shevchenko wrote:
> > > On Fri, Mar 27, 2026 at 10:11:56AM +0000, Rodrigo Alencar wrote:
> > > > On 26/03/27 11:17AM, Andy Shevchenko wrote:
> > > > > On Fri, Mar 27, 2026 at 09:45:17AM +0100, Petr Mladek wrote:
> > > > > > On Fri 2026-03-20 16:27:27, Rodrigo Alencar via B4 Relay wrote:
> 
> ...
> 
> > > > > Maybe we want to have kstrtof32() and kstrtof64() for these two cases?
> > > > > 
> > > > > With that we will always consider the fraction part as 32- or 64-bit,
> > > > > imply floor() on the fraction for the sake of simplicity and require
> > > > > it to be NUL-terminated with possible trailing '\n'.
> > > > 
> > > > I think this is a good idea, but calling it float or fixed point itself
> > > > is a bit confusing as float often refers to the IEEE 754 standard and
> > > > fixed point types is often expressed in Q-format.
> > > 
> > > Yeah... I am lack of better naming.
> > 
> > decimals is the name, but they are often represented as:
> > 
> > 	DECIMAL = INT * 10^X + FRAC
> > 
> > in a single 64-bit number, which would be fine for my end use case.
> > However IIO decimal fixed point parsing is out there for quite some time a
> > lot of drivers use that. The interface often relies on breaking parsed values
> > into an integer array (for standard attributes int val and int val2 are expected).
> 
> Thinking about this again and in IIO drivers we end up doing something like:
> 
> val64 = (u64)val * MICRO + val2;
> 
> so that drivers often work with scaled versions of the decimal value.
> then, would it make sense to have a function that already outputs such value?
> That would allow to have more freedom over the 64-bit split between integer
> and fractional parts.
> As a draft:
> 
> static int _kstrtodec64(const char *s, unsigned int scale, u64 *res)
> {
> 	u64 _res = 0, _frac = 0;
> 	unsigned int rv;
> 
> 	if (*s != '.') {
> 		rv = _parse_integer(s, 10, &_res);
> 		if (rv & KSTRTOX_OVERFLOW)
> 			return -ERANGE;
> 		if (rv == 0)
> 			return -EINVAL;
> 		s += rv;
> 	}
> 
> 	if (*s == '.') {
> 		s++;
> 		rv = _parse_integer_limit(s, 10, &_frac, scale);
> 		if (rv & KSTRTOX_OVERFLOW)
> 			return -ERANGE;
> 		if (rv == 0)
> 			return -EINVAL;
> 		s += rv;
> 		if (rv < scale)
> 			_frac *= int_pow(10, scale - rv);
> 		while (isdigit(*s)) /* truncate */
> 			s++;
> 	}
> 
> 	if (*s == '\n')
> 		s++;
> 	if (*s)
> 		return -EINVAL;
> 
> 	if (check_mul_overflow(_res, int_pow(10, scale), &_res) ||
> 	    check_add_overflow(_res, _frac, &_res))
> 		return -ERANGE;
> 
> 	*res = _res;
> 	return 0;
> }
> 
> noinline
> int kstrtoudec64(const char *s, unsigned int scale, u64 *res)
> {
> 	if (s[0] == '+')
> 		s++;
> 	return _kstrtodec64(s, scale, res);
> }
> EXPORT_SYMBOL(kstrtoudec64);
> 
> noinline
> int kstrtosdec64(const char *s, unsigned int scale, s64 *res)
> {
> 	u64 tmp;
> 	int rv;
> 
> 	if (s[0] == '-') {
> 		rv = _kstrtodec64(s + 1, scale, &tmp);
> 		if (rv < 0)
> 			return rv;
> 		if ((s64)-tmp > 0)
> 			return -ERANGE;
> 		*res = -tmp;
> 	} else {
> 		rv = kstrtoudec64(s, scale, &tmp);
> 		if (rv < 0)
> 			return rv;
> 		if ((s64)tmp < 0)
> 			return -ERANGE;
> 		*res = tmp;
> 	}
> 	return 0;
> }
> EXPORT_SYMBOL(kstrtosdec64);
> 
> e.g., kstrtosdec64() or kstrtoudec64() parses "3.1415" with scale 3 into 3141

Hi Jonathan,

developing more on that, I wouldn't need to create a iio_str_to_fixpoint64(),
what do you think on new format types:

#define IIO_VAL_DECIMAL64_1 101
#define IIO_VAL_DECIMAL64_2 102
#define IIO_VAL_DECIMAL64_3 103
#define IIO_VAL_DECIMAL64_4 104
#define IIO_VAL_DECIMAL64_5 105
#define IIO_VAL_DECIMAL64_6 106
#define IIO_VAL_DECIMAL64_7 107
#define IIO_VAL_DECIMAL64_8 108
#define IIO_VAL_DECIMAL64_9 109
#define IIO_VAL_DECIMAL64_10 110
#define IIO_VAL_DECIMAL64_11 111
#define IIO_VAL_DECIMAL64_12 112
#define IIO_VAL_DECIMAL64_13 113
#define IIO_VAL_DECIMAL64_14 114
#define IIO_VAL_DECIMAL64_15 115

#define IIO_VAL_DECIMAL64_MILLI IIO_VAL_DECIMAL64_3
#define IIO_VAL_DECIMAL64_MICRO IIO_VAL_DECIMAL64_6
#define IIO_VAL_DECIMAL64_NANO IIO_VAL_DECIMAL64_9
#define IIO_VAL_DECIMAL64_PICO IIO_VAL_DECIMAL64_12
#define IIO_VAL_DECIMAL64_FEMTO IIO_VAL_DECIMAL64_15

which gets stored as 64-bit, and represent the decimal scaled value.
That would also work for the PLL driver (using IIO_VAL_DECIMAL64_MICRO):
  - It supports frequency range from 1 to 26 GHz with micro Hz resolution
  - In the driver a 64-bit value: (val * MICRO + val2) is already created
  anyways.
I would leverage something like kstrtodec64() in iio_write_channel_info().

That way, I would drop the changes on the iio fixpoint parse, which I think
it would do better with something like kstrntoull() to be able to handle that
"dB" suffix.

So for now, I may have the following approaches:
- new kstrntoull() function: to have control over the parsing, whithout
  requiring NUL-termination, avoiding unecessary string scanning or copying.
  covered in v8.
- expose a "safe" simple_strntoull(): minimal changes to vsprintf.c, this
  is covered by this patch series (v9), and it similar solution to kstrntoull().
- new kstrtodec64() function: parse decimal numbers as 64-bit with NUL-termination.
  Might be covered in a v10, if it is a good idea.

let me know your thoughts.

-- 
Kind regards,

Rodrigo Alencar
