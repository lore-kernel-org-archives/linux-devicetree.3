Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5AA2F8EA1
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792120219; cv=none; b=bFIz4BzfksJny8ZQ9Mt01GGNs8mpZsnV4qU8DYQ9nePn6hb+dSk+jKtFz5U/2WByW9Hs/PcSypLToXrZthlQbb8lXQ0fBorcGR9f02UnwbaUTSQT//j4ZYPg5UxzCrmGutNix/LTeweWcLcT0fYBsfVIdfPa4QMp4HohtiMMXUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792120219; c=relaxed/simple;
	bh=xaYAGKNR5teVXSTbMIqN33NUXwD6fmITNKM3gCe5N4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mWvHeof6dvwX+7DTcSlxH5WSdH/E9vepBd0AJa+RRG8vNifbEbWPC+UGOROjiuZANBIpPLhupSB292F9ezSFL0z3tGVnKn3U/C4doYf7woPqLvhlT6w73q6U4bDV9FhcWrUeMFCMfOfOvPiV7yH2aTSY9Dc86Ry54wZvetgsyzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B6msrrvw; arc=none smtp.client-ip=74.125.227.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B6msrrvw"
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-3ac6fe4aff0so1533516a91.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 20:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792120216; x=1792725016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6w2trImMBsUXcJxF+8CP2LmtHij/l89KoLcRCpS0ni8=;
        b=B6msrrvwl0YdPSjxOcclkjYeKLnL52JsBNDA3HIrecDpoDsMFnWUrpA7WOa69x3SEw
         J8rqHOKacO/aucqLC9zMSabnE6rzhcSLBk2YalaUKprLGpM4FlWbTRF3qZbtxtgNIgta
         +8pRNVf+yFdJWP6QLgcMm8FOupUSkgAOEoyZnY1BuRgsUqL/iUdinbUYvEs7xtrmGLnN
         808/g2+Bhqfo/pmna3YWDVT5lZLwR0GDCUYGGTK4BKWPU6VrEYGLZz2GgHDqoFVAg6Tz
         y1/CSOFo1xZx6y6EfLbFN22b2E93TlRd+QffYhidwwmzptI2zLopSysW2+BNK/ywXwSm
         zlDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120216; x=1792725016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6w2trImMBsUXcJxF+8CP2LmtHij/l89KoLcRCpS0ni8=;
        b=OETNLgK3PuRSCOyxZ3X7+McwSB92DjPCFFS1N9DcfRpjQ4Mjwc06d9dEu878WIe00s
         QTpPnJOxGLbwb++/RrN/LOsMud/AODKXUwysti9wm34dG3uNHlA/Zu9ALuWgJAVcUNiS
         ndIFHm+WN4Ds8TjB/LHXnc5r4UkRswDJAH4oiqG3cQCITDB57SfL+GijhJnjPoKELvel
         cXOtegSwAfU1FP1u9i0UfziqMdqlqddcQD0iQw8ScUwLT/rax21iuJXv44PovdZoP29g
         Yf+MRY6ScK0yujXg4CPWd+ujQBVSymvRNbuFVkNMC6sdVOd4+JxLOzzz0PH2QaGCN3X1
         ihew==
X-Forwarded-Encrypted: i=1; AKwUvBxF4QU/cJYiGyr93XFxs7Hw+nG1no64ygBDTYIAjfLA7xi9TFPlskkOyLSPQZ6jNeMCfUj8Zr7Kgpdn@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6W08AahIe8lU+jsP5b8kNB7HpIrsiOFh2mob1ztwT6iZIZA84
	WdemDJ2bk8DbYudciEfOaFc9h+1Tmnb+Rqudy9GgtBNWnB+YiG6hOTty
X-Gm-Gg: AYBFou3NDeWy2ejJlqGGU7Inhz5MYpjhiem2Xt56hddeb29QqlF2ikC77YbEp9XR8Xg
	qkJjtPffLNasqHBo2nmm9AsmuQW4ArkFncccP+cFK27TEMVb0dI/mnpoRVcd35zmll7fUudMUTi
	oSGJblSxvoNsplibJ6HFAvxF72E4xf57Pk0MlSScZYv4RdYFlp+nRxy/FM8RiTZikmIBTqgxFuJ
	UHoiDDdu95Kb7mr75W+ZD9+j5nRmt8AMeb/5Lh4I7vutWWXbS0rh7pk8bGEDh3aFe6Q4jjfzU4r
	NPFuRgAaoGx3deoBaZZq9FunRVbg3wLV23ZI8ZuWZsZLgK2DV9qLP2wXJpY/Dx3sIpRYnuEEqsF
	/rNNWlS2EFzpWvMnwtuEMS51/PHPVhVTcG+pjx5//jvDfgZozYCALVVMuyiXOsL4BtyikCm9gH0
	upLFDPKbZwTKIhQfib3B0jbAs2jN8FnP+8zGzUvdYPJTdvNwTZ7+eCMgMCTy/JH+1slrbO3joR6
	kAo9LPiW7g=
X-Received: by 2002:a17:90b:224c:b0:3a8:bbc2:5551 with SMTP id 98e67ed59e1d1-3ab3a0f0a1dmr21861671a91.0.1792120216184;
        Thu, 15 Oct 2026 20:10:16 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd3cc73c7sm370085a91.4.2026.10.15.20.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:10:15 -0700 (PDT)
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
Subject: [PATCH v8 5/8] memblock: introduce MEMBLOCK_NODUMP flag
Date: Fri, 16 Oct 2026 11:08:52 +0800
Message-ID: <20261016030855.4062882-6-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016030855.4062882-1-chenwandun1@gmail.com>
References: <20261016030855.4062882-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

Add MEMBLOCK_NODUMP to mark regions that should be excluded from
kdump vmcores.

The flag is meant for reserved memory that carries no data useful for
crash analysis. Reusable reserved regions such as CMA may hold useful
data, so these regions must not be marked MEMBLOCK_NODUMP. Subsequent
patches wire this up for /reserved-memory entries.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 include/linux/memblock.h |  9 +++++++++
 mm/memblock.c            | 16 ++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index ea288cf21400..04fbdff2b808 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -52,6 +52,8 @@ extern unsigned long long max_possible_pfn;
  * know is good to use. It is the only memory that allocations may happen from
  * in this phase.
  * @MEMBLOCK_RSRV_HUGETLB: memory is reserved for hugetlb pages
+ * @MEMBLOCK_NODUMP: exclude from kdump vmcore. It carries no data useful
+ * for crash analysis (e.g. firmware carveouts).
  */
 enum memblock_flags {
 	MEMBLOCK_NONE		= 0x0,	/* No special request */
@@ -63,6 +65,7 @@ enum memblock_flags {
 	MEMBLOCK_RSRV_KERN	= 0x20,	/* memory reserved for kernel use */
 	MEMBLOCK_KHO_NOPRSRV	= 0x40,	/* memory with no KHO preservations */
 	MEMBLOCK_RSRV_HUGETLB	= 0x80, /* memory reserved for hugetlb pages */
+	MEMBLOCK_NODUMP		= 0x100,/* exclude from kdump vmcore */
 };
 
 /**
@@ -160,6 +163,7 @@ int memblock_reserved_mark_noinit(phys_addr_t base, phys_addr_t size);
 int memblock_reserved_mark_kern(phys_addr_t base, phys_addr_t size);
 int memblock_mark_kho_noprsrv(phys_addr_t base, phys_addr_t size);
 int memblock_clear_kho_noprsrv(phys_addr_t base, phys_addr_t size);
+int memblock_mark_nodump(phys_addr_t base, phys_addr_t size);
 
 void memblock_free(void *ptr, size_t size);
 
@@ -305,6 +309,11 @@ static inline bool memblock_is_kho_noprsrv(struct memblock_region *m)
 	return m->flags & MEMBLOCK_KHO_NOPRSRV;
 }
 
+static inline bool memblock_is_nodump(struct memblock_region *m)
+{
+	return m->flags & MEMBLOCK_NODUMP;
+}
+
 int memblock_search_pfn_nid(unsigned long pfn, unsigned long *start_pfn,
 			    unsigned long  *end_pfn);
 void __next_mem_pfn_range(int *idx, int nid, unsigned long *out_start_pfn,
diff --git a/mm/memblock.c b/mm/memblock.c
index cbb172fbf06a..31c89bd64036 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -1204,6 +1204,21 @@ __init int memblock_clear_kho_noprsrv(phys_addr_t base, phys_addr_t size)
 				    MEMBLOCK_KHO_NOPRSRV);
 }
 
+/**
+ * memblock_mark_nodump - Mark a memory region with flag MEMBLOCK_NODUMP.
+ * @base: the base phys addr of the region
+ * @size: the size of the region
+ *
+ * Mark the region as not to be included in crash dumps.
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+int __init_memblock memblock_mark_nodump(phys_addr_t base, phys_addr_t size)
+{
+	return memblock_setclr_flag(&memblock.memory, base, size, 1,
+				    MEMBLOCK_NODUMP);
+}
+
 static bool should_skip_region(struct memblock_type *type,
 			       struct memblock_region *m,
 			       int nid, int flags)
@@ -2880,6 +2895,7 @@ static const char * const flagname[] = {
 	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
 	[ilog2(MEMBLOCK_KHO_NOPRSRV)] = "KHO_NOPRSRV",
 	[ilog2(MEMBLOCK_RSRV_HUGETLB)] = "RSV_HUGETLB",
+	[ilog2(MEMBLOCK_NODUMP)] = "NODUMP",
 };
 
 static int memblock_debug_show(struct seq_file *m, void *private)
-- 
2.43.0

