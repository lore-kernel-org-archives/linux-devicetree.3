Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F9552F296
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 08:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066642; cv=none; b=J3qw/kMPXlN31J4TYLSGzlBaAUkz6kXfq0J32hPqooibZvwH/A0NfmFydco765nrbzga72bj1TF3+3lpNduxuaJdTkgzrmk+KjcnQ+X74RmYu7TwVZ/2Nt8VdhtN5ilBsJd2nfIeJB6mF9vlQtls7o5meKZDScJ6u1Ictq4gn08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066642; c=relaxed/simple;
	bh=aVUsHlz/xoft1y6LdoTP6jj2hctS3djOcN1LZjUnlTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FsUopwedc6RJc7rvwatozsTOdskQMdaM1BCUxidC16eSjrdYwRp6w3Y2a9FnUG0xAFLjoX3X0DKSEYz/a9hRjRAutGWx7ax+UNl0/5C3MnXqI+8PRJzVK3B+3qg+3KDL+oryjFmc8CHLewBWO2a3QDe6EidnmB3BKzkQ4+VBu/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r1l8B1DX; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r1l8B1DX"
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-39e249c766bso1632792a91.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 01:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066639; x=1790671439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BQZ6M9cJvbnCelbC8h/SiM2wDn1buqTcsR+O1dmHqTM=;
        b=r1l8B1DX/syzoT9vEayTJVBT50LN652uwCGXWaJXQYuYDReCIaGt3OGFY1DLiebyDh
         NX3qq9+F0PQp5cCnm+fNtQQ/7tt2EDBrvCdASm1ib2bcDR8oceV/lFjQwcyJXI7PFrB5
         Hoz2acOUYxwV8Pip0JizRCSKTMvcoMWrnNyi57rzLk5dwAbw52ngIl7JwBasb0QxkkZV
         n98bHdYceG6Ah116Ov9BrnDd82MzkY9EOzdtNeeqTt3duEo8klSUKBDRsC2TCiHAFzSd
         TSoGiB5upkeHDnsNIKNh2HkQkfoyi+3QbYPUh158j1Nres9usNBi/XrUWfSXpaM/ADMS
         XgJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066639; x=1790671439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BQZ6M9cJvbnCelbC8h/SiM2wDn1buqTcsR+O1dmHqTM=;
        b=Ge+aGhCTtyumtz0yzhli0LeG4uTChFxblY/xVtjEwuYg4znjmTMJYmNYiel1Wx7bwX
         ucVu5NlEn34UH3GyiAUkY2wvxvrd9Tt9M/3TWH7eM+haAwssNP4zGrxj+LshnmMZxD2M
         I8pbv5QBLaXmrqF5nhkv9emiZpKT268od0t1j4IfAezebCVMzE6j9qvGiBG5hvr+cSOB
         PuPVWvD3Qf4zGEaBfq8Z4wFgeRme8P0ocBH83HiTZOLrEEa9nPB348UJ86LdPLF8Wedg
         TdvKXT0qL5h4ob5tEEn0fE1gA9hUVNw5nMy1J5JWtScIUxjC1tk2U1aFYJqTgMv+IBIj
         ypjA==
X-Forwarded-Encrypted: i=1; AKwUvBw4Uxh60/Lm4OrYdz/nlsACcONK3CsFq/NsXR0tdhpuXQcJF1b2p4C8ZGgHGoaZmil70x6KPMeMvDk5@vger.kernel.org
X-Gm-Message-State: AFuF++k+vJO3V2MLrvQIl6slu24uxwhINWrjy+eZgACrJhEU+BQAx0mU
	23XxilrrSOKwVx6rGAIfKJBJsF01JSsMIXK8cK4tIzKM7XqzrQ9jCtYa
X-Gm-Gg: AYBFou0+89lwW9k6Nh/FoT9cPAZ5QnpnNsYb8TZIwB3U1BbyTioNnZ4/Go0a3SgyLm3
	nHgZwAyjmwI6mMw1nQfays0Ceirg+vZvN4EEvNZ/GdrE5scRwvPKpL9Z8yrDwU1ZVX88VlpSMVo
	Gv4AY42F/8OWwpDEDfnZSpiwkx2vx0oFbKk+fV+cfrhAx2hTAbe5R1JsH40g4gWFtWCJSntyNH/
	X38jLbCsoM9o8jxh23B5exA95UCtFdzkAhG6YWPbwi3liufM4n4jrj2T/BoPPiO6Tp2zGLWVKrP
	C5kDNdFPOdzoTnx2ITQJzkAf6Qp6nvuodjtr2NK1bWXXgRXfv8q5MsK8XK9O0izHWkY0Zkrnur/
	NLXcMoX1ZXAHU1Y/BZaVhnpXjOPbY6MM8TfsYA8Y3c4VWjUiUBy823arnisVow1oQEPCNQUC7bb
	JGY4z6SEr0Ppy/gcipb9RdRLLx0JvHDGV5fbCE/l5r13iryz+r1/mr8VklyVkaLBq4jgba2buPy
	tJDP3LLwOI=
X-Received: by 2002:a17:90b:35c5:b0:39e:6a80:dd9b with SMTP id 98e67ed59e1d1-3a0731f9793mr476673a91.34.1790066638632;
        Tue, 22 Sep 2026 01:43:58 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0674a5ae4sm3670016a91.12.2026.09.22.01.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:43:58 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
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
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v7 4/9] crash_core: replace for_each_mem_range() with for_each_mem_region()
Date: Tue, 22 Sep 2026 16:42:51 +0800
Message-ID: <20260922084256.1515554-5-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922084256.1515554-1-chenwandun1@gmail.com>
References: <20260922084256.1515554-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
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
index d0cc2496dc09..c7acb2e449df 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -270,6 +270,12 @@ int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
 	return 0;
 }
 
+/* Exclude NOMAP regions from the vmcore. */
+static bool crash_should_skip_region(struct memblock_region *reg)
+{
+	return memblock_is_nomap(reg);
+}
+
 static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
 {
 	struct crash_mem *cmem;
@@ -285,22 +291,25 @@ static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
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

