Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3130641168E
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 14:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742896; cv=none; b=JCd7ASoHchXsIY+Xdh2huI7zZUt6YUxLDTm7+bSv7h0OId2gPSboveZxpn+dkdL72eCDwQGUkUJMHWyGbT/6EjAM9O/f4Xw81uyJDoWTI0Op8AOmG85L1yoyyKlWuuVuGcRwxIEUVSqgj1Oh5IeBpeFnI2x4H86K+V9D7y2Ks0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742896; c=relaxed/simple;
	bh=LUL98Jii5NBy8DtVvh+AtTh3d0km+5BZJDTwIdlwhrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oy5n7Rrs4Y29V/YkYe2neTzvDd7gh1HIdW/xUgg44r/TvQ+qvgohHSMbisw9v9FlnZUgWx+8maT3wmQ1FLcKmrt9PMF0y1b6y4VQMiRsg5lw0E9kyOleN6DJjSiEHS02Zmj7sd61RnokoLMopdYJa91wzDCKC+y2i73lMXq//io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Wrbut9uV; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Wrbut9uV"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7dbcb505578so36163027b3.3
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782742892; x=1783347692; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SDNP0S9CPY60Cash/eNce/YjDb7GyUnlfdhuwl8jcI0=;
        b=Wrbut9uVX8ux6Dfpg7EWb+A/Tsd+axKgkPmeJt9T5fId3BUTlRQR8PEUJtf40jM3O3
         fvsBslFeck+1VZD1gJ65CeHRlTCwS+kyFaIa7NTwxzndlZ1fXd/PlQKr/zZRX6nEraGG
         4/oJkcnILmEXs7jx8PtcFX1NIrNgMN5m14uxDqjvEHn3T2R8WqhIc8eN68tm71Ilsge+
         CYXrveedg3/OyoGMRxiLqWnmFfrNa403A/FGnRC9FmdLswo0JHlTDGAv7fpo7uO1tujX
         xe3lKyONb017KgPCm9WiY+VFaTddj81whp1y0tCDRJW/bYoxfx+8HAo4DcvHKFfATmxG
         AagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742892; x=1783347692;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SDNP0S9CPY60Cash/eNce/YjDb7GyUnlfdhuwl8jcI0=;
        b=KD02upQcfneKvJQEsyD1rVvdeegL/C+CgDSxidnrUBzr/pTUkA3/DPU+DE5O45GgXa
         4w4/018ZiuSui1TR3OOGaMW1cMgPmIprG0IDmbJMtzghuavWJ9q76JpLxaPZHwvVdj89
         pxsZltxB6XZTtOl+JeMIEj1qCB3Mong27r0pmHxhBkbfEs0kYlG6hXd07jNAKrAcam9A
         XVJxfcIHu8x6wWhhFx2QGah+4ZJcxhX7n/IrJ0LYGKeLipxQxd6mmJ+vOjYR6CF5dRhQ
         oIz1EQ5P1iCKv/r8qMInPx6IL4xKoV6dW794HdcOZuYGkPpi1SqMjG51WgriHrkhdcDL
         Xuhw==
X-Forwarded-Encrypted: i=1; AHgh+RrRWZ8K/6Bsd2/b6L1yZw7JYhnj3zAFaJvD0IbuAbMvjoGkoqXiIcPNrBqKsk2Vi79zNCXLNGWWsqqd@vger.kernel.org
X-Gm-Message-State: AOJu0YzyDvmteF+Xyqmtj23nKwjiOptbewIIi5y2CPFnAQbUAhf5eawZ
	cYXv873UPA8np7B4eO5MqF9oQcegYRNzhOJNDJlgqlujgVsZAg29A4++aI1E6uh6398=
X-Gm-Gg: AfdE7cn/Vk2uheTVd6OWlKwg2m951fXAM79EMQ3qoKc+pNGmUvoYiu7CiKMAIk5Kcbx
	nacqrNiNIKm0Ox1RFvLnGAKHkHMUs5/6dj7TnUtdmGHPGYFXOa3/vwG+asDxjnzqlUsjYEaIifX
	ezKmMYu5jyeL3ifCo7/LdamExCZ6rcIU5PdJewHr4+cSes2iUfMYHDAachUwySX7sDK7wRjaJ3D
	+mexmuBgfbZp+kZTfSp5GLYsyL9AVq75uR9aqFd8OKoU+HsmMfezMOWpLcOOvIEx21bIIiRDMR6
	7VL46rcc1TzLh+k8H5732vuCmnIbGXWs2CweQmQ4Zonebp2E/BISArN+8NGdQ7n1yWH+frYG23N
	dBn0wyrGxAO7WAFFaKV+CUprmiJOgOK6qKfEO0skcAz1392/kC69BOuVsXmvLJ8NNEFBSdGta/M
	sMv0gqmBX75sSnwljU6ZxZHPVO/n/p39AnHhGcsrCfGmu8hLbXnPsN5AYksMi68tI=
X-Received: by 2002:a05:690c:e644:b0:80a:9ff6:c46 with SMTP id 00721157ae682-80a9ff611bfmr98380067b3.54.1782742892149;
        Mon, 29 Jun 2026 07:21:32 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:3533:aa22:9a69:df1c? ([2600:8803:e7e4:500:3533:aa22:9a69:df1c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-80f877b6738sm10710947b3.34.2026.06.29.07.21.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:21:31 -0700 (PDT)
Message-ID: <a16f61fb-4e98-4c30-8d4f-da084e27ebeb@baylibre.com>
Date: Mon, 29 Jun 2026 09:21:30 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: iio: adc: Add TI ADS126x ADC family
To: Kurt Borja <kuurtb@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260628-ads126x-v2-0-4b1b231325ba@gmail.com>
 <20260628-ads126x-v2-1-4b1b231325ba@gmail.com>
 <946a30c9-01e9-42f1-bd2b-b7934fda85cf@baylibre.com>
 <DJKX600ONL4O.1YUTCD1L9FU8F@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <DJKX600ONL4O.1YUTCD1L9FU8F@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/28/26 2:12 PM, Kurt Borja wrote:
> On Sun Jun 28, 2026 at 10:45 AM -05, David Lechner wrote:
>> On 6/28/26 12:36 AM, Kurt Borja wrote:
>>> The ADS1262 and ADS1263 are 32-bit, 38.4-kSPS delta-sigma ADCs with an
>>> integrated PGA, internal reference, excitation and burn-out current
>>> sources for sensor biasing and diagnostics. The ADS1263 adds a second,
>>> 24-bit delta-sigma ADC (ADC2) for background measurements.
>>>

...

>>> +
>>> +patternProperties:
>>> +  "^channel@[0-9]+$":
>>> +    $ref: /schemas/iio/adc/adc.yaml#
>>> +    unevaluatedProperties: false
>>> +
>>> +    properties:
>>> +      reg:
>>> +        maxItems: 1
>>> +
>>
>> If we want to allow single-ended/pseudo-differential inputs, then we should
>> also allow single-channel (positive pin) and common-mode-channel (negative
>> pin) properties.
>>
>> This will also require additional common-mode-<N>-supply properties to allow
>> for the negative pin connected to something other than GND.
> 
> Ah interesting. Why the N though? wouldn't a single supply connected to
> AINCOM be enough here?

In theory, any AINx could be a common mode input by connecting it to
a constant voltage supply.

>>> +        $ref: /schemas/types.yaml#/definitions/flag
>>> +        description:
>>> +          Automatically swap the IDAC1 and IDAC2 connections of alternate
>>> +          conversions. The ADC averages the alternate conversions to eliminate
>>> +          IDAC mismatch.
>>> +
>>> +      ti,pga-bypass:
>>> +        $ref: /schemas/types.yaml#/definitions/flag
>>> +        description: Bypass the Programmable Gain Amplifier (PGA).
>>
>> Why would this need to be a DT property? I didn't read this datasheet
>> too much, but in other chips I have seen there are usually rules that
>> PGA has to be bypassed under certain conditions, but not others, so
>> this seems like something for the driver to handle rather than the
>> devicetree.
> 
> To be honest, I don't know what would be the application for this. AFAIK
> when the PGA is bypassed the analog inputs are read unbuffered (?) In
> that case shouldn't this belong DT?
> 

Let's leave it out of the DT for now until we learn more about how it
is intended to be used.

