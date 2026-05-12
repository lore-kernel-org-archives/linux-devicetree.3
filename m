Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA03C47DD57
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 08:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778572934; cv=none; b=B/Qji454Vru8Z8CuCeCaBMShyBFak5n+LNOm9eOf42zsTq6O5NfI7PIDs0JpJUiY5eXM5G+zL8pfn+yF9LnmmQ6CnLpaZf26oFK9qPF/F14iQ8HiJvqjNqqcDLHPyNr1RmuyJ6RtzVprG4UQJlEiCwBxO41HYYSYP/uU8dFd7ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778572934; c=relaxed/simple;
	bh=b6dRpUTTFx8utibbPEQgJwhdE8i+Ax8rrQbd4HR01k4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qPrHErBs1wYwaCrHXG/tJmZUelGitSe/lF1qGAA7GwAxfvm/cDVzxBeV5mXzFDUZT2U1twids3ad8BcGNs25fGJW7j4LMOA6RJTggbmcCIz9FWEtdtL72R+JzCNS3PMUDKyjYezkwYSyJF4Kpra7R6WlgjsndqdTbV5626mUjFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sl6D9ZJi; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sl6D9ZJi"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c8095d7d75bso2140083a12.1
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 01:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778572932; x=1779177732; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AvdMBdFTlgEZ+NgOQJwvclLyoLJxV/JPRMgoqHd4xoY=;
        b=Sl6D9ZJiGifsQMZndVqs1IbtNQMnFxt+ruYKb4Vp5TFKjXZeHGSyVpzPjPaNTUo9FO
         zT8nrUaJ5cNMmv35i5LGXB3M983iV77Je9vHS2S9myHY1dVXwJ0gL6L9HJYXz+RSHeOo
         F2M25wWR7BsrndmMKvlW+iY7sfL4N5rZw+tsyEIikIki0lZVxFC41lQ+Wd5HkJeL+qlL
         sOsQCH2eCSoHiu2B8+bLccPKx9Dd+H4JdetK0WpT2QO2t/PVsMEruiszCxgLPYDV0uUc
         tecadBmj1eKUyqos9aSwmYEwbnYsqZnXybThJ4ZsxUS5u2zvDeCrKyACb4zbx4Znrtak
         OL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778572932; x=1779177732;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AvdMBdFTlgEZ+NgOQJwvclLyoLJxV/JPRMgoqHd4xoY=;
        b=T6AfaT2bnUHBaaGiTHqQOXK9Qaw2PHcf+X3Ynp4lYkw33lZVjmHu9sa+/e4tNF4HRA
         IHGK86QVVutg9CFNC1iCenv8Uh10myL45T3dQghsUP7P5rXOwKJTU19qOasmKmwMlCKa
         aAIJXKjhLpcpJXl3MTnAbJ7jGGo2vl7TT9Xhv8zRzkmheCM7qAW9l67cFRMVPjRzvTaE
         HbBqo9B5EEeARAgsivpKAheejhrpFGR0MVXOaYsx6heRrwnxOng4+lLuaBmtbmMYFeRz
         iwY/Evs0RQ7xjZULyPicKyj0jPqoeSwILbaL/VUbpM6F7XIeOjqt7RxQNzs6Jy0MYVq3
         gwXA==
X-Forwarded-Encrypted: i=1; AFNElJ+TOlcQRGGkeWQkboLCNifV66lWN5ZwW5E9KdBR3A1fOFRQmDlba+96C2F8cdsT0NB+8UI1v4n81hKs@vger.kernel.org
X-Gm-Message-State: AOJu0YxyDpV748/lGOhf8GlxHvtmIHVIz2rtt3TN6AgM2digOhvmHtHh
	kWthht3v89urATFqk41Js2imfUgrUvAVuZrzwLPRJjuj0iWuXcmPiC7j
X-Gm-Gg: Acq92OHqEb0xg904Nx8Bk0ISwvQyiENFIB4xGVlttYABBD3oHTxyfrto4SqXefWuspq
	L865YVomfF36jTE1Ts7g3rM7Dkmt9dWesBRU/FW2fiYo+n2KeMN1uT6vAsL0nP9AQtvK4qUvqbV
	cLTL53XhErEXMSNOayMlKd68K2CkMtp7GW1YjN1KqISau3b4P5bLrkrUfzmau+g71tTvxIRfyqu
	aKZk8qCXdcZQWl/8MLDm6hO9anh0yY8+ItPmZSrV1KjvbWn05qsnYsu3HPkO08zxaR+DOiiEqiT
	LWTEMLRtB4od50kvlR5Z6+Ulwdvz/ERTdKtejGmffL8T1AfSh/odJWUv66tr2OkOwj3IF1n7dxG
	odv/fAtTmR0RGHy6aImB3tm37OaA9tDRw7zhZe5qaoghkOBmDPk3+CS0UF6hWsSRXXS3IGmXi4O
	EotGXBoxdN0K73kdGWpAAZms7M98rbApW88/QqUIhl1w09wyCPZvKLp/WkTRRgHArmXre6USBRk
	Fnl
X-Received: by 2002:a05:6a20:9144:b0:3a3:adea:83ac with SMTP id adf61e73a8af0-3aad44c2583mr14068901637.46.1778572931739;
        Tue, 12 May 2026 01:02:11 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965d36a12sm20537152b3a.27.2026.05.12.01.02.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 01:02:11 -0700 (PDT)
Message-ID: <8904a207-9dd8-4fd3-a0d8-7c688361bea3@gmail.com>
Date: Tue, 12 May 2026 16:02:06 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: display: verisilicon,dc: generalize for
 DCUltra Lite variant
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260511075142.54752-1-a0987203069@gmail.com>
 <20260511075142.54752-2-a0987203069@gmail.com>
 <cb69490652409eb4f07b3ee642d478e1b2e28c5b.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <cb69490652409eb4f07b3ee642d478e1b2e28c5b.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 5/11/2026 5:59 PM, Icenowy Zheng wrote:
> 在 2026-05-11一的 15:51 +0800，Joey Lu写道：
>> Extend the verisilicon,dc base schema to accommodate the Nuvoton
>> MA35D1
>> DCUltra Lite (a previous generation of the DC8000 series) which has a
>> different clock topology, no reset control, and a single output.
>>
>> - Replace the fixed clock/reset item lists with minItems/maxItems
>> ranges
>>    so sub-schemas can enforce variant-specific constraints
>> - Add a 'port' property (single-port alias) alongside the existing
>> 'ports'
>>    for single-output variants
>> - Remove the mandatory 'ports' requirement from the base schema; sub-
>> schemas
>>    shall enforce their own port topology
>> - Add a 'select' stanza so the validator matches any node whose
>> compatible
>>    contains a known Verisilicon DC string, including SoC-specific glue
>> - Relax additionalProperties to allow unevaluatedProperties
>> enforcement in
>>    sub-schemas
>> - Fix a minor whitespace issue in the port@0 description
>>
>> Add nuvoton,ma35d1-dcu.yaml as a sub-schema for the Nuvoton MA35D1
>> DCUltra
>> Lite display controller:
>>
>> The Nuvoton MA35D1 integrates the Verisilicon DCUltra Lite display
>> controller. It is a single-output display controller with a 32-bit
>> RGB (DPI) interface. Unlike the DC8000, it does not have discoverable
>> chip identity registers, does not support the CONFIG_EX commit path,
>> and uses dedicated IRQ status/enable registers at offsets
>> 0x147C/0x1480.
>> The clock topology uses two clocks (bus gate and pixel divider) and
>> does not require explicit reset control from the driver.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   .../bindings/display/nuvoton,ma35d1-dcu.yaml  | 94
>> +++++++++++++++++++
>>   .../bindings/display/verisilicon,dc.yaml      | 64 +++++++------
>>   2 files changed, 131 insertions(+), 27 deletions(-)
>>   create mode 100644
>> Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.yaml
>>
>> diff --git
>> a/Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.yaml
>> b/Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.yaml
>> new file mode 100644
>> index 000000000000..9279004ae27c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/nuvoton,ma35d1-
>> dcu.yaml
>> @@ -0,0 +1,94 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/nuvoton,ma35d1-dcu.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Nuvoton MA35D1 DCUltra Lite display controller
>> +
>> +maintainers:
>> +  - Joey Lu <yclu4@nuvoton.com>
>> +
>> +description:
>> +  The Nuvoton MA35D1 integrates the Verisilicon DCUltra Lite display
>> +  controller. It is a single-output display controller with a 32-bit
>> +  RGB (DPI) interface.
> You'd better write this in verisilicon,dc.yaml with if clauses. See
> Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml for an
> example for a generic IP with different integrations, and how it
> constraints different SoC's integration.
Understood. I'll drop both the separate nuvoton,ma35d1-dcu.yaml
file and the `nuvoton,ma35d1-dcu` compatible string entirely. Since the
chip identity registers are present on the DCUltra Lite (model=0x0,
rev=0x5560, customer=0x305), the MA35D1 DT node will use
`compatible = "verisilicon,dc"` directly. The YAML will use a single
`if/then/else` block in `allOf:` keyed on whether `thead,th1520-dc8200`
is present in the compatible list: the `then` branch enforces DC8200
constraints (5 clocks, 3 resets, `ports` required), and the `else`
branch enforces DCUltra Lite / generic constraints (2 clocks, 1 reset,
`port` required, `ports` forbidden). The Nuvoton MA35D1 example will use
`compatible = "verisilicon,dc"` and fall into the `else` branch.
>> +
>> +select:
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        enum:
>> +          - nuvoton,ma35d1-dcu
>> +  required:
>> +    - compatible
>> +
>> +allOf:
>> +  - $ref: http://devicetree.org/schemas/display/verisilicon,dc.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: nuvoton,ma35d1-dcu
>> +
>> +  reg:
>> +    maxItems: 1
>> +    description:
>> +      Register range of the DCUltra Lite controller. The address
>> space
>> +      is 0x2000 bytes.
> Is it really 0x2000 bytes? The next peripherals in the address space,
> the GC520L 2D GPU, is 0x20000 bytes away from the start of DCU
> registers space.
Good point. The 0x2000 figure is the driver's `max_register`,
not the full hardware block size. I'll remove the description text
claiming "0x2000 bytes" and update the example to use `0x20000` to
match the actual hardware address space.
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: Bus clock that gates register access (DCU_GATE)
>> +      - description: Pixel clock divider for display timing
>> (DCUP_DIV)
>> +
>> +  clock-names:
>> +    items:
>> +      - const: core
>> +      - const: pix0
>> +
>> +  resets:
>> +    maxItems: 1
>> +    description:
>> +      Optional reset for the display controller. The driver does not
>> +      assert or deassert this reset; it may be used by firmware or
>> +      boot loaders to bring the hardware to a clean state.
> Why is there a reset in hardware but not toggled in the software?
The driver will handle the reset in v2. The probe path will call
`devm_reset_control_bulk_get_optional_shared()` unconditionally with all
three names ("core", "axi", "ahb"). Since the MA35D1 DT only provides a
single reset named "core", the "axi" and "ahb" entries will be no-op
handles — optional bulk reset lookup skips absent entries silently.
>> +
>> +  port:
>> +    $ref: /schemas/graph.yaml#/properties/port
>> +    description:
>> +      Output port to the downstream display device (e.g. RGB panel).
>> +      The DCUltra Lite supports a single parallel RGB output.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +  - clock-names
>> +  - port
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
>> +    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
>> +
>> +    display@40260000 {
>> +        compatible = "nuvoton,ma35d1-dcu";
>> +        reg = <0x40260000 0x2000>;
>> +        interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
>> +        clocks = <&clk DCU_GATE>, <&clk DCUP_DIV>;
>> +        clock-names = "core", "pix0";
>> +        resets = <&sys MA35D1_RESET_DISP>;
>> +
>> +        port {
>> +            dpi_out: endpoint {
>> +                remote-endpoint = <&panel_in>;
>> +            };
>> +        };
>> +    };
>> diff --git
>> a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> index 9dc35ab973f2..00884529f8c1 100644
>> --- a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> +++ b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> @@ -9,15 +9,34 @@ title: Verisilicon DC-series display controllers
>>   maintainers:
>>     - Icenowy Zheng <uwu@icenowy.me>
>>   
>> +description:
>> +  Verisilicon DC-series display controllers.
>> +
>> +# Select any node whose compatible contains one of the known
>> Verisilicon DC
>> +# or DC-derived compatible strings, including SoC-specific glue
>> variants.
>> +select:
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        enum:
>> +          - verisilicon,dc
>> +          - thead,th1520-dc8200
>> +          - nuvoton,ma35d1-dcu
>> +  required:
>> +    - compatible
>> +
>>   properties:
>>     $nodename:
>>       pattern: "^display@[0-9a-f]+$"
>>   
>>     compatible:
>> -    items:
>> -      - enum:
>> -          - thead,th1520-dc8200
>> -      - const: verisilicon,dc # DC IPs have discoverable ID/revision
>> registers
>> +    # Enumerated in full so the schema validator can verify any
>> compatible
>> +    # string against this list, including those from child schemas.
>> +    contains:
>> +      enum:
>> +        - verisilicon,dc
>> +        - thead,th1520-dc8200
>> +        - nuvoton,ma35d1-dcu
>>   
>>     reg:
>>       maxItems: 1
>> @@ -26,32 +45,24 @@ properties:
>>       maxItems: 1
>>   
>>     clocks:
>> -    items:
>> -      - description: DC Core clock
>> -      - description: DMA AXI bus clock
>> -      - description: Configuration AHB bus clock
>> -      - description: Pixel clock of output 0
>> -      - description: Pixel clock of output 1
>> +    minItems: 2
>> +    maxItems: 5
>>   
>>     clock-names:
>> -    items:
>> -      - const: core
>> -      - const: axi
>> -      - const: ahb
>> -      - const: pix0
>> -      - const: pix1
>> +    minItems: 2
>> +    maxItems: 5
>>   
>>     resets:
>> -    items:
>> -      - description: DC Core reset
>> -      - description: DMA AXI bus reset
>> -      - description: Configuration AHB bus reset
>> +    minItems: 1
>> +    maxItems: 3
>>   
>>     reset-names:
>> -    items:
>> -      - const: core
>> -      - const: axi
>> -      - const: ahb
>> +    minItems: 1
>> +    maxItems: 3
>> +
>> +  port:
>> +    $ref: /schemas/graph.yaml#/properties/port
>> +    description: Single video output port for single-output
>> variants.
>>   
>>     ports:
>>       $ref: /schemas/graph.yaml#/properties/ports
>> @@ -59,7 +70,7 @@ properties:
>>       properties:
>>         port@0:
>>           $ref: /schemas/graph.yaml#/properties/port
>> -        description: The first output channel , endpoint 0 should be
>> +        description: The first output channel, endpoint 0 should be
>>             used for DPI format output and endpoint 1 should be used
>>             for DP format output.
>>   
>> @@ -75,9 +86,8 @@ required:
>>     - interrupts
>>     - clocks
>>     - clock-names
>> -  - ports
>>   
>> -additionalProperties: false
>> +additionalProperties: true
>>   
>>   examples:
>>     - |
