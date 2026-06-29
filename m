Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F833B8BC5
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782717115; cv=none; b=Y/j8YuoEueLDlwYC6GE13v37OL77amRT2KxG5ONdm6r9DFaaOmv+hwz+ha2g2DGkQpcrPh9jovu4MuZwgV2doUo3Bxq826p1eoJHjPbDvsODXDroa+rU/n+TSYSvq75CgXFI3ztItEJdBFnXNAN3x+du+uk6UqKkbJxef7vfCh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782717115; c=relaxed/simple;
	bh=4xPgIzs1Ct0nCYvo63JBCNqk45nAfIG3AogfSxV3MSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b22hTIUnCm01SAjVTr9i4/a2Ac9if0nxcsXHBv35wl8aCnYyXD+AZKN/mQOve/CFLSfaveR1EVWQ55fod60gYYFuSRfp9+kKzrvrkVtNJYv6GbjyIxDAjj5ypacWiQ3POXFFvWcDWLi4xOPQ+cglOAJVflUvgjxSE1det7Lsf6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n1XRu3xJ; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n1XRu3xJ"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8475eca3a66so767886b3a.2
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 00:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782717113; x=1783321913; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ocU4bbQQvRYUjNRGEheDIX/JjGUc9Z8ZjL6L4LmeVWQ=;
        b=n1XRu3xJ4TlskXVUEZx6N5nscC+IIi1wj6Ofgz0NJFHqkn9LJnyOJ60sj6Qamizzp3
         6Zvl+KX39c3DHnubybUKFVhNqILclFYDYIpcfccaZFpofnHtuWIrI8C0AyQ1SJx+1egy
         74e5+XDZ7cjpsn7xXy5re4x/kuppvl1IbYs624bZloiaU4YUtYMNu4o4zbbYxOhMRFhM
         DrVi20RBt+o72I1Uqc1kftRunzGSMegjLU+lqaQHKyzY+ZmJ1xyDfscCjM0fpIWjN6mc
         j+wr9jLiSX7MulWjqa7WgF1ijXCM7RdAY0TKsU2BM6f4Pei93MXbgwc7of2FtyIRh1aM
         u6Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782717113; x=1783321913;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ocU4bbQQvRYUjNRGEheDIX/JjGUc9Z8ZjL6L4LmeVWQ=;
        b=Bcgsb/V8QGoqaBWR8zACTWaR8tgZFdHYCJd7lLwkVtQOMdxKoGsQC2maH5iWmVkF1S
         cQdANnr+KSAzvZ41BmW1mXWWigeKguykUb4Kv8YYzNXhC4JxpJK15+TxXs96US4asg5z
         b2sgocjSXLxEpj/XRoCnuJrf1LY27RZY+IkGrKW3b+/uZYmA+RDdSJrM0qPN7RykQMQ7
         0Oyhco4LDSxuU3kNUCizDIj82HATyQhICU9HoQXiXEi3FJza5UIjOD6xi99rHkgsv6W1
         p44n6c9WwUELGt7V/1uVIHGTX3ehiwtamjfCNP40dMTXxdncb3MfKqpDVwN4JtNU7h0a
         QwlQ==
X-Forwarded-Encrypted: i=1; AHgh+RrbAQn598k+ixWX4wTaw4DAmZhwuO680z47tKcP94IEn+qa/Ay2m4ooszjm8LHpoKcRyptNprghgVhj@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/m0hgDsLyCaTEhgFdLby7ptjozZ+XdJI4p9vo6UUSxJrVj9X1
	EURyn4TE2kJW25lVEwxa6KULJNlGHyT61ZQTYJS1j0u9sg/HPxTAZHj9
X-Gm-Gg: AfdE7clLTSAd2EXyXiPFkBGglkklJRVMzRShJUtvggY1/8KTDsH7WS0xZl6LI7b4fA2
	RinY41s37PJ1K7j+QQa0QUVmdHAIvFSxI/bbGrtAmnA28jTOySQn7tBt3RUno2wNDFvQhhFQzu4
	vo6W8c0glQR/1PIQO3IuuWKrxN/RTZdANWtkvdgHmpF3SuYvFACDkb4++Hhbhhu9P2lDmHrJQ5z
	C4tc7eHWq2x1TCiwAVNXLVunAM/iSn7gzXb6UeAuvbckA83t9uTT+Vq8FDgUqcxzoBN+Gw/KLwo
	x5+5Z+ZX/HKLm5E4eMVLviExKvkLfQMzIn4AI1g5g5ldgoXdbXOEUq4n/l1wRhoK78ngmGRnzh1
	Z3y5101l5OEOooqKfHIJ0C2qp5D0mKXwkNwM2X1ty4IwjZ3x3D2JfdSC9OIhJ1z2A8Bv9Gp21Kn
	wUwgxlYpIAzqMi1bs5etBY1RFP7qLbMpWO4eJu0v2IfOG4PhvIHpwLfASyleJpmh9y
X-Received: by 2002:a05:6a00:8005:b0:845:d284:9e14 with SMTP id d2e1a72fcca58-845d284a9e5mr8108752b3a.59.1782717113038;
        Mon, 29 Jun 2026 00:11:53 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845ebe987fcsm2596068b3a.39.2026.06.29.00.11.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 00:11:52 -0700 (PDT)
Message-ID: <7e96cc1a-eb60-4eeb-937d-64e83bc35279@gmail.com>
Date: Mon, 29 Jun 2026 15:11:48 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
To: David Lechner <dlechner@baylibre.com>, jic23@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: nuno.sa@analog.com, andy@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20260625110638.38438-1-cwweng.linux@gmail.com>
 <20260625110638.38438-2-cwweng.linux@gmail.com>
 <40485b4e-6585-42a1-9b84-3019328574c5@baylibre.com>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <40485b4e-6585-42a1-9b84-3019328574c5@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi David,

Thanks for the review.

 > Datasheet says there are 4 interrupts.

Yes, the controller has four EOC interrupt outputs, ADINT0 to ADINT3.
The initial driver only uses ADINT0, but the hardware does provide four
interrupt lines.

I will update the binding to allow up to four interrupt entries and
document the order as ADINT0, ADINT1, ADINT2 and ADINT3. The example
will keep a single interrupt entry since that is the only one used by
the initial driver.

 > Should there be an optional vref-supply for the V_REF pin?

Yes, I agree. I will add an optional vref-supply property.

I will also update the driver so that it does not force the external
reference path unconditionally. If vref-supply is present, the driver
will enable it and use it to report the ADC scale. Otherwise, the driver
will use the internal reference path.

 > Should there be a dmas property? Datasheet says it supports PDMA 
transfer.

The hardware does support PDMA, but DMA support is intentionally not
included in this initial upstream version. The initial driver will only
support interrupt-driven direct raw reads, and the MA35D1 PDMA provider
is not upstream yet.

I would prefer to leave dmas/dma-names out of the initial binding and
add them later together with DMA support. Please let me know if you
would prefer optional DMA properties to be described now.

 > I assume 8 is for the internal batter voltage channel? Often, we don't
 > include fixed internal channels like this in the devicetree since they
 > are always the same and don't depend on external wiring.

Correct. Channels 0 to 7 are the external ADC input pins, while channel
8 is the internal VBAT input. I will limit the DT child channel nodes to
external channels 0 to 7.

If VBAT support is added later, it can be exposed by the driver as a
fixed internal channel rather than being described by devicetree.

 > adc.yaml already specifies minItems and maxItems, so we don't need to
 > repeat it.

Since I plan to simplify v2 and drop differential channel support from
the initial submission, I will remove diff-channels from the initial
binding.

Differential input support can be added later once the fixed hardware
pair constraints and signed output handling are implemented in the
driver.

 > This (and reg) are uint32, so don't really need minimum: 0.
 >
 > Also, I assume that 8 is for the internal battery voltage channel,
 > which wouldn't make sense as part of a differential input.

Will fix. The v2 binding will restrict child nodes to external channels
0 to 7 and drop the unnecessary minimum: 0.

Thanks,
Chi-Wen


David Lechner 於 2026/6/28 上午 04:05 寫道:
> On 6/25/26 6:06 AM, Chi-Wen Weng wrote:
>> From: Chi-Wen Weng <cwweng@nuvoton.com>
>>
>> Add devicetree binding for the Enhanced ADC controller found on
>> Nuvoton MA35D1 SoCs.
>>
>> The controller has one register region, one interrupt and one functional
>> clock. ADC inputs are described using standard channel child nodes,
>> including optional differential channel pairs.
>>
>> Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
>> ---
>>   .../bindings/iio/adc/nuvoton,ma35d1-eadc.yaml | 100 ++++++++++++++++++
>>   1 file changed, 100 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
>> new file mode 100644
>> index 000000000000..ae7ad0f7689a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
>> @@ -0,0 +1,100 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/iio/adc/nuvoton,ma35d1-eadc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Nuvoton MA35D1 Enhanced Analog to Digital Converter
>> +
>> +maintainers:
>> +  - Chi-Wen Weng <cwweng@nuvoton.com>
>> +
>> +description: |
>> +  The Nuvoton MA35D1 Enhanced Analog to Digital Converter (EADC) is a
>> +  12-bit ADC controller integrated in the MA35D1 SoC. Each enabled ADC
>> +  input is described by a child channel node.
>> +
>> +properties:
>> +  compatible:
>> +    const: nuvoton,ma35d1-eadc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
> Datasheet says there are 4 interrupts.
>
>> +
>> +  clocks:
>> +    maxItems: 1
> Should there be an optional vref-supply for the V_REF pin?
>
> Should there be a dmas property? Datasheet says it supports
> PDMA transfer.
>
>> +
>> +  '#address-cells':
>> +    const: 1
>> +
>> +  '#size-cells':
>> +    const: 0
>> +
>> +patternProperties:
>> +  '^channel@[0-8]$':
>> +    type: object
>> +    $ref: adc.yaml
>> +    unevaluatedProperties: false
>> +
>> +    properties:
>> +      reg:
>> +        minimum: 0
>> +        maximum: 8
> I assume 8 is for the internal batter voltage channel? Often, we don't
> include fixed internal channels like this in the devicetree since they
> are always the same and don't depend on external wiring.
>
>> +
>> +      diff-channels:
>> +        minItems: 2
>> +        maxItems: 2
> adc.yaml already specifies minItems and maxItems, so we don't need to repeat it.
>
>> +        items:
>> +          minimum: 0
>> +          maximum: 8
> This (and reg) are uint32, so don't really need minimum: 0.
>
> Also, I assume that 8 is for the internal battery voltage channel, which
> wouldn't make sense as part of a differential input.
>
>> +
>> +    required:
>> +      - reg
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +  - '#address-cells'
>> +  - '#size-cells'
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        adc@40430000 {
>> +            compatible = "nuvoton,ma35d1-eadc";
>> +            reg = <0x0 0x40430000 0x0 0x10000>;
>> +            interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
>> +            clocks = <&clk EADC_GATE>;
>> +
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            channel@0 {
>> +                reg = <0>;
>> +            };
>> +
>> +            channel@1 {
>> +                reg = <1>;
>> +            };
>> +
>> +            channel@2 {
>> +                reg = <2>;
>> +                diff-channels = <2 3>;
>> +            };
>> +        };
>> +    };
>> +...
