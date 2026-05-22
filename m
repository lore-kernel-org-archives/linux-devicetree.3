Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F444218AC
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 14:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779458985; cv=none; b=ZmEi6PhpQg4VJxqK8SWJFJtwEUDK/7l4O9LpqRs/Gwqd7KdK2rD7N6PAr2A0G2DXO+7+kNaeRcU0S17+Gz6hrcgGu80qVM6jb7z47Zo6FzfiBAI5RDmNZ67c4mWBeyXgDbvR3oTTzb+Wt+qqqwrxiOwDu6iA7qXI329shxHarpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779458985; c=relaxed/simple;
	bh=Div5yxlglnPNlEq92sKIOutbhS6DoZJ3nxXjujNwMes=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=QYJbxNWEVM8K4SdrEFy31nSjbzT7go6Vg4R7yx4GS7XCqo38aKfN+2fVxDY3H3+jN2E6ZZu3eflvQ5q91tPM5whQ5Xrl1waswqq4/Y5HhdU0tvnY3/ztTCng+NLre8ZjfVLIEn7oWb2nwDDF8VjAdmst7PzmmZuHjcKzMBCJuys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=XSc22qUF; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="XSc22qUF"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4855e69a5a4so104133b6e.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 07:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779458978; x=1780063778; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dnryr+x2yZjU4omLfati+UlNE1xmARQl7d4bNblSI1Q=;
        b=XSc22qUF4gqrTobBtfmVS5fbH8kJUSmWj4AI8oc7Szqiu2jz7n7M0tCvIzQKzDGIG+
         PXphBxXVbCzlfZpEGMgA8gUmpIDElxer7mlz6MXM7ufHt4muowP/a2SbtxEE+js2eawD
         J24FZhKCX6huSmwErP5AfJuJFrXuK2n1ruW/JeOg9rf049cARl3wHC+AFfh0yYfm0Otk
         JNOPKOGJBeJ1ZDiuNlFrz3nhBj055qkhMB4+5pRq0yzwuS2b9mc16tk49KpqqqWyQhhA
         t6CkQvHeTxFLwDmnuEqDFUi9BB3LTA+D1lqNLk06CjApD74K3cD94Ev4En1D6OJCTzR3
         1ocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779458978; x=1780063778;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dnryr+x2yZjU4omLfati+UlNE1xmARQl7d4bNblSI1Q=;
        b=Ad46GUjOyZGRQCx1bVzMSOqXsK7YuodbMZR/M9Jbjr1FhRS17BUOLyOpdHjAYtrHpC
         IUgQnW7uUMHSn88vES7C+dijdtsK9UAXnAjh6/Wt1/s874pkeqUMS50lV/N5R/k3jHPn
         PBMAXdpFIoyK+qGq+00SizVKRAaCQEqaLfGtXjWFVH19kLfzY0JWYSSYXMocXBUbAZHl
         AmoWcKkaiWDf8dl0pGD8MFN74bL/850I8RL3HF0dexN5GuA5nBZaM669pNDOQ0Ljj2mj
         kMqriYBPE8GdZ9ADuV5/mc8z/91cLU7QKk/baltmic4wRTRm46kLFe6IkNElRhbVSxiH
         x/tg==
X-Forwarded-Encrypted: i=1; AFNElJ/B9lTSjAsUeh3+Vs0QqOcHPJqQZzjORaL0FFgKpUUsW04IPDY/r39AlloU+v3M4CryLKt6NBB1eq+X@vger.kernel.org
X-Gm-Message-State: AOJu0YzSlbfl2FxPVc69pgH40X3qGb/8IdlVo+8D7w9jEjOJZhaXKL5R
	vcqbLQSzgRaS0ZhXTHEZtUb7NeJKAia5U4/8I5Pti+ekWR7+Ss+9ShyYYiFF/n8Qtbc=
X-Gm-Gg: Acq92OFxxGitHL8hCv+Md3c4YXVsbJBKW0VEIu4jw6ewBvDdqq9CA4qjc79T3w4YcqG
	Vm7urtcvOsfR0bEFmtbY/nGgcGr1Flz+HP/gzv5e5fInHBRB3KWPozBRbAF9p5AIPYh/LPdOJra
	zjiOlvaJ8XoVbDrvM9ylX0ZKC4SpciGqXdJRGpA5eAHJ69H0mZ/PG5lH4JBuwXYDy3RNVjEXy0z
	d4QVD9kJSe4XvgxnNoEJ4MiXzlpepogCQF6cxjEqmP9p7KaeSerR5QNnJz5pC1nuM4rW6Jwd9TB
	ponKB2EB0F3HyFYUg4QOo7mRUSkgNUI5n67W/fE7JhTuaQGsiRKxUrIK3WIE/8M0f9xeJgJPbzE
	lFux4G7vKyhRg4iyXVZpsiJBQ/sySEMqWzNA8SaEa1O/LHwrjGj0WFIFOz40xGsBbuEu/z/mCML
	BVv6FJO1Cv4LAgJD4QutMBqG6U7lDg1u42+j9fv0FStKVfDeQXrtXqd8g3tHHUZE0QFQJtBVDVW
	+By7tB8hHbq
X-Received: by 2002:a05:6808:4f6b:b0:467:268d:31cc with SMTP id 5614622812f47-4854a169876mr2339807b6e.26.1779458977741;
        Fri, 22 May 2026 07:09:37 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:26b1:32ad:c1ad:687b? ([2600:8803:e7e4:500:26b1:32ad:c1ad:687b])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-485546ed055sm531458b6e.12.2026.05.22.07.09.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 07:09:36 -0700 (PDT)
Message-ID: <ef6deccf-f916-4fe7-8561-71620a8a7b59@baylibre.com>
Date: Fri, 22 May 2026 09:09:33 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] iio: temperature: ltc2983: Add support for ADT7604
To: Liviu Stan <liviu.stan@analog.com>, Jonathan Cameron <jic23@kernel.org>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Francesco Lavra <flavra@baylibre.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux@analog.com, devicetree@vger.kernel.org
References: <20260522132321.1641-1-liviu.stan@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260522132321.1641-1-liviu.stan@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/22/26 8:23 AM, Liviu Stan wrote:
> On Thu, 21 May 2026 19:18:28 +0000 sashiko-bot@kernel.org wrote:
> 
>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>>
>> New issues:
>> - [High] Reading the IIO_RESISTANCE channel bypasses hardware fault detection, causing hardware errors (like broken sensor traces) to be silently reported as valid data.
>>
>> Pre-existing issues:
>> - [High] reinit_completion() is called after initiating the hardware conversion, creating a race condition that can cause spurious read timeouts.
>> --
>>
>> commit d382a4cbefd41723ab5ddd91fd399d716c8faaec
>> Author: Liviu Stan <liviu.stan@analog.com>
>> Subject: iio: temperature: ltc2983: Add support for ADT7604
>>
>> This commit adds support for the ADT7604 temperature sensor by repurposing
>> custom RTD and thermistor types as copper trace resistance and leak detector
>> sensors. It introduces two new software sensor types and exposes a new
>> IIO_RESISTANCE channel reading from a separate result register bank. The
>> ltc2983_chip_info struct is also extended to use a 64-bit supported_sensors
>> bitmask for the new types.
>>
>>> diff --git a/drivers/iio/temperature/ltc2983.c b/drivers/iio/temperature/ltc2983.c
>>> index 326f843f42713..e2ffeee026eef 100644
>>> --- a/drivers/iio/temperature/ltc2983.c
>>> +++ b/drivers/iio/temperature/ltc2983.c
>>
>> [ ... ]
>>
>>> @@ -1205,7 +1502,8 @@ static struct ltc2983_sensor *ltc2983_temp_new(struct fwnode_handle *child,
>>>  }
>>>  
>>>  static int ltc2983_chan_read(struct ltc2983_data *st,
>>> -			const struct ltc2983_sensor *sensor, int *val)
>>> +			const struct ltc2983_sensor *sensor,
>>> +			u32 base_reg, int *val)
>>>  {
>>>  	struct device *dev = &st->spi->dev;
>>>  	u32 start_conversion = 0;
>>
>> [Severity: High]
>> This is a pre-existing issue, but can this function experience spurious
>> read timeouts due to a race condition with the completion?
>>
>> Looking at the rest of this function:
>>
>>     ret = regmap_write(st->regmap, LTC2983_STATUS_REG, start_conversion);
>>     if (ret)
>>         return ret;
>>
>>     reinit_completion(&st->completion);
>>
>> If the hardware conversion finishes very quickly after regmap_write(),
>> could the interrupt fire and call complete() before the CPU executes
>> reinit_completion()? This would overwrite the completion event, causing the
>> subsequent wait_for_completion_timeout() to spuriously time out.
>>
>> Would it be safer to call reinit_completion() before initiating the hardware
>> action?
> 
> This is theoretically valid but in practice, the conversion requires at minimum
> two 82ms cycles (167ms), so there is no realistic window for the interrupt to
> race with reinit_completion(). What do you guys think?

I would still move it before the write so that it looks correct
and others can copy/paste the logic on other devices.

