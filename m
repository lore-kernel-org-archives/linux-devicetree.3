Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B0B377567
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 07:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779434545; cv=none; b=UPQC72EuUVde9VRPSWfw9iyNr1MO8+AqB5mtJGZdXOHy/7BbI2qCS5vPVm/oIy/oryTeoiKYve01z01PGw4aj5GPPHmccNe7ng0rq2j/I3ExUj+UccDyKsCzjYcfda9cZln6sZXvJEDrSTZImAf8c5BQ080D23RRtOa9DwdQeXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779434545; c=relaxed/simple;
	bh=obSvKijC4ntlSrQugmV7SoKTfCT7iU/AFtXLZwPmzqI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FVSfmF6uH7n75mCyS63Gp5J/TBABxVuGnI8Mt1L9haVYeDr3QGZbcSBoG06/mLQ47tLmClvIfwh8ff3bIIkITt057cowmqYuTyxQDZP9i7YNvhvIKg6xUpajcOJjDw3XTT0DxPF37PG43ruj6xbXEFnLFngI4ajfhTSnYm2fxNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F9AbZst7; arc=none smtp.client-ip=209.85.216.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F9AbZst7"
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-365eecc5885so6448009a91.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 00:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779434543; x=1780039343; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PJiioyKQ/ca5477xLRXKGF7zLaHoUf7g0GkFbnSC7ww=;
        b=F9AbZst7jFJMk9BhZnwyPNTmIsFd3XtCZH+lpOmWqDFEyF6BUciwirkffxfGymx9hr
         LJehIn7ZhsVQdT64VRiLKProzA1Vd/p1d9ZtG/nTZ+stbz73x+FkERqq957QPXLckGEt
         k2cV+40LmvrdgjwQMXpGZeFKsrQc9HcCdtfGpa/ZeinJCRjClTaHXuca1Y8XqsgW0+42
         qeeoeV9YDEiVJQgto+Be33nSeqymWTDOFuj3xf97tstP+zjMawRoS2FUV12spDUGSN65
         bDw4sjO0n6vMp856PoBF8eQl15StSoE1fx/JXoakHIozwMG+DQ/WEqIAVicKzo3NtQxe
         Evrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779434543; x=1780039343;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PJiioyKQ/ca5477xLRXKGF7zLaHoUf7g0GkFbnSC7ww=;
        b=hyzUfjaKnjhKT15uIlBbwyXvkSukUV8MLEmctMdnubsQsKmc+jNPvoe6AzWXz6jmLA
         AFcKxhGe1rVC1Pg0hUHeO+4BJnpL2BGTgLpERdTwxv1eTDCvJBqyHpd/56vRHs1qXCGJ
         F0ySTG7V2yNG5DBzU1WyNr2auVSpEGFUR5cAwlg0/cs3l/+v+ZlZBMX5YUH3l9Dhemrf
         FXtEyu/sYsivozIs/2ZEQ9T1qW4Lin/lESGcfFSHt9a1a3WGzuF9kXex7//kjMPp+uhY
         qcnHTou2iVSg3+rYAcTYsX94lk48XGukAqK+YhlRi+nPAgZd9PinPIoOsA4YkYb44X7X
         CFaw==
X-Forwarded-Encrypted: i=1; AFNElJ+hlngi9GhUEUSps8sZsxB6Fg62mYNODP7tEppmL709FdGRuAbNgmoPH+SynWcv+gWK0LWKEwLlaftf@vger.kernel.org
X-Gm-Message-State: AOJu0YxdEbN+CSJqUJ1z1axNbsSWU7EZ0V1ur2+X5Z57NOh/euKredRI
	CsOw1qVTx07MXOUy0b+Bvt8RD9T07WCWT76uEUImRB9SK99sle+NoxOA9fPN6xtenGsDNEkr
X-Gm-Gg: Acq92OELM8EqDGsOVvi5mhB0Ux/Ak5uMUGqU+Yzlu2IYvFLViUkulKbEVNy+3gR3V1K
	awG+wsVgLi8eQjWuP5tbJv2wlT3JvBfRDOkOo/fDP3ySrUeO166PG0svY1pn20XxSe5TMvQRhoa
	qJZ4pia3fxobyi2JzpJ3DSjkYdJG/zN/+7Rnx64hKHigFshzgs7taoR9zt7e/ZR9+RhMTYuEYMs
	lFt4WP2pnSHYSWr7gxxfidx3VMy5tfiytKLU38OM5W7qcitq7iz2WB7qOLLk7sqhL5uLmHku+DO
	PKwyzIBBwJz6gSqeg8KOqHEBh+FIIEe58wrnTOSukWQkaTzKxVCiw+0VjZM4e8nLpqdlIIBuEcu
	DWMLeM+i8tItITLVzl9EgohxjsOhSJPgznjxagJ6K5jiRB57Jqh9WKnWrpdAIEtkhjXqbvdMo6T
	iRrCBhKXKqLUaE/TbHvbjqfw9/606kt1Ek2uRJuzxDXg==
X-Received: by 2002:a17:90b:224e:b0:368:b917:79b9 with SMTP id 98e67ed59e1d1-36a67658122mr2644126a91.25.1779434543012;
        Fri, 22 May 2026 00:22:23 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a678d384fsm585491a91.4.2026.05.22.00.22.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 00:22:22 -0700 (PDT)
Message-ID: <8833da24-9484-4081-a93c-cf91d86faaeb@gmail.com>
Date: Fri, 22 May 2026 15:22:17 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] of: reserved_mem: add kdump helpers to exclude
 non-dumpable regions
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260520091844.592753-6-chenwandun@lixiang.com>
 <20260520110321.2A23C1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260520110321.2A23C1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/20/26 19:03, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Use-After-Free when accessing `reserved_mem` during kexec load on systems with `/memreserve/` but no `/reserved-memory` node.
> --
>
> commit f3d66a3fdb2eb02781d662efcbf6e92d5a51228e
> Author: Wandun Chen <chenwandun1@gmail.com>
>
> of: reserved_mem: add kdump helpers to exclude non-dumpable regions
>
> This commit adds two helpers to exclude non-dumpable reserved memory
> regions during kdump. These helpers calculate the number of excluded
> ranges and perform the actual exclusion by iterating over the
> reserved_mem array.
>
>> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
>> --- a/drivers/of/of_reserved_mem.c
>> +++ b/drivers/of/of_reserved_mem.c
> [ ... ]
>
>> +/* Exclude non-dumpable reserved regions from @cmem. */
>> +int of_reserved_mem_kdump_exclude(struct crash_mem *cmem)
>> +{
>> +	unsigned int i;
>> +	int ret;
>> +
>> +	for (i = 0; i < reserved_mem_count; i++) {
>> +		struct reserved_mem *r = &reserved_mem[i];
> [Severity: High]
> Can accessing reserved_mem here cause a use-after-free on systems that have
> /memreserve/ entries but no /reserved-memory node?
>
> The global pointer reserved_mem initially points to reserved_mem_array,
> which is marked with __initdata. During early boot, if there is no
> /reserved-memory node, fdt_scan_reserved_mem_late() returns early without
> dynamically allocating a permanent array.
>
> However, fdt_reserved_mem_save_memreserve_entries() unconditionally
> populates /memreserve/ entries into this __initdata array and increments
> reserved_mem_count.
>
> After boot completes, the __initdata section is freed.
>
> When a kexec image is later loaded, won't these helpers iterate over
> reserved_mem_count and read fields like size, dumpable, and base from
> the freed init memory?
Yes, it is indeed a UAF issue if no /reserved-memory node.
Will fix in v3
>
>> +
>> +		if (!r->size || r->dumpable)
>> +			continue;
>> +		ret = crash_exclude_mem_range(cmem, r->base,
>> +					      r->base + r->size - 1);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +	return 0;
>> +}

