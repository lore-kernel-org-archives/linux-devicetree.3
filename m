Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AAE36212D
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 18:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788372275; cv=none; b=Ah4b5IK25GMAvD1mW9NUNSp1CdrllPYDX1rVfmhd1lRZ3UfmK1nv5Ana8z8Ow4mJVmaC5FdMA8vJ6G2HoQupwt7QDdz212d1Aq6EALj9c63OR1lQg8jGI6AEIzTpAGgGOUGrN8o5/Z1jWdPtCi0JpR3nJFMe4u3Jh6VNVAURBhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788372275; c=relaxed/simple;
	bh=f4WXt6Zuy9y3eY9gmTUA3MWcgBpYzepnscd0xhcL5fs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pcCFNxWm2ns71lN2lHBlE7zK58LtCMEEz+N2XsG+1+eJbvIz7pAnCTMzpvS2KbGpckbm10CCJm/y4CKzam6+SbOTZQQ583f7o+I3Ql159HROErlKfhfmU/lzgXxdf/R8856C2+luhRTqZ0Nhjv1L0NPUGW+UiMDZfaiEDpiab/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XpPca+zo; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XpPca+zo"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-398a5aad413so1288840a91.3
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 11:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788372273; x=1788977073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nHZfK559PfK75u7ErNf5bfk1YJgbq213PkKA07r3fYE=;
        b=XpPca+zoAfvjNUIzHIbTLhbNZSt0Pcl7pTY4p78KZE7pik1TalCEpPI6I0Gca3Kquc
         1JW1ONJzQ57oEeoSUbOwSrDATaprZbCtcqtekpW9b4El7c8FEYdHfhex8+xi248BGUAS
         2tKBUZnHYtiODj+x+qcDF7ahsIR0kI/crL62AzOWjsq/iS2w7pzajhpQkFNUlG2n6hHN
         9GcH6+C10E85Jywm9rWX3ciMkMpHzmYiszAwdT8hxsQIlwVL5uCGjja3SgaQXQKLUbZk
         xMnecptUYtYu34Bb6IUPv3SvzISAXU98HxI9p990Gr9xR8p11LByElX6xbf39MaKg7M2
         YMtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788372273; x=1788977073;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nHZfK559PfK75u7ErNf5bfk1YJgbq213PkKA07r3fYE=;
        b=RI0bJJTyhw6V8r05NNPI68V/kVvGdoigiWmOyhnW980SsB1HGgiGrq5fFF7r0cfSMN
         JGG/NtvhARBzDnAMRiaOJ2uFV2isfhlbo/UXQyVAO4IdmWi+iAfp9O2f93ielLuJAjGK
         wRQpovyBjBkiak4ZPkjMLI/1QKLnYCkTzNHMGBgukPxd6ADXrKM99hZ99dbeiJ6PFR4J
         mXL7U6JJEVrkKFc9a53gN20GC3puDPvRMPWxRGyJ2Qb8Q5ZVhCWLG+RPIj/OuXXK8zlT
         lU3yRqCa2Gou+5EdSdtva/Zr8//pSKRT0S7ZdMj/bEt3hwdI5dh+s7NOj3JEGSksaquQ
         vScA==
X-Forwarded-Encrypted: i=1; AKwUvBygtjsTFqbzd2YOFaxKnEkVSQf6yUabdJFxQxdShe2Bt15d7Y0dc8nm+sgA6+/1nF+qlGeSyT2d9TGW@vger.kernel.org
X-Gm-Message-State: AFuF++nh3YY1fKdUGwKF459tRpzxgr6WQemYyj6AYHiOsQsi/tzfqKcV
	gw2q47kYAbnLvYmjoFHaVEBqyro815huMlG38fJHut/87f/zAN/4dGkU
X-Gm-Gg: AYBFou3SpK4hLoSuvX1e3AKD5senQLZBm9lgjcYo4WimMVkw0Dwg1uU9cCtvrzUSZHT
	Wmc/+XKtxlA3TlNnQZa1PYPy7XLE58/GIkD5S6cYKCir27iEz3xq5ps+KlxpOLN7bkBUw8r8s2t
	BaMOPqeJX2rLRxcnJG/21QjmDMZwWoLUZRxyx8/0bt2f06ged444fl/6cUxMNCAh7GU6gyMRy+K
	IF56Wg70RZoOWqXtn2v9j6AvnVgQGmWXg3zPgS1jd5snXEr2MQloCthy2P1eIZXKYTBlvyqXWon
	vDoxbMDbZmRZLpWeasDRpUPMdCLEjnfAS/T3Q1GhsI4s44/iv40+OtulQnQuTgArxBdmT/7aRvX
	N9ctMw3uLOgqX96HkcJvzG3BdX2ACn3a4pSQWa9w03g/+MzibCODugQZu//PGN9hmgcJqXI1eK9
	ospAcNBaZF/qb/MtTUbDeSRMuDvwlLv8wrIjs8Hqxp3ZlHasMnl9XnSbOaJp9SnROUoQ/A7W3x5
	yycm+A0RFX9GTN/xeX2C4j/hTGHfoxc91rOXQ==
X-Received: by 2002:a17:90b:2c8e:b0:398:990e:1587 with SMTP id 98e67ed59e1d1-39aedf25104mr9855099a91.9.1788372273028;
        Wed, 02 Sep 2026 11:04:33 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08627417sm545440a91.12.2026.09.02.11.04.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 11:04:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b7e6e195-4fde-47eb-b849-7ae02243673b@roeck-us.net>
Date: Wed, 2 Sep 2026 11:04:31 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: hwmon: ti,tmp401: add
 #thermal-sensor-cells
To: Vincent Jardin <vjardin@free.fr>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260825-for-upstream-dt-tmp401-vcc-tsc-v2-1-cbc360ec51d9@free.fr>
 <20260828-weightless-ferret-of-pluck-ef2baa@quoll>
 <bc51c907-a523-4b99-bf3a-b23c5823fd56@roeck-us.net>
 <apgyEzLFXnyXEkPF@L30177.local>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <apgyEzLFXnyXEkPF@L30177.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/2/26 07:26, Vincent Jardin wrote:
> Hi Guenter,
> 
>> The driver does register thermal zones. Since #thermal-sensor-cells is
>> mandatory for using it, I would think that the property is needed.
> 
> agree. thanks.
> 
>> However, not all chips supported by the driver (and this bindings file)
>> have more than one channel, so I suspect that the value range might
>> need to be "enum: [0, 1]".
> 
> I could switch to "enum: [0, 1]" if you would still prefer it, but
> tmp401_probe() sets temp_channel_config[0] and [1] unconditionally (local plus
> one remote diode) and tmp432 adds [2] for its second remote.
> So each case in this binding has at least two channels and the channel index is always
> meaningful. That is why "const: 1" is used, matching national,lm90.yaml,
> which covers a mix of 2 and 3 channel chips.
> 
Makes sense. Sorry, I missed that all chips have at least two sensors.

Thanks,
Guenter

> I'll send a v3, that does not change the yaml by that applies the proper comments
> per Krzysztof's feedbacks.
> 
> best regards,
>    Vincent

