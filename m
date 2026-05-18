Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9843EF0B3
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 13:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779109955; cv=none; b=WqO7sydbuOQCPQG2+OMM9nc0J/0gHTAjmN2d+3hW+yMzr0P266W8TXr36GQ5l6uGIo5mimEo3f5rn+KlnY2tqhpjmv6mKtb0nicDZTPLCOyFsvDnj8BMiknNm9gaNBNj2gCoT/LnzY1LCgPuHtf4AcDZjnzsJ5jdTJ40kX6BZaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779109955; c=relaxed/simple;
	bh=9XbefT6LP7uaOrTBgP0TqlmDNJsKAeQiH+5pUEFQLTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jpd2z2m2I4MjrW7bJ+dwbkBtuKVQE1nk9p5CQUBLVEg5GzGoglY4Vs+/FF5xYyWldxBa3ZFwFXuAJ3mqu91cUsaxRbdsj1ROGYywfHDtjLjafxnBVXQLgLTrO/FNLUnMhqtQGJU8xWoJYA6Gls66sa0GHayO7sH7Nx10fYqIQXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=prJ1GwI3; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="prJ1GwI3"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-395317d8852so19700821fa.2
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 06:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779109951; x=1779714751; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Pdi0+dpac8Unk8S1tGuiXeeWqIL92VAm9G04zoVwsc=;
        b=prJ1GwI3OblKnvBUh7jRwdhvhs83oLlSiQfMl9QOhv/U+IS8zuBmbqdYvdybav4B2a
         5wHbZFJlYs26WBLND+66w1tywZ/wEsrfsEI+jZWQ4lvza8013GRB24oY5GSvc6/G9Pz5
         oO+Tw3wsXk9lYwPxcEitGy5kDjMFIEAdKpLquCnYJY/kCht5/FTzOuBiiRUhsfS+TKng
         P97HRqWN0ykV52oFFZR9e2nBcQhV9Ybfeh7e6pszm6SXMPrTz64bItZyiGu33Jc2vBMi
         icT65WG3u6ITgK+6F3zx09TdUaM5r6RqwR/onhDiGXJ7NQVQdvxn6zIeUlV7t3C1X7Eh
         2HKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779109951; x=1779714751;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Pdi0+dpac8Unk8S1tGuiXeeWqIL92VAm9G04zoVwsc=;
        b=iloJ8gUCP4018cGFirmmIOo72CQSrb6zIPJi0VdWkibtb6vm4e+7UMmp2BsRGN0bdb
         vbp9ITBhQkayMcyLBis6XYd/AQzRkGCIUrmCmso4cOS4zcWXfGc9+tZA4eQCpt+Dk+Dq
         cDkwrS45ye1Yrml0Gd3xGeH6lIpkUZj6sBIcRVTSorpEG3OMO/7ATBu7MwHg7VGISOQl
         oMjIaNhV5Ow5bOy9XnnIqghI+LVsH7SaRo2cc0krevXp/11Y0cXKMJeXFANLxa+Yt0FG
         CyE5hd+gm5jArDaDxdSDd9HkcYQ9r0N9Z7PKHJVCsN4N+MDdrexaRATQUVuQ58TqqY7E
         WJpQ==
X-Forwarded-Encrypted: i=1; AFNElJ9g6io0lG9/lhQaN74Dzru5gqYpMWnTtbaZg41h2n91T6l3EHJupPCs8OPU9QndrEWDdInmeEJBoHKf@vger.kernel.org
X-Gm-Message-State: AOJu0YzMbuc2VkmdTk5rnBoh1woWyzZAA8oLZjA5yF9m7zw2pXX955rr
	HPWyCEIVvzmgZRs4F232l/aOf2HIiJEMrYsQP8l4Z/wl4anjfvGIBVUY
X-Gm-Gg: Acq92OHXvjynBNKePMO3xpHcF5BBL/aOZvwuqB+fhNjgtxqK9KOPxmMmB76nqpyizXA
	d5YxwD9iG/gJYL14EtM37Cb5n4e9jnwBFmQXm/xdV+JXSp3/hDpYoEYQ0WCH66ZMgoV0YMvV1ph
	B07aNzOf/yHSglJKtBc7DDmbaCgpdcO0GpIOzZGqfos79qahJrKyaXWvad8id75SgqJ/wAOvT20
	AG0/dZFoftk35C3o2yDioorS4VolVlfZgDWeiCn48thD+a8D+LjBtVBFk7Ys8iHTXkdAmUxApSY
	T2BXl4J4KisXfktT69kjvw01tSI4QDaUTxjGm5AsT87Z40r9Bpfn1lt6vTyPXvug/anshlQnAM9
	e9i2tvvbKeUeC6ngb9LNTTwDq6VSBwB8EJI5JacK1gSEUTxJosaROA43mq58lMrWN0WkmBA7Rdf
	ohB7BHWAGZJAIiWKDhSkFzSjOBLzaSejuB
X-Received: by 2002:a05:6512:1285:b0:5a4:d44:99f0 with SMTP id 2adb3069b0e04-5aa0e733f63mr5400870e87.6.1779109951164;
        Mon, 18 May 2026 06:12:31 -0700 (PDT)
Received: from [10.38.18.54] ([213.255.186.37])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a5d5sm3319135e87.28.2026.05.18.06.12.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 06:12:30 -0700 (PDT)
Message-ID: <9bb6db05-43c7-4bdf-88b0-b92525ad5cc9@gmail.com>
Date: Mon, 18 May 2026 16:12:29 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] iio: light: veml6030: fix channel type when
 pushing events
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rishi Gupta <gupt21@gmail.com>,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260513-veml6031x00-v2-0-4703ca661a1d@gmail.com>
 <20260513-veml6031x00-v2-2-4703ca661a1d@gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20260513-veml6031x00-v2-2-4703ca661a1d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/05/2026 07:49, Javier Carrasco wrote:
> The events are registered for IIO_LIGHT and not for IIO_INTENSITY.
> Use the correct channel type.
> This bug was introduced in the first version of the driver.
> 
> When at it, fix minor checkpatch code style warning (alignment).
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>   drivers/iio/light/veml6030.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iio/light/veml6030.c b/drivers/iio/light/veml6030.c
> index 745cf3ad7092..855f052b60c2 100644
> --- a/drivers/iio/light/veml6030.c
> +++ b/drivers/iio/light/veml6030.c
> @@ -871,9 +871,11 @@ static irqreturn_t veml6030_event_handler(int irq, void *private)
>   	else
>   		evtdir = IIO_EV_DIR_FALLING;
>   
> -	iio_push_event(indio_dev, IIO_UNMOD_EVENT_CODE(IIO_INTENSITY,
> -					0, IIO_EV_TYPE_THRESH, evtdir),
> -					iio_get_time_ns(indio_dev));
> +	iio_push_event(indio_dev, IIO_UNMOD_EVENT_CODE(IIO_LIGHT,
> +						       0,
> +						       IIO_EV_TYPE_THRESH,
> +						       evtdir),
> +			iio_get_time_ns(indio_dev));
>   
>   	return IRQ_HANDLED;
>   }
> 

Is this change reflected to the user-space? If so, is it safe? We 
shouldn't break the ABI, right?


Yours,
	-- Matti

---
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
