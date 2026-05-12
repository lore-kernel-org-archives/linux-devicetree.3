Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186013019DC
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 04:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778560974; cv=none; b=crZOmHYtcndgKkZeEWpEaASd8Oe4XCcPEJjGv5vOu537ZpZ3bkw7SBbs7QdHmNV6x3vKrfga+/uOTTvO3fs5eTRh0Ob289HYsTnKzKJUX8V3t2OqvFhBSAfftbp4WVLEwxM+MOPhUt1271BDz1YWT69ojMhhiaoKh42VD7BCB9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778560974; c=relaxed/simple;
	bh=85ENHegQMyU0oBr+Mh/9sBGntPYtRFq66m7uI/8ElgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pybRs5MDt4Np/0eDd/v0lTUaiypffmvtBqScjgn2WcROmBV+Fdg8J/Ex70z7Yb2tTTyA3tin5iVMh57Nte9qRF4VSvH+MPwo73/LfG8SGW+7pqYKdtWE4PqsvVTqojFnpqs/EC7Vhs97Dak3O/iYl4w5hGuwMZOvwVMwfqvO0oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R+jP9rap; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R+jP9rap"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a4113ab355so4775267e87.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 21:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778560971; x=1779165771; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9+uh20BD/IzP+h/IzZKctyoQqKGuFbHGFEDS1sAuZ/g=;
        b=R+jP9rapR1HgZC1WkixXLoN1ZsABtjhDKZB1D9APNhVIMzBcMTYrwfYs0a0jrGn6MK
         ToOLc4+atNgrsQaX5HkndRoJh3mDxqSMh+ZkT9fLJaYb0ZOu9dJV3xxoVL/eoNwinHb5
         Efq7p4zmTzjsg6IE7eGI2HixZV/zeXUppDHdmarb71xCXs85soM78gtVLqhzfMSYeEcl
         uyRCZKcG5RPf8ZtttAS2lg+4yrAOc4Tmt28ijLJdK+8imxV1cD42wSsTTNlJPU5rPTwH
         Euyr4TOaRQnDKxHFrl4TRouHdvJzdDT/2q3G/+vBQSzrZhAhLtzVGAsNpK05k8NMfgtT
         q+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778560971; x=1779165771;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9+uh20BD/IzP+h/IzZKctyoQqKGuFbHGFEDS1sAuZ/g=;
        b=o3TXzmgUBzVKijcb2xjqrVHUCNk7WcgBdX8hAR172eQFuL6jZiT7Iakols9drucCBu
         8oy1CTfaYQ8tjk2NSPSwumJXjhQLWdnM8H8FMUwD2uJgkNkukMl8ROX6BC30a++VzKeu
         GxmFVMpYNB4z8TT1czAklbkNuHKQQPTtZU60D1+nN7oMvdxrNVWyVsS/uoiyMhXWgiRI
         g1/Bm8E/T5WjiO6qGfNwgTfpXyo2z0Xsw1u5tL6SNZX6LtOJExb+jgQMUzb2koPHCzr3
         Mda26waalKRikXG330m5xbMbNaS7c+JvHYv4ytgH9mrRLHlXxZnyAQPnw4AcOEoqPmIp
         bF2g==
X-Forwarded-Encrypted: i=1; AFNElJ8nb9RuMEzK7Jcl0AguSf7ZvXulfF+qkQEywzjLRx9A5faJ0jOdbhOJgqmBAYGehhG9OOutYYMtwJLU@vger.kernel.org
X-Gm-Message-State: AOJu0YyyB3eNCykgjk3+Vlurz+EtC0eH1WPFMBEeeZ9kTFi+N5Atj54Q
	NWmgWXUvetQy9w6IAK9WVA1pqNzSq8o2aKzoRcDwGIWSL8ChpC+lhKaX
X-Gm-Gg: Acq92OH9ast2ul1T0dNoMybNdzAlvzvvmRBtE26fb16a+3iTOu6y0YmKlBKrAZjgJiy
	Ei61Uiy10DScYu3j/l6pAZ0/DE1XrTnoS16jFgzVyjf9rKQOfKsmHPbQgeKZ7SsOfSULvsJ8Kvy
	4iLiRjYQzjXZETFml43z8RBc2zWHCOHw2n2XggHqEPH9kB3OqGyewd1weiVRECETuKl9YHjoHh9
	Lrci9lONmGKDp8Lywx4+COC5mfT55XGas5zwMTKpCNOFTJwVqBSUqicBLTyxhGI37D2DwvPfs33
	6aBelCL1XGszHAIcnwkc4m/jggkwbp5fKXgiQ43PV2YLyf6LmU5poFSMH/c5nK3NtGH2Jhh7r0U
	VCK8rRSYrQPOY8tT/8k6xjLWlUn4ZXZj9vCL0uSAaxYzWUr4vK7NraLcSskFBBv5DkM+QkUAFeO
	ycQdxKVTAKJKr58CqDemlkbCQDRjQKQBR3SHcFStO+LvKs/PAdX2thGacFFgOhpDlhtjUxEqtlE
	4AdWKTn
X-Received: by 2002:a05:6512:3e21:b0:5a4:ab6:81b8 with SMTP id 2adb3069b0e04-5a8a94caf78mr4382507e87.40.1778560970858;
        Mon, 11 May 2026 21:42:50 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a955df99sm3134316e87.45.2026.05.11.21.42.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 21:42:49 -0700 (PDT)
Message-ID: <f05093df-663e-417b-a671-d627811e82de@gmail.com>
Date: Tue, 12 May 2026 07:42:46 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: iio: light: Add ROHM BH1730FVC binding
To: Jonathan Cameron <jic23@kernel.org>
Cc: Alexandre Hamamdjian <azkali.limited@gmail.com>,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, CTCaer <ctcaer@gmail.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, heikki.haikola@fi.rohmeurope.com
References: <20260511-bh1730-v1-0-e0df1f499135@gmail.com>
 <20260511-bh1730-v1-1-e0df1f499135@gmail.com>
 <92e2d1ab-c973-45a2-b0c4-d7c672c610e0@gmail.com>
 <00855a46-20f9-4b4c-8bec-bb64d9d8efe6@gmail.com>
 <20260511161429.6cae5b7b@jic23-huawei>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20260511161429.6cae5b7b@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/05/2026 18:14, Jonathan Cameron wrote:
> On Mon, 11 May 2026 13:43:56 +0300
> Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> 
>> On 11/05/2026 11:22, Matti Vaittinen wrote:
>>> Thanks for patches Alexandre!
>>>
>>> It's nice to see these upstreamed :)
>>>
>>> On 10/05/2026 21:09, Alexandre Hamamdjian wrote:
>>>> From: CTCaer <ctcaer@gmail.com>
>>>>
>>>> Add a YAML binding for the ROHM BH1730FVC ambient light sensor.
>>>> Documents the required compatible string, the als-vdd/als-vid
>>>> regulators, and the rohm,integration-cycle, rohm,lux-multiplier,
>>>> rohm,opt-win-coeff and rohm,gain-coeff calibration properties
>>>> consumed by the driver.
>>
>> // snip
>>
>>>> +  rohm,opt-win-coeff:
>>>> +    description:
>>>> +      Optical-window calibration coefficients. Specified as a flat
>>>> list of
>>>> +      triplets <rc cv ci>, one triplet per window region, where rc is
>>>> the
>>>> +      visible/IR ratio cutoff and cv/ci are the visible and IR weighting
>>>> +      factors used in that region.
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
>>>> +    items:
>>>> +      minItems: 3
>>>> +      maxItems: 3
>>>
>>> I am not sure if I read the driver patch (2/2) correctly, but if I did,
>>> then these coefficients are used to compute Luxes out of the raw sensor
>>> data. I believe it would help anyone integrating (or investigating) this
>>> sensor, if you added the actual formula here as a comment. If I read
>>> this right, the formula is _somehting_ like:
>>>
>>>
>>> Lx = (cv[win] * ch0_data - ci[win] * ch1_data) / gain / int_time
>>>
>>> Here the cv[win] and ci[win] are selected from the opt-win-coeff -table,
>>> depending on the measured ch1_data/ch0_data ratio, right?
>>
>> One thing came to my mind. This 'window' -approach for lux calculation
>> is not too unique. For example the rohm-bu27034.c uses similar approach.
>>
>> The thing is that some of the sensors have more than 2 channels. (For
>> example, the first version of BU27034 did. [That was BU27034NUC, which
>> got cancelled when BU27034_A_NUC emerged]). These ICs may still may use
>> similar approach of having light regions, determined by ratio of (2)
>> channels. BUT, they may then have more than 2 coefficients / window.
>>
>> So, maybe this could be made generic enough so it could be re-used for
>> such devices if needed? I am not sure if other manufacturers but ROHM
>> does this in Lux computations - if yes, then it might be worth making
>> this more generic and not just a ROHM property? Maybe Jonathan has some
>> insight on other Lux computations.
> 
> It used to be very common to have multiple sensor / window setups for
> ambient light sensors - though perhaps less so on more modern devices
> (we have one on list today where they just say use the green channel
>   of an RGB sensor - so there are more windows but not relevant to
>   illuminance measurement).
> 
> Sometimes the window bit isn't well enough described in the datasheet
> so we only dealt with the parts on the actual sensor package and those
> were handled in driver rather than being in dt.
> 
> What I'm not sure on here is how much of what is being described
> is part of the 'chip' packaging - i.e. the bit that is constant for
> all instances of this device and how much is part of the wider
> device - i.e. the laptop / phone etc window infront of the sensor.
> 
> The chip bit we shouldn't have dt, the other part we should and it
> would indeed be interesting to work on a generalizing that description.

Hm. I kind of agree. The constant, 'common for all sensors' 
-coefficients should probably be hard-coded as sensor defaults. The 
BH1730 data-sheet seems to be describing a set of coefficients. I 
suppose that's what comes from the packaging(?)

And just to contradict myself...

I can imagine two reasons to alter these coefficients:

1.(st) being what Jonathan described. Eg. having something like a lens 
or a glass or whatever, on top of the sensor. That can alter the light 
entering the sensor, and require change to the coefficients. And indeed, 
it would make sense to only describe this in the DT, because the sensor 
is already described. That'd mean the DT should only contain the 
'coefficient delta' caused by <add the cause here>.

2. In theory, there could also be another reason. I bet the sensors are 
all 'individuals' to some extent. So, for something requiring very high 
accuracy, there could be some kind of calibration process at device 
manufacturing. This might produce more accurate, device specific 
coefficients. Considering this use-case, I am not 100% convinced it's 
"wrong" to be able to give the device-specific coefficients from the DT. 
(Because, here the coefficients really are a property of the device 
itself and aren't added by some external part).

And, if we consider allowing describing (the more accurate) device 
coefficients from the DT (for case 2), then it would just be simpler to 
always provide the "full coefficients" from the DT, no matter if they 
are caused by the device packaging or added lens/glass/XXX. And, as the 
infamous, and not even existing rohm,dh2228fv device shows, people do 
use the simplest solutions even when it isn't really right ;)

So, I am tempted to suggest we just go with the flow, and allow 
describing the coefficients from the DT, without separating the source, 
(lens/glass/device-packaging) which is what this patch does. (If I read 
it right.) However, I would like to see a property which can be re-used 
by other devices as this seems to be pretty common. Yeah, it's probably 
not _right_, but it feels practical.

Well, this is just my 0.5 cents, and even I may change my opinion on 
this though :)

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
