Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395310;
	b=q1M7ChhUPMAC7nOkIVmgzC8jHnBuBS9yeLW46Zp6hjvdszl5MTNldPayNjJ6Mw79oHmn
	 +Ae9+mjAqOqnJyU4FLc96eg1mGjO9uQymRibRgmXPXVVrd3CxW0sdsJQW7c/zHJnNDDSc
	 qmXIMQRYUPcsedTTprVF2keonV/qe0wl+LSYRM9Zk+DOSNAsXnyrQaArdx2q6g4RsIzVW
	 IjGb7dnE7qr+MvZl3kQ/DhUTy7bX7mMHoPcIXoRVyhbM/wQm/Zj2qzfjSiXa+G8Ipy6OI
	 3ffIYy9VlziTpEtC5IwXtWbB2V9OdYxuesup4MaLokcKvk2F1gaNM1r3fHvc124tP1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=fepHfB0plBo6LzhKi5imbPgE2fv/KA+5u7RqYYS0Pqg=;
	b=pWzDgaHIDRs7kDUAip4bnLtGCWlpSozIU2B25XOJve6LGzI00NX1Jjlz9WbRqXzYT2xd
	 cttpRbihSSYjiHJIj1AutkefapwbixJbJf5S4KUbwObYKnyPPMtIHuMGqgHb2KSI+n9jf
	 nxknVcK68nWQlHRDYkyy+vJKDu3YLL7y2uwtb7A0XkjaTinPtaZ9Pl9JB+voB4ArnqGL6
	 /lksRieb7TB9fUUwZ8yiCYlgDQeQPfQzCXKHVtC6G02e4neS+qLJ1GfQ1rAKwuXMWjUrW
	 kMokV6mh1uzoUSZXL8EOtfwms6VeofmoFwwsS90J/vUC1NtRWLomEDgoiRwmRo4gSGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="WNQ/iIY+";
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC09260A383C
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:08:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC09260A383C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WNQ/iIY+
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4ba078abd70so8290935e9.3
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 03:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794395308; x=1795000108; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fepHfB0plBo6LzhKi5imbPgE2fv/KA+5u7RqYYS0Pqg=;
        b=WNQ/iIY+OzwfEdZcCm8rgVDD+ioStmHenmR3ZGw5BRNXm3Q1GXXB+hntbnnOfoGex0
         3R1vpgxKcd6b95bW2uiFNaa9DSfcnlO1XJDxBduA5UwY9A3odYiFaGMvqP8yyQ5V0esG
         6exNsAiQqofkG0jjrCxMi43OK3QgKJGoSYAwR0hi0JVNDxo25P3y1ezgS4XbJgwQZ6j0
         bGs5FnugsofjHnAxKuHIYILah5msu/u+vQu42FLA5cpY/r3ufaLg9MxB/Sd15kZWX8jl
         KCNeZa3VxYS5JOZIQkemfi2qF/9Ed0wlyZ4xWqmcGgfwyMeg+pbU59K8L7a4dMKIv6Vh
         BEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395308; x=1795000108;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fepHfB0plBo6LzhKi5imbPgE2fv/KA+5u7RqYYS0Pqg=;
        b=s1wrm4KsuEWLRn8/Pm+0wf2/FG6UceoXSa5LHiSjG3bi/41IO6CnqvAdvAE4pQN2Pw
         SVVL4ea/rmmcmmMcW1H2yX79LJkbXlr+T5BuaLyrnsYU4Js1XV7cWa06PDSqgrWoFNNu
         RqRct1DUsyvGgX5vFNoycVvvJhcY8o/rYql2kN5QLl8XzATlTr04DSzPTNs88seO+x0v
         x7TVUHeSAz0BogZAnDsaRVEbtAQZ2buPSPeVB4caRi9jkzxtlM7/lojh2tDq/223dm5O
         kKfuXTAi6n6hywUcq7rN1J2gbXtzdYEZxRE20eP1dyDInQVpgy4X7fdkut1tiZj9Szn8
         wTkw==
X-Forwarded-Encrypted: i=1; AL+hErGjEpF0618PhZHFe40Z6PniFgxz+zi1Z576i3TTNYeQ+CMyYqKAA/ecP/bkpTSzm4pcOawRfGEzDP96@vger.kernel.org
X-Gm-Message-State: APuU4Z+Cl62v99CL4toWbkOBD8EXgkksMVtIrCfi9HgMpeZ8ag0cOO0w
	PjWRnbYB2/GRLzSpBemSbUtVhQbKyvJ8nNngVwCqxIN4vjUPw/NFpoWyxg1HzHA1u61uFeWlPsf
	6FKvMll6VIQxen09bG5GLJw==
X-Received: from wrtw18.prod.google.com ([2002:a5d:6092:0:b0:496:45d:6be1])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c167:b0:4a1:a6e0:4ce4 with SMTP id 5b1f17b1804b1-4ba093acf6dmr33023215e9.33.1794395307950;
 Wed, 11 Nov 2026 03:08:27 -0800 (PST)
Date: Wed, 11 Nov 2026 11:07:35 +0000
In-Reply-To: <20261111110738.872947-1-vdonnefort@google.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111110738.872947-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261111110738.872947-6-vdonnefort@google.com>
Subject: [PATCH v3 5/8] dma-mapping: Introduce lendable-dma-pool
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org, 
	akpm@linux-foundation.org, m.szyprowski@samsung.com, jenswi@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: mark.rutland@arm.com, robin.murphy@arm.com, hch@lst.de, 
	ryan.roberts@arm.com, sumit.garg@kernel.org, sudeep.holla@kernel.org, 
	ardb@kernel.org, thierry.reding@kernel.org, david@kernel.org, 
	danielmentz@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org, iommu@lists.linux.dev, op-tee@lists.trustedfirmware.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

On arm64, when memory is lent to secure world (e.g. via Arm FF-A), fatal
CPU speculative reads can still occur while it retains a cacheable
direct mapping. Introduce the "lendable-dma-pool" reserved-memory CMA
driver with dma_zap_direct_map() and dma_restore_direct_map() to unmap
pages before lending and restore them upon reclaim. Devices use the pool
via "memory-region" or "linux,cma-default":

  reserved-memory {
      #address-cells = <0x2>;
      #size-cells = <0x2>;
      ranges;

      linux,cma {
          compatible = "lendable-dma-pool";
          reusable;
          linux,cma-default;
          size = <0x0 0x4000000>;
      };
  };

If no lendable-dma-pool node is provided, the API falls back to
can_set_direct_map().

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 include/linux/dma-map-ops.h |   9 ++
 include/linux/dma-mapping.h |  16 +++
 kernel/dma/Kconfig          |   3 +
 kernel/dma/Makefile         |   1 +
 kernel/dma/lendable.c       | 243 ++++++++++++++++++++++++++++++++++++
 5 files changed, 272 insertions(+)
 create mode 100644 kernel/dma/lendable.c

diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index afaf2c12189b..e1d1e8d70855 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -379,6 +379,15 @@ static inline void arch_dma_prep_coherent(struct page *page, size_t size)
 }
 #endif /* CONFIG_ARCH_HAS_DMA_PREP_COHERENT */
 
+#ifdef CONFIG_DMA_LENDABLE
+int __init arch_dma_mark_lendable(phys_addr_t base, phys_addr_t size);
+bool __init arch_dma_is_lendable(struct page *page, unsigned int nr_pages);
+int arch_dma_zap_direct_map(struct page *page, unsigned int nr_pages,
+			    bool from_lendable);
+int arch_dma_restore_direct_map(struct page *page, unsigned int nr_pages,
+				bool from_lendable);
+#endif /* CONFIG_DMA_LENDABLE */
+
 void *arch_dma_set_uncached(void *addr, size_t size);
 void arch_dma_clear_uncached(void *addr, size_t size);
 
diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index efde0e5a58dc..24239599505d 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -511,6 +511,22 @@ void dma_free_pages(struct device *dev, size_t size, struct page *page,
 int dma_mmap_pages(struct device *dev, struct vm_area_struct *vma,
 		size_t size, struct page *page);
 
+#ifdef CONFIG_DMA_LENDABLE
+int dma_zap_direct_map(struct device *dev, struct page *page, size_t size);
+void dma_restore_direct_map(struct device *dev, struct page *page, size_t size);
+#else
+static inline int dma_zap_direct_map(struct device *dev, struct page *page,
+				     size_t size)
+{
+	return -ENODEV;
+}
+
+static inline void dma_restore_direct_map(struct device *dev, struct page *page,
+					  size_t size)
+{
+}
+#endif /* CONFIG_DMA_LENDABLE */
+
 static inline void *dma_alloc_noncoherent(struct device *dev, size_t size,
 		dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp)
 {
diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
index 3830a63ae032..8d65e2daa7d2 100644
--- a/kernel/dma/Kconfig
+++ b/kernel/dma/Kconfig
@@ -192,6 +192,9 @@ config DMA_CMA
 
 if  DMA_CMA
 
+config DMA_LENDABLE
+	bool
+
 config DMA_NUMA_CMA
 	bool "Enable separate DMA Contiguous Memory Area for NUMA Node"
 	depends on NUMA
diff --git a/kernel/dma/Makefile b/kernel/dma/Makefile
index 6977033444a3..6b257d82bd9b 100644
--- a/kernel/dma/Makefile
+++ b/kernel/dma/Makefile
@@ -4,6 +4,7 @@ obj-$(CONFIG_HAS_DMA)			+= mapping.o direct.o
 obj-$(CONFIG_DMA_OPS_HELPERS)		+= ops_helpers.o
 obj-$(CONFIG_ARCH_HAS_DMA_OPS)		+= dummy.o
 obj-$(CONFIG_DMA_CMA)			+= contiguous.o
+obj-$(CONFIG_DMA_LENDABLE)		+= lendable.o
 obj-$(CONFIG_DMA_DECLARE_COHERENT)	+= coherent.o
 obj-$(CONFIG_DMA_API_DEBUG)		+= debug.o
 obj-$(CONFIG_SWIOTLB)			+= swiotlb.o
diff --git a/kernel/dma/lendable.c b/kernel/dma/lendable.c
new file mode 100644
index 000000000000..85ac3ad10df0
--- /dev/null
+++ b/kernel/dma/lendable.c
@@ -0,0 +1,243 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Lendable DMA Contiguous Memory Pool
+ *
+ * Prevents CPU speculative reads to DMA memory (e.g. when lent to a secure
+ * world) by unmapping it from the kernel direct map. This works if the
+ * architecture allows modifying the direct map globally (can_set_direct_map())
+ * or if the memory belongs to a reserved-memory CMA pool compatible with
+ * "lendable-dma-pool".
+ *
+ * Copyright (C) 2026 Google LLC
+ * Author: Vincent Donnefort <vdonnefort@google.com>
+ */
+
+#define pr_fmt(fmt) "dma-lendable: " fmt
+
+#include <linux/atomic.h>
+#include <linux/bsearch.h>
+#include <linux/cma.h>
+#include <linux/dma-map-ops.h>
+#include <linux/dma-mapping.h>
+#include <linux/init.h>
+#include <linux/mm.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/set_memory.h>
+#include <linux/sort.h>
+#include <linux/suspend.h>
+
+#include "contiguous.h"
+
+#define DMA_LENDABLE_DISABLED	-1
+
+static struct cma *lendable_areas[MAX_CMA_AREAS] __ro_after_init;
+static unsigned int nr_lendable_areas __ro_after_init;
+static atomic_t dma_lendable_active;
+
+static int __lendable_cmp(const void *a, const void *b)
+{
+	const struct cma *cma_a = *(struct cma * const *)a;
+	const struct cma *cma_b = *(struct cma * const *)b;
+
+	return cmp_int(cma_get_base(cma_a), cma_get_base(cma_b));
+}
+
+static bool cma_is_lendable(struct cma *cma)
+{
+	return cma && bsearch(&cma, lendable_areas, nr_lendable_areas,
+			      sizeof(lendable_areas[0]), __lendable_cmp);
+}
+
+static bool cma_has_range(struct cma *cma, struct page *page, unsigned int nr_pages)
+{
+	phys_addr_t start = page_to_phys(page);
+	phys_addr_t end = start + ((phys_addr_t)nr_pages << PAGE_SHIFT);
+	phys_addr_t base = cma_get_base(cma);
+
+	return start >= base && end <= base + cma_get_size(cma);
+}
+
+/**
+ * dma_zap_direct_map() - Remove a DMA page range from the kernel direct map
+ * @dev:	Device that allocated the pages (or NULL for default CMA pool)
+ * @page:	First page of the memory region
+ * @size:	Page-aligned size of the memory region in bytes
+ *
+ * Cleans and invalidates caches and removes the memory range from the kernel
+ * direct map to prevent speculative CPU accesses. Must be paired with
+ * dma_restore_direct_map().
+ *
+ * Context: Any context if allocated from a lendable pool; process context
+ *          (may sleep) otherwise.
+ * Return:
+ * * 0		- Success.
+ * * -EINVAL	- @size is 0 or not page-aligned.
+ * * -ENODEV	- Direct map cannot be modified and @dev has no lendable pool.
+ * * -EFAULT	- @dev has a lendable pool, but [@page, @page + @size) is
+ *		  outside that pool.
+ * * -EBUSY	- Direct map zapping is temporarily disabled (hibernation).
+ */
+int dma_zap_direct_map(struct device *dev, struct page *page, size_t size)
+{
+	unsigned int nr_pages = size >> PAGE_SHIFT;
+	bool from_lendable, has_lendable;
+	struct cma *cma;
+	int ret;
+
+	if (!size || !PAGE_ALIGNED(size))
+		return -EINVAL;
+
+	cma = dev_get_cma_area(dev);
+	has_lendable = cma_is_lendable(cma);
+	from_lendable = has_lendable && cma_has_range(cma, page, nr_pages);
+
+	if (!from_lendable && !can_set_direct_map())
+		return has_lendable ? -EFAULT : -ENODEV;
+
+	/* Provides full ordering */
+	if (!atomic_add_unless(&dma_lendable_active, 1, DMA_LENDABLE_DISABLED))
+		return -EBUSY;
+
+	ret = arch_dma_zap_direct_map(page, nr_pages, from_lendable);
+	if (ret)
+		atomic_dec(&dma_lendable_active);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(dma_zap_direct_map);
+
+/**
+ * dma_restore_direct_map() - Restore a zapped DMA page range in the direct map
+ * @dev:	Device that allocated the pages (or NULL for default CMA pool)
+ * @page:	First page of the memory region
+ * @size:	Page-aligned size of the memory region in bytes
+ *
+ * Restores the default kernel direct mapping and invalidates caches for a range
+ * previously zapped with dma_zap_direct_map().
+ *
+ * Context: Any context if allocated from a lendable pool; process context
+ *          (may sleep) otherwise.
+ */
+void dma_restore_direct_map(struct device *dev, struct page *page, size_t size)
+{
+	unsigned int nr_pages = size >> PAGE_SHIFT;
+	bool from_lendable;
+	struct cma *cma;
+
+	if (WARN_ON_ONCE(!size || !PAGE_ALIGNED(size)))
+		return;
+
+	cma = dev_get_cma_area(dev);
+	from_lendable = cma_is_lendable(cma) && cma_has_range(cma, page, nr_pages);
+
+	if (WARN_ON_ONCE(!from_lendable && !can_set_direct_map()))
+		return;
+
+	if (WARN_ON_ONCE(arch_dma_restore_direct_map(page, nr_pages, from_lendable)))
+		return;
+
+	WARN_ON_ONCE(atomic_dec_return_release(&dma_lendable_active) < 0);
+}
+EXPORT_SYMBOL_GPL(dma_restore_direct_map);
+
+static int dma_lendable_pm_notify(struct notifier_block *nb,
+				  unsigned long mode, void *data)
+{
+	/* Prevent hibernation while unmapped pages may be inaccessible */
+	switch (mode) {
+	case PM_HIBERNATION_PREPARE:
+	case PM_RESTORE_PREPARE:
+		if (atomic_cmpxchg_acquire(&dma_lendable_active, 0, DMA_LENDABLE_DISABLED))
+			return notifier_from_errno(-EBUSY);
+		break;
+	case PM_POST_HIBERNATION:
+	case PM_POST_RESTORE:
+		atomic_cmpxchg(&dma_lendable_active, DMA_LENDABLE_DISABLED, 0);
+		break;
+	}
+
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block dma_lendable_pm_nb = {
+	.notifier_call	= dma_lendable_pm_notify,
+};
+
+static int __init dma_lendable_init(void)
+{
+	unsigned int i, nr = 0;
+
+	for (i = 0; i < nr_lendable_areas; i++) {
+		struct cma *cma = lendable_areas[i];
+
+		if (!arch_dma_is_lendable(phys_to_page(cma_get_base(cma)),
+					  cma_get_size(cma) >> PAGE_SHIFT)) {
+			pr_warn("Ignoring %s: not lendable\n", cma_get_name(cma));
+			continue;
+		}
+
+		lendable_areas[nr++] = cma;
+	}
+	nr_lendable_areas = nr;
+
+	sort(lendable_areas, nr_lendable_areas, sizeof(lendable_areas[0]), __lendable_cmp, NULL);
+
+	register_pm_notifier(&dma_lendable_pm_nb);
+
+	return 0;
+}
+core_initcall(dma_lendable_init);
+
+#ifdef CONFIG_OF_RESERVED_MEM
+static int __init rmem_lendable_validate(unsigned long node,
+					 phys_addr_t *align)
+{
+	return rmem_cma_ops.node_validate(node, align);
+}
+
+static int __init rmem_lendable_fixup(unsigned long node, phys_addr_t base,
+				      phys_addr_t size)
+{
+	int ret = rmem_cma_ops.node_fixup(node, base, size);
+
+	if (ret)
+		return ret;
+
+	return arch_dma_mark_lendable(base, size);
+}
+
+static int __init rmem_lendable_setup(unsigned long node,
+				      struct reserved_mem *rmem)
+{
+	int ret = rmem_cma_ops.node_init(node, rmem);
+
+	if (ret)
+		return ret;
+
+	lendable_areas[nr_lendable_areas++] = rmem->priv;
+
+	return 0;
+}
+
+static int rmem_lendable_device_init(struct reserved_mem *rmem,
+				     struct device *dev)
+{
+	return rmem_cma_ops.device_init(rmem, dev);
+}
+
+static void rmem_lendable_device_release(struct reserved_mem *rmem,
+					 struct device *dev)
+{
+	rmem_cma_ops.device_release(rmem, dev);
+}
+
+static const struct reserved_mem_ops rmem_lendable_ops = {
+	.node_validate	= rmem_lendable_validate,
+	.node_fixup	= rmem_lendable_fixup,
+	.node_init	= rmem_lendable_setup,
+	.device_init	= rmem_lendable_device_init,
+	.device_release	= rmem_lendable_device_release,
+};
+
+RESERVEDMEM_OF_DECLARE(cma_lendable, "lendable-dma-pool", &rmem_lendable_ops);
+#endif /* CONFIG_OF_RESERVED_MEM */
-- 
2.56.0.542.g3ef89b7020-goog

