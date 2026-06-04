Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A703EDE67
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 09:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780564024; cv=none; b=gXc0+0yqdWYjVI0HPeOdIMyKT/mc1OGPiTMkjT7xlvRkbN9e0CyEAoi2sTKJT7IFRCQOV2V3C2kgch32jk23oobxVC8dwiDu5kTIaDL742EdxuIJgc17v0jF/RjBIqCuDXOfVxoaFCNdL2n8a8QjBkBPpCIecG0Skv1vjlUg5Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780564024; c=relaxed/simple;
	bh=UPQDLXU71Z4mW/BBDvxtUkcJKh7WhEhkMLc5+Z6fWS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ny10pgmWc2tWKghAz6tiLxxKtRxFUG3XDuOov6RyD/1dARSL/aoISiKKlPlQIEILZXGBL7ttoS4Pm/yWCEqghApGKqTmNGOMb38GWQAdjrIjEX9MIZR+v82y4A8ABrodLc5WB8lpK6YUOrXxn/GDU0p8ysIyoKEXi2zorT18gig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eSCE0aa9; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eSCE0aa9"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-68e5f7c1131so814540a12.2
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 02:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780564021; x=1781168821; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rbplG8EyIp0hP6o+wQA2geXN0fkmfIWqDHbmX7Sw1Aw=;
        b=eSCE0aa9NQH+CN3QSeurs39QAnZjFw13IkSypaf8ZFIBR5379A+Jgoj4+DUoDfiESn
         8Y8HluaXq6FYMbxGOLxyPmJAh1Zmp0ZDBg0xOrIyWtKyUvm00sTza6esR0puMnWSC+ha
         0eL1NR1c5n0e5NCWTHEwm8dkEfAGqwAAD0qdjN2+LqOHvssfBM7+pKIRaEzrnNwKC5Fn
         K0+YdguM+NrPhL2pN3cL+wmTsQpHSNVlRwkHAsy6qXUzHbJQrQpCLY3CjFK22Trkw5r4
         mkobtl8PvVjlGBtM03Oc8T/qWKq34NTJxsgIFaO3bTygzIscPp91P5AIXjH0owvS4M1/
         6+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780564021; x=1781168821;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rbplG8EyIp0hP6o+wQA2geXN0fkmfIWqDHbmX7Sw1Aw=;
        b=e+cKh0LLQoPR1uxhN+F666t6F7rhPciZtHzPjkemNm+icvnljgL01wA96yj+JXfJZA
         PLaJzdEcrC06/rm5bnVC8KSgnVr6bOZVJ3gmotMXIgn+i/lofLvwAbwTdPYbR3IXU5cP
         m9Kivpaj0c71b35ia/Nj42KITIXOp1yMK1PcelgF5/8xi34ynuufJT2d1GbCIJ1Czh7E
         NWtg8uhCjbYh+iFCJ1lPNjjPKfEO9wqxSb7FodYD1NAhTtoN+9qx1MGHO/smL5vS6FuD
         dEZkB9NgQjTwiCm7sFXqJawW8tEBM/JnLMhx3D0y8t82bvhEpbSkPaWedhzT8jm46pm7
         91CA==
X-Forwarded-Encrypted: i=1; AFNElJ9t30nI775cexu0zATTjW1k4MHv6AL0AYsqmtpeCOAQJJyAI1Ejg9HYRO5Ukq0tqI8r/6ND2mb3t5wP@vger.kernel.org
X-Gm-Message-State: AOJu0YzmCibgw0iR6pchrpfkfrkhBTbCsobRmBRcQRY52eL8yj+gEMZI
	rSZFsJQPiM6zsfT/41fAYUpcZZjPKqqRVOi3rlJdvYFP8fIaOZtGdWkX214sSbHWnuw=
X-Gm-Gg: Acq92OEmC7TlI5BMJkzfdOuhdDW+oj5ZgFGSL2TTxBzf/d3Ztaxjt+1+gYHgmZmSyt9
	/Ou4e8CeFJPvSoq6HYoBfs96zR0p1ee8n0GWtuHZYV8spoX2HL1IiQg8p7XsFJ7SK2nnqxUIc/u
	Pftd5K4i/n07yDOUA1noELz32BYW1wgBBMZskS1zR+meNRsYl49ScQPwHBaPucaXhQmZJiOr2JO
	paq4euU0rkwUhR3vh6cDy1QUvz8FMKzySowtjK2uTA5Ih5aWiFSrxjof+bG8EVbjtKQxTG8xScK
	K8roGqmFrT6NVnJKhzlJsQ8JE+kaQEnNGqQK4SlFErrBPy68PzHKE+b/NKO3tRp3PpfveRt70Oe
	3Xt0kg/vzzctMT8gmQGWMA9D63w8EPd8sNPA4zr0kQs4DK+jJ6U/lIWJzPnDnHP1foDTEBwS9VS
	JwCt2TVaXH9bOiE0yg6I19P4Cw1HLjCk/a+JxHnC3oMckfIlI=
X-Received: by 2002:a05:6402:e9f:b0:687:ece2:aac6 with SMTP id 4fb4d7f45d1cf-68e713e302fmr3453410a12.15.1780564021418;
        Thu, 04 Jun 2026 02:07:01 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.175.228])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65851786sm2153584a12.17.2026.06.04.02.06.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 02:07:00 -0700 (PDT)
Message-ID: <67b6f6ae-bfca-4afd-adfb-6ec1741105d8@linaro.org>
Date: Thu, 4 Jun 2026 10:06:58 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-1-a85668459521@linaro.org>
 <rpnNMsR9GY8gbynzeBO8Zm61JAOq3ubt6sp0x3WDPPwkMAJzlcofECD1kabN-IUoK6sSwP5P6l28UIZLFCOpjQ==@protonmail.internalid>
 <dda32577-04e0-4507-acaf-a5694f4f31b3@linaro.org>
 <478df3ed-d4ef-43aa-bb84-e2075798542b@kernel.org>
 <ec98ef2f-02b4-4086-8b4b-07b6953dbd20@oss.qualcomm.com>
 <514cf213-5778-45e1-8d70-d3fe27991fcc@oss.qualcomm.com>
 <7JNJ4dUNz4ennJ5dkzhfLSuVo72JpfZAbprICPRqlRYnSzVDJw6x3h-1nESd_PK-3us9f1V3qOiLiywsTqP8vQ==@protonmail.internalid>
 <f01c0e22-4e5c-44e7-9ea4-4bc8d53aea2e@linaro.org>
 <29e8491f-20e8-4082-8943-66bee7e3af1d@kernel.org>
 <5ca611b1-0663-4975-bd56-b1343851e5fd@linaro.org>
 <83c12dc5-fcb4-4089-9917-9f0fcc4f940d@linaro.org>
 <1b107aca-a857-4e58-a763-39c82af67747@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <1b107aca-a857-4e58-a763-39c82af67747@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04/06/2026 09:46, Vladimir Zapolskiy wrote:
> On 6/4/26 03:30, Bryan O'Donoghue wrote:
>> On 04/06/2026 01:07, Vladimir Zapolskiy wrote:
>>> On 6/4/26 00:18, Bryan O'Donoghue wrote:
>>>> On 03/06/2026 21:51, Vladimir Zapolskiy wrote:
>>>>>> Actually, one more thing, Why isn't TITAN TOP GDSC here?>>>> +
>>>>> If CSIPHYs are true subdevices under the umbrella CAMSS device and 
>>>>> well
>>>>> described as subnodes, then likely none of power domains are needed
>>>>> to be
>>>>> repeatedly described in the children device nodes, since this
>>>>> information
>>>>> can be obtained from the parent device by the driver.
>>>>>
>>>>> Technically 'power-domains' property can be safely removed, I believe.
>>>>
>>>> The policy is to describe the power-domain dependency fully since DT
>>>> describes hardware not software architecture.
>>>
>>> It brings no contardiction to the statement I've given above, the needed
>>> power domans will be properly described in the parent device, and there
>>> is no
>>> sense to repeat the properties it again and again in every child 
>>> subdevice.
>>>
>>>> Also for a very practical reason a sub-devices can probe/run
>>>> asynchronously of the parent device being active so in fact we do need
>>>> to describe the PDs fully.
>>>
>>> In opposite to the above this one is precisely a software centric 
>>> argument,
>>> which should be excluded from the consideration, as well it's not a big
>>> deal to make a proper async initialization, removing excessive dt
>>> properties
>>> is worth it.
>>>
>>
>> Right look forget about that.
>>
>> - DT requires you to describe your hardware. You're not entitled to have
>>     some other device vote for a clock or a PD you rely on.
>>
> 
> Above are two uncorrelated between each other sentences.
> 
> A device ("consumer") can ask another device ("provider") to behave in
> one or another way, this is the only possible and thus natually selected
> system design, and nothing behind it was asked. There is no justification
> for the proposed flood of multiply repeated data, it's avoidable.

CAMSS or rather the components of CAMSS modelled in the current node, 
is/are not the provider of the GDSCs or the power-domains, it/they are 
consumers themselves from CAMCC.

The producer/consumer model is CAMCC to components within the Camera 
block. Some components depend on say MXA, MXC, some do not. Nothing in 
CAMSS itself is a power-domain provider.
>>     That's exactly the type of downstream short cut we are trying to zap.
>>
>> - In our case we also need to vote on PDs individually when the PHY
>>     is active.
>>
>> In extremis say we are only running the TPG then we have no reason to
>> vote for CSIPHY specific rails or operating points in the parent device.
> 
> So, TPG shall communicate with CAMSS, there is no CSIPHY in the equation.

Right but it would be inappropriate to enable all of the PDs for all of 
the components in the CAMSS block when we can do so more granularly.

If you drive the CSID with a TPG you shouldn't be voting for MXA or MXC 
since these are PDs related to the CSIPHY only and TPG and CSIPHY do the 
same thing from the CSID perspective - input data.

> 
>> We could make the parent power-domain argument for CAMSS and CCI but we
>> have TITAN_TOP_GDSC in CCI specifically because we have to model the
>> hardware - including the PDs for that device.
> 
> CCI is not described as a child of CAMSS, here the situation is different.

CCI probably _should_ be a child of CAMSS given the design we are going 
for here.

Leaving that aside it doesn't matter if a node appears as a child node 
or a peer node - the DT should describe the hardware setup.

I can't imagine a patch that would remove a power-domain from a device 
being accepted simply because the node being moved is expressed as a 
child of another node.

>> If tomorrow we put CCI as a sub-device of top-level CAMSS, that won't
>> negate the need to include that GDSC.
> 
> Of course in this case a phandle to Titan GDSC will be marked as obsolete
> or unused for CCI, no problem here.
> 

