Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815155;
	b=nIte2KYlmil2eD36PHmqkZekJj8riVQCWZW7yUy8xB2xaC/5PWkqRWbHeZwAed7FveBL
	 RYGSPDGBHRDjJ+77Vfkk7ofJ4QFiaE1m7Y/zZdhDUToRmmXosdr7FOsBwZ0w8xh7yQhjt
	 kvetoWzgIabqlaX0RBCsoQyeBFVd+PztJL80TcPRDJ8U1Lbbt8I8WjcdDed+Btn8KOL+4
	 5saFfEbBoVsf+ut/kewNFEK5M1Mk1WoQ+KdE9x35Hdfl4B9FJ8ux836o8B5bOEHGSTGzq
	 YhJ/O+YIAQ1McQzPwGsearTyRRA8PyTtW0QtC+4JAAkDXuxq322kKzO/EKkFr0QPwyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815155;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=UnB58VtwIqHbFAiwQpoPWYvPypnxq/uodwoMm6+SFKg=;
	b=MmFXqd87R4R1xrYipOkx4qbYHGLtJypbOwVqQOjLNWtVG17KTZ1OwUXk9M/2PGdhFsqv
	 pYYf4Br8Z1Bpnufg9b3qcEOdZ6m3fQIeoL4Zf1QhpXm0hiP810n2vprH1RyMs+WTvm0QY
	 ugRgCabNo2ChTRJDPF3q2k4LlC6GvdfSouEYujtLTW8UxuavdCFmWHIbDweGyV57Cfoqm
	 cY76rLuf/u25Ze08vZqqEXonKPEAqOzONI2nUZbwDe+t2lCG4HzybZtROpzsomebwMBjG
	 hlLobL+QDhxeSVW89OOofl08ZQnkIqePjrEnaeMnjSpgjDuTtfwBVxFyxbA2WyPV2Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tsGsewOr;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA2560A260E
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:45:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FA2560A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tsGsewOr
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so6842635e9.3
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 23:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794815154; x=1795419954; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UnB58VtwIqHbFAiwQpoPWYvPypnxq/uodwoMm6+SFKg=;
        b=tsGsewOrcoJBgq7S+QyVV2G0HcMbQnFblDZIomH6rD25rkyy3A8Z++qJ2xKmbeUCip
         iHXWoT7zTLSM1DHzRgzQRbHKfLxoIvONXRNhgwDB81U02qfVsznSXGYVlR5xf/H7F+Wx
         ZEeX+qoqiOqJLZR8O7IB6yQ+fBDrPpBkq50kArgRG7OO7bM9rUhxRqnGJl1rY2ATBC4K
         eNhpNDTImPu8TPTASGL95LHU/SUtDVrRIY0cmlGiW088w03PTEh+buLVHOINCVoyfbsa
         WMVBRZiGwRLYJlFilDuWjy14IGkahPmTZyx674TreUmG2AvVWqLBFoGO8IdHPDVRFp9l
         S+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815154; x=1795419954;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UnB58VtwIqHbFAiwQpoPWYvPypnxq/uodwoMm6+SFKg=;
        b=k5+8JyS03LIKVL1AsNO6WBeZ4zp4C/LeRPdYSdUPorGZJG8g6PQc1+Mut6Bo1Vkw3z
         Z5oByYckY1oUJ7pm3RXiuZ/NeTW4YLtDyhLn0V+hiQxaBib+4Zl0cE3PkBZ1L+GmGwTX
         eeZyZm1i1HszfflguOMTaL0jM+kw3D3WmdfKMpcpwWC4s/TmLEsFOPIvHcIoe0cWeZey
         AaZav88M1rKONe9Q4Pk2Gi36d9i/rSfyh9qbIJMwJAfPWU7uBxlUR3jLg/1CxUw11L7n
         b3+tetedA9rbvFunrzEVI5YymE186SglD43LdRfd3DMQmNJyaIrhuSBSvy/n5f8+pT3L
         SRhQ==
X-Forwarded-Encrypted: i=1; AL+hErE9hqeCIPIzGbKyqAYOkNo/e+fEo9eBMsEHm/GjGLoll6vaXD0I0uPW2GYAnKYeLJrNEDHFPG7JMpjC@vger.kernel.org
X-Gm-Message-State: APuU4Z9fv0n89sLlHC8EfW1X+Jm5ca///dKukqe0iB8wG4iDm+qVOon2
	UgxKzbmbk/F5BK3FgGsplmIZ8If5sKA6Pa5XhGRAYhrV4KlTtS1WRvDb9DIH8i7q9/4=
X-Gm-Gg: AYBFou0EhA6feQ+ke6hzCWiB2WHTz2ELau46xf/Zy7FZircmcLdjBUcuaj4ZmH4Iaif
	bnhl4HbmcBhUfB1PXcmwihf/l+V9yZAfgOvegmZqycrmfFnWZwOYMj6U9Ws5QPhpwinZQvgy/nd
	pEC6s1+DaNdRcaG+HYm0Sf3zI+saSy4CrVugjrnzJf/OYIh+EiwjdFhBDGDOlSzIxztO/o+CuS4
	NqEy3ic4CAwGS2f7ZuztfdmXkJJNgqcSYpyw8NvOUHPTL5UCgMxT1IIE50ruPPdCVZCWcXmDP7a
	uvjSnH27SDUbHxMrL2iB3InyiLEGKg1ug01Ql/9Dw45mODjK5FJH30rc5skG6yfpFbzn0O/rKLV
	4ETjkNYDVLwLJLJBfLoCZoNBJlijoGzwrWfB9D/zIoz5wB8C3de7vSfj57lAE4GNRAsnQAm5WOB
	QQJRP+DE6ySON3AXFtyBWgc6U37/qgZ8C033kIovb/MjzqtepXzqssz9/HB0r/T8RVkZXe+GMiv
	jFl9hb1e8vudBCxI/7VjQDxq0ENDEAgs0RogloSQRZjKdr4SOAPWgn7b/TDbK75Zgn6XWDC6w1d
	mTNLZvvTirzD7mWDh8AE/zODIQl6PmEmG7BxorBTohXEfnZMpZtptw6ckfpiwcr6sALPlh2aV7r
	Xv3J+FRtXAw==
X-Received: by 2002:a05:600c:a44:b0:4a2:a6e:80f5 with SMTP id 5b1f17b1804b1-4bb55a45045mr214478045e9.11.1794815149872;
        Sun, 15 Nov 2026 23:45:49 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb6caae30csm89916945e9.2.2026.11.15.23.45.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 23:45:49 -0800 (PST)
Message-ID: <04b0fbb4-6083-4321-a907-f3b23a4c90f1@linaro.org>
Date: Mon, 16 Nov 2026 08:45:49 +0100
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
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 07/23] ASoC: dt-bindings: qcom,lpass-cpu: document the
 SM8650 LPASS
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-7-5183f6aab9fc@linaro.org>
 <sashiko-outbox-213486@kernel.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <sashiko-outbox-213486@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 19:57, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] ASoC: dt-bindings: qcom,lpass-cpu: split unwieldy per-compatible
>    schema
> --
> 
> commit f17c7c8f20845c2d15f821f60a13b5f93656ae8d
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> ASoC: dt-bindings: qcom,lpass-cpu: document the SM8650 LPASS
> 
> This commit adds the qcom,sm8650-lpass-cpu compatible string and its
> register, clock, and interrupt definitions to the qcom,lpass-cpu binding
> schema.
> 
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
>> index 3a559bd07a79b..f431173a0e880 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
>> @@ -23,32 +23,33 @@ properties:
>>         - qcom,apq8016-lpass-cpu
>>         - qcom,sc7180-lpass-cpu
>>         - qcom,sc7280-lpass-cpu
>> +      - qcom,sm8650-lpass-cpu
>>   
>>     reg:
>>       minItems: 1
>> -    maxItems: 6
>> +    maxItems: 8
>>       description: LPAIF core registers
>>   
>>     reg-names:
>>       minItems: 1
>> -    maxItems: 6
>> +    maxItems: 8
>>   
>>     clocks:
>>       minItems: 3
>> -    maxItems: 10
>> +    maxItems: 16
>>   
>>     clock-names:
>>       minItems: 1
>> -    maxItems: 10
>> +    maxItems: 16
>>   
>>     interrupts:
>>       minItems: 1
>> -    maxItems: 4
>> +    maxItems: 6
>>       description: LPAIF DMA buffer interrupt
>>   
>>     interrupt-names:
>>       minItems: 1
>> -    maxItems: 4
>> +    maxItems: 6
>>   
>>     qcom,adsp:
>>       $ref: /schemas/types.yaml#/definitions/phandle
>> @@ -59,6 +60,8 @@ properties:
>>       maxItems: 3
>>       description: Phandle to apps_smmu node with sid mask
>>   
>> +  dma-coherent: true
>> +
>>     power-domains:
>>       maxItems: 1
>>   
>> @@ -241,6 +244,65 @@ allOf:
>>           - iommus
>>           - power-domains
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,sm8650-lpass-cpu
>> +
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 16
>> +          maxItems: 16
> 
> [Severity: Low]
> Should this binding be split into separate schema files (sharing common DAI
> definitions via a common schema ref if needed) instead of adding another
> large per-compatible if-then block to qcom,lpass-cpu.yaml?
> 
> Each SoC variant here has substantially different reg, clock, and interrupt
> counts and names.  Fitting qcom,sm8650-lpass-cpu into the same schema also
> widens the top-level maxItems limits and enables dma-coherent at the top
> level, which relaxes validation for older compatibles like qcom,lpass-cpu
> and qcom,apq8016-lpass-cpu whose if-then blocks only constrain clocks and
> clock-names.
> 

Will follow maintainers preference here
