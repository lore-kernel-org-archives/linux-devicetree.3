Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9C338A72B
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 06:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781765117; cv=none; b=JmTC2CRgSfVo8iL2X1tGi8iCs6BRJqOylHi1WLeV0mITkgZtWn+n8MZoGXclA8zjIigK98LT6gKlwIeD7nYZeBCzajTP+UaexgQolNW1QopLBBmla+8ao1H1aNsmEK6/+vR/uC6KvVc7OZcY/wXBjYpBZrB+LzJhF6/LbTFj5Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781765117; c=relaxed/simple;
	bh=Nlerjuv8zYT6mH29QAsKXwKO76Dvq+OY7opxSWH52kI=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tWOjRkjzB78f8eyYW7kjtrH4jD1V4Onx4/2dyKOpckbwYsZ7D4YQHLcHhpicAUxQp5L9bMptJbTvWGgAxTJQxufILD+x/nGs0a6CXB6wwEHwwOS6bGQSYYNdHdFMQdvBsJfCrjoiFlI8RFiUZDRgVIWSU+svCetbLKVeY8w3kE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=NnUj05gc; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="NnUj05gc"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c0aa420401so3762335ad.3
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 23:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1781765115; x=1782369915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3mY4IoCKia/XuJ/oNtOCFVHCKeBb5u4W4dO0pcbEY+A=;
        b=NnUj05gc2K1MPy71HkJlrj/V25xUvqUrAtf6G7Rb4VDwUQwBCcwFUb8jH79C23ale6
         /UDlU3H8SCrvdJvK2Mfp0i6eFNebPJduXzaMzTErgrHLAPHpOY9zQ2xVonfkAoGw8alc
         r7axE/7fyGXlt8a1KkdZfjx24G7gxwU8CRld4uZsf4jD/d2XeOdgAo74FkKspHyQ46Bz
         Og9N+WLY09q+oWENPNZkuAkuFmXyqRvxtJkgGBKLoyNCtf4lao5p/NIiOo/s+k4VLH2F
         SDFo6D2jGenl41LdZalUxbTwb5WZh3C/1eO1jmw12bBfF4WQHCvV4mN5HAhxdi/9PXDT
         QPHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781765115; x=1782369915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3mY4IoCKia/XuJ/oNtOCFVHCKeBb5u4W4dO0pcbEY+A=;
        b=d0W2G6nCcfJbVmLRoBL+Y5igLP9G0Q40p90EcfgCCHz3HvA1TemolEN4jz7hrglOv5
         1i7Hu+AxYyYYramrXRL1feSJQtYhheo1Sh/Xmc57XcX3euOGnOO3NYwMbjF5RKTPMDHs
         nKKqOMCXS2NPpUNsg1vR64QJeR2lSd8ZinqUuxuhGBb+/hqKAqjmGK2D4GDbXcxIAXQO
         rrNGvIIAIFVOS2+dhUZOtaLSJWQlL+XaOtNSSKQYvtbYWV3XDkHuylJAZRGkhFsymuEv
         7N/B2apB13YRrwIWNWx41FRVptplg2nYq+n0DS0px8CTGxYc5D0cYSAKS2QZvZg801pu
         3vBg==
X-Forwarded-Encrypted: i=1; AFNElJ9VeiIY2N3GNFh8B2DvnceGF4LPjeO3UOutbdJ2B93crjqsU8O+ucRyBgpHsMBusKFbjQcTujapxO9y@vger.kernel.org
X-Gm-Message-State: AOJu0YwlstMvMeCnqKMB77nQiItEViCJjI+K0Np3WqxpdCmhv+GyaVEa
	7VCyZAG4kP07EkRkWxCiR07gsl70s0mnHd7C1ZB4MM1rZt4qz5GkRsNuJAyOC3TY4pc=
X-Gm-Gg: AfdE7cnlzivHlLO66WaVuzz0SQ2WwpxBkogswi7a10mpwRw1UEV9/e73YwVQI1xWUpi
	X8JPUCJ2c6ADVTN5VC3zcRzxiWOUyTbcOxHYypc4hMhq6vMvfjzAKVCahXkWfoT9kwqJwhD/jOz
	NW77qoLDo+PLTGC1nZcB73WHC/arj7dU/zgCiODqKjpUBUPO4Ke3ZJ8p7gFEbM2JQUHC5uBwJll
	Ni4qDxhfPETB6yv5SSAPutJ59hLvIZTNAEdzivYyBKcQYhxzJa75A7X50XIkaVbdOV6F9eKG9FE
	tV9k3SKCZn8/GF6uAzmN+4gFDVzXIygX7Pqd1aGR5jkA8z5pX8xkAk4EgFl4/JXiO/9LE5n+ctt
	kE4dAWb/qTYD0R63JQIvepF2X/AhFrkaEgNGxTqjRPQZofmezGvsu9n35UJwn+JszaFo1TjWNc/
	8iubqyZAqbWvspVZzUgY0Y9b05Q5Tebv3W0VKq6SG4s9QP6w==
X-Received: by 2002:a17:903:1b6f:b0:2bf:77b2:8b2d with SMTP id d9443c01a7336-2c6bc25ca62mr70159885ad.30.1781765114873;
        Wed, 17 Jun 2026 23:45:14 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4328a4c1fsm185275985ad.53.2026.06.17.23.45.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 17 Jun 2026 23:45:14 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: akpm@linux-foundation.org,
	alex@ghiti.fr,
	andrew+kernel@donnellan.id.au,
	aou@eecs.berkeley.edu,
	apatel@ventanamicro.com,
	apopple@nvidia.com,
	atishp@rivosinc.com,
	baolin.wang@linux.alibaba.com,
	cleger@rivosinc.com,
	conor+dt@kernel.org,
	cuiyunhui@bytedance.com,
	debug@rivosinc.com,
	devicetree@vger.kernel.org,
	guodong@riscstar.com,
	hui.wang@canonical.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	liu.xuemei1@zte.com.cn,
	namcao@linutronix.de,
	nick.hu@sifive.com,
	palmer@dabbelt.com,
	pincheng.plct@isrc.iscas.ac.cn,
	pjw@kernel.org,
	qingwei.hu@bytedance.com,
	ritesh.list@gmail.com,
	rmclure@linux.ibm.com,
	robh@kernel.org,
	wangruikang@iscas.ac.cn,
	zhangchunyan@iscas.ac.cn,
	zong.li@sifive.com
Subject: [PATCH v4 3/3] riscv: preserve A/D and soft-dirty state across PTE updates
Date: Thu, 18 Jun 2026 14:44:06 +0800
Message-Id: <20260618064406.14508-4-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20260618064406.14508-1-cuiyunhui@bytedance.com>
References: <20260618064406.14508-1-cuiyunhui@bytedance.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use cmpxchg-based PTE updates so software permission changes do not lose
concurrent A/D updates from hardware. Preserve soft-dirty state as well,
since RISC-V marks PTEs dirty and soft-dirty together.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
Reviewed-by: Qingwei Hu <qingwei.hu@bytedance.com>
---
 arch/riscv/include/asm/pgtable.h | 27 +++++++++----
 arch/riscv/mm/pgtable.c          | 68 ++++++++++++++++++++++++++------
 2 files changed, 77 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 5d5756bda82e3..02286b48dc471 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -678,15 +678,21 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
 static inline void ptep_set_wrprotect(struct mm_struct *mm,
 				      unsigned long address, pte_t *ptep)
 {
-	pte_t read_pte = READ_ONCE(*ptep);
+	pte_t old_pte;
+	pte_t pte;
 	/*
 	 * ptep_set_wrprotect can be called for shadow stack ranges too.
 	 * shadow stack memory is XWR = 010 and thus clearing _PAGE_WRITE will lead to
 	 * encoding 000b which is wrong encoding with V = 1. This should lead to page fault
 	 * but we dont want this wrong configuration to be set in page tables.
 	 */
-	atomic_long_set((atomic_long_t *)ptep,
-			((pte_val(read_pte) & ~(unsigned long)_PAGE_WRITE) | _PAGE_READ));
+	pte = READ_ONCE(*ptep);
+	do {
+		old_pte = pte;
+		pte = pte_wrprotect(pte);
+		pte_val(pte) = cmpxchg_relaxed(&pte_val(*ptep), pte_val(old_pte),
+					       pte_val(pte));
+	} while (pte_val(pte) != pte_val(old_pte));
 }
 
 #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
@@ -742,14 +748,14 @@ static inline pgprot_t pgprot_writecombine(pgprot_t _prot)
 #define pgprot_dmacoherent pgprot_writecombine
 
 /*
- * Both Svade and Svadu control the hardware behavior when the PTE A/D bits need to be set. By
- * default the M-mode firmware enables the hardware updating scheme when only Svadu is present in
- * DT.
+ * Both Svade and Svadu control the hardware behavior when the PTE A/D bits
+ * need to be set. The core MM code only cares whether hardware updating of
+ * the accessed/dirty state is currently active.
  */
 #define arch_has_hw_pte_young arch_has_hw_pte_young
 static inline bool arch_has_hw_pte_young(void)
 {
-	return riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADU);
+	return riscv_has_hw_pte_ad_updating();
 }
 
 /*
@@ -1040,6 +1046,13 @@ static inline void pmdp_set_wrprotect(struct mm_struct *mm,
 	ptep_set_wrprotect(mm, address, (pte_t *)pmdp);
 }
 
+#define __HAVE_ARCH_PUDP_SET_WRPROTECT
+static inline void pudp_set_wrprotect(struct mm_struct *mm,
+				      unsigned long address, pud_t *pudp)
+{
+	ptep_set_wrprotect(mm, address, (pte_t *)pudp);
+}
+
 #define pmdp_establish pmdp_establish
 static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
 				unsigned long address, pmd_t *pmdp, pmd_t pmd)
diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
index 9c4427d0b1874..98eed19ea70de 100644
--- a/arch/riscv/mm/pgtable.c
+++ b/arch/riscv/mm/pgtable.c
@@ -5,23 +5,55 @@
 #include <linux/kernel.h>
 #include <linux/pgtable.h>
 
+#define RISCV_PTE_ACCESS_FLAG_MASK	(_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC | \
+					 _PAGE_ACCESSED | _PAGE_DIRTY | \
+					 _PAGE_SOFT_DIRTY)
+
+static inline unsigned long riscv_pte_access_flags(unsigned long cur,
+						   unsigned long entry)
+{
+	unsigned long pteval;
+	unsigned long preserved_flags;
+
+	preserved_flags = _PAGE_ACCESSED | _PAGE_DIRTY | _PAGE_SOFT_DIRTY;
+	pteval = cur & ~RISCV_PTE_ACCESS_FLAG_MASK;
+	pteval |= entry & (RISCV_PTE_ACCESS_FLAG_MASK & ~preserved_flags);
+	pteval |= (cur | entry) & preserved_flags;
+
+	return pteval;
+}
+
 int ptep_set_access_flags(struct vm_area_struct *vma,
 			  unsigned long address, pte_t *ptep,
 			  pte_t entry, int dirty)
 {
+	unsigned long old_pteval;
+	unsigned long new_pteval;
+	unsigned long prev_pteval;
+	bool changed;
+
+	old_pteval = pte_val(ptep_get(ptep));
+	do {
+		new_pteval = riscv_pte_access_flags(old_pteval, pte_val(entry));
+		if (new_pteval == old_pteval)
+			break;
+
+		prev_pteval = cmpxchg_relaxed(&pte_val(*ptep), old_pteval,
+					      new_pteval);
+		if (prev_pteval == old_pteval)
+			break;
+
+		old_pteval = prev_pteval;
+	} while (1);
+
+	changed = old_pteval != new_pteval;
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SVVPTC)) {
-		if (!pte_same(ptep_get(ptep), entry)) {
-			__set_pte_at(vma->vm_mm, ptep, entry);
-			/* Here only not svadu is impacted */
+		if (changed)
 			flush_tlb_page(vma, address);
-			return true;
-		}
 
-		return false;
+		return changed;
 	}
 
-	if (!pte_same(ptep_get(ptep), entry))
-		__set_pte_at(vma->vm_mm, ptep, entry);
 	/*
 	 * update_mmu_cache will unconditionally execute, handling both
 	 * the case that the PTE changed and the spurious fault case.
@@ -32,9 +64,23 @@ int ptep_set_access_flags(struct vm_area_struct *vma,
 bool ptep_test_and_clear_young(struct vm_area_struct *vma,
 		unsigned long address, pte_t *ptep)
 {
-	if (!pte_young(ptep_get(ptep)))
-		return false;
-	return test_and_clear_bit(_PAGE_ACCESSED_OFFSET, &pte_val(*ptep));
+	unsigned long old_pteval;
+	unsigned long new_pteval;
+	unsigned long prev_pteval;
+
+	old_pteval = pte_val(ptep_get(ptep));
+	do {
+		if (!(old_pteval & _PAGE_ACCESSED))
+			return false;
+
+		new_pteval = pte_val(pte_mkold(__pte(old_pteval)));
+		prev_pteval = cmpxchg_relaxed(&pte_val(*ptep), old_pteval,
+					      new_pteval);
+		if (prev_pteval == old_pteval)
+			return true;
+
+		old_pteval = prev_pteval;
+	} while (1);
 }
 EXPORT_SYMBOL_GPL(ptep_test_and_clear_young);
 
-- 
2.39.5

