Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7277383C95
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 06:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792131443; cv=none; b=AdV8T8zoP8dJL9yfpt0l/Dsoa3Z16KcNUS4jMDH69AhwhpGQeXvyAz2/X+CUmU2X0MhqTuivpb4KWGKE1A65HH86KzOeEPOJZEk2bEGmoYFt+0u81PbTOsstaBnfJWEVmSoegku3SZxssuQ3uFoguTfvgS0QJTgJIZvLLDr0m1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792131443; c=relaxed/simple;
	bh=KS2Sad4txxYAPU7Ulhsill0lGwhrig2221eGQ+9zjh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lE7fA8YnHCyImzLkTXMdWNDxrmnE+UgH0fYVvlHE7kDGUc8w9626R2MHsSA7/6wgF9yh/JiCjh3PXLWRej991QQpJfGAR8SlOMYZfx/d4Oq61pSISEdK0DmLWFYZiZG6bHVWTcav0mTy5dm4iPaJxYbWay8OTQGrFh9Js2v31pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sozrWC/h; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sozrWC/h"
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2e934c6c1c8so7760035ad.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 23:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792131441; x=1792736241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EXuyqgfiF9x7HO7+fbFxeGIrd5nFUV6QECR0sZa4nrg=;
        b=sozrWC/hrPsPGXUJOtz7zeNJFwRMG4JtMwDbTJnkVIoQARYDT6b5NEMyQEZB4C9BOK
         bjTY3FqKzzM04wFy81NTKkS9niMuPUq8H9ADjsl++LGOh45mdMa/GVFEeAxWXwpPLXN5
         UfF0E66U+9d3aOgB/F3O7UAlYbvJjCaUjOsKtrQ0hLxjk60Zw9GmKNeQJPe5VcRvGNZp
         hCCsCA4c9dOYgTNei6ncgCjczGMeEwo0leiPjw5A26wYn8OvZ+0vReSCb1PoQSNDKcLb
         gesMbXceZdO7a0kMNM22G+u304itB1aROd4qHd0s9GyJqLl1tsvB5RO35t+ZaywJRdrj
         BZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792131441; x=1792736241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EXuyqgfiF9x7HO7+fbFxeGIrd5nFUV6QECR0sZa4nrg=;
        b=iogT5q4lZymhaW5g54JshF7th3OAu2L23XNVfRaw/KUSXwlid6Bv/I4j+QqIJ8rU3h
         DlmQuYoGdEQ36vPwNxlCuSC4Pbkm/AoA7L+afI5+c31HWJxy0VkQ89MTUupLa4JuyOb8
         1ngElzYEspsRFrD/HUhMVGrj2Cc1QXms5yfiHmfD9JqiNpgxj51ADQnA/UfEWFq/h7QL
         rtASi0e+BeMJOmFYWCpqSM+m7CHYHPkGyzELZhSNnVxkuNm/bk23t5pFhhl+w/MpyfUw
         MRpYa9v9xYqwPTWyi2Spz1IjMzeCWjxmLRIhLTpMZJ2sLUBv3vR0u4IzBWIeMMER3Pmc
         vFtA==
X-Forwarded-Encrypted: i=1; AKwUvBznuPX43Kz75AQD7vJYcrmBaDytIHjl1w3L5XyznsEreuAYuTTowm3yEdiQZ2kkqR1FdZdKhPhJyOtL@vger.kernel.org
X-Gm-Message-State: AFq9FYIkUp1Z+0iXcgmZAX1SgIGMqMdyAKbNr3hmthQb2TIim1pHLJbM
	pg/BRnSR2YJx3gyejmn7io2SUgfqG3xktOZOLXGKJxbi0DEU9puntw2B
X-Gm-Gg: AYBFou0pqnLiaPxYOncnzyFkm0cqZ1nWOlFjekVjSyhdqVrg1BIisCpDfOrYG+MM2vW
	mducaqNKXFmKB2uCRUvTiM3mVtqz/m4PyzxYotZ1biXhP6dT52l11sZirf1W9YY4FPk8avD9tSA
	1P1Y6APQ7LxPAzPPxtjVU0kjtunPFq+RNkYOYt1UI0JlJMZlHZCqHOKfuG86CRwMi7o26hmaxRk
	kd6b/G8va3DWDzlZuqyxDqpGt9kLWK0pXSJOaRYn5y/5GAJgNEVnx2hqJCD6kgIIWmGtzXF4bs/
	Ya2xFhKy3YRSCLrxTUMDYXm/lI7fK8Xai5Vry5/LXZnXqwBcDc54wjzGVBb/HqXF6gk5clBQb23
	8TNJzuPs2vKhdrRVjqGzn7/ln5ThPOTI8slmEoB3NBUWTYlia257q3Bnf5a6LtTetnV175CGh5a
	GM3CHJKiR8p8+ct374UizZik9yc5z4SZ93JZY2BcUBUUcVFRC07QCORVxBA5pMB6AoXD2EvNbvC
	zvSaYW8p9nex3YXK/uZbg==
X-Received: by 2002:a05:6a21:1f8a:b0:3de:14ad:ae8a with SMTP id adf61e73a8af0-3e1d04198a7mr7196697637.16.1792131440647;
        Thu, 15 Oct 2026 23:17:20 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57b334e6sm586375b3a.42.2026.10.15.23.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:17:20 -0700 (PDT)
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
Subject: [RESEND PATCH v8 6/8] of: reserved_mem: add dumpable flag to opt-in vmcore
Date: Fri, 16 Oct 2026 14:15:47 +0800
Message-ID: <20261016061549.4181390-7-chenwandun1@gmail.com>
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

Add a 'dumpable' flag to struct reserved_mem to decide whether a
reserved area should be included in the kdump vmcore. Non-dumpable
regions are later marked MEMBLOCK_NODUMP; the filtering itself happens
in memblock, keeping the arch kdump code independent of the DT API.

Most reserved regions are owned by devices and do not contain data
useful for kernel crash analysis, so dumpable default to false.
Reusable CMA regions are different: their pages are handed back to the
buddy allocator and may contain key data for crash analysis, so set
dumpable to true in rmem_cma_setup().

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 include/linux/of_reserved_mem.h | 1 +
 kernel/dma/contiguous.c         | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index 49da515859f2..99c0f3ccc297 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -15,6 +15,7 @@ struct reserved_mem {
 	phys_addr_t			base;
 	phys_addr_t			size;
 	void				*priv;
+	bool				dumpable;
 };
 
 struct reserved_mem_ops {
diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index 90937dc7c627..d7bfc38ac762 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -567,6 +567,7 @@ static int __init rmem_cma_setup(unsigned long node, struct reserved_mem *rmem)
 		dma_contiguous_default_area = cma;
 
 	rmem->priv = cma;
+	rmem->dumpable = true;
 
 	pr_info("Reserved memory: created CMA memory pool at %pa, size %ld MiB\n",
 		&rmem->base, (unsigned long)rmem->size / SZ_1M);
-- 
2.43.0

