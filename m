Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715583AFB1F
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 09:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780911846; cv=none; b=CivYZAIMlisWEr0+BnpH7oangIsPtb5J+wrbOQSY0j+KK289KBZhWOrklF31t+db1awKD/TKVG7ekbVkBkjfxjlmTyTBDEU4+zaD+gFemO2nPJ1TZKXH4LO+AzkLe0OGAU4mIM3k3VyNssSjiLKm07UmSRD/bl122Q6ssN6psrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780911846; c=relaxed/simple;
	bh=wGRmDcPn91MDcNEgsHqWQMi/4xSNtjEefRMkhL3O9nU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E1VoYhl6v42XMvevb4pPSMbXBnwO+ARVtLMjJDpLV5fDH8lnvd4AE9RIE6wU3irgIcCA1TQcBsmjcOpCWrQAiJDK0LOkKxo4FWXlD+ehY670h/UHtP+kILJG8G79I4PNKp4GwO8cGzyG9cCXodzZaM9irPEEQJPNUvSQXGjgXLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IEeJcLqK; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IEeJcLqK"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c85893bce34so1550679a12.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 02:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780911845; x=1781516645; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QdqtVwTNX0imLywa7I0ecwdu4Le2YQgpibN80cjQUTg=;
        b=IEeJcLqKdg2VkAF1vPMM5oPdrVX1IQ/4rH91376XDkOAYWintDrW25StCaT+N6FFhZ
         si4gwDZIfTuuHu2PjqnJoBNK0LPHzce1DgTNv/XURih8cQi7c4wiBGlKDoDMBDiy3vdp
         w+9kDITCJbZ4Fx0rpx3glqQm4zrR71fqHuEtzLbXDdfH4pa8/+8r4Qs79RhQG7XBwJ6I
         svBJe0veC1Mu/2sib9Fv/9GZjidXWK14ZROYYhd3diXSOZoQVAvaGyzGjmugWc9MnVN0
         4QHfYJSGIRt4D24XYH4yKU4qFNKZJK43pYSTVTbfAv0Hcs7UNqSi1tdrgciYjj0lrpch
         aSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780911845; x=1781516645;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QdqtVwTNX0imLywa7I0ecwdu4Le2YQgpibN80cjQUTg=;
        b=DybhU7E+ydzHPZs00Dz2oZy8KCSbRHOAR+ka2C/7o0GRKbKpUEa5v2/CZchoTWU04V
         e/e8FW4Ww/LeBaTwIk+OfrTjrsTvMkvZQzygKoetEm2K1MUTur4/c9Co5B0FTtTbmYg6
         +fm+S9azP72NuGcUCMoTdwnem18xDrgdNb1GggTvzwHFjHaFwA+IA4bRP1ufgUrysYJe
         kHz68woZLgkaYf80iCOoDNV+yx1klSKggg4biAbwvGD/Zs74qg4loWfVcFR0vnQ28cnm
         bveHIMDrBNMaoIUIoplmWpifR1ONCrNx686e4h4vYA/AD0alFhG/JZTj4IPZeWqDtmjZ
         DigA==
X-Forwarded-Encrypted: i=1; AFNElJ+tLVR5cVS9eEGOvCar3b3JyRkpMH3UJgwmfRFmtsUenlCURAiaIW3vuvCZ6HCvtqeSdD0gpu3kIjU1@vger.kernel.org
X-Gm-Message-State: AOJu0YwIosP9noo7hV3MdrfYZpCwm+uu0Kbi3FWZBCLFZXZLDBwHHGCy
	5dWxFdpfTzUwloI4KY/NrTzkcZeHS8IQSWYEDcYCJ93FayFb/F8Ja04f
X-Gm-Gg: Acq92OFMiGWxu3l3d/fSTNd2pTIL9o3rphR5kkIpH1z2Iixrxd2WC6M1B/daZyyhPPo
	rwTbqcsmUYImD4f8eSGpWbcuBJKAmJKxPPcOgxbmVxlwJcQMurVRMUvL+iB9nAHCmM0ZXrFGZ6f
	a0prmLF8PARpFsKm9IGSjIm6EsekN+U+4mU6ovZ+GgEYQ2ygXlZ0ZXozZmjgmj3JFz+1ZqV0rzz
	CNUg20jqbscNWklJl/uDiFjZMfDaF0uJ1XXcfjsYOs7gKEamNLFa/MVf+UqZn48mOtVmFc+/gA9
	mo7mmWNDAMTxzIJeSycrW91/uOmXbthq73aQekpTumJZrbLbuHRM94MVLVyY04pqgx3knIh9c3O
	Kl38J+YPa6okqyllqiB7NzWAdWo4hMhg4RNlEfFpmeL1R2uKaoeqotb3LmzU1QxH1Vz/a6eZLaf
	LxMf7Fx9h+PF1F5nzI1g4Z9HtQI3kbjQmSE45ipsqtQYdIMynynOupDE+bz3rAFrmvbPPckMnce
	unKkhj8mvrGLjA=
X-Received: by 2002:a05:6a21:700e:b0:39b:f026:6f8d with SMTP id adf61e73a8af0-3b4cd09b5a1mr17772625637.43.1780911844599;
        Mon, 08 Jun 2026 02:44:04 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0bdb98sm14220666a12.31.2026.06.08.02.44.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:44:04 -0700 (PDT)
Message-ID: <fb9c51bb-5e17-4e62-bfab-efc648cff4d6@gmail.com>
Date: Mon, 8 Jun 2026 17:44:00 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] dt-bindings: display: verisilicon,dc: generalize
 for single-output variants
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: zhengxingda@iscas.ac.cn, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260608023237.305036-1-a0987203069@gmail.com>
 <20260608023237.305036-2-a0987203069@gmail.com>
 <20260608-emotional-rapid-woodlouse-61f7b9@quoll>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20260608-emotional-rapid-woodlouse-61f7b9@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/8/2026 4:00 PM, Krzysztof Kozlowski wrote:
> On Mon, Jun 08, 2026 at 10:32:33AM +0800, Joey Lu wrote:
>> The existing schema hard-codes the five-clock/three-reset/dual-port
>> topology of the DC8200 IP block, preventing reuse for single-output
>> variants such as the Verisilicon DCUltraLite used in the Nuvoton MA35D1
>> SoC.
>>
>> Rework the schema so that variant-specific constraints are expressed via
>> allOf/if blocks:
>>
>> - Add nuvoton,ma35d1-dcu to the SoC-specific compatible enum.  The
>>    generic verisilicon,dc fallback remains the driver-binding string.
>> - Relax the top-level clocks/resets definitions to minItems ranges so
>>    the base schema accepts both variants.
>> - Keep ports in the global required list and keep additionalProperties
>>    tightened to unevaluatedProperties.
>> - Add an allOf/if block for thead,th1520-dc8200: five-clock (core, axi,
>>    ahb, pix0, pix1), three-reset (core, axi, ahb).
>> - Add an allOf/if block for nuvoton,ma35d1-dcu: two-clock (core, pix0),
>>    one-reset (core).
>> - Fix a stray space in the port@0 description.
>> - Add a DT example for the Nuvoton MA35D1 DCU Lite using ports/port@0.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   .../bindings/display/verisilicon,dc.yaml      | 103 +++++++++++++++---
>>   1 file changed, 90 insertions(+), 13 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> index 9dc35ab973f2..db0260d874c5 100644
>> --- a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> +++ b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> @@ -17,7 +17,8 @@ properties:
>>       items:
>>         - enum:
>>             - thead,th1520-dc8200
>> -      - const: verisilicon,dc # DC IPs have discoverable ID/revision registers
>> +          - nuvoton,ma35d1-dcu
>> +      - const: verisilicon,dc  # DC IPs have discoverable ID/revision registers
> Why do you need to change indentation? Why introducing irrelevant
> changes to the diff?
The extra space was introduced to satisfy `yamllint`'s "too few spaces 
before comment" warning, which requires two spaces before an inline `#`. 
Since this is an unrelated change that pollutes the diff, I will revert 
it to the original single-space form.
>>   
>>     reg:
>>       maxItems: 1
>> @@ -26,6 +27,7 @@ properties:
>>       maxItems: 1
>>   
>>     clocks:
>> +    minItems: 2
>>       items:
>>         - description: DC Core clock
>>         - description: DMA AXI bus clock
> That's not true anymore. In such case the list should also be defined
> per variant and here only min/maxItems.
>
Understood. I will remove the `items:` description list from the 
top-level `clocks:` and keep only `minItems`/`maxItems`. The per-variant 
items descriptions will be moved into the allOf/if blocks.
>> @@ -34,24 +36,19 @@ properties:
>>         - description: Pixel clock of output 1
>>   
>>     clock-names:
>> -    items:
>> -      - const: core
>> -      - const: axi
>> -      - const: ahb
>> -      - const: pix0
>> -      - const: pix1
>> +    minItems: 2
>> +    maxItems: 5
>>   
>>     resets:
>> +    minItems: 1
>>       items:
>>         - description: DC Core reset
>>         - description: DMA AXI bus reset
>>         - description: Configuration AHB bus reset
>>   
>>     reset-names:
>> -    items:
>> -      - const: core
>> -      - const: axi
>> -      - const: ahb
> This stays, with minItems. Variants only need min/maxItems
>
Understood. I will restore the top-level `clock-names` and `reset-names` 
items lists and add `minItems` to each. The per-variant allOf blocks 
will only carry `minItems`/`maxItems`.
>
>> +    minItems: 1
>> +    maxItems: 3
>>   
>>     ports:
>>       $ref: /schemas/graph.yaml#/properties/ports
>> @@ -59,7 +56,7 @@ properties:
>>       properties:
>>         port@0:
>>           $ref: /schemas/graph.yaml#/properties/port
>> -        description: The first output channel , endpoint 0 should be
>> +        description: The first output channel, endpoint 0 should be
>>             used for DPI format output and endpoint 1 should be used
>>             for DP format output.
>>   
>> @@ -77,7 +74,60 @@ required:
>>     - clock-names
>>     - ports
>>   
>> -additionalProperties: false
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: thead,th1520-dc8200
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 5
>> +          maxItems: 5
>> +
>> +        clock-names:
>> +          items:
>> +            - const: core
>> +            - const: axi
>> +            - const: ahb
>> +            - const: pix0
>> +            - const: pix1
>> +
>> +        resets:
>> +          minItems: 3
>> +          maxItems: 3
>> +
>> +        reset-names:
> minItems: 3
Understood. I will add `minItems: 3` to `reset-names` in the 
thead,th1520-dc8200 block.
>> +          items:
>> +            - const: core
>> +            - const: axi
>> +            - const: ahb
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: nuvoton,ma35d1-dcu
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 2
>> +          maxItems: 2
>> +
>> +        clock-names:
>> +          items:
>> +            - const: core
>> +            - const: pix0
>> +
>> +        resets:
>> +          maxItems: 1
>> +
>> +        reset-names:
> maxItems: 1
Understood. I will add `maxItems: 1` to `reset-names` in the nuvoton block.
>> +          items:
>> +            - const: core
>> +
>> +unevaluatedProperties: false
> Stop making random changes to the binding.
>
> Best regards,
> Krzysztof

Understood. I will revert to `additionalProperties: false` as in the 
original binding.

Many thanks!

