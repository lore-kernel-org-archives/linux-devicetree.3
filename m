Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35503E2760
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782805651; cv=none; b=KGxxew3TleK+E0ro/GbMUyZQ61j8WD3pXPj6PrOB+CsTdyh50tHwNvWFnX4PuNxmai8N4oapf/ruV4epwO+2scW+6GXn5EkubMXkS60HniOuZ8Om5eyJKq2awMYSuheQBYRn7zYvxGpT0B2VDyrAVINccvz9ScjBmP2deVAx6Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782805651; c=relaxed/simple;
	bh=heKSEPDt49FyXQkUR7yX+hI6qaeXiquq+AzKfj9m46s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AJw+Q3BxBU9rK3dN3h4trcZDMLa0zUP6HQGJJsc1+tsESDKFVqH+gjz13Jm6dohWKSJmJlD7UuUGeWCRB7kcqrQZ30O0MoOaie5QICAsKTewP/sxn1XT7JvyVKXpG2iDqMGIEE6B4+pBK2MBjup5JKSZTq4ekdXT7B2u9JgLgB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oIR3hGLl; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oIR3hGLl"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2c7ebfb63c6so26017605ad.3
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 00:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782805649; x=1783410449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+GS4Pj9gB+OIxG6eqcIUsdmhCCBXu3Ye2u2fsYJSw7Q=;
        b=oIR3hGLlCSpZtuGRyipOJpSumWA/sHuDyUQzErgIMiUwDDJLUtEkXeRJDRegBeqk5v
         8toRFGlBTXCdTVOJ1jk5s6uXyLkV6ssOi74VZbbOu/Tk/VymF9bORfdMuzM5tAzvFOhu
         7dHNXqsFSwKF4Q0TyLDpmF36mwPlo+dmcBLs6XHZEpZr4RXvcXp3bNVAEkkw1tLtdZ1G
         pjO276+PIWg/RJN9UG7FTtgPm9Z3F53uJNZJyD5/kxr+Xi8MSsshF+3+jW6O19GcrZwR
         4L2R7yrPkOpM+3nVNcuHyr++THPW0Ydsah6sIfjJePP7lFrTXtXfEuKOhu0dGuZs8E/t
         xfEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782805649; x=1783410449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+GS4Pj9gB+OIxG6eqcIUsdmhCCBXu3Ye2u2fsYJSw7Q=;
        b=S6oCU0iAyl755uyDq4JdSp7EBMLfPW8ixdf8gtJm4rjL1dpbK9krpFihfFrEPVLaiD
         mar8OXq5x2pRgpn8PUsOuovIhcfqrdwsNhUEqKUYzIZTPvd4Fu/7BTEOAgkuXqMz+Uug
         Cc3KmSKn6odz+9Nw/VBLrN9Kh9g8p0bWGlVyGmcy/DlXP5UHNQ2su/uMnClmwWeDZCw+
         Rl2/joj6QHPZujlfb27msPN+40Ynp0UH/mP2dCYXFww+9bVZdDCW2OGsynRcK9dCZOvn
         zL2JpM7qfYdAo+EUHrhURLXnmAclzKOwTCs9TNcGh6bhG6ibRmY9fvPANDkQQA+F/VQh
         ARhQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrg+S647aQsYZP4824ELM2sme17p2TocdTZfQnTNX2GsA6L12XR2xHI+uPzYL0NH8Duo3kAhKv1lHUI@vger.kernel.org
X-Gm-Message-State: AOJu0YwvEkSm8OZu/rzEWJSAGeU2RrKU0NOPOhlAXYIM5ZE9iLhqk4dl
	sigKuX3gicfztDYCmaCPwtqCDDQerIGIeqD4aFoJoBaSPQKAzF2jxKNC
X-Gm-Gg: AfdE7cmsbcJYxJ00HyaMKmk3S3Q1KXa2QViA1N46tsivBOiXf5Dehd7pTAEPBmax948
	3AkRpJsbkvqKtYfQ0ywoAhTbGyDK+E0LLf4cOLEuqFNVeq4XxHedBYCyewTqKE2OP8cmeUgYkza
	nne7PxHimVyhDfAA9nLABbnh6EUG87+wtIh4Xw9u2CYuSuM8Wj2X0S+E7PLQJMqg6Lz6RkkDHP8
	nfCmKDNFQyPUm/u6L8DYUO3mj3kNyR6z8qj2jXsqVvh9js2W0195IRwbbSUBrq1G5JL4tRDLdAP
	1aEZeWUVBHT1IVLfJnt6RK/2z3HRV/cO10GNQT3PnSf4zHb6HO+NA9gKPMBWJAhxzJfqgfK80PF
	6sB0KescQZoJQ6KWDewfpjI4tFUCXHTBPlgxnz/5oMxfQ7fiIXVH8jzgmaP36r5PXrMUm7HCyuH
	kgSvFM5gFqtbmkStYiMl99u10rvQ==
X-Received: by 2002:a17:903:46cf:b0:2c9:f0e3:e20a with SMTP id d9443c01a7336-2ca2ea178a7mr21382995ad.33.1782805648953;
        Tue, 30 Jun 2026 00:47:28 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382a2d3dsm7821045ad.55.2026.06.30.00.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:47:28 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	bhe@redhat.com,
	rppt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com
Subject: [PATCH v4 00/10] kdump: reduce vmcore size and capture time
Date: Tue, 30 Jun 2026 15:47:04 +0800
Message-ID: <20260630074715.4126796-1-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

On SoCs that carve out large firmware-owned reserved memory (GPU
firmware, DSP, modem, camera ISP, NPU, ...), kdump currently dumps
those carveouts as part of system RAM even though their contents are
firmware state that is not useful for kernel crash analysis.

This series introduces an opt-in 'dumpable' flag [1] on struct
reserved_mem and uses it to filter the elfcorehdr PT_LOAD ranges on
DT-based architectures (arm64, riscv, loongarch). By default reserved
regions are treated as non-dumpable; CMA regions are explicitly opted
in because their pages are returned to the buddy allocator and may
carry key crash-analysis data.

Since the reserved memory regions are filtered out, the vmcore is
smaller in size and faster to produce. The reserved memory
has already been filtered out in x86; the optimizations in this series
apply to systems that use DTS such as arm64/riscv/loongarch.

The series is organized as follows:
Patches 1-4: Small prepare changes and cleanups.
Patches 5: Add dumpable flag to opt-in vmcore.
Patches 6: Append /memreserve/ entries into reserved_mem[].
Patch 7: Add generic kdump helpers.
Patches 8-10: Wire the helpers into arm64, riscv and loongarch kdump
              elfcorehdr preparation.

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


Wandun Chen (10):
  kexec/crash: provide crash_exclude_mem_range() stub when
    CONFIG_CRASH_DUMP=n
  of: reserved_mem: dedup and relocate reserved-memory messages
  of: reserved_mem: skip late scan when no regions are reserved
  of: reserved_mem: split alloc_reserved_mem_array() from
    fdt_scan_reserved_mem_late()
  of: reserved_mem: add dumpable flag to opt-in vmcore
  of: reserved_mem: save /memreserve/ entries into the reserved_mem
    array
  of: reserved_mem: add kdump helpers to exclude non-dumpable regions
  arm64: kdump: exclude non-dumpable reserved memory regions from vmcore
  riscv: kdump: exclude non-dumpable reserved memory regions from vmcore
  loongarch: kdump: exclude non-dumpable reserved memory regions from
    vmcore

 arch/arm64/kernel/machine_kexec_file.c     |   6 ++
 arch/loongarch/kernel/machine_kexec_file.c |   6 ++
 arch/riscv/kernel/machine_kexec_file.c     |   4 +
 drivers/of/fdt.c                           |  11 ++-
 drivers/of/of_private.h                    |   3 +
 drivers/of/of_reserved_mem.c               | 108 ++++++++++++++++++---
 include/linux/crash_core.h                 |   6 ++
 include/linux/of_reserved_mem.h            |  15 +++
 kernel/dma/contiguous.c                    |   1 +
 9 files changed, 142 insertions(+), 18 deletions(-)

-- 
2.43.0

