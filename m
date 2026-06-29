Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15ED1374A02
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782726508; cv=none; b=CWMS2P/br5UDfimsI0F1rrX0phCn80taz8tICRaaT8RZz3ToXtl0LoN2DRTbJbQjxvRlmE0jjVzHEPqRIVYTUVwVo3zzuUPZ+Sx5JebYn4MntNZCEkhJo5TWs7NUbucrFg7xGpc+sQTtsaAqRDpotygRkFQCVDSyFsfWIKxB2KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782726508; c=relaxed/simple;
	bh=OxKtXeEQOCsLezLC5NsYG/0Pupwv5ZCAASPZOhyK0Vk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FJr1Q9RsPxlVFxLrPE0kKg5SivTsi1J6QrAHNw7T3AsYZGSjn7W1VahvoXU25SIPzwFeqsdzc2SGGxJdJfcGrQHowQx3BStFXbrscNfroKvonSZJfrB8I+TH4t5JzZ6CxXKZsIaG3AI3LopfLMhyjvMZHZx30uLh8FMBX8PTPoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XSvtf+en; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XSvtf+en"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ca15944645so1575195ad.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 02:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782726506; x=1783331306; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zTD44WdJSK3FZpGp1YBqkIsU4pLxtym31A5/dbuPSIk=;
        b=XSvtf+en4RgViTA8QtN94felQb7qbhXBL78L9WIc5NdBrKtdQw8qNjnjrxj9C25v4C
         43jjtnTcXzzlV0tPxPJF7+mSm7pO5/bRFw+1l0Rwu0xZxrMXvURkVBW2qvnwm63lLzVz
         pwdfiIBtT66NihwLERC0adA0XIJMJKWEePJRb5YHf/SqA6H2jyo0hNPK7Ye+PhlNCN+b
         xqOUSrGoGmFnOojA5ko579oH5VQSKpY3V4e+NjZq/TVR/p+o5Pfp954esaqwfDc+2/bW
         wg35NcmRmwHxlVn7HtDRyncXk2xPqMVHwBNtuAiR1BTR65yADyaqcRX2DvjuTjCZFnPD
         m5jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782726506; x=1783331306;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zTD44WdJSK3FZpGp1YBqkIsU4pLxtym31A5/dbuPSIk=;
        b=GEQl/wJSWFXpXF05ziHOnJTBs3R+ARGCbkZO38SREKGv7zxWQ+YiIXp4dD1Fp3PEuh
         GqrAm1ENzbywUmvDQxcZqibS/P2INUkqgJlHk6t9GCYZ67WgonyLbPPI1ULjOFuapmXI
         7O1ZmZ/93/uVJJrW8YMN3eamrEnYgu1DQp6rQfov3WuoiZMhjP5BocGS1NiAc4a9e5Gr
         XjcifzuwCAYGiUCAiu9JjtjfUI0R9ULEkfGj1IE0ibqs2il2b0jWyFDlODMiE1p3nEag
         7qeJ5MSc9c+Fjpt7X4azA4eSwCtsgz5kSVC7XvyCevt26yfJ8Iy3O+sSpNW0xiZ9TtbH
         XMyA==
X-Forwarded-Encrypted: i=1; AHgh+RrPCFqXuc8d6Np0Pya6Cr9g9Tj169XvSFosKa9uUy4W5Dcs7n37qXLKCIFQwgHt/HCk0+Aec3J7ctNP@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqv6fQDB4HE89WZE1Qn+/V0tF5QEpEM+DBjFPEznhdfQigcF00
	56eMs7P65l4/xdSymiQTjA+JoBIpLp0RF/rj6u3YDz1hetgN4F+RRblJ
X-Gm-Gg: AfdE7ckFm21mtG4uiShtcU0KQWrCxNT7l2CiuM6EYCn/ZW9Xwd1LUOg60QVtPKEbvNj
	abBgcSnRelH847mfQqQ9UO50rXAphqfNA0sAuoVg/3w8V3+4eFz22Pge2/tV9VNNQfAK1q8HO1D
	b6LvpYAPdfBcwSnpmWoatMq57fJRYwGAlbbG7gtJ1GoYUmogBbkDeDhbHPBZFi/SCaVjU2kzVkh
	N01n3rZLEDIg2Scb1avC0NaglSOsrAy9qvL0p/db2hrNSE5uJQ8Ml1g2xSMBvKCVPrejv1mES9b
	TTNFPFOHrMsToNtW4K5eZMzcpcB1g/dsEeybIzGGDJ313z3AnKHYz1wX111dAyQkrizKC6JCKlf
	EmHNlk53dkpSPw5vLR1iQMMBXBg5c0pq2aF/M6N7m2F6tk99DyWsaMjRoOxzSH5MADdwMCGaD1m
	SNktzkGbW023mrUs0YvG+SC5f+xkNMWV5IpVV64pD9IMXGVbU51XR2BaOo4c3/frSvlQ==
X-Received: by 2002:a17:902:f612:b0:2c7:f2c6:89e0 with SMTP id d9443c01a7336-2c98549d2a7mr85863555ad.4.1782726506210;
        Mon, 29 Jun 2026 02:48:26 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5af8a07sm88963245ad.25.2026.06.29.02.48.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 02:48:25 -0700 (PDT)
Message-ID: <df86d371-2994-4f33-80fe-36509054fee3@gmail.com>
Date: Mon, 29 Jun 2026 17:48:19 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: reset: nuvoton,ma35d1-reset: add
 simple-mfd and child node support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Jacky Huang
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Hui-Ping Chen <hpchen0nvt@gmail.com>, Joey Lu <yclu4@nuvoton.com>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260625023958.569299-1-a0987203069@gmail.com>
 <20260625023958.569299-2-a0987203069@gmail.com>
 <20260625-striped-demonic-jerboa-502afb@quoll>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20260625-striped-demonic-jerboa-502afb@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/25/2026 3:51 PM, Krzysztof Kozlowski wrote:
> On Thu, Jun 25, 2026 at 10:39:55AM +0800, Joey Lu wrote:
>> The MA35D1 system-management syscon node hosts the USB PHY register
>> block at offset 0x60.  To model usb-phy@60 as a DT child of the syscon
>> node the binding must allow:
> Explain why do you need child node. If you have fixed device @0x60, you do
> not need DT child node at all. Compatible implies that child existence.
The commit message will be rewritten to state the motivation: the USB PHY
register block at offset 0x60 needs a referenceable DT node because consumer
drivers (dwc2, ehci0/ohci0, ehci1/ohci1) look it up via `phys = 
<&usb_phy N>`,
which requires an explicit node with a phandle. Optional per-board 
calibration
properties (`nuvoton,rcalcode`, `nuvoton,oc-active-high`) also need to be
expressed in DT.
>
>>    - simple-mfd as an optional third compatible so the MFD core can
>>      instantiate child platform devices.
>>
>>    - #address-cells and #size-cells (each const: 1) so child nodes can
>>      carry a reg property.
>>
>>    - An open child-node pattern (patternProperties "^.*@[0-9a-f]+$")
>>      to pass dt-schema validation.
> No. Do not explain what you did - we can read the diff. You must explain
> WHY you are doing that.
Addressed above.
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   .../bindings/reset/nuvoton,ma35d1-reset.yaml        | 13 ++++++++++++-
>>   1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml b/Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml
>> index 3ce7dcecd87a..1fda7e8f4b5d 100644
>> --- a/Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml
>> +++ b/Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml
>> @@ -19,6 +19,8 @@ properties:
>>       items:
>>         - const: nuvoton,ma35d1-reset
>>         - const: syscon
>> +      - const: simple-mfd
>> +    minItems: 2
>>   
>>     reg:
>>       maxItems: 1
>> @@ -26,6 +28,16 @@ properties:
>>     '#reset-cells':
>>       const: 1
>>   
>> +  '#address-cells':
>> +    const: 1
>> +
>> +  '#size-cells':
>> +    const: 1
>> +
>> +patternProperties:
>> +  "^.*@[0-9a-f]+$":
> This must be specific.
The `patternProperties` key will be changed from `"^.*@[0-9a-f]+$"` to
`"^usb-phy@[0-9a-f]+$"` so it matches only USB PHY child nodes, 
following the
naming convention used by existing vendor bindings.
>> +    type: object
> Missing ref and additionalProps. Please look at other simple-mfd.
`$ref: /schemas/phy/nuvoton,ma35d1-usb2-phy.yaml#` will be added under the
patternProperties entry, alongside `type: object`, so the child node will be
validated against the PHY binding schema. This follows the pattern used by
existing vendor bindings.

Thanks for review.
>> +
>>   required:
>>     - compatible
>>     - reg
>> @@ -43,4 +55,3 @@ examples:
>>           #reset-cells = <1>;
>>       };
>>   ...
>> -
>> -- 
>> 2.43.0
>>
