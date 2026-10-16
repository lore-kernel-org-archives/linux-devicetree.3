Received: from mail-pz2-f2.google.com (mail-pz2-f2.google.com [74.125.228.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8463AB27B
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 06:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792131393; cv=none; b=i6Lf54I1pewwbnVmY6b5qmHZoTmxpxNkXjib8oWwWNu0yBjobb6TjXS5Ohs7H06K25DfayhsZDFDYZCI6bHKiClWmjR4xu+icf2flWNEzMnvw3VrQxiVwlDSumRD+kqBbtkOv7DK+UlKAE4ereIFzj/b5h+ATkA9Vj1AHMN3C38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792131393; c=relaxed/simple;
	bh=XLWTvyCPrvBH6IrX2SQmS/lbWi/l2CNUS/x21NzD+5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dl1FQmCbIFNt0grorN5OQ6lEnz6zs5hy9fb/cfttzHJ4RERI880Epf5g0RnlrJ3urZV4R7H0k9Qwut8GxuR9+CerkJkHzbiugkMTHv+nMdgpDB7L1Fmtz6fPxCR3k8bG7QGUppMXFTO1h0yUDoeo8xK/QrvXTpKTAWtq4Z6I8xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nulv1CVc; arc=none smtp.client-ip=74.125.228.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nulv1CVc"
Received: by mail-pz2-f2.google.com with SMTP id 41be03b00d2f7-ccc451ef3a7so604410a12.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 23:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792131391; x=1792736191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ChIsG9Vgmjf7e0EG0U79egn378mU9W7gdCp3fG4lF2s=;
        b=nulv1CVcRj6ZadP+Em6RYqWyLh0A1hopqGrO3X5H7C7i80FyiEaaAZRtNJqEvl0QE8
         B1SPgfa9vz7TSmUPkBxqtyUc/JSNBFYH/NFGrgFzv7l53Dpz+VL/2oWBzAamGG60CaO2
         3GOq4NjAUZCHWgwrIzf53pYYYOhZLpKAYc8KEgZr0ZGgXpjrKm+fdCaMXc5MDzLuH1e1
         WOBPdwyTOVFoA1MCCze8G+hpKKS02bkMHoJid4E+dqhno7OBik2UDbfYCDVgSqgG8eXj
         QvAHwgU28UknjHd1Bq93WDYWe1/nOZse5M7z2fIjAJsrNBzpD0/bbMci+w6iUhbPONhF
         B8oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792131391; x=1792736191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ChIsG9Vgmjf7e0EG0U79egn378mU9W7gdCp3fG4lF2s=;
        b=p4bM7cCt/cdisamoxG4DzHTy5/py7T1Mo/0rwVFCzRwTNchTVzQ+02kAxgew8wY8Tc
         vlx/2azgGOtNuSa5zfKueI+c5eNL2UPjFaEKG6iHi6/SwMwtBJCneRmP3qs942WmU0Ou
         Zx84SWNA01PQjut5mjf++8lO9bgmDAvmnl5CrkQFIBa2MoVJlSve6tfuyX3eoKe9wl1K
         jFNWVy9TvzpS1GC/Qurc4lRc1jsre3Z0uburBQHNUhbwJnNrUKGEn3qivlcjKQ7WZeON
         MQH4bX9lZueRWwX+TJv3yBSzbMTGSJ1/uzVhFt/YfUpU5K5BF43tyfI9BnI6kOzwUorG
         wlDQ==
X-Forwarded-Encrypted: i=1; AKwUvByAs/ArhUasrGQJYigCxq74YUsArQdN/WXyC2REX5JzvVrmCCij9uvZZ1W97LKERsEKO+/AdzPDM4Pv@vger.kernel.org
X-Gm-Message-State: AFq9FYKY9OAjgqfNPoNqpmeUItLkwHWeqa2HUyiXD22O8k0AHF71dQpJ
	Q99obKiN2+g1ueLqdQmunvdMp/Maip9mvenGYb1RnDgUHrUTZDryjF14
X-Gm-Gg: AYBFou30MpmKqS05oucb3w3jtI4lc36ByYi2b06nxA2VXvhyAx/svCVHrUGJ8Jp4w4E
	s3+c/LZ6n1cTAjoEiuepCFBdHtLv0ar1kx3TFEqf5L+TbTOtWpllQOeEoeia9YJG5a7l4wz64os
	WbEfs8Kyt6H8u/eJ4/NesATsR9c/xCRA1/EMyB7MY91lgqo6UFEo+uQTiA5QRpAFCMKZzzic03j
	ph6gdqxOe8tgNsL9B7f3RlvylCGvIy7pgkkalnwNGD380SaeVmAwvh0nmVDz0jA5rnuus6A/2Rm
	eJpmn04E7L3C7HTrJvOH26FEurYdWMj2Y8uQfKfM13Xm4i05TlzEk7LvvAsgrH3lA+kkMs7tK2b
	o3T9OgepVJn8hi8hO4dSn3yMkuY4qf/a+pXd5hO5vMpqN4HZUPQDvjgmOvOi3jqi/KWI209Pm8K
	2IZgCd7F0IKpcr9Wx7arStipLul8PsaBmIs7W5GmMIfQBhfRzcNhW5XN+omk0ai6YzQP92bs6Uz
	oeEMJVUgApirTDFZDiOAQ==
X-Received: by 2002:a05:6a00:99b:b0:881:5dcb:400e with SMTP id d2e1a72fcca58-897c8991295mr20719510b3a.56.1792131390645;
        Thu, 15 Oct 2026 23:16:30 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57b334e6sm586375b3a.42.2026.10.15.23.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:16:29 -0700 (PDT)
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
Subject: [RESEND PATCH v8 2/8] crash_core: fold duplicated memblock arch hooks into the weak default
Date: Fri, 16 Oct 2026 14:15:43 +0800
Message-ID: <20261016061549.4181390-3-chenwandun1@gmail.com>
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

arm64, loongarch and riscv open-code the same memblock walk in
arch_get_system_nr_ranges() and arch_crash_populate_cmem(). Move it into
the __weak defaults in kernel/crash_core.c and delete the arch copies.

No functional change.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Baoquan He <baoquan.he@linux.dev>
---
 arch/arm64/kernel/machine_kexec_file.c     | 29 ----------------------
 arch/loongarch/kernel/machine_kexec_file.c | 27 --------------------
 arch/riscv/kernel/machine_kexec_file.c     | 26 -------------------
 kernel/crash_core.c                        | 27 ++++++++++++++++++++
 4 files changed, 27 insertions(+), 82 deletions(-)

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
index d0bd2d0cf899..faa0f22dbb41 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -281,8 +281,35 @@ static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
 	return cmem;
 }
 
+#ifdef CONFIG_ARCH_KEEP_MEMBLOCK
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
+#else
 unsigned int __weak arch_get_system_nr_ranges(void) { return 0; }
 int __weak arch_crash_populate_cmem(struct crash_mem *cmem) { return -1; }
+#endif
+
 int __weak arch_crash_exclude_ranges(struct crash_mem *cmem) { return 0; }
 
 int __weak arch_crash_exclude_mem_range(struct crash_mem **mem,
-- 
2.43.0

