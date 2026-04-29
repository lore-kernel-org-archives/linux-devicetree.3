Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC11439DBEF
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 06:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777445936; cv=none; b=fxlkg3XmO37K+JnXYjZ+GFev6tPg3fOUbEbW6aqHHQHTg+u04Hoacfg/JXrm+JIkkeqwY/2IMelZKb/2WFyMnqhZMhVy2yMH+KaWXzYdlWmS8IPtgssaQb3srrpmhQSINRyWWuJpm38ZtH/8c6tQdoiEw6ITFftNhx/+lh8BM2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777445936; c=relaxed/simple;
	bh=3p0YBHSpmNNuRtsQDEIxkQcORCtiS252q1murO0b87Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tdmwZ7PrfUlXjOFxW3pAh5ZPmwwN/wyVgq8qmXQOFaB5BvPq9FYP/ZSsDJu6UIB0zf6oSKGGENyC0s3xNbFzVlKocPWPUe/im2qxIF+D57KmUCvHwJx5cd3JN37yTOP1Vtsnj0EA5vqUU2ssmcWxlgRdrYBB3BQaV4qD/DjxhOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sups5GrR; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sups5GrR"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-82f351ca23cso6291374b3a.2
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 23:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777445934; x=1778050734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y02uBvZORLsA6xImd4974JLfXXgs5mmuCn2J28MpgzI=;
        b=sups5GrRaVc2+j0pyqda6YOQ1TCNTO0Msnngq/uncykO9OIwxngAPv1gP7xO6pkN0G
         5nrDClLzUvZZb3JPa3oRcDOpDRTx3oWRb4di/rxxOqRQqrk1V8fxD7zoia8U0/oo7eyX
         eU2WP0YxTdZqGeCjf9yqMkWBmqtGjpxEuTmbtdbWCDd7mM8Ih4fKT6IJFce5mcFI8lK9
         NyYb9sogZMC2IdStNk7PzK4ILWYEDz2aBeORr51t9fwR54WQtLtK//5LEbi8KLBn4xaX
         rfrhpwOLCuZ0BoRw7buInJ36cSdsIn32dGO2b/UpiAU72vbfHC5kjWlxAJvfTYQydSBX
         KyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777445934; x=1778050734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y02uBvZORLsA6xImd4974JLfXXgs5mmuCn2J28MpgzI=;
        b=it6gzWdqEW81/o62+2rJNrRCOlk8jUuCzpmrqxZxXPoE7SYA3UecwGGw9EHpTwcXKt
         gvmpzj4kKo6DO+SW3uI8IQtlYRm+rnl5wRMzvGU/lbmyLAd75Px0Mex6/PvJTVJuCoU6
         D6/ss9GpjwluXkUA9/hHJnzVdRYifcffo2jZnqT1IyLhv7Fja+xvQDLAgXOAy0tCgwCn
         haXWQEGNeAqj1Atjcq2U398+Rl/4xW4cPhLz5PihI4wDZjX+GjJqsMy25td8QIgMlrmb
         EP9e7cq18kkXvhjeyxRFbhFib+8MJAFBRWQy/bIGLsk849BQfMhKrd47cOQj/X4ikClG
         Ysiw==
X-Forwarded-Encrypted: i=1; AFNElJ9vJ9LPXNwZ9Zz2HBjc9jxElv1K11UTpfeOfMrxypEpQDpOXop+PHZR9JwZL6UIBMb3Jbqrr0qhU2eM@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9QboK9g9zPsLxz2GsBT8gpu/4HxguZcshojdIRVy4zH9Cq3Ew
	qVEmneyyHJHgi1jMT9ALtHsPDbo5QFQTAzXFrdn9wRAmo3xiQdkLoIsU
X-Gm-Gg: AeBDieuMRb7ktdyYF7xgmibr1D2hhzS0P6+O/bxIog8NIE/dLBlc8KZPuQewGCiMJlA
	B4y//prkdywjTzSPMHituBqQgWSe0WDyVmzogoVf/k9OfSseSZmmQrCEIhSG2ek292HETBMY/FT
	98X/CT1v9TH8JE9Fnr1z3SP2HOiU/p72+JdRN+0YnBhLP29TXtMzKdZK29UWViAQDFcS2AQ/j6j
	EwgW+gAb4mDRrK3IIbi1RAYfS7FaQGUBoW/hcKJYdnqKFN7OOeE1UmdSKCvWlEx8pzBcURw4jgY
	MCzEiIDe7+Rz+cKftUfehnochQkXBvuSGTx7khNK+tjoZeafaLEbGjkkzJKcaQEHox1z/jFX5IO
	Vd/tjjQvvJu67ilQoJNtzCL5BgknbLNgaFIQBt3XLUgqchY2OkwStEIkSRuYnzOG8IbKduUrPhs
	BqcqCSZ1xPajto6I4koUJisNp2q7TlKqjBv12x+Z54J66srL3s
X-Received: by 2002:a05:6a00:2d85:b0:82c:dd31:b83d with SMTP id d2e1a72fcca58-834ddc5879cmr6667128b3a.38.1777445934284;
        Tue, 28 Apr 2026 23:58:54 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eaf93sm1043146b3a.40.2026.04.28.23.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:58:53 -0700 (PDT)
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
Subject: [PATCH 01/11] of: reserved_mem: fix region count for nodes with multiple reg entries
Date: Wed, 29 Apr 2026 14:58:21 +0800
Message-ID: <20260429065831.1510858-2-chenwandun@lixiang.com>
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

When a reserved-memory node contains multiple reg entries (e.g.,
reg = <base1 size1>, <base2 size2>), the count used for
total_reserved_mem_cnt is wrong in two places:

1) __reserved_mem_reserve_reg() returns 0 on success regardless of how
   many regions it reserved in memblock. The caller in
   fdt_scan_reserved_mem() then increments count by just 1.

2) fdt_scan_reserved_mem_late() uses of_flat_dt_get_addr_size() which
   only reads the first reg entry. Subsequent entries are never
   initialized via fdt_init_reserved_mem_node(), so their metadata is
   lost.

Fix both issues:
 - Make __reserved_mem_reserve_reg() return the actual number of
   regions successfully reserved. Update the caller to accumulate
   the returned count.
 - Rewrite fdt_scan_reserved_mem_late() to use
   of_flat_dt_get_addr_size_prop() and iterate all reg entries,
   initializing each one via fdt_init_reserved_mem_node().

Fixes: 8a6e02d0c00e ("of: reserved_mem: Restructure how the reserved memory regions are processed")
Fixes: 00c9a452a235 ("of: reserved_mem: Add code to dynamically allocate reserved_mem array")
Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
Tested-by: Zhao Meijing <zhaomeijing@lixiang.com>
---
 drivers/of/of_reserved_mem.c | 37 +++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 8d5777cb5d1b..9d1b0193864c 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -129,6 +129,8 @@ static int __init early_init_dt_reserve_memory(phys_addr_t base,
 
 /*
  * __reserved_mem_reserve_reg() - reserve all memory described in 'reg' property
+ *
+ * Returns: number of regions successfully reserved, or negative error code
  */
 static int __init __reserved_mem_reserve_reg(unsigned long node,
 					     const char *uname)
@@ -137,6 +139,7 @@ static int __init __reserved_mem_reserve_reg(unsigned long node,
 	int i, len, err;
 	const __be32 *prop;
 	bool nomap;
+	int reserved_count = 0;
 
 	prop = of_flat_dt_get_addr_size_prop(node, "reg", &len);
 	if (!prop)
@@ -160,12 +163,13 @@ static int __init __reserved_mem_reserve_reg(unsigned long node,
 			fdt_fixup_reserved_mem_node(node, base, size);
 			pr_debug("Reserved memory: reserved region for node '%s': base %pa, size %lu MiB\n",
 				uname, &base, (unsigned long)(size / SZ_1M));
+			reserved_count++;
 		} else {
 			pr_err("Reserved memory: failed to reserve memory for node '%s': base %pa, size %lu MiB\n",
 			       uname, &base, (unsigned long)(size / SZ_1M));
 		}
 	}
-	return 0;
+	return reserved_count;
 }
 
 /*
@@ -275,25 +279,32 @@ void __init fdt_scan_reserved_mem_late(void)
 
 	fdt_for_each_subnode(child, fdt, node) {
 		const char *uname;
-		u64 b, s;
+		int i, len;
+		const __be32 *prop;
 		int ret;
 
 		if (!of_fdt_device_is_available(fdt, child))
 			continue;
 
-		if (!of_flat_dt_get_addr_size(child, "reg", &b, &s))
+		prop = of_flat_dt_get_addr_size_prop(child, "reg", &len);
+		if (!prop)
 			continue;
 
 		ret = fdt_validate_reserved_mem_node(child, NULL);
 		if (ret && ret != -ENODEV)
 			continue;
 
-		base = b;
-		size = s;
+		uname = fdt_get_name(fdt, child, NULL);
+		for (i = 0; i < len; i++) {
+			u64 b, s;
 
-		if (size) {
-			uname = fdt_get_name(fdt, child, NULL);
-			fdt_init_reserved_mem_node(child, uname, base, size);
+			of_flat_dt_read_addr_size(prop, i, &b, &s);
+
+			base = b;
+			size = s;
+
+			if (size)
+				fdt_init_reserved_mem_node(child, uname, base, size);
 		}
 	}
 
@@ -331,16 +342,16 @@ int __init fdt_scan_reserved_mem(void)
 
 	fdt_for_each_subnode(child, fdt, node) {
 		const char *uname;
-		int err;
+		int ret;
 
 		if (!of_fdt_device_is_available(fdt, child))
 			continue;
 
 		uname = fdt_get_name(fdt, child, NULL);
 
-		err = __reserved_mem_reserve_reg(child, uname);
-		if (!err)
-			count++;
+		ret = __reserved_mem_reserve_reg(child, uname);
+		if (ret > 0)
+			count += ret;
 		/*
 		 * Save the nodes for the dynamically-placed regions
 		 * into an array which will be used for allocation right
@@ -348,7 +359,7 @@ int __init fdt_scan_reserved_mem(void)
 		 * or marked as no-map. This is done to avoid dynamically
 		 * allocating from one of the statically-placed regions.
 		 */
-		if (err == -ENOENT && of_get_flat_dt_prop(child, "size", NULL)) {
+		if (ret == -ENOENT && of_get_flat_dt_prop(child, "size", NULL)) {
 			dynamic_nodes[dynamic_nodes_cnt] = child;
 			dynamic_nodes_cnt++;
 		}
-- 
2.43.0

