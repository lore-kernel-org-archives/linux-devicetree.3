Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395321;
	b=3aDV8spYnxkBv0NCKXYoUgGps3iN+m43UGg80Y9/+ZdeLqAJgj/zStp+QxCXSe/oApCJ
	 RhhZGl90dvJiB7EtaEwJfqBa43WAv6ncN93bM9AMoBY2R0ZeVrjt71B8+0j5NPiRotabJ
	 B7qEl3Np0A8ldAziQ85DhdFdlMBlDsHjQ7ArQP2zNzHLGeSDl0N2yvEFirx5+U2Arng9s
	 JV/inSh567mqTx+PuqshptDu4cmZd6L+7HP6aSNqAzRFq0WzzpjmwzFaKByWnPLngltMe
	 kk0PkJ3sL8bqq1xk4DWNMgvZFJoKIbXgLEjc7wNKu3NE6AS5R+RbV15lYMiOHx41+jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=laMYshk/IpUNzmzRXv9ltVTwYgsKb/6KaHojH4Vu9w4=;
	b=my5qD/gOx8LGYxBzaVFwMHqbKavyQIyCDR3jOXG23aZxSzEU6fFv7DRCYw1My8KvMXRT
	 50N/26ZRVi5kh19xQ0i2apTvMNIJpFte7ebMhVrBgbpoDhOLPdUvJdmwt2yryFt/oS+ue
	 jKvArLPgBLrl4CnT5QoSapWVhNLO8i29WpsAzg0d3U//GPWuGUeqxiRD87SibZhtshnuG
	 0s3COhTKY/OpglM5cwG8mqYfb76oWlkm2/TntSDDkRXq8neb0M/aGmeW1tvDDXekwf5c0
	 lScE/d0vBIk6chjmPDZOuWvr0fOb3EgM/qwia+veSQjlncBhVZPSd5RvEPUnRYG731A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=puM0BbwE;
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827EF60A5BEA
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 827EF60A5BEA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=puM0BbwE
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4b764ffc014so28042785e9.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 03:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794395319; x=1795000119; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=laMYshk/IpUNzmzRXv9ltVTwYgsKb/6KaHojH4Vu9w4=;
        b=puM0BbwEjxeAx/oGl/9L83Si9v3yW67DhgA9gxKCc6JsL0sl9pVdwe9YiwnsUQ20Bb
         gvLiL27u1MIb+u2vp3uVMkrE6PX5zRQrBQnnJjCdC1Umg93fkJwvyjwBPu2TJskWBjdn
         xcNSizT/zRLKQluyWbndgEbymxuuCtspM0GfchIMSMXIgBmNRikQFORYEIjXuWSPij63
         CsTUgHBVwc70ihChIhY2+Il59BoiJntolJWivvnUZ5TipFrnMOqGrWXS9NDk27E/BT8L
         TjKiK7tj/CLx8sUriHlxq47J0QLz8h3YPm0pL58KvkTp/WKdHYJUKlrev0ftSp+Eg7i1
         MibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395319; x=1795000119;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=laMYshk/IpUNzmzRXv9ltVTwYgsKb/6KaHojH4Vu9w4=;
        b=R1U/CG8W5lR0lL2YZof/gBKROJeygx5Oidsx3aZNh7OCKR9KGrQSUGz4S/es2xhzes
         FEmNEMSrGpyxC+M2UrZ4rbjInenxen+0TNanRzJulR9xT2vUFK/eEHK6U/6gHSuJoPMN
         RkCQhUywBMkZRbxeJnsMLCRRL96l82w9fwSVQ8NrDBO7caKX2eCaawpYU4XYyAzLP4nB
         52ZOKcyDC1RMcjtVssDPdnl5MFCajAbuuSbATjAhgTeFGCAIeVFSLjDkP01zFKvD8rHV
         SS7samJIDUyPZfDBnvXROpBQcBJo+tYY3Rb5uzTBXUapomJ9MHOEbS5npM8uR6on8btT
         KN0g==
X-Forwarded-Encrypted: i=1; AL+hErEQc1AlGB+7VAIVzZRnrRsohf5WoNe4RiH5HkbqbGCI9pByo56+GmlXMHtks9rj7AYvAppH4Wai4Flr@vger.kernel.org
X-Gm-Message-State: APuU4Z9QIg0v8vfQQ2bXRHp0q8HxfLG6rJ8zDC3gb9YjvSWuUGriSQ4q
	33MbSp2uOQdgkrPVfFXCysOIV9bxKZBGrC3NtnB9wPajrCYKGTadf+FtULMtVFfMVlbWSs165YW
	l3LRjzB2AUAe+lXZZscH8EQ==
X-Received: from wmbgx4.prod.google.com ([2002:a05:600c:8584:b0:4a1:cf4b:72c2])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1912:b0:4b2:612d:908c with SMTP id 5b1f17b1804b1-4ba093d13f1mr36933745e9.34.1794395318533;
 Wed, 11 Nov 2026 03:08:38 -0800 (PST)
Date: Wed, 11 Nov 2026 11:07:36 +0000
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
Message-ID: <20261111110738.872947-7-vdonnefort@google.com>
Subject: [PATCH v3 6/8] arm64: Introduce direct_map_is_ptemap()
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

Regions marked with MEMBLOCK_PTEMAP are mapped at page granularity so
their direct mapping can be modified without splitting blocks at
runtime. Introduce direct_map_is_ptemap(), which walks the kernel page
tables during init to verify that every page in a range is backed by a
present non-contiguous PTE.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/include/asm/set_memory.h |  4 ++
 arch/arm64/mm/pageattr.c            | 65 +++++++++++++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/arch/arm64/include/asm/set_memory.h b/arch/arm64/include/asm/set_memory.h
index 0091ba12200e..b6ec938703d6 100644
--- a/arch/arm64/include/asm/set_memory.h
+++ b/arch/arm64/include/asm/set_memory.h
@@ -3,12 +3,16 @@
 #ifndef _ASM_ARM64_SET_MEMORY_H
 #define _ASM_ARM64_SET_MEMORY_H
 
+#include <linux/init.h>
+
 #include <asm/mem_encrypt.h>
 #include <asm-generic/set_memory.h>
 
 bool can_set_direct_map(void);
 #define can_set_direct_map can_set_direct_map
 
+bool __init direct_map_is_ptemap(struct page *page, unsigned int numpages);
+
 int set_memory_valid(unsigned long addr, int numpages, int enable);
 
 int set_direct_map_invalid_noflush(struct page *page, unsigned int numpages);
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index de7bf95003ea..c7662fd2fcb2 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -102,6 +102,71 @@ bool can_set_direct_map(void)
 		arm64_kfence_can_set_direct_map() || is_realm_world();
 }
 
+static int __init direct_map_is_ptemap_pud_entry(pud_t *pud, unsigned long addr,
+						 unsigned long next,
+						 struct mm_walk *walk)
+{
+	if (pud_leaf(pudp_get(pud)))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int __init direct_map_is_ptemap_pmd_entry(pmd_t *pmd, unsigned long addr,
+						 unsigned long next,
+						 struct mm_walk *walk)
+{
+	if (pmd_leaf(pmdp_get(pmd)))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int __init direct_map_is_ptemap_pte_entry(pte_t *pte, unsigned long addr,
+						 unsigned long next,
+						 struct mm_walk *walk)
+{
+	pte_t val = __ptep_get(pte);
+
+	if (!pte_present(val) || pte_cont(val))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int __init direct_map_is_ptemap_pte_hole(unsigned long addr,
+						unsigned long next, int depth,
+						struct mm_walk *walk)
+{
+	return -EINVAL;
+}
+
+static const struct mm_walk_ops direct_map_is_ptemap_ops __initconst = {
+	.pud_entry	= direct_map_is_ptemap_pud_entry,
+	.pmd_entry	= direct_map_is_ptemap_pmd_entry,
+	.pte_entry	= direct_map_is_ptemap_pte_entry,
+	.pte_hole	= direct_map_is_ptemap_pte_hole,
+};
+
+bool __init direct_map_is_ptemap(struct page *page, unsigned int numpages)
+{
+	unsigned long addr, end;
+
+	if (!pfn_valid(page_to_pfn(page)) || !numpages)
+		return false;
+
+	addr = (unsigned long)page_address(page);
+	end = addr + PAGE_SIZE * numpages;
+
+	/*
+	 * Called during boot before runtime linear-map splitting, so it is
+	 * safe to walk the page-table lockless.
+	 */
+	return !walk_kernel_page_table_range_lockless(addr, end,
+						      &direct_map_is_ptemap_ops,
+						      NULL, NULL);
+}
+
 static int update_range_prot(unsigned long start, unsigned long size,
 			     pgprot_t set_mask, pgprot_t clear_mask)
 {
-- 
2.56.0.542.g3ef89b7020-goog

