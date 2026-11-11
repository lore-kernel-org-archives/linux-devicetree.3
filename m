Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395321;
	b=vmunUD6YX1l58TGFtDdN0rlt2v3jYk94fbFcxCyC9oOJpdE3jJ6h0KDwV3QZOCvfX3HX
	 9iotP0hNmyKuJwmM5biEq7O3/fd1GgM38WidM3Nj35hYtXno1OuKVt1MuNyJrVer9Q8D6
	 2Ig8huNJe6mP15iosBR0c4VaSvFcP844Yf5QFDBBouTocuNzyj9gKGe6hpz6apVTwcBzf
	 ZXfSweJHQRSeLBew/d5GpTY8ezsP7b1ck2uBKNaBL7jR+pGlh4QXrMBveyg2wDCxPtkZ5
	 eEyp8Yeh1gigCHb83aIsM+R32lcVSIa+DqVGjUxEHturFzz9J40pJurS0rvjDHKU5fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=k28NXrt+XbqyfRaacENrrFfeZjq4XEJuuf/YvC8HY10=;
	b=ZTk9cyoPAeLAAEe6lgKqr7eLnwxzBHYONCDkxdk8LXcWoSt67bYz400vDEaPfMmQergF
	 WFO7bx6k0q+LIvOH+bPwj8lVXeelrdV+u29/bZ4Ab+izkufLM0P3bShYf8hitPIdoPpg9
	 JwZEtV+VvAMN7YeYpENQiYMslPVWiSkl6wg6RQGhPneFEZkpKRMlXtYJYSDzEWRwhPtAs
	 gdkpAAV4aHWbXRlsnoBRPw2d6NmXy/VlFVv2cYTIDy6cQe4u5tH5np9NjlTPo+UsACY/c
	 XjkphMRAFhFzzeJ0bKTMxJ5YwqZXabQhmRfAzegvKuXLQutvaHhbadr8lsMYJAP0TMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=l4mOgq0h;
	arc=none smtp.remote-ip=209.85.208.70
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7978560A6F4A
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7978560A6F4A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=l4mOgq0h
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6b70d5bd731so3795561a12.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 03:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794395320; x=1795000120; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k28NXrt+XbqyfRaacENrrFfeZjq4XEJuuf/YvC8HY10=;
        b=l4mOgq0hG4+x/aPb9r5jZOiMGrN7PpualF2jDawJgvE+Z3AR3yfQwkqCvGiCxKdqOq
         rqhWN1xAX5f3cnabbxI2SOUm7x+PCOdof0MMOy3c1xiLLehNNMkQuYKue5pAGNooWxAG
         PbzRBTiDlTKuUKF2MVSj3GrzHww9wG+Q7KCDpazxPdq42IKMz6ciVAoxaVXAI6VogKAR
         /If47/pVKsDmUQKjIdZQwx2Nv1AjNUH7/v3Sx4roI4kbuQ3jA93N+3myHRgdVI6Tu45E
         GoRtBGUCfckkucv73/rOaRxzJzsFzZXKvBpv60Ke1d1FU9VUi0SdIvGqQX+beChEH4by
         umdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395320; x=1795000120;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k28NXrt+XbqyfRaacENrrFfeZjq4XEJuuf/YvC8HY10=;
        b=AtlCdGopm4nv0QDE3JLUS4m2pMUOzcphAMCoXe5yQs2oDHeMiz90ubzHxJv4e8fN5F
         dPnKXcoNBjdk3yG7/Zr8d9cW556Jygx3WdNRXLznNiBdkvOT+VnyOi6jQ4gRwpuNFMEW
         umJNBI4WSx/Wwa5dpjgBsGozVXcyOuW6W7031dUkcwm4VIr7n9HoGNfIlkNk7BJvQ2Ag
         Wj0Vbq6urafHAnOfRd5dvNRS8KZI+8M4bcRNBy8TA3jq/296H4KPdybP6WdeRmDe0e+u
         Af0TdOoDyV/I5JrkwyjJ4PT3rqvwOznDCNuzJ58/Lv4J/U+lyKIred7Lgg1Zj7AQXVuU
         9uLQ==
X-Forwarded-Encrypted: i=1; AL+hErG4yzwcRYUtxReVLXjSafhYsh7hTP5X2n5X3xrVtgtioAgJnx7TyKkftZUHUTRJhzmy//xkTCAkGUKc@vger.kernel.org
X-Gm-Message-State: APuU4Z+YThL5o+tM/qCU3Me+DiBsbgc+TdiNeOigOKCYB03n6PZHiJyu
	KxfK+96q6848w3gP04rRbbGnumEzUQoN+8B7krsGaQjv8shKcqKvELaOnKzcvuLvkNICaVGd9Af
	/qcXMAROUWES5hPye5huPOw==
X-Received: from ejxe15.prod.google.com ([2002:a17:906:81cf:b0:c3f:75a:4837])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:2d2c:b0:c50:6222:7b1c with SMTP id a640c23a62f3a-c5066cc68c2mr168857666b.23.1794395319574;
 Wed, 11 Nov 2026 03:08:39 -0800 (PST)
Date: Wed, 11 Nov 2026 11:07:37 +0000
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
Message-ID: <20261111110738.872947-8-vdonnefort@google.com>
Subject: [PATCH v3 7/8] arm64: Add support for lendable-dma-pool
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

Even when the linear map uses block mappings, regions marked with
MEMBLOCK_PTEMAP are mapped at page granularity and can be modified at
runtime. Implement the architecture hooks for the lendable-dma-pool to
force the last-level mappings, validate ranges and update the direct
mapping.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/Kconfig                  |  1 +
 arch/arm64/include/asm/set_memory.h |  2 +
 arch/arm64/mm/dma-mapping.c         | 71 +++++++++++++++++++++++++++++
 arch/arm64/mm/pageattr.c            | 56 ++++++++++++++++++-----
 4 files changed, 118 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 1075bc661833..34fe7a7eea82 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -117,6 +117,7 @@ config ARM64
 	select DYNAMIC_FTRACE if FUNCTION_TRACER
 	select DMA_BOUNCE_UNALIGNED_KMALLOC
 	select DMA_DIRECT_REMAP
+	select DMA_LENDABLE if DMA_CMA
 	select EDAC_SUPPORT
 	select FRAME_POINTER
 	select FUNCTION_ALIGNMENT_4B
diff --git a/arch/arm64/include/asm/set_memory.h b/arch/arm64/include/asm/set_memory.h
index b6ec938703d6..ec8bbb59e51f 100644
--- a/arch/arm64/include/asm/set_memory.h
+++ b/arch/arm64/include/asm/set_memory.h
@@ -17,6 +17,8 @@ int set_memory_valid(unsigned long addr, int numpages, int enable);
 
 int set_direct_map_invalid_noflush(struct page *page, unsigned int numpages);
 int set_direct_map_default_noflush(struct page *page, unsigned int numpages);
+int __set_direct_map_invalid_noflush(struct page *page, unsigned int numpages);
+int __set_direct_map_default_noflush(struct page *page, unsigned int numpages);
 bool kernel_page_present(struct page *page);
 
 int set_memory_encrypted(unsigned long addr, int numpages);
diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
index 7f6f2f40dba2..c324e9826ce2 100644
--- a/arch/arm64/mm/dma-mapping.c
+++ b/arch/arm64/mm/dma-mapping.c
@@ -7,9 +7,13 @@
 #include <linux/gfp.h>
 #include <linux/cache.h>
 #include <linux/dma-map-ops.h>
+#include <linux/kernel.h>
+#include <linux/memblock.h>
 #include <xen/xen.h>
 
 #include <asm/cacheflush.h>
+#include <asm/set_memory.h>
+#include <asm/tlbflush.h>
 #include <asm/xen/xen-ops.h>
 
 void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
@@ -38,6 +42,73 @@ void arch_dma_prep_coherent(struct page *page, size_t size)
 	dcache_clean_poc(start, start + size);
 }
 
+#ifdef CONFIG_DMA_LENDABLE
+int __init arch_dma_mark_lendable(phys_addr_t base, phys_addr_t size)
+{
+	if (!PAGE_ALIGNED(base | size))
+		return -EINVAL;
+
+	return memblock_mark_ptemap(base, size);
+}
+
+bool __init arch_dma_is_lendable(struct page *page, unsigned int nr_pages)
+{
+	return direct_map_is_ptemap(page, nr_pages);
+}
+
+int arch_dma_zap_direct_map(struct page *page, unsigned int nr_pages,
+			    bool from_lendable)
+{
+	unsigned long start = (unsigned long)page_address(page);
+	unsigned long end = start + ((unsigned long)nr_pages << PAGE_SHIFT);
+	int ret;
+
+	/*
+	 * arch_dma_prep_coherent() only cleans as normal DMA buffers retain a
+	 * cacheable linear-map alias. Since that alias is being removed here,
+	 * also invalidate to make sure they can't be evicted later on while the
+	 * memory is secured.
+	 */
+	dcache_clean_inval_poc(start, end);
+
+	if (from_lendable) {
+		ret = __set_direct_map_invalid_noflush(page, nr_pages);
+	} else {
+		might_sleep();
+		ret = set_direct_map_invalid_noflush(page, nr_pages);
+	}
+
+	if (ret)
+		return ret;
+
+	flush_tlb_kernel_range(start, end);
+
+	return 0;
+}
+
+int arch_dma_restore_direct_map(struct page *page, unsigned int nr_pages,
+				bool from_lendable)
+{
+	unsigned long start = (unsigned long)page_address(page);
+	unsigned long end = start + ((unsigned long)nr_pages << PAGE_SHIFT);
+	int ret;
+
+	if (from_lendable) {
+		ret = __set_direct_map_default_noflush(page, nr_pages);
+	} else {
+		might_sleep();
+		ret = set_direct_map_default_noflush(page, nr_pages);
+	}
+
+	if (ret)
+		return ret;
+
+	dcache_inval_poc(start, end);
+
+	return 0;
+}
+#endif /* CONFIG_DMA_LENDABLE */
+
 void arch_setup_dma_ops(struct device *dev, bool coherent)
 {
 	int cls = cache_line_size_of_cpu();
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index c7662fd2fcb2..467a420af0f5 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -167,8 +167,8 @@ bool __init direct_map_is_ptemap(struct page *page, unsigned int numpages)
 						      NULL, NULL);
 }
 
-static int update_range_prot(unsigned long start, unsigned long size,
-			     pgprot_t set_mask, pgprot_t clear_mask)
+static int __update_range_prot(unsigned long start, unsigned long size,
+			       pgprot_t set_mask, pgprot_t clear_mask)
 {
 	struct page_change_data data;
 	int ret;
@@ -176,10 +176,6 @@ static int update_range_prot(unsigned long start, unsigned long size,
 	data.set_mask = set_mask;
 	data.clear_mask = clear_mask;
 
-	ret = split_kernel_leaf_mapping(start, start + size);
-	if (WARN_ON_ONCE(ret))
-		return ret;
-
 	lazy_mmu_mode_enable();
 
 	/*
@@ -194,6 +190,18 @@ static int update_range_prot(unsigned long start, unsigned long size,
 	return ret;
 }
 
+static int update_range_prot(unsigned long start, unsigned long size,
+			     pgprot_t set_mask, pgprot_t clear_mask)
+{
+	int ret;
+
+	ret = split_kernel_leaf_mapping(start, start + size);
+	if (WARN_ON_ONCE(ret))
+		return ret;
+
+	return __update_range_prot(start, size, set_mask, clear_mask);
+}
+
 static int __change_memory_common(unsigned long start, unsigned long size,
 				  pgprot_t set_mask, pgprot_t clear_mask)
 {
@@ -316,28 +324,52 @@ int set_memory_valid(unsigned long addr, int numpages, int enable)
 					__pgprot(PTE_PRESENT_VALID_KERNEL));
 }
 
-int set_direct_map_invalid_noflush(struct page *page, unsigned int numpages)
+int __set_direct_map_invalid_noflush(struct page *page, unsigned int numpages)
 {
 	pgprot_t clear_mask = __pgprot(PTE_PRESENT_VALID_KERNEL);
 	pgprot_t set_mask = __pgprot(PTE_PRESENT_INVALID);
 
+	return __update_range_prot((unsigned long)page_address(page),
+				   PAGE_SIZE * numpages, set_mask, clear_mask);
+}
+
+int set_direct_map_invalid_noflush(struct page *page, unsigned int numpages)
+{
+	unsigned long start = (unsigned long)page_address(page);
+	int ret;
+
 	if (!can_set_direct_map())
 		return 0;
 
-	return update_range_prot((unsigned long)page_address(page),
-				 PAGE_SIZE * numpages, set_mask, clear_mask);
+	ret = split_kernel_leaf_mapping(start, start + PAGE_SIZE * numpages);
+	if (WARN_ON_ONCE(ret))
+		return ret;
+
+	return __set_direct_map_invalid_noflush(page, numpages);
 }
 
-int set_direct_map_default_noflush(struct page *page, unsigned int numpages)
+int __set_direct_map_default_noflush(struct page *page, unsigned int numpages)
 {
 	pgprot_t set_mask = __pgprot(PTE_PRESENT_VALID_KERNEL | PTE_WRITE);
 	pgprot_t clear_mask = __pgprot(PTE_PRESENT_INVALID | PTE_RDONLY);
 
+	return __update_range_prot((unsigned long)page_address(page),
+				   PAGE_SIZE * numpages, set_mask, clear_mask);
+}
+
+int set_direct_map_default_noflush(struct page *page, unsigned int numpages)
+{
+	unsigned long start = (unsigned long)page_address(page);
+	int ret;
+
 	if (!can_set_direct_map())
 		return 0;
 
-	return update_range_prot((unsigned long)page_address(page),
-				 PAGE_SIZE * numpages, set_mask, clear_mask);
+	ret = split_kernel_leaf_mapping(start, start + PAGE_SIZE * numpages);
+	if (WARN_ON_ONCE(ret))
+		return ret;
+
+	return __set_direct_map_default_noflush(page, numpages);
 }
 
 int __set_memory_enc_dec(unsigned long addr, int numpages, bool encrypt)
-- 
2.56.0.542.g3ef89b7020-goog

