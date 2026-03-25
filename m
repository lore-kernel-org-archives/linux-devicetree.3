Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9345E34F48C
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 09:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774429238; cv=none; b=fjFSZj8Bav6rlriUjjNluMZ9AmxgVhTeJtbb5IiDthR435buGuYu5CTK6U3let3mFCZjQWVI6oSQMTngqXmf0M3KU+I8p5p/UPPCQoVcdWLndFOpi3qVh7r0LRqW+zUw5W5qXtxClAocIK2tjZLGbRLeof/RwX1c1zasKPtJSLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774429238; c=relaxed/simple;
	bh=qaAekJTzU7B9Xp63BJnfPlzU4jaUAFahslZK0am8744=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=DdmcNGA8tCDNz52LBMx5SHTzM/AdBx09LSEDT613faUalYMdSDGEt42/wbLsw+wenfINL8trfTG0e/I80echcatjhPWfL9uu05hG7PoXhSMpDETViLpDUB3tCFtL6yruC3PeE7EhyyNxzqpmnh+o/15j5tgG7MZabkSRMyo6S+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=vJh1PR6R; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="vJh1PR6R"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260325090033euoutp018ccab5c3121ccdb04fce2def16105d31~gCfycPikg2262222622euoutp01L
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 09:00:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260325090033euoutp018ccab5c3121ccdb04fce2def16105d31~gCfycPikg2262222622euoutp01L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1774429233;
	bh=7VLOktVyCw/sFKOWYlySyASENC5MrPmRSGXG0sIJP9g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vJh1PR6R/JJrJQT0Yy9l+oeTPEAESSNCukDx8KwAlQ0GZ83nScB+YYStOxYHarYF5
	 38ruH8knTj16gvDc6w1pszGt9x+8I83y9dwgNu42HujE/IEf4c04y2aRycomHynjls
	 Ylhjzmkrrf/26hDTlzhr2iz+5tJvJmZYcQvMZGnQ=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260325090033eucas1p1715349936f9737a7bc7968351fcab7f5~gCfyEzQz70601006010eucas1p15;
	Wed, 25 Mar 2026 09:00:33 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260325090032eusmtip1584a0042647e55c92d56f1e00b3a2c3d~gCfxiiw4T0281802818eusmtip1-;
	Wed, 25 Mar 2026 09:00:32 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mm@kvack.org, iommu@lists.linux.dev
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Oreoluwa Babatunde
	<oreoluwa.babatunde@oss.qualcomm.com>, Saravana Kannan
	<saravanak@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Robin
	Murphy <robin.murphy@arm.com>
Subject: [PATCH v3 5/7] of: reserved_mem: rearrange code a bit
Date: Wed, 25 Mar 2026 10:00:21 +0100
Message-Id: <20260325090023.3175348-6-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325090023.3175348-1-m.szyprowski@samsung.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260325090033eucas1p1715349936f9737a7bc7968351fcab7f5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260325090033eucas1p1715349936f9737a7bc7968351fcab7f5
X-EPHeader: CA
X-CMS-RootMailID: 20260325090033eucas1p1715349936f9737a7bc7968351fcab7f5
References: <20260325090023.3175348-1-m.szyprowski@samsung.com>
	<CGME20260325090033eucas1p1715349936f9737a7bc7968351fcab7f5@eucas1p1.samsung.com>

Move __rmem_check_for_overlap() and __rmem_cmp() functions before
fdt_scan_reserved_mem_reg_nodes() to avoid forward declaration and keep
related code close together.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/of/of_reserved_mem.c | 99 ++++++++++++++++++------------------
 1 file changed, 49 insertions(+), 50 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 5dd585bcf8a8..f9b6d3ebcc20 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -214,7 +214,55 @@ static int __init __reserved_mem_check_root(unsigned long node)
 	return 0;
 }
 
-static void __init __rmem_check_for_overlap(void);
+static int __init __rmem_cmp(const void *a, const void *b)
+{
+	const struct reserved_mem *ra = a, *rb = b;
+
+	if (ra->base < rb->base)
+		return -1;
+
+	if (ra->base > rb->base)
+		return 1;
+
+	/*
+	 * Put the dynamic allocations (address == 0, size == 0) before static
+	 * allocations at address 0x0 so that overlap detection works
+	 * correctly.
+	 */
+	if (ra->size < rb->size)
+		return -1;
+	if (ra->size > rb->size)
+		return 1;
+
+	return 0;
+}
+
+static void __init __rmem_check_for_overlap(void)
+{
+	int i;
+
+	if (reserved_mem_count < 2)
+		return;
+
+	sort(reserved_mem, reserved_mem_count, sizeof(reserved_mem[0]),
+	     __rmem_cmp, NULL);
+	for (i = 0; i < reserved_mem_count - 1; i++) {
+		struct reserved_mem *this, *next;
+
+		this = &reserved_mem[i];
+		next = &reserved_mem[i + 1];
+
+		if (this->base + this->size > next->base) {
+			phys_addr_t this_end, next_end;
+
+			this_end = this->base + this->size;
+			next_end = next->base + next->size;
+			pr_err("OVERLAP DETECTED!\n%s (%pa--%pa) overlaps with %s (%pa--%pa)\n",
+			       this->name, &this->base, &this_end,
+			       next->name, &next->base, &next_end);
+		}
+	}
+}
 
 /**
  * fdt_scan_reserved_mem_reg_nodes() - Store info for the "reg" defined
@@ -565,55 +613,6 @@ static int __init __reserved_mem_init_node(struct reserved_mem *rmem,
 	return ret;
 }
 
-static int __init __rmem_cmp(const void *a, const void *b)
-{
-	const struct reserved_mem *ra = a, *rb = b;
-
-	if (ra->base < rb->base)
-		return -1;
-
-	if (ra->base > rb->base)
-		return 1;
-
-	/*
-	 * Put the dynamic allocations (address == 0, size == 0) before static
-	 * allocations at address 0x0 so that overlap detection works
-	 * correctly.
-	 */
-	if (ra->size < rb->size)
-		return -1;
-	if (ra->size > rb->size)
-		return 1;
-
-	return 0;
-}
-
-static void __init __rmem_check_for_overlap(void)
-{
-	int i;
-
-	if (reserved_mem_count < 2)
-		return;
-
-	sort(reserved_mem, reserved_mem_count, sizeof(reserved_mem[0]),
-	     __rmem_cmp, NULL);
-	for (i = 0; i < reserved_mem_count - 1; i++) {
-		struct reserved_mem *this, *next;
-
-		this = &reserved_mem[i];
-		next = &reserved_mem[i + 1];
-
-		if (this->base + this->size > next->base) {
-			phys_addr_t this_end, next_end;
-
-			this_end = this->base + this->size;
-			next_end = next->base + next->size;
-			pr_err("OVERLAP DETECTED!\n%s (%pa--%pa) overlaps with %s (%pa--%pa)\n",
-			       this->name, &this->base, &this_end,
-			       next->name, &next->base, &next_end);
-		}
-	}
-}
 
 /**
  * fdt_init_reserved_mem_node() - Initialize a reserved memory region
-- 
2.34.1

