Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A51929C328
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 16:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782147562; cv=none; b=fTrIRxZ/H6e9bhJnpTsesXxagG6VtT6ljR/HIZz1QrgeagiQTgmEFFbn08ZG5+SuDDtKaERrp9Bd01HKCJozaino73PeTmFBnINDJG7wKlUJNm341JM0x8BJdlAy9w4ufaBU8w15Fgqg7FCzkTVX74+6h5RJy+ANlVuAhM97lS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782147562; c=relaxed/simple;
	bh=VwLgvQ79ZYX2f+aOk6E45c43BgvC+vyBko2Cz5vJ+KQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TDfsOH5YI8WM0pOFrWAIV4tU/T32CxBchC/ypong5nbO79pZBMKRrJ7q+/01BbAyKIyZjCQSE5G/hCkFWKDO6zTBWDSdftZ4EgrmTu4VZreGzdClrFR19Bo7G1HlZGmuDHby5DA4E2GHpgFXYDKSfIiceRe2M7q3+EHbHOj2UBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=A7SEhHJ3; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="A7SEhHJ3"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7e6e9408e30so4085696a34.2
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 09:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782147559; x=1782752359; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LgjPu8EjLkNonMouFLLepbJvfLSQfkmj1LSsNNlmiCw=;
        b=A7SEhHJ3bTDgTFtOLfjzVo+enj32EmRN7j9vN8mfVTLTFBbFTQoP1NNWZLIxDMIdFf
         8rGbvLK5qEA84k08RntU8Nqb6SYvzP3oV69vbQOi5nTBSypzEFWOXzlsap2nPRPuOivW
         VFZguAQJrr8HtWuWJf2+xmEb9zVOU/XPQ8YOKGVkIDMLIMPeFVD1Jo66alTdg6r7IUhT
         m8nPZyEC/6/fSYX7nhtf57t9Skt5FJjwsaV7v6zlBZhMGHdOk0x5aN2jbO8JFO3pql1A
         nn8rQvedogk9ksTzGl4R8QNKZexSHbw1GE1H4/pJK42pi3ZSu+S+4+KEQ59+c4RFPoAv
         Va1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782147559; x=1782752359;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LgjPu8EjLkNonMouFLLepbJvfLSQfkmj1LSsNNlmiCw=;
        b=c0w5PXjFMT5TlvkD/RfZ3mvB/0f4qGOBIddU6WB9Qbmfa6DDh+T6SlUa+g+NUAk83P
         a6a9WsbG0lxncCdDSfsQ+yPr7u2tKOWZE+sGcl03de6IUv6TYSywWe1TTHt+iof42JD1
         1T35ZZzz8OWA3r4ebbJICTVBCXjQ1pGI0nPWLlj1vFqlXb+mV1Intp4d3TiX6JamSEdK
         1shTuBBSyWYDwlGXjxhAPFUYNQCN9jFBoaS8uc0Hp7kXb4TRSKzgoSBdVAUxFUPNVN2x
         HocHIPaGgTNe7k93qhO2PJLZigb40KMpaM6UJnlI62xl8NCe7O+7pE7UHHa9vLbaFf4C
         S+aA==
X-Forwarded-Encrypted: i=1; AFNElJ9raLoKdguV+OPHVwH8R+qF6YeOlF9qgKMLlrLZ534EWKrKsiI+F7PDI4w0TpvhChsTwx6V/wFgqDoL@vger.kernel.org
X-Gm-Message-State: AOJu0YwPvIjDHEIgXs+mJksJUMlWTq+0G0FD+tjLcqzFuJz4vhk5ydgK
	hLB85hIkAZNesQlPoOuP+5UarGQeGz+C3rDFTJXI7JtafAwn4k138CoK1fGnZA/K/vQ=
X-Gm-Gg: AfdE7cnL1hI4301rDKc3Ine3DByWYVdu+NZrTwt5/X20Rk95x08nNkaqBoL/RvSEQPG
	taH6onhP1+44zQq1JW6GX7LKUWBat3EXZWD/87S9olnEG2rHNt2QJhdlPwyw07tM2NEDGEBBogC
	hhZRTJf0Umpbx41s4h1bcGrnq/RoK+ZskvsfgX2YV4fCB3kUFFwdI7Sxw5wTnvnpuoLlxPLGTJ6
	bI2V6fYOu6lDUuzHvqldU5Vnebei1l5BPPcX+gPigQVXzXd6RhSD1bZs+eLkTwhpWs44jmGejf+
	WAmnlUQL9TJ238yeDIPo0GB0DHMa4aFDQqcCVsxKVyG41mCJmPBXIwndeAoniHWUqd9jxmK04hR
	mZuY0LRP+qO7y4RFKJoWClS3TAWIrNq+WzmF5pW2Wn4J/HF7V5Q0j0wCaZEMIxMo0C7fHOAmM96
	itJfvEBJB0L4tda+SIQEikckuv914GOSuwpMxIIpSVWs30pmAABSiNoCB13Wm+PQM=
X-Received: by 2002:a05:6830:3892:b0:7e6:ece3:80ed with SMTP id 46e09a7af769-7e92d9c6f71mr13440607a34.21.1782147559630;
        Mon, 22 Jun 2026 09:59:19 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:b69c:5a77:b8fb:a5cf? ([2600:8803:e7e4:500:b69c:5a77:b8fb:a5cf])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e944007d74sm6772717a34.5.2026.06.22.09.59.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 09:59:19 -0700 (PDT)
Message-ID: <78d859ed-61a6-413e-9ecb-6af177f2f9ae@baylibre.com>
Date: Mon, 22 Jun 2026 11:59:18 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: iio: adc: add ti,ads122c14
To: Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kurt Borja <kuurtb@gmail.com>,
 Nguyen Minh Tien <zizuzacker@gmail.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260615-iio-adc-ti-ads122c14-v1-0-e6bdadf7cb2b@baylibre.com>
 <20260615-iio-adc-ti-ads122c14-v1-1-e6bdadf7cb2b@baylibre.com>
 <20260621194102.08d7fdd6@jic23-huawei>
 <da875b00-6f93-444b-982c-30b8001dd8e0@baylibre.com>
 <20260622105546.69c6b4bb@jic23-huawei>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260622105546.69c6b4bb@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/22/26 4:55 AM, Jonathan Cameron wrote:
> On Sun, 21 Jun 2026 16:14:57 -0500
> David Lechner <dlechner@baylibre.com> wrote:
> 
>> On 6/21/26 1:41 PM, Jonathan Cameron wrote:
>>> On Mon, 15 Jun 2026 16:59:59 -0500
>>> "David Lechner (TI)" <dlechner@baylibre.com> wrote:
>>>   

...

>>>> +        description: The current output of the excitation channels in microamps.
>>>> +        minimum: 1
>>>> +        maximum: 1000
>>>> +
>>>> +      current-chopping:
>>>> +        $ref: /schemas/types.yaml#/definitions/flag
>>>> +        description:
>>>> +          If provided, the two excitation channels are to be used with current
>>>> +          chopping enabled.  
>>>
>>> Can I have a reference for that? My initial read suggests it's the input channels  
>>
>> No. :-)
>>
>> I must have got two ideas mixed together in my head to come up with
>> this. Clearly this should be `input-channel-rotation` or something like
>> that (we discussed in another thread already). Also curious if you thing
>> any of these properties are common enough to promote to adc.yaml or if we
>> should just make them e.g. `ti,input-channel-rotation` (you might not have
>> had time to read the threads on that yet).
> 
> It's turned up in a couple of drivers and the concept is fairly standard I think
> so I'm fine with promoting this to a top level property if the definition can
> be generic enough.
> 
> For a non TI example, the LTC2893 has this as well for it's thermistor settings.
> It might be worth comparing the approach given here with what we have there.
> In that case there are specific node types for different types of things that
> are wired up with constraints on things like excitation currents.
> It kind of constrains things to the sane known use cases.  However that is
> partly because that device does (I think) more type specific handling than
> we have here.

LTC2983 has current source rotation, so it has a adi,current-rotate property
which would be the same as the excitation-current-rotation property that
we have proposed here (named current-chopping in the patch, but better name
was suggested in later discussion).

So not quite the same as the input-rotation property that we would need for
this chip. Although ti,ads1262 that Kurt is working on will have both.

> 
>>
>>> that are chopped.  For GC_EN
>>> "When enabled, the device automatically swaps
>>> the analog inputs and takes the average of two consecutive conversions to
>>> cancel the internal offset voltage"
>>>
>>>   
