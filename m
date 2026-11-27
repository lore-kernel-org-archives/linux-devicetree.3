Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770514;
	b=fdjoUy6Oj+tJ6eY6bmx/jhrM+zkToYWoDp7Buj3j0MZ4oLYnQDuwA3mzJKrQbnZhS+k9
	 1C3Gigb4So1NpgbyCcOfkCOB2jUx2CLhaNUtl5Y+K/9//lih5bC/ifZ3ECorsLg21Sclx
	 GoCLFSC5qB6F6Ea3n6QKqL25LdZfv5SzaeD4hqbRvH3skbJtH9CFSRJB5EHi4RM8Na68j
	 +R1Jyrjo8Cmi2JwCVc8g/SK9JdWszEcutegakpgih16AwhinTbNSSU8Ar7EELUzUgFvk9
	 n3TrrmLLQ0daCUYxYwxpqpiodmdHvwTXatNqFYFNf0bYwE/ZqNCstcFXyb8tkXBPHxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=s7Fb6KtcWAXnUfcecLaSQ1H6J8YKvEJFUWN8A6hcpOc=;
	b=gUiT4HwIqQYZWgK+tb09XFvFtcqw9MZGT65KeRGyBhb8xPHY91T3G+n3H1N18UOtHgSA
	 ptwmBDwup/aBSAEBqb7Kh+Suw4UVOoU41tGsgO/hc44eSlWZDLxxke07PPBbRZzoosSZ6
	 7jtIDPi24cSUgM6K458UgumlmjcZA1Po2I/SpyKyRrjJ1vJQ0zhAJAh1sQaqHurY/NLJO
	 vHRT08F26xy25ij2pSjQ2xzmCUI+V4YLycxMbG5kHfquo3QOoTHK64q6DQ79jZY5WKY7x
	 wxS95yXVKj282WXpjDrmsmwSo/awYRukwytMaebiRCE3x52bQh3e5Fr24i9gTSBr99A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pFYR3bRb;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBC8606A321
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 09:08:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FBC8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pFYR3bRb
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3b3d125637aso1562516a91.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 01:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770513; x=1796375313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s7Fb6KtcWAXnUfcecLaSQ1H6J8YKvEJFUWN8A6hcpOc=;
        b=pFYR3bRb6D7g178abr52Dt8x81iM9fdudu9LdUPBfxowlHul//wOvtb1d1LfTqujI0
         iacEDdSiNevFkd8KRcZDEQYhpLrBWppFmE2yOz7gul1wR5Ie3Vqu5zHfxj2oPGizr8UP
         1Q+Nlfy0iergSG+qyFc7v9Tz1qfUL+BwUKwxWNnAlSn7T/7ZwBPWSBXv97hFHUp0hSX8
         RHPNXBrH6WXgNFUZedHC3sa4TPsYJFC3AbY6Cyj31aJeILTzxWmhPtaQvtSlIZ8TM1dH
         brOC2K/PPayfCIx9y36w5tbd6z5ji2wcpFscbwj/XiA1myW4lX32Y8FW0gx9Jfujxkjf
         6T7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770513; x=1796375313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s7Fb6KtcWAXnUfcecLaSQ1H6J8YKvEJFUWN8A6hcpOc=;
        b=rmUiQOnnUEt8gGLHefaMbPLcg0/U+5Jc5efZIgO2O1vG+ABpeYT+bLNOU2KJpE0wvJ
         eMI5vkcX+N062Z/k9+cu8HpaB6RzWpM+TvAJkdzfo7RWSwYksqCrsxztsqLf2gTuoaKp
         xLdxwz1X5D+HKIUBFqwCCTEbHrobadsdu5HOkxIMypoBiQ4B2csgDInyx6VFuoMZGxXi
         nbXCTYiD0SRtlsdQKB2I10TdU4Nhq/itEygMPrcHDc1U7RIHRRQsY4OYk5rIfM4q8UvJ
         WVftWz+TPjIEhpxKPDMk4x3VbacSHjpq+Rx3ga5RYbAcL0NYww/XN/R70Qtp/IYf4mhS
         aQ+A==
X-Forwarded-Encrypted: i=1; AL+hErEQmBlaTQg4VWyqeHzceR4D6b5YM5H6LxVVmxIu0fcMHN/9/st8XUVrZidxef9Rh53eg8mIsNgp+H0k@vger.kernel.org
X-Gm-Message-State: APuU4Z/lQPSPPej6+zuY7VrOsPiziYQ7l7lVnZiV/brQOCH1laj031A8
	aYG6QqWfU+JKyvFImMA6YshYE2K0dC3/+0CF2GyW/qN2ASq1alvdOoU9
X-Gm-Gg: AZFdTZds1Yuwj1gIii6Cx9VNjD748X31qWfumysZVBL9YEltjm/51+BgVHJt5XVwUf0
	8ljBGNt9v6xBvwSajMLu28dG1P6d+ssRlkux4TVuTQ0HB5c/PcjQl+xysd1M5nxfb+VXHvVFOEU
	8CI3LQsyeiR5CSVGZw/dfWnlHjH5TW94VJ94xfzNlImrUunfn0wgvLBiZSJrrA2bcjI4E5x7kNa
	Zmn6ZFmm15c4hrHGL70wMbD/CMUO6G+fpTkCFktpf7GLn7kWxqlnPel5LA2P33sZdgWb3rB/+HS
	rAniJAx3Hq+bAw+pkLskPorCh2jX3SGK4hrd/7vpfgL+n9nGnUmYnyAt06CAz498aqqQ8g3Pg56
	6GZ5tlVyfPIRI6/83PllJMUiubZ/nWNSzZbXiDRcEwH8Ed24hspbLp+GkbmWPkxC4a+5s/1+zTt
	Lhj/17NtShqkMlRRARbT8fqmXbpxo+tO7G9Aca43ytVyKR/IZjVseO2V7jU7AVHbxAZQL8SCBor
	pj7Nj0S9a81cJBYHgjYuXngS1wDq4FCEmNcQijwymVSIPQ1LOXwZfaFR44fGCz4bkC58s3Jv8gl
	ROXI5Q8+IVFxg5Ov/1upW14HZaWci9k5IVtrQkaSsQ==
X-Received: by 2002:a17:90b:554d:b0:3ad:d29c:5e64 with SMTP id 98e67ed59e1d1-3b41c9b361fmr22966937a91.65.1795770513277;
        Fri, 27 Nov 2026 01:08:33 -0800 (PST)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d06ee37sm11718725a12.28.2026.11.27.01.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:08:32 -0800 (PST)
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
Subject: [PATCH v10 4/8] crash_core: replace for_each_mem_range() with for_each_mem_region()
Date: Fri, 27 Nov 2026 17:07:19 +0800
Message-ID: <20261127090723.741253-5-chenwandun1@gmail.com>
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

for_each_mem_range() skips MEMBLOCK_NOMAP regions implicitly. Switch the
weak defaults to for_each_mem_region(), which exposes struct
memblock_region and per-region flags, and filter NOMAP regions explicitly
via the new crash_should_skip_region() helper. This prepares for a
subsequent patch to extend the skip filter.

No functional change.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Baoquan He <baoquan.he@linux.dev>
---
 kernel/crash_core.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 8a861a946e26..e161c8b65e00 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -283,25 +283,34 @@ static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
 }
 
 #ifdef CONFIG_ARCH_KEEP_MEMBLOCK
+/* Exclude NOMAP regions from the vmcore. */
+static bool crash_should_skip_region(struct memblock_region *reg)
+{
+	return memblock_is_nomap(reg);
+}
+
 unsigned int __weak arch_get_system_nr_ranges(void)
 {
 	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* crashk_res + crashk_low_res, +CMA splits */
-	phys_addr_t start, end;
-	u64 i;
+	struct memblock_region *reg;
 
-	for_each_mem_range(i, &start, &end)
+	for_each_mem_region(reg) {
+		if (crash_should_skip_region(reg))
+			continue;
 		nr_ranges++;
+	}
 	return nr_ranges;
 }
 
 int __weak arch_crash_populate_cmem(struct crash_mem *cmem)
 {
-	phys_addr_t start, end;
-	u64 i;
+	struct memblock_region *reg;
 
-	for_each_mem_range(i, &start, &end) {
-		cmem->ranges[cmem->nr_ranges].start = start;
-		cmem->ranges[cmem->nr_ranges].end = end - 1;
+	for_each_mem_region(reg) {
+		if (crash_should_skip_region(reg))
+			continue;
+		cmem->ranges[cmem->nr_ranges].start = reg->base;
+		cmem->ranges[cmem->nr_ranges].end = reg->base + reg->size - 1;
 		cmem->nr_ranges++;
 	}
 	return 0;
-- 
2.43.0

