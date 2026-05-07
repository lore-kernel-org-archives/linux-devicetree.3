Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C21337CD40
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 09:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778146548; cv=none; b=Eur6/7Bz59S8NOYFHZP5KMsxEzC2UE99U0Gaw1onNJUs/o8rYyYlJ1TJ9Ks1KbIeyvswJlQWQEFhV5bB0vgEsYEYv3n1cX3i68J/mSJ/cAmmtH6lNOJ8o2c2P/8H0MTynGR4mw/Xsmti9n+kICbEElqQu4S5O/hxCMXJrSx5wWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778146548; c=relaxed/simple;
	bh=+3dXKo6HEaUqbiU1d7YF8vYNCW370gD7bBjtPgCjrC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mYYuPxbKwmX60JdWG4laSErFEtSeT0PkNLscQUJYeUVqY++FYE20dNIdWb8T5rXH/N4G/DgtaFWMMF3V8pVy7JlBGqSO5UT9cK9LaLvSc5GOVyl69Rl7uUSAmLJf0peMXSD535/HhkwuI6LqGgTiv5aQHb+GK3VUzqNBZXhSwXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HToJXD+J; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HToJXD+J"
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-364f7c42c62so468550a91.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 02:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778146544; x=1778751344; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JUkIjpcmnqAY6snj5K4KsoGXaSrVhFlzy2v4P9fV3pM=;
        b=HToJXD+J506QCMSh0DddG91zeZL31eJ0besnF2YsJ8yfu62YcvUwSmA0d55atHDhki
         78abCjPpM3c1o0CoJKt7/ohxBuh1U7AhVHvX1fPB0Am6xwsIfF0oLCxdGX+68b3JinRu
         3xwYesbeMHMrHFAd7qN7o3OJ4zdHyqiXq3HgwR88I5x/lihLA+VfNNCqmrEyDzLT6uUK
         JWnlwuZnXaGezzOGFLH3TCwPzEkpaPz/GUJ0jeDbS5wRMySduxyo1U0wIszaiw/Kng1A
         b3XyyLHAUw5q9SIZ9MSJqT24LGAx5jpmJTmLMTnSI3APGjCcxt92o2nAh45b/tq6Gxkm
         MKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778146544; x=1778751344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JUkIjpcmnqAY6snj5K4KsoGXaSrVhFlzy2v4P9fV3pM=;
        b=sbzZXLjF+fzmwpNb99C/KMTLGaxZR8SMgecGBlPV7G+nX/Aoig1SbpAAYxGiM2rmlM
         Vkg3wCu5C3FLwer3R1CG6GsXKyKnn9t4EBaHc/43WZR7VAQ+gZhTuCzItI9dgv9cKyjO
         KlSkgaWUvREL4Ro8Vb+fwiQ3H/asFBQrtf8DLYmiNpzZeW6v+5KN9O+0uy2fI+j1yb6k
         nKNEshOhBHZAZeUKSzH2xgeQOYRQpAuVtfbp2UhH428nB7THoTNFa4oZEJrOdox2agtl
         bxle3BS1zyDbuwARMpZvxsx2Cq7giDFs94Uo5IIUnUeSknHxxjqKDyI4NBNiOYLHacGd
         JGpQ==
X-Forwarded-Encrypted: i=1; AFNElJ++Ha5Ow2rggPb3ZzJclD2IS6h/qm+Mv/Hl3iraz/N6EexVSKoqSY8YsIwpT9Ylx/dy5D+KKIZ60rlM@vger.kernel.org
X-Gm-Message-State: AOJu0YwOAG4BBXxm+T0gOvAsF33HGLznJ0VHgy5c78is31qSWSY2gudk
	hW9C4S8f4xO9TaJJHT6x3xBpXUG56oVPVOMQ9XKhDrAxE/v8NQjHJT0g
X-Gm-Gg: AeBDieuuCNuZnf7ap7JFijvZvZrHsDvtVjaEnN3lZvYE842GsJJk5JqK4an9KPaDXMm
	6FXhDzJkchTmgU4w8v+yJ9loyFFmbScRIGuJjMN7c8JOkeCIm10bROqjrY7dFezOXpWbFj4i7vO
	GF8KidPEZOpwG10KBDffg0b3GsZB3aoK47cOdsUsJwvU6OYWVK7wYLMKCQsDX7ND+MiHCoImQZC
	ohYx5WUd3loJzKz2ON+wUJ8t279LyL57eU2Dt/PHDM8cymdjd/DBFrccWHx5IY7MACjpOK9lPXg
	Poc0v1H4avaHdNQc1tTM8jtrzmB5sTNqP0Uu6aeKN9cWGlVWf9ouECkd1Q70DYn5x9pS4pDkNN8
	RXcPr9RUZqwf0OEf0QbR/nr9b/3cLeyssU+/F70rwMcidH120AjDTX3An32h+lYJbHGAykWANHl
	+Kts3GuRhMOM76X6HfdZAD5/6Zq9vsh8iyHFuS9AnNdA==
X-Received: by 2002:a17:90b:1c8b:b0:356:35a5:4a64 with SMTP id 98e67ed59e1d1-365ab9b8e5dmr6393838a91.4.1778146543874;
        Thu, 07 May 2026 02:35:43 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b4c19387sm6651310a91.7.2026.05.07.02.35.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 02:35:43 -0700 (PDT)
Message-ID: <1a8af3cf-5edc-4ca4-b340-12ebeb2ed982@gmail.com>
Date: Thu, 7 May 2026 17:35:33 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] of: reserved_mem: reject reserved memory outside
 physical address range
To: Rob Herring <robh@kernel.org>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, akpm@linux-foundation.org, bhe@redhat.com,
 rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org,
 ruirui.yang@linux.dev, corbet@lwn.net, skhan@linuxfoundation.org,
 catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
 kernel@xen0n.name, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, saravanak@kernel.org, chenwandun@lixiang.com,
 zhaomeijing@lixiang.com, everyzhao@126.com
References: <20260429065831.1510858-1-chenwandun@lixiang.com>
 <20260429065831.1510858-3-chenwandun@lixiang.com>
 <20260506015112.GA286568-robh@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260506015112.GA286568-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/6/26 09:51, Rob Herring wrote:
> On Wed, Apr 29, 2026 at 02:58:22PM +0800, Chen Wandun wrote:
>> early_init_dt_reserve_memory() does not validate whether the region
>> falls within physical memory. If a device tree incorrectly specifies a
>> reserved memory region outside the physical address range:
>>
>>   - For the non-nomap path, memblock_reserve() blindly adds the region
>>     to memblock.reserved, creating a stale entry that refers to
>>     non-existent memory.
>>
>>   - For the nomap path, memblock_mark_nomap() silently fails to match
>>     any region in memblock.memory, but still returns success.
>>
>> Add a memblock_overlaps_region() check at the entry of
>> early_init_dt_reserve_memory() to reject such regions before any
>> memblock operation takes place. This also simplifies the existing nomap
>> guard: the original "overlaps && is_reserved" condition reduces to just
>> "is_reserved", since the overlap with physical memory is already
>> guaranteed by the new check.
> While I agree, I suspect we already have cases abusing reserved-memory
> like this.
Sashiko reviewed this patch and told me:
"Historically, the reserved-memory binding is often used to describe 
hardware
SRAM, DSP memory, or IOMEM carveouts that reside outside of system RAM."
IIUC, nowdays using mmio-sram DT binding is more appropriate for SRAM or 
IOMEM carveouts.
Should I drop this patch or keep it ?
Thanks.
>
>> Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
>> Tested-by: Zhao Meijing <zhaomeijing@lixiang.com>
>> ---
>>   drivers/of/of_reserved_mem.c | 15 +++++++++++----
>>   1 file changed, 11 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
>> index 9d1b0193864c..03c676052dab 100644
>> --- a/drivers/of/of_reserved_mem.c
>> +++ b/drivers/of/of_reserved_mem.c
>> @@ -112,14 +112,21 @@ static int fdt_fixup_reserved_mem_node(unsigned long node,
>>   static int __init early_init_dt_reserve_memory(phys_addr_t base,
>>   					       phys_addr_t size, bool nomap)
>>   {
>> +	if (!memblock_overlaps_region(&memblock.memory, base, size)) {
>> +		phys_addr_t end = base + size - 1;
>> +
>> +		pr_warn("Reserved memory region %pa..%pa is outside of physical memory\n",
>> +			&base, &end);
>> +		return -EINVAL;
>> +	}
>> +
>>   	if (nomap) {
>>   		/*
>>   		 * If the memory is already reserved (by another region), we
>> -		 * should not allow it to be marked nomap, but don't worry
>> -		 * if the region isn't memory as it won't be mapped.
>> +		 * should not allow it to be marked nomap. The region being
>> +		 * physical memory is guaranteed by the overlap check above.
>>   		 */
>> -		if (memblock_overlaps_region(&memblock.memory, base, size) &&
>> -		    memblock_is_region_reserved(base, size))
>> +		if (memblock_is_region_reserved(base, size))
>>   			return -EBUSY;
>>   
>>   		return memblock_mark_nomap(base, size);
>> -- 
>> 2.43.0
>>

