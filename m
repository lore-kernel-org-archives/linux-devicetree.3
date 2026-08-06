Received: from mail-pz2-f0.google.com (mail-pz2-f0.google.com [74.125.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7714439338
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786008964; cv=none; b=Q2HRGdpMQC6eN8Lmv8+JBnV4uKLBZ7gu3cshY0SihzLi40Oq/F6mG/xzTi2XUjglTtlrDhH8jZ5xIxEHNtqsHk9ol9vGK1ir7rX8+ENo/A5mUxut3CSABdtUnC+waU66UW7CkF3mR7nMsWqpZESJP+xRa51M/0P8H+7FznMDSaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786008964; c=relaxed/simple;
	bh=lZf+l4j/Q4ThP9Eu+M5Jyz5exYGOi//i+2xKo39QXs0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nt2YNQYF2RVtXg1nBRpCDyaziLC7vwJ9fnuCD9L0S437CJ1qt+ZFdQKf4RRdoNb5QMEBzUR40/Ge/LNKthRsKi4rrPZDhxsCrcxgn5hVWvKnJMIC8ylMk0wEbY0n+zpv9nqhY3NDgDaEfDPqJOZmIii5bB3GKvEnKcHfZFUmx7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ng2BmNDE; arc=none smtp.client-ip=74.125.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ng2BmNDE"
Received: by mail-pz2-f0.google.com with SMTP id 41be03b00d2f7-ca24d39d8a4so1086041a12.1
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 02:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786008960; x=1786613760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=knTPycIW4JC9RtVxI7lTQdVb1SJbys3U0akygREf/j8=;
        b=Ng2BmNDEflIgQRMw6MjhdXuQREtj8M6wTz1KAAKNYBYCCjuh37DO6DvvD9IVQ2UVtm
         PrN02d0S8FhMYnQYIb4Dgc5mjvqPBR1FrCvCtPiZOXoL5d4HjpWvGkxe3/XqvUxjSaG5
         eyNPruUhRyzDqShquRxHBahbpLJRwcJPgY6/5OzTKhKPFxjqRWLt2Kxz5fRhzlfGJFzd
         uv4GMIEXmTfdTkGsqczh9wpMWN5OvEuCn+v71oi3xF5TiNlnXg1QsqSXkDM0IZmVz18X
         62tSA4pEFlw6YEPIICciQ3qEbUT11qjE/7vA8GKN0WBf4o3RcDEVje0uVZHxubJ5/MmE
         QzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786008960; x=1786613760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=knTPycIW4JC9RtVxI7lTQdVb1SJbys3U0akygREf/j8=;
        b=PWB+VsDhfeWmEvWK22YE7Fup2UFKlC9mgF50Rn4pYnJ3x/V4lHu5YRviuzWu7oujpa
         3IKX3jlDD2fYQrhlpnyPcZA9qvReh2aOfhH3kgyC4Bh7qXxV72TucZPlbzj+Sv2wq4DT
         TjPu6rB/XvLjfzXN4akvUC6HovARvuzoUIfs7tA/91KWAn8lVohRXYwNVo0G6jF0kzD7
         G188B5XhPluTef0+cFbQthhBu05rX1bz/1RwuEyht8xxUZpnUqGId69h/kTZMjPs7zjN
         5Gx2GSYhOP4QNNSr68r6W9pyMr5o+yz0LdXJk6k1KPcWWG1PQfj0GwLJDCQczVl1AyCb
         1WnQ==
X-Forwarded-Encrypted: i=1; AHgh+RqwU2TlxuaZHINRyxTOFaw9GKRPZKJsD3qLtiKOd4ZClX/sbO6zCFdyttKzqqGL2p5kOYWTWBK7frUD@vger.kernel.org
X-Gm-Message-State: AOJu0YyGa+mio29oA/sm/jjW4tHVG0SZpJknZKfCJIQsivutE5wFK623
	6EfPZmPFtV/iiOOlb6fNzcTyijIgKFHtIuj6DoBJfxoJ2gHnmydn3I59
X-Gm-Gg: AR+sD13xoi0PekJB/IAZJLjNTeoX/ybocxNmbchNa3ucX7eld24eycVOfjoX3RDXi4M
	cXLNGcHCAG6e47KlhcxOgN4O2Xj+SSuha+VqG1VDg0soc8JBiedBCaU9WhkiHGYypBaqqi+uzR6
	lPLPVxBaQ59R/vrAs6Ezvyfcc/nnF3b1IZ2UGhQBaeGfq2SnnceHpnF5AY4S4mbg2CfJseHEy3b
	LqeV1t7N9h9guS73IVFixMTGJSDENslX9fnP5kpi24I/KumctH4yJsTyq2UFItRy1bUchBnBh+H
	cOMNuqK4rMdyPBJVH6l2j3CROhikiaBUzuTm+Kb2a45EdCN/MC102v6RHCq/ZkCW2C6I3bH1vvg
	3J7hx7ymx9EAvEytD0yF+wYJn+5kqacm+sSpuvDcIaXeELCZXqC2wZU6p1JeNvdjjJScnU21lXp
	R/NMeJXn4HSXzAaJSn6u15z77KvGu4vrITWGDvQjTWIdrH1g/ZSsGOBwHZHb1QnDVyQ/D+AfAdj
	kM=
X-Received: by 2002:a05:6a00:2d8f:b0:848:7552:3d86 with SMTP id d2e1a72fcca58-84f2e009be7mr14478703b3a.23.1786008959699;
        Thu, 06 Aug 2026 02:35:59 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f453b0aeasm1043878b3a.13.2026.08.06.02.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:35:59 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	rppt@kernel.org,
	baoquan.he@linux.dev,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	m.szyprowski@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev
Cc: kernel@xen0n.name,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com
Subject: [PATCH v5 2/8] of: reserved_mem: add dumpable flag to opt-in vmcore
Date: Thu,  6 Aug 2026 17:35:13 +0800
Message-ID: <20260806093519.2907771-3-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806093519.2907771-1-chenwandun1@gmail.com>
References: <20260806093519.2907771-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

Add a 'dumpable' flag to struct reserved_mem to decide whether a
reserved area should be included in the kdump vmcore. Non-dumpable
regions are later marked MEMBLOCK_NODUMP;the filtering itself happens
in memblock, keeping the arch kdump code independent of the DT API.

Most reserved regions are owned by devices and do not contain data
useful for kernel crash analysis, so dumpable default to false.
Reusable CMA regions are different: their pages are handed back to the
buddy allocator and may contain key data for crash analysis, so set
dumpable to true in rmem_cma_setup().

The dumpable flag is also used to check /memreserve/ entries for overlap
with other dumpable regions.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 include/linux/of_reserved_mem.h | 1 +
 kernel/dma/contiguous.c         | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index e8b20b29fa68..55a67cee41ea 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -15,6 +15,7 @@ struct reserved_mem {
 	phys_addr_t			base;
 	phys_addr_t			size;
 	void				*priv;
+	bool				dumpable;
 };
 
 struct reserved_mem_ops {
diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index f754079a287d..63ff134dadd4 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -565,6 +565,7 @@ static int __init rmem_cma_setup(unsigned long node, struct reserved_mem *rmem)
 		dma_contiguous_default_area = cma;
 
 	rmem->priv = cma;
+	rmem->dumpable = true;
 
 	pr_info("Reserved memory: created CMA memory pool at %pa, size %ld MiB\n",
 		&rmem->base, (unsigned long)rmem->size / SZ_1M);
-- 
2.43.0

