Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C79472F69
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 17:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784656601; cv=none; b=YREpsgITzna3YSTvx19CN8VoYoVYVZYysg+ca9Mdh1E81ndd3tuVxcFei8aQBUiJvHpbBVG7OJDs7nsIaCTvJeGgeukWufJ5dUED2yqgUibtWwYtsYjWY3b1PvZl2U4orfF4WBWDje57yaewauKP8gU1JxdILP6DrfpctU5WUZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784656601; c=relaxed/simple;
	bh=swtbcGBx+Z+G69KWlolz+miL/y+ERWs5cFjryaMB2Uk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uL1r0qBaDgJS7RNPK/soRPj9EcScPk8kinac+Yagtu+/2zvSvAwvirbptVID+/DCxNXmPuUHK/IdBfZw9UBWLCjNQbN6AkuGoXmViX9bU7S7kGDIi0h7MfTW4FBdEqyc0LRA8kFrj/Zq7L4YQXqmq7KQQ8TKl8sU18JQRMvn+qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FXNrTPi7; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FXNrTPi7"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso90483495ad.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784656599; x=1785261399; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EibvRmzRwEGHkazysuYtnr7BudsAqWjL7jIqkEVJ+pw=;
        b=FXNrTPi7YkEFm6cw4CWrdRH1G1qNIxVVsYiDX4FATg6cXrAXNMTt10HfrTk3CRH3xI
         pZINymbtBnkB7+otQ9sIJHJ8Jjn1JsJH3vbJzgrESuhaeEjEFvYz8uA5H8QJWdns/WOf
         P+mI3gQPPPNc6H291kk94zQbt7Cwo+plJcjAteY/55PNbHm1xvI3ksGjwbJGZwd5UgT/
         AmSORVtPa9saP4RmHeDyW8FF+qDteM43zrABpHzhsNcFFd1wHaYm4mMcZZlN2zSNDBnt
         xDuSJ+AIJI833RPRysiVSG8kr2OxaE07FE2+48in46wBBW2pO3Fn9lVJ28rY7byL9xE2
         /g6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784656599; x=1785261399;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EibvRmzRwEGHkazysuYtnr7BudsAqWjL7jIqkEVJ+pw=;
        b=KcLHUhVxQxSUAVPDk3MG52BbVRwswx3kzCPQLozgqWtzBOoheK63xvyY0tPQsU7z3R
         fd2qUWuAHpDafcVAc5xdMgf62logNNQ5xg6L7UsPoYVVkBLltTtuseRALyiqi13rgiU0
         0WbQMGj6KJLOs5t1L5zdilOQIqn70hOylLpzQSxn/ipHm2Xu4YVenCWWRYVP805ODhFH
         geFF+r0dIsB5DEASjDu60E5J/vJ4mymA0+abz8sgQMw+40K7LuWf5Z9aMjkUL3HlSSpT
         QN07R+YU7dAi13NetHPHAEZuFDpb79dZwfKJRAs4IctXinhlFC9Dv+FNgdqMzTmw06mX
         RYlw==
X-Forwarded-Encrypted: i=1; AHgh+RpZDG3SoR2bTH3w3ry7A8qd5/5b949W4CULswqVXzfLqQQfuKYuYMJf0HJOdIcbjnftYFsrY/oBBXOU@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4LGf2ki36OdmcQvD6TwcNLg5mUDYzK5ID9HcfRB0g9DFraZK9
	rQQnnVtZglwomr9TtTUjUjWhXUc9Zbic1/ETH21WQoMoqFQKERDfHumLnU75oQ==
X-Gm-Gg: AR+sD134WxCYWj8D+RbHYUncl9ix0YBfH0qYd/FKbgiZEsmNXfHvIV9i2Q4fIS2G7Zv
	zIYN+adfK+p3vta/XK/70x84VYmaUjqSOscR9Ur9DIsKyBnhbrcYozlYVUoXjkrVr15sbLe5LDj
	VaDQU0IPguaawngVlooM1qYKGed2a8laOor7Wu4cK3vymOINDwr4OXFE6GcIuYkHZwu4CofGJUR
	aJL73IrnlZy3Yo1ofo8kSm9sXK7HSONOsl4QHL900vISxdJX1H4YiCR0uRbGLqqf9fKwE+6rAyQ
	CrTYk0SEM1E6emH3LfDt1YNbwwTIrBz5cqg/lN7xszMSfiEFTbkYGIC20HqB6b8M0mkL5tuAK/K
	3xbUawpSGNcavHJmcYiAkR6yuXWJYMDOtYqT+FHtKiGvpKG4BtiOTzj82TwQ9hMLsVvukCzpgd+
	y//dH7l7ndknI20DYUOXmmxBksq8TxUrqTINgyBjXvt26XW91Ej1+S04pYebhkbA==
X-Received: by 2002:a17:902:d486:b0:2c8:2808:3ec9 with SMTP id d9443c01a7336-2cf3487e320mr208898165ad.12.1784656598500;
        Tue, 21 Jul 2026 10:56:38 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f362e00sm828255ad.71.2026.07.21.10.56.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 10:56:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <673be23a-2a84-43b7-9be7-a661cf0e7935@roeck-us.net>
Date: Tue, 21 Jul 2026 10:56:36 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: vendor-prefixes: Add Sensylink
To: Conor Dooley <conor@kernel.org>, Troy Mitchell <troy.mitchell@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-doc@vger.kernel.org
References: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
 <20260721-ctl2301-v2-1-ef5fb342872a@linux.dev>
 <20260721-dill-dab-df15585090d2@spud>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260721-dill-dab-df15585090d2@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/21/26 08:49, Conor Dooley wrote:
> On Tue, Jul 21, 2026 at 02:48:27AM -0700, Troy Mitchell wrote:
>> Add the vendor prefix for Sensylink Microelectronics.
>>
>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
>> ---
>>   Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> index 396044f368e7..22d0d26f1bbd 100644
>> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> @@ -1467,6 +1467,8 @@ patternProperties:
>>       description: Sensirion AG
>>     "^sensortek,.*":
>>       description: Sensortek Technology Corporation
>> +  "^sensylink,.*":
>> +    description: Sensylink Microelectronics Technology Co., Ltd.
> 
> Googling the company to see what their website is, I seem to see a
> different name for the company: Shanghai Sensylink Microelectronics Inc.
> Their website has that with the Shanghai dropped.
> 
> Also, probably the commit message should contain
> Link: https://en.sensylink.com/
> 

Asking Google search: "Why the two names ? Did they rename themselves at some point ?"

Response:

Understanding the Name Structure

1. English Legal Name vs. Marketing Abbreviation

Sensylink Microelectronics Technology Co., Ltd.:
This is the literal translation of their full, formal registered corporate name
used for international trade, customs, and legal documentation.

Sensylink Microelectronics Inc.:
This is a simplified, Westernized abbreviation used on their official
English website and marketing materials for cleaner global branding.

2. The Native Chinese Name

上海申矽凌微电子科技股份有限公司 (Shanghai Shenxiling Microelectronics Technology
Co., Ltd.): This is the company's sole, official legal name registered with
the Chinese government.

"Sensylink" is a portmanteau created specifically for international markets,
blending "Sensing" (their core technology) and "Link" (their interface and
connectivity products).

Prodding further, asking if the previous response was complete, it tells
me that there was a name change:

According to Chinese corporate registry data (via Tianyancha and Qcc),
they did change their official Chinese legal name:

Old Name: 上海申矽凌微电子科技有限公司 (Shanghai Sensylink Microelectronics Technology
Co., Ltd.)

New Name: 上海申矽凌微电子科技股份有限公司 (Shanghai Sensylink Microelectronics Technology
Co., Ltd. by Shares / Joint-Stock Company)

I don't know if Linux has a policy about Legal vs. Marketing names. Personally
I don't have an opinion. Your call, really.

Guenter

