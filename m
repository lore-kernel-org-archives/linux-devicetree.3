Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4223D3D9DDF
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 15:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780326756; cv=none; b=gWgu4xses7Ek86wyF5ljify2qZK0H76HypAfJoZuFfqXZAdCtCxYK4Wh5NqN1YYQ7chNAKfyJTZnzrqakW0hY8Y1yaSCJpH9hE24Ry/vUQXIL3EZa8xyyzRcXaodYlwWseFJLt+DFz+Ch72JdMxEnZWV4J4lrUU/LO4FxGd3LJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780326756; c=relaxed/simple;
	bh=Jr5ChMHbJ4rgb50ApRp1aVeWubFdEye9qO6Wdoowo9g=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dhHr5crPF4Ydww20nW0d38NZ2y25gOLvG+eKakyOwW/3eceWhUyhfE3QTBzkh39UZtYo5zGx3hdO745ThUeh6R2AZ834wBfGZfMmvTJkh5Nkwzv27Av5g5CvPFZ9zhdJCcpE8lMCpWrOwi0ksP8XKzMwRLoJbw6050ybd3cln8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F+1DU3cP; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F+1DU3cP"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49041e84237so84085685e9.1
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 08:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780326751; x=1780931551; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5iECLkBX2z7DMGBE4t5E5JSdp/1pZxsP3ib2e+bW57k=;
        b=F+1DU3cPY36hrMD+IwYFmlt46D4lj057EAUTZO3SvRiCwCZEtjKq4KHEZ+G41V1dXN
         nosoJKibWmWd7qGbpU7VCPLUlzMYRvyJZglW+0MXV2VGntNTb55Kw3YFeoKe9eQFJhso
         XO4oW+IUOVzVKIwx9Ty3tCoZjDtXc42mZXdjt6uzwSVx3xwM8Z/jZiOvxAlaxB/iCwXc
         4saIf42/1vAzX3+nfgW8oNIWV+74E7nwIbPfvdzQfeDTe8NhZJesVfATsf1K7Jp90Et7
         q4fIulkRc1P1t8OOGKCFhv0fsW6wYZXl0prmOhgShQs/hcxGD3fiEgQ1h9QZ4beM33tC
         aYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780326751; x=1780931551;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5iECLkBX2z7DMGBE4t5E5JSdp/1pZxsP3ib2e+bW57k=;
        b=Wnrvixp3BKwoAM9KuDEZtGMnHUHEz+uo+Za+qCO1w/8Bh5MC0ZNxzTv3a8QPVBK+ig
         d9vYK/Ln3K/JSQVikhCUoXR7TWXvr68OgfGB2Ru0kjNWWuKi/V4RGzY00LhW8YaZjAml
         6Mybo1yl5pLU0gR0uByTIw4O6vm7ZsRK/Vx0uSjHkfoCDh9gQ8wibIoubPTr6ZQLm7Xh
         MXRXCMe5f+cx8x49NPvGyHqrK3hwT5FQKsxeK2FfLoH1Vgnm2LCJ7eHKgcMGfzMw79uc
         31ayfELNKNabvtEcDhX7KilLdtDp5tVfnsclT+6jvfnSEtZ/oeSGtLTPZqTk6uVDHVav
         M0ng==
X-Forwarded-Encrypted: i=1; AFNElJ8/LPxbbT/n26tzC2OuXAHv6vlf8dd6NccfqKNvlkc8czcv7MyGyYLR/2VIhTu5Iykn99occ1/qyriz@vger.kernel.org
X-Gm-Message-State: AOJu0YyO+YBYCiE39LXI6WIgJ1w56d433MKe86Ha+s+75NZ6GWbkUua+
	D6CUNfs6B9Dpss01Q5g0dUMjdzbACC9d5T0F/GB0zCmgEGFGgypkLZb8
X-Gm-Gg: Acq92OEy81SUQEhGK2lToLCBNnbQ7PVbcmn/QZQqoOI/vvK2+3n/ggswpjKaqLhpSRm
	CqijbR92pDyxrSvQdxtk22NA4RFQ84tzP5EqjLx/MDnzO7C2DBoCkRqZMd8ICmU68IV7tFGuIS2
	gDzCpYEgbcl/Fzh8Hj3z5oYBUB/PaTmTcMsQZD+eUG+nk7Wx6pdp9uFbS9gFuONbm06iZmq+5To
	PYnunx2SoF8qcobpTXZMH7lnt5WJXlPkzQfse9P/z8D+MvjeLVKRnl6yubR3wFohwO2/RH05JKd
	XI5aUicLztwcdWyBCUdrQMketWNl0wllYx7eirZ/H2A3IgudGh15AHvHmRj5eqoC8AgVEr/T7cH
	7KttMATI/AT11XhYDl3PJCuglOJf3weMGrgnjnFK+mQ188xH3jsZc+UkYy+BFI1bJXQ/w64zV71
	8Xay+ANPIWWO0WNz9OvOfwUZb6pN1dXPPtfhbig6iA2+TN6yysfJYZvfYrnqXlYCM/j5iMtFZFK
	5J+yGZ9aCRXC+PUY1mBQ0g72pK9iKUbMopVLhDQ6pVe/3+TdQ==
X-Received: by 2002:a05:600c:1d0f:b0:489:32b:ac0b with SMTP id 5b1f17b1804b1-490a2a22bb4mr163493425e9.6.1780326751312;
        Mon, 01 Jun 2026 08:12:31 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490aeab0955sm24462915e9.4.2026.06.01.08.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:12:30 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Mon, 1 Jun 2026 16:12:25 +0100
To: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>, 
	rodrigo.alencar@analog.com
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v15 06/12] iio: core: add decimal value formatting into
 64-bit value
Message-ID: <u7p5ndqqh3ngnmmzoir37yuc3hfm2llenaihuekwuwoji743mf@itbbdxfo4qan>
References: <20260531-adf41513-iio-driver-v15-0-da09adf1c0dd@analog.com>
 <20260531-adf41513-iio-driver-v15-6-da09adf1c0dd@analog.com>
 <ah1SUD_QpRLD2WGV@nsa>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ah1SUD_QpRLD2WGV@nsa>

On 26/06/01 10:43AM, Nuno Sá wrote:
> On Sun, May 31, 2026 at 09:30:49AM +0100, Rodrigo Alencar via B4 Relay wrote:
> > From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > 
> > Create new format types for iio values (IIO_VAL_DECIMAL64_*), which
> > defines the representation of fixed decimal point values into a single
> > 64-bit number. This new format increases the range of represented values,
> > allowing for integer parts greater than 2^32, as bits are not "wasted"
> > in the fractional part, which can be seen in IIO_VAL_INT_PLUS_MICRO and
> > IIO_VAL_INT_PLUS_NANO. Helpers are created to compose and decompose 64-bit
> > decimals into integer values used in IIO formatting interfaces, which
> > creates consistency and avoid error-prone manual assignments when using
> > wordpart macros. When doing the parsing, kstrtodec64() is used with the
> > scale defined by the specific decimal format type.
> > 
> > Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > ---
> >  drivers/iio/industrialio-core.c | 47 +++++++++++++++++++++++++++++++++--------
> >  include/linux/iio/types.h       | 30 ++++++++++++++++++++++++++
> >  2 files changed, 68 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
> > index bd6f4f9f4533..a88088cac641 100644
> > --- a/drivers/iio/industrialio-core.c
> > +++ b/drivers/iio/industrialio-core.c
> > @@ -19,6 +19,7 @@
> >  #include <linux/idr.h>
> >  #include <linux/kdev_t.h>
> >  #include <linux/kernel.h>
> > +#include <linux/math64.h>
> >  #include <linux/module.h>
> >  #include <linux/mutex.h>
> >  #include <linux/poll.h>
> > @@ -26,7 +27,6 @@
> >  #include <linux/sched.h>
> >  #include <linux/slab.h>
> >  #include <linux/wait.h>
> > -#include <linux/wordpart.h>
> >  
> >  #include <linux/iio/buffer.h>
> >  #include <linux/iio/buffer_impl.h>
> > @@ -655,6 +655,7 @@ static ssize_t __iio_format_value(char *buf, size_t offset, unsigned int type,
> >  				  int size, const int *vals)
> >  {
> >  	int tmp0, tmp1;
> > +	int l = 0;
> >  	s64 tmp2;
> >  	bool scale_db = false;
> >  
> > @@ -698,7 +699,6 @@ static ssize_t __iio_format_value(char *buf, size_t offset, unsigned int type,
> >  	case IIO_VAL_INT_MULTIPLE:
> >  	{
> >  		int i;
> > -		int l = 0;
> >  
> >  		for (i = 0; i < size; ++i)
> >  			l += sysfs_emit_at(buf, offset + l, "%d ", vals[i]);
> > @@ -707,8 +707,25 @@ static ssize_t __iio_format_value(char *buf, size_t offset, unsigned int type,
> >  	case IIO_VAL_CHAR:
> >  		return sysfs_emit_at(buf, offset, "%c", (char)vals[0]);
> >  	case IIO_VAL_INT_64:
> > -		tmp2 = (s64)((((u64)vals[1]) << 32) | (u32)vals[0]);
> > +		tmp2 = iio_val_s64_from_s32s(vals);
> 
> I might be missing something but can't we just call
> iio_val_s64_compose()? Likely even inline in sysfs_emit_at()?

There is a compose() already.
 
> It would match your call to iio_val_s64_decompose() below.

here are the helpers prototype:

	s64 iio_val_s64_compose(s32 val0, s32 val1);
	s64 iio_val_s64_from_s32s(const s32 *vals);

	void iio_val_s64_decompose(s64 dec64, s32 *val0, s32 *val1);
	void iio_val_s64_to_s32s(s64 dec64, s32 *vals);
 
> And the above makes me wonder if the compose()/decompose() are not the
> only helpers we need? At least in terms of parameters? I mean, just
> assuming we only have two integers instead of allowing s32* and opening
> the door for misbehave :)?

I suppose we would really need some sort of:

union iio_val {
	s32 val32[2];
	s64 val64;
};

or even add a:

	struct { void *ptr, size_t size }

as another field to be more generic. Also, maybe another field to indicate the
data format, or format is something that the attribute itself should know,
instead of relying on other callbacks to figure out value formatting, but all
this changes iio core current design.

The helpers are simple enough and they are only introduced for consistency when
handling 64-bit values when consuming existing iio core interfaces and
implementing read/write callbacks.

> Don't feel too strong about the above anyways!
> 
> - Nuno Sá
> 

-- 
Kind regards,

Rodrigo Alencar
