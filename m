Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AED2D5A19
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 15:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783782597; cv=none; b=lJC0yMmYVEnRBgjjBeOtk+T5ubHFytAggxKtF0WDKp16LgX9WIA41YzWPbC0J9Lumwck07CvnXfzrXeGClIlpuwnVosOD2kwIp6lVQ7ZAeyiAM7cSmD+v8LmdF85ZuD0mA7PC/gVXtqYu3LhCgkInNjEZaP/SjLIhI/X/yyS1JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783782597; c=relaxed/simple;
	bh=u656KmwHS2NuwcwmZgMH2DXucDEuVNMw+znBt3qpx2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u4Rg/d6w5XdX19bWrsb0Jg16IMhDkcoqqCq9dPpjrWnInxPiK1gXyWBBnGxIe1GIABmopC1EsRDf2dbllfIIzpUsbMGx+TmYPze0jCe2F/0MtH2dHjH8rkbw+gyuTn9VRq+sWNsLGgjA5kuyuUdOon0c+E7OHx87qEOqsbVSk50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=BesgDaNj; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="BesgDaNj"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7e9ecb1e13cso1598907a34.3
        for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 08:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783782595; x=1784387395; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nr0soaAtqthPp2U17XEZK/Vr4kfG1VMxAbHUIXSh0Dc=;
        b=BesgDaNjNQYR+jKIUeO95DXLO7HZIlzux01aKseMB+0HxqCGKgU+74uGM9z1QDPA6A
         C9C/D6ZKcjQslnOp3+ONoVHoNVIScnRNiUKZMHRhbiGclV+woARoyTuAJ6U4rYo/PMYz
         54Dk4ql8ihuxIg69M69LwFW0Sl4AviGoTXgCXnwA5vdFEEVpHUSsJozLT+BAdRD/nSAN
         rh1Of8Yul+Bc6Uvq1Ee3qMlpbOLfTVSn7rz85xC0k1oU5O87r8XocBptL69BQQJMqBFk
         6eBTQV5vqSQkuEW8fP3cWY2pLp+WeWhH5VXzmbsH3kP/GArcv6RI2rJlY7TpBrOQgx8z
         ngPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783782595; x=1784387395;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nr0soaAtqthPp2U17XEZK/Vr4kfG1VMxAbHUIXSh0Dc=;
        b=NQxtlL3MNiy+n7G4i3hxXXCba0IpWvVsbHSBfCRp15dw8iDKUOfPf5ZhNS2mfAJrjl
         cFFGYzauZw0HeKYm3s+6mZN53UBoxEHr9TcuYtRPQWBwqFceyjM+ZGietUEZdqUxjaQ3
         YkcxWX7iyzM4olm3Z6ybqW6ulQsh/p6LMLold4v91nuZGuKlO5tEZgG8ACaHXYKLqIaG
         kZGIUPr509IfbqvWDgssk6cNC4/YPlqigBTFHfDWQBoitAd39G6F2+Il9nK1RFHQvIfL
         KZgPiB8g0o70hKbvhPuz6Hi9RcAmXf6VzE9qLXx9wG3upg20OdQnroofk3mwZ2lZnq66
         dVIQ==
X-Forwarded-Encrypted: i=1; AFNElJ9QBZv0AKo5na3kvqxDHmXL5kQXp6xDo07S3MztJgoj4nAA53pbbmppV6tuk4tItLEvydntafFhxN4T@vger.kernel.org
X-Gm-Message-State: AOJu0YxIm0y/NLmRqpWC07YkmE+KJqsTMTsFNcLl5iXXbl8jtNIUldWf
	St2ggxOtXA1Q356vlo++jM+IODbqR/wnXGtgWREIZ5aRYraBHRLO7SBkHN5tcuN44/c=
X-Gm-Gg: AfdE7cm3QBygacRvd03zQkAIxG2+Qfzc3m7o/zqVuY11asPSVAqpoKC9PrW0VlcBdpY
	iaWimysl1znzyanlhD27mPLn6aw6JihqBIwd7q2PsPv5OZqs32ZCxKXdtgUszNXCZTnygpPUPY+
	5C2SObKbxkctoa/Yn6/IDe/cmnl0MbPVk/irf4PnsY20a2Y2VCvRcHlnEk51cUvtmQ9SRUgZ1Bk
	tiYuudT1VSzgbgHZseCmPE61qpUMtmJZQzECDjidUpyY5PVEx6+wr6nLxv8HwOjVFzNeZSZM4Q8
	moNkx4gabP5/k55xB6VaVHWvrpjeenKkh9dLOjiZ1A/aybJXk9MbVUa1Jw8BlzSXPibYgLeqPxN
	QziahF3uVvhh7GHiDqSE8cPHi2IlxmyA/8K5P9hTNo93h/Rfi+0exgpN0Hvy/eGW0/uS0Ymgbuh
	LTTa4dvpvhC4n6o8gqlw0csBw6OrN0wZ7cJEAVLZBjeH4wREN/aGUhmHEE/ylYUtYtWvcNaMXM/
	Q==
X-Received: by 2002:a05:6830:2309:b0:7e9:e5c0:e0a with SMTP id 46e09a7af769-7ec095c68cdmr2096634a34.5.1783782595189;
        Sat, 11 Jul 2026 08:09:55 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:a950:74e5:81f2:8c89? ([2600:8803:e7e4:500:a950:74e5:81f2:8c89])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcae1dddbsm8558095a34.1.2026.07.11.08.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Jul 2026 08:09:53 -0700 (PDT)
Message-ID: <0b513d21-31e5-497a-9332-7efc3fd3e010@baylibre.com>
Date: Sat, 11 Jul 2026 10:09:51 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/7] iio: dac: ad5686: read_raw/write_raw: use
 guard(mutex)()
To: rodrigo.alencar@analog.com, Michael Auchter <michael.auchter@ni.com>,
 linux@analog.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Cc: Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Maxwell Doose <m32285159@gmail.com>, Joshua Crofts <joshua.crofts1@gmail.com>
References: <20260710-ad5686-new-features-v7-0-1bcc8c280e4d@analog.com>
 <20260710-ad5686-new-features-v7-5-1bcc8c280e4d@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260710-ad5686-new-features-v7-5-1bcc8c280e4d@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/10/26 6:20 AM, Rodrigo Alencar via B4 Relay wrote:
> From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> 
> Use guarded mutex lock to facilitate code review when adding new
> attributes. This will allow for early returns, avoiding error-prone
> locking and unlocking in error paths. This also adds missing include
> linux/cleanup.h. Gain-control support will allow the scale attribute
> to be configurable.
> 
> Reviewed-by: Maxwell Doose <m32285159@gmail.com>
> Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>
> Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
> ---
>  drivers/iio/dac/ad5686.c | 19 ++++++++-----------
>  1 file changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/iio/dac/ad5686.c b/drivers/iio/dac/ad5686.c
> index 316f9ccf54d9..df32f46db81e 100644
> --- a/drivers/iio/dac/ad5686.c
> +++ b/drivers/iio/dac/ad5686.c
> @@ -8,6 +8,7 @@
>  #include <linux/array_size.h>
>  #include <linux/bitfield.h>
>  #include <linux/bitops.h>
> +#include <linux/cleanup.h>
>  #include <linux/delay.h>
>  #include <linux/dev_printk.h>
>  #include <linux/errno.h>
> @@ -177,11 +178,11 @@ static int ad5686_read_raw(struct iio_dev *indio_dev,
>  	struct ad5686_state *st = iio_priv(indio_dev);
>  	int ret;
>  
> +	guard(mutex)(&st->lock);

The commit message should explain why the location we are taking the lock
has moved. Although, I don't see a reason to move it.

> +
>  	switch (m) {
>  	case IIO_CHAN_INFO_RAW:
> -		mutex_lock(&st->lock);
>  		ret = ad5686_read(st, chan->address);
> -		mutex_unlock(&st->lock);
>  		if (ret < 0)
>  			return ret;
>  		*val = (ret >> chan->scan_type.shift) &
> @@ -202,23 +203,19 @@ static int ad5686_write_raw(struct iio_dev *indio_dev,
>  			    long mask)
>  {
>  	struct ad5686_state *st = iio_priv(indio_dev);
> -	int ret;
> +
> +	guard(mutex)(&st->lock);
>  
>  	switch (mask) {
>  	case IIO_CHAN_INFO_RAW:
>  		if (val >= (1 << chan->scan_type.realbits) || val < 0)
>  			return -EINVAL;
>  
> -		mutex_lock(&st->lock);
> -		ret = ad5686_write(st, AD5686_CMD_WRITE_INPUT_N_UPDATE_N,
> -				   chan->address, val << chan->scan_type.shift);
> -		mutex_unlock(&st->lock);
> -		break;
> +		return ad5686_write(st, AD5686_CMD_WRITE_INPUT_N_UPDATE_N,
> +				    chan->address, val << chan->scan_type.shift);
>  	default:
> -		ret = -EINVAL;
> +		return -EINVAL;
>  	}
> -
> -	return ret;
>  }
>  
>  static const struct iio_info ad5686_info = {
> 

