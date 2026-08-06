Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA32471D1E
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 11:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786016647; cv=none; b=ILb/38x0zncpGG+yJ/iXj5lvaDz14Rb5wZ6EcQLuVGPdmdzrlrnc/feJga33qPC/gnN5aJY/C3j6YJSPBY62Jyo73wDamulAY9Gyhr7pB+juiewIS/ivk0e08rwA06YJqCObU1ovmQjB1iezwj28b3uTR9uh/Ng+UkaqWG8NIAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786016647; c=relaxed/simple;
	bh=j/S6abc75+JZPBROHdk31qLGWHY3Rl99vme1C2vDIrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ma5xtzZDf4l/9MAEBSH5hFaRIofIxHSIC0KSPDdaOsfdV4vokxZhllNVlLEtorlnNzAXIXTIyImoRgGa62JkNlP+5Yhoiak6b5UYhKGMQbBD7FuCWo6dDP1JJDsmbfAKez4dIbRHogjIxDbzBrha6raOKmnKPs4GUQUDlWJyvUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BQP6JtB+; arc=none smtp.client-ip=74.125.227.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BQP6JtB+"
Received: by mail-pj2-f4.google.com with SMTP id d9443c01a7336-2cabe9335f1so11408375ad.0
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 04:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786016646; x=1786621446; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EyfrZ3wQF4g0LWnFW0d1CGkXt97BWDIcYKvRjJiHXes=;
        b=BQP6JtB+GjYJUYHtLwphiy2ml2w7bLk6txlOlCK8bi0e7+YiHnqNwq36xf3bWT89E1
         oQkIsOAknEZWT3oJM2zL4PHBY6DC7gfbYHiWGlc6I7+AR5Z5yIYPDqPFZF9FziEkc55M
         LZiSum15OM1mT6pBH9YQqWh5A/Co1K47RmfQZ0bwiYkAJbJbDNr4NdqjQm5Cwkhzkpvr
         +GuST9Lo7VOniwB6V+LkwzQvN0CEBNDl6AS6KkSNJ6H1lqBncyoZ4tIt5sYhbn5jDQxS
         cS6ph/hJRF2uiRxTj9/wL02UEjJ5+NNtEXK1NUxCvwARbB1cJv0tcnm9nojXv/AfQgVx
         6J+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786016646; x=1786621446;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EyfrZ3wQF4g0LWnFW0d1CGkXt97BWDIcYKvRjJiHXes=;
        b=kPPuqwXyFa/962p3Y5+Enx/E2/5tEuaoNZ0BHzSM24YEjb3y6w5fCZdWMw6v0cpatb
         h8crWhbZRglaP4/vnL2xwZYhl2+eW2aVQdga3SUQuJpsW+hSofRiYw6F5LAcZWzg4wvm
         ClvSnAZMThSdOVIGdZaTbpqQPh4BIJ9fMoI/+kYMv7H2EpBEZ2+VaVc1JvPEutsCdIyq
         nq7nkvzjK7fduFu86taKlJfDxvSojiEsukwukgAeLfJ45yaUIeiZcgtXnISutjhOJWn8
         9+XpuS1S4x9ZFP90OCQUt0O8Ejtshgnxnx3W1yAJxM5R0Iu36QhZtn8Vv0+y3a6xEcA4
         g8hw==
X-Forwarded-Encrypted: i=1; AHgh+RqNp8/doZQI6yOGuYER3aNO8FzD5kK+ERNvdzieZWVu96QaFJnw5MJcN+kxxikDtrZrnAeMsD7uDdSa@vger.kernel.org
X-Gm-Message-State: AOJu0YyzJfP2LHciAwWfEs4y7cSEqdM6S1Jbf27Hg4rmQaFpGl92lqXv
	5qxjYbNrFI3obB3NcjzkrUjOylMEaNqBxKoC3KWjEAnOaiLG25S1awXtdIuO+9ZRoT7zQw==
X-Gm-Gg: AR+sD13TqutI0EYkOZ5zvfvXicloc6XnZ728Ou1G6Sico1O8HmF6r8bLnp/j9x6BSIh
	bE9DQNFLVXOWWX+T1M80EjDCUIoN71yWFTZfcf3pqMSQL/SF+0ItMlm5zwXj04GFaNbkLO8l2SN
	5Bt7cflLc8K19CeR8H30dUtjFx+Mmo0BFPfOetQJGVfVoe6jUeN0aQCc2S1TBCicX9YF5pG9s0L
	4UD9ftNwWnwnfHA7BysukzIQLoGrIyG0MRogdJEsiNN4SJSg3juWgyTZDJb8E5/jWNo1oL8bBTt
	AM7dciFeO3NxNeVbtdpX2v64f+Qzlsvk9FsZAOY4zgowBsx7D4tQDA1iiQZ5iEK4An0lCymphYb
	HSCT5iJ4KLXx3sx/2W9Q07MWD2MpcZ2upqJ35VFCTT7a1fUdTNvwhWMOMt/RlTqwjYrh8ihccH9
	lb9jIRU/AmoL/1OaRmm6IQwp8rL2uHDYQIl9zRrsS/qaWAiw1njPi38qdBCRrMojyMhca2
X-Received: by 2002:a17:903:2d1:b0:2cc:90aa:8787 with SMTP id d9443c01a7336-2d0ca7b54e0mr179744585ad.6.1786016645667;
        Thu, 06 Aug 2026 04:44:05 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa4b9605sm29985845ad.58.2026.08.06.04.44.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 04:44:04 -0700 (PDT)
Message-ID: <232d382a-832a-4fd3-9184-3346944a4a8a@gmail.com>
Date: Thu, 6 Aug 2026 19:43:59 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/8] memblock: introduce MEMBLOCK_NODUMP flag
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260806093519.2907771-1-chenwandun1@gmail.com>
 <20260806093519.2907771-2-chenwandun1@gmail.com>
 <20260806095112.DC81E1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260806095112.DC81E1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/6/26 17:51, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The patch completely omits the filtering logic required to exclude MEMBLOCK_NODUMP regions from kdump vmcores.
> - [Medium] The MEMBLOCK_NODUMP flag extends the flagname array but leaves an uninitialized hole for MEMBLOCK_RSRV_HUGETLB, leading to a NULL format argument.
> --
> 
> --- Patch [1]: [PATCH v5 1/8] memblock: introduce MEMBLOCK_NODUMP flag ---
> commit b30a0bfd2a4e00657ccc3f49bdfa4a7ca5fdfa1d
> Author: Wandun Chen <chenwandun@lixiang.com>
> 
> memblock: introduce MEMBLOCK_NODUMP flag
> 
> Add MEMBLOCK_NODUMP to mark regions that should be excluded from kdump vmcores.
> The flag is meant for reserved memory that carries no data useful for crash
> analysis. Subsequent patches wire this up for /reserved-memory and
> /memreserve/ entries.
> 
>> diff --git a/mm/memblock.c b/mm/memblock.c
>> index 9ce86349a29fa..79231634c25b0 100644
>> --- a/mm/memblock.c
>> +++ b/mm/memblock.c
>> @@ -1204,6 +1204,21 @@ __init int memblock_clear_kho_scratch(phys_addr_t base, phys_addr_t size)
>>  				    MEMBLOCK_KHO_SCRATCH);
>>  }
>>  
>> +/**
>> + * memblock_mark_nodump - Mark a memory region with flag MEMBLOCK_NODUMP.
>> + * @base: the base phys addr of the region
>> + * @size: the size of the region
>> + *
>> + * Mark the region as not to be included in crash dumps.
>> + *
>> + * Return: 0 on success, -errno on failure.
>> + */
>> +int __init_memblock memblock_mark_nodump(phys_addr_t base, phys_addr_t size)
>> +{
>> +	return memblock_setclr_flag(&memblock.memory, base, size, 1,
>> +				    MEMBLOCK_NODUMP);
>> +}
>> +
> 
> [Severity: High]
> Is it intentional that the filtering logic for this new flag was omitted?
> 
> Without updating should_skip_region() in this file to filter out regions
> marked with MEMBLOCK_NODUMP, the flag appears to have no functional effect.
> 
> When architecture kdump setup iterates over memory ranges (e.g., using
> for_each_mem_range()) to build the crash dump list, these regions will still
> be included because should_skip_region() does not know to skip them.

Not correct, will handle MEMBLOCK_NODUMP flag in patch8.

> 
> [ ... ]
> 
>> @@ -2886,6 +2901,7 @@ static const char * const flagname[] = {
>>  	[ilog2(MEMBLOCK_RSRV_NOINIT)] = "RSV_NIT",
>>  	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
>>  	[ilog2(MEMBLOCK_KHO_SCRATCH)] = "KHO_SCRATCH",
>> +	[ilog2(MEMBLOCK_NODUMP)] = "NODUMP",
>>  };
>>  
>>  static int memblock_debug_show(struct seq_file *m, void *private)
> 
> [Severity: Medium]
> Will this expansion of the array leave a NULL pointer hole for the
> MEMBLOCK_RSRV_HUGETLB flag?
> 
> Prior to this patch, the max index was 6. MEMBLOCK_RSRV_HUGETLB is bit 7,
> which safely fell back to printing "UNKNOWN". 
> 
> Adding MEMBLOCK_NODUMP (bit 8) expands the array size to 9. Due to designated
> initialization, index 7 becomes NULL.
> 
> When memblock_debug_show() prints a region with MEMBLOCK_RSRV_HUGETLB set,
> it will read the NULL pointer and pass it to seq_printf():
> 
>     if (reg->flags & (1U << j)) {
>         seq_printf(m, "%s\n", flagname[j]);
>         break;
>     }

This is indeed an issue, but it was not introduced by this patch.
A separate patch will be sent to fix it.

> 
> While seq_printf() will safely print "(null)", this will break out of the
> printing loop early and omit any other flags. Could MEMBLOCK_RSRV_HUGETLB
> be added to the array as well to avoid this hole?
> 

