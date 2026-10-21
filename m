Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571445;
	b=svAXhlEEQEVOk2OvuK3y8q7TPqE0LKQvrw9le0G5LX5PklhOpyP0QFlD8EE05ygrCsSA
	 x7/dLkB0IWyP9KLDIED0g9hWsAiQrqZDs8qn+gNLI56JFqaK3LeLazy5MfhAvtly4TZvv
	 05nMJmlVp2A8XztKWr7JY1bpoIAnx+Rnsm9+a0yG1DGi+zCUFSjgra/phTfVzncumnd1u
	 7U5iF1XvirgHmxt0groxAbJvjWa+QYf6s8lJTMxmJtpdm5Em8skJLL42VH/FnS5NhqTtl
	 qQnf2looMc81d8ThPd8mh43GSSHDx0/pvRUWI5g3iXGTPWQMa8SARtjkVeDLg5lIu1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=e9/qG3hNPJNIGpwptQDGRFtRM3jaRgB/Z0bZ0bWRF/Y=;
	b=dDjPlGy8trTCAU9aiGTM+jLehAP/PG8zFze0JcgNJJlphBxd0+0MM3Q8L9TnRWoJybZA
	 fUZUG2QX6qfdeoOyNqQTPiVQxdR0tGFjP/u1KC44AUT9eTCr/qwUGxcRMSOfBISg9meOd
	 Nwnj2DpX+ikT32HJQP0c5RrurvWA/SbKOGrUbjQLYYLlhTzv5BkblP/EXo2IcM2tnbuHn
	 AwQ7HV2zNipiTQ69OdW2lDrPqikMKgQ9ofUH0wV6uTaUsBbCZL0f0k7MJEC3ecz9O2EPh
	 2fJ6z7/e0v6UJ125bzu+7JdIyXfb5K9OEY0XVnv+aFYrJu8My83NU0uG5R54X9SF+5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dJN8jm8g;
	arc=none smtp.remote-ip=74.125.228.1
Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4B0606A319
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A4B0606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dJN8jm8g
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-cd63952c9f2so54354a12.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 01:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792571443; x=1793176243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e9/qG3hNPJNIGpwptQDGRFtRM3jaRgB/Z0bZ0bWRF/Y=;
        b=dJN8jm8gC6uvtFqcLz2yDxU6q38TRCAdCwzoscnl+PGv70L/XtyT4Xhe7+v2BJ51oU
         AMbaoPGeDta9rp0TrqaOposmKBfxeq62sFIasbhZ1rlBJ2ELa5hebQH8O2p+Sea0q8Mw
         THuo6eJAGtzQAdT5yfWa1Lu+ycbHRqFs0YLltZt9S78hts0IZVeuWyORCkQbR8tczP6u
         ZihoCrQGzJj6UWJU3WLQrIyypfDVghflugwaNpTLDw0k8EycPQHDW12sKpM9WJYn3zYX
         FYEx8JN/tnQi6cWdpVQwxI9OwYph+LKm8Ww2ZehApcwoB5/6KvDATpyxV8xb5CUmUSgp
         p57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571443; x=1793176243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e9/qG3hNPJNIGpwptQDGRFtRM3jaRgB/Z0bZ0bWRF/Y=;
        b=DJ6ZWJwOFu9Qa6p0rsVQLfkoU/PE9ftALU5AhrzzRIa0zEwRNEOor7QyqQ9nQ2yD8f
         d9ZPVZopf6NzxCLb7lxdlZo2c133VyI4eV3G94z42kj1xT7A5VJXYR/9fA0EcLi7wyku
         DQRudffFKhIHlti7zr+CVXsivw/8DJGJFF4/pfXJ+dlzlQTtCrcfCyiNu4TgikS0aoaS
         PvP5qIm63Q6aBVri+b5aRf2gexmGBTYgx5y+fIiqK1oQpTr2LVsB/hfbpgdVnsMVEOfA
         mYCyxutx89GvIyRg96UAQj6MZqvyG5vlfs7xXhpfdw2DZnbTXnt7XGjXTbP/v3ratGhf
         9gYw==
X-Forwarded-Encrypted: i=1; AKwUvBxIwj1BWK0te9V55EA0g6f8dTkTlOTz461TQv06h0FekU1iiowjcCbi8zMXsYsfI6ePtt2yh4WjU7Mf@vger.kernel.org
X-Gm-Message-State: AFq9FYKYua9tSG/MDzKMGp8tDG7D3CyKcdVW5ddsniEk6q184Aka1Pmq
	AZBidmYT7RAmxCN1ZA1sDq0rkS7EMX8wSF4YdQXGeaqRM66nDywdudtV
X-Gm-Gg: AYBFou0vrpyAVC/tVLpdjYIQAuvOjk6lpIr+1NzxVXGrw2tWKlIEo2Lk40SN3wj4mBY
	FZS/hGT+nuuwJVC/7b/mebm7icX7k/DH/D1t/EBzTtAsyGeT8tJnvi8giYiNSYzFWzWC5WGjOlI
	94/LGp5bS5b3wlNPUA5KCxx0XWMm/t1SxAtfJgGmsE3ZmWlxOib0P9Kckg+4HyizfekH43wgadf
	r9zQ6PGNnxBnpNsK8aI+N/MIO8nHn03cyXKn9eA5ESxztypwS1Bjw0CruBFbZL3n3MZCAVB01DS
	KSxc6T6oLZ4iVqsT7qg10lVFuRs+sMUWD9ks/afOL1ZQa5SnO8aQZMq1CNaCl9jjQR3RqXNIFNn
	dHlDHRZIQGBrs2hWyi4AXQvRRHdvXeaBsA+UGX9c+H8w+h+77hbtEyqQGNjLOeFWJXqLWGR6PAi
	lB6tdKfp/o8BSKUh34Ukf0+0ljAkhyid27z0Ob10ujXKSvogXKsdGNZkz+O9I97OcGqqPDUtIk0
	CnxXbTWCvotRKdfdepmUmDhg1fTd0uNv7WmsZVAVczvY4auL9p5/K5Po2hDtp4aEBEv
X-Received: by 2002:a05:6a00:a204:b0:874:708d:b620 with SMTP id d2e1a72fcca58-8a089d13a97mr1238939b3a.30.1792571443298;
        Wed, 21 Oct 2026 01:30:43 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895e273bsm600653b3a.41.2026.10.21.01.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:30:42 -0700 (PDT)
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
Subject: [PATCH v9 1/8] riscv: build crash_mem ranges from memblock instead of resource tree
Date: Wed, 21 Oct 2026 16:30:04 +0800
Message-ID: <20261021083011.2170525-2-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021083011.2170525-1-chenwandun1@gmail.com>
References: <20261021083011.2170525-1-chenwandun1@gmail.com>
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

Replace walk_system_ram_res() with for_each_mem_range(). A later patch
introduces MEMBLOCK_NODUMP in memblock, the reserved-memory regions
marked with MEMBLOCK_NODUMP can be excluded from the vmcore by walking
memblock.

for_each_mem_range() iterates memblock.memory, which is freed after
init unless ARCH_KEEP_MEMBLOCK is selected. riscv needs ARCH_KEEP_MEMBLOCK
to filter reserved memory from the vmcore, so extend its condition
(ACPI || KEXEC) with CRASH_DUMP. arm64 and loongarch already select
ARCH_KEEP_MEMBLOCK unconditionally.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Baoquan He <baoquan.he@linux.dev>
---
 arch/riscv/Kconfig                     |  2 +-
 arch/riscv/kernel/machine_kexec_file.c | 31 ++++++++++----------------
 2 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e7891a2a89da..e21d0bab77ee 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -58,7 +58,7 @@ config RISCV
 	select ARCH_HAS_UBSAN
 	select ARCH_HAS_VDSO_ARCH_DATA
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
-	select ARCH_KEEP_MEMBLOCK if ACPI || KEXEC
+	select ARCH_KEEP_MEMBLOCK if ACPI || KEXEC || CRASH_DUMP
 	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE	if 64BIT && MMU
 	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index 26cd2a8bd0cd..808e872f4063 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -37,39 +37,32 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
 }
 
 #ifdef CONFIG_CRASH_DUMP
-static int get_nr_ram_ranges_callback(struct resource *res, void *arg)
-{
-	unsigned int *nr_ranges = arg;
-
-	(*nr_ranges)++;
-	return 0;
-}
-
 unsigned int arch_get_system_nr_ranges(void)
 {
 	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* For exclusion of crashkernel region */
+	u64 i;
+	phys_addr_t start, end;
 
-	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
+	for_each_mem_range(i, &start, &end)
+		nr_ranges++;
 
 	return nr_ranges;
 }
 
-static int prepare_elf64_ram_headers_callback(struct resource *res, void *arg)
+int arch_crash_populate_cmem(struct crash_mem *cmem)
 {
-	struct crash_mem *cmem = arg;
+	u64 i;
+	phys_addr_t start, end;
 
-	cmem->ranges[cmem->nr_ranges].start = res->start;
-	cmem->ranges[cmem->nr_ranges].end = res->end;
-	cmem->nr_ranges++;
+	for_each_mem_range(i, &start, &end) {
+		cmem->ranges[cmem->nr_ranges].start = start;
+		cmem->ranges[cmem->nr_ranges].end = end - 1;
+		cmem->nr_ranges++;
+	}
 
 	return 0;
 }
 
-int arch_crash_populate_cmem(struct crash_mem *cmem)
-{
-	return walk_system_ram_res(0, -1, cmem, prepare_elf64_ram_headers_callback);
-}
-
 static char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
 				 unsigned long cmdline_len)
 {
-- 
2.43.0

