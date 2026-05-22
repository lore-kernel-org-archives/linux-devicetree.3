Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C236D72617
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 07:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779434029; cv=none; b=XmliDxSjxiDmYGq9nhRsAU8RtlY7LQj5qQvjjvxMUeyeeSBl3HWdD0B//WHjkGwlFHwy2F3mnNQZpkebqGBcE8lfSQOU5ME1R+bkUQFM/Iji6KH3B58306ST6nXpB2eBtLAvpIog00bTbl3qjlggykvWrnBXaGsOfh9btogC6/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779434029; c=relaxed/simple;
	bh=9Fa/UB4HkPYCNyGFgozf00j+m/SdWP845EBaSOPQEOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gf+4BNpNf7geauUrzSHAXdDiQmLEArm/oesZjazYPTktqxOylzIzkiNuSiNLN5Q7OEHMjAyj3roxZ6TjBNhy7OHESkO9pf7VZ2sMdmTwaeXUqjEfmTiO5GmIsrZyBFdA7KT2tLHcrrBFPpG5zhjq1uJCGzv7NfX3Rpm0RxsXL0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I6na7qQ8; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I6na7qQ8"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-83ec36a13e9so3409730b3a.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 00:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779434027; x=1780038827; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/ZUvJ6eFcygxv78l6IC5YA/pTb85t8JqQtZJgDAjKvE=;
        b=I6na7qQ8OBIkBhvyvwr0syXwW8YH/h6rAvA0CrwT12xbixnFpLYZC+Z9c/FjTetkqI
         NZ24yyetDInXuKuk0NujOMVkwJaXY36XN5Zp7LEkGgeeP1l+GDselwclH0zhn0IY8uVj
         jb+R/fmM15+Sl2dyHg8D1y/SAvMpyQaJDxGKFPuQD4nf2jFTDird9HEfOVXT0mP3va2L
         7e28+gTWSz9RTTwI58IMsSv4PW5/2C7acGRjTxkF2Z9hk+hl2P0O53q9KlTQ0oT4dr4N
         xfHOCSQwJrHVFGg49PbMw3LCUDu0XQPtylUk0bUWe5xvsJ19OpnoNMlk5Akz4iUr7wVA
         7A3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779434027; x=1780038827;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ZUvJ6eFcygxv78l6IC5YA/pTb85t8JqQtZJgDAjKvE=;
        b=rE7c9bflJVCj6ZYlv8NWyYjEocmsfkIusPyXMk3ijwE4s6/4bWMC2f/r5CA+EhhSJ/
         RVyRLq1J/L1I3bPrPXIZyp6y4XUpaOxkvzkHpPwlstQEdVKhTrHVuJLqh05kiCLZo5m/
         FHamQjFVDIKcrijmjcYmTpiM3rrJAxUJdPmc/cRvip5p1XJqf5PjCEQRiY01r7bGKoDx
         hFgEwib/3LJpLCPDEFY2F4G971QtVJoHNx+gAtfN9fmz7lNUuLzLtr+RmQLpg092fzYk
         pCwIQMEXMfdd/6XovZJ1mNHtmLRSydDH5Xwod+Ue3L4OKyM66UJ+AVZoDMqf9IamrrSB
         JlFw==
X-Forwarded-Encrypted: i=1; AFNElJ/1+RpBzK4jo7TL469oCfN3ujoZNoTFHr1Y3tikkGHewDUklradNg77ER8mLpDr5pzzQgEUxZgL+sOc@vger.kernel.org
X-Gm-Message-State: AOJu0YwOlyLm99fSSxfK9rplOKcGn2mAXvSDUn7S+5b9ifP11yELWlrQ
	5PEsLZ51+9Fz6WCOpMmv9FG0ahMwzUaMxMkFFt+pIJzXLS6eagMEUjMF
X-Gm-Gg: Acq92OGs7/t3bd++pfjRt8VwbDuO4w3PKdvl+BfsAKXQW1fGy6DRhhmaiXYQgEh8bvv
	qm68QeHEuq9q/Oqg+juCk6/wF8GDvWH1lbt3BXK2/hbPaGdUEfa+2HpWu9EcuRkL4aRrvEgU69I
	+B0N8WdLctv6BIfpl4BGTYlaGrasvv3dwXepIiiVpG/wr19LIajFVQilNex4ElGsoHZaXozLb7W
	Gnj7CloFm5mgLVRMiOGdxzZOEDax203PPj1kxfG1niYHN5b4/I9YstVj7doXpO3jAyQc1kDyO0D
	Xj5aqFf4sRmSQayZ2rovvE7XZBHHTSjXIWFxEGw4p35MG20oJgnWRHPSR1pYmAJ6E8ISkFz4bdJ
	FenCVQnrqepnpRMaXFcPGoJAuKpj7thzcD407rdw+fu7k5erRwwKB84wiNsGuZphLQz9ckutxcS
	bFnZREx7CnCUnTQkQpWBfI4ex1hQvlxWE=
X-Received: by 2002:a05:6a00:1147:b0:82f:38df:681c with SMTP id d2e1a72fcca58-8415f2d6cccmr2485881b3a.6.1779434026785;
        Fri, 22 May 2026 00:13:46 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ff3e00sm1184421b3a.54.2026.05.22.00.13.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 00:13:46 -0700 (PDT)
Message-ID: <90a37efa-8d01-47f5-bf9b-dd008e4bbb65@gmail.com>
Date: Fri, 22 May 2026 15:13:39 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] of: reserved_mem: only support one <base size>
 entry in reg property
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260519082427.4181476-4-chenwandun@lixiang.com>
 <20260519092404.0969FC2BCC9@smtp.kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260519092404.0969FC2BCC9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/19/26 17:24, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Unconditional read of the first `reg` property entry without verifying that `len > 0` leads to an out-of-bounds FDT read for empty `reg` properties.
> --
>
> commit def0743ccda5f4a97f9b1275e989c8ea559363b4
> Author: Wandun Chen <chenwandun1@gmail.com>
>
> of: reserved_mem: only support one <base size> entry in reg property
>
> This commit simplifies reserved memory parsing by restricting support
> to a single base/size entry in the reg property. It removes the loop
> in the early pass and warns if multiple entries are present,
> unconditionally reading only the first entry.
>
> Link: https://lore.kernel.org/all/20260506014752.GA280279-robh@kernel.org/
>
>> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
>> index 462e7c3078a3a..0e91c4a71d89d 100644
>> --- a/drivers/of/of_reserved_mem.c
>> +++ b/drivers/of/of_reserved_mem.c
>> @@ -134,37 +134,38 @@ static int __init __reserved_mem_reserve_reg(unsigned long node,
> [ ... ]
>>   	prop = of_flat_dt_get_addr_size_prop(node, "reg", &len);
>>   	if (!prop)
>>   		return -ENOENT;
>>   
>> +	if (len > 1)
>> +		pr_warn("Reserved memory: node '%s' has %d <base size> entries, only the first is used\n",
>> +			uname, len);
>> +
>>   	nomap = of_get_flat_dt_prop(node, "no-map", NULL) != NULL;
>>   
>>   	err = fdt_validate_reserved_mem_node(node, NULL);
>>   	if (err && err != -ENODEV)
>>   		return err;
>>   
>> -	for (i = 0; i < len; i++) {
>> -		u64 b, s;
>> -
>> -		of_flat_dt_read_addr_size(prop, i, &b, &s);
>> -
>> -		base = b;
>> -		size = s;
>> +	of_flat_dt_read_addr_size(prop, 0, &b, &s);
> If a device tree node contains an empty reg property,
> of_flat_dt_get_addr_size_prop() returns a valid pointer to the empty
> property data and sets len to 0.
>
> Since the loop was removed, is there a risk of an out-of-bounds read here
> because the code unconditionally calls of_flat_dt_read_addr_size()?
Yes, there is indeed an out-of-bounds read issue here, which will be
fixed in v3.
>
> This could fetch garbage values for the physical base and size. If the
> parsed garbage size happens to be non-zero, could the kernel attempt
> to reserve unintended physical memory regions via
> early_init_dt_reserve_memory()?
>
> Would it be safer to verify len > 0 before reading the first entry?
>
>> +	base = b;
>> +	size = s;
> [ ... ]
>> @@ -277,20 +278,24 @@ void __init fdt_scan_reserved_mem_late(void)
>>   	alloc_reserved_mem_array();
>>   
>>   	fdt_for_each_subnode(child, fdt, node) {
>> +		const __be32 *prop;
> [ ... ]
>> -		if (!of_flat_dt_get_addr_size(child, "reg", &b, &s))
>> +		prop = of_flat_dt_get_addr_size_prop(child, "reg", &len);
>> +		if (!prop)
>>   			continue;
>>   
>>   		ret = fdt_validate_reserved_mem_node(child, NULL);
>>   		if (ret && ret != -ENODEV)
>>   			continue;
>>   
>> +		of_flat_dt_read_addr_size(prop, 0, &b, &s);
> Does this have the same out-of-bounds read potential when len == 0?
>
> The previous of_flat_dt_get_addr_size() wrapper explicitly checked that
> entries != 1, which inherently skipped empty reg properties.
>
>>   		base = b;
>>   		size = s;
>>

