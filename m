Received: from mail-pz2-f8.google.com (mail-pz2-f8.google.com [74.125.228.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2163AA1B0
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 06:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792131380; cv=none; b=ZY5DY05cY+lC33Vn4S0i3W413g24HDAHNZPlGAMheVJxYV7HJv4wMHlYdx43SoWQLJSAnKaxhHx/N295hhBSlLCFkGd0x9EO8+6bfp+rO7iwjObNm8CLfxWiY02I1vyp1yBdN/cQj7QH2wx+PKPeCgdd4BcB1k6qU9o2HQo4zJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792131380; c=relaxed/simple;
	bh=PT3LWhSw2vdV442dcbthELxWe2cTjR/Mhzld4jrWTDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AVSBehnCMYGJ0uP3lAO/Wv8He7gzogtdb0L88l1gd6IqQFlCvh04bLEK1nmeYPC+4VEJundNJ5P/d1Pc1jPF4NKCjdbxIlGFUzxnH+eKPRuUUIGz1nOAJycTryUmiCgry5Qhi56+PgUWsJGLeinAuF3urCehbITemmyrz3AaOTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WZ2/iM1z; arc=none smtp.client-ip=74.125.228.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WZ2/iM1z"
Received: by mail-pz2-f8.google.com with SMTP id 41be03b00d2f7-cd3da0e82daso973525a12.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 23:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792131378; x=1792736178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pI8cU+3Va0VJY6BQ+e7sBVT9LPRu4J+OFo4gOdjLJ30=;
        b=WZ2/iM1zmfClQFjJ1SzFTya9EFnuhqQRlPEzOWtY/ZnftKjtBu95N3gaQAAt2S7MCW
         vDoNS5wC7Lf6ldu1L49SacDKTsVsQfYdiuhSKyEKnIKQb7wOurDpbIw/pFupj7o1myvx
         jPlpHa5IIfh/jY0YLGQORdzKmktx6ohVLAT7yafxL5IOxQ+oFJbLvoeKf8ysTHXSevfz
         T/PCEkorLLeytojps9mKpMvXUeKVXfH0Up/dyV+1PwOYZM2+mzrKOaRxJCylPP5hE8a8
         IQd3PVHW+XRf0W25EbXRez4OPc7O/7ZAbVl5mwHD+UZz4z429BqQ2FmVZ79sVVpwqNgQ
         kZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792131378; x=1792736178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pI8cU+3Va0VJY6BQ+e7sBVT9LPRu4J+OFo4gOdjLJ30=;
        b=ARrnsXJmyBqZrw9SGyh7Mwyt8Oy7rfxkzN+cJU0mZgpqgeu+VosTP6lYigxflQsgWN
         hrZIUG9srolcdUMt+aFkHfURlc8/lY08cdHTGe1C6RG4ODou4SoLlbtwHaMkX+yctW78
         C9gp1it0epwakhsUP/DfMQeUVzjAOpO82NqwTLzq2FMry809+3h6zQ5hzpfAmlqTBVLE
         YY46TFGoziEqLZQ6/5YGaOKCV1j9lyN1dR91wjZsvPEoC6FAx9EkVxx+TjNrkyJDZP7O
         Nr4xbLaAx5CLkabaz8VTKMMbk3EXF5LAJWyWVlOea7StMZ+QhOS9+J0DKVCnmcLviKxC
         xsxw==
X-Forwarded-Encrypted: i=1; AKwUvBz7Wd7uDnOQA0/noVPaZv5mb4Wnl9TWmqnsS/p5s2cc/Wcb2mmbsU0e5PEi9ddklVjtoo16f2wmF1Kc@vger.kernel.org
X-Gm-Message-State: AFq9FYJUs8BMmsimKMeZAlloNb7pxCWU5TaX9l6KrGL1WUJI24Y13YEU
	oqyel/NrZu6pvaydlw6E5AoqVk48Ps7/AyFIyeJKMwRgVQ9+uZhk4sTu
X-Gm-Gg: AYBFou33uD7q3sywCX1CFU+atbgNZip5Pt3ORLr9wDt5Sd5nB0a37+ItO/MJNW7zzhB
	xi4uak+XMWPwdpMzLLeVpj5xbXsvDu1rybvyDHLnRBFiMW6IJLTKcBAWZBaOgytfcHVCh3lL8np
	oKD1C9iEr9npX4rBCIOpn/iVyZyXSaUdiZsmgzcNGVSPJ4oH/waNzdDKbtDBhe7BfSka1JaMGal
	8tTjlpfGEwRMF/P7tbZhWGaqjJoCdwWBBvkvjDUZ7Mv/2pVmN8uezS4/etBrd/oOGhSzf05VyHG
	Rmx80dTgtepwh2oG8JNwf63Bfo6TrjzCJS1gqGOV2ibw1mWWum68t0k5RcqJPpYQsLGvKFcm2Df
	pS8YBE3AHyIKmue/ephHvGT+R9yUsoAgcwHrkova+B7t+O6O0LTchdrjrOhoWo27TdkPvliHMrU
	jRdVR0Pcw2yGGZIbuvhfWJS5/CS1GWpE4IPgzX0xyKc444Bnu7zW4VTem/pey5kKQBy4B3BqJP6
	W0C0MiSff8=
X-Received: by 2002:a05:6a00:2996:b0:878:3538:8f7d with SMTP id d2e1a72fcca58-897c79d707emr18459260b3a.43.1792131378226;
        Thu, 15 Oct 2026 23:16:18 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57b334e6sm586375b3a.42.2026.10.15.23.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:16:17 -0700 (PDT)
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
Subject: [RESEND PATCH v8 1/8] riscv: build crash_mem ranges from memblock instead of resource tree
Date: Fri, 16 Oct 2026 14:15:42 +0800
Message-ID: <20261016061549.4181390-2-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016061549.4181390-1-chenwandun1@gmail.com>
References: <20261016061549.4181390-1-chenwandun1@gmail.com>
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
index 62a4be0474e3..529310e3ae1e 100644
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

