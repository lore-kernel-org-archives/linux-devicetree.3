Received: from mail-pz2-f0.google.com (mail-pz2-f0.google.com [74.125.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45883B813F
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 03:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787109273; cv=none; b=hRzstteUxEWjtzROMmGTY0GxP2LrJAS6UVHO8lx1IaGKpOxVttV7erz3+f2KDX3l8I1DZtp4cCLmYPqInNKlJ3UsIjQ43MJOiGi12I5BgDXKRwNNDbv3JDOVPLvryo6dHiWunjcNg13USQm2D36+V0dfJFbJYf6X7xl+3MZTZlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787109273; c=relaxed/simple;
	bh=qhh5IYjcZfOvPbQAcHwjlmsNnJJ/j7fHA9NCgpyJsgU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h+pLnSKhliy+qvw4CHH7qywYtqwyVlHAxjOVOQlmTE6cohhsoII9AycQZOc31qaDnCUHIA8Ui7DBAaDodtNTyNp/sN/Lh5whgXlc/LvGy0lj4/Kjd5nhPDqZ4loxI39nS0Mr5/4jLHvOsaVZYJdOWIa+T3wYwbYPY7QeU1mGCrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b3fJIJMz; arc=none smtp.client-ip=74.125.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b3fJIJMz"
Received: by mail-pz2-f0.google.com with SMTP id 41be03b00d2f7-cb221a59829so19734a12.1
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 20:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787109270; x=1787714070; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rkDTbm6UNf3o2IwfVAFs79C+vTq7/RzNoY70xRVtDM8=;
        b=b3fJIJMzZR3cvli1R1yOCjwlZiYnmKMJDvVpY6i2eZbpJqqcYQUkcKjyUVBe3cPe8S
         NXlvnE31FXB62nr4GXilHZ3JS7Rf+It48ka3r0LhdokktRwNgb+mn1MRDjlRO3Y6yyy3
         hJoRThPexHUTjDJWc8bdEfufLNatwD+WtY6mueBbXsDf/v/hBrrNYYDRRkXQQd/ESYPE
         pFdn7DmqDbbGasOpZ64O4bx7WB+kce74jIWc5/ZYtD4zoTGBXYRVHa6agoA/8L5qkk+U
         hMO7oLE7pDxfnQOZFtGoeXcULFiC86QazeI7YZgZzYvenQ4/wJfmtYLA/L+AWGX0NyEW
         EOow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787109270; x=1787714070;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rkDTbm6UNf3o2IwfVAFs79C+vTq7/RzNoY70xRVtDM8=;
        b=EZY0vG3v5/9uUbCdN9ksD55DJ+GeUyNmbdnRdVet8gseMgaOxjgUSNnm0h1DxZ4KLg
         Q9NuDum686Kg3DLqutBXdAZzuy36rnqOIg2wx/pyOSWw2BDOTrQONyjhU0/f5CTwFL0x
         qkEK89OtqBLDshgBrx8jTWr+LsG2smLThkGWHheDWl6DKQzsuu5TIElJzOq35hWihFGY
         EGZ3OYvn6iMvPHIw1WLAxarkVohztBD8ik51ZHVevld7CjadbMGX5j/0sxrUfmuG8+P1
         3hSNwJBJWv1L/rG7PZvkev2HXFH/TwgDq7wRQVXOCRSyJll1+pYYZdzODyeGQFq94kbg
         NXNQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp8v1OfRqEBeeZOTj5T0+EuZRl88W0m/q4jR+k6W2UXpKPuSf6tFAOBtcETtPrMoBR1xaiC3O9qt4WH@vger.kernel.org
X-Gm-Message-State: AOJu0YyVLRHivHrIJlJ6WI7U2L4S7P5Td7iMXf9dNE/3onLHNvTl9ODm
	BsyPhCxSEcWlVXCg1pY47QlAaZ9GbdcIvNaim3FPsIsgyVFZYLLMt5uv
X-Gm-Gg: AR+sD12CB736OMR3xRNpst+vhVtufvYB430khUN1FZeiJ//+Z29W8AijZNaj+OMNRha
	Bu1cCdE8uPO4xwsQdN3tvWNw1lDUhQ4oL9dB9g9Svf5FoS3cEJ1wn42tUXN9V4QhgQof/25YH08
	pCLJ9JvaB0S5ZHZ1Xd//NnV1zDgIBNcxr7XM9HyfbQQ04AfxXfo+W4A1amn4P1a+cePnVWuKqFE
	hLhdLKJoLptiOcLPCF+xDrBHV51ptsBN+jt1yivpGpUZ7Q3itEkAUN/us5ykZ1Z3ubx+FON4scN
	W/j5+HT1Olqo/8UF+5g5B8oRcgV40cVWLTWUQmRLS7C/M16lPqCH1DdDBjzh+xI4b9rIdiQ+LIk
	c8dWVFCiQz1jDqK5NGZMGu4jzL3sHRId8Z71ArlSdw199BOHOR9zFw2et+xOr9xQYGEA3E9g8bD
	cNEqVerRAuI9Euvi9l9V9aOkqG1tyeQVf6rv4C2LFHRz/+/sV6bXrZ3ouCqJyqm6hrIEw=
X-Received: by 2002:a17:903:15c8:b0:2cf:7db9:e13e with SMTP id d9443c01a7336-2d5fc8c65a8mr22351785ad.3.1787109270238;
        Tue, 18 Aug 2026 20:14:30 -0700 (PDT)
Received: from [10.125.112.20] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1e9ab8bsm19697935ad.64.2026.08.18.20.14.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 20:14:29 -0700 (PDT)
Message-ID: <8ab82f38-e2c7-4cde-b306-946a220f8c78@gmail.com>
Date: Wed, 19 Aug 2026 11:14:23 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] of: reserved_mem: release dynamically allocated
 no-map region on init failure
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20260818092420.2859026-1-chenwandun1@gmail.com>
 <20260818092420.2859026-5-chenwandun1@gmail.com>
 <20260818093834.588661F000E9@smtp.kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260818093834.588661F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/18/26 17:38, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] `__reserved_mem_alloc_size()` ignores the error return value and checks `base == 0` for failure, leading to Use-After-Free of reserved memory regions.
> - [High] Statically allocated reserved memory is unconditionally freed back to the OS on driver initialization failure, violating the DT specification and causing memory corruption.
> --
> 
> --- Patch [4]: [PATCH v2 4/5] of: reserved_mem: release dynamically allocated no-map region on init failure ---
> commit cf35e3414292da4070c89965dbb1bce8416755e9
> Author: Wandun Chen <chenwandun@lixiang.com>
> 
> of: reserved_mem: release dynamically allocated no-map region on init failure
> 
> Dynamically reserved-memory regions are added to memblock.reserved by
> memblock_phys_alloc_range() during __reserved_mem_alloc_size(). When a
> reserved-memory region's driver initialization fails,
> fdt_init_reserved_mem_node() cleans up the reservation. For no-map
> regions it only calls memblock_clear_nomap(), leaving the range in
> memblock.reserved and unavailable for normal memory use.
> 
> Fix it by freeing the region on init failure when it was dynamically
> allocated.
> 
> Sashiko found this issue in [1].
> 
> Link: https://sashiko.dev/#/message/20260806100605.2C2C01F000E9%40smtp.kernel.org [1]
> 
>> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
>> --- a/drivers/of/of_reserved_mem.c
>> +++ b/drivers/of/of_reserved_mem.c
> 
> [ ... ]
> 
>> @@ -567,7 +568,7 @@ static int __init __reserved_mem_alloc_size(unsigned long node, const char *unam
>>  	}
>>  
>>  	fdt_fixup_reserved_mem_node(node, base, size);
>> -	fdt_init_reserved_mem_node(node, uname, base, size);
>> +	fdt_init_reserved_mem_node(node, uname, base, size, true);
>>  
>>  	return 0;
>>  }
> 
> [Severity: High]
> This is a pre-existing issue, but is it possible for
> __reserved_mem_alloc_size() to ignore the error return value from
> early_init_dt_alloc_reserved_memory_arch() and only check if base is 0 for
> failure?
> 
> If early_init_dt_alloc_reserved_memory_arch() fails after setting *res_base
> because memblock_mark_nomap() fails:
> 
> early_init_dt_alloc_reserved_memory_arch() {
>         ...
>         *res_base = base;
>         if (nomap) {
>                 err = memblock_mark_nomap(base, size);
>                 if (err)
>                         memblock_phys_free(base, size);
>         }
>         ...
> }
> 
> The base variable in __reserved_mem_alloc_size() will be non-zero, but the
> memory has already been freed. Since __reserved_mem_alloc_size() only checks
> if base is 0, it passes the error check and registers the freed memory.
> 
> Could this result in a use-after-free if the OS hands the memory out to
> other subsystems while it is still mapped or used by the reserved region?
> 

If too many nodes init fail, it will fallback to the current behavior.

> [ ... ]
> 
>> @@ -707,7 +710,8 @@ static void __init fdt_init_reserved_mem_node(unsigned long node, const char *un
>>  
>>  		if (nomap)
>>  			memblock_clear_nomap(rmem->base, rmem->size);
>> -		else
>> +
>> +		if (dynamic || !nomap)
>>  			memblock_phys_free(rmem->base, rmem->size);
>>  		return;
>>  	} else {
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but could this logic
> unconditionally free statically allocated memory without the no-map
> property back to the general pool?
> 
> If a driver fails to initialize a statically defined reserved memory region,
> and the region does not have the no-map property, it is freed here.

This is pre-existing behavior for static non-no-map regions.
> 
> According to the Device Tree specification, if a driver fails to initialize,
> the OS must not use the memory for general purposes unless the reusable
> property is explicitly present.
> 
> Will this cause kernel memory corruption if the general buddy allocator
> hands this memory out to unrelated kernel subsystems, but the firmware or a
> coprocessor still expects the region to remain reserved and accesses it?
> 


