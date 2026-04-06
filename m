Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6FE2DF717
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 15:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775487754; cv=none; b=Y061HBS3knqpKTONy5Cqh+fdG8pecoVcMPcA4bJf9j/L1P74RKwaisNXZlmqR3fNbxqMrQOcQMA98bfJc2hD/wjkbrsAHRJDwxpI+BrgbNm/lq7m4vGKKqMiGzQh1WbtrkxvBItM94TBzqbL3drdfPWl/T7g+Eanx+xoVN2tINg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775487754; c=relaxed/simple;
	bh=Vx0S0OEPsMTxWc2pbFyYxITTLhXEIs8IJVVZZBki8hc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JEoMAOPIqHixODq7ZZ7CPEAapOtk0lQNk39Q5Y97GzW/raaAFR+sbMJ3PRJomqUzW/25fqKhRIyBupHbpXT/7jIteV6nmep6tmwwOIw6+fIV4JNDDADcwl0IOCDj9DZms218HRSfntr9BeOWFfHoJJhy9D3UJO70CoeafNfjciU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=crzihiZK; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="crzihiZK"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6830f4f34c9so1384590eaf.3
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 08:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775487751; x=1776092551; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zOYm5VbuAYu3Ygkfd4vye3tA8nAqOV5PzA2/v5FO7a0=;
        b=crzihiZK3iznSPHdTQNFCTyY9tRwubZfyHEDspKG2XK2CWhL5Yqbd+Fmg/GdZGmMK4
         uFtPptj5BZY8Jq2do2wLwLQAdNRr3wePMLbJoMzXTwfRVUUJ7m3YRACdiJ8A7WQH5cG+
         L4wnVXckvLC/av90wdZ6+L+ItetoVONB2UbRlH+YYsSYvJgFyc5FwiJGYERwGKqYqOw6
         HqEg7pQckRKHVKVIGKAnVO4AzWTD3mylSaPKk0rlmwEs5QfeH84KW0jywgWxIJpY/p+s
         8DC+UNxI3ko2UftMUYUaRNWTjdeXMTxD+A1m4+LtagnAOZqq5oHVloCKwyfqcTPhgvMg
         4nPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775487751; x=1776092551;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zOYm5VbuAYu3Ygkfd4vye3tA8nAqOV5PzA2/v5FO7a0=;
        b=KWjath752BttYyv/zc3Ne/vsNlfOrak7y+5BaCj04v5+pEsqNPSGyhKMUdvVQYev4a
         H1CibZKH7kAEPYYPPLWXC+Uc3GwczBUy5XGb2nY7B2t0uSQ15Db4d640i7yWSQSYKflt
         ELtRxIM1nic1sNIbqEJhJJwxAR1paBEIP+Yc9gMsvIfIUcFkzeyJ5yPyyaZQUIcWBFes
         maJk8DjGj1SJpKtOu4G5+YoJhpa/bbNuIvzI5iMmeeNTen2H9JF6RbuD+dhDbU5tHtrw
         uYNxeHxf9cE/tTLuCUvty7O1hheczUKHZVs3QZ9nzG03xW4WM38cpqNgr5Q8TLsCK4LP
         wsPg==
X-Forwarded-Encrypted: i=1; AJvYcCVlPsOcpJuqEb2EXbwnTQR9HuT6U6PKvxDVvy/QM1FeHzzgiQP9e9Ai1MEwEBdDRK6q+bqlWwwATq1r@vger.kernel.org
X-Gm-Message-State: AOJu0YzNSKON1pgYvDffIU2aBKi9nWkDaglLd6P667NDnhCE9MiqPaV0
	wtSmDsNUwg06tnVaSdk2nJwqqhqa+oBCdMycAT13BzmgTCy42hYZ7+yHmI0hezwTJ+IDnLUhWqW
	QQKxi
X-Gm-Gg: AeBDieuQKEQFh71X+uiss9l9JfIMeh5ngxzE5F8a6BVXVVaLHGWYc1r5nD9xxwCgIg+
	85TPedxpoHZY1MH87mrXSumDeQwktg/yWbFRlJxasTCr/hKaUfsKTZS4lZb7m+NpRsK/vXx//nZ
	1RI9BgArlPMZ0KadLZPIhULK1ynVPM8d5hK4oEUIZcsfgvp++BTSjzqzQwL0+ipIp5qOSlfiHK8
	9DbhEUyykadw5f5usTNGSfUhHqQPTSOj2c/dNXoyLuWoXrR1fmYl1XKCfeIVBPueAov6dcna0SV
	D6FeEjDG5849WtLsTOwzpCfjIPZiUSX6G38j/QLLC5hFhzfM5oyT5u5hxZ+KZWUKj1EBJk6I1li
	t2le+tp9tp15C2uOiEX+dx1f28B1kpYQfOfZBxbocwLc0zmNHMwfo0XFeGPijSn9HwjjLE7362A
	UYxlund3vGpz9pYMnSL346fG0+rNRHmnCQjMBXqW0SoFuPhLsCJVan2OyPB+JDibIgHXZEbYo=
X-Received: by 2002:a05:6820:2905:b0:682:ecb8:c38 with SMTP id 006d021491bc7-682ecb811c6mr6352466eaf.42.1775487751272;
        Mon, 06 Apr 2026 08:02:31 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:90d7:b13f:c53:8ca3? ([2600:8803:e7e4:500:90d7:b13f:c53:8ca3])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-68448c1c15dsm3873975eaf.0.2026.04.06.08.02.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 08:02:30 -0700 (PDT)
Message-ID: <b2d4ae51-f827-44d0-94a6-2a3db6d681d9@baylibre.com>
Date: Mon, 6 Apr 2026 10:02:29 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] iio: adc: ad4691: add SPI offload support
To: "Sabau, Radu bogdan" <Radu.Sabau@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 "Hennerich, Michael" <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, "Sa, Nuno" <Nuno.Sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
References: <20260403-ad4692-multichannel-sar-adc-driver-v6-0-fa2a01a57c4e@analog.com>
 <20260403-ad4692-multichannel-sar-adc-driver-v6-4-fa2a01a57c4e@analog.com>
 <1d0d41c8-7867-4459-a91a-a2c6774b1885@baylibre.com>
 <LV9PR03MB84145906CC191F6AB8D2D3DAF75DA@LV9PR03MB8414.namprd03.prod.outlook.com>
 <420dba4a-0c31-47bc-b84a-5d29702b115e@baylibre.com>
 <LV9PR03MB8414CB15DEC3EBBDB8F5FDD0F75DA@LV9PR03MB8414.namprd03.prod.outlook.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <LV9PR03MB8414CB15DEC3EBBDB8F5FDD0F75DA@LV9PR03MB8414.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/6/26 9:16 AM, Sabau, Radu bogdan wrote:
> 
> 
>> -----Original Message-----
>> From: David Lechner <dlechner@baylibre.com>
>> Sent: Monday, April 6, 2026 4:44 PM
> 
> ...
> 
>>>
>>> This is bad documentation on my part. "channel byte" isn't used anymore,
>>> this is previous version behaviour. Right now, only 16-bits worth of actual
>>> channel data are used.
>>>
>> Then why do we need the shift if there is no other data? Can't we rework
>> the SPI message so that there is no shift?
> 
> I thought the shift is needed since DMA size is 32 bits, and value comes on the
> upper word 16 bits, not on the lower ones as for CNV Burst.

That should only happen if we are reading 32-bits instead of 16 bits.
We should be able to set up the SPI xfers so that we only read 16 bits.

> 
> Manual Mode layout: TX [CMD_HI CMD_LO DUMMY DUMMY], RX [DATA_HI DATA_LO DUMMY DUMMY]

> CNV Burst layout: TX [REG_HI REG_LO DUMMY DUMMY], RX [DUMMY DUMMY DATA_HI DATA_LO]

This can be split in two xfers.

CNV Burst layout:
	TX [REG_HI REG_LO]
	RX [DATA_HI DATA_LO]

And we could even set bits_per_word to 16 so that the data is CPU
endian instead of big endian when doing SPI offloading.

