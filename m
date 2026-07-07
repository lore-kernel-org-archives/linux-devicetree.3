Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C163D9537
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 10:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783418424; cv=none; b=aNuw2aQ7BQRrKVGIzZHxIpaJPK5/w9BWjtfHiwEvc9MChNV3ZNYkAWU6duna1Xbes9HdzRr1vWZ+6MVoxsVUfR+tCOUzvWuoW8KOCuxpMnQHfRe+veQ7RiAB4Z+DY33CS6RrzAiaKPkPHOGPjRgxQp3Qp+9QLGlmG6zyO450Cj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783418424; c=relaxed/simple;
	bh=c65QzE5czqSOaABx6iCERkye7OSrbiesQtziyTE2+8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U2UrgQJC8ACaw0ds0LHb3Ts2sxm2K7o0MAbExDoMnl73uLp3av7MJfHfNuM5d06X4IUOvpsU6+SkXRjW4aplCkJaLiTe3Pq27YfN0jeKWSmLGzw2clXZ9tZSbHhAQ7GF6FpPkA/LTsHVHRDy/33voVLU7azhrOZwk9TLf63IJdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Kr3Pqo5F; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kr3Pqo5F"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c08acccf4a4so490283966b.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 03:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783418422; x=1784023222; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tt0tjY8MMdm3JERGeSRwSamQ24kIgaZWAm0yZc7K9yc=;
        b=Kr3Pqo5FDWXEItgiRg8OADDOHEc6Brb5ldlQs200ojVhoCPOJjcNfFEcVEcqFhaAMV
         jlXZFSEBnQqGCWlg2LF3yxFxzY2dgMk/9SohJBpDVADHRWYGH08Zj/3S9VY0xREgIGfS
         JxyZbV2ClZr7g9pGkYCe8wj0RWMMr7UoekvjehhmLK0nWxPGCqwX76yS+JFbcTljsal4
         nwuDZ/xvpPrFEAQfxsIMRL2KTYXpqpdX71Ak/il8FkCAAYksdLV95lcpef9THWHiJs/u
         exOPf2Xz0YjnrdpF0qHOuUnXBZoo5Qx19oXyoJz00ZwE5z2evavLENTTDeCJDS178pSE
         cmug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783418422; x=1784023222;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tt0tjY8MMdm3JERGeSRwSamQ24kIgaZWAm0yZc7K9yc=;
        b=gs7s4B+V4zp6qzOT+rJzxvZsfF6B2Suk1Wj9UtB3bCboyegBf/yNdgueR2YIpjXToO
         8xX+K40TnmAv0i35ZFi6YamHoT1kkerwoYs8L6y7p+jzsIISAUrHO3XAstYiYJFWF9hA
         oGTdsMNl6k0bgu8Ot26GUST8hN8ey3xUXsLF46bf2FUedB8krVsMyUvHDqoLj2tv5y4V
         j7iGTvKoKnMUDBQ/CX3pV/si85iZuTOEy4pKWKHZh1IA2zdtrKlTf0YCJF2qKwi2+aHD
         +XpunRIJCZ2ki7uMvs7fe3oroNj/Ged9couJgVekf3rCPW4Wm+d9hPy7fadffuqbcqI/
         nQiQ==
X-Forwarded-Encrypted: i=1; AHgh+RoDYlU5Jq7OgIXsZF9Ov89h2pRMhbpWauzvXvFVYMu6tyfgZdpZ8sBK+nkLfa5Hc9SVqmrB9pDUS6Zi@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4ny7nQZ/P2Rw29SaBI8Wrekdd17r18bbFECe9iQYcTyg+hIMj
	1X6/bQK5PNAfhFitPN3N8mvhpe8QvEyQ7mN3/HV5UKP1/gLm/dp3Xn+Tf960tkKs7ik=
X-Gm-Gg: AfdE7ckzQpKX5p+Wt2jGIRkqA4ORjv/EbDh7sRO7AIIRCLqO5k//ur3iGoEZwjen3XJ
	UizY5cbtKQgC4vCDvWYumRve2N2Bbxz5ymc1Xh8hsPArwJF6v7Q0L1mb2qnsXi77oiGaGcUxy/R
	F96D6IMEH3JArZ+tWn4Iur+g3SiG3qL5TYLTl56O7a3b+Qi9Xo+Om6kDQTNIMezLXHd9FWb0Lbm
	ht4tgcoSzLTwru4qfLaOZsU6flrzjW60AzbS7m91PMbTBaE+AAgywBtrzurlriZPn4Y3AGkMJav
	vNJvijAhD5yNAHMqlsL/PIiUBB4xFTOVaxZkQOZU/EEAuowPxQNtKJbDLoBx9sfgKMLO0OwCzMn
	MiPnQR+n4IpYPueR/8vETidn//bt81fzgVsoZE7NW+3V4YGBe0+Y6nvXKP2egj7dCcFcRp9jwew
	6Nk17imV5hym59vqj3BYjbmDsn
X-Received: by 2002:a17:906:22d8:b0:c12:7eeb:d2d5 with SMTP id a640c23a62f3a-c15a68d04efmr200611666b.33.1783418420861;
        Tue, 07 Jul 2026 03:00:20 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.92.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15adb4416dsm98263066b.56.2026.07.07.03.00.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 03:00:20 -0700 (PDT)
Message-ID: <c8c38ec6-4422-4c91-a249-20bc20260e73@linaro.org>
Date: Tue, 7 Jul 2026 11:00:19 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>, linux-media@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <68e59764-5a10-4abc-849c-14ea2d9ef76e@linaro.org>
 <d74d7839-d126-427a-b151-ca895a27a83e@linaro.org>
 <437d1eb0-4495-406a-9501-b0515cfa3151@linaro.org>
 <e04cb9dc-76dd-4fa8-92f4-be002bf7ee8b@linaro.org>
 <8116c54e-4050-4e9d-b236-59d74846bd57@linaro.org>
 <8a09875d-af5f-438b-b947-bc2b61219b70@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <8a09875d-af5f-438b-b947-bc2b61219b70@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/07/2026 10:24, Konrad Dybcio wrote:
> On 7/6/26 3:37 PM, Bryan O'Donoghue wrote:
>> On 06/07/2026 14:02, Vladimir Zapolskiy wrote:

>>>>
>>>> The idea is to make all of these peers, eventually. Not particular block
>>>> owns the TITAN_TOP_GDSC - the entire CAMSS block is a collapsible block.
>>>>
>>>
>>> The statement provides the same information as before, e.g. it's found here:
>>>
>>> https://lore.kernel.org/linux-media/fbc018f5- c025-4747-85f2-53b45b0f0496@nxsw.ie/
>>>
>>>       There's no functional linkage between CAMSS/IFE and JPEG - they are
>>>       peers within the CAMSS power-island.
>>>
>>> Thus "the CAMSS power-island" exists, and it got its hardware description
>>> as the CAMSS top device tree node, and TITAN_TOP_GDSC power domain is
>>> a natural resource of all devices on "CAMSS power-island",
>>
>> Vlad honestly, TITAN_TOP_GDSC is provided to the CAMSS island - all of the nodes within it depend on that and it is _external_ to the block.
>>
>> There is a CSID MUX on some SOC other than that I'll restate it again, I'm not sure why you won't accept it.
>>
>> There is no dependency between JPEG and IFE, one is _not_ subordinate to the other and trying to find ways to invalidate that statement runs counter to the facts.
> 
> They are all subordinate to CAMSS_TOP - Vlad indeed said they are
> peers (i.e. there's no co-dependence between them specifically, but
> their parent is shared).
> 
> You can't use any of these IP blocks if you don't first power up
> TOP because of the physical layout.

Yes and I'm asking for TOP to be listed in each of the subordinate nodes 
for reasons given below.

But unlike MDSS - OPE for example doesn't require IFE or CSID to do its job.

Over time we can move the bindings to a model where the only thing in 
CAMSS is a top-level bus like declaration but _right_now_ what you would 
do is create an artificial dependency on say CSIPHY for JPEG.

> This is exactly identical to the MDSS case.
> I was hoping this was clear after N other similar threads.
When we split IFE, CSID etc up into their own individual nodes it would 
be possible to model as for argument sake

compat = "camss-bus";
power-domains = <TITAN_TOP_GDSC>;

jpeg@x {
	power-domains = <JPEG_GDSC>, <MMCX>, <MXC>;
};

What I'm saying here is do this

compat = "camss";
regs = ife, csid; // exisiting bindings for the last ~ 11 years
power-domains = <TITAN_TOP_GDSC>;

jpeg@x {
	power-domains = <TITAN_TOP_GDSC>, <JPEG_GDSC>, <MMCX>, <MXC>;
};

Otherwise you create entirely artificial dependencies between IFE, 
CSIPHY and JPEG, OPE et al.

And BTW if/when we get to the camss-bus stage of things having 
TITAN_TOP_GDSC listed in OPE and JPEG is a very small price to pay.

We've already agreed to gradually transition the bindings instead of go 
for a big-band integration several times.

---
bod
