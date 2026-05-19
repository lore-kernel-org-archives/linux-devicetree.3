Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F561309EF2
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779174812; cv=none; b=X6P1/7vBV0OJfk/yjjc4yEOK1v6SvXpd3wf2yBcntzQ0mFJNI+ojZV0FWEUiPRy3CXM3YEPiVXzbY7jpTTNt/ZpucB0YnJ6J9lzJga2he7ievMrYx8vpwof012Ho2adWOfB1rn589GaP2Q4mv34URzgNbrwPbU4Z3vUqtqVvF4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779174812; c=relaxed/simple;
	bh=DNa2YgIosKX/M6mszuSfbYa/OvjT8Or2H8POimcsZiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WNIG+vtsRLQT8hFcNytnhYLfwmv3UWc46rOxkAcYhvNXlPrjYNc5iWNk5sKZXLdywor44aorXIOq055OdgPi78P53RyK/a4JR3nrolG75OI31n0FF5Z39MPWvDpvEs1DyOfgD6dEBSJOrwgkpZQV89wtHrCx4L8IrNrQsu719p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O8iG4DII; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O8iG4DII"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48d146705b4so34191145e9.3
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 00:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779174808; x=1779779608; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EyfD1jRHw+lTzdqMpMGCHM2mGtkyELJS7N9dh1Uecmg=;
        b=O8iG4DIIgszzRVDpsrTqnAR9HlG/jyV5jKrJ/HH33/E729InBhC2JeKGHVy/AKCQCw
         eAFlLPBcYre5U6AD43JyFxCS2dWJmiidTWo1susWgT3UpAnymaJrViU9XjQWleW8K1YE
         7Sl9lTG/ESSXpiMPRdJjo5qBKY0/8UOxIPcY9LIfCTkObx+ihUTwuvQm21SkUR4BfMpv
         GHc/3dFPiONvI+PCOH7hZDYFm9baQi350mTo5ryWO2MArNUrwtferN4Bp/vjcf6RLup4
         oMpR85/Njzc606N1MXkSaiS/buFHQJS9zPlBMBPXp84Q5cHeD51BR8eDYRr8N65/DSvH
         0+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779174808; x=1779779608;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EyfD1jRHw+lTzdqMpMGCHM2mGtkyELJS7N9dh1Uecmg=;
        b=U6/itY79PeBnvJbr4MKn5IBdfFwfEpQFbrWFEPkcTz4Frn0ws984xt6ZyEI7stuqxO
         kN6qDkhpZULMzXsgYjLYKL0k6kwUewfLEgBI9OqFTZkP7SfvAtsd+kIk1gB4bRLxZ+wL
         7Vn38AE1HUS8qNclxMxC9HjycMRunaYG81OYcEUQd3o7mm3Kv2rRvGyauoVbuK4yfRXL
         OSrpe/3LSzYpAmp1DSzYshYCTE1xFFm1YyzbtSkoSww0PJ2O6w3cXaSDOeVbb/vq33su
         +7ze5286zNfW3r3OLTGJ9GqTAuO1lgS00KL7W478jGUhsonugn9aVelHFKqWw6EyGsp/
         VawA==
X-Forwarded-Encrypted: i=1; AFNElJ+5ciEpCZFi2g5Wswl3hNSYDCwHhYE6435J5VwR99QOrHXb+1WpgvuMs9mh8a5tPf6F/9nX4QE9q8/+@vger.kernel.org
X-Gm-Message-State: AOJu0Yz728rVou4mAfBjWWlGO6KpkXRZIB6dJEAMchHeNkSDavgmMXvl
	p1O+f0iIqFI5pLATv58t9GHDuWl6/CaYmYZhT0moBmK/jlYD3xKi3ry64PZuMRUWn2E=
X-Gm-Gg: Acq92OHPkshZCt9v6AvxnPnVY4N0X/v69NolcAlt30rw1B8DZlwdRl6hgXBgoiR+PhG
	i4pqK+MKSIJ8oXPDNQcIS009NZHe8HXGvyHNTo9qizPHvScjRoft1/hUS112MRoK2qzmKHnsMoL
	IkEaL3+QXJE4twzZetMw2yWrsqeoDqH7PSSPjcJetAr/toZbhD4hx3J+kS4kH7LDJw/Pu2efbOS
	dcAxnyNbAoY0ypEaINjeE/oxdsK60gcR7wpRt0oFI1rPbYuY9cTR7X0AAljspelnqR2Ws1OIKoQ
	9Du7ND105Rzyi9rY3LFZ03xJXC6z77OMJ0GCaS25GdSeH1l5H9eEGfFsqc0T5qGfxoKhyMdNnkz
	6CvC5gTBqtdHF1tSHgKe05WzSVEea4BHSVv+XaCEmsQ6FXYwQW73U454k7JYC/6lZNn6kUAdIN2
	A0A3oSWLpN0phAT8bhMIP7pcSmMqq1NrLThnZ5o2Ufx6Mh33DX53R9imzIFHIliw3uAOtJ
X-Received: by 2002:a05:600c:35cc:b0:48f:fe2a:107b with SMTP id 5b1f17b1804b1-48ffe2a1125mr215072135e9.7.1779174807629;
        Tue, 19 May 2026 00:13:27 -0700 (PDT)
Received: from ?IPV6:2a02:3033:6d8:15d8:ec15:f5ad:b85f:a3b8? ([2a02:3033:6d8:15d8:ec15:f5ad:b85f:a3b8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fea52a0bfsm151837045e9.0.2026.05.19.00.13.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 00:13:27 -0700 (PDT)
Message-ID: <e245de68-555a-42c8-900b-a4abbaa4ea3e@gmail.com>
Date: Tue, 19 May 2026 09:13:24 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: iio: dac: Add AD5529R
To: David Lechner <dlechner@baylibre.com>, Jonathan Cameron
 <jic23@kernel.org>, Janani Sunil <janani.sunil@analog.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 rodrigo.alencar@analog.com
References: <20260508-ad5529r-driver-v2-0-e315441685d7@analog.com>
 <20260508-ad5529r-driver-v2-1-e315441685d7@analog.com>
 <20260508134843.7646c4f5@jic23-huawei>
 <53d547ee-1ac3-42b9-92a6-e7f48b72fee3@baylibre.com>
Content-Language: en-US
From: Janani Sunil <jan.sun97@gmail.com>
In-Reply-To: <53d547ee-1ac3-42b9-92a6-e7f48b72fee3@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/16/26 21:25, David Lechner wrote:
> On 5/8/26 7:48 AM, Jonathan Cameron wrote:
>> On Fri, 8 May 2026 13:55:47 +0200
>> Janani Sunil <janani.sunil@analog.com> wrote:
>>
>>> Devicetree bindings for AD5529R 16 channel 12/16 bit high voltage,
>>> buffered voltage output digital-to-analog converter (DAC) with an
>>> integrated precision reference.
>>>
>>> Signed-off-by: Janani Sunil <janani.sunil@analog.com>
>>> ---
> ...
>
>>> +  * Multiplexer for output voltage, load current sense and die temperature
>>> +
>>> +  Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/ad5529r.pdf
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: adi,ad5529r
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  spi-max-frequency:
>>> +    maximum: 50000000
>>> +
>>> +  reset-gpios:
>>> +    maxItems: 1
>>> +    description:
>>> +      GPIO connected to the RESET pin. Active low. When asserted low,
>>> +      performs a power-on reset and initializes the device to its default state.
>>> +
>>> +  vdd-supply:
>>> +    description: Digital power supply (typically 3.3V)
>>> +
>>> +  avdd-supply:
>>> +    description: Analog power supply (typically 5V)
>>> +
>>> +  hvdd-supply:
>>> +    description: High voltage positive supply (up to 40V for output range)
>>> +
>>> +  hvss-supply:
>>> +    description: High voltage negative supply (ground or negative voltage)
>> I don't mind doing it this way but in some similar cases where 0 is something that
>> can be considered the 'default' we've made the supply optional.  What was
>> your reasoning for requiring it in this case?
>>
>> dt-bindings should be as complete as we can make them - with that in mind...
>>
>> There are some more interesting corners on this device the binding doesn't
>> currently cover such as mux_out pin.  We'd normally do that by making the
>> driver potentially a client of an ADC
>>
>> Easier though is !alarm which smells like an interrupt.
>> !clear probably a gpio. TG0-3 also GPIOs.
> also optional vref-supply for external vs internal reference

I will add bindings for optional Vref supply in the next version.

Best Regards,
Janani Sunil

