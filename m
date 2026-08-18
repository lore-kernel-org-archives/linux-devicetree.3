Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251C54457A3
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787045075; cv=none; b=HDzykPEn6st24BeunWpmk224dG1LoBlvACl8Bo49fX7wknOjOv0vGYXQf4rcFDkN8ZK7eDLqDHVBvxzeqivYkJVn6KJ1k4+3Nqu+pAMjJHKlwoXODW1Bnhch/agzgIePEY+B4pyMvySO8OFtkmnMqfjKbS8RkH4zjXsq/3n/DsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787045075; c=relaxed/simple;
	bh=AZW+JtHL/apWBr9muRBcy0BI7L3aVGKCtqBv1W/MCmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lAv1gv5B6Xeo+xIJk7px3I9eVth0O4EKLT4zS1ouXtYBDLcMsU2tkBxPlyhDT9Hu9IquReDMkGND8NuN0Gbkj4+jfeq8pIP0wJBPb1X7sK46dtlN88asHGE4y7O8GM8Q+6ta6dg+s3tKrYZ+XS90vJDr9vw2v0TqLE7idPz9Q0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=byvUX5uq; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="byvUX5uq"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-84847482584so606920b3a.0
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 02:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787045073; x=1787649873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=edFBVCDZ8uahtaafghiqDdA2JkU9nFhvYVeD5bTaUSM=;
        b=byvUX5uqglOdLjj5+Ljn7KLUIABn+/ZCWa7ZYq5RKwULuPuazalYc4mLq2hUyu9wWz
         re7pticr6XXEbNJ7jUsPBINwryhDeKtMtJcvcjfAYkXwFKlccXDXYw18WvmJqZpODfZ8
         AQChpsVx3dhCc8aQDWT36eGDRcNSqjHUvWWsgekQCtUhGE70+8oiDI1ljwt2c86qJr5C
         cX57xrTCy2zrIZt0IcC0yoSso+GKaHMl+JJZL+YXC1rzIZJebe2mOErcDsuqVMFv7L/E
         djwlxFswF4AduUTlXVEeDOfYetZVkl89n6PLLUCb8bTJcJz9uYQzmFO8MO/XP+5MCtt2
         lBfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787045073; x=1787649873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=edFBVCDZ8uahtaafghiqDdA2JkU9nFhvYVeD5bTaUSM=;
        b=jKlirmzWxfhJ+FuGxFhtoh7KcbQxkfLpiat+tmvsq/BogCEEbwmr/mvVtW/TycEi6d
         1qjA5WedrDOHS483N3R3UVx7MuggnQlh5x5GEkkyVSb51d84D3L/gfVvQAqatwVuKXJR
         kkayGrnfRVvzvlOBESi+WCoxrKT+9ETtpW4djRNA6NH88rFOcfccysjzLKLH82FIdx/D
         ArfwQXfoRWjWOaczolDE/gT4JtuTysvASShkiLXdOdDwhcEKUS7yYOrxWfddnRY5RbMn
         p8/ENje52+SpZsbirV1V7gOjqtKEUB/O2sLE3G8Ly8GzSrXTsJxkNe0K+JXwx5hLJ4K0
         FQDg==
X-Forwarded-Encrypted: i=1; AHgh+RoatuYp/d6IV/H9ga2nXT0YTFo3L6SkwFV7wKVZ76nOnOpqnJX6W3SxKfacTIGDBOTvilGz9j3f51uM@vger.kernel.org
X-Gm-Message-State: AOJu0YxbWwVG22gsY8PVGb7vH6+aBbxtDcZA4PEH7EKjh8JTzj6L08Xw
	ufv9oMQm2ihhQMP2bz9HU77r5V6bXtKK0fnLdo/6FC1p0Cn+WB788MsQ
X-Gm-Gg: AR+sD11Vwg5N7hYFtzIXgi76zMPip0bnGoOfIXNJvVQ3Y3fUbftqswjalCJWukk+v2N
	i8FchR8NOtSGHLqqwbDuL5Raq/e2EXnaMxZdCvHd0RFwh+fTriIsN6kuTKCCWX2yGrkeSTq952/
	d8RlGQgFCgNOzQhXSQ8cNymChgYgaMZrnCjF1ToJWUIg44mLtcYEbZZClaGXh/PGFYEIvgANDl+
	tu0/KAt9NuljcpUPmUZZIxdo1IkyqyL+2NaMym/1slpHeJ+ZDk4xpbDpEATZiyAXLdSn05LEOlp
	PyELmWRVEZ2anBHc5yAHQE7Sr0N4VBC7NmNzAVumOt2eVMDIMUwbRSWdwKK6j/Q9JxotWy4EdYf
	A4hhWrVntyJJiwy1+U0SGljjMDy1lcnZQ/+0FM+JH3fkH1aNHKI7X9GADcck0yMgx2ESxEgtLSU
	uPiTu2RD4TIYRXHoLMKDignNIEKLtWSOY+V5H2jZOOpocgm4kzvF0bX97n+ZURTFqT4oVgAY4y
X-Received: by 2002:a05:6a00:3a13:b0:84e:ea49:8899 with SMTP id d2e1a72fcca58-851bc2cc6b9mr4442181b3a.6.1787045073210;
        Tue, 18 Aug 2026 02:24:33 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc13c036c50sm1855975a12.26.2026.08.18.02.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 02:24:32 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	saravanak@kernel.org,
	rppt@kernel.org,
	m.szyprowski@samsung.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: akpm@linux-foundation.org
Subject: [PATCH v2 1/5] of: reserved_mem: skip init for regions whose early reservation failed
Date: Tue, 18 Aug 2026 17:24:16 +0800
Message-ID: <20260818092420.2859026-2-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818092420.2859026-1-chenwandun1@gmail.com>
References: <20260818092420.2859026-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

__reserved_mem_reserve_reg() discards the error from
early_init_dt_reserve_memory() and returns 0 unconditionally, so the
caller counts the node in total_reserved_mem_cnt and the late scan
initializes it without checking whether the early reservation actually
succeeded. A region whose reservation failed is then handed to a
device assuming the memory is protected.

Propagate the error so failed reservations are no longer counted, and
record the failed nodes so fdt_scan_reserved_mem_late() can skip them.

Recording the failed nodes explicitly is necessary because
fdt_scan_reserved_mem_late() rescans the DT independently. It cannot
tell from memblock whether early reservation succeeded.

The failed-node array is bounded by MAX_RESERVED_REGIONS, the number
of static regions is not bounded by it, so on overflow the extra nodes
fall back to being initialized, which is the current behavior.

Fixes: 8a6e02d0c00e ("of: reserved_mem: Restructure how the reserved memory regions are processed")
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 drivers/of/of_reserved_mem.c | 65 ++++++++++++++++++++++++++++++------
 1 file changed, 54 insertions(+), 11 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 8c9d6395d6a3..c6e73d710ee1 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -32,6 +32,30 @@ static struct reserved_mem *reserved_mem __refdata = reserved_mem_array;
 static int total_reserved_mem_cnt = MAX_RESERVED_REGIONS;
 static int reserved_mem_count;
 
+static int reserve_failed_nodes[MAX_RESERVED_REGIONS] __initdata;
+static int reserve_failed_nodes_cnt __initdata;
+
+static bool __init reserved_mem_node_reserve_failed(int node)
+{
+	int i;
+
+	for (i = 0; i < reserve_failed_nodes_cnt; i++)
+		if (reserve_failed_nodes[i] == node)
+			return true;
+	return false;
+}
+
+static bool __init record_reserve_failed_node(int node, const char *uname)
+{
+	if (reserve_failed_nodes_cnt == MAX_RESERVED_REGIONS) {
+		pr_err("too many failed regions, '%s' reservation failed\n", uname);
+		return false;
+	}
+
+	reserve_failed_nodes[reserve_failed_nodes_cnt++] = node;
+	return true;
+}
+
 static int __init early_init_dt_alloc_reserved_memory_arch(phys_addr_t size,
 	phys_addr_t align, phys_addr_t start, phys_addr_t end, bool nomap,
 	phys_addr_t *res_base)
@@ -141,7 +165,8 @@ static int __init early_init_dt_reserve_memory(phys_addr_t base,
  * first entry in 'reg' property
  */
 static int __init __reserved_mem_reserve_reg(unsigned long node,
-					     const char *uname)
+					     const char *uname,
+					     bool *should_record_failed_node)
 {
 	phys_addr_t base, size;
 	int len, err;
@@ -149,6 +174,8 @@ static int __init __reserved_mem_reserve_reg(unsigned long node,
 	bool nomap;
 	u64 b, s;
 
+	*should_record_failed_node = false;
+
 	prop = of_flat_dt_get_addr_size_prop(node, "reg", &len);
 	if (!prop || !len)
 		return -ENOENT;
@@ -167,14 +194,20 @@ static int __init __reserved_mem_reserve_reg(unsigned long node,
 	base = b;
 	size = s;
 
-	if (size && early_init_dt_reserve_memory(base, size, nomap) == 0) {
-		fdt_fixup_reserved_mem_node(node, base, size);
-		pr_debug("Reserved memory: reserved region for node '%s': base %pa, size %lu MiB\n",
-			 uname, &base, (unsigned long)(size / SZ_1M));
-	} else {
+	if (!size)
+		return -EINVAL;
+
+	err = early_init_dt_reserve_memory(base, size, nomap);
+	if (err) {
+		*should_record_failed_node = true;
 		pr_err("Reserved memory: failed to reserve memory for node '%s': base %pa, size %lu MiB\n",
 		       uname, &base, (unsigned long)(size / SZ_1M));
+		return err;
 	}
+
+	fdt_fixup_reserved_mem_node(node, base, size);
+	pr_debug("Reserved memory: reserved region for node '%s': base %pa, size %lu MiB\n",
+		 uname, &base, (unsigned long)(size / SZ_1M));
 	return 0;
 }
 
@@ -306,10 +339,14 @@ void __init fdt_scan_reserved_mem_late(void)
 		base = b;
 		size = s;
 
-		if (size) {
-			uname = fdt_get_name(fdt, child, NULL);
-			fdt_init_reserved_mem_node(child, uname, base, size);
-		}
+		if (!size)
+			continue;
+
+		if (reserved_mem_node_reserve_failed(child))
+			continue;
+
+		uname = fdt_get_name(fdt, child, NULL);
+		fdt_init_reserved_mem_node(child, uname, base, size);
 	}
 
 	/* check for overlapping reserved regions */
@@ -349,6 +386,7 @@ int __init fdt_scan_reserved_mem(void)
 
 	fdt_for_each_subnode(child, fdt, node) {
 		const char *uname;
+		bool should_record_failed_node;
 		int err;
 
 		if (!of_fdt_device_is_available(fdt, child))
@@ -356,9 +394,14 @@ int __init fdt_scan_reserved_mem(void)
 
 		uname = fdt_get_name(fdt, child, NULL);
 
-		err = __reserved_mem_reserve_reg(child, uname);
+		err = __reserved_mem_reserve_reg(child, uname,
+						 &should_record_failed_node);
 		if (!err)
 			count++;
+		else if (should_record_failed_node &&
+			 !record_reserve_failed_node(child, uname))
+			/* Keep a slot for the untracked node's late initialization. */
+			count++;
 
 		/*
 		 * Save the nodes for the dynamically-placed regions
-- 
2.43.0

