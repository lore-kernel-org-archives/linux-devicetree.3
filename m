Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D373D9548
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 07:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788334334; cv=none; b=TGijABgl90meSqdkG1LObhCFTa1w40X1/BOBZcgUrdPTDlf7cveflcMPlQ6vHezo2nsNYthrEnOxSGlatDwjNLTu5KEGt5JuuMgEwkgBUKPCqGRyvThZ2ahRG+q6KXcTljaWChy8VrrjQsrqxKv1iXIBBQF3txeSacOPpIOu6NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788334334; c=relaxed/simple;
	bh=Uy+S5EN2uCcSnsThdW2ceNI4zRwMNv9qI2gNHXNwLyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S6fnF6LkqnN5tJysOhCblQqqwgwBVCILHxMN2ln2Qg2X29RcnV/qRviMBS3Z8KtevdpN/60wrfulLTBqSXlM4djwKcPhB1dxJJ6dtv8qSL0LzU6H3UIn3MIUCjbvtibzXnrwm92OOYzH3kUJNA7vJF0OpbBTAGcobzNS2xbPjpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MgMHowmM; arc=none smtp.client-ip=74.125.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MgMHowmM"
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-c9fe62e0da3so237169a12.1
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 00:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788334332; x=1788939132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+1lPJGPvZxlgDVbSkkI+j7mcGDHCDt5YKPntydBISgc=;
        b=MgMHowmMBsEAGFoogMKJoqUGg2VcIbQlCh8XXma75Pt2oZKfA5yJYIclQRyyBJlhkY
         J1g+l74jchnaJBQNsMaeBibPpgK+5dYGPCbeoIfYQIVfxYkjTALFHx1lJUD5fmtoOtcW
         KdUyaU0A8krX+R1jloj58DC2yHsbVZzTD8K5Be/i8h+En3MQH9HGXMDQS5kgOMB/0zsU
         0mnJa13M3K6x6hs/U3cwKQGoi0ZRs9jcz81xeozLGNocwQdvsUXTNfMQ/n/QQ3YCHiP/
         g0MK50ms6HAv31ftQuVKU+R7l3s5hQ9nkPvzTdjSr8amUxqgN/GVkRxL+aHIW+WL0ZIG
         pJEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788334332; x=1788939132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+1lPJGPvZxlgDVbSkkI+j7mcGDHCDt5YKPntydBISgc=;
        b=IB/KofSwtIIhtl/QXvcAVRn97vEO4eGC5UnYMl07GAQiwRizzGjEpy1Zq5p3AXuS5+
         e38/stfjWr9ikvhry+6bgLRDCxH91dUCka1fyxpDTjM0ltJFvJGv11wCkDIfgYPeP3Ij
         TlB4G4n5sqrFfLoRtW4+vi+XfXXGCiMrst+ESfaC8Nosg/A+dHIGuf8rWemuFmqMqLgE
         D3k7SZUdFwaiVj89FNI/iisRKFyEuhDU7xe2wE3sdo+EDmkS+enNUTWUW4TEALie2zLG
         wyY6G/Q7duEQ3CX1H3M9KlGfk+FMMowiKpKguvR9Q92mcCUpaOygCKizpKVbkNt9PjFC
         57YQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqkp2Xd+E+JoltO2Z2OXIYFiMIz4OHw+eSgJ0cXzH9CpG4LzcklCIUvvrs8QUPRvgcQxn51uT7BQwb@vger.kernel.org
X-Gm-Message-State: AFuF++l/wYC/7hMKProJQt9ZYhMz1uxvGD6J3NnslBnb6SiIyQXpkhtg
	wRWp3pr4UZ64QmipWgKZJYTVNaTyRskIecjCRRNM+SaiFLaq4T26Dtj2EPdOtj7Q
X-Gm-Gg: AYBFou3O/0zekFJ+ssY3IdAZBvlLQyGUgde5SznDEjInWqVlLDylO+V6w5HY/++quCD
	lZHeqbCLOXkokYo41d0atDI/094fcDToOXLQAFql3A+dC04UdO3smAvt+6sazQdHS1da97wY3z6
	jXeRygIBoN2CD00AfvR/ktzfGQL1E/YDp7dFoOpgeDgDVmfEhaibY1jvUICB4W54K6lE7mKiSxQ
	iL4lSRlltHJb84FLLAR80gXCnI9kCDU6FJaFwqOq1Rki1bWCb+oMcsnXVxTx7zwQ25/cnk4scom
	Sp7feLcT4kvN4dbun1moshDSvJv3rjTAHTWGTNMSVIyyLnItrcJyS2DAwLTG/s9B9pWH/pPm2Yl
	vHQvG2gTvYmYWqznQSOkcFD8rqNGbl4oqMy22wEJ6t386FFGJIPqrMdMjS/McOVr06YhSa/I2Hm
	L1ThjpApjOuRAK5lk7/3gI5DmnkMowqVT7YGqK+1CXtjwNumTQsbsV5bC4ZldA7ZNZu+xpw8z/k
	ZxeBtBz6Vc=
X-Received: by 2002:a05:6a00:1c9e:b0:857:73e2:9104 with SMTP id d2e1a72fcca58-85ed94bb41amr4709226b3a.20.1788334332169;
        Wed, 02 Sep 2026 00:32:12 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db2adcbedsm926914b3a.20.2026.09.02.00.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:32:11 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	m.szyprowski@samsung.com
Cc: mark.rutland@arm.com,
	kernel@xen0n.name,
	alex@ghiti.fr,
	hpa@zytor.com,
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
Subject: [PATCH v6 03/10] crash_core: fold duplicated memblock arch hooks into the weak default
Date: Wed,  2 Sep 2026 15:31:09 +0800
Message-ID: <20260902073116.802752-4-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902073116.802752-1-chenwandun1@gmail.com>
References: <20260902073116.802752-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

arm64, loongarch and riscv open-code the same memblock walk in
arch_get_system_nr_ranges() and arch_crash_populate_cmem(). Move it into
the __weak defaults in kernel/crash_core.c and delete the arch copies.

No functional change.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
 arch/arm64/kernel/machine_kexec_file.c     | 29 ----------------------
 arch/loongarch/kernel/machine_kexec_file.c | 27 --------------------
 arch/riscv/kernel/machine_kexec_file.c     | 26 -------------------
 kernel/crash_core.c                        | 25 +++++++++++++++++--
 4 files changed, 23 insertions(+), 84 deletions(-)

diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
index 854d872dfd0f..34d944d3f22f 100644
--- a/arch/arm64/kernel/machine_kexec_file.c
+++ b/arch/arm64/kernel/machine_kexec_file.c
@@ -14,7 +14,6 @@
 #include <linux/kernel.h>
 #include <linux/kexec.h>
 #include <linux/libfdt.h>
-#include <linux/memblock.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
 #include <linux/slab.h>
@@ -39,34 +38,6 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
 	return kexec_image_post_load_cleanup_default(image);
 }
 
-#ifdef CONFIG_CRASH_DUMP
-unsigned int arch_get_system_nr_ranges(void)
-{
-	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* for exclusion of crashkernel region */
-	phys_addr_t start, end;
-	u64 i;
-
-	for_each_mem_range(i, &start, &end)
-		nr_ranges++;
-
-	return nr_ranges;
-}
-
-int arch_crash_populate_cmem(struct crash_mem *cmem)
-{
-	phys_addr_t start, end;
-	u64 i;
-
-	for_each_mem_range(i, &start, &end) {
-		cmem->ranges[cmem->nr_ranges].start = start;
-		cmem->ranges[cmem->nr_ranges].end = end - 1;
-		cmem->nr_ranges++;
-	}
-
-	return 0;
-}
-#endif
-
 /*
  * Tries to add the initrd and DTB to the image. If it is not possible to find
  * valid locations, this function will undo changes to the image and return non
diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/kernel/machine_kexec_file.c
index 5412aa9f3568..481b8f906a56 100644
--- a/arch/loongarch/kernel/machine_kexec_file.c
+++ b/arch/loongarch/kernel/machine_kexec_file.c
@@ -13,7 +13,6 @@
 #include <linux/ioport.h>
 #include <linux/kernel.h>
 #include <linux/kexec.h>
-#include <linux/memblock.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/types.h>
@@ -56,32 +55,6 @@ static void cmdline_add_initrd(struct kimage *image, unsigned long *cmdline_tmpl
 }
 
 #ifdef CONFIG_CRASH_DUMP
-unsigned int arch_get_system_nr_ranges(void)
-{
-	int nr_ranges = 2; /* for exclusion of crashkernel region */
-	phys_addr_t start, end;
-	uint64_t i;
-
-	for_each_mem_range(i, &start, &end)
-		nr_ranges++;
-
-	return nr_ranges;
-}
-
-int arch_crash_populate_cmem(struct crash_mem *cmem)
-{
-	phys_addr_t start, end;
-	uint64_t i;
-
-	for_each_mem_range(i, &start, &end) {
-		cmem->ranges[cmem->nr_ranges].start = start;
-		cmem->ranges[cmem->nr_ranges].end = end - 1;
-		cmem->nr_ranges++;
-	}
-
-	return 0;
-}
-
 /*
  * Add the "mem=size@start" command line parameter to command line, indicating the
  * memory region the new kernel can use to boot into.
diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index 808e872f4063..fdc6695e8588 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -37,32 +37,6 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
 }
 
 #ifdef CONFIG_CRASH_DUMP
-unsigned int arch_get_system_nr_ranges(void)
-{
-	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* For exclusion of crashkernel region */
-	u64 i;
-	phys_addr_t start, end;
-
-	for_each_mem_range(i, &start, &end)
-		nr_ranges++;
-
-	return nr_ranges;
-}
-
-int arch_crash_populate_cmem(struct crash_mem *cmem)
-{
-	u64 i;
-	phys_addr_t start, end;
-
-	for_each_mem_range(i, &start, &end) {
-		cmem->ranges[cmem->nr_ranges].start = start;
-		cmem->ranges[cmem->nr_ranges].end = end - 1;
-		cmem->nr_ranges++;
-	}
-
-	return 0;
-}
-
 static char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
 				 unsigned long cmdline_len)
 {
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 2b36aa9fade0..77285ae3ce60 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -281,8 +281,29 @@ static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
 	return cmem;
 }
 
-unsigned int __weak arch_get_system_nr_ranges(void) { return 0; }
-int __weak arch_crash_populate_cmem(struct crash_mem *cmem) { return -1; }
+unsigned int __weak arch_get_system_nr_ranges(void)
+{
+	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* crashk_res + crashk_low_res, +CMA splits */
+	phys_addr_t start, end;
+	u64 i;
+
+	for_each_mem_range(i, &start, &end)
+		nr_ranges++;
+	return nr_ranges;
+}
+
+int __weak arch_crash_populate_cmem(struct crash_mem *cmem)
+{
+	phys_addr_t start, end;
+	u64 i;
+
+	for_each_mem_range(i, &start, &end) {
+		cmem->ranges[cmem->nr_ranges].start = start;
+		cmem->ranges[cmem->nr_ranges].end = end - 1;
+		cmem->nr_ranges++;
+	}
+	return 0;
+}
 int __weak arch_crash_exclude_ranges(struct crash_mem *cmem) { return 0; }
 
 int __weak arch_crash_exclude_mem_range(struct crash_mem **mem,
-- 
2.43.0

