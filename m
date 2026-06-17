Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7D8395AD0
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781691911; cv=none; b=hfy1OciLupjA5vIYNNmrHeWIp6Y06T/rCqvTNsIiKyn4ENkPQq7UfaWqq7G3Ss5Ck8FfAK8gqyV5v/lgUKbS/B2StrONVAsVzb66QjbJ9zzJ52j9GNnKYOGv3lsG/jw1knyxCIFFbJJKic8NdCjgqxIS1k/y/srN6Odfy66Noas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781691911; c=relaxed/simple;
	bh=4x4RSj4SNmBnyxaoUtN1jRk/xA8qPv6kbb0oxeQhiLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q/vYanWhfGzBZkDi/sRJ7Hslw5qMcB8K7ME418aeFVw7cqoXV/HBGeFF2xx0eph1kVgvOTdOs8V1HFXSMk2TTZembljmQ9kYIvgYfQ6XnnZABsu37uI28jdvGsjXnnweJUcusbOIe15AgeV7YRzg+lhfYUemb9hjrjoG/Tn4DX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S4Gao8jO; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S4Gao8jO"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c6be9cd7afso2333385ad.1
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 03:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781691908; x=1782296708; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VbVg/KwHCVhdvL9LHCxz6CTvTzl761Uhp31GttVosv0=;
        b=S4Gao8jO++UhlwDK1nB2M3Gg7FkpP31ZOG7GEERNRqQXHpY+Ah/oQ6ooJRPQ5AptrB
         RHZ3fPLaaUVxlvAfq63HrZD3vudMUfUGfNzKx2mdYWBivti2KrpacwBXamKfuoM76N6m
         qdxgUgxaXwQthXI6VJy2kZvHEaRwbdQojb/MiFM9xLG2Ek6P7PCG8vut3pAY4P1ARRFo
         CPxJffBT22nHqJE18GnQlGq2LxvD3kde4yJBVJHQwWIXUnFKMfVMjEOo/Hd47A3Yn+2L
         N5iaP5vEK9p8hKPYC8zf3MfFK3Gsjt+pf8Jn3AvHe864qtqX2bc+bPJFkeRDPB4H7oZ+
         IkZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781691908; x=1782296708;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VbVg/KwHCVhdvL9LHCxz6CTvTzl761Uhp31GttVosv0=;
        b=CEshoePlKEBU6bG+FK9/YQIWKMyiym6pBHAcMKtRoT58PjkznbohUB96hmFmna3YGY
         ZroAivwDeERq1od+am/BA/I4kewDVcfi+siKrCMCiUEtyCI36xz6lR+4ouhw1y9xAsib
         qzydZiqFiy+nYxS1Sg7AW9k/DmA5PFBSdQtlYr4B5wIuaBuUP0rWPg2KQckZerfxyYg+
         lRn64EaFZ1+gogS2beJq5UgA7sB41v9cncUNN46Acac1O4zkox/pwutkxo9lGpav+St4
         qaKA6Z83Fa5rSXJi9/a2nij+fyChRlnE8jftG1cbuq74MWbD60eBy5yfvbN4ZxcSdcQ5
         QSGA==
X-Forwarded-Encrypted: i=1; AFNElJ95fGSeQ8mgW+bAbdet+BQrCRV6U6Z2aUKA7jClvLKQ6UWYVbIAzUoLGpdLnWg7rtbSRyyBN73sVmFc@vger.kernel.org
X-Gm-Message-State: AOJu0YyEhRJxH7QETJ0u2qgZB/P3cGwTJ8ohVgXCKDHZR3m9E9/eyeTp
	V4cxJMhVEAp7uip6UWYF/TGKLFWIJIHGTNF9MigDRTxFCPL0gpPr1lIb
X-Gm-Gg: AfdE7cmGlx9UFFEYT5oLqdViK4xLztH6Bp0wnKg0W6CApki3FspJpGuYybAXOZudK61
	uYcn3eVz6Yyzg93LcnfEhu9pCYDGoDl1BvfbS5rXjwaSEHPKiWaE5In7xPkugomB/BXEevdwCz5
	Uqohn731XhVhM04++rfMIred2Ftxvner8Uatbw1XbLqEp2d8WC6LNjI8KqrlomxygwIfCnlIvEY
	KNBo3XtwNROP691ncS1Lm9QFIUAxNZ+lRXGkSX6OsUMj8A8px6dAbO2WBzyOPC5AlFBPO/uqHGT
	h/3mzzlWMkG2i3WwChOaOpP45nTlpY/i3YejnbqhgzthjpjhPmeYlMnpNE0AkRjrc7i9UDa4+H0
	fACUE42E30uYg8nDSyUl7hvPUL+y5FrrahT/esNn8+r77AppFgUQrplKoTRvHTjcO0yx1FmXWgk
	phm6sK2pIqObHHX7pdpS24o88rU9K92WMKh/xngMZ636dlclniMC3stJ3+wvDh9PVE0g==
X-Received: by 2002:a17:902:ef44:b0:2c6:c66b:4b03 with SMTP id d9443c01a7336-2c6c66b4d39mr11874145ad.10.1781691908280;
        Wed, 17 Jun 2026 03:25:08 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42fbb4134sm143780715ad.30.2026.06.17.03.25.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:25:07 -0700 (PDT)
Message-ID: <6d3e3121-22f2-4c59-9678-df2f57ff4d31@gmail.com>
Date: Wed, 17 Jun 2026 18:25:02 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] dt-bindings: display: verisilicon, dc: generalize
 for single-output variants
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260615065003.76661-1-a0987203069@gmail.com>
 <20260615065003.76661-2-a0987203069@gmail.com>
 <3683c5c617324f5835529617325745ef48fa1943.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <3683c5c617324f5835529617325745ef48fa1943.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/15/2026 4:19 PM, Icenowy Zheng wrote:
> 在 2026-06-15一的 14:49 +0800，Joey Lu写道：
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
>> - Move clock and reset items descriptions into the per-variant
>> allOf/if
>>    blocks; keep only minItems/maxItems at the top level so the base
>> schema
>>    accepts all variants.
>> - Restore full items lists for clock-names and reset-names at the top
>>    level with minItems so the names are validated against the
>> descriptions.
>> - Keep ports in the global required list and keep
>> additionalProperties: false.
>> - Add an allOf/if block for thead,th1520-dc8200: five-clock (core,
>> axi,
>>    ahb, pix0, pix1), three-reset (core, axi, ahb), required resets.
>> - Add an allOf/if block for nuvoton,ma35d1-dcu: two-clock (core,
>> pix0),
>>    one-reset (core), required resets.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   .../bindings/display/verisilicon,dc.yaml      | 80
>> +++++++++++++++++--
>>   1 file changed, 73 insertions(+), 7 deletions(-)
>>
>> diff --git
>> a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> index 9dc35ab973f2..0c41286b8223 100644
>> --- a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> +++ b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> @@ -17,6 +17,7 @@ properties:
>>       items:
>>         - enum:
>>             - thead,th1520-dc8200
>> +          - nuvoton,ma35d1-dcu
>>         - const: verisilicon,dc # DC IPs have discoverable ID/revision
>> registers
>>   
>>     reg:
>> @@ -26,14 +27,12 @@ properties:
>>       maxItems: 1
>>   
>>     clocks:
>> -    items:
>> -      - description: DC Core clock
>> -      - description: DMA AXI bus clock
>> -      - description: Configuration AHB bus clock
>> -      - description: Pixel clock of output 0
>> -      - description: Pixel clock of output 1
> Clock descriptions should still be in the global part instead of the
> per-compatible part.
>
> In the per-compatible part, clock-names should be constraint for SoCs.
I will move the `items:` clock descriptions back into the global 
`clocks:` property, covering all five possible clocks. In the 
per-compatible sections I will remove the description items and only 
constrain `clocks: minItems/maxItems` and `clock-names: 
minItems/maxItems`; for nuvoton,ma35d1-dcu I will additionally override 
`clock-names: items:` to the two names actually used (core, pix0).
>> +    minItems: 2
>> +    maxItems: 5
>>   
>>     clock-names:
>> +    minItems: 2
>> +    maxItems: 5
>>       items:
>>         - const: core
>>         - const: axi
>> @@ -42,12 +41,16 @@ properties:
>>         - const: pix1
>>   
>>     resets:
>> +    minItems: 1
>> +    maxItems: 3
>>       items:
>>         - description: DC Core reset
>>         - description: DMA AXI bus reset
>>         - description: Configuration AHB bus reset
>>   
>>     reset-names:
>> +    minItems: 1
>> +    maxItems: 3
>>       items:
>>         - const: core
>>         - const: axi
>> @@ -59,7 +62,7 @@ properties:
>>       properties:
>>         port@0:
>>           $ref: /schemas/graph.yaml#/properties/port
>> -        description: The first output channel , endpoint 0 should be
>> +        description: The first output channel, endpoint 0 should be
> If you really want to fix this, please make it a separated patch
> instead of doing it here, for commit atomicity.
>
> Thanks,
> Icenowy
I’ll drop this change and keep it as is
>>             used for DPI format output and endpoint 1 should be used
>>             for DP format output.
>>   
>> @@ -77,6 +80,69 @@ required:
>>     - clock-names
>>     - ports
>>   
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
>> +          items:
>> +            - description: DC Core clock
>> +            - description: DMA AXI bus clock
>> +            - description: Configuration AHB bus clock
>> +            - description: Pixel clock of output 0
>> +            - description: Pixel clock of output 1
>> +
>> +        clock-names:
>> +          minItems: 5
>> +          maxItems: 5
>> +
>> +        resets:
>> +          minItems: 3
>> +          maxItems: 3
>> +
>> +        reset-names:
>> +          minItems: 3
>> +          maxItems: 3
>> +
>> +      required:
>> +        - resets
>> +        - reset-names
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
>> +          items:
>> +            - description: DC Core clock
>> +            - description: Pixel clock of output 0
>> +
>> +        clock-names:
>> +          minItems: 2
>> +          maxItems: 2
>> +
>> +        resets:
>> +          minItems: 1
>> +          maxItems: 1
>> +
>> +        reset-names:
>> +          maxItems: 1
>> +
>> +      required:
>> +        - resets
>> +        - reset-names
>> +
>>   additionalProperties: false
>>   
>>   examples:
