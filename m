Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F82B37FF53
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 06:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780469067; cv=none; b=Z9Gqlm/bRyz6Qdy5uBNPa3/IULN9PU+SxP1J0v+byvZmrS/fsIllBvbSfdKUOj4mjR3QlyrFVrOb8U9pfRIbblhhahjEuVb+KR0fk2ZHpt9xAsrLPPNDbGvvKiyJk+giNC0j/7h8qvtocX2DgQWeR9G6hsPaAsd6+ffOma3HSZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780469067; c=relaxed/simple;
	bh=F5zhvt/iAlg6umNegPP2+kFF2Mb4DKEuLqC3mOxwjAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dyqaJ8nqX3tRRRBW+7kSuG1P7FpV/ro8jE9VDkH0cuGiCBc5dsClaYF/hR0NlViUACLnDv47KyO1Xq70u7LnVL+7GiidcDDMiiwwXIDY3z6KnLKq6OtpY2GpuPBEXisnYRg1kDURxAqx3B251N8fBJAM+mOoc3Nto0KOyCcSikM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UwnTDDe2; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UwnTDDe2"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2c132ac5ec2so12251905ad.1
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 23:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780469066; x=1781073866; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sd7sOkllNO4XLGxbX/2aYhqo9JXcF7DuVUpDO/tIkqk=;
        b=UwnTDDe2HDAPPKNZ+EGfRLLYVrIlzEVtDcphB7zMHkrgATRevhZqQJ2kyqYfxli2EW
         V64X+Z1saem+tV+jJMmGESDqSVi4S06wFoz3vnC/oEITkdu/ZBYFhvjjyQ84iXEL+hcw
         OEmhfnDECGZ1tSdsuqaomLREDoxdealjHhrCOpyu3AE/m/qV0+04YEpRDhcHVFlSjyD9
         SnQMvo25g6T+eGdTvuBykQrBLZF7NE5Rxlw0SxS9buo9sO5mJ6EVLm0PLlxZ4WrzPOxI
         S+PUzZ69QItskJjccdE7lqd7MuhCw18RXZPI90dNlzsNA5qwHMhKBZW6sjw8Z41sE2vy
         oRBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780469066; x=1781073866;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sd7sOkllNO4XLGxbX/2aYhqo9JXcF7DuVUpDO/tIkqk=;
        b=VK7FAKiYyXDGEGtQJQ5oifZBn8EwSJm3ISfBQEyN/8cp2q7Qi/uvEH/EHWGpY+fxMq
         capH+8SaV2mUogZv9MwehJmZ0fT2QFevNccu0vzKM+viMD2aLLHxa1VkONwNLZBPcm4V
         PL7lPy3VTSFrT3lOLGyW0xxFGFKBefZ/qr2Ouqi0lwUyRab2JTvm6NzFUX1XU6gW4vrQ
         VHGX1jCt1Jangujbltsw3n9UWTohXKANwCfM4qiYzvrmJ5SqVKzEd0xs8PE9iM5ZUbt+
         fGwblj3jg83idt0iHoFLTMLEHv5IRChbtEGoU92josPfm4g0lhX/hH5AjitRdmteBLbq
         OYEg==
X-Forwarded-Encrypted: i=1; AFNElJ8e5OsieowH2mw4qAvaq16TXjByIghKg4zdSZ1/W8iF/5xOJJ9Gv4LjAa7jLz5QB59ZS5Tdr7z4yDWl@vger.kernel.org
X-Gm-Message-State: AOJu0YyrH+HQrWo64LS6j6TJzI8pC4qA0ToRxhF1l9mPPNK4SyaxLypv
	sX2VIUt5Zk3C31jQhgTUzSFBr2M6AxX7gCLAcdwyaqia5PkGUIuaBbM4
X-Gm-Gg: Acq92OFQwdWhJy7cr+oQP6oJFOEnrVtUY6+tZtndZyvCeYKwYb/Bt7i9pr067qskqfg
	LAth1HCeS/cA/HrjyQf/qbkydDFWHF5z5USFpabpVCUT/iTxrCEBaBtnTsRnJ31IVK2gmrPw+dU
	QTcrMweP9aDR5LzU1u9uVGzni3jZ1JRlY/N9KsrG7oFrgnt0jVbwLMIFq4jRNUdUFoc2Zg53E8g
	mnVc8P6SrJEOp/bzmIYoG8s57g4dFYVGqnZOyQtZQI+D6Do4MSCSfDdELqtRShxzA8W55cO6KEf
	xXfWXhhCD04YJrU7RwZrFXCeFSwLaS8AsO9YVBawC+sbGa9nO1fWf7/SFuOkbDWpSkgn5msDE+N
	4gbG30YxH3Lir6mYe1Hji6D5w5nyRxaIgAw+pJMn3otoMvsVFduLj7Xy1s6EKEunJAA+ClvxTS7
	QUibOIZJWQUtK7oLc6NocD4wvFL3QTS9YsogJsHDpyiw==
X-Received: by 2002:a17:903:298c:b0:2c1:4d9:c8db with SMTP id d9443c01a7336-2c1644dbfbamr22648805ad.37.1780469065484;
        Tue, 02 Jun 2026 23:44:25 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16629cfb4sm13674395ad.59.2026.06.02.23.44.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 23:44:24 -0700 (PDT)
Message-ID: <79932afc-2e91-4a54-aff9-f550be784c36@gmail.com>
Date: Wed, 3 Jun 2026 14:44:13 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/11] of: reserved_mem: avoid post-init UAF when
 alloc_reserved_mem_array() fails
To: Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, kexec@lists.infradead.org,
 iommu@lists.linux.dev, zhaomeijing@lixiang.com, catalin.marinas@arm.com,
 will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 saravanak@kernel.org, akpm@linux-foundation.org, bhe@redhat.com,
 rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org,
 ruirui.yang@linux.dev, m.szyprowski@samsung.com, robin.murphy@arm.com,
 quic_obabatun@quicinc.com
References: <20260527032917.3385849-1-chenwandun1@gmail.com>
 <20260527032917.3385849-4-chenwandun1@gmail.com>
 <20260602162450.GA442759-robh@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260602162450.GA442759-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 6/3/26 00:24, Rob Herring wrote:
> On Wed, May 27, 2026 at 11:29:09AM +0800, Wandun Chen wrote:
>> From: Wandun Chen <chenwandun@lixiang.com>
>>
>> The global pointer 'reserved_mem' continues to reference the
>> reserved_mem_array which lives in __initdata if
>> alloc_reserved_mem_array() fails. of_reserved_mem_lookup() is
>> exported for post-init use, that would dereference freed memory
>> and trigger a use-after-free.
>>
>> So reset reserved_mem_count to 0 when alloc_reserved_mem_array()
>> fails.
>>
>> Fixes: 00c9a452a235 ("of: reserved_mem: Add code to dynamically allocate reserved_mem array")
> Fixes should come first in a series.
Understood, will do in future submissions.
>
>> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
>> ---
>>   drivers/of/of_reserved_mem.c | 20 ++++++++++++++------
>>   1 file changed, 14 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
>> index 313cbc57aa45..6d479381ff1f 100644
>> --- a/drivers/of/of_reserved_mem.c
>> +++ b/drivers/of/of_reserved_mem.c
>> @@ -69,29 +69,31 @@ static int __init early_init_dt_alloc_reserved_memory_arch(phys_addr_t size,
>>    * the initial static array is copied over to this new array and
>>    * the new array is used from this point on.
>>    */
>> -static void __init alloc_reserved_mem_array(void)
>> +static bool __init alloc_reserved_mem_array(void)
>>   {
>>   	struct reserved_mem *new_array;
>>   	size_t alloc_size, copy_size, memset_size;
>>   
>> +	if (!total_reserved_mem_cnt)
>> +		return true;
>> +
>>   	alloc_size = array_size(total_reserved_mem_cnt, sizeof(*new_array));
>>   	if (alloc_size == SIZE_MAX) {
>>   		pr_err("Failed to allocate memory for reserved_mem array with err: %d", -EOVERFLOW);
>> -		return;
>> +		goto fail;
>>   	}
>>   
>>   	new_array = memblock_alloc(alloc_size, SMP_CACHE_BYTES);
>>   	if (!new_array) {
>>   		pr_err("Failed to allocate memory for reserved_mem array with err: %d", -ENOMEM);
>> -		return;
>> +		goto fail;
>>   	}
>>   
>>   	copy_size = array_size(reserved_mem_count, sizeof(*new_array));
>>   	if (copy_size == SIZE_MAX) {
>>   		memblock_free(new_array, alloc_size);
>> -		total_reserved_mem_cnt = MAX_RESERVED_REGIONS;
>>   		pr_err("Failed to allocate memory for reserved_mem array with err: %d", -EOVERFLOW);
> These prints could be moved to 'fail'. Perhaps instead of just printing
> an error value, you can return the error value instead of boolean.
Will do, consolidating pr_err() under 'fail' and changing the return type
to int.
>
> If you respin just this patch, I can pick it up for 7.2.
Before I respin, I'd like to flag a dependency:
patch 05/07 in this series build on the signature change introduced by this
patch ("the void -> bool return type change of alloc_reserved_mem_array()")

Could you let me know which of the following you'd prefer:
a) Take patch 03 alone via your tree as you suggested, after it lands, I'll
    respin the remaining patches of this series.

b) Keep patch 03 in the v4 respin of the full series, reordered to the front
    per your earlier comment.

Best regards,
Wandun
>
> Rob

