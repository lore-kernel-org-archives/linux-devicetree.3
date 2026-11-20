Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179216;
	b=s1aSbFwNUAlQzBE1El/ZNCWFAnWwOdttgR+pnbrHOQ3pz3T4FD8ZozGUZauJRPjaS04p
	 CLJJ0uubgTKfSrlDMizAiaWYUGU5Yr4ROtr1N6fVdZzQPqYTIUbv8F7uz97uhsTj2AX4t
	 Bo5GAOLl3QY5yrJ4CHdmgzI2BEGHXq4RN6xImugaBeW+W1WVkwalaF+gHE03u2cWFHefi
	 eKnY2U8vae2539dOuTXsjxgGVeD6akLX9/uuchXrOUOgR4+RxXZZ9OzpThhLIsnx/mDJo
	 NgAeyhHAmsGjuqF1+rj7ERHjuoe2cPPJIvrIy6R6pfa0mHmG34/JXI4xT7E0apzHPPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179216;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Reply-To:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=hqAp3aogFicWpFXmWI6PTjNQ7PiDIl2sevW1eEL/NdU=;
	b=JyXPpwDbfiCYtjP/A24vbhiJOwPnSMq/1WDJUqOGyKyQtvIgLhAY/7J8xuyorqs8+SCE
	 IgS4PexnAoG16RljjlAKHxX085EOBLzGQQn8ZPjTGMs2nCElLKKTykYU2D10AvHBQ7qUI
	 Fx41HzoIjrzcNb8BQt43fIh5iVHZMp6Uuo4xofOL5Mv9OzsGjoLr6nqlls/dMkv3FnUwN
	 vyGkwyoRN5hlnSphu07uRYWu34ThpOuNG0uySefQj1IRYZsJoFFE5WmdA2nzOzHnHClGV
	 EikaAUQlHoKf5BSMvCdn5aK1F/bKs04V9vqPPsRe1vVr0HHvpABywfgAQYJdRAF8uSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=g9CzoL72;
	arc=none smtp.remote-ip=95.215.58.50
Received: from mta1.migadu.com (out-50.mta1.migadu.com [95.215.58.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7AB60A2603
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 12:53:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD7AB60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=g9CzoL72
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=bPIA0sNfCRcFRI1GyKLxje7bW0QtBZXlMKzBREPclIM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795179214; v=1; x=1795784014;
 b=g9CzoL72GL87X07ZDpf/309ifaOyhUVbKxZAgv4A4U1ytuHs2Xk9gA5mWlkxAaGP4OnauL6Y
 ef2n2zB4RxRiDK4b5AoXPG+3n6Uglik3OU11BmzulTS48ZusJ/uLWw1+S2SSDrS0uMTC6/BwaLf
 6dCBEAcdI5n7FWYb/iuTI3dA=
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 78a15bc928d8e3f7;
	Fri, 20 Nov 2026 12:53:34 +0000
X-Mizu-Trace-ID: 78a15bc928d8e3f7
X-Migadu-Flow: FLOW_OUT
Message-ID: <d2d8049d-7adc-4cfb-8e56-3af55c0abe8f@linux.dev>
Date: Fri, 20 Nov 2026 14:53:32 +0200
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
Reply-To: mazziesaccount@gmail.com
Subject: Re: [PATCH v2 3/3] iio: adc: rohm-bd79112: Support ROHM BD79111
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
 Jonathan Cameron <jic23@kernel.org>, open list <linux-iio@vger.kernel.org>
References: <cover.1795176984.git.mazziesaccount@gmail.com>
 <4be17e339f768da93db2f42abd3cc5a21fea01ad.1795176984.git.mazziesaccount@gmail.com>
 <sashiko-outbox-225147@kernel.org>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <matti.vaittinen@linux.dev>
In-Reply-To: <sashiko-outbox-225147@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/11/2026 14:34, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Low] iio: adc: rohm-bd79112: double semicolon in bd79112_probe()
> - [Low] iio: adc: rohm-bd79112: unused BD79112_MAX_NUM_CHANNELS macro
> --
> 
> commit d2b6757018d5ccee4c939ad0350d93a29d26239d
> Author: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> iio: adc: rohm-bd79112: Support ROHM BD79111
> 
> This commit adds support for the 16-channel ROHM BD79111 SAR ADC and GPIO
> device to the rohm-bd79112 driver.
> 
>> diff --git a/drivers/iio/adc/rohm-bd79112.c b/drivers/iio/adc/rohm-bd79112.c
>> index 04084e88984a5..8bbb86098ff5a 100644
>> --- a/drivers/iio/adc/rohm-bd79112.c
>> +++ b/drivers/iio/adc/rohm-bd79112.c
> 
> [ ... ]
> 
>> @@ -431,8 +458,17 @@ static const char * const bd79112_chan_names[] = {
>>   	"AGIO12B", "AGIO13B", "AGIO14B", "AGIO15B",	/* 28 - 31 */
>>   };
>>   
>> +static const struct bd7911x_chip_data bd79111_chip_data = {
>> +	.name = "bd79111",
>> +	.chan_names = bd79111_chan_names,
>> +	.num_max_channels = 16,
>> +	.init_disable_gpios = bd79111_disable_gpios,
>> +};
>> +
>>   static const struct bd7911x_chip_data bd79112_chip_data = {
>> +	.name = "bd79112",
>>   	.chan_names = bd79112_chan_names,
>> +	.num_max_channels = 32,
>>   	.init_disable_gpios = bd79112_disable_gpios,
>>   };
> 
> [Severity: Low]
> This isn't a bug, but replacing the remaining uses of
> BD79112_MAX_NUM_CHANNELS in bd79112_probe() with
> data->cd->num_max_channels leaves the BD79112_MAX_NUM_CHANNELS macro
> unused.
> 
> [ ... ]
> 
>> @@ -509,7 +545,7 @@ static int bd79112_probe(struct spi_device *spi)
>>   		cs[i].datasheet_name = data->cd->chan_names[cs[i].channel];
>>   
>>   	iio_dev->info = &bd79112_info;
>> -	iio_dev->name = "bd79112";
>> +	iio_dev->name = data->cd->name;;
>>   	iio_dev->modes = INDIO_DIRECT_MODE;
> 
> [Severity: Low]
> This isn't a bug, but there is a double semicolon at the end of this
> assignment.
> 

Both of the Sashiko's findings seem correct. However, I wonder why it 
picked the device-tree folks and dropped IIO people? This particular 
patch didn't have binding changes but driver changes. (Well I added 
Jonathan + IIO-list here)

Yours,
   -- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
