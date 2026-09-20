Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1EA302753
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 08:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789891253; cv=none; b=JVEDk/1vL4ScBGcFifM3SSF5hSx4nXvYKVAu8MFtayjgq0F9woEdG31/+4z+Q4az+XGUok/Rk0aGzlHqrH1CrXaJhoRj6y1TadeeF6D13xfNoOkUyNNr/C3jZ9qPwUNzi7lz4uHXZCW1MevbY/VlT0u+RJc5dF9cyG3MlHJg/rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789891253; c=relaxed/simple;
	bh=PYjoRnzoFTLZF653qo+HDOrzFXvuX00dh48RUmFUdyU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VXxKA6wy8GOf7Jaz6pjZCDGRRa4VaW3bxSl296iGPLQ04Mkd8EeUR3ig8R33rvZL0AIcfsOn0GD1HbiU697BEHI22OM8DPx9psHSs7RGWEdRgPnokyOw976XsD3Uv63nMmQGjSkGqpxGRMoSdKxnXyxjGboHOOg03tOsHSeDRX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QhGtCy3u; arc=none smtp.client-ip=74.125.227.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QhGtCy3u"
Received: by mail-pj2-f6.google.com with SMTP id d9443c01a7336-2d74bbdc61fso2160635ad.0
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 01:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789891251; x=1790496051; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t8CTYyRXY2aAud9otm1AgJf6WMdrU7YgSbJhEbsEEJg=;
        b=QhGtCy3u0r1QAGVWmkf6gmW7xkK7GYR9VlZoyIjv5iphf7Cr3aI4a2yI0wMmXGWv0I
         gblVqbshl6/KzZWX+EFre4Qd8HMplrUvzvNgWntDg6dI4PCpU0DmTKXNXQ4QnhT+nneq
         kj57P4KQntJxxE5z53tIEC4cNGdNG/RF9eFOz2g6KI13AvTFWw3Dz+TdTwvtPHKB1qgw
         v9+JXgJvSPbSzEr9eCySjxwahcJaQmz8F3MpWjNHyzwhmlXAryQmBuLEbxdPtMyalu2R
         35IAgA020+7HWV3Y2w9pjCtu4ebg8BTCgDZmx97VJo6e3aUiiHexLQwrJn0TgtItgK1D
         Gckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789891251; x=1790496051;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t8CTYyRXY2aAud9otm1AgJf6WMdrU7YgSbJhEbsEEJg=;
        b=xztO4IggDMl3WXVcxtw7mrgO9zOA/lKuLA2jMTNdDtfm7FXqkpy5MIpn/IMOUx451R
         FcxtP9oNvHVHOp54++90gDf4EHKsW16Z7VnasOzY/iADiuhiX+LITO4IkSrBwLTSgUFY
         Xmj6lxm9PkHQOYHVGflHfT3eDLKlqJ9L2h/3gOi9z84jcReNSJNuUhFCugaX1Jz2j2Ep
         txUFf8En7UCzs+kqSWHuouLHVOp5ILwdzgizbg01RRiofbsN7FabzmAhCP4xNYz75mTM
         KZiUHwDUeB6+QOdeqvw9S8Rj2mYA1xVmfiOLMA4FADJs9CqQJFmg2lUZlxE8D8yOmTla
         K9Sw==
X-Forwarded-Encrypted: i=1; AKwUvBysLzbeFDfDAfJBpSIizlgt1nlcC59lat5X3vTPomXWXXW+dxYqI7eogkOfBs/dcB7yGxtSvABPNDsc@vger.kernel.org
X-Gm-Message-State: AFuF++lDZbqMwVVVdOkou/Zu73KHOSYwOs7JjqxB5DG824lyK+hqVPwx
	QqDa4ICHioKS/u6RMKVsNY4ECh5LMn2A6u8SAlEYLVV2bYsZetu/vLHJ
X-Gm-Gg: AYBFou1d5fdd/JLjNiNUzU/7KrZs8h2loUxjXshEDLmQupIPnq6QEc9TVWn/F1ND2v4
	FPT4p46nbQxy/ZO8WSCPSn22RxkLWo5z45laI+cBFCCEGOtnr+tvnQR6tXwVIuSfJ1UHNZSzdDA
	0ZjkbasA1F2QvyhGAmnFOV0QY2zt8ZnV6Hm/i3cSg78l/PbWNCN43zVmeH6CB1xSIphXq2ZOc0M
	/cyodTSxbjQQYvJ5epmhBQEIZmT8k5ddcx4x1rCN8wrfAQQVnawQE8oRKuGyDZ6gS92rnA0+bx5
	qeripIOc5o1nucvLKtNh43vLlEPVwF0C/IonzDNwqRvgS9ioijgDis5R+A976J9nN4vICqLf1Sp
	QnP+jGHMh7cl4uuWps4NvUVjbe34gBpHuPf0vudzbCRgaPHzIerBUz4DnCSTvVVxrIDc+8XpGgi
	gAOxS96rBSsH2W0BfwFdrSijdGqs8I9piw2R9nqprqwkPVNWGxi2SFVVQpRuNF672F3aLYm2Fni
	LgQXA==
X-Received: by 2002:a17:90a:fc4b:b0:3a0:2900:f55e with SMTP id 98e67ed59e1d1-3a02900f85dmr2402815a91.29.1789891251509;
        Sun, 20 Sep 2026 01:00:51 -0700 (PDT)
Received: from [10.125.112.20] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cae997csm7876986a91.11.2026.09.20.01.00.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 01:00:49 -0700 (PDT)
Message-ID: <32b00102-0961-49e3-b780-74d6db182809@gmail.com>
Date: Sun, 20 Sep 2026 16:00:30 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/10] memblock: introduce MEMBLOCK_NODUMP flag
To: Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>
Cc: catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 robh@kernel.org, saravanak@kernel.org, akpm@linux-foundation.org,
 pasha.tatashin@soleen.com, pratyush@kernel.org, m.szyprowski@samsung.com,
 mark.rutland@arm.com, kernel@xen0n.name, alex@ghiti.fr, hpa@zytor.com,
 ruirui.yang@linux.dev, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, kexec@lists.infradead.org, linux-mm@kvack.org,
 iommu@lists.linux.dev
References: <20260902073116.802752-1-chenwandun1@gmail.com>
 <20260902073116.802752-7-chenwandun1@gmail.com> <aqzxavL91icLw-Xv@fedora>
 <aq41nFRPtRWTQ7cK@kernel.org> <aq9UGXeqmCfuPHdD@fedora>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <aq9UGXeqmCfuPHdD@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/20/26 11:33, Baoquan He wrote:
> On 09/19/26 at 10:11am, Mike Rapoport wrote:
>> On Fri, Sep 18, 2026 at 04:08:10PM +0800, Baoquan He wrote:
>>> On 09/02/26 at 03:31pm, Wandun Chen wrote:
> ...snip... 
>>>> +/**
>>>> + * memblock_mark_nodump - Mark a memory region with flag MEMBLOCK_NODUMP.
>>>> + * @base: the base phys addr of the region
>>>> + * @size: the size of the region
>>>> + *
>>>> + * Mark the region as not to be included in crash dumps.
>>>> + *
>>>> + * Return: 0 on success, -errno on failure.
>>>> + */
>>>> +int __init_memblock memblock_mark_nodump(phys_addr_t base, phys_addr_t size)
>>>       ~~~~~~~~~~~~~~^
>>> Is it impossible to use at runtime even thought it claims to be generic?
>>
>> This should only happen at boot.
>>
>> Allowing modifications of memblock properties in runtime is a can of worms
>> I don't want to open.
> 
> Thank you. This is why I said this can't be claimed as a generic way to
> mark memory region as no dump. The generic way I'd like to see is
> at any time of system we can mark any unwanted memory region as no dump.
> And it won't impact the behaviour of the current system.

Thanks Mike for the explanation and Baoquan for the suggestion.
I'll drop the "generic" related description in the next version.


Baoquan, by the way, patch 2 is still awaiting review. It rewrites
the riscv side of the code that patch 3 (which you've acked) then
folds into the weak defaults, if you could take a look at it too,
that would be very helpful.

Best regards,
Wandun


> 
>>  
>>>> +{
>>>> +	return memblock_setclr_flag(&memblock.memory, base, size, 1,
>>>> +				    MEMBLOCK_NODUMP);
>>>> +}
>>>> +
>>>>  static bool should_skip_region(struct memblock_type *type,
>>>>  			       struct memblock_region *m,
>>>>  			       int nid, int flags)
>>>> @@ -2887,6 +2902,7 @@ static const char * const flagname[] = {
>>>>  	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
>>>>  	[ilog2(MEMBLOCK_KHO_SCRATCH)] = "KHO_SCRATCH",
>>>>  	[ilog2(MEMBLOCK_RSRV_HUGETLB)] = "RSV_HUGETLB",
>>>> +	[ilog2(MEMBLOCK_NODUMP)] = "NODUMP",
>>>>  };
>>>>  
>>>>  static int memblock_debug_show(struct seq_file *m, void *private)
>>>> -- 
>>>> 2.43.0
>>>>
>>
>> -- 
>> Sincerely yours,
>> Mike.

