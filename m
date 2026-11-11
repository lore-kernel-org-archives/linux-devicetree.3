Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395306;
	b=UZG3N0ySOGqMdLKKhRHQyrlUPfoi3DQ/7J0bpMq8sVRcFYhBwzLJGP5GBVFGMykaLRDu
	 4UWrc+o0N4gKAqe7+jG8CdZgkwu+gIe1XqOFaQ7/4JAIlFNX6RAGGMfDoj9wP0sfCDFEW
	 KX926F978mDn8hOZgv6Z1/WmM/0D0O96mfSysNjTEjjFVBQsqViK2oHnovB2T7dhYLRvA
	 z/pMyADKHG17YlmfOAnWeQc0/rxxELOKM8jVgabaHdQcSdLjBUjtj5klmyTF7q24UITXp
	 QDjkFvDunqkGTYxLT9dkhQUtU/hlmQZuk+ZzR06nyzewYCRb7C14KWj7hz2Dv8AM5xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395306;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Pd2LkXH74KyjkxP8lUXKvl1JOnJh/9hivuqWG2OIXns=;
	b=wIcGYqqW8iwGaqMRpBA/VjzhFsMR4BYkQ8Ma8HVH7cAsX6J1T8AFR+XTqBl9g6wJYf+E
	 VJXSMLV+CYVlBmTxQFRChvgQVxB0yj/JIKy9MWTVfR+Nlj+OcDf9/388SAkd4vqpbNXqh
	 ZYjq4PFz9h3Dh2KSus67qRVwIBj2hgNDiXbSzS9HdGMes2A6YFcs9bQor+zcbxmAx2RFY
	 C6WiarGrQ0gWA00Dnx8ShlbbJYvThEc6jb5Uu0bsODDjlOTyAwNwX39jXIjAC4NRiVJUP
	 FLvaSMaNHz5LOfxkAr40uDwZmjoUkkjMMktEPDx8Yvya1GzSGYRuIPCyRoZc64Le9vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="h6Y+E/uc";
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F06E60A2625
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:08:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F06E60A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=h6Y+E/uc
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a318cd95e8so25878795e9.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 03:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794395305; x=1795000105; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pd2LkXH74KyjkxP8lUXKvl1JOnJh/9hivuqWG2OIXns=;
        b=h6Y+E/ucqc3EVmLa8QhSV93ACXecZTrA0nYIpydYrLi9qsrTMisfAbXuCJm3Kwxnk+
         wNaoEJBy/T+3h2dmiRaPtkz27Pe3cFcRUJ08SSFI6SKkLhwSyh7zhiWc/+1GvJzhcjQl
         MqNj5gxXml1ALp1+MHppFvFpk0/hqA07SaAHojSDlk0E2vhyP9VL6hQdw/O0GJq8EaBz
         Gve4dNJ1oGWiVEPFEw2+5QP++UqpRsQvR/jrPGUgnnxgMSyVP4LVIQPsSli5aZkcgy7r
         y0s3SjHPy1J2lgNj8b0F2523j1GKVmrQPJDWbrpGmfqKxyk6u/kAfmXk64EeR+fAtRZh
         i/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395305; x=1795000105;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pd2LkXH74KyjkxP8lUXKvl1JOnJh/9hivuqWG2OIXns=;
        b=tqPrXBsWtEED84K+waIvpH9CLapdPLMFLuoy5ypEkNgpz2fUehDmC6jVBlCOCQpJPK
         yMuQ82naCdxH+dM7tH2lt/E2nPBPdt6AoyD4PqmgYLVvyp8kQIsRu2CifozyIQl+DDc4
         1RNFxcBIfQnpEdDpJXk3PIOJWBTa4XkI3dt/8GB2/kbGmMJFTLTYVCdhWpQuHUU60F50
         noMNawXsmaz2Hn32DLzxOnVmbbqxfwg3wS46dec3tkAeQP1MzJ1LXJgxDb6i+xtikD+6
         yFjc96wI+5OG/Wjuj2W/DWjPKfI1ACndgDayOgHc9TQKUaejxf/SABhUQWcS7+J3jKvc
         iMYQ==
X-Forwarded-Encrypted: i=1; AL+hErFs20K5zBGmQwm/ngB+S2D1ltyjTvf8ZFFm5G5QTRvGJ4UPE0ep5wzcocKJUs36VIlkSTgvkQOdLzVA@vger.kernel.org
X-Gm-Message-State: APuU4Z9glPSmmEi1tmE1ehV+8QvCffP9R89K7YmsK3Q03cdimRBEzAVO
	nc11Jy8jeyKF2mSr0RaQcKz1bnhxNdZGlEKFJgLwHHNbz214qifuBXSrhtCcWCVOPwKdpPoAZa2
	ubgBgoplIdyriDX9Tv5/GVw==
X-Received: from wman16.prod.google.com ([2002:a05:600c:6c50:b0:4a1:e44e:ffd0])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c08b:b0:4ba:4928:8aec with SMTP id 5b1f17b1804b1-4ba49288bdemr21813875e9.9.1794395304668;
 Wed, 11 Nov 2026 03:08:24 -0800 (PST)
Date: Wed, 11 Nov 2026 11:07:32 +0000
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
Message-ID: <20261111110738.872947-3-vdonnefort@google.com>
Subject: [PATCH v3 2/8] arm64: Add support for MEMBLOCK_PTEMAP
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

With the MEMBLOCK_PTEMAP flag, force a PTE-level mapping. This also
disables contiguous PTEs to make sure any page from the memblock can be
safely unmapped from the linear map.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/mm/mmu.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 140520b351e2..a4cafafa1d82 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1184,9 +1184,8 @@ static void __init map_mem(void)
 	phys_addr_t init_begin = __pa_symbol(__init_begin);
 	phys_addr_t init_end = __pa_symbol(__init_end);
 	phys_addr_t kernel_end = __pa_symbol(__bss_stop);
-	phys_addr_t start, end;
 	int flags = NO_EXEC_MAPPINGS;
-	u64 i;
+	struct memblock_region *r;
 
 	/*
 	 * Setting hierarchical PXNTable attributes on table entries covering
@@ -1226,9 +1225,14 @@ static void __init map_mem(void)
 		       flags);
 
 	/* map all the memory banks */
-	for_each_mem_range(i, &start, &end) {
+	for_each_mem_region(r) {
+		phys_addr_t start, end;
+		int rflags = flags;
+
+		if (memblock_is_nomap(r))
+			continue;
 		/*
-		 * for_each_mem_range may return sub-page-aligned boundaries
+		 * for_each_mem_region may return sub-page-aligned boundaries
 		 * after memblock_mark_nomap() splits regions at byte precision.
 		 * __create_pgd_mapping_locked aligns phys down to PAGE_MASK,
 		 * which could accidentally map no-map memory on the boundary.
@@ -1237,17 +1241,21 @@ static void __init map_mem(void)
 		 * regions. The cost is at most one page of unmapped gap at
 		 * each boundary.
 		 */
-		start = PAGE_ALIGN(start);
-		end = end & PAGE_MASK;
+		start = PAGE_ALIGN(r->base);
+		end = (r->base + r->size) & PAGE_MASK;
 		if (start >= end)
 			continue;
+
+		if (memblock_is_ptemap(r))
+			rflags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
+
 		/*
 		 * The linear map must allow allocation tags reading/writing
 		 * if MTE is present. Otherwise, it has the same attributes as
 		 * PAGE_KERNEL.
 		 */
 		__map_memblock(start, end, pgprot_tagged(PAGE_KERNEL),
-			       flags);
+			       rflags);
 	}
 }
 
-- 
2.56.0.542.g3ef89b7020-goog

