Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5615E3A9612
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 09:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780911763; cv=none; b=jPfs5nYP39CYw4gCe8SowNCcAA5oiq9DXOrC3v/FNP3v1/3EBcwewqcjPJUHvMK0vGzn4oJAkukX6Waxwh/k5gc2r9ol1oPkeqLcyMPYmb97d4YoQHYbrKRyAW+0ldy8rVr1JZYiIjqUw+3t2ZXKWLNaiduYypuet3L3HuhG3VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780911763; c=relaxed/simple;
	bh=vltzLVxrse6gylrYCArZ9MrsY1oyQjqTO12LN6Gs5Dg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KjwZolhJHZuwlgpGVFdyApoMyn5v/lLHZ3rm9akkZqI0Ux+paGgiJEkLw8i1s+T9Uzk/ko00+lZIvfojGa7qf9LdzFAH/Mxh1dIHkf9SObGZyelwtTI1e4xmuT80T+e9r/FXQiQifSn1sj7d2xu3oRHLUc50NiGt/apk8KgZ0p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EucrTqp3; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EucrTqp3"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84232e83ca9so1702764b3a.2
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 02:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780911762; x=1781516562; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K89RrwpcqLo8zDg2OvFefmB2AQCgF8PACyQq7p8WH+I=;
        b=EucrTqp3pLp81A1TqAorG7Hd7G6z6+UUt16s0pLYnZcNJbPgq1P9xHUbsmCW1Zn/KL
         VGXJkebwHM8ObyV8D9g7KayExl3wn2dk6iW/V6tdDdv5IKRQlpvdBJm5I5koW8F6G57i
         pu3pGLEoI4QbKWhOGL9QAMpa2ccorUQ3yPdqubqhPAeNytELCmefpl/v/DU60ER34YSM
         5XM2BVnXXcUZmOH4FN5xjfU8GIZ4+LPZ+BTuYQTUib9b7nh1okd2I4hBp27cAKEvjcwK
         i0CgO1o3wKW4eVNZDwD0ELDbzeEGt+ZfiSaLGJEt6Qd7j5t/1pgI8592CUp4LN3fI6LT
         2S0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780911762; x=1781516562;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K89RrwpcqLo8zDg2OvFefmB2AQCgF8PACyQq7p8WH+I=;
        b=QLTJTTELYd2YdWMjb9Ajw3XsSOhbKtvC4FqnVoTrP0w1milrwHmwG5kOTLTebztJuq
         suq2i1Rt79CQDnmca5OhJkqzpP1GFxW/1wb2N/D1S70llMX+q6lYuoLjwhzd/eBmO/Sp
         CRbxtpeRclHLA3z6GkQGsbtosIYk3oFx1v4pwXt1OFv/jgTcUW+t0DTxCfayS4tXPsn9
         AReyYHriGzCKut1wD1P75xg5YewyJXHHSLTpL/yqzRXQRUKfIRrecZxEQ2g5iDU/2UeB
         P2XXTQ34C57nXAkTeyta2Y7Zfh2ViVghBrKv8wlXlxF9f123aTl3iuQLicJG4voXwQx6
         AwCg==
X-Forwarded-Encrypted: i=1; AFNElJ/jI1HM8jw+Z0VbhTVtfNZ0CkfZZp/BQwCRSgjLKl7PVxpBUfG/c8Yzz8nv75un44cEwPdGyox7Me2W@vger.kernel.org
X-Gm-Message-State: AOJu0YyvH15y/JRhIKW3I8jwLTj8qX5I9Dq5P5s9UwzcmPuhCR+4EjRI
	TAQUIxbgrygzVkiNeei0g4l9LrS3jYG6WjoYfj2GoYrxtmh00pl28+lM
X-Gm-Gg: Acq92OG8vhEQOFcyTY1pUYAb/Yk7UQpFqaUgnS9aven2wTAFfZ6bZGa56VnupJr8MxU
	XtQChLLHViKCjDbxMhkPjR2Ob9xh9pGFrH16oVODxdTjYyQJzQ+1S5RQOdddFIKUQzViGLmBLtL
	7rM/Tk/ytgbQXzThPflc1tq45dzYEfmwUJT2kaQ6Dny4OgkF10tOWHNmYUi6npNCX8gmlLG89C/
	/5zVxrc04E98mvddiYUXtgAbASW4Cujo5VmWBMmDhyvZKa6dMmG92dtWgg91OrZhRkN7z3cgcZK
	v1eRQOaREr1h/p9rM4wGHwpaamKW4txEC3LzlcRwZGDOP/ZOs6rYjkdYzKem+52sXbohoA8JG2B
	EuovdFyDko66hQMGUBcOLTXvlqBzOVS/TYAdzg4xvdXuG058+CDbWdgyRRe1D+zB3teZLoYhhLm
	cDkcJsbAlNRJe1yCUobubgOpAEe12j7aiuEIG/Yn/XQG10imUOyYfN/RJ01JdeEi/vLVbLPch7B
	5VmV10sasSjHyQ=
X-Received: by 2002:a05:6a00:a227:b0:842:5719:455c with SMTP id d2e1a72fcca58-842b106587dmr14714982b3a.25.1780911761597;
        Mon, 08 Jun 2026 02:42:41 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282372868sm19883930b3a.17.2026.06.08.02.42.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:42:41 -0700 (PDT)
Message-ID: <684fde52-569c-4b38-904c-dbb05054634f@gmail.com>
Date: Mon, 8 Jun 2026 17:42:33 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] dt-bindings: display: verisilicon,dc: generalize
 for single-output variants
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260608023237.305036-1-a0987203069@gmail.com>
 <20260608023237.305036-2-a0987203069@gmail.com>
 <a3f6fa4529bff5390dd1beb164d600208dc650a5.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <a3f6fa4529bff5390dd1beb164d600208dc650a5.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/8/2026 2:32 PM, Icenowy Zheng wrote:
> 在 2026-06-08一的 10:32 +0800，Joey Lu写道：
>> The existing schema hard-codes the five-clock/three-reset/dual-port
>> topology of the DC8200 IP block, preventing reuse for single-output
>> variants such as the Verisilicon DCUltraLite used in the Nuvoton
>> MA35D1
>> SoC.
>>
>> Rework the schema so that variant-specific constraints are expressed
>> via
>> allOf/if blocks:
>>
>> - Add nuvoton,ma35d1-dcu to the SoC-specific compatible enum.  The
>>    generic verisilicon,dc fallback remains the driver-binding string.
>> - Relax the top-level clocks/resets definitions to minItems ranges so
>>    the base schema accepts both variants.
>> - Keep ports in the global required list and keep
>> additionalProperties
>>    tightened to unevaluatedProperties.
>> - Add an allOf/if block for thead,th1520-dc8200: five-clock (core,
>> axi,
>>    ahb, pix0, pix1), three-reset (core, axi, ahb).
>> - Add an allOf/if block for nuvoton,ma35d1-dcu: two-clock (core,
>> pix0),
>>    one-reset (core).
>> - Fix a stray space in the port@0 description.
>> - Add a DT example for the Nuvoton MA35D1 DCU Lite using
>> ports/port@0.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   .../bindings/display/verisilicon,dc.yaml      | 103 +++++++++++++++-
>> --
>>   1 file changed, 90 insertions(+), 13 deletions(-)
>>
>> diff --git
>> a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> index 9dc35ab973f2..db0260d874c5 100644
>> --- a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> +++ b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> @@ -17,7 +17,8 @@ properties:
>>       items:
>>         - enum:
>>             - thead,th1520-dc8200
>> -      - const: verisilicon,dc # DC IPs have discoverable ID/revision
>> registers
>> +          - nuvoton,ma35d1-dcu
>> +      - const: verisilicon,dc  # DC IPs have discoverable
>> ID/revision registers
> Ah is an extra space added here, which leads to this hunk looking
> strange?
The extra space was added because `yamllint` reports "too few spaces 
before comment" (warning: comments) when only one space precedes the 
`#`. However, since this constitutes an unrelated whitespace change that 
makes the diff harder to read, I will revert to the original 
single-space form to keep the patch clean.
>>   
>>     reg:
>>       maxItems: 1
>> @@ -26,6 +27,7 @@ properties:
>>       maxItems: 1
>>   
>>     clocks:
>> +    minItems: 2
> Maybe restrictions about the clock count shouldn't be inserted here,
> and technically it's possible that only the pixel clock is controllable
> by Linux (all other clocks are in a fixed configuration).
Understood. I will remove the per-variant clock items descriptions from 
the top-level `clocks:` section and move them into the respective 
allOf/if blocks. The top-level will only carry `minItems`/`maxItems` for 
schema validation range.
>>       items:
>>         - description: DC Core clock
>>         - description: DMA AXI bus clock
>> @@ -34,24 +36,19 @@ properties:
>>         - description: Pixel clock of output 1
>>   
>>     clock-names:
>> -    items:
>> -      - const: core
>> -      - const: axi
>> -      - const: ahb
>> -      - const: pix0
>> -      - const: pix1
> Ah I think the total list should still appear here, and they should be
> corresponding to the descriptions above?
Understood. I will restore the full items list for `clock-names` at the 
top level (all five entries: core, axi, ahb, pix0, pix1) and add 
`minItems` to make it flexible. Per-variant allOf blocks will only 
constrain with `minItems`/`maxItems`.
>> +    minItems: 2
>> +    maxItems: 5
>>   
>>     resets:
>> +    minItems: 1
>>       items:
>>         - description: DC Core reset
>>         - description: DMA AXI bus reset
>>         - description: Configuration AHB bus reset
>>   
>>     reset-names:
>> -    items:
>> -      - const: core
>> -      - const: axi
>> -      - const: ahb
> Ditto here.
Understood. I will restore the full items list for `reset-names` at the 
top level (core, axi, ahb) with `minItems`. Same pattern as clock-names.
>> +    minItems: 1
>> +    maxItems: 3
>>   
>>     ports:
>>       $ref: /schemas/graph.yaml#/properties/ports
>> @@ -59,7 +56,7 @@ properties:
>>       properties:
>>         port@0:
>>           $ref: /schemas/graph.yaml#/properties/port
>> -        description: The first output channel , endpoint 0 should be
>> +        description: The first output channel, endpoint 0 should be
>>             used for DPI format output and endpoint 1 should be used
>>             for DP format output.
>>   
>> @@ -77,7 +74,60 @@ required:
>>     - clock-names
>>     - ports
>>   
>> -additionalProperties: false
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: thead,th1520-dc8200
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 5
>> +          maxItems: 5
>> +
>> +        clock-names:
>> +          items:
>> +            - const: core
>> +            - const: axi
>> +            - const: ahb
>> +            - const: pix0
>> +            - const: pix1
>> +
>> +        resets:
>> +          minItems: 3
>> +          maxItems: 3
>> +
>> +        reset-names:
>> +          items:
>> +            - const: core
>> +            - const: axi
>> +            - const: ahb
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: nuvoton,ma35d1-dcu
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 2
>> +          maxItems: 2
>> +
>> +        clock-names:
>> +          items:
>> +            - const: core
>> +            - const: pix0
>> +
>> +        resets:
> Do we have minItems: 1 here? (The DT schema validator always has some
> quirks that I fail to remember, so I am not sure.)
Yes, I will add `minItems: 1` to `resets:` in the nuvoton block.
>> +          maxItems: 1
>> +
>> +        reset-names:
>> +          items:
>> +            - const: core
>> +
> I think resets should be described as required in both device-specific
> bindings.
>
> Thanks,
> Icenowy

Understood. I will add `required: [resets, reset-names]` inside the 
`then:` block for both thead,th1520-dc8200 and nuvoton,ma35d1-dcu.

Many thanks!

>> +unevaluatedProperties: false
>>   
>>   examples:
>>     - |
>> @@ -120,3 +170,30 @@ examples:
>>           };
>>         };
>>       };
>> +
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
>> +    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
>> +
>> +    display@40260000 {
>> +        compatible = "nuvoton,ma35d1-dcu", "verisilicon,dc";
>> +        reg = <0x40260000 0x20000>;
>> +        interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
>> +        clocks = <&clk DCU_GATE>, <&clk DCUP_DIV>;
>> +        clock-names = "core", "pix0";
>> +        resets = <&sys MA35D1_RESET_DISP>;
>> +        reset-names = "core";
>> +
>> +        ports {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            port@0 {
>> +                reg = <0>;
>> +                dpi_out: endpoint {
>> +                    remote-endpoint = <&panel_in>;
>> +                };
>> +            };
>> +        };
>> +    };
