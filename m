Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2250B2C21E6
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 16:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782146555; cv=none; b=nH+/xJeRkfc4n+TUnMTvnX8piOqgQZqVgR8IxbLccHwhM9izuug2uGT/JJoa8XcFdRyR42EbkjPd+Vkb/R9csAkXwToyGMkmiKP+XI7QxexhHv4efzVDto4gm+LuZ3fwLQIYPra9IBpABxYJabNmTo+SpF+G7U2JVZ0vR7z4o3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782146555; c=relaxed/simple;
	bh=J6WjMdiSmsSd4l6O9aOiDfddho9ZkXNG7JRLQmJEDtM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dwBZHSS1HZgePcqFTS+wHx1+R3hoYr+YpRiwBmduiyg/CpbDVsDcS8PegPSrtgGL/M3Jg1CQtyuZZlgWuH/jHJVr0LL0YssEwYnrcpAQ2K6stMakYOm2a/r41/27ju+gRfhNKFfrnDqr8MF5mjAO9sIYPxLGLMvU1BwDqRhPaVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=XkfXOoDo; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="XkfXOoDo"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7e6e21c47e6so2686972a34.1
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 09:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782146552; x=1782751352; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CxdyTp9jzcdAMNgLpztr1n4tuC5ymiq5XeXtaFtDt5o=;
        b=XkfXOoDoIeHeOYHz5SunNd3ooJzqJMDsD296/xrp4hTwsH2opgLKzXGzdLl1AOlJTC
         6o/pq5jpRmblqhyeVj/Q3yG+xWB55IBklzNh/1fjf9SRODUFE4pjLECBNeM6VMFM36FT
         E963Wu1n5tkO7JL4ReUF87s8Z2mm4OfhqGdW8xQD/w2x1Ok0QgknZu2FzITuZhDJ3PEP
         LHSs4PveSeZkJFgh+nnlUTBFCkoSdTYHxDZuhdSCa3+YpIOodQ+E05VHhi3Ze7kNkUBk
         U17yNPTfRLDsjJJLU8Xr7FNnfSDWG88Q4NHl4y/+Lzvx67jD1013fDT1aWe/U3jARBDv
         +7Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782146552; x=1782751352;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CxdyTp9jzcdAMNgLpztr1n4tuC5ymiq5XeXtaFtDt5o=;
        b=Y2Cx17AyoEm9wMEfnZxdzRgf2shUsMf1MHm8pgOZucFQVlvTOkLfm5CpoGzfmrZxsE
         TNuYCbfQvwersXSUZw44k0Lrehw2xAIhqa180z8otHN3PJBLY0HbyWXqgmWeTwFhVM7X
         Go+v/HP6DC1nSeqAzlMz69I16qDWjXiLReY57Wa2ma0giziTNCipM6QHKv3s4rKfsNRZ
         OQ34PaNyZQy3A+IxnTjVPoIy3x0MX9tqzDpo5W5YDrGiOb87WjfsgnkmT0ik9MAypktw
         GzmW1VHUUJuDYMebx6QNJ+iA3pCmaPXQEjlH82HgV9yK83OGsObrPiK6QjKlupFjnjt8
         lDJw==
X-Forwarded-Encrypted: i=1; AFNElJ//zfia5uJrWBGakv73c67qI7D9arBJ3SBkboHGvbl287qyVxnK6/am7pWnRFEuRIF/1qvgbvzvA2v7@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc9I7b7AKBajrknsTaHNLKGllM0n7BZrHZZRgBOPzB3TZRhJbE
	Piw3aFyrhOpQ/c9Llysw8snDSGdkISpxKSnC560XE+HSRyP8T4L+6CTm7MrhvIXr270=
X-Gm-Gg: AfdE7clVDlwGx+/zIg40zOFlKlIhsatzcGuQ9ShAHHJm8vs8yIsUtS/N4mnQiccNki7
	Ji8sGBqTzarPAPKngzg6/H67qR47/rr6TRM95F/G4T6YN/OgW0gxSL8glZxcfdiI6J0bCKYJr0T
	4se+Vwf6VXRU/6mxC+hRW3G4sT2vhsVb9Cu+ZJgeel5RPMRHat068u9uSbhFftYaRIfLZGw/2Na
	Lwd0Qd8X4RyYu6DCI0QxWeUlBkhSpL9lBEZByuQc7pQvimwEkS0yyXCfczTdZFw8CL4oy3o8kdy
	AoZQNuL54mQcCBAJhez8MMM7PN954Trt4g+Fgo3waT5RnAB4mTpbpYLBgrXD+oZmMlhsvPtYmpm
	tohoTjCU9rl2XgrAbnO9Khvue2DKtUej+KP7eUjYI5XK8OFo2vPevirpZ3jjMCrOaFr5u2f7axU
	tmcQV8zczZbamOQHYQwQSF/xkx1IB17LfJxa+fyr84Fi/hIA/D7BsvyeGJm9daJ5I=
X-Received: by 2002:a05:6830:718d:b0:7d7:ea9f:c0f9 with SMTP id 46e09a7af769-7e92d37a1efmr11978490a34.0.1782146552063;
        Mon, 22 Jun 2026 09:42:32 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:b69c:5a77:b8fb:a5cf? ([2600:8803:e7e4:500:b69c:5a77:b8fb:a5cf])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9442e98c4sm6502970a34.26.2026.06.22.09.42.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 09:42:31 -0700 (PDT)
Message-ID: <4980824f-070d-4da9-a291-5563aec6dd09@baylibre.com>
Date: Mon, 22 Jun 2026 11:42:30 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] iio: adc: Add ti-ads1262 driver
To: Jonathan Cameron <jic23@kernel.org>, Kurt Borja <kuurtb@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260612-ads126x-v1-0-894c788d03ed@gmail.com>
 <20260612-ads126x-v1-2-894c788d03ed@gmail.com>
 <20260613-sparkling-naughty-tuna-3e9bf1@quoll>
 <DJ92M0ZMSI2C.2I39LHFRNQS7W@gmail.com>
 <a994993e-7459-48a2-a8d7-823c1b0c9545@kernel.org>
 <20260621153318.4a723e3b@jic23-huawei> <DJF5ATR2RPDJ.3LSN8DY58E6RO@gmail.com>
 <20260622104728.039a5ea2@jic23-huawei>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260622104728.039a5ea2@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/22/26 4:47 AM, Jonathan Cameron wrote:
> On Sun, 21 Jun 2026 19:18:33 -0500
> "Kurt Borja" <kuurtb@gmail.com> wrote:
> 
>> On Sun Jun 21, 2026 at 9:33 AM -05, Jonathan Cameron wrote:
>>> On Mon, 15 Jun 2026 06:30:28 +0200
>>> Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>  
>>>> On 14/06/2026 22:56, Kurt Borja wrote:  
>>>>> On Sat Jun 13, 2026 at 1:59 PM -05, Krzysztof Kozlowski wrote:
>>>>>
>>>>> [...]
>>>>>     
>>>>>> Functions used by probe() should be before probe(), not somewhere in the
>>>>>> middle of the code. IOW, entire probe is together.    
>>>>>
>>>>> I they all are, it's just that regmap stuff takes a huge chunk. I'll
>>>>> check how to reorganize.
>>>>>
>>>>> [...]
>>>>>     
>>>>>>> +static const struct of_device_id ads1262_of_match[] = {
>>>>>>> +	{ .compatible = "ti,ads1262" },
>>>>>>> +	{ .compatible = "ti,ads1263" },    
>>>>>>
>>>>>> So devices are fully compatible? Then it should be expressed in the
>>>>>> binding and drop one entry here.    
>>>>>
>>>>> Not fully compatible as Jonathan said. One is a subset of the other.    
>>>>
>>>> This is THE meaning of compatible!  
>>>
>>> This one I'm in agreement with. It is a strict subset, so should be
>>> using a fallback.  If the fallback is used, you just get support of the
>>> stuff in the simpler chip (or if you can override it with a chip ID
>>> you might still 'upgrade' to the more complex driver support).
>>> If you do end up with properties that only apply to 'new' parts of
>>> the more complex chip then they should be verified as part of the
>>> binding (assuming you can do that without the verifier complaining
>>> - I haven't checked!)  
>>
>> In v1 I had the "adc" subnode which was specific to ADS1263. Then I
>> agreed to drop the subnode but I'm having second thoughts...
>>
>> If we dropped it, then we would still have some specific stuff.
>> #io-channel-cells would be "const: 2" in ADS1263 chips. Also ADS1263's
>> channels would have an extra ti,vref-adc2 prop, for ADC2 voltage
>> reference selection. I should maybe also add a vref-adc2-supply.
>>
>> Maybe it's better to keep the subnode or, again, go for something like:
>>
>>     spi {
>>         multi-adc@0 {
>>             adc@0 {
>>                 ...
>>                 vref-suppy = <&adc1-vref>;
>>
>>                 channel@0 {
>>                     ...
>>                     reference-source = <ADS1262_VREF_AIN0_AIN1>;
>>                 };
>>             };
>>             adc@1 {
>>                 ...
>>                 vref-suppy = <&adc2-vref>;
>>
>>                 channel@0 {
>>                     ...
>>                     reference-source = <ADS1262_VREF_AIN2_AIN3>;
>>                 };
>>             };
>>         };
>>     };
>>
>> In this case we would have to kinda duplicate channel description, but I
>> don't think it's that bad.
>>
>> Jonathan, Krzysztof, David, thoughts?
>>
>> IMO the ADC2 specific voltage reference stuff is a strong argument for a
>> subnode or the above solution.
> 
> Given you end up with channel specific stuff that differs I think it probably
> makes sense - though I do wonder a bit if that is real.  What's the use case
> for using a different reference for the monitoring / debug than the main one?
> I could imagine some dynamic use where you want to sanity check against
> a wider reference range, but maybe that needs userspace control rather than
> in here?  


I think is is going to mostly be the same, so could be simpler to just
add extra channel properties on an as-needed basis if things do actually
differ between ADC1 and ADC2 rather than having to define all channels
twice.

This seems pretty similar to the discussion of how to handle e.g. measuring
the same inputs with and without the burn-out current enabled in the
ti,ads112c14 series and I think you have convinced me that we should not
be having a separate channel in the devicetree for that either.

> 
> Jonathan
> 
> 
>>
>>>
>>> The SLF3F discussion is about (to me) less obvious case of not a strict
>>> subset, but rather being detectable parts with different channel related
>>> properties.  In that case the ID match is necessary for anything to work.
>>> Anyhow, that discussion is in a different thread and not really relevant
>>> here.
>>>
>>> Jonathan
>>>  
>>>>
>>>>
>>>> Best regards,
>>>> Krzysztof  
>>
> 

