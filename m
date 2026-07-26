Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9DC33A70A
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 20:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785099444; cv=none; b=LqK9WDYo91im3dGBPKBUkEeHaQ0F0kb3I8XK9RA7nJ4OBRat3Z/kp37RSs53T4GWJ8Lrg9P5b8ZBSI5WQ8P4ZlGnY9AekBYvViad8PnGMN33KVFcIGnlgeW5/7mz62Eb+nUz+PU3tWD9oxdcXMsn9NRldf1EiyzUMka5cDXiFlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785099444; c=relaxed/simple;
	bh=kIdU00xsCwLL9fidDKVRAoIrHeudl7Pql0qPe0E1P4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cX//1hmKNq8gIlqB0c7jYJPIsRqdb1ZPW/+drQNv5CHZrEg7NOSE9eyb+k8kZTVGZFk4VMKuvl9Zdih4P9gpayJiDm2yT71lL+7YBtba/YVA6ZWtAEdhzphACXuDkBZcCHGa6jC3FzTQL0DRt1q5M+p7azhagnPEF/RTW7RYGAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=fsxZWXAY; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="fsxZWXAY"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7eb5bdb50fcso1092758a34.1
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 13:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785099441; x=1785704241; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xQmP8MtwhLpnNWavacoVMEqOOrV7CaZe5qiKgrP7ZgU=;
        b=fsxZWXAYTx4dm+ekJETu/1rGtL5HSZQb2v8whBFXVmh9Bas/Z/7BPv2gPySB5nv1M2
         f4QFmuf4jynPUhvw07UY8fDPSzM15odAVtOwoQO8WtJU5I4dEcAcDRViMGnncN2nGVtB
         fVXB+oPEzz+I2isr49SHjNv86/iK+e1aemuybES11LslzirxjGSc2qwCp0DtrJfLNRhM
         5ncA+qIwoMMwvDe+h/JUfmTG+hSzeOV7X8nSPjDVzM/SIOaQhhj25BqrzS9/Ocbov//e
         cRnEygbHk9/455jvBYQhXsBew2U+Qn4t69yEFU+6fh5sRYqlFmbdhDId6YB+G5gq9nU3
         fCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785099441; x=1785704241;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xQmP8MtwhLpnNWavacoVMEqOOrV7CaZe5qiKgrP7ZgU=;
        b=aASJrIwIQKGGOQyL/QVwh2NXhtACtAZiyyX9JB42TLaAWVqTk2yFl3a95cExt0HEck
         IlwLqwcgD4FEzBTK0BWA3bUhU6+8tNEhUJHa7toU5OCM7UXQcAJ3rTJDelAO6m3FfT4P
         3QpycaIAt0NJ9g6y10KZaSs+I/furj0jy8dugPZPXM8maB349xQ5iCZa3vQ6mTx0WMfm
         9T+k9ctks6uCzrlM5V3oSbESgQcZtJPIAlN/gPJCDvqpRUwQfBnDh+JbjSqugnfO59Tb
         rq1G+SPNynMVn3oYBLmYTx17rSxj3KvTlRoHotppSYO4TcxpVDt/4HAE+rv7nnGRd7jV
         m0mg==
X-Forwarded-Encrypted: i=1; AHgh+RoGv6AJ7SnrjA7MYMg2kPh0A0VGhWQnYAnSl35ZxlEVigGre8R9cvNktuUc/g/yXdJX1SN3XoZObBvm@vger.kernel.org
X-Gm-Message-State: AOJu0YztPNefzUWtWn/r/y7R0sgBe9mc+JJutGm3I5eKqWm4WU6iG/ij
	zrGmM7wnqnIkdR0CVK/5R74VOmyV/YHl3hva8WkLIc6PaiNUMNX13dpRxYHmuYUrQl969XJTr4a
	Jqr72
X-Gm-Gg: AR+sD11pHbRTYZtuzcUpOdAs9pvbN6vmH+cUnFDWDgmk3dVACUt1HxBzJI0f49oUSKB
	TTU0K9AbbTnEzodwPNh+UWCIw3vx/59ByJLgPX0liI2ixS7EiWSZYw2tSRbMc+vLqCixU1Q6pnu
	DLA/I2vbL4MZ3a64rXHEjN6YC1ETPoVTA9kmjuFsBYbE9NU18MnDxn/ctN9bkWzdUsQ7AkI5zbC
	tMYinZsMTpNosn1pN8USzCDGUDKSO8IJa23NfA+P5WHKbY8cEEnkX4vhqBV/OaUOqiyBAHSiVaE
	kAVcLyTzqqYCGhi1NVNPhBjOBbMv/s8YMFTIJTT6+LOHsBxeMrS5+72JGtwgDd0313D+SZ70PLk
	20tXMNpfwOsnaHOiVGlATFEzw2yAM2A+xFLlOBcbI5wflRf1O3Frng4FwpQ7g4Xi8JkbR+3ETtO
	3+KKi3uYl/378Vexj3qCrUTa8jF0OG8nqOJ4tbfShW+pUFaeaAwgsY1VSy4w==
X-Received: by 2002:a05:6830:32a1:b0:7e9:b673:cbef with SMTP id 46e09a7af769-7ee78d72f81mr3829352a34.17.1785099441382;
        Sun, 26 Jul 2026 13:57:21 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:105e:29ca:45cc:c7? ([2600:8803:e7e4:500:105e:29ca:45cc:c7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ee5682c23esm7673308a34.14.2026.07.26.13.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 13:57:20 -0700 (PDT)
Message-ID: <84bd13c8-02d7-44b6-95b1-adc64242a8a1@baylibre.com>
Date: Sun, 26 Jul 2026 15:57:19 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: iio: adc: Add TI ADS126x ADC family
To: Kurt Borja <kuurtb@gmail.com>, Jonathan Cameron <jic23@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260628-ads126x-v2-0-4b1b231325ba@gmail.com>
 <20260628-ads126x-v2-1-4b1b231325ba@gmail.com>
 <946a30c9-01e9-42f1-bd2b-b7934fda85cf@baylibre.com>
 <DJKX600ONL4O.1YUTCD1L9FU8F@gmail.com>
 <a16f61fb-4e98-4c30-8d4f-da084e27ebeb@baylibre.com>
 <DJLOAISPZLG7.VZYX8B16QU4K@gmail.com>
 <22e1e1c2-659c-4991-857c-b38d66769c7e@baylibre.com>
 <DJMJX5FGSZ9X.1GQK24K6CI60X@gmail.com>
 <2a0a9fe9-b3b5-49a0-bf58-5035655fc16d@baylibre.com>
 <20260701012842.16272045@jic23-huawei> <DK8RHLBX32NR.AD0TDBDF1HNL@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <DK8RHLBX32NR.AD0TDBDF1HNL@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/26/26 2:49 PM, Kurt Borja wrote:
> On Tue Jun 30, 2026 at 7:28 PM -05, Jonathan Cameron wrote:
>> On Tue, 30 Jun 2026 13:38:30 -0500
>> David Lechner <dlechner@baylibre.com> wrote:
>>
>>> On 6/30/26 12:14 PM, Kurt Borja wrote:
>>>> On Mon Jun 29, 2026 at 11:43 AM -05, David Lechner wrote:  
>>>>> On 6/29/26 11:27 AM, Kurt Borja wrote:  
>>>>>> On Mon Jun 29, 2026 at 9:21 AM -05, David Lechner wrote:  
>>>>>>> On 6/28/26 2:12 PM, Kurt Borja wrote:  
>>>>>>>> On Sun Jun 28, 2026 at 10:45 AM -05, David Lechner wrote:  
>>>>>>>>> On 6/28/26 12:36 AM, Kurt Borja wrote:  
>>>>>>>>>> The ADS1262 and ADS1263 are 32-bit, 38.4-kSPS delta-sigma ADCs with an
>>>>>>>>>> integrated PGA, internal reference, excitation and burn-out current
>>>>>>>>>> sources for sensor biasing and diagnostics. The ADS1263 adds a second,
>>>>>>>>>> 24-bit delta-sigma ADC (ADC2) for background measurements.
>>>>>>>>>>  
>>>>>>>
>>>>>>> ...
>>>>>>>  
>>>>>>>>>> +
>>>>>>>>>> +patternProperties:
>>>>>>>>>> +  "^channel@[0-9]+$":
>>>>>>>>>> +    $ref: /schemas/iio/adc/adc.yaml#
>>>>>>>>>> +    unevaluatedProperties: false
>>>>>>>>>> +
>>>>>>>>>> +    properties:
>>>>>>>>>> +      reg:
>>>>>>>>>> +        maxItems: 1
>>>>>>>>>> +  
>>>>>>>>>
>>>>>>>>> If we want to allow single-ended/pseudo-differential inputs, then we should
>>>>>>>>> also allow single-channel (positive pin) and common-mode-channel (negative
>>>>>>>>> pin) properties.
>>>>>>>>>
>>>>>>>>> This will also require additional common-mode-<N>-supply properties to allow
>>>>>>>>> for the negative pin connected to something other than GND.  
>>>>>>>>
>>>>>>>> Ah interesting. Why the N though? wouldn't a single supply connected to
>>>>>>>> AINCOM be enough here?  
>>>>>>>
>>>>>>> In theory, any AINx could be a common mode input by connecting it to
>>>>>>> a constant voltage supply.  
>>>>>>
>>>>>> Technically yes, but there is a pin named AINCOM intended for this
>>>>>> purpose. Can we do a simplification here? I propose having
>>>>>>
>>>>>>   common-mode-channel:
>>>>>>     /* AINCOM pin */
>>>>>>     const: 10
>>>>>>
>>>>>> That way we would only need one common-mode-supply. Would that be okay?
>>>>>>  
>>>>>
>>>>> Ideally, we shouldn't limit how the chip can be wired up in the devicetree
>>>>> bindings. It doesn't mean that we have to implement everything in the driver
>>>>> though.  
>>
>> I'm a bit confused on this.  Arguably you could wire up any side of a differential
>> pair to a common mode signal, but we haven't had this binding applied more generally
>> than cases where their is a setup where the intent is a shared common (shielding
>> on cable in some cases IIRC). 
>>
>> So why is this case special? I see AIN_COM can be wired up to an internal vbias
>> but other than that it looks like any other AINX input.
> 
> Hi, 
> 
> I forgot to respond to this email!
> 
> As you said, there is nothing special about AINCOM, it's just like any
> other input. That's why David suggested to have a common-mode-N-supply
> for each input.
> 
> I implemented this of course, but I still have doubts because there is
> no precedent for something like this in IIO. I understand the logic, but

FWIW, we have 4 ainx-supply properties on adi,ad7380.

> I'll personally be inclined to drop it. If there is no further
> discussion I'll keep the 10 common-mode supplies.

To make the bindings less verbose, we could use:

  patternProperties:
    ain[0-9]-supply:
      description: fixed voltage input when AIN pin is used as common mode

> 
> I'm finishing v3 and I'll submit it in a couple of days.
> 
>>
>> Jonathan
>>
>>>>
>>>> Makes sense.
>>>>
>>>> I just have a doubt: In the ADS112c14 bindings, is there a specific
>>>> reason why you didn't describe common-mode-<N>-supply?
>>>>   
>>>
>>> For singled-ended inputs on ADS112c14, there is an internal
>>> connection to GND, so it isn't possible to have a pseudo-
>>> differential input like that. I guess technically, it could
>>> still be possible, but wasn't a typical wiring described in
>>> the datasheet like it is on ADS1263.
>>>
> 

