Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793307572;
	b=3wEGSEgEqCHW3rW08V1osXHp6DiLGHiwsuuf141tMbxk3V/3fGtSJO3aGTBspNFnDnxH
	 49eg8kpwbSKpwfaasECD00KqmREZSKYLm6VHTq1eMCnnNkdqGU8JtzdjRZhfoPL1gBxDd
	 oUOluroXCur4n0Rkzhkr9Xyo5F79opI5I8nL6HjaVaLEBhPp80ryT/EBfpt2i2vz/UhXE
	 M7chNt7lYto3FmPg500UZQtoV4Yy+Mwnw+PkyCuJIhJFHBE/JsmK9PCQ4Ht+rh7XDJU1V
	 HCdoK64KoQsl689HIkPtBhVImmKZC4R7hkenj08DIWISZ9Osp+jUNBroCQq08jwMpCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793307572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=hpVaakSFJ8J6aOpJxgRujrYu+K0/hJbr4eZQmRroI9c=;
	b=Oug808zHpy7Ix0mISSRiOB4sUZ5IDCSy3y5u+UYG/IwUsKKCQyeDspwj6BkO/sbq4Plj
	 0/axaWerw3I7AcbybOxRFTGL+rkmacIrH/hCQF4HLLZ5n66MgK9ZS+y12Gv40Yvn9WXkP
	 BUXLzrmmGtgZWpgjZRec5IMzbNsksSFLdusx8qChn5lZRX5o6ipS6X+afBcNmrPZV4Ts/
	 X2TOyUtuawGSLjrPrI8gBnBIRA+FnUB7wco/ScsC0mKRwkRWzmrgLOsRy+5VdI0MSR8r5
	 Z0P1QKN0E7OS7Qmm2eAm7DEIaQzcXANF79mArFoM0SPeT+0+GL6qF8jODiMxGu9d72A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GoGN0NSu;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75310606A31C
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 20:59:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75310606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GoGN0NSu
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so35434f8f.0
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 13:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793307571; x=1793912371; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hpVaakSFJ8J6aOpJxgRujrYu+K0/hJbr4eZQmRroI9c=;
        b=GoGN0NSuGzvhsqjKjV6E5CoaLk9pA1N/4XXrZ9Cr5cu8nKVZhXSK/n7ffPdoh73w8t
         QkqpgFbbYedLP+PYFJB5dbtvk0YRSoHqThZA2K3YbAoujDMojTOdr2q3V5QeSnwInxhP
         sNgau1sJ31wc4/I/h18T18iLcZvmXGG9wGmy1iefz7jvo4MwrVQEjGIjS+ECxb5+ghWM
         OyRFtwpbD8ocS++S2kWWIzjNj3UnDGGIoQVjvhXGKRjO+Ntmo7YfL8tiklNuhvi/44we
         TcJHFv5lVRzAuqOZBY9/2R7eVNsBudMFy63P9hWHAoUyRiYUznMEydXiwjDHoUgfwM6D
         MLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793307571; x=1793912371;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hpVaakSFJ8J6aOpJxgRujrYu+K0/hJbr4eZQmRroI9c=;
        b=f1cprD+bAhujWwzbt39go5SvqZXv/qeN+26FCqYBtpKJskUpZ970smne1uaEQhXaD+
         w6w/eJxtznSb6tloe6RYnEX+M5tPCUtN7WMATcP89PdqeVCDFtdcPW8GKWuw0uNg9JMX
         NEZKl7GsrlAJ3aFhSYIneL2DjXQkqXgv9OGuolltwFKk3415JzWKlvxSyNOdLVAUEuiM
         gRM3kxEXkFqsWQG/ab7udtA3T8Rn1NfmFEFqS2YhBMi+Mlt2xexTfxN2u4+UzLJDrFy8
         SGdDKglz9/MEtexPPFGv5nQwxiHaky94buu2ssuc2/XP6nNyhV0pw4//MASTageD5Mv8
         C4gQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9bmGWhvj4RDBxSoactRe7KStmc7Qzrv/S9x5U0RhNagAbxJO2AIlJW1H95Tx7gHqNrVHkI57sefi9@vger.kernel.org
X-Gm-Message-State: AFq9FYLoPNcsLIPdKF8RSc9uw4eZIT38hZtSlpRz6l7mseCc0MuxZsX1
	AKVG/+OlAa3ceMWqrWGJpvwC63t1SoE4nFKgzmTYoGXmvhJq2cNTvExw
X-Gm-Gg: AYBFou1c7R1vAJo/s0qOjAVoVvD5lb8LgxukhSFqXhrRrOrlkoGi+u8x2N31LNXbyqj
	kX5dLE+cizHKnnNyJfxxnGhRO33wOH+WYrPs+S5//ayGVjn/HB0xXOiOVSUwY245HMfAxYFHXY6
	+9SzrXiooSJNXTxkj6ylQGVOJ7tuVPT13l0cmIZ7WfpPODQQm441RJrUSATRdQVd/TQQVRTgu8z
	VWH7DzQKFuXaIB1PsZ6LialuqB7CYigDPdNlpIFhDIpJniC1gdh4y5mXz29/+wMeQ9rrjWH/zhS
	d0VEnbwMEO5BwSUFR/ScS/6YBlgvOiwM8Y8gCNmI/TDhbuuf2h/vhO1cwpoAcSbZPrTKwQBtazm
	UjfYZweUQ19Z987rcgn9nc/gCzXReTJuwjBTW/vTxtZngYMkkC+Ly6yGVU5HBm6euFjHH3PpcpG
	tvdP84xLJLfM03JIMvww1MWELinNp1WLhXf2H8FP+9QVyXC5f/qfkpw/ejfDbRPspa1GARKMlr5
	CYqDbTQP79XHBJZqsASztgQGYdNrIJ5Cz/+93jBO6Ka0zjbA+yUwgsQrY9ENGYNTutQ27E0d1Z5
	08maE/xVwSOGM4WTnQUrECCCjr1FvTACKVFkt5fBfG7CbQ==
X-Received: by 2002:a05:6000:4a19:b0:48e:55c3:efe8 with SMTP id ffacd0b85a97d-48e649ad4cfmr9818193f8f.8.1793307570500;
        Thu, 29 Oct 2026 13:59:30 -0700 (PDT)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6eb9774dsm730998f8f.44.2026.10.29.13.59.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 13:59:30 -0700 (PDT)
Message-ID: <102aa257-9816-4e56-ab90-f3edc2a725c5@gmail.com>
Date: Thu, 29 Oct 2026 21:59:28 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] iio: light: add AS7343 multi-spectral sensor
 driver
To: Chang Yu <marcus.yu.56@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joshua Crofts <joshua.crofts1@gmail.com>,
 Shi Hao <i.shihao.999@gmail.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20261029074851.216029-1-marcus.yu.56@gmail.com>
 <20261029074851.216029-3-marcus.yu.56@gmail.com>
 <533bca43-8de5-4295-b226-5ea3742871de@gmail.com>
 <auN2jwQVr-GSnZvF@zephyrus-g14.localdomain>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <auN2jwQVr-GSnZvF@zephyrus-g14.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/29/26 5:38 PM, Chang Yu wrote:
> On Thu, Oct 29, 2026 at 12:20:24PM +0100, Jose A. Perez de Azpillaga wrote:
>> On 10/29/26 8:48 AM, Chang Yu wrote:
>>> Add a driver for the AMS AS7343 14-channel multi-spectral sensor.
>>>
>>> The AS7343 is a 14-channel spectral sensor featuring 11 visible
>>> channels, 1 near-infrared channel, 1 clear channel (VIS), and 1
>>> flicker detection channel.
>>>
>>> The driver exposes 12 spectral channels (11 visible light and 1
>>> near-infrared) via sysfs. Runtime PM is implemented to stop
>>> measurements and enter SLEEP state when the device is suspended
>>> or torn down.
>>>
>>> Future patches will add configurable gain and integration time,
>>> interrupt support, buffered reads, VIS channel, and flicker
>>> detection.
>>>
>>> Datasheet: https://look.ams-osram.com/m/5f2d27fff9a874d2/original/AS7343-14-Channel-Multi-Spectral-Sensor.pdf
>>> Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>
>>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
>>> Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>
>>
>>
>> [snip]
>>
>>> +		/* Check for digital saturation. */
>>> +		if (status & AS7343_ASTATUS_ASAT_STATUS) {
>>> +			/*
>>> +			 * Per the datasheet, ASTATUS is self-clearing: writing
>>> +			 * the value back clears the entire register.
>>> +			 */
>>> +			ret = regmap_write(map, AS7343_ASTATUS_REG, status);
>>
>>
>> isn't that the STATUS (0x93) text? the datasheet says ASTATUS is read
>> only and ASAT_STATUS clears on access, so the write shouldn't be needed.
>> it also covers analog saturation, not only digital
>>
> Aw man, how did I not notice that?

easy to mix up, STATUS and ASTATUS are one letter apart :)

> 
>>> +			return ret ? ret : -EIO;
>>
>> -EIO reads like a bus error. as73211 returns -EOVERFLOW for this,
>> wouldn't that fit better?
> 
> Sounds good to me. Jonathan, if v7 goes in, can you replace this if
> block with:
> 
> 		/* Check for saturation. */
> 		if (status & AS7343_ASTATUS_ASAT_STATUS)
> 			return -EOVERFLOW;
> 
> I've tested the change on hardware and everything works fine. Or do you
> prefer me sending over a v8 instead?

with that fixup, LGTM so:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
