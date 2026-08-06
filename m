Received: from mail-pz2-f0.google.com (mail-pz2-f0.google.com [74.125.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF81442100
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786009022; cv=none; b=kz1p/b+r/YjKC7i/afbhACP+PWIwLYMdbiCIeUR3Tryj39IT8/FcyjVPlVndL6AGQ/HsIK8Y99U8pCuUaVh6n+t93tSabjsxiRaSPW8/m12EZiycxhk8XxmzMQCIxq+09z1iXOa9UqyNnbvIZmkmyOPV+GHawDCn2bAQvwD/AzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786009022; c=relaxed/simple;
	bh=asV5+uk1HNpC2yg4Ca+u8e82+cUPHo9klzhytwWRRZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ecZTnB7H9q7d/2J1z5iL+8TwogONS4Feyiqt3T3a98r85jQZEz+8CLA8EBrky08Jukqpt2rKYAycoGu/FhBvj8hP4GxpC7ZKW1YrGwYU8Swi6TiG4Oq8pW7bEvel/RlHYoKwK6V4DqBG4VVtdsJvVT3CDKWr4WNEZaDXxTBxg1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WnIiChSj; arc=none smtp.client-ip=74.125.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WnIiChSj"
Received: by mail-pz2-f0.google.com with SMTP id 41be03b00d2f7-ca7fcfe1669so1143354a12.0
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 02:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786009018; x=1786613818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qD4VW4BZeNXzCi3gbNaQKdLxxRurNtLyN+adWk+/0t8=;
        b=WnIiChSj8iXfepfYAJuXWk5QcADY72HxFMYsYBxSF2nWZvkQohi01jOPJMet7MJsb6
         z4EoNC9Qj/MRRDoTFZ+M96v7thtvY4Te23p5PjyRNJ25CFTY/ecZYa0M7qTOdAWzXpw4
         AMjeY1nOxcqgiJh5sRsS+HiGJiBsbkgTVAjm+wYELL/ouzs054en59m0GBBhAPWqbN5m
         mGDk6jLGMO6PzBqLvOfEkRnyCQakQXX2tWv/WSPO157+6PPDlJvnbGwxLmo28if0OgyX
         lwsqfEDNhkh0mkikfRLGc00u5/lF17pzQjOXhTGvD3o8r7YKH96+aJV4n817w7ykneYi
         WgnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786009018; x=1786613818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qD4VW4BZeNXzCi3gbNaQKdLxxRurNtLyN+adWk+/0t8=;
        b=Cv1BMxf9Vy3qMZYoGUjmY3hmOXSUQN0w8J6OKXi2tTYTPI7FWnX6o7/XfiNT4jcebS
         DDHty2WeB3OCAGOLLB5LsMpQIO9ovjL1QSDRTCf4st5wem+nP3Qwj/y6/S69EBiW8U/J
         GnWaWqTzYTkEtXcIs3UbuFByxvw/ZIu0RrOkmIcSKw+rDNVgX3N55ZbWtm+30ApH0SaL
         V0irjwM/MWEzC7++j84IroG4TUJG7bIqyCkbrkHQbJp5LZeItuzdG/4CpEXOaQV0PNO8
         DdqfzOCsTQt5WHZfHgPH65Q+J+Z+Y9nzXiQ+Ut52+dCtMUnp42Ci/t64MJ5ke9kPceqc
         +pEw==
X-Forwarded-Encrypted: i=1; AHgh+RpupbwUNMZ8F20s1BvcobJXTR/D5BbvwrGEQAb1IjduBVeo+1Au4JUkHJyoDl9qI3fi7Cv6GEmhKFP0@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6E+YEslVIOigsDYdcLxA2Vup2raV1bBKDQoX4WooszDFBGrbO
	Y8mMA1IgW7cR7JG8xosGx9jOWWHQiD8CK+/yYEQw8kBvZuT5mb72hcYo
X-Gm-Gg: AR+sD10O6kOTSdZg6ZTaFd1kt+1gZ0n0ofgA2YUiLVbVkBqELoZMXCmqtXajgCaXP7l
	TnD+nwy7RrAQ6dnpDW4YsS0PYyeR5xMJbJIll0xWVAXZJwUrrVu/GCAom5Cn/e0qVmHKKQqXS/P
	WyZpk71qgns2zI9nH/GZ0yWOvs0XgDhpCscpoz1m/KR25JCz7z/r1AknKEmI7YGkxpKUlGZkh5Z
	zumeQyk2j5B+iSx7wPv9G0Ssfg1BpQUa6u3JooMps3cipg9FpDqh6XLBkeT3wBTCm8sHy/7K/2D
	zfHNe2BcxVSdTC9J3CRLOrdAPYRmqSfILVPHueeEBVzwyC9Z9B9hoOOZDxWi5NFAUu5/WAioScg
	LXqLtttG7Q78UyZwg26AoHTxlvYemTYRSE3rqZtdzYIzWmquPETGBjdVAHfKz3N4xB1zBNIhDHA
	OcYyPxOvdosqJvc9DLyQXu8F+1Gsx0jJw5diIeWc229kwX0LI66i5geps0lyfPSjsCtP1Ft6bnG
	Q==
X-Received: by 2002:a05:6a00:2d81:b0:848:6c9c:4074 with SMTP id d2e1a72fcca58-84f2dff6cd5mr14050456b3a.1.1786009018224;
        Thu, 06 Aug 2026 02:36:58 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f453b0aeasm1043878b3a.13.2026.08.06.02.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:36:57 -0700 (PDT)
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
Subject: [PATCH v5 7/8] crash_core: replace for_each_mem_range() with for_each_mem_region()
Date: Thu,  6 Aug 2026 17:35:18 +0800
Message-ID: <20260806093519.2907771-8-chenwandun1@gmail.com>
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

for_each_mem_range() skips MEMBLOCK_NOMAP regions implicitly. Switch the
weak defaults to for_each_mem_region(), which exposes struct
memblock_region and per-region flags, and filter NOMAP regions explicitly
via the new crash_should_skip_region() helper. This prepares for a
subsequent patch to extend the skip filter.

No functional change.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
 kernel/crash_core.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 77285ae3ce60..fb78b7814f18 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -269,6 +269,12 @@ int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
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
@@ -284,22 +290,25 @@ static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
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

