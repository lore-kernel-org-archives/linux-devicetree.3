Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106763B0581
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 06:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792131430; cv=none; b=DEF5iED7AgvhTWjc7ZvWgjAJkhgc8DUEjlIpXx1svqm887+IFxA0SGZEwHU2IvavMSVyO7XtK5MRv88Stk2847wlthIk6WV9hTS3R/nkU3qBXw8LDvuSZO6CHHVW7CA+YFBU7gNIxIrWltK3+vLBgoNevdxZqVPYTH0qtcY09bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792131430; c=relaxed/simple;
	bh=xaYAGKNR5teVXSTbMIqN33NUXwD6fmITNKM3gCe5N4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qeejbnMuDHM572i0qmncr94nE7B8fG2ceG7Stym6ShMY9W9bA8uU+F+X7nsxPGZFBV/ZxLkfuvcwu5DTg/sdOMHQM8EOBncfpc/ZZl4/WEc9U2rXpe28RJUYw3yxDJsxF+vfhBp4coi2rSZ46XhsJQxFq4EuJPKu5DlnGBIo1mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kYLUG+3y; arc=none smtp.client-ip=74.125.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kYLUG+3y"
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-cd63952c9f2so349920a12.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 23:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792131428; x=1792736228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6w2trImMBsUXcJxF+8CP2LmtHij/l89KoLcRCpS0ni8=;
        b=kYLUG+3ylYEt7ts9ts9RjyV4NDTpu/O9HBLPyztO2GX0c95r7jr1dm7SoG6QXts2xJ
         cdlH11RrGeNNh4mvUgMcvzkSl93JSKa0oiM+e+VzCIqkCxj0dUtJXFctZLRkzzftQr6e
         ipU3qerMrUM71YX1va+7VGIWFb1jsydRj/HULNcb9zHK9VOEU9fsV4QuMFb5vk9f9FUL
         Wwi5oK/P3o9eEdv6vMgXkEh1CiqyPisE5lJpzYsqKMlm1LDnMD+evsVv9f8KOxULi7eu
         3C44iKcG0z6j923emk+rEzegcolK/Z4oRysRtQN9lEX8YBZBP3NkI+0yMuQ1IVTGIzXk
         la5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792131428; x=1792736228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6w2trImMBsUXcJxF+8CP2LmtHij/l89KoLcRCpS0ni8=;
        b=PbErPnEHtQkvwmWOUwfIavorbrc0rr9uocZk3RvHdM633GcG+LDVwfoEQNvN2AHP3u
         H0/qMSjJlvjiDucQuqRNlj8szxhYGRZecklHdi5tWtrUAMMxUs2QtgmwFM1xTvh40d22
         prxm6dY5vOYu57LZpQSDQMVALnsQE1QGvKrnA4zQurGrFZbrsDctAYa1Uy7IV6V5WMyg
         zb8ZQNo1oPeM5rO8NUFNIYoaKW77zRfp7i9I6eWNirXDeG0MDO6T4XWBmfGQWWrndgFG
         AiUFX82sMzl4dvyKE7jN8BxcWyFAIvPr4RwwH6oOQi2LL4O2JhIB290YaYSXTImZf3EE
         MUmw==
X-Forwarded-Encrypted: i=1; AKwUvByMV5bg/dJMXePs5NS5M4AEqxGe3UtS5nBjzFMTLaej5LQ9zR7f9UZ5x9+UJbS1LJtrpDXSHw0kxXkP@vger.kernel.org
X-Gm-Message-State: AFq9FYLkP0H5AOKJxd8ylIDb98eXPSb3PKBKyAIwcKhi9tc+V5gpV9vd
	kgXXXfOMTQWBrtdRn9FUK85PIQPBecI8TDqvJydS58v7gPwrc8Ox+b4g
X-Gm-Gg: AYBFou1cW29MSN9fdXIlba/CB0wy5chRj+X7SfQ2uRyZn9lwsaLungB0m6tiaCEmobm
	sAz+kJzJNFV5kvI/JMaHbsUaOYJ1cVAN1P9t4CsS4s4m1ewyVeAkrMjOQ4l6rmxK9fEwq2GNSrm
	w5xL6xmsvKvnx7G7KQcrkUAem1rTXF7w9BGZNaPvrNmxSj5pNwvVAi3mplkdZsxjnWptVpgsL5R
	c2Qdq8cYg/GoD1R8Wp42iqzCgcyOmPvzxlkvtR6trLO8rXqbRTEXOR33PPrFjJviV/ezpN2Qzy6
	eDSBIIdU7LVF8kFznui8y/ub4ti1iJkdmhjy1RX0rQ5DjfmoY1SsfTtsuUSXKNGOC9BctskZjNO
	c9oHggvaeLj+7y+cNobb8ltkKG32tv8ErmCFwFifS30Qof69/hqFMcLrwRlFF3IRXC6lSKUj5+B
	s+jJ+RTsRRMphNhwuQ8/Z0jnWBYLQG3CzWKOGHqhK9AuFvrTmwJmyiqzGrNj/8c+X7flZw6mWdN
	CKc4aFlju8=
X-Received: by 2002:a05:6a00:3404:b0:881:4b47:f31a with SMTP id d2e1a72fcca58-897c6539ee1mr20053354b3a.11.1792131428281;
        Thu, 15 Oct 2026 23:17:08 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57b334e6sm586375b3a.42.2026.10.15.23.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:17:07 -0700 (PDT)
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
Subject: [RESEND PATCH v8 5/8] memblock: introduce MEMBLOCK_NODUMP flag
Date: Fri, 16 Oct 2026 14:15:46 +0800
Message-ID: <20261016061549.4181390-6-chenwandun1@gmail.com>
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

