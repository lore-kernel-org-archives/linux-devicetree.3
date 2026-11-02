Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614861;
	b=dh8NZxZnQ4kJ2UZ14m1yNLphTPow+IhyBU26Oxas5TTEsrmz3x+i8cv9GKZQWuzYSTCg
	 2zElQCIMvPVFnSjoicSb36QSasGjUxkZLawId30M5aeZKK0u9yTG/Q9eENbwSPI6lP4Sf
	 zYl23AB22Gl+B9puehxvHwAldRvh0NsYahMLdfnyYdq1xsstaLVGBGl7ELhn/Koz9HTJp
	 kMXTYhZnUZmrFAUyh6/MVJ5o0FTl+Cm5CFIfbiI9EtVsl9cnbJWx3n5vvt/RMfmcn/Ec0
	 leEoasJY0+kgF5kzAVKFvPrDTZw6oYbfCsopSsygh86jOWJmjJLTnLsMn8Uv13Bwbtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614861;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=aK8g5gPWYY5ZSiatoKUDyldSfIMdc1sHYx/BgeG2gvc=;
	b=dG03iGdASKzWnA9ajpEnhW8z2glPLPf5p3BqehbqVdZb2GvOqT82b/wxsn1GrU4wUi8P
	 O5dtn1n+NIMOpjfxVa9a9RX+XaAgQhPhuOGgfepbXX/AnDwZr/VCYtE0Bw+5QFvPyJVU9
	 qsf5kAxr3YiN2UlooBlHPCk9pL8jN9Xe7YWizIQqXwph+GnbYus/wZb2j+HWmrz3jx2tr
	 7r0MTt6/pwpgQJJeRuIVD4xJnAHbi32voa6Q5ZSy6Y03yzuOfxzdBFJnaR1/vgk72Scoa
	 26Gk0OvNgzzJ/0hS6JgL/4q78SxgNSmHJCZE5o7aFd2dfHTyvZho9PiF5fgeUBACtew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VoySFyXd;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FE3606A324
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 10:21:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9FE3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VoySFyXd
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd6a7b62ce8so886306a12.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 02:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793614860; x=1794219660; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aK8g5gPWYY5ZSiatoKUDyldSfIMdc1sHYx/BgeG2gvc=;
        b=VoySFyXdwRG+tPuJ87m8IwYv32SSANj86gDRALvOsSbYwDK/ifgtnXoSMGBh1SSQkR
         RnyXRfCVux9yP7Yy3aa6aqkdbyRveIpxezwtLBVdEu8WRG9txUdsDMTYJCAu+3gGnL5L
         +0zBfOnsHSQZDHDRvcXapTgiGNHsFEcQ43/SX6eMO37dFTGD4eox5I9lSq73KN1sAQsq
         9QuWDeJxAxk1D7CLLMqrioZagP4g+RK9NNoF0yNJTkqaultLvMyUoXeinJ70fgP+bJfG
         JeB8RqaBegXLEw8QvE9jdRWN1GEW9O6Fk2beKUUVhlEsdRPAnCKOa5ux+ozyshkTCg+f
         PSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793614860; x=1794219660;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aK8g5gPWYY5ZSiatoKUDyldSfIMdc1sHYx/BgeG2gvc=;
        b=aWPPPlWOnBYn5kxFmvCLUSuvx6Cwp433h7yoLt9GQKV8/fCXfWPvdhQClF3OM44aw/
         KgLZDnGLlObPHWpmJx83lw2jnp+rmzrhGU3uNmf8MpMwXAOva6vZRAZicGChjF9yBk+a
         cqi800LvF0+OASWL4q+LbyOsEK7NXpX/CtVtOLb+35/LewLv6IYdFswMNFKdAVlsRFGU
         3NqMYviAnSYtjQzsG9q/uSB6hjgJWUsobeZjMhO6bPvyKVtBf0zESc5Ft7lRZim6Ifqz
         G1d38jaJhBBtKVAS/C5AYKK7V8TABt+2rvl7xwDSUU3LejHfNw+HZTXioR6Lk2UdD1XH
         ixWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjRURHCF9uUyVHgCxnj+H/Hed3T6mtDoAsJhTgwQdHx4ZhlftC+MBpjjVpFKFUJijcPMZpxAS3XemX@vger.kernel.org
X-Gm-Message-State: APuU4Z97K8yKe1+APYZCY8TB0vsgmKztqz25pVCPp5/lGYccaqNlPfPe
	kkrgIcWYeFwBxIwxBVODGd2G5unfi31rlprZRRh+xHJONIGwj7gSTZh6
X-Gm-Gg: AYBFou2xhT7drq4ySj3jYFbGp3bgCiYeofgtov3VvrKRvYz8CqSHx+/Wv91yBQ+6u2g
	fuf8LVWrSdiy3iGRCmgx2yL4ffqGPOAk/evKWkaq3fZMemGOqpHCDEr8B7FEt/FfX6ntZ6k6dM3
	2rn8XJBfevil4oen1lLU9PM0bwwBCBDCYgvSI6a90yljNaYUZniY+lOqLd/kUdL+N2LuKfj0T8g
	qiPuhOl3/KUIpAuYaWf8XuaFoB+eSdUjm/9KFzUH9irQhhL9/gAJgnD1jMdynCUM65Dv3ZN/1YL
	97HmMnk+Nq9udfN5BY/ST9XCjK43ROw8YNW2f933u8tXsu+ACp0rK7ZMtsnGrl60kGXptZ4uBHh
	BZfadTRxwr9Sk4lJqjGRgEGKHunahhZCrRkQ54SA2j/XSpoLeHBJwfJ13Oee77C81RaZhm9hyJG
	3nnbpRQJux1MpjBBATvpHDdJ3sUW+DMG2fCd5KVRZrFvRTKuyUP+CSfAC1hyF+vzjYKRaVtJLzc
	5ZzNqp6aldfLxxVLQSu/A4ceGpUZFJV4KQVdUWtd2ckqMXReRHjIifXgqP373+rRroeIzkdyIJh
	99CxDrCl5tCSYYu7T0LGkopByVIrvexARLE+WGAK+912jEEtjpvbN2OCF2Tn0wNk8LTjBtCJF+1
	mdhTe
X-Received: by 2002:a17:90b:1b02:b0:3ae:3c0b:159b with SMTP id 98e67ed59e1d1-3ae8973603bmr6808844a91.24.1793614860072;
        Mon, 02 Nov 2026 02:21:00 -0800 (PST)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845df666sm13811378a91.14.2026.11.02.02.20.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 02:20:59 -0800 (PST)
Message-ID: <0f0324f4-48d8-471e-b35f-7f2d541a70ee@gmail.com>
Date: Mon, 2 Nov 2026 18:20:56 +0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: jic23@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20261030031501.130290-1-cwweng.linux@gmail.com>
 <20261030031501.130290-2-cwweng.linux@gmail.com>
 <20261102-bald-mysterious-alpaca-13b8fa@quoll>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <20261102-bald-mysterious-alpaca-13b8fa@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Krzysztof Kozlowski 於 2026/11/2 下午 06:03 寫道:
> On Fri, Oct 30, 2026 at 11:15:00AM +0800, Chi-Wen Weng wrote:
>> From: Chi-Wen Weng <cwweng@nuvoton.com>
>>
>> Add a devicetree binding for the Enhanced Analog-to-Digital Converter
>> (EADC) found on Nuvoton MA35D1 SoCs.
>>
>> The controller provides eight external analog inputs which can be used
>> as single-ended channels or as four fixed differential pairs: 0-4,
>> 1-5, 2-6 and 3-7.
>>
>> Describe the four hardware interrupt outputs, ADINT0 through ADINT3.
>> ADINT0 through ADINT2 are associated with the corresponding conversion
>> interrupt flags, while ADINT3 is shared by the ADIF3 conversion
>> interrupt and the ADCMPF0 through ADCMPF3 result-compare interrupt
>> sources.
>>
>> Also describe the functional clock, optional reset, optional external
>> reference supply and optional DMA request.
> 
> Don't repeat the patch contents.
> 
>>
>> Expose the controller as an IIO channel provider through the
>> DT #io-channel-cells property. The cell identifies the logical EADC
>> channel selected by the reg value of the corresponding channel child
>> node.
>>
>> Restrict the channel binding to features supported by the MA35D1 EADC
>> hardware and use the common single-channel representation for
>> single-ended inputs.
> 
> And here even more.
> 
>>
>> Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
>> ---
>>   .../bindings/iio/adc/nuvoton,ma35d1-eadc.yaml | 175 ++++++++++++++++++
>>   1 file changed, 175 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
>> new file mode 100644
>> index 000000000000..97144a8eeb5c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
>> @@ -0,0 +1,175 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/iio/adc/nuvoton,ma35d1-eadc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Nuvoton MA35D1 Enhanced Analog-to-Digital Converter
>> +
>> +maintainers:
>> +  - Chi-Wen Weng <cwweng@nuvoton.com>
>> +
>> +description: |
>> +  The Nuvoton MA35D1 Enhanced Analog-to-Digital Converter (EADC) is a
>> +  12-bit successive approximation converter with eight external analog
>> +  inputs and one internally connected VBAT input.
>> +
>> +  The external inputs can be used as eight single-ended channels or as
>> +  four fixed differential pairs: 0-4, 1-5, 2-6 and 3-7. The internally
>> +  connected VBAT input is not described by a channel child node.
>> +
>> +  The controller provides four interrupt outputs, ADINT0 through ADINT3.
>> +  ADINT0, ADINT1 and ADINT2 are generated by the corresponding ADIF0,
>> +  ADIF1 and ADIF2 conversion interrupt flags. ADINT3 is shared by the
>> +  ADIF3 conversion interrupt flag and the ADCMPF0 through ADCMPF3 result
>> +  compare flags.
>> +
>> +properties:
>> +  compatible:
>> +    const: nuvoton,ma35d1-eadc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    items:
>> +      - description: ADINT0 conversion interrupt output generated by ADIF0
>> +      - description: ADINT1 conversion interrupt output generated by ADIF1
>> +      - description: ADINT2 conversion interrupt output generated by ADIF2
>> +      - description: >
> 
> Drop >
> 
>> +          ADINT3 shared interrupt output generated by ADIF3 or by the
>> +          ADCMPF0 through ADCMPF3 result compare flags
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: adint0
>> +      - const: adint1
>> +      - const: adint2
>> +      - const: adint3
> 
> "int" is redundant, so honestly names should rather go away completely.
> 
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  resets:
>> +    maxItems: 1
> 
> Best regards,
> Krzysztof

Hi Krzysztof,

Thank you for the review.

I will shorten the commit message in v4 and keep it focused on the
hardware aspects that are not obvious from the binding itself, rather
than repeating the properties added by the patch.

I will also simplify the interrupt description. The detailed ADINT3
source information can be kept in the controller description where
needed, rather than repeated in the interrupts property.

For interrupt-names, I agree that the current "adint0" through "adint3"
names do not add useful information. The interrupt outputs have a fixed
ordering, so I will remove interrupt-names from the binding and use the
first interrupt by position in the driver.

I will address these together with the other binding changes in v4.

Thanks,
Chi-Wen

