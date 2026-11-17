Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794909405;
	b=0HHhA9TRinWjD6f/ntTCBWFVtMj1YhXBhRU5CStXr8dHrYCwcfBrIYmdzOdYsICUIzAy
	 eVQXQ4Q5RMZabQz0k++7flULyRHksMEw8xif4W+NDyrz+kiR7oeLT+sf4HsIG6u0wCDhA
	 GOhbNl39YdYmFn6ObpgOWUZ2EBc9RY+wKhTyfAXaNyjTl1wt6HqPorxKopGlYyhQ2KNDO
	 BnRMZ2VMs1pZciyZ9cixrJLD5s4146neUiy3bLWCbtka6D66FZsF/XQjNGThfhocfzDJU
	 w+GWFwJrIlThyc64SjM6i/79N+aZxB2Bg/ki526/H3SZiRrStilTy4EWbmkCMMiciEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794909405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=uzJ7zdzUB3cdGIuk2i9Y+NNhABXVFT8DILTBgFlRwyA=;
	b=yTmzg2PWKVAyZCmDPoYAWX/tvhEE1twYzm8wsK7zoGExDbx+7jzteiZdgjrWKBFsVV2z
	 zH9jOYYfcDhS65T2ObQ/tq7jrGon4mnA1uVL3XhinRHQ4yTE1oiayF2qgald+nlk2xetc
	 vPk3fv6O1/QfGzzbmKKq7gF1DVyyas/48q2MrCGslh9ZXyNMMquSYV6jC+O7CvDRXb4nZ
	 ZbI5VL1cjE0jISPrhD//ubwhQTy0vrxswaVbx3BsWd4ist3r8c73r5jke7q26strhDzqn
	 0Lt86w25jUaxA4Ez+swZbon3DlSFIqmjNLkQjBkmKUWv9Xv0OBnFWzjCTTqXlE1qMxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nMsTG+Xm;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EE6606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 09:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2EE6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nMsTG+Xm
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2efe591a1f6so1084135ad.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 01:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794909404; x=1795514204; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uzJ7zdzUB3cdGIuk2i9Y+NNhABXVFT8DILTBgFlRwyA=;
        b=nMsTG+XmerQhGlQnp0vHT8btzgQIbwUp3Rw5mEQHvhwvaWn/s23nUpFRaZtgySEUed
         pVeZup08T1ee7EhJPsiC5GvMzI+ceZtR8wa8mkaobHQkt7bitoVgYZ4qsQ0Ok0PYMzCm
         dHADgOGDzpi1zp/yZU9Sn0kHEYkwyLfHjcGlN22u7lFxDuc3PJMidTUUE/DqOXofdfB4
         Jbp1/z4N729Kh+mDUK8EveWG9xyULBbE1dg26d0x++yRKUK63PufGQ40/annughbpp11
         UeATTFGxHHKaVhAl5ncHn69XLdY1iLje9fvtWVLEuzy+PP6wZuu3HddXTwPZQorQThE5
         LlXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794909404; x=1795514204;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uzJ7zdzUB3cdGIuk2i9Y+NNhABXVFT8DILTBgFlRwyA=;
        b=2VnaQxPtyAI8X4MLTctcEZAaT6CIH//+80t+bTXGZqF9f/+zGjDYutJWLkqI6sw0Op
         wKue3mU2zepGN487MwzPkY/Lf1MQRPo8K/Pms3Xorxzdqfu0/yJBwUDmaYB/X9dXu+Hh
         SRL/JgSCt9/8CobVA0iTVFRYnXHrZJo8A3qeI34IfwSyC0GH15oI+45f2YkqwY5iuXsQ
         gBrfhm8m1jyefQ0Qzhm7hDUz80HSJeiZJ736o4+ovTdI8ohObnpDAqxKl5ls6xEFmwk2
         xw1KxgT0gSwEwuAqHwmIPR+4nw/FHsze6OFFMboinEimJIBn3oymiO7IOkmcP9rQ59Q9
         7nkw==
X-Forwarded-Encrypted: i=1; AL+hErEpiAXRtNIYPJ5yD5n2tGAanIk7JpNdhYVYdJrJRi25tVBVaukCAS4HPy70ctQxP1pWSCjTIObcgwxP@vger.kernel.org
X-Gm-Message-State: APuU4Z/l6uUM0vNpAKpAgWtekHvpzeqnN0ap1y0mg3LOTpf+XWR4TjWZ
	KttqmVev/0yDQAjlZPunlnmytdiK3ak2K2fNWp8n3vnw9ERSLIEbp4eSsWgCtg==
X-Gm-Gg: AZFdTZcuh4qFnDlD/coA32E5+WkaC9K3ukOUa/Ke9H0bkOAf9IF9G6oafP8IcCt8U1Y
	zhLgDRiE0a7rhmDFX/J5bP5WUszuuNKCK1L2kPWojhbb2kCHYBX+HFdowB04ld2Q1482nG4mNNW
	vMwOT3vB2Ta4Qb06fLL7QeYHlgW4dFpIZGPY03WYBPJbtWRw+oLDvJDir2ptZt3XJaggcdXWUbz
	2DcpgWk5AE3/CqKWH1E934gf6hicsv23vwkrA+aEq5EFsoYKTm1hYw0JYA/2AQZiST3CDuUEx72
	bhjUei9tVgtVG6Ic7F06yb6hdrAUy5yLaWh0AlHOkTlf1ICAD13+B3lAJskCoq9bMl9gIBdJ5m/
	6SJKeVc77qG+57PsK/4RT3m5Xn2tU81Z7csP0fjzjiEUogsWBsJyoZWVEZ6BDtbyDmNestHFJ5N
	EX74lK5jf4Ect8ER/tliQFhtOTFatGcXuXjBKcS5IgTGGMrXdWjR5h1QVL4VD1y0JVATPmYEyrC
	mXcErNmq5qt15eynRRpX7IZXs6TU4Edczq8pzLvqI3fUeZ4cNHUyeuOMYqv48vtskip9RqEFWr9
	t8NClPpND1nlda6Z6yMeFTMG0NnBTD/dCtQca58gNiNAKxrgAFKKfzkX0Sov
X-Received: by 2002:a17:90b:17c7:b0:3ab:884b:65ab with SMTP id 98e67ed59e1d1-3b1b0ba4fd8mr14060000a91.55.1794909404192;
        Tue, 17 Nov 2026 01:56:44 -0800 (PST)
Received: from [172.20.10.2] (42-79-72-63.emome-ip.hinet.net. [42.79.72.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b39d73c9sm11164505a91.2.2026.11.17.01.56.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 01:56:43 -0800 (PST)
Message-ID: <5c4ec348-e0cf-4f4e-958a-f0c86296bf83@gmail.com>
Date: Tue, 17 Nov 2026 17:54:23 +0800
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
Subject: Re: [PATCH v2 2/2] ASoC: codecs: nau8310: Add support for NAU83G10
 amplifier
To: Krzysztof Kozlowski <krzk@kernel.org>, Neo Chang <YLCHANG2@nuvoton.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org,
 krzk+dt@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, kchsu0@nuvoton.com, sjlin0@nuvoton.com,
 lkp@intel.com
References: <20261109051251.471879-1-YLCHANG2@nuvoton.com>
 <20261109051251.471879-3-YLCHANG2@nuvoton.com>
 <20261109-myna-of-noble-downpour-e09d3e@quoll>
 <6d7f4ecd-bac0-44d6-a704-57cdd2877729@gmail.com>
 <9078a957-c183-42cb-84a8-0f15661fd23d@kernel.org>
Content-Language: en-US
From: YLCHANG2 <neo.chang70@gmail.com>
In-Reply-To: <9078a957-c183-42cb-84a8-0f15661fd23d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/17/26 17:28, Krzysztof Kozlowski wrote:
> On 17/11/2026 04:38, YLCHANG2 wrote:
>>>> +static void nau8310_i2c_remove(struct i2c_client *client)
>>>> +{
>>>> +	struct nau8310 *nau8310 = i2c_get_clientdata(client);
>>>> +
>>>> +	cancel_work_sync(&nau8310->load_fw_work);
>>> This looks safe, but still error-prone and discouraged. Use same order
>>> of cleanup as order of init/allocation in probe.
>>>
>>> See also include/linux/devm-helpers.h
>> Got it. I will use devm_work_autocancel() in probe instead of manual
>> cancellation in remove().
> To clarify: use reversed order of the cleanup, obviously, to match the
> probe in a reversed way.
>
> Best regards,
> Krzysztof
Hi Krzysztof,

Thanks for the reminder. I will adjust the initialization order in probe()
so that devm_work_autocancel() is registered after the regmap 
initialization.
This ensures the cleanup follows in the proper reverse order.

Best regards,
Neo
