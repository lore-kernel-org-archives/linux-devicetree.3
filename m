Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D2F18A93F
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373746; cv=none; b=jCNC42UPcPiDuVa8YCMH0RZujqF6WC42La5lWe8oILlmm3goxsFQg7+E/YRyvSWbtEgYamI6kB/GpDFRVHeQ7xKWuBIg+6rrvlbO46QVrR3C01368HXVhaEbTWFnXVDZFsGUWzU+P13gx2RO4B9oTDr+PTg1Gtp1Bpq5YFwvB/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373746; c=relaxed/simple;
	bh=YuXBmvIFB1Et+q+Dd5qvNxVQigDmtR3StCiUh0MdB5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cgXgNZTsm8Xg6+q9pwQqz8ejvJUaWNajmGn20o2GdimwNP/cysoDrJR0e1MqT7KTnJDU10KDYpLQkHybJz0uF7aQMaEhFYCUwEX9iwOMsvOxDFx1I6hm4zr1AONuLZm2ZI7+UDmf5wHClwU9datraJDi7kRas+Dcs3JO3WlV8hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PbmZltK0; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PbmZltK0"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d715f4a587so42647545ad.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 01:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789373744; x=1789978544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a+mbYj9gFoY+dF3f91W1Xx4566ofLNjeGKmQ/I7aiac=;
        b=PbmZltK0MZfEbi8ouIkbmxwzSvsC5A+XQiJftvWZURthCUQw2G5pcYukjzOfaGelPZ
         w/NJ3baHLBKwqaZ9Jkpo4Sx06GdXMvhKym80qXrXygyyTNH2n4lx3DhOrHYMdtnxUMtd
         Cbu8v6hQSvF+4iVFfUzlN1yKUeDPe/X4AgbVun1I5JTksno9cnrPCqThragIcZ4NyXE7
         ZDGoq8FePK/SwmZF4dl+AuL5om7pSnej7i3wHb9hQ0HeNcalEcrWkBxh6wEHYwxRtAQx
         IPuUhnnj5bkER3jj1pf2XUgP5lDOO3I51VFhl9/XBmj+1w2CH+iS3UF+iZFQ2AshFXTg
         NCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789373744; x=1789978544;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a+mbYj9gFoY+dF3f91W1Xx4566ofLNjeGKmQ/I7aiac=;
        b=X9ZgB23uMmAOTLG+1Rxrjw5rSIKv5GD0YhBNMu3zPbPvXaw2fd0aGsM/fHaFwBgwBr
         br7tS6V9ZrWmrnclkn6bsOKgZruYEcYglU+tHMizBhgqIux6Spb30jCnAR69Zgd0rKs3
         mUNYYpQm5CLNpIPf2lt9hD9+vGmFqJpVR4vCwGuQr6pYUCKVZ1PQxUGLleKo9+3mAh0i
         rhoKFHf5wI8hyCGhZxqcdZYh3vaVWbYVFoUGN2JE9t7xPKt0Izd6uWVKoA5d97tIN/L7
         3tskO+hJTHFnhRKp+bV6tuZd6hSjSXZy6h5FxP1b2OII5c+TVbFh4IjciNR+3+rjv6qf
         edmw==
X-Forwarded-Encrypted: i=1; AKwUvByEYbVEJ7CjXUij0UY3rMlBuj6I43Uqba/i3R+cEW8nqaFZHeek33iDuLket2xozq0B5gB3eh3av6q8@vger.kernel.org
X-Gm-Message-State: AFuF++ms2LjBYLmLfPY5xyxnd/zz77ADjHRXBpagqJ46dG+klh+vDgpu
	y7PKNYzv0kk7vzmleRqm31H886b90HKAm2ZJkIG9FdgH6aw0E3Ud8jaR
X-Gm-Gg: AYBFou3d7YWxCS3lE5tsl8g/DAJ1cAdNdbAK2JNw5J8xzVrIl6eBNLGGwsWH5iHp63f
	DD/qjbWEqCg1INvXXQhKxMfGqp03wkNmrHBtsG5eU3zPKepR6plZqi9rD5y+nGXyFUkzVKGsSPy
	koGwDjaEmJjP3i4JmHV59qi5JzSDFHDOR1pj6GaPdFg3C487tHDqL0AjDCu/D7XCEodqBx/KOAR
	MLqjcpUtyVU/blk6Oo1KWuDeO+QelqD9AnpUNerw7KXvxvsK+/DRhBmbHiXiy0V7ZVTgUxKs2Sz
	j7125xpxaz+0CXueR1Kvcq+YN4rZ6kG6xzPvtbRmAg8J77ZKdqcWfVnT3yXA/pJ6tj1QKtlkJzU
	gNrxvvuD2jco7FcnmMjFrOCbS08/LcFcZs0hS08jH9x52NbbaQY9T5NK3M56xbwX9RtAOjwgCoJ
	7Y4QK/4aJ+PuUb5cpVlzoxacKgldOuEXOkRuTnb6W3OhUIKNQNg+bTPjbO+lisfZAa89al9igf/
	0Ol2nHvb3E1Aap3dxDhpAP3jBN45Fpxv5uuVmY3Jo3Ba5iUfXsevXr8Q16ECleFOQ==
X-Received: by 2002:a17:902:e744:b0:2bf:dd0:c8b1 with SMTP id d9443c01a7336-2dd6c4835d0mr31756845ad.0.1789373744241;
        Mon, 14 Sep 2026 01:15:44 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cec8483sm44238255ad.44.2026.09.14.01.15.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 01:15:42 -0700 (PDT)
Message-ID: <2fd1f320-05a8-4782-8134-157c50024adb@gmail.com>
Date: Mon, 14 Sep 2026 16:15:37 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/6] dt-bindings: display: verisilicon,dc: add support
 for nuvoton,ma35d1-dcu
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260908092840.225220-1-a0987203069@gmail.com>
 <20260908092840.225220-2-a0987203069@gmail.com>
 <f74168b54fe8f070b7cfe79dc2fc83a63c2e8842.camel@iscas.ac.cn>
 <9d697240-3632-401f-aeba-c1fa5c2a29d4@gmail.com>
 <14f7fdf36a25b9669145b766becc6f32ef205320.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <14f7fdf36a25b9669145b766becc6f32ef205320.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Icenowy Zheng 於 2026/9/10 下午 03:08 寫道:
> 在 2026-09-10四的 09:52 +0800，Joey Lu写道：
>> Icenowy Zheng 於 2026/9/9 下午 01:44 寫道:
>>> 在 2026-09-08二的 17:28 +0800，Joey Lu写道：
>>>> Add the Nuvoton MA35D1 DCUltraLite (nuvoton,ma35d1-dcu) to the
>>>> binding.
>>>> The DCUltraLite uses only four clocks (core, axi, ahb, pix0) and
>>>> one
>>>> reset (core), with a single output port.
>>>>
>>>> The MA35D1 clock controller gates the core, AXI and AHB clocks
>>>> with a
>>>> single bit, but each remains a distinct clock line feeding the IP
>>>> with
>>>> its own rate constraints, so all four must still be listed
>>>> individually
>>>> in the devicetree; core, axi and ahb happen to share the same
>>>> clock
>>>> phandle.
>>> This is weird, but I must admit that we're limited by the Common
>>> Clock
>>> Framework here, so I cannot give a better solution either.
>>>
>>> Anyway let's settle with the current result.
>>>
>>>> Move the clocks/clock-names minItems to 4 and resets/reset-names
>>>> minItems to 1 at the top level, since that is the lowest count
>>>> any
>>>> supported variant needs.  Add an allOf/if block that tightens the
>>>> constraint back up to the fixed 5-clock/3-reset topology required
>>>> by
>>>> the existing thead,th1520-dc8200 compatible, and another one that
>>>> caps
>>>> the new nuvoton,ma35d1-dcu compatible at the 4-clock/1-reset
>>>> count it
>>>> actually wires up.
>>>>
>>>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>>>> ---
>>>>    .../bindings/display/verisilicon,dc.yaml      | 44
>>>> +++++++++++++++++++
>>>>    1 file changed, 44 insertions(+)
>>>>
>>>> diff --git
>>>> a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>>>> b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>>>> index 919a900122012..773966677d0f4 100644
>>>> ---
>>>> a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>>>> +++
>>>> b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>>>> @@ -17,6 +17,7 @@ properties:
>>>>        items:
>>>>          - enum:
>>>>              - thead,th1520-dc8200
>>>> +          - nuvoton,ma35d1-dcu
>>>>          - const: verisilicon,dc # DC IPs have discoverable
>>>> ID/revision
>>>> registers
>>>>    
>>>>      reg:
>>>> @@ -26,6 +27,7 @@ properties:
>>>>        maxItems: 1
>>>>    
>>>>      clocks:
>>>> +    minItems: 4
>>>>        items:
>>>>          - description: DC Core clock
>>>>          - description: DMA AXI bus clock
>>>> @@ -34,6 +36,7 @@ properties:
>>>>          - description: Pixel clock of output 1
>>>>    
>>>>      clock-names:
>>>> +    minItems: 4
>>>>        items:
>>>>          - const: core
>>>>          - const: axi
>>>> @@ -42,12 +45,14 @@ properties:
>>>>          - const: pix1
>>>>    
>>>>      resets:
>>>> +    minItems: 1
>>>>        items:
>>>>          - description: DC Core reset
>>>>          - description: DMA AXI bus reset
>>>>          - description: Configuration AHB bus reset
>>>>    
>>>>      reset-names:
>>>> +    minItems: 1
>>>>        items:
>>>>          - const: core
>>>>          - const: axi
>>>> @@ -79,6 +84,45 @@ required:
>>>>      - reset-names
>>>>      - ports
>>>>    
>>>> +allOf:
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            const: thead,th1520-dc8200
>>>> +    then:
>>>> +      properties:
>>>> +        clocks:
>>>> +          minItems: 5
>>>> +
>>>> +        clock-names:
>>>> +          minItems: 5
>>>> +
>>>> +        resets:
>>>> +          minItems: 3
>>>> +
>>>> +        reset-names:
>>>> +          minItems: 3
>>>> +
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            const: nuvoton,ma35d1-dcu
>>>> +    then:
>>>> +      properties:
>>>> +        clocks:
>>>> +          maxItems: 4
>>>> +
>>>> +        clock-names:
>>>> +          maxItems: 4
>>>> +
>>>> +        resets:
>>>> +          maxItems: 1
>>>> +
>>>> +        reset-names:
>>>> +          maxItems: 1
>>> Maybe it's reasonable to restrict max port count to 1 for MA35D1?
>>> Although I am not sure about how to do this...
>>>
>>> Thanks,
>>> Icenowy
>>    I found the same kind of per-compatible port restriction already
>> used
>> upstream in renesas,du.yaml, e.g.:
>>
>>           ports:
>>             properties:
>>               port@2: false
>>               port@3: false
>>             required:
>>               - port@0
>>               - port@1
>>
>> Applied to our binding, that would look like:
>>
>>           ports:
>>             properties:
>>               port@1: false
>>             required:
>>               - port@0
>>
>> in the existing nuvoton,ma35d1-dcu allOf/if/then block, so schema
>> checks
>> would reject a port@1 node on this compatible instead of silently
>> accepting it.
>>
>> Happy to add it if you'd like the schema to enforce this, but wanted
>> to
>> check whether you consider it worth the extra lines given it doesn't
>> reflect an actual bug in any DT today. Let me know which way you'd
>> prefer and I'll fold it into the next version.
> Personally I think this is good, but maybe adding it as an additional
> patch after merging isn't a big problem, because this just plays as
> kind of a safety guard.
>
> Well this depends on how DT binding maintainers think, but as Conor has
> dropped his Ack, this shouldn't be a big issue.
>
> Thanks,
> Icenowy
I'll send the port@1: false restriction as a follow-up patch once this 
series lands.
Thanks!
>> Thanks.
>>>> +
>>>>    additionalProperties: false
>>>>    
>>>>    examples:
