Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05497488D82
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 11:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988463; cv=none; b=pP/KaILvtMs9Dgzbfnjvij5hf4OoZjAM5y9wBwJID2cxDBWQibEXyyQHXf2nhq9b8oaTENOyZptnHh0y9r9CWANogjyr5/FGMLKBC1gvpzVItlgXwYg9Xh60RCQZltrY8fHGdExFeonfGfU5qTUTJ9I5ZGPlRc59sj/S5P+Z/Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988463; c=relaxed/simple;
	bh=nq6c2HIL7smpOLcesIc5VsHG9EFe4PxsntTqAaTUuBA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oKbq+aquT7tqyFZhlLISmc4nc7L3CDINmCdpte5ICrZQV6UZLjJT68CtyqfHjRxkm+0ysF9KBJ4d74W5SEcB+IAdRC9yjELH5G0KIqgqvGNCBzl3ejRrPpvEU6O50ry1O5qwxLsCMEMW8KzfG8Zq/MGsmT3VUzunyfNC/GmT1gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jo+/E8bc; arc=none smtp.client-ip=209.85.208.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jo+/E8bc"
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6aa2d82b6ccso4068047a12.2
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 04:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789988459; x=1790593259; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U06rcgIn0LVt5Do84ZIYuayP7YCGGpRPbIbmdcyZosY=;
        b=jo+/E8bcBPYZBTDMteRnOWdS8I4C3eHA5hUsw+cky15J/5G7BRyTzWo/J+M80/0w1R
         Ir287JkavtljC0NP2nhfWflwM72QexeqJPFmldGjE/bYXMs5CNzNCKovyjazcyvkT7Cc
         G+ttrAPZ/uGLV6Xu3G6ZnGIE0M9sMUg5geSo5RRE6Oz8RswsZnl2Z7Qnb1fkkhBdVXX/
         3p023XKdCkkQf3+r7UtWwijOtJxDm/JGjki15glYO1ZKf4jXtRc32kFWX/19GHbnTLJY
         7kN3d2oEBZlK1tpu+8NYOv4oMJeYddorgGVWcB2BSSFTGNXpu7JtgKTq/8jyisAxsUf9
         9j1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988459; x=1790593259;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U06rcgIn0LVt5Do84ZIYuayP7YCGGpRPbIbmdcyZosY=;
        b=dnKPdhYAkY8HN+BEz365yi0fhMuc7oQcxN/AwsZYpjyG0K+FuC49PtBOzAsAJHUYOg
         PvQ6dAijHU8gtsV9JjokY1wIe7fOz/CbxM7m4bTWVE9PTpJL1NBKFUPsYrxXFZEEeFhm
         Iuf46f5G2GdcdDGYc6344/HE0fHjc02Kn0nG5SWzhYPjIZnXkdK4VQtcaWyB6y+N6pBk
         AE2NyI9NvU36lfE3/+S05Bph4bl0caxi0nDILlwdYfqBUjzY6Cg77Z40E8sVKqeACtMd
         OJlnkf1DuYvhkg/24sxc4YSDWtnnVwv0fOLsJxioRm0qDlWookPQeXfGqGAnH/eDGjPy
         XUIQ==
X-Forwarded-Encrypted: i=1; AKwUvByPcKWy4Eda2XWYF35jgjiUHGAjPSL8YmB/em+JU0O4cem2m0rOVxNFu2/zhgifmev4/BwLM5hM+sKb@vger.kernel.org
X-Gm-Message-State: AFuF++nqxjQ6yPG/7WO0j8ic70duCVJjEv7c+kEeSr0gqP9odVNFVLWl
	sszQZ2kTIPPC7E8qztYfcy1Mboq8O/eSA9K+w0LKcv2naftYwT4hqd9W3sh8bWoTWY4LK8OQH0g
	ggyCBbtLdx+CxnL9x5Jp6lg==
X-Received: from edea12.prod.google.com ([2002:a05:6402:a18c:b0:6a6:1a9:f70f])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:23d5:b0:6a5:f814:2278 with SMTP id 4fb4d7f45d1cf-6aa577f5a1dmr7324139a12.2.1789988458556;
 Mon, 21 Sep 2026 04:00:58 -0700 (PDT)
Date: Mon, 21 Sep 2026 12:00:44 +0100
In-Reply-To: <20260921110050.3977591-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260921110050.3977591-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921110050.3977591-3-vdonnefort@google.com>
Subject: [PATCH v2 2/8] arm64: Introduce can_set_direct_map_range()
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

For systems where can_set_direct_map() is false, it is still possible
that a subregion of the direct map can be modified if it is mapped at
the last-level. Add an implementation for can_set_direct_map_range(). It
falls back to a page table walk to verify the mapping level if
can_set_direct_map() is false.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/include/asm/set_memory.h |  3 ++
 arch/arm64/mm/pageattr.c            | 50 +++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/arch/arm64/include/asm/set_memory.h b/arch/arm64/include/asm/set_memory.h
index 0091ba12200e..80bb94a340fd 100644
--- a/arch/arm64/include/asm/set_memory.h
+++ b/arch/arm64/include/asm/set_memory.h
@@ -9,6 +9,9 @@
 bool can_set_direct_map(void);
 #define can_set_direct_map can_set_direct_map
 
+bool can_set_direct_map_range(struct page *page, unsigned long numpages);
+#define can_set_direct_map_range can_set_direct_map_range
+
 int set_memory_valid(unsigned long addr, int numpages, int enable);
 
 int set_direct_map_invalid_noflush(struct page *page, unsigned int numpages);
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index 132938b32eb1..5fcdb292905f 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -102,6 +102,56 @@ bool can_set_direct_map(void)
 		arm64_kfence_can_set_direct_map() || is_realm_world();
 }
 
+static int can_set_direct_map_pud_entry(pud_t *pud, unsigned long addr,
+					unsigned long next, struct mm_walk *walk)
+{
+	if (pud_leaf(pudp_get(pud)))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int can_set_direct_map_pmd_entry(pmd_t *pmd, unsigned long addr,
+					unsigned long next, struct mm_walk *walk)
+{
+	if (pmd_leaf(pmdp_get(pmd)))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int can_set_direct_map_pte_hole(unsigned long addr, unsigned long next,
+				       int depth, struct mm_walk *walk)
+{
+	return -EINVAL;
+}
+
+static const struct mm_walk_ops can_set_direct_map_ops = {
+	.pud_entry	= can_set_direct_map_pud_entry,
+	.pmd_entry	= can_set_direct_map_pmd_entry,
+	.pte_hole	= can_set_direct_map_pte_hole,
+};
+
+bool can_set_direct_map_range(struct page *page, unsigned long numpages)
+{
+	unsigned long addr = (unsigned long)page_address(page);
+	unsigned long end = addr + numpages * PAGE_SIZE;
+
+	if (can_set_direct_map())
+		return true;
+
+	if (!numpages)
+		return false;
+
+	/*
+	 * If !can_set_direct_map() then no one can split blocks and it is safe
+	 * to walk the page-table lockless.
+	 */
+	return !walk_kernel_page_table_range_lockless(addr, end,
+						      &can_set_direct_map_ops,
+						      NULL, NULL);
+}
+
 static int update_range_prot(unsigned long start, unsigned long size,
 			     pgprot_t set_mask, pgprot_t clear_mask)
 {
-- 
2.55.0.1082.g2b9226bbc0-goog

