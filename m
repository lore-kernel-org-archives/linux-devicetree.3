Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B1D349B15
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 07:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779434378; cv=none; b=ZjiAs/u07jhx9NKyIkcl+wxF1Mk/Lx2VnKmOED3SJdQUM6mAnAryT8Uz4Oubyzq0dB4cv4JmCqLd7GTr5XCm5i4tY3MyBwa90NMh9zcmQQcK7zbLMQuQFtK8zMQQYZohUQaW9I8cH/h+wW9KkWBcQGLFrPvHnCXNUZ3+SQfrkfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779434378; c=relaxed/simple;
	bh=vB8ncglXsDL+G3GQLuAvTKjMpZQbsil0GJXiBoS1ZPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ha7Xzk3Txm76jYptqsOavoiVgaQi1CN3fqhUwu5Svow0ft/loyWkuMAEu4M5BRy4FMbtjRbcC6AeR4qgLmKnX+lHbawrN2Dl2h8PLaw1kkxG7542lKfL8nj4LOOD0tNe/lvnra6EAPGJxLyuPORgssfcBxzKEoyrf2CakC/7AF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SG3XtGr2; arc=none smtp.client-ip=209.85.215.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SG3XtGr2"
Received: by mail-pg1-f193.google.com with SMTP id 41be03b00d2f7-c80170db7d6so3004672a12.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 00:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779434375; x=1780039175; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SxeTpMAFFvPJj1oPmHKERDLVM0KYa/xZKuY/auNrHes=;
        b=SG3XtGr2OtLY2odcRETwum7/Ml5ySK2CfFYBNLE/yBEpH5G9aJ5ne6a1hbHwXXsRhZ
         imNUsoRfT0FvenzQBLizAchHse+ULxSgrcgCeRP+UQbGh8EXRwDsckdu8qlyy8iFVUXZ
         QBuX9HVGKqo/7K2h8njkOEpvYMECtQYY1E/dvxx5A++ESWNaR5ndwl2A1RzuS/8/NVw+
         /BRz8MsZQ1oZPOY58+/3v5bPgSqNh7PzFQnB+46g7cQnrbz9uAh61ioxtvdLh6dhRsjy
         EA/IMDD7gBL1ePadpIHvfN4HvyyuE1Yeobm6fnoRgkWZpxeRAL1lT/qg3WUSpA3Q15rr
         s63A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779434375; x=1780039175;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SxeTpMAFFvPJj1oPmHKERDLVM0KYa/xZKuY/auNrHes=;
        b=BikQ/eqdktzqRjHQWPfMKlUER9o0bAc/VDPkQqHCf649LcbSEgg4IhAeyd60avxKtk
         4+iC/RuWYv3isbuwensUa6BhrXBBckjLrU8VSKV1aSzHUHJgEbvfqEh4uwkvfhAWpl+S
         NfWfSFzRgTxMMwTA66SRCF7a1ZHqXdx28Zvfe+8SzUJk+fc31CQtOM37RUJIoRDJGLgw
         lYUBVtziIlzTEYUcV/Gqw0O5pxnGuSCmQ9yyWM/CXHIm7mGVK1D1EPY35A05gKBMB+IX
         D6qcfaLkW5EsHliGirqETGUyPSd+YJk+nFaZr4tU6mmNBP34OkCNSO0X2mOAnNzb77Pa
         xXZA==
X-Forwarded-Encrypted: i=1; AFNElJ9dyWcEv2gBDgmLFVUjY9ttrNl0b98IEZVsACTUPlcNCRMb0rQoXc2ME6iwl8C+j++tHBEMWvXsrCK0@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe6u4AnNhc7w+zRkOwzf8A1DW7JpaJn+se5/nlsKcLLHmUnyRl
	8cG7yDACcT3Ln1OvwAVdUlF6AiQ+UVgdR02HTayQkp7+e7DP3lac+1OV
X-Gm-Gg: Acq92OGm/SwNEZ44DUFsbXzRwhN7dL7fD6uOepz7DIuxH2cmGojdQA/lqwh3UF9qFgf
	ZbASX37uXpsu59tDMOw3lfffrVetOMMraZfJh2FPYKhnLzS6yQHteOdyv66KgfzsFBw2DwbnEJS
	RNScAt/tew5gHe1UOW2tSPgouIdJWwAAGeLVmOdZnTPB6OAmYEmhdIPyxXu+BHukHJx0urIM2Tt
	7TbXT6Yarh4FWUdX3R76y4w+xj6GK2xBOGAF1KW78SSiDK86edueO2/drz7RlktF0aJwqOVi8lH
	dn3U3gJPmDJKqc24+ykIwGKoxQzifv1a7HgorMwxUObaoeM35r9CtibWD4M9JffxtyjFQZzHm2A
	i8H7XjHbbcp0gY0whaSv4HcCxq5wJ8tfYJMBjY3gPM5U/1u4jd0sbnzkRjasP7uiLqsdoiDiLEZ
	XtbZxKYPZ7xXTcl7TrQA2Wbvx497l/LLA=
X-Received: by 2002:a05:6a21:d86:b0:3b3:2703:117 with SMTP id adf61e73a8af0-3b3293ba4b1mr2450063637.41.1779434375371;
        Fri, 22 May 2026 00:19:35 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c852054e0cbsm654054a12.20.2026.05.22.00.19.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 00:19:34 -0700 (PDT)
Message-ID: <cc70c1af-2276-4d73-bd55-612995ec6cae@gmail.com>
Date: Fri, 22 May 2026 15:19:31 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] of: reserved_mem: save /memreserve/ entries into
 the reserved_mem array
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260520091844.592753-5-chenwandun@lixiang.com>
 <20260520103734.2CDFA1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260520103734.2CDFA1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/20/26 18:37, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Out-of-bounds write to the statically allocated `reserved_mem_array` due to inflated `total_reserved_mem_cnt` without guaranteed array reallocation.
> --
>
> commit cac834a48f61205ebaa2a6eaf1bc2f735c0a6c46
> Author: Wandun Chen <chenwandun1@gmail.com>
>
> of: reserved_mem: save /memreserve/ entries into the reserved_mem array
>
> This commit saves /memreserve/ entries into the reserved_mem array so they
> can be excluded from kdump vmcores. Overlapping entries are marked as dumpable
> to ensure useful crash analysis data is retained.
>
>> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
>> index 82f7327c59ea9..d2bcaf149fe81 100644
>> --- a/drivers/of/fdt.c
>> +++ b/drivers/of/fdt.c
> [ ... ]
>> @@ -516,7 +517,9 @@ void __init early_init_fdt_scan_reserved_mem(void)
>>   		if (!size)
>>   			break;
>>   		memblock_reserve(base, size);
>> +		nr_memreserve++;
>>   	}
>> +	fdt_reserved_mem_account_memreserve(nr_memreserve);
>>   }
> [ ... ]
>> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
>> index 313cbc57aa453..6dfe9e03c535d 100644
>> --- a/drivers/of/of_reserved_mem.c
>> +++ b/drivers/of/of_reserved_mem.c
> [ ... ]
>> @@ -241,6 +241,43 @@ static void __init __rmem_check_for_overlap(void)
>>   	}
>>   }
>>   
>> +static void __init fdt_reserved_mem_add_memreserve(phys_addr_t base,
>> +						   phys_addr_t size)
>> +{
>> +	struct reserved_mem *rmem;
>> +	bool dumpable = false;
>> +	int i;
>> +
>> +	if (reserved_mem_count == total_reserved_mem_cnt) {
>> +		pr_err("not enough space for memreserve regions.\n");
>> +		return;
>> +	}
> [Severity: High]
> Could this lead to an out-of-bounds write to the statically allocated
> reserved_mem_array during early boot?
>
> fdt_reserved_mem_account_memreserve() increments total_reserved_mem_cnt
> by the number of /memreserve/ entries. However, if the device tree lacks
> a /reserved-memory node, fdt_scan_reserved_mem_late() returns early and
> alloc_reserved_mem_array() is bypassed.
Yes, there is indeed an out-of-bounds issue if the device tree lacks a
/reserved-memory node.

At the same time, it will also cause inaccurate counting for
total_reserved_mem_cnt.

Will fix both in v3.
>
> If this happens, the reserved_mem pointer continues to point to the
> statically allocated array with a fixed capacity of MAX_RESERVED_REGIONS.
>
> Since the check above compares against the inflated total_reserved_mem_cnt, it
> appears we could write past the end of the static array if the device tree
> contains 64 or more /memreserve/ entries?
>
>> +
>> +	for (i = 0; i < reserved_mem_count; i++) {
>> +		rmem = &reserved_mem[i];
>> +
>> +		if (!rmem->dumpable)
>> +			continue;
>> +
>> +		if (base < rmem->base + rmem->size && rmem->base < base + size) {
>> +			dumpable = true;
>> +			break;
>> +		}
>> +	}
>> +
>> +	rmem = &reserved_mem[reserved_mem_count];
>> +	rmem->base = base;
>> +	rmem->size = size;
>> +	rmem->dumpable = dumpable;
>> +
>> +	reserved_mem_count++;
>> +}
> [ ... ]
>

