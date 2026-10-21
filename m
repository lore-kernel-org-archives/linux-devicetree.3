Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571502;
	b=MN3DzEk9mS94RqrZrl4/kEK2PLpp8TDkrt7dx1TfgFxqa+v9nX2Bk8ZTCCkXI+Poiuu7
	 QD/O98+rvvao5b8xHEGoB5vzTjD3ofqPhjmLp+rrUv+djTLVLZ5u6tyYTVk7noXK4h5uT
	 SG6BqF9tqLamxafxBhwefVAU/yCNfJBmnY+wbf2CUnbNUZE7/N9Sdsztb8ekMq0NffkpW
	 JfPOYdELjqKpLCkT0ijMtZDvjTKpcDHvKwJuV3/pTFK0PmUuPW0vRvyNMmcNIJPPb33eq
	 mZtuv7JCubFB180/rq5OhtbiiO4AF1L+cmZZ9yw1wqWkru7IrXfMftE+ncb2n8mEsow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fKpfFiVoVVnNbFsiCGN8s68JTp1We4GBLmYun2RkI28=;
	b=Q9t6jpBpN46LBVTeGsmut8rLNEHaRoxR6/ePR5BqnsTSoSpIkVd+QQOJHkefu3CezjXX
	 +7SZJnp/4AGH8DJHmGoHVULtD0w+WIWDKZ88rt4P7tk4wpMZQKkpmneFkZRnDE+FaNy2h
	 IF0DaXJ2Cedn9cwaAUS2uStZvtyqM5l42itdO6p7b/Ucm5DCdsfS5NG4pSuWZr1AW+2Ri
	 PqKDQJRh4cvMM2cYZ+ZbZOE3sLMiTsqO2A2UtXkXiQc7VJAe6iKAOT9H8fVNOdZ9DymdD
	 LSopymS+5NfTjh3Fk7Wo4uLyhj9IoznJOWpVCvuP3nlqNwnMIMBAoFh9GJ6tWlviiew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jBEfUTrd;
	arc=none smtp.remote-ip=74.125.228.2
Received: from mail-pz2-f2.google.com (mail-pz2-f2.google.com [74.125.228.2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D529606A31D
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:31:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D529606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jBEfUTrd
Received: by mail-pz2-f2.google.com with SMTP id 41be03b00d2f7-ccc451ef3a7so38750a12.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 01:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792571502; x=1793176302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fKpfFiVoVVnNbFsiCGN8s68JTp1We4GBLmYun2RkI28=;
        b=jBEfUTrdfdBcSWknoKHLJYkJdG01vXcbAJqJ2+EfnqqGb4ymvWtlyQJP825JV07TvM
         jeopiVAsqlgnz30r5RgKYKSsV3ufgtOhl9DD9bS7znK5E82o9kkltOpVBsE8VSa2izNy
         kbrA2wXp/d1CtwkjymqmIRYuteVXYU+/fLslfjOOJXcDH5KH/RDogZyijTiUI+Nb5yP9
         T4kBHaQDs1jaN2j2SnKRFWCA3I7EpR+Jwrel2i/pfTQelMzWtfqwvH6CYNDsKiLgRkU+
         udeSXp08L3R3e9pdx5VfDoH/uOFZIIVTy2j54JRqHAnlPkWm+S7UO0TvaT9rEmH+Ex18
         DwXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571502; x=1793176302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fKpfFiVoVVnNbFsiCGN8s68JTp1We4GBLmYun2RkI28=;
        b=EbUi7LkR8gSrlpe/5CygpioaO/57Es3gkom2JfM4tOdQyzfYlTvlFtxuArdudSRdTI
         jSdGo+fyAezBvIvzHauCmjyvPD1UWTHSkw3Cohkljc2wHVCIsd4Cy62yzBnGwzu4/2UG
         AGSUBJZ7CctcCMDwsJ5SXfcyOmWgbgt2GDMc9WwGLHMukzFXeC+odnm/Gzan3jUIPkfZ
         9mKuT6UV7dFoVUpDzja5RzgcfzifGAGAHEWxOfdKIDhBdXKI7lzDh90M/cxR7yTZvG6E
         G7z/XilwcFBTpx5iF5+4ezidK+f1ZEJzyWa6SoZTdjv1KE6TZ5/pYymXWLqhl6ciVBov
         eogQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLGOJ/Sex1R3UIx2HU832HFMi3PziD+a6GcFrVOHwCgzsltMFWiMO2Ar61sOtC+dmpn1GlGYBWW75o@vger.kernel.org
X-Gm-Message-State: AFq9FYLkmatb7hSpg4G+xFPLUNbTaDhcv133eWlV19zt66VyxzqdcQyI
	P5J8DUDATOTD0wtNleWhgpjA7/ueOznWN2cJ0DsjvZdf8XpUpgzLftfH
X-Gm-Gg: AYBFou1/GOerc34Sq9x6uzH9dWTBac3dlMF9T6Bw0cVz13mHTyutSlXn4Zql6c2vkVj
	D3LM4RmJEgwlT7N1xZDSE1hGKIxVxbYjAyGI/JNBSY6DEghyMZnxlFOGJf76clfkrxMuaZZd/+D
	9NOYgHviQRcHzGIQsvv598PSVN/poGhQnieXYsBbL3y4kAn2Ls/YL72RqHfKhSkIa2mAE8IeyH4
	ljhh6bWrLjiz3sB4xzu8PCg5xU6QO9XItCCLcXBpgk5V8V85R5LySNKgQ1v1/cKjzXu7ripZ3KK
	O3/pIpOp/YHnFvozn9EVheznQD0YINaun4iqCBsLOczpT0wbnZTqUb/dY1Zi+cnLqFmrzG1UMtP
	RxxyBWikxT+Ue6+6H6H8S/BkVsTbY0Ay8zWtvK3WWixoyTGC4ux9PRA25jC+xtGNCaxyq77lod9
	aCPQbByGR0Fwg7DKuWGKHRSrdrQmiLfJOE3CKWQBheVPEb/ELYBzLOOf4LFSfVnWfEVV+SJ95v7
	FLPk0Q+AX6eu+5P4CS5x5MvuxjwSrHFkioyo4oK6Tu9bAolAVUfruc1O+SjEcrx6lkrnCOxpzg9
	JaQNyS8polveRA==
X-Received: by 2002:a05:6a00:2d12:b0:882:e366:d99f with SMTP id d2e1a72fcca58-8a089d871famr1118755b3a.51.1792571501524;
        Wed, 21 Oct 2026 01:31:41 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895e273bsm600653b3a.41.2026.10.21.01.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:31:39 -0700 (PDT)
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
Subject: [PATCH v9 5/8] memblock: introduce MEMBLOCK_NODUMP flag
Date: Wed, 21 Oct 2026 16:30:08 +0800
Message-ID: <20261021083011.2170525-6-chenwandun1@gmail.com>
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
index 40e6e0aa2f8d..67dbcfda6f49 100644
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
index a450092a80fb..ab1432241432 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -1221,6 +1221,21 @@ __init int memblock_clear_kho_noprsrv(phys_addr_t base, phys_addr_t size)
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
@@ -2854,6 +2869,7 @@ static const char * const flagname[] = {
 	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
 	[ilog2(MEMBLOCK_KHO_NOPRSRV)] = "KHO_NOPRSRV",
 	[ilog2(MEMBLOCK_RSRV_HUGETLB)] = "RSV_HUGETLB",
+	[ilog2(MEMBLOCK_NODUMP)] = "NODUMP",
 };
 
 static int memblock_debug_show(struct seq_file *m, void *private)
-- 
2.43.0

