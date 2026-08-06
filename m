Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8F642AFAA
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786008943; cv=none; b=Pdp9d+LRBoXKpFao05HprkOnGSA0mRVJFJ+ByQLeNaexEApPO6iG8VJlMHtWOQe31+TLwa1x3llHxfLZ4kswq6al/CCxqmP4Z1+y5j7lY6rQlgnb7SvKENJ597UP7E54QhldwohpsVpu1Nz9wg3xAVZEOjYN0EcaGs74/ftqy8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786008943; c=relaxed/simple;
	bh=ZHLCtUVO6uYDOsdtlCc6ZAdxnR8tUMuzMFx7R4VBsvY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PtJyM66tg0O5tXLJ4/HiqbtJWYqQGTVdJ6/skXz4F69AItjcGCPYWNt83tHp6QD77vAZk4njooD5LH/XXHSPpYUNp6CQm7KonOknyS1hcIpvDLCfiFEhkV9H9Wq21rkve9E3iyPvVl51xk+rX2sZnBwqtkg4Gkb5n+FjXWQ8n5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jhv2kjBi; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jhv2kjBi"
Received: by mail-pj2-f1.google.com with SMTP id d9443c01a7336-2cb3f5bb19aso7127055ad.1
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 02:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786008936; x=1786613736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iAi2qaVA1OaGq4fUWHi+grRNkf4AM4PgvPmY0Rr+XE4=;
        b=jhv2kjBiMFxWkTSBnnAr/wEttfUWUSDLhtqDdCglMyH4w679AtapJFEGDQtfpud57D
         AnxJiWbUCGvPEtdz8I52EWgUoykW+Vx/Ixin3APy4Eo0pLlPucAgbJcjQFw9AJHtbWHn
         ni0zv2hq6ZV3wYOtPkolfeDt7ajaFWzVVzUV2381fBHsrpc+EStgmVhcwKZEo5y1iV7m
         XZzVQ7fKDGwIX+rkHfVhmAR4ym2YdCVtVRNrI5F5G+yRzXRVa6JwCTf1iUQeR3d8SyLu
         cQF81x9OvIrCrpv5Zb4bacjZXA7pxr53k/BtXMFoDRpHzsHkhJMKgOwnVRA/qTFobQCE
         0QSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786008936; x=1786613736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iAi2qaVA1OaGq4fUWHi+grRNkf4AM4PgvPmY0Rr+XE4=;
        b=d0j3OtTTl2HRp0IlPGcB6RNdDCyZ4kcY6AjrdK+hX2Ghl83hZCocNXsZvamOuv1WMm
         YgoN67l92UZucZtfVCXmhi8CJOLPDL4C2atpdotHFvmAtDn48zb8fWu7JWWf2zflnaEq
         nSpxFt/dCWVwsQoT4nbiO3orLWv7ZrIFbz5r9Ln7F/i2J07XRO9QYzbE2SUqVtLpmn8w
         5GKiVLDUjD1Swrx2yknbAiaRcYU4QqPfZCYal59EdcLTwN2KIco1fCE84Rpwuup/UySt
         pvP/9sSWc7BX3UGGrjygpfeZT4KpVs9PMLswonXCRyNQobraaLj5idEd7hEWAUmR6EJw
         aChQ==
X-Forwarded-Encrypted: i=1; AHgh+RrR2or0smbh5Hm3FlLlQ4WJN08KJJoFNvzsqMAi7MIJVvAzT+4KsBlfM3Cd9HpSz7JoZdYzBrHpU9Ac@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj6wl8QYel4VrU96wJV+gpxWfZtyLfY4O1rHS3U8qwKev3w0y1
	xVtFEdtHS1WPiex3OLYJg0t8SF0rPgWI8CIkzJQ/+Pnu5DD8y2taPUjL
X-Gm-Gg: AR+sD10xVv+oJ68a5MpXj0yS6SDIB+DdCG3ojFEvcXPJMGbbtenz2vjjvS+duBX9BYO
	eGCzPOSaWCwsWXEcTatSqal7PEb2WlkhyEgkHX2kuESal4pw5C6aTW7CidI7C2KQH08JfB8PHN/
	2BLUrL1iPmVM2pLQOtMac8rZKQiYEtPPBz7UZ0nQTNP0XEK7ISaBYlf/h1xi08X4S5bZzGf8VcM
	6l1rvyyUpkIfGrpxEoXbNjkek91kWTFy8B2eSdbtEfwtGqRk+/QEypUPSdJ24CWX17Vf2uaurdz
	Sd6ZMP04GcpNs/A95ZL551i48pgvIJxgMhJk+0MaF0/0BWIftd+MIR+EEsil+0wy/4c6AUiq78M
	deeBropEPG3eWGyei2ZwogFDRNT1dH8vFx16tcs5XrdkhlEY5Y/VUkpZi9wG6sXQe+ljeWLIV9Y
	/aOgoe4Icd21js4t2wCVgAJnsGY+iXafJQxsQVKzb4OaOt4YtVnDWqUtZmYBGt6usS7XCGl7BQK
	A==
X-Received: by 2002:a05:6a00:9515:b0:84c:1cd2:142e with SMTP id d2e1a72fcca58-84f4fe9e75cmr58122b3a.23.1786008936445;
        Thu, 06 Aug 2026 02:35:36 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f453b0aeasm1043878b3a.13.2026.08.06.02.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:35:35 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	rppt@kernel.org,
	baoquan.he@linux.dev,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	m.szyprowski@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev
Cc: kernel@xen0n.name,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com
Subject: [PATCH v5 0/8] kdump: reduce vmcore size and capture time
Date: Thu,  6 Aug 2026 17:35:11 +0800
Message-ID: <20260806093519.2907771-1-chenwandun1@gmail.com>
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

This series introduces a 'dumpable' flag on struct reserved_mem and a
MEMBLOCK_NODUMP flag in memblock to filter vmcore ELF header on DT-based
architectures (arm64, riscv, loongarch). Reserved regions default to
non-dumpable and are marked MEMBLOCK_NODUMP so kdump omits them;
reusable CMA regions are explicitly marked dumpable in rmem_cma_setup()
because their pages are handed back to the buddy allocator and may carry
crash-relevant data.

Since the reserved memory regions are filtered out, the vmcore is
smaller in size and faster to produce. ACPI systems already filter
reserved memory out of the vmcore through their existing path; only
DT-based systems currently fail to filter these regions, which is what
this series addresses. The flag lives in memblock itself rather than
in a DT-only structure, so the mechanism is generic and both ACPI and
DT systems can benefit from it (suggested by Rob, thanks).

The series is based on linux-next and is organized as follows:
  Patches 1-2: Introduce MEMBLOCK_NODUMP in memblock and the dumpable
               flag on struct reserved_mem.
  Patches 3-4: Mark non-dumpable /reserved-memory and /memreserve/
               entries with MEMBLOCK_NODUMP.
  Patch 5:     Switch riscv to memblock so the NODUMP flag is visible
               to the vmcore ELF header builder; add (KEXEC_FILE &&
               CRASH_DUMP) to riscv's ARCH_KEEP_MEMBLOCK condition.
  Patches 6-8: Fold the duplicated per-arch memblock walks into the
               weak defaults in crash_core, switch to
               for_each_mem_region(), and exclude MEMBLOCK_NODUMP
               regions from the vmcore ELF header.

v4 --> v5:
1. Rework the mechanism around a memblock-level MEMBLOCK_NODUMP flag
   (suggested by Rob) instead of the v4 opt-in 'dumpable' flag on
   DT-only struct reserved_mem.

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
1. Fix out-of-bounds issue if device tree lacks /reserved-memory node.[2]
2. Fix UAF issue when alloc_reserved_mem_array() fails.
3. Add some prepare patches.

v1 --> v2:
1. v1 added an opt-out DT property ('linux,no-dump'). Per Rob's
   feedback [1], v2 drop that property and exclude reserve memory
   by default.
2. Split some prepared patches from the original patches.
3. Address coding-style comments on patch 5 from Rob.

[1] https://lore.kernel.org/lkml/20260506144542.GA2072596-robh@kernel.org/
[2] https://sashiko.dev/#/patchset/20260520091844.592753-1-chenwandun%40lixiang.com?part=4

Wandun Chen (8):
  memblock: introduce MEMBLOCK_NODUMP flag
  of: reserved_mem: add dumpable flag to opt-in vmcore
  of: reserved_mem: mark /reserved-memory entries with MEMBLOCK_NODUMP
  of: reserved_mem: mark /memreserve/ entries as MEMBLOCK_NODUMP
  riscv: build crash_mem ranges from memblock instead of resource tree
  crash_core: fold duplicated memblock arch hooks into the weak default
  crash_core: replace for_each_mem_range() with for_each_mem_region()
  crash_core: skip MEMBLOCK_NODUMP regions when building vmcore ELF
    header

 arch/arm64/kernel/machine_kexec_file.c     | 29 ------------------
 arch/loongarch/kernel/machine_kexec_file.c | 27 -----------------
 arch/riscv/Kconfig                         |  2 +-
 arch/riscv/kernel/machine_kexec_file.c     | 33 --------------------
 drivers/of/fdt.c                           |  2 ++
 drivers/of/of_private.h                    |  1 +
 drivers/of/of_reserved_mem.c               | 35 ++++++++++++++++++++++
 include/linux/memblock.h                   |  9 ++++++
 include/linux/of_reserved_mem.h            |  1 +
 kernel/crash_core.c                        | 34 +++++++++++++++++++--
 kernel/dma/contiguous.c                    |  1 +
 mm/memblock.c                              | 16 ++++++++++
 12 files changed, 98 insertions(+), 92 deletions(-)

-- 
2.43.0

