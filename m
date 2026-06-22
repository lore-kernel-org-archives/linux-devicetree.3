Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B943126D6
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 02:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782095337; cv=none; b=MY9vr8/lUCWBOqo0u9WJkY9HSkWJQYF8JSfLpHZ915HO5w4S66STBLZRPaunzOOd4OxctlTZMAsPWr4L+awL0Fu3RJjg+cy/Rl6ugQVV3x6E/RhFKYrpQHZNLyjWcoJKFgrCjfn9RW8Bbxcf///hjo7wZlrX17g5aUqaY7JYhVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782095337; c=relaxed/simple;
	bh=ticB4gansQ1BtdOSesuRfnDkU6EYtdEdyO6zWWCdzUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dOkfiggStbP6qdwVvUJ+WziWseCEAyvvUQTJLyS9EbOoa8Ex9v2GnUOZh6v7//AxPB220wFSWU2693L/f4g28zM7g/baz7uFweMQuNYaQmpg5WeZ0i6D35ahbnIljW8OK2GEz6bgHfiLdVBct9J1XsWNzPE4/PMawkIIpjCLKt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lLAnfDsN; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lLAnfDsN"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-845369f60faso2163193b3a.3
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 19:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782095335; x=1782700135; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gu0ES1O9klC+0ewrJmA1SFEVoTTP2kjyfbea71Glr8c=;
        b=lLAnfDsNbxHGhQkz77sAaWkG9aYQ9PLStUz0x+XXFmWRuLNRsfx140rQoUMUVvj7GL
         iZ5we5zgHN3P9Xt4K35rvZEVOtPrKnyDUGZbbYFmoa4sX/Q0UBB8XkoQbsYVynCvkOMU
         pxq6fA3qlNiKC8Cr2d6zzj/nlqwBsY990SZYTvb1E1rsSprLhHDSEBYu5C5VI/ddq2nu
         2lXD/70j0+ac0RwR6LMUlQH8x6KonPwn7qbE95gcpU2yeFACfTSr3zrFpUsFWZUc4ZMT
         ZrOEnbrmRHU4qy2BuPo3WkuXXPGy6yf49gP5Nr9SUCanUHfZoBNxFVaRObKhf/kxwrtv
         hMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782095335; x=1782700135;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gu0ES1O9klC+0ewrJmA1SFEVoTTP2kjyfbea71Glr8c=;
        b=JpQI0g8Q3KZ7qhU9oajoHQuJn1UUVZPlBrvZ4ok+OzBTSHKUGxBd7tPOwnQxs6QfZQ
         ANr3CIDJZCzKm6Ya0w4+W8a5G3YocZ9MGJL1UcRlfkIQLVQmcDlL3gddG27oPmgkJbcl
         DRUxe2rgbqmXUPn9eTw3mCwR3M2eoYMcKwUnhgGKF/tHEBT8kVZhNZInOw9XcjjzrZkM
         wpbwfEm4lTBCn7+5zpebNMWta/1E8TAdal41q/dMF0yUFfmv1OAJZRLlOYx8ZNsWavRd
         sGL0reN+v9s8t+ZSAXrNBSr4Hklyi9GOVCXiPkttxpHV4TzgXpuZ8ABfrzghmetj8sqi
         dmVg==
X-Forwarded-Encrypted: i=1; AFNElJ8suBLYacG4eTU5l1NcQTqZPYHv7wrYwAzsi6maXbYq4Oq7bD21wJHcFerFwa32dDvazWwgGrC2yS3L@vger.kernel.org
X-Gm-Message-State: AOJu0YwM2ac7Ke6jOyxh/QqAPAWuqk89W4flE5lyL3iKNqq2V/AnD7Hd
	L7Y1BlP6RPY8l88OcDsf8smvyijRs9qJgKs+LylbmjrDg70In7zNzeu4
X-Gm-Gg: AfdE7ckC+y/wcywAVzGFha/OKq3b8qE3pPS6KpXrsm8MoIVy2W9qxR+cCvAG1OzGhiZ
	2GsQpZtX1oI1Btt9glHe0niiTb6BhnyQ3fO5a3JMBUWh+kkoUYkb02Z/y2DmUpcYkNf9yyG12aM
	qTh6279nas2pLDICo8L6PfzQg6TNAFk+xwZmQNWRjRVo1hsxQD6tXIgs/tKwGX/bXyypppfgvf3
	kazBp+i0xgw5vMHJOEdAv7hupHg3PmOfWmiVzcJ+ep01Ldcmweq426Sibb598mlR2MAv0v/5Wqm
	E2SLnXeEKOw1nFkLRXHpmZejUbxuZYytx0CU2VSX5ygZGN8M3iTMYmck2NOB7rT3WQRsoNtstf+
	DArMT41pTuv9CeG9RcQVysQDuAKDWlJZN21HyLJaUt7hPd4rLfFuQKouRe6d/injtAkAyoLPTSS
	Halawh5/tyCz/5XHD2np9d81pql8KRNPTLt8SN6WAwCvQS2u0TVlnVMrFMVhrqtsYeRkPsKejrZ
	nWq
X-Received: by 2002:a05:6a00:4104:b0:845:33e1:9664 with SMTP id d2e1a72fcca58-845508ff81bmr13600889b3a.40.1782095334770;
        Sun, 21 Jun 2026 19:28:54 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ee3dc2sm5573489b3a.58.2026.06.21.19.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 19:28:54 -0700 (PDT)
Message-ID: <98725dea-9bfd-43bb-8bce-e314f821d081@gmail.com>
Date: Mon, 22 Jun 2026 10:28:46 +0800
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
 <6d3e3121-22f2-4c59-9678-df2f57ff4d31@gmail.com>
 <b08277e8a9350f6c68c9774b1b6185b1eb71cd1e.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <b08277e8a9350f6c68c9774b1b6185b1eb71cd1e.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/18/2026 6:24 PM, Icenowy Zheng wrote:
> 在 2026-06-17三的 18:25 +0800，Joey Lu写道：
>> On 6/15/2026 4:19 PM, Icenowy Zheng wrote:
>>> 在 2026-06-15一的 14:49 +0800，Joey Lu写道：
>>>> The existing schema hard-codes the five-clock/three-reset/dual-
>>>> port
>>>> topology of the DC8200 IP block, preventing reuse for single-
>>>> output
>>>> variants such as the Verisilicon DCUltraLite used in the Nuvoton
>>>> MA35D1
>>>> SoC.
>>>>
>>>> Rework the schema so that variant-specific constraints are
>>>> expressed
>>>> via
>>>> allOf/if blocks:
>>>>
>>>> - Add nuvoton,ma35d1-dcu to the SoC-specific compatible enum.
>>>> The
>>>>     generic verisilicon,dc fallback remains the driver-binding
>>>> string.
>>>> - Move clock and reset items descriptions into the per-variant
>>>> allOf/if
>>>>     blocks; keep only minItems/maxItems at the top level so the
>>>> base
>>>> schema
>>>>     accepts all variants.
>>>> - Restore full items lists for clock-names and reset-names at the
>>>> top
>>>>     level with minItems so the names are validated against the
>>>> descriptions.
>>>> - Keep ports in the global required list and keep
>>>> additionalProperties: false.
>>>> - Add an allOf/if block for thead,th1520-dc8200: five-clock
>>>> (core,
>>>> axi,
>>>>     ahb, pix0, pix1), three-reset (core, axi, ahb), required
>>>> resets.
>>>> - Add an allOf/if block for nuvoton,ma35d1-dcu: two-clock (core,
>>>> pix0),
>>>>     one-reset (core), required resets.
>>>>
>>>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>>>> ---
>>>>    .../bindings/display/verisilicon,dc.yaml      | 80
>>>> +++++++++++++++++--
>>>>    1 file changed, 73 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git
>>>> a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>>>> b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>>>> index 9dc35ab973f2..0c41286b8223 100644
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
>>>> @@ -26,14 +27,12 @@ properties:
>>>>        maxItems: 1
>>>>    
>>>>      clocks:
>>>> -    items:
>>>> -      - description: DC Core clock
>>>> -      - description: DMA AXI bus clock
>>>> -      - description: Configuration AHB bus clock
>>>> -      - description: Pixel clock of output 0
>>>> -      - description: Pixel clock of output 1
>>> Clock descriptions should still be in the global part instead of
>>> the
>>> per-compatible part.
>>>
>>> In the per-compatible part, clock-names should be constraint for
>>> SoCs.
>> I will move the `items:` clock descriptions back into the global
>> `clocks:` property, covering all five possible clocks. In the
>> per-compatible sections I will remove the description items and only
>> constrain `clocks: minItems/maxItems` and `clock-names:
>> minItems/maxItems`; for nuvoton,ma35d1-dcu I will additionally
>> override
>> `clock-names: items:` to the two names actually used (core, pix0).
> Yes, this should be the correct practice, although I wonder whether the
> minItems and maxItems properties are needed globally (because these two
> seem to have default implicit value).
>
> BTW the MA35D1 manual in fact shows 4 clocks for "DCUltra" in the clock
> tree, maybe the DT binding needs to be reconsidered?
>
> Thanks,
> Icenowy
I will drop the global `minItems`/`maxItems` on `clocks` and 
`clock-names` in v5, as they are redundant with the implicit defaults.

Regarding the 4-clock question: the TRM clock tree diagram does show 
four paths reaching DCUltra (display core mux/gate, AXI ACLK, AHB HCLK, 
and the pixel clock divider). However, the MA35D1 hardware provides only 
one software-controllable enable bit (SYSCLK0[26]) that gates the core 
clock together with the AXI and AHB bus clocks through shared ICG cells; 
there are no separate register bits for the bus clocks alone. Due to 
this hardware design constraint, the `clk-ma35d1` driver is 
intentionally designed to register only three DCU-related CCF nodes: 
`dcu_mux` (ID 61, an internal routing mux), `dcu_gate` (ID 62, the 
single gate at SYSCLK0 bit 26), and `dcup_div` (ID 63, the pixel divider 
from VPLL at CLKDIV0[18:16]), with no independent AXI or AHB gate 
entries for DCU. Since the DT binding can only reference clock handles 
that the platform clock driver actually provides, the MA35D1 binding 
will remain at two clock entries: "core" mapped to `DCU_GATE` and "pix0" 
mapped to `DCUP_DIV`.

Thanks.

>
>>>> +    minItems: 2
>>>> +    maxItems: 5
>>>>    
>>>>      clock-names:
>>>> +    minItems: 2
>>>> +    maxItems: 5
>>>>        items:
>>>>          - const: core
>>>>          - const: axi
