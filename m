Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B50208D0
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 03:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787109384; cv=none; b=aeVbZsDt+9LGeSU1JIogJxSLjM++8c59N/Fv5QWB4fyY1YglmKOCC+24buZn6I/BYhCSbu//HRCTefSQdJ4SmjiCwE5+RBXSuVYpLuuz+8FqKSA+/jXaQR1Rj6lgq4yJvBQDhA3yvLzULfm6iY6/8OLFukLSyVwmX3FE47u1dCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787109384; c=relaxed/simple;
	bh=Og/uutWqSXDMpsCRwyQ5y4UVlDXT8nuIVOfBTHEmw6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dx7PQzqyfj4CUe829G6mFxQ5QhXtNz4OhyYxziacbzBtnBWVyqVRERZ+gBkdX37VF9TkrteX8SNw9VfwJRRkQm6nZx5yXohC1+SmG+sWYOXhbc9R3TwBDqGAZ0ARqffWgGpZqc+H3gGyY64wrJP3Y3c2pNdqUovJHI0wvdp8U/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TpSbOVUG; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TpSbOVUG"
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-38dc4f9462cso162514a91.0
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 20:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787109381; x=1787714181; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y7sdpc4i3FhZtnK/5yqCR/sO4q2wvmyIj6tyoETyR9k=;
        b=TpSbOVUGDwrT/6aqb4SqyN2HEL1p7zGEa/GCxeBUrr0qgMNRpaoxFg04UUfzVSEozt
         5s67SMRJROfJQWkqGRXdYaRBXXY4g2NHNuryglhETWrharm+DCu82ul7cikume8dMzdi
         MMOfUZASuBr7ENLMvMdVSlh6qjJjbwXShjs2IVjQy547PZ5rvA9GskfEBtSTxXQ5mmQZ
         y2wYYh42ZntXzXRuucmHcWHUe9/8KUoUfz6gSPDr4CuMzrCbGPdzf9pbQrlNP10EYDxO
         a9BDBGCYBY620tZrTINbIc3gqwt8YhbeT18S6nYTKCZN5/j//CQRy3joUcWJd3Pz/lQZ
         JIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787109381; x=1787714181;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y7sdpc4i3FhZtnK/5yqCR/sO4q2wvmyIj6tyoETyR9k=;
        b=hIBzZPmaNNeH8OuR4dKj0lxKHk2FgjkRmn6snuOGKW/uqFagjOUk2lZvwsexpb2trc
         xvilVlCDh7X0LTL3LWPSMxfiaQYGnPG9t3BzwHr44Gugb/OmwPUtLF9VAYLZWCJLb1oY
         gKx1olLqtFLHbtQ2ID5E0PADibWkr5Y6h53GsrvYb/8pT7KlEFqyNN91cnjVNtoZY8SV
         Xb8HM1eyjI7p4KEisreRF0kswj45i24+G4XRZy6EMeEYiDThHTeXK4a8vUCK8LtynXua
         UNuTfrfBF9AhgB9CLIhAfKjCjbzMUyXFMtwmgj+ExCQeUn1Fb46wnzb1hWepHDTFpygP
         v6ZQ==
X-Gm-Message-State: AOJu0YwgxvMO63zuO9JzLd2ji4E59HZyJ4eX9L9fVDEIXMaQVIT5H3eC
	g/FZuOl+oLJ/9+M0l/LpNrU5EcZO2ip76weR/Gmue5FXd2VZeP9/ouYY
X-Gm-Gg: AR+sD13nX0Steu7ceQFY8S8RyH4SYC/OGc1KnhoKWoyAh4xJDWTI3lut/N08GlNVWzN
	/2ZQA6EQFhetELR4yMNMC52+QvaFyfbvcUex56pt89t23m8iQwmuVWcuBHif4u0H4CTW8HxsBBm
	3eA9+XlVRN6BI8f2RZa2qiWdMcqY2M4vEfUJAHKM3ClJvXrPNPPBmsEY6bm86bsqcxkWtr+ZzK0
	QcXry+GA9khuwnIyule9gjG/vnprCxKp0BFquRGjZY5Whgl9RoEU+dX5b7M0NYKX/vMEhQvO1En
	PiL0MBaQeolYs5fW57EvVUnqPaddsli4QW3cbCMkUAC+Gt/IGYG3OxjSp1vJLIrfr5cOTx5QwpM
	Blh0NpzmLux768672lE3e4wgzxkpfoQmv75lgCxo/1KxoLyg2sR8CuOu5AG+z+jxLqZcUy/NXZf
	vprlqX/qacOROVCpX3o8bDhl1R2Htyzcfr3Rxae0wiLMRoeS8OEoQn5Jc+rqXrz8BIP2g=
X-Received: by 2002:a17:90b:1e53:b0:38f:bbc:6a0f with SMTP id 98e67ed59e1d1-39580ecefbemr2777693a91.1.1787109381266;
        Tue, 18 Aug 2026 20:16:21 -0700 (PDT)
Received: from [10.125.112.20] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957f9ad013sm846585a91.7.2026.08.18.20.16.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 20:16:20 -0700 (PDT)
Message-ID: <71b25c0f-9efd-4d8f-9bca-6d2d267d5ed7@gmail.com>
Date: Wed, 19 Aug 2026 11:16:16 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] of: reserved_mem: retain static no-map memory on
 init failure
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260818092420.2859026-1-chenwandun1@gmail.com>
 <20260818092420.2859026-6-chenwandun1@gmail.com>
 <20260818093450.AE0AB1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260818093450.AE0AB1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/18/26 17:34, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] In `__reserved_mem_alloc_size`, an allocation error when marking a region as `NOMAP` is ignored, leading to a use-after-free of memblock memory.
> --
> 
> --- Patch [5]: [PATCH v2 5/5] of: reserved_mem: retain static no-map memory on init failure ---
> commit 35ad8d6e4b86dc63d754a8415950fc7ab54dfce4
> Author: Wandun Chen <chenwandun@lixiang.com>
> 
> of: reserved_mem: retain static no-map memory on init failure
> 
> Clear MEMBLOCK_NOMAP only for dynamically allocated regions on init failure.
> Static regions are initialized after paging_init() and should retain their
> memory states.
> 
> Link: https://sashiko.dev/#/message/20260814090305.4C8741F00A3D%40smtp.kernel.org [1]
> 
>> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
>> index a0df075a9902e..0c5163ce601ea 100644
>> --- a/drivers/of/of_reserved_mem.c
>> +++ b/drivers/of/of_reserved_mem.c
>> @@ -708,7 +708,7 @@ static void __init fdt_init_reserved_mem_node(unsigned long node, const char *un
>>  		pr_info("node %s compatible matching fail\n", rmem->name);
>>  		rmem->name = NULL;
>>  
>> -		if (nomap)
>> +		if (dynamic && nomap)
>>  			memblock_clear_nomap(rmem->base, rmem->size);
>>  
>>  		if (dynamic || !nomap)
> 
> [Severity: High]
> This is a pre-existing issue, but while looking at reserved memory error
> handling in this file, I noticed a potential memory corruption when dynamic
> allocation fails.
> 
> In early_init_dt_alloc_reserved_memory_arch(), the base address is assigned
> before the nomap check:
> 
> base = memblock_phys_alloc_range(size, align, start, end);
> ...
> *res_base = base;
> if (nomap) {
>         err = memblock_mark_nomap(base, size);
>         if (err)
>                 memblock_phys_free(base, size);
> }
> 
> If memblock_mark_nomap() fails, the memory is freed, but *res_base still
> holds the freed address instead of being cleared.
> 
> Then in __reserved_mem_alloc_size(), the code checks the base address instead
> of the return value ret:
> 
> ret = early_init_dt_alloc_reserved_memory_arch(size, align,
>                                                0, 0, nomap, &base);
> if (ret == 0)
>         pr_debug("...");
> 
> if (base == 0) {
>         pr_err("failed to allocate memory...");
>         return -ENOMEM;
> }

Repeated questions;

The reason of memblock_mark_nomap fails only can be out of memory, and this would
trigger panic because memblock is not allowd resize before paging_init.

> 
> Since base contains the freed address instead of 0, does this allow the
> freed memory to be registered and later handed out by the buddy allocator
> while still being incorrectly used as reserved memory?
> 

