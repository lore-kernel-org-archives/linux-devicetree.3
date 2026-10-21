Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571461;
	b=5Y+xJHD5MhmVJxruNmCUrX7LvIdvwN2fMAeuwczryNEPV5c0bNY0w3S6TEi7rSzhR6/k
	 mZlSGxw6UALfRfjfzOKY8OhP6+sDxxXmeYgHCgMXMgf3ByYJvf/bi6OFr0+w2uyFPVdPZ
	 +hG1e3xidadni/J3EFeQMuNRcB9a0BCaCkqTNHZUluPBCXY8WZ7i4l+J4KrLc3Sccbm9o
	 1uKaDusrjmS5ztvZlmDZ2p6wK9LH2SbW3YvqX1iSjkZInRiVcDuFgkD1JHWeVrmkdJrI+
	 CUwugI3SpiU8XX+OhF+9+SIxmyOpqfKZIChbjPb5tnR49IFC1K0um/ekB50gtjGWdCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ChIsG9Vgmjf7e0EG0U79egn378mU9W7gdCp3fG4lF2s=;
	b=zwRe9ScR+gmv+cyIX56RUlRs32qPATqPaMo9x1ZcW8bqUFVXFGkXiG9EyjSEBnaoqb4h
	 m+Rcx7CDVKP/ke/ecRygStitkN/CjAE9rk24Y+zkr9K4MCdOdH2mM2dwhbnvyIXocUacP
	 OeWpsrsPdU3XhpiXF1uCofT2avjMDzqq5J4U7nemrOcJbJNRI6opdPmbUO/3/yqvrjBdO
	 saNA5D3PIB1lgS0xzU7w+/7fqVdktHGUT4Bg/j9Cjrannc6UbqVmZhrNlXDgFa6TMbL0M
	 ZTHecqtOeqcVpbW/I5oNWUWTu3B55HDj7qkztEqcN3qu/nG0I+vwlYxn+C3Op/VPz0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kJuSAvXT;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6568606A321
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:31:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6568606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kJuSAvXT
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3acb41888c0so47609a91.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 01:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792571460; x=1793176260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ChIsG9Vgmjf7e0EG0U79egn378mU9W7gdCp3fG4lF2s=;
        b=kJuSAvXTi3B4gX6gfYea/KRh7MzTjs/rd7yvjnre3ZloU3DOrnB62m3OWQhBOdNqh9
         u6Ckc8iWOkFNEKYCqSWPmdptk7YAB81eCjbictbb37fV9O0PnKLuIUo/+Xgs9GBvq9HN
         aKFQBU533Al8J6g0FO2YbBF0JNHWAB+NbMu+x2FlntVuVccFnIVHvmfggmI9H1zSL8iC
         h4aCixTMVMM50xX6IYW6pk2VG0Jc8n3qO8QsHRM8kZuLi3a+JunaJ+p6kGxwiQ8yggys
         GY94Ajyy41V6pjo58rcQd/xZCgMnYAHneD/y4I4vAuRIO+/AfZrqLX39Yfi+f9u1kGyZ
         t0mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571460; x=1793176260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ChIsG9Vgmjf7e0EG0U79egn378mU9W7gdCp3fG4lF2s=;
        b=oi1wXXPH3NU9fk23VznGrLUuKAvVFhnGTIobP8G2ltLCZJ/qVldR4jkqNiUeWJtMYb
         fr532F5O39Jw9J1JIJp/j2ygh6K23W1jtkMMenB1YMCxDomeQBMq9QvkEQ/tMa420ZMd
         oeW8sS7xcwREtrBPJ9pVVAndhep84i8as3fKHCGqEkO+ilRY8Iw/M/hXRt+03ux736RY
         tG4i1Je/REA+Rpi+GuJkAoGwO/Ts0xH8tDOol4T84oF6SPrrz42XGU+1B+rTIQdxwHRn
         fw0VqOJRxFA2YfhcztMqDzxY5VJ1f53CfTl8PtlORcANCssN5DHRkUrwzSOuQePs+UKK
         tyEQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvDlZv68MAtWDD9zdkE98OcHVWUHI+rCzrfUb+10hWSsgr8yPmfUftqCkgwcSkVIcJQHT0id6Z0nQO@vger.kernel.org
X-Gm-Message-State: AFq9FYL814pK8Vk9IwsgqDRtoQK2G+2ts1bkNDbYmvvIMGwUIRfd7KDk
	l92fbKQyS5uxK5EoWcoQeQ9McVqzx+hcZTRrjN4GCDWAwAH/dSC32B4O
X-Gm-Gg: AYBFou0Ux6FU58tqRm32eI7oGYzmxDK6qhaf0s9hwAWQiutugxkyocKPKwxLvS+qGbC
	u8QxRJ2UtUjo8AwqwaEGr20VZNsODNBYPfja1dZb9oJuIybklTN4088Xyu/zSoMvlR+Y6B4DZBl
	u2mA/YlfNmf2R6jD98PTADSE5EO0ITUtfjt1RDGLY3dEG+6vGbU3Ula9mrPUPg0X40wNSf4WS7x
	LpJ1GYPfa0TbU/OFbqGVZOhbXOU61yPmUD9vZstcR7irtUBOtzm5vo/DiEYP89cEPZWKBwo82D4
	JnBVGD28dHNybDpcNLPLdmL5Vpo1o3NTHGTCJUZt7KglWeXQA7yP5dcTTUKdF4Bkavugaf7BMGZ
	DbLSaU1CT3cWiRFDWuWkw/63xsMGSk0Bv5DpKR+yrS3kDw16nqGEQaqVa5AbHiUtLiNTZCf1TQ3
	65MZo1kPH42nqTm5Y55RK3nDmlm+VoHxcL+nsfTmpo/PWJlkmVMo+QfRQFbYTEjaBdaV19QUkbN
	P7OvB+nEMSOkLyKagBqlq2bBxvRaeAPWzWrcN6Z6qyb3c09ZZXXtiw0c9/xVTwqq6yK
X-Received: by 2002:a05:6a20:c78d:b0:3de:48ab:3b90 with SMTP id adf61e73a8af0-3e287d66c98mr907694637.26.1792571460149;
        Wed, 21 Oct 2026 01:31:00 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895e273bsm600653b3a.41.2026.10.21.01.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:30:59 -0700 (PDT)
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
Subject: [PATCH v9 2/8] crash_core: fold duplicated memblock arch hooks into the weak default
Date: Wed, 21 Oct 2026 16:30:05 +0800
Message-ID: <20261021083011.2170525-3-chenwandun1@gmail.com>
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

