Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09D3445AF6
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 13:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786542976; cv=none; b=kdL48CxL8DjF5b/CbXK3XBJJRBCbvA7G+3PYsFOZq6mHyTsJXorLj83KF5KynN7Jd/JQ0jtKdTl3u7RmavBg1iZN7vGmU93UJbfiSmcWzALa4HBKH2V+M9rtGnn8Kdp9yy384Ch6+s9lZ21O1aOcObSEXwzjvu1WhvWrye4bzwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786542976; c=relaxed/simple;
	bh=7XwXCEUgLs/ry9XIbKiXILWO0PExOH56Z6lmRpa2MNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f55vGmrb9XRwnLFTidx4qIJQcreetla6e92TUYHqRgCMVEo/T1gbV1OWKiWYAaHum+Bt7DNb793rAdahDzs7ZkNPoin38d5Ecw7E0X1KaBeY0pBmJg1+bhf42pEr4Hu7S7PPFZ+D0sT7AOPXzg7Tpzn29wyKc8DEqc+yBGsi1BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Xh5KqE7E; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Xh5KqE7E"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-48a0ca07c38so650816b6e.2
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 06:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786542973; x=1787147773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MqtgZPrbTPjWEphaUoJvnp4BZkkjRwOTw5FSn5BjHXc=;
        b=Xh5KqE7EUrMAR1FV5QpEARJ3CC1Ux0I2IsgUQU8OjOmuqMmuzQCaHosqJoIt40UWhQ
         qmsYHcfzKvzQiOmyEWbtInK1NJ+Kk0aXJBmZNi+GzVcWRY6OprhfffGmmicCIXQe9oE9
         KPMfUpBMg1X1vBhsp132RJqTOQCunv2jHL3FTz9Uk3QcnqPLvokvus8hz5LoLYJFSdGL
         KIvY6toP2MPYALQLRTyT+TAmMH6D4ywY1kdNsW8vI3YkDN6MikQ1ryf2iMGPs/CabVwW
         aqxWlvtY1gXDMg2FbyAZajE64C044r5hU1XtXpxjdO27f5bqr02axavt3NIaPNbg8aE3
         wB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786542973; x=1787147773;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MqtgZPrbTPjWEphaUoJvnp4BZkkjRwOTw5FSn5BjHXc=;
        b=e2HH2AGofXrad52H0Ti08xt5sxjPEisAaCs26ueQn+OEdgLjeTtPbwmzgIiQVJDDlg
         ACisfLZcYo41e7aDrSF7OLwSKB+bTwBzxD5MAVEs93v0t/DfhejMzt+oUEwHwvcY2rIZ
         gUM8bFCWT9AO3JRusjGhWqLXDKy10A7kG19laK8utDQX+/H1r6eTm8Gb/fat1qBOU14N
         zMhTpwJvXgEU5hdLNCCdnqYYspMrdsDx+VdFct/tX7oQnfzVKOmq5dgFAaBuTwNIpsLT
         1lrhH6X+vItLhw+nUlgnFg/Rsz6A+qxa8Zy/m09h47/aqadW+l4I+gl0iUJ9shYXS5pk
         66ww==
X-Gm-Message-State: AOJu0YzjYKBqGOhYhN3uauP1YmGGCzEQT+Db4z3FaGVSzIkn1jaDOVH5
	6/5hkb7KjUi5RHiL1l+l3QjQQKcjJvnR288/CxAoAf760P0enQ/vUTkIqUgp56wPTH8=
X-Gm-Gg: AR+sD12UAFy7aNYOjr5jLuCKSEVEGRvo1SyNIpou8GUo1bLe/LXVTGhU9qMpVIaKLZV
	VZfYYGTxVzijJha27QnKFR86sujTvt1vX5EJPTXq4GylR3T7/kIeOK/o1hXIqhAFB1xqvbsSH1u
	ysj6nYWO91wCdMMS6jl2tRYxzIOSIvc8u01rg3eahTN8hAdSl1hdKe+chy4u0ut/83nG2MQ502F
	5gcmKZKejwr4muR2SGbtXc85hxbTewKUzMgTTHlzRjhF4pb8ipX77rcqNGmLdAgWyGh/7GkA/kR
	HuW1rvPyB46tsZNNtUOshdu/CV6r8FEFnbCvIoPdHtQeesk5O2k56Q57TvoAXw+b6hxgZd7LgwX
	VPl2N+Sy4fvIeMOO40N6U6YTdMNn3aqts93Rezvg1wHBsHglP1AGJHyC6apUtdR/a8h5TKYIhFM
	bu5Jgjo6E300cMSkZR5VNhvDFcloxuLNyFTSKT8AkW4R3DG5Up/B5JcK4Mq9oX3QirU7TuE4rYk
	iv1GFooAbtYwTFZIcpm1Z1zsNLet7fVWhBvBQlzuTW1MZ0YWg==
X-Received: by 2002:a05:6808:2396:b0:497:da47:df5f with SMTP id 5614622812f47-4b210bcf8e3mr4696215b6e.17.1786542972928;
        Wed, 12 Aug 2026 06:56:12 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:76d8:83ff:449f:8518? ([2600:8803:e7e4:500:76d8:83ff:449f:8518])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b200133de5sm3071945b6e.9.2026.08.12.06.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 06:56:12 -0700 (PDT)
Message-ID: <a73ab4e3-520e-4515-adaf-ed5ec644e5f6@baylibre.com>
Date: Wed, 12 Aug 2026 08:56:11 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: adc: add support for PAC1711
To: Ariana.Lazar@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 jic23@kernel.org, nuno.sa@analog.com, conor+dt@kernel.org, andy@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org
References: <20260728-pac1711-v2-0-609bc026093c@microchip.com>
 <20260728-pac1711-v2-1-609bc026093c@microchip.com>
 <a869acd6-9c77-4495-a581-232ca88ac9e2@baylibre.com>
 <0c0cc5addbb604187335cd534f68a9a7f8ce4ad4.camel@microchip.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <0c0cc5addbb604187335cd534f68a9a7f8ce4ad4.camel@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/12/26 8:34 AM, Ariana.Lazar@microchip.com wrote:
> Hi David,
> 
> Thank you for the review. Please see my comments below.
> 
>>> +
>>> +  microchip,accumulation-mode:
>>> +    $ref: /schemas/types.yaml#/definitions/string
>>> +    description: |
>>> +      The Hardware Accumulator may be used to accumulate VPOWER or
>>> VSENSE values
>>> +      for any channel. By setting the accumulator for a channel to
>>> accumulate
>>> +      the VPOWER values gives a measure of accumulated power over
>>> a time period,
>>> +      which is equivalent to energy. Setting the accumulator for a
>>> channel to
>>> +      accumulate VSENSE values gives a measure of accumulated
>>> current, which is
>>> +      equivalent to charge.
>>> +
>>> +      The Hardware Accumulator could be configured as:
>>> +       "vpower" - Accumulator accumulates VPOWER (energy)
>>> +       "vsense" - Accumulator accumulates VSENSE (Coulomb Counter)
>>> +    enum: [vpower, vsense]
>>> +    default: vpower
>>
>> Why does this one have to be a DT property? Can it not be switched
>> at runtime to accumulate one or the other at different times?
> 
> This property aims to specify what kind of hardware is intended to be
> used/available for the user.
> 
> There are two main cases here:
> - the user wants to measure also the current/power consumed before the
> driver insertion (e.g. from the boot to user control) and if this is a
> runtime setting, the hardware accumulator will be reset by the default
> configuration the driver starts with.
> - the driver does not know what type of hardware it's dealing with. In
> case the part is monitoring the charge/discharge current it does not
> make sense in user-space to change the accumulator to calculate energy.
> Same if the hardware is intended to calculate energy it does not make
> sense in user-space to change to Coulomb counter. Changing the setting
> from one mode to another will reset the hardware accumulator inside the
> chip. 

These are good reasons. I would put more of this explanation in the
binding description.

I also wonder if we should try to make the naming a bit more generic
so it can be used with similar devices, like make the enum energy
and charge.

And maybe call the property microchip,accumulator-source. (Unless
mode is describing an input pin, it sounds like configuration rather
than hardware description, which raises eyebrows, while "source" describes
how things are wired or how signals should be routed.)

> 
>>
>> Also datahseet says it can accumulate vbus measurements.
>>
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - vdd-supply
>>> +  - shunt-resistor-micro-ohms
>>> +
> 
> In the previous version of this patch series it was recommended to drop
> VBUS accumulation option from the supported functionalities because it
> has no practical usecase (other then maybe long term average) as
> Jonathan suggested in the review for version 1:
> https://lore.kernel.org/all/20251015-pac1711-v1-2-976949e36367@microchip.com/
> 
> I will readd it if it is needed.

No need. The reasoning makes sense to me.

> 
> Best regards,
> Ariana
> 

