Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE37D3BF665
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779268825; cv=none; b=E231nzyh7srxgJQNF9nj3UHnqeO3bwmbZIADGYX5n6eQmnBv6O5Wxcx7WFA0JG35FSVNzX7JlJSnMpNMnBuQ9CGVxvodFccB1hM+kSCpGVfFqOh1/qwywPynLnu/9xq5Y5lfbyGwVYHV0rg6Dlq5luJSU+ByrhPuShQW3vhykOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779268825; c=relaxed/simple;
	bh=vEY3z8jVj8nmsWJisxSq9AhqFt0JmI3xyGszSp/YCcc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pzYOGJTA1v1Jvrw/gz00OVfD00DeQR7o/FPL+IZJH3NkNPKCkb3SuQnIFxbE9yksHQ1ODOEUYb6s2qbmdbJuRXRVTqF978sSenUoo7lQU7Wz2SC6DOSoetWDXjpOtr67BRixVE/4HhQlOhrITe0lcpce/bHQLwu5fPvOrb25Lj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gB86MgRU; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gB86MgRU"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-839dc688d6cso1998752b3a.2
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 02:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779268823; x=1779873623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yF4iEePz0efKjWWczqPvkzIUeB6xqHtDsvairyfmeUg=;
        b=gB86MgRUGZDnJk5mL1j8e1EvDh2G7QiYct5oeQwXPkWlhqmFblW6yKjupFJG3hFE88
         O2TAG4ETkRimdV/Oho3g5FUO/GU6G2aElrjpFtMUg5xttUQYcnBBIlzU1ejSc3BAXz7C
         I69sAtHxhh/OfM2fTg2yVorsa604UTMd3u4w0hKv8TgfapLrGZIq8fwfE6we5/9joU2A
         6oJPKJfZtIO4+HWkgHCZXfjP00MimFBtFbPaIRi5VvWMrb0jHWFgMDwuAxZ4AakmPTKd
         jX0B+CM6zUnubAPE3tnMngPPowpYswYV9V6Xs+fZ3eaHF6rKTtXKo2mhLuDQhbs372gw
         9dng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779268823; x=1779873623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yF4iEePz0efKjWWczqPvkzIUeB6xqHtDsvairyfmeUg=;
        b=pNCrB8/f6kmeQc88jXDfyY2rDbRvLrbw2clbKMUgo7Ao3grFfXIayuWxTSZd3aNveK
         Yd3IcFiL2Z0raqtVDNG9OIS2AREkRE0mjOkc4MglKOahkSz2xZ7wu9NfVuQ6n+k5mD6o
         ARi6fZGWM6UVyx/wLK+V/orBzgmX68FDEn/lyrzbj8S1SWy1zgBWJ7ZVy3Qd3kgGG9GD
         1VDXVmndaOdqpR3ktY+7cOVj4zVRC/UxbdsB+lMjakmHcj4ISIKfVlKs07C2T5y+d7LE
         AfEgC9RQxzd062Mv9nYm14Tq+sVdSCgNYHBR0KX4Y2lbgc1xjdvGfoyu9d6nks4ZB500
         LCdA==
X-Forwarded-Encrypted: i=1; AFNElJ+ty/9Uu78PwYIjSU/lsNylA4mMdZrQD6f00fZiZQxll8oTy7YOaP5bLADST8U7wWohBt7gxMlLXFGz@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/wID7YKW7N4otjxE2DIWn9mWVEQmLKgeaneUYEITvaJCTRojP
	AIUTez8T4VWbBUsQ+1xZvARpYCm3EB2Ply/i0+xSKunruT/liMRiRsC5
X-Gm-Gg: Acq92OEMKUyCJbiC+H4adWP4zkTPNHjv2CUgAMClhyR/KfyLgRo1womuhHC48q7vrAm
	ph4scoQhsxT6xxq864yv1BGwxDmKm3uEi4o9AIs3L+iU94ZQ0IOQvfK9pEcQ0DknaWkfdM18YFh
	FnvOjB2m7jI1uuS113WYuEWx7IShuLsXceHqnAV9lO889QTbIFrhtnoK3MOVVf9RceYGg+DltQc
	sjVKGb86CXt2EVuQGDgfKsclOGbE88p9nIuKY1rjbR4bZ3W0bOg2Z9AJDsbvxdDihPTwYogwtpF
	gN43KYXtxTVEaSbwyZfoM5FUzKCzJ9000IyYH9lnXKOthJ2/oEq2ZVQckqAlMb18VwZgx4bYp9d
	zY8LptDJNKLBrr6Ar2On7QdGXmyF0knGaaM1OjKj2C4POi0m2XsSpsP0cmc+b5Rr92fOmC50REg
	145IJqNr5ttyVZATiS5gyC2oA0ASJpTy68Cepi1A==
X-Received: by 2002:a05:6a00:2e9f:b0:82f:6e7:152d with SMTP id d2e1a72fcca58-83f33c391cfmr24600140b3a.21.1779268822961;
        Wed, 20 May 2026 02:20:22 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f63bb986dsm10208967b3a.48.2026.05.20.02.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:20:22 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
X-Google-Original-From: Wandun Chen <chenwandun@lixiang.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	leitao@debian.org,
	kees@kernel.org,
	coxu@redhat.com,
	tangyouling@kylinos.cn,
	songshuaishuai@tinylab.org
Subject: [PATCH v2 8/8] loongarch: kdump: exclude non-dumpable reserved memory regions from vmcore
Date: Wed, 20 May 2026 17:18:44 +0800
Message-ID: <20260520091844.592753-9-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520091844.592753-1-chenwandun@lixiang.com>
References: <20260520091844.592753-1-chenwandun@lixiang.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun1@gmail.com>

From: Wandun Chen <chenwandun@lixiang.com>

Apply the same non-dumpable reserved memory filtering to LoongArch
kdump as was done for arm64. Use of_reserved_mem_kdump_exclude() to
drop flagged regions from the elfcorehdr PT_LOAD segments, and
of_reserved_mem_kdump_nr_ranges() to pre-size the crash_mem array.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 arch/loongarch/kernel/machine_kexec_file.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/kernel/machine_kexec_file.c
index 5584b798ba46..c5cead362d2d 100644
--- a/arch/loongarch/kernel/machine_kexec_file.c
+++ b/arch/loongarch/kernel/machine_kexec_file.c
@@ -14,6 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/kexec.h>
 #include <linux/memblock.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/types.h>
@@ -67,6 +68,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 	nr_ranges = 2; /* for exclusion of crashkernel region */
 	for_each_mem_range(i, &start, &end)
 		nr_ranges++;
+	nr_ranges += of_reserved_mem_kdump_nr_ranges();
 
 	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
 	if (!cmem)
@@ -91,6 +93,10 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 			goto out;
 	}
 
+	ret = of_reserved_mem_kdump_exclude(cmem);
+	if (ret < 0)
+		goto out;
+
 	ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
 
 out:
-- 
2.43.0

