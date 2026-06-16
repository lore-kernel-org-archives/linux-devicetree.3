Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7622356C6
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 19:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781639701; cv=none; b=N0tRa/1DZKDo59gidAPF6BvA/7FZhNBdJszRDsxS6uHTvkRRZVddZHI8NLFlyn97PLUn9ByHvss6EfEB4bE1CSRGXfA9SzuD7rHJZ61FoMh2lctuaoXIYmVOVk7U2cMthJFJxkVfEEamr9pzsWjvTWb+X/e8MSnb/npuD4sqKe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781639701; c=relaxed/simple;
	bh=qid9DIArPYwfSjkUFRfV4He3p02CnHhDIZb42+sFGlY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q1w0N/RG+Zqs4c5s+B7GjDGPUb2l5ygPEqVFPstKFVUpWiQzpH1BOspEe2is9UeaBhHf68DaEXmeC5BkCL3cCzStw6Qdmvl12GhaqEY1QOGc0WTO4CGVCd0NO+O139NGx7ktnBYAqBOgB9piFC87SjxBRl0D1zPqTo/tw2JbrCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=DeH9AZyR; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="DeH9AZyR"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4864abba33fso167694b6e.0
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 12:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781639697; x=1782244497; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N2+6heM+av1fkrRkycYCoMgCjrDPvZd+1jLwzGQxKvI=;
        b=DeH9AZyRfez1dO7Qs9atrTbpGLDSSuku/PFCJ2Y8FaH+nFC1ypu9KCDyqbN+MRP5KB
         TUnCH+eaYdYYV2hRk4hcpIVOFUpGWXOgXHpOOIIQO0K5EqMjh7EH9YNip2+IL4a+5USI
         +AvkgtWEnMHDIdge6CiJ1ryIheRtJfVckcg7ooZ75h2AxTrI8wTu8HDBui+DN5Kw1shU
         yijPT2RblKcjU6jwaaQVcZEkZCRBvhIiWKWIi4/F5LWZErRNkbrs4CaQkoOEu4Ux5svX
         K5GrM/648oOUWZ4xslqPU6mltU9w591BAY8TPmFefXANV2rN0bvY4PgMDy2GQZSjRLA3
         R97g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781639697; x=1782244497;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N2+6heM+av1fkrRkycYCoMgCjrDPvZd+1jLwzGQxKvI=;
        b=QFbl4gwW/R/rzXiHWyUPLUqnVBiHol19UqO8Oet+Xsj5zgS/iDNNiCQwZOlrTURX/9
         YS0vuXCsB0AspeuwmvJx9kMTQaHXkNxBOQgoJfIbto5is8pZ0uLJfd7aTZSzwoc5NqvA
         vtof0lrvwKQImLweWelsv15xAInfcHyth2t3gHXxGE160bnyglCEuRapwLDxybo/mv3I
         Wo9G+8fzyTeBlCFzvp3wZ1Ofnnye5clewbh2PKtcNkl0PAlCaHNZfc07IllrSlMn32wa
         nwouXp5DdHmZNVB0LpS0r2rr9QCympXdfaGhQ5EJMJV4ydWSkmALFxkP2CcoXWhKbyr+
         9rDA==
X-Forwarded-Encrypted: i=1; AFNElJ9AN+MRuV7yyV6ml0tf1f74Z7C+9HmDf8N1agHNF8WLJ/e1DXi4eYst7E5ZU+UQFjtR9RQLiHe36UrR@vger.kernel.org
X-Gm-Message-State: AOJu0YwyIvvVeNwUEhxBba01/b6VyrLqo7n/gg3IVIKTk1LbSmEIHyrJ
	6nZZmN5Q4N881Qaja6o44Rln/Ff8XBctZYP0gt8Tg/VlJzA0J5o3vwcW/l1ZDP+J/74=
X-Gm-Gg: Acq92OGXty/ZQjnRbd+ah+rRwYH5GH12HW3dAcR+wQcZKTfb02D1Y9Gwlzkd6vgJ44M
	uUdtiJbxz7NWZucWjv58Z56J608S2czP7iDcrpe8iflbxZf5268mgwxqnt/XKgTTxARyLV9gKJV
	09+fbp/MMwnc3Lu3t9QWdHrIxWNxVwsRCgZeSBEwGG06aliS6eDvE+c9/paWMX2KOvWKN3Z189G
	MLhXmCU7TeTlS0Caz/3TnDULPnzx9fVvlJFj9OucZ9NFrGSbTYLPXi3kphHfum6pMGbx0hjYqc9
	c53Wc4wwSm8G5Eg2ypY6rPGX86lXjGzR164cOhftiEfScBw+RFI12oEwiJB1UB+ntkQ161nQkm3
	neNKOB34EubArAzicsC8nw2IASy8D6g54Z1NiuriRj5VwVpjRGx9CQBHlQ6imMSSrknnHlhPxLK
	0vvKwLEzpsQHXTR5iZ1uiIOEzN2ktYVv6sraMNC2GduCv0qM/yATUQyKSe9JO35OjhSlZJjpO67
	w==
X-Received: by 2002:a05:6808:5094:b0:479:fca7:465d with SMTP id 5614622812f47-4894636fa63mr100624b6e.30.1781639697065;
        Tue, 16 Jun 2026 12:54:57 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:28a8:6095:71d2:86eb? ([2600:8803:e7e4:500:28a8:6095:71d2:86eb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e79f451fe7sm7380732a34.0.2026.06.16.12.54.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 12:54:56 -0700 (PDT)
Message-ID: <4bc99611-4bf1-4797-ba31-6f1d7dee1e1e@baylibre.com>
Date: Tue, 16 Jun 2026 14:54:55 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: iio: adc: add ti,ads122c14
To: Conor Dooley <conor@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kurt Borja <kuurtb@gmail.com>,
 Nguyen Minh Tien <zizuzacker@gmail.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260615-iio-adc-ti-ads122c14-v1-0-e6bdadf7cb2b@baylibre.com>
 <20260615-iio-adc-ti-ads122c14-v1-1-e6bdadf7cb2b@baylibre.com>
 <20260616-spoon-ducky-b05e9bf7e999@spud>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260616-spoon-ducky-b05e9bf7e999@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/16/26 11:07 AM, Conor Dooley wrote:
> On Mon, Jun 15, 2026 at 04:59:59PM -0500, David Lechner (TI) wrote:
>> Add new bindings for ti,ads122c14 and similar devices.
>>
>> This is an ADC that is primarily intended for use with temperature
>> sensors. There are a few unusual properties because of this. In
>> particular, the reference voltage source and current output requirements
>> can be different for each measurement, so these are included in the
>> channel bindings.
>>
>> The REFP/REFN reference voltage is usually just connected to a resistor
>> that is being driven by the ADC's current outputs, so there is special
>> property for this case rather than requiring a regulator to be defined
>> to represent that.
>>
>> ti,vref-source is reused from ti,tlv320adcx140.yaml (otherwise might
>> have preferred an enum of strings).
>>
>> Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
>> ---
>>  .../devicetree/bindings/iio/adc/ti,ads112c14.yaml  | 224 +++++++++++++++++++++
>>  MAINTAINERS                                        |   7 +
>>  include/dt-bindings/iio/adc/ti,ads112c14.h         |  11 +
>>  3 files changed, 242 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads112c14.yaml b/Documentation/devicetree/bindings/iio/adc/ti,ads112c14.yaml
>> new file mode 100644
>> index 000000000000..dc7f37cad772
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/adc/ti,ads112c14.yaml
>> @@ -0,0 +1,224 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/iio/adc/ti,ads112c14.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Texas Instruments' ADS112C14 and similar ADC chips
>> +
>> +description: |
>> +  Supports the following Texas Instruments' ADC chips:
>> +  - ADS112C14 (16-bit)
>> +  - ADS122C14 (24-bit)
>> +
>> +  https://www.ti.com/lit/ds/symlink/ads122c14.pdf
>> +
>> +  These chips are primarily designed for use with temperature sensors such as
>> +  RTDs and thermocouples. The channel bindings reflect this in that each channel
>> +  represents the conditions required to make a measurement rather than strictly
>> +  just the physical input channels.
>> +
>> +maintainers:
>> +  - David Lechner <dlechner@baylibre.com>
>> +
>> +unevaluatedProperties: false
> 
> Weird positioning of this.

IIRC, Rob asked that I do it in this order on another binding a while
ago (the reasoning being that it was too far away from properties:
otherwise), so I've done it like this on a few bindings now. It doesn't
make much difference to me though.

> 
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - ti,ads112c14
>> +      - ti,ads122c14
>> +
>> +  reg:
>> +    items:
>> +      - minimum: 0x40
>> +        maximum: 0x47
>> +
>> +  clocks:
>> +    maxItems: 1
>> +    description: Optional external clock connected to GPIO3 pin.
>> +
>> +  avdd-supply: true
>> +  dvdd-supply: true
>> +
>> +  refp-supply: true
>> +  refn-supply: true
>> +
>> +  refp-refn-resistor-ohms:
> 
> Missing prefix here and elsewhere.

I thought we didn't need a prefix when using standard units.


>> +      ti,vref-source:
>> +        description: |
>> +          Indicates the source for the reference voltage for this channel.
>> +          0 - Internal 2.5V reference
>> +          1 - Internal 1.25V reference
>> +          2 - External reference (REFP-REFN)
>> +          3 - AVDD as reference
> 
> My usual complaint here about things you have to make macros for, could
> these just be strings from the get-go?

As in the commit message, this is an existing property name, so I didn't want
to change the type. But I agree that strings are better for this kind of thing
so perhaps I should just use a different property name instead so we can do
it better.

