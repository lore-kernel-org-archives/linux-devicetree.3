Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EA3471D13
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 10:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788346292; cv=none; b=Km3rbtCKP8enr5Y3oldUXvow6/woIVCmsQT3F2E3kawIsFfIwHclgfjA8mTvB+a7Tt2eGTlt38vVMFYQ7iiAigLUrRQ2a5Y+h8P10QCi49KuPMemAY+b7lqsUdjUw1ANfS1bYd8O+MZukUj9QI0MFfttEn4OWTveGLO/VJcqt5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788346292; c=relaxed/simple;
	bh=fI4ct/3pSqJy24dcpl8O0GRnGyvmcETu0BAstHM0k+s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ppk48Re/EAzaU6r35+QScB0RWBUgA1r76zzkY6lPsdGks7xceTJx2F1wmJAPZ06TJnxfRlozXEdtM7Ju+YAJIQNjx/hJ4LSKbh+JphZ5oVR6qNca5G+ThMsolEeiprnsuJWK24HbG3TW4iFElb4sYcBTz3LcVDRHKrCuCvUBZ1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ruJvCxVs; arc=none smtp.client-ip=209.85.221.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ruJvCxVs"
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-47f6d70223dso687933f8f.1
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 03:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788346276; x=1788951076; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IlzRHwAUXMpKspjrSSJuu5KTpj2eywEkwws+9IOUBiI=;
        b=ruJvCxVsxGsTKa3DR36ZuhNxvUeZupbt8wJDMaiJ6rkndeRHZzaamJIWlqweFwdyPY
         uwLnuWEI+h+r7bhZm1/7odgOey6p9IW0Zp4MWTlIsBBeHGYKmu8qTrM4Xfv9iP7bV0Ev
         q0WTOZjZgsmbYpjOa6HnpwN7z2LIhCdc2ibTUQkiQ4CCB2JcY/WClwIAJaOCdsCc4IxC
         qZqBcFVAU5GIUoFntNgrwPVOyDzxSrNHCrmm+ry3Nn64qFGR3FpF2EiirMg0Qg3lXdWF
         GjghRqqX9YMRO9HJfAGM2I1T4Cg7157/DomozoSOL22Ve4Fj9L0vKbiyeDDmoqsTrxR7
         brmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788346276; x=1788951076;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IlzRHwAUXMpKspjrSSJuu5KTpj2eywEkwws+9IOUBiI=;
        b=q+LEea7rl/bP9TY/bSnS7QPB7tr2OY2iOD7zLweQcZK39+8DYf2mHoyW4F0WQ2RhBk
         viR0fCuF8aZgdVaL4GgoAH8W8b2/DQ7FELKI4U9yEJt5I+30j9PCYR8u8suc+tbJ+eKM
         VLCpGvHhRty28FMSHRXw8ftw+TN3UjLi0DxigAbSyiOjZHHa3GT1H1kp7h1w7R67ix2x
         Z5TfXaiLJNJJGyGeqqW9hvZEW0hU4igV/FV5vtO33L83b0A5/fLlyBxMcNHhS6FEwpXb
         qciI37+RToxTWlI8lATeM6JdoQdUOin51j5rRIKlBHC5UjRwsHezDqxSU+d7tZS3QzGV
         6wtg==
X-Forwarded-Encrypted: i=1; AKwUvBxj222T5uF1uR5jR3Ox4C+vcE5tDhr+DaHOZvl95NHlwt7tDrbjqdgX/+awkqsShW09RI2kIsvz+bly@vger.kernel.org
X-Gm-Message-State: AFuF++mt/fGPaGK3J9ydJhvBFY36qzlnSGxlUA8VyWFlHL0Dqqbcn5tn
	U0inPS0+NFtWZPQSJMUCh4XThH0sFtJliV4343dQ086GuSsG9QDEWLVfjQhAEGz5R6qT0bUoX5J
	Dk8Op+TYEwAWN510Kt388IQ==
X-Received: from wrqr17.prod.google.com ([2002:a5d:4991:0:b0:482:abe4:58a8])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5f47:0:b0:482:fc30:a1b4 with SMTP id ffacd0b85a97d-48488e03952mr6019121f8f.5.1788346276079;
 Wed, 02 Sep 2026 03:51:16 -0700 (PDT)
Date: Wed,  2 Sep 2026 11:47:10 +0100
In-Reply-To: <20260902104712.2399797-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260902104712.2399797-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.970.g62bdec98f9-goog
Message-ID: <20260902104712.2399797-9-vdonnefort@google.com>
Subject: [PATCH v9 08/10] arm64: Add support for MEMBLOCK_LLMAP
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

With the MEMBLOCK_LLMAP flag, force a last-level mapping.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 79d90226fd5d..c0fcc76914d1 100644
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
@@ -1226,9 +1225,13 @@ static void __init map_mem(void)
 		       flags);
 
 	/* map all the memory banks */
-	for_each_mem_range(i, &start, &end) {
+	for_each_mem_region(r) {
+		phys_addr_t start, end;
+
+		if (memblock_is_nomap(r))
+			continue;
 		/*
-		 * for_each_mem_range may return sub-page-aligned boundaries
+		 * for_each_mem_region may return sub-page-aligned boundaries
 		 * after memblock_mark_nomap() splits regions at byte precision.
 		 * __create_pgd_mapping_locked aligns phys down to PAGE_MASK,
 		 * which could accidentally map no-map memory on the boundary.
@@ -1237,17 +1240,23 @@ static void __init map_mem(void)
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
+		int rflags = flags;
+
+		if (memblock_is_llmap(r))
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
2.55.0.970.g62bdec98f9-goog

