Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFE939DBE0
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 06:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777445975; cv=none; b=b+Shy0H45A+0LIFHjey1gNAPZ8wj9gFzbBYAjOs4xHe/H9lQDmudlINoYjWH1UXZkPSzMyUBmSLPxi5u8whtmwMAAVgP1zzgRq2gnR5PIRSz8wwPB5o3R/LEqgMUUs8GQxwMRiHWuhYzLZQE9Hnq97spFo/gg39gtmPWpQUP5Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777445975; c=relaxed/simple;
	bh=njXek1mtACSOjC4Z95gnnxHimRa+XaiIE4tLKUU7iZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pltaX+cArf4q9U+DXoU9AX8IMGc2vNgqkzqNU03mqYe1q1aq6xAyVlKbpxIDm4zi9zY4rIzV1P9gMe2vBmR39cHgcqGZ/RWG5U6FLN+MqCPCgWygx2bknRe78T46FueamktBlqBpoXzoIlcNzxGww6xBTeZ9EJP5vCLJYrL+oWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y40p1EVH; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y40p1EVH"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-82cebbdbdccso389086b3a.1
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 23:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777445973; x=1778050773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ejmHsY9aPO4mjE6CDrxULTYgFgw7tdPgcMhiefmNm8=;
        b=Y40p1EVHlbNm6FIzq2x7jJEbhRHfZEj/l6wvnst5xi/4hOfjTuktEcgcEKtzFH908l
         UhtwWz507ztReMZcfOfcO3dUFaKSjiZVwZ82dnWA0/CrVdTzkja4Or0p+uwR8i+xpOUS
         k1Zu0xcj2UZ8bcg5uP7QYZBhlDGsdFOhZt8z9oWAZ8m7QCoxn1AXMCB3zVcfYc7gI0TR
         8vLaI2YHDeuOxwJD/0hTX2Z9wZsaOkHjyj62HBfEfIygZNCvAJprn3gdTdKexHsFNeVf
         gnDnLoGNmjm/y3CZTjH0QItk5D6C53lkXXHrZAyJ+Y+KzAVB0lX/0/OZ2ZWcT2TNPcWY
         xU0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777445973; x=1778050773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8ejmHsY9aPO4mjE6CDrxULTYgFgw7tdPgcMhiefmNm8=;
        b=OW2xkzYIAOMRF1tdmWHIZjOAjDa7BM4EUSDv100eMmvOkU8VstHrOzsVB2tX9PmSl0
         /+ihlC7aeqNzQv/5Mt7AtxPDr1UWSIzxxQInCqdjPWxY+EBmTchBYEo0ObZQ/zpdSQu4
         grdmX7PyXr4K5Fm72/T9H0pJkCw2HJ3dZwYh0sTVs6R2PDr/4Cts3E7skxjFSzTPdQ1i
         UmIODvvHxdRxV3MCitb3fLhcH2fWQGt5hLziEZwGWJfs3WKkcRNt7pJaz9A60IuWcWju
         eZAUhJXnhyFtlHiV4RrBuSalrvgzzsZZLC0l7tGCAE09JYPGL4nIuEvKN4oJXkYB5pD1
         Dt7w==
X-Forwarded-Encrypted: i=1; AFNElJ8j7p7MIw38Laf6QJnC5ne4hpTjZqpXYr39tWjl9STnlMHSmDIe6AwFMhGf1NVU4/NM5q+mmUdGeWap@vger.kernel.org
X-Gm-Message-State: AOJu0YylbFtxy2ZHnBIRBwmApwxWidkEj0h1jBTkfOyelWUihMiIyjgL
	WcM5F0tXlB5lKoWW1AH2QWbleuZmkcxHfT1W6Z0kTLTVvuQbNYVHDBUh
X-Gm-Gg: AeBDieuleTHYypXqZeFPF4ICSAMeeErGQBCUIkN7P1c/a/vNPnzznGEYLIb8kY5gDYm
	M72jYeZMql1HF0cS6pZuKy2dfusM+KVOKZNftODk0kG7ZhK5cOIEFZPSFPmOuwN+ttca4kbJvwQ
	/zUjQMWN3yngbb5FEU0K8L5amAYYuwVnyxCM4aORlKyZINPgxZ7h5cZdNbmwnZcg9c2WtCt3p6A
	3vd+AeStT7XD4F8Pgmpg+BvDA78vSfFVleyMSr1PaVzhaM7CwKOUMtaXfxqVR2qbYao679cjFPJ
	Vv6Chu6s3ry6yf95lnXCmUOYoz+yXCI2rOeWdHnTutDHDUK8UZIXUFgNbkH1IaYlXR9WoZAhCTq
	t7zhlIxRrvtGmMZRdAIO2fCxN2ay1hfIM2a4zkEkRo+A3s0WowwUEH2OAidgum7JrikiSmYLnzg
	dzKAHRKKEKeiuZKBcGNN+PXh7rLhFOBwqtE2yZwC7/VX61f0phbMOTp+39Qjk=
X-Received: by 2002:a05:6a00:2e93:b0:82f:2d48:f8fc with SMTP id d2e1a72fcca58-834eb3e4d01mr1774850b3a.6.1777445973470;
        Tue, 28 Apr 2026 23:59:33 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eaf93sm1043146b3a.40.2026.04.28.23.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:59:32 -0700 (PDT)
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
Subject: [PATCH 05/11] of: reserved_mem: add linux,no-dump property support for reserved memory regions
Date: Wed, 29 Apr 2026 14:58:25 +0800
Message-ID: <20260429065831.1510858-6-chenwandun@lixiang.com>
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

Add a 'no_dump' field to struct reserved_mem and parse the
'linux,no-dump' device tree property during reserved memory node
initialization. This property allows device tree authors to mark
specific reserved memory regions that should be excluded from kdump
vmcore dumps.

Reserved memory regions used by device firmware (e.g., GPU, DSP, modem)
typically contain data that is not useful for kernel crash analysis and
can significantly increase vmcore size. The 'linux,no-dump' property
provides a declarative way to indicate these regions should be filtered
out when constructing the elfcorehdr for kdump.

The property is named with a 'linux,' prefix because kdump/vmcore is
Linux-specific and the property is an OS hint rather than a hardware
description, matching existing properties such as 'linux,cma-default'
and 'linux,usable-memory-range'.

The 'linux,no-dump' property is only effective when the region:
 - Does not have 'no-map': these regions are already excluded from
   vmcore since they are removed from the linear mapping (MEMBLOCK_NOMAP).
 - Does not have 'reusable': CMA reusable regions are actively used by
   the kernel for movable page allocations, and their contents are
   valuable for crash analysis.

The no-dump status is also printed in the boot log alongside the
existing nomap and reusable flags for diagnostic purposes.

Corresponding dt-schema binding update:
  https://github.com/devicetree-org/dt-schema/pull/193

Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
Tested-by: Zhao Meijing <zhaomeijing@lixiang.com>
---
 drivers/of/of_reserved_mem.c    | 13 ++++++++-----
 include/linux/of_reserved_mem.h |  1 +
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 93585af9f8a3..ac3d8b837d61 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -654,6 +654,7 @@ static void __init fdt_init_reserved_mem_node(unsigned long node, const char *un
 {
 	int err = 0;
 	bool nomap;
+	bool reusable;
 
 	struct reserved_mem *rmem = &reserved_mem[reserved_mem_count];
 
@@ -662,11 +663,14 @@ static void __init fdt_init_reserved_mem_node(unsigned long node, const char *un
 		return;
 	}
 
+	nomap = of_get_flat_dt_prop(node, "no-map", NULL) != NULL;
+	reusable = of_get_flat_dt_prop(node, "reusable", NULL) != NULL;
+
 	rmem->name = uname;
 	rmem->base = base;
 	rmem->size = size;
-
-	nomap = of_get_flat_dt_prop(node, "no-map", NULL) != NULL;
+	rmem->no_dump = !nomap && !reusable &&
+			of_get_flat_dt_prop(node, "linux,no-dump", NULL) != NULL;
 
 	err = __reserved_mem_init_node(rmem, node);
 	if (err != 0 && err != -ENODEV) {
@@ -680,13 +684,12 @@ static void __init fdt_init_reserved_mem_node(unsigned long node, const char *un
 		return;
 	} else {
 		phys_addr_t end = rmem->base + rmem->size - 1;
-		bool reusable =
-			(of_get_flat_dt_prop(node, "reusable", NULL)) != NULL;
 
-		pr_info("%pa..%pa (%lu KiB) %s %s %s\n",
+		pr_info("%pa..%pa (%lu KiB) %s %s %s %s\n",
 			&rmem->base, &end, (unsigned long)(rmem->size / SZ_1K),
 			nomap ? "nomap" : "map",
 			reusable ? "reusable" : "non-reusable",
+			rmem->no_dump ? "no-dump" : "dump",
 			rmem->name ? rmem->name : "unknown");
 	}
 
diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index e8b20b29fa68..29674f572673 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -15,6 +15,7 @@ struct reserved_mem {
 	phys_addr_t			base;
 	phys_addr_t			size;
 	void				*priv;
+	bool				no_dump;
 };
 
 struct reserved_mem_ops {
-- 
2.43.0

