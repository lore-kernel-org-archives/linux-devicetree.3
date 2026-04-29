Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20EE39DBDB
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 06:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777445985; cv=none; b=MfDfaP8Z9H7NKxIHkC0H9GfMaRpSiqWoGCLPc4UwtjGIjFRrze69oU5YgtnB4D6O0H4vBrjTmModM0CIta+4woHS5XNiyWnCxPzPzhSLLSV6TYIuocRow5VNObG+AGBZddH5ipohy28pOjtgmk9SSKDcVfyujwusiBY0WmTm21c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777445985; c=relaxed/simple;
	bh=qpJTPexygSurz5Uyf2L27E21lAO5pvcSgLBshfv01g4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G/xD5LSgVP1+UiFKJqeiERKiWy146wHfHRTtuPmEMooJ/8o0BKQURlgeCcrU8DFk0Rj+XzzPDH02phMs+OOYRsgwRnJcV6OinPaFy/EmnLPx3CDxbdLkdC2OUNjRyWDIp8fZBZfACal1pHvk7B26s+q1Du4uyFXPjzg4f7a1K/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r1xbHHCI; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r1xbHHCI"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-82cf636dac8so5271763b3a.3
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 23:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777445983; x=1778050783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2q9dPj7TNisCrTMpZ3igJmznQK/scPvx1hraOs9ZEkA=;
        b=r1xbHHCIRVod2QEz3dDsT/QVb9bBgSVc+kk8m1OOyKJ3xI1QOdSy9TLjj15mc0kvUh
         4vPuHmxgYfFY0PhNQYnC7b/eaBA5Z/imnXM+G5LF8Jb0uSSswUorB/K60p3+aziE6a+w
         ae14gXJgphdmNWUwpEjYGeE0rjo8hpIB4rli7+iLOiFNPSxTGYRlw1bNX2kOL3gum3zE
         w8AV8Ng+M8GvrQwNEhyzV3uGZCHmVEM8zBKzvU7zCIvXuvOwxKh+sELh4wZJYVM0Hpj4
         +acRWGBhcRLCo1baJnvwqUZZdgPXHwVkxGkYlN7RANgLVdG/VitiF9JIc9lsY0ripr1A
         +dww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777445983; x=1778050783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2q9dPj7TNisCrTMpZ3igJmznQK/scPvx1hraOs9ZEkA=;
        b=TClg5rc5aXnS1ocI/4eTanvx0EdspzHKKWCki1g+XOmC3blvhVfaVGc9BEm9uMsobJ
         FTdSwQk/3rM6+rn7lpjMk+p5zBADyRTWvSsOG1MLVpIYlWdc6njTXv99RkvFefzJHPwQ
         67m5Uo+IsJ5dOBfnfeU1jh1FHhmxAKJ055qhme30xpv5pLuRVazpaLd5s8J8vTmPGWi4
         yUhYM8GvBdQmZCsmCakh83qqbHX/7sUh/TSmAGwzywl9ASvxB2XnEsJfZSVlcEYh6bHT
         qNFSqxIRM6T3k758BYqM6DLLjl7mndyz57OSlKVUdl5uc1Bdw3uid71LHqvoX5Rlosau
         p/AA==
X-Forwarded-Encrypted: i=1; AFNElJ+c0SxCJ1PKVw5Nvi+PirPtfHk8fFVDnju4d8OCE2R8qsqSvzeB0yiIqtmpGS5OZBDyf3BirdbsQ/g6@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7y7Bk9c+k5Hvg/3/5jwpayp+8MiNkTwaEk7hXOy9JCALe4oOM
	Ds0LVIioDf4iiNY7aSjkp1qaXqATmoFg/Brkla67/C/OFSOsanWMBKk6
X-Gm-Gg: AeBDiev3AD48wcrwso/fQEsWnM+QU4e222lKFKsNZ+lBmdqsN/tEKzaPGvXCjXAi83N
	i6/RXFTkwSizWAcYlHszJeeAo5De2zwV7/IkGBt0w3xWQUZTRw9FnGQ4KxAXRyCwqS2NO9jbOkw
	nB7pFAdCihl1hOI3TUfuVFNOfn6oTQWsuHU1G//afgbeC9RNUgMgGJtD0yw8/h/mroX/T+YS/lJ
	StB0Tjn9jz6/Cb6eA7cR2EB4vD/TUYWfv62ucVg+zG5FmKTglWTR74TDdXW9SfaQG1NSKXnm1tu
	J03/XeiyEFR2uJG2ct/qlKnDdfdrIhWLvrbRGjiou+RyWUmP/7SyaZJg+JRbvPMbh+XI2rBoM4K
	r/ioOIVzDzZbm9fa2RYsO50NFczs/Ruu50SzhS3FdL80X+h8sQzAseE1GA32ZDl080EWtlGRlNx
	Yp0UJqi2Zqtmk1SGcd+LjkmGJCXr935qQetCHxtAhWalLDun4R
X-Received: by 2002:a05:6a00:1802:b0:82f:bd8:70eb with SMTP id d2e1a72fcca58-834ddb5b988mr6406851b3a.21.1777445983273;
        Tue, 28 Apr 2026 23:59:43 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eaf93sm1043146b3a.40.2026.04.28.23.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:59:42 -0700 (PDT)
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
Subject: [PATCH 06/11] of: reserved_mem: save /memreserve/ entries into reserved_mem array
Date: Wed, 29 Apr 2026 14:58:26 +0800
Message-ID: <20260429065831.1510858-7-chenwandun@lixiang.com>
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

Save /memreserve/ entries from the FDT header into the reserved_mem
array so they can be consumed as vmcore filtering metadata by kdump.

/memreserve/ regions hold firmware or bootloader state that is not
useful for kernel crash analysis, so saved /memreserve/ entries
default to no_dump=true and are tagged with name="memreserve" so
consumers can distinguish them from /reserved-memory/ child nodes.

Some DTBs declare the same or overlapping range in both
/memreserve/ and a /reserved-memory/ child. Commit b41328187629
("of: fdt: Scan /memreserve/ last") describes one such case on
Khadas Vim3 where the range is in /memreserve/ and also in a
/reserved-memory/ child carrying no-map. The /reserved-memory/
node's attributes (no-map, reusable, linux,no-dump) are the
explicit declaration and must win over the firmware default,
fdt_reserved_mem_save_memreserve() therefore inherits no_dump from
the overlapping /reserved-memory/ entry rather than silently
applying no_dump=true.

Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
Tested-by: Zhao Meijing <zhaomeijing@lixiang.com>
---
 drivers/of/of_reserved_mem.c | 107 +++++++++++++++++++++++++++++------
 1 file changed, 91 insertions(+), 16 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index ac3d8b837d61..4b80420da2d2 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -252,6 +252,49 @@ static void __init __rmem_check_for_overlap(void)
 	}
 }
 
+/**
+ * fdt_reserved_mem_save_memreserve() - save a /memreserve/ entry
+ * @base: base address
+ * @size: size
+ *
+ * Save a /memreserve/ range into reserved_mem[] with no_dump=true
+ * as the firmware default. If the range overlaps a /reserved-memory/
+ * child already saved in this pass, inherit that entry's no_dump so
+ * node-level attributes (no-map, reusable, linux,no-dump) win over
+ * the firmware default.
+ */
+static void __init fdt_reserved_mem_save_memreserve(phys_addr_t base,
+						    phys_addr_t size)
+{
+	struct reserved_mem *rmem;
+	phys_addr_t end = base + size;
+	bool no_dump = true;
+	int i;
+
+	for (i = 0; i < reserved_mem_count; i++) {
+		phys_addr_t r_base = reserved_mem[i].base;
+		phys_addr_t r_end = r_base + reserved_mem[i].size;
+
+		if (base < r_end && end > r_base) {
+			no_dump = reserved_mem[i].no_dump;
+			break;
+		}
+	}
+
+	if (reserved_mem_count == total_reserved_mem_cnt) {
+		pr_err("not enough space for all defined regions.\n");
+		return;
+	}
+
+	rmem = &reserved_mem[reserved_mem_count];
+	rmem->name = "memreserve";
+	rmem->base = base;
+	rmem->size = size;
+	rmem->no_dump = no_dump;
+
+	reserved_mem_count++;
+}
+
 /**
  * fdt_scan_reserved_mem_late() - Scan FDT and initialize remaining reserved
  * memory regions.
@@ -260,6 +303,9 @@ static void __init __rmem_check_for_overlap(void)
  * "static" reserved memory regions, that are defined using the "reg"
  * property. Each such region is then initialized with its specific init
  * function and stored in the global reserved_mem array.
+ *
+ * In addition, /memreserve/ entries from the FDT header are saved into
+ * the reserved_mem array so they can be consumed as vmcore metadata.
  */
 void __init fdt_scan_reserved_mem_late(void)
 {
@@ -270,28 +316,32 @@ void __init fdt_scan_reserved_mem_late(void)
 	if (!fdt)
 		return;
 
+	/*
+	 * fdt_scan_reserved_mem() has set total_reserved_mem_cnt to the
+	 * total number of entries to be saved (reg-based + /memreserve/).
+	 * If it is zero there is nothing to allocate, save or check.
+	 */
+	if (!total_reserved_mem_cnt)
+		return;
+
+	/*
+	 * Allocate up front: /memreserve/ saves below may run on any
+	 * path and must write into a memblock-backed array, not the
+	 * __initdata reserved_mem_array which is freed at free_initmem().
+	 */
+	alloc_reserved_mem_array();
+
 	node = fdt_path_offset(fdt, "/reserved-memory");
 	if (node < 0) {
 		pr_info("Reserved memory: No reserved-memory node in the DT\n");
-		return;
+		goto memreserve;
 	}
 
 	if (__reserved_mem_check_root(node)) {
 		pr_err("Reserved memory: unsupported node format, ignoring\n");
-		return;
+		goto memreserve;
 	}
 
-	/*
-	 * fdt_scan_reserved_mem() sets total_reserved_mem_cnt to the
-	 * number of entries that need a slot in reserved_mem[]. If it is
-	 * zero there is nothing to allocate or save.
-	 */
-	if (!total_reserved_mem_cnt)
-		return;
-
-	/* Attempt dynamic allocation of a new reserved_mem array */
-	alloc_reserved_mem_array();
-
 	fdt_for_each_subnode(child, fdt, node) {
 		const char *uname;
 		int i, len;
@@ -342,6 +392,18 @@ void __init fdt_scan_reserved_mem_late(void)
 
 	/* check for overlapping reserved regions */
 	__rmem_check_for_overlap();
+
+memreserve:
+	/* Save /memreserve/ entries (independent of /reserved-memory) */
+	for (int i = 0; ; i++) {
+		u64 mbase, msize;
+
+		if (fdt_get_mem_rsv(fdt, i, &mbase, &msize))
+			break;
+		if (!msize)
+			break;
+		fdt_reserved_mem_save_memreserve(mbase, msize);
+	}
 }
 
 static int __init __reserved_mem_alloc_size(unsigned long node, const char *uname);
@@ -365,11 +427,11 @@ int __init fdt_scan_reserved_mem(void)
 
 	node = fdt_path_offset(fdt, "/reserved-memory");
 	if (node < 0)
-		return -ENODEV;
+		goto memreserve;
 
 	if (__reserved_mem_check_root(node) != 0) {
 		pr_err("Reserved memory: unsupported node format, ignoring\n");
-		return -EINVAL;
+		goto memreserve;
 	}
 
 	fdt_for_each_subnode(child, fdt, node) {
@@ -406,8 +468,21 @@ int __init fdt_scan_reserved_mem(void)
 		if (!err)
 			count++;
 	}
+
+memreserve:
+	/* Count /memreserve/ entries (independent of /reserved-memory) */
+	for (int i = 0; ; i++) {
+		u64 base, size;
+
+		if (fdt_get_mem_rsv(fdt, i, &base, &size))
+			break;
+		if (!size)
+			break;
+		count++;
+	}
+
 	total_reserved_mem_cnt = count;
-	return 0;
+	return count ? 0 : -ENODEV;
 }
 
 /*
-- 
2.43.0

