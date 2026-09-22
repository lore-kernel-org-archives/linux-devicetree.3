Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AA1522687
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 08:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066594; cv=none; b=JLhTpm5R6LYyRSTrnCp2xVJNcsTzBtbUb4NtJUAfT+Kl2tWnxq/pw8y8LeK1VS/zzBfCUu1aI+5fWp/mAMXDBnxGSftYoV1CmhI6emGBDXFM/jo7r30ZS4mT9S3BRsY+lkYmXbqht1QXJWRwdDUuQ6piyi4CxdhvBr36A19ODXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066594; c=relaxed/simple;
	bh=7cjsUBv8hgI4oUGBx2XTEPgSKQM575FA4pH4DaXNaDU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mfH+omlYdxfg0q7SZpbllqJF5r2x92bDLa5mILz6tUT2cGSip0p1DXyFSUi2FrAqMvdJm7CQazMDB+9blhJjTKx1TU+g/XotCjtuic8Pmc3ZkY1JgfdnH5cT+3JXgmUmdvVsW7rrhK3HsLAz/JFPzx6vYsk8bEzVzRnzSUFdM1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iWfZArKY; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iWfZArKY"
Received: by mail-pj2-f1.google.com with SMTP id 98e67ed59e1d1-39e59dca659so2355022a91.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 01:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066592; x=1790671392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9UsbLRFUse88WvBnvQ2Q7a6jE7KnWiu4inPojM0/Ln8=;
        b=iWfZArKY/zqO/VeYfCetfbYZnPDDd2QbOpJeBoG9dtfTeDdZGRBT21dxXwrPR9PK+t
         hPGRdzNSUnUVhWVWb1h+zqKSOdahPJ0NPKHFQqI3IFdzgAqrYPvbl2FShz3ogVP2TDh1
         CcWaNMEdJiMe/UmXv8SgBcxY++gnfDuppYWyy387nZxehRV5wnF+XZZ6K8nA+lRljlUb
         AVvqyasSfuFqA3d2Jz5D28rntr4h7G9ohf/mgFP4Q7ZbHHoMXx6mx73hE1MA+flsOwVN
         xdrdESVaqr8AqwTafunJ2mpoRDbg+a+1f3Lzn9e4Gdo/+cvgeR2uQxwBnHIFvo1C8mKK
         Ig6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066592; x=1790671392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9UsbLRFUse88WvBnvQ2Q7a6jE7KnWiu4inPojM0/Ln8=;
        b=XKMlG6O4i6jRXoSX3dLAS6MA7GBroMDUNOj+WGaw/UEJTXGLatkLUwfAmFoNaVTOxP
         Xl11jNG8ewH25SQvgoWllmp5034WD5jPd968thw0Kbq/Tfr+vCm1K6pPFi9vrDj72ygW
         5hgal0vs0xTKKa0/a+osYsitTvAXHQGMTTtArnKqlyDfcsVMWjFvCF4JL4IlFU119236
         SNn6XYIjNkrRTa5iziMXoxzRYvoJW+LVC88xWxX57zErdrwhXzNaQ8IL7w85L0gtk+a2
         Qa4zKmdT9BBUJnTLf3DqOlb4Fh3mQ51HwcHrtFOFFF9HKVvxMjSCNPxyZsMhkv9MMq8+
         bjew==
X-Forwarded-Encrypted: i=1; AKwUvBzCrgLAP3pjMDoFF/xJJpxqyPfpUPgEOb4qPNodfqUWnzoNm1RG6S/6E4ghl47A5ARsESEDbD3dQ9J7@vger.kernel.org
X-Gm-Message-State: AFuF++lkfykFS3NG8qmHymiW+Kx9NNkBGxqXSygefSjFocmoZ4RZ7NtM
	HOkMEz4xgd3A9qAeouSUHsavyjV4A1lucpUaTvrIiTCDPAdbWzfDCiEc
X-Gm-Gg: AYBFou0RozdNTDE8CA5PPxdI/bMi+/6S9Zz+SeQEz8AoAgRQJwzOVWnevefTOMrTPUa
	RBKai+pvVK3DzOFhDA9XwNir7xkIFm/w7+OrZWHxbjPWlYR8KXY7se39Lwa9fK6dNShdDiS5aPM
	DLLtHRliGDCX52HI6Uw37uuZDyHE6RqxqPOWTSCP6iACjPA03DST7/JBfxjB6BjEwF10kXffpku
	dZmhs+iMEc4tT9cjhU1LV4cKBdwC91+u833E5V7uqngI2+u8DqpRrzxwuxcWmb/r07yRkh71aQ+
	xxXbKEi36J7xiDq8C/4X8y3m7kyMrqKp4bSQM49sbETRdvQz+5W39VRE+AFHoJ0iKHMwXPrdSXK
	PzTTuiL67J5NMDCHwGDk+6CvK/tgKs5TARm42dboPqEja7QKlcwHypqhK7kJbp93YWs7dhI1WIC
	iiTJ+5ZQSmGqHihl8i2sKJmJ986vicKOCUnUVNyhh6hF12wtPbJymyXBN8sEramv+8iWEa+h99R
	Ah08DSB+2f2zrp6qfCgmw==
X-Received: by 2002:a17:90b:4cca:b0:39e:423:bb8f with SMTP id 98e67ed59e1d1-3a0730988bdmr477897a91.1.1790066591638;
        Tue, 22 Sep 2026 01:43:11 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0674a5ae4sm3670016a91.12.2026.09.22.01.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:43:10 -0700 (PDT)
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
Subject: [PATCH v7 0/9] kdump: reduce vmcore size and capture time
Date: Tue, 22 Sep 2026 16:42:47 +0800
Message-ID: <20260922084256.1515554-1-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

On SoCs that carve out large firmware-owned reserved memory (GPU,
camera ISP, ...), kdump currently dumps those carveouts as part of
system RAM even though their contents are firmware state that is not
useful for kernel crash analysis.

This series introduces a MEMBLOCK_NODUMP flag in memblock to filter
reserved memory on DT-based architectures (arm64, riscv, loongarch).
Reserved regions are marked MEMBLOCK_NODUMP by default so kdump omits
them; reusable CMA regions are different because their pages are handed
back to the buddy allocator and may carry crash-relevant data.

ACPI systems already filter reserved memory out of the vmcore through
their existing path; only DT-based systems currently fail to filter these
regions, which is what this series addresses. The flag lives in memblock
itself rather than in a DT-only structure, so both ACPI and DT systems
can benefit from it (suggested by Rob, thanks).

Since the reserved memory regions are filtered out, the vmcore is
smaller in size and faster to produce.

The series is based on linux-next and is organized as follows:

Patches 1-3: Preparation and bugfixes: switch riscv crash_mem to memblock,
	     fold the duplicated per-arch memblock walks into the weak
             defaults, and serialize crash header preparation against
             memory hotplug.
Patches 4-8: NODUMP infrastructure: switch crash_core to
             for_each_mem_region(), introduce the MEMBLOCK_NODUMP flag,
	     add a dumpable flag to struct reserved_mem, and mark
	     /reserved-memory and /memreserve/ entries with MEMBLOCK_NODUMP
	     flag.
Patch 9:     Exclude MEMBLOCK_NODUMP regions from the vmcore ELF
             header.

v6 --> v7:
1. Fix a stale MEMBLOCK_NODUMP flag issue [1]. Memory reserved and
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


v4 --> v5:
1. Rework the mechanism around a memblock-level MEMBLOCK_NODUMP flag
   (suggested by Rob) instead of the v4 opt-in 'dumpable' flag on
   DT-only struct reserved_mem [2].
2. Switch the riscv vmcore elf header preparation to use memblock
   instead of the resource tree, aligning it with arm64 and loongarch,
   so riscv also can exclude reserved memory from vmcore.
3. Deduplicate the vmcore elf header preparation: arm64, riscv and
   loongarch open-coded the same logic, so fold it into shared
    __weak defaults in crash_core.
4.  Drop the v4 patch that saved /memreserve/ entries into the
    reserved_mem array; /memreserve/ is now marked MEMBLOCK_NODUMP
    directly.

v3 --> v4:
1. Rebase this series on v7.2-rc1.
2. Add two cleanup patches (patch 02/03).
3. Simplify patch 03 to avoid checking whether initial_boot_params is
   NULL multiple times, suggested by Rob.

v2 --> v3:
1. Fix out-of-bounds issue if device tree lacks /reserved-memory node.
2. Fix UAF issue when alloc_reserved_mem_array() fails.
3. Add some prepare patches.

v1 --> v2:
1. v1 added an opt-out DT property ('linux,no-dump'). Per Rob's
   feedback [3], v2 drop that property and exclude reserve memory
   by default.
2. Split some prepared patches from the original patches.
3. Address coding-style comments on patch 5 from Rob.

[1] https://sashiko.dev/#/message/20260917220750.GA4013814-robh%40kernel.org
[2] https://lore.kernel.org/lkml/20260723234126.GA3253409-robh@kernel.org/
[3] https://lore.kernel.org/lkml/20260506144542.GA2072596-robh@kernel.org/



Wandun Chen (9):
  riscv: build crash_mem ranges from memblock instead of resource tree
  crash_core: fold duplicated memblock arch hooks into the weak default
  crash_core: serialize crash header preparation against hotplug
  crash_core: replace for_each_mem_range() with for_each_mem_region()
  memblock: introduce MEMBLOCK_NODUMP flag
  of: reserved_mem: add dumpable flag to opt-in vmcore
  of: reserved_mem: mark /reserved-memory entries with MEMBLOCK_NODUMP
  of: reserved_mem: mark /memreserve/ entries as MEMBLOCK_NODUMP
  crash_core: skip MEMBLOCK_NODUMP regions when building vmcore ELF
    header

 arch/arm64/kernel/machine_kexec_file.c     | 29 ------------
 arch/loongarch/kernel/machine_kexec_file.c | 27 ------------
 arch/riscv/Kconfig                         |  2 +-
 arch/riscv/kernel/machine_kexec_file.c     | 33 --------------
 arch/x86/kernel/crash.c                    |  2 +-
 drivers/of/fdt.c                           |  2 +
 drivers/of/of_private.h                    |  2 +
 drivers/of/of_reserved_mem.c               | 48 ++++++++++++++++++++
 include/linux/crash_core.h                 |  2 +
 include/linux/memblock.h                   |  9 ++++
 include/linux/of_reserved_mem.h            |  1 +
 kernel/crash_core.c                        | 51 ++++++++++++++++++++--
 kernel/dma/contiguous.c                    |  1 +
 mm/memblock.c                              | 43 +++++++++++++++++-
 14 files changed, 155 insertions(+), 97 deletions(-)

-- 
2.43.0

