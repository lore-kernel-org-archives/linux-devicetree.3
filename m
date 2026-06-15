Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB75D191
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 00:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781481977; cv=none; b=lh6qjObfsB6cNSWTsdLvXGvDc5VF0hxzUbT0f9cU/P4V0lrYZpmLWsOXgwa6IBvzstW7gwYT8Eb8c6LW+ZSGhvw/ceVq0zuPO7ixSgOO2EbELkHOwaw/zvP/vR0NQJffxERiNil0kZxrVPFt8vZzqigZc0UGHtzkANuFXhXQfOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781481977; c=relaxed/simple;
	bh=wM1pmd/n2MEMAAgL+lxlk4EYzKHHmRQZ+o9slw24KHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UsyW+YoSEdDwOccSjibnXL7GwFLhUEIqUrjWmm81nju9xA07a9mQuEO5IXHr4cGLyEOlsYH78eUcjFp9PXQJkfutMeuv0JbjBneTeB7LM0CbFXra8lWBtQqGWSf8A8SNY7pF1aQV7SkXl8WKv0CyoLiIvC3DDYjpfU3IzkLA5iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=WFpnXeA5; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="WFpnXeA5"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7e6da33a561so2558260a34.3
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 17:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781481975; x=1782086775; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ptr+qeygHzVdWEi2AIpd32uZGos4ZXKkLuroPag1QJM=;
        b=WFpnXeA5JmNyF1Q5c2wMM9nGPzf8+viFdlk3InFmTwqWemb8E1fi0vJY+F2IaikkO/
         SiHsecZ17sqEatMz0895YLGcSp/UOliC74SfhAkLVRnNiScrHvtRFcOUKiJFGltODTM4
         xCnV3Ct6/gRYjKBlFQm0NL0HRngAm0g57OuzK8QafvkVHiPE8aULonGb8HVr5hEZ9g40
         ji8ljQpfvPL/YR4k5+cPv3N1VHRCRDGVIpHjF9jUngPKJkzqWq6ms1VHDQ0k31SSqV+L
         D2v2Tew4hygq29cltzKOlZumQK2Df07jQUN8PU3WkklHBRAB2FeCq7fd5SDmqUcNTmLI
         bnDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781481975; x=1782086775;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ptr+qeygHzVdWEi2AIpd32uZGos4ZXKkLuroPag1QJM=;
        b=XSjdlz7Yrk681bqyxpPhCQ99UGONaHPGs/BJZRUErpISlMyDi2fVD1g0rHaRVNt8XB
         AhnnlxvJTsXx/+hMC9iOq/Y3O06sIlddcMl0b2MaW32huzbMOjgwi7V/f9paVdu3NXlI
         z6o8QhWwiiIRbd1qptFSP6aruVtCS685uaxCmMGB6+/YAYkqF2cCx+15921XY2ZddztM
         oylw4SpiTE+y9DwthuWUzOiNcKwQAow7ltIUC5FvqxK8hZ1nDOL5xOPQA521cGXrfwBF
         cYFj75nCGTlyCdkRbv+OA7M8ucvRL9jjYpEqvtF/HHSezETv4R/c4kfeSCZs9fq+ol7x
         +HwQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ofPQ6IQMcnZfgla18iiGzIi82spFnK78FEbcTnfwM0qYkx+8DfY8cJdQMuLi+wGv3Tf0F6EjgHgCd@vger.kernel.org
X-Gm-Message-State: AOJu0YzqTxGICjUu2o5JfvurL/k1CRnfyqLYEa2SE+BnJtySHLvrAhLA
	XTYXdf3p13Oxw0NVhE1mLGCibwqKPkeI/oaQMKlHLZulddP2Jmk8IxcGeaeV+Wc+4Ho=
X-Gm-Gg: Acq92OHp+D6D7L6Tc5XkSkK0FuaOw/UBnu2LHltihwSa2LnGA9AkrIR3C0g6BqGeCk5
	OhHl1Ia97zQMfRwpKGj20icLC7/mBZ31bxGZQ6lG6kUnMG7g8k2DQRsNE2gWImxHAxZ//Ox1jMF
	qQa5MkRly65Bi04kqNSgNmXcqO1/sIjFGs7dWa4IHozARl3y87IRe7H40Z1f516atB7s8czi/qX
	b8jNfsOiAMSpNy9uq2Zoo1RA3QybA71N2EmUAWzJILvvbIszcREcMwP3dR5Wa64vLpX9x0kVcdw
	opILyBMsfyKCknqtqlgo4B0Nf0kLu7U3Je6Ihc7W64n4XIqwSERScWb2QqLjNEHJkLg0HMXmnhh
	jHqqUV9S9hnjtHdCD+Fm0LWRbyrZY/5Zqg7W+V/Syt4VUVJl3I3lqmwTPC5XozTwjVmx2pz8+is
	XdxfIdyirC7DTYjA1gSjb4IuXRmaLpU18vvcLBMqHd4SpIuC3dNRw2Oj0NWXUEaXRzNhsfLzkc+
	Q==
X-Received: by 2002:a05:6830:6413:b0:7e7:7de:ca8a with SMTP id 46e09a7af769-7e784885b4dmr8823375a34.22.1781481974833;
        Sun, 14 Jun 2026 17:06:14 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:38f2:457e:e670:19c7? ([2600:8803:e7e4:500:38f2:457e:e670:19c7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e79f5a1b22sm2723806a34.2.2026.06.14.17.06.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 17:06:14 -0700 (PDT)
Message-ID: <4fb4f7c8-0a26-4d92-a3d6-ffde82ab4df3@baylibre.com>
Date: Sun, 14 Jun 2026 19:06:13 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: iio: adc: Add TI ADS126x ADC family
To: Kurt Borja <kuurtb@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260612-ads126x-v1-0-894c788d03ed@gmail.com>
 <20260612-ads126x-v1-1-894c788d03ed@gmail.com>
 <20260613-loyal-azure-goldfish-cf6d54@quoll>
 <DJ92JT0CPSXJ.1113K3KLSRHH4@gmail.com>
 <f13b9c55-770e-454c-9bfb-5847ff17813b@baylibre.com>
 <DJ93WSYC3HTT.3NXQW390CLQ82@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <DJ93WSYC3HTT.3NXQW390CLQ82@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/14/26 4:57 PM, Kurt Borja wrote:
> On Sun Jun 14, 2026 at 4:37 PM -05, David Lechner wrote:
>> On 6/14/26 3:53 PM, Kurt Borja wrote:
>>
>> ...
>>
>>>> Not a separate device node. Fold into the parent... or explain in
>>>> commit msg. You have entire commit msg to explain odd things.
>>>>
>>>> In that binding description you call it "independent", so it should have
>>>> its own SPI chip select? Why "independent" and part of this binding?
>>>> Maybe not independent, so basically part of this device?
>>>
>>> It's independent in the sense that it is a proper subdevice on the same
>>> chip. It shares the serial interface but operates completely in
>>> parallel.
>>>
>>> I decided to add a subnode because other devices might request their
>>> io-channels and most importantly a different voltage reference might be
>>> connected to it.
>>>
>>> I'll clarify this in the commmit message on the next version. Although
>>> after seeing this submitted bindings [1], I wonder if it's a better
>>> approach to do something like
>>>
>>> 	spi@0 {
>>> 		mydevice@0 {
>>> 			...
>>> 			adc@0 { ... };
>>> 			adc@1 { ... };
>>> 		};
>>> 	};
>>>
>>> Any thoughts?
>>
>> I don't see how this relates to the linked patch at all. The linked
>> patch looks just like a normal DAC binding.
> 
> Ah, wrong link. This is the correct one [1]. The suggestion just at the
> end.
> 
>>
>> What is the point of the 2nd ADC in this chip? Is it just to be able
>> to do simultaneous sampling of two different measurements at the same
>> time? We have other simultaneous sampling ADC chips and just model them
>> as a single device.
> 
> It does simultaneous sampling of the same channel, as well as different
> channels. Also the secondary ADC is only 24 bit instead of 32 bit, has a
> different noise profile and has a different PGA configuration (goes up
> to 128 gain, instead of 32).
> 
> Taken from the datasheet (Section 9.3.15):
> 
> 	Use ADC2 to perform main channel (ADC1) cross-checking
> 	measurements (for example, diagnostics purposes and redundant
> 	channel measurements), system background measurements, or
> 	temperature compensation of the primary sensor (such as
> 	thermocouple cold junction compensation). Using data rates of
> 	10, 100, and 400 SPS for both ADCs, ADC2 performs virtual
> 	parallel conversions with ADC1 on the same input channel.
> 

Ah, that is the kind of info I was looking for.

>>
>> Since everything can be muxed to either ADC at runtime, I don't see
>> any reason the devicetree should care about it. Forcing certain pins
>> to be assigned to a certain ADC seems overly restrictive.
>>
>> And unless you have an application that specifically needs it, I
>> wouldn't bother trying to implement the 2nd ADC in the IIO driver.
>> I didn't see any hints in the datasheet as to when it would actually
>> make sense to use this 2nd ADC. My first thought is that it might
>> make sense to use the 2nd ADC for a 2nd buffer so that you can do
>> 2 buffered reads at the same time. But without knowing why this chip
>> was designed this way, I don't know if that is the right idea or not.
> 
> I myself don't have an application for this feature. But I don't see why
> not adding support for this feature, given that I already implemented a
> driver (Patch 5) and is capable, as you said, of 2 buffered reads at the
> same time.
> 
> I do believe I have to explain all this better in commit messages
> though.

I still think we don't need anything special in the devicetree
though. Other than #io-channels-cells = <2>; where the 2nd cell
would be which ADC the channel is routed through when the consumer
reads it.

Otherwise, we would just have to duplicate all channels exactly
in both the adc@0 and adc@1 node (otherwise we would just be
making artificial limitations).

> 
>>
>>
>>> Ack to the rest of comments.
>>>
>>> [1] https://lore.kernel.org/linux-iio/20260519-ad5529r-driver-v3-1-267c0731aa68@analog.com/
>>>
> 
> [1] https://lore.kernel.org/linux-iio/25mh6grzh7zh3b4uytcqnusyv5zjuf6ia4if3ce3oqzqz56ehi@le72iqv7ye3d/
> 

