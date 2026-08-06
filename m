Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202B3429CF3
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786008951; cv=none; b=rlxd3OKpG2Ha+cYmdTYB7gmtxf1qo/urmkrKACJhcyoNJmXXSFNjEkxDBzBe832FzDRfcaTfpCmXLqssO9rKNVeSyLczV0/SXuzN9NJT2OaINEQEWUWFmomFw+X4CHJs7YuAWeSmDkhm3SvsmiNXJRQvrHQiXMuoxbJNvcXtZdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786008951; c=relaxed/simple;
	bh=PZZL/NWy6VBObnRhtunYLM2umAGqZc9M5rEhiePSLao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sty5Lf6iMHubyH6RzRhEZxTMqUJ9TQ1r36ma1UdYHAbCrFnFrcX2c0zEoctaxWm+6kWK1W/i9X0Lxx9BfuWzPLi601uPo++WMBhjAjQbYepM8QLIxR7m5AEvCUgtclPzyGyoTeWsbQR7c/G/DQUT/DP4UfjkZxbZO6mtAX/1MYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qWXI+juy; arc=none smtp.client-ip=74.125.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qWXI+juy"
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-cbb8ebaca74so1068362a12.1
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 02:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786008948; x=1786613748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3gF4E42dXY09sWBsDK5gTPPv7oygQNLJ0717q+HvJkA=;
        b=qWXI+juy163kfjtQrHJp24i2XyKLmu9afWdnj2EbD+AjwR608R6rcf8TVydmHY6BTl
         cnmnOSSDFa9KF6+bCfeHVzrBmYQ7D7YIUzQSJdd0cUZWRNlXkVEzj7UU9BxZYDp+4ThA
         HAWdCtll3UMThFmy7vD4YTsiQL2CCQ5QNVe1/UNFSrF499tKdzEedIlRZ4OfEkghi3P8
         zYjUuhp6BdeuxS2x2bU/vVaWk7irBWSf7u/4/dSdC7+PcMRGemYlAokI+K7EnqdEu0QX
         1hgJUDT8rXcejeW+gc9Ui0hzbL4+RNniP7wmCVwyGPlFALfRfbwNxnBdBuf8oAWC9c05
         II5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786008948; x=1786613748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3gF4E42dXY09sWBsDK5gTPPv7oygQNLJ0717q+HvJkA=;
        b=R/QZX8NGxe+UQnVwYqFo2V/JroT4ptmpfmv+O3qLIpAaIqUUFTJ8CtpXBlO+sXkAn5
         I/SMdksmLBLl2aiDx60A/NJHijlDyFwlsbs1bbU6b+5vgKsXDsJUBBAySg4xKzAW+ImN
         GPIUEQf9WB1OfmkLO02hMouYrxRPkyu7CKy6BH3YAtJMU7x6k9jsd1Nk/zMngpnjdagH
         h7qTT++PHQE79p7NkoRjcQUbxQdGpN/+9mieKd1QvzhQvABFcfnRk18mmaThDhjRFJak
         vb+0LScRPRHguopF09zj7LfGxZ8SWRbW32pNxxDuj6UDAyNU6Cn1EBzUxqWHlFbbDKB+
         fDkQ==
X-Forwarded-Encrypted: i=1; AHgh+RqmioRbzHriVch6YoPn0z1b6cnODolZv5hvaxNgcXH/XPCXkG/iNMzk0vypUkE7UZqHCf5aTVg5K0uk@vger.kernel.org
X-Gm-Message-State: AOJu0Yz311zEL+dkiUVanBqKo7LSpWHqgB5rbQVQUILZyHg1lhBl2ndK
	VQMg2L17i4zfJFD3nJLnvI1jWRjl9zba6N29VM1O56J2SJ6dVOZaX8JP
X-Gm-Gg: AR+sD108qwoQ4/FXg+N9UA5IwFFCkERTLis4STZ2umPeESSIhkdn40VwTJBaVpZuxXP
	AVScFXtm367yi4eNfHWec8l/rNapLjZMgqViBuDXi10wGXFbKg4wRuVDZPQjpI2UG2/Ud4bAOJk
	5mWJFhg1z19pvOgCNvPRhon8h2cBWTFLZa47EQSdfgf/RBX4wQQhqjp1m7+75J/Fe1Y3Q/TLNji
	UJR9WbTb0AeN7vrXTsPcBrV8OsNjoPOREBk4IeqgPH5YiIfYYKkIAdWCoYT2Ylg0TfC0VqRjI8Q
	0vzsdUOlRctEaVqNQ5HBLmA/EAYiPxlDggrVIzLGtzzw5eXLUGGHyehuwSj8wqnLi5QB48q0IuK
	I8oJ3NMVwQ8JDUapvaHxDd4o84spaIi2LFhQ7MsUCNJzBYvrb5CIsQ53YZEIKa3CJ0424LD7dEk
	LrmEm0cjSEl76it1tBqaSsyT33DwAMMaA1IZps85LmDhVU9MNtWKpeQ6GQhH2IzSMQ/tEZP6VXZ
	A==
X-Received: by 2002:a05:6a00:302a:b0:848:7443:f2de with SMTP id d2e1a72fcca58-84f2dff77cbmr16112920b3a.13.1786008947826;
        Thu, 06 Aug 2026 02:35:47 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f453b0aeasm1043878b3a.13.2026.08.06.02.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:35:47 -0700 (PDT)
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
Subject: [PATCH v5 1/8] memblock: introduce MEMBLOCK_NODUMP flag
Date: Thu,  6 Aug 2026 17:35:12 +0800
Message-ID: <20260806093519.2907771-2-chenwandun1@gmail.com>
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

Add MEMBLOCK_NODUMP to mark regions that should be excluded from
kdump vmcores.

The flag is meant for reserved memory that carries no data useful for
crash analysis. Reusable reserved regions such as CMA may hold useful
data, so these regions must not be marked MEMBLOCK_NODUMP. Subsequent
patches wire this up for /reserved-memory and /memreserve/ entries.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
 include/linux/memblock.h |  9 +++++++++
 mm/memblock.c            | 16 ++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index d62db9e776cf..b2fcf11fba2b 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -52,6 +52,8 @@ extern unsigned long long max_possible_pfn;
  * kernel that we know is good to use. It is the only memory that
  * allocations may happen from in this phase.
  * @MEMBLOCK_RSRV_HUGETLB: memory is reserved for hugetlb pages
+ * @MEMBLOCK_NODUMP: exclude from kdump vmcore. It carries no data useful
+ * for crash analysis (e.g. firmware carveouts).
  */
 enum memblock_flags {
 	MEMBLOCK_NONE		= 0x0,	/* No special request */
@@ -63,6 +65,7 @@ enum memblock_flags {
 	MEMBLOCK_RSRV_KERN	= 0x20,	/* memory reserved for kernel use */
 	MEMBLOCK_KHO_SCRATCH	= 0x40,	/* scratch memory for kexec handover */
 	MEMBLOCK_RSRV_HUGETLB	= 0x80, /* memory reserved for hugetlb pages */
+	MEMBLOCK_NODUMP		= 0x100,/* exclude from kdump vmcore */
 };
 
 /**
@@ -160,6 +163,7 @@ int memblock_reserved_mark_noinit(phys_addr_t base, phys_addr_t size);
 int memblock_reserved_mark_kern(phys_addr_t base, phys_addr_t size);
 int memblock_mark_kho_scratch(phys_addr_t base, phys_addr_t size);
 int memblock_clear_kho_scratch(phys_addr_t base, phys_addr_t size);
+int memblock_mark_nodump(phys_addr_t base, phys_addr_t size);
 
 void memblock_free(void *ptr, size_t size);
 void reset_all_zones_managed_pages(void);
@@ -306,6 +310,11 @@ static inline bool memblock_is_kho_scratch(struct memblock_region *m)
 	return m->flags & MEMBLOCK_KHO_SCRATCH;
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
index 9ce86349a29f..79231634c25b 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -1204,6 +1204,21 @@ __init int memblock_clear_kho_scratch(phys_addr_t base, phys_addr_t size)
 				    MEMBLOCK_KHO_SCRATCH);
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
@@ -2886,6 +2901,7 @@ static const char * const flagname[] = {
 	[ilog2(MEMBLOCK_RSRV_NOINIT)] = "RSV_NIT",
 	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
 	[ilog2(MEMBLOCK_KHO_SCRATCH)] = "KHO_SCRATCH",
+	[ilog2(MEMBLOCK_NODUMP)] = "NODUMP",
 };
 
 static int memblock_debug_show(struct seq_file *m, void *private)
-- 
2.43.0

