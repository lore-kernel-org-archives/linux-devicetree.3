Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE79377EAF
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 08:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778143708; cv=none; b=MODHDQKbNJDrIKSsjMEAKdMSImzMoqCMuvpX24gwr5sQZFOsqjzmRvOmBPt06cVNISrLqvLnC1OWElN6ogmsyMYceFuOgYG6hM5vyUbjNXNkoYaAA7fAulS7RbQ72V/cHNyTPYXgFrudp8I2E4PH5wRnxweaIOW+oQnxTBZ31yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778143708; c=relaxed/simple;
	bh=JIGuETpivY+tMqhUXN4t4Bny+zQtYhvsCkl/N+OUQDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VJLRV5oIxWQZJxUaezFI+AlPeIGWf1t00fpCgd9isGeChRa55/alZxJ/JLUgaNU+6bqXeLTEUqqV3W36hnUER3/lEdAqB94VVDArPfeGzKrSyQ9pJbBbLj8JqIgznVUbta9XFkmHS6XnGUo2Yfeo0c9kdeeb+9pkLkUvySFH0RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AtmwBZYp; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AtmwBZYp"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2b4583f0a1aso3355615ad.3
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 01:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778143700; x=1778748500; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2g4HOatV1Ssugu2qkDT6I/dNGmnk+MzQNypIG54pufk=;
        b=AtmwBZYpnqNaJHDqgnVaNyl/TVpJQ7/PhlUG+5f1LRMAjHRjb5hKjvweqnGGhj+ZA/
         9YC5nym6VkSVsrlmcjjEQAtEwwS7w3+/onAJW6l0hs8uBkpNLfLEHLkfjaseRHdnz8mf
         NQuPGW/Own1NpoUiPgYCWPuxywXYW/WNQ8dcA1mzkcHN/hgrQyB44J8RsUoOT4gy+f+M
         vpdPSDXAcl/1secrSK5Ydx/MMBqm0Q3uoQjYcivKuN7jnst3qCrtiHwPSKpcNBUtZTT4
         mG+I/6uoEEed1PTZrUvLhenGSD/pNBRwDE+32y8gK9gK5fd+43EKR367imVKiGNxx9o2
         5bOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778143700; x=1778748500;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2g4HOatV1Ssugu2qkDT6I/dNGmnk+MzQNypIG54pufk=;
        b=SnoJYlHu/zwVkha77dJ3pZDcBA2w1wqRx0QE/+jT34x8tcAbgWQPEsdTBpCz15pikS
         svEUz/ef8fL9HSar7xgMmXBzxIQjuk4YgojIr7ZBPYHblPO4j9fjjVAwlCSqFKtcghXS
         ya/ICoBSalRwdjPfNBZyOVm2o9feuYsjZnmwZAg0sgMxsuRQ/RjVRi83FsmRHZ5i0qbe
         Fi99RhTRtpqyKL6RUlyNHKzF6lcqBh1OujufdkLjtSr8waIWkM6kuTeZQdPQKyPSAKtG
         MgwGjclEs/uIRgsrLkoqILJt9cbgr+yzHVv6Th39/FdBo4mk8S7ID3/TTEVXaHi5L3kS
         CBwQ==
X-Forwarded-Encrypted: i=1; AFNElJ/3uJGUImJ5nDNBZmBrQEBLY3mURrcutKC3MxjmElSaBSDFX6vJ+ifw7D1JXm/hlKQRoRBFZT1oRcNZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0czQyA/Wv2KIjJifgUrzrWRbZ7IgPl+Jr/O7dXFRQTIDNaR0V
	GcN/9V8pibhIA5IsQWfGAFV4gy7tAlo4TM1lL6oHSxV+VzWMwj+v1eSK
X-Gm-Gg: AeBDietrfQ689owj/IMGgrhZILrgOomgWk+voitIJy+rq/voqwD8ZJCsJRY4g6WcNmP
	Rt87jMtyA0J+9cGsPydCB4RT0r4H/0hJI0iA7wD9oMwZHvFUNWLk4HynUVLjzf4eURXn0bRwn5O
	aNl9KRk4mWOV4rgOktIdV5YHVCsnqBBws5oeASrZohvtwCjiXu8muxaHgxVIcAYUU1B1VR6aGqB
	ttbmWL4xx0X8VCplz0SjFPcPKgCoRM0lW6Jo03pd9QZgiThjrhs7GrO74sCVko4Wbhswub8Dpdy
	lM/oE2fjTu8DNLZcQjmlbEg42Aa+MNVc+aGCCghTYiiN2G5z8mVWo/4Qt2Luha+E002s46Qegh9
	kU6cxN5QzdhhT05PvSF3AxlnreTUm/5APXih45MxYQr+yRls3+W1NzotgZBueAsjvdRZiNF3Zck
	VsqzyH0hAZXQk/IT3gVYEX/RZpliheZmLR8u9MLnvceQ==
X-Received: by 2002:a17:903:903:b0:2b0:5d60:7f3f with SMTP id d9443c01a7336-2ba78f7320amr72637805ad.16.1778143700446;
        Thu, 07 May 2026 01:48:20 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2babab0152csm19143165ad.35.2026.05.07.01.48.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 01:48:19 -0700 (PDT)
Message-ID: <6056bd1f-3998-44ff-8c4f-972704e0b896@gmail.com>
Date: Thu, 7 May 2026 16:48:09 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] of: reserved_mem: add no-dump crash_mem exclusion
 helpers
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
 <20260429065831.1510858-8-chenwandun@lixiang.com>
 <20260506145022.GA2084721-robh@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260506145022.GA2084721-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/6/26 22:50, Rob Herring wrote:
> On Wed, Apr 29, 2026 at 02:58:27PM +0800, Chen Wandun wrote:
>> Provide two kdump-oriented helpers so that arch kexec_file code does
>> not have to open-code the no-dump filtering loop:
>>
>>   - of_reserved_mem_no_dump_nr_ranges() returns the number of reserved
>>     regions flagged with linux,no-dump. Each exclusion may split one
>>     existing crash_mem range into two, so callers use this count to
>>     pre-size their crash_mem allocation.
>>
>>   - of_reserved_mem_exclude_no_dump() walks the reserved_mem[] array
>>     and calls crash_exclude_mem_range() for each no-dump region.
>>
>> Both helpers are guarded by CONFIG_KEXEC_FILE; empty inline stubs are
>> provided for the !KEXEC_FILE case so architecture code can call them
>> unconditionally.
>>
>> The consumers are added in the following arm64, riscv and loongarch
>> patches in this series.
>>
>> Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
>> Tested-by: Zhao Meijing <zhaomeijing@lixiang.com>
>> ---
>>   drivers/of/of_reserved_mem.c    | 54 +++++++++++++++++++++++++++++++++
>>   include/linux/of_reserved_mem.h | 15 +++++++++
>>   2 files changed, 69 insertions(+)
>>
>> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
>> index 4b80420da2d2..038056a6408a 100644
>> --- a/drivers/of/of_reserved_mem.c
>> +++ b/drivers/of/of_reserved_mem.c
>> @@ -27,6 +27,10 @@
>>   
>>   #include "of_private.h"
>>   
>> +#ifdef CONFIG_KEXEC_FILE
>> +#include <linux/crash_core.h>
>> +#endif
> You shouldn't need ifdef around includes.
>
>> +
>>   static struct reserved_mem reserved_mem_array[MAX_RESERVED_REGIONS] __initdata;
>>   static struct reserved_mem *reserved_mem __refdata = reserved_mem_array;
>>   static int total_reserved_mem_cnt = MAX_RESERVED_REGIONS;
>> @@ -916,6 +920,56 @@ struct reserved_mem *of_reserved_mem_lookup(struct device_node *np)
>>   }
>>   EXPORT_SYMBOL_GPL(of_reserved_mem_lookup);
>>   
>> +#ifdef CONFIG_KEXEC_FILE
> Use 'if (IS_ENABLED())' within the function.
Get it, thanks.
>
>> +/**
>> + * of_reserved_mem_no_dump_nr_ranges() - count reserved regions flagged
>> + * with the linux,no-dump property.
>> + *
>> + * Each such region may split an existing crash_mem range into two when
>> + * it is excluded, so callers can use this count to pre-size their
>> + * crash_mem allocation.
>> + */
>> +unsigned int of_reserved_mem_no_dump_nr_ranges(void)
>> +{
>> +	unsigned int i, n = 0;
>> +
>> +	for (i = 0; i < reserved_mem_count; i++)
>> +		if (reserved_mem[i].no_dump)
>> +			n++;
>> +	return n;
>> +}
>> +
>> +/**
>> + * of_reserved_mem_exclude_no_dump() - exclude no-dump reserved regions
>> + * from a crash_mem list.
>> + * @cmem: crash memory list to modify
>> + *
>> + * Walks the reserved_mem[] array and calls crash_exclude_mem_range() for
>> + * every region with no_dump set. Intended to be called from arch kdump
>> + * code when constructing the elfcorehdr.
>> + *
>> + * Returns 0 on success, or a negative error returned by
>> + * crash_exclude_mem_range() on the first failure.
>> + */
>> +int of_reserved_mem_exclude_no_dump(struct crash_mem *cmem)
>> +{
>> +	unsigned int i;
>> +	int ret;
>> +
>> +	for (i = 0; i < reserved_mem_count; i++) {
>> +		struct reserved_mem *r = &reserved_mem[i];
>> +
>> +		if (!r->no_dump || !r->size)
>> +			continue;
>> +		ret = crash_exclude_mem_range(cmem, r->base,
>> +					      r->base + r->size - 1);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +	return 0;
>> +}
>> +#endif /* CONFIG_KEXEC_FILE */
