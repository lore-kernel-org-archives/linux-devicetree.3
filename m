Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984AF3B95F8
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 18:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783535584; cv=none; b=uSTgU4ExTZw1oNyLmnAmIniqiffbkYqNXyAUbMyZjJ9gJGNZ/b2xbSqJ2J3Z3RHsjXU7wfdam/fcjuLtxTTvZZDQFYEokF46xM276KlA4eg/p+yynzUn5VdzLqqZjCVt3B9cqB3aLCWnDMnpvy2brdulGZhKaZWwxxMGu+ctWtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783535584; c=relaxed/simple;
	bh=SHxjgvKIMaYBcy18nLq/RCsUZcXCbDcnAVND+PF4gh0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mjAGtNv+TUw1KPfrRHkyWXaCy9SuVjaNdBut9ti7Oioe7qYomsZpo9BT7q1Y8CmiMbP2rN9SKaxYd/lKfXIgROhAQdDvuqeJ99WjAcP8dfGo9cWNIvPZ2YiOo3RRBOFyV6zjNHCtQ4MEuh53uuKl7FnWsBz0VXBhBt+jfru6ZV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dfa8BB6R; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dfa8BB6R"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c9c26a5fb98so110673a12.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 11:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783535582; x=1784140382; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fokS4FLPD/17BZqVqY44hxzinHKUjbRhuv13BN1UvAg=;
        b=dfa8BB6R3EE9zhZPNy15Dug9EBN6SHEBgMHAhmDen3Bp3qZqjCfyQ6OcJtFFCyKFhu
         sRge97rSauhFMcaHGe5LA8SwjCa+xh+WUpVrTWKbvgCNrHfDEI4zgopYZv/EI87r0i0V
         /vNfmFM6Bap6+NLohY99AiU/tZc+zZTrmN8H6pK3pTGyf72OKwBAUPbxtTSRAojRbnrm
         4E9pAdDhU2aibOw0+1ZeZIcY0fHAReECyXHBW15Rr+XHRTUpyfN4Fj11I8P9gwrCKnwy
         LlmiQN3gS2n3pF334IS0Gs6cKhcjZCDP8HQh4PdRaqE94/DSdzhjBgS0EF8yPTXfTJaV
         nxjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783535582; x=1784140382;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fokS4FLPD/17BZqVqY44hxzinHKUjbRhuv13BN1UvAg=;
        b=kZQ3KOYg/H3XmVwLzgpyl35HayJIxfoWLzUbJ4T6MVSkSCG5LdHlo1B3Kn78bKUBvs
         AxDGgf0jMf0vbdgbfK+2X605fGR9iDpfqCStjM4H8jPoEFX9NFUXirXVwKW58xXml6wJ
         XOO3DDpV6Vj55JpRhJ1R3g5/NgcD0TEdUS8xcqGhZq2T/b0JRFkmIjpsbsWo5vo8TPfm
         ZTHQ/dUhn8opW8JEwzqIUGhrJt0E/Iux2p1Q3OzR610jAqFz1Q0nY91i8VDN2ebCKmYr
         w69LMBMazj50SoxXpDCHNLZYQdNc8tKmKKI7otPsvrOJD9DngTc1dWDizWyvADlutZhq
         6MUg==
X-Forwarded-Encrypted: i=1; AHgh+Rq0z+pkmWfG4KKRNp1SS3KWoT7Awq492H0sfeYWPgiQ0/5GzupQAH8oLS1OK7qqRtYdOYwWmUq86fE7@vger.kernel.org
X-Gm-Message-State: AOJu0YyihKW9+FwuFKa1HfcwDMZP6DuJQC/AIccrVEsSS0JKE3qtl+Om
	x2/Q2kGMvPE3xyDvHjpbBJr2q4I9qO7y7Sj/JCOKccp3rVLRs+AD2ehM
X-Gm-Gg: AfdE7ckNEqTcLuEi4SSf0Nb87x7qS32A5X3WzRnr7a/BDK7Y0MEcTXu4+9jVjTiXXRU
	tmng3QAHG/LXOD+Uv7cVqCtMDE06gX4ZcYJj96B0dp92pRg+8iMFkDb37a/cj2czevDR8kmljYT
	tPBnodJMn/UKdZPy5kyepHn+ejj8FcHmcHYJsUYGUfVVUeSN4euP3YXDVbjpJypJabmxr4uJ4+B
	wH/FEdmXbhJe6CXHwL7hNNurJgbDrGaYBq2sfGau1pu2jpU39UZQkPflXZnIk5R4gFRw2N6lOd9
	5PTZ/HZaBh9oF+a+sBPWbHnEPdWBWNOYE6Ylvp9l2j96d8S8KEuLQAeA2UTIvLNwB68gfe4y/8h
	8uCILOpsr/hW28o10AbRZcukfcq2+ohooq+FkNIczI+NeAWQ3dC5N3204H9Y3YUuSoMOCvaBQXN
	Q+6irLuXj1hC9sk4hlGj2opcxemQl/+/eVs+xy/DUOcBTgAn5h7v/LdzPMjYgGaQ==
X-Received: by 2002:a05:6a20:da14:b0:3bf:8230:1b71 with SMTP id adf61e73a8af0-3c09b21b139mr10359792637.25.1783535581746;
        Wed, 08 Jul 2026 11:33:01 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accae5sm34245609eec.29.2026.07.08.11.32.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 11:33:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b2a5e99c-6d4d-454e-8ecd-8638e4dc0ddb@roeck-us.net>
Date: Wed, 8 Jul 2026 11:32:58 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: (pmbus) Add driver for Analog Devices MAX20912
 and MAX20916
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Fred Chen <fredchen.openbmc@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Wensheng Wang <wenswang@yeah.net>, Frank Li <Frank.Li@nxp.com>,
 Brian Chiang <chiang.brian@inventec.com>, Cosmo Chou <chou.cosmo@gmail.com>,
 Dixit Parmar <dixitparmar19@gmail.com>, Eddie James <eajames@linux.ibm.com>,
 Antoni Pokusinski <apokusinski01@gmail.com>,
 Thorsten Blum <thorsten.blum@linux.dev>,
 Ashish Yadav <ashish.yadav@infineon.com>,
 Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
 Syed Arif <arif.syed@hpe.com>, ChiShih Tsai <tomtsai764@gmail.com>,
 Abdurrahman Hussain <abdurrahman@nexthop.ai>,
 Kim Seer Paller <kimseer.paller@analog.com>, Colin Huang
 <u8813345@gmail.com>, Yuxi Wang <Yuxi.Wang@monolithicpower.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260707122701.751878-1-fredchen.openbmc@gmail.com>
 <20260707122701.751878-3-fredchen.openbmc@gmail.com>
 <f9e32dd1-7c2c-4055-83fa-94683777e30b@roeck-us.net> <ak4QO9uhKOt68dl1@nsa>
 <20260708-true-carp-of-champagne-a0dcca@quoll> <ak41BRQBNdsQrYww@nsa>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <ak41BRQBNdsQrYww@nsa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/8/26 04:32, Nuno Sá wrote:
> On Wed, Jul 08, 2026 at 12:50:25PM +0200, Krzysztof Kozlowski wrote:
>> On Wed, Jul 08, 2026 at 10:19:56AM +0100, Nuno Sá wrote:
>>> On Tue, Jul 07, 2026 at 06:52:48AM -0700, Guenter Roeck wrote:
>>>> On 7/7/26 05:26, Fred Chen wrote:
>>>>> Add support for the Analog Devices MAX20912 and MAX20916 dual-output
>>>>> multiphase voltage regulators with PMBus interfaces.
>>>>>
>>>>> Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
>>>>
>>>> Please provide evidence that those chips actually exist.
>>>> Internet search comes up blank. I'll need confirmation
>>>> from someone at Analog.
>>>
>>> Hi Guenter,
>>>
>>> Well, in fact I'm in the middle of preparing a series that adds support
>>> for:
>>>
>>> "max20826"
>>> "max20855b"
>>> "max20908"
>>> "max20912"
>>> "max20916"
>>>
>>> All the above parts have the datasheet under NDA. But before we had a
>>> one page "datasheet" in analog.com but I guess that is gone! For context
>>> I mainly did the base (core) driver for max20826 and then Alexis added
>>> the other ones.
>>>
>>> Not sure how to proceed... I can wait and then work on top of what Fred
>>> has but this patch is very minimal when compared with what we have.
>>> Like:
>>>
>>> * No regulator support;
>>> * No direct mode. The chip has two ways to access registers (paging and
>>> * direct mode).
>>> * No way to count how many phases we have or if RAIL_B (func[1]) is being used at
>>> all.
>>>
>>>
>>> Some other things more intriguing is that these chips, as far as I'm
>>> aware (at least for max20826), always have bit 2 set in ON_OFF_CONFIG so
>>> a gpio vout. Also we needed some special handling to read phase current
>>> which I'm not seeing in the driver. So I would like to understand how
>>> the chip was tested?
>>>
>>> Anyways, if Fred is ok with it I can just finish what I'm doing and send
>>> the patches. It would make sense to have something more complete on
>>> submission but I don't want to just "steal" the work already done.
>>
>> Binding should be in such case posted complete, so probably not a
>> trivial device.
> 
> Yes, in my series bindings are not in trivial as we support the enable
> gpios.
> 

Same question I asked before: What is your use case ?

Thanks,
Guenter

