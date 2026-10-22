Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655109;
	b=y6LrwcCmQwJnl2x12aoKJLd3EXQvW4jaq0zCzMWMFwxYpi1VLoYfULeP0tvapn+gVnYl
	 sad3fjE6rhIdwRVv+6RJ25TXoGF/Sx2iF1NlAVYTkXfz+whLUnmtsHNnOhETz7qEYngNv
	 KcINqW3AJfN7KWfhJpO2Iovz5PQYs27Zo3ZJ9LdFCjzuXL4gzTA/9XLEqYsdma1jim3di
	 hXBTksxdBj/Hc3PFvT7F5KmKlng/ycQuJrtWq6MF9vvMx3YqZ+FcyY4+JPbuTyTk8ADvT
	 98t37dyNNr4v7GkdMjOCcVcxkbzEfJoh/qqbFSdANnkDhAVGoxkzue6T7VTDlw7WALg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655109;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=HDXHwat4zLpbZennBEg7uZauJYVMECCPqpPno/TLnRE=;
	b=Ee5NKsExUmjUtiJ8I0jsa+jXFT9ZhUHN/Jfi7wHRUbNKiMxm/9mkEeZ+UfbgDOCjCFIQ
	 WT4HDos9Ig2uQOeOuyKJUBY5hrMRmc8JXwSaHeJnfWo9wUGx04wUmREaIWqFVtzsqZuTw
	 Nly+kpilA8DKsL8i5UdwRxxoVLsLzUHVCJimZdtEdFFEaRekAs8VpTSkm3fgk20pnCl7U
	 Ep1Gq/B23+Ekw+YXRxeZdRwhzjkf7JGo6TiRL0K1T/rpC2ItDh5Uyw/kLsvPbPlU4M2Ov
	 LLrN1x7Xrz161T5woi4YkvEyYvu1+QnSmx3pb3wou6yE6VA2OJfxyh7aclY+iKP4IWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HZ1r9e4G;
	arc=none smtp.remote-ip=74.125.227.134
Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97F3606A31F
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 07:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A97F3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HZ1r9e4G
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3964e7720afso933616a91.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 00:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792655108; x=1793259908; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HDXHwat4zLpbZennBEg7uZauJYVMECCPqpPno/TLnRE=;
        b=HZ1r9e4GBnfoISEPaTu5E2Fr67VqILGPAmi3gVnww0oZO9rkFx46fdhRzs3/Pi7mS7
         ewNndKXSt+ytf8HiQ8PJ75IkTVEct4BO7Sjg4vNjv/vKY8UIqMoW3u7oQYh7vT3DCWsf
         C3da1Qlptbcy2GiwD6WMQuthpgDZIo365zfam8oBMcD7Vm1/1HfobNJpVbla3TGdhIwc
         Ca6fN85+xaZl6aJCnmVhajHeTJ4ZjpnqlJqmH8FNwrHEYqJmTi1PT5Du64NYabGp4G5C
         CniGJtIESYWjFx59E4S4iSFiSdNGz70CC4ETwuvAGki5/Ze2GM4AzSiRz3/KGHN9B2WO
         WHPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792655108; x=1793259908;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HDXHwat4zLpbZennBEg7uZauJYVMECCPqpPno/TLnRE=;
        b=iQqpMktpS7YvedDnS6mJ2iVus9KUQgZk5k7jofyOzPQ0ZMLp/+H6a3z/ZZ49iSys6N
         3R/X1aezugWt3PGY61wpFuMajZT0nV9+jfCDIdo3leJm1C23pdWqb8tqSbLphtjjIbw2
         rr+S/qGJ3N0t3A8fnUdpVB30gJ212yw2ot+iMn37nKjUUT+PIh73LEzpVS5WDZpkDHTl
         z4Gu5UmVnOnRZh9tPxRmTy2CcJzJOMsgLIS/TkyXOYi55GQghZhAmTniBN2/+9NNBkBV
         s//WfNIqpECaLpVklesCDittwjY28BqM9j4ZfcHQBLW9+156h+Jo5xpcf7xxDBXzrOk6
         uUUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwAKigb3R9ucN2MR8QMHMayLW9y0VeuTunpNXkeVMTMDB5wRgnPG4lWO1r+bxxIRcgCNnm2/JjPLI7Y@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6CEMclieTVOpSUPN30NRNZ5DaUCVdK4ZmdGcc9cFQZfJKjsEd
	dqJXwF3Ni+7w4SdBylwuJZMUrRqsK7oDN33bcuxDXU0IDU8avtyVg9sc
X-Gm-Gg: AYBFou1bGKbmPPti9g+mmPwy1pJmznegWCUeLB6vpZR77//GrU6hd1Yg5jt5R8yrVxj
	M6xEjf+lU6zuYrb3gARdnqYIaBSRE/5Ez4mf5A73LG0EoNIiYdUHktC7Vy83XNPOGvodX86JFs9
	I1AhLvvSo8/3BGUDkqCYKRweJmloLXglW2HK/AFATbqJUEfrhyqk4+8RPYMdsAH21ckIKCPa6fc
	sH3Ydb660fX5BjyHmleZpP3ifXoNUCX4ln4Nmvimf4etnON860yvKdtfUINaG+T/HmktogYuzu9
	JVYoOluJ5WyglH6FuP4A8Earplas62j1QNVjgkm5d2hX8KrdSOmT9yJaVFrnuG5SssjVAy3kSRe
	3k8SqOulBou77XdkgMEhAiX0lIpnRIsgZjLD0CJ8LMimQXi5/laEbGwJqdDNieX+py84oqhBSrH
	S4OZz8x8pOxAk4Hf6bC7RUWCYg51gMB1qyWyEJBB9Yi6wbLT2qhRA5dNDuyvEcejI7nmvzY+Bx2
	Yt/P6UJaPEk3EKoJ5ys7r2Vwt/t0fTkwTog+gZl1eEnf+8yNsZg/1VpILR9lX8=
X-Received: by 2002:a17:90b:5870:b0:3ab:5758:3766 with SMTP id 98e67ed59e1d1-3ad8707700dmr3724932a91.51.1792655107849;
        Thu, 22 Oct 2026 00:45:07 -0700 (PDT)
Received: from [10.125.112.22] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada49366fdsm2945920a91.14.2026.10.22.00.44.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 00:45:06 -0700 (PDT)
Message-ID: <098ff899-81b9-4ccc-a143-1e324446258f@gmail.com>
Date: Thu, 22 Oct 2026 15:44:48 +0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/8] crash_core: serialize crash header preparation
 against hotplug
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 chenhuacai@kernel.org, kernel@xen0n.name, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 hpa@zytor.com, saravanak@kernel.org, akpm@linux-foundation.org,
 pasha.tatashin@soleen.com, pratyush@kernel.org, ruirui.yang@linux.dev,
 robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 kexec@lists.infradead.org, linux-mm@kvack.org, iommu@lists.linux.dev,
 robh@kernel.org, baoquan.he@linux.dev, rppt@kernel.org,
 m.szyprowski@samsung.com
References: <20261021083011.2170525-1-chenwandun1@gmail.com>
 <20261021083011.2170525-4-chenwandun1@gmail.com>
 <12e4e687-1ff0-41b2-bdf8-7f48b29e1f2f@huawei.com>
 <a1665f9e-3116-47bc-974e-98dce408fa37@gmail.com>
 <31d63208-3ef2-420f-a0c2-d9d6d49c5e21@huawei.com>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <31d63208-3ef2-420f-a0c2-d9d6d49c5e21@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/22/26 10:00, Jinjie Ruan wrote:
> 
> 
> 在 2026/10/21 17:48, Wandun 写道:
>>
>>
>> On 10/21/26 17:13, Jinjie Ruan wrote:
>>>
>>>
>>> 在 2026/10/21 16:30, Wandun Chen 写道:
>>>> From: Wandun Chen <chenwandun@lixiang.com>
>>>>
>>>> crash_prepare_headers() counts memory ranges before populating the
>>>> allocated crash_mem array. The weak implementation used by ARM64,
>>>> RISC-V and LoongArch walks memblock.memory, while x86 performs the same
>>>> two-pass operation over system RAM resources. Concurrent memory hotplug
>>>> can change range source between the two walks and make the populate
>>>> pass overflow cmem->ranges.
>>>>
>>>> Take device_hotplug_lock when preparing crash headers during
>>>> kexec_file_load(). The x86/riscv memory hotplug path already takes
>>>> device_hotplug_lock, so call __crash_prepare_headers() directly
>>>> to avoid recursive locking.
>>>>
>>>> Sashiko reported this issue in [1].
>>>>
>>>> Fixes: 3751e728cef2 ("arm64: kexec_file: add crash dump support")
>>>> Fixes: 1bcca8620a91 ("LoongArch: Add crash dump support for kexec_file")
>>>> Fixes: 8acea455fafa ("RISC-V: Support for kexec_file on panic")
>>>> Fixes: dd5f726076cc ("kexec: support for kexec on panic using new system call")
>>>> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
>>>> Link: https://sashiko.dev/#/message/20260806101002.1F84E1F000E9@smtp.kernel.org [1]
>>>> Acked-by: Baoquan He <baoquan.he@linux.dev>
>>>> ---
>>>>  arch/riscv/kernel/crash.c  |  2 +-
>>>>  arch/x86/kernel/crash.c    |  2 +-
>>>>  include/linux/crash_core.h |  2 ++
>>>>  kernel/crash_core.c        | 17 +++++++++++++++--
>>>>  4 files changed, 19 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/arch/riscv/kernel/crash.c b/arch/riscv/kernel/crash.c
>>>> index fe5a4b306aae..ac8df2edf2a7 100644
>>>> --- a/arch/riscv/kernel/crash.c
>>>> +++ b/arch/riscv/kernel/crash.c
>>>> @@ -70,7 +70,7 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
>>>>  	 * Create the new elfcorehdr reflecting the changes to CPU and/or
>>>>  	 * memory resources.
>>>>  	 */
>>>> -	if (crash_prepare_headers(true, &elfbuf, &elfsz, NULL)) {
>>>> +	if (__crash_prepare_headers(true, &elfbuf, &elfsz, NULL)) {
>>>>  		pr_err("unable to create new elfcorehdr");
>>>>  		goto out;
>>>>  	}
>>>> diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
>>>> index e6f23933a6df..bef008a0cb22 100644
>>>> --- a/arch/x86/kernel/crash.c
>>>> +++ b/arch/x86/kernel/crash.c
>>>> @@ -465,7 +465,7 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
>>>>  	 * Create the new elfcorehdr reflecting the changes to CPU and/or
>>>>  	 * memory resources.
>>>>  	 */
>>>> -	if (crash_prepare_headers(IS_ENABLED(CONFIG_X86_64), &elfbuf, &elfsz, NULL)) {
>>>> +	if (__crash_prepare_headers(IS_ENABLED(CONFIG_X86_64), &elfbuf, &elfsz, NULL)) {
>>>>  		pr_err("unable to create new elfcorehdr");
>>>>  		goto out;
>>>>  	}
>>>> diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
>>>> index bc087124cd78..28e7a81cf263 100644
>>>> --- a/include/linux/crash_core.h
>>>> +++ b/include/linux/crash_core.h
>>>> @@ -61,6 +61,8 @@ extern int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_ma
>>>>  				       void **addr, unsigned long *sz);
>>>>  extern int crash_prepare_headers(int need_kernel_map, void **addr,
>>>>  				 unsigned long *sz, unsigned long *nr_mem_ranges);
>>>> +int __crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
>>>> +			    unsigned long *nr_mem_ranges);
>>>>  extern int crash_exclude_core_ranges(struct crash_mem **cmem);
>>>>  
>>>>  struct kimage;
>>>> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
>>>> index faa0f22dbb41..8a861a946e26 100644
>>>> --- a/kernel/crash_core.c
>>>> +++ b/kernel/crash_core.c
>>>> @@ -16,6 +16,7 @@
>>>>  #include <linux/mm.h>
>>>>  #include <linux/cpuhotplug.h>
>>>>  #include <linux/memblock.h>
>>>> +#include <linux/device.h>
>>>>  #include <linux/kmemleak.h>
>>>>  #include <linux/crash_core.h>
>>>>  #include <linux/reboot.h>
>>>> @@ -344,8 +345,8 @@ int crash_exclude_core_ranges(struct crash_mem **cmem)
>>>>  	return 0;
>>>>  }
>>>>  
>>>> -int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
>>>> -			  unsigned long *nr_mem_ranges)
>>>> +int __crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
>>>> +			    unsigned long *nr_mem_ranges)
>>>>  {
>>>>  	unsigned int max_nr_ranges;
>>>>  	struct crash_mem *cmem;
>>>> @@ -382,6 +383,18 @@ int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
>>>>  	return ret;
>>>>  }
>>>>  
>>>> +int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
>>>> +			  unsigned long *nr_mem_ranges)
>>>> +{
>>>> +	int ret;
>>>> +
>>>> +	lock_device_hotplug();
>>>> +	ret = __crash_prepare_headers(need_kernel_map, addr, sz, nr_mem_ranges);
>>>> +	unlock_device_hotplug();
>>>
>>> I think this patch conflicts with my changes and would also conflict
>>> with the implementation of arm64 crash hotplug.
>>>
>>> https://lore.kernel.org/all/20260921090450.807575-15-ruanjinjie@huawei.com/
>>>
>> Have these patches already been merged? My current work is based on the latest
>> linux-next. If they have already been merged into the maintainer's branch,
>> please let me know, I will update my tree and rebase/re-adapt my changes accordingly.
>>
>>
>> Also, regarding the changes in kernel/crash_core.c: it looks like we modified
>> the same spot, the change is not wrong, is that right?
> 
> Hi Wandun,
> 
> However, I think someone should have informed me in advance; otherwise,
> doing duplicate fix work is pointless.
> 
> I see that part of your patch series modifies code I previously changed,
> but I was not CC'd.

Hi Jinjie,

Sorry for not CC'ing you. I keep the per-patch Cc lists short because
large recipient sets have caused my sends to be cut off midway before,
(I'm still trying to track down exactly where the problem is) you should
have been on the list that's my miss. You'll be on the Cc of every future
version.
> 
>>
>>> arm64 crash hotplug:
>>> https://lore.kernel.org/all/20260918100442.3841135-18-ruanjinjie@huawei.com/
>>
>> In addition, if arm64 gains crash hotplug support, the code there would indeed
>> need to be modified (to avoid a deadlock). As of now, arm64 crash hotplug
>> support has not been merged yet either, has it? I just want to make sure I
>> haven't missed anything.
> 
> Yes, you are right. If your patch series will be merged soon, I will
> develop based on it.

Also thanks for your reminder, otherwise I might later overlook the case
where arm64 has already gained crash hotplug support, and introduce bugs
as a result.


Best regards,
Wandun>
>>
>>>
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>>  /**
>>>>   * crash_exclude_mem_range - exclude a mem range for existing ranges
>>>>   * @mem: mem->range contains an array of ranges sorted in ascending order
>>>
>>
> 

