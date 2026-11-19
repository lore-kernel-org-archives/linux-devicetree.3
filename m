Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795079352;
	b=dAodXIvs3yOf3VCeyBazB5Mr4PrCMPLiLRD14xCWGaxO6zljFd1ykDIyhJks5zTChLdY
	 NliMqG/AY7TVwvJPCkXLd5UIp83nOs4FoY9sTcsvwKVuWJ6cWAJtHnDGfSiQTr2SiVDrB
	 NwNQ4GvB06EgfBUB5PeuLrKZsrK6Wv/j5858COWtH0RVxkRSHWFfmb1rgIzdUHxYEqLw7
	 qkYmUrK3dT92EIkRaQmjvf8Nw2N3VvLANxNcrAoEu3TPv/AmB6iQ6r2nT+Z8TS4VhCPc+
	 mbPzAnHSve0/8kGqocVWfm7GNXhmfvKctb5jLTn6M3tSGS5+kbxMBIV5Kx6bxSgWTYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=9oi8lNsBr5w3e44Y3FX22JF9crP76D+3fgnNVixtEfY=;
	b=q0HZm2WrQz4sBxkYP61j5WYMje3tDPRN0w63DRqMcQOjPBkIKYdvTcz6H8nfxnqjNBXM
	 0NXMr0VyVWWoZV5g7LEhqbqmzOmumgQRX0TXw0+BZykVW+H8IBvlzmShviI/tx7wBdXOA
	 wTh9g7W4DNjTvsw2zN6WUvBG4SDff1BreoR3EQYRZmbuRvhteMZ35pKhsfjQoZmTlqF5H
	 cSl4aVrPTTgqDboCrQa/tY6WUwT+XUKEQ9TdAQp9jomcOXbk2gYB8Ss9kGdNGFkpwOC1y
	 4dLuldQy6gFUXxS8mnUqRLfrQBXCN8gI/mTHC/+ip1IzPwGC0qTQSttCqnOf1a24wbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qLEFgXRu;
	arc=none smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB3F606A325
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:09:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EB3F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qLEFgXRu
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3acc7a0b558so18388841fa.3
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 01:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795079350; x=1795684150; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9oi8lNsBr5w3e44Y3FX22JF9crP76D+3fgnNVixtEfY=;
        b=qLEFgXRutmjegEMdb/rjrXD2DXMP0SkYUr1b/AQWFWcZt7dIG4GT0/oWqbAdRady9t
         fWFIujqixptaRvueI2+opdC+bvZcyX+8Ur/0y395gXalLTRNy6XCEHvOE4W9VHB/CATf
         aECzfu1zUQNggQAz8vFhP3/O2rbIBqtucs9fQ4DXYrMHS7TgC+mqm8GXkn0b4NtWBJNM
         Ru7jJLUHe9KIb8zrdxbRSGwZtQg3wD0O5/zsNeG42+Bu75r43tCylfS5F2apKubYqtCO
         cx+QXE3BKSBZPlSkMs1X6Rt+ym5gnRKQf11JtyiFOIv3aLB0dQGWNVNdyM+C4T3OutL9
         1BlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795079350; x=1795684150;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9oi8lNsBr5w3e44Y3FX22JF9crP76D+3fgnNVixtEfY=;
        b=yKuYvoSA3dSdog38NSlVkEqH2oUl/jwg+S60Gy3NAbHUmjrmGtM0tGCyBV3PxhkOTh
         9jiCxhnCC9mIf7ZIRurMlbkE2mIit+z9OouWvv6rFLva3gxE52v97GWE64EAdih/oEvW
         jJ8LUCZNSWRVnzBm/53jNekBIvNYSxb/h2aggYefzrxxN69tWxu6D8H93f5+W7xj4E2e
         2b9G5OdvJiqAcffIKPptVNMcQ6Cng1HosDVLG7y0E72wCq8cjX0tS5rhtYv0CPPoyE+Y
         DVoAqj/RVLTRxjezzSso5JKYHyuJt27pFo6vT5Wp6nyZw494hyy/5Co0lh49y+KkQJl4
         0HoQ==
X-Forwarded-Encrypted: i=1; AL+hErGkpRL+BxbIqnNtJmQZ9cFF5S0DMV1w3rNfxe7FZCiya2IAX87BY708OFnQ1XMSkhrZpxPlDjdwwfBT@vger.kernel.org
X-Gm-Message-State: APuU4Z8kDzjkb9epW8yK1AGmc6HB1Uqod92gnCO1sEQ4C7HvKJmnCrEl
	f8CG2J34MdQM9/jwui2wfG0kF1+TIEEf1mLDM3i6/ygniPTG6SANUEJg
X-Gm-Gg: AYBFou27nx4VpUXHtYnuUcMEXXGqsKhrLPsVFnA5F1ThDRaqUIDVLHGzSNIQssi0FW6
	9KHceO/7/jdJAbhBvXgKTcVy6p+zkNJJ0clbujnxsrDEaiMKEbiJtMlECMR10uKTT5Be3ksPsU/
	A0VqT4tX1MB+YMV3aTP+gmY9dgC/x36bl6gfF7SftpjQjskySfFS+KeeMnET0i/ZItjSZUayhOe
	bUbeass2zJ1pfQo9pvbwUkB2/pqYW3OOcyWu3CvMmCSt7n+089MAjv/zAVwMOWMKrqgH2Axxzu+
	alw2kA2Fd2whIhmhgGj3zXiYDzGMp4hSsYQyLPj5Yidbq2FQEnFCRRoPxFqBlFzVpcueQj94TTb
	1+CPFPXV3HcLSnvhUqAsXgKasoLxIDvc4Vg8Vw0ouZfLsZZraqQC+OXmpEx0+zUXdqSbKqhxaIk
	GbO5/4qD1uSHtvBBbeCRXjEg+q/s/wmXnuhcmbQnAPH4/S1pT32RzPEBno7jirS4kKdhegJiyOU
	FNgnYdqUbnfH12osogrAeFPGK3/lQonT+e1UDtadCAJ+Exbc7sbrHgyUd+eq92ffvOsJ9v94XFh
	s9dPi/qMzOcReG0Fx9Q5vGne8z7GUFsOAIxuPYfvAAEOQvPUpmQkI6GUym8dgY2A5pOi7CpEgow
	O3dyenVK5SA==
X-Received: by 2002:a05:651c:41c9:b0:3ac:e25f:3082 with SMTP id 38308e7fff4ca-3ae673108e3mr18231351fa.23.1795079350134;
        Thu, 19 Nov 2026 01:09:10 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae6ebf3296sm8012721fa.38.2026.11.19.01.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 01:09:09 -0800 (PST)
Message-ID: <30520c58-9ac9-45ad-ba2e-9626b8b95350@gmail.com>
Date: Thu, 19 Nov 2026 11:09:08 +0200
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
Subject: Re: [PATCH 2/2] iio: adc: rohm-bd79112: Support ROHM BD79111
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Matti Vaittinen <matti.vaittinen@linux.dev>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Marcelo Schmitt <marcelo.schmitt@analog.com>,
 Joshua Crofts <joshua.crofts1@gmail.com>, Radu Sabau
 <radu.sabau@analog.com>, Janani Sunil <janani.sunil@analog.com>,
 Salih Erim <salih.erim@amd.com>,
 Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Jakub Szczudlo <jakubszczudlo40@gmail.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1795009599.git.mazziesaccount@gmail.com>
 <ab74e547e892ccabb763a06e8231e8ed44f4fefb.1795009599.git.mazziesaccount@gmail.com>
 <av66oui-2Pk1XOIi@ashevche-desk.local>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <av66oui-2Pk1XOIi@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/11/2026 11:00, Andy Shevchenko wrote:
> On Wed, Nov 18, 2026 at 04:19:35PM +0200, Matti Vaittinen wrote:
>>
>> ROHM BD79111 is very similar to the BD79112. Both are ADC/GPIO devices,
>> where pins can be configured to be either used as GPIO or ADC inputs.
>> ADCs are 12-bit SAR ADCs and GPIOs support input/output but not being IRQ
>> sources.
>>
>> The main difference is amount of channels/GPIOs. The BD79112 has 32 pins
>> for this use, the BD79111 has 16. Furthermore, the BD79111 data-sheet
>> promises 0.5 MSPS sample rate with maximum of 10 MHz SPI clock,  whereas
>> the BD79112 data-sheet mentioned 1MSPS rate with maximum of 20 MHz SPI
>> clock.
>>
>> NOTE: In order to achieve those speeds one needs to use more optimized
>> protocol compared to the one implemented in this driver. This driver
>> retrieves samples using two 16-bit SPI transactions. The first
>> transaction writes the channel to be sampled, and ignores data on MISO.
>> Then the next 16-bit transaction carries the data.
>>
>> Achieving maximum sample-rate would require the driver to interpret the
>> MISO data of each 16-bit transaction so, that when the
>> channel-to-be-sampled was sent in transaction N, the data is read at
>> transaction N+1 - which also already configures the channel to be
>> sampled for transaction N+2. Supporting this would require the
>> channel-to-be-read for the future read to be known when the current
>> channel data is retrieved. For raw-reads this is not possible and for
>> buffered reads it would make things a bit hairy.
>>
>> So, here we aim for simplicity instead of the peak performance.
> 
> ...
> 
>>   config ROHM_BD79112
>> -	tristate "Rohm BD79112 ADC driver"
>> +	tristate "ROHM BD79112 and BD79111 ADC/GPIO driver"
> 
> So, as Jonathan mentioned this should be rather relaxed, so we don't update it
> each time the new HW is got supported. Also in a new style we want a bit of an
> order by having this, text in top comment, and MODULE_DESCRIPTION() to be the
> same (or very similar, like with or without word 'driver').
> 
>>   	depends on SPI && GPIOLIB
>>   	select REGMAP_SPI
>>   	select IIO_ADC_HELPER
>>   	help
>> -	  Say yes here to build support for the ROHM BD79112 ADC. The
>> -	  ROHM BD79112 is a 12-bit, 32-channel, SAR ADC. Analog inputs
>> -	  can also be used for GPIO.
>> +	  Say yes here to build support for the ROHM BD79112 and BD79111
>> +	  ADCs. Both of the ICs are 12-bit SAR ADCs. The ROHM BD79112 has
>> +	  32-channels, the BD79111 has 16. Analog inputs can also be used
>> +	  for GPIO.
> 
> Yeah, and here the style is to have something like a list
> 
> 	  Say yes here to build support for the following ROHM SAR ADCs:
> 	  - BD7911 (12-bit, 16 channels)
> 	  - BD7912 (12-bit, 32 channels)
> 
> 	  Analog inputs can also be used for GPIO.
> 
> (feel free to amend, it's just an example).

//snip

Thanks for the examples ...

... and also for the other comments Andy. I'll create v2.

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
