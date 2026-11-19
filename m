Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795072421;
	b=2x++BqoPLwmTnYqRkeC04ji5Bg/5K9sXEXLhP9zAWgoxv6xz2gZoRQpbuH2YuUoPXUY3
	 nB8ImfKM6UiI1Ka0go/gdcCVvXZ0tTjH4Cho0GhPmRyM4Z6Vcryi6LSJg6Y4leSCsCrc9
	 r362xe5GYeLB07pDz6H/6guGiuHeLjyHNhgUepzFK/Qmjug0FgPdWTIwl19/LZWMl9tQs
	 KRCbYmqOe/yaakQz7ffvZJLh4KzsHWBIefcK+ckZOVWtXWseyXaJJ+E3hiaPxcWHO7/FE
	 EzdEtrTO55fWiKlJAZg2O30W5HRKu/CgZiDa08TwrUED6FD/99d9BncenylyfARSkIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795072421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=GAhJHnaYFc85HnFpE0nbnvNHLyTmKKfUCRaZ6x2kTUg=;
	b=drRr+ZQwzpHk2vjb5zVltPmXC0socB7lgSWd+tOfD1TJsLa2TS7UKMlxAD2tVzH95zun
	 oRdUwx5f45X0TI+zp1ZYyi2U9SlNBnAtUkwuYOmwF1Z/m0M+LqDQ/3ADVnoxa2SNSLIgm
	 oYOWo9lckDJS7hOxrIKGmQUFMrJNgZM0lIDXOQ6lCvsdhHqN/4jUjCzPjn2dzh+5vVs+5
	 UUlJsyi/o85nq9TIfn+AS/g9gC77EXs6IzxXaXvlh6H9wClB9ik0VS8Rk5IxHrViESs+r
	 81ehvY4ai5UUzo4iR5dlIy+IQu/xcn3TB8/XsVNsRj5sbQQybnHC045SFkDVHFI7Uwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XxDBMax9;
	arc=none smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D9B606A320
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 07:13:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14D9B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XxDBMax9
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3adfe77d336so19167371fa.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 23:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795072418; x=1795677218; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GAhJHnaYFc85HnFpE0nbnvNHLyTmKKfUCRaZ6x2kTUg=;
        b=XxDBMax9D3eru7rJzSMZjZcfwjzq2hKxgpGlNZQ/B+Z+5jX86mK9c1az1b0NTQMFXP
         gcJj+0AsihwUZAT66sR+cu/e8sD+fpiuHzJvFKQYbUa9NClzka2sBdfJT8/gnUqvhtDo
         K/hOfBrb9d2TDEdKXc6P/IUMuFlMkh2+g+iciaUJMSLa6XCTWwbSvfDy9Yzzu7hiFOuI
         a9fjaV/7Y19LaiigPPkPbje7J6JxCUA/4dQSja00EyVgnqFzzF1rE4jRs9ot7llcfoL9
         UU8MDFJ80IqpA0PasojFf44fwIlMa3MY1GQYO/ReVBeTNObiyP/qf25bqe9pbhvDj5Q6
         +8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795072418; x=1795677218;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GAhJHnaYFc85HnFpE0nbnvNHLyTmKKfUCRaZ6x2kTUg=;
        b=vPgUbwSlL41RtZMoy0LHnNOb76cmfYZzGUfPn6q9FlYaYr56gb5Gepa1zsOnbyYK9c
         krsZmWEZI5Si+wJQ35rwTHiduperKfU9CucTG54nNCh2gWbAoDZeS/0sy0v3diSD65QG
         bELsVKQ4L9jmqpk97qMfVRd8yXA3IAvYXfdB5zP7a6HTwr1QhTPDPgwxwkZf2OGznuGP
         ux8aYbafqEWsIXqhCHz/gjc04K2TDrSQBt+EpyHL2KM0rmBkBdBm3/gjy+5/7hLKCvNY
         i185fe/jZR9dL/JidCdgx6y1VX1jbtaq0BeavfKjw9/u8sPi+YbghS+UqSbgvhkSNGHV
         g7WA==
X-Forwarded-Encrypted: i=1; AL+hErHz1jyWoz0hNZozEUPpTOjTwQUFr2Y/eNpOk9t+FdItVV02oXEihX7pa/ZbCyZ5SAeBQTM5INOk3k95@vger.kernel.org
X-Gm-Message-State: APuU4Z93evqPDF4R8ZUwvGMS/YYaWWtVXlTriPpB11VmmBOQdutsW7LA
	tvjkPMdFuFbNGtkuMx/1M+4sCeKbEqHjJ0xXuxRVgtuVWAdtnGjqNbPN
X-Gm-Gg: AYBFou13sOwLW/TtLW9sQBkwca8ZbLTm1XdA7iOuoLgXYDK1TrKn0m/MLTsO6z4RQiv
	uGuB4yEMWX5MGWNH4vXw8pbgomQd9vzzUKCYZVQtrrmqHu+F04vGyg/xrTqNOKvzkDcktPBNUBD
	DJ2El9tkRZcP3ttxuIFyEGGTozckG/Tl9fMRpE6bLxMAAwpgYCEKnWf7HNrmWgzXQpb2RM6y38d
	vppKZBjEnuSxdpYy6GsY6Dee1uvPte9DxhvYTSd7A19gi2KCt7AQFNvJ7m6lSmQV3TEYapf/8Qq
	Q0JmndWuIzfD5SQ550UsmwF+Jn9+nHSFdL0+NYLJx9dr0DYHfX2zxS/tHYH/kP0b0BOKCsgZ1w5
	b4zc6SLkZEUtvGYu0+qhfmY+aHR69kqzdY+o/hrM+Pbf4yl7EViSF1WFuwmElbWlILheOZ6i4ah
	BUHLw8JSv18WtKoCAc0rOIk9uggm3jFd/oS9OhSNMGmFRoPjLoWk8GzXZbYruQoTxdL6WCjt4Bb
	8Be+NsTD7VOXDj4hPOYYK0uqv8o2MJ+5TGjRpTv7BxQiK0CqOeUb2tfqP3Odgu0cpa4Mv35QHiP
	fDEPJE4GDu6fdCaEW1WMcSCwxk9GqhCAP9JQgzbsFpCu8qi/wxq4iLo0wUxJA92uWA8UJta/sAw
	wTR0+EMioZQ==
X-Received: by 2002:a05:651c:e18:b0:3ac:f164:4449 with SMTP id 38308e7fff4ca-3ae671f7d8bmr15497191fa.29.1795072417877;
        Wed, 18 Nov 2026 23:13:37 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae6ebc2fd7sm7269571fa.24.2026.11.18.23.13.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 23:13:37 -0800 (PST)
Message-ID: <4dccb83b-a612-4c93-a625-f5881b63410c@gmail.com>
Date: Thu, 19 Nov 2026 09:13:36 +0200
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
To: Jonathan Cameron <jic23@kernel.org>,
 Matti Vaittinen <matti.vaittinen@linux.dev>,
 Jakub Szczudlo <jakubszczudlo40@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Marcelo Schmitt <marcelo.schmitt@analog.com>,
 Joshua Crofts <joshua.crofts1@gmail.com>, Radu Sabau
 <radu.sabau@analog.com>, Janani Sunil <janani.sunil@analog.com>,
 Salih Erim <salih.erim@amd.com>, Antoniu Miclaus
 <antoniu.miclaus@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1795009599.git.mazziesaccount@gmail.com>
 <ab74e547e892ccabb763a06e8231e8ed44f4fefb.1795009599.git.mazziesaccount@gmail.com>
 <20261119025137.6bfc27c2@jic23-hlaptop>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20261119025137.6bfc27c2@jic23-hlaptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi & Thanks Jonathan!

On 19/11/2026 04:51, Jonathan Cameron wrote:
> On Wed, 18 Nov 2026 16:19:35 +0200
> Matti Vaittinen <matti.vaittinen@linux.dev> wrote:
> 
>> From: Matti Vaittinen <mazziesaccount@gmail.com>
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
> 
> FWIW there are quite a few drivers implementing that scheme for
> buffered capture.  Look for drivers that preprepare an SPI transfer.
> Absolutely fine to not support that optimization!
> 
> This seems like text that probably applies to both parts rather than

Yes. This applies to both of these ADCs. And thanks for the pointer! 
Once again, I really appreciate your help. I will definitely take a look 
at how this is done by other ADCs. These two aren't the only (ROHM) ICs 
using this type of mechanism, so spending some time is well justified :)

> being directly relevant to what is added here?  If you did add that
> support it would be in a different patch.

Sure.

>  I'd cut most of that info
> to keep the commit message focused.

I kind of agree - while I also believe that noting the performance 
limitation coming from the driver itself makes sense. It does not need 
to be this verbose though. Besides, the verbosity already worked as it 
made you to drop me the above info ;)
//snip

>>   static const struct gpio_chip bd79112_gpio_chip = {
>> -	.label			= "bd79112-gpio",
>>   	.get_direction		= bd79112_gpio_dir_get,
>>   	.direction_input	= bd79112_gpio_input,
>>   	.direction_output	= bd79112_gpio_output,
>> @@ -378,20 +387,20 @@ static const struct gpio_chip bd79112_gpio_chip = {
>>   	.set_multiple		= bd79112_gpio_set_multiple,
>>   	.init_valid_mask	= bd79112_gpio_init_valid_mask,
>>   	.can_sleep		= true,
>> -	.ngpio			= 32,
>>   	.base			= -1,
>>   };
> 
> There are only two parts, maybe it is simpler to have dual gpio_chip
> instances pointed to by your chip_data? Keep the full state of each in
> one place?  I don't mind much either way on this.

I didn't even evaluate such option. I'll try it out and see how it looks 
like.

I agree with all other comments - even though declaring the indexer 
variable in a for-loop requires a bit of learning ;) (Which doesn't mean 
limiting the scope didn't make sense when index is not used outside the 
loop).

Thanks!



-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
