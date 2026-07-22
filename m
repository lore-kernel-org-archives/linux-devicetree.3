Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220804399E1
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 18:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784743708; cv=none; b=mPwnkkfWz140TqA/diCyyMGUsgSn2aFkoIIhZ2Om6LnClkcXvjznCmrDHmwc8ZgLj8ZjASgbl2txcJ4wGn8Gu1oeGvmGVjraPQUs94EE2xJEMjzu6uWEQbbAMDJ11mDqmAEEperzlZYAzf9RNXby3UalPs2GlNT/VY8lJ7Vgv6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784743708; c=relaxed/simple;
	bh=MYEWQm60ZX7EtF0ib4wznIF/EfUEyO6ShJrbCzEO1Fs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FGtZik5RKy6OhDAcE8TimNHxO6WZMAcfsL2Gi5sKBMYW53Nc27FYx5Rj6l1umHvWRqPkIvXfhlKw11MGjDed9n/OA6qAC8yDloGtXg8K6EEKYOf0RqtCleC05QSq0eZmgOJq9j7aaChO3Vfvkv62ITPZoe+sNaQ6OFafPi71fqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JSTqVW2J; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JSTqVW2J"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-382ef647e20so12410444a91.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 11:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784743706; x=1785348506; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wit2m37J1WrzejZCBGF7kzJGikyzGB9bq6P85Kcyg7Q=;
        b=JSTqVW2JiUxMSdDj81gHpib3UxRX6RIKtGcxPM84jGQBIcpqzlKVmyeS+lI63tPkxH
         39XzO1IEXI1FP0x/fuL10BIlVRnQ3qPd4pOEU+N95q3a0tFYGXwe8M0Jz5pyzQvmEZW/
         vA3B10pD6aXcf+7FPZm6tv0CIpJV0HOYXmz9FqLeOcjBFAdAGUcVv4+7tqOXtbB1WALy
         l0+VCku3F8qmEDtkWYQczOliacGx+68VTsvqbH/T3FhUf61+MthimdFoh26j7wSY5jWq
         RxiIGuYQrxB7IxIowTr8xfo3Kc3l35KFqZTNB7DoMcKZ+c+QukmgacVDwRuc/w20n6Ru
         n1Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784743706; x=1785348506;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Wit2m37J1WrzejZCBGF7kzJGikyzGB9bq6P85Kcyg7Q=;
        b=kkSGf9onAxP0n9wG4wCqn2LpVdSOsMr6QwNlhb6MMb/zoAAu0DOfhnz1tz/Ipk6SBL
         lD2v96kqA8ZUEHF/NWsz/wUNfKo/1zK7siwY/MPaiH4UcZnoT/Qlr70UJnG5jJF57A51
         m1QLLQXqy1fviQW7IfPR937ZQyMO2xf+/sZNOq0api8FEO0E7cAxjcmarH4ISFSqZ1S9
         mPGwYFNxzQjsAQu4IvccPXhKGQfWr0SJdjf96rbTZ2GV+WaeJ+WteAyqfaVTOP2hOl6h
         O7Jyvdk5hfn3jnQQbup9Btj91AdWJmhjgyDkGNz9qg+8gcnBdvuUfFQg8cipLKXlcaew
         Tdyg==
X-Forwarded-Encrypted: i=1; AHgh+RrQ9p76n4rmtjCs8dbpVF6QJijn1C6/ePeW1qUy+oIROYFCywrMfaj+IM2YyAqbemdy05wfIArapvIu@vger.kernel.org
X-Gm-Message-State: AOJu0YxiMo6n+hyulFODHISgSXdea8f4f912LfCRHclV/pVgFofB7kMd
	/k2Ip734Rt6bjfvIyvDlTAg0eoiMafcunvPI8LhXEVwKnYxWNyFZ5ni5
X-Gm-Gg: AR+sD12KrHoIX+lKPMPNzXHqBZbZNXGgNanaPr/7X9Gz8hEfl27gZ4v25RqmnHmVV3s
	Ly/+DTjnAiYN2opfBmeamWnPiCVCH0MEVbos81sb7YbK8+FQdxw/2np+E5KwfUupeF9Ov99o9gz
	bWRqVY7Gp/cSLRjfo3RdbnBqXes2b6ov7/e46+ouRZ5IpZnGhnMH/5XQsRZOInMpIhe53SrVyYp
	FC6FApWgXSDljrfkKadMTRi6JMvwHhNS/oQm4LU6EuyPQND5KpBtOeJTYg/ctf8o33vN59agGZl
	M+vf876bXt9xvKNHGDJkfy0nz/YCiMGOvG/P+b+qx2oLKDy7Kq8T+hRTZQC5oSCWwuO21GtTJoT
	N+l8UJHvqOAmoQTcYUp3Da/LIy+1faUCx/Zn6zW0+76n2qLockuVlyOUgec6B7hayrOkrN3PDq8
	vA1WczxgtivgSyDjWwq2zMUrfjJ2hBe+zVvx0lmuwKBj3hcrI78DKFdq6fRw58Bg==
X-Received: by 2002:a17:90b:2807:b0:37e:9e9:6ffc with SMTP id 98e67ed59e1d1-38e4b532703mr24710239a91.25.1784743706277;
        Wed, 22 Jul 2026 11:08:26 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130a87e9sm7763022c88.11.2026.07.22.11.08.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 11:08:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0cbc195d-4260-4950-af50-2892e325ab3f@roeck-us.net>
Date: Wed, 22 Jul 2026 11:08:24 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: hwmon: add binding for adi,adt7470
To: Rob Herring <robh@kernel.org>,
 Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260716-adt7470_thermalzone-v1-0-cc55ef35edde@gmail.com>
 <20260716-adt7470_thermalzone-v1-1-cc55ef35edde@gmail.com>
 <CAJq09z4C2R5syGVtBtA2p6ER1XWRUwaVfEeL2LPvupR6xBe4cQ@mail.gmail.com>
 <20260722175619.GA1301191-robh@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260722175619.GA1301191-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/22/26 10:56, Rob Herring wrote:
> On Thu, Jul 16, 2026 at 11:33:53PM -0300, Luiz Angelo Daros de Luca wrote:
>>> +  "#cooling-cells":
>>> +    const: 2
>>> +    description: |
>>> +      Cooling device exposing the 4 PWM channels.
>>
>> Since "thermal/of: Support cooling device ID in cooling-spec", I could
>> be 2 or 3. I don't know if I should use enum [2, 3] or just go
>> directly to the new const: 3.
>> My test device has only the 0 channel in use and 2 is fine for now.
>>
>> Sashiko also asked to require #pwm-cells, but it would mean to
>> implement a parser for that too. I don't know if it is worth it but I
>> can do it if needed.
> 
> What does implement a parser mean? You can define the property now, but
> support it in a driver later.
> 

FWIW, several hardware monitoring drivers already use "pwms" and
"#pwm-cells". The code doesn't seem overly complex. It is commonly
used to configure pwm frequency and polarity, and sometimes to set
parameters such as the default duty cycle. The code has similar
complexity as reading other device specific properties.

$ git grep pwm-cells drivers/hwmon/
drivers/hwmon/adt7475.c:        ret = fwnode_property_get_reference_args(fwnode, "pwms", "#pwm-cells", 0, 0, &rargs);
drivers/hwmon/amc6821.c:        if (of_parse_phandle_with_args(fan_np, "pwms", "#pwm-cells", 0, &args))
drivers/hwmon/emc2305.c:        ret = of_parse_phandle_with_args(child, "pwms", "#pwm-cells", 0, &args);
drivers/hwmon/nct7363.c:        ret = of_parse_phandle_with_args(child, "pwms", "#pwm-cells",

Guenter

