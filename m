Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83124357CF4
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 14:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783954560; cv=none; b=WXNNyntimLTdl8mgDoIppCrc0Qmx0QZ36CT0PhHpksndeEf3S4XYGn+as4LhDxoUIq2lueFa+LG037iAvNHHxe5Npa2yn4X2uXLYCEnJReBFN/u+KBXeFgpX+UR527kLS8jLAT6MmZ9TrA7jW2BTIA2hsY9Ao/CB356hT1ZooOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783954560; c=relaxed/simple;
	bh=YELl1y3J0mGPUhcgSqbaaf3tbHR8Imjyjm4zvt2BTb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k6WbJVsvUvi/1Tq3qNuOW1NHloJksBFRCpPaphHobYRrxdSiNQfRJBp4JQ4MZJPf/h3LXhXbsz0KszFPcW3LbeXmmww9HXH9jFQyU4RdhfFQDqqMiiJw+X2ifgGXMq1w70qtfaPiNNsWS7BEy9o89V1A1k9in7+NO0lg8RvLIHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=d7xaOHiW; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="d7xaOHiW"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-97622cc1f40so479753241.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 07:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783954555; x=1784559355; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h85/e4FosMhyyW2A5K8lpjg8Eb2pk4okTuj+ceX0Hik=;
        b=d7xaOHiWL+u0VKSs6dQuhCTLOVtoFhc7fWD4NjASNttxn5U4PqN8/OZGAASBEe/QAo
         njNFmWhLxo/r21AbflFt5C62U8DnMuTKzUsVmlFV6dh+KgFkJRyprfxzJU/v6XF9Ll81
         7UeY1puwsXXnvYTo+lz4DI/R4THEbb+HwkEPYIxpzUZdn8NdjFgQJmPwCvZRFoOYg5pI
         791GccvKbodjbpnCDJ35PFjW4nJYD882PjaD8XD0HoMoZ1YAQvuOJWru/UMJS9UEvVZV
         IN8LiMdXUFXrT6VPSLmqJZcy7aT3/e6RAkqSWYXi8xJ6AxJWHbXS3y+PT1E+NvzgYSQz
         /isw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783954555; x=1784559355;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h85/e4FosMhyyW2A5K8lpjg8Eb2pk4okTuj+ceX0Hik=;
        b=GGITmEX295TXdVOf4k3z8ol1cyveHOUbd8VPO1CGzcs48zUSaGuj8QZa9kqLB2fz46
         XVO7iJzShVKlcH5Mc3XoqUrFM+CWsWyehH4SWe+IDglDhNAOQeV2WZpSTMPlkAaARL2t
         yJkWW5zB/nTJyXn3eqo66ORWlIpNhf0854sWUOhXEH7TJpu0nmkHhIkyl9sOnuFNjSLI
         LojVjHnYvmMB2NfB4kb1YF+e1V0J1jiwhJf5fwSEguzgkrNKudPyOxLC6FHrPtp3cmmh
         qXTm9Ohk5XT+AISEGJ9wj4usF4+waaVZxmhHmkG0g1K72m+1zc8RIzzCWIrHS7XsYco3
         VvdQ==
X-Forwarded-Encrypted: i=1; AHgh+RpUHhptyPp8CJmnn5rStdsRiQgSk91mjv+b2W4ileLFok7EDQoJ08jru7HGXPBVqN06ZXZ72BWiptk0@vger.kernel.org
X-Gm-Message-State: AOJu0YyntNhKoDF/yX/I7Z9Nvr73STt4VPD7w8PoCh4Q2GEKgF046ILu
	J+5AkvLYJa3tnIj3T0O7o2i9PmG8bIuUBIRXbq0kmWSJOHHkUfhKpmNncucIngN9U4o=
X-Gm-Gg: AfdE7cnUy4MmSM9i9Y1mdG0qk40GK2fvYjwJMq5m/Q/0YjQXdYJSRqLc13qOIpCoFHg
	FPwf9dIWG3hi0p118GymxjweZewZ/Kntb6w3NmIJ7ABELxP/+z+k7EnxBSyyfc0eJzHvURZkvXK
	IizQ2Fp5be+MPsDJxL18n4p02rghbA1CQQNa3qVhUrmoJF9mkii3ZUMy3XxDyGAPMZCwuh1NGn0
	0DRrwtNifIAK767JwFLqPJaPIlOCgAPDsKpUpdvOipd3OdDwb3IiRakMPv/3KfuTj/7PlfDrFK7
	ml09LWzPsCzlPE1fkZj5vhDSbu4W5p38FRLTp2lUcTxRgIBrZw+rIhb4jSBSFCa70cghZh3GvB6
	zEA8T6OcVIq8WE4Vtnh/X3wTpIPUKbbE3Hb3qkmcsd4cGTn/Xst9JSjecUTUA4a3f1bht9ztEpy
	O8fzUPqXPbtk1Gfcb56I6MN0MSsrelz1fkZHhum2YaS1bkKvS2IefBCcoipLKCDbU=
X-Received: by 2002:a05:6102:f12:b0:729:1a8d:b2d9 with SMTP id ada2fe7eead31-74533e17d5amr5917697137.22.1783954555481;
        Mon, 13 Jul 2026 07:55:55 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:610b:e45c:5e0c:e14b? ([2600:8803:e7e4:500:610b:e45c:5e0c:e14b])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96ed25847e5sm7785373241.2.2026.07.13.07.55.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 07:55:55 -0700 (PDT)
Message-ID: <1700ed07-47b5-4831-87c5-a6115928baab@baylibre.com>
Date: Mon, 13 Jul 2026 09:55:53 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] dt-bindings: iio: adc: add input-chopping property
To: Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chris Hall <c-hall@ti.com>,
 Patrick Edwards <pedwards@ti.com>, Kurt Borja <kuurtb@gmail.com>,
 Nguyen Minh Tien <zizuzacker@gmail.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260710-iio-adc-ti-ads122c14-v3-0-746d52cbf1d0@baylibre.com>
 <20260710-iio-adc-ti-ads122c14-v3-4-746d52cbf1d0@baylibre.com>
 <20260713023443.1a7a9acb@jic23-huawei>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260713023443.1a7a9acb@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/12/26 8:34 PM, Jonathan Cameron wrote:
> On Fri, 10 Jul 2026 17:50:37 -0500
> "David Lechner (TI)" <dlechner@baylibre.com> wrote:
> 
>> Add a generic input-chopping property to adc.yaml. This is a feature
>> seen frequently in ADCs that are designed to measure resistive loads,
>> such as RTDs and strain gauges. Enabling this can reduce offset errors
>> by swapping the positive and negative input channels on every other
>> conversion. This can have side-effects in timing and filter response, so
>> it is not always desirable to enable this feature in some applications.
>> Therefore, it is best to make this a property that can be enabled or
>> disabled in the device tree.
>>
>> Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
>> ---
>> v3 changes:
>> * Renamed property to input-chopping to reflect more common terminology.
>> * Removed "allowed" from the description.
>> * Extended description to explain when it should not be used.
>>
>> v2 changes:
>> * New patch.
>> ---
>>  Documentation/devicetree/bindings/iio/adc/adc.yaml | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/iio/adc/adc.yaml b/Documentation/devicetree/bindings/iio/adc/adc.yaml
>> index 308857f11220..c408feebd46d 100644
>> --- a/Documentation/devicetree/bindings/iio/adc/adc.yaml
>> +++ b/Documentation/devicetree/bindings/iio/adc/adc.yaml
>> @@ -80,6 +80,14 @@ properties:
>>        ADCs usually allow choosing between internal reference sources or a pair
>>        of external pins.
>>  
>> +  input-chopping:
>> +    type: boolean
>> +    description:
>> +      If set, the positive and negative input channels are swapped on every
>> +      other conversion to reduce offset error. This generally comes at the
>> +      expense of added settling time between conversions, so should be omitted
>> +      on systems with high-frequency signals or high data rate requirements.
> 
> I'm lazy so I didn't check back, but in my mental model of this, the DT is simply
> saying that the analog circuitry is suitable for doing chopping.  Driver decision
> on whether to do it.  Perhaps we can reword it for that?

Heh, that was the "allowed" part that I removed.

I think this is really more of a design decision between the tradeoff
of less noise vs. data rate. By setting this property, we are saying
we should favor less noise. So I think it is more about the expected
signal than the circuitry.

So not sure that I would add anything here.


>> +
>>    excitation-channels:
>>      $ref: /schemas/types.yaml#/definitions/uint32-array
>>      description:
>>
> 

