Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794664112;
	b=5BGkAfh26eTgmP7pexDS1xtL3pv/hRWWgdmbEprMWa1CKI/VLlasuXVaVi67s94XZFGI
	 aKcA1aXGxQWy0bMUvAZHHPICJKuQ8ED3aXEDRfUVxxGAugU0IWPNsdnuR2bToEFiCHoXR
	 FB97rspSymhrqSZF9sUWl1M7/sHYfJkgd2+LNP9gMRGxfz65eDsxcrlL5jCHkwIf9AVjK
	 70vNOGGUwtnkIa06gCPXiEYtjcVY/DjqT8l77ZDPtuHdxqXdYFshZuaKTarVfzq3cWCDC
	 RgVjYJypOVGda/8K8Mzy9pIqjj4PFQl+j0mChqW911j80vg1DFypOXaYeLzb+RfdbBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794664112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=VDgDlOGUe6uT3r1CqvgvQwBiUgaOZZaH4ErtEdDzCpM=;
	b=APUHzo8QK/mKtmqEnjtwkuKkI1YU/lGu0oe2QJOYAkTwf7HVbJHFACXdYlPJhFem+ZON
	 jHfjAQIpHh0NgfdpmXOWs7FAeY3M3FKuMtCoYsZ4LRHLkSgYU1TH7HXUZl4juMMo0uIFZ
	 7uieYiI5a/uzWcZ/fkVSGnISU4+c2fd1G5KlPfPRYb+h0sv7BqJbJpnzje6IAKbwtjkou
	 v06JLLzgNmcNmwtqpUchUnX1gtbEALGRSwrSqcPnn+B4ymXbMqN22Nd4QZwx4LT/1a5I8
	 lJFbFLZgZFHu9PEIp7VvyvTHAJfbZhN7iTA2BZwzBKpBTH1QqXIAESgW1rRuGLv/tbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CTclAqN3;
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC812606A327
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 13:48:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC812606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CTclAqN3
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c10dc41270so2341818e87.2
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 05:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794664110; x=1795268910; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VDgDlOGUe6uT3r1CqvgvQwBiUgaOZZaH4ErtEdDzCpM=;
        b=CTclAqN3iyKjhwJJ88Y7yPQtewFcTd8p5Cf7k4sh1yvU2+ElFfuLmjhDhTQVwJUZuZ
         d2lExdQZE9BLDo6mMsQ3FGwGXlpifNYYLq5POfnIfjC18m/bzf4hSnpTuxwixhIvzX2w
         uSrgBkE7/OVM0QcoSPGM91YENF8whksU7YaZw3kgTbRBfD+gS+QHNdrC5dDKntFqE8no
         x6VIKgdPgUysloQOHCGWbayiSo33K4nMoHy4qkh/K12+5R2SuNUTDdTVQwtmqs6HCNT3
         B7/xRT+nWg9gSLtgp6uAV7rD/KzCxwLfQD8S9aam41KrMThX0mebHeZRCaw1X3aaS8Fo
         qa8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794664110; x=1795268910;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VDgDlOGUe6uT3r1CqvgvQwBiUgaOZZaH4ErtEdDzCpM=;
        b=tvdU+3NNCCvvrM03rVTH2Rp5fQi4Z8NQ40G0G302gwUFLMREwbbdf3ED4K2csgK3L5
         xSK8rrnqthl+waSiBd154h2Q12l6n2OEsPQePlMviBAtQsakHrGDbXSg4WAWvX5clN6m
         rLKuPOcAzWBxU0r+cTQIziylX1/iFQHJsowYrgh8NT3NHAbNk9TBM2iZXA83LDSbP3Mm
         PvS8O9na9snqszQiEu5zfGNGI7Dt+CS+JADXp19DMmh6kJky6XaqrYzeGHOCe4y9OMYe
         ZzUFL2fynxb6ggqswj8LBhMRUuVUOI7nbDuNNYcWIoc9E+KKDBd0PLjjSSrOj3ghwNrg
         y8Tw==
X-Forwarded-Encrypted: i=1; AL+hErEWVz9RE5quoGWeb3O8jEhL1NBdLmgWu6blNi55tp5eFJz2/Xym76DiTNlVIs6R2ue0YQAjb8297lZc@vger.kernel.org
X-Gm-Message-State: APuU4Z9o/wzeQRu3O7wocsWk41JVVMBkVTl8demZfxnGkQRHoGSEC7g0
	98KN8N48n9hae3OXndtI8Z98baPgJ1izIWFynj7NUZ31hUNiLY1d1rhO
X-Gm-Gg: AYBFou2oPwWKiFM7Onftu76qN2cu4Ue7O/iQ0u/1N97gwATuNjohUC5tE749aI9kDWN
	psSyZVOT5hn2noaxGiRYa43p8U+J1KuXPnubfuQC7wAA/BfvTU+yifM5VPePl+VEZ6gDxKuBsTD
	pmRxPgZ4KAR9G9euQZACasYiQNYlxNUs0wLp6jzjJw1g119pqOAxD8bvnEO5viQnznwXcOm2fFt
	ukXOL4jPv27CVp6MK8bQL3y/b1FkzaufAoPmT7DKljL8GhH2HO7Gj3TWUFYnlht7UdLXWEL6V58
	S4qHJaG3oEI5nRB1BhJuvnVszJ74S1ezPOjv35i6bf6EEHE2ZQEyV8pL9wxI5VoB6K4ecJjtoDp
	zJ9XcorT7oFsYWATRRfeVhvkyvKqL98lkEh0v6CXO93a+Wrk2Qd2/RigXWNDOOBlNTn9UlMaABz
	KNXpomF7VMoJSrxrPWoDskrf7oqHeJcqmTcwecZs9lNpZZpBFGX18yudA960UOgYTGLHyswkAeB
	XkPo95FauiBZcWnx7JRssNrn0kcCeqYYIQzNktZvHWyQ7jf34RpvGJL/gm+dgjb5hcELgAvHaaB
	CcrG2hYrUYdtFu195nt5/OKv0RwtlrF1RvTdCJaenMen+NlIS0ZHw1iMkINtv8OY2nSUZ8OXNOU
	P55y8WNUOsg==
X-Received: by 2002:a05:6512:b06:b0:5bf:dc6d:3153 with SMTP id 2adb3069b0e04-5c170b46db9mr2206296e87.67.1794664109863;
        Sat, 14 Nov 2026 05:48:29 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1713337a9sm1690619e87.28.2026.11.14.05.48.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 05:48:29 -0800 (PST)
Message-ID: <966210d3-9a59-4d16-b003-75892fb29a64@gmail.com>
Date: Sat, 14 Nov 2026 15:48:28 +0200
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
Subject: Re: [PATCH v4 2/2] iio: adc: add driver for Texas Instruments TLA2528
 adc
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Rodolfo Giometti <giometti@enneenne.com>,
 Marcelo Schmitt <marcelo.schmitt@analog.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Angelo Dureghello <adureghello@baylibre.com>,
 Tobias Sperling <tobias.sperling@softing.com>,
 Eason Yang <j2anfernee@gmail.com>,
 Marilene Andrade Garcia <marilene.agarcia@gmail.com>,
 Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
 duje@dujemihanovic.xyz, Joshua Crofts <crofts@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Victor Chernyakin <chernyakin.victor.j@outlook.com>,
 herve.codina@bootlin.com, thomas.petazzoni@bootlin.com,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261113151543.2241604-1-maxime.chevallier@bootlin.com>
 <20261113151543.2241604-3-maxime.chevallier@bootlin.com>
 <ef47542e-308c-4211-9b42-ba2de13f5f82@gmail.com>
 <1be528e6-9189-42d5-afe5-298be5af6b39@bootlin.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <1be528e6-9189-42d5-afe5-298be5af6b39@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13/11/2026 18:25, Maxime Chevallier wrote:
> Hi Matti,
> 
> On 11/13/26 16:36, Matti Vaittinen wrote:
>> On 13/11/2026 17:15, Maxime Chevallier wrote:
>>> Add a new driver for the TI TLA2528 ADC chip. It has 8 12-bit
>>> channels, that can also be configured as 16-bit averaging channels.
>>>
>>> This is a very simple driver, allowing reading raw values for each
>>> channel. GPIO mode isn't supported for now, as well as buffered mode and
>>> the 16-bit averaging mode.
>>>
>>> Co-developed-by: Rodolfo Giometti <giometti@enneenne.com>
>>> Signed-off-by: Rodolfo Giometti <giometti@enneenne.com>
>>> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
>> This looks very familiar to me. I am pretty sure I've reviewed this. Is there a reason the RB-tag wasn't carried over? (Sorry if I've missed some change(s))!
>>
>> Yours,
>>    -- Matti
> 
> You did add a Rb tag on V2, but I dropped it for V3 as the delta between V2
> and V3 was quite substantial and included changes requested by other people
> than you :)

Ok. Thanks for the explanation.

> I mentionned your tag being dropped on the V3 cover, but I didn't carry that info
> for V4, sorry about that...

Keeping the note in the cover version history can indeed help reviewers.
> Anyways thanks a lot for the help,

No problem. It looks like a clean and nice driver to me. Good job.

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
