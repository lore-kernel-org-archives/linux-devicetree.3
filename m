Received: from mail-pz2-f8.google.com (mail-pz2-f8.google.com [74.125.228.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1943845C1
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 06:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792131417; cv=none; b=ATGqcH3gE8qQhz3HZ0cTX5bB3yhBgOYf8O2woJBB2GRKz28wVPM5MYp8bJvKcXmu54ArtDGJbDqIllq89zsEata0B7jGwarJ3BJt3vjAs5Zz2Gw5T8CLrXlS48cRyxhW+X9etXhbHoDnU1qnYLMZH81h0fBlFqNvVJBlZt5F7P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792131417; c=relaxed/simple;
	bh=EtNWhbSSACfAtj7n0OC8kGNnI/X08sTb/SdHGhlyA3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lf1lfcasRLK3ZfTFsqjWrX+oeDI+JcleNhy9ISn4Zlz5Bar/i/Jxol3POfRx38QvaLUDQ2cjlj4pO0MNeleK6qqrVhEX2lDnHXfgLuhFKLtR7CnLE/aoxtyKZ4YzF+qzGl0bIFI8/CMerddnV40CA3+UpCf7e2C5NYBJD4aCxNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=drezNX/s; arc=none smtp.client-ip=74.125.228.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="drezNX/s"
Received: by mail-pz2-f8.google.com with SMTP id 41be03b00d2f7-cd3da0e82daso973661a12.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 23:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792131416; x=1792736216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s7Fb6KtcWAXnUfcecLaSQ1H6J8YKvEJFUWN8A6hcpOc=;
        b=drezNX/sspA84NsGjRYGPLQwxF0yBASB5AULaVi4deGZE8B6eFEgb3Az+hvyjL5BYw
         ErOKkKLvRXL9W+UOtLKPoX97IH2uTpyL1RSJtxsBBCwuH6k3P+i5Z6Q5wiJLWnWKytYP
         2r1QupFd4sCnAx90RcFB9Ccim0aW9wjFOo2LdrT4VF4lPgp0I7i/A4eO6IB7n1/D6DRn
         PKjwxlHgR1Kjj0RZzXVnZXjYv6U2ENqCIdYx3gz0xXszEDHWIg/2ts3Auo8TkkP2fd+B
         7+kMHgS+Es08QWBWjvniqIL7BLLa/kfWewXGl7AokbBX2TPnjX/Rjxx2G/qRNJ/cjo5k
         Nw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792131416; x=1792736216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s7Fb6KtcWAXnUfcecLaSQ1H6J8YKvEJFUWN8A6hcpOc=;
        b=W5wxU3dNRpr7H3X78kWBtAK2RRjj67qqAXm6vil8zo8PAeNDdz106C+PNYWIdLMySK
         UKK4lj1xf/Tarnpg/2PBtPTAt5yAyHwkM0FM3drqgUpd/2Dro8Xs9vt6u48HRVhKufvE
         R9DXajcLuNl9Ag+y7HNiG1LRTtij1z2Y4+uGcCGZiLuGwTdpTSfCpfl+EeS7Bb9WaI2M
         pBgQmjAR2i+F/GLSqa9SQ01yIVKuiS9nn1LWq26Qnujiu5rE15Kn+SV/E3DyCkx0VQxa
         wtBq0w/4O0mA5eOOnQYmV/diE87bIpPEqeUcu9FsmixrlNI0c0YxCNN7f7euEMwnAyvY
         Jv5w==
X-Forwarded-Encrypted: i=1; AKwUvBydafBOKcetnRsnZIUz/F4ChxFzqGe5B/mAjXimjJqoVmDjOhmGR3cMkO8Drv6n7Jg4TEyBLxGowP8W@vger.kernel.org
X-Gm-Message-State: AFq9FYI+RBBv5oCksNcWSk6WQP8KdOGSZV8EU0M/J1spzJseu7B2ZG6m
	fOO95hzx6PbvqokfTplspbn0ni59dUXLdsxH9N3tKPl92OcrNoYwzSVx
X-Gm-Gg: AYBFou24t8FnEKO+GwDPcSqeuSlOs286Y14olt34s/XJBIAI/opCiF0xq7kuSkiNzDE
	Ot+CdB0dubOL9eHQ3l/xD7SLNnmm2aM2VQvEIVa0oV6/q0alpIN0CPcwGeg1YoYodrZQA9q5/Ff
	z6c7sg0ZRAMACdTNJpc51yG7kFTjW35zitDbkhgBEZlF/OEj2IqB0JEaPKBNPgBBZgJumoTMroe
	zmbBlyTYVhisoFRTZX8ICtYyHSm1su1TExIdq2dmsF/bOkoctfY848fe8T5ZeSS8IL+qFtm3m+S
	IC1CxuiQChO9JjuOk7gBSQwC4xQ+g5ZUgRdg3OGftUbFbagDWkgzPOpJOtrVEuT4pYPB0xYFj9d
	8b6hvhQt66BOSHNzAP1iEWNoH/yzY3G01iMRY5/0QiMdettrV2DcsDFhxR2N2oAG/l2Mf0t/TvW
	J28EYfU/PiZDDig84/UrsC6yFjkidzcLc/GoAT/pM5Pwho5UrGke+FHyUSdnOeeSHp7Jy+TuHt/
	kqdCdo4ndU=
X-Received: by 2002:a05:6a00:b8d:b0:89d:ec58:ce47 with SMTP id d2e1a72fcca58-89dec58cf9dmr5849396b3a.55.1792131415787;
        Thu, 15 Oct 2026 23:16:55 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57b334e6sm586375b3a.42.2026.10.15.23.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:16:55 -0700 (PDT)
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
Subject: [RESEND PATCH v8 4/8] crash_core: replace for_each_mem_range() with for_each_mem_region()
Date: Fri, 16 Oct 2026 14:15:45 +0800
Message-ID: <20261016061549.4181390-5-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016061549.4181390-1-chenwandun1@gmail.com>
References: <20261016061549.4181390-1-chenwandun1@gmail.com>
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

