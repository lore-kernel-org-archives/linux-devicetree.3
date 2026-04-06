Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391762F3622
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 13:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775483050; cv=none; b=J8o+ifknDMhqji/J65dyuayay/bU7VfqXeet7aGUHYe4SjYV4xAa5xIkd6bc/N/Jo3kHwA7K6GLiHffKEp3Xv0z61fnr5V9+J+34Rzow7I7mr/3QKlJAf3iUQPWyph43gpDgiro2srBzOyyY96+z7eusS+h3hV+9T7R3mijKHuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775483050; c=relaxed/simple;
	bh=hkcM1Omm9OFY6W+niG6QwONEFgv1cJEAMBmp9sPIB5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o1keErvBfhjSJs9kqtVL6g9eBALDHn694HrtowhdaSJEdYpBGnd47xcabZy5dd8F7n/J9R4WpSJ6upzB6swaFaDQO4ROuDV7OqcNSv+rsFGva7QhXY6gOsJUwBfGXuzuMN6Q7Djc0oma5hF/shXUSBou8KqZjVIvnZjCpXAPNL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=EpI3IggI; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="EpI3IggI"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7dbb6c072f1so3018750a34.2
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 06:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775483048; x=1776087848; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7rlQVLfivynUuzRB6dYfCNFOl6c9Ld5CNamz7tvg5f4=;
        b=EpI3IggIGZVVD0vjKmwWONi0EPPwXX3XN7NAEM9b4wDVT6nbv96/CKQ60b7F58WQAa
         +7cCka65EOM8/GcT/IZIf51QBwwSxlDeehg9HV5DuOvkIQ+W3W8Q5FNrxi561AdSyEht
         SLeupVKDHBuRR6zZ0NFzqD+K+ItF0RmdMl3X9Uh7mJo5quxtNlTvQOLYLWtmQ1rr0lgV
         DlZZzrBmKqJQMsXVrAPFBaBXYraeCuZK7J4CBMW4o1Lhx145kILQJn4wOfgSUbcdVm86
         fn1PTaZHfIQxgwUsH8BhHiOYtQrGPphLmdolEW0/05WCbsRUXdrPaVmEdAzTTu+qYzjy
         BxUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775483048; x=1776087848;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7rlQVLfivynUuzRB6dYfCNFOl6c9Ld5CNamz7tvg5f4=;
        b=MG/hOSlafSBK++Q0FevQhhsap0yWrH/pTKmDTfVS55UYZnPNeth5EvlIB7scLPDgDt
         tGpE5H2/HmpNTSR9RvQv/k7wnIS02LfD4RKq6xUshzXsb6vH4u1hv7QcXvLkixxZ9IR2
         yel0cLIwhPDjQjQcIle1145kBM0aa2VSf0fepOIrLWbe2PFR0uewQVHX8z79XXuUd3jR
         7TYksfpN7eZJb6JlumMXMTMeNPMyhDIw26MhiOf70XNzj2fYwv+aDpFN6UAjP8P9ylLv
         sTtj4p0tusLcnsRUyatPGGOB0yA94OH210s5RRRjfvxng1+afedIhb354gct45IgwkVK
         hsTw==
X-Forwarded-Encrypted: i=1; AJvYcCUfHLss5QitH4hgn75hk/jIRxfJg8BIn3lXuIaL+s3rtmhKkNLDfiKkh4/VwBfDJD+IyiicZ972Jgqv@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxvxj7+44138VJuWn/1MSLgBBhItd+uClbGjDkfe6RBMYheK41
	lcB+Pun9CxbZj8yEOWv56WOMJOM77O70C5Kj+OcSKI9V8IPCQiXFxLJSHU47D5IRaME=
X-Gm-Gg: AeBDietEfLB8Mu17IlRwZVN9fxChI8C1JhgXd+5qaY9rc+y+JOFCtnfuVGBhb26P6Pq
	wJqxHlGsvtlwG12qpzHcWUab/WSyToHxKQT9aByx+3prJuMelH4lZ7T9XuG2O5Kj3UUGFMkr5zA
	5tzhKbNh9pTYGHx9ghHm1h4Uupp7H1lXfOKP2OjYTBGPIdHcqlX5rcW8RJSZsCwpI3kAL3l0HEt
	lyD+fs4jI567rAMKsXYV4AJmcFLFvv2ggYgDqMwxaWC05vqe5mSWG5lguQsCs5bhTxC2e87k1Nj
	8D68+R9JoqHd00FWS3iE+sDjqROTirSFfZb/f1MvUp0J8lLfJ8GM691GxEhUJ0mK8uPM5X1AeR2
	y5621l5np+f49v2VTs8uH5BXK+GC/HfN/PSjLmMgNjgKLXVBqCfDw8fzXCgMaWz4nZ+oo6qVudt
	9V23FmjPmvoxOW+iFSfsYAqdvH8s4EYb4lVd+Gh7IEWWxnm3jnZ8/3re0zQoP7cuckWJWBFgk=
X-Received: by 2002:a05:6820:81c5:b0:685:d2b6:6df7 with SMTP id 006d021491bc7-685d2c5b87emr2235876eaf.9.1775483048117;
        Mon, 06 Apr 2026 06:44:08 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:90d7:b13f:c53:8ca3? ([2600:8803:e7e4:500:90d7:b13f:c53:8ca3])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-422eb42db1bsm12915687fac.17.2026.04.06.06.44.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 06:44:06 -0700 (PDT)
Message-ID: <420dba4a-0c31-47bc-b84a-5d29702b115e@baylibre.com>
Date: Mon, 6 Apr 2026 08:44:05 -0500
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
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <LV9PR03MB84145906CC191F6AB8D2D3DAF75DA@LV9PR03MB8414.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/6/26 4:34 AM, Sabau, Radu bogdan wrote:
>> -----Original Message-----
>> From: David Lechner <dlechner@baylibre.com>
>> Sent: Saturday, April 4, 2026 6:34 PM
> 

> ...
> 
>>> +Selected when a ``pwms`` property is present in the device tree. The PWM
>> drives
>>> +the CNV pin independently of SPI at the configured conversion rate, and a
>> GP
>>> +pin (identified by ``interrupt-names``) asserts DATA_READY at end-of-burst
>> to
>>> +signal that the AVG_IN result registers are ready to be read.
>>> +
>>> +The IRQ handler stops the PWM, fires the IIO trigger, and the trigger
>> handler
>>
>> If we stop the PWM after an IRQ, then we don't get a consistent sample rate.
>> Ideally, we would leave the PWM running and just pick a rate slow enough
>> that
>> there is plenty of time to read the data. Otherwise, this mode doesn't seem
>> particularly useful.
> 
> Should there also be a condition when setting the sampling frequency, that will
> protect from setting too fast sample rates?

I haven't figured out a good way to do this since the real max rate
depends on a lot of different things and when not using offloading,
the time it takes to do SPI xfers is non-deterministic.


>>> +IIO DMA buffer:
>>> +
>>> +* **CNV Burst offload**: the SPI engine reads AVG_IN registers with a 2-
>> byte
>>> +  address phase followed by a 2-byte data phase; the 16-bit result lands in
>>> +  the lower half of the 32-bit word (``shift=0``).
>>> +* **Manual offload**: each 32-bit SPI word carries the channel byte in the
>>> +  first byte; the 16-bit result is returned in the upper half of the 32-bit
>>
>> I would expect the "first" byte to be in the "upper half" of the 32-bits as
>> well. This layout could be explained better.
>>
>> Also, since extra data has to be read in this mode, does this affect the max
>> conversion rate?
> 
> This is bad documentation on my part. "channel byte" isn't used anymore,
> this is previous version behaviour. Right now, only 16-bits worth of actual
> channel data are used.
> 
Then why do we need the shift if there is no other data? Can't we rework
the SPI message so that there is no shift?
