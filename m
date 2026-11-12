Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794471156;
	b=p1Mgx3YB8FpIKTHCOtmKZOFxxwegMMx9kFLDyHNeLrzyXKU/v594npYMP/V1fTAW5RIg
	 dHP4g8vqfYGBkpAUax8+gMl2hLmdib6KC9k12le9K69pgVeM1/r3U3IfIkyAEDDFQhviA
	 kyLqvCParpVdb4vJ1TiDyB8fqtfpar3cLqEeSNYgEzqF8ucaSSru0X9P7HPaxDQjLar6l
	 +qMBHuChuWbfbW98iQZyo3XUe0+/BF3pMiOvrKrIKnjMCBAH+4LtDxk0v5ZgQyBJV3RfM
	 l951BE31OGAM3B12uI0Fps56y7rNa8cLms4dOs/is6GbCmGqMu0ESV4uk7pXhfMLPMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471156;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=i4Usv198qCvT1xdnr9OKW5ZLVCsGku8RkLVQlQ2znC0=;
	b=DiTOc2etpDiUjnKrRHMczpzjXe3fPscv5f4KRwBSLIm48Dgccu+DXNP3pfF02V+/fBMO
	 R+aJeeM2w3xS2AjjUQy6PnPWXW+AnqvCNEvO4++QkFrjtDwzexixzzfouEpt4I6ZsTDbK
	 pP0TXGJo8m5v6AYn2BDq4P8kk5VAfOz1iVg5w3Mj41vbZXRwdPxaa79I1Aa9U5vr8ZONA
	 TjmkkeM4Kru9l9NdMxfznmV0UEAMvNnvE0QNZKVHIjestqIsWmIbloWkGFAmfnZZESXkJ
	 cuoAtWeRJNjRRtlORljRiVYG2mWmEAIGGYYUte3PyTuRfc29wZisU/RmZ98Ek+iglyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HXsfTWlv;
	arc=none smtp.remote-ip=74.125.227.198
Received: from mail-pi2-f6.google.com (mail-pi2-f6.google.com [74.125.227.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70450606A330
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:12:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70450606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HXsfTWlv
Received: by mail-pi2-f6.google.com with SMTP id 41be03b00d2f7-cdb536daf59so2063997a12.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 00:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794471155; x=1795075955; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i4Usv198qCvT1xdnr9OKW5ZLVCsGku8RkLVQlQ2znC0=;
        b=HXsfTWlvdZpaXlHRxPEMEeUWm41NRd7Pj0qjWjMS+5i0zYK+VB1y58If6sKgzyCUVk
         euCU8toU1OjmASImGBFv1SkzJBSTyKRYbjp7ksPGokVgfoqBxqheIgiT7m9RoR4DKVXr
         P6SD1zN/STvrCZdhQWjfghduBk8oCaNHtmDBjAYpKF/vhcUNDQDEVXyM71OFI2xRhD2C
         o1LVrcwHgsYrX7HoFSNFBmlGIIcxh+J2rGvkGGG2e4SEXqCr1TwjtnMijfJYzegzrEeH
         89BL2LfCVC064r39s/Ftb50krGI2lg25lbtsP9QxknqAvGST4Fcs8ZQlgoAhlR54Weoa
         CXKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794471155; x=1795075955;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i4Usv198qCvT1xdnr9OKW5ZLVCsGku8RkLVQlQ2znC0=;
        b=U/ExALPmhHTmlEJwZcH7W/EpdVIVihyZgdbBR2B2lI6W2ie/VLt5bzAkILeXtL/8Z2
         Ebg2xfA5LQJKzZwuMYvHbFx8pRnzY/uLXLG5mzwLmOucpzIdMSGDyWEkNrFwIVr2OJGR
         C5xXmvvuxRsJ9kdNun7ecs0HWIkNlHPxICxF3kugow+K4ePaDf40bqQvstYsj84/R98T
         UeKieUbIKSnP/3tqmO7um1LbS/KUIJ8I7U+l8XYpa5mCvj4o3CLNc57XqIPWm9aibaDb
         NvJHQE16hR11EPWj7ktRReOTKyP9HH4PEznihh80wWyPxuVOx8paqqQSuxu/a1TrAFfk
         cQLA==
X-Forwarded-Encrypted: i=1; AL+hErGZvoKS4KYrUvQvKWBWUReIkpCRbFpeVMiiYuOU34y2YKuNYD+seUpeArU4uNZHpcNPo1qhyInA6KHD@vger.kernel.org
X-Gm-Message-State: APuU4Z+CPddQyF97RsSdr1UW537PDP+yk8EJvq7FpcRQaA6Kt6Ho0jzV
	SHQxtJNIO+yLfarVZolpLIXCtWMUxX8zbRG0e+NjAv+fKeufUqCxpsiU
X-Gm-Gg: AYBFou06pBG5wJw9JSnWb15pT27eLjmQWNnzLoLYocBkSD9ibSIXRCKFYTc+k1voZEn
	G1X5YLuRzXc+6lHeyPFfok6xvqi7ypyVnDQ+VMYSuNCCyAdss7QDWO1dPsxKACkEkhOVyp30EKA
	k8hNfgrrPk1OJVxF7DdZ373swpgbsRsxVCKsE8r0ZV1TDVP03wXdLjDnptwnxptPxm9xP0zx1zr
	t9KzDZRJwkBVaU2h8cOV4IMqzwAHvYUU33+Nxup49fOT9XnRsLLbADaq+vMTRHJYX+N+12rA1Ky
	rPDM7dPp4HQWX+AwRS74OxCESAsMuxf3mXG7mlEEu/0c2VluAxa+uasM4qbxudpgWzLl+3RYFTy
	HWtM4rZJiPwqQQepV75/xM3bu+WBP0b598Sf0Sd2jv79oUPnIgGNQk+n0O2tzZRwYFkNl+MW5FI
	1MUAPH4nl1DPBJGjm9g5fvNhQBuDZDU6P/w2bvmbeTjQfUuU6t/aja1CoRE8yvvgwVhQ4TpvT5R
	zKL5H45G/B21bYbewd3Jj/5Iy6PvmHMEy9KuCF8x0sa7XjjNg/1c+qrX9kUxhO4amoJusOJSmcK
	cUZcNYLGXZEyIcdezDc8ZRpcnu1bzZFv4yVUCA==
X-Received: by 2002:a05:6a00:1893:b0:89e:37b0:d1bc with SMTP id d2e1a72fcca58-8bc1cd62e03mr5111050b3a.28.1794471154695;
        Thu, 12 Nov 2026 00:12:34 -0800 (PST)
Received: from [10.125.112.22] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baa7de3eecsm3105447b3a.1.2026.11.12.00.12.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 00:12:33 -0800 (PST)
Message-ID: <210ff30c-17a1-4bd1-b943-34a1d0688e43@gmail.com>
Date: Thu, 12 Nov 2026 16:12:18 +0800
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
Subject: Re: [PATCH v9 0/8] kdump: reduce vmcore size and capture time
To: Mike Rapoport <rppt@kernel.org>, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu
Cc: robh@kernel.org, baoquan.he@linux.dev, m.szyprowski@samsung.com,
 catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 chenhuacai@kernel.org, kernel@xen0n.name, alex@ghiti.fr, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 hpa@zytor.com, saravanak@kernel.org, akpm@linux-foundation.org,
 pasha.tatashin@soleen.com, pratyush@kernel.org, ruirui.yang@linux.dev,
 robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 kexec@lists.infradead.org, linux-mm@kvack.org, iommu@lists.linux.dev
References: <20261021083011.2170525-1-chenwandun1@gmail.com>
 <7773d026-4aef-4169-866a-71ec9a91da21@gmail.com>
 <avLaJxIrrnMQngO9@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <avLaJxIrrnMQngO9@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/10/26 16:47, Mike Rapoport wrote:
> Hi Wandun,
> 
> On Mon, Nov 09, 2026 at 08:23:16PM +0800, Wandun wrote:
>>
>> On 10/21/26 16:30, Wandun Chen wrote:
>>> From: Wandun Chen <chenwandun@lixiang.com>
>>>
>>> On SoCs that carve out large firmware-owned reserved memory (GPU,
>>> camera ISP, ...), kdump currently dumps those carveouts as part of
>>> system RAM even though their contents are firmware state that is not
>>> useful for kernel crash analysis.
>>>
>>> ACPI systems already filter reserved memory out of the vmcore through
>>> their existing path: firmware reports those carveouts as unusable in
>>> the EFI memory map, they get MEMBLOCK_NOMAP set in memblock.memory
>>> (is_usable_memory(), efi-init.c), and the ELF header builder has
>>> always skipped nomap regions; only DT-based systems currently fail
>>> to filter these regions, which is what this series addresses.
>>>
>>> This series introduces a MEMBLOCK_NODUMP flag (suggested by Rob) in
>>> memblock to filter reserved memory on DT-based architectures. A new
>>> flag is needed because MEMBLOCK_NOMAP can only express regions without
>>> a linear mapping, while MEMBLOCK_NODUMP can filter regions that are
>>> linearly mapped. Reserved regions are marked MEMBLOCK_NODUMP by default
>>> so kdump omits them; reusable CMA regions are different because their
>>> pages are handed back to the buddy allocator and may carry crash-relevant
>>> data.
>>>
>>> Since the reserved memory regions are filtered out, the vmcore is
>>> smaller in size and faster to produce.
>>>
>>> The series is based on linux-next and is organized as follows:
>>>
>>> Patches 1-3: Preparation and bugfixes: switch riscv crash_mem to
>>>              memblock, fold the duplicated per-arch memblock walks
>>>              into the weak defaults, and serialize crash header
>>>              preparation against memory hotplug.
>>> Patches 4-7: NODUMP infrastructure: switch crash_core to
>>>              for_each_mem_region(), introduce the MEMBLOCK_NODUMP
>>>              flag, add a dumpable flag to struct reserved_mem, and
>>>              mark /reserved-memory entries with MEMBLOCK_NODUMP.
>>> Patch 8:     Skip MEMBLOCK_NODUMP regions when building the vmcore
>>>              ELF header.
>>
>> Hi all,
>>
>> A gentle ping on this series.
>>
>> I'd appreciate any further feedback, particularly on the
>> MEMBLOCK_NODUMP discussion and the issues raised in the Sashiko
>> review.
> 
> I'm fine with MEMBLOCK_NODUMP.
> The issue Sashiko raised about bound check against cmem->max_nr_ranges
> seems valid. 

Hi Mike,

Thanks a lot for the review.

Some analysis and plan about "bound check against cmem->max_nr_ranges":

After patch 3, the remaining race is x86-specific. The weak defaults are
safe: every runtime modification of memblock.memory, hot-add and hot-remove
alike, happens under device_hotplug_lock, so with the lock held the count
and populate passes walk a stable snapshot.

x86 instead walks iomem_resource, and Xen balloon inserts its new System RAM
resource before taking device_hotplug_lock() (reserve_additional_memory),
which is the one remaining hole.

The issue is also pre-existing: before patch 3 there was no locking at all,
every hotplug path could race the two passes.

The proper fix is to switch x86 over to the memblock-based weak defaults,
as patch 2 already did for arm64/loongarch/riscv. Would you prefer to have
it in this series, or as a separate follow-up? Both work fine for me.

> 
> I didn't check the reserved mem one.

The two Sashiko findings on the reserved-mem (patch 7) will also be addressed
in next version.

>  
>> Please let me know if there are any other concerns or suggestions
>> before I prepare the next revision.
> 
> I believe that should be rebased to account for reserved memory changes.

Sure, the next verison will be rebased on latest linux-next.

> The riscv change from resources to memblock needs an Ack from riscv
> maintainers.

Hi Paul, Palmer, Albert,

Patch 1 builds the crash_mem ranges for the vmcore ELF header from
memblock instead of the resource tree, so the later MEMBLOCK_NODUMP
patches can filter reserved memory from the vmcore on the memblock
side. With this, the vmcore size reduction the series brings also
applies to riscv.

Could you take a look when you have a chance?


Best regards,
Wandun

> 
> And with all that I can take the next version via kexec tree.
>  
>> Thanks,
>> Wandun
>>
>>>
>>> v8 --> v9:
>>> 1. Patch 7: Avoid a potential boot panic on SH when NODUMP marking requires
>>>    memblock resizing before it is allowed, found by Sashiko in [1]. SH supports
>>>    neither CONFIG_KEXEC_FILE nor CONFIG_CRASH_HOTPLUG, so skip marking when
>>>    both are disabled.
>>>
>>> v6 --> v8 (v7 mainly tried to fix the initrd issue on release in v6,
>>> that approach is superseded here):
>>> 1. Stop marking /memreserve/ regions with NODUMP. v6 marked
>>>    /memreserve/ regions with NODUMP. But a bootloader may specify
>>>    a /memreserve/ entry for memory that the kernel later frees
>>>    (e.g. the initrd), and those pages would then be wrongly
>>>    filtered out of the vmcore after being reused as normal memory.
>>>    The v7 fix (clearing the flag in free_reserved_area()) caused
>>>    a lockless runtime mutation of memblock.memory [2]. Better solutions
>>>    exist but need extra preparation, so temporarily dropped the patch
>>>    that introduced the problem to keep this series simple in v8.
>>> 2. Fix a build failure in patch 2 with both ARCH_KEEP_MEMBLOCK and
>>>    MEMORY_HOTPLUG are unset. There the memblock arrays live in
>>>    .init.data, and the weak defaults referencing them create section
>>>    mismatches, which turn into build errors when SECTION_MISMATCH_WARN_ONLY
>>>    is also unset.
>>> 3. RISCV recently gained crash hotplug support, so adapt its handler
>>>    like x86 in patch 3: use __crash_prepare_headers() instead of
>>>    crash_prepare_headers() to avoid self-deadlock.
>>> 4. Update the cover letter per review feedback: describe how ACPI
>>>    systems filter reserved memory and why a new flag is needed
>>>    instead of reusing NOMAP.
>>>
>>> v6 --> v7:
>>> 1. Fix a stale MEMBLOCK_NODUMP flag issue [3]. Memory reserved and
>>>    marked as NODUMP may later be freed (the initrd, for example),
>>>    so the NODUMP flag must be cleared accordingly. Since the fix is
>>>    part of the NODUMP infrastructure introduced by patch 5, it has
>>>    been folded into that patch.
>>> 2. Drop the "generic" related description in the cover letter.
>>> 3. Collect the Acked-by and Reviewed-by tags received during the v6
>>>    review (thanks to Baoquan, Mike, Rob and Marek). Patch 5 is the
>>>    only one without a tag, as its Reviewed-by was dropped when the
>>>    fix was folded in.
>>> 4. Drop patch 1 of v6, which has been merged separately.
>>>
>>>
>>> v5 --> v6:
>>> 1. Serialize crash header preparation against memory hotplug to avoid
>>>    out-of-bounds or use-after-free issues.
>>> 2. MEMBLOCK_NODUMP marking is now done after memblock allows resizing,
>>>    avoiding a panic from too few regions before resize is permitted.
>>> 3. Reordered the patches, put pre-existing bugfixes earlier in the series.
>>>
>>> [1] https://sashiko.dev/#/patchset/20261016061549.4181390-1-chenwandun1@gmail.com?part=7
>>> [2] https://lore.kernel.org/lkml/20260922090252.B01541F000FF@smtp.kernel.org/
>>> [3] https://sashiko.dev/#/message/20260917220750.GA4013814-robh%40kernel.org
>>>
>>> v5: https://lore.kernel.org/lkml/20260806093519.2907771-1-chenwandun1@gmail.com/
>>> v4: https://lore.kernel.org/lkml/20260630074715.4126796-1-chenwandun1@gmail.com/
>>>
>>> Wandun Chen (8):
>>>   riscv: build crash_mem ranges from memblock instead of resource tree
>>>   crash_core: fold duplicated memblock arch hooks into the weak default
>>>   crash_core: serialize crash header preparation against hotplug
>>>   crash_core: replace for_each_mem_range() with for_each_mem_region()
>>>   memblock: introduce MEMBLOCK_NODUMP flag
>>>   of: reserved_mem: add dumpable flag to opt-in vmcore
>>>   of: reserved_mem: mark /reserved-memory entries with MEMBLOCK_NODUMP
>>>   crash_core: skip MEMBLOCK_NODUMP regions when building vmcore ELF
>>>     header
>>>
>>>  arch/arm64/kernel/machine_kexec_file.c     | 29 ------------
>>>  arch/loongarch/kernel/machine_kexec_file.c | 27 -----------
>>>  arch/riscv/Kconfig                         |  2 +-
>>>  arch/riscv/kernel/crash.c                  |  2 +-
>>>  arch/riscv/kernel/machine_kexec_file.c     | 33 --------------
>>>  arch/x86/kernel/crash.c                    |  2 +-
>>>  drivers/of/fdt.c                           |  1 +
>>>  drivers/of/of_private.h                    |  1 +
>>>  drivers/of/of_reserved_mem.c               | 18 ++++++++
>>>  include/linux/crash_core.h                 |  2 +
>>>  include/linux/memblock.h                   |  9 ++++
>>>  include/linux/of_reserved_mem.h            |  1 +
>>>  kernel/crash_core.c                        | 53 +++++++++++++++++++++-
>>>  kernel/dma/contiguous.c                    |  1 +
>>>  mm/memblock.c                              | 16 +++++++
>>>  15 files changed, 103 insertions(+), 94 deletions(-)
>>>
>>
> 

