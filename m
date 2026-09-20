Received: from mail-oo2-f6.google.com (mail-oo2-f6.google.com [74.125.231.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A5C3603E0
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 06:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789886529; cv=none; b=N6/zujVEDwALBPCCWCTfSlDRvJfNNOT3N1IkEbumn/0tsCGh7FtSYimOLAvswO+Zz0aM+NIdXNy0gnKXno6pUVj76dX4CD6Pj9XJagW5VqWpraGeOLkbobdU4j9hgRxnISowGdhH1W9uD05jDG9hMrlkWdK1po20h/2P3ULCgBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789886529; c=relaxed/simple;
	bh=bKFyQFP+H9CKKJRClIaGqP/oH3xakPCq/Uh034txxHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NiWLVDfyNx/G6zQEffbdprBYD7hfAGUjyX07ysyiEl2+nA0VUQcI/F2u8Aa3eEk3UvbP5X4bIGwosTjWTJCZDxvUfRv273NqhbevTqohOwM0Ib1Qcqo77NFHmNql7W5Qs0vgJuIh+IIJlheRQcSoJGwKhDYcGK8OOfsJs9rc5BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mNpQXyCs; arc=none smtp.client-ip=74.125.231.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mNpQXyCs"
Received: by mail-oo2-f6.google.com with SMTP id 006d021491bc7-6b1b8f5a1d5so870043eaf.1
        for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 23:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789886526; x=1790491326; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kmH2de0kdW01Esae1dcXkd/FPy1YNazdkMTeV2gFsXY=;
        b=mNpQXyCsfKZ+q0GPbYAp6+t6bwoIw/uGc0mECXK6WdVDxQGkg4NzvvlKWkVPNAz0py
         a2C6b7Nt7XuzQQM01MyrH77sG0oGeUy/+ADMDbeUybzT7y4513IeIzA2KTxtqGA7dl8c
         PBTG7KKe/SJMms8U59TEfHU0dyGaH2Dr2MIU9d4MJNn4kmz5EH9L6WHmvw8TgW4Z6ylz
         MrF3npDCq0ay4gnij7JGDZUKLwDfKvNQs2sxBF0APl2lVkj7BGFi8uQC7/kwvz1B6IUM
         1SMDMX+SwyJHikC3T72g6BZhN1Y9LoJM6ctu8APvA3eU+mGps/jozvmufd7QT6IbhOiC
         B3YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789886526; x=1790491326;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kmH2de0kdW01Esae1dcXkd/FPy1YNazdkMTeV2gFsXY=;
        b=FJl0hYLyOyECdFMCGRRnNe4ZIwK+C+pqS/PoiDgw+/ZQbluqH0Br21vnMEBL6yN4+2
         IYYGWN9Vbyj6A2d1FC5W7uDxMzbMseEGmcj1hGc9iZdA0KqvGco3Djlrj7iMQjKW8MUY
         xfoYTWPgjgPiScFzogaSaPRF1iO2Mi8WA2l1aCjryQU0Ha9/j4vowXFqixnm2mt9ojwV
         7Q1baFK38cAT89DUy9SmsdZAkUYtVwBQK64D2Gbom77Si3CqnIefrSLZX3L7z97RPjYS
         X/IU3MolOp2aevL24PV1zMLfVORPnDCBOeWLnALYU2XoKYBeYiQcaVHll//EbFWlXhNA
         dn5w==
X-Forwarded-Encrypted: i=1; AKwUvBwoKaTHyF7C+55jAU99+amu6aGr5Zdgw7yINaWXNoST69bWbV7fkPRN9AKiIZ9SjV0+fQUTRkYlfZy0@vger.kernel.org
X-Gm-Message-State: AFuF++md6EvP9oi5JQLOGW3XpSF6KbE0tTopU0OURoNGja3Kk0j5alBP
	Z+EQVFRGPqvrHoaB+Y0vFj8dBxOQE8Tr2wxvM3wV21W2B3D/A/C0ga7F
X-Gm-Gg: AYBFou10lf/WXLxt/lrj2sdtFKgWSWwAxhfBZrMoZk8vbGIZCgaZOgLq92aFa0Yh23i
	AkrqtZ8DJppnY4BEek9GRm2baSiJEUwC3d6aAhDNHhCgzVvQwsgKroUckO8QT1BsxDRLZm+ej9s
	YfHWPWRbpxd/DTy+K1jBYkJ9KsGgF7oM+BBZ0tRUgXrqTiogBX1/nyyzQc/4OW0a9/LrSIqKBCo
	1bvuw7y8NJvHzzpbiFFlPsic9wapG3Q/SF3clbefc31EBA5KdJNQNIg8VOROhYbNUYop6hGZMu9
	1a2hR4z057IjB5tYpovfrsjz0TQXpxKZd6Fg/zSkZVoiSvgnzh97lLLaGifYG7RhXT8/n2EKrNR
	5btLfXMM6rAUPnFpHH2FgehAp3hD056L5G0gB+L8NW2IauQuZzIAOyv+vwu1tMX7Rk8TvjfW8Td
	Zw5nSA3U0QaejsrnuMOG9XWSirUI/V+6WL/2TKDJ3YM2dV02t/6V8jkZRaA45BlpINb4tKgmJap
	LdBlagwDAYje7U=
X-Received: by 2002:a05:6820:1f04:b0:6bd:af9e:a802 with SMTP id 006d021491bc7-6ca9c94f259mr6638022eaf.57.1789886526512;
        Sat, 19 Sep 2026 23:42:06 -0700 (PDT)
Received: from ?IPV6:2600:8804:5716:d800::2620? ([2600:8804:5716:d800::2620])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-48820f30fe9sm4490104fac.4.2026.09.19.23.42.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 23:42:05 -0700 (PDT)
Message-ID: <fff86d6b-e4e6-4d90-8373-3ee32432807a@gmail.com>
Date: Sun, 20 Sep 2026 01:42:02 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: power: supply: battery: allow longer
 ocv-capacity tables
To: Henrik Grimler <henrik.grimler@axis.com>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260918-rbrue-suez-upstreaming-battery-ocv-table-128-v1-1-f477ef39ef0d@gmail.com>
 <20260918082921.GA1515928@pc67698-2615.sto.se.axis.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20260918082921.GA1515928@pc67698-2615.sto.se.axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/26 3:29 AM, Henrik Grimler wrote:
> Hi Ryan,
>
> On Fri, Sep 18, 2026 at 12:36:31AM -0500, Ryan Brue wrote:
>> ocv-capacity-table-N has been capped at 100 points since battery.txt was
>> converted to YAML, where the limit arrived without a stated reason.
>>
>> The MT6397 fuel gauge is characterised per temperature by a table the
>> Amazon Fire HD 10 (2017) vendor device tree carries with 126 points, of
>> which 122 are expressible here - the remainder are greater than 100%
>> discharged, so the binding excludes those points. Boards carrying this
>> PMIC fuel gauge would need more than 100 points to describe the pack with
>> the generic property. Raise the cap to 128.
>>
>> Assisted-by: LLM
>> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
>> ---
>> No kernel change goes with this. power_supply_get_battery_info() sizes each
>> ocv-capacity-table-N from the property itself -- it reads the length with
>> fwnode_property_count_u32() and devm_kcalloc()s that many entries -- so
>> maxItems in the binding is the only cap on points per table.
>> POWER_SUPPLY_OCV_TEMP_MAX bounds the number of tables, not their length.
>>
>> The consumer that wants this is an MT6397 PMIC fuel gauge not yet posted;
>> its pack is characterised at 126 points per temperature in the vendor's
>> kernel (Amazon Fire OS, based on Linux 3.18), with 122 of those points
>> being expressible with the generic property (the rest are greater than
>> 100%).
> Allowing for points > 100 % could make sense, but why would you need
> 122 points up to 100 %? If the vendor kernel has several values at for
> example 20 %, then a better solution is probably to take the average
> of them.
>
> I think only reason to have multiple values for the same percentage
> would be if hysterersis (see for example this open-access article [1]
> for discussion about hysteresis) is taken into account, i.e. having
> one table for charge direction, and one table for discharge direction,
> but I don't think any driver uses multiple tables to handle something
> like that.
>
> [1] https://doi.org/10.1038/s41598-019-51474-5
>
> Best regards,
> Henrik Grimler
Hi Henrik,
Yeah, you're right. To be honest, I didn't think about that, and should 
have.

On why there's so many points: the vendor's table isn't indexed by 
percentage at all. A row is a fixed 54 mAh step of charge - 
step_of_qmax, which the meter converts to mAh directly - and the 
percentage column is just that rounded, round(i * 54 * 100 / Qmax), 
which fits every row of all five tables exactly. At 0.85% per row about 
one in six repeats, so the duplicates carry nothing. I should also 
correct the figures I sent: 126/122 is a different cell in the same 
vendor file. This unit's tables are 120 points and none of the points 
are above 100% in this one.

I don't need to model the vendor one to one. I measured what dropping 
resolution costs, and decimating to 100 points changes the capacity I 
report by at most 1% - so it fits the binding as it stands, and the 
justification I sent doesn't hold.

The only thing I can see still being worth raising is 101 rather than 
128. Capacity percent is capped at 100, and 0..100 inclusive is 101 
values, so if I'm not mistaken no board can express 1% granularity today 
if they have points at both 0 and 100. I'm not sure that's worth a patch 
on its own, so I'm fine dropping this, or doing a v2 allowing 101 values.

Best regards,
Ryan Brue
