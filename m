Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794566950;
	b=DwKZAWzWLfxgnRatpu0nPXdDOMI2T+MNttYjtWge7umplL7K2nDscbhqkHzEjO7/pPWF
	 4cuv/8XltvV1ZV6iXHVIyxvh+ikET+r5VZR0+DvVhiOuLOG9AdSy/Td7TFCsTt8LGkECo
	 KNAwJwpACjJTSAUqvaHRsG4DOfADeUSiNDyOR2of1ZO0wga8j/RyfUUjeEK1E4jw6VpjM
	 KrmN/QL8HXt70XgdSNGLedGuxPHgq+80Lgwr98BuT9F+vqvW5KMqM1ga8hl5FMW255Uzm
	 3+EW7BFy0pwqn/h+Rkt+m6PZ88KZm2r33BNMjK2M8UC3qjV2y+ZrrIvec+1dmWzMkdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794566950;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=L9d6tPMOZAxjfoonjzvY06kxXI/XywJdcquCBInJ17c=;
	b=KhaIV+5XD0oocFTzlnOE3RLsOJ6poInOomDimG4whMp4zpGRSdW+yA3rgwoC2XvxnTEH
	 +cAlxz0LFvGZsUD7p2eAMHQZbXM1ogvEIr3oML/ezLAg6ae7qyzaMCmaSKG14lm1VBB6p
	 KfKaGu8X4qaQi6SUSGsBhH4fF/PoBZAfLcmgi6MHlnZvkWI0HMyg2R9DltMuCQWEi+8JM
	 o2juloCBC/gNFrYNMlGts3dJuM8XsUzefaJgiVXyyxPsEH4ONMcCQYK7DggY7LJiY1p8M
	 tgbt3HSms4Fpm3SPUorhJp3kAmQ1EWqWxjbJ7ALagHvew1Jw9GoiPq6W6zySRwgqZoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=PdtSmnOl;
	arc=none smtp.remote-ip=91.218.175.92
Received: from mta0.migadu.com (unknown [91.218.175.92])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D7C606A32D
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 10:49:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33D7C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=PdtSmnOl
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=JTVI8dsnYYKY9XmmTsofIbVRVxeIG9KyE+kWPKidMJw=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794566946; v=1; x=1795171746;
 b=PdtSmnOlQCaWc9Od1L/UfIqA7faFgOaQ94o7XNnhYSM5ccfKVHkeT0ZvIMh/1BghWkhpuW2N
 4A9uAMbGEnl7n6M3Zu1rh/KRlajPR8kh5PNGmUqfwCs3yXGxZi7PhA3OabwM4/QtE21JKv6lCe6
 puWlOnw6AT3QI0yZAB1CfyNxm6caMlQ5URKUWMTTEWBMfentvPTsLKk1h3sQL53vmRbdTJ7HL/K
 S/aZY4lOxZAq2HD2ocgOv5NNR4GoMz0QksZ+2wl4lJGU6EU2pam1k9weTZg7yD/tp2OQIeFw1ki
 eeeYF6K40m4qzlmTn9Y3HWhmiSI+HmN8iMCYZb5PBNcjg==
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 49f6fcf4643467b8;
	Fri, 13 Nov 2026 10:49:05 +0000
X-Mizu-Trace-ID: 49f6fcf4643467b8
X-Migadu-Flow: FLOW_OUT
Message-ID: <1ac861f9-e6d4-4d16-912b-711fffab3063@packett.cool>
Date: Fri, 13 Nov 2026 07:48:57 -0300
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
Subject: Re: [PATCH 3/5] iio: adc: qcom-spmi-adc5: Add ADC5_BAT_THERM_100K_PU
To: Luca Weiss <luca.weiss@fairphone.com>, Jonathan Cameron
 <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: Marc Lainez <marc.lainez@gmail.com>,
 =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Danila Tikhonov <danila@jiaxyga.com>, Sebastian Reichel <sre@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261112170841.2189322-1-val@packett.cool>
 <20261112170841.2189322-4-val@packett.cool>
 <DMU0219YWEL8.35KQSMY192RH4@fairphone.com>
Content-Language: en-US
From: Val Packett <val@packett.cool>
In-Reply-To: <DMU0219YWEL8.35KQSMY192RH4@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/13/26 7:09 AM, Luca Weiss wrote:
> Hi Val,
>
> On Thu Nov 12, 2026 at 6:07 PM CET, Val Packett wrote:
>> Even though it existed in bindings for the longest time,
>> ADC5_BAT_THERM_100K_PU was never assigned in the driver. Do so.
>>
>> Signed-off-by: Val Packett <val@packett.cool>
>> ---
>>   drivers/iio/adc/qcom-spmi-adc5.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/iio/adc/qcom-spmi-adc5.c b/drivers/iio/adc/qcom-spmi-adc5.c
>> index d57ba8526e0c..c27ff89429f5 100644
>> --- a/drivers/iio/adc/qcom-spmi-adc5.c
>> +++ b/drivers/iio/adc/qcom-spmi-adc5.c
>> @@ -542,6 +542,8 @@ static const struct adc5_channels adc5_chans_pmic[ADC5_MAX_CHANNEL] = {
>>   					SCALE_HW_CALIB_DEFAULT)
>>   	[ADC5_XO_THERM_100K_PU]	= ADC5_CHAN_TEMP("xo_therm", 0,
>>   					SCALE_HW_CALIB_XOTHERM)
>> +	[ADC5_BAT_THERM_100K_PU]	= ADC5_CHAN_TEMP("bat_therm", 0,
>> +					SCALE_HW_CALIB_THERM_100K_PULLUP)
> While this will work fine for some devices, unfortunately this won't
> work for quite some other devices that don't use a 30K, 100K or 400K
> NTC in the battery - or when the NTC beta (B) is differing to the
> hardcoded lookup table.
>
> For example on Fairphone 4 (pm7250b fwiw), the battery has a 10kΩ NTC,
> so using the ADC5_BAT_THERM_30K_PU with the hard-coded lookup tables
> would result in very wrong temperature values. Even ignoring the whole
> NTC beta topic.
>
> You can see my proposed patch series at
> https://lore.kernel.org/linux-arm-msm/20260220-bat-temp-adc-v2-0-fe34ed4ea851@fairphone.com/
>
> Unfortunately it's from February and I haven't spent more time on this
> topic since then, mostly because fuel gauge anyways was downstream, so
> pushing just this upstream wouldn't make much difference.
>
> Now it does, so I should get back to it... Let me know your thoughts!

Looks like your series has had very positive feedback so far, from a 
quick look I haven't even noticed any pending changes really..

It's orthogonal to the qgauge driver itself as the driver just consumes 
an IIO channel which can be whatever's appropriate for the device, but 
that's informative in that I probably should not set a default channel 
and rather leave an explanation in the example in the bindings that it's 
very battery-specific.

> (Fairphone 3 with SDM632/PMI632 would actually be fine-ish as-is because
> the battery has a 100kΩ NTC and the beta probably is close enough to
> what's in adcmap_100k_104ef_104fb_1875_vref)
>
> Regards
> Luca
>
>>   	[ADC5_BAT_ID_100K_PU]	= ADC5_CHAN_TEMP("bat_id", 0,
>>   					SCALE_HW_CALIB_DEFAULT)
>>   	[ADC5_AMUX_THM1_100K_PU] = ADC5_CHAN_TEMP("amux_thm1_100k_pu", 0,


Thanks,
~val

