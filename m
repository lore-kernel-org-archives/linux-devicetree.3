Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE47B2D7DE9
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 01:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782956997; cv=none; b=Srr7qcK2sXwy/2sFHVA9d+c+qrZx1BP5tHB4h11hmaFOG0qWX6hqR27t8Wd+dOjMSZVUgECfhnQjSIEOSmh9jrgvYw/ijxVfO6RpwiuPtQoXSfDDg7IlgO8WIPyrxIC+c1pUabZaJ5+GCnQNgeI6R+MpwBtOzsfjKSgi4UEx9dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782956997; c=relaxed/simple;
	bh=zp4TrgKrdo8LRxGqn42HDahOSlIYt9m0YOUdzj58Ubc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dYD9uY4VkrlQjtVJhrfZmCbaPKeLUXIAWlESI47csPudTEvpzvysK3tX5c96pyQSe3A++WT6lznQ6ow3eOh6GFnEc2lLRLNMhMS1rGQS7ILQ3VWu3J6E75oby3Arx/hgs0QiNE60JHMQAH6Sf42rZipb7yp7et2yO2pVFVscnlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RD22Af2U; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RD22Af2U"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-37fa53bc22dso927360a91.3
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 18:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782956994; x=1783561794; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J3jSeMZN0e9RiTr23Xi2KHpV4fFpgmT05xW1Ks8KJnA=;
        b=RD22Af2UfzAevGySeY16VS+w6lPAgrKeyraqy0sdUdBg6pQPyPLL5fscvt7mS6nFcE
         mfNuqSATD7N6kHWAyKKDh7YDAij7BAERVsxgaJykqjVYBSpjhxbrsxUGMwoSNmHeQGrr
         BlIMAEzHuynFs+dEka0tdxLvLzet3r1xiYdQREWoMAcGWEk9TdSrk8hKxJNsyFxKw+Aa
         /hc77cpSLZEC1MoaIQoAYZxVaCsOVc8DYdi4Mr1dddFd1w2yyXGHBDx+zAgf+RImk3RO
         OGqEHJfBnC55yUvAA3HdDJ4FMu9gaaYDgbtr53Sf6Q43KYBFfS+oXJ8ELgUhrf3WiHcv
         caNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782956994; x=1783561794;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J3jSeMZN0e9RiTr23Xi2KHpV4fFpgmT05xW1Ks8KJnA=;
        b=IAWHECydc5ojBeq6Z9YU7y7tVc4bAd9czMAdQbJcd+yl/votRUY1OCZvKGHqVIx3Kw
         UkXFJ8h6Gv9TZOk7Jt1B4EZPzy3nXpb3UHZOFMHjOTfGnK6r1xAyR1GX7E/5N7wNELht
         w2dcRlKBi5nf4N96jsYoggKvTFSj1ng8B4k5H83EfFSvU8wAB7vJioAD0BOsBn+8IcJr
         RmtwQZ/Fub2sDZHaeHhyeCGuL81cxrCdMQzehvKm+apGU5XeDRAfe8FMSl6SYhShu3a7
         xUWZGn/kdUendbZkrx/Rfc6lfWSlu0COk9FzhWdJh2xDp0xOhugkEIOueCgZcgPLQ6O3
         P3CA==
X-Forwarded-Encrypted: i=1; AHgh+RpZ9RWrtKq+sZgV0FREH0QVzQ5KLXBBg8sMFJOZm2oy13WBsH8H1IG0HGUTzxqRn07pViGGoI7sWbgS@vger.kernel.org
X-Gm-Message-State: AOJu0YwatguWZ8aZFIOQOTLHtWurzZB3Ujl8dvUd4v0Q5f+uvER4IaPf
	wLizrQOatiT8M+bFkQox+a9KMQ5wNnhnJ3yeV56+eO+eKgDV/c+m1cS2
X-Gm-Gg: AfdE7clSxiTJaTnp/vKO0kuDb42e0AtHAc5fBl/3jZWVcK5PTLd55ARoyGhyO/AGxnU
	ixTtAvTRqRd3pr/i/uecozfSx6N+p6VJWB4PSKZLN9/cYvTwv4sh+oRvNywSjHX4JxOQFeVCjYM
	uXS79QODpXP/3gf2eo9r2zdmsQ93em5GYQHGyQet8c0NA564xZw+kHk8umjLfjv7dJRv6f5GFPB
	wZwC3iL23kTr25jKIeehRWOZ6m9U81nlquDRkEVmjZGieK1sL5BacyTs1Wxrm88RFCcl7wblj3r
	GhkU+7u6kUnIB5Bpxu0sDv69Yx51k/O/1eX8KHNchdJ0/Z5vZvy9IouXpXHMB7AcssBYhTBqz0x
	xbwIau5U99jhONTQQxm8C2OBMXC2q+ejoPkU9gyiZGWd5xMvvCsFd1KJd/4ybPQA9KJuikYU2Um
	i3CkNqPvXkMuKG8GZJ+EXRG7TrQKq6TrzTYE5t0WXWYcV6RCbUxil3+QTyhFrJ6+uHdg==
X-Received: by 2002:a17:90b:3b52:b0:37f:9ce3:ca93 with SMTP id 98e67ed59e1d1-380aa1d7714mr4632989a91.28.1782956993855;
        Wed, 01 Jul 2026 18:49:53 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-380e1631aadsm130307a91.4.2026.07.01.18.49.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 18:49:53 -0700 (PDT)
Message-ID: <b002cf5f-4e1a-4181-b9c3-d4f3870bffe8@gmail.com>
Date: Thu, 2 Jul 2026 09:49:46 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend
 for dual-port OTG support
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
 <20260625023958.569299-3-a0987203069@gmail.com>
 <20260625-sexy-black-tarantula-4031a6@quoll>
 <24de6a00-ba4e-455b-baa7-479d1cc2edf3@gmail.com>
 <0f5a408b-5c55-4cd2-831a-49316c9912c9@kernel.org>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <0f5a408b-5c55-4cd2-831a-49316c9912c9@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/30/2026 2:16 PM, Krzysztof Kozlowski wrote:
> On 29/06/2026 12:40, Joey Lu wrote:
>> On 6/25/2026 3:58 PM, Krzysztof Kozlowski wrote:
>>> On Thu, Jun 25, 2026 at 10:39:56AM +0800, Joey Lu wrote:
>>>>    properties:
>>>>      compatible:
>>>>        enum:
>>>>          - nuvoton,ma35d1-usb2-phy
>>>>    
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>>      "#phy-cells":
>>>> -    const: 0
>>>> +    const: 1
>>>> +    description:
>>>> +      The single cell selects the PHY port. 0 selects the OTG port (USB0,
>>>> +      shared with DWC2 gadget controller) and 1 selects the host-only port
>>>> +      (USB1).
>>>>    
>>>> -  clocks:
>>>> -    maxItems: 1
>>> This is odd, considering that parent does not have clocks. So explain me
>>> this:
>>> 1. USB PHY needed clocks.
>>> 2. You extend USB PHY to cover second part.
>>> 3. That extension for second part means that clocks are not needed.
>>> Really, how? How is it possible in hardware?
>> The hardware has two independent clock domains:
>>
>>     - The PHY analog block takes the 24 MHz HXT as its reference, wired
>>       directly to the PHY's internal PLL, which derives the required
>> operating
>>       frequencies internally. This reference path is entirely outside the SoC
>>       software clock tree; no software-gatable clock gate needs to be enabled
>>       for the PHY to power up and lock its PLL. The only software control the
>>       PHY driver exercises is toggling each PHY's Power-On Reset (POR) bit,
>>       which resides in the SYS register block. The driver accesses this via
>>       the parent regmap
>>
>>     - `HUSBH0_GATE` / `HUSBH1_GATE` / `USBD_GATE` are AHB/APB bus interface
>>       clocks for the host and gadget (EHCI, OHCI, DWC2). They gate
>>       the register-access path between the CPU and each controller, not
>> the PHY
>>       analog circuitry itself.
>>
>> The original single-port driver enabled `HUSBH0_GATE` as if it belonged
>> to the
>> PHY, but that gate is actually owned by EHCI0/OHCI0 and is already
>> managed by
>> those controller drivers through their own `clocks` DTS bindings. The PHY
>> driver was redundantly enabling the same gate.
>>
>> When extending the driver to cover PHY1, the same pattern held: EHCI1/OHCI1
>> manage `HUSBH1_GATE` themselves. There is no clock that belongs
>> exclusively to
>> the PHY, so `clocks` will be dropped from the PHY binding entirely.
> What driver has to do with it?
>
> You did not answer the question. How adding missing OTG to existing
> device causes that hardware to lose a clock? How is it possible?
>
To answer the hardware question directly: adding OTG support does not
cause the hardware to lose a clock. The hardware clock topology is
identical in both the single-port and dual-port cases.

The PHY analog block derives its reference from the 24 MHz HXT crystal
through an always-on path via the PHY's internal PLL. No software-gated
clock in the kernel clock tree sits in this path. The PHY's power-on and
reset state is managed through USBPMISCR in the SYS register block, which
the driver accesses via the nuvoton,sys regmap outside the clock tree.

`HUSBH0_GATE` gates the AHB bus interface to the EHCI0/OHCI0 host
controllers that share PHY0. This relationship is the same in both the
single-port and dual-port configurations.
>>>> +  nuvoton,rcalcode:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>>> +    minItems: 1
>>>> +    maxItems: 2
>>> You should require two values. I understand that any PHY is optional,
>>> thus you skip the entry, so how would you provide value for PHY1 only?
>> `nuvoton,rcalcode` will be changed to require exactly two values
>> (`minItems: 2, maxItems: 2`), one for PHY0 and one for PHY1 respectively.
>> The property will remain optional overall; when absent, each port
>> retains its
>> power-on default value loaded at hardware initialisation. When present, both
>> entries must be supplied.
> So are you going to implement it or not?
>
Yes, I will implement this change in the next version of the patchset.
>>>> +    items:
>>>> +      minimum: 0
>>>> +      maximum: 15
>>>> +    description:
>>>> +      Resistor calibration trim codes for PHY0 and PHY1 respectively.
>>>> +      Each 4-bit value is written to the RCALCODE field in USBPMISCR and
>>>> +      adjusts the PHY's internal termination resistance. Both entries are
>>>> +      optional; when absent the hardware reset default is used.
>>>>    
>>>> -  nuvoton,sys:
>>>> -    $ref: /schemas/types.yaml#/definitions/phandle
>>>> +  nuvoton,oc-active-high:
>>>> +    type: boolean
>>>>        description:
>>>> -      phandle to syscon for checking the PHY clock status.
>>>> +      When present, the over-current detect input from the VBUS power switch
>>>> +      is treated as active-high. The default (property absent) is active-low.
>>>> +      This setting is shared by both USB host ports.
>>>>    
>>>>    required:
>>>>      - compatible
>>>> +  - reg
>>> That's ABI break which was not explained in the commit msg - neither
>>> specifying impact nor actually providing reasons why you break ABI.
>>>
>>> And honestly, you have no resources here except the address, so now it
>>> is clear that this should be folded into parent. See DTS101 talk slides.
>> The commit message will be updated to explicitly acknowledge the ABI break:
>> existing DTS files that contain a standalone `usb-phy` node without a `reg`
>> property will fail dt-schema validation after this change. The impact is
>> limited to the MA35D1 SoC; no upstream DTS for this SoC existed before this
>> patch series, so no in-tree board files are broken. The break is intentional
> But all of out of tree users are broken.
On reflection, the approach is being revised to eliminate the ABI break 
entirely.
The next revision will keep the existing `nuvoton,ma35d1-usb2-phy` binding
intact with all its current required properties (`compatible`, `clocks`,
`nuvoton,sys`, `#phy-cells`). New OTG and dual-port capability will be
expressed as strictly optional backward-compatible additions:

- `#phy-cells` updated from `const: 0` to `enum: [0, 1]`. Existing DTS
   with `#phy-cells = <0>` continues to validate and behave as before.
   New DTS opting into dual-port uses `#phy-cells = <1>`.
- `nuvoton,rcalcode`: optional, exactly two values when present.
- `nuvoton,oc-active-high`: optional boolean.
>
> Best regards,
> Krzysztof
