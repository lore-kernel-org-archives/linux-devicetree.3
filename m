Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAD952B1F7
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 08:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066607; cv=none; b=P5gPG7fV2jIbcBrsbhdCoHzUMGT9efsEEio4iLiqEUV8gL8qNsitC3wi9SfX6gDnSiezoVaqncGk575dpmvBuHehs2NNBrJbbJmcVDYqdpN82HmsRYaKSV4DyXWKWiVu1CKf9YSDaZ87gmvopTjMWFqgL4ie2wC1zv09o/e8VRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066607; c=relaxed/simple;
	bh=DHg+Xu+RM/RWOTApV60B7AmLnhatRTbyWK/RynXlXLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uJugbUb762FIP8cYjGZ/lL8R16Fr67x3KBPGbSizBxSxo3ln/LmGOOvTOv4G5CPmQ6bZKY23I+WOSFqKWp/zFIr3UUdz5u2tijsym7Kq3UC0FA227/E+YVcZf1gH10I0EL0qp/oBvzn3+MHxmQ/3DS8iO2kcJH2L3yr5V4DS7qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QoLsyiCW; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QoLsyiCW"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-39569e136f9so3159365a91.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 01:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066604; x=1790671404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M1ZOEGC6NTnorBW1vtDJTTSNUXHaycEwYALUJLCTDV4=;
        b=QoLsyiCWMw8Sv83kmyqjvhoUjsJHUXf/QkWg9gVQwUXJ9kiO3I9Xmzj1ynLiB7hgxx
         fkUvYjoJkcpOm31tQolCZoQXvpl2eN0rhzeBmSd3Q5e7yunUQxMe5VtAzs6ILfEW7WA4
         CHiCto2jcm9HIuJDrCOJtCrjPajNxwXew11eq8Ns/B4SRpLfrTnT64N8RzOdC/Dj1dcJ
         klpP4N+I+NuV8MHv2Jr4V2kfOObop/sT64nvDfHxXG4/+FiROa8VUd/2/SPJ+THuwFTK
         P9MDSZxnDh4RpEerLwqmlHBL2ai/l4IJWJ454Sp0XWwR8I+6601lRfGh8EVbeNPlKPq/
         U+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066604; x=1790671404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M1ZOEGC6NTnorBW1vtDJTTSNUXHaycEwYALUJLCTDV4=;
        b=vPC5iR4WOiyIVVpd5OUX5qIpn1JAVQq6mlK01zml/cQgffaXAKliVfPUTgKDcUhL1s
         Wci4JTdl8+RbKQ993ANKtc81f1n+aUPQQT+TShoKmKHDM5CHG4jVygrH+Ixqn2Fk/lkY
         gJm1euHmxg8C2smIoVe+VCurWY+6qKI7olnVUuigJILGOQCKXA9OddVpRv1kPd4Qav8A
         4NJgQLlF0HnlmMfgs2o+aUsHctCXVyi0hL+x3cbA4YeNM71L38oyTB0e0r2MyYrW60Yb
         wXuyyln8WyN1zS4/O9wgtS0mwF1md6LNZ5YEgPHzG1W/Nj6ALHfQked3S42nS/VeFiy8
         lwsw==
X-Forwarded-Encrypted: i=1; AKwUvBxIL4yC2UT77io89vlZwJb2L42ZZ8rsFr4yRJLEDZf5kXH3zqo08j7w7DAK5oQrx4ZiIqAlKaNDc9i5@vger.kernel.org
X-Gm-Message-State: AFuF++nXFcxUlF2W/OOgVQta8WRWGkOXy6E/igThID4XuaoFwsmkNllt
	S7qDcXVNbv+ynf6IU2LMSuFOP+SUfPyJNakDEyVIhgbShgvATUXnkotc
X-Gm-Gg: AYBFou18/OgGr8X0VK7RnTF00hMdz1tzBlp82AdVUkHHA6/8Bjdes9dVtKammBP3Cdk
	QWD4ea2BPagEnAHqdjOaTc+oO56KIE1noPwPpKYcl4p0D6kkarycyW1GXwJWjY+4m72YGKySjNN
	TgOIMK3e0kLS8QyCfKLkii5rGxP/4jI1Oh02zPXhMaEM6aufRsLAlomn/7YTkD20GKVA+VRhDQ2
	A2XXqqn1bXlulUG9zL4xufR9FufAdWkg0ZE7mRY/l2gilp0OECp4PIQvtnysFQcvxoq1ryfbrWI
	noNQlLSCI9iFH/SREvXhA9EFEDfriu/XDoT2vz6Msgr8hbLDZlvomozp4IepUUuEo3B3eUycdde
	IrOEcTKkdqf5D6bXhmLTUsaVBtpzz8qGEfLO6C6chcmNM8gALYvkpUhJt1kOY29gb+WazmxIAgo
	0tSYksSPknIuZjNlif0Dc1MRmKWATTjIKJmmqyzmmRX3FjoIhar8PrzjWsoFCy/EPXPCGMaLNOc
	2koiecoDk4=
X-Received: by 2002:a17:90b:1d8c:b0:39d:f4fd:8075 with SMTP id 98e67ed59e1d1-3a073182cebmr482494a91.19.1790066603666;
        Tue, 22 Sep 2026 01:43:23 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0674a5ae4sm3670016a91.12.2026.09.22.01.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:43:23 -0700 (PDT)
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
Subject: [PATCH v7 1/9] riscv: build crash_mem ranges from memblock instead of resource tree
Date: Tue, 22 Sep 2026 16:42:48 +0800
Message-ID: <20260922084256.1515554-2-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922084256.1515554-1-chenwandun1@gmail.com>
References: <20260922084256.1515554-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
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
index a590db7687c8..991657b2465f 100644
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

