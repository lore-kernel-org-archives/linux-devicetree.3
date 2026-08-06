Received: from mail-pz2-f0.google.com (mail-pz2-f0.google.com [74.125.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719C5436361
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786008999; cv=none; b=erux7K5KXukYsC71DhIxcRanEeUVqBZKes/xTWF2f/Jsoix1b/VJCyzp5oXUA0ntwDCooco0XS7PMHDXYXgntrzAcmp/YZfK/vzU4Vd1QKWbx6XhEd4FJq8qmHKfUt6CmGOWHXT/EzZXwjAD60OeQIa/b7YmYryNVv9nsqwHpg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786008999; c=relaxed/simple;
	bh=wy05bPp05mHS8vyW01X9jptReYWXDYKNhtr1n2hZSC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VoQNX5TAooToP7jBvLUWQCLWWoArftHcrnZV57IWdYTGJ+UBSgRCUCdsz853zVq0QNdSYDyeW3iTqf3o+Wu0gB39yll930vooNUU6WI2uL9Y099BhnwJIy0LAzBtabkxprrK0b4wcpM4bNfvtRX1LRvF45g5kYiJknlqFue0lAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQPgddWH; arc=none smtp.client-ip=74.125.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQPgddWH"
Received: by mail-pz2-f0.google.com with SMTP id 41be03b00d2f7-c888c001628so1207862a12.0
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 02:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786008996; x=1786613796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LuSw8PyHR5EplcrqG8+HZ+85Dl0Ckz8ecCi5UKpH+2g=;
        b=jQPgddWHgO6IhUyhsA4JBWVs5aYs0P2nJGuhCe45ZC7ClqQcBYOtwOb+I+RWEENDCp
         PqQBCkx2IaBgrmP4PEiP5O/RBkz/0RHj3iOFC6wndCA0IzlKQ8/wTPm41mXPBylUzJaw
         /r+cdFeOf+09NHQ9kiZ8Vs14SS6FMGPOeeto43n7cNHs9ZK017QR2psUYxqqaE9ldegu
         1F+nrGpXTWJX+7WLdpm84P8nasa0Qu3qSf2l4FJy730C1W6kPhJp/aLXNqpFAPfY7MdL
         GuReDE0K4XjfsCM5r5EdS7MfpLfQIUCC9K2UZV9Qy9B+rZTGohv0/ZCKNwYgOEhE9any
         lWCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786008996; x=1786613796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LuSw8PyHR5EplcrqG8+HZ+85Dl0Ckz8ecCi5UKpH+2g=;
        b=nZN4CEwtuwEoFBSTlX6Dcw0Q/vnLPhXTw6qRNJ5eap+pdHFsLEYkhvKzH3yWNHVr4U
         9PxAfPAbZJlxqxd08u/Y5ksyje4TbmXIxwuzOx1idcfPEupatlJKiFdjJTsyS6DQbNeu
         XFQMfEsF42Pcr4KcnrJlWq1r8nSQpCQHlZfU85OgtAuw+QOb82hkkGtoTKwnh86gE3WE
         FURiTsd8S8/NtpXccF5UdDOfeTyAuy2KBmdnPX0cFHoa7uyDTgjXTkzGWtpZbmci7ouo
         Zr5WUlVaQ0AptV1etA7dxSdSRz4My6ZOUi1RpmrpFy2Rkl5L5fwn0sHfpIZClOyk+4Rr
         XgQw==
X-Forwarded-Encrypted: i=1; AHgh+RphT++GWO3/7p3KwAylR85lLSZzvd+5UGPQwiWvcf377vhA21vSya79CALBbdMQ2jOsnx/5HRUKik5Z@vger.kernel.org
X-Gm-Message-State: AOJu0YzzZD6Am9fiVtc63oKg7bAO8GYKtZPXSPbRb2kmB+RgNDCiKy3v
	OHK3OoEhtpXuGqgOtMexAv2upxF86dwFslitlz6cJrySAoawMqVk4rHu
X-Gm-Gg: AR+sD11ziWPCn5u4oa5AlVlxEVeH+iM20F8IK+5PELqetjBAg5ciCsMDP1hGSy8XwEb
	6DWoybxyDgqbD40Z8hwpr2zggFgFHEkwoM5Th7X8iI8S5iFQhChi+N4NvPX1VKGN/wG1jA475nm
	EhUcKYkzTuybZrDHnldwNgL4i4Y8ihG9Gk+jZHQsvYpDCinGUP8hLJeBk0xPmXeNgcG3olBwEG0
	QEijQiC7BJWut1p3m6IvJGQnYGkuUsyAGlLavqCthxZZt7stsQjom84bR6Tu9d17pJhIsSM2LbZ
	P4l56ibhZIPGTxVwYjtjVqKEAmRVALN+OilMKJPbpN5GVL718+NmCjTXsy/imS+wNkdudxqgyG5
	EpaxSjJr7f5bJ47gF1wKluhZLK0KvrujBcMzfE7ohrxgFjNMaP7U87rXuNKL/HuvlsBsBbK/C6d
	f510kHKuAykVpURUymxBu9OmiIr5/absTNfW44flId2DW76k0qGZhdrVW/0VUVpzXLid/QCkZR2
	g==
X-Received: by 2002:a05:6a00:298e:b0:845:dffa:3740 with SMTP id d2e1a72fcca58-84f2e0151aemr16066036b3a.4.1786008995542;
        Thu, 06 Aug 2026 02:36:35 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f453b0aeasm1043878b3a.13.2026.08.06.02.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:36:34 -0700 (PDT)
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
Subject: [PATCH v5 5/8] riscv: build crash_mem ranges from memblock instead of resource tree
Date: Thu,  6 Aug 2026 17:35:16 +0800
Message-ID: <20260806093519.2907771-6-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806093519.2907771-1-chenwandun1@gmail.com>
References: <20260806093519.2907771-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

Replace walk_system_ram_res() with for_each_mem_range(). The
MEMBLOCK_NODUMP flag lives in memblock, so only by walking memblock
can the reserved-memory regions marked MEMBLOCK_NODUMP be excluded
from the vmcore.

for_each_mem_range() iterates memblock.memory, which is freed after
init unless ARCH_KEEP_MEMBLOCK is selected. riscv needs
ARCH_KEEP_MEMBLOCK to filter reserved memory from the vmcore, so
extend its condition (ACPI || KEXEC) with (KEXEC_FILE &&
CRASH_DUMP). arm64 and loongarch already select ARCH_KEEP_MEMBLOCK
unconditionally.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
 arch/riscv/Kconfig                     |  2 +-
 arch/riscv/kernel/machine_kexec_file.c | 31 ++++++++++----------------
 2 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index ef1101bec76c..bd8726b4dfbe 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -57,7 +57,7 @@ config RISCV
 	select ARCH_HAS_UBSAN
 	select ARCH_HAS_VDSO_ARCH_DATA
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
-	select ARCH_KEEP_MEMBLOCK if ACPI || KEXEC
+	select ARCH_KEEP_MEMBLOCK if ACPI || KEXEC || (KEXEC_FILE && CRASH_DUMP)
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

