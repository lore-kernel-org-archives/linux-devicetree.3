Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5853A48F6
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 11:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783336063; cv=none; b=k6LYH8ebQlmcaPcMNd9nfWu9ta0zZyBYx72wvNxA4Bl5tY98E95I53vinT0wLb2KlVwWU3QSt8xPZaYU5uq3IeX6w+5w7fD04urqYe7T5U1mVWFy3vkLKFMzBI3eOqNAIAQ09fAo8nqv8H862HYbjvYHeYvNz1rIUeXzsGQGEzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783336063; c=relaxed/simple;
	bh=Pb7Xc1kKgr/AtADErH7EMWnxZPWuIpL20gPg2uLqnAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=euMjzkxl0jSgRziEFlzOhCgMImyjEMWPL2jErmWoXugkbodFxgxgsV69kogV2YLcM/Fu68me4+TQo0NJaOmFIzvxym9kPSw0AC+LCb/RFcDfZt3AU0hP8gZAvhRZbDm6n169yv20Y1rrbaRq0Z0wGDSmNd0tnSnJebZRO01BVyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pe9Ac8NI; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pe9Ac8NI"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso29924695e9.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 04:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783336060; x=1783940860; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hwdEJkuxK+8pOC6TCcezbBHIneZ4lflSArjit6m0NnA=;
        b=pe9Ac8NIqGiPpeC9sFton1Q67L/6R1VAiAoK5n/+/gQKQPMabOHcOpEueYGw34Vm0X
         1TSE97ST3V+7+Y4ga525HjMrBsf1Ajg97RURYOe17bY1YBJPSc4zpcCIaX4prMq12Q4F
         7M9v+F1W37SXN9N8P/ot0D4eUU0xVZGtjd1GX5aOg7NroOopIFZBFMjJ6r6m/aEZ0yHB
         2z+Jdn3Hylq4EzbVMDUWOJNC9AscxuFDmagxQb1GqRIl3lRWlh39t0uCR9UMvIZLMqDA
         sVyMvaeSPUimgnqrNkPJf+yx9ECDkEVteGotj3VkHc8653gyMPlwuFs2eMtoNsfSxiGM
         BTtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783336060; x=1783940860;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hwdEJkuxK+8pOC6TCcezbBHIneZ4lflSArjit6m0NnA=;
        b=aHbUBtcV5CSAsY0EZPyE9aiYhIoc20MEcaYhWAssl+gi9F4IfvZ6YVgV0a6ECQGRoh
         8Ae1myb3+w/VazA7ywWoYzF46IK8NZQYjdqA+guVvMlK/8P+R9FvMD2/ZfO7BcQ10eGY
         qAlsPqDUbiZy9UVDda2STpLINf+HrpD5CA0EWgN2/5F7yhlKNjjlv4XieaTmEiJnc1nq
         AWLDqTUbuRfdBWsN8E+0yVAutZSaEVR6hGp66PiLxLsE5zWKOd4GbaHoLSbNKAz+SIaV
         0UKYMKbLReE8N61BG05wPoq4ZVeOJLzVKPFjZLtnMaBct8roE21tcixedWQfg+NCUleU
         pUvA==
X-Forwarded-Encrypted: i=1; AHgh+Rq7PiMgz8I44h92yCdDU/JbSZRCoTtaQRo2Xu1FWPSmgU5QKQ/n8wRmt6/w9ZZYWFMFn2q23pTXVLvS@vger.kernel.org
X-Gm-Message-State: AOJu0YxTFat4A8bpj0AwnFi0DY6EQF+jcl8cMHLTNxEwrLL7bnoFdf80
	NPTk+EIvX6yr98ZTOyceWcVkb/kuhqt69D9HaQMZ5a/E6jrnBnZMnCA=
X-Gm-Gg: AfdE7clBvAPDkd2j+skO95oA1lB7kcNib4eiUfcYfvWQdDEpKZn2iDSMMqu6Y+W6fnL
	UcvXPbTzimIkJ41BtpPMCV9mCJEwkiBs5pv1nCNnORat/gLLdVGmkQZJ5G4CVEl2SxrZbjirmKq
	d5irlmGG3uwm7T9Uu+Rh2iQUzlqZ0FR4NOeUJjPPWgx5uCiKkw4mvpXPk31OY9KtfTqqm8B/9cT
	LA7MHSOPIcPbLt1jmo+0dKcgAVYwO9jJ2v2SzKJrFj0IvNz881FpxcFdvmfvn2OhcP6hCELCO+f
	Iuzg1gcqj2UUEdn3r3l17pP64hrjgfblZ501b3V3V6raPUVh27pr9afYqXR6bI5X1VCLPi30Il2
	DoaQxDiQ6SjFW/rQzPMrx8YjDhSt1nnWsxZwUQwhHPz+ZbaCHelW1YLVNVEmWcWV68es0d6+25I
	Z5Ip0/Pl+mhvijX+Hwxurc5EJnRxa7DTc2wJW7BI7BaGZDvWjl5jmKYggvKACSghUuisj5Fg==
X-Received: by 2002:a05:600c:c16f:b0:492:523f:a3df with SMTP id 5b1f17b1804b1-493d52ac417mr90419125e9.5.1783336060307;
        Mon, 06 Jul 2026 04:07:40 -0700 (PDT)
Received: from ?IPV6:2001:b07:2ec:601d:4b26:1672:75c7:805a? ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce12c40sm463102745e9.13.2026.07.06.04.07.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 04:07:39 -0700 (PDT)
Message-ID: <64a919ab-8b36-45fe-8da8-5eaaf4d55359@gmail.com>
Date: Mon, 6 Jul 2026 13:07:37 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 10/13] drm/msm: initialize LPAC ring
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-10-01d50c3e0c99@gmail.com>
 <93b78299-866f-4a3c-9423-a990d9a7d4cd@oss.qualcomm.com>
Content-Language: en-US
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
In-Reply-To: <93b78299-866f-4a3c-9423-a990d9a7d4cd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/6/26 10:44 AM, Konrad Dybcio wrote:
> On 7/5/26 9:13 PM, Anna Maniscalco wrote:
>> Program all the register needed to start up LPAC and send initialization
>> sequence.
>>
>> Additionally, now that the LPAC ring is live, make the code aware of it.
>>
>> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
>> ---
> I believe some/all of these writes need to be guarded by if (has_lpac),
> as many GPUs lack these registers and there may be side effects on
> others

That's correct yeah. I'm not sure what has_lpac should be though.

Something we add to catalog? Or checking if it is a gen that has LPAC?

>
>
> [...]
>
>>   		a6xx_gpu->shadow = msm_gem_kernel_new(gpu->dev,
>> -						      sizeof(u32) * gpu->nr_rings,
>> +						      sizeof(u32) * (gpu->nr_rings + !!gpu->lpac_rb),
> Should we rename nr_rings to something like nr_XXX_rings
> where XXX is some uarch-generic (i.e. not SQE because we also
> support pre-a6xx) name for the main number cruncher?
Qualcom calls it GC so nr_gc_rings perhaps?
>
> Konrad


Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>

