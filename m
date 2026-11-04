Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793789178;
	b=j1JqHO6ZNNCT2u4XWDrT22iODOSDxuUwqv9wHNjvzLVTDtsnhOPOaXkCmrVcC6ylU2nT
	 EATOLgjyrnLtGnQ0lsZRD3avbaBqGrx2OVufr4kfiXcAEcxbf86rewSCEJYZ/SFQWJz6K
	 G6i68SENhz/lkfW3SJu+Z9WZpk4xuSbcq7qQH519O8VPeIGhXPxvb00+i8mwqn6mAceP+
	 lOpQRuc+CkopkeM8J5xTTplEfZqZrSzA83sIgFOdTa6y0lCEBQY6DK6dg2c1YKj5rrhPA
	 rB3zBHr7wX/YED0dnbrbqC/FJ18aZEiWJGCIpmkcWbzP44AzRvMEznZXyofGJwKQv+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793789178;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=8Ms//SCjMBtZLtOk9KuIQ01hGHzi7dKhO5yJDKE3fuI=;
	b=WcRYhb1epB95npIXlWrQis0nQLlk8z5rFjT6VH4/VDj8Bmow0FoC2EhvYGhRbPauGDIS
	 mjskyTpeAYpx3P6pjkA5P2KPFp4WfsKhXfnMjGqqXc0u9CUTlHZcwqgZk4pAKv6LxA4Rz
	 ICCJbbVJMCeVJ5ZyZ5RaiKxf+LbPIaVSfV7tompj11/BqFWYFjNjk5PE7I4P/ord0t669
	 prWCNyKELwdpMdC3W92OcW4ZVdZax99URSKpuFplyKnnLOYGg/iudKrffZ9mycglQu4Km
	 vruItiXgOMkuZO3lk7SBPz+t4voQSHiO+ToHpqZ+BFfgkqYYEY5anjxfXcpyITPP50w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=mEkANnpz;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87322606A32E
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 10:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87322606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=mEkANnpz
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261104104615euoutp01a75dd9f8af02e3439291ed606ccd3889~k0cBWQUNQ2954129541euoutp01K
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 10:46:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261104104615euoutp01a75dd9f8af02e3439291ed606ccd3889~k0cBWQUNQ2954129541euoutp01K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793789175;
	bh=8Ms//SCjMBtZLtOk9KuIQ01hGHzi7dKhO5yJDKE3fuI=;
	h=From:To:Cc:Subject:Date:References:From;
	b=mEkANnpzRYT8fuIt1XolCJnjpE/FK7WNHqpQlhOxxsEj9z90WlqQUd5tV4R44dHDO
	 Cmqt7Sqk6nxqF7pkpQWUCRxq+DvMCNFOj2baJJBAunjWKywRSHrKn71/CwMxvURV78
	 qo70suTDNKKHtYWBbmfUzChU474qnM/FZTLimaqo=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261104104615eucas1p2583cd5bc9ae36bd9ff2d28f87d6e7583~k0cBBCjGw2798527985eucas1p2O;
	Wed,  4 Nov 2026 10:46:15 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261104104614eusmtip1aebd75a70441e6179ea0b97d1d5e0155~k0cAXegGO2242822428eusmtip1e;
	Wed,  4 Nov 2026 10:46:14 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-mm@kvack.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley
	<conor.dooley@microchip.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Rob
	Herring <robh@kernel.org>, Mike Rapoport <rppt@kernel.org>, Saravana Kannan
	<saravanak@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] riscv: mm: reserve the DTB before scanning reserved memory
Date: Wed,  4 Nov 2026 11:46:03 +0100
Message-ID: <20261104104604.3370384-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
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
X-CMS-MailID: 20261104104615eucas1p2583cd5bc9ae36bd9ff2d28f87d6e7583
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261104104615eucas1p2583cd5bc9ae36bd9ff2d28f87d6e7583
X-EPHeader: CA
X-CMS-RootMailID: 20261104104615eucas1p2583cd5bc9ae36bd9ff2d28f87d6e7583
References: <CGME20261104104615eucas1p2583cd5bc9ae36bd9ff2d28f87d6e7583@eucas1p2.samsung.com>

early_init_fdt_scan_reserved_mem() allocates memory from memblock while
it scans /reserved-memory: the reserved_mem array, and the regions that
are placed dynamically by size. On RISC-V the DTB was only reserved
after that scan, so memblock could hand out the memory the DTB occupies
while the DTB was still being parsed.

Reserve the DTB before the scan, so that memblock never allocates from
it.

Fixes: ef69d2559fe9 ("riscv: Move early dtb mapping into the fixmap region")
Closes: https://lore.kernel.org/all/b71ac175-fba5-4f61-bbdb-0b98dec9ccee@samsung.com/
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/riscv/mm/init.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index e822fce0af4b..bbc2d8cb4627 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -294,13 +294,6 @@ static void __init setup_bootmem(void)
 
 	reserve_initrd_mem();
 
-	/*
-	 * No allocation should be done before reserving the memory as defined
-	 * in the device tree, otherwise the allocation could end up in a
-	 * reserved region.
-	 */
-	early_init_fdt_scan_reserved_mem();
-
 	/*
 	 * If DTB is built in, no need to reserve its memblock.
 	 * Otherwise, do reserve it but avoid using
@@ -309,6 +302,13 @@ static void __init setup_bootmem(void)
 	 */
 	if (!IS_ENABLED(CONFIG_BUILTIN_DTB))
 		memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
+
+	/*
+	 * No allocation should be done before reserving the memory as defined
+	 * in the device tree, otherwise the allocation could end up in a
+	 * reserved region.
+	 */
+	early_init_fdt_scan_reserved_mem();
 }
 
 #ifdef CONFIG_RELOCATABLE
-- 
2.43.0

