Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C438839DBDB
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 06:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777445946; cv=none; b=k6m749yDBMJW4GAIS+cTTR6CKA1pWJ9rPtDT2BjlOY/S+Per5LE5Gj8pieXCkPpWndE3Oxpf7fYwr5cDLW6/GJ088JXv0T4K17BiqjRCTKE/pGShHA9WSfmslP7o2kE7g0VYuwlmiOFMtt+sYS55XHIQjHjnSG2/wh/2KNFN4Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777445946; c=relaxed/simple;
	bh=4vP7N1zetgFgj1WqIi/8IydbnE6WqBVEmWVx1kRBdBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fh/OcSEOAlakr3aTHY4vjRv5aoMiy28C+1/7nw0uRWB8ax3CuNVhuhI58/6kd5tPO6IFR1uJaZMjxQgUgmXOZhkTl3VJTaD5URXGPEX1za3YaHG1U7HrBHvFSsrSNyeSXbrOGfCZcS6DnXN4NL+ShAP2D+5crfNzhZGnRA88fM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P9k3Bx5F; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P9k3Bx5F"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-82f8b60e54dso8232135b3a.2
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 23:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777445944; x=1778050744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X32YgoESRg0ywcKfjv7wOK1DWSx0V8m7oh8gezp47dw=;
        b=P9k3Bx5FnPEUJ9xsz9HaIP/KlmgWRKYrMOnNrcrwJZrPgP+1AnBkp4pMmSxdi9mbl9
         8o2+L01Enwt+y66NaSpXSALAgWNOwy2hZeF5a7PjoRiKd9HQIvl00z8C+kcr1xHENr5E
         Yq/2EG0ogRfNJEOArkrsVRd1C600CLIhEBOa7/AM0IqNsIbGncyQtcEvchyUUVwzpGfs
         3yYSnLAWbBVvWRE65jwgX0ToPPjDOx1Z/RmuFNAupcuWN347lc+tJYag6ahOwWahd0Te
         UfQZ6GWMUQuFE9vjJOPJe5hi7Nla6KLa70RHBHPof6uhkXPafnqhB8oFQli4RzdhrMRl
         AW7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777445944; x=1778050744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X32YgoESRg0ywcKfjv7wOK1DWSx0V8m7oh8gezp47dw=;
        b=eyhipgGRaIO3s3gzpBOCTsbugr/++hXiQxFPO3K6N6/FyqLlIn6QORCIH9ou+cTvLn
         LhNji+0j8SmjPZk/8CQkRt84fc6Ij8n4sZlS1lCh4M5X5H/b74+kAI/vXI1tJxG1ifiT
         cFH8n2f7sUDDmXCmPyye42++Jy8ixBbhokyGzDFx4fs01lqTBTWPj9hdcGuvNGPtmIqL
         WTKWkWSxBZWWq4sWh0bJR+NbFKSVf80pCir9z0S7GkcTGyDNKtEIJWsfljCVNOyqrgsq
         Ao1QkN5NU/BqUB5E0yIvCwmKUPnAb8YetEK43Nv0Pq+KOQcZB8QidS2VzDxxjHKCRkOY
         p4Lw==
X-Forwarded-Encrypted: i=1; AFNElJ8X2xKLA39bLKQrYOVTs9G6kcIkTLwv9w4vRdmNPWSlXgDeqnyi36iFvRiMO7mD4Mx7R18xGhyijQVK@vger.kernel.org
X-Gm-Message-State: AOJu0YzWIiGhMMy7k0eXA5UEFMwIE0h8Pn1uMterQfE8kW4QdKI7818I
	5bGGll7dkditNeklRGXtYvt0FwvxV9kk+s0yUUt+e/otjf/5CH/A1VlV
X-Gm-Gg: AeBDietUwmsOW3dpjFN3c7o/pey4fUxBfSUC7gEB+ZnduW9Qga6pL9z2Pee8L1v83Qu
	DFRLGlecOm6qTkWusoVQCMiFeZPV5g+HAcsbHMNjZ9a6h2aiuL/81WWYGWqKLnO22wT2zxwcRVU
	wTaFsd14G3x/fifVenfdn37HbNsxZvlbSiiJaidlv5KeQg2lENJ1Krjf6hh2BNDOYQKClOqBcQt
	xNWKOAEbj04xQ9U9JzGSNBYCOGSxMakIR1/BHupNPP4LRv6Fbv5kyFeH305EAoptQibDbVl1wnM
	yS+yjMuqBnSeP3enp05/OGFgQH/S3nSrFKarTcsdwqT/cXEABG8H7thLLYH7UesuBHWPY8pWsfS
	3wa0nockddHeZXytJjpf9V1DihKKdkEpDzbG1wdrsbcdPlosqO5JfD8omf2nYCtMU7lckrEu6sE
	xAxhxiR6sk59bSJ4DcBF+WdGHR3w3xi/RBNuyMNl6bg/O4NhMjF+djQvejpUE=
X-Received: by 2002:a05:6a00:17aa:b0:823:1c5f:1c43 with SMTP id d2e1a72fcca58-834ddc5725bmr6614944b3a.36.1777445944007;
        Tue, 28 Apr 2026 23:59:04 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eaf93sm1043146b3a.40.2026.04.28.23.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:59:03 -0700 (PDT)
From: Chen Wandun <chenwandun1@gmail.com>
X-Google-Original-From: Chen Wandun <chenwandun@lixiang.com>
To: kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	chenwandun@lixiang.com,
	zhaomeijing@lixiang.com,
	everyzhao@126.com
Subject: [PATCH 02/11] of: reserved_mem: reject reserved memory outside physical address range
Date: Wed, 29 Apr 2026 14:58:22 +0800
Message-ID: <20260429065831.1510858-3-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429065831.1510858-1-chenwandun@lixiang.com>
References: <20260429065831.1510858-1-chenwandun@lixiang.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

early_init_dt_reserve_memory() does not validate whether the region
falls within physical memory. If a device tree incorrectly specifies a
reserved memory region outside the physical address range:

 - For the non-nomap path, memblock_reserve() blindly adds the region
   to memblock.reserved, creating a stale entry that refers to
   non-existent memory.

 - For the nomap path, memblock_mark_nomap() silently fails to match
   any region in memblock.memory, but still returns success.

Add a memblock_overlaps_region() check at the entry of
early_init_dt_reserve_memory() to reject such regions before any
memblock operation takes place. This also simplifies the existing nomap
guard: the original "overlaps && is_reserved" condition reduces to just
"is_reserved", since the overlap with physical memory is already
guaranteed by the new check.

Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
Tested-by: Zhao Meijing <zhaomeijing@lixiang.com>
---
 drivers/of/of_reserved_mem.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 9d1b0193864c..03c676052dab 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -112,14 +112,21 @@ static int fdt_fixup_reserved_mem_node(unsigned long node,
 static int __init early_init_dt_reserve_memory(phys_addr_t base,
 					       phys_addr_t size, bool nomap)
 {
+	if (!memblock_overlaps_region(&memblock.memory, base, size)) {
+		phys_addr_t end = base + size - 1;
+
+		pr_warn("Reserved memory region %pa..%pa is outside of physical memory\n",
+			&base, &end);
+		return -EINVAL;
+	}
+
 	if (nomap) {
 		/*
 		 * If the memory is already reserved (by another region), we
-		 * should not allow it to be marked nomap, but don't worry
-		 * if the region isn't memory as it won't be mapped.
+		 * should not allow it to be marked nomap. The region being
+		 * physical memory is guaranteed by the overlap check above.
 		 */
-		if (memblock_overlaps_region(&memblock.memory, base, size) &&
-		    memblock_is_region_reserved(base, size))
+		if (memblock_is_region_reserved(base, size))
 			return -EBUSY;
 
 		return memblock_mark_nomap(base, size);
-- 
2.43.0

