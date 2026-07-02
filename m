Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC0C396D36
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 19:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783020925; cv=none; b=OdgoiKsxgtG0XyBnGqVVQKerQVvYyrY2VQSIdx5Yp1fChEl7KhQLPD1gKVaHqUuI1CveNUofhKB5reDnrS2WabPhTKCmIhcEub1l/J5AZYbSGsxFy0GaqwbqZgHv1mFnsXIFAcuLS6syGLP60LUob3IIx56rsWyIC+MNkoMmVII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783020925; c=relaxed/simple;
	bh=I/ZM2OkT/dPa1GEft4QF0DUM5VH45Fd00jGx8xU90Tk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GgRD/IMktwe22hBZ0y4J2GyS9k4tuNzprjLNSmH7snmTsZBBzENsNK/3pOc9JQ/rh4OLwckjJDjfudSOJV1sgq5ibZm3237qtE8H4IkQqLqxBP1J30WWeaXNhVfZBEy+EQOqtRaH4MD36WBi19Syt3B8M11diN+nnb20pHuvyUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=kD2FPudj; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="kD2FPudj"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6a19a5691bbso1459577eaf.3
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 12:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783020921; x=1783625721; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I0Nc5U/TyB5elCjL6iCrBR8Ha+/073W6VQJdxK5d5a4=;
        b=kD2FPudjT55QuiJCXrPLRpbZ3HmHvNnvpuqzlsxJ3phuElCTdL+DxrJtVCvayT/4Tw
         Gjn2d8i6wHNMfX0uvmB10lLdsybBDReVP6fCCavrv2Dn676o9J+KPVc47HcZrswuxqvp
         teVl/fYWiqpJkCpoCggjrLoN75XYPcKTxNbQCHUXgiJGjM1YFZh679TY2lHc57iSgqiT
         oaNV9ESfCVvbL5hFPvs2H0IMFT8ORxsuwt0e7SmpVU3llLFcJRdA2XALXDqGHa4UgdrS
         GpyznobkdZW4HJ825qRyxCvUKuxUzakMKu+0D8vtVIZ/qTWQGfYt+SL+yoSQIWT/y3Ju
         vsAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783020921; x=1783625721;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I0Nc5U/TyB5elCjL6iCrBR8Ha+/073W6VQJdxK5d5a4=;
        b=tStFzuV3fyvNswl1Vh6lz16i+Nbg+o/DA0pzh4HamIMGjVZ/ghemu8F2+qNu8+cdqQ
         3OcwWawcyiUo9pazfHJ6PlFtqIDyEqLW/hRoDbtnsQh1hWMB1eekfdNREzj+oJ9H3bmS
         QPhP/Kol0Fr1kdY+W+0SmMHTa+JF0F02s0ijpko9R/UPsJwXs3MnZu0DuscaYcFIJDTX
         s6DLVU1xaqescyEaghdsEB016TRdgoeF37iHHeb1/O0xFJmd7b6cH3eLeNVryIRW1NJ+
         HbIQ543LCcPyoUIgZLJ7GAfwrtXk6AP9Hebs9D9jL9s4SNDj0Xs4ToekpDWheNGC/aKH
         tj6g==
X-Forwarded-Encrypted: i=1; AFNElJ/f9JVCP5R4DJ07qxDdRoM7u5BwJJ8JW0adVKsEPFaW3Pj/gEHqwZy0jIKbbSlZd4i7EsNtYwOgB2Qy@vger.kernel.org
X-Gm-Message-State: AOJu0YzJjcXvZoREFqSsrTVCifKBrqyHF9FbGqK2RnsQW/eaL7xqVVN5
	UwoODT9A1FB/ouK+z5vezqb3vUh0+80GlM8XjBxQdw0YbPkl5SNNyywV3qUPsK944tbUz1mv/kj
	oJa4o
X-Gm-Gg: AfdE7ckNaqCH4jZbD0rt/6/tyUIsiJBEFS5h5uDPwx/NOAbkQJptKSVhNerORv0xnrw
	8YQk7ahxGfQJSommjAtVVb5yTNMIM1pm6UCoUI4bJAiCR3NtiN/dAhqMgO59uPcv6EalujGxdkv
	BFbNrldWPZvZQ/Jm6DQw+DDsfqk+wBDEYEnzxgy/ha9fHphr/KdKpAK58DarVK08AbFU9/sFu2W
	XQObTZzBRhzlfTxc1zpmfXPXsahlw5OmcP9MTWN0mO2Wk4AiT6BF01acxQyks3Bj8OvQeQs/pbH
	cmaAW707emGZZTWgHGFXSGHevlpr8cNjYmzghkeMCAepHgLgdbiEap+BJdSvP+vRAqUDGhdsBDG
	mfesZMLBzFhAxJx3C20kFap2aiVResRcJXzSfi14US2idYgwePTeuz56cVnyVxRtMCH1uGf3g8y
	elXfg1BuCg/Z9ObtEMJbvrf2HtYVRpmC8Yjb3S8CkT113JCY4mayfegCm8Nu8m1yK1k64m6enf4
	Q==
X-Received: by 2002:a05:6820:1888:b0:6a1:50ec:4401 with SMTP id 006d021491bc7-6a30d8fbd90mr4195250eaf.62.1783020921061;
        Thu, 02 Jul 2026 12:35:21 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:6a9f:626e:95c4:2a80? ([2600:8803:e7e4:500:6a9f:626e:95c4:2a80])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44cbec93a70sm3938090fac.11.2026.07.02.12.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 12:35:20 -0700 (PDT)
Message-ID: <dff9273f-f958-48a0-883b-a52fcc5a6b21@baylibre.com>
Date: Thu, 2 Jul 2026 14:35:20 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 1/3] dt-bindings: iio: adc: Add reference-source
 property
To: Jonathan Cameron <jic23@kernel.org>
Cc: Kurt Borja <kuurtb@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260622-new-channel-props-v2-0-aafd5369f253@gmail.com>
 <20260622-new-channel-props-v2-1-aafd5369f253@gmail.com>
 <baeb24dd-214f-4dc8-a300-22b932c4b4ae@baylibre.com>
 <20260702202002.79c1be1b@jic23-huawei>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260702202002.79c1be1b@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/2/26 2:20 PM, Jonathan Cameron wrote:
> On Mon, 22 Jun 2026 14:40:10 -0500
> David Lechner <dlechner@baylibre.com> wrote:
> 
>> On 6/22/26 2:30 PM, Kurt Borja wrote:
>>> Some ADCs have configurable voltage reference sources for each channel.
>>>
>>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>>> ---
>>>  Documentation/devicetree/bindings/iio/adc/adc.yaml | 13 +++++++++++++
>>>  1 file changed, 13 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/iio/adc/adc.yaml b/Documentation/devicetree/bindings/iio/adc/adc.yaml
>>> index b9bc02b5b07a4c7..fdad6b8276c934c 100644
>>> --- a/Documentation/devicetree/bindings/iio/adc/adc.yaml
>>> +++ b/Documentation/devicetree/bindings/iio/adc/adc.yaml
>>> @@ -73,6 +73,19 @@ properties:
>>>        device design and can interact with other characteristics such as
>>>        settling time.
>>>  
>>> +  reference-source:  
>>
>> Since this is an array, the name should be `reference-sources`.
>>
>>> +    $ref: /schemas/types.yaml#/definitions/string-array
>>> +    maxItems: 2
>>> +    minItems: 1  
>>
>> Maybe minItems here is OK, but I don't think we should put maxItems here.
>> This way, it stays more flexible for other use cases.
> 
> I'm curious. What other usecases did you have in mind?

I didn't have something specific in mind, but in Kurt's ADS1263 series, we
actually have a case with 3 values for this property already, ADC1 positive,
ADC1 negative and ADC2.

> 
>>
>>> +    description:
>>> +      Indicates the voltage reference source or sources for this channel. Some
>>> +      ADCs usually allow choosing between internal reference sources or a pair
>>> +      of external pins.
>>> +
>>> +      If a single value is provided, it represents a single voltage reference
>>> +      source. If two values are provided, the first one corresponds to the
>>> +      positive source and the second to the negative source.
>>> +
>>>  anyOf:
>>>    - oneOf:
>>>        - required:
>>>   
>>
> 

