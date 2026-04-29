Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD2937F8B2
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 08:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777449938; cv=none; b=NAS/59d2QFPipcRWyuHRtqJtosmn3RllXEKcZx61LUJPm4BUwNCCqi+KIfLjQfQLWXd5477AEMOAgoGWzODmAPbTj2h70X4ZdDIF+RoIRbhv+I9SoMSv7fEACzdoyxcXmwmuz7t/JYuo2jz6G7ocGQAa8/wQBGVL47MUTiIx7qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777449938; c=relaxed/simple;
	bh=9XhvGoYNbmK0EgkkbPli+CfIauASFOZG3mAHX+GE4U0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=e5BghqMCh+yZ4eY8N0tg8P8aSy6D/QxQjDoq0SAy0FDG9lExBDFFw2L/FgbwjHPjEONePWLBQYhqv4XJQS3gX98Szb0oxALvG7CwawSfNb/euddGVlAF5FcyDeyIbDtFSM1Vlu249i1viQ4wuBfaoYOf+v+Kco+DoPd4DaLAuY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YC5IeAIn; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YC5IeAIn"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so111134985e9.0
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 01:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777449934; x=1778054734; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f2WkYe4QLm9iINjlo8ZfDPBqpnaOA/qNSmZLtkgGRZA=;
        b=YC5IeAIn/RS1+GtZ+ETIapFxRa7Gj7FJbGNp0rSJhdRxlRh//JZnEJ7rcL52nBLqcJ
         GdPQBa5WN5udMQdwJ6+xPFGiAiMfaTRB0TpBLAqrgucN3/gsKwnre0X9JtisqewUfqrq
         7xKWUQZr2pZQ9AcEm35U+b9vR55kfTr7rbZK8cgFmAjMG940Qa3HYa3aBV8iWq9V/vQa
         y6vE0jfHQHKe+voVG9d9AiKI0U1F6xvPLRc6kT2dXalPR8ejigKqCfIELASz9I0Lj0F9
         k33+Z+MHMuLuI/xvzFVCVI+Q1teVUf9ngjGi3P3v+H1vD6LrRiFKGvSLZHOuFokmh6Q+
         VMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777449934; x=1778054734;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f2WkYe4QLm9iINjlo8ZfDPBqpnaOA/qNSmZLtkgGRZA=;
        b=JkAxdH1PBbqCkXhj9YA6dcYxQ/vzZSwbm5Z3ys3+702rKxSW3ZyhE/wB6RBJL1QMBx
         6mF+EnykOmm9Vn6HSjl3xS4rwBVdKM2tyCeLUBeDkuhq8f8qPOxKJ/G0Ra+DFoj8bNe6
         YvFAd+6uFm8EDUwCr6Xl4FruGfUI4B3Qu/uqr81/PahuraEhmr/Ux+KJT1gWOdKDYSBQ
         Dr0lr4XdlkGrmhkGCMXWXB8+JOYwW4hpT5wST4THsCQ7sdH2qV+D+/sg5uOisuu+2b4m
         awJ3Up6ihg7jp3QvQZ16ouRcobVhTTrs2LCfa0KlN5y8YdxQGVI4mezFOLMwHw9frHpx
         RMhw==
X-Forwarded-Encrypted: i=1; AFNElJ8LiyBTqqx9O8fwIc2TjJ1w34Cv/2OFT8S/9Sdik/33iRxUdZ7Uu6UC8gZ4Wtgl7vVgol0EPBPZp5ix@vger.kernel.org
X-Gm-Message-State: AOJu0YxiztPWTgS18KHvePqJ6xK+94NqXrgVnm0nrA9/SFhLIovfeZ4I
	3Q7tSTlc4r6uGYj/3nwYJJTt4b5u36Bqn1VrIKcwGqLCFHoDGAo//FYTcDG4iOO/Pl0=
X-Gm-Gg: AeBDiesshZw8/cgA4deuspicy0aZE0aaUY+2uRmvxL/6ThdM7qx7GXt1RRuYZVLegSw
	MM2V98qc0MbaPutNDmj29MFL2w0Bb+5YS5oNVdEWcfqkkIyVo3pPs6Vd9fYUog5KLwtWzDxn86J
	2khgRbu2Kz4puPEPJrJx+vsrVbRh9s/vXtRFcZCgxH4/Xv44ZDwUZRHQzMBmtDnKO6hE/mhWqFa
	GX6SjHsggSt4dmBMWYLQXDrNWjU6cMseSrVq83lwWmZVAgubKx0zRhXG2f6MvHYMFGBlj4p8m03
	jUtMGzckHgdVF6UgNS7Ig7jFp2DHYZO/pxLZNQzmDXiNok2oUkjMUi+smSWOsQaYz4uWG6h0uk6
	O+9o/YAXgxRcEor3KiVMjqbNFEMw0q7PtwSb0bVJjO/NVL+aMoIqR0x17cyCX6QtocHH5347EBq
	3YVS0oUyEvgL2bfzq3zVV9PYufYffFJ/3wz748g+g8olfczcE9sO5Mtb+Yo5qQne9UFCmLDGjI5
	SOXLKv663PqJLoUvL6v/iyEUdaa
X-Received: by 2002:a05:600c:8582:b0:485:3abe:ab86 with SMTP id 5b1f17b1804b1-48a77af3ddamr71269855e9.4.1777449934157;
        Wed, 29 Apr 2026 01:05:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:b679:2e1c:a552:545b? ([2a01:e0a:106d:1080:b679:2e1c:a552:545b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b7217b20sm3884982f8f.22.2026.04.29.01.05.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 01:05:33 -0700 (PDT)
Message-ID: <7d2fd0d7-2ac2-43d8-be5c-4f9fcd7908bb@linaro.org>
Date: Wed, 29 Apr 2026 10:05:33 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] regulator: add SGM3804 Dual Output driver
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, KancyJoe <kancy2333@outlook.com>
References: <20260428-topic-sm8650-ayaneo-pocket-s2-sgm3804-v1-0-1d8dc7620256@linaro.org>
 <20260428-topic-sm8650-ayaneo-pocket-s2-sgm3804-v1-2-1d8dc7620256@linaro.org>
 <afFS3W5hokXy3T7x@sirena.co.uk>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <afFS3W5hokXy3T7x@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/29/26 02:37, Mark Brown wrote:
> On Tue, Apr 28, 2026 at 03:52:06PM +0200, Neil Armstrong wrote:
>> From: KancyJoe <kancy2333@outlook.com>
>>
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Signed-off-by: KancyJoe <kancy2333@outlook.com>
> 
> Your signoff should appear at the bottom of the list here.

Right

> 
>> @@ -0,0 +1,280 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * SGMicro SGM3804 regulator Driver
>> + *
>> + * Copyright (C) 2025 Kancy Joe <kancy2333@outlook.com>
>> + * Copyright (C) 2026 Linaro Limited
>> + * Author: Neil Armstrong <neil.armstrong@linaro.org>
>> + */
> 
> Please make the entire comment a C++ one so things look more
> intentional.  The authorship overall appears a bit confused?

Sorry, what's confusing here ?

> 
>> +/*
>> + * The registers are only writable when the gpio is enabled, so we
>> + * can't use the regulator regmap helpers & internal gpio handling
>> + * so we need to track the state and apply the state at enable time.
>> + */
>> +struct sgm3804_data {
>> +	struct regmap *regmap;
>> +	bool active_discharge[SGM3804_RAIL_COUNT];
>> +	unsigned int sel[SGM3804_RAIL_COUNT];
>> +	struct gpio_desc *gpios[SGM3804_RAIL_COUNT];
>> +};
> 
>> +static int sgm3804_enable(struct regulator_dev *rdev)
>> +{
> 
>> +       ret = regmap_write(ctx->regmap, rdev->desc->vsel_reg,
>> +                          ctx->sel[rdev_get_id(rdev)]);
>> +       if (ret)
>> +               goto err;
>> +
>> +       ret = regulator_set_active_discharge_regmap(rdev,
>> +                                                   ctx->active_discharge[rdev_get_id(rdev)]);
> 
> It seems like this should be a regcache sync then only the enable and
> disable operations need to be custom?  There is a register cache and it
> covers these registers, without it the _active_discharge wouldn't work
> since it does a regmap_update_bits() and all the registers are marked
> unreadable.

I added regcache defaults with the default hardware values so it uses the
cache default to do regmap_update_bits(), and yes none registers can be read
so it uses the cache.

> 
>> +MODULE_DESCRIPTION("SGMicro SGM3804 regulator Driver");
>> +MODULE_AUTHOR("Kancy Joe <kancy2333@outlook.com>");
>> +MODULE_LICENSE("GPL");
> 
> More author information here not looking joined up.

I'll add my entry.

Neil

