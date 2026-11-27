Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770552;
	b=A1qu702/5Ch0eCJQvKIKevr9OllGxw9WMEjAZNhhmn2nEviZFmi3YnFy8UidNF6urcPS
	 12ETeP00mJv5rOx2P4pZsH1LunegnFLUrGrfYG2ksl9IyEwTetZauvIfhnlRpMemGTFCW
	 eKyxEfKO6FpljayU1D6AvGJLH+76Ya/q9gfHqBRt8bGHS5zHiSXqcKYCw3SHhS6vejmUn
	 q8uKy6ZvSFzs6673uUnM+e97iloqqM4XOENGIUdKG0ZkErW/o88tB7P/Ho4Kzh7YfgPbQ
	 P/at+JXFfBOheLGl8uMu3TFNXaac1CdjpgycegHVH0Y61pgxHS4xGTeYasDoQV4X5ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vXO/Y/CYrpQIxWyPESy68yxl237JHlY56bkJQSv87LI=;
	b=32sJkk5RDHJ/jUyigD6+nx6r/ggpEgPhRzLxtxANILHF4t+gqqohohS0wl0QU7PFEKNd
	 ihQdIpXxG8wHkuc8r95okPxuLIgN21EWk2N7nbCVItock3ykl5Cqm8tKvQqrQqNpnozh1
	 cXXMGcrroo1BJfnUfSb9IpDsVnxin49+VwvtN2IZB0kcP0Yb1+/jRCQFX1uGQrxrtEitc
	 D4hu0mk9Ty6YNM4MAEr2XMANftyDzIWyV8iv/waVaiYc54tMur8hHKUw+FdKbRASBZHUC
	 Scb9PxNPyRwtZn6vj3G6NSeaa6CeLAi9vdiH7fGtKpTliCgy084jdFYifoWrS/g2syA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SkuZz+mJ;
	arc=none smtp.remote-ip=74.125.227.131
Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B119606A324
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 09:09:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B119606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SkuZz+mJ
Received: by mail-pj2-f3.google.com with SMTP id 98e67ed59e1d1-3b509dc9d79so363115a91.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 01:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770551; x=1796375351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vXO/Y/CYrpQIxWyPESy68yxl237JHlY56bkJQSv87LI=;
        b=SkuZz+mJDHOk9OFN2WwbkiZTq9QdyGqBwYx2wB0aGL9C0ZOF4UE75bp4ZvBUKlKlgi
         yYlNhjvqV3wZJ0BQt8bcQcIK2f6FLuVTgsVAy0w9OHAz6FbBCtZ/T9Iu6qoFG1GGqZLz
         qtm1VLW+e+ZneQW6+R8aBU/HD4P9SwDsANs81TPYD/3dVMZJll5dZdKvPM/TUjVDUAD5
         uPrKsouF7XojyWAayGkKGRLeGRymQgGQJrLsP89fKldRuDHFqWd9bThBZjvbi/mq9y6z
         ipzbPqymnl+/yUvmud7LTPm/sho60kmnH5tdMmzP04Fch3YRBZGOTIfrXX42d5/34uEZ
         MLgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770551; x=1796375351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vXO/Y/CYrpQIxWyPESy68yxl237JHlY56bkJQSv87LI=;
        b=zzCO2+oK67Whre8nJ0Jx38/JIH9txQMHOL4KHl1oNYUWTqfGmP2tWFbQGcARyGVrgx
         4GqAt8gRz1HDAtC6bWJQBcY8ALLhEdY5PVoXbavJOY9knUOLH2mzGXznMBbZfnbEugHk
         JrzP1mCuWG8tWQq5v6HVoG3NBfZU+8d68GLSIttWZcbAAjcrDBTqWUJM7lP6MupjCZSm
         uQiGfujvBTP+/QDWQsLGwz/cyel3U34cLyIRjsO/q5MJRCAEevzrJj5G7SG96FY2vCz1
         eFIqz1d32Sq/GBhj3TMGlM0tBOa1xb20+UvnA3Pp+oRJjmWFv3EQ4ZWdCGDg3uhJTqUr
         UUrw==
X-Forwarded-Encrypted: i=1; AL+hErEN618oO9Li//PpZLBxMhYvzF+Ebq7hy3vCuEw2wU7UXVDQZ6XJUaKsrCEepwEfZX1nl21W3XXIZIiT@vger.kernel.org
X-Gm-Message-State: APuU4Z8CBevNuQwXnZbbRNPoL0bzq/7fSo8FiLwaSFCi0TRyKau9fgq4
	CJQZbJjQH7NkgUO2GfONvRhXw+b1fJ09AUdUk6bl5xn63BYYlKp6clJi
X-Gm-Gg: AZFdTZdhAf4qcu/rHL/Ep0c0D/2S5ThUPYS5b1Kih83ckZdBeWT20XDOYrCwNDKKttF
	s84nQSk8JwkEnq2eFJ66SLPiD+yg9epGhqB/pTsjrFvmSQDInV4/vNcLaFJnd5NTa7jda1JqbPn
	VPPjCBqNB9YCOxiCpuIgtBFTs/rm0/DkZSyHkXRQ3wBwrDE/oyGwB9viTRFT9CKfFGhB8OQhG6n
	Q1iGDrLNHFT0udJlTTGs5SHgR7qVQPTUaZ4X9xBRqTNkRLnd6gA27L00xRZ3qJumkMD7ktssAWE
	GXT/mRCHlLvAQ3HGN8B0W3W8kT4YRHM7wK2/DfqOOHKX9NbAJ2fkTb0UwfivYGG4MudwUFADuUT
	JbqxaeA9XEkQWe3AtoVTAY6lqsJzTE26HxsNzv4HCTiYCjx/pSPgWP1J/ZcR/UvIW1ObbcOCitE
	HbDspl5YYOdbUO+qFYuov0+s7rIhno2ainUaZDdSMnT6hWiEbzuyr9J0UyfM0qdxgIzLrex/p/D
	n0LnnRk4ffblYi3qGqcTdu75Q9G427VyU2C3mcbNd1FC0K+RtMj2Fdd9+13QLMzmqPT1W8svjwp
	bNkYn0lSyA4coiZ5Dg77yid1oVeBjpR2eRaHgBqnaCI=
X-Received: by 2002:a17:90b:5907:b0:3b5:29e:11b4 with SMTP id 98e67ed59e1d1-3b5029e1464mr6516552a91.44.1795770551516;
        Fri, 27 Nov 2026 01:09:11 -0800 (PST)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d06ee37sm11718725a12.28.2026.11.27.01.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:09:10 -0800 (PST)
From: Wandun Chen <chenwandun1@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
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
	ruanjinjie@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v10 7/8] of: reserved_mem: mark /reserved-memory entries with MEMBLOCK_NODUMP
Date: Fri, 27 Nov 2026 17:07:22 +0800
Message-ID: <20261127090723.741253-8-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127090723.741253-1-chenwandun1@gmail.com>
References: <20261127090723.741253-1-chenwandun1@gmail.com>
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

From: Wandun Chen <chenwandun@lixiang.com>

Mark non-dumpable reserved-memory regions with MEMBLOCK_NODUMP so
kdump can omit them from the vmcore.

The marking is guarded by CONFIG_CRASH_DUMP and either CONFIG_KEXEC_FILE
or CONFIG_CRASH_HOTPLUG, so kernels that do not build or update crash
ELF headers do not pay the cost of splitting memblock.memory entries
at NODUMP boundaries.

Clamp the marked range to page boundaries, since a sub-page split
would leave fragments that cannot be represented as valid System
RAM resources [1].

Link: https://sashiko.dev/#/message/sashiko-outbox-181183@kernel.org [1]
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/of/fdt.c             |  2 ++
 drivers/of/of_private.h      |  1 +
 drivers/of/of_reserved_mem.c | 30 ++++++++++++++++++++++++++++++
 3 files changed, 33 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index a58efdcbac7f..f3a766310d11 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1283,6 +1283,8 @@ void __init unflatten_device_tree(void)
 {
 	void *fdt = initial_boot_params;
 
+	fdt_mark_reserve_mem_nodump();
+
 	/* Populate an empty root node when bootloader doesn't provide one */
 	if (!fdt) {
 		fdt = (void *) __dtb_empty_root_begin;
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 895f868b4cfa..00f776819dab 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -185,6 +185,7 @@ static inline struct device_node *__of_get_dma_parent(const struct device_node *
 #endif
 
 int fdt_scan_reserved_mem(void);
+void __init fdt_mark_reserve_mem_nodump(void);
 
 bool of_fdt_device_is_available(const void *blob, unsigned long node);
 
diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index a5cd8c2fffc3..cef444d4c1a3 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -610,6 +610,36 @@ static void __init fdt_init_reserved_mem_node(unsigned long node, const char *un
 	reserved_mem_count++;
 }
 
+void __init fdt_mark_reserve_mem_nodump(void)
+{
+	struct reserved_mem *rmem;
+	int i;
+
+	if (!IS_ENABLED(CONFIG_CRASH_DUMP))
+		return;
+
+	if (!IS_ENABLED(CONFIG_KEXEC_FILE) && !IS_ENABLED(CONFIG_CRASH_HOTPLUG))
+		return;
+
+	if (reserved_mem_reserve_failed)
+		return;
+
+	for (i = 0; i < reserved_mem_count; i++) {
+		phys_addr_t base, end;
+
+		rmem = &reserved_mem[i];
+		if (!rmem->size || rmem->dumpable)
+			continue;
+
+		base = round_up(rmem->base, PAGE_SIZE);
+		end = round_down(rmem->base + rmem->size, PAGE_SIZE);
+		if (base >= end)
+			continue;
+
+		memblock_mark_nodump(base, end - base);
+	}
+}
+
 struct rmem_assigned_device {
 	struct device *dev;
 	struct reserved_mem *rmem;
-- 
2.43.0

