Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD6F32A3FF
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 15:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784994097; cv=none; b=DNK7EHveYycwtN1KpYTOGYEr/mVPiz2cSAc4sve90ZLdJM02zveIk7rfE+Op0glhnd5T0JGIpsFvxme1rbg7aJbpoQzmCeEBu9MK6S0YtKdeRENvYsNQRXLkK8cjs7RMdqIycFP6+mPv+VAqBHhTMhLNm61+3NvVcn4HlXgSjqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784994097; c=relaxed/simple;
	bh=C1OqDoF2Ic2qpjsbOvVsRdASzJE/FRUsaUk5PtJgNfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VCYeafjQT4ohG46+Gge+cQ8jmRru3BinYHm1jv6/GEDfnf6OZCL580Y+LGIUPiZhPp4O9XL8/LqM/Audt+G6NzSo6RWHl24v/m+JdLKNQngOEfsRTomsq2ADh+ipXAPYC3GwNmGqx5IHwdeUiAsVIy2UJcjb98EsURAyceqeXfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=fhtZD4pM; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="fhtZD4pM"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-451d8064238so826760fac.3
        for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 08:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784994094; x=1785598894; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1g+FPjHBvtG+Vglz9EY02YKexSYio9rgEmBXTgUptHA=;
        b=fhtZD4pM+PWiKfygIT//0t1kQxdj3TkWEO4a/4blRk6SV4FRSM+1jMFDiIcKDXUFYC
         JLUGjBGadBwGTSK4zDIUigA1RiUrO0qXpz5GP2OCsjX6pOmG9KYTrUpRY/MLPOGXwPU5
         yBkTWsU1Vkt4X2CjBBwf6ekkIMmk2Ymf7cylJQQla6iQzHHfQkjW8gfwQSYdolRIDzfw
         bYakrkAWI9bLZinPQ4VxkTYDeWnvfzTfvXD2UWAroeeQu0hwsJ6msIqYWMajkmcZUg0X
         oG8exLWt/fTKNY5Mc8PNjCF9g8LodQQdGywO9gikjmAxGF2JlnmEKiIWCWqS0KwIZxFN
         EquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784994094; x=1785598894;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1g+FPjHBvtG+Vglz9EY02YKexSYio9rgEmBXTgUptHA=;
        b=l+qK/GOQ/DSLhKClIe3nTgG06Y5TKWwCBSpaJgGduhhrFjjBcVxAG7PQ27PP3k7Zod
         Gys5+odFl3sxTG8bfGotWklntvXy8KLWcA8Klir+LRu/557UbMyJDkMV0XN6f05Bx4ne
         oZmqYANwGpbR8O4nknJvHlZbVClYpcevfsMhJtZPPjcKypWMKIaciOJEapNIrg9vCTLW
         6YzNx+q8QV0r0V64hdtrcq1Y/zE8cwHWR2W1zy4T6u5vzVq93aDmegFYU9u0W8ANd8gi
         xXc7NhEiCzhko4IjarIkVQi4rYMNEkv5O2Xg5w9qdVP2Sqb4q/MDSZHEW1K6dM6o7eSY
         mKRQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro5qWI9AmpgYKy/y4ME0zWxqr41nidvge0bfQ2zjZvccjQg0/L/cC5CzcBLq/cCKqRby8INWvXfUjpR@vger.kernel.org
X-Gm-Message-State: AOJu0Yyja3U3aRZ+7wHrZFCGwTXdlVEJwHYJKSMvwUaO7jq7iUejJ3rd
	suxlqJXUxI+A1JzwlSNrQSnmCcq9koYRmpvTtn33t2uaijIVqpvy7s9mlAleRmo2iohWeMNyre3
	125vi
X-Gm-Gg: AR+sD13P0PPPYAHJcJPWPYdRfPhhEfZUKI9l7vlIDQKfNpYlbrCDKmirqnsI64TZ02K
	7+jSmcvEzlD/0ORT3+PVJXDe2Iru4JqEm89HUnVcIfFY8SJccd780cEPlpgRSziq7ELlitbPoEV
	qjJN9/FpZQ3QWkq3JG2wPdVZrauEjhmlzhioI/eAQ+apnXVjrcO0jryTbTdMfuexhp2Tmm2wHxh
	yg/x9mXLByTBFtPw9uN2yAc7hZXdEbUmuu+AbTJAg57S6TTtAE0sFY/stqXFvhxuBiabNZig9+j
	N+LDtzroh0Z1/0WyZdpEhMwMOHPzO1+OGK6JN0fWddMuQDGsFicYtpzlqCUIbly9cZ3hS59YhSK
	NWRI+2iCPcLhv1FnP2/bpxBegrd8/589roVIgOUbjwU3zOYqQQfE0IRCGjTt66pKUIwHqT/4zax
	JL3AiF8MY7uRGUThQgMJni+TIUQxVFng/llqY2iSOSfeYC2Osb/kOU
X-Received: by 2002:a05:6820:2910:b0:6a6:8f31:5a50 with SMTP id 006d021491bc7-6aaff9382dbmr1997110eaf.5.1784994093892;
        Sat, 25 Jul 2026 08:41:33 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:677a:56dd:37eb:cf53? ([2600:8803:e7e4:500:677a:56dd:37eb:cf53])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45766f16dfcsm10653282fac.7.2026.07.25.08.41.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jul 2026 08:41:32 -0700 (PDT)
Message-ID: <023a4c95-4dd5-4405-bc73-2171a2292f29@baylibre.com>
Date: Sat, 25 Jul 2026 10:41:30 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: iio: dac: add support for mcp47a1
To: Joshua Crofts <joshua.crofts1@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260721-mcp47a1-add-support-v1-0-da045a2567e3@gmail.com>
 <20260721-mcp47a1-add-support-v1-1-da045a2567e3@gmail.com>
 <20260725000439.5ad6f4d1@jic23-huawei> <20260725101208.06f60b70@systembl0wer>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260725101208.06f60b70@systembl0wer>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/25/26 3:12 AM, Joshua Crofts wrote:
> On Sat, 25 Jul 2026 00:04:51 +0100
> Jonathan Cameron <jic23@kernel.org> wrote:
> 
>> On Tue, 21 Jul 2026 20:24:38 +0200
>> Joshua Crofts <joshua.crofts1@gmail.com> wrote:
>>
>>> The Microchip MCP47A1 is a 6-bit volatile Digital-to-Analog converted
>>> which communicates via I2C.
>>>
>>> Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
>>> ---
>>>  .../bindings/iio/dac/microchip,mcp47a1.yaml        | 56 ++++++++++++++++++++++
>>>  MAINTAINERS                                        |  6 +++
>>>  2 files changed, 62 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/iio/dac/microchip,mcp47a1.yaml b/Documentation/devicetree/bindings/iio/dac/microchip,mcp47a1.yaml
>>> new file mode 100644
>>> index 000000000000..3322fca03b3a
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/iio/dac/microchip,mcp47a1.yaml  
>>
>>> +
>>> +examples:
>>> +  - |
>>> +    i2c {
>>> +          #address-cells = <1>;
>>> +          #size-cells = <0>;
>>> +
>>> +          dac@2e {
>>> +              compatible = "microchip,mcp47a1";
>>> +              reg = <0x2e>;
>>> +              vref-supply = <&vref_regulator>;
>>> +              vdd-supply = <&vdd_regulator>;
>>> +          };
>>> +
>>> +          dac@3e {
>>> +              compatible = "microchip,mcp47a1";  
>> Hi Joshua,
>>
>> What is the advantage of the second example?  I'd drop it.
>>
> 
> Hi Jonathan,
> 
> Per the datasheet, the MCP47A1 can have two different I2C slave
> addresses (0x2e and 0x3e), which allows two DACs to share the
> same bus, something I thought would be good to illustrate in the
> example.
> 

I know we haven't done this much historically, but we could make
that more obvious with this instead:

  reg:
    items:
      - enum: [0x2e, 0x3e]

Then the bindings validator would actually check for a valid
address.
