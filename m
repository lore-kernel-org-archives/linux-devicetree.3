Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC16C46EF75
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 10:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788346277; cv=none; b=czj41/jD5zEHVJj177hfxzH/Kgf1Jlj6Annex8R+2jgviHtQmTKdQg9hnRCkYemVuNJ2FhBKOTNyHXly2XKdohF+GtpFdhukLPDXwMHNqmrMuQopn1P5uBez1NZ5Z5po+vM2tAGW7VUo4mUcvKqAKZRzV+7EuiwX0Ljo68GiuHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788346277; c=relaxed/simple;
	bh=6vwnExrPXeu4OT1kol2nQNcoEOHFQGpvOL1iKrPK/c0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=inFTu0kO+RamO6fGSy/8ziG2ksFyt76ZA/UOvQT5dOC5ukq/rycVpiLtdGQ7X0Ma4N4K3+I3W7Vza7tMnVaNCdkt5oclGiFj8Vj8ZMR7MSWdsORHHbctOYLulEdfBOpksA6MQIBExKNsR9Jb+NNx5L8UFtyCcMd4YmjbqZmOvFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vUUdfQ+t; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vUUdfQ+t"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-495689bfcc8so6363465e9.1
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 03:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788346268; x=1788951068; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tkcdapIGW4RxTiLPx+DO8uuzWqNmooyhO69bXNbCQ5o=;
        b=vUUdfQ+t/XRC+5rAU86ZtFi3AwfxZkiEfN+Jqui1cFCHVGIkz2dTLAlO8hXMBEHMID
         Ve05YgI9BK2qk7mXAOyEJ2ndmrqZ7nT5rIyo/2kuhM3YZEku8j0D9IJGG4fFwwKLHqpR
         M9nyFlbaNrwldCaIHLHYXHgZQaGBaFI9R7QD0Ae9oqAXJB5eusSxO3TQ1zm7LEjNxPvD
         VF7PslZGjOgU89tpYErObGxXkRkrvJzcP2rAVe8R0B2mecFvf9y35nGIRkfRNbGCojs4
         ZAQCemS1HmYHVNTKASFfzKbce29RDIsWLQ0auaSoAJKpEJ5VaQk0GVOkJFRSbFuePwpe
         /14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788346268; x=1788951068;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tkcdapIGW4RxTiLPx+DO8uuzWqNmooyhO69bXNbCQ5o=;
        b=BzWRGNijT0UZt4zyjXyQcBAD9nL+Ciw1l3215NsJ4BJ2Wj+2fvvUedELJMDX/BU/r0
         oYVsjksZ9aGVwysuBEVetgKPuA9//gbpE3jVGT7DblH35HQCpVyR5m+5ec3EuD8GhpUH
         Pg44dtaWC1qEYMLg0RCfurNAa1LboZm9HFYDxPzZD7JqOrm9UteOz+ca7OFAcuanfmz0
         cDK4Z2XD+txtXxfm4v2IF0AH3jYF/3NHSaOS7qxnhnucBLhFIQ26tVfVP+RS3TTDxbaE
         n1raFwySfXdSKeVLl8QNRDGUHr7WwPOQCOspcTZ6RIQi65OblHxNeFrZiyszoyJHCIQn
         39gA==
X-Forwarded-Encrypted: i=1; AHgh+RoH6TLaYpkKsSHR8IOiw0Z1OtHXrBl/LQN5QfmLQvzR6gbxrHa+XjeyEAkPINI2TOgU/Bl4UU5rNcAr@vger.kernel.org
X-Gm-Message-State: AFuF++kMaID9nFaSJKkb/4mVlYrAEvmnU2bKM0DS1u0CTRZ1KpC/tdgB
	SLfj6P+6y8q5ierbTGZ/L9WNtX5HwqU8Zl3ZbVOSuhs4LZzUtAxs8YWgKsTvP9jYV6JURQ2pSCX
	Aj2qeA//ef3krXhUTx8D1vQ==
X-Received: from wmph35.prod.google.com ([2002:a05:600c:49a3:b0:499:b2be:d4b])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c4a6:b0:498:952:e276 with SMTP id 5b1f17b1804b1-49ce581142cmr69791455e9.8.1788346267736;
 Wed, 02 Sep 2026 03:51:07 -0700 (PDT)
Date: Wed,  2 Sep 2026 11:47:03 +0100
In-Reply-To: <20260902104712.2399797-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260902104712.2399797-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.970.g62bdec98f9-goog
Message-ID: <20260902104712.2399797-2-vdonnefort@google.com>
Subject: [PATCH v9 01/10] memblock: Introduce MEMBLOCK_LLMAP
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org, 
	akpm@linux-foundation.org, sudeep.holla@kernel.org, jenswi@kernel.org, 
	robh@kernel.org
Cc: mark.rutland@arm.com, sumit.garg@kernel.org, ardb@kernel.org, 
	thierry.reding@kernel.org, david@kernel.org, danielmentz@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Keeping last-level mappings is interesting on some architectures as it
allows mapping/unmapping pages from the kernel direct map without the
risk of splitting blocks which, under the break-before-make rule, may
trigger page-faults the kernel can't handle.

However, mapping the entire direct map at PTE-level is costly. So
instead, create a new memblock flag MEMBLOCK_LLMAP to enable the system
to decide which region must be covered by mappings up to the last-level.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index d62db9e776cf..d40a5ded188d 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -52,6 +52,7 @@ extern unsigned long long max_possible_pfn;
  * kernel that we know is good to use. It is the only memory that
  * allocations may happen from in this phase.
  * @MEMBLOCK_RSRV_HUGETLB: memory is reserved for hugetlb pages
+ * @MEMBLOCK_LLMAP: memory region to be mapped using last-level mapping
  */
 enum memblock_flags {
 	MEMBLOCK_NONE		= 0x0,	/* No special request */
@@ -63,6 +64,7 @@ enum memblock_flags {
 	MEMBLOCK_RSRV_KERN	= 0x20,	/* memory reserved for kernel use */
 	MEMBLOCK_KHO_SCRATCH	= 0x40,	/* scratch memory for kexec handover */
 	MEMBLOCK_RSRV_HUGETLB	= 0x80, /* memory reserved for hugetlb pages */
+	MEMBLOCK_LLMAP		= 0x100,/* last-level mapping */
 };
 
 /**
@@ -160,6 +162,8 @@ int memblock_reserved_mark_noinit(phys_addr_t base, phys_addr_t size);
 int memblock_reserved_mark_kern(phys_addr_t base, phys_addr_t size);
 int memblock_mark_kho_scratch(phys_addr_t base, phys_addr_t size);
 int memblock_clear_kho_scratch(phys_addr_t base, phys_addr_t size);
+int memblock_mark_llmap(phys_addr_t base, phys_addr_t size);
+int memblock_clear_llmap(phys_addr_t base, phys_addr_t size);
 
 void memblock_free(void *ptr, size_t size);
 void reset_all_zones_managed_pages(void);
@@ -306,6 +310,11 @@ static inline bool memblock_is_kho_scratch(struct memblock_region *m)
 	return m->flags & MEMBLOCK_KHO_SCRATCH;
 }
 
+static inline bool memblock_is_llmap(struct memblock_region *m)
+{
+	return m->flags & MEMBLOCK_LLMAP;
+}
+
 int memblock_search_pfn_nid(unsigned long pfn, unsigned long *start_pfn,
 			    unsigned long  *end_pfn);
 void __next_mem_pfn_range(int *idx, int nid, unsigned long *out_start_pfn,
diff --git a/mm/memblock.c b/mm/memblock.c
index 9ce86349a29f..1591b50503ed 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -1119,6 +1119,16 @@ int __init_memblock memblock_mark_mirror(phys_addr_t base, phys_addr_t size)
  */
 int __init_memblock memblock_mark_nomap(phys_addr_t base, phys_addr_t size)
 {
+	struct memblock_region *r;
+
+	memblock_cap_size(base, &size);
+
+	for_each_mem_region(r) {
+		if (memblock_is_llmap(r) &&
+		    memblock_addrs_overlap(base, size, r->base, r->size))
+			return -EINVAL;
+	}
+
 	return memblock_setclr_flag(&memblock.memory, base, size, 1, MEMBLOCK_NOMAP);
 }
 
@@ -1204,6 +1214,45 @@ __init int memblock_clear_kho_scratch(phys_addr_t base, phys_addr_t size)
 				    MEMBLOCK_KHO_SCRATCH);
 }
 
+/**
+ * memblock_mark_llmap - Mark a memory region with flag MEMBLOCK_LLMAP.
+ * @base: the base phys addr of the region
+ * @size: the size of the region
+ *
+ * If supported by the architecture, such region is mapped at the last-level in
+ * the kernel direct map.
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+int __init_memblock memblock_mark_llmap(phys_addr_t base, phys_addr_t size)
+{
+	struct memblock_region *r;
+
+	memblock_cap_size(base, &size);
+
+	for_each_mem_region(r) {
+		if (memblock_is_nomap(r) &&
+		    memblock_addrs_overlap(base, size, r->base, r->size))
+			return -EINVAL;
+	}
+
+	return memblock_setclr_flag(&memblock.memory, base, size, 1,
+				    MEMBLOCK_LLMAP);
+}
+
+/**
+ * memblock_clear_llmap - Clear flag MEMBLOCK_LLMAP for a specified region.
+ * @base: the base phys addr of the region
+ * @size: the size of the region
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+int __init_memblock memblock_clear_llmap(phys_addr_t base, phys_addr_t size)
+{
+	return memblock_setclr_flag(&memblock.memory, base, size, 0,
+				    MEMBLOCK_LLMAP);
+}
+
 static bool should_skip_region(struct memblock_type *type,
 			       struct memblock_region *m,
 			       int nid, int flags)
@@ -2886,6 +2935,7 @@ static const char * const flagname[] = {
 	[ilog2(MEMBLOCK_RSRV_NOINIT)] = "RSV_NIT",
 	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
 	[ilog2(MEMBLOCK_KHO_SCRATCH)] = "KHO_SCRATCH",
+	[ilog2(MEMBLOCK_LLMAP)] = "LLMAP",
 };
 
 static int memblock_debug_show(struct seq_file *m, void *private)
-- 
2.55.0.970.g62bdec98f9-goog

