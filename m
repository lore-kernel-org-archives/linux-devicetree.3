Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F14F377A82
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 02:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787106380; cv=none; b=sZkB3AM1wcemXTmz1B3J0zORNB6RmuO6bOdWNNnnC+/+mQAZQ1vMF3UMe5YHQa/jDY2oOmdLc1upjTSDy8kTJtJ3qsSJFV1NVzxoL0C/1GM1LjVKvKnSGqC8+uWRpwRuXUoClBqHsRTXcmy7dZ/Xfxw9B5Wje9scpoit80e9wAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787106380; c=relaxed/simple;
	bh=qazxamjoH2Xy1KPVpv0kZxqu4RKm+ETWt2t3cZLYUDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cY02PhhAPOOuk/iL4svch1NMY5yOMbb31sN+cmUljjfG9HtbiGCYme6XXAbB0vieunonExPJ32Uzc83h4v83G7l+U4J93Emi9LphyIhi46QnQDGS6kMakcdyHFw3hWQSlkwFwPligOs+dE2bHjTfKIKDyTMo4pIGwou+9vQWHkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S3qX0a09; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S3qX0a09"
Received: by mail-pj2-f11.google.com with SMTP id d9443c01a7336-2ceb5a39c48so1598535ad.1
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 19:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787106378; x=1787711178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T5IxWmYwvN+ZrZRWP0i8YU26WhkfeAXlzQMWL7fTyjI=;
        b=S3qX0a09vx72Um6RbdAIvXZ9fy8CjuvsivXxV/7dslAFW/K1I+8k9s8cjZW4y9naAr
         guGvbTyijFe58xWKPKn/8wQmTrQ28yLQd8e1P9j6BlXURK7vFWu+LY1KfljZZHi7dDRr
         TmpC+wkASz7kxs7c3PZCVc1lkPEz28sL0ZIdFpHJnuLgweZuK3BtwXXon5uzFwVIz/dH
         9GQcmIkOnnyGLPjFlkBjP95IIThAgROFK3gy6ukQ2AzyHE5hyihoJ1uyirZwgPfJAA7N
         VIYmJQqwHEXrkH7xq6OI7sXewNTP+Jkr9q651jXYO6zy+aI2bU1FvtWJvLt1kgsqvzAg
         LCpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787106378; x=1787711178;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T5IxWmYwvN+ZrZRWP0i8YU26WhkfeAXlzQMWL7fTyjI=;
        b=m6hK+8AGdnhmrHzKclVVE/3Qizv84BqikKRllIX2CHzj4qlTXObBtnITeoUbXLJ0Ns
         FxF2uDciBsHTD9H/hGH1FAPzGP/lAjY/z4tZlJQcGGpmluoVJhGSaS24rsaY87wbQCPQ
         Vuww7uLZUYOYqsuiyQKeSC7q+dtpuiDy49/Mhg0W+/QGguj0x1/TFM00K2Pou8GX43Ke
         awjq8EVeaxTTVxjSJf4jRTCZjd+X3OMlUE6VNeYKtyxQF+JOgXkeUM4eJjzExZILvapo
         hPmgWga9YsePrHxe6Rj5bop6p/UbtOXi5qsPKDhCQbBRxFlu/efMQn2UppthYigz84Pz
         OCCg==
X-Forwarded-Encrypted: i=1; AHgh+RoqjWZFFrfQCIlD1fkYL6+k3Lsf/JxU0vrTyoSxRk2mi3xJZMQs0o5/wPHN4K2QVCTpGl6nmXcJVy7K@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8FEvuQ9+g0YgmE/7/2pmdwKfgSiQ3dh6FWTimL+r3b8573X6p
	sCpmDd+rcHY/GrAYJOuTTl6X0i/DwuwaYccl+RQjNdwVhF9/rcqF0Xvl
X-Gm-Gg: AR+sD10Y4tnS7mioxsnPEUdWzfoDDqABdMfldXg8halxxYrc/HQAifuiNBv24gEl0uF
	4Rbpcni/6x7iuYdGn4xCDOFk6QCrV4eUzsiF+qlvjcqt1ftnDWPYdRppeaf9GLM51bh12FRntgM
	MAwJ9/AmrqbBOfUzJsj+RPh4/yIRFlH4oK4SoYbQiESSVPRg1W/gVQ+KxlcGMKaEGY9n+0iZLNW
	5+oD1pN+MbVlfpn5S6v2j237Ug+Re8a3oxxfk/1HkLDm9hy+xyQe+WIZdolW6llxDh4ppVegefY
	ijkMw0DppwBQ+6JC/1/RgZxFctIhfKiQej+foNcAM7KWLiqnax/0yr0tPlFn4ebrF5tNZzu3XiB
	cASX2cGUUiqhOP2Hszc6MB4/bKRkhxrQOCEOviGNkE3aDENfijgqCApd3cQjYZuQyBpagihn6/n
	8goVDM1Pe2gRCp2dUDgxEhw5DSMbccptd3J/vazIiliJfOrzfiiR/mNzpSxAOyqhgQJn0=
X-Received: by 2002:a17:90a:d60d:b0:392:6638:2e6a with SMTP id 98e67ed59e1d1-3958146f387mr2294894a91.13.1787106377629;
        Tue, 18 Aug 2026 19:26:17 -0700 (PDT)
Received: from [10.125.112.20] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957f84ee0asm328627a91.3.2026.08.18.19.26.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 19:26:17 -0700 (PDT)
Message-ID: <bcf4d827-fbd5-413c-8db1-c62232ce9641@gmail.com>
Date: Wed, 19 Aug 2026 10:26:12 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] of: reserved_mem: reject static regions
 overlapping no-map memory
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260818092420.2859026-1-chenwandun1@gmail.com>
 <20260818092420.2859026-3-chenwandun1@gmail.com>
 <20260818094051.50CD11F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260818094051.50CD11F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/18/26 17:40, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] The patch provides an incomplete fix for overlapping reservations, allowing a static `map` region to silently overlap an existing `no-map` region.
> - [High] Error handling in `__reserved_mem_alloc_size()` ignores the return code, leading to a Use-After-Free of physical memory if marking a dynamic `no-map` region fails.
> --
> 
> --- Patch [2]: [PATCH v2 2/5] of: reserved_mem: reject static regions overlapping no-map memory ---
> commit 5bad18fc3e691089fa21e129bf6cd3d6145676c4
> Author: Wandun Chen <chenwandun@lixiang.com>
> 
> of: reserved_mem: reject static regions overlapping no-map memory
> 
> Static no-map reserved-memory regions are marked in memblock.memory rather
> than memblock.reserved. So the reservation overlap check does not reject
> a static region that overlaps existing no-map memory. Both regions can then
> be initialized and hand the same physical memory to different drivers.
> This commit rejects static regions that overlap existing no-map memory.
> 
> Link: https://sashiko.dev/#/message/20260814084718.29C341F000E9%40smtp.kernel.org [1]
> 
>> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
>> index 491d64d93d707..f25dc0cca2f06 100644
>> --- a/drivers/of/of_reserved_mem.c
>> +++ b/drivers/of/of_reserved_mem.c
>> @@ -152,7 +152,8 @@ static int __init early_init_dt_reserve_memory(phys_addr_t base,
>>  		 * if the region isn't memory as it won't be mapped.
>>  		 */
>>  		if (memblock_overlaps_region(&memblock.memory, base, size) &&
>> -		    memblock_is_region_reserved(base, size))
>> +		    (memblock_is_region_reserved(base, size) ||
>> +		     memblock_overlaps_nomap(base, size)))
>>  			return -EBUSY;
>>  
>>  		return memblock_mark_nomap(base, size);
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but since this patch is fixing
> overlap checks, does the !nomap path still allow a static map region to
> silently overlap an existing no-map region?

patch 03 of this series fixed this issue.

> 
> If a Device Tree contains a no-map region followed by a regular map region
> pointing to the same physical address, the no-map region is processed first.
> 
> When the map region is processed, nomap is false, so it bypasses the
> overlap check updated here and directly calls memblock_reserve():
> 
>     drivers/of/of_reserved_mem.c:early_init_dt_reserve_memory() {
>         if (nomap) {
>             ...
>             return memblock_mark_nomap(base, size);
>         }
>         return memblock_reserve(base, size);
>     }
> 
> Since memblock_reserve() adds the region to memblock.reserved without
> checking for MEMBLOCK_NOMAP overlaps in memblock.memory, both regions
> can be initialized. This would hand the same physical memory to different
> reserved-memory drivers.
> 
> Should the !nomap path also check for overlaps against existing no-map
> memory?
> 
> 
> While reviewing the memory allocation paths, I also noticed a pre-existing
> issue in __reserved_mem_alloc_size().
> 
> [Severity: High]
> This is a pre-existing issue, but could this error handling cause a
> use-after-free of physical memory if memblock_mark_nomap() fails?
> 
> Looking at early_init_dt_alloc_reserved_memory_arch():
> 
>     drivers/of/of_reserved_mem.c:early_init_dt_alloc_reserved_memory_arch() {
>         ...
>         base = memblock_phys_alloc_range(size, align, start, end);
>         if (!base)
>             return -ENOMEM;
> 
>         *res_base = base;
>         if (nomap) {
>             err = memblock_mark_nomap(base, size);
>             if (err)
>                 memblock_phys_free(base, size);
>         }
>         ...
>         return err;
>     }
> 
> If memblock_mark_nomap() fails, it frees the allocated memory and returns
> the error code, but *res_base (the base pointer in the caller) remains
> set to the freed address.

The reason of memblock_mark_nomap fails only can be out of memory, and this would
trigger panic because memblock is not allowd resize before paging_init.

> 
> In __reserved_mem_alloc_size(), the return code is ignored:
> 
>     drivers/of/of_reserved_mem.c:__reserved_mem_alloc_size() {
>         ...
>         ret = early_init_dt_alloc_reserved_memory_arch(size, align,
>                                                        0, 0, nomap, &base);
>         if (ret == 0)
>             pr_debug(...);
> 
>         if (base == 0) {
>             pr_err(...);
>             return -ENOMEM;
>         }
> 
>         fdt_init_reserved_mem_node(node, uname, base, size);
>         ...
>     }
> 
> Because __reserved_mem_alloc_size() ignores ret and only checks
> if (base == 0), it will proceed with the freed memory and register it via
> fdt_init_reserved_mem_node(). The page allocator will hand this memory to
> regular allocations while a reserved-memory driver also uses it.
> 
> Should this check be if (ret != 0) or if (base == 0 || ret != 0) to
> properly catch allocation failures?
> 

