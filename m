Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341F9383C88
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 03:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779852687; cv=none; b=BMyifcYBz+aCiHD7jIvEy4SE3mmlCQrbWm8fqaFVheA7ocHcaSD7dHmYf5dW1Rjg2lCpU2y8i4vcKa7i0gTE4o2zIF7ERznajYfk1WDKE1/f0ZR47XYSgDg8f7JH3xwPque10SpzZvbqXSID9aT+C1Gkxf4XbP6G+7mUba4wen4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779852687; c=relaxed/simple;
	bh=vTTeU4c33nu817Ph5CKnJ38o2dSdPMYsQQMx+YVGt6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TJJFVIv6Qcu1Dja5o6Bd8wz1NaGxwBuIhiYvqNhzxVzyGfwpFWkfA78bKDjII2UjpXFVgt2YltGtHfTNaDQkeJceBZmtiK4GKqbl6xYNvwEw9nQ+M6e6L8VDZ/ZmreAPl2U/XZ1e1rLyuCkVNLAFl8Ba5okIKQfBkdvHOk2JDqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f7Xc5xU5; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f7Xc5xU5"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-82fa8d6425bso5126700b3a.0
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 20:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779852686; x=1780457486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k8s9mNy4kJhUtRbiL4bvIShEI3qrMLQ/X11k1pNjAUs=;
        b=f7Xc5xU5rMFQ37bNEujzMwek/db6/R0DLvZaM2+UXHn2QLiRKs3OnMb/cyEgU/0byx
         4F+euu9lrm52LsepLnP9zodwPs13KoNm6O/BJg73Nz0Ky4ZDx8oMXiA0ObNGIMetBPME
         +L5Y+VEMOgl3IjL5BcjkfWWld+yalyb1/7PFVyJJ5zNDU4Yaj/rwDoHDfTmIXyct+mxs
         ta6FApGZ6xY95xsh9ut3KBOvQQCESAXP6AV5xR4kR3S9QGgA0rzl+gtg/4MBsvKNqtXs
         EWXj1xILiQCbl/FR9+Y1dZrkOcJbOcmtMWkV7QXb44OSWUwYF2n/AeNvwOP0HQfgTApL
         cF5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779852686; x=1780457486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k8s9mNy4kJhUtRbiL4bvIShEI3qrMLQ/X11k1pNjAUs=;
        b=TR+MbEhX1TpCpmOOf76O2QxDujcyVgnpTxvNeeOU2zfouE0JQWwkLD4s9jxigsmFUO
         QK+jIIuJUyNrVCDhNUSLs/ZL9sOaFWEuE/1C/H2hYZJuvP3yOKcMYX36N5soUhLrNv7e
         GoyXYJKoJDdPF11PkOakiOHNMm+Yg1gxy19yM3XFCuI/NzvObwOc548RX3JRwNwiTOIE
         jeKjkP3NCJNvyz1ItkuOGG5bX8MxKEitsg85tU7uKM6nNYnNiWuU8Ua7Me11R0NCrxbM
         SvRlJ2xIPLyK3E/S8tWA/Upqc4YsP5wBbGA7IppGZPuYVPxRFxkAYfrkgF00vxywTXC+
         kKKw==
X-Forwarded-Encrypted: i=1; AFNElJ/xvgKgLlf7zU6MIH5XL8fd/HdgBecOr8v4ckxtKE1gg6yMUaIMBa31xUtoV0o+SamCYvAyfS3ykdXn@vger.kernel.org
X-Gm-Message-State: AOJu0YwtDsKa7J3j4DI+bS5wOibd6f9zPbFPiALz8/AyGb87Av3XMk5t
	FE2XX+9T0EmHQjyz+ydlauVuOwcn9Nhesgai+zITEQEWegeHBjpUjkTp
X-Gm-Gg: Acq92OHhstXQunJe3SviYRkUuW/KhnzIAkjp6seovrW2NPQiAas51DgWcxkG1bB2ZZ0
	Q/8N4JYsk5YHPHiaIRhkKInLLq75z5mf8bVKsZhkviPTFyqFQRB8PWz6KoeJ6t2RSZw65HmFTOL
	YOfFXSioaxYY2UhJwAW8yXDgp4DXfxCHXa8eOnbNb5uaD8CboMYbMqB/cdWwFYRH2qMglEl5fel
	TidIP/wQfSyLS9x5DQqndOajkwiqCINnsA6m6w2BlNv9Vin10S/BJvdzOqzijwMRx7cghj/F8Aq
	3Pf4e1vL+S1fdj8dwYT205KIKooT7wc8UFxOGwKqGDXNDb82SgzC1ob75dMD2jRJXt91yaBypVk
	HYEd2LUsKO70WIFu6mQPg5Okxwzgc2Bwn4zelhRdb/tI7C0wKnYOF7bPv/03DCf8+7ledZBsCK7
	12wK1+Q/7Y0v9iIMHb/npdgxJRTk6BYhlA4W8S
X-Received: by 2002:a05:6a00:8c6:b0:83e:d957:e5b6 with SMTP id d2e1a72fcca58-8415f544641mr20524215b3a.36.1779852685640;
        Tue, 26 May 2026 20:31:25 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d7307596sm749688b3a.59.2026.05.26.20.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 20:31:25 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
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
	quic_obabatun@quicinc.com
Subject: [PATCH v3 10/11] riscv: kdump: exclude non-dumpable reserved memory regions from vmcore
Date: Wed, 27 May 2026 11:29:16 +0800
Message-ID: <20260527032917.3385849-11-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527032917.3385849-1-chenwandun1@gmail.com>
References: <20260527032917.3385849-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

Apply the same non-dumpable reserved memory filtering to RISC-V kdump
as was done for arm64. Use of_reserved_mem_kdump_exclude() to drop
flagged regions from the elfcorehdr PT_LOAD segments, and
of_reserved_mem_kdump_nr_ranges() to pre-size the crash_mem array.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 arch/riscv/kernel/machine_kexec_file.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index 54e2d9552e93..c359cf714c79 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -10,6 +10,7 @@
 #include <linux/elf.h>
 #include <linux/slab.h>
 #include <linux/of.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/libfdt.h>
 #include <linux/types.h>
 #include <linux/memblock.h>
@@ -63,6 +64,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 
 	nr_ranges = 1; /* For exclusion of crashkernel region */
 	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
+	nr_ranges += of_reserved_mem_kdump_nr_ranges();
 
 	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
 	if (!cmem)
@@ -76,6 +78,8 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 
 	/* Exclude crashkernel region */
 	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
+	if (!ret)
+		ret = of_reserved_mem_kdump_exclude(cmem);
 	if (!ret)
 		ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
 
-- 
2.43.0

