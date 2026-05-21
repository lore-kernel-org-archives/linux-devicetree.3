Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDECC3630AD
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 05:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779342103; cv=none; b=J2lJEIadN6vrDSAIMhNYGgPucZoCr7G84HynPPSnZHT2HuKXRz9wfEQHf9db/93U/h1RuKovcVZ2I4eapssisJ4Tx0azd6CWhgisaZMAo/3c4QQxuAaVzjf+vQiy6+FD0KeslheskPFi9+JSMEzUZb7OXSHnYuDuAJSzLypoZ30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779342103; c=relaxed/simple;
	bh=ueG9CIBcISCqBEb1OAqJvtwaJvEYYMtuX2Thxf8HsWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CTx02SqRrn0mUQO8s/p8f9gbS0pue5ZaCwNuAT+iMlZAZH3ml9zOKS/LvmxmSCCy6HbVJ8X3YuLIGzc+VyK5gf6GFGfBCdz+AbDpFKeLhqtj2/Sb3O6xJ9ICE1/5TbgVKCmyuI1UVsrXDfRrjozJB5puKvygVBW+MgY/U/+rGkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c3R2cSnX; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c3R2cSnX"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8354461da74so2555450b3a.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 22:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779342099; x=1779946899; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cisA9bq/yMmHLQ79HWa2QEhS3fIz6CIk937mHCPD/uI=;
        b=c3R2cSnXZKly76sd6ck/I9T9r7wnQbY5isezGn3a8W32MsgyaGOX45rgjacKL9uYZ2
         G47e1R3b3fOftEaN28t1BwsLomQJLAKLdI0/7ggqlc/q4HScrnlbv+3qOtRJCgMTKOEY
         LVTxeKK8kUgrf8hSXqwr4ErYb5X9t+lnVRvrhkXTsOBEgv3ggeF5td8sSFASckd2TV5l
         GdFtq3yMYKE5zFZHDB9Q3AyMaOuXps3nPE41SdGREMFk5MwczOkrTV3w1Nejif+ZlQns
         WbKqljQ//cBmouzFTh1jjqFAi8ee6O1aePdW5keP4iegcES4ABV00zbbuzfnbVWGz4GS
         tqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779342099; x=1779946899;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cisA9bq/yMmHLQ79HWa2QEhS3fIz6CIk937mHCPD/uI=;
        b=J6SI4pqQTwFjpRFxPEWBHXLxY2Ksu1Rx5rDNfFA5e0AnAT8yzLVZgoPgrM4MW+424Q
         9IYSi7mRoY/1GcGDW4rbBlF8ty+ybHfZbiO1szmu8ZSFWWIma/dAxIYffO66M/psbAgP
         0Fujagk213Ro0RBRRdU9NUbh72uxmH730JPjgEYQiV6tnhCk2cfmjJzorSi25oOJSrX7
         025S4J/tizabINfVsWAqm9zixMgKZNfw8WzRlnlwM70qUo4mVpycW4iCOL4jnGZ6dEJq
         xNDHUbTN92TixFv9Fn+YD0CzV5Gs/02Vb0QrXonyiCBGb7q5iWNAKbJmfV2ikVRBjumW
         ZIgg==
X-Forwarded-Encrypted: i=1; AFNElJ9f+8CE9gdmlk2fW4vdSXoUGFPB466NK1E6Htcm626xb21jw/pkY9p+4Q8ZwPJi0J5NKcRCES22XZQG@vger.kernel.org
X-Gm-Message-State: AOJu0YzLTuLXPGsjNdV3s1oTl6UhymiKE8uo/3HcP3UUhnnuLohVhO5T
	lhDBv1YRPBVi8bm2aeLtEKBEZCHGjEIjJ0IHZoCjstL8EmfiWJ2SBx0N
X-Gm-Gg: Acq92OH7mHqQEGSTR2cmvCeQzRb8oAacvRYBY0IUP4swypjWzrI17O6kVH/GuBrDVA4
	GWSO9rFBx5e6ZYlKLow2x7IUlCt8RPNeRxsxui8GEI8FfXRfEuBli78ceKIqOlm4aS+EjnYFqem
	kzLscg3q67L1tjIG9kVnSHGfIZn/iMI2WyKzg9O2hJYtHMsIJSmwYli+FOO3p9PwwIfomsYBpqj
	5No9o9BUISIwdA7cBdktnMovV6iTSzNDbrrsB1YF8CvCmMNcS+r3zN3zG3JUmJX2RY8qWUmLNMo
	0Zr/EYynGwtn+PHgLiLpzW1xZYDvQWQsttbweVaYDT0JAKOY6AvK7RC7TTWpbgjB5/Ifn7Vh//S
	kzszErmkpmiH2E7Nv/zhiHz6jHaYcc8lzgeUPfUnwHz0cvs7CtELOxpBQBzj66uE7DtDCFg/A7A
	rKWgYatYkcJO5viWYpVf1/GVIzvUp9t8REzwz2NkbhFHrbgYvBEQ1ywUvA560EJC9SUk5mCjch5
	Hax
X-Received: by 2002:a05:6a00:10d2:b0:838:a932:de26 with SMTP id d2e1a72fcca58-8414ac7b2cemr1502998b3a.1.1779342098580;
        Wed, 20 May 2026 22:41:38 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19f7cd19sm23019794b3a.54.2026.05.20.22.41.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 22:41:37 -0700 (PDT)
Message-ID: <c8f88012-5185-406d-80d4-5e4ce810d967@gmail.com>
Date: Thu, 21 May 2026 13:41:30 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: display: verisilicon, dc: generalize
 for single-output variants
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>, Conor Dooley <conor@kernel.org>
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
 <a112cb8b-21fb-4c33-89a3-14a4feb5e3f9@gmail.com>
 <47a06094541da642cabcb6b7d2f92d5125d365ea.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <47a06094541da642cabcb6b7d2f92d5125d365ea.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/20/2026 12:07 PM, Icenowy Zheng wrote:
> 在 2026-05-20三的 11:06 +0800，Joey Lu写道：
>> On 5/20/2026 12:47 AM, Conor Dooley wrote:
>>> On Tue, May 19, 2026 at 03:26:58PM +0800, Icenowy Zheng wrote:
>>>> 在 2026-05-19二的 13:51 +0800，Joey Lu写道：
>>>>> The existing schema assumes a fixed clock/reset topology and
>>>>> dual-
>>>>> output
>>>>> port structure matching the DC8200 IP block.  This prevents
>>>>> reuse for
>>>>> single-output variants such as the Verisilicon DCU Lite used in
>>>>> the
>>>>> Nuvoton MA35D1 SoC.
>>>>>
>>>>> Rework the schema so that variant-specific constraints are
>>>>> expressed
>>>>> via allOf/if-then-else:
>>>>>
>>>>> - The thead,th1520-dc8200 compatible keeps its existing five-
>>>>> clock,
>>>>>     three-reset, dual-port requirements.
>>>>>
>>>>> - A standalone verisilicon,dc compatible covers IPs whose
>>>>> identity is
>>>>>     discovered entirely through hardware registers; these have
>>>>> flexible
>>>>>     clock and reset counts, a single 'port' property, and no
>>>>> 'ports'
>>>>>     requirement.
>>>>>
>>>>> Changes to the base schema:
>>>>> - Replace the fixed clock/reset items lists with
>>>>> minItems/maxItems
>>>>>     ranges; variant sub-schemas tighten the constraints via if-
>>>>> then-
>>>>> else.
>>>>> - Add a 'port' property (graph.yaml single-port alias)
>>>>> alongside the
>>>>>     existing 'ports', for single-output variants.
>>>>> - Drop the unconditional 'ports' requirement; each if-branch
>>>>> enforces
>>>>>     its own port topology.
>>>>> - Tighten additionalProperties to unevaluatedProperties to
>>>>> allow
>>>>>     per-variant schemas to add their own constraints cleanly.
>>>>> - Fix a stray space in the port@0 description.
>>>>> - Add a DT example for the generic verisilicon,dc compatible
>>>>>     (Nuvoton MA35D1 DCU Lite).
>>>>>
>>>>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>>>>> ---
>>>>>    .../bindings/display/verisilicon,dc.yaml      | 135
>>>>> ++++++++++++++--
>>>>> --
>>>>>    1 file changed, 108 insertions(+), 27 deletions(-)
>>>>>
>>>>> diff --git
>>>>> a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>>>>> b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>>>>> index 9dc35ab973f2..3a814c2e083e 100644
>>>>> ---
>>>>> a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>>>>> +++
>>>>> b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>>>>> @@ -14,10 +14,12 @@ properties:
>>>>>        pattern: "^display@[0-9a-f]+$"
>>>>>    
>>>>>      compatible:
>>>>> -    items:
>>>>> -      - enum:
>>>>> -          - thead,th1520-dc8200
>>>> You should add a fallback compatible here for your SoC, in case
>>>> its
>>>> integration gets something quirky; this compatible is usually not
>>>> consumed by the driver (see how thead,th1520-dc8200 exists in the
>>>> binding but not the driver).
>>> s/fallback compatible/soc-specific compatible/, but yes.
>>> NAK to what's been done here, especially after the discussions on
>>> earlier versions of this verisilicon binding.
>>> pw-bot: changes-requested
>> Understood. I will add `nuvoton,ma35d1-dcu` as the SoC-specific
>> compatible string paired with `verisilicon,dc` as the generic
>> fallback,
>> matching the pattern used for `thead,th1520-dc8200`. The standalone
>> `verisilicon,dc` compatible will be removed from the binding. The
>> driver
> No, please don't remove compatible strings from existing binding, and
> the generic compatible is still used for driver binding.
>
> The SoC-specific compatible is informative here, it needs to exist, but
> it doesn't supersede "verisilicon,dc" .
>
> In addition, the SoC-specific compatible is also used for verification
> of the SoC device tree, which is the reason if clauses exist with
> compatible match and additional constraints (e.g. for the nuvoton DCU
> it's invalid to have a 2nd output port).
Sorry for the misunderstanding. I now see that a standalone generic 
fallback compatible is not preferred here, and that the SoC-specific 
compatible is strictly required for DT validation. I will add 
`nuvoton,ma35d1-dcu` as the SoC-specific compatible string in the 
existing compatible items list, without adding or removing anything else.
>> match table is not changed since hardware detection is done via ID
>> registers.
>>>>> -      - const: verisilicon,dc # DC IPs have discoverable
>>>>> ID/revision
>>>>> registers
>>>>> +    oneOf:
>>>>> +      - items:
>>>>> +          - enum:
>>>>> +              - thead,th1520-dc8200
>>>>> +          - const: verisilicon,dc
>>>>> +      - const: verisilicon,dc  # DC IPs have discoverable
>>>>> ID/revision registers
>>>>>    
>>>>>      reg:
>>>>>        maxItems: 1
>>>>> @@ -26,32 +28,24 @@ properties:
>>>>>        maxItems: 1
>>>>>    
>>>>>      clocks:
>>>>> -    items:
>>>>> -      - description: DC Core clock
>>>>> -      - description: DMA AXI bus clock
>>>>> -      - description: Configuration AHB bus clock
>>>>> -      - description: Pixel clock of output 0
>>>>> -      - description: Pixel clock of output 1
>>>>> +    minItems: 2
>>>>> +    maxItems: 5
>>>>>    
>>>>>      clock-names:
>>>>> -    items:
>>>>> -      - const: core
>>>>> -      - const: axi
>>>>> -      - const: ahb
>>>>> -      - const: pix0
>>>>> -      - const: pix1
>>>>> +    minItems: 2
>>>>> +    maxItems: 5
>>>>>    
>>>>>      resets:
>>>>> -    items:
>>>>> -      - description: DC Core reset
>>>>> -      - description: DMA AXI bus reset
>>>>> -      - description: Configuration AHB bus reset
>>>>> +    minItems: 1
>>>>> +    maxItems: 3
>>>>>    
>>>>>      reset-names:
>>>>> -    items:
>>>>> -      - const: core
>>>>> -      - const: axi
>>>>> -      - const: ahb
>>>>> +    minItems: 1
>>>>> +    maxItems: 3
>>>>> +
>>>>> +  port:
>>>>> +    $ref: /schemas/graph.yaml#/properties/port
>>>>> +    description: Single video output port for single-output
>>>>> variants.
>>>> Maybe the endpoint numbering rule needs a move to here? (I am not
>>>> very
>>>> sure).
>> I will add a description to the `port` property noting that endpoint
>> 0
>> is used for DPI output, which is the only output type for
>> DCUltraLite.
> Please note that DC8000 exists, which is single-port but supports both
> DPI and DP.
To make it simple, the `port` property will not be added. `ports` 
remains the sole port property and is kept in the global `required:` 
list as in the original. The MA35D1 example will use `ports { port@0 { 
... } }`, consistent with how other single-output DT nodes are written 
in the kernel.
>>>>>    
>>>>>      ports:
>>>>>        $ref: /schemas/graph.yaml#/properties/ports
>>>>> @@ -59,7 +53,7 @@ properties:
>>>>>        properties:
>>>>>          port@0:
>>>>>            $ref: /schemas/graph.yaml#/properties/port
>>>>> -        description: The first output channel , endpoint 0
>>>>> should be
>>>>> +        description: The first output channel, endpoint 0
>>>>> should be
>>>>>              used for DPI format output and endpoint 1 should be
>>>>> used
>>>>>              for DP format output.
>>>>>    
>>>>> @@ -75,9 +69,75 @@ required:
>>>>>      - interrupts
>>>>>      - clocks
>>>>>      - clock-names
>>>>> -  - ports
>>>>>    
>>>>> -additionalProperties: false
>>>>> +allOf:
>>>>> +  - if:
>>>>> +      properties:
>>>>> +        compatible:
>>>>> +          contains:
>>>>> +            const: thead,th1520-dc8200
>>>>> +    then:
>>>>> +      properties:
>>>>> +        clocks:
>>>>> +          items:
>>>>> +            - description: DC Core clock
>>>>> +            - description: DMA AXI bus clock
>>>>> +            - description: Configuration AHB bus clock
>>>>> +            - description: Pixel clock of output 0
>>>>> +            - description: Pixel clock of output 1
>>>>> +
>>>>> +        clock-names:
>>>>> +          items:
>>>>> +            - const: core
>>>>> +            - const: axi
>>>>> +            - const: ahb
>>>>> +            - const: pix0
>>>>> +            - const: pix1
>>>>> +
>>>>> +        resets:
>>>>> +          items:
>>>>> +            - description: DC Core reset
>>>>> +            - description: DMA AXI bus reset
>>>>> +            - description: Configuration AHB bus reset
>>>>> +
>>>>> +        reset-names:
>>>>> +          items:
>>>>> +            - const: core
>>>>> +            - const: axi
>>>>> +            - const: ahb
>>>>> +
>>>>> +      required:
>>>>> +        - ports
>>>>> +
>>>>> +    else:
>>>>> +      properties:
>>>>> +        clocks:
>>>>> +          items:
>>>>> +            - description: Bus clock that gates register
>>>>> access
>>>>> +            - description: Pixel clock divider for display
>>>>> timing
>>>> Please don't make compatible-specific description strings for
>>>> individual compatibles, and keep these descriptions outside of
>>>> the if.
>>>> The compatible-specific part should be used to specify what's
>>>> required
>>>> for the specific SoC, for dt validation purpose.
>>>>
>>>> BTW if the clock is both the working clock and bus clock for the
>>>> controller, I suggest listing it twice, except if the IP core is
>>>> provided without a dedicated core clock (in the case I suggest to
>>>> use
>>>> "bus" only).
>>> I agree. If the same clock is provided to two+ ports on the IP,
>>> that
>>> should still be two+ clocks in the devicetree.
>>>
>>>> Here's an example for "listing it twice":
>>>> ```
>>>> clocks = <&clk DCU_GATE>, <&clk DCU_GATE>, <&clk DCUP_DIV>;
>>>> clock-names = "core", "bus", "pix0";
>>>> ```
>>>>
>>>> Well nonetheless the name "core" does not match the description
>>>> "Bus
>>>> clock that gates register access".
>>>>
>>>> Thanks,
>>>> Icenowy
>> Understood. I will remove all description strings from the if/else
>> branches; the if/then clauses will only constrain clock-names and
>> reset-names items (name values only, no descriptions). Regarding
>> clock
> Well I think a required properties list is also needed in the if/then
> clause, to prevent DT's from lacking properties.
Since `ports` is kept in the global `required:` list, neither if/then 
block needs a `required:` entry for port topology. Each if/then only 
constrains clock-names and reset-names for DT validation. The `else` 
branch has been eliminated; each variant has its own independent 
`if/then` in the `allOf` array.
>> naming: DCU_GATE on MA35D1 is a peripheral gate clock without a
>> separate
>> dedicated core working clock, so I will keep "core" as the name and
> Do you mean there's no seperate dedicated bus clock? I find that in the
> clock driver dcu_gate has no parent as bus clocks -- its parent is
> dcu_mux, and dcu_mux's 2 parents are both pll ("epll_div2" and
> "syspll").
>
> Thanks,
> Icenowy
You are right — DCU_GATE has no parent as a bus clock. For this case, I 
prefer to keep "core" as the sole gate clock name alongside "pix0".

Thanks.

Here is what the v3 yaml would look like:

```yaml
compatible:
   items:
     - enum: [nuvoton,ma35d1-dcu, thead,th1520-dc8200]
     - const: verisilicon,dc

properties:
   clocks: minItems: 2, items with descriptions
   resets: minItems: 1, items with descriptions

required:
   [compatible, reg, interrupts, clocks, clock-names, ports]

allOf:
   - if: compatible contains thead,th1520-dc8200
     then:
       clock-names: [core, axi, ahb, pix0, pix1]
       reset-names: [core, axi, ahb]
   - if: compatible contains nuvoton,ma35d1-dcu
     then:
       clock-names: [core, pix0]
       reset-names: [core]
```
>> drop
>> the misleading description "Bus clock that gates register access".
>> The
>> description mismatch was entirely in the if/else strings which are
>> now
>> removed.
>>
>> Thanks.
>>
>>>>> +
>>>>> +        clock-names:
>>>>> +          items:
>>>>> +            - const: core
>>>>> +            - const: pix0
>>>>> +
>>>>> +        resets:
>>>>> +          maxItems: 1
>>>>> +          description:
>>>>> +            Reset line for the display controller.
>>>>> +
>>>>> +        reset-names:
>>>>> +          items:
>>>>> +            - const: core
>>>>> +
>>>>> +      required:
>>>>> +        - port
>>>>> +
>>>>> +      not:
>>>>> +        required:
>>>>> +          - ports
>>>>> +
>>>>> +unevaluatedProperties: false
>>>>>    
>>>>>    examples:
>>>>>      - |
>>>>> @@ -120,3 +180,24 @@ examples:
>>>>>            };
>>>>>          };
>>>>>        };
>>>>> +
>>>>> +  - |
>>>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>>> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
>>>>> +    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
>>>>> +
>>>>> +    display@40260000 {
>>>>> +        compatible = "verisilicon,dc";
>>>>> +        reg = <0x40260000 0x20000>;
>>>>> +        interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
>>>>> +        clocks = <&clk DCU_GATE>, <&clk DCUP_DIV>;
>>>>> +        clock-names = "core", "pix0";
>>>>> +        resets = <&sys MA35D1_RESET_DISP>;
>>>>> +        reset-names = "core";
>>>>> +
>>>>> +        port {
>>>>> +            dpi_out: endpoint {
>>>>> +                remote-endpoint = <&panel_in>;
>>>>> +            };
>>>>> +        };
>>>>> +    };
