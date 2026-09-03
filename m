Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9624DBD8E
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 15:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449406; cv=none; b=gnAQUv913FgRr4NhU3guEP07RIionXwXz4k/x1644qAlPGu0/1gxw01V5SX2sTqZ9RW6+FbViHiLG3pl6rNT7EaG1d5Vs37dlIL8I57h03z1nQtj8Hb5fRR8HKSFiQ+mB0kNjxLKqCdY7KFk+cV9yK1bHaTkXZTl34so8cqYsRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449406; c=relaxed/simple;
	bh=V65lDMJi4pB0ovS/PwcrWiReO5oAmLVmduccTtJtLR8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YnvDOnCSuzyUr+2BpwTG33SLT3eeZb88CXdngTlWmIsLhuFdZqlKtiaV/3lUuhIoGEBdKgv53jt1DJZ7pJLbHk/83xHL3SILg8Pl5FSz202mm+dj7N7EPCEKzimzhlMQknDRwUYMnKw8siu35zp4MYZvtovShpT7NusKMWPDLWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=KouNON8K; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="KouNON8K"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7f4e6b5bd30so934880a34.0
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 08:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788449403; x=1789054203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xLiFaZ2E/NhzIjkyqhk0xpKIELhAH9ZpSaji+KDMIeg=;
        b=KouNON8KR+MtWPdB1YNPqf/YDOk/xWk+QSjARjyFno/oURjCiLi9Jr+T+UqIiTiALH
         /INrXb1m69DDbaMSGlAPeIkjb9CwT02KPbegfs4H9FLlcMRUPfjF2/8ophoSTHjJ8EWl
         oUQALiIWfJymm7y8i/xlFLuiTJRkaX8J5n+UDiDJ4eLhT79FX1I1dbpAtDHPyo5kn7At
         Y1mq1AsgcANuIwuZ19OnF1Haobq9tyQDfvbTesq9OreDKQTjAbPltoAjW0jLi58q9BMy
         +vsaOinTYjfPyf0xmLehzRWOviWp363hhjxZZ+WqbRqQkhuH1AHscy50F12unu9GBJRe
         xq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449403; x=1789054203;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xLiFaZ2E/NhzIjkyqhk0xpKIELhAH9ZpSaji+KDMIeg=;
        b=Ce++1A59ckLYOYcgaU5VqDzbReFIHErmUkTdGCrtubbs59C1K1CnjRnu9HgWj7vouk
         M1x6zG0c6VavaPhQGjtvZUutIwTmMKwytPjSJ84Mbp5jjpytW92nnf/7pWKw7hDreS/H
         xWyWF+HNOjRIKT+Z/kFYYWKYH8SolQ4TYuhw2KW8FjnfDAlb2/N4t6usEtzANuEN9P3S
         yzcXaViQqWClbDmz12ROX+kc+YlHWdppob3NcN+A6N9IWIiMCzJ/dn/psMitvQAB3FDN
         AGUPqjVwRgLT0upPt/A2zreL8ct0lSsnq4ID4w1+NPzdN2DRoIfjB+d5uILM0XmETQnQ
         IZmw==
X-Forwarded-Encrypted: i=1; AKwUvBzN0Cj8bQoACDkI+nk+zEr7oyo/X5FzDaKxiX38f0aN9XO4ZjiuxQX8c+DJyAxc5m0KcFiRpDaIqFUc@vger.kernel.org
X-Gm-Message-State: AFuF++meHc/dG5sFAXtm2tEbJ9hvOwegOHXdKqZW2vcOvZoPWNAf74EA
	ZAo4NPyiMHZEOn+2g8nimVL2IPrHbn6Spgs8Irfky1Wz/J3CghuisyPqWIFaqufBRrk=
X-Gm-Gg: AYBFou2E8C3fI4ZEoxkPZOghLKhyaB6FndCbRRAdRzGlgkxIXB5uSsOS1LWzzxE5mb7
	dRIYHO7K8lI7S7zaeKeZm/V23EGY8rc21ie5fOTMeN2EXWHrJnCXADzATKPh2Tm5sF6f1On6vGx
	tzt/tmM+ABgEv6ic/GxVOj/Vw0+lGlyBdjxv/UZv15U+Bx+hJ6W8c8qhAiTjGaxC8RtWLn+bMPx
	21+BmzYfmXEIF70e1grHn+GkJNv513RrxWvqd3z5n15rndca2YiuzBe5Tf+viu1GsmJAMz+icBg
	+U+YP8GW3izuNELliPtVVOufSrZuKz9XBs+sRQxqIeWUS21jnCHllY6ff6KIlqNJ3yMPSFKyklN
	cxwJLJxo4Cidzpt7pMrKMycnecrUzNXjVZjuz64H0EajgPpbKuNVyL920CeKJHuTeekyK/lGRgT
	Rjs+QO+mqQu9dW7A+HrpJWGImlV9aHff4/t9NKNwnUD9rH84X1QaRfmq/pwPM3W1p15ZIFJSyWk
	99nRcgYqx5+oVlFkEybrTMp0qyB0s3wtcF5jQSx6vi3HAA=
X-Received: by 2002:a05:6820:810:b0:6b1:aa44:fc27 with SMTP id 006d021491bc7-6b5ef34b541mr1496418eaf.5.1788449402980;
        Thu, 03 Sep 2026 08:30:02 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:e24:471f:c835:8147? ([2600:8803:e7e4:500:e24:471f:c835:8147])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc38bsm137817eaf.4.2026.09.03.08.30.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 08:30:02 -0700 (PDT)
Message-ID: <61d64649-603d-4a55-a789-babe655a2de8@baylibre.com>
Date: Thu, 3 Sep 2026 10:30:01 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: adc: ti,ads1015: Add label
 property
To: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Nuno Sa <nuno.sa@analog.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org
References: <60dc58c6-dfe2-4377-9a73-f65cda56179c@baylibre.com>
 <20260903151939.5117-1-flaviu.nistor@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260903151939.5117-1-flaviu.nistor@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/3/26 10:19 AM, Flaviu Nistor wrote:
> On Wed, Sep 2, 2026 at 9:31 PM, David Lechner wrote:
>> On 9/2/26 12:22 PM, Flaviu Nistor wrote:
>>> Add support for an optional label property per channel similar to other adc
>>> chips. This allows assigning distinct names for each channel which can
>>> match the schematic signal name.
>>>
>>> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
>>> ---
>>>  Documentation/devicetree/bindings/iio/adc/ti,ads1015.yaml | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads1015.yaml b/Documentation/devicetree/bindings/iio/adc/ti,ads1015.yaml
>>> index 718f633c6e04..777a75c21d7f 100644
>>> --- a/Documentation/devicetree/bindings/iio/adc/ti,ads1015.yaml
>>> +++ b/Documentation/devicetree/bindings/iio/adc/ti,ads1015.yaml
>>> @@ -66,6 +66,11 @@ patternProperties:
>>>            - minimum: 0
>>>              maximum: 7
>>>  
>>> +      label:
>>> +        $ref: /schemas/types.yaml#/definitions/string
>>> +        description:
>>> +          A descriptive name for this channel, like "vcc_ram" or "CH3".
>>> +
>>
>> Apparently this chip has quite old dt-bindings. Normally, we would have
>> included adc.yaml to get this and other channel properties.
>>
>> And we would have used diff-channels and single-channel from that to
>> describe which pins are associated with which channel rather than having
>> a magic number for reg. And the ti,datarate looks suspicious as sampling
>> frequency is usually we control at runtime.
>>
>> Anyway, none of that is really relevant to this patch. We'll see what
>> Jonathan says about using adc.yaml here vs. adding a label property.
>>
> 
> Thanks for your feedback. I can also use:
> 
> $ref: adc.yaml
> unevaluatedProperties: false
> 
> and move additionalProperties: false at the end of patternProperties block.

It can't have both unevaluatedProperties and additionalProperties (hopefully
the dt_binding_check would catch that).

> Any other idea?
> 
> Best regards,
> Flaviu Nistor
> 
>>>        ti,gain:
>>>          $ref: /schemas/types.yaml#/definitions/uint32
>>>          minimum: 0
>>> @@ -125,6 +130,7 @@ examples:
>>>                  reg = <4>;
>>>                  ti,gain = <3>;
>>>                  ti,datarate = <5>;
>>> +                label = "CH3";
>>>              };
>>>          };
>>>      };

