Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F04239795E
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 06:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789712463; cv=none; b=B58Ip2qeua+55zmzjxQFSuYQLU/jvac9QJt7QTYlHZ91MmhtYeXiPLDohPfwKr/lTx/6OaTA9zZm4KUyIPPW7kWnt9qtNcGdTNPuqxb6++H8InPMO01tSU7VeGMyU/mXoVkVdGsQOiNV1M4BOWTrnAPSaGz1D//hreu5BQp/Ks0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789712463; c=relaxed/simple;
	bh=//hfLy4KXhKQImjLqRGtoddsxb8nUplNRym/SxtSwic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dzEVrG3m5/bAWI6w4Vnre8Nd+u1cZP2iEf7JE3wUeyndANiiSEhHbUrHnUbVmt4Kem9eFfVZs1/1HC3Gq4NwbHgQnGupYU+8RHw7LtHs4XzFcFh3LP+Kx9dFoArRgJgtFssmpbIJkpe4XN/T1awHysBtql+2sVRjOkR96DL508k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ePtdtg3F; arc=none smtp.client-ip=74.125.227.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ePtdtg3F"
Received: by mail-pj2-f2.google.com with SMTP id d9443c01a7336-2db39df9c51so1760195ad.1
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 23:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789712461; x=1790317261; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E6nAoxNwBlRXfqDM8NwerdYs9kHcaYf9og/arr7yGEY=;
        b=ePtdtg3FuZ1CqqkhsQiTA/QpSsu2jXbYIMNjm760lfAvxdBwLW1WTIQI0MyPCp3OO2
         /C2FwFv7TaVW1LQc5JI7TeKj192I2me2zsFNo0voRCm4yFvWL/M3bVDUmpC4i2p9wZgT
         mwMKfCZTYMQBPx3AXk9TylflCLYh+itd4g7+o4sJKtUVYmi7asg6wVHgq5bK8rK9Toac
         ms6yLvaDcKlMTqF4BDkKCQRGmf7ioLuSne45mgCwNcCQQpiS1fxNb2nNYiGaUepRLa+U
         JlF0uAjyJ8WzKTSvSkI/XtpA0IOUQ0DXxsARZA5dkSOcBbDDXTDVWDPElx1ADHhuzj9E
         STzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789712461; x=1790317261;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E6nAoxNwBlRXfqDM8NwerdYs9kHcaYf9og/arr7yGEY=;
        b=M/nEDXNbI8ABHmsiUuoGVoLoBbCGGGoNCB105f090/2KtOI86UQHs1Ffe8xocBL8V2
         aUugWxQ/QdEdAD+KsosJ32MBNKzHeuKUH9utF3qLSuLWQK71qXyA+5bSv1NUZJSWsAa+
         OfaZvr6Aajq8GZUh/ZIyZPGPKNqkB6G0GQlPwqiFky1XTbR8a7/4Zw5RSbf74S8e038A
         +4uq3bg7hvtI2skW3injZwvkRnhiJys8SSTeghleeD+sDQNjikXeJ0PBAV4mHF3baFq7
         aAkXSyDJlEtxnSLZKXKYxWm4/UZgM4WvVcCxqFJ7LifQFHriv3jp2JXbIVNBwJNmd9Mo
         FrCw==
X-Gm-Message-State: AFuF++nqX0EYMfMEDdpHDkpeReVnLGZKOnFzAmIQJ/nbG5SOsmKdcwcg
	VtzreyPr0dg0ROvfTCnEEd1YZe7dNZKIBKzLNwcl96sRVVGMbvIHSYlf
X-Gm-Gg: AYBFou3HDhulR5mYMYcEk5keAkivlsmneRQv4Dwvb00bF0xGZxfiuUDRICfsWXxCWOI
	XASAKddGQJfdVIpzVffPCdvPhgARgnpXeDau+SnsYVmck7VYBr+9//dxRXwpO/JfeQwE59JkRN0
	2GwWiGTq4pmG2fWjyZf9Uc5AShKgyjiAE8/TUbsljOq2K5ionoqrxTBHl3054Z6TVLvXgsiBAlG
	T+iS7RQ6cUS4Zrx+MukKQrdiV2RSal30dIWX2U5t22Pk5NwpfeN7TU51YBslzISHOMC5j+wGtzf
	rzGvSbO2GtUqCrjSU/W1r6Pdb74GFRjfyDjqioO9HOo14DtizWVVUFo/u1k5FZbzpT7Gx+ptvo2
	ffmfAPbJcf/F5vbjTsMvo3SqHxrJgPNxaMvp4mmbKLlAnyIMqcaQBVAiQfuphqj7O6hVfgv/CGX
	mqe+BpMY0zj0yJ8z6LrN9n3Tc2Dxn6sQwNrWb9IncY0KqZH+0dcN5mbRzh8NeaMGSfSg2DxEtLg
	duM6MyU2p8QVRk+
X-Received: by 2002:a05:6a20:1609:b0:3bf:7bf7:7913 with SMTP id adf61e73a8af0-3dd8c399f37mr3432890637.14.1789712461102;
        Thu, 17 Sep 2026 23:21:01 -0700 (PDT)
Received: from [10.125.112.20] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5bc988662sm385602a12.3.2026.09.17.23.20.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 23:21:00 -0700 (PDT)
Message-ID: <10bc727c-d05d-4c02-bba5-dc72fbf0116d@gmail.com>
Date: Fri, 18 Sep 2026 14:20:54 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/10] of: reserved_mem: mark /memreserve/ entries as
 MEMBLOCK_NODUMP
To: Rob Herring <robh@kernel.org>, sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260902073116.802752-1-chenwandun1@gmail.com>
 <20260902073116.802752-10-chenwandun1@gmail.com>
 <20260902090211.9DA891F000E9@smtp.kernel.org>
 <20260917220750.GA4013814-robh@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260917220750.GA4013814-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/18/26 06:07, Rob Herring wrote:
> On Wed, Sep 02, 2026 at 09:02:11AM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>> - [High] FDT /memreserve/ entries marked as MEMBLOCK_NODUMP can be later freed to the buddy allocator, causing active kernel memory to be silently omitted from crash dumps.
>> - [Medium] 64-bit FDT reserve entries are checked for overlap in 64-bit space but implicitly truncated to phys_addr_t when marked as NODUMP, potentially corrupting dumpable regions on 32-bit systems.
>> --
>>
>> commit f6e6bcd14fb6f4946f258fc34089bbbdcd52f624
>> Author: Wandun Chen <chenwandun@lixiang.com>
>>
>> of: reserved_mem: mark /memreserve/ entries as MEMBLOCK_NODUMP
>>
>> This patch marks /memreserve/ entries in the device tree as MEMBLOCK_NODUMP
>> so they are excluded from kernel crash dumps. It explicitly leaves regions
>> that overlap with a dumpable region unmarked.
>>
>>> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
>>> index f29a07e8fb23e..a42cf6eac55b5 100644
>>> --- a/drivers/of/of_reserved_mem.c
>>> +++ b/drivers/of/of_reserved_mem.c
>> [ ... ]
>>> @@ -251,6 +251,39 @@ static void __init __rmem_check_for_overlap(void)
>>>  	}
>>>  }
>>>  
>>> +void __init fdt_mark_memreserve_nodump(void)
>>> +{
>>> +	u64 base, size;
>>> +	int n;
>>> +	const void *fdt = initial_boot_params;
>>> +
>>> +	if (!IS_ENABLED(CONFIG_CRASH_DUMP))
>>> +		return;
>>> +
>>> +	if (!fdt)
>>> +		return;
>>> +
>>> +	for (n = 0; ; n++) {
>>> +		int i;
>>> +
>>> +		if (fdt_get_mem_rsv(fdt, n, &base, &size))
>>> +			break;
>>> +		if (!size)
>>> +			break;
>>> +
>>> +		for (i = 0; i < reserved_mem_count; i++) {
>>> +			struct reserved_mem *rmem = &reserved_mem[i];
>>> +
>>> +			if (rmem->dumpable &&
>>> +			    base < (u64)rmem->base + (u64)rmem->size &&
>>> +			    (u64)rmem->base < base + size)
>>> +				break;
>>> +		}
>>> +		if (i == reserved_mem_count)
>>> +			memblock_mark_nodump(base, size);
>>
>> [Severity: Medium]
>> Will this corrupt dumpable regions on 32-bit systems?
>>
>> base and size are u64, so the overlap check evaluates safely in 64-bit
>> space. However, memblock_mark_nodump() takes phys_addr_t. On 32-bit
>> systems, could a 64-bit FDT reserve entry > 4GB correctly pass the overlap
>> check above, but then get implicitly truncated to a 32-bit address when
>> passed to memblock_mark_nodump(), incorrectly marking a lower 32-bit
>> physical address as NODUMP without having checked it for overlap?
> 
> Unlikely. Such a system would probably enable LPAE or equivalent.
>  
>> [Severity: High]
>> Can this cause active kernel memory to be silently omitted from crash dumps?
>>
>> If the bootloader specifies a /memreserve/ entry for memory that the kernel
>> later frees (such as the initrd), this memory is returned to the buddy
>> allocator.
>>
>> Since the MEMBLOCK_NODUMP flag is never cleared, will this cause reused
>> pages to be incorrectly skipped and omitted from the crash dump later on?
> 
> This seems like an issue. Both the FDT and initrd are typically in 
> /memreserve/ and can be moved.

Thanks for the review, I will fix it in next version.

Best regards,
Wandun>
> Rob

