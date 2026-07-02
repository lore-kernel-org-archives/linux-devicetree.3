Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B291634D93B
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 04:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782967401; cv=none; b=dV0zxb3GlbUcrlRp7oWg9GOt/bhBy96kRkE26rM1Pn+pr5wb+L0/55idxZMNtK+CQLSabh9DODLJ9dFLVYfnOiaAsm+5UwhsmdGn4OkE+DrKNBbYUwydG/YGojwruZxBHYoSSh6dLygefa4lTvhPJKfgOu8l/37z0ndMR3IDkdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782967401; c=relaxed/simple;
	bh=nuU7t0L2HznSrHjK2ALfSgiuuimRQFaOHhMQCUrMSZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ss4x47BreEbnvxc8j5uInwg5QF6rg8xBpBlEn17qcl9+gEKLOokNtVSWdvorjH3DSQjSD88o+JHtgBU1wEmJrUHvW3AL7I3yoOT1vCeHM5nw0+80NBlwzw50H85gN9WJ2yCVpKLH7cmyTCDlrPU3NZTDOq6Rpr5T3jRXGoCywuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qvDwqEwT; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qvDwqEwT"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-37f7a5a217fso1076531a91.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 21:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782967399; x=1783572199; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ON9QUT0SWKiLVqBMoH9mO2rPj7igk0r77PEm2hgCxG0=;
        b=qvDwqEwTD0sbedQCgh1FT4InaNpiR1OY2kTXj6/ZvtXRV2ZBGlf5CyXwD5TMAJzuyt
         xVU57IEWETX9YCmo3yerF67RVVGoeZoTBDnK/RXS/RNxt28cTctM0jcrJ2dJn8ISTjfn
         jgy9+jTEqmgy4FMtYJWPzb5E7ipZe8lGEXRcx4TRBAJA1hcjxwhC0p1Sl/jAvouiSOKu
         9bAIAoGqaVcrcB3Uy2ezaUUxTcqlA3W/S5IxeMqnHAvQzA+ZsUV0owEIuG6GiDcj4Y0H
         jAJdSQvtVwu0/2bxeJ06tNlIIx6TUYFX2EWr/Rsg6b9SuejV1MTiwqWCigW6jZaOCQye
         YE3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782967399; x=1783572199;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ON9QUT0SWKiLVqBMoH9mO2rPj7igk0r77PEm2hgCxG0=;
        b=fgNbC3FmbM0CY7cUSUV/ootm2P1Yox1K9wVKGgtJAu0fm9A0AD15Rtd6F7aomMOko2
         GYI0kk9I8+3e7ePH0/YD8QIGVd10mGG6fKk96mmzCPrE4dkwOaaCzekJnjPEexDdHBjI
         5k+cuv97OwV7LqZ7oU/9cy9OeD4WZWhkD5Xvx0KJfHqKI3ZDqTk8HlrMXXYIEA2NFDpm
         fFSDjEFXvVES7b1yboRWnUNfmHERx1CTaF0MdiD1Ms0Jf8pMJOKsvdB9eryC3tkFxI5s
         /1m37xjP7CdqbUyIq7U6uMbN/eFMkzPLR/vBM4S+YcLALBHnuFNTYTSVf1vHTKwf/lQh
         2FGQ==
X-Forwarded-Encrypted: i=1; AFNElJ9meBqbAia/6HrM17b5Nfd38OK80XqnVMCnAFm5UpgrC5+TVMUX1iXGbZkmS3jAM6jFZnWPTDJ9spNA@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc0niZcMtQU37zWwKWF0dol+O6eOdHSgpy0vyWu6MYmepNK5+x
	q3hq865uq/PP7ulODSBls+KmuNB1MZwejP0/QpNJdAYMbTM+LtUPc7Ba4J7OhA==
X-Gm-Gg: AfdE7clwLep14EaJKbKtZrnLq7viji9s0Wd+mood1rQf0gbDfC7bOuftjKmavDBKHmi
	4VRCHC0tq1FxGzTbGIvsdY8qfWriWIU9l8eZgLTuwte8ff66zLxqBab4fZotxXVjmfq2r9efUEm
	oa9SB//si+T7zAsIhvJasUjrosw1WDXQ2xQpzurJ+Ux6Lr/pTOM0PA4q9DFYp3svL7AIMub+I/O
	6EXjkxa3xD1i5ArnPJ0V8ez3pUmnYKIIQP/HkqSgE3Qct+4beSK/f8nL6pAUCwFdDOLPx2fXdLF
	9gYVnV6La9HFoKiqCaTVi+OkU1uUS8grFBHguVJWM4OZpscpfie4coQu/q9nsEolSJqUeRDPYcB
	FASB82zPeQ2ou1wruFBx83X7IIBcB6cq/mKCPx3qor74aGCbDci+1xUe+qH63HBVq6JyCy3t5pW
	SIUAWHxYZQCXbBLU0J0cCXFSSmlZa+GW614WEnnYcjZxBsWHz+m1pSf+R/+z/Nvw==
X-Received: by 2002:a05:6a21:38c:b0:3bf:735d:7fb7 with SMTP id adf61e73a8af0-3bff40a5200mr4087286637.13.1782967398808;
        Wed, 01 Jul 2026 21:43:18 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3ececfe4sm1852677c88.8.2026.07.01.21.43.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 21:43:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d3053a4a-98a0-4dfe-8999-11fc64fad584@roeck-us.net>
Date: Wed, 1 Jul 2026 21:43:16 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] hwmon: (pmbus/max20830): add support for max20830c
 and max20840c
To: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
References: <20260630-dev-max20830c-v1-0-a02786bde470@analog.com>
 <20260630-dev-max20830c-v1-6-a02786bde470@analog.com>
 <e5c7fcae-57aa-4461-987d-7f004d066873@roeck-us.net>
 <PH0PR03MB63514C57CA17984F0B6FEEC8F1F72@PH0PR03MB6351.namprd03.prod.outlook.com>
 <adfd2c4d-6d42-4aeb-9eff-6a059550ec80@roeck-us.net>
 <PH0PR03MB63510E27A6F22742D526C244F1F52@PH0PR03MB6351.namprd03.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <PH0PR03MB63510E27A6F22742D526C244F1F52@PH0PR03MB6351.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/1/26 19:50, Torreno, Alexis Czezar wrote:
> 
>>>>>
>>>>>     static const struct of_device_id max20830_of_match[] = {
>>>>> -	{ .compatible = "adi,max20830" },
>>>>> +	{ .compatible = "adi,max20830", .data = &max20830_chip },
>>>>> +	{ .compatible = "adi,max20830c", .data = &max20830c_chip },
>>>>> +	{ .compatible = "adi,max20840c", .data = &max20840c_chip },
>>>>
>>>> "adi,max20830" is a fallback for the other two chips, but that is not
>>>> how the code is implemented.
>>>>
>>>
>>> I may be inclined to just not use fallback as it seems to be more
>>> complicated and a bit unnecessary. There's also other devices that may
>>> be added on top of this so it lessens the complexity. Will edit the bindings
>> regarding this.
>>>
>>
>> You are missing the point. The fallback is perfectly valid. Technically the driver
>> does not even need to support adi,max20830c and adi,max20840c.
>> That is only used to validate that the chip is supported. That does not need a
>> separate devicetree entry.
>>
> 
> Checking if I understand this. I need to add a check that if DT chip->id = max20830,
> and if the HW returns string of either nmax20830c or max20840c, device still probes
> 
> if ((buf == "max20830c" || buf  == "max20840c) && chip->id != "max20830""
>          // then it's an error...
> }
> 

Technically, you don't even have to check the device ID in the first place.
You could drop all the device ID checking code.

Checking the device ID is just a safety feature that ensure that the
physical chip is supported by the driver. You could do something similar
to the max31785 driver, i.e., read the device ID and do a length check and
hard-coded string comparison. Separate compatible entries are not needed
at all.

Something like

	buf[ret] = '\0';
	if (ret != MAX20830_IC_DEVICE_ID_LENGTH ||
	    (strcmp(buf, "MAX20830") &&
	     strcmp(buf, "MAX20830C") &&
	     strcmp(buf, "MAX20840C"))
		return dev_err_probe(&client->dev, -ENODEV,
                                      "Unsupported device: '%*pE'\n", buf);

should do (using %*pE because the unknown device might not necessarily
have printable characters).

Guenter

