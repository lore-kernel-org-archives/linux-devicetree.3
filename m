Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B376F33938B
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 13:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786541178; cv=none; b=dMisKRSP/6q8ZXf/65eaweRHLMc0DFfreYxo1/Qh/ZhGF1aMNBXXFpYoY80v1od/R+Y5Xg9aoMoLo+tLCnLZpOJOBTB/oEPYqskEd0xX/oYq+AvhotcwerbuL2Id6yOCYLvqGHLmcbvNcHxUqJNenOff84DM88aDYNjmuMrVGKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786541178; c=relaxed/simple;
	bh=wwHqZGeHOPOI7Rr1VYsYe3S2gNoSQoe2doFlwUqVW2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d87eOnMQzSegfXgI+kbEDJn4HZZl5abWb1uFrJ3uvC/376CTkzlZorKtCKblgFgMQuwejwKrejfVxQjfbI36PpW7SKD2W2etA3ydLhhEnynXouuVbQS8GKqsnBXgfob+qzw8+g0M6OBKkRA5S+CM/KGy8UhUv5zi0pGnF13M4YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=fUVNpy9e; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="fUVNpy9e"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7e6b5737bb2so800967a34.1
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 06:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786541174; x=1787145974; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iOEYGPRzI2ZD3nc79VvdBiED/thm1a8LkgM+AWcNblg=;
        b=fUVNpy9e28zRME9FijDrFnRV04FeGUU+oZoPLbOWH8yMHzU0e+wd6ocQoorjajtOvG
         Xey2VoSO8oDTz4/nwvZCMXyspoCzEYy6bu4zypya9vnFNc+RAccl60jI8OG8+H1vfSz8
         qClg3mMpsVnL5ywE0BhiFrpv1ZxuofrQNk6PurA7EeYKB0crH1bbLSGcO4gSt4UbU9WS
         PEQ0v0imIGlaZfknTFuNQYQvatboswJQmHKIKW7MNC3jGnMAORfQ0l1Yxqs25yi1F783
         ez7+XOB73XzgUHX+s3BTbaEK7um6PTq62UjoUZze+Tkzp/zoLiXnoJr8rdbfJ9nfGlu9
         XyRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786541174; x=1787145974;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iOEYGPRzI2ZD3nc79VvdBiED/thm1a8LkgM+AWcNblg=;
        b=kpikCmj1AXxhssNV+MxuL+inbKloy7W9Kqd7KGArhzIfD2bnTYycoR3fdrXDGBKBWb
         3Iwz5pCmYH96tpGOhr4wwCHFIAVbNbddUq97ErBwpOKpvEAdNbH0TaFnMv6T/F1OFmD9
         VC1lDXuliesmqGslnbxJHbjRPD5WbjTV3oii36ZOBNMBY//CVcxSL8bgsWVRuqpRA8/J
         gBAiXfHrCToTJgpxn2Glaq4xMVuGQHQVhD6PXVSXNc/i94/2FezsvWbZMpNYK3JLGy3i
         d0A6+lMViAHTs+oIoYPB8G5qdrK4x19FgrFkQEyFKxtPxgod/Jpld4G/VboWKA1UFMl9
         WOyA==
X-Forwarded-Encrypted: i=1; AHgh+RoZqzQCfP9G8pCBt9QXm7ugIrqJKNJI723c7CkgbmGJOprB8pOmcHHWg5cy2v5NlLe15LsHOis5fYs8@vger.kernel.org
X-Gm-Message-State: AOJu0YxvEPWEN7bL2sseHXpsvj7uWfropzuVJluBQglDCFp1nsfBWCyS
	LaMLBxpfZOPJoO21AFg6LALzBkix5xCO0CLXeIeBVEMGaV1SahmU4OFGfU+z6FgyDZM=
X-Gm-Gg: AR+sD12/7Xn/snr6re2Wy5JTb40K04/EuSiVVCGXHmyimMNRWOUlLW6YLcrklFljh6b
	qbaA0nnFPJdvQu2/N3PfzVtqU/SmFHjbMnSYU3MvM1U3mHFgqjb3+wF64qiO3Dz35aGIi2PA+3h
	/uobLrFTtPBDAQtJuEs+Cjy0qqmSa/xlWko03TVPBfh/dbcpczHi6HCEUZ9vUZwbVwLUG5yMdGV
	wRWf1Dpbt/UcKEfCrzGICExBH9sGKkHB1v/n7mUg2qSiR9GElfI6ndA9Qd5zXX9Tj5aDtcpj8Kj
	rbyClgkUdOp5coofUTwXOP9NvUP5kwefU+lsPX3hMEg7gOm8wRJUxH/UGtlrzZN/xC+F1LFd0sP
	kAFX5fMpoh1cVDwlEyDnj6ALNVzxJbZtaU7we8xkVSbpyS+2smqtcrc9zQyQ1q7EktHBvrdobC8
	Cy/8b9Q6W1G2/k/39usFzsdZlMhyLF1PURNk+REGCmpMkXiCBx18khogkswnAtvNaQOrvPr0Ifv
	dVMIMnoNReTShYbtNztIUYOKYQR8aCZGGUmdKWzifkdLzYwUQ==
X-Received: by 2002:a05:6820:f029:b0:6ae:6f38:dac with SMTP id 006d021491bc7-6b0b263aaa9mr4004867eaf.10.1786541174306;
        Wed, 12 Aug 2026 06:26:14 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:76d8:83ff:449f:8518? ([2600:8803:e7e4:500:76d8:83ff:449f:8518])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f3b3420373sm2853776a34.19.2026.08.12.06.26.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 06:26:13 -0700 (PDT)
Message-ID: <7156c902-2bcd-445d-a00c-a5085b63c95e@baylibre.com>
Date: Wed, 12 Aug 2026 08:26:12 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] iio: adc: ti-ads112c04: Add support for TI
 ADS112C04
To: Kyle Hsieh <kylehsieh1995@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260811-ti-ads112c04-driver-v4-0-ae704ac17241@gmail.com>
 <20260811-ti-ads112c04-driver-v4-2-ae704ac17241@gmail.com>
 <cd020926-9daf-4493-b0c1-6399a77fcf9c@baylibre.com>
 <CAF7HswPcqzqMUtkLkfd3zmVHN6DX-Kz+tysG8t5x=+JAH8V2aQ@mail.gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <CAF7HswPcqzqMUtkLkfd3zmVHN6DX-Kz+tysG8t5x=+JAH8V2aQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/11/26 10:38 PM, Kyle Hsieh wrote:
> On Tue, Aug 11, 2026 at 10:18 PM David Lechner <dlechner@baylibre.com> wrote:
>>
>> On 8/10/26 9:48 PM, Kyle Hsieh wrote:
>>> Add IIO driver support for the Texas Instruments ADS112C04 (16-bit)
>>> delta-sigma ADCs.
>>>

...

>>> +
>>> +     /* Power-On Reset (POR) delay */
>>> +     fsleep(50 * USEC_PER_MSEC);
>>> +
>>> +     /* Requesting OUT_HIGH asserts the active-low reset pin immediately */
>>> +     reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
>>> +     if (IS_ERR(reset_gpio))
>>> +             return PTR_ERR(reset_gpio);
>>> +
>>> +     if (reset_gpio) {
>>> +             fsleep(1000);
>>> +             gpiod_set_value_cansleep(reset_gpio, 0);
>>> +     } else {
>>> +             ret = ads112c04_write_cmd(client, ADS112C04_CMD_RESET);
>>> +             if (ret < 0)
>>> +                     return ret;
>>> +     }
>>> +
>>> +     fsleep(1000);
>>> +
>>> +     /* Bypass PGA for now to allow full-scale single-ended measurements */
>>> +     st->config0 = ADS112C04_CONFIG0_PGA_BYPASS;
>>> +     ret = ads112c04_write_reg(client, ADS112C04_REG_CONFIG0, st->config0);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     ret = ads112c04_write_reg(client, ADS112C04_REG_CONFIG1, st->config1);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     if (client->irq > 0) {
>>> +             ret = devm_request_irq(dev, client->irq,
>>> +                                    ads112c04_irq_handler,
>>> +                                    0,
>>
>> I think I've asked twice now to move this 0 on the previous line.
>> If you don't agree with that, it is fine, but we just ask that you
>> reply to the suggestion with an explanation to state your reasoning.
>> Otherwise, it comes across as carelessness that you continue to
>> ignore suggestions. This is not the only suggestoin that has been
>> silently ignored. You might want to go back to the previous revisions
>> and see if you missed anything else.
> Clarifications on my previous mail.
> 
> IRQ: I will use devm_request_threaded_irq() with a NULL primary handler and
> IRQF_ONESHOT. disable_irq_nosync() is gone and the handler only calls
> complete(). This also removes the bare `0` you asked about on v2 and v3,
> with the arguments packed rather than one per line:
> 
> ret = devm_request_threaded_irq(dev, client->irq, NULL,
> ads112c04_irq_handler,
> IRQF_ONESHOT, indio_dev->name,
> indio_dev);
> 
> I left out the DRDY status read for now, since conversions are
> single-shot under the mutex. Happy to add it if you prefer.
>>

Completing the completion is safe in a normal IRQ handler. So if
we aren't disabling the interrupt and we aren't reading the status
bit in the IRQ handler, then we don't need a threaded interrupt
yet.

>>> +                                    indio_dev->name, indio_dev);
>>> +             if (ret)
>>> +                     return ret;
>>> +     }
>>> +
>>> +     return devm_iio_device_register(dev, indio_dev);
>>> +}
>>> +

