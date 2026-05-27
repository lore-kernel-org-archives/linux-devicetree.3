Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18B437EFFB
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 03:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779852577; cv=none; b=b7bcPvzHPjAL1gTFTMPZPxVOCUzVw5tkny+l4rrOu7NXZr0uP1LhGBtMhefmF9sOgDuolY8e1gnFZPnDYYuVRaLdcH4w3ljZrgIpG0h0iMfDT7ZFSRQxifCcJLOos475J9DtU8ZLaRy9jf/ibeh1vqpkC9qfLdM6dEX3xeldU5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779852577; c=relaxed/simple;
	bh=NbPPm51uUAHAnIIFUegQN+gxWwVGNmdlYb+vntB/5X8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fgw/vh/hIcYnboYimfwGqU/KMysPvfp/tnziUMxcTc0S88DtmJqU+0WMo8VVwBQpv+fpwD62EH6IIvVoE9fCGPC3n1UC+12vPzPiCiDyf0UWhnG7jfCkls+qrx1nw7MlN2y1Ik03nvV2qtK/a0j6mg4PEvIBaDEL2jo7coNnCjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y7IlvtWc; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y7IlvtWc"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-83538fbd0b2so4588170b3a.0
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 20:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779852571; x=1780457371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NK9+MAufae3OUHglq3BxF1m5jq3s3djB2nPaLW09hjI=;
        b=Y7IlvtWcAvy9uiZ3DAQlPNmn55dGBpwP6bSacQTbLsy1jQU4ZdC+32tVLcXFDitjKY
         ifet8fRQjhbfdrMyVIWvO511Dn+ta6ZB4jJSijXD9hDWeQD8qtFmuM3FjPHNAd2AZfOG
         NUMQ09aDlY6GxPz74KGibk99PV6YbNIJ0U4qmL2HBOlHvsJndfQfQVL+YAa+BKi7D/FM
         a/LEALmbn6uUcyNNBO9ipF4cTlN7ILtI4G51cucvx0AQ9qajoouZezNwlBn/rbTiL7Zg
         v39aSB61XlQPTpSD/WzO0Lsfy8DBC9rWy0OGXObv+93oj+O7UvhwfvKguIsMe/ezeTUt
         j+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779852571; x=1780457371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NK9+MAufae3OUHglq3BxF1m5jq3s3djB2nPaLW09hjI=;
        b=Oy18LTKtez6qp5W0egHRm8N6mw6BOMnm499PlukLXDmc0IVQETxYmXjqIs8oXQmeov
         2W2E4UvucZf7BFuCzc3ZqD9btAeN0GdP7g0e8hCNUcrZDt7x5tr5r85kr2zofx/LIKfQ
         FG2SN3bsxaGQEZ4i4SN4KCokAqqAgAWOg+zzYzzO4uGiodidFnpYhHEGu2pbtIny+Rcp
         wgSdKoaKQIy0ums8+ukffd9oOf8BlvpN8DGfY6k9emLF39Zf7PZvXXC3/IjvMrMvJ5tB
         Yad4uIG3UvPOUFwJC/K/qTb3ar4pZb54EuvI2dvODcU2l8mD1aCR96ltzD0jLnd/24ms
         ki1A==
X-Forwarded-Encrypted: i=1; AFNElJ/UdrQhHzPg6AgiIPq7C9IZnI95k8XBPBsQmJBWohObwL8/m0K3l9M5r8/4axM9+l9a4OQwquXVyJ42@vger.kernel.org
X-Gm-Message-State: AOJu0YxlLM3CV6i+4avXXpSSBf/VCLtwLqbckLDpCEqgEc9x4hfl6zlL
	X+bV2jPz/CACOqcsXU5G2QpTK3PUZlZnXEnc6g5SNuz3fgjVTOo8cfm5
X-Gm-Gg: Acq92OGDq9lkqVPUUbZH9KFhR/mC9y3keJigwJ2Be47/5vVBXgVo2J9ypS8b4+A1RCR
	5adM9w4doOtFy8dyEiDdM8KrFTCthHwLGzweigDbnAaBs9lqHdvSoFjbJVu8H1ftHAPi6Gi+Bwm
	XRHC17kbBT3SBx2wMfW2RA/AEdstjZV/A2jiyUfdfnTEee5YLXY5wXooeOxK1NeG8AYME2pMh3R
	cpzddInlDwhajuxwCfk64A75zbdA9NtULdbrwIyJyTZR9IyHW3hQZvcsAERinOkpD9xEoYHnn/c
	26Qc4z3zgQIxU3QyWHs9vb7rQbMRXmQI46iGJrFi6M9+R4dqxPvCdHzl1Wt8wEleEQPVyUSaaK3
	RXvV+32kWdus/hGUVMm9s1geKz+mH/bJzyrw1jmouLXoidwKT3MKer/SWqh3l1KrxC+u1m48ag+
	IIHgYR4FoeNcrJYO5NKo/Jq9d5C4+ogQ4AifZk3P8BFGaQqtM=
X-Received: by 2002:a05:6a00:4f94:b0:82c:6da7:2d3d with SMTP id d2e1a72fcca58-8415f3d0e36mr19286959b3a.11.1779852571354;
        Tue, 26 May 2026 20:29:31 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d7307596sm749688b3a.59.2026.05.26.20.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 20:29:30 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	quic_obabatun@quicinc.com
Subject: [PATCH v3 00/11] kdump: reduce vmcore size and capture time
Date: Wed, 27 May 2026 11:29:06 +0800
Message-ID: <20260527032917.3385849-1-chenwandun1@gmail.com>
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

The series is organized as follows:
Patches 1-3: Pre-existing fixes and a small prep change.
Patches 4-5: Restructure to allow appending /memreserve/ entries.
Patches 6-7: Add a dumpable flag and append /memreserve/ entries.
Patch 8: Add generic kdump helpers.
Patches 9-11: Wire the helpers into arm64, riscv and loongarch kdump
              elfcorehdr preparation.

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

Wandun Chen (11):
  of: reserved_mem: handle NULL name in of_reserved_mem_lookup()
  kexec/crash: provide crash_exclude_mem_range() stub when
    CONFIG_CRASH_DUMP=n
  of: reserved_mem: avoid post-init UAF when alloc_reserved_mem_array()
    fails
  of: reserved_mem: zero total_reserved_mem_cnt if no valid
    /reserved-memory entry
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
 drivers/of/fdt.c                           |  11 +-
 drivers/of/of_private.h                    |   3 +
 drivers/of/of_reserved_mem.c               | 117 +++++++++++++++++++--
 include/linux/crash_core.h                 |   6 ++
 include/linux/of_reserved_mem.h            |  15 +++
 kernel/dma/contiguous.c                    |   1 +
 9 files changed, 157 insertions(+), 12 deletions(-)

-- 
2.43.0

