Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECCD43B6CB
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 14:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783951390; cv=none; b=gc9cOdOD9IcREk/kFEnWOIJZPkLO4S50Y+kKBtfXxL0fSIXUY8tCmM+j6lQJkPoP2lpy4mI+5mmwLEVtWmXcLQ3VDPLIYur6anTUdVIkgNGH0e4bneJjiSNXqEzX1pkeexN0kv+p8y4+coF8FvJWy5Ko8FUqOR/DOYvnIbMLkpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783951390; c=relaxed/simple;
	bh=B6WjnvCrK6/g7JAvoKzBLs20OUCfFEZT7MWjp6RCyAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ae/+eFKtiq+tFZz3bZnWRGK34J9PiuMIrEGGrLTwfEseMkK0n5n9iECE9EqpmUVp9SMA/0Y9gNztiE51c1vN5tMp4Yt1TO65PJhmicYC7vFrwsPc/zSV+BZSV6TrAuw8gdHNlHOa2lvB4mddmFxFyde8wUld6mkcXP8+qp7xk68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=LN+T1r+o; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="LN+T1r+o"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-44cb057311bso1488800fac.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 07:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783951387; x=1784556187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=USI3SP6Q69jN7B9GXwZfFvnMWl9QRJgz2pabjPWKcBc=;
        b=LN+T1r+omTIpn7xf2i+DYXtf41Q0FA3YL/uXvHuFav9hytNuEbDXwIVOr0PDa2a3fV
         UWCgbcR7UXsyMPEMPwW3O9NvvFo52qKjkf4FZe2+GzRXfUE1grHTDG4YipfN5bexc0iL
         19MG4Z2YQ+syo6CoAqloQK02+5KziDYeDR0tRZrNppdtqLcM4m6kxyrT34ynQOaYttkk
         /+msMOUy0YuwV9oVrmIZe5F3JQRDEfzAB8ijRBWcFhzeuq8uVVio8Uud5NFxtwAS7kie
         WI3Enks6sZghkiodRuklJdNqCHEeu+KKYJewZhP0tFJzdqJDOa2U00/QbCjFud3bvu2j
         ipqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783951387; x=1784556187;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=USI3SP6Q69jN7B9GXwZfFvnMWl9QRJgz2pabjPWKcBc=;
        b=VdXIAO7S5P+/q4hwB/NWAR39ObV04uReBIDF4DroGJzsYlBxYR4NdpfhueDpur5n/F
         GNOwtPjjm0Urj7NgIV3XqIcPB2H2NJkFKQZFzSTcWSrPGM2F1gSJYQEUZ/COE9iJzqvI
         NCVOMP58IlU5lM3U1shRAj5++8AyXGvDbOWf+7GM3+tNPbjj3+ZW+2JRULkL7Ad5kT/F
         1etKZ6FyizbaO8OatHNxPfZCUvtBorHyNjrJAdCS+DyVx0ijjz6dw3xKd1i5k/MuaD6n
         5SeJjVGN/b3NjGfOG1Nc035g/LQbyLtKJsdrcoX9yZnzsg8oUHVrC2kq6Ipdj83PunD+
         OY/w==
X-Forwarded-Encrypted: i=1; AFNElJ/HtYU3OPwr1EbOkDJh7oNF8bCrex7Y6s6+EnX+FUykCxTAO9Xjdyr2iuBWHNDmiqRWE/F17uPMNoPG@vger.kernel.org
X-Gm-Message-State: AOJu0YxjPFyxHOJv73LjDjFYVU1XICUOqhdvbNZuHWb8IMPKtME9wZB3
	eTVIhMV0wKgdrNsPNP6YUYGtybxX4vvA0VG7qT8wlRYK+HZ5pfmqVrjMz3R3t/jglDA=
X-Gm-Gg: AfdE7clO5NrOuXcAf/+ndo7UpyGUi+Wdxk3+8YyPq4BJgcrEg5ypxP079ZQk3tv2fAv
	O5xUVVecZcuwspv+VWUz/acoV/ErYuWCkw/60PSb5lEyP0S2gnI7ca/oDN8ClKSYHuRF/mp4HAR
	aIqlHmIRj80maD6pqESTymBdSOxjK/VbRKgI/Mm7mHpmqQdh2lDKIdf8kDiWte2XioejSgaYqyY
	rLcXRyEf7XY8SdjG7pIKHBNFpd0efryDOGzxH8Ax5uqbEH0Q5bItMenN1lkZOfxQGuw0LoqglX6
	ZQSU8HuYM63iwMKTYfZPh4EQ5mNfcvyd5ptvUgQrYBZCs/ScmL2O/8bk6I/+4npcqCH3ySzBnL7
	SCpaOUEyOgbhwGxGvOKfcmbmT3AykFvNz/n8f6NcSSqI/ceJzoFyTAKYDM0TNnC77SyCLL0x0zj
	p1dB45OeaLi7ChGH6f2QteRZpLzv/gvk5f4LCawaHxYvxLWNLO3VvC8PkXij0Febs=
X-Received: by 2002:a05:6820:3107:b0:6a3:90c1:c81f with SMTP id 006d021491bc7-6a39a6e8567mr5519131eaf.45.1783951386802;
        Mon, 13 Jul 2026 07:03:06 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:610b:e45c:5e0c:e14b? ([2600:8803:e7e4:500:610b:e45c:5e0c:e14b])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a384e0eb80sm7042114eaf.12.2026.07.13.07.03.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 07:03:05 -0700 (PDT)
Message-ID: <7d01660f-2b42-4602-97fd-29a80cb2ac45@baylibre.com>
Date: Mon, 13 Jul 2026 09:03:04 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/8] iio: adc: add ti-ads112c14 driver
To: Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chris Hall <c-hall@ti.com>,
 Patrick Edwards <pedwards@ti.com>, Kurt Borja <kuurtb@gmail.com>,
 Nguyen Minh Tien <zizuzacker@gmail.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260710-iio-adc-ti-ads122c14-v3-0-746d52cbf1d0@baylibre.com>
 <20260710-iio-adc-ti-ads122c14-v3-6-746d52cbf1d0@baylibre.com>
 <20260713031110.55ab2764@jic23-huawei>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260713031110.55ab2764@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/12/26 9:11 PM, Jonathan Cameron wrote:
> On Fri, 10 Jul 2026 17:50:39 -0500
> "David Lechner (TI)" <dlechner@baylibre.com> wrote:
> 
>> Add a new driver for the TI ADS112C14/ADS122C14 ADC chips.
>>

...

>> +			 info->device_id,
>> +			 FIELD_GET(ADS112C14_DEVICE_ID_BITS, reg_val));
>> +
>> +	/* Place in single-shot conversion mode to make ready for raw read. */
> Writing a bit called conv mode puts it in single-shot?  (sashiko) 

Sashiko didn't read the datasheet. The options are continuous conversion
mode (0) or single-shot conversion mode (1).

It isn't obvious from the bit name which one is active when the bit
is set, hence the comment.

> 
>> +	ret = regmap_set_bits(data->regmap, ADS112C14_REG_DEVICE_CFG,
>> +			      ADS112C14_DEVICE_CFG_CONV_MODE);
> 
> Thanks,
> 
> Jonathan
> 
> 

