Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38DC39C01B
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 14:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777471208; cv=none; b=bli3lk5+aKRa6nSKHBbtybdXTEey07yxoO5tFib2umL8z8JV9kvqv/8oDYsmWUjnwgf89S4AAg9ZdN+DRMoBs94mDcgs+MqcMtmniwu4pGq+YzMuEXjdTrjaQbjxcbkYmsmcitSw6MRRugTDQTajOa/M77U2Nc4PMchf50aDzBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777471208; c=relaxed/simple;
	bh=uybU3a3N0n0+jby1CmvCwk1L1SefcxFqIYnY1BYddAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KUu1PWP6VpALsCHQsT3u/jdqEOrpoihH0bztieS2AakMkr3feMOiXDFSyjlkdfGn5pETrj8CSdzK4fS7dRg9McKOn97P7sQCLfydZsUT/PXFTyjtFO5Xh31SmT4oBQEdcyqQm38TreaJh5cVAZ5/Fw6tYtN05rmjdA56qGBdi9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P7zk0ysO; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P7zk0ysO"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso115861525e9.3
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 07:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777471205; x=1778076005; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pXYxfb1OnKvjy9v+vQDtCcuNHO3JiDi1MdrPDxdzPQ4=;
        b=P7zk0ysOJwpHyy8cq3jU90wKdQzRX7wJ5xMMnzfnyYD68WMYiRASlgXSymdvBMViOf
         Pkmf86ehTdzam7/qK2khMwFdKCv/uCbLKiDZ+CjxmbanaSUBigNoSRLaXcM7Mlewwmnb
         EjCc0D86H+4D7bqvEaFFZ3gx/C8t8FgAvhxorjS6xuRNwQp78mFYGbrnlaN+8xX3xfLi
         mQ+7JDFUAC/HY+SBnjzVaFQcwKzBzuAwLSYm/P43otKqgRqvjYKmqzWoO1YTa4YU//+5
         nRAeDy0GXShbn3i+93fNzcMHw6UyENf99L/JYMOho6xhHtB/s1OWzwB9k0lPaAzcv2N9
         L94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777471205; x=1778076005;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pXYxfb1OnKvjy9v+vQDtCcuNHO3JiDi1MdrPDxdzPQ4=;
        b=sEwSgRRLjbDVTX8+r2GxDIAWaeDKMt3VIRlO4GjLs6eCg9f4apMMKF6nYnqDA49SAL
         po7Hste7xrMHbiKlJpyDtGG/LV79Lkq5a2zolyOgAxmAkDIkaqP7p5VUpnm/cqBv9IBg
         la1tAg6HmMMn7i+OE6zfanMCMCrRxovyxMsT+dRcnJP1fVASM1VRTc0f4GmxCGiX4VBj
         v8BLghBbAS3CIJynIyUnVrkB7NLmzdEmqAzL4qNsWmWnzCooYApSW6J5Wka81/FhA4hU
         32OWFjlko8AWMIgYpB1OYkklQowMjDAwg0czDXFRTHkVLL0ck3/eoeeDIyC2m1Y0K/Ae
         GJzw==
X-Forwarded-Encrypted: i=1; AFNElJ/cmMr7s2PqkIsWkie/rItFSMV+oRL2pFPnUypG7sv2e2uM6JCoR4n8YqZd3gzzdVRUJJ6HCSy50jyT@vger.kernel.org
X-Gm-Message-State: AOJu0YyZxosfHvSkW6TD3/rAOiRC/GOF0f6XmHXFKYEzS68jv6ytChjt
	vDxUBC/Na1Dpvp1dLujLAluQbBt8LBaBo84uPxST1Iu/JU4MrxK2W8BO
X-Gm-Gg: AeBDievfOb8bFCpK/4YyvIGjeA9P2khbQ0vzkC1egl8d3caov/C+MgU3b1gmwZQhdzv
	Bok+ORvNL1CBpSsjAayAkB4sQZiuKUgM2hr83qxRyDS+bK26ud1AZWwtW2/08Rw/j6aQnK4y9LH
	8D4i4BwkeCu0FS7L6tZhBSzgk5y9cEHpeWIm59aYXrE9+jorwtwYHpiu/M13q30Vyj5nKNeD2j+
	YiJLyRiJUGxV2PLU32+v57WFzRL81+Hz4IY9COCM92+BKhKddeFTB5ln9ZX7EVSVRKxGmwHNLUX
	cGKqj5gMML8dL2qbyxE+Wtgf+xd370JrQH1+bANZpv1KKkthZdGrc/Rd8bHSHbHhCbRcSOdoXK5
	qRwQdSfKWRFtqbbiuZRp5B3G/lJl7erbGYTrj09vUolRTkOa0IVlJEzl4qLC/E+uLmNO/ltyFrY
	W/tpasb1I1uBNMxs/dKZHfkgbbO4bydMiZrG7GfONpYeLzvbvpB6GoKn5PnN5FOU5ZYO9/T6Neg
	Q==
X-Received: by 2002:a05:600c:c048:b0:48a:6268:18a9 with SMTP id 5b1f17b1804b1-48a782dd8e3mr77937175e9.13.1777471202791;
        Wed, 29 Apr 2026 07:00:02 -0700 (PDT)
Received: from ?IPV6:2a00:f502:160:68fe:a26c:adcb:8da8:2? ([2a00:f502:160:68fe:a26c:adcb:8da8:2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b4216eecsm5409919f8f.9.2026.04.29.07.00.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 07:00:02 -0700 (PDT)
Message-ID: <05df6383-5325-4f88-9638-22bc2d7a768d@gmail.com>
Date: Wed, 29 Apr 2026 17:00:00 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 07/11] clk: qcom: gcc-msm8939: mark Venus core
 GDSCs as hardware controlled
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
 <9kBbj8Jr-f6eqC6XfnJPf3gKQD-3WfzXgzl4KEVKhRZlW2_GftgFBsijqUgEvGcgmeFqPwtVquMmibHUMaR_sQ==@protonmail.internalid>
 <20260427-msm8939-venus-rfc-v3-7-288195bb7917@gmail.com>
 <0ee6bf23-17a3-4a7c-93d2-276e97cc3a14@kernel.org>
 <1120b76e-3c98-4f32-821f-baab667dfc38@oss.qualcomm.com>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <1120b76e-3c98-4f32-821f-baab667dfc38@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 4/29/26 12:18 PM, Konrad Dybcio wrote:
> On 4/29/26 6:14 AM, Bryan O'Donoghue wrote:
>> On 27/04/2026 18:58, Erikas Bitovtas wrote:
>>> Since in downstream kernel VENUS_CORE0_GDSC and VENUS_CORE1_GDSC have a
>>> device tree property "qcom,supports-hw-trigger", add a HW_CTRL flag
>>> to these GDSCs to indicate that they are hardware controlled.
>>>
>>> Venus core clock cannot be enabled if Venus core GDSCs are switched off.
>>> But since they are hardware controlled, they can be switched off at
>>> any moment. Vote for the Venus core clock to enable it later when GDSCs
>>> get turned on.
>>>
>>> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
>>> ---
>>>   drivers/clk/qcom/gcc-msm8939.c | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
>>> index 45193b3d714b..420997b00ae0 100644
>>> --- a/drivers/clk/qcom/gcc-msm8939.c
>>> +++ b/drivers/clk/qcom/gcc-msm8939.c
>>> @@ -3664,6 +3664,7 @@ static struct clk_branch gcc_venus0_vcodec0_clk = {
>>>
>>>   static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
>>>       .halt_reg = 0x4c02c,
>>> +    .halt_check = BRANCH_HALT_SKIP,
>>>       .clkr = {
>>>           .enable_reg = 0x4c02c,
>>>           .enable_mask = BIT(0),
>>> @@ -3681,6 +3682,7 @@ static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
>>>
>>>   static struct clk_branch gcc_venus0_core1_vcodec0_clk = {
>>>       .halt_reg = 0x4c034,
>>> +    .halt_check = BRANCH_HALT_SKIP,
>>>       .clkr = {
>>>           .enable_reg = 0x4c034,
>>>           .enable_mask = BIT(0),
>>> @@ -3753,6 +3755,7 @@ static struct gdsc venus_core0_gdsc = {
>>>       .pd = {
>>>           .name = "venus_core0",
>>>       },
>>> +    .flags = HW_CTRL,
>>>       .pwrsts = PWRSTS_OFF_ON,
>>>   };
>>>
>>> @@ -3761,6 +3764,7 @@ static struct gdsc venus_core1_gdsc = {
>>>       .pd = {
>>>           .name = "venus_core1",
>>>       },
>>> +    .flags = HW_CTRL,
>>>       .pwrsts = PWRSTS_OFF_ON,
>>>   };
>>>
>>>
>>> -- 
>>> 2.54.0
>>>
>>
>> The downstream opts to put the GDSC under hw control, which is not the same thing as it being under hw control, its up to you to put it under hw control.
>>
>> So you might want to be more conservative especially given you have a problem getting the encoder and decoder to run simultaneously - I might try parking this patch and then see what happens.
> 
> i.e., Bryan is asking you to replace HW_CTRL with HW_CTRL_TRIGGER
> 
I tried to revert the patch and replace HW_CTRL with HW_CTRL_TRIGGER -
both result in power collapse fails.> Konrad

