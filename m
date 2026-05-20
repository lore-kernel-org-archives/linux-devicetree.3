Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16EF32BF4B
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 03:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779246374; cv=none; b=lohfN56wljJilIWEXsLti1azEn49U9P4/u8atzmvqUgqlRKAL4aahhegGWav20S5+YYsN/8cWHz13qmlyRqaZQvScGKqGamY/MGDf77/pisGfG+6j+TOtFCox2QmLyqQTt2baMX+AnAUpqAMW8b8zog6R/vWamHvkB5DKsZ44xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779246374; c=relaxed/simple;
	bh=eTI3XNXXQTOBh/4uNexvqVktSUjK3scMc+xjZAQ9zx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KsJiqXuKCKu8ulsutY4zkZ1RySQlqC5VGrGBCJIXLIlFBP0Qi/SdSFCpaSdSmatzZO6KxtpIx+Q/g/xwTIgyw943DSvv2qkEOieiVfZzi6v3HH9QQs+OydQcSvCukmuWNu2cQApLVfJ8TQ49k91cP5Tkhs8WQObArtZyU+/bxv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ATJMBLSk; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ATJMBLSk"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-369002b26f4so2249290a91.3
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 20:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779246372; x=1779851172; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nIAQ9DaAotLVRz2iB1AFoG5yBrv9qo1aI5uct5Q5rhg=;
        b=ATJMBLSkiTQdu7ShalNt/sjx/fxPqOhIoOjwDPMWOzVWK62Cdz97MUEPNAGIXeUkGi
         Nz1NT9remYdgiTMU99JDr0S52N+n7gEMuJoe9MqIdNU32SGTIr24I/2lgFPwOcZUIAd2
         B5o0r6x9rMWQfW8TMtfpim2CYgiS+XqClCF5N26wcXwZFjjm74VFb52IHuIXETd4vPJM
         8O+ODoSuG1/dd192/AWl+aIDhbSASGvvfa/xwjFZEr5tXh7ISqvU22ipb4gkuJXPhy97
         AimLpnsKbdeJIIr8VzSIiy6f2jftMi+bRJF2qcQeuHs3XT3hUN1TccUSFklrfkX3Dr++
         Kauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779246372; x=1779851172;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nIAQ9DaAotLVRz2iB1AFoG5yBrv9qo1aI5uct5Q5rhg=;
        b=U2UrINZMn7l3a43bGn6dv5vsBPvk19kCjYMfcDByBGN+AI1yLth/4q9fo4EhKQzv7y
         20r03K34biUXQ6jKcr0ZrBBghsJ+cIso1uaFreoEn+4tT1TrAWDtGjJdSpyfmONA1LW9
         E/D7ngVlvpcSb7EUAS+1+vGW47a3v98GAgJf6XR3IdBt7Cl+jQbq20wmVg4y0+H7kFEu
         zw6U/MvoOrlzq8e6SOXX9Un5/g1QcUch4hFAnpG+D7+E5T7i0RtYeesl9DXMSWj3SVUL
         SbSufLD7yZ9AeWh3lVXyh8QX10iRvA0ncPDr4Uz83Ltke7AD/qwh0mTXUdOmYRCg0Tg8
         xMGQ==
X-Forwarded-Encrypted: i=1; AFNElJ/vJZhOHYA8zrtARTXbamiW37suhiyFiHhVUtIqPxvFwUlxqhNLif/9MYmBnywA8+bV+PSb3ZkcV9f6@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+HZ37I2RuShGdrP+mUfa8QPLjE0ulTnB5DKScCyzuegLf9nAz
	qqDRWlTPh7B9OA7b+uX5DFPS8fuAKmm/dMNqUinIVN63mtE28q6S1zJx0ZRmdw==
X-Gm-Gg: Acq92OEZDJZez++bXMRUw/wky5NPQg7oTwipFFonk3NZ60EG1J/esAMie9LU5xiuFtZ
	eOP6uDo1nZ9UcrW+YekZfHw3ujUNNbuZfmxQ+l/oIP9mSXXw9UBDW5Q7S6sXVcfU5tWRRS4Y+wB
	p/91jeKaSw3eT18d2Ke0waXrYRetIGBj4uvdzuwU66SdYft4b5Kj7K4eA6Z15KMzV+tyHdOdxkg
	z070zqkygWixjdTR8so0fUg6B/6FpTRRtAk0X+SJWrdwUWnjKWgXc8Aard40c5rYkozqVLzU9MR
	RlSaFrkgLiAu+I8czRAbFNoNcewRX7JsjW2B/yZQsPPpvPrfBEotro6JdCvO5zEGNsFV8Av+Sa3
	4AP4jvNF8V1bm7lRNyoL0cQ8ekQ5Nj42JYszGw6ZbLge6Vx32c+vB9pNMLOJKR/JFJ0soCZDy+C
	b2k2ep+UNAICXwULfKWRx8+bzVjt6YN/GvDuKQSFZu70N9QloXdxBpO7YYasqvorrzVXXGfPDw4
	UorbVFxu2EBNnA=
X-Received: by 2002:a17:90b:1fce:b0:368:5367:d679 with SMTP id 98e67ed59e1d1-369519cb5d1mr21310800a91.9.1779246371983;
        Tue, 19 May 2026 20:06:11 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369514361b6sm15491821a91.12.2026.05.19.20.06.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 20:06:11 -0700 (PDT)
Message-ID: <a112cb8b-21fb-4c33-89a3-14a4feb5e3f9@gmail.com>
Date: Wed, 20 May 2026 11:06:05 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: display: verisilicon, dc: generalize
 for single-output variants
To: Conor Dooley <conor@kernel.org>, Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, ychuang3@nuvoton.com,
 schung@nuvoton.com, yclu4@nuvoton.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260519055114.1886525-1-a0987203069@gmail.com>
 <20260519055114.1886525-2-a0987203069@gmail.com>
 <a66cc60fe163167e30e42f0b4be996cae1170a5e.camel@iscas.ac.cn>
 <20260519-fretful-blush-1aac18fa1360@spud>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20260519-fretful-blush-1aac18fa1360@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/20/2026 12:47 AM, Conor Dooley wrote:
> On Tue, May 19, 2026 at 03:26:58PM +0800, Icenowy Zheng wrote:
>> 在 2026-05-19二的 13:51 +0800，Joey Lu写道：
>>> The existing schema assumes a fixed clock/reset topology and dual-
>>> output
>>> port structure matching the DC8200 IP block.  This prevents reuse for
>>> single-output variants such as the Verisilicon DCU Lite used in the
>>> Nuvoton MA35D1 SoC.
>>>
>>> Rework the schema so that variant-specific constraints are expressed
>>> via allOf/if-then-else:
>>>
>>> - The thead,th1520-dc8200 compatible keeps its existing five-clock,
>>>    three-reset, dual-port requirements.
>>>
>>> - A standalone verisilicon,dc compatible covers IPs whose identity is
>>>    discovered entirely through hardware registers; these have flexible
>>>    clock and reset counts, a single 'port' property, and no 'ports'
>>>    requirement.
>>>
>>> Changes to the base schema:
>>> - Replace the fixed clock/reset items lists with minItems/maxItems
>>>    ranges; variant sub-schemas tighten the constraints via if-then-
>>> else.
>>> - Add a 'port' property (graph.yaml single-port alias) alongside the
>>>    existing 'ports', for single-output variants.
>>> - Drop the unconditional 'ports' requirement; each if-branch enforces
>>>    its own port topology.
>>> - Tighten additionalProperties to unevaluatedProperties to allow
>>>    per-variant schemas to add their own constraints cleanly.
>>> - Fix a stray space in the port@0 description.
>>> - Add a DT example for the generic verisilicon,dc compatible
>>>    (Nuvoton MA35D1 DCU Lite).
>>>
>>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>>> ---
>>>   .../bindings/display/verisilicon,dc.yaml      | 135 ++++++++++++++--
>>> --
>>>   1 file changed, 108 insertions(+), 27 deletions(-)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>>> b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>>> index 9dc35ab973f2..3a814c2e083e 100644
>>> --- a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>>> +++ b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>>> @@ -14,10 +14,12 @@ properties:
>>>       pattern: "^display@[0-9a-f]+$"
>>>   
>>>     compatible:
>>> -    items:
>>> -      - enum:
>>> -          - thead,th1520-dc8200
>> You should add a fallback compatible here for your SoC, in case its
>> integration gets something quirky; this compatible is usually not
>> consumed by the driver (see how thead,th1520-dc8200 exists in the
>> binding but not the driver).
> s/fallback compatible/soc-specific compatible/, but yes.
> NAK to what's been done here, especially after the discussions on
> earlier versions of this verisilicon binding.
> pw-bot: changes-requested
Understood. I will add `nuvoton,ma35d1-dcu` as the SoC-specific 
compatible string paired with `verisilicon,dc` as the generic fallback, 
matching the pattern used for `thead,th1520-dc8200`. The standalone 
`verisilicon,dc` compatible will be removed from the binding. The driver 
match table is not changed since hardware detection is done via ID 
registers.
>>> -      - const: verisilicon,dc # DC IPs have discoverable ID/revision
>>> registers
>>> +    oneOf:
>>> +      - items:
>>> +          - enum:
>>> +              - thead,th1520-dc8200
>>> +          - const: verisilicon,dc
>>> +      - const: verisilicon,dc  # DC IPs have discoverable
>>> ID/revision registers
>>>   
>>>     reg:
>>>       maxItems: 1
>>> @@ -26,32 +28,24 @@ properties:
>>>       maxItems: 1
>>>   
>>>     clocks:
>>> -    items:
>>> -      - description: DC Core clock
>>> -      - description: DMA AXI bus clock
>>> -      - description: Configuration AHB bus clock
>>> -      - description: Pixel clock of output 0
>>> -      - description: Pixel clock of output 1
>>> +    minItems: 2
>>> +    maxItems: 5
>>>   
>>>     clock-names:
>>> -    items:
>>> -      - const: core
>>> -      - const: axi
>>> -      - const: ahb
>>> -      - const: pix0
>>> -      - const: pix1
>>> +    minItems: 2
>>> +    maxItems: 5
>>>   
>>>     resets:
>>> -    items:
>>> -      - description: DC Core reset
>>> -      - description: DMA AXI bus reset
>>> -      - description: Configuration AHB bus reset
>>> +    minItems: 1
>>> +    maxItems: 3
>>>   
>>>     reset-names:
>>> -    items:
>>> -      - const: core
>>> -      - const: axi
>>> -      - const: ahb
>>> +    minItems: 1
>>> +    maxItems: 3
>>> +
>>> +  port:
>>> +    $ref: /schemas/graph.yaml#/properties/port
>>> +    description: Single video output port for single-output
>>> variants.
>> Maybe the endpoint numbering rule needs a move to here? (I am not very
>> sure).
I will add a description to the `port` property noting that endpoint 0 
is used for DPI output, which is the only output type for DCUltraLite.
>>>   
>>>     ports:
>>>       $ref: /schemas/graph.yaml#/properties/ports
>>> @@ -59,7 +53,7 @@ properties:
>>>       properties:
>>>         port@0:
>>>           $ref: /schemas/graph.yaml#/properties/port
>>> -        description: The first output channel , endpoint 0 should be
>>> +        description: The first output channel, endpoint 0 should be
>>>             used for DPI format output and endpoint 1 should be used
>>>             for DP format output.
>>>   
>>> @@ -75,9 +69,75 @@ required:
>>>     - interrupts
>>>     - clocks
>>>     - clock-names
>>> -  - ports
>>>   
>>> -additionalProperties: false
>>> +allOf:
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: thead,th1520-dc8200
>>> +    then:
>>> +      properties:
>>> +        clocks:
>>> +          items:
>>> +            - description: DC Core clock
>>> +            - description: DMA AXI bus clock
>>> +            - description: Configuration AHB bus clock
>>> +            - description: Pixel clock of output 0
>>> +            - description: Pixel clock of output 1
>>> +
>>> +        clock-names:
>>> +          items:
>>> +            - const: core
>>> +            - const: axi
>>> +            - const: ahb
>>> +            - const: pix0
>>> +            - const: pix1
>>> +
>>> +        resets:
>>> +          items:
>>> +            - description: DC Core reset
>>> +            - description: DMA AXI bus reset
>>> +            - description: Configuration AHB bus reset
>>> +
>>> +        reset-names:
>>> +          items:
>>> +            - const: core
>>> +            - const: axi
>>> +            - const: ahb
>>> +
>>> +      required:
>>> +        - ports
>>> +
>>> +    else:
>>> +      properties:
>>> +        clocks:
>>> +          items:
>>> +            - description: Bus clock that gates register access
>>> +            - description: Pixel clock divider for display timing
>> Please don't make compatible-specific description strings for
>> individual compatibles, and keep these descriptions outside of the if.
>> The compatible-specific part should be used to specify what's required
>> for the specific SoC, for dt validation purpose.
>>
>> BTW if the clock is both the working clock and bus clock for the
>> controller, I suggest listing it twice, except if the IP core is
>> provided without a dedicated core clock (in the case I suggest to use
>> "bus" only).
> I agree. If the same clock is provided to two+ ports on the IP, that
> should still be two+ clocks in the devicetree.
>
>> Here's an example for "listing it twice":
>> ```
>> clocks = <&clk DCU_GATE>, <&clk DCU_GATE>, <&clk DCUP_DIV>;
>> clock-names = "core", "bus", "pix0";
>> ```
>>
>> Well nonetheless the name "core" does not match the description "Bus
>> clock that gates register access".
>>
>> Thanks,
>> Icenowy

Understood. I will remove all description strings from the if/else 
branches; the if/then clauses will only constrain clock-names and 
reset-names items (name values only, no descriptions). Regarding clock 
naming: DCU_GATE on MA35D1 is a peripheral gate clock without a separate 
dedicated core working clock, so I will keep "core" as the name and drop 
the misleading description "Bus clock that gates register access". The 
description mismatch was entirely in the if/else strings which are now 
removed.

Thanks.

>>
>>> +
>>> +        clock-names:
>>> +          items:
>>> +            - const: core
>>> +            - const: pix0
>>> +
>>> +        resets:
>>> +          maxItems: 1
>>> +          description:
>>> +            Reset line for the display controller.
>>> +
>>> +        reset-names:
>>> +          items:
>>> +            - const: core
>>> +
>>> +      required:
>>> +        - port
>>> +
>>> +      not:
>>> +        required:
>>> +          - ports
>>> +
>>> +unevaluatedProperties: false
>>>   
>>>   examples:
>>>     - |
>>> @@ -120,3 +180,24 @@ examples:
>>>           };
>>>         };
>>>       };
>>> +
>>> +  - |
>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
>>> +    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
>>> +
>>> +    display@40260000 {
>>> +        compatible = "verisilicon,dc";
>>> +        reg = <0x40260000 0x20000>;
>>> +        interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
>>> +        clocks = <&clk DCU_GATE>, <&clk DCUP_DIV>;
>>> +        clock-names = "core", "pix0";
>>> +        resets = <&sys MA35D1_RESET_DISP>;
>>> +        reset-names = "core";
>>> +
>>> +        port {
>>> +            dpi_out: endpoint {
>>> +                remote-endpoint = <&panel_in>;
>>> +            };
>>> +        };
>>> +    };
