Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732F63B71A8
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 18:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782498928; cv=none; b=B0g61/XZEVjjn8gYCYhSg+ysb4TIPble0W0WiojIj6ntQsJL02p/I8egd9Hha437goVSHhyRLbAFlrYyCsigrxmQGsR8bwum5y8tMFwTynvsYDwuvhkNJneuIhWHoFewhfYYW6l/ktXE26uRgVTTFSvogwMLkHUbpca2PWNcP/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782498928; c=relaxed/simple;
	bh=dPfHlgQgWfT+hU6VgO6lR7zUegvTyInzXHbdMXw7UNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lJRqB0K8qsmpZr9pe/Lj5z7STPRAcC0vKS9D6sCU3l0An5oOdBgxKzlORxFvRZGokCnAe52pwvezI3I3B+GGySaphs2reI0XD8u2GKEoyH7S8tBs/071W7Nlx/8lDfxjcYMLUqxfZjgPa50alsB4IgPNnOLf/ZpkNlAI/KZNKLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=OlVR12Dq; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="OlVR12Dq"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7e6d2f297f4so711838a34.2
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 11:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782498924; x=1783103724; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J8Kzxi9SsU9PSUvyY7AuuVFjnGlx1l2npBtoEXDb+RU=;
        b=OlVR12Dql92QYjC5bpaCynMWUJ3W1dy26/XomWvWFRmeLweIdSuyEMR038qhbybbTW
         zEA5xFmchT+BY2tA/DnO9kiGNMBNfYRokjazhS56UQAgvsWXJ2xAF9F1nb8GTbZ6ZUrO
         Mi/vT5LnD+2Ms5QK4TOOMR/b2oatrbZGk2mj3GDOciHDivLun7RwKSs0/FmSwOG0oGge
         q11HxtZi1KackdHccM3JyVZUkTXh/k/qCD+9bmfMnnXoE0zMMZlK5sd9rYlbvWp/M694
         1jtkTx43e24O2S7THDVLxvbXiaax6qJIHcgr/2yVsFz7RGNwH2eL1Oel+bzfPF6U6n8d
         KjDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782498924; x=1783103724;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J8Kzxi9SsU9PSUvyY7AuuVFjnGlx1l2npBtoEXDb+RU=;
        b=OWPnEEu4enZpzww7CdBNIjaUySOK3oFr9+l7Jazxs3MIV8KUS8TWyeMCDmVdgrzYYH
         OHIoriqoQxIVst6eY2rNcNu95WmDyyR9jmGPJ1B5P+8+AZmNuu8gqoZJI3evU9LQ9LRx
         OYMSNpN1g/mQacmCEsVm4+YsbSIvLXZmNauhc6Z/pPrivTD5CC3QGESRfkUSeDybI2Vt
         puMldf/7PRDqfSVaSnLCwUcwFKjKbfUEWKaNgLlwfFWdpt0EDn634rSal302esN4FRQB
         zVVGulg+3LIrJTSIq2vvODcUyZiJFeXcjVsNhnFii5OW/Mgmpe8GLBIr5mGzABRGutvm
         3cTg==
X-Forwarded-Encrypted: i=1; AFNElJ8Rc39LwLeSIkzKWrF4qQCsgR4K+xIjzvH64U+A/KB0R1f0sysxb8Ex6rTvvU6lNGB/eqHUiYMtEH3C@vger.kernel.org
X-Gm-Message-State: AOJu0YxSayQXS3WKuI2L09GnEior5Rgyums3HartIRfIe4xLgnoo49zS
	kjHcyDTa3y76D6LWemejxgYSidJLXxWqyQ/z0yTOQve006I1i8vez9u/K2XFMDuTWew=
X-Gm-Gg: AfdE7cn3FMxXJdCRvNHUQffE3NAft+ewNvfevmBfzubctzNjxk1pbp4tBsL5+8i39m7
	S89FPyIiMlO05ZB6wxBVAXrTUCMKmYohlFX96GKKOCUDQ259kO0YYX1PDrQqL+c1PIul8V8KBap
	/KMgGcMQtySvsgCiytzP+Ywx/aChQ/YvEt0d8YbT0tUCBnWm+p1GtGpjXdIsW7qF7oVwxDZba+2
	9DQMPTcOYsenR4zm2wjkdNFV1FqaqAD6sxLiJ6CVcxAb5xU74KVdRTc1bDYQSzt8b97mOTwW0QN
	URdQd52fAyMUBFaOGCTT7yp2SRbEaX7UG02n5fgZFaWUiMuqLz1pa+p1ua6ntB+oV2Z6udRYfQl
	or1xESLOo3luBlqnFGKGakLQfiYBA7y2nDx/UQe1azO6PExSd1lPN5wxVdE1mzVphbfQ23vGA7S
	2i+q7GRcvU9GpCCxxgfgfx0t/swdcR4OfM7YuQsFkN6nLu/4NaD5rnG5xVUKn0+ik=
X-Received: by 2002:a05:6830:2781:b0:7e9:b4d0:53a2 with SMTP id 46e09a7af769-7e9b4d05d30mr1036708a34.27.1782498924389;
        Fri, 26 Jun 2026 11:35:24 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:f1f0:2d9f:2f31:3426? ([2600:8803:e7e4:500:f1f0:2d9f:2f31:3426])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9aa7d5b3asm2176015a34.23.2026.06.26.11.35.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 11:35:23 -0700 (PDT)
Message-ID: <82294468-c4cf-4003-93f1-31a113c79979@baylibre.com>
Date: Fri, 26 Jun 2026 13:35:22 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] dt-bindings: iio: adc: add ti,ads122c14
To: Conor Dooley <conor@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chris Hall <c-hall@ti.com>,
 Patrick Edwards <pedwards@ti.com>, Kurt Borja <kuurtb@gmail.com>,
 Nguyen Minh Tien <zizuzacker@gmail.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260625-iio-adc-ti-ads122c14-v2-0-ceb9b0b561cb@baylibre.com>
 <20260625-iio-adc-ti-ads122c14-v2-5-ceb9b0b561cb@baylibre.com>
 <20260626-rising-legged-dea08bb68bfe@spud>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260626-rising-legged-dea08bb68bfe@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/26/26 11:18 AM, Conor Dooley wrote:
> On Thu, Jun 25, 2026 at 04:55:07PM -0500, David Lechner (TI) wrote:
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
>>
>> v2 changes:
>> * Added ti, vendor prefix when appropriate.
>> * Others are now standardized properties from adc.yaml.
>> * Moved top-level unevaluatedProperties.
>> * Fixed some issues with the channel@ matching and reg property.
>> * Dropped description on bipolar property.
>> * Renamed currnet-chopping to input-channel-rotation.
>> * Drop header file and use string enum instead for reference-sources.
>> * Added burn-out-current-nanoamp property.
>> * Drop allOf: and just use oneOf: directly.
>> * Fix inconsistent indentation in the examples.
>> ---
>>  .../devicetree/bindings/iio/adc/ti,ads112c14.yaml  | 205 +++++++++++++++++++++
>>  MAINTAINERS                                        |   6 +
>>  2 files changed, 211 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads112c14.yaml b/Documentation/devicetree/bindings/iio/adc/ti,ads112c14.yaml
>> new file mode 100644
>> index 000000000000..59ee4d652a08
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/adc/ti,ads112c14.yaml
>> @@ -0,0 +1,205 @@
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
>> +  ti,refp-refn-resistor-ohms:
>> +    description:
>> +      The resistance of the external resistor between REFP and REFN when using
>> +      resistor bridge driven by current outputs for RTD measurements.
>> +
>> +  interrupts:
>> +    minItems: 1
>> +    items:
>> +      - description: FAULT interrupt (GPIO2 pin)
>> +      - description: DRDY interrupt (GPIO3 pin)
>> +
>> +  interrupt-names:
>> +    minItems: 1
>> +    maxItems: 2
>> +    items:
>> +      enum: [fault, drdy]
>> +
>> +  gpio-controller: true
>> +  '#gpio-cells':
>> +    const: 2
>> +
>> +  '#address-cells':
>> +    const: 1
>> +
>> +  '#size-cells':
>> +    const: 0
>> +
>> +patternProperties:
>> +  ^channel@[0-7a-f]$:
> 
> How does this work/what's the intention here?
> 
> 0-7 I get, why a-f but not 8 or 9?

bah, just a typo, not intentional

Should be [0-9a-f] to match maximum: 15 on reg.

> 
>> +    $ref: adc.yaml
>> +
>> +    unevaluatedProperties: false
>> +
>> +    properties:
>> +      reg:
>> +        items:
>> +          - maximum: 15 # arbitrary limit, channel@ can be any combination of AIN0-AIN7
>> +
>> +      single-channel:
>> +        maximum: 7
>> +
>> +      diff-channels:
>> +        items:
>> +          maximum: 7
>> +
>> +      bipolar: true
>> +
>> +      input-channel-rotation: true
>> +
>> +      excitation-channels:
>> +        maxItems: 2
>> +        items:
>> +          maximum: 7
>> +
>> +      excitation-current-nanoamp:
>> +        maxItems: 2
>> +        items:
>> +          enum: [1000, 10000, 20000, 30000, 40000, 50000, 60000, 70000, 80000,
>> +                 90000, 100000, 200000, 300000, 400000, 500000, 600000, 700000,
>> +                 800000, 900000, 1000000]
>> +
>> +      burn-out-current-nanoamp:
>> +        enum: [200, 1000, 10000]
>> +
>> +      reference-sources:
>> +        items:
>> +          - enum: [internal-2.5v, internal-1.25v, external, avdd]
>> +            default: internal-2.5v
>> +
>> +    dependencies:
>> +      excitation-channels: [ excitation-current-nanoamp ]
>> +      excitation-current-nanoamp: [ excitation-channels ]
>> +
>> +    oneOf:
>> +      - required: [ single-channel ]
>> +      - required: [ diff-channels ]
>> +
>> +unevaluatedProperties: false
>> +
>> +required:
>> +  - compatible
> 
> reg?

I thought reg being required by i2c-controller.yaml was already good enough.

https://github.com/devicetree-org/dt-schema/blob/2203c1720f4ebeebd7f8d10e9dc1812993482fab/dtschema/schemas/i2c/i2c-controller.yaml#L219

> 
>> +  - avdd-supply
>> +  - dvdd-supply
>> +
>> +dependencies:
>> +  refn-supply: [ refp-supply ]
>> +
>> +oneOf:
>> +  - required: [ refp-supply ]
>> +  - required: [ "ti,refp-refn-resistor-ohms" ]
>> +  - properties:
>> +      refp-supply: false
>> +      refn-supply: false
>> +      ti,refp-refn-resistor-ohms: false
> 
> I assume you've tested this to make sure it enforces the behaviour that
> you want?


yes

