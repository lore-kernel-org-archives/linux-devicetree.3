Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BF12F691D
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 09:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780306937; cv=none; b=KVXZSoLwkq8uDXQZQIlgHoCnfzKLrRB4fjyVBhfMEmx7Mk6KWwu4iqsHh5KnDleYHEo2QGNons6evKMiBBnTH9Cxyp8JxIwDLu6iKI91oGXpei5mrcBMm/bz18c0U0UyGvA6UsITnR1tPXbtST5IxfPBvPytDf9cIVdoMAItA34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780306937; c=relaxed/simple;
	bh=M4KJACFzvesHU8ZcNTqZNU2lBZR0p+BUriDvgnQRgKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQJkuui5Hdhyirq3GoksHH2KOjXqO2qCKNt+VfgeHiytfAo3iKSwOvnpKG2lU+vubq4iVu8wYfaU/XGZKD7sQJK1k5sBx1M9OxO3cuffdD3x91FdlMAIu8kWm/o/Jn8EiamrgglB8w8X3yAhJF/9WAU1fNR4sgaxPdfD64O8uuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ofa4pL1O; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ofa4pL1O"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so101567525e9.2
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 02:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780306934; x=1780911734; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yej0wnG6WIrmpOSuTlhVpOj2TC3TsG+QHTev2H2YE0M=;
        b=Ofa4pL1OoOUvRPRqyi5+VclYD2rgWkRgX/TAF4TGLvgpBhTUL1cxiFA2OJqFuwEDTy
         1OE6qpGBY2BdtNAKBl8GG35OFYjgGnSxwcLTXxOf479Nmxeb47sff9VUc3b9goWt37L4
         wuQJFSpfoNRPW020fAEvrKILrfK6YIHl9fXNafqRI3MsESArpp+mv3NRzv+5uBI5evU6
         f/oBPJlPCd7DkdGj7CE6jagHQPKdB3BbkPGtpTYzcdhFJi3lmeWTEfMKHcrEh4ia89aH
         hSe826dL9jxehElWDqx6gTK6Y8PgenysEXwTJZofUsE2w1jdxLLdpAOP/nH+FiIwSe9+
         utjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780306934; x=1780911734;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yej0wnG6WIrmpOSuTlhVpOj2TC3TsG+QHTev2H2YE0M=;
        b=FiuWj54lTkxKqqfjtz24RTHjKyv5VZf7lJZgQv8ymyxPzv4WPD6weUh1iiKu2P4ekk
         zWXWmahb5ax8NrLiwCTBpVv0/y73453qc+28cFtlHmm4VzogEkyQrNXMNbzxgg/4Z8cN
         UiS5Nz9rgv1IfPyFn8Hb7NRKgacDMO4HtzfSs1FRvjvuDMegOu/PgYbx1sRDupglyzqA
         0YXC0wyrJiAnLApjbCGQz/UAC+aha63Y3o/RYUO/jCvK+3/1ZIUAF9cfSoN+BmvQ7npN
         W5u3ROxO8TkfbmGTgfULdOiiahkqId0gsv7UWh6E9I4LRyjoW7l/C/uz8RYghkGVAzAV
         bcqw==
X-Forwarded-Encrypted: i=1; AFNElJ+vgMjpyXu+eU5UKwTnGSnh5VvM50F3XwFoKJE6vJ63hhMm1EtrNy9CVvmvOafNto/8LdPYxX2pHjm3@vger.kernel.org
X-Gm-Message-State: AOJu0Yztt7XYzyNZoSGV5ENFTInufc3ZnZhxLUiChMPdlEF6UVk6ilCM
	Z99NtYJOuKU8u7wpYsLIBsLM9INB6B5Yq4767+HDWBqISgPvurzjOoBi
X-Gm-Gg: Acq92OFnhtKfsG0LSTnF64plT0rkgdvL8Rxpu44SpXma8OdPzY3/LRCd2FhnCRl646P
	q+vcCTvp8v57iZ/AYfEknWRDXrzyLVt1C6XDZwOwA4qfINXBnVGuke4c3rIFfm8w0r4FvY9+VkJ
	UYBSQOe1n3ik9feXS5vu8JzwZxVCi3xde9iOc6xYX5nst9SkViWr12kqHZz/QyH/6ShBSvuS4HM
	gDvGxzlREgxG0wuraMUv+8SB/Kufj0kWhKRUxkNtOqcRS9wGJ2Rg9533NJ7D1oDOuPH4fbzCLrM
	4Z9slRvyVUThhtEkCf/jNTVJKF4dg7Dnt2YYdVTC0kcJMjkLGw+MlKe2+R3kKcrBL8U2RYNvfIP
	a4wIZ4OwhnMQJwO8k5q9CSlTg9qgQ0jJ8+iyy8Q2y+xRyFIDzfH/slDraKDw31A7asjtHwiQRgJ
	5miqAN+bswg91IyRWzaKCb/oniRQ==
X-Received: by 2002:a05:600d:8497:10b0:490:6869:9601 with SMTP id 5b1f17b1804b1-490a292a48fmr129304845e9.6.1780306934316;
        Mon, 01 Jun 2026 02:42:14 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6f3612sm241891185e9.12.2026.06.01.02.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 02:42:13 -0700 (PDT)
Date: Mon, 1 Jun 2026 10:43:11 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: rodrigo.alencar@analog.com
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
Message-ID: <ah1SUD_QpRLD2WGV@nsa>
References: <20260531-adf41513-iio-driver-v15-0-da09adf1c0dd@analog.com>
 <20260531-adf41513-iio-driver-v15-6-da09adf1c0dd@analog.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260531-adf41513-iio-driver-v15-6-da09adf1c0dd@analog.com>

On Sun, May 31, 2026 at 09:30:49AM +0100, Rodrigo Alencar via B4 Relay wrote:
> From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> 
> Create new format types for iio values (IIO_VAL_DECIMAL64_*), which
> defines the representation of fixed decimal point values into a single
> 64-bit number. This new format increases the range of represented values,
> allowing for integer parts greater than 2^32, as bits are not "wasted"
> in the fractional part, which can be seen in IIO_VAL_INT_PLUS_MICRO and
> IIO_VAL_INT_PLUS_NANO. Helpers are created to compose and decompose 64-bit
> decimals into integer values used in IIO formatting interfaces, which
> creates consistency and avoid error-prone manual assignments when using
> wordpart macros. When doing the parsing, kstrtodec64() is used with the
> scale defined by the specific decimal format type.
> 
> Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
> ---
>  drivers/iio/industrialio-core.c | 47 +++++++++++++++++++++++++++++++++--------
>  include/linux/iio/types.h       | 30 ++++++++++++++++++++++++++
>  2 files changed, 68 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
> index bd6f4f9f4533..a88088cac641 100644
> --- a/drivers/iio/industrialio-core.c
> +++ b/drivers/iio/industrialio-core.c
> @@ -19,6 +19,7 @@
>  #include <linux/idr.h>
>  #include <linux/kdev_t.h>
>  #include <linux/kernel.h>
> +#include <linux/math64.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/poll.h>
> @@ -26,7 +27,6 @@
>  #include <linux/sched.h>
>  #include <linux/slab.h>
>  #include <linux/wait.h>
> -#include <linux/wordpart.h>
>  
>  #include <linux/iio/buffer.h>
>  #include <linux/iio/buffer_impl.h>
> @@ -655,6 +655,7 @@ static ssize_t __iio_format_value(char *buf, size_t offset, unsigned int type,
>  				  int size, const int *vals)
>  {
>  	int tmp0, tmp1;
> +	int l = 0;
>  	s64 tmp2;
>  	bool scale_db = false;
>  
> @@ -698,7 +699,6 @@ static ssize_t __iio_format_value(char *buf, size_t offset, unsigned int type,
>  	case IIO_VAL_INT_MULTIPLE:
>  	{
>  		int i;
> -		int l = 0;
>  
>  		for (i = 0; i < size; ++i)
>  			l += sysfs_emit_at(buf, offset + l, "%d ", vals[i]);
> @@ -707,8 +707,25 @@ static ssize_t __iio_format_value(char *buf, size_t offset, unsigned int type,
>  	case IIO_VAL_CHAR:
>  		return sysfs_emit_at(buf, offset, "%c", (char)vals[0]);
>  	case IIO_VAL_INT_64:
> -		tmp2 = (s64)((((u64)vals[1]) << 32) | (u32)vals[0]);
> +		tmp2 = iio_val_s64_from_s32s(vals);

I might be missing something but can't we just call
iio_val_s64_compose()? Likely even inline in sysfs_emit_at()?

It would match your call to iio_val_s64_decompose() below.

And the above makes me wonder if the compose()/decompose() are not the
only helpers we need? At least in terms of parameters? I mean, just
assuming we only have two integers instead of allowing s32* and opening
the door for misbehave :)?

Don't feel too strong about the above anyways!

- Nuno Sá

