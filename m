Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.202
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770474;
	b=tWmwiSztGRh16annsHpRO5SzgqgGVM/Tr/+dlQIeMfTbMp5e9QtY5D8KOR+dPELbVsdQ
	 e0FxV3puoSR5A7uZZZOyUE2hlrmmyS3jDzBsUmAhUVFb36neoPWntPDUP6NQHJkRg4qXs
	 5SKlsgGHLOpn+wLhX1vIqX+rMKwveqHLe/QIvJ0l3sEu4GpU/7nPl4dD/rAwrcQcjgrpK
	 8tsrwV0p5ImEjxcscAwUkAiqKXimdq87/1rnD8Aku2RYtbNJCKxQTTyXOccKHN+VGrfgM
	 vVAQ6zmUUxziz4EManlLb3dmacv8pUATrA+k2NBMHNI6zkAQQ8YNJ+Y3bWw5tkcAnjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dn1PH2ygUv/59VEsbUK76gNJjYdjlSTbo9l6L4HVgfw=;
	b=0x3pI+7T8FtVggFiGtK0oBgiYLDiy3BGjls6eG5a9i6Y526BhUx2rNhBxPLB/Qd8gbgJ
	 OH/abTGVrEqqL21NNRyeWqfMd3qMervrquZlWAL/zo1zcCR1g2HJ68UlNggnPkXgCJley
	 6Ygr5/QXBrV3Ik9BY6dFAxXOb/DwLl+HjLyNPWjKgbuD8iK3xllcycmNXgrJ9mx9Br25a
	 6Om6w24DvVmhoPqdWS0b0em5PiHSTKbmGI0oxG1ryBU/48qPOwSZ4fYlO0PmIhlubOUeS
	 HSBZ7VkvffVneGEbSEjrULvpf9iMsg4DwmlX50YNxjunMluAAxxz0q5w3P3eZUQ081w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i4ohQFZ1;
	arc=none smtp.remote-ip=74.125.227.202
Received: from mail-pi2-f10.google.com (mail-pi2-f10.google.com [74.125.227.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204E3606A323
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 09:07:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 204E3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i4ohQFZ1
Received: by mail-pi2-f10.google.com with SMTP id 41be03b00d2f7-cdac0ac5f19so3860069a12.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 01:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770473; x=1796375273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dn1PH2ygUv/59VEsbUK76gNJjYdjlSTbo9l6L4HVgfw=;
        b=i4ohQFZ11L1fY4R3zHgK5pB6C7y9uR8DJj1aJsFKzbKFo+V6sNKht5dbq9wAPMUjTu
         CLvF+t0HIxhRfwdlVRWMmuiIwRjIW4w4tEiv7MYTczuyOUPkx92NkdE46x5rOQIXEUyB
         eXhT2XacgtgeBEZfPrmX4GEFt481BXkAAkYMnaCnbP0nOVyunKKHA6o7m9zKxPCBpNuz
         4ByeuuHR1Uxs+V6K9wOMkfx1fPIpALl+iOdUZTWtO1GvJn0WAM69oj4ykahjgcqx2/+Y
         HFWn7EYVttYgaMSGU5s6sdrN0cr2775WhOpeRQqasGAiZynAHZIztpA6LYKP8kzVVh0D
         a+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770473; x=1796375273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dn1PH2ygUv/59VEsbUK76gNJjYdjlSTbo9l6L4HVgfw=;
        b=TFLWwBT7JGjkD1OHxJu42ajJEBTPVyjO82ZKw0vICxylBAWrBijNVFlh9RS3B8gKuP
         PKVVbwg/4UsI2m03wnDSFNktVO6q5ZU/tlxRc/WoDZyVSoTu5vakD2JBJYat52KjmfQf
         h8f3NuxCcbWadxSJ80cw5AtTn+jqRhsgUKIqGfYUe3usC5Nftqio55lnUg8MGuCcS5sQ
         xdHVRCiau/1NbgkNfhwAQja55anuMLP6c528UHYEvn0vhyS886b/dMqg3ylcWHq22l1D
         zgzUrql97eAGo+Pqa7YZiUEkR+fN7BP7/aNlN0Fhkdb0juE3H4K8plwHt42xjLq0dM7c
         5Dxw==
X-Forwarded-Encrypted: i=1; AL+hErGqqWXEL56BuoTDYpzjfcPITsMnhFpT5mRqmg3Yk2wUbeZNGOJiFnXjX0txT0Guqjj0SOG1JCoKbrEo@vger.kernel.org
X-Gm-Message-State: APuU4Z87keK1wlNi/dsVBYpOWXSUdW3pfPuqkCrNuL5Souj/rIUXm2gm
	hdFoTTlHb5T1pvJ6IpFWLke+q0DQlYsyfpDO058uNzZ8byUW6v62G4Pl
X-Gm-Gg: AZFdTZcxZBUN3evp5ynvzNZdzghA+Lcn7gYPSyHtKPAxc7vTyrMVD8zucr00eAGiGOB
	AbUhHyaGJnX4DqLVJeLJ01dI+a2PBLyboDqjcJeIuvkhnLs7ZM/HLNKDCnDs53kAUvVcE+Z5DPm
	lLUj2RMkYZWMFeylVdHdkOT1bRi1Ym7+e/lyqDR/QDT/QJ8y7WyGUpmnZ8otlOM/bQSOEJm82gk
	VvuF9sm8qJd0gcAzNSH+P9eeb4clKBuFAx8g/J15F8DzrPwUCF7sztiblWDDlRcEFXZ71QstRpl
	w7xDCPLGs1wF7BbUb1D0Ltq9NbdyBbliQpMDUaDQtZBOsDNx5EaSCRcrDPjheG0vVhS97VlQOS3
	Z/dFCqjUbkPilCuVasP9ToqPIe0ppm7pJM332u9kxG94bO/IS/h79u23UrXGwVc8v92g4cezv6F
	SYyyxF0uK3IilTx+gF5smUePq/+bDzCGDfcUcEEXL4Y/GYlrxBOWSjK1ZIDyrqy3BPR5Ca9e/c5
	Hv515P4Df0bMzPYdde7FA2/pulksVe2IQ9gPCgTHodp1r65lx86yR0OfmXoz8goUYlKBXX8M/6G
	Pq9D/EWA6HHtzURwG+TFthepb2yCbAhnNs0iwJgGVQ==
X-Received: by 2002:a05:6a20:7c20:b0:3de:557e:5ea6 with SMTP id adf61e73a8af0-40283cbd05cmr14085693637.27.1795770473349;
        Fri, 27 Nov 2026 01:07:53 -0800 (PST)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d06ee37sm11718725a12.28.2026.11.27.01.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:07:52 -0800 (PST)
From: Wandun Chen <chenwandun1@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
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
	ruanjinjie@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v10 1/8] riscv: build crash_mem ranges from memblock instead of resource tree
Date: Fri, 27 Nov 2026 17:07:16 +0800
Message-ID: <20261127090723.741253-2-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127090723.741253-1-chenwandun1@gmail.com>
References: <20261127090723.741253-1-chenwandun1@gmail.com>
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
index bffef6b903e1..0a426475a9fb 100644
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
index 26cd2a8bd0cd..dad7f02365d3 100644
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
+	phys_addr_t start, end;
+	u64 i;
 
-	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
+	for_each_mem_range(i, &start, &end)
+		nr_ranges++;
 
 	return nr_ranges;
 }
 
-static int prepare_elf64_ram_headers_callback(struct resource *res, void *arg)
+int arch_crash_populate_cmem(struct crash_mem *cmem)
 {
-	struct crash_mem *cmem = arg;
+	phys_addr_t start, end;
+	u64 i;
 
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

