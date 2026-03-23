Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E323AA516
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 14:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774276389; cv=none; b=nYmrfgNV2uo8O23nL8P7xdM2uKuEazTsTRUxDjww5MAC/U4FY3RrsmN4gjYoXcVO8KD6uoggwSiGKEQL3FhBQAAa8Y3Y3wepcqUNHQOqZRRXguwGcutFPJ8GMPdOGw65JsCTV1k3a8WeC9eTamBpNsEiyE82bVoTMkxwbXEnNj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774276389; c=relaxed/simple;
	bh=FUWZG338Lvqw+ZHMyYOjy0LBZ3vZYoG/uj35Q/vhN94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YH90av/fmN+MiEs80CF+ZM9A6DCUKT67j/S6G3Q2syyBExScbemw3VMjcPh09ug6pOivuvGyI+cJOAa3Z/kKLuZ45M5WXonvqIBYeBRYzbiFg4foiQBU7KitCYev54MByiSmBsQbkbQsRApHYHdo6B/6334FrNmPlXO/BvUa0Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=amahc5fH; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="amahc5fH"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1279eced0b9so3908302c88.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 07:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774276387; x=1774881187; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=iNYejPjdBPqYLtoCLQEnNEXgxoTT0I9CZ1Nfe3G/xyM=;
        b=amahc5fHDmJqnb7n4fNt74zuTEtzDFexr1hIg5HPXWOSt5Mjb5YLEynkH++s8TsUOc
         VK678SjLda3kPMG7XflF4l4tayrbGrgOwxCiH9zab63CaTspNKguizmg8B4c9mG0/4pR
         QfK8thS+vA6IHv4lmWBcBsKDAcXHmHOa4OiCqcAQK+sTXCO+HgorMyK8Im88ZlL5kzO9
         W/CL89OVc3FFNpaWR6FmvJggbAjRJQrdxfegAp14olgL7KoV0Yu3qNjxAuro9hmdXNlS
         F8t+qE9HYrbrSdJKEABGERj9vcjseo6u/ak7ou9RsIZVW/spWGYGqgS2FU9B4c7a1eyo
         f6Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774276387; x=1774881187;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iNYejPjdBPqYLtoCLQEnNEXgxoTT0I9CZ1Nfe3G/xyM=;
        b=B+M2mBpvx4njXICLFYDiL0a8h3mFFRIR8/JOeNNC7vRAr8CgQ4JQWVHMz4pb7Xf5+o
         GVWHgd3LgQ/KQK4nTY5myRog9r4QuO3PtcGMxwolRMZ+IyJ8uhXJ8DSC6paApoh5mbjh
         T/4FY8Rlx73/qYqkoPqpK7dWJ+2gRunoorhi63OtpyXPhfMLz5kFlOLSGrSSAmD5bOw2
         OrlIjFiflFGoqSIvuUjk7AQJdlo6aHqvTKV/+NymE6j69A7H59cFjbXI/OGCVn/j5LWG
         kSAqUopEeXsZ8W1ycgs+KkG7BDS3fL3vI5m4OPm1dTyrWVAI99pNtUkdL+O3emjakYaM
         fEVA==
X-Forwarded-Encrypted: i=1; AJvYcCXPXYKv9Vo7TfckW/jNxp2RePClsvKtgf1u1G9b8Wn0zuq/saYZ7p47NkwtICkJKePbiGiWWSwyPfdb@vger.kernel.org
X-Gm-Message-State: AOJu0YzmUhkim2vtGrwKcKEeyvxOdzLlG9w3oeBlQ5ntHM/zlFGw/nIL
	jwQYMPnGZnLucUgbyjQbNFn/rpygZPHw6BJ3oDnBThV5k2s66W/K1/zB
X-Gm-Gg: ATEYQzz6tl3Lcl9rD+9apO3oUV57JutWhH1mrzy9/DOg7KEQyyqQAe+xS5PsRHIr8oV
	Hci6izvHBWun50NwAe2HaO9j0eXH8VLsUkO90JSbutcGSYgLIQ7BI9jyhXTF7Q1vTa8HLMfhXpA
	hv0kDBigvyuY2OmEQUyW+Q9vxZ4cW6X0mRwbNSmAP/JgkdvqJMrUI2YUyPhNgSpChbxQMRKtneZ
	w+O5QtM4cYbGGyxJ2Xyhz5eut91yv6RKI1g+0dJ+Y1iICMHrPLy/R8rbj2V9YZ9TZ7QmWEwPKnY
	pc17c3TU4Mp2eiTHTxkRBUWqLsensI3yZcTeAzcahUulcAnv4T/bL273elpsjMiomIqiQEnlvP9
	csdV8gI8Buvw8D6dyKnu0GGKbnOVQ1gn7bHsPv0AjDWZLBl689bnb6ac2QlHscnonaW5pMuGxne
	CdMn8OU/3x9OEpS7B8HPtbZimMzQW9JKSkZCeqZjYk14EUe+D0dwyI1WpbTUuNIpfd95snyBi+
X-Received: by 2002:a05:7022:e29:b0:128:d20a:2f40 with SMTP id a92af1059eb24-12a7267d0c0mr5552465c88.8.1774276387345;
        Mon, 23 Mar 2026 07:33:07 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a7330d1c5sm8887677c88.0.2026.03.23.07.33.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 07:33:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <453dbd6c-c68d-4977-8418-a898008b0fe7@roeck-us.net>
Date: Mon, 23 Mar 2026 07:33:05 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] dt-bindings: hwmon: Document the LTC4283 Swap
 Controller
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>, nuno.sa@analog.com
Cc: linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>
References: <20260314-ltc4283-support-v7-0-1cda48e93802@analog.com>
 <20260314-ltc4283-support-v7-1-1cda48e93802@analog.com>
 <c395fad0-ca24-448a-a77f-ddac1cd9f809@roeck-us.net>
 <77cd7e879a10df791d9d5eb1f16f1654e9904199.camel@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <77cd7e879a10df791d9d5eb1f16f1654e9904199.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

[ ...]
>>> +  adi,pgio1-func:
>>> +    description: Configures the function of the PGIO1 pin.
>>> +    $ref: /schemas/types.yaml#/definitions/string
>>> +    enum: [inverted_power_good, power_good, gpio]
>>> +    default: inverted_power_good
>>> +
>>> +  adi,pgio2-func:
>>> +    description: Configures the function of the PGIO2 pin.
>>> +    $ref: /schemas/types.yaml#/definitions/string
>>> +    enum: [inverted_power_good, power_good, gpio, active_current_limiting]
>>> +    default: inverted_power_good
>>> +
>>> +  adi,pgio3-func:
>>> +    description: Configures the function of the PGIO3 pin.
>>> +    $ref: /schemas/types.yaml#/definitions/string
>>> +    enum: [inverted_power_good_input, power_good_input, gpio]
>>> +    default: inverted_power_good_input
>>> +
>>> +  adi,pgio4-func:
>>> +    description: Configures the function of the PGIO4 pin.
>>> +    $ref: /schemas/types.yaml#/definitions/string
>>> +    enum: [inverted_external_fault, external_fault, gpio]
>>> +    default: inverted_external_fault
>>> +
>>> +  adi,gpio-on-adio1:
>>> +    description: If set, the ADIO1 pin is used as a GPIO.
>>> +    type: boolean
>>> +
>>> +  adi,gpio-on-adio2:
>>> +    description: If set, the ADIO2 pin is used as a GPIO.
>>> +    type: boolean
>>> +
>>> +  adi,gpio-on-adio3:
>>> +    description: If set, the ADIO3 pin is used as a GPIO.
>>> +    type: boolean
>>> +
>>> +  adi,gpio-on-adio4:
>>> +    description: If set, the ADIO4 pin is used as a GPIO.
>>> +    type: boolean
>>
>> Does this dependency block force a redundant specification of adi,pgio4-func?
>> The default for adi,pgio4-func is inverted_external_fault, which means the
>> default hardware state already supports external fault features.
>> If a device tree legitimately omits adi,pgio4-func to rely on that default,
>> will it fail schema validation here since the dependencies keyword strictly
>> checks for the literal presence of properties without injecting defaults?
> 
> Fair point. I guess it will fail but the alternative is to not have any constrain at all so
> maybe worth it to be explicit in here?
> 

I don't claim to understand how to define devicetree properties, but

adi,pgio4-func = <"gpio">

and

adi,gpio-on-adio4;

seem to be equivalent to me, and omitting the first property (because
it defaults to inverted_external_fault) would cause the second to fail.
So either both would be necessary or none. If that is correct, what is
the point of having the adi,gpio-on-adio4 property in the first place ?

In other words, what is the difference between
	adi,pgio4-func = <"gpio">;
	adi,gpio-on-adio4;

and
	adi,pgio4-func = <"gpio">;
(with no boolean property) ?

Thanks,
Guenter

