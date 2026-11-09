Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227014;
	b=1t4XqIb8+VNXF5dsuwaqFH0EJhISjl7XtwMh1xvQDcvhyENCDXfX7LImda66YwFcsINo
	 PhcS9d4QvmDo7SUvS8WQFcnMDiDMKtOYu8PuuV22wSgwcAWHMPzwM50xiXt9GX5gJK6xi
	 RWO4KJOHvmpUX08bOLx7TibC0WfS/8kdlJS0hloJJN8CBKNdnq1VOiJBvw4LWuSUlWo1u
	 xqOC/CjkB0Q+LaUG1XCmNcNlhL71e90UsuvJsjg2FRw70gyPcB06Cr+KAOq/KjYp5vNB1
	 JGSZRvhHubOF+P/AafrwtUAWfZNW1d7rGfeo6KoMNoHr97pUsH+i9SbZVzyWcY79QZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=+tF8l8wiFwVnoygmXpYnREIWubWMOLu/o49/XwgRJmA=;
	b=qnjkcOqVVUzSlbp9QPoyhtSh0a4BdOBeTpi6tEKYgT2xTplGTAhEJZJ6P0qlnVGlCmCN
	 uwzGu2kLOQB9EWplcYY+Hq4ij8j/ZBeMWAqbwi/JI30bNgzXwPxs54dqhiwLz54aJzzeJ
	 v4v2ed+fWpvEx15IYEQKsfncNnQfGXTma7BlC6kluFOGF1Ph28dDiUl1l63dJM1s1cYvY
	 uaO2ohkjM11ljirg8Bs+8EniC39/YYfV3u+Bf6QGEvHv4ZXALITT+QaoQfX4NhNxJKF2S
	 qjQW/OAX/RXGsGtkTfc4vi5j3386ZXDmRgbL/qjEYFWenMXjuVBVv9si59aaYfhVlOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hQ2OlazH;
	arc=none smtp.remote-ip=74.125.227.133
Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083FB606D826
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 12:23:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 083FB606D826
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hQ2OlazH
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2eb0c699769so3223225ad.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 04:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794227013; x=1794831813; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+tF8l8wiFwVnoygmXpYnREIWubWMOLu/o49/XwgRJmA=;
        b=hQ2OlazHyqshRYO+PmA/3yF3BaE66632v7IUWRBc7g243LefFPqetRExdlEOxTqHoX
         UrMffunehmKACqDHawccgs26m9k6zm5oD9ziWvn4fPA/kyJTK607X4gEcRbTPw23BlrQ
         KZj86svuoRIoNuSymcNcFNUckvmN7KI26oF+MjIpYQmm5bp8jWhq8RNpyhxqnFtZwWbz
         wGkO2PK6G8uRRbDt5Z5ZKgvqrocj1pn7N62tSePJSvmOrEvNpDRA58bi8qRDpAu7l3FY
         p8eho4d5mTYHg+QRWljmsnZtadDbtw+T8I5p/Q+GlWRr+J0OyRJPrG8Vzqe++HNHtl/K
         YXUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794227013; x=1794831813;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+tF8l8wiFwVnoygmXpYnREIWubWMOLu/o49/XwgRJmA=;
        b=m8sQlJOYd0wiXJQXJK2MuTNYgkCCsvrvN0wVTP3Wxj8/Xr16iTFJyz3G2q9iY5aAeV
         v2FkBBzTZ7Sh40JkcJkpY3DZefNxXtATZh6RmWtWSgyAiPQNxqeaEfCHC9lwy3B4UmZm
         TXIfWEU0xa4Qt2JCtBxAlsJhuZk6Qj7sBxon64FBdJN5FJXef22Tk607+IYSqTt9zTvP
         sNIxFAnsVejrgsr0jChS1xKDdU5JrBa1AxH1Gfy/KvYQKP1rJqQqyENIe7ukM+bKX1KH
         aWSMvwJh5J1CMR6PbGTnjEMG0P+ijM8BIIXXxpiN9Eodz7LWA3gC8qis33VLHyweR2G1
         j4Dg==
X-Forwarded-Encrypted: i=1; AL+hErHluIwAt1rx4t+I49fxFpXMhUpn8dQVPxfV303og/2Ej5Crm+SmHJZ5PhIdeTik3WYKahh4aKA1oe4p@vger.kernel.org
X-Gm-Message-State: APuU4Z+DX4qhyoT7l383C3FckzmflkwnjF2FTEEen+eNbwUcw/79oYcQ
	vwiBB9RPb3tXs9G9rMXd6pdbS0KP1mkTFojxnGy3V/eEQXLhITyidvV9
X-Gm-Gg: AYBFou1qErCJnoBNL5dZ0wSw4hjw1+N1eX3A4Jj9qPwDARVQA5cM5om1TFilbEzt2Hl
	zkDPh8K/5BpTV+/vYTv7pKPRQ0XC7rbJvNUCt3IrizG5OwtjkBsIVVH3tDABIIKYm1ADfLZtyKP
	zlsqtqTHYHzmIJ/tXSNg9679ZbdeSRgQXONwtfiSy+r7mf22snug5C1rfmlSN2YsxB8NHBZf3b0
	IMVigFDYTPRF4ZKMMxCuzFyvesRs0yvoRcs0TOAlqQSSBnZ7w6uuT6BIohX4Wq2My27UVhm5I7F
	I9Z/jPmJrkf0aTjyuPLEgrPpIFtyUj6Ojg7XaHV/nYMQtJJX6CDs5gw8DFv+JOKquT8dM8g7sRy
	KSvZjGgswD3GhfEHhngEA8LiVN/elQNtsO9TClANPesaRgyD0WVcYXQpKnfyP3P2q6U4eY4+SiZ
	cjfSDzxYTVC5rIW+TFcQL0hFblv7NozbweNPFwMWXhO/mr5sLsPuN1YoJSJRR6YvehY7IzamP5o
	9i0x4WM//IweKN5bOx9TXt16MqvXoFeeAH+kL/VgvbPVUpnR6NYLKEZ1uNkwPdL+z0HNweqA6k9
	9qEIK8JflyPmnzvKmeMgyDDM63gpbJnpKec=
X-Received: by 2002:a05:6a20:7f89:b0:3eb:afe0:20aa with SMTP id adf61e73a8af0-3eed2e06bb1mr3837559637.20.1794227012895;
        Mon, 09 Nov 2026 04:23:32 -0800 (PST)
Received: from [10.125.112.22] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb96816fc6sm1622392a12.5.2026.11.09.04.23.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 04:23:31 -0800 (PST)
Message-ID: <7773d026-4aef-4169-866a-71ec9a91da21@gmail.com>
Date: Mon, 9 Nov 2026 20:23:16 +0800
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
From: Wandun <chenwandun1@gmail.com>
To: robh@kernel.org, baoquan.he@linux.dev, rppt@kernel.org,
 m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 chenhuacai@kernel.org, kernel@xen0n.name, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 hpa@zytor.com, saravanak@kernel.org, akpm@linux-foundation.org,
 pasha.tatashin@soleen.com, pratyush@kernel.org, ruirui.yang@linux.dev,
 robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 kexec@lists.infradead.org, linux-mm@kvack.org, iommu@lists.linux.dev
References: <20261021083011.2170525-1-chenwandun1@gmail.com>
Content-Language: en-US
In-Reply-To: <20261021083011.2170525-1-chenwandun1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/21/26 16:30, Wandun Chen wrote:
> From: Wandun Chen <chenwandun@lixiang.com>
> 
> On SoCs that carve out large firmware-owned reserved memory (GPU,
> camera ISP, ...), kdump currently dumps those carveouts as part of
> system RAM even though their contents are firmware state that is not
> useful for kernel crash analysis.
> 
> ACPI systems already filter reserved memory out of the vmcore through
> their existing path: firmware reports those carveouts as unusable in
> the EFI memory map, they get MEMBLOCK_NOMAP set in memblock.memory
> (is_usable_memory(), efi-init.c), and the ELF header builder has
> always skipped nomap regions; only DT-based systems currently fail
> to filter these regions, which is what this series addresses.
> 
> This series introduces a MEMBLOCK_NODUMP flag (suggested by Rob) in
> memblock to filter reserved memory on DT-based architectures. A new
> flag is needed because MEMBLOCK_NOMAP can only express regions without
> a linear mapping, while MEMBLOCK_NODUMP can filter regions that are
> linearly mapped. Reserved regions are marked MEMBLOCK_NODUMP by default
> so kdump omits them; reusable CMA regions are different because their
> pages are handed back to the buddy allocator and may carry crash-relevant
> data.
> 
> Since the reserved memory regions are filtered out, the vmcore is
> smaller in size and faster to produce.
> 
> The series is based on linux-next and is organized as follows:
> 
> Patches 1-3: Preparation and bugfixes: switch riscv crash_mem to
>              memblock, fold the duplicated per-arch memblock walks
>              into the weak defaults, and serialize crash header
>              preparation against memory hotplug.
> Patches 4-7: NODUMP infrastructure: switch crash_core to
>              for_each_mem_region(), introduce the MEMBLOCK_NODUMP
>              flag, add a dumpable flag to struct reserved_mem, and
>              mark /reserved-memory entries with MEMBLOCK_NODUMP.
> Patch 8:     Skip MEMBLOCK_NODUMP regions when building the vmcore
>              ELF header.

Hi all,

A gentle ping on this series.

I'd appreciate any further feedback, particularly on the
MEMBLOCK_NODUMP discussion and the issues raised in the Sashiko
review.

Please let me know if there are any other concerns or suggestions
before I prepare the next revision.

Thanks,
Wandun

> 
> v8 --> v9:
> 1. Patch 7: Avoid a potential boot panic on SH when NODUMP marking requires
>    memblock resizing before it is allowed, found by Sashiko in [1]. SH supports
>    neither CONFIG_KEXEC_FILE nor CONFIG_CRASH_HOTPLUG, so skip marking when
>    both are disabled.
> 
> v6 --> v8 (v7 mainly tried to fix the initrd issue on release in v6,
> that approach is superseded here):
> 1. Stop marking /memreserve/ regions with NODUMP. v6 marked
>    /memreserve/ regions with NODUMP. But a bootloader may specify
>    a /memreserve/ entry for memory that the kernel later frees
>    (e.g. the initrd), and those pages would then be wrongly
>    filtered out of the vmcore after being reused as normal memory.
>    The v7 fix (clearing the flag in free_reserved_area()) caused
>    a lockless runtime mutation of memblock.memory [2]. Better solutions
>    exist but need extra preparation, so temporarily dropped the patch
>    that introduced the problem to keep this series simple in v8.
> 2. Fix a build failure in patch 2 with both ARCH_KEEP_MEMBLOCK and
>    MEMORY_HOTPLUG are unset. There the memblock arrays live in
>    .init.data, and the weak defaults referencing them create section
>    mismatches, which turn into build errors when SECTION_MISMATCH_WARN_ONLY
>    is also unset.
> 3. RISCV recently gained crash hotplug support, so adapt its handler
>    like x86 in patch 3: use __crash_prepare_headers() instead of
>    crash_prepare_headers() to avoid self-deadlock.
> 4. Update the cover letter per review feedback: describe how ACPI
>    systems filter reserved memory and why a new flag is needed
>    instead of reusing NOMAP.
> 
> v6 --> v7:
> 1. Fix a stale MEMBLOCK_NODUMP flag issue [3]. Memory reserved and
>    marked as NODUMP may later be freed (the initrd, for example),
>    so the NODUMP flag must be cleared accordingly. Since the fix is
>    part of the NODUMP infrastructure introduced by patch 5, it has
>    been folded into that patch.
> 2. Drop the "generic" related description in the cover letter.
> 3. Collect the Acked-by and Reviewed-by tags received during the v6
>    review (thanks to Baoquan, Mike, Rob and Marek). Patch 5 is the
>    only one without a tag, as its Reviewed-by was dropped when the
>    fix was folded in.
> 4. Drop patch 1 of v6, which has been merged separately.
> 
> 
> v5 --> v6:
> 1. Serialize crash header preparation against memory hotplug to avoid
>    out-of-bounds or use-after-free issues.
> 2. MEMBLOCK_NODUMP marking is now done after memblock allows resizing,
>    avoiding a panic from too few regions before resize is permitted.
> 3. Reordered the patches, put pre-existing bugfixes earlier in the series.
> 
> [1] https://sashiko.dev/#/patchset/20261016061549.4181390-1-chenwandun1@gmail.com?part=7
> [2] https://lore.kernel.org/lkml/20260922090252.B01541F000FF@smtp.kernel.org/
> [3] https://sashiko.dev/#/message/20260917220750.GA4013814-robh%40kernel.org
> 
> v5: https://lore.kernel.org/lkml/20260806093519.2907771-1-chenwandun1@gmail.com/
> v4: https://lore.kernel.org/lkml/20260630074715.4126796-1-chenwandun1@gmail.com/
> 
> Wandun Chen (8):
>   riscv: build crash_mem ranges from memblock instead of resource tree
>   crash_core: fold duplicated memblock arch hooks into the weak default
>   crash_core: serialize crash header preparation against hotplug
>   crash_core: replace for_each_mem_range() with for_each_mem_region()
>   memblock: introduce MEMBLOCK_NODUMP flag
>   of: reserved_mem: add dumpable flag to opt-in vmcore
>   of: reserved_mem: mark /reserved-memory entries with MEMBLOCK_NODUMP
>   crash_core: skip MEMBLOCK_NODUMP regions when building vmcore ELF
>     header
> 
>  arch/arm64/kernel/machine_kexec_file.c     | 29 ------------
>  arch/loongarch/kernel/machine_kexec_file.c | 27 -----------
>  arch/riscv/Kconfig                         |  2 +-
>  arch/riscv/kernel/crash.c                  |  2 +-
>  arch/riscv/kernel/machine_kexec_file.c     | 33 --------------
>  arch/x86/kernel/crash.c                    |  2 +-
>  drivers/of/fdt.c                           |  1 +
>  drivers/of/of_private.h                    |  1 +
>  drivers/of/of_reserved_mem.c               | 18 ++++++++
>  include/linux/crash_core.h                 |  2 +
>  include/linux/memblock.h                   |  9 ++++
>  include/linux/of_reserved_mem.h            |  1 +
>  kernel/crash_core.c                        | 53 +++++++++++++++++++++-
>  kernel/dma/contiguous.c                    |  1 +
>  mm/memblock.c                              | 16 +++++++
>  15 files changed, 103 insertions(+), 94 deletions(-)
> 

