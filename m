Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D374399DC
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 13:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786542023; cv=none; b=ge35+07aJiE/SdDqgKItVv9hCH72WxWhLNQ5w2is3gozdJVnuH/zeZmR5kMHg6LQe4OYexPdcOEnMBaaU1xRB3XfR9fHrE49Syv1zCVE2qJ0KoOKtLDvXqaBXGQcPsd2bUZT9G92q9em4Fhs9klbItscLH2dwsdybZ8Jw2NF9Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786542023; c=relaxed/simple;
	bh=Yp2oRgRlHLK5S6oFnlyMQg7hEjEr5DC8Y6ykHGauOQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oh0oykPqWsiU/Hbt+Qd1e8BPGl9CBOPgRfhrWyUkYDgC6T80LU8oY3TAGwt3sIgb9Ck3qbPjXcsok1Ud7cB0Mp5d/0rqneXQxFJId/C4Vs2lrxqdmwZ0Ej6iqQ9vAv+WFWcZ7HJpnSk/Ucb3U3OQtCqrwLj1i+NawPl+G6Bp6Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=KuYoRDzE; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="KuYoRDzE"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-458de93b53fso432016fac.2
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 06:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786542017; x=1787146817; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3m/mAJLnKMaOtoiImwSaVIw0nteRIaUTkKOvX93AqPM=;
        b=KuYoRDzEwL4PLALIl5YDeM+Ss0GYokunxQqXZlzOz6dGYO3Fy1YgftesXLbaMqjZ2g
         kZmWap+0y/mjsGUlq+JP3iJiFxdjwXHYqZTFovc+Z1clywebjWCs/zB3IG/S32ro6qmw
         LEb3/1ieoLnuz7H9tbF0FjJMDgKbtb1CWUQz+jXOLuGEVgETKeedrlczKQTtU/Z6+0KQ
         Z/3g7/qirYN8G1DGnEqgDCEUigohrfD0p6SmRWR/j71trki9+iMm8RTpPAiH65M1yRz/
         YnBmt0dvMbAqEBWfq+qpbxYc/LD7a7wUuRj89w7y0SSjK0upk3tJVypAWE2/GcDDzgyA
         8zbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786542017; x=1787146817;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3m/mAJLnKMaOtoiImwSaVIw0nteRIaUTkKOvX93AqPM=;
        b=T9pvIjc9NeAPBUTECSBre9FYffzwoVDIbfeWljjqgkbmifo0a33WidY9ofx2BnlKjV
         Q9L1x6A+kvbi5xH9zV5BtADAghO+zSZPko8HuExeU1Y1+JKM6BZ2uvB2GFrzKTawG36r
         ZXgTeJJTh4F3yC8yQuUGWyC0az3VKdCc/fAZuo9Op47MTMhfkM0TEPKBmHUQfQSmr2rD
         iljfRGMmVDJwn/5Pw0X31qxu6wtkeJE5FUvUK6hX5ObJ6bX0M3MBLJ2v9xk7mqT2vN1T
         NDciwS9PA94NQGQFhufeQ5baDAgY4hiJXivbFmKMBjagacGFtnn++KDW826xqlZTVgY/
         UvDA==
X-Forwarded-Encrypted: i=1; AHgh+RpXkcfOZuVjxalX2UhPCThFfbX1KXN7Klu4qgThpdIg8IA+Cq4XD02PPv/AHgklvX2fTaXCPvxACVBK@vger.kernel.org
X-Gm-Message-State: AOJu0YwwFsugRof5ROBBTlNjS44r3HwgLLCUCOx00Dqmvkr2DHcCw2pu
	WcdSKTZF4IbhgrR2F+sfbjJb6isc7F8KaGZpFJt4j2lNr8/UONBHXhwXD4P7d/jBP+o=
X-Gm-Gg: AR+sD11lfDONy40PzcZ0JH+MtFruput1LKDl9Q2lPo28hYbcN6ZiZ2tDD9euL3ZlX0y
	5VywllVd7ABNwaGZQASfm6F6Rs4PoPAwlaBwqxQJUpYofTVortflpG0FWy7DkjruJwlEQyg8dw/
	fTGd2CXpgT4n58B5QUWoQuGBaIBId7D3EP0lYLIl/aZz7i50Bz7vmtGqnVZEiHUs3jx4mCNPCy9
	cQBtrFjs0fjQ8yf367x9JXCHgWW3LBdZkPf90s57qyx1lkuGPDKRCYiMtlJAnnnCc9Ko7zOMStG
	RgPOOCFenMjLU0V8ANvPieVp9Z4xv1t/L+g0gNbiG3dZeCIiEoVB2lkFItkGDHNP3hvbtr43Pva
	0wje2uz5TzCWabQbZioy2QoBiY4cMdLxJlC9LTFEUrN9LqU8UUVM7zPa9KsdV16npOGUlWE5e7o
	oDD4gX4vB+uzzQyueK8QgnN4axdgwd8w8JHtKe9fIW5+I1WgkHACuxCccVGjFEvfVe2fMWUuqhT
	im1sIvuL4gxbwDp7lBXrT0xjTzMADPLHTdIDnI=
X-Received: by 2002:a05:6870:c267:b0:456:4c3f:7e03 with SMTP id 586e51a60fabf-45e3ea95283mr4055401fac.18.1786542017417;
        Wed, 12 Aug 2026 06:40:17 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:76d8:83ff:449f:8518? ([2600:8803:e7e4:500:76d8:83ff:449f:8518])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45e35173939sm1812914fac.8.2026.08.12.06.40.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 06:40:16 -0700 (PDT)
Message-ID: <a30efc8e-22a4-4573-93c7-e1a4689d3a3b@baylibre.com>
Date: Wed, 12 Aug 2026 08:40:16 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/9] iio: adc: add the ti-ads1262 driver
To: Kurt Borja <kuurtb@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20260807-ads126x-v3-0-f89925d72792@gmail.com>
 <20260807-ads126x-v3-2-f89925d72792@gmail.com>
 <ad95afb4-e667-4290-8878-fdd7067f20fe@baylibre.com>
 <DKK9QWYHOBOT.2VD8XMZTE65H4@gmail.com>
 <7a42a318-780d-4bd0-baf1-55d030b39233@baylibre.com>
 <DKMECOTJYOZE.3AEGK7RWPH7FW@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <DKMECOTJYOZE.3AEGK7RWPH7FW@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/11/26 3:28 PM, Kurt Borja wrote:
> On Mon Aug 10, 2026 at 11:42 AM -05, David Lechner wrote:
>> On 8/9/26 3:26 AM, Kurt Borja wrote:
>>> On Sat Aug 8, 2026 at 1:39 PM -05, David Lechner wrote:
>>>> On 8/7/26 10:58 PM, Kurt Borja wrote:
>>>>> Add the ti-ads1262 driver with initial support for the primary ADC
>>>>> (ADC1). The ADS1263 auxiliary ADC (ADC2) is handled by a separate driver
>>>>> and interoperability considerations were taken into account.
>>>>
>>
>> ...
>>
>>>>> +static int ads1262_dev_reset(struct ads1262 *st)
>>>>> +{
>>>>> +	int ret;
>>>>> +
>>>>> +	if (st->reset_gpiod) {
>>>>> +		ret = gpiod_set_value_cansleep(st->reset_gpiod, 1);
>>>>> +		if (ret)
>>>>> +			return ret;
>>>>> +
>>>>> +		/*
>>>>> +		 * The RESET pulse timing requirement is 4 clock cycles, at the
>>>>> +		 * minimum clock rate this is 4 microseconds.
>>>>> +		 */
>>>>> +		fsleep(4);
>>>>
>>>> How long do we have to hold reset before the chip powers down?
>>>
>>> For power down 65536 clk cycles. Less than that is simple reset.
>>
>> How long is 65536 clk cycles in microseconds at the fasted clock rate?
>> Hopefully won't accidentally shut down the chip here even if fsleep()
>> goes significantly longer than requested.
> 
> That would be 8192 microseconds. Do you think there is a risk we end up
> turning off the device?
> 
Linux is not a realtime system, so yes technically it is possible. It
would probably be hard to do in practice though. So hopefully not
something we have to worry about.

If it did get put to sleep here, how does it get turned back on?
