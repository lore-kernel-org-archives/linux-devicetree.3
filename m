Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770487;
	b=ywI/maD2+X5xfPS0CaP0grnvcEvGX51Wlct4aF79D4Hcm6JbeUZp2sGOu7ZglDjieMp6
	 HpfY8n6Zp/TbtRHTcNtCSO4e7K3kIgtcdglzcBbrR116MlLI5sG2sIDMk2hWDzeLMUMn7
	 Kjl5looJ66ziik85Dq5exr9Kka4wIC5cNtib+Um9jt4EHWG2Hiajuq6CszbzJXyetbmfj
	 0nfvrXct/R2exyDUNTMxip/DM5vmLVKpR+UWnSLaFt7u7ck2s/jzzwU/CIxJ7HM5cTNGm
	 0IB8eeyakerhWhFXYa876Lujch1pfRS7yOIh9GxZHCWqT3ldpLPmz2985uXUwv2HZcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9Yac15kv4zUJMw/dFjjqld9TLsvrPI7GRE4h7XfVDwk=;
	b=m4BFfFkSicMHMzwtQJA5YgVr9Wp8W57YFfQeAQfd15YwJ8xnBNbXeP3J3kLBgWyIQyGf
	 XmdZqcJqE9ZI1rHl4fJQQcY7HXBbd2KLqb0KlFM2ORYSCYsdFnFkvfZ1WMYi5KlM04Rx4
	 HlGoYm2h3MHWpCJfGaG1SLcNVJOzjudE7dEmzctXrxdUbz2xP6AVeRdJ6k+CBDSksR51T
	 jYfRrKGbMKY3jtTYYrgaPZMJc380KM+b022ZZJg3cgiuwZnuCripGQfmgb4BqLzC1vU7x
	 ToMbZNaZ/cnUBQJTGpQzsj5JhUjac/EIyeHC+lEIixL6V7kemtSm8zWGNzkI8P9zIzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PFrZ1uxL;
	arc=none smtp.remote-ip=74.125.227.128
Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD8E606A321
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 09:08:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDD8E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PFrZ1uxL
Received: by mail-pj2-f0.google.com with SMTP id d9443c01a7336-2efd15c7545so26514185ad.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 01:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770486; x=1796375286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Yac15kv4zUJMw/dFjjqld9TLsvrPI7GRE4h7XfVDwk=;
        b=PFrZ1uxLaO4RDH+PhRsSjoInODl+4hrMnrfKk11NeHcZVYKpeS6sdzR6H0htQiospT
         wcrfy4aJxc9p5lsSX1mch0whG0ZzTAt3S2y6AvQMZcLkoy8vxTSW2tafL4G48J5DHglu
         SApN5yqSyCSkJdsKlmx8wB/8VJt6ramQu7sOKZCaqnsgUs0PzF+2tfR0GATwBTKcKhAb
         JYG23LrHQg6RUIfr5M5nBx870xPoO3t3VUsXSDFIn/fMtgLL/TBmY8fUNUL2zp926xtL
         kQkfjqh71uGP54ffG7BlHcGxKtfzGdnkVkh0qL0QYQI3kX40ZZSeQDIhsRKDS/rvlC6n
         F4jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770486; x=1796375286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Yac15kv4zUJMw/dFjjqld9TLsvrPI7GRE4h7XfVDwk=;
        b=LVZKN30j58A4Lj25lI1X7hCnNff7f7q7EPrWRH7JHfZG9aE/W5pAAqfRP2rpdcOBoB
         OiRLJoTktX89PjvYOtSs20uRlUw+IxzRjwmnyrTRMmk9Av38Y29puVvnfmJ6R5is1aBW
         IVQTEer/DaVWn4fKl9hZ6xK88yRRg+5S/sujZX73f8rKQECXy6X+rxQfTx+uiMD78roY
         fviFgo0m+QsnGwGZ7T5BmKEGLO0G3zwpQ8GXvecxvTsNIWzIEIc5X/bzxanRmyJaDLei
         hA8iYgs/xQcvNRUhjxDIOm7BEAZc26ynRAqAqyg359bBy24/YYskbVHNuWxigAnAimwo
         nxXg==
X-Forwarded-Encrypted: i=1; AL+hErFNhubUkjkL2XwD8SJ37fDTCI8T43AMHvhb8/Of6Nvw/xNl7J8YHSl1MQlL0ns5IV96vhDLm7GH5pMg@vger.kernel.org
X-Gm-Message-State: APuU4Z/zVo8thBAPV6tOiXNR72kDTnrmO8ypxuUXMgeKqIeqe39eT/Ho
	Yg9um0gpYJ1HwSr5PkmmonsnTnlIMGUCqPnOjgDDyTHNVFdPR3u9xKiZ
X-Gm-Gg: AZFdTZeHeMezHfZNu1JiN20qFlGnv7cXPYz+Co0A7kNlNJ7TO7RrzZoVZsBYSnYoPQM
	WhWcVmWShhORUieptwDpkYHv6MhG71dqKpV968HLobXUS7o45VnfTjP92hFkxL5LHNwD2KxLLHS
	zFOiPJkbCzTtKhBkbal0HHJWRWgXWrt07beoqJvpZzHAIisEWP7Mqm/61YYewXXGjjJVtSqmUaZ
	pbh6gdiB5o28urtmI4gAZIba/d2kjUApaZ8UAx3GZDwO3pwI+susxtWwmF8LaOvzSV6xgG+XRdM
	/LxruJNEp8snbGsZDCCzf2uzU2pmBNHoKpy4fsdvzOAoo09hqCfkRc7j+7XvfPD6wh/nQPQy+bJ
	hPIbTqFbNs0g41RCmlLF/CVlbbe9QuaocP1u00YVGcbX8Ey0RzlN2RE7Pn72YvUNNrvoG+QgsBc
	NYJBGXewP47s4Po9Pd7j3sq2URnxwdudLlA/ShoE2urzsJbiT+n4dd/chRpdK8hGiM9LEiatbFS
	EwHt+akj2Fwjq71YZwc5qgK4h0G3TonviwD3aHlYAh9yaHgv7uApIzJ1+0XA678BeD04gdRVusE
	nIjVYRZpQn7MIXj/pzvWmsm9HkSt5tk9OnjIpO5KVw==
X-Received: by 2002:a05:6a21:8803:b0:3f9:292e:775d with SMTP id adf61e73a8af0-4014bc4b4abmr19459218637.49.1795770485952;
        Fri, 27 Nov 2026 01:08:05 -0800 (PST)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d06ee37sm11718725a12.28.2026.11.27.01.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:08:05 -0800 (PST)
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
Subject: [PATCH v10 2/8] crash_core: fold duplicated memblock arch hooks into the weak default
Date: Fri, 27 Nov 2026 17:07:17 +0800
Message-ID: <20261127090723.741253-3-chenwandun1@gmail.com>
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
index 14f453dd0946..18695f01043c 100644
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
index 0fe60907b97f..bef459287683 100644
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
index dad7f02365d3..fdc6695e8588 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -37,32 +37,6 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
 }
 
 #ifdef CONFIG_CRASH_DUMP
-unsigned int arch_get_system_nr_ranges(void)
-{
-	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* For exclusion of crashkernel region */
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

