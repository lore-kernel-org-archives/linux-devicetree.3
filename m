Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571431;
	b=q9omEMZQIw2fuUHNbacQydn9iDQJdubkRRcDl85cQvNTdWoQQ87VK3LkiYswt9NtZ0G1
	 F/u7L+ZBjBRKZhwTjxZbRr7qpeAznCkyfF7kVCr3ExF9T4CXbVqIDlbKw6G809burvpQs
	 Os0YzA8RCzaK8JnobZzEbpiu4ZH/QrjSf6XQNRUk+veO1ggMx673co7ky/akGM4GFHrmA
	 ZvZE/2mIXTNBEJLxTVw8gPPcWchLLRKgO68Ofzh/fX/wCq/FlOhu3U28Gln1B8nj+eAQs
	 4Q4QJLUmv2jU8fE7vtwT1bLB8vrBOLDqxxfG37H37m1HiA7dLh1Ol7h9BVfsapOCPbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=z2i7Do+cloqJgPeb5aYLDs8IqOGcJVVvWxpYdA4Y6+Q=;
	b=wRyGrt6Df6bjv/TeFkadoXpUxPJQA1KL3f9MMdVgF80DWMDo05HawJq74PoCV263lJJC
	 9iElxGCBGdSWiyiy+mLjiAiTRhEcwDX7fLIN2QakE41grhBIqkSs/zxBjNUevPzhTcxxf
	 8fJvr4MGMrteyWMNI3YGxa/DQzzAdDQPUyb2Q2Ivmjp/ghUwYRueDmTbLDpRe2z68FrUH
	 MJR08BWCB0miTaZqDqwIKIunj/W7mV7qZ9gxEXUlS5fr323bodpljGz2PN7bcAv/vWoVm
	 Y2eOb4A0TyKjB7PVqih02eVI7FpsnQApYXLY+AkxljmNykePr9fQK9OfDwFYBuFvtOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hnkMDzMG;
	arc=none smtp.remote-ip=74.125.228.2
Received: from mail-pz2-f2.google.com (mail-pz2-f2.google.com [74.125.228.2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29AC606A31B
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:30:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B29AC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hnkMDzMG
Received: by mail-pz2-f2.google.com with SMTP id 41be03b00d2f7-ccc451ef3a7so38468a12.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 01:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792571430; x=1793176230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z2i7Do+cloqJgPeb5aYLDs8IqOGcJVVvWxpYdA4Y6+Q=;
        b=hnkMDzMGd+RR0t0wSvMoYCKnZWGmdS838KdZLqGb03rGS6n5hh10MnciXr2GsJkbGq
         1VbjnPGzr5abqOyDd8YhBXAybcYDmTJcDpODLfBp7aQFRIr+tRPA9SFNbODb5o8EMI89
         cYuQ4rN0KoKeQ5BL/+TJhs/VPSwSsIZRk3h9re4rpwFsst6yODRVPd5dfhOXcFSygKea
         zWzPu6ncxMXTNWZ3HT9tnd0p06hUyH8czgUmpqmARR5mmYIfKVHr5wkXl1VIiG7Cj70Q
         ANBWoBay4O9x09K1UAuqzweTPIYs0OAzY2+SIoRgwZhkNuxVbZMZYK7x4ynXydZ2EE3f
         2lJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571430; x=1793176230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z2i7Do+cloqJgPeb5aYLDs8IqOGcJVVvWxpYdA4Y6+Q=;
        b=HifENJZvuYBuG+W323kJ+FrcL6x5MJg30UCE12t25p7FSebwlmd1ve8FB+w2KdS86B
         50kgwa6oWFG91dusXLG1LHPtgwMjUGNcrKJrh43Q9SuctOlZ6AMhhkpmu6YP6gxcvQ/v
         NETnnBT7b2AtzejS1yjk83Hie7AGTWlFu69W4kObxSSLunGLXf5qD2dZvLkaywZYzgVk
         5IWrmAKciTBqUTVluQYbNtUF2Gf5z1cwjeZ1A7IVRlHz0ZP0KSiFtsaPQ0fELg+20y44
         JgzYJBk29/zk5mpynP1fS2G8jeXjtFJMhaElk+X8fYNfLwaqNSzqNRXRbpsT+9BlWHsA
         gsmw==
X-Forwarded-Encrypted: i=1; AKwUvBwe+KZbu4MZPJp0CKC4v4j0zkiOnYY9NfLvClXfuhzI4sqJbgN5fKmNJ9WA2AuTOH5tRj9CjQw9sc3O@vger.kernel.org
X-Gm-Message-State: AFq9FYLnUQ2OebWHp9BX/74gw3EWv3ry++b+HBiSdMo0+RurOaJNqEdz
	DWnz69PT00yKtvso2s0w6aS8AGUpdS+PKDhtAiuQvYG+Q2C7YktQrB0X
X-Gm-Gg: AYBFou3Ag36T/cvfUUG2+BHctrn5M7LOuzYi8sTJ7F8veL4i0o5jnHgyJJNXZ73UQ0T
	yHA/B5VKNESqgoEmGAOipz+svJU/jt1oK6JTfYxNLrsffQCqaHXft7qXBdE/wekqvktmJ7RddxW
	CJclfNPHtv/rrmubdVgRO1QfABxmIrJXiDtiFSFQ0Ya6RI4+DlM2Q8k45/xxURRHNaWfoDPk55Q
	5rIL8j+Moe2HQ9KgxRD1PBvOWSMnjCGPkWjK9WZD1AxqbTlD/DTea7DzY3zPMjtqEfER3es1wIA
	R6myoT+BY6J6TrWOwTI6Wl8AfxnV8uhsFhEMG7XxR2lN/0OKrw5FOXXYDbyVfNZVVcgCpoHp7eO
	zrAcOTEMz7Q9WIYb8JOXUokAvmqEZfxr7C/AjBIT2UQWGr/7+bcEe0WNlrDMDI47WAd7aixUgWU
	udGc47iyrXiatFf0UDmVrjXRFj+VBR68tjfn5zK5aaAY9fGFFwmSpgRD0ky6eC+x/sku57UOaI1
	QosRZZRAzZa+0m2C5aeHdleC4c/kpjjDZMXRBrY63K1TDbIRDaJ09mZgb0YKoJ/zZb5
X-Received: by 2002:a05:6a00:918c:b0:8a0:2344:c44b with SMTP id d2e1a72fcca58-8a089d5de3cmr958437b3a.40.1792571429981;
        Wed, 21 Oct 2026 01:30:29 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895e273bsm600653b3a.41.2026.10.21.01.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:30:28 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v9 0/8] kdump: reduce vmcore size and capture time
Date: Wed, 21 Oct 2026 16:30:03 +0800
Message-ID: <20261021083011.2170525-1-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

On SoCs that carve out large firmware-owned reserved memory (GPU,
camera ISP, ...), kdump currently dumps those carveouts as part of
system RAM even though their contents are firmware state that is not
useful for kernel crash analysis.

ACPI systems already filter reserved memory out of the vmcore through
their existing path: firmware reports those carveouts as unusable in
the EFI memory map, they get MEMBLOCK_NOMAP set in memblock.memory
(is_usable_memory(), efi-init.c), and the ELF header builder has
always skipped nomap regions; only DT-based systems currently fail
to filter these regions, which is what this series addresses.

This series introduces a MEMBLOCK_NODUMP flag (suggested by Rob) in
memblock to filter reserved memory on DT-based architectures. A new
flag is needed because MEMBLOCK_NOMAP can only express regions without
a linear mapping, while MEMBLOCK_NODUMP can filter regions that are
linearly mapped. Reserved regions are marked MEMBLOCK_NODUMP by default
so kdump omits them; reusable CMA regions are different because their
pages are handed back to the buddy allocator and may carry crash-relevant
data.

Since the reserved memory regions are filtered out, the vmcore is
smaller in size and faster to produce.

The series is based on linux-next and is organized as follows:

Patches 1-3: Preparation and bugfixes: switch riscv crash_mem to
             memblock, fold the duplicated per-arch memblock walks
             into the weak defaults, and serialize crash header
             preparation against memory hotplug.
Patches 4-7: NODUMP infrastructure: switch crash_core to
             for_each_mem_region(), introduce the MEMBLOCK_NODUMP
             flag, add a dumpable flag to struct reserved_mem, and
             mark /reserved-memory entries with MEMBLOCK_NODUMP.
Patch 8:     Skip MEMBLOCK_NODUMP regions when building the vmcore
             ELF header.

v8 --> v9:
1. Patch 7: Avoid a potential boot panic on SH when NODUMP marking requires
   memblock resizing before it is allowed, found by Sashiko in [1]. SH supports
   neither CONFIG_KEXEC_FILE nor CONFIG_CRASH_HOTPLUG, so skip marking when
   both are disabled.

v6 --> v8 (v7 mainly tried to fix the initrd issue on release in v6,
that approach is superseded here):
1. Stop marking /memreserve/ regions with NODUMP. v6 marked
   /memreserve/ regions with NODUMP. But a bootloader may specify
   a /memreserve/ entry for memory that the kernel later frees
   (e.g. the initrd), and those pages would then be wrongly
   filtered out of the vmcore after being reused as normal memory.
   The v7 fix (clearing the flag in free_reserved_area()) caused
   a lockless runtime mutation of memblock.memory [2]. Better solutions
   exist but need extra preparation, so temporarily dropped the patch
   that introduced the problem to keep this series simple in v8.
2. Fix a build failure in patch 2 with both ARCH_KEEP_MEMBLOCK and
   MEMORY_HOTPLUG are unset. There the memblock arrays live in
   .init.data, and the weak defaults referencing them create section
   mismatches, which turn into build errors when SECTION_MISMATCH_WARN_ONLY
   is also unset.
3. RISCV recently gained crash hotplug support, so adapt its handler
   like x86 in patch 3: use __crash_prepare_headers() instead of
   crash_prepare_headers() to avoid self-deadlock.
4. Update the cover letter per review feedback: describe how ACPI
   systems filter reserved memory and why a new flag is needed
   instead of reusing NOMAP.

v6 --> v7:
1. Fix a stale MEMBLOCK_NODUMP flag issue [3]. Memory reserved and
   marked as NODUMP may later be freed (the initrd, for example),
   so the NODUMP flag must be cleared accordingly. Since the fix is
   part of the NODUMP infrastructure introduced by patch 5, it has
   been folded into that patch.
2. Drop the "generic" related description in the cover letter.
3. Collect the Acked-by and Reviewed-by tags received during the v6
   review (thanks to Baoquan, Mike, Rob and Marek). Patch 5 is the
   only one without a tag, as its Reviewed-by was dropped when the
   fix was folded in.
4. Drop patch 1 of v6, which has been merged separately.


v5 --> v6:
1. Serialize crash header preparation against memory hotplug to avoid
   out-of-bounds or use-after-free issues.
2. MEMBLOCK_NODUMP marking is now done after memblock allows resizing,
   avoiding a panic from too few regions before resize is permitted.
3. Reordered the patches, put pre-existing bugfixes earlier in the series.

[1] https://sashiko.dev/#/patchset/20261016061549.4181390-1-chenwandun1@gmail.com?part=7
[2] https://lore.kernel.org/lkml/20260922090252.B01541F000FF@smtp.kernel.org/
[3] https://sashiko.dev/#/message/20260917220750.GA4013814-robh%40kernel.org

v5: https://lore.kernel.org/lkml/20260806093519.2907771-1-chenwandun1@gmail.com/
v4: https://lore.kernel.org/lkml/20260630074715.4126796-1-chenwandun1@gmail.com/

Wandun Chen (8):
  riscv: build crash_mem ranges from memblock instead of resource tree
  crash_core: fold duplicated memblock arch hooks into the weak default
  crash_core: serialize crash header preparation against hotplug
  crash_core: replace for_each_mem_range() with for_each_mem_region()
  memblock: introduce MEMBLOCK_NODUMP flag
  of: reserved_mem: add dumpable flag to opt-in vmcore
  of: reserved_mem: mark /reserved-memory entries with MEMBLOCK_NODUMP
  crash_core: skip MEMBLOCK_NODUMP regions when building vmcore ELF
    header

 arch/arm64/kernel/machine_kexec_file.c     | 29 ------------
 arch/loongarch/kernel/machine_kexec_file.c | 27 -----------
 arch/riscv/Kconfig                         |  2 +-
 arch/riscv/kernel/crash.c                  |  2 +-
 arch/riscv/kernel/machine_kexec_file.c     | 33 --------------
 arch/x86/kernel/crash.c                    |  2 +-
 drivers/of/fdt.c                           |  1 +
 drivers/of/of_private.h                    |  1 +
 drivers/of/of_reserved_mem.c               | 18 ++++++++
 include/linux/crash_core.h                 |  2 +
 include/linux/memblock.h                   |  9 ++++
 include/linux/of_reserved_mem.h            |  1 +
 kernel/crash_core.c                        | 53 +++++++++++++++++++++-
 kernel/dma/contiguous.c                    |  1 +
 mm/memblock.c                              | 16 +++++++
 15 files changed, 103 insertions(+), 94 deletions(-)

-- 
2.43.0

