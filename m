Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4317039099A
	for <devicetree@vger.kernel.org>; Sat, 20 Jun 2026 15:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781971078; cv=none; b=uo9WSFAk17f503zZV0pUB0fapmEKfXdIaKNH1sIBrafnH02mJ05MbIm0sGpXrnAw3hsxnRifg1E++wOLDpIxKdahdcH8fkIbwHjnFR+M8hKCS4qDPrLmm1mqAxBV5PxmQz6wn0mL+oA+O+EcmZw0EdMJGNoLDSH47Mhjg2wFLlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781971078; c=relaxed/simple;
	bh=SnUl6nZJxfSQP03DU9uUzt56TPsVlO2EkZ/eB7TD1rk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eBVWR+DwkDzxd6++wGkjrN5FQ7AYRvgaSe7udDHd8CVNKmFHpfbAEZuQx6t8LblP4u3pXD+L/rmwIORh5UWZJNc8pXdsZa/5aW46qSkAXa3sLCohxxet7sEzRCzOOjoeqFNFywaeQ4W7vZA+rdnh6CPVaR0k9voObKmz7OQXk4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=EV1qdZqj; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="EV1qdZqj"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7e6deacafa8so2181158a34.0
        for <devicetree@vger.kernel.org>; Sat, 20 Jun 2026 08:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781971076; x=1782575876; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tjiqg9IV/7gI3LqSgJF+5/50ztX9TOXe4tB+YHLxznw=;
        b=EV1qdZqjceHi8BzVLYqSTW5c7YW6nlC8Ppn9znew7q8d4nF2POjyxGRk0EPAe1Bd4g
         PrYslhPW1uArc5HsaUcvI10dZVaTsaUuay/V/tuvL8430emQzAGzx2dgwML/5lQf3fAl
         bmGATZqPrszInlYqTOe4hDCgJGjSqJ8ts8xlHfVrF3gRSY41pUtXO5WzDWCL9mTN1dAo
         UyX56HPUKhULK60B+KI3QTE27H2TcucW1d/dIrTiuBrv/Nyyh9mVBu9LDLkOnRpZXh10
         x9KjtnNn6AgWmNXBDBGIFWxLOX819Jy6q7fuXkLm1rCXfkhzI8vhIRi7PYuO10+r8rvQ
         /HlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781971076; x=1782575876;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tjiqg9IV/7gI3LqSgJF+5/50ztX9TOXe4tB+YHLxznw=;
        b=VxDC8R1bNlpy0W8Jp/1pGjE2hW5QL71M4bnd8TODGYrHf8jr5sARJ5NCpDP8JRfqEj
         ZbdBBvfZCNU6y42xWNsCO8QUwASpL+nVdLMJPLt88r4+5ETixkUaXMFU/52IlRp2DOBO
         eUokI4Aff4a/YswECmPqbDmVUGy46qytsrx90jslHyZ21RW0SLDhfMgYjIBLw446AM6z
         A2h7uNR8fLg+3xI0owoSgNFp9DFbtAMZZLOQnNGAfOfZW7TlYRh1DiSok3vhgEolfg/F
         nXXI19g8/ngrAk6h50jYEb+kR8rbqXZkYTDRD97tc7vRQiG4lVwndkFl/pUaZvHf7Xq9
         9R6w==
X-Forwarded-Encrypted: i=1; AFNElJ/VeTufRfvr4hye+4J3MTJRQtEU/ZgGGgF64/QLrSl2r8H6WtbYhPrQSh/qGgIvXFySWOWewxqhQ1sF@vger.kernel.org
X-Gm-Message-State: AOJu0YzrAse3jKWaLyiBLoNBJd8Ij6F1+j1QIZHqGiEhWEQlfF8pKHPM
	Ms7JvAnJRqx9ipArNDOeOJOwFhJSg/hG9h/YMsKgOxyQjaG/lGoYQyeGgUr44vcqGN4=
X-Gm-Gg: AfdE7clZa+RR992vzkO9GXMRzukzrH3nH+n4txZpZQqPz8nj0QrMQVm8Mig7ioSXcTZ
	Cj70HJFud2j68v7deOLsSYh+xcNzHSd7DXqy4cwQbwy0JG/Bn+J2N8fMa4vNjnuLrEoDOvpFPCX
	azftNtrIjVD8W8gvjLcmjFG4QMW4H43159Km9/bYzYNKFHBF36+/Lds716cD4yX33RaNec2km+c
	ZtzNMK+QLGF6O6Uv8vJDK4PWqsrX7SLz2V8C39JFDx6IiYFuGswC/66i99eV9C49F999hlzU6qe
	9XuWhadG5/PqiteAoEht9SvF/p0YsMGtx77g29pslnP+EsWbEOZLN8UxpoWpC/HLGdYXma9A5ZC
	jEQUg+ML+Y0X0UfgPo7M56osu7/+wZGqj1WF3+Xsxj2lmG95SPp4WfH251oO9JLHkjWpy/at+sk
	TIuLD1DlFindxPZEkdLsllhkHnPZ61yCcHpWGp3s3vkVYShY9KsqUPPGZ5dvb/xx0=
X-Received: by 2002:a05:6820:2011:b0:69e:a233:6154 with SMTP id 006d021491bc7-6a0d9fb7e9emr5016081eaf.8.1781971076292;
        Sat, 20 Jun 2026 08:57:56 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:3ad0:4082:8242:2d72? ([2600:8803:e7e4:500:3ad0:4082:8242:2d72])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4472ec5fd4csm2267384fac.2.2026.06.20.08.57.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Jun 2026 08:57:56 -0700 (PDT)
Message-ID: <38c5e5eb-2113-4a5c-ad14-348dc7966a1c@baylibre.com>
Date: Sat, 20 Jun 2026 10:57:55 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/3] dt-bindings: iio: adc: Add burn-out current
 properties
To: Kurt Borja <kuurtb@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260618-new-channel-props-v1-0-963c1b5cf40a@gmail.com>
 <20260618-new-channel-props-v1-3-963c1b5cf40a@gmail.com>
 <0831356f-76ff-4eed-befa-7a35ffce921d@baylibre.com>
 <DJD6FJQUX2V7.SZWF8VSKBCPX@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <DJD6FJQUX2V7.SZWF8VSKBCPX@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/19/26 11:46 AM, Kurt Borja wrote:
> On Fri Jun 19, 2026 at 9:28 AM -05, David Lechner wrote:
>> On 6/18/26 7:33 PM, Kurt Borja wrote:
>>> Some ADCs incorporate burn-out current sources that provide current to
>>> the channel's input pins for open-circuit or short-circuit detection.
>>>
>>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>>> ---
>>>  Documentation/devicetree/bindings/iio/adc/adc.yaml | 14 ++++++++++++++
>>>  1 file changed, 14 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/iio/adc/adc.yaml b/Documentation/devicetree/bindings/iio/adc/adc.yaml
>>> index 106b1e317411d5..6b63aac9ac04dd 100644
>>> --- a/Documentation/devicetree/bindings/iio/adc/adc.yaml
>>> +++ b/Documentation/devicetree/bindings/iio/adc/adc.yaml
>>> @@ -106,6 +106,20 @@ properties:
>>>        This array describes the current configuration of the excitation current
>>>        sources or the single matched current for all sources.
>>>  
>>> +  burn-out-current-microamp:
>>> +    description:
>>> +      Burn-out current sources provide current to the channel's input pins for
>>> +      open-circuit or short-circuit detection.
>>> +
>>> +  burn-out-current-polarity:
>>> +    $ref: /schemas/types.yaml#/definitions/string
>>> +    description:
>>> +      Burn-out current sources provide current to the channel's input pins for
>>> +      open-circuit or short-circuit detection.
>>> +    enum:
>>> +      - pull-up
>>> +      - pull-down
>>> +
>>>  anyOf:
>>>    - oneOf:
>>>        - required:
>>>
>>
>> This doesn't really work with chips that just have and enable bit to
>> enable or disable the feature.
> 
> Maybe those devices can use burn-out-current-microamp with a const
> value? Is that okay or should another approach be taken?
> 

Maybe better to just leave this one out of the common file?

